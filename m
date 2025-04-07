Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA7922258C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744000263; cv=none; b=espxNuwXom88n9e8WY/dgdIRqFKbxYDVRq8GtR+1Or6xR0VMY3tJ5UPc09ToAySHyMCKK7C3+xV6mocBn83Blv4fb3vt8uk312dtQGqE9t14+ujYEem+6t0Jv7WgymXKbSLsqVSD4/euATroJrGTwRMPw9LWBu+LrR2CoUo0dUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744000263; c=relaxed/simple;
	bh=topjyXl8cfmVC2wwnmz9rv1A6nyhahSaPg2JtNji6lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tpk5L5iJPHJoXX0W/SAhhhuQZzDvvTWsafP1tVwA2a/K8ecR01d3L7ItNrMklHbeRZEMDNAlqmoopMCHBsXpLC+6q/XsyR6Wby1YNqi6i2q1CUybH9OOVOzOuTR4tBdk8DtD5Doqq2K1gEIxkrOMIWiTq2MDO7J1kQ6RqVTB+yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=LBPY3WHJ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LBPY3WHJ"
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5C2E43F287
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 04:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744000259;
	bh=JN2InJzY9fip1rzot+r5SY6hkXxBlsffh5kl0Mfv5JI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=LBPY3WHJdVkXWqtvLgTGv4McIMBqZg3tQiVla209NiMLeT/CBJnBAVAga8HoARSad
	 zlQ/GDfc2lr+ji11vzXC3AW5rWRVAlnhP/dkB6mD8+gnypWUgqwyQTUNfEz0AKvege
	 fBRP7dY3HY0PbFCZdht2QRlB0CZvE1jyJwU7hWqsKOG6vifiAGUwR1DcjjUIQwdlJn
	 vVghKLALleMc+1Jgdz9lMmWcsphwKP1WFhNWOx6CA2sW0wq50hByiaidXey8MkEivm
	 MJEcRAaxbYyUMe9wSP7Z3QPfIrkXOPfEZI0m6+MhJZAzYXUzfqL4tdPP6KTyFCss6i
	 PVeMeqx1oJ5jw==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-225107fbdc7so33203375ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 21:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744000257; x=1744605057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN2InJzY9fip1rzot+r5SY6hkXxBlsffh5kl0Mfv5JI=;
        b=JVYDJ1qS0HwWAHdVU7+oumSVvkU6yPA8iIJ4e/Q+VZt3S6gyFKEKpBaqcTdw2N42YN
         LToWnu8MPQ6VsfOzeJuGSCmnnAu31cD0xRIB2wZVMhqgsxDZl7C9HGuPSr4RAJSL6Miw
         ue2Buc6dJcs2Rnbs6HzP+YIqr8p10R2jG10DBB/UUhgjj0Za7TE3Mjpf88Zxbi0CMm2m
         74KlC+j2361s/dEA/s2YCaqp65C1AKy7qrvw0O2OZJ1VC3f/UCUZmj0knWSbOJA0jNzu
         qUI9C+izRjZHpGKhBTNZOF68Dp2EW4t61kG7GAmcQnTJOwnrSA2Dise10HVy1geJiBmy
         LtLg==
X-Forwarded-Encrypted: i=1; AJvYcCVAEED1lSbQoCn73kVUteNnpTURmKDzPaPkBy3UxKqqWyMQSqw0w1z5vx4cy2ptaZ2wJIFJO5olPrc7jkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXPHxTuoTO0T/YB64HgAy+6InA++3ykIfotj+q1LWEjzIC33yd
	D22OOHyz65Bsi9TkJjVfyrTVNOGBE+5ZYr8IJYrGtGuvisGFjPnqci09cd0f1Y2FCssqkATDes1
	cgb1+vKTb18LFxkc2eQlpG7mLAtSs/OQ/cCuWcZYx/i6HvJtm5mp53C0ohwSxcPyo5hAjXmS5so
	VOXg==
X-Gm-Gg: ASbGncvbGr3IB09wF1C5LVmPDyCdsd7hcpLE3lunSW11ivtOmCJiaxXGPJsn91SlqQO
	S3yc5pVlvZY096TzJ06E13XnTT3fS9bG5CjfEmBdRsMK2LZPPyCCWJ7QbE7bAmTfXh0BBXIRezr
	pVGWn8N96kOWwJBIilCU9TD+RtsSR/NT1M7KdrL3jbE8eSp0zMfGeJhoANpP89mqSHzB02NRpNk
	Dfvin5qOe0LnSX20k3YQSEP33ogQfV5R/LXggFJqt/k8X1zCfI0fr0o/QVogYN+GwL+Cje/AtTT
	6WP6MAdH+vIgAFGN2shZW9S053HFfrUrQQ==
X-Received: by 2002:a17:903:1948:b0:224:a74:28cd with SMTP id d9443c01a7336-22a8a87d03fmr152760885ad.31.1744000257304;
        Sun, 06 Apr 2025 21:30:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMJeKHzvUbt+AOJlfEZJCfM9kHhfstRNImHDDwMKHZqjXIMCC7cuk6cmuwqUav1kWPUQTDcQ==
X-Received: by 2002:a17:903:1948:b0:224:a74:28cd with SMTP id d9443c01a7336-22a8a87d03fmr152760695ad.31.1744000257046;
        Sun, 06 Apr 2025 21:30:57 -0700 (PDT)
Received: from localhost.localdomain ([240f:74:7be:1:5985:1f8b:863f:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22978670dbbsm70839525ad.209.2025.04.06.21.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:30:56 -0700 (PDT)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/9] gpio: aggregator: rename 'name' to 'key' in gpio_aggregator_parse()
Date: Mon,  7 Apr 2025 13:30:15 +0900
Message-ID: <20250407043019.4105613-6-koichiro.den@canonical.com>
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

Rename the local variable 'name' in gpio_aggregator_parse() to 'key'
because struct gpio_aggregator_line now uses the 'name' field for the
custom line name and the local variable actually represents a 'key'.
This change prepares for the next but one commit.

No functional change.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index d1c837f00ffe..2d8a7019b75e 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -998,7 +998,7 @@ static struct configfs_subsystem gpio_aggregator_subsys = {
 static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 {
 	char *args = skip_spaces(aggr->args);
-	char *name, *offsets, *p;
+	char *key, *offsets, *p;
 	unsigned int i, n = 0;
 	int error = 0;
 
@@ -1007,18 +1007,18 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 	if (!bitmap)
 		return -ENOMEM;
 
-	args = next_arg(args, &name, &p);
+	args = next_arg(args, &key, &p);
 	while (*args) {
 		args = next_arg(args, &offsets, &p);
 
 		p = get_options(offsets, 0, &error);
 		if (error == 0 || *p) {
 			/* Named GPIO line */
-			error = gpio_aggregator_add_gpio(aggr, name, U16_MAX, &n);
+			error = gpio_aggregator_add_gpio(aggr, key, U16_MAX, &n);
 			if (error)
 				return error;
 
-			name = offsets;
+			key = offsets;
 			continue;
 		}
 
@@ -1030,12 +1030,12 @@ static int gpio_aggregator_parse(struct gpio_aggregator *aggr)
 		}
 
 		for_each_set_bit(i, bitmap, AGGREGATOR_MAX_GPIOS) {
-			error = gpio_aggregator_add_gpio(aggr, name, i, &n);
+			error = gpio_aggregator_add_gpio(aggr, key, i, &n);
 			if (error)
 				return error;
 		}
 
-		args = next_arg(args, &name, &p);
+		args = next_arg(args, &key, &p);
 	}
 
 	if (!n) {
-- 
2.45.2

