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

class IklimQuestion extends StatefulWidget {
  const IklimQuestion({super.key});

  @override
  State<IklimQuestion> createState() => _IklimState();
}

class _IklimState extends State<IklimQuestion> {
  // Soruların listesi
  final List<Question> questions = [
    Question(
      questionText: "Aşağıdakilerden hangisi iklim değişikliğinin temel nedenlerinden biridir?",
      options: ["Geri dönüşüm oranlarının artması", "Fosil yakıtların kullanımı","Bitkilerin fotosentez yapması","Okyanusların temizlenmesi"],
      correctAnswer: "Fosil yakıtların kullanımı",
      imagePath: "images/iklim_degisikligi.png", // Resim yolunu burada veriyoruz
    ),
    Question(
      questionText: "İklim değişikliği nedeniyle hangi doğal olayların sıklığı artmıştır?",
      options: ["Güneş tutulmaları", "Orman yangınları", "Depremler", "Volkanik patlamalar"],
      correctAnswer: "Orman yangınları",
      imagePath: "images/doga_olayi.png", // Farklı resim yolu
    ),
    Question(
      questionText: "İklim değişikliği, yalnızca belirli bölgeleri etkiler.?",
      options: ["Doğru", "Yanlış"],
      correctAnswer: "Yanlış",
      imagePath: "images/iklim.png", // Farklı resim yolu
    ),
    Question(
      questionText: "Bireysel olarak enerji tasarrufu yapmak, iklim değişikliğiyle mücadelede etkili olabilir.",
      options: ["Doğru", "Yanlış"],
      correctAnswer: "Doğru",
      imagePath: "images/enerji_tasarrüfü.png", // Farklı resim yolu
    ),
    Question(
      questionText: "Aşağıdaki gazlardan hangisi bir sera gazıdır?",
      options: ["Oksijen (O₂)", "Azot (N₂)", "Karbondioksit (CO₂)", "Helyum (He)"],
      correctAnswer: "Karbondioksit (CO₂)",
      imagePath: "images/sera_gazi.png", // Farklı resim yolu
    ),
    Question(
      questionText: "İklim değişikliğiyle mücadelede aşağıdaki uygulamalardan hangisi etkili değildir?",
      options: ["Yenilenebilir enerji kaynaklarının kullanılması", "Ağaçlandırma faaliyetlerinin artırılması", "Fosil yakıtların tüketiminin artırılması", "Enerji verimliliğinin teşvik edilmesi"],
      correctAnswer: "Fosil yakıtların tüketiminin artırılması",
      imagePath: "images/iklim_deg.png", // Farklı resim yolu
    ),
    Question(
      questionText: "Elektrikli araçların kullanımı, karbon emisyonlarını artırır.",
      options: ["Doğru", "Yanlış"],
      correctAnswer: "Yanlış",
      imagePath: "images/karbon_emis.png", // Farklı resim yolu
    ),
  ];

  int currentIndex = 0; // Şu anki sorunun indexi
  String selectedAnswer = ""; // Kullanıcının seçtiği cevap
  int score = 0; // Toplam puan
  int correctAnswers = 0; // Doğru cevap sayısı

  // Soruyu güncellemek için bir fonksiyon
  void nextQuestion() {
    setState(() {
      // Cevap kontrolü
      if (selectedAnswer == questions[currentIndex].correctAnswer) {
        score += 5; // Doğru cevap için 5 puan
        correctAnswers++;
      } else if (selectedAnswer.isNotEmpty) {
        score -= 1; // Yanlış cevap için -1 puan
      }

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
                  "İklim Değişikliği",
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
                  // Skor ve Soru Bilgisi
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Soru: ${currentIndex + 1}/${questions.length}",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Puan: $score",
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
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
