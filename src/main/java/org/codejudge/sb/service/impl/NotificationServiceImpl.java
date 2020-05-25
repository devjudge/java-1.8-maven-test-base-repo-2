package org.codejudge.sb.service.impl;

import java.util.concurrent.TimeUnit;

import org.codejudge.sb.service.api.NotificationService;

public class NotificationServiceImpl implements NotificationService {

    @Override
    public void notify(int rating) {
        try {
            TimeUnit.MILLISECONDS.sleep(30);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
