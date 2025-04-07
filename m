Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16DB1922F5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000254; cv=none; b=keVUDsbTh997Uimaujid+15PQhLdUNeiXb2eCBQ8WtNJccoTyWiPPuoiVxwQulpIMoujVVWEVc0G7IcvUX+vKQWyszrLYxHSLqWfXB8sBx+LNvnKvmhQACmXj3LB5BykPanraCVGh1afCTgPw8+VH5LmVANRypRCTqW88oj2bsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000254; c=relaxed/simple;
	bh=QKzGBY006K35i0VUre3m/YXkXfWXlIbWjW5345Q28Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GplSkOyvSOnuLOZuaEwt1jt2TanMWvyDrdRKnKhsV8WoyXiTFnjGZ1luv8DcODOIUC/Onrm5zLzJMif9VJ19F898l2+6smMhn9SY5nZFcr/qABgX7TdluQRmeaDXBQXL8JIsVShs6W6TNI2X+1YUxy+sw55wYVTH3VMJHh0pVME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=fMzQk41s; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="fMzQk41s"
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2AC4E3F2C2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000250;
	bh=gYD77nW/waFXgRcL7RZiNMF3p8f4KzCk7t7Ss3jccwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=fMzQk41swGRDZD0MT87hwrqv1i54OXC/JJllHQjlkze4HE84L8ygzSgyQrI8S7eAE
	 w8os78ofofQfec13yMiCqlLI239LFTb9OuJinjD+2ct7PkadCoUIl99nQy9wA81Zy5
	 pO7u6NJ+WamF+BNgyDmK2GWQC3S1x/D/hIaqw4hFTzgmkeGrDiZEvYl027fWOE7sca
	 VIbEccG9Kc1nuPP1l7lyFpGR3F0PiwpD2gPXGnz4wDLems4W79DpDl9ZoLgmMB+XAs
	 3noBlKl2TCxLMfmGpiZKx8UINdAqbvFy0TNh/dXuCxfgAJ37TSA+bnUYyOcn+sh49B
	 PFtlWKoNYt+wQ==
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af8a4410816so3164740a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 21:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000249; x=1744605049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYD77nW/waFXgRcL7RZiNMF3p8f4KzCk7t7Ss3jccwc=;
        b=DUumhijiFiPTveUubpBbVlrIcjXmSTQsCQwh7PU6NAxmBVJ3rEeVM8ghz1e/aZdtZ8
         YL+17d6X0wCGdworkUtgsStI25Rktw7wGzz8ipz9qxht37HwtZd2c0ShsBMT3VMOHKQG
         FaZIIobnIEgGhkn2h++iebYzEzerv4Fyce3gA3askXlghmQyNH6CYPDNASImKuIN2vWk
         4/aMyybTkTI+BW73DUMB30xLQhG2fnpf5TPg0xqeggdWq8RnkXnmaP9vtcnHr5CPSCAI
         xF26D4WkyEmIihJgFcIsPpTZ7vYhKIZ1efQs/Crh5IwqYu5F9D6a+iJVMlh1gWdkMtyt
         t12g==
X-Forwarded-Encrypted: i=1; AJvYcCUPpiTYEUykoNPHfl8L63Q0FG6ntoIvW3lhxcA1IwQov7bs6FCSCt5COKXTUuPApkcaxhbVxrEpUISz9BU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwWSsaPVe5oTpfZYbnJV2n1vXRSR7ozQ64WAbmfZ3mvjRmFmcq
	5i6m1qKpUVK1pgkITZTHUeE11vqiLN2XQ1LnAYFlXpCmkDddvBS6hxXzImasfFHzaTgq3mLxott
	R3CzFBUEg9GgxE8PzN5VL+I23R1UrpR6GBzan3qPSXzh/H81Wl4IQE3Saw+PVh+8z1OrtbWuZf+
	btZA==
X-Gm-Gg: ASbGncuLsLA+Xz7YHGQdXYXvC701MKMONQ2+nT4FetOXv3LsVVaR/VnbjjB4TbKG27K
	BtaHjwixlPyzk/OEnudZ2sFVDYI4mSH1iDCOGkyfM/2ogq+3lzXBqxGWDDLeD+ko8oXcLPRhrj+
	HWGrX8Y78fjuD7C6aBKdWxFgj7ii4mvvlIwFKtEEVMOZ5/VOroYIERWNhl4f7WH3nA1JU5ARj1/
	6i1i0N0dByyO9J60rQs1aHGB7vF3FJ66DHpFiXfoTxkfE1WitnFsGspLLW99pqxbqUUpV97GT8u
	Ak5Z0MLbV3bjA4DNHQq0BIc55XrCbC5LPA==
X-Received: by 2002:a17:902:d491:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22a95573902mr122824825ad.38.1744000248624;
        Sun, 06 Apr 2025 21:30:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRt1TZZiQKo9HcnEyiDo2yBUyjoUApiYat4HpGVsubxyL9kQHP3eAQ5W3KlqnK1ubECzk5qg==
X-Received: by 2002:a17:902:d491:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22a95573902mr122824555ad.38.1744000248309;
        Sun, 06 Apr 2025 21:30:48 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:30:48 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/9] gpio: aggregator: reorder functions to prepare for configfs introduction
Date: Mon,  7 Apr 2025 13:30:11 +0900
Message-ID: <20250407043019.4105613-2-koichiro.den@canonical.com>
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 380 +++++++++++++++++----------------
 1 file changed, 192 insertions(+), 188 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index d232ea865356..e026deb4ac64 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -61,194 +61,6 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
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
-	if (!try_module_get(THIS_MODULE))
-		return -ENOENT;
-
-	/* kernfs guarantees string termination, so count + 1 is safe */
-	aggr = kzalloc(sizeof(*aggr) + count + 1, GFP_KERNEL);
-	if (!aggr) {
-		res = -ENOMEM;
-		goto put_module;
-	}
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
-	module_put(THIS_MODULE);
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
-put_module:
-	module_put(THIS_MODULE);
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
-	if (!try_module_get(THIS_MODULE))
-		return -ENOENT;
-
-	mutex_lock(&gpio_aggregator_lock);
-	aggr = idr_remove(&gpio_aggregator_idr, id);
-	mutex_unlock(&gpio_aggregator_lock);
-	if (!aggr) {
-		module_put(THIS_MODULE);
-		return -ENOENT;
-	}
-
-	gpio_aggregator_free(aggr);
-	module_put(THIS_MODULE);
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
@@ -583,6 +395,184 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
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
+	if (!try_module_get(THIS_MODULE))
+		return -ENOENT;
+
+	/* kernfs guarantees string termination, so count + 1 is safe */
+	aggr = kzalloc(sizeof(*aggr) + count + 1, GFP_KERNEL);
+	if (!aggr) {
+		res = -ENOMEM;
+		goto put_module;
+	}
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
+	module_put(THIS_MODULE);
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
+put_module:
+	module_put(THIS_MODULE);
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
+	if (!try_module_get(THIS_MODULE))
+		return -ENOENT;
+
+	mutex_lock(&gpio_aggregator_lock);
+	aggr = idr_remove(&gpio_aggregator_idr, id);
+	mutex_unlock(&gpio_aggregator_lock);
+	if (!aggr) {
+		module_put(THIS_MODULE);
+		return -ENOENT;
+	}
+
+	gpio_aggregator_free(aggr);
+	module_put(THIS_MODULE);
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
@@ -640,6 +630,20 @@ static struct platform_driver gpio_aggregator_driver = {
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

