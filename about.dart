import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular/security.dart';

@Component(
  selector: 'about-component',
  directives: [
    MaterialToggleComponent,
    coreDirectives,
  ],
  templateUrl: 'index.html',
  styleUrls: ['script.css'],
)

    class AboutComponent {
  final DomSanitizationService sanitizer;
  SafeHtml fun_about, boring_about;

  AboutComponent(this.sanitizer) {
    fun_about = this.sanitizer.bypassSecurityTrustHtml('''
    <p>
        text hello 
    </p>

    ''');

    boring_about = this.sanitizer.bypassSecurityTrustHtml('''
    <p> text bye 
    <p>
       
    ''');
  }

  bool fun = false;
  SafeHtml get aboutText => fun ? fun_about : boring_about;
}
