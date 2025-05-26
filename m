Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3214D29B;
	Mon, 26 May 2025 04:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748234083; cv=none; b=meGy52UO+J/7wXrFXTL/9t6CAHbgHXBrwHgihJ8DjyvEeliADkhOpw+E9BBzo1A55lytp++OyV94DnZtON7kmRGYuvXP/rzhwztB0XN0Bv6lRUSXlLur2ZuCc5ATHUEDmBSWpxJmh0/gJvUPOnf/FNMZfYfHGv83qMNNmFhi/DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748234083; c=relaxed/simple;
	bh=8SORB+Gtjm+0iyAAYxHA2Reo+gdvTPRF6aFFxqcu7wg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S3cXFW8QXnBEJ+nmeGycVCmFL3l9uXWIYHlCDYESxl9gJTeQDbI5nr+DZ3bQA6M4HHt2wipdKzpjIj9ZH7gsciEv7+DkWRidQ6mPtW7r+InQR2GmXQ5AS1lzA9rAY8v+c8sCn/oPRG1aTQSzf/YGoS9YSDu+3edc9prahakCt6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1zmuGmE; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1zmuGmE"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1123675b3a.2;
        Sun, 25 May 2025 21:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748234081; x=1748838881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpYj8itDK4L5wE/M7/hM6tOuRa6rFUXJoS7o5oXlxCw=;
        b=W1zmuGmEz5RSrbgVcKzuRDNVPrqTxinMtsIbkHAUVV0ZlT/TQxfC8dxrr4Pzb9dm8e
         vnm3JTgeRib1alsWuQh4rv2gy4+MGnF++O6Np4LigHK1Y/3OePPa/JQQbnIYG6MW3XTy
         OgEH02Fr7qlNniCpVr+t+PoX4J97ncF6oZbADycRgiJfNKYjD42+omKpTZcdnPct4mDI
         l/9KVUPN76DhYoFIpg9MLvXsAbMwpfHS39JxtHcI82YVDYS/hhNULt9aIB84fJcy8B+d
         tzBK+FzMYHhaCZ2bXzscFRtV7loZl1IFGIpxIoxlIKNfSOwBw0QGCJiR+1dBY1mM2Kbz
         zGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748234081; x=1748838881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpYj8itDK4L5wE/M7/hM6tOuRa6rFUXJoS7o5oXlxCw=;
        b=iyjAoE7aCpqWG13fNB9oYfd9AHimhdApSQWAoelEB6lGjsatW4WPxg7uK1Lf1xrjKV
         7JmnzFWBIsP+r7mvwylWNYGNd3tcHSJ/NPwk+UpfbJ3IhXhAmAOsK6lPkzhu/oPWgv3i
         o0/5fBMsgoUGCQVVeCKw919Hy3tyOMEUR2gt3MmehM8PCGhAoDMK5rSyc2K6lei6a8ec
         3+RXRYYwzM5tEV8HPoQY7Z/SXjlTCPLapxcC5fgpnA3D7duR77DF3NoLGfN/KtuIeVp/
         K7hzIGATSqAztmeDHpTG6yfglgzzeMAilaNciMa09LSzgSV3H4KUKigLUboB0HReh27e
         WRFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXblqskTGf+66Leah5g4RkHOSrllA0JwPk63Sgpy9clKLKix13j09m6gN1NCnVHE5O+TUfKjjWJi2Ov1t0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHgAfBZsKeHov+nQaU71ShalGkNUuj7xHm97uJRSxYV6NOMoaP
	CsvLEewQf2UomqQ3J6DvnzB7+vuGCffNm1WM2y1BXc1Y6Z78Nkh/xR9S
X-Gm-Gg: ASbGnctxIrGpgI2LqipxMi7v5N+cw8+EQVKdU2hZ1hIcSeJhSvpbwEbqqGqyupuq6LS
	Q4hG+sAuC03N6atnYgCCcF9FF+mu64mf3jJ3Lk7XxjEglXDLvWUBk8T1i3y9UG2+Kz+EHHLUR3e
	9Qq9SREDpFutErXkYaECNftqv4Xt6XgR9+h+Wve5JnRuVFEDviGyNK3FS3flleK36KUUG92mk9g
	uJtYrmf7IGgBoBtmZ/3PtSubAFrlYakvt0yOdQgbm2OoDZqpRiZ6OcOR0SN351L18tM/SndSU6Z
	frVpP/EXis9uQKfBA+hCq1JI8GnTqYB/9Sa4vLNo2C6K3YgVNHri8ZI1JPt64Y5vKDOm2mBtJW9
	zppa/1WE=
