package com.darkflame.standardjpaoperations.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name="lego_sets")
public class Sets {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="lego_id")
    private long legoId;

    @Column(name="set_name")
    private String setName;

    @Column(name="catalog_number")
    private int catalogNumber;

    @Column(name="price")
    private int price;

    @Column(name="year_of_release")
    private LocalDate yearOfRelease;

    @JsonBackReference
    @ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
    @JoinTable(name="user_sets", joinColumns=@JoinColumn(name="lego_id"),
            inverseJoinColumns = @JoinColumn(name="user_id"))
            private List<Users> usersList;

    @JsonManagedReference
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="category_id")
    private Categories categories;

}
