Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958B724BBE5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670764; cv=none; b=aBaWpalWmA48IEso3CI7hJRUzTCUotBch/knSRamSnP867YvYG0nz+lgx1x/lucUkCsMzjFU4vSMPkahQIF7C6PkQaz07pqfq2kViE/8sLKKkZVgsXUy1kDbIAAD9493vgbzcsoHywCMVcsm0lEpqkoophoH2g9FgxEODHMnboA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670764; c=relaxed/simple;
	bh=uZPaCVbPHBGfSgOGE/h2z8oZIqJdXRNHkC3wOcm11eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHN1or0A/Tzws5Oq39qGl+gQGIQClAJFk+KYfcakh71u/nJb0Y6jjFuo3KCTLmARz+wH/ING4sKfZRNJrjJulmQe8Y2fKrQoG8rqX7+ASnqELFb6GV95Fk9dh5yP8ip1rxm2nW+PYDtXQNVIc+zfItGPYm/zDzmhVn2xybyYY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r5DHmoiO; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r5DHmoiO"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso101858266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670753; x=1744275553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=r5DHmoiODxaHsy2jUz9U6uGinpNsTG8t7Rgx05pLFXLsh1Vr5scyqvahIQXq9i776e
         h+v0ITFLa9aNuN03UKLIF6Jlq9A7/AHbxUlKN4UyNHV3DimYKzdd9I/StgLnRjbJDj6P
         rnbrMTpFM0ecFIHTtj5E+A+E8ANw3BynCMNDJtoKhQqxVIMgAKbAO5lEkNf0tv/3WeYl
         950Um8azpVGsFWTSJA44Y8yDZ8Bj+q4Lxt/839vNZ4XXYJKaMvhgAGhsI9FVri9eKE0o
         YIVo7OAKu5AWKKTfbuqUqenu0E+pwq+8fIjnUzM7WqR1gh3qYSAO4p3uuDgshPaQ0RRh
         W6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670753; x=1744275553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGZF3iY+lrce/peuoGWoI8dxWV9rSVtCllywJ68wEfI=;
        b=kJx8yl5iqviLx4JnIvB5t8USwr/niGqbbqwISPhHhrzDCb2L1NLKU+cMY1JLaCGos9
         jVIKV60A8hTFmM9Xk6ni/V7vtgKadHu9QGGwpadVAO+O2/+ceZyox6QAv7a1L3I+pSOO
         iFFzJmMQCWtG6VVqvug5psm50VBAYmAk//gJ/PrzwF8t3AfKzf2an+9xyffxek0x6YLn
         /OaFG2j3/iAW2Bgzd/YuoY1VloQ/CiChetjg+hqWvP2tmDARFhok45TZ9USBJWLiTDKN
         RHCbcVbPrPu8QZxhmTPbQq62me/FTnOhk10Bi7k6hqx4YwCXUosGNocTTS1XgNg8G80f
         mkKw==
X-Forwarded-Encrypted: i=1; AJvYcCWr7rbhQDDn1EXtrABM8m2If2SjksbW5hH45EYkartxQzpk1sPNsOAjRq7IWI4NVLZ7ovqBgCUtjYwxYmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8EDtFh55Tp1AFezgCazje0/HtzVlIqU9rble36iifXLxoOJix
	9qysNfID5TxL0i/B0VKjEAmzMp9CZiisVmMZXTuNn1zuVhvgz8rG1wln4zsjWTs=
X-Gm-Gg: ASbGncsI4z1yEWtJA52ZZhrxj2Bl76RzKuaY4W1y5+h3F6pRw0MCiIeBdVsYUjr8Z03
	0hmV4JkFnhyyvONwEsNP+Pz5+epygiOQitYNQRxhbJuUKy6KMtD1frWZrq/MKQnJsAiluRm5yLa
	X7w8Jd8tN6aQCf1gcpZlEg60yJ6zYusDj6/u41fgxyNqreoDmdzXyqoiCN7RyM1bJ3YxifYGiPN
	nDoYXFbS+MXkbxUlGpaQhNzGE+m6PRtCUDv/xM+QBHgjviSUqmCq6Jb5EqqFNOQ+FMAV1yewM81
	CiMFJohxFijxFGz6fK1MxkjZ7ieFb5KlmaiATN6z20Uksd6RdMTERnhydA0lNK4+GzfHXmZV6mn
	8xvh4Rl7of9vYZhmkQzjGSfb+fEVn
