package Model;



public class JogadorView {
    private int id;
    private String nameJogador;
    private int age;
    private int height;
    private int weight;
    private String nationality;
    private String club;

    private int eurWage;
    private int eurReleaseClause;
    private int eurValue;
    private int overall;


    public JogadorView(int id, String nameJogador, int age, int height, int weight, String nationality, String club, int eurWage, int eurReleaseClause, int eurValue, int overall) {
        this.id = id;
        this.nameJogador = nameJogador;
        this.age = age;
        this.height = height;
        this.weight = weight;
        this.nationality = nationality;
        this.club = club;
        this.eurWage = eurWage;
        this.eurReleaseClause = eurReleaseClause;
        this.eurValue = eurValue;
        this.overall = overall;
    }

    public int getId() {
        return id;
    }

    public int getAge() {
        return age;
    }

    public int getHeight() {
        return height;
    }

    public int getWeight() {
        return weight;
    }

    public int getEurWage() {
        return eurWage;
    }

    public int getEurReleaseClause() {
        return eurReleaseClause;
    }

    public int getEurValue() {
        return eurValue;
    }

    public int getOverall() {
        return overall;
    }

    public String getNameJogador() {
        return nameJogador;
    }

    public String getNationality() {
        return nationality;
    }

    public String getClub() {
        return club;
    }
}
