Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3121213252
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000255; cv=none; b=IdhKTdht3Jj8S8MbaUfKOVZpDyoV3rn/o9lZMtDrC33SrCVNA6NjgjMAVxqP6vAEe5fIYw7H4AyWsROTYbrLztIZi5GAi/+msW1RiRVl7WdWC3/H5VB8tBci1/L8y9c5lLjTQ3aisFpSBm31U0JvpmpY+paDzdV9sDAuaCDMTk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000255; c=relaxed/simple;
	bh=PF2bzENyixS725vuRFQYOE0EHw2Blz1UgA3yYSWEqBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdTbbJU6De1ElX7sru+liPtIfWxNjl1KJ42iuis+7VRkM0xMoB+oaAIOusfI+30SQjLPffhmxbfkv6QwtT+rolEysBsNfgRFRMBRdj5fIHVguIQf1Jwlq8Dxkr0gSOETH+9CvASROeNid5yCkvq/nGeSfFf7sdNOGKIOnXD8fr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=k3y/qy4p; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="k3y/qy4p"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4DCB43F342
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000252;
	bh=qMmf8wsuaV2g3eTzKbfqc83zqOBY3dNWVYTFEe1i+UA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=k3y/qy4pg9PYawuAqdOjsS8SAPqy7VZMLM62doww/RyNLngIFMAA7Uxvlb8Sk7Eus
	 /fNEC/pT5nuYJ25EGthFw4f+B+oMS1281p2DvNXMgr7ME2tHBY5uSukLfoHr2qhjfm
	 7aOKxOXXPTBYar8SwRSQHRnKy/dfTQuqlwPSirrffzAVdJSf+TEi54TXxf7buyILbv
	 s+WhhouNHGb7Z5YTGs98tQYtOWSLbJDyOf98LSDbeJ0Yaqb11kWyT5r1gMBzDojLgt
	 AC9vXeF1uVid0+rs8ohFx3KkzlaxC+JS9gZqI9qc5c9BqFVx9mvC3WKlivPLTTD1oi
	 fF2OykIYkc5uQ==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22647ff3cf5so33698675ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 21:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000251; x=1744605051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMmf8wsuaV2g3eTzKbfqc83zqOBY3dNWVYTFEe1i+UA=;
        b=rMYUbdCq0c6gLjJK41xzNyX7wqrnOY3t4BIV+chtdyhBbXwUw4I2G8KDK9w7V9JqSw
         f3ViNEgp/p02FTFSvL14bpNs+jd4/WBDelZPWv0ZRWYmJjen+u1MSDcmZmw5KLiaKy97
         1xNxHZz6rgcLSC5mf2aVn4ew0r7Ja6gfQLgAEph95RVsmhqb9gqzmbadpMJ9EX+CpFV0
         07bUtBWuG/F3bW61Kc/pOJqvTSZx9rKd8R/rm0BXFiy4tYjXTS3Zj47dfJ/Ua8nZayy4
         wPwMafPuKo4soYoDXFkezQBwwg2LyX/5tTeh+e/fFwLPqi+Jjg6urAuYxbETGyxurxW2
         xWjg==
X-Forwarded-Encrypted: i=1; AJvYcCU1Pvt4/d7QtPhviDrAVGLIMFsTF+DVU2n3K0qmK0fiW8ISz29tuEZ4Dp4BfWoa2LAPnv8gy2Zf5GVbeJw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/q8Ypf23tlrTJS1N4bVhYfY3aVuTliAMmXYvrAbVOpSAvCUE
	1IwNfV9jxPmbIdkBWsFxgEI06gJpm9Ydd925giXTDFiCYA4xN86b7LxTRnTuBdkD1ahfW+W11ph
	uEZEMT2JsLgbGcS/FnHgpSbmNcKgEIJw3NBUFuT2z+bgtkGJRVJct6YvSJWZgNI7iqQzGMd8j98
	jrZw==
X-Gm-Gg: ASbGncu06vpUNzjo4kT7wduwpDQo0BAfHKk+WNrWCCemrF0xaCCk1aP70xjQL4AsUW9
	CcKGC+oQX4I6UqZrosStNtfHB/8tvZYjYww5Y++3KjgvfWrcWSUb6+VS5IOBEKkOqZ6RUagSRr2
	EaOeYzKoo1lwwSNhhJq/jA+5y6QcanT0nEIxj7rW+j4jYAk0KVx5BiOV822pklqafXwzzY5PZr8
	k19KXHafOc/2TdisRhvA+J1BtR1dZ5O9mK0L2cpkrjXaMKFnfi+KgR9/XF1lDh2FdhXD6LdZ6uc
	0ZsHnF8eawyzq4R4WqGlHcS9ldFB87h+SA==
