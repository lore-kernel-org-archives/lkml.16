Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB2619F43A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168683; cv=none; b=kYoDyDJywiMJpQ6V/uKeyLLdNtcbonTveAJ+rcE+b5BCc0v7nI9SE02Mony5ZEGOiLboXyqaQmUXSGqQv747boYuX8H+/cKAsIACkLe11m1eglM8fueytS6J8ytbsZ4vamSnoLaBAon34zXuqsU7qKNq3MLPPx1qddOVid//5GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168683; c=relaxed/simple;
	bh=GESUUSr32C5v+JmyTkWMyaf4NO/174Vzhegyb1L9aRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k1PkwNXvQF7dK/QvFPjSCDvdAATVe+HKsl10TXWKGi/36jL/kZmURh6tFwR4zO5lnaigUJBLVLZUgWepjuTb21KPgzpcMaKrWR6zQKRhkwWoYnasWvIh5WfIqgOSqyQJ9lJaylz13Mi0tR7y75izJ9zWqssO0ZAKcmphkhm5+F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=izLlhMIt; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="izLlhMIt"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso3368205a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168671; x=1743773471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=izLlhMItkSCPPn04H12db6y4JXy1vE2dAPqkbZ4qaokCUOCDBrppNeqbMlgmOkqevT
         XlxPCKzrQx2BDyIQtCaNDAGlbEe/HBuMs2mdhZxjtVlqNPR25hYoKb/mkvxKOLHhINKG
         FSAbOJEMLhm8AM5Y9miRdPIwIx5cFBYy820uhg6hdf0bKv8mx0jrIcPoEriiIcXtXOaU
         iSXZWuWpE1M6XYYl2rXGB/I5AbNE3dFVTtYqdQBnAun87IntOCpMbVOXFzlKFnU1Xj+h
         e0YNOT31Qu8Nr97EfXcOa9pdxZ7C/CpdD6i63I+0O4RPojZbqpNLYqTa46L6AX0BGB60
         Pbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168671; x=1743773471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PSEpA1j4+zmEauzOiOoF/mVKhD6CkjV25eyM5OWecNk=;
        b=hjqawGV3tOiv00r1WKSHwYeXLyGa9AZR4nKZdW0dAgRnpXW41i3IS1V2TURSE1mX0s
         EcyHbRGYBaAO/YzDjNePENCBzlpLz/+YSG3V41IbJKrimJWa7kBRjfLu9tSqxbIvF106
         wj2SGejT7Bq0vNi2r52jWwmOzwhwZKwDzz54XofCcv7A+sO95Pfe9U5e/nk3kG4rG4Hg
         IKwHJf2AB88upDaZv3sB9iewIv0R0sY+JVwgPASW0GvAPN24CyK2KD3HHSv8Xa+2Wbho
         JzPgKSg/Sc8U48YYB3yFzL86A8wlEpR0Kj/FRnAS2rPg/6LptWr8svP50s1beG5pUUDc
         40lA==
X-Forwarded-Encrypted: i=1; AJvYcCUlbb2mDsfWfZyL5xZrM8QwTuKQ4PEeHmIoWr0wcCE4135mnWmCg24POjVtbx1shP69NC5Q+MxV7lrA66w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdU5AC99ZQnetluy5flz3t4TgE9J+mAhnsCYZchD7c7+AE4gW4
	B/iYP+cJeY4W/moAMSdx0xH4qs9/AKay0FJZCss3cv2RcpcuimzCz1ZvHIEV8Ug=
X-Gm-Gg: ASbGncvQyalKmyG+1Mjkrusws5ilvfmwGQWOfnoZBCjBHmfJniMBCsoPWpSpXtHoR/b
	U82CqG4UkkRs8N+pBT31+6vIMuUiKFQsxF/LuV5EU1qJrPLEToqqUnQd8cmSXlXKmh+q4A56VHK
	JafpX9xiy5Vj5TJElwyBsgnguHC+2zA5ktfoaVi72qCPsHoqL3Kg9cYTxVE3WmnThxy14EDoLZ2
	gAwYi8uTm9m52x6NFWy42It+quGvb2m1strT0sWFqDlfSO8oXTLeCQOGyurjDKgLfJxUx8P5Hcs
	jLdMDI94hz3QSNGd+ENGnjWVzIlC6tTtOSFhINTZwLrjUJDep+k+feO8jTfk7exzUG62EmPm/dP
	f1Kovms/0fwkexy2zS8Px4RxFfjqS
X-Google-Smtp-Source: AGHT+IFSs1uiz+MYEgU+bUhAfh3+GZqO0SVgrjZOqgHDorj3bQXBjGPLvsOv5IgyeRPZA7NSU+kGow==
X-Received: by 2002:a05:6402:268c:b0:5e5:c3bc:f4e0 with SMTP id 4fb4d7f45d1cf-5ed8f80a51amr7531556a12.29.1743168670656;
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:17 +0000
Subject: [PATCH v2 31/32] rtc: s5m: replace open-coded read/modify/write
 registers with regmap helpers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-31-b54dee33fb6b@linaro.org>
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

Instead of the open-coded read/modify/write sequence, we can simply use
the regmap helpers regmap_set_bits() and regmap_update_bits()
respectively.

This makes the code easier to read, and avoids extra work in case the
underlying bus supports updating bits via
struct regmap_bus::reg_update_bits() directly (which is the case for
S2MPG10 on gs101 where this driver communicates via ACPM).

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index fb65a8e439d72d9070751c00f5826a403ac0b416..2ad01fb3bc72fe9259a8307584c9cf3a839bd492 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -279,17 +279,9 @@ static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
 static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "failed to read update reg(%d)\n", ret);
-		return ret;
-	}
-
-	data |= info->regs->write_time_udr_mask;
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+			      info->regs->write_time_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
 		return ret;
@@ -303,19 +295,12 @@ static int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
 static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 {
 	int ret;
-	unsigned int data;
-
-	ret = regmap_read(info->regmap, info->regs->udr_update, &data);
-	if (ret < 0) {
-		dev_err(info->dev, "%s: fail to read update reg(%d)\n",
-			__func__, ret);
-		return ret;
-	}
+	unsigned int udr_mask;
 
-	data |= info->regs->write_alarm_udr_mask;
+	udr_mask = info->regs->write_alarm_udr_mask;
 	switch (info->device_type) {
 	case S5M8767X:
-		data &= ~S5M_RTC_TIME_EN_MASK;
+		udr_mask |= S5M_RTC_TIME_EN_MASK;
 		break;
 	case S2MPG10:
 	case S2MPS15X:
@@ -327,7 +312,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 		return -EINVAL;
 	}
 
-	ret = regmap_write(info->regmap, info->regs->udr_update, data);
+	ret = regmap_update_bits(info->regmap, info->regs->udr_update,
+				 udr_mask, info->regs->write_alarm_udr_mask);
 	if (ret < 0) {
 		dev_err(info->dev, "%s: fail to write update reg(%d)\n",
 			__func__, ret);

-- 
2.49.0.472.ge94155a9ec-goog

