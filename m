Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE31B26AE4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552356; cv=none; b=kNBM9OA2ZIqcI5kui/1SULiolMP/8eRV+pRDaUaza9s1Na2Ow7BH1CoXMqP3z5IbKY6h9sskCndfuRJQB6n76iMUoop83u2QgxZ83aPYhQyTZhr1pvnkBpTCACVEjjEBj4plmUn5Inwh2buhTUTOF0oOz4bXsJ6dLednAfRyx3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552356; c=relaxed/simple;
	bh=ON0ehqNkL/xvxuSncxnJd1gtNg+6gWPXLCaJXpCE84w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lcOxX93J6NuXqwmivmUvYisSDZBqzjzH0sFf12th6F6qkdtmd5C0EtdOlIXxfXKb+hTJqykoCnyZWsXejRazTz8+lzuY4UZF2H5fFrzPT+575zAVwYWxYQynMr/SeGA4aFpbUzyrA39irQgKTBMaPjRY4KbPcS2RzJpF4HAcqzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=E1rVuaV/; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="E1rVuaV/"
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 13E173F887
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552353;
	bh=/dv1clno4vwekIxpQT8JlY6+oBRlXDyt/p4pqtLh8l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=E1rVuaV/5oS3iLYVJblYACYfI99RXqxUesnbMdrqYK7gBu2peAC65fTFET2p2QW+u
	 s2umpURqy7QX9Gt3pyTyv8xBBaDv6N4oY8V1OpMcRCI6Gn3QiwNm9g9kfBnmaNoWP9
	 2hrQ7QiaFfMNsO43ot7RS4Ho89pW1T+9eTSR4A2FNpiwtkTTCwzto3FVgBEgBBkqCs
	 DmusAp5AyxKI334sO2hJn9jlshX2BPhqo2sNzeq81bkst0uec/LsbWG1JToG0SX+fs
	 +liKLRg/utQ8n321ihNt9bqbK8OXqWXJqF8gVAFDa0FS644SMjD5yxd0AY2lEP/k+M
	 O1eG0XKMo87sg==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef80d30df1so7195375a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552352; x=1739157152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dv1clno4vwekIxpQT8JlY6+oBRlXDyt/p4pqtLh8l4=;
        b=ZcZTg2W+gRxYrHBravC9ghiAihOyV6TL6TO2hIF2V6RAkZhLZeKqORNiPr/SpNf/OH
         tq1S5DNqLSEdpH25Ryt5h425y8HNZ4R2Q7Rpl96F0xYFKpgwudEPSL9A3pOd4fPFqLOB
         s67wjF0ENoKEhCmHKNwnUvHHJ27nBxCP6/qklQt89sJ3//BdHMnjEt3DlHjAqpzYu+qh
         FGg058wMdBWwxN5AEIr+eXAJHsT1qrotxiwvJsOYL93SyMI/Wg0mo/2kZBQTDE5XsQGo
         voB/QOhwbmF2JqvDrdBaHZgKQ1b9z5jW3zRdHbOjeAZnfiET8mZIcOZ7iH/jZLZIoJFp
         qYFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQOjCtaYCAfpNMg/cD2DWxQFw5iZyz15IUhjkrG4siGyE1OWC3AU4i4MYifY6PWS+qR2UqPfyViP0mZlg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+ig7QUrjO1jrsIJyBmYZGCl45Fr3hDeH5bCNJr3puSGm9rMZ
	/gPOi7+i+3juzkiGfJkeBQANs07SEmujV5xs+3VuYK3BYGIzUoZn5bVSdXlKwlevhd01/UHXYDM
	mAC4xtBfqoFdp2B/UTCCC+OQkRq6GdRYkspWsnLeBbIworBu48Y+zbajJoAfy5Mp7fXOXg4JPFZ
	sdwA==
X-Gm-Gg: ASbGncvI2ZKlEmh4ZNenXw1qXwgBj7xQcpajYDLCCzVThjZaqpYQNKPXl2rJ9ecaXO0
	bzyMBChaoJOuraKUtYrC7NcLVoC9a70rLAUw991hNx7/Thfd5M+OcJMfj0d0K3ERVbaMlcQQBks
	lUBU0t4tVvmduNKbDHOdtbEaDmPULi0rwtHblHmGvy7IQ0CFsDfl0eRE23simEfDNxLgPfX10aM
	AuZYreR4UyuqY1l5lOEH3/FWMSedWpHFhuBmpyuh+vj/38ox7+E2vwlLPA3eauJYqb+DTZP9KjH
	xWu+
