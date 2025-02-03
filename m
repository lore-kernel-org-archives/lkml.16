Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D111D88A6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552378; cv=none; b=uCiVJRO5FBcnOjnAmtpCX1pAI6MRgn1VEKkEcQMunxqGieBhin1SBHCZraTrXVrGcED8ka2gSrOVAS/GcvKW72hVqQDqPk0FVEzYJT1jrDSEVjL19P2ta0H2PtfhPgntd4N1uXAuj5PybKE7zy0g3p4z3VENi893lNDbLftZRLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552378; c=relaxed/simple;
	bh=xO8cH1CFMF4UXApKu8/ysA04MUGZtHuGSgRmuumTW8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1ygrkMZeO+kdn4uCJbFK5+6KYvDGjLhY7CjWXH3kAche/yD1N2OPDA/U+zn6vXK3LzCBYzJuZnxcx1n/oMXuqYAZDJ/zrU9VNtKaljigGLGkre2JUA9nOinyjoX8/lmEnSi1TqdUEXCZvqJDYO+a7nM+obcPMO9WMi2DirFR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=qyrkX7SN; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="qyrkX7SN"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 720DB3F84C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552375;
	bh=Q1KkqwEQeDF8kvWjV8IZaCfD/CB9EQIzfOrcms/yLv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=qyrkX7SNiG5+UBZmg2m0u+J4XRBZxR+mhq3gnud1m4LmekLgOR6Wh642RlPrEnc4o
	 5URDZ3TvcIv7rKZNktJpePqsHmWx0EAP68A96p2Jlfm7+ljulNKaC7UEfZrBR5r4BD
	 hgypIHwnRLCD+m62CuB5SuDJnawGpQFDDplLPGok4FRwIc+2mIuhXUJSSHSUcXNZ/l
	 uJAJie3fPWj3+aIx0imD/n8kFAChurKlKApqddP4SQViL78PP7bPIXnwUCsYY6Byyj
	 nanz2DcuC5RRpU59V+8iiliEmZXZVAeDWpXZ/Jc5uOYnM4u4eHDQO1a76CbrW+vl57
	 lxQB0a5Zi9xoQ==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2166855029eso78515075ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552374; x=1739157174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1KkqwEQeDF8kvWjV8IZaCfD/CB9EQIzfOrcms/yLv8=;
        b=IP5CYkypXkBxqutuIe+IIDO4rZo5NhfPWB32YWZvFRA31WfOTzOszs2RYfPPt5pJVf
         1OTBqGPXzcU5GADhO+dUEHzjDDYimkIoYhnD2dXSd9kzWTWAZF6fntUjWO89JUBusuDb
         XRXNJp+oZPtbKPVWYxHslj7z7QaK3PKkY6l6ZMHeG+uIPxLZcxuXKnheg7vtV01EEJi2
         t8x/0z2fCwZcIK80MHbPdm+q9oCs/2lcqh1h5Blch3Z/qVtta7u4uNiKLndS4SAG9Nr0
         f8CY75NzTO0mtrMUfq+H9RV0JYpW/N8NvFqnlTZJ9gPPmSB5VIOKaHKlOgZIC8mht+VL
         pITw==
X-Forwarded-Encrypted: i=1; AJvYcCWnLl3nxN2Tqo7iER68u0N9kLyLA0YRFrIbbHrY10W172TsBvqgqj4aonkZp6h+9QaUFkhsXMMlL/TH1fI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWU8ZcDckwG9swo2s4qKOKVbgKIjwaSYj32nyh3rnImsKdAhq2
	gbBjTlWT0zWfZGfrElsg2NyEeCFtGXiiry8jS57oxPVkPs2AROKNZeKY2uYoXXhJJFNootMez2m
	l9K1GMKo6nFYkMxu4iBAUlS5wEvEN8ZDQ/D9xJUm86ZbENintWDuEGSjDu+varlYA77/ZkESMn+
	7Uww==
X-Gm-Gg: ASbGnctkEvUXfC8e2RFfaOe8DoTU/IEBSI1ZgsaHefnUoB8ThRfK4oAH6MT2lHmvu7/
	h+1xrU1byGY8QV9SikNwhUSCqYTBsWiDkSMW9gehceOF/BpbZRiiZG2QP4fjG252DjHUEitZqWS
	FEC1Vth7U82wFXJnKPPnFENF/DUn/MowLFNzbvbYdizrKB+2tYOqyTNuEPvp87wStkzpLH+hCVh
	j57wlsXdI1xOMM9YHOCG6iNq6OpYdvxtuYMQhUJ5NeRmmDPM0rafj8GiW1KfafU4UmbkDZi/Lw1
	SxpG
X-Received: by 2002:a17:903:2447:b0:216:6901:d588 with SMTP id d9443c01a7336-21dd7c66599mr326364265ad.15.1738552374112;
        Sun, 02 Feb 2025 19:12:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR9MoLCLJxLkNlFxcqA8WCKNHLXRd9lv4QEaLuhYy1EVJ2xo3+n+a0zlf35BvyGIVKprQjxQ==
X-Received: by 2002:a17:903:2447:b0:216:6901:d588 with SMTP id d9443c01a7336-21dd7c66599mr326364135ad.15.1738552373836;
        Sun, 02 Feb 2025 19:12:53 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:53 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] gpio: aggregator: cancel deferred probe for devices created via configfs
Date: Mon,  3 Feb 2025 12:12:12 +0900
Message-ID: <20250203031213.399914-10-koichiro.den@canonical.com>
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

For aggregators initialized via configfs, write 1 to 'live' waits for
probe completion and returns an error if the probe fails, unlike the
legacy sysfs interface, which is asynchronous.

Since users control the liveness of the aggregator device and might be
editting configurations while 'live' is 0, deferred probing is both
unnatural and unsafe.

Cancel deferred probe for purely configfs-based aggregators when probe
fails.

Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
---
 drivers/gpio/gpio-aggregator.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index e101b78ad524..174078e02287 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -1313,7 +1313,6 @@ static struct attribute *gpio_aggregator_attrs[] = {
 };
 ATTRIBUTE_GROUPS(gpio_aggregator);
 
-
 /*
  *  GPIO Aggregator platform device
  */
@@ -1342,8 +1341,22 @@ static int gpio_aggregator_probe(struct platform_device *pdev)
 
 	for (i = 0; i < n; i++) {
 		descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
-		if (IS_ERR(descs[i]))
+		if (IS_ERR(descs[i])) {
+			/*
+			 * Deferred probing is not suitable when the aggregator
+			 * is created by userspace. They should just retry later
+			 * whenever they like. For device creation via sysfs,
+			 * error is propagated without overriding for backward
+			 * compatibility. .prevent_deferred_probe is kept unset
+			 * for other cases.
+			 */
+			if (!init_via_sysfs && !dev_of_node(dev) &&
+			    descs[i] == ERR_PTR(-EPROBE_DEFER)) {
+				pr_warn("Deferred probe canceled for creation by userspace.\n");
+				return -ENODEV;
+			}
 			return PTR_ERR(descs[i]);
+		}
 	}
 
 	features = (uintptr_t)device_get_match_data(dev);
-- 
2.45.2

