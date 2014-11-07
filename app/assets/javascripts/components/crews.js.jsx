//var Row = require('react-bootstrap/Row');
//var Column = require('react-bootstrap/Column');

var Days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
var Colors = ["Orange", "Purple", "Green", "Rainbow"]

function capitalize(s) {
  return s[0].toUpperCase() + s.slice(1);
}

function uncapitalize(s) {
  return s[0].toLowerCase() + s.slice(1);
}

var Select = React.createClass({
  change: function(e) {
    this.props.whenUpdated(this.refs.select.getDOMNode().value);
  },
  render: function() {
    return (
      <select className="form-control" defaultValue={uncapitalize(this.props.selected)} onChange={this.change} ref="select">
        {this.props.array.map(function(item) {
          return (
            <option value={uncapitalize(item)}>{item}</option>
          )
        })}
      </select>
    )
  }
})

var CrewList = React.createClass({
  render: function() {
    var crew_head = this.props.crew_head;
    var studentList = this.props.students.filter(function(s) { return s != crew_head; }).map(function(s) {
      return (
        <span> 
          {s} <br />
        </span>
      );
    });
    return (
      <p>
        {studentList}
      </p>
    );
  }
});

var LunchCrewDisplay = React.createClass({
  render: function() {
    return (
      <div>
        <h3>{capitalize(this.props.crew.color)} Lunch Crew</h3>
        <p><strong>Crew Head: </strong> {this.props.crew.crew_head} </p>
        <CrewList students={this.props.crew.students} crew_head={this.props.crew.crew_head} />
      </div>
    );
  }
})

var CrewsTable = React.createClass({
  render: function() {
    var lunch2;
    if (this.props.crews.lunch2 != null) {
      lunch2 = ( 
                <div className="row">
                  <div className="col-md-3 col-md-offset-3">
                    <LunchCrewDisplay crew={this.props.crews.lunch2} />
                  </div>
                </div>
               );
    }
    else {
      lunch2 = null;
    }
    return (
      <div>
        <div className="row">
          <div className="col-md-3 col-md-offset-3">
            <h3>Recess Cleanup</h3>
            <CrewList students={this.props.crews.recess.students} crew_head="" />
          </div>
          <div className="col-md-3">
            <h3>Lunch Setup</h3>
            <CrewList students={this.props.crews.setup.students} crew_head="" />
          </div>
        </div>
        <div className="row">
          <div className="col-md-3 col-md-offset-3">
            <LunchCrewDisplay crew={this.props.crews.lunch0} />
          </div>
          <div className="col-md-3">
            <LunchCrewDisplay crew={this.props.crews.lunch1} />
          </div>
        </div>
        {lunch2}
      </div>
    );
  }
});

var CrewSelect = React.createClass({
  dayChange: function(day) {
    this.props.update(day, this.props.color);
  },
  colorChange: function(color) {
    this.props.update(this.props.day, color);
  },
  render: function() {
    return (
      <div className="row">
        <form className="form" role="form">
          <div className="form-group col-md-3 col-md-offset-3">
            <label htmlFor="day-select">Day of Week: </label>
            <Select array={Days} id="day-select" selected={this.props.day} whenUpdated={this.dayChange} />
          </div>
          <div className="form-group col-md-3">
            <label htmlFor="color-select">Color: </label>
            <Select array={Colors} id="color-select" selected={this.props.color} whenUpdated={this.colorChange} />
          </div>
        </form>
      </div>
    )
  }
});

var CrewsDisplay = React.createClass({
  getInitialState: function() {
    if (Days.map(uncapitalize).indexOf(this.props.day) > 0) { //if this.props.day is a weekday
      return { 
        crews: $.ajax({
          url: ["http://" + location.hostname + ":" + location.port, "crews", this.props.day, this.props.color].join("/"),
          dataType: 'json',
          async: false
        }).responseJSON.crews,
        week: { color: this.props.color },
        day: this.props.day,
        weekend: false
      };
    }
    else {
      return { day: "monday", color: this.props.color, weekend: true };
    }
  },
  loadNewCrewsByDayColor: function(day, color) {
    $.ajax({
      url: ["http://" + location.hostname + ":" + location.port, "crews", day, color].join("/"),
      dataType: 'json',
      success: function(data) {
        this.setState(data)
        this.setState({ week: { color: color }, day: day, weekend: false });
      }.bind(this)
    });
  },
  render: function() {
    var crews_table;
    if (this.state.weekend) {
      crews_table = <h2>Weekend! No Jobs Today! You can select another day above</h2>;
    }
    else {
      crews_table = <CrewsTable crews={this.state.crews} />;
    }
    return (
      <div>
        <CrewSelect update={this.loadNewCrewsByDayColor} day={this.state.day} color={this.state.week.color} />
        {crews_table}
      </div>
    );
  }
});
