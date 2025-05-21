Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A541A23BB
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837551; cv=none; b=e6QeC0gXgTBu3Dy/PWoU4zWzU3LFrO347Fnl7vhLlp9jv+a/Z3cIzmjCRiTSOVpv1FMkh1AkHQKcHqmGR/z70xvLW9LZOhZd7X+RUgTLAMVTA5B3m7C5NcnZ7mLCmwXjbTi/OQB7MBqmpJvgpSAtvLOs2/kV6vZov0vtxApeaRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837551; c=relaxed/simple;
	bh=VKBKsgI033UqB9o+gMnVb+vEguCGDD1FoU1UsrK+MrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NAvr1lIMksuA7HD6ux9lR01SBlJHiPbZLQ//RphgeNp1TCw3SxU930/cMEWL3zVVwshHStK0BeD75qis8xhQXAwJ8jGyCyLqajSnwhXStRMvoDTLWg/alVru6/kw2RrBP30wDsHiTv4pZi6mdx7eQoz86Fa2IRwtBQBtsQxUky8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=To0h7zt5; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="To0h7zt5"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso12504089a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747837548; x=1748442348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BAoOK0vDUGT5NUWwORFr6nOmwdhypOGGt5uuUoLE1hQ=;
        b=To0h7zt5mbFeMM24PBKDuAgb7oYcjsyiJmU1nodKZVRZXPc+bJXepjz6OJ3MNWLsSk
         MeXHFoLM7miwAeXFbfm7bdnPSAAJYC4ApfRkRj+v7/fzr7XfRID/XbONuTlYZb+zkIg9
         Lui9DjYQim9fMdRCBI5GIIHXpTL0ugmPLE5R/40ccu0cjPhrQ7AZEgZ5EUlA87aJSHOx
         /WPG9VrU23IolCNXupQzVUS2e037hpFjeI2s0YyWw50gFuzMSRS9XRXwG1rd/MrjwawZ
         7xytz1eUlL6tPq6JnZ0Rzk2l/1VudghYaWHBRkhEgbez5zJn6dQ+EuK3ajINH1jFPnu3
         ISCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747837548; x=1748442348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAoOK0vDUGT5NUWwORFr6nOmwdhypOGGt5uuUoLE1hQ=;
        b=vvTFAgU4C1oqAKT3r3tWSOe0XAWEhkoK/fyks9bLWKav6GejRxGY/adqrlNpjQ7k7i
         uDqD1TKfODVUtfwI2GGxRSFAtKcx2Q3EbI69b908TQwUtzC5lexR7Orj6htz0wSAXRwP
         eu5SOIxim5v85GOiybl3i1WDYPqAFnal+YmDwnIQvN1sASeVwpTtF2Y/Jwt2P0CK8kHn
         EL39BFn2E1tUUNxwt6zssAJmA8UP500xxrONVAcnmwlxez6xidlMsV3SPm8f7/RATdn4
         v7uoMSvygnXnq4rUyVPsbM+gpoiSqqd/7E8lxrl+9vTrod4I3HzyGvzYlnxCJ2YK3cBK
         8uKw==
X-Forwarded-Encrypted: i=1; AJvYcCWcaT0/GKdRh7cy/+ImwnLkERlxjM5rHN507FaughpBLoDcfNSjOwM1P/jf3Wt6D0yCZLrRGf/QeJXWo5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ094Y1pg2uBsCYfDXmoY3r5JDNXwCEUvf1DmrQCRkHDDHL+Fo
	pbuKoPKcY9ccbFmBE9PvpBWNTud5O1axoovb3b8srvCMC92/ijwlQCrcAtLQ6pZSQq4=
X-Gm-Gg: ASbGncvYsLrsLb4ZrAh6G0j8kR7tuO1dL7pq8FVdlKcyRzbZuKbju0Kh8K6k7fCbUuV
	2BDajxhsM5O9JEyu5Vn0DI79J/FzLYfalKx9Ug8AtptwZ5l+9z9g0BD+iY6yCyqX0SYbYiXaXG1
	0THgJbfGXlxv799nkbSZ9twHnvu+uddzc1IKotNddYESdxJuzwB1RMEiCy8XCgbbNMNJFniQY9d
	r5CPe96NOD+wMaZYjmfSsLqMXnNBMjWX4nJvgwu3pQV7tU7xAisHhHMexG634gCWBepYRxQBnmh
	/ppQBCkcBzrZbNyDAOsmgloaCTPDG4cksiVK4+n9rCciu6WIcSbLoOiIdHJqP05pNBWZa3c1SDa
	9wFvV
X-Google-Smtp-Source: AGHT+IETmJDSvXtqfNJ5DK3+g5a0WkD2f0od3l+SgDV+9uZqIezAqUgDffcInFQUV1wqSgRHrNwmzA==
X-Received: by 2002:a17:907:7da2:b0:ad2:2ef3:cc1b with SMTP id a640c23a62f3a-ad536b7bd28mr1864807766b.7.1747837544459;
        Wed, 21 May 2025 07:25:44 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438086sm901324166b.89.2025.05.21.07.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:25:43 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: tglx@linutronix.de,
	peterz@infradead.org,
	jirislaby@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] genirq/irqdesc: Fix deadlock when reading hwirq
Date: Wed, 21 May 2025 17:25:41 +0300
Message-ID: <20250521142541.3832130-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The &desc->lock is acquired on 2 consecutive lines in hwirq_show(). This
leads to deadlock when reading hwirq. Drop the raw_spin_lock_irq() and
keep guard().

Fixes: 5d964a9f7cd8 ("genirq/irqdesc: Switch to lock guards")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 kernel/irq/irqdesc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 6d006a68ff85..b64c57b44c20 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -281,7 +281,6 @@ static ssize_t hwirq_show(struct kobject *kobj, struct kobj_attribute *attr, cha
 	struct irq_desc *desc = container_of(kobj, struct irq_desc, kobj);
 
 	guard(raw_spinlock_irq)(&desc->lock);
-	raw_spin_lock_irq(&desc->lock);
 	if (desc->irq_data.domain)
 		return sysfs_emit(buf, "%lu\n", desc->irq_data.hwirq);
 	return 0;
-- 
2.43.0