X-Google-Smtp-Source: AGHT+IEhIpUrTY4pcMXHRLsWmSAvbbjH3A82MNSLEvp0ddvItt6vFgiIKuz1HatoYVkFE9eQo8gcEQ==
X-Received: by 2002:a05:6a20:3ca6:b0:203:addb:5a29 with SMTP id adf61e73a8af0-2188c3c7982mr11822221637.40.1748234080874;
        Sun, 25 May 2025 21:34:40 -0700 (PDT)
Received: from giraffesnn.localdomain ([106.37.191.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2c3b85d967sm96722a12.61.2025.05.25.21.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 21:34:40 -0700 (PDT)
From: Yongbo Zhang <giraffesnn123@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yongbo Zhang <giraffesnn123@gmail.com>
Subject: [PATCH] usb: typec: fusb302: fix scheduling while atomic when using virtio-gpio
Date: Mon, 26 May 2025 12:34:33 +0800
Message-ID: <20250526043433.673097-1-giraffesnn123@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the gpio irqchip connected to a slow bus(e.g., i2c bus or virtio
bus), calling disable_irq_nosync() in top-half ISR handler will trigger
the following kernel BUG:

BUG: scheduling while atomic: RenderEngine/253/0x00010002
...
Call trace:
 dump_backtrace+0x0/0x1c8
 show_stack+0x1c/0x2c
 dump_stack_lvl+0xdc/0x12c
 dump_stack+0x1c/0x64
 __schedule_bug+0x64/0x80
 schedule_debug+0x98/0x118
 __schedule+0x68/0x704
 schedule+0xa0/0xe8
 schedule_timeout+0x38/0x124
 wait_for_common+0xa4/0x134
 wait_for_completion+0x1c/0x2c
 _virtio_gpio_req+0xf8/0x198
 virtio_gpio_irq_bus_sync_unlock+0x94/0xf0
 __irq_put_desc_unlock+0x50/0x54
 disable_irq_nosync+0x64/0x94
 fusb302_irq_intn+0x24/0x84
 __handle_irq_event_percpu+0x84/0x278
 handle_irq_event+0x64/0x14c
 handle_level_irq+0x134/0x1d4
 generic_handle_domain_irq+0x40/0x68
 virtio_gpio_event_vq+0xb0/0x130
 vring_interrupt+0x7c/0x90
 vm_interrupt+0x88/0xd8
 __handle_irq_event_percpu+0x84/0x278
 handle_irq_event+0x64/0x14c
 handle_fasteoi_irq+0x110/0x210
 __handle_domain_irq+0x80/0xd0
 gic_handle_irq+0x78/0x154
 el0_irq_naked+0x60/0x6c

This patch replaces request_irq() with devm_request_threaded_irq() to
avoid the use of disable_irq_nosync().

Signed-off-by: Yongbo Zhang <giraffesnn123@gmail.com>
---
 drivers/usb/typec/tcpm/fusb302.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index f15c63d3a8f4..f2801279c4b5 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1477,9 +1477,6 @@ static irqreturn_t fusb302_irq_intn(int irq, void *dev_id)
 	struct fusb302_chip *chip = dev_id;
 	unsigned long flags;

-	/* Disable our level triggered IRQ until our irq_work has cleared it */
-	disable_irq_nosync(chip->gpio_int_n_irq);
-
 	spin_lock_irqsave(&chip->irq_lock, flags);
 	if (chip->irq_suspended)
 		chip->irq_while_suspended = true;
@@ -1622,7 +1619,6 @@ static void fusb302_irq_work(struct work_struct *work)
 	}
 done:
 	mutex_unlock(&chip->lock);
-	enable_irq(chip->gpio_int_n_irq);
 }

 static int init_gpio(struct fusb302_chip *chip)
@@ -1747,9 +1743,10 @@ static int fusb302_probe(struct i2c_client *client)
 		goto destroy_workqueue;
 	}

-	ret = request_irq(chip->gpio_int_n_irq, fusb302_irq_intn,
-			  IRQF_ONESHOT | IRQF_TRIGGER_LOW,
-			  "fsc_interrupt_int_n", chip);
+	ret = devm_request_threaded_irq(dev, chip->gpio_int_n_irq,
+					NULL, fusb302_irq_intn,
+					IRQF_ONESHOT | IRQF_TRIGGER_LOW,
+					"fsc_interrupt_int_n", chip);
 	if (ret < 0) {
 		dev_err(dev, "cannot request IRQ for GPIO Int_N, ret=%d", ret);
 		goto tcpm_unregister_port;
@@ -1774,7 +1771,6 @@ static void fusb302_remove(struct i2c_client *client)
 	struct fusb302_chip *chip = i2c_get_clientdata(client);

 	disable_irq_wake(chip->gpio_int_n_irq);
-	free_irq(chip->gpio_int_n_irq, chip);
 	cancel_work_sync(&chip->irq_work);
 	cancel_delayed_work_sync(&chip->bc_lvl_handler);
 	tcpm_unregister_port(chip->tcpm_port);
--
2.49.0

