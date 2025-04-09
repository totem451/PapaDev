import 'package:flutter/material.dart';

void main() {
  runApp(PapaDevApp());
}

class PapaDevApp extends StatefulWidget {
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

  HomePage({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PapaDev'),
        actions: [
          Switch(
            value: MediaQuery.of(context).platformBrightness == Brightness.dark,
            onChanged: (value) {
              toggleTheme();
            },
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
            '¡Hola! Soy [Tu Nombre], desarrollador apasionado por crear soluciones tecnológicas que marquen una diferencia. Con más de [X años] de experiencia en desarrollo de aplicaciones móviles, páginas web y sistemas empresariales, mi objetivo es ayudar a empresas y emprendedores a transformar sus ideas en productos digitales de calidad.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Text(
            'Mi historia comenzó [aquí puedes incluir tu historia]. Siempre he estado interesado en [detalles sobre tu vida y tu motivación].',
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
