var CrewListing = React.createClass({
  render: function() {
    function capitalize(s) {
      return s[0].toUpperCase() + s.slice(1);
    }
    if (this.props.lunch2 !== null) {
      lunch2 = (
        <div class="row">
          <div class="col-md-3 col-md-offset-3">
            <h3>{ capitalize(this.props.lunch0.color) Lunch Crew}</h3>
            <p><strong>Crew Head: </strong> (this.props.lunch0.crew_head)</p>
            <p>
              {this.props.lunch0.students.filter(function(s) { return s != this.props.lunch0.crew_head; }).map(function(s) { return s + "<br >"}).join(" ")}
            </p>
          </div>
        </div>
      )
    }
    else {
      lunch2 = null
    }
    return (
      <div class="row">
        <div class="col-md-3 col-md-offset-3">
          <h3>Recess Cleanup</h3>
          {this.props.recess.students.map(function(s) { 
            return s + "<br >";
          }).join(" ")}
        </div>
        <div class="col-md-3">
          <h3>Lunch Setup</h3>
          {this.props.setup.students.map(function(s) {
            return s + "<br >";
          }).join(" ")}
        </div>
      </div>
      <div class="row">
        <div class="col-md-3 col-md-offset-3">
          <h3>{ capitalize(this.props.lunch0.color) Lunch Crew}</h3>
          <p><strong>Crew Head: </strong> {this.props.lunch0.crew_head}</p>
          <p>
            {this.props.lunch0.students.filter(function(s) { return s != this.props.lunch0.crew_head; }).map(function(s) { return s + "<br >"}).join(" ")}
          </p>
        </div>
        <div class="col-md-3">
          <h3>{ capitalize(this.props.lunch1.color) Lunch Crew}</h3>
          <p><strong>Crew Head: </strong> {this.props.lunch1.crew_head}</p>
          <p>
            {this.props.lunch1.students.filter(function(s) { return s != this.props.lunch1.crew_head; }).map(function(s) { return s + "<br >"}).join(" ")}
          </p>
        </div>
      </div>
      {lunch2}
    )
  }
  
});
