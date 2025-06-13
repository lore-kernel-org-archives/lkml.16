Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED19F23C4ED
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840977; cv=none; b=nBPNCtRY5sz2JsiypByoKTv7aMnt0yapaMRq0oxlph9pWn6gBKsqOW/1Pfq+WXt0QwuVNAyKsCVjOI5Xv+fGiFTSIefs/OUt8TB5nK7aAhiCOz0W0cmgMHBYOL2KBMl3WvXOkFeelRlfCTEgB0isy6TktvYsb9CJfFO+NBf99CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840977; c=relaxed/simple;
	bh=CAL7obHrndJnr3rxcS12mN4GTY+FeLhfpJLw2svY0Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZUXT4L2BdwphQzqrfJI6gjIsaPQ/2ZgaZ+keaDBAsgNsHSH6PA+C/AspN4KMfjhXGq62DOdzBOiinlVIl78xx/MStO3cd2tUqQn8PeOIzafpUy84JvPStc7eJLFewuUlij6fSy1jvoWOGNqbn1s+G7n6oO7c3I24DAPd3zmGQk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OggyQU+j; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OggyQU+j"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-40a7322f081so274560b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840973; x=1750445773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/Jw1HzLyXz3aA6jCt0RjdVyqCzrscgvid1cM/aOBW4=;
        b=OggyQU+jiAC3Jp30HbM7WZiMRU+ktkuxbLd62PikXn5Qe9DySQ0tvMgE+A3SocbjqJ
         Ry43KBN3omFMAOSUIhyVAfCfC8gNbfHSJlXTi/9dhs3TkmPoPaI2ahalDOoM+YnpUCq3
         XUTTljqkCwZ8YfN1kLsprrfmMuv0C/Bs4rEPQvTDKiciLDTFW26bK/WEhRcAdW0xa3VG
         S5f/w9B2Fh46pCIpB87Ht9mlSCyuqo3qj9+CgLoIn+0zMHIZ8rKSI9aTRp84UaMoEcWh
         TdGL0irh+qk4lIDxr47gopOiaIGgIOw++c/JoC7MJzG5x6aPhcsKWuioMg7RWfrSwZjx
         NL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840973; x=1750445773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/Jw1HzLyXz3aA6jCt0RjdVyqCzrscgvid1cM/aOBW4=;
        b=FcnFvbRqOySSozEMcYCrizblnAPY87VJkYvZg9xLWy0eV424bFfb0Ng6p20HJ33grv
         teJ5UfwYqlgUSthMm3hjgEWZfglteH4fdw59ZGcW/Xjt93UMpixpD3Prjg26HXOF4Pzi
         fZRWDQA6W5fdVrq31F7R083WFEfFYBRVw3DOna8aeZ1RL87lt61/NJON9hp8EhHFNl/5
         LbdcGJg2WNiZwXcf8X/rrQ29+qdz7t0LR1tBvkcsb/AY0yX3GPyEQgWb73EURr4dErsV
         HZb6xm0puKSsIqOJYUoBTqfqJivvJ8fmAjvuiAZ+6kwc4Vl/fWElLLXGM9mcCMXfjV23
         3EXw==
X-Forwarded-Encrypted: i=1; AJvYcCWA2dAw6AypXrwc1M6Vg9+rFiI384DFWQ6z4VqOUqL/qWkn77B0e61DNo/bzbmTogUbDV6E+VT6jDPhcFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM6uWkCouB+UiB97hA4n+cj51/zAva9VkJxcebrxdPo1GGQRyB
	vY5ZzcnE45AW8VX02QCaJ/BHbPDAc1BRRxh7A4xL9rGT7MgfKIAsa2zve3mygE8MMCI=
X-Gm-Gg: ASbGnctg9D6fLbZpI+0ZvMOtlxUfGjRoDM/d0nu38TxrXdf+w6woxTUTfwLztbcVU1B
	IzOh3bsi/GrxmtvoPYWgnPDQJBlMqOl5/O/D2GcvbWiIufTAcS43Oxch+GKc0YGVq1EMMQCaDoO
	N2wCmByhFZNl6Rp/y+6S8O9Hbh/0E1W33jLnj65B88gKCSZ4Q2+5y+ClOB/5K/ro/O1+CnFCpTC
	IxeLIQIcL4CjW/vzovpLym1CI1HL/95z/j4N8QGAIjZ1bMSvrvv3Pg+WxDPrJB80mfoBDgMY6CU
	hOXvs2qvk3yEP82n3Dw8/IqCW8A/cKGpX2rhNznE3z3kRoGHNtXmfRAnJwPrBjRRobE=