X-Google-Smtp-Source: AGHT+IFRyOdwPcEz80NSYeNSO9OIEAqrNZz0SsyzqP2x0gvOEZiZralRMKMAb8SO2ti+oPAesT2BCw==
X-Received: by 2002:a17:907:cc1a:b0:ac7:c59e:fc3e with SMTP id a640c23a62f3a-ac7c59efdf6mr46064366b.25.1743670753150;
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:13 +0100
Subject: [PATCH v3 21/32] mfd: sec: convert to using MFD_CELL macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-21-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Use MFD_CELL macro helpers instead of open coding. This makes the code
a bit shorter and more obvious.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 57 ++++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index e8e35f7d5f06b522a953e8f21603e6904401c983..448300ab547c10d81f9f2b2798d54c8a03c714d8 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -24,16 +24,13 @@
 #include "sec-core.h"
 
 static const struct mfd_cell s5m8767_devs[] = {
-	{ .name = "s5m8767-pmic", },
-	{ .name = "s5m-rtc", },
-	{
-		.name = "s5m8767-clk",
-		.of_compatible = "samsung,s5m8767-clk",
-	},
+	MFD_CELL_NAME("s5m8767-pmic"),
+	MFD_CELL_NAME("s5m-rtc"),
+	MFD_CELL_OF("s5m8767-clk", NULL, NULL, 0, 0, "samsung,s5m8767-clk"),
 };
 
 static const struct mfd_cell s2dos05_devs[] = {
-	{ .name = "s2dos05-regulator", },
+	MFD_CELL_NAME("s2dos05-regulator"),
 };
 
 static const struct mfd_cell s2mpg10_devs[] = {
@@ -45,53 +42,41 @@ static const struct mfd_cell s2mpg10_devs[] = {
 };
 
 static const struct mfd_cell s2mps11_devs[] = {
-	{ .name = "s2mps11-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps11-clk",
-		.of_compatible = "samsung,s2mps11-clk",
-	},
+	MFD_CELL_NAME("s2mps11-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps11-clk", NULL, NULL, 0, 0, "samsung,s2mps11-clk"),
 };
 
 static const struct mfd_cell s2mps13_devs[] = {
-	{ .name = "s2mps13-regulator", },
-	{ .name = "s2mps13-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps13-regulator"),
+	MFD_CELL_NAME("s2mps13-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mps14_devs[] = {
-	{ .name = "s2mps14-regulator", },
-	{ .name = "s2mps14-rtc", },
-	{
-		.name = "s2mps14-clk",
-		.of_compatible = "samsung,s2mps14-clk",
-	},
+	MFD_CELL_NAME("s2mps14-regulator"),
+	MFD_CELL_NAME("s2mps14-rtc"),
+	MFD_CELL_OF("s2mps14-clk", NULL, NULL, 0, 0, "samsung,s2mps14-clk"),
 };
 
 static const struct mfd_cell s2mps15_devs[] = {
-	{ .name = "s2mps15-regulator", },
-	{ .name = "s2mps15-rtc", },
-	{
-		.name = "s2mps13-clk",
-		.of_compatible = "samsung,s2mps13-clk",
-	},
+	MFD_CELL_NAME("s2mps15-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
+	MFD_CELL_OF("s2mps13-clk", NULL, NULL, 0, 0, "samsung,s2mps13-clk"),
 };
 
 static const struct mfd_cell s2mpa01_devs[] = {
-	{ .name = "s2mpa01-pmic", },
-	{ .name = "s2mps14-rtc", },
+	MFD_CELL_NAME("s2mpa01-pmic"),
+	MFD_CELL_NAME("s2mps14-rtc"),
 };
 
 static const struct mfd_cell s2mpu02_devs[] = {
-	{ .name = "s2mpu02-regulator", },
+	MFD_CELL_NAME("s2mpu02-regulator"),
 };
 
 static const struct mfd_cell s2mpu05_devs[] = {
-	{ .name = "s2mpu05-regulator", },
-	{ .name = "s2mps15-rtc", },
+	MFD_CELL_NAME("s2mpu05-regulator"),
+	MFD_CELL_NAME("s2mps15-rtc"),
 };
 
 static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)

-- 
2.49.0.472.ge94155a9ec-goog

