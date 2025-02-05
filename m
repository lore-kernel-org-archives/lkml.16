Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C9622A7F8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738749328; cv=none; b=pOCDSAiO95OqpZ+SaQZXq7owoCo+NtWK5vb2GduzbBxhJhPGN5HsLJxJ1ZB++xVgFqsmrhFgVr7WoG6ArSavWP+CycYgE0yZrgpDjAmw29fmUpmfj6HtaBOwb0eAJdSCLvlUH6bufHrZW8l6BUiciPwz2sthtpf/nbQ0eBCFg7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738749328; c=relaxed/simple;
	bh=UyuZ63AebhUpU/in3ALgxcHCnsp1FQfXWKq6EW4qYdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NsSf5Nny1hZua+AmOFzahXrsQ3g0QBKRat0f5OW8TgpjD3jRWIWaQ2i0Fqy+5+rrYJjmJXhcZRhsOOJ0QIWk/FdvLcUBtwDtLwk05phy+zd1tlzL00V7UBaibhaT3UIiqbBKOznl25vfCV/pCqGEyjL/P9eDh/Bp9TkMptCo6PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MONBK2bc; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MONBK2bc"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dce27a72e8so307798a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 01:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738749324; x=1739354124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LosAM8MKixrze+DKy3KPUaCIuTYER6dudsHxBAM96I4=;
        b=MONBK2bcr5K5cMLVTlo3gEvZ5wyJa1BdixHUJ5NYQy590ELKINXrXg9e3Lk3Ofk2Wa
         SzDe8yMuDp4rC7NyVRqhBG7NyP6xSfPVSBmaRC17iwjhWvwTIJZaaW9NXENIEdTimd+b
         WwsYCsbkEgcqXAEGfv7/BIf4V2VjreD0CzTR7v3zaKLbv7IRrrV293scZVZenYHsN2RM
         noSVO8bES9Rl5Jc3OiYRRF1mH1YZYZzvgBl4MFFCX1TaHXG5fJhHsql+vc0EX/LF7nr5
         XaIKFiPeRI1jdtwAfEf0nSzDKIY6rmTv42XnphNs6zZQyfdCAu4U2qSonqpE46h1iD7y
         9ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738749324; x=1739354124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LosAM8MKixrze+DKy3KPUaCIuTYER6dudsHxBAM96I4=;
        b=xNU5AD4mOJjF0JtFSl+HGl6eIRfv0ZOrkjIlRs2m60n1U3zzO/4PeDG3ZcuDKHKZBu
         XCDjvnuvJTAfWcKU/c0ItTAfW+Jh0CnBTUbhYWARLE7Wl5y6GqzDeMDpoEqMEZMQaVam
         fKFVmTrOkqUxt5mzHcQ1XYvIfC5w0bzK86VCmJdmfsbFNz35li+RjCEnCWPzUZkTrqt2
         MmKz7IZcgdDKb0DBGDH7grP8tmpww7XfJ2uK6VQZoPaFa+c/OECSQ9nZs8PQv0/ntKs9
         sFKau9hP6aOhaaX8FAcJaOD6ieQEyn9ca/eo1MlThndwfZ2rx0f450lTp12duDT57W1v
         kXEA==
X-Forwarded-Encrypted: i=1; AJvYcCWgxMdN23WPrR1rEvCPEmHtZBEz7MwiEP7BVr8LejIdQLPueEZP7S613dYWg70R5Cz8Khs2wV0+TMJqKIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbcku2zzgmwm0CXrEmeNxRk7FpmRMPi6gsLR/2fof+MEoCtB0v
	2QjHdEDGdWBrxSELETVLwp/ITNL0fHExhpzdbIA7+GR77iYZdlbgkw75lJzXy9E=
X-Gm-Gg: ASbGncsEk7EVBdGVWWOVr4W86P8sPX+I2hoJdS9JGLHsM8h1yAlkaEGAX2QN0hIQbpk
	5EcvSGe4n47mSnJc6Unqq4kB/Z1d/mbLp+rcvhWmGlVdeQyrKE1tz9uZBuhOGjqJLQQ8vwhcb4I
	XG1NcIY6PArojovyar277ekT+0IuWoxyRQLwDlAgLWVqkLB3fxCny4pC15QiIYFKBB2cFGBBi+9
	sdwna2Hf6P2O9GI5ANLoSSsc3ccq7EQzh5+lK4JRkoUTw1N+o7fTImmf636g2fwIu1RzKeBNDTb
	R4p6GwBILU0NEDiEsHheciUYFMNnBznieuuWxWQLUEX5Gw==
X-Google-Smtp-Source: AGHT+IFa23Ek/09ua5oWaqm4xkzUASaUOHIN061he97UBtBQrBAR3KC7IXfPrH98pn40XLsEElBz+w==
X-Received: by 2002:a17:906:b008:b0:ab7:63fa:e4a8 with SMTP id a640c23a62f3a-ab763fafe8amr111455066b.0.1738749323599;
        Wed, 05 Feb 2025 01:55:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7de5sm1075030666b.35.2025.02.05.01.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 01:55:23 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: alexandre.belloni@bootlin.com
Cc: claudiu.beznea@tuxon.dev,
	linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] rtc: renesas-rtca3: Disable interrupts only if the RTC is enabled
Date: Wed,  5 Feb 2025 11:55:19 +0200
Message-ID: <20250205095519.2031742-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

If the RTC is not enabled and the code attempts to disable the interrupt,
the readb_poll_timeout_atomic() function in the
rtca3_alarm_irq_set_helper() may timeout, leading to probe failures.
This issue is reproducible on some devices because the initial values of
the PIE and AIE bits in the RCR1 register are undefined.

To prevent probe failures in this scenario, disable RTC interrupts only
when the RTC is actually enabled.

Fixes: d4488377609e ("rtc: renesas-rtca3: Add driver for RTCA-3 available on Renesas RZ/G3S SoC")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index a056291d3887..dd50bcf79823 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -586,17 +586,14 @@ static int rtca3_initial_setup(struct clk *clk, struct rtca3_priv *priv)
 	 */
 	usleep_range(sleep_us, sleep_us + 10);
 
-	/* Disable all interrupts. */
-	mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE | RTCA3_RCR1_PIE;
-	ret = rtca3_alarm_irq_set_helper(priv, mask, 0);
-	if (ret)
-		return ret;
-
 	mask = RTCA3_RCR2_START | RTCA3_RCR2_HR24;
 	val = readb(priv->base + RTCA3_RCR2);
-	/* Nothing to do if already started in 24 hours and calendar count mode. */
-	if ((val & mask) == mask)
-		return 0;
+	/* Only disable the interrupts if already started in 24 hours and calendar count mode. */
+	if ((val & mask) == mask) {
+		/* Disable all interrupts. */
+		mask = RTCA3_RCR1_AIE | RTCA3_RCR1_CIE | RTCA3_RCR1_PIE;
+		return rtca3_alarm_irq_set_helper(priv, mask, 0);
+	}
 
 	/* Reconfigure the RTC in 24 hours and calendar count mode. */
 	mask = RTCA3_RCR2_START | RTCA3_RCR2_CNTMD;
-- 
2.43.0

