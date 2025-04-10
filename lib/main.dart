import 'package:flutter/material.dart';

void main() {
  runApp(PapaDevApp());
}

class PapaDevApp extends StatefulWidget {
  const PapaDevApp({super.key});

  @override
  _PapaDevAppState createState() => _PapaDevAppState();
}

class _PapaDevAppState extends State<PapaDevApp> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.brown.shade700),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black87,
        appBarTheme: AppBarTheme(backgroundColor: Colors.brown.shade700),
      ),
      home: HomePage(toggleTheme: () {
        setState(() {
          isDarkMode = !isDarkMode;
        });
      }),
    );
  }
}

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;

  HomePage({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipOval(
              child: Image.asset(
                'assets/images/logo.png',
                height: 40, // Ajusta el tamaño si lo necesitas
                width: 40, // Ajusta el tamaño si lo necesitas
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10), // Espacio entre el logo y el título
            Text(
              'PapaDev', // Título o nombre de la página
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.dark_mode),
              SizedBox(width: 10),
              Switch(
                activeColor: Colors.lightBlueAccent,
                inactiveThumbColor: Colors.brown.shade700,
                inactiveTrackColor: Colors.grey,
                value: MediaQuery.of(context).platformBrightness ==
                    Brightness.dark,
                onChanged: (value) {
                  toggleTheme();
                },
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSection(),
            ServicesSection(),
            PortfolioSection(),
            TestimonialsSection(),
            AboutMeSection(),
            ContactSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.brown.shade700, Colors.lightBlueAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido a PapaDev',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Desarrollamos soluciones innovadoras en aplicaciones móviles, sitios web y sistemas empresariales.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.white,
                foregroundColor: Colors.brown.shade700,
              ),
              child: Text('Solicita un presupuesto'),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sobre Mí',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            '''Hola, soy Tomás, pero mis amigos y familia me llaman Papa, y esa es la inspiración detrás de PapaDev. Soy programador desde hace 7 años y, durante 12 años, he estado desarrollando mi pasión por la tecnología. Comencé mi formación en un colegio técnico en Córdoba, Argentina, y luego continué mis estudios en la Universidad Tecnológica Nacional, donde me gradué en Ingeniería en Sistemas.

A lo largo de mi carrera, he trabajado con una amplia variedad de tecnologías, lo que me ha permitido adquirir una sólida base técnica. Lo que más disfruto es afrontar nuevos desafíos y encontrar soluciones innovadoras a problemas complejos. Siempre estoy buscando formas de mejorar y evolucionar, adaptándome a las tendencias emergentes en el mundo digital.

El logo de PapaDev refleja mi heterocromía, un ojo marrón y el otro celeste, y representa cómo combino lo técnico con un toque personal.

Cada proyecto es una nueva oportunidad para aprender y seguir creciendo. Mi objetivo es ofrecer soluciones digitales que no solo sean funcionales, sino también eficientes, escalables y, por supuesto, con un toque de creatividad.''',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ServicesSection extends StatelessWidget {
  final List<Map<String, String>> services = [
    {
      'title': 'Aplicaciones Móviles',
      'description':
          'Desarrollo de aplicaciones para iOS y Android con Flutter, enfocados en la experiencia de usuario.',
    },
    {
      'title': 'Páginas Web',
      'description':
          'Diseño y desarrollo de sitios web modernos, rápidos y optimizados para SEO.',
    },
    {
      'title': 'Sistemas Empresariales',
      'description':
          'Automatización de procesos internos de empresas con soluciones personalizadas que aumentan la productividad.',
    },
  ];

  ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Text(
            'Mis Servicios',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: services.map((service) {
              return ServiceCard(
                title: service['title']!,
                description: service['description']!,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 300,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class PortfolioSection extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {'title': 'Aplicación Móvil', 'image': 'assets/mobile_app.png'},
    {'title': 'Página Web', 'image': 'assets/website.png'},
    {'title': 'Sistema Desktop', 'image': 'assets/desktop_system.png'},
  ];

  PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Text(
            'Portafolio',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: projects.map((project) {
              return PortfolioCard(
                title: project['title']!,
                imagePath: project['image']!,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class PortfolioCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const PortfolioCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class TestimonialsSection extends StatelessWidget {
  final List<Map<String, String>> testimonials = [
    {
      'name': 'Cliente 1',
      'testimonial': 'Excelente trabajo, muy satisfecho con la app que crearon.'
    },
    {
      'name': 'Cliente 2',
      'testimonial': 'Un gran profesional, super recomendado.'
    },
    {
      'name': 'Cliente 3',
      'testimonial':
          'El sitio web que diseñaron es impresionante, fácil de navegar y muy funcional.'
    },
  ];

  TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            'Testimonios',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: testimonials.map((testimonial) {
              return TestimonialCard(
                name: testimonial['name']!,
                testimonial: testimonial['testimonial']!,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final String name;
  final String testimonial;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.testimonial,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        width: 300,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(testimonial),
          ],
        ),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            'Contáctame',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Mensaje',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {},
                  child: Text('Enviar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.brown.shade700,
      child: Center(
        child: Text(
          '© 2025 PapaDev. Todos los derechos reservados.',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
