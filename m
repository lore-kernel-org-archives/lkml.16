Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9341E217F5C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746121086; cv=none; b=ovmAuhgz28o9eVkRiar+gSoAXIzjji86sAlVZL81rXo7cZdCBbdQ8GzjaVAeOeiR6NUXJQtR0lPi80hRBiB/charcRYFWUaizudyH3lSMQ6RL1GbW+kQUkLxH0l1Qqhtg0Tl0Vr9WIV8cCPkkEr54aptoKArd/C4ke7zxOd97N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746121086; c=relaxed/simple;
	bh=crri3XCfcqwKWJfKfmbZ3CdQtYZUM3CB9RR91MAFvcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drny/h2iCOYbBxU7dWueZ/ULrg94c02OI3tsTzvAzK0Oz1QT+o5LPTAfUBvfSwhz5kjAkGXCN9Xn/8OYtsuk3FLt1cbNkI5jSH/psno3ZI7o08DQYZegc8Onu1InqkCjaIHSji6ROF7vyYPOHYGva/Dpwl5BdrQeOFXwdLguEA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XuRwXjn0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XuRwXjn0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so1309865e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746121083; x=1746725883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/HW9WcPbLOg426e7PkBYPautqOhDNEoaAjyhiqq4AMw=;
        b=XuRwXjn0qA3zYi68AGiUdZ16UjHQJ62ipIA7TV4d8SEwWb4P2qZ47Pu9xdMXRINbC+
         8dnopjRWOmbwUrlhnq9Xswunx7K65OFqeiSjOkzdw00LCrp80N051cXedUwMZLUb6efg
         dt4h/9Pfr4O5K8KqCQklZTrr3FsFqViGb0VH07+9Z89Q9W3VJoQ22VV64dZ3YuQhG8ea
         /G5njXFoanf1ib+Q0skDsPtNRtLmydTXFUrIxwfNDjULRbi1EXalhZOy+WRLP3J6mSNw
         ujHULGP2MZF+UTOcBUlDRlsv7M5Qj+qFg+gbtYVe79pugQ32GdfWDM7z29nmfjdCu+bT
         MLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746121083; x=1746725883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/HW9WcPbLOg426e7PkBYPautqOhDNEoaAjyhiqq4AMw=;
        b=ZTIOeXGR8mmSX2EjVQrvTVF5R29PXvMYY5QeuV8yisuzb0S+wJV5v1U6S+JyoeKXdF
         v5LH3wsiKA3seEsZxqf9nS8lWJaZLVmC2u0rMDIt49ADI4bnfQckkT0xWCz6x14pFEih
         FDJK58gATi503/tVTutwaShbjTcSuqGfdFIaaCKPWheCuYSLmis2ffkL8UkoqUBdOyL1
         nwv64/o9hOyz6LbPDXKsm4Yxy2f43GtourpWVqwlQ8R46sDmUrMRSfIRfbRS5oQ+opqO
         JTP1eAWVD8ixCHdlPFdWFELc5sRuHbVVGeW/Aumg+zL6l+Izlx7b75QQkRMPpit5nzkR
         3yDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAayMqUdWSen3sz8nMyg3B8WjFhYCWVkHYn/mXh4x7b4i7GNyPuC/cAaCv+jNrHmoJ8lTGu2/rNW1HNLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWYh5I1jeceiEdD62S8Ak36fueE2pawlCnB79jHplkUaTbW03/
	Fi3vLYnALu02tthZ1QevfN5VZM+piJVEbs3W98tnkDKaoXfsz97VR6NazcO/eZ1Iz7X0N4jQs01
	M
X-Gm-Gg: ASbGncugdIug+Iyxzx2lt8Sz9o12cYEi9Y57iv8PlSaXowULI1c09gOZXZnmoX8Q8fL
	YTWBEoh+bCHLmO/mKcI7A1hSEqVv63uF9e+tVT/WVeFlCiSLWCl/oW0AUzfnWlMqsZQ8oD7FIw1
	xRAq4jbhVTdDRhEN6JSZeDwRG7h0Nlm9RiG4EJaeQY0JukeLvhpB6Ysk+a7lvHCEU5qW45DFGRA
	Khsl0qNNqKgEbSeN8kfSEHcSlzWzt1dM3cL8MH2Xl76uyyisudVYqU/b4TXhDCFRyE00lbXQCUv
	nje6Lu3wysVrpnrBwX3xI8pGOU44VQNn3q8DgxjwTZ8KZR3R+g==
