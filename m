Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE7C21A424
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127587; cv=none; b=jA0BpyOlyUJeRQ+fAAJRGOErYxIzJbzI1R5iF0ukcjk4sd+vaJlN9O5r5YcJcG30R98WBe8EJlSWAZ2ck4w4GJ0+cFVtAe7mep5vKSioECcLon/xaPyJ2uNhgympxeKJ/5XqBesFdmd7TJk39+uahscSloUYisb3nLW9T7Qu2Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127587; c=relaxed/simple;
	bh=1+Bptf8yZBTorOFvY4SAopxHfqpHSudxKBxttKSQoiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HYq23aJa9QgrzYdxwQQu7V8eTEkxrUZO3WyleV4x4XiJDxnuwD7puWDxJs4mZuZ7ad1ehxrKpJdlcp+6+G0jycICTXK5XNKT0uvWEhdalexqVWMWpHCQoVSdDR49Tekzqg8NQdpLwN7XAfj+Lzh7MOA0u9NIzoug1SvLvWC+BYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zwKVl+e/; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zwKVl+e/"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4079f80ff0fso2468558b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751127584; x=1751732384; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=02qmxoTPCkOEY4gEDr1T+BbvAQv6lh4lHLzTpSwVizM=;
        b=zwKVl+e/PLp4wQ1Vuu2hWTMtAT8f+ZfCD/rghmKDzgZXllCBOksY+z6fIaytaqUAgj
         zd+fB1ShPi0FA3xu1FpZks/f48M9NSH0VjY/kgV0IiEDs41Tg0Be2iHoXvuRU984Buds
         Wcl54sy7YIddr+oN+v1qHxbO3wrACoqtWo6iRx3FjLmPPu7q0wuhnCH0qKm8uOdsUoW7
         Vs43tsmSBwXE5AFlVdhdQOx8tJJUX7++dYsicDHlVLZrNt6/C99wntvbvo/23IMjiDty
         LxXFSuySQG7t9ARX0NXznY6E6XXAZU/0KIxBrCw6iCAIIPffDPjCQuMxRdIpliubePFW
         5IDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751127584; x=1751732384;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02qmxoTPCkOEY4gEDr1T+BbvAQv6lh4lHLzTpSwVizM=;
        b=Twd+2p9iy9hVvnzoGqETBew0PxAQpEz9yhIRSLrk7M+AHjqAiu4Ee9kJArzhXTWFvf
         i27vymUyh9P2F15FUqcEvVl87HLF9mwYytyxNyKB0BhQ1SwkmTJvwA9fmRyrenm+ifIJ
         o6xCxptv+Jq/TzFqQaVPCQmK52NhE7mq85Mso0KZm5elFeDlHYZmsdPQX0yndPtPAX0i
         LfJOBIHkXyuftJJyLek3/cBrgy8SN5c9msIRf4wJkuntsdYIvzCRDptTtVZe9rWE3PwM
         ubatRDJzPkAvGzSIU0nOesDYGX8IrcRo4QkfgiMDiNKCNtXjBxj45RtgeURsOgUbd2xX
         /tsA==
X-Forwarded-Encrypted: i=1; AJvYcCXarEozROkoD3QBBcCIabGS4sMjf9QqXV2jLb+srsL8Jz6HERrvh/eiF73MJqG98bjM9QyiJk6fLXPQUx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXo2pC9GWmadGsNjhdqpiGlV7MqND1yXDNpSlWJUskPlQBpq7o
	JeTUWO47xrsp2hM8nn0d1zVauG36BZiCwIxF09hXe7InSql+zSUpg2iJf9mHR4QY3T4m3ZWZ4uU
	CdGhSoo0=
X-Gm-Gg: ASbGncuuqfQYkQScloXeWrMwnOTJOFbuNCZGniZ9Tb4CwS0H6Sg5jU0QVRCOu0eq4L0
	RgEbojOb30CDnxI1TtyXasQJUDpf3OMaTG9pFLts7IkrrqhLElv5Bt5tonRzMzq2Ph+5FlFWGdF
	bVdN9NjagZvHSxXWXAv8m7pvOr2T11CmleCs+T7Vt1yrpdHey5/uw1AWbi/5Zf2ZQVY20JVC4Rs
	K5+A1ZGyOVv1U+KP5tiui+Oc99o92mMH1o4ejDEFHt6WhjxlSsQPKbULT7XRzX3n4fC24TvDEU4
	1mNKNEzCeA9eEiDgXmXw4A5glMIrRcXXqFjOljzFM817D6ATqeXqoqT6DydkK7mcGCCc
