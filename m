Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB57A28F932
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788820; cv=none; b=rck4BHOQtILdRhwRQk+RwKnV+cLh/5PJmimmpp1uDapSlS3aOQAzGaSHbXQG9C4Zq8F2XAtNKLXXlk1wablHzfySqZ3s9bt9jL3MMJ+NdCw3hbQPrXQ9Yoy8qJ03elfsNgcMhnVrPcm/TGTLpEDKvSLE3nhxJmQxUFPmfNADnvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788820; c=relaxed/simple;
	bh=lNzAOm2fsnFGf82dcqxl1YBX/mz6uR9h5/TJgWh82NI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kSgqgBde2vwpZFdOjccS9ihMjU7NDdRI0ZN7pKPhWajSntSj2wEZF17YqBGfz2X7SCBs3M6ydokG1431HhVe4lwqNxQKYutDvWSAkeNehiuLpfLi8EY1uM/5uPiFkQDCQGGndSivifWHJkneFKJAkIrJ4PdQ8bMADhsnyY8/v2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bA2PtdQe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bA2PtdQe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0b9625662so1448080f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788817; x=1747393617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+3jb/fX+IugayjdNWEytVWeF5yooMmRjS6ouVsYvEU=;
        b=bA2PtdQeVxJdFWl6Ek4y4qB9rQ8yAYJTIWzbu6cUYgSQ+dQDGP58p6R+9nQRusPq7m
         +MnGkujJLu45OkTrpWF2vkWnZhHdGk+gLGdzJtnbVXOmHnU9jAaVwUwdbaoJT7g9L5R3
         xykWYQPvEr1l4TRBIvazL+EGgNS3cbFNMNGh9b6q2ZuPU1WHcCL29fKG37V19n+oWDJh
         o5f36b1A4lrcr6vvc5tC6U7BZrNNd/LbmdwuTUSoC6EmrV4047cLnsYpP4F5w4B2MPau
         rCqCVgxBjXF5eiMj2/tQ1V/r6uejsJLQdbgWeKs5tGZNhK3BgSsVL2kBkr/EEfua760u
         5zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788817; x=1747393617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+3jb/fX+IugayjdNWEytVWeF5yooMmRjS6ouVsYvEU=;
        b=cUPwIYLyf8AH9245TofjrhS4XIF5mDNrgpJqvklgIJiK1fnnz/ua8UQ4I3lITzUp4B
         l3A/1vckUc30pW0YR144UW86Z7eANplQG8gUOxC1ofkps4TBnBMbfLzvaPG5JBMkTkhb
         lMWokza3Mr0QaGerJzm2VtGSUr3xHJuRwb5wwnFDz8TQ8tyEdlAgTkLIn4XuaheTffxB
         qvC6SWYzIl+FJpkbniIG0Yi1vzMMgcHygT6Mn9SbHTs9MqNuAAoFiJbhxxsGD4g1bNMy
         LJtMqcR1PVvMOdTQNZDFnjSnfZmQ1ki4c9ZOp3WyjLH59WEwi105OYosI32KJwyMbLiE
         aJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCVWQdc3zM+kO9WQaC7COYL4chP01pdIJVn3oKUDvlf38f8nb2MHBzC+lXmHoq9jp5OcIVpHvvFZJ38lT5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQf07mbS4VoLR13AIpvWO9r2SewdzuxgrejGYf7wiN4r+9qYsB
	pJj2T9lxNcd2noqo4Ix1pnM/IogtLUR43W02Ot3gTM3x2QPa53telzBxiiUbNec=
X-Gm-Gg: ASbGnct8QCGXCIu1Hueko8eUGeyZSfeQKUT5NP/+98hiKw7UguoJXAPXtcOWYdyd1fQ
	rBmCsvgQgga6GQPfCJzHf1ErabKkkeVWzOaFqMb94XBW1KVNPuqz1GqFvLPNfXVHsEB9QvIi7IW
	IYjDPLog5g0SA8Na3KTocxngtiiBdP/u9aygZB6iDHziszVHZQ/NFq/duY94OML4pBLHYgP+NFQ
	XJrQWdnRWYtZb1muUzj+dUgoL8Eg4xN7/8VeKT0qQLZGhxzS0SU9t/ya5CaNHhyJGQdio2OG6Dg
	JlfBuyJn+8idDd2gIc+H5bIdHfjajtET36seAIviGbl9KRHSR8g0/J1rgw==
X-Google-Smtp-Source: AGHT+IFC6m07o95wlBL8z66ZHFQZFey0yAwlkLMNz025uhOiNU0gJ9upByEMU9FvrvfyyVzrnKIsgw==
X-Received: by 2002:a05:6000:4287:b0:3a0:8c45:d41b with SMTP id ffacd0b85a97d-3a1f6457726mr2691256f8f.20.1746788817253;
        Fri, 09 May 2025 04:06:57 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:06:56 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:49 +0100
Subject: [PATCH 02/14] spi: spi-fsl-dspi: Re-use one volatile regmap for
 both device types
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-2-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

max_register overrides anything in the volatile ranges, so we can get
away with sharing the same one for both types. In a later commit we'll
add more devices and also read/write ranges which also override volatile
ranges so this avoids adding even more duplication.

No functional changes.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 31ea8ce81e98..cb0e55a49eea 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -141,6 +141,7 @@ static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
 	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
+	regmap_reg_range(SPI_SREX, SPI_SREX)
 };
 
 static const struct regmap_access_table dspi_volatile_table = {
@@ -148,18 +149,6 @@ static const struct regmap_access_table dspi_volatile_table = {
 	.n_yes_ranges	= ARRAY_SIZE(dspi_volatile_ranges),
 };
 
-static const struct regmap_range dspi_xspi_volatile_ranges[] = {
-	regmap_reg_range(SPI_MCR, SPI_TCR),
-	regmap_reg_range(SPI_SR, SPI_SR),
-	regmap_reg_range(SPI_PUSHR, SPI_RXFR3),
-	regmap_reg_range(SPI_SREX, SPI_SREX),
-};
-
-static const struct regmap_access_table dspi_xspi_volatile_table = {
-	.yes_ranges	= dspi_xspi_volatile_ranges,
-	.n_yes_ranges	= ARRAY_SIZE(dspi_xspi_volatile_ranges),
-};
-
 enum {
 	DSPI_REGMAP,
 	DSPI_XSPI_REGMAP,
@@ -179,7 +168,7 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.val_bits	= 32,
 		.reg_stride	= 4,
 		.max_register	= 0x13c,
-		.volatile_table	= &dspi_xspi_volatile_table
+		.volatile_table	= &dspi_volatile_table
 	},
 	[DSPI_PUSHR] = {
 		.name		= "pushr",

-- 
2.34.1

