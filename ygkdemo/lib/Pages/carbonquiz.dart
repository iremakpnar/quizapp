import 'package:flutter/material.dart';

class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String imagePath;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.imagePath,
  });
}

class CarbonquizQuestion extends StatefulWidget {
  const CarbonquizQuestion({super.key});

  @override
  State<CarbonquizQuestion> createState() => _CarbonState();
}

class _CarbonState extends State<CarbonquizQuestion> {
  // Soruların listesi
  final List<Question> questions = [
    Question(
      questionText: "Hangi ulaşım yöntemi karbon ayak izini en aza indirir?",
      options: ["Toplu taşıma kullanmak", "Kendi aracını kullanmak","Bisiklet kullanmak","Uçak ile seyahat etmek"],
      correctAnswer: "Bisiklet kullanmak",
      imagePath: "images/carbon.png",
    ),
    Question(
      questionText: "Doğru geri dönüşüm yapmanın karbon ayak izine etkisi nedir?",
      options: ["Artırır", "Azaltır", "Hiçbir etkisi yoktur", "Karbon ayak izini sabit tutar"],
      correctAnswer: "Azaltır",
      imagePath: "images/dönüsüm.png",
    ),
    Question(
      questionText: "Yerel ve mevsimsel gıdalar tüketmek karbon ayak izini azaltır.",
      options: ["Doğru", "Yanlış"],
      correctAnswer: "Doğru",
      imagePath: "images/gida.png",
    ),
    Question(
      questionText: "Bir ürün satın alırken karbon ayak izini azaltmak için hangisi dikkate alınmalıdır?",
      options: ["Ürünün yerel olması", " Plastik ambalaj kullanması","Ucuz olması","Yüksek enerjiyle üretilmiş olması"],
      correctAnswer: "Ürünün yerel olması",
      imagePath: "images/satinalma.png",
    ),
    Question(
      questionText: "Kısa duş almak, su tasarrufu yaparak karbon ayak izini azaltmaya yardımcı olur.",
      options: ["Doğru", "Yanlış"],
      correctAnswer: "Doğru",
      imagePath: "images/dus.png",
    ),
    Question(
      questionText: "Evde enerji tasarrufu yapmak için aşağıdaki yöntemlerden hangisi daha etkili olur?",
      options: ["Elektrikli aletleri bekleme modunda bırakmak", " LED ampuller kullanmak"," Perdeleri kapalı tutmak","Televizyonu sürekli açık bırakmak"],
      correctAnswer: "LED ampuller kullanmak",
      imagePath: "images/ev.png",
    ),
    Question(
      questionText: "Elektrikli araçlar, içten yanmalı motorlu araçlardan daha fazla karbon emisyonu üretir.",
      options: ["Doğru", "Yanlış"],
      correctAnswer: "Yanlış",
      imagePath: "images/arac.png",
    ),
  ];

  int currentIndex = 0; // Şu anki sorunun indexi
  String selectedAnswer = ""; // Kullanıcının seçtiği cevap

  // Soruyu güncellemek için bir fonksiyon
  void nextQuestion() {
    setState(() {
      if (currentIndex < questions.length - 1) {
        currentIndex++;
        selectedAnswer = ""; // Yeni soruya geçildiğinde cevabı sıfırlıyoruz
      }
    });
  }

  void prevQuestion() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        selectedAnswer = ""; // Yeni soruya geçildiğinde cevabı sıfırlıyoruz
      }
    });
  }

  // Cevap doğru mu diye kontrol etmek
  bool isAnswerCorrect() {
    return selectedAnswer == questions[currentIndex].correctAnswer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004840),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Sola hizalanmış ikon
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFf35b32),
                    borderRadius: BorderRadius.circular(60),
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.white, size: 27),
                ),
                // Aradaki boşluk
                const Spacer(),
                // Ortalanmış yazı
                const Text(
                  "Atık Uygulamaları",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(flex: 2), // Sağ tarafa fazladan boşluk
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Resim her soruya göre dinamik olarak değişiyor
                  Image.asset(
                    questions[currentIndex].imagePath, // Resmin yolunu buraya ekliyoruz
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      questions[currentIndex].questionText, // Şu anki soruyu göster
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Seçenekler
                  Column(
                    children: questions[currentIndex].options.map((option) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedAnswer == option
                                  ? isAnswerCorrect() // Doğru cevap ise yeşil
                                  ? Colors.green
                                  : Colors.red // Yanlış cevap ise kırmızı
                                  : const Color(0xFF818181), // Diğer durumda gri kenarlık
                              width: 2, // Kenarlık kalınlığı
                            ),
                            borderRadius: BorderRadius.circular(20), // Kenar yuvarlama
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedAnswer = option;
                              });
                            },
                            child: Text(option, style: const TextStyle(fontSize: 20.0, color: Colors.black)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent, // Arka plan rengini şeffaf yap
                              minimumSize: Size(double.infinity, 50),
                              elevation: 0, // Gölgeyi kaldır
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 15),
                  // İleri ve Geri butonları
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: prevQuestion,
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          child: const Icon(
                            Icons.arrow_back,  // Geri ok simgesi
                            color: Colors.white,  // Icon rengini beyaz yapalım
                            size: 30, // Icon boyutunu ayarlayabilirsiniz
                          ),
                        ),
                        ElevatedButton(
                          onPressed: nextQuestion, // İleriye gitmek için nextQuestion kullan
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                          child: const Icon(
                            Icons.arrow_forward,  // İleri ok simgesi
                            color: Colors.white,  // Icon rengini beyaz yapalım
                            size: 30, // Icon boyutunu ayarlayabilirsiniz
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
