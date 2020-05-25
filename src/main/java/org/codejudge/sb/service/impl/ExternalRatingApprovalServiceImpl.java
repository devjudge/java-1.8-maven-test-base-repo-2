package org.codejudge.sb.service.impl;

import java.util.Random;
import java.util.concurrent.TimeUnit;

import org.codejudge.sb.service.api.ExternalRatingApprovalService;

public class ExternalRatingApprovalServiceImpl implements ExternalRatingApprovalService {

    @Override
    public boolean isApproved(int rating) {
        try {
            TimeUnit.MILLISECONDS.sleep(30);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return new Random().nextBoolean();
    }
}
