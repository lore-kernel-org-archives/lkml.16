Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D05218EB1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231066; cv=none; b=XQQyq5597JwdxOPOlZKk19Z3mFHH81f2YBmNP5JAVQMmvVHZnsLjqgthWRlPjgfhSFcDvX6xb9kueiCp7+iZO2teVXSLiRIu4zXYVyWh5Rc0EMDlP7/5JeDeYar7CWfPN4pzX4p50TU5OYLY207LuwL4TVjwtJVR7aWAVDHOp+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231066; c=relaxed/simple;
	bh=Hu3iyZXpRaCR0lrm+kXeKWpWaXUMVhvAHxoE8tYowXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k28718Y7qDjpcgQzrc4HseIQdc6Wh6Bt26Y4XFCz+V5hLz1AdObLiWT//xAqMQkPB08WszY0+TEn029RTnDmJPU9hXrcCbjvF9zpUWYGMyieHSHSlhZfXD4aeW633Mb3QSgC4+2jsMv1FGtspoMoN9jDOv/XUAl/Q6zciDIc940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cj0oNcpr; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cj0oNcpr"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso2257351a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231058; x=1744835858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=;
        b=cj0oNcpr49Su8yi3o6BTtMZYy4ddzNWv02bHDkK61fPRVWEi0hRprBrQfbcoe4FfMb
         51bnRElKmINuLAl1Ru166txXZop5WvTPpG/UVIBafaKLATKEJJOl6oxGiFh9qM6aQfMg
         4K8zeI5dcfwPjfLTX/krWZrjVOndVc2RYbCDgs5rG/9KyAzlsFq6RHAa/ExwC+wCvSPP
         zzRWtRNCpV+nZmboXU+Asi7rjBkYJCR2xFCKvSnwhDC+u+iyeSCfIrLMyWkxYzLjlzuA
         LL7VXs77FscS7bX0e3EyJXU+f0PmzHuyXit5ZHWLM5LSHjw7obmNGx0SVB2ZX4k/HI03
         SR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231058; x=1744835858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=;
        b=dRqvaSiaFbz4pMiScIpKByg34pKiig1/vPFKWgOr3PDmXN6yTVWBNuqOcTIQmt6veV
         svPM35AnX+7qDjnbtvkYa8foQGTMqGOy0DtHqdOYXDMxUYq5jG9DH3CsyTX2wqUA1lnq
         GorBqdtKlD7sP1vj6AHn6u2Cpv0OCvAgnV55lujSYpdqBCYeyr8giQUeZNur5h5aFFyK
         zpG0pXYkFKJtsFRqvD1EJe1FyOmQG4jaN/Tb9FE6jS4C5C8vc6Qn/PORgsmSYAcSdLgk
         twcH8qDBNlx1zyo2ru6+NEeQJjjV2Pjun/R73VgHP/daG+qHOASDpOE0sqD1i8jv0Udk
         ycCg==
X-Forwarded-Encrypted: i=1; AJvYcCVd1cL0yvo9g2p4Rl2qVshx4zPHYpSLhFEvxiRPyrP++H9OwZORicWgILz+ULXdlhaewox9FkFXYpRaRnE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu/Qu/LZWbrJRAy0de9Hi1RJQ4hkyPLbfPKJ9zIFErzpBf5sEA
	fbhbjSRdFfMT8+1Ven0v27LrA8ASJ1Z2bzijqWGBjkpHXsJ4q3Sm/vVSUSvYQso=
X-Gm-Gg: ASbGnctlhsMQhwu6Y0UMbSrnOxfZkOjPVagXljUbMkRmn8MIqfrAs71y8Jy30mhT2iU
	/GOZxSu9K7FRNpPZvk6f/bvhHFXqv1Z2sItY1ZL56R5T9+aheHhtbEOptmbMVjzDXY6aMa/WzVH
	JV3mbZj1jrizcrRD99W6nHZUGpD1IitZzOuNXVegbiThKx9vtROK6dmeO6+QMPwwsjO+fBYNSsN
	lxOWKOY9jmaKWB3vnGVpgeYG5eVdx4/r29HNBVPCtFsd0TqF/0A6KIDIDGdKfI6Ugi/eM3CsTZs
	PXrwHj2GtWIDmwlGrZwBvOGznY3sIuCgr+K67Z2Nod3ky0R6GpVtYuwemgjNFD+Qy7rQlDI1IWF
	5dor7o5FZqkWEJLhYFiox3VSv+JE=
X-Google-Smtp-Source: AGHT+IFs5jQKKi9PBtsfwcpWP0uR3pXLFKhxM09QGSN5rk/PWUonr2doF0wyNuXkGit6lSL1qy8RxA==
X-Received: by 2002:a17:907:1ca3:b0:ac6:d368:aa97 with SMTP id a640c23a62f3a-acabbee8c8emr16347466b.10.1744231057853;
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:37 +0100
Subject: [PATCH v4 16/32] mfd: sec-common: Don't ignore errors from
 sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-16-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.604.gff1f9ca942-goog

