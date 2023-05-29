package com.marhino.parser.repositories;

import com.marhino.parser.models.Website;
import org.springframework.data.repository.CrudRepository;

public interface WebSiteRepository extends CrudRepository<Website, Long> {
}
