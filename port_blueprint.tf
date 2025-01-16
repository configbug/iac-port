resource "port_blueprint" "division" {
  identifier = "division"
  title      = "Division"
  icon       = "Division"

  properties = {
    name = {
      type     = "string"
      title    = "Name"
      required = true
    }
    alias = {
      type  = "string"
      title = "Alias"
    }
    name_leader = {
      type  = "string"
      title = "Name Leader"
    }
    description = {
      type  = "string"
      title = "Description"
    }
    creation_date = {
      type  = "date"
      title = "Creation Date"
    }
    status = {
      type  = "enum"
      title = "Status"
      enum  = ["Active", "Inactive"]
    }
  }
}


resource "port_blueprint" "coe_tribe" {
  identifier = "coe_tribe"
  title      = "COE/Tribe"
  icon       = "Tribe"

  properties = {
    type = {
      type     = "enum"
      title    = "Type"
      enum     = ["COE", "Tribe"]
      required = true
    }
    name = {
      type     = "string"
      title    = "Name"
      required = true
    }
    alias = {
      type  = "string"
      title = "Alias"
    }
    description = {
      type  = "string"
      title = "Description"
    }
    name_leader = {
      type  = "string"
      title = "Name Leader"
    }
    creation_date = {
      type  = "date"
      title = "Creation Date"
    }
    status = {
      type  = "enum"
      title = "Status"
      enum  = ["Active", "Inactive"]
    }
  }

  relations = {
    belongs_to_division = {
      title    = "Belongs to Division"
      target   = port_blueprint.division.identifier
      required = true
    }
  }
}


resource "port_blueprint" "squad" {
  identifier = "squad"
  title      = "Squad"
  icon       = "Squad"

  properties = {
    name = {
      type     = "string"
      title    = "Name"
      required = true
    }
    alias = {
      type  = "string"
      title = "Alias"
    }
    description = {
      type  = "string"
      title = "Description"
    }
    name_leader = {
      type  = "string"
      title = "Name Leader"
    }
    creation_date = {
      type  = "date"
      title = "Creation Date"
    }
    status = {
      type  = "enum"
      title = "Status"
      enum  = ["Active", "Inactive"]
    }
  }

  relations = {
    belongs_to_coe_tribe = {
      title    = "Belongs to COE/Tribe"
      target   = port_blueprint.coe_tribe.identifier
      required = true
    }
  }
}


resource "port_blueprint" "specialty" {
  identifier = "specialty"
  title      = "Specialty"
  icon       = "Specialty"

  properties = {
    name = {
      type     = "string"
      title    = "Name"
      required = true
    }
    description = {
      type  = "string"
      title = "Description"
    }
    creation_date = {
      type  = "date"
      title = "Creation Date"
    }
    status = {
      type  = "enum"
      title = "Status"
      enum  = ["Active", "Inactive"]
    }
  }
}


resource "port_blueprint" "role" {
  identifier = "role"
  title      = "Role"
  icon       = "Role"

  properties = {
    identifier = {
      type     = "string"
      title    = "Identifier"
      required = true
      unique   = true
    }
    name = {
      type     = "string"
      title    = "Name"
      required = true
    }
    description = {
      type  = "string"
      title = "Description"
    }
    creation_date = {
      type  = "date"
      title = "Creation Date"
    }
    status = {
      type  = "enum"
      title = "Status"
      enum  = ["Active", "Inactive"]
    }
  }
}


resource "port_blueprint" "engineers" {
  identifier = "engineers"
  title      = "Engineers"
  icon       = "Engineer"

  properties = {
    enrollment = {
      type     = "string"
      title    = "Enrollment"
      required = true
    }
    email = {
      type   = "string"
      title  = "Email"
      format = "email"
    }
    full_name = {
      type     = "string"
      title    = "Full Name"
      required = true
    }
    type = {
      type  = "enum"
      title = "Type"
      enum  = ["Full-time", "Part-time", "Contractor"]
    }
    creation_date = {
      type  = "date"
      title = "Creation Date"
    }
    status = {
      type  = "enum"
      title = "Status"
      enum  = ["Active", "Inactive"]
    }
  }

  relations = {
    belongs_to_role = {
      title  = "Belongs to Role"
      target = port_blueprint.role.identifier
    }
    belongs_to_specialty = {
      title  = "Belongs to Specialty"
      target = port_blueprint.specialty.identifier
    }
    belongs_to_squad = {
      title  = "Belongs to Squad"
      target = port_blueprint.squad.identifier
    }
  }
}
