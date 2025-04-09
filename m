Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B4E214201
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231067; cv=none; b=mTr7PDQ/qUrZvkDAHbVPKZSurvI+kBLBvzY65Dvl3A+uAM0jzx3zjYVOMbl4/SSoy2PXAH9Jz3HenpBpdYAytZ9ZQUAXpFRbEiGSVhwBdoa/yrFnuR2OOGWIsqrTLNEYCEZ75mbWfAH++SySSvMytHP4YgzOlOX/S9AKuY9Igs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231067; c=relaxed/simple;
	bh=+hryrykXS9VQjW9x2uaLv9FXNLWJHO9HAediWJbl+4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D87ctGXnmFU6ICD/O0kRuFgJLT7Wbd/CXwITqYMhdPc5Y0YU0Ks93PKR4juCaUjb9amGVHh+AAUpc/sNUgvYCLbmdvozRkX+xn9SkbYYOTn+KTpnKIYWzEYq+MPysb2YLrpFZwzHyIH0sRzQtZ6jSbvOJ/MVYCwzY2fTiY2TJSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e+6DrJtq; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e+6DrJtq"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso191612a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231059; x=1744835859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=;
        b=e+6DrJtqOp556vcssHT+q3B6i4qOa9LWOWl115rrXNQXL/128L8QSZhuhFRvH4nXCc
         IQnYgA3TCRYUSfZsMOTOwaOdsRmojSclYyGBhNIxJk8PqUu0KJ1iY5Y89Bu62ErH+4E/
         8NPnOFTdlLGC10zyRIXXlMCZhGNSbsHwxtgxmpEal9oXXaI034xXvyZg8v+u6c4adCSA
         GQNKoryE4r66GBb3IsIRxHtKOShhVHMUas3f9TRNVBggubcYLjErS4bH09Sy//WmykoW
         kLXlYKgBxgU984k0nLK41F/aFF9rMO9UqI42ESVYIG9kk+3bjaTDvxkAFPHQ8MnalVhh
         8QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231059; x=1744835859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsTeSqRDsCA5+cibF5ZIdcCibqmvRgKvrsS7xjyPMNg=;
        b=mFoc/BUfy/a04i/vW60/r9i72hap7bn2Otid/vZL0TkWLF5t4hCFicMbMUM2LHytzh
         CDVuCJUZlgCi0KnCDb1R52i/ZkvPP+egJZVokgjWAgQ7/yzE+x/6HM+pne/EqS2HabKC
         OzeGSs3TD5B0LoIVcT04RV6X+sn1co9ewkbfquYE/oJNU7jr18fMQL1Ab5E9F2ToL0/Q
         rayCmoeSwr6kXkGPG4kTwZ1/bNzQLRCyM3R9N81xeGYqnpWDEy0Qaix09nbEHK/3/OP0
         DRJCk0dzSyku0uhY13Qv20nnRYrNiTNey7XByxVBcXmuz7XiJ+C+6vEKKlcgC54NwtAs
         10HA==
X-Forwarded-Encrypted: i=1; AJvYcCXTjxEILaDHVXYy0JjYhficfzvkzi06GeYDewuIyeklW7ekYVDwN19pGeUpAld7Z5o1XoFJHnLaLZyQ034=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ocHjQX8e6rEDxQ80x0HOC7PuFplxQlBJ8rJiM+x+ukyLLSET
	TMO8fn7E4/gdQA9pVHdj+lcYXFT0eCOmMKzlYz4sYuJJY8KO7phOX81IoKv4tgw=
X-Gm-Gg: ASbGncuaoNfY0WZj7LFd9vzvb47Bo23x1Mfg+B2zc0htxYzIMBuF9r//Na53SmWZbhX
	+MhpeJvQ2CD7pSFk0YEyVHuu9e4TKrTPJ1/JgAUy3bTQ4sKIuphCLbxlO4VnZiqb5qGS8dCKlDc
	Pj3/+eEB/WwHqSIq/lCZ/4aljev9MbZTFBuaY/LqcvpozkqcH/WOuEMHHg7akH3lZPe4c4FvbFr
	BJeeteP2nV/t5ck6p1XBa/ubDgbJHQ9NkWKf10gGtnIM6ZUq+x2FuojWRnHZlZGUNwrtS0KLWFV
	6hSe3C+AO8bY07Pt0x8Dg6NB1OmEIybJxfI8+ScTbYsE9C28LqbkFmMmKJSPbRq/c9XLCrK1jF4
	nEgHt6K80Frpa7Q6MpEOGrQYcwlw=
X-Google-Smtp-Source: AGHT+IFaBUkiGU7OFSd2C8+eXihngB2V9lqLexzEyqiPbNYC3ushPCaeGAspEyeXYhQ5fM5m2o3CBA==
X-Received: by 2002:a17:907:c1b:b0:ac4:5f1:a129 with SMTP id a640c23a62f3a-acabd1dda12mr11931066b.15.1744231059324;
        Wed, 09 Apr 2025 13:37:39 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:40 +0100
Subject: [PATCH v4 19/32] mfd: sec: Don't compare against NULL / 0 for
 errors, use !
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-19-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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

Follow general style and use if (!arg) instead of comparing against
NULL.

While at it, drop a useless init in sec-irq.c.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 2 +-
 drivers/mfd/sec-irq.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 4871492548f5efde4248b5b3db74045ec8c9d676..55edeb0f73ff4643f23b9759b115658d3bf03e9a 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -164,7 +164,7 @@ int sec_pmic_probe(struct device *dev, int device_type, unsigned int irq,
 	int ret, num_sec_devs;
 
 	sec_pmic = devm_kzalloc(dev, sizeof(struct sec_pmic_dev), GFP_KERNEL);
-	if (sec_pmic == NULL)
+	if (!sec_pmic)
 		return -ENOMEM;
 
 	dev_set_drvdata(dev, sec_pmic);
diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index 54c674574c701eec979d8c6a94909b78dcc77065..4a6585a6acdb71d2fb368ddf38463f001e513c7c 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -448,8 +448,8 @@ static const struct regmap_irq_chip s5m8767_irq_chip = {
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 {
-	int ret = 0;
 	const struct regmap_irq_chip *sec_irq_chip;
+	int ret;
 
 	switch (sec_pmic->device_type) {
 	case S5M8767X:
@@ -496,7 +496,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
 				       sec_pmic->irq, IRQF_ONESHOT,
 				       0, sec_irq_chip, &sec_pmic->irq_data);
-	if (ret != 0)
+	if (ret)
 		return dev_err_probe(sec_pmic->dev, ret,
 				     "Failed to add %s IRQ chip\n",
 				     sec_irq_chip->name);

-- 
2.49.0.604.gff1f9ca942-goog

