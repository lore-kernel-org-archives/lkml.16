Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729A324A07A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670760; cv=none; b=QTp7I2nSs9EJiHUAb4yn665jT5JxP45UWlUDkaj4c0YVtybO1svdWMc7heFRbDRYZ20cOu4tR24CTVdDeoGSMraVF4XffIFJq42613Tz1u6Wp+DlPRiIiYTiYBWINVM6DRHY+4aNq2kemgUCM0V34B+GiyuTWAC9nq2BaGL4teU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670760; c=relaxed/simple;
	bh=kEDFa+8UVBQzgPmv5eunRw1YTfTPcSizj/QHfDecNE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8/0fz7zookOOk7WyhEJtoOtQP2VJ35GA79uFyd0EwRLd85OXbunpx9FJ/n/pKAP5I5DMa97Omj/h0VUuOIt05SbNFkgcYnwzpMc+LBwdKy8GMj/bTGsVFCJ47McPT2pzB6FYTOHLwXsFvbagaLHtBqfzjoZ5rdRI2wuUo36NhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8WdtEU9; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8WdtEU9"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso1228564a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 01:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670754; x=1744275554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=f8WdtEU9vO+BsAgldDW/lpOndPTa42kz0y+sHYdaQf5AqJBGzuENzPhiGdb/7TBlNg
         mcqbzmsZtGLzYoH4qkKw/ExxjDY4a5fUn4BV9S9QYinkUtXM8l76t3vncInOVTJVe3sO
         lavU/MyOYretXqAtBUsyfhuHHNjLOSWi5Wo5se+z+aEie9xvjLSjeMIIBSWdAIwwxWRA
         70O7G+LSOdBauY6bI5R/b8Fur/ZZZ9cMJ8jMBOW1hDLNxp3PTG1WzgONdtnr8XCxvgfU
         64tEBAQdjG2T3CVsPYwXzklq0C8S6haeaw7sWLWC9Mgr6BgzoY7V4pKlW3WDuEpdYWC3
         nctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670754; x=1744275554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zep9f0d4foFUFHvL7+wCfhcQlnrOmBCem8a0X84Q4jI=;
        b=oZkhS7f3PQ0werTXOHSJxS4l7PEK0wQ4VjCNUKLu7xEOWXdgPU8quKzZC3dEwDz+e3
         WrRJXO0uwA/0ow/ujt3n/e0ssZahgOoJsemyN/jcJl/4ZRnqtJGEMCJ/oo0y76+KrJg0
         SwdTAHKncSJEYAgkPcGXyjRHRrTtdCKtmpmqtFwiMYzg9glUsrHZYky4tT5CfkwNXLpb
         uENMQmxZQI0yuUCedSWeReUlCuvT7WGaGzFRM/2FOYwAnh12f/RE7oYW4bXp+c3rrE4i
         rWjscUthNEYG+EThGKy+JOn/ZIDmy3qisy1YwceEmeM1+S1PPtWCcJvzHXfsHjkgd8Iy
         Sj5g==
X-Forwarded-Encrypted: i=1; AJvYcCVMHVudpXD2ovRVj/zVEDL8VBvvOyaDV+u2Dcd0dUQHDs11g10RG3WrsiiNcle/B3ga6Kt41374AZkmLO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmDQHogdI7c4AEWnQF/IiQ6hAxGtSaGeHeYX4qfgdFORDn5bBA
	GJ2RY0ihcEf4LxTbbDJYYbqCT0i6D3q2Nz1ZoadvQCS231Rc8q52xzDZ0KWBrKM=
X-Gm-Gg: ASbGncuwmWW8Pty9gNe9JXjA3h46nVBMmkFxrbY4pbZklng6SJQn+VzUHHSK/OCfu4r
	M2B09TObbuCEymmMGWLBHnqqMxIpi3+QnkCdvRJpFTQHFehyzIykkFkep2yYk8JsbF9QzXFoINT
	qDSQgRTUlYyUY6QMI03nl04q5qihSn3eqhNS7QfomtDrod0tBQIIWPO8svwhlOApaITIF+aPne4
	JJEhh8+Zj6hV0HGOWuYHzfuzULG96AOo1Z6eigJQhOeWOKwG69atw/i5AAWv2kMVmxDhY0niH12
	9Cy5hXbgxtjylXsWtwjT+AiVRgf/y0ZEI0aJOJmxCXOGr0TqRbmq4x/49G70u2DrB4dRhnxVsGS
	n4gCzeIFqOA3oFZoP5aDtqxv1j806
X-Google-Smtp-Source: AGHT+IHPaEYedqVEDLo93ujbRrtVNCm/mxpEYABRhJlFkwLFXs8WrbrWDofWHLr/5jqHegGOehX8ag==
X-Received: by 2002:a05:6402:5112:b0:5e6:17e6:9510 with SMTP id 4fb4d7f45d1cf-5edfcbe92b8mr15687119a12.6.1743670754243;
        Thu, 03 Apr 2025 01:59:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:15 +0100
Subject: [PATCH v3 23/32] mfd: sec: add myself as module author
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-23-b542b3505e68@linaro.org>
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

