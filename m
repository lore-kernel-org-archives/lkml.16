Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A6A221F21
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000267; cv=none; b=VvIQvkpjjE1w/7RUaH+dOYTAITd+vt8/jL5UvuCFMFTo4PpxDqL6QJZ8ZtZvYX38/UOXwKvY1nI0IQ1znyLmpS6JSi3MyY0auqVzjttLmXRvKPRD7y+v4Gna9hoIv3ZdgTgboNTUbLY0X3JvR4Nq+h+SP9cOwUgW+AR69KT7zZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000267; c=relaxed/simple;
	bh=5hW1x0h0BI/1kFl0MGB9PENf/p3rDflku5UUTYWUgwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMZ/O0a9JA6lAcA6lHXB0RcPjOD4gNaVl2CzsdoJuXQx6Y/6FwOG73HJqX5Z8YRA0Y2Ue1YgC5n1lcmfapyRU/Xhgi8Xbf6KAy5ujq6jSdENrpShgZ7YDAaTbx7ZcVFFMZr8bW0bvft8GfwwQnM/i7bpsNgloibO5RvC2VLuv6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=iLwcuMku; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="iLwcuMku"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 476363F2C2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000263;
	bh=ibKGlo6h6Vsh/r+V4NevFZFzzB1WsTKuG5wixnUQ0uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=iLwcuMkuRGmEOtrOs+pPpW7Ow7Gw3T/yG7UDuotDIyCFbd2R4STBmO/Eh4sF3LFyQ
	 CzWqaH6HczmBXFnv47EA/4DIfVeSuBOss7uN7vyQ9AgybxkYqXJsJtf9Sz/JWD7ODc
	 PLBk+jYD9W42hXMOnILksNIijJM7TAGxBLqYj/9MSKIl9pb1SDhE/EqHv9N0VP23N3
	 wrk7/zHrCDRYmU4HKvWyx4jCNsbuJaPNSId0vEs1lNRtEbh+wg2DPi2OOmrJZ5jpVQ
	 vaWMhFGFGpsvYyPNX4v4gH2v/LBpSNzQb7eZa6c4sFgbzd91Dgc5uRDv87dFl8H31b
	 b/52zchmDgxnw==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2241ae15dcbso47634785ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 21:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000262; x=1744605062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibKGlo6h6Vsh/r+V4NevFZFzzB1WsTKuG5wixnUQ0uE=;
        b=r+ZdYhrpLybjeXvPHrReXAm6DH7AD5nZZZzCmVWgKzGCTTwArlzGeEoepXuoA2gtH8
         D3Xlx5/dTHWYMrgcHV+pBRrdF7GGelcWxKM6hSnJFd1J71AS3WFm570qslWOe5N2lNNQ
         OziyYhXX6Xq/4Ecp4Bx162T4D6UkdE/iIgUxZNQoqDgl4cOoZkAA5B0ZX9pb3A+4yh/k
         s43NJrviurX+DxnUfnal+e4I9AQfKdcu8aU0cbR7tfLS5MgtW93keIbkrgfLYuXQBSCe
         UtN+GohzySMkHKzA662BV4xoZrhppXXpwQ64NJ0fohP7BoQ7WNQxw/SUP0rIH/YqkBQ7
         d7LA==
X-Forwarded-Encrypted: i=1; AJvYcCXVWAgC6QY+wo8Ef2M4lNTwlqIFDWk1Ot4wF+VXuVnvIhCC9RD67/chgZS2etEFFlGaetPN5Vc4c0g09Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxr30PbEUExQQSeroRPrKESJmXcB5qDG3BLjnK3E6i3zZ7q8la
	ZOrScONPrPzcm2MJzau+I508E4R3kFpzzeQQyHkJXcM0BncuNapSg/+i7jtSpx6Nb9a4jTyEN0e
	sPlUwrHnAswMsg66fhE0fUXpxZ2OhX1CuJlCmiEl8lOeFkvTP8sMgvcCxia3h5ULkYmeujlFdNb
	SQDw==
X-Gm-Gg: ASbGnctTGCUxzG9ji8N39Cz6NK5x89E5tm+nWj62ezaXmR7oAwaSard7qc4JFJVW65S
	4ochj1VHPhqYB99UU5kDJjq0d9oSHjdwy4H+ooJdoSVlHn1Q/MRumIeFKNCkvnKCqVvNgZOpkkJ
	RayS11/UBjFnEAlbsY5qyn603jheldQiJ60ze0iYceU4ydDKQtZgA7kcNeCZB3X03nwIyFh2nap
	GGxwQx5vAmuRmTXK0S9SZ0LGLY/qCZ1YeSDPO+nfS5OKvk2ZNaJfzGicw0CYobVlX9OCrTRvGYV
	SLuNXONH2Mj6lBsitUvi/saq2h3NzKy62A==
