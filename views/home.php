<br>
<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Student List</h5>
        <h6 class="card-subtitle mb-12 text-muted">All Student</h6>
        <p class="card-text">
          <?php 
              if ($this->data->num_rows > 0) {
                echo '
                  <table class="table table-hover table-responsive-lg">
                    <thead>
                      <tr class="text-center">
                        <th scope="col">ลำดับ</th>
                        <th scope="col">รหัสนักศึกษา</th>
                        <th scope="col">หลักสูตร</th>
                        <th scope="col">ชื่อ</th>
                        <th scope="col">สกุล</th>
                        <th scope="col">ปีการศึกษา</th>
                        <th scope="col">สถานภาพนักศึกษา</th>
                      </tr>
                    </thead>
                    <tbody>
                ';
                
                $i = 1;

                while($row = $this->data->fetch_assoc()) {
                    echo '<tr class="text-center"><th scope="row">'. $i .'</th>';
                    echo '<td>'. $row['studentID'] .'</td>';
                    echo '<td>'. $row['curriculumID'] .'</td>';
                    echo '<td>'. $row['name_title'] . $row['name'] .'</td>';
                    echo '<td>'. $row['surname'] .'</td>';
                    echo '<td>'. $row['year_of_study'] .'</td>';
                    echo '<td>'. $row['student_status'] .'</td></tr>';
                    $i++;
                }

                echo '
                  </tbody>
                </table>
                ';
              } else {
                  echo '<h3>0 results</h3>';
              } 
          ?>
        </p>
      </div>
    </div>
  </div>
</div>