X-Google-Smtp-Source: AGHT+IF46sUC7fpnm70pdQWqZs7Gy/g+8A9DyCLSCMcbG6MfejW4kWoNwjo5H4XZGjACXLhKZ/slUw==
X-Received: by 2002:a05:6808:2224:b0:403:3973:23c4 with SMTP id 5614622812f47-40a7c119d5dmr395805b6e.9.1749840973013;
        Fri, 13 Jun 2025 11:56:13 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:11 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 13 Jun 2025 13:55:30 -0500
Subject: [PATCH v5 3/3] bus: ts-nbus: use bitmap_set_value8()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-gpio-set-array-helper-v5-3-273fab50cc8e@baylibre.com>
References: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
In-Reply-To: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=CAL7obHrndJnr3rxcS12mN4GTY+FeLhfpJLw2svY0Jw=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQ7wb/Wqd5uM0itH561zbuzBZLhf8SMVLJOo
 +RXFtT1YgmJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0OwAKCRDCzCAB/wGP
 wPGUB/9sOLa34ENc9yrrXBypfPUlomEv0iV2hsaVnJZ7RH8Sat74YHznsdIkYCNfuDpNPMux7Px
 qwv0u/hJtQSgKwdbZkssK8MMoTgQ16JXlUiovxbdDzyM/HqGmvA64mNvfNOvTN8ZDO7nlTG2ojo
 OeZ+7yGMbprFMal41StzydFs9R7FcCDVt8TQI1XvIYRFyQgrjfWqQMY/AEE+l2jDJeFywjM1qtj
 USF53Wt1ke3qkG3Cew8U48WrOPHIhpKgc0r8m69ZbqT2oehrZqy9cP3q3E/64OrKuvuPocmGIny
 wum0JT1pzp68jmyLwG6V9nlIm0RDYuvUFTUFGdT30gnshHMK
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use bitmap_set_value8() instead of accessing the bitmap directly.

Accessing the bitmap directly is not considered good practice. We now
have a helper function that can be used instead, so let's use it.

The bitmap has to be zero-initialized now to avoid a compiler warning
since bitmap_set_value8() does read/modify/write rather than just the
write that this is replacing. In ts_nbus_reset_bus(), this zero-
initialization is enough and we don't need to replace the array
access with bitmap_clear().

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
v5 changes:
- Fix undeclared variable in ts_nbus_reset_bus()
v4 changes:
- Fix typo s/get/set/ in commit message
- Zero-initialize the bitmap to avoid compiler warning
---
 drivers/bus/ts-nbus.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index b4c9308caf0647a3261071d9527fffce77784af2..371fa83ad0db424ea48cd7c23e3070f56162d7ad 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -10,6 +10,7 @@
  * TS-4600 SoM.
  */
 
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
@@ -105,9 +106,7 @@ static void ts_nbus_set_direction(struct ts_nbus *ts_nbus, int direction)
  */
 static void ts_nbus_reset_bus(struct ts_nbus *ts_nbus)
 {
-	DECLARE_BITMAP(values, 8);
-
-	values[0] = 0;
+	DECLARE_BITMAP(values, 8) = { };
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 	gpiod_set_value_cansleep(ts_nbus->csn, 0);
@@ -149,9 +148,9 @@ static int ts_nbus_read_byte(struct ts_nbus *ts_nbus, u8 *val)
  */
 static void ts_nbus_write_byte(struct ts_nbus *ts_nbus, u8 byte)
 {
-	DECLARE_BITMAP(values, 8);
+	DECLARE_BITMAP(values, 8) = { };
 
-	values[0] = byte;
+	bitmap_set_value8(values, byte, 8);
 
 	gpiod_multi_set_value_cansleep(ts_nbus->data, values);
 }

-- 
2.43.0

