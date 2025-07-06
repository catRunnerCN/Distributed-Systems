<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Select Export Path</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            color: #444;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            color: #333;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            margin-bottom: 15px;
            background-color: #f9f9f9;
        }
        .btn-primary, .btn-secondary {
            width: 48%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-primary {
            background-color: #007bff;
            color: #fff;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: #fff;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        .btn-container {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1></h1>
        <form action="/mavenproject3/Book/Import/do_export.jsp" method="GET">
            <div class="form-group">
                <label for="exportPath">Export Path:</label>
                <input type="text" id="exportPath" name="exportPath" placeholder="Enter the path to save the file" required>
            </div>
            <div class="form-group">
                <label for="fileName">File Name:</label>
                <input type="text" id="fileName" name="fileName" placeholder="Enter the file name (e.g., testRecord.xlsx)" required>
            </div>
            <div class="btn-container">
                <button type="submit" class="btn-primary">Export</button>
                <button type="reset" class="btn-secondary">Cancel</button>
            </div>
        </form>
    </div>
</body>

</html>
