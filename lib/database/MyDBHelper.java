import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class DatabaseHelper extends SQLiteOpenHelper {
    private static final String DATABASE_NAME = "WordData";
    private static final int DATABASE_VERSION = 1;

    // Table name
    private static final String TABLE_NAME = "words";

    // Column names
    private static final String COLUMN_WORD = "word";
    private static final String COLUMN_PIC_IMAGES = "picImages";
    private static final String COLUMN_WORD_IMAGES = "wordImages";
    private static final String COLUMN_MEANING = "meaning";

    // Create table SQL query
    private static final String CREATE_TABLE =
            "CREATE TABLE " + TABLE_NAME + "("
                    + COLUMN_WORD + " TEXT,"
                    + COLUMN_PIC_IMAGES + " BLOB,"
                    + COLUMN_WORD_IMAGES + " BLOB,"
                    + COLUMN_MEANING + " TEXT"
                    + ")";


    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(CREATE_TABLE);
        // Add initial data
        addWord(db, "Castle", "assets/Pic/Castle.png", "assets/Word/Castle.png", "ปราสาท");
        addWord(db, "King", "assets/Pic/King.png", "assets/Word/King.png", "ราชา");
        addWord(db, "Queen", "assets/Pic/Queen.png", "assets/Word/Queen.png", "ราชินี");
        addWord(db, "Wizard", "assets/Pic/Wizard.png", "assets/Word/Wizard.png", "นัทเวท");
        addWord(db, "Knight", "assets/Pic/Knight.png", "assets/Word/Knight.png", "อัศวิน");
        addWord(db, "Kid", "assets/Pic/Kid.png", "assets/Word/Kid.png", "เด็ก");
        addWord(db, "Archer", "assets/Pic/archer.png", "assets/Word/archer.png", "นักธนู");
        // Add more initial data as needed
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Drop older table if existed
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);

        // Create tables again
        onCreate(db);
    }

    // Method to add a word to the database
    public void addWord(SQLiteDatabase db, String word, String picImages, String wordImages, String meaning) {
        ContentValues values = new ContentValues();
        values.put(COLUMN_WORD, word);
        values.put(COLUMN_PIC_IMAGES, picImages);
        values.put(COLUMN_WORD_IMAGES, wordImages);
        values.put(COLUMN_MEANING, meaning);

        // Inserting Row
        db.insert(TABLE_NAME, null, values);
    }
}
