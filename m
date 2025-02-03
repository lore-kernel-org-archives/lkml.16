Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2192B4AEE2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552372; cv=none; b=fuCQc/rHAhlUwtjVRs7/rGeCVEpWXV4oE3nJ8Sv/6y294bsxPqM2IpY5JeC7rA7QJgWt6mNt4YGUQajyIjxHxrlcZRzMPpeajBPIuzyBcMVpOEdFaMl3/xQC7bHPbP/e62WTZ370zZjIhb1geTol61OpBhTFbQtwhvVAB/VK9ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552372; c=relaxed/simple;
	bh=jV+jwZ3dWM5g4zw7mjTrTOxRCXIjes+onPJQRvv+msw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrcqsyXH5+8Nhj3IfHsJA51uD3NzNAT25Rmqx3xsIuIa1q5wU6Sc9mex5sVtVZh15uVi5vn+clZQShtjTti7QiJNLTljN6TOfdEHei2+CX85SzDCN1iaMFMout22UWZM1QDYqiycjjgRZIuRbwmpkPnWt3aB+K9iYbRgJwp80SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=e5Uls2tD; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="e5Uls2tD"
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 89E733F171
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552369;
	bh=6DyFq6mV+BC29vN7qARZVdw28cmkBRh6T6+ETTGMoGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=e5Uls2tDkV5lQf1oGGuG4+ntIRW3qyI5x7Z6zGD9WW4Mbppu7O8AOJlOOUmC83ZZi
	 NQXmhW+vSo0P73PjgBhKeD0WyU/tq4JsQju/IbDOfBb1gP1zgy5l0jZlZbDfjC8K1z
	 LHkjmNdJE+psjxgh54ejM5wRdohVQj11x0LaW+tbBX0Z9lBPskbTAc6ZB3bi78IUxn
	 P8dpj13+WBlSq8Jdn9eDoUtjOLaDL1Glvxeq9TzqIMnkCEcmCUwOnqpHuTH/SCOZ9v
	 OF4VaIfSnFLtSePns2oYnplCzDLFGBv38+cHSqHISDcehtiKsZHKbBJ6NFdW30SZDA
	 5mvpBc3cxEO1w==
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so11147291a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:12:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552368; x=1739157168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DyFq6mV+BC29vN7qARZVdw28cmkBRh6T6+ETTGMoGQ=;
        b=gEMllU5l1eIC+UrXviKTVau6DyCEvdYKWnPmxB6ipCXYKNRlGHGh5d6EuB0b9ZEtJu
         5gl9qqgRjIrJPqeHHTd+fWowaApeILpmeD9hz/oVc6l6OIjo3++Go1aUmUkAMYneSY1m
         L3qYxrmF9SYQXKraBaez8WndBNbXDgITP9I9sWaO5LlVLEtRt57tgri9qm1EjPHbUS3A
         JhbBP+B/VmQH8lWkV21QsUOUwFYyjvNuddXXrvy/B+xHZFlM0cAH1mlb5GwarUkrmFzX
         j9Dx4TnqllR5ySoe3muW/RfIy39BVrGKLjkGKxM78T998FtAXS9VHP/xzQyVA6ufrDHh
         Ndlw==
X-Forwarded-Encrypted: i=1; AJvYcCVS85gMDHw5WrrxjGFN+JvQxsIcbqjJVXmxSemnbziy54Vca0vlV7pnJsYTfj749IUqlceTljHeGIxBLBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzjF7TVZa2RqCKpekWL24/MG8kygAjSU91txGmktKdUl4Lhy/T
	3KxorDRJecxycIQr90c9Jm/LKYnD2vcCThWDUHZ2Pxbq7JRTAxrLfzYxxzeNtzNr4R7UQpQri2w
	Ei1MapuC8MV6aWCLTIejdjcIqVupAgZ9e/EOUjZrulOxOarFH0E5sYJnR392m0NTph1OkDnGNgc
	YwLg==
X-Gm-Gg: ASbGncs1Ha60V9j91j87CCnrMiMhSQy0a9cYRKxhDobhEgAeuhzt0QuwRYujacUsdo6
	5Q1Y+4T+ZZWOf8yZvrtFgnZrtm8C31XbYl1KtD0xPQLPHdkriXs3HmqG9RUbjxk0vsY+IO8qhp/
	5CefudqNLUtxCOAhnfXmLPWbqoml6VSMXyMv1HvjflS5nPiQc9ARRTf9JKruM93/NKSgrd/kuhE
	alXhjGI+JATFt4tFk/85n5jK6UufD9Ou91wqYaFjf0mOZKjCS1o8fpS5S8iy0UGYoov/N0RQHS2
	NVaw
X-Received: by 2002:a17:90a:c88e:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-2f83aba9d18mr28008913a91.3.1738552367978;
        Sun, 02 Feb 2025 19:12:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzG+WvmWiYepWaFCOO88/K5IDS+0Hn9mfJmyS1XrTAE8a8vQnuxwP07j83XMT180bDYT7duA==
X-Received: by 2002:a17:90a:c88e:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-2f83aba9d18mr28008897a91.3.1738552367679;
        Sun, 02 Feb 2025 19:12:47 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:47 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] gpio: aggregator: clean up gpio_aggregator_free()
Date: Mon,  3 Feb 2025 12:12:10 +0900
Message-ID: <20250203031213.399914-8-koichiro.den@canonical.com>
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

- Rename gpio_aggregator_free() to use the "aggr_" prefix for
  consistency with other functions that modify struct gpio_aggregator
  internals.
- Replace four lines within the function to invoke aggr_deactivate()
- Move it to a more natural location.

This is a preparatory change for the next commit.

No functional change.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 123906c821b1..d5fd9fe58164 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1092,6 +1092,12 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 	return 0;
 }
 
+static void aggr_free(struct gpio_aggregator *aggr)
+{
+	aggr_deactivate(aggr);
+	kfree(aggr);
+}
+
 static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 				size_t count)
 {
@@ -1160,15 +1166,6 @@ static ssize_t new_device_store(struct device_driver *driver, const char *buf,
 
 static DRIVER_ATTR_WO(new_device);
 
-static void gpio_aggregator_free(struct gpio_aggregator *aggr)
-{
-	platform_device_unregister(aggr->pdev);
-	gpiod_remove_lookup_table(aggr->lookups);
-	kfree(aggr->lookups->dev_id);
-	kfree(aggr->lookups);
-	kfree(aggr);
-}
-
 static ssize_t delete_device_store(struct device_driver *driver,
 				   const char *buf, size_t count)
 {
@@ -1189,7 +1186,7 @@ static ssize_t delete_device_store(struct device_driver *driver,
 	if (!aggr)
 		return -ENOENT;
 
-	gpio_aggregator_free(aggr);
+	aggr_free(aggr);
 	return count;
 }
 static DRIVER_ATTR_WO(delete_device);
@@ -1261,7 +1258,7 @@ static struct platform_driver gpio_aggregator_driver = {
 
 static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
 {
-	gpio_aggregator_free(p);
+	aggr_free(p);
 	return 0;
 }
 
-- 
2.45.2