X-Google-Smtp-Source: AGHT+IG7FOrhWC9L1OD3JsjvQFAxkOFCTMeoJBxRLWB98imKBhOpJOPS1V46lgjD5glH2ZheI/hN7Q==
X-Received: by 2002:a05:6000:2a7:b0:3a0:7e4a:f13a with SMTP id ffacd0b85a97d-3a09404caa7mr1098523f8f.6.1746121082646;
        Thu, 01 May 2025 10:38:02 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4651asm1357778f8f.29.2025.05.01.10.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:38:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mircea Caprioru <mircea.caprioru@analog.com>,
	Peter Rosin <peda@axentia.se>,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] mux: adgs1408: simplify with spi_get_device_match_data()
Date: Thu,  1 May 2025 19:37:59 +0200
Message-ID: <20250501173758.135465-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=937; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=crri3XCfcqwKWJfKfmbZ3CdQtYZUM3CB9RR91MAFvcw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE7F2e4R8QdZGlcNR5yeo9mRaBppG1uacKksOV
 Ia5CPycExGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOxdgAKCRDBN2bmhouD
 14idD/4oQpmIOcNuZh4eX4lyallftY9REcnEAMHk2LvNDRvR1473O8SiZWQsXzlsrOrzjqOFHsF
 pdz25PI7dMEw4J6vpFF2z6XxDXnpI25u2pi/edXsWyFhQx38qwhQNluADgwEWeQR/8Md/mwkaIC
 k1eu9plCTTs1Bpk78vr7mwNKpkF9ah5X2xmBDBrTewCmE4V+b+VcNaUgv7BuXVV7sa1J61x0ydp
 glEYNkWtjiZ+bbSTHXjNthRtPuxws8WxkBbo1KinP0tm5dE6ZKeWfTa33XCFN6k6mEOXYvALv2b
 UIlFp+FdIZMUtnxJTx0r4ZIUcocsoyiaNEXTrrnv1qgVwd0zwJsZTk5SBDTUjhaZHZv/XaRr6Vu
 6hR7COzsfGBrrkXm88iQSDiAYE6LZefcjDRnafkmVFWv8SiuW0avwaO/3oorpiSgwxwOltGDbsf
 A48zSBOAeWCA+A4KGQjwvWXC6c8pf7w1i3v/hM14WbLA6jH6AJ267PRN/OszlqS+0sPuuPJeWDG
 f+rfUzilstejyw268XzpLZCFSOoH0dP/ZzMAtD7gfCpsTUeu3F0WKTGnlD6C5ez7VCxAXApusnr
 dsLgkW1cDUfOV2tyGzbTgVoZV3Fo/mDdH2063KbMV+XBBsHo0H00YTJOGyX4jn1+JT8wXEgBzlB qw9retBPyPqIRXw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Use spi_get_device_match_data() helper to simplify a bit the driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Resending patch from almost a year ago - there was no response to pings
either.

Is mux subsystem still alive? Shall it be marked as orphaned?


 drivers/mux/adgs1408.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mux/adgs1408.c b/drivers/mux/adgs1408.c
index 22ed051eb1a4..5386cfedcb06 100644
--- a/drivers/mux/adgs1408.c
+++ b/drivers/mux/adgs1408.c
@@ -59,9 +59,7 @@ static int adgs1408_probe(struct spi_device *spi)
 	s32 idle_state;
 	int ret;
 
-	chip_id = (enum adgs1408_chip_id)device_get_match_data(dev);
-	if (!chip_id)
-		chip_id = spi_get_device_id(spi)->driver_data;
+	chip_id = (enum adgs1408_chip_id)spi_get_device_match_data(spi);
 
 	mux_chip = devm_mux_chip_alloc(dev, 1, 0);
 	if (IS_ERR(mux_chip))
-- 
2.45.2