X-Google-Smtp-Source: AGHT+IF/GRiUjQAIk9AU0sawP3ILK/xWPBRSUKey+TEZjxPkpBx4SpFlXcBxLVhPRg/ag4/bSo6+2w==
X-Received: by 2002:a05:6808:1489:b0:403:304:6b06 with SMTP id 5614622812f47-40b344e0c9fmr5292319b6e.10.1751127584590;
        Sat, 28 Jun 2025 09:19:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b338a048fsm838264b6e.24.2025.06.28.09.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:19:44 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 11:19:36 -0500
Subject: [PATCH] iio: adc: at91_adc: make at91_adc_caps const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-6-v1-1-fbb1ca5edc8d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABcWYGgC/x3MTQqAIBBA4avErBsoIfu5SrQYdKzZaKhEIN49a
 fkt3iuQOAon2LoCkR9JEnzD2HdgLvIno9hmUIOaBq0WFAlogk8ZLWVCjSPPqyOy66wVtOyO7OT
 9l/tR6wdravaNYgAAAA==
X-Change-ID: 20250628-iio-const-data-6-1e79faad9762
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2346; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=1+Bptf8yZBTorOFvY4SAopxHfqpHSudxKBxttKSQoiE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYBYZG9Fgb/mnxZmMVaV59gxiSn1NIBN6g4Xn7
 I23mY9oS+uJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAWGQAKCRDCzCAB/wGP
 wLJVB/oC1S9tvbGg5HZadpeuzKJCOx2oWKkqxVsx4eSmnrDnrxegZYGOCwkcDzQ3XS6QduyCOw6
 5lOW/YFh1muzixuAMcIwLML62YRg0CimZp/YUKA8c1zCHQzIQYH6EOZnaue5ccpxTnFAHjA3JVQ
 YjWwsB/anfiVBZiOe2x75yf/P0kKSUurVPYcJDo2G/dfYoqWr48MrsMWvU3ypL4TorMiwX5GS7v
 XrRhfdF73xb2OGu6W13M157p8PH1oK/OkPbnbMXa8S4bGMnsus5RypzfjJEaKZ0MuAUsYmU0wrx
 ONmdJk+84fR0jumVN6J0Vpak8p7Zx3gbXpZqpVKk6lJ9qAWa
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct at91_adc_caps at91sam*_caps. This is
read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/at91_adc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
index 5927756b749a2473e979133fac955cdfd5faaa4d..920dd9ffd27a594a3be90cd6e4a57ef8d437dc3d 100644
--- a/drivers/iio/adc/at91_adc.c
+++ b/drivers/iio/adc/at91_adc.c
@@ -1226,7 +1226,7 @@ static const struct at91_adc_trigger at91sam9260_triggers[] = {
 	{ .name = "external", .value = 0xd, .is_external = true },
 };
 
-static struct at91_adc_caps at91sam9260_caps = {
+static const struct at91_adc_caps at91sam9260_caps = {
 	.calc_startup_ticks = calc_startup_ticks_9260,
 	.num_channels = 4,
 	.low_res_bits = 8,
@@ -1250,7 +1250,7 @@ static const struct at91_adc_trigger at91sam9x5_triggers[] = {
 	{ .name = "continuous", .value = 0x6 },
 };
 
-static struct at91_adc_caps at91sam9rl_caps = {
+static const struct at91_adc_caps at91sam9rl_caps = {
 	.has_ts = true,
 	.calc_startup_ticks = calc_startup_ticks_9260,	/* same as 9260 */
 	.num_channels = 6,
@@ -1268,7 +1268,7 @@ static struct at91_adc_caps at91sam9rl_caps = {
 	.trigger_number = ARRAY_SIZE(at91sam9x5_triggers),
 };
 
-static struct at91_adc_caps at91sam9g45_caps = {
+static const struct at91_adc_caps at91sam9g45_caps = {
 	.has_ts = true,
 	.calc_startup_ticks = calc_startup_ticks_9260,	/* same as 9260 */
 	.num_channels = 8,
@@ -1286,7 +1286,7 @@ static struct at91_adc_caps at91sam9g45_caps = {
 	.trigger_number = ARRAY_SIZE(at91sam9x5_triggers),
 };
 
-static struct at91_adc_caps at91sam9x5_caps = {
+static const struct at91_adc_caps at91sam9x5_caps = {
 	.has_ts = true,
 	.has_tsmr = true,
 	.ts_filter_average = 3,
@@ -1308,7 +1308,7 @@ static struct at91_adc_caps at91sam9x5_caps = {
 	.trigger_number = ARRAY_SIZE(at91sam9x5_triggers),
 };
 
-static struct at91_adc_caps sama5d3_caps = {
+static const struct at91_adc_caps sama5d3_caps = {
 	.has_ts = true,
 	.has_tsmr = true,
 	.ts_filter_average = 3,

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-6-1e79faad9762

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