X-Received: by 2002:a17:902:e842:b0:224:c46:d167 with SMTP id d9443c01a7336-22a9552acdemr101661825ad.16.1744000250898;
        Sun, 06 Apr 2025 21:30:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiLDy5RBiDIAPrY/hDRGYzyILeWDPk5r2DHuhwaOj5ikPWcDHSqAyhxm5S1PqpppxhOfeQgQ==
X-Received: by 2002:a17:902:e842:b0:224:c46:d167 with SMTP id d9443c01a7336-22a9552acdemr101661535ad.16.1744000250532;
        Sun, 06 Apr 2025 21:30:50 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:30:50 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/9] gpio: aggregator: unify function naming
Date: Mon,  7 Apr 2025 13:30:12 +0900
Message-ID: <20250407043019.4105613-3-koichiro.den@canonical.com>
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

Unify function names to use gpio_aggregator_ prefix (except GPIO
forwarder implementations, which remain unchanged in subsequent
commits). While at it, rename the pre-existing gpio_aggregator_free() to
gpio_aggregator_destory(), since that name will be used by new
alloc/free functions introduced in the next commit, for which the name
is more appropriate.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 37 ++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index e026deb4ac64..ff5cd5eaa550 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -42,8 +42,8 @@ struct gpio_aggregator {
 static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
 static DEFINE_IDR(gpio_aggregator_idr);
 
-static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
-			 int hwnum, unsigned int *n)
+static int gpio_aggregator_add_gpio(struct gpio_aggregator *aggr,
+				    const char *key, int hwnum, unsigned int *n)
 {
 	struct gpiod_lookup_table *lookups;
 
@@ -398,7 +398,7 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 /*
  * Sysfs interface
  */
-static int aggr_parse(struct gpio_aggregator *aggr)
+static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
 	char *name, *offsets, *p;
@@ -417,7 +417,7 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 		p = get_options(offsets, 0, &error);
 		if (error == 0 || *p) {
 			/* Named GPIO line */
-			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
+			error = gpio_aggregator_add_gpio(aggr, name, U16_MAX, &n);
 			if (error)
 				return error;
 
@@ -433,7 +433,7 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
-			error = aggr_add_gpio(aggr, name, i, &n);
+			error = gpio_aggregator_add_gpio(aggr, name, i, &n);
 			if (error)
 				return error;
 		}
@@ -449,8 +449,8 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 	return 0;
 }
 
-static ssize_t new_device_store(struct device_driver *driver, const char *buf,
-				size_t count)
+static ssize_t gpio_aggregator_new_device_store(struct device_driver *driver,
+						const char *buf, size_t count)
 {
 	struct gpio_aggregator *aggr;
 	struct platform_device *pdev;
@@ -490,7 +490,7 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 		goto remove_idr;
 	}
 
-	res = aggr_parse(aggr);
+	res = gpio_aggregator_parse(aggr);
 	if (res)
 		goto free_dev_id;
 
@@ -523,9 +523,10 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 	return res;
 }
 
-static DRIVER_ATTR_WO(new_device);
+static struct driver_attribute driver_attr_gpio_aggregator_new_device =
+	__ATTR(new_device, 0200, NULL, gpio_aggregator_new_device_store);
 
-static void gpio_aggregator_free(struct gpio_aggregator *aggr)
+static void gpio_aggregator_destroy(struct gpio_aggregator *aggr)
 {
 	platform_device_unregister(aggr->pdev);
 	gpiod_remove_lookup_table(aggr->lookups);
@@ -534,8 +535,8 @@ static void gpio_aggregator_free(struct gpio_aggregator *aggr)
 	kfree(aggr);
 }
 
-static ssize_t delete_device_store(struct device_driver *driver,
-				   const char *buf, size_t count)
+static ssize_t gpio_aggregator_delete_device_store(struct device_driver *driver,
+						   const char *buf, size_t count)
 {
 	struct gpio_aggregator *aggr;
 	unsigned int id;
@@ -559,15 +560,17 @@ static ssize_t delete_device_store(struct device_driver *driver,
 		return -ENOENT;
 	}
 
-	gpio_aggregator_free(aggr);
+	gpio_aggregator_destroy(aggr);
 	module_put(THIS_MODULE);
 	return count;
 }
-static DRIVER_ATTR_WO(delete_device);
+
+static struct driver_attribute driver_attr_gpio_aggregator_delete_device =
+	__ATTR(delete_device, 0200, NULL, gpio_aggregator_delete_device_store);
 
 static struct attribute *gpio_aggregator_attrs[] = {
-	&driver_attr_new_device.attr,
-	&driver_attr_delete_device.attr,
+	&driver_attr_gpio_aggregator_new_device.attr,
+	&driver_attr_gpio_aggregator_delete_device.attr,
 	NULL
 };
 ATTRIBUTE_GROUPS(gpio_aggregator);
@@ -632,7 +635,7 @@ static struct platform_driver gpio_aggregator_driver = {
 
 static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
 {
-	gpio_aggregator_free(p);
+	gpio_aggregator_destroy(p);
 	return 0;
 }
 
-- 
2.45.2

