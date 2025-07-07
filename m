Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0AE293C50
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885434; cv=none; b=oh7m4mWgp37fahuQkymDZ4pG/MIrEvcD0M76wbyhMgHkGzN/k4UEijFSIZYr3TcYOgFbCp/7rKaPPZJWaRg4yt/ACRB7BnZKx3KOyt1UM+MK3BKW8oa4po8z9FRS2aLcoCl3m3c6G8VxVxYpIPFj/4DFirRd/d0okPaUUQpp2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885434; c=relaxed/simple;
	bh=0ejtn/WsAdu8/bRGN8lGTqyLp6aNab/l8r0UIDaJZLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0BtEXvFBO16xNgtC2/s9Dc5Ysq9BGQsYixRk6AJ6eSdgnpx6Rz3q10lsdLbdjRdvOWlmGftqvXHKb2tWAL8JY93L1LAeOALrn6Fxclc4kdoqO/WE9VfAnl+mNzRBUPoHHDxp3eeLkjmqkjPfEpEul6NUHRm6dS5cILGCLqPiFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9YiDcXN; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9YiDcXN"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso548247166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751885431; x=1752490231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=To9SF34aS4i0BpQPLo3eZUpW7msBUJxPRVHnQ22RqWQ=;
        b=B9YiDcXNxoWKZQ39S8bJna3xdCELJQ9tp/M9raXJlBYd3wwQ5ShI3E+BbfI5mz0VOe
         YmjGEXUNZvEw0fO4CjdcWanIo5prNfhuxo7+b+oESvvCcIz0HzinrGoI/HVDE/yrO/jh
         ifMS9DvsQVf4qCd4oTxWTFXApSL+5rr7E0Q9ldcksqSE9Sa2uWMc9jLmrYBAw+ixMQF8
         QhROdZoH0qbVDaGrDknEfivHpCGE67pyENGQcWmSJ207zl/HbugQHOGA634qSk03q6sN
         la4L9KnyCw7Fm4IUzKxFldiZtTmhWYAqxqNUZG04tU90Uu15sZcrg1qJ50EJPdStX/hR
         AyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885431; x=1752490231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=To9SF34aS4i0BpQPLo3eZUpW7msBUJxPRVHnQ22RqWQ=;
        b=VazKvkukl31VtBky5cdX50PVKOpFQxD1OlLHFcylMW166fWyBefJmAKvUl1t7EiTBi
         0aZSDDvu0Uy85mvjWUrIkctxM+jd6OBiGZDZk1j+v8R5PN+ac3WueXxoBxk0AqR4bwOI
         qWG7YzrVU15pz68KhMIqn2NsBdlWUIaAQcxNKmOFOtgxgiPtGibPXoiYh4OwRE4JI7RO
         bDwTru5DvuIuMZPD6UXCNnTxp7SAYCozw6weWp+aNW61eZQiRX+EJWsW/Ku6Pzv6dVEG
         WxieLIr6IY1vOzsLXFPRppQGvvVohKGHWXn5AQdZ0yvULS8aVpobB30ik3e4FfMup70+
         /+yg==
X-Forwarded-Encrypted: i=1; AJvYcCUvK5zcxRK9tO6cGWdXWRHzCu3hMsr/YPLLDdKCmkDIRs2u8z79giYt55eBuUwz35f18q93izsvEthSNSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwmZnjKfXmJj+svoaYwiw3BPj75U1OfSfcOq9T3F3WdqLB+QkL
	+w89/3IpG6Cdj47UNURDlkwtUUCczJK/geQnW4ugkniP6CocPSobgz2wh50oSnkqPvo=
X-Gm-Gg: ASbGncsoBUoq3xAy598Sid03SqR+s/Okq+2Wo3sekeFvvjUSoItBYx6xmC/zsm2Ru6e
	yGt17A9tfzx96akno4hGRYRlfSfsaV3Ta+MfukSlNklmU8dGDYUbIxUrhnZiLxzmwlPa87GbFfQ
	aoSNb6AoMdA4T39ZXMoEdY5wv2xbL2WToKJU8lJJGEWl8LtkijvdLoXSQWprXuvojkYvmtowXe8
	qNOUqltm2ZDu6LT7jXS+OXiAwBD97SC/WqEALLUQcH05CicciNo09xtSc1x6i+PUXxj/55gv4wt
	QTtryBbHOyDOknq+vp9Rq41sb8yNzBpFofir6Tuz9O8Oj9lmNZ0yRzWMPrIqXnvng9bzbqJG1z3
	PHBmRKSUnwk8+dMlYGLyoh1rLtDqsH42U6J78GwEWNQzXkg==