X-Received: by 2002:a17:90b:5205:b0:2ee:dcf6:1c77 with SMTP id 98e67ed59e1d1-2f83abda2e7mr33880213a91.16.1738552351498;
        Sun, 02 Feb 2025 19:12:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdUAqSb7O1OOtO8vdivoSMayHR6jmuOzn90tYA7R8bTGKxxPWK9+U5BDDLz3EfLgCsko/Heg==
X-Received: by 2002:a17:90b:5205:b0:2ee:dcf6:1c77 with SMTP id 98e67ed59e1d1-2f83abda2e7mr33880182a91.16.1738552351109;
        Sun, 02 Feb 2025 19:12:31 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:30 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/10] gpio: aggregator: reorder functions to prepare for configfs introduction
Date: Mon,  3 Feb 2025 12:12:04 +0900
Message-ID: <20250203031213.399914-2-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203031213.399914-1-koichiro.den@canonical.com>
References: <20250203031213.399914-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder functions in drivers/gpio/gpio-aggregator.c to prepare for the
configfs-based interface additions in subsequent commits. Arrange the
code so that the configfs implementations will appear above the existing
sysfs-specific code, since the latter will partly depend on the configfs
interface implementations when it starts to expose the settings to
configfs.

The order in drivers/gpio/gpio-aggregator.c will be as follows:

* Basic gpio_aggregator/gpio_aggregator_line representations
* Common utility functions
* GPIO Forwarder implementations
* Configfs interface implementations
* Sysfs interface implementations
* Platform device implementations
* Module init/exit implementations

This separate commit ensures a clean diff for the subsequent commits.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 352 +++++++++++++++++----------------
 1 file changed, 178 insertions(+), 174 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 65f41cc3eafc..570cd1ff8cc2 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -61,180 +61,6 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 	return 0;
 }
 
