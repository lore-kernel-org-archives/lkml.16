Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857D924A063
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670760; cv=none; b=qnsNNfuUFjU1CGqD7ovjtR/lHdL7m3WUdDnIXnzfC6YAEQdiv/08tI8hunzFWq4Xj0IEG1HY+gZ1wu9/wyFZSmTlCeZyxSfgHsd9V7+xz5uah6/SEU+OZ+40gzc7D1dPJMoYxBOGNldeBMInAkT1qqndOs8t5SJRkuvWJFqNQXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670760; c=relaxed/simple;
	bh=X0QQTgyZyBPIURJ3v2tympUyOwlqSVYuYyMtIMSpfpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hv6gEA9HiSere+F6Djo7MTdIRU7+GYFG32d2+Mb0MIdRI+BQMP1jdrGaY23xXVTO+NMJzPhC4ZiFt9MIZ1dIrwW38OV2A7x4ObP8RkFT5f67qQ5oEggpNzyiPFuuFr1k3UG0DaFc5ltqFVeM5FQKpgwEn2naJjtmAimwt735jAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URzP2DcC; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URzP2DcC"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-abbb12bea54so156780666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670753; x=1744275553; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=URzP2DcCIIAiVaxYYoMP73MU7SEV97+smhklH5zWxCElfDYlenJFBlbTeXnyL8euh9
         yojM2ojq8gpYSFUyO2o2EhhfuWdSdqE6duPdeILAc6qZkUMbuqsv9XxgL6bSEzE+mK/E
         EtiCau9LX0kSw5SH1+t27TYBgm6G4/KfA0GmLOdOjst66COPikk+kVdmsVqbe8w56XwL
         BwIa8v3iuxg3ViEGY1horI+IRPXbyVb1QEIeUvyTu133yDODP3FjYSed/DTCOBw0Qcdq
         bMNZ/3xs8eqL/QQJHld6leDsJAG29QtCUVMndeGfgnxz1KwMzppjXf+8PoXaPWKvrDaJ
         wfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670753; x=1744275553;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kV75c5wurwfdiB4LfjbAT+jBLqgbz3xs0SfJTGIePwA=;
        b=YIbfVC9rDk5glVBK4nIpuZIX13/jYduWueLrmDjcSDlbZrLlQ39b0U74S5Vycsmhgh
         SnewZFIGL2k/PaYQA3yQpKIglViDXnuRSN6rvFKcwMlB/gUFOeb2w9g0E2E911RJz0E6
         y1IeZHIxKVQ7whJymPfRarBGqG5mSntZj0wW/S93ppxOamVHRbk2cT5UxqEIY4LAhIbZ
         Dp9e842ekJoSBLQvO+j2DttFTIFFazS0quOVeSJleHzGD41TQdVVng5kBGAkAMH7FCQP
         TzBUUwFhIQlpIuLliTqQxgRl64ZS3XE+26YuO6mqmR3wnirgOWpYl1qfrr0u+oYN2DwA
         Zjrg==
X-Forwarded-Encrypted: i=1; AJvYcCXqi8O/YXX7anNMw07rZ822t7MB9OhwnQbHpgGJA7agdCWGvX9VvW3GM19BMtiiAkHzxLlmLioQDvQV8/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfcsfAqzV9fSq1bf7+fBuHptM4Dk465IaWhtL5iXniWhiNjFje
	10wMlEzeDpySnzCVXqyFzGD9NA/bVnYFehfhJP85cBH63HKhzNvoYU45oYTpkTs=
X-Gm-Gg: ASbGncuTT6QJUZnBgnrMYfUzSpSz0zNKnQKRuxFMYrX6Qe0kSN//eiBpfd8CLXObWsk
	mI8rUad+FcW49pDnD+VWrcyM1XMDF9cM5QytaFdtNVAnsokMtsC7IthjruSUAJ0v/tVNBSYK2hL
	2HxUfa/+nAoWE81fgzr2GDQBmLc5ExyxpmmjMScSrESJ6A50OOt3Jk03GAnTUTqE2Cx2LdnX1Tj
	E7HoL3HcFeglQJdZts157llXlHp1KolleKEbGx/K1YH5y0wvb8RxGhksCAUcTo/6C7T8zOOcwSW
	G2ov/rm9hsZ8Dd2+ymu+QXzSbTyAwK5aOCmDSjZOXuJLB/2kZz+fiDbWbOIrMG0Y0MYOf+yMHqO
	rT+4GymxxfWPAEYCeM2/ZPoOCmJOa
X-Google-Smtp-Source: AGHT+IGcX+tYkvLIpCQDt/tVecCK/2rtCpUV2gBjKE/E/xLa7G15uMrlM8X/q+3JmlSAkeK9HlD3fA==
X-Received: by 2002:a17:907:9692:b0:ac3:49f0:4d10 with SMTP id a640c23a62f3a-ac7bc259458mr148490166b.38.1743670752608;
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:12 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:12 +0100
Subject: [PATCH v3 20/32] mfd: sec: use sizeof(*var), not sizeof(struct
 type_of_var)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-20-b542b3505e68@linaro.org>
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

Using sizeof(*var) is generally preferred over using the size of its
open-coded type when allocating memory.

This helps avoiding bugs when the variable type changes but the memory
allocation isn't updated, and it simplifies renaming of the struct if
ever necessary.

No functional change.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 55edeb0f73ff4643f23b9759b115658d3bf03e9a..e8e35f7d5f06b522a953e8f21603e6904401c983 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -163,7 +163,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	struct sec_pmic_dev *sec_pmic;
 	int ret, num_sec_devs;
 
-	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
+	sec_pmic = devm_kzalloc(dev, sizeof(*sec_pmic), GFP_KERNEL);
 	if (!sec_pmic)
 		return -ENOMEM;
 

-- 
2.49.0.472.ge94155a9ec-goog