X-Google-Smtp-Source: AGHT+IHuTERPtfX9ZxhMI8bdy4IEV9JRuXfWgu6DrnqQP+XIU9KVQIJ7ZbpjMDmPQKH3cH7nuN9IQQ==
X-Received: by 2002:a17:906:c4c1:b0:ae3:6dc7:1ac3 with SMTP id a640c23a62f3a-ae3f82d647fmr955742666b.15.1751885430854;
        Mon, 07 Jul 2025 03:50:30 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9263sm685589566b.32.2025.07.07.03.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:50:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 07 Jul 2025 11:50:27 +0100
Subject: [PATCH 1/3] usb: typec: tcpm/tcpci_maxim: fix irq wake usage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-max77759-irq-wake-v1-1-d367f633e4bc@linaro.org>
References: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org>
In-Reply-To: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This driver calls enable_irq_wake() during probe() unconditionally, and
never issues the required corresponding disable_irq_wake() to disable
hardware interrupt wakeup signals.

Additionally, whether or not a device should wake-up the system is
meant to be a policy decision based on sysfs (.../power/wakeup) in the
first place.

Update the driver to use the standard approach to enable/disable IRQ
wake during the suspend/resume callbacks. This solves both issues
described above.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 46 ++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index b5a5ed40faea9cfcceef5550263968148646eb44..ff3604be79da73ca5acff7b5b2434c116ed12ef8 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -421,21 +421,6 @@ static irqreturn_t max_tcpci_isr(int irq, void *dev_id)
 	return IRQ_WAKE_THREAD;
 }
 
-static int max_tcpci_init_alert(struct max_tcpci_chip *chip, struct i2c_client *client)
-{
-	int ret;
-
-	ret = devm_request_threaded_irq(chip->dev, client->irq, max_tcpci_isr, max_tcpci_irq,
-					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
-					chip);
-
-	if (ret < 0)
-		return ret;
-
-	enable_irq_wake(client->irq);
-	return 0;
-}
-
 static int max_tcpci_start_toggling(struct tcpci *tcpci, struct tcpci_data *tdata,
 				    enum typec_cc_status cc)
 {
@@ -532,7 +517,9 @@ static int max_tcpci_probe(struct i2c_client *client)
 
 	chip->port = tcpci_get_tcpm_port(chip->tcpci);
 
-	ret = max_tcpci_init_alert(chip, client);
+	ret = devm_request_threaded_irq(&client->dev, client->irq, max_tcpci_isr, max_tcpci_irq,
+					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
+					chip);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
 				     "IRQ initialization failed\n");
@@ -544,6 +531,32 @@ static int max_tcpci_probe(struct i2c_client *client)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int max_tcpci_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret = 0;
+
+	if (client->irq && device_may_wakeup(dev))
+		ret = disable_irq_wake(client->irq);
+
+	return ret;
+}
+
+static int max_tcpci_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret = 0;
+
+	if (client->irq && device_may_wakeup(dev))
+		ret = enable_irq_wake(client->irq);
+
+	return ret;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static SIMPLE_DEV_PM_OPS(max_tcpci_pm_ops, max_tcpci_suspend, max_tcpci_resume);
+
 static const struct i2c_device_id max_tcpci_id[] = {
 	{ "maxtcpc" },
 	{ }
@@ -562,6 +575,7 @@ static struct i2c_driver max_tcpci_i2c_driver = {
 	.driver = {
 		.name = "maxtcpc",
 		.of_match_table = of_match_ptr(max_tcpci_of_match),
+		.pm = &max_tcpci_pm_ops,
 	},
 	.probe = max_tcpci_probe,
 	.id_table = max_tcpci_id,

-- 
2.50.0.727.gbf7dc18ff4-goog

