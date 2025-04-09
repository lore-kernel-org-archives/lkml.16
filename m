Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EEF21C179
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233475; cv=none; b=nag8s2QwpGoxQsvnanVkBrNNvGwH/7k+mZWZ82HxEbrbQ9vtcUfIIB2eCBtZC1opD8YmUoe1si4N7c69Sf6unkX5nhXHtGbPOs+C1Qi4D0MtsCJiss0DLNrfv8jOX2TBE0z0e6LHcLwLu7HrDrIm8yIdX8FL679hJmXWM9aP4YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233475; c=relaxed/simple;
	bh=i6QMZeQliBXGkXhmELOM3S9fM4/68sTvez+Y1SdurqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKOK9d+LAiMx4EOeDllISeb4EoC52Dg20RXyZTKWJM8GBLKWUhTQXVZ+eUmDO48HckYLHO0P3h2WgYTcbIHWh6qO5MuEt15jw1M0TJImXrRsOyM2+vTnViGuU52sZS0906ICOaat8MSUggdT5moXTpQNtyrGcuLrIIjqSADN4OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Jv5U8pSw; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Jv5U8pSw"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso7176839f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744233472; x=1744838272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGqNrfhRW/VPigxjf78Q+G9LQoValPWHjpgKCcSc0+A=;
        b=Jv5U8pSwGE5dCm5GzyKQtQnvrY7WWQlmE2bKPetwdPURqru1LDDAqAYi8gRJWtS3HT
         WOpnQ1gKikOkH7LaOsFkvCl+CYFugwQFQ9hNBfiZKKHa5BLaHdtHdXUUru3NA91HyNts
         wtEAWQZLhTJ0fBI8u0+KoYCmKTogGuHzrWk2KCWBQyXUnj9dRBGTDa8g5FFnOMVYXGhD
         kI8zoa1bA9ZHcb4QOIK6SW6u4hvoYL6siQgEji8XZ+IuwMbGSD/iyVxAYVtiuzXZ1KON
         xNjSQaLlmqZ0TI56H+h8OU7UVQLmzQ+xtocJBcSxchDjQ1SepNmvD+R5mR7ovcnlWbv9
         +lrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744233472; x=1744838272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGqNrfhRW/VPigxjf78Q+G9LQoValPWHjpgKCcSc0+A=;
        b=dhllrk4t74wCaZHhMIlC4EbfULYnkEnsbZ9QsQUEWFYSlvd0i3M2mZb4mHD5UZ3kwc
         yuTGc6haxMKrlkfsfBFGtWnjduAr2ttnqlMs5JEUAXYqy+KPCAt6pw9AUSDcBaL8Z8vS
         wfIwA3UfycawXExcAR4g6bxC9SYBMMZ1a1LutiS/b45Y2eTL19ZF0Qlp8R0NgTwevnnM
         MpJomH+jMjvXJ3Q5iYuj4LuKBdoqtcH+RJeJQTkjptbTjWJsW2R9PFUYr7e4ZQVTfhpp
         lYq8tOoynIdjSm5HhXHoYrH6by8NAYfvh8WBrYuKTO3PIqT7tPaX3NcY7EINQh8vbr6q
         YoRw==
X-Forwarded-Encrypted: i=1; AJvYcCXvSH9NBc1vwy4/JG5Tuwg0E/t7fnb4dpwjsds4NrqTFa4zbpfHFNu6RXEBhOgYC+HaM4FeKZ3RMbtr+Gc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRqoFl07czsp1gji4KV4be+nW1xeFWrgqfQayNTvLatK67ex/5
	DZYbRico9TLTAAC0IZCdF6zcgjtG7OYMBb7VAkYhlyIhqQ4VaGdsnP+ksecf6bA=
X-Gm-Gg: ASbGnctaKIrNnIkHrOCFd8bcnV/sf7gPWcX7G+oa7IdHLrW7tECVaHnF3MkMwIDXQSt
	msuK/q5SOmyr8HQ2cOJevHnjCoQmAHOLnkrK/n/YBVPssnEcbPKGfAja7BzeagKKG6q9llwkPLl
	2M57WV+1a07OYiMwrInqdou/ZtBvF0jbC7VkVUlH1YRgf0rAlsV3IK92I1yBbMIr/b3Cn1oD000
	UyaKG8vciJHEpckN+Ylu0qkvqfBWbIaCufoOcgcwdBBKTYN2cF8AZwP71rDp8igC344ED4r0U/P
	wiP0fYxHE+wlO0YGfwvGVOymiBEZGM3AVkll55slULKSL2wCDSzj+Wz1mrqpEfXTimuBelaCakH
	8srxX33SQwZ/HZA==
X-Google-Smtp-Source: AGHT+IFEHPef9F0uv3pXsoWPI4R+kvDCIMm2kirESEgvm8sQs83/WxUO71MEUbAIM50tLqB7gPts0w==
X-Received: by 2002:a05:6602:19c3:b0:85b:3ae9:da01 with SMTP id ca18e2360f4ac-8616f19e832mr27550439f.4.1744233471871;
        Wed, 09 Apr 2025 14:17:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf8e91sm420735173.6.2025.04.09.14.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 14:17:51 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] clk: spacemit: make clocks optional
Date: Wed,  9 Apr 2025 16:17:38 -0500
Message-ID: <20250409211741.1171584-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211741.1171584-1-elder@riscstar.com>
References: <20250409211741.1171584-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some syscon devices that support both clocks and resets,
but for now only their reset functionality is required.  Make
defining clocks optional for a SpacemiT CCU, though at least one
clock or at least one reset controller must be defined.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 7715cd38434f7..201ffefa5fa9f 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1369,12 +1369,17 @@ static const struct reset_control_ops spacemit_reset_control_ops = {
 };
 
 static int spacemit_ccu_register(struct device *dev,
-				 struct regmap *regmap, struct regmap *lock_regmap,
+				 struct regmap *regmap,
+				 struct regmap *lock_regmap,
 				 const struct spacemit_ccu_data *data)
 {
 	struct clk_hw_onecell_data *clk_data;
 	int i, ret;
 
+	/* Clocks are optional */
+	if (!data->clk_hws)
+		return 0;
+
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->clk_num),
 				GFP_KERNEL);
 	if (!clk_data)
@@ -1486,6 +1491,7 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/* Match data is required; its clk_hws or reset_data field must be non-null */
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
-- 
2.45.2

