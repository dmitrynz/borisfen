// Generated by CoffeeScript 1.8.0
(function() {
  $(document).ready(function() {
    var MCForm, mainContactForm;
    MCForm = (function() {
      MCForm.prototype.form = '';

      MCForm.prototype.url = '';

      MCForm.prototype.fields = [];

      function MCForm(form) {
        this.form = form;
        this.url = $(this.form).attr('action');
        this.fields.push([
          {
            name: 'textarea[name=enquiry]',
            target: 'text',
            message: LANGS['information_contact']['error_enquiry']
          }
        ]);
        this.fields.push([
          {
            name: 'input[name=email]',
            target: 'val',
            message: LANGS['information_contact']['error_email']
          }
        ]);
        this.fields.push([
          {
            name: 'input[name=name]',
            target: 'val',
            message: LANGS['information_contact']['error_name']
          }
        ]);
        $(this.form).submit((function(_this) {
          return function(e) {
            if (_this.validate()) {
              _this.submit();
            }
            return e.preventDefault();
          };
        })(this));
      }

      MCForm.prototype.validate = function() {
        var field, field_value, valid, _i, _len, _ref;
        valid = true;
        _ref = this.fields;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          field = _ref[_i];
          field = field[0];
          switch (field.target) {
            case 'val':
              field_value = $(this.form).find(field.name).val();
              break;
            case 'text':
              field_value = $(this.form).find(field.name).val();
              break;
            default:
              field_value = '';
          }
          if (!field_value) {
            valid = false;
            console.info(field.message);
            this.logError(field.message);
          }
        }
        return valid;
      };

      MCForm.prototype.submit = function() {
        var form_data, logError, uri;
        form_data = $(this.form).serializeObject();
        logError = this.logError;
        uri = this.url;
        return $.ajax({
          url: uri,
          type: 'post',
          dataType: 'json',
          data: form_data,
          success: function(response) {
            var error, _i, _len, _ref, _results;
            if (response.ok != null) {
              return alert(response.ok);
            } else {
              console.log(response);
              if (response.errors) {
                console.log('ololo');
                _ref = response.errors;
                _results = [];
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                  error = _ref[_i];
                  console.dir(this.logError);
                  console.info(error);
                  _results.push(logError(error));
                }
                return _results;
              }
            }
          },
          error: function(e1, e2) {
            console.error(e1);
            return console.error(e2);
          }
        });
      };

      MCForm.prototype.logError = function(text) {
        var errors_view;
        errors_view = {
          text: text,
          styling: 'bootstrap3',
          addclass: 'float-errors',
          type: 'error',
          icon: 'picon picon-32 picon-fill-color',
          opacity: .8,
          nonblock: {
            nonblock: true
          }
        };
        return new PNotify(errors_view);
      };

      return MCForm;

    })();
    return mainContactForm = new MCForm('#main-contact-form');
  });

}).call(this);

//# sourceMappingURL=contactPage.js.map