-static int aggr_parse(struct gpio_aggregator *aggr)
-{
-	char *args = skip_spaces(aggr->args);
-	char *name, *offsets, *p;
-	unsigned int i, n = 0;
-	int error = 0;
-
-	unsigned long *bitmap __free(bitmap) =
-			bitmap_alloc(AGGREGATOR_MAX_GPIOS, GFP_KERNEL);
-	if (!bitmap)
-		return -ENOMEM;
-
-	args = next_arg(args, &name, &p);
-	while (*args) {
-		args = next_arg(args, &offsets, &p);
-
-		p = get_options(offsets, 0, &error);
-		if (error == 0 || *p) {
-			/* Named GPIO line */
-			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
-			if (error)
-				return error;
-
-			name = offsets;
-			continue;
-		}
-
-		/* GPIO chip + offset(s) */
-		error = bitmap_parselist(offsets, bitmap, AGGREGATOR_MAX_GPIOS);
-		if (error) {
-			pr_err("Cannot parse %s: %d\n", offsets, error);
-			return error;
-		}
-
-		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
-			error = aggr_add_gpio(aggr, name, i, &n);
-			if (error)
-				return error;
-		}
-
-		args = next_arg(args, &name, &p);
-	}
-
-	if (!n) {
-		pr_err("No GPIOs specified\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static ssize_t new_device_store(struct device_driver *driver, const char *buf,
-				size_t count)
-{
-	struct gpio_aggregator *aggr;
-	struct platform_device *pdev;
-	int res, id;
-
-	/* kernfs guarantees string termination, so count + 1 is safe */
-	aggr = kzalloc(sizeof(*aggr) + count + 1, GFP_KERNEL);
-	if (!aggr)
-		return -ENOMEM;
-
-	memcpy(aggr->args, buf, count + 1);
-
-	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
-				GFP_KERNEL);
-	if (!aggr->lookups) {
-		res = -ENOMEM;
-		goto free_ga;
-	}
-
-	mutex_lock(&gpio_aggregator_lock);
-	id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
-	mutex_unlock(&gpio_aggregator_lock);
-
-	if (id < 0) {
-		res = id;
-		goto free_table;
-	}
-
-	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, id);
-	if (!aggr->lookups->dev_id) {
-		res = -ENOMEM;
-		goto remove_idr;
-	}
-
-	res = aggr_parse(aggr);
-	if (res)
-		goto free_dev_id;
-
-	gpiod_add_lookup_table(aggr->lookups);
-
-	pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
-	if (IS_ERR(pdev)) {
-		res = PTR_ERR(pdev);
-		goto remove_table;
-	}
-
-	aggr->pdev = pdev;
-	return count;
-
-remove_table:
-	gpiod_remove_lookup_table(aggr->lookups);
-free_dev_id:
-	kfree(aggr->lookups->dev_id);
-remove_idr:
-	mutex_lock(&gpio_aggregator_lock);
-	idr_remove(&gpio_aggregator_idr, id);
-	mutex_unlock(&gpio_aggregator_lock);
-free_table:
-	kfree(aggr->lookups);
-free_ga:
-	kfree(aggr);
-	return res;
-}
-
-static DRIVER_ATTR_WO(new_device);
-
-static void gpio_aggregator_free(struct gpio_aggregator *aggr)
-{
-	platform_device_unregister(aggr->pdev);
-	gpiod_remove_lookup_table(aggr->lookups);
-	kfree(aggr->lookups->dev_id);
-	kfree(aggr->lookups);
-	kfree(aggr);
-}
-
-static ssize_t delete_device_store(struct device_driver *driver,
-				   const char *buf, size_t count)
-{
-	struct gpio_aggregator *aggr;
-	unsigned int id;
-	int error;
-
-	if (!str_has_prefix(buf, DRV_NAME "."))
-		return -EINVAL;
-
-	error = kstrtouint(buf + strlen(DRV_NAME "."), 10, &id);
-	if (error)
-		return error;
-
-	mutex_lock(&gpio_aggregator_lock);
-	aggr = idr_remove(&gpio_aggregator_idr, id);
-	mutex_unlock(&gpio_aggregator_lock);
-	if (!aggr)
-		return -ENOENT;
-
-	gpio_aggregator_free(aggr);
-	return count;
-}
-static DRIVER_ATTR_WO(delete_device);
-
-static struct attribute *gpio_aggregator_attrs[] = {
-	&driver_attr_new_device.attr,
-	&driver_attr_delete_device.attr,
-	NULL
-};
-ATTRIBUTE_GROUPS(gpio_aggregator);
-
-static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
-{
-	gpio_aggregator_free(p);
-	return 0;
-}
-
-static void __exit gpio_aggregator_remove_all(void)
-{
-	mutex_lock(&gpio_aggregator_lock);
-	idr_for_each(&gpio_aggregator_idr, gpio_aggregator_idr_remove, NULL);
-	idr_destroy(&gpio_aggregator_idr);
-	mutex_unlock(&gpio_aggregator_lock);
-}
-
 
 /*
  *  GPIO Forwarder
@@ -559,6 +385,170 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 }
 
 
+/*
+ * Sysfs interface
+ */
+static int aggr_parse(struct gpio_aggregator *aggr)
+{
+	char *args = skip_spaces(aggr->args);
+	char *name, *offsets, *p;
+	unsigned int i, n = 0;
+	int error = 0;
+
+	unsigned long *bitmap __free(bitmap) =
+			bitmap_alloc(AGGREGATOR_MAX_GPIOS, GFP_KERNEL);
+	if (!bitmap)
+		return -ENOMEM;
+
+	args = next_arg(args, &name, &p);
+	while (*args) {
+		args = next_arg(args, &offsets, &p);
+
+		p = get_options(offsets, 0, &error);
+		if (error == 0 || *p) {
+			/* Named GPIO line */
+			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
+			if (error)
+				return error;
+
+			name = offsets;
+			continue;
+		}
+
+		/* GPIO chip + offset(s) */
+		error = bitmap_parselist(offsets, bitmap, AGGREGATOR_MAX_GPIOS);
+		if (error) {
+			pr_err("Cannot parse %s: %d\n", offsets, error);
+			return error;
+		}
+
+		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
+			error = aggr_add_gpio(aggr, name, i, &n);
+			if (error)
+				return error;
+		}
+
+		args = next_arg(args, &name, &p);
+	}
+
+	if (!n) {
+		pr_err("No GPIOs specified\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static ssize_t new_device_store(struct device_driver *driver, const char *buf,
+				size_t count)
+{
+	struct gpio_aggregator *aggr;
+	struct platform_device *pdev;
+	int res, id;
+
+	/* kernfs guarantees string termination, so count + 1 is safe */
+	aggr = kzalloc(sizeof(*aggr) + count + 1, GFP_KERNEL);
+	if (!aggr)
+		return -ENOMEM;
+
+	memcpy(aggr->args, buf, count + 1);
+
+	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
+				GFP_KERNEL);
+	if (!aggr->lookups) {
+		res = -ENOMEM;
+		goto free_ga;
+	}
+
+	mutex_lock(&gpio_aggregator_lock);
+	id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
+	mutex_unlock(&gpio_aggregator_lock);
+
+	if (id < 0) {
+		res = id;
+		goto free_table;
+	}
+
+	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, id);
+	if (!aggr->lookups->dev_id) {
+		res = -ENOMEM;
+		goto remove_idr;
+	}
+
+	res = aggr_parse(aggr);
+	if (res)
+		goto free_dev_id;
+
+	gpiod_add_lookup_table(aggr->lookups);
+
+	pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
+	if (IS_ERR(pdev)) {
+		res = PTR_ERR(pdev);
+		goto remove_table;
+	}
+
+	aggr->pdev = pdev;
+	return count;
+
+remove_table:
+	gpiod_remove_lookup_table(aggr->lookups);
+free_dev_id:
+	kfree(aggr->lookups->dev_id);
+remove_idr:
+	mutex_lock(&gpio_aggregator_lock);
+	idr_remove(&gpio_aggregator_idr, id);
+	mutex_unlock(&gpio_aggregator_lock);
+free_table:
+	kfree(aggr->lookups);
+free_ga:
+	kfree(aggr);
+	return res;
+}
+
+static DRIVER_ATTR_WO(new_device);
+
+static void gpio_aggregator_free(struct gpio_aggregator *aggr)
+{
+	platform_device_unregister(aggr->pdev);
+	gpiod_remove_lookup_table(aggr->lookups);
+	kfree(aggr->lookups->dev_id);
+	kfree(aggr->lookups);
+	kfree(aggr);
+}
+
+static ssize_t delete_device_store(struct device_driver *driver,
+				   const char *buf, size_t count)
+{
+	struct gpio_aggregator *aggr;
+	unsigned int id;
+	int error;
+
+	if (!str_has_prefix(buf, DRV_NAME "."))
+		return -EINVAL;
+
+	error = kstrtouint(buf + strlen(DRV_NAME "."), 10, &id);
+	if (error)
+		return error;
+
+	mutex_lock(&gpio_aggregator_lock);
+	aggr = idr_remove(&gpio_aggregator_idr, id);
+	mutex_unlock(&gpio_aggregator_lock);
+	if (!aggr)
+		return -ENOENT;
+
+	gpio_aggregator_free(aggr);
+	return count;
+}
+static DRIVER_ATTR_WO(delete_device);
+
+static struct attribute *gpio_aggregator_attrs[] = {
+	&driver_attr_new_device.attr,
+	&driver_attr_delete_device.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(gpio_aggregator);
+
+
 /*
  *  GPIO Aggregator platform device
  */
@@ -616,6 +606,20 @@ static struct platform_driver gpio_aggregator_driver = {
 	},
 };
 
+static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
+{
+	gpio_aggregator_free(p);
+	return 0;
+}
+
+static void __exit gpio_aggregator_remove_all(void)
+{
+	mutex_lock(&gpio_aggregator_lock);
+	idr_for_each(&gpio_aggregator_idr, gpio_aggregator_idr_remove, NULL);
+	idr_destroy(&gpio_aggregator_idr);
+	mutex_unlock(&gpio_aggregator_lock);
+}
+
 static int __init gpio_aggregator_init(void)
 {
 	return platform_driver_register(&gpio_aggregator_driver);
-- 
2.45.2

