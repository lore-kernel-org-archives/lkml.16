Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD230191F92
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168675; cv=none; b=XkqM6s9R6VG+f7HrtVcG4x/ND0q1Ri5vkyzmKXJgxNj6erdkjSDBf4/Ry/SVSz4hs3UwqFGWYQx/RwlHDHQ5CGyBIPqmjHc6Z1cpwqWKtANIYXsV1kSdAetvlIHWxjFVg5l2wxePaZW2SJtHvFtX0Gav+zhqpl3HbJ0biC98/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168675; c=relaxed/simple;
	bh=kEDFa+8UVBQzgPmv5eunRw1YTfTPcSizj/QHfDecNE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NcHWLQVwMDc8d3VpCK1zCGjG2xNC2SwkNkfx0HhOtkRt18EQ7OuUlYuSmJZmNYguBmhatLunU7+W+I8/hvQnor+UdniUPh1NB8Th5WcwgwGa2kYgMCi5xa83V9888Um/ogxksR2E47wNAruQaFWZVhmlfoNFglfPYlB+Hcy3Zjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fp1xXmKZ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fp1xXmKZ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so312081a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168666; x=1743773466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=fp1xXmKZegKILOcnMMhnBzMmxqOa+3829cjCZ/M9/fvWw+rTE43gHntN9Kut2LiucL
         Jxe5mnb+b/MKhJgB6P424E96nPPVYATrIsUYfD9llnzlMepBi4Od0Bxq0z4A8rkE5T2N
         tViFclVNvinzdX/6XVRdb02bKCse1/7ibkPs7iwqsMJW48l5BLgfBZagFPoh0p62KQ2e
         x80OLHd9+emeKjWhTgynvdqvzims/yJJJFKl694bUze9O64A8vJunTFA4lC2X2lX+KoC
         EpVw8j9n+TOO7FWTh0IX/gqgn0C0Q66IiXnXYwLMLmt0lXg3/moqUqgQmBcxlx4BLbNR
         B51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168666; x=1743773466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=S/vyxDwalUVcYByWdFuPE7sygeABuV0LzwHCnl9gVShP1pKkWPrZ6tBO0UW/aK8MBB
         NPyIVQCYJKsc7K+tYHgcy/EH44dhzoybI/FldzzltSBniek9JoUTt765VxxMI1k+ck8B
         4ipHD9JtPM2YpPgAwS+1GX0wXq34yGaKoF5P9wMxB5zOkq8WVkjidaBfTbNQs9GN6x9t
         nYyyIipj7qDQiZmrpkOljKrPXvpSA2l1rWSl6T6m7WJnCBIyj/uVNcFSV1dYqRj/ZtaX
         mCSlZH82xeLUx+u1EYcQJBXtK3nm5Z86iEwFSq4cw5IOgTH8xDqiyZP8StQe6nij4szJ
         kgkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1BhjR8NzZcfCICSbfjbs1X6v6SP8LVCTI8YukqTLbFbAgeOcc5MW4YzcXG0WUvBrHv/eH3J2UmuGbKgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQzavYBvUeJAFehSOWAqF3Ia2M3IC+sRXTQQFswTrgbGczds0c
	0KNqYhBGkK5Gk86BfdwkZWNY5is0G1loL0dY/VMMaQi6wVmWSN40Uc0kaAvndMU=
X-Gm-Gg: ASbGncvEuR30Mp82jR+6BCImGliIwTSFZZ96fyFoxXxuFrAS0nlWELXW1j+aSoOc8Sw
	5yYHspXQCebliradupqkKXrR5+EFstSReB2VbcFZjA8r6TG9GbWReFzgcHW40OCrz+5QPqItj8D
	8AC3GdFKYyoxdf2x0k4EjGxAIAOMD9+mfmfBKJAwxnWIRc3iuNf3SbDy6CXbVY2FPf0NMXJwskr
	JZxhGP9iiExnk06eh01m7L/4pTKxuAvcj7vng6hDFWJu0Kneamgaa87Ge4MTNaw3eUz5TtZUh2n
	C1oh9apSr7hxIOQ20zifuo9R8WkirCguH2TjC/IyEuculxk9FQ0IA/9aik+x72i9rmcEs8jnZsV
	vVcVftnGA7kjM5K6/R71JExHHUh++7fzxI+GcEEU=
X-Google-Smtp-Source: AGHT+IGAjkKL4/RcQRVs4lvBXbIgZ8dDCpbSsQ9PMQOGZfxyLbsOG8rXC4O3k3x5fcgkz2IEiIeoJg==
X-Received: by 2002:a05:6402:1d51:b0:5e5:e836:71f3 with SMTP id 4fb4d7f45d1cf-5ed8ef20410mr6346734a12.29.1743168665879;
        Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:05 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:09 +0000
Subject: [PATCH v2 23/32] mfd: sec: add myself as module author
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-23-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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

Add myself as module author, so people know whom to complain to about
after the recent updates :-)

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..05658f05cb857a784c7d01b1cf25de4870e1a95e 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -293,6 +293,7 @@ static int sec_pmic_resume(struct device *dev)
 DEFINE_SIMPLE_DEV_PM_OPS(sec_pmic_pm_ops, sec_pmic_suspend, sec_pmic_resume);
 EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..74fd28a6bc9a42879fc1eb05546777f60e0062e9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -233,6 +233,7 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 };
 module_i2c_driver(sec_pmic_i2c_driver);
 
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.472.ge94155a9ec-goog