X-Received: by 2002:a17:902:d50e:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22a8a05524fmr151180775ad.15.1744000261814;
        Sun, 06 Apr 2025 21:31:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+bu3wJwF3+o72OVyEJz8tYU76qPXcw9JGAY3si2m0Y9uGwevcahFZ2tnrq1WiHt6WtsfzhQ==
X-Received: by 2002:a17:902:d50e:b0:21f:85ee:f2df with SMTP id d9443c01a7336-22a8a05524fmr151180585ad.15.1744000261512;
        Sun, 06 Apr 2025 21:31:01 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:31:01 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/9] gpio: aggregator: cancel deferred probe for devices created via configfs
Date: Mon,  7 Apr 2025 13:30:17 +0900
Message-ID: <20250407043019.4105613-8-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407043019.4105613-1-koichiro.den@canonical.com>
References: <20250407043019.4105613-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For aggregators initialized via configfs, write 1 to 'live' waits for
probe completion and returns an error if the probe fails, unlike the
legacy sysfs interface, which is asynchronous.

Since users control the liveness of the aggregator device and might be
editing configurations while 'live' is 0, deferred probing is both
unnatural and unsafe.

Cancel deferred probe for purely configfs-based aggregators when probe
fails.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index bea01ebe8cda..d6010331a4c0 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -72,6 +72,10 @@ struct gpio_aggregator_line {
 	enum gpio_lookup_flags flags;
 };
 
+struct gpio_aggregator_pdev_meta {
+	bool init_via_sysfs;
+};
+
 static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
 static DEFINE_IDR(gpio_aggregator_idr);
 
@@ -1139,6 +1143,7 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 						const char *buf, size_t count)
 {
+	struct gpio_aggregator_pdev_meta meta = { .init_via_sysfs = true };
 	char name[CONFIGFS_ITEM_NAME_LEN];
 	struct gpio_aggregator *aggr;
 	struct platform_device *pdev;
@@ -1189,7 +1194,7 @@ static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
 
 	gpiod_add_lookup_table(aggr->lookups);
 
-	pdev = platform_device_register_simple(DRV_NAME, aggr->id, NULL, 0);
+	pdev = platform_device_register_data(NULL, DRV_NAME, aggr->id, &meta, sizeof(meta));
 	if (IS_ERR(pdev)) {
 		res = PTR_ERR(pdev);
 		goto remove_table;
@@ -1276,14 +1281,15 @@ static struct attribute *gpio_aggregator_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpio_aggregator);
 
-
 /*
  *  GPIO Aggregator platform device
  */
 
 static int gpio_aggregator_probe(struct platform_device *pdev)
 {
+	struct gpio_aggregator_pdev_meta *meta;
 	struct device *dev = &pdev->dev;
+	bool init_via_sysfs = false;
 	struct gpio_desc **descs;
 	struct gpiochip_fwd *fwd;
 	unsigned long features;
@@ -1297,10 +1303,28 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 	if (!descs)
 		return -ENOMEM;
 
+	meta = dev_get_platdata(&pdev->dev);
+	if (meta && meta->init_via_sysfs)
+		init_via_sysfs = true;
+
 	for (i = 0; i < n; i++) {
 		descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
-		if (IS_ERR(descs[i]))
+		if (IS_ERR(descs[i])) {
+			/*
+			 * Deferred probing is not suitable when the aggregator
+			 * is created via configfs. They should just retry later
+			 * whenever they like. For device creation via sysfs,
+			 * error is propagated without overriding for backward
+			 * compatibility. .prevent_deferred_probe is kept unset
+			 * for other cases.
+			 */
+			if (!init_via_sysfs && !dev_of_node(dev) &&
+			    descs[i] == ERR_PTR(-EPROBE_DEFER)) {
+				pr_warn("Deferred probe canceled for creation via configfs.\n");
+				return -ENODEV;
+			}
 			return PTR_ERR(descs[i]);
+		}
 	}
 
 	features = (uintptr_t)device_get_match_data(dev);
-- 
2.45.2

