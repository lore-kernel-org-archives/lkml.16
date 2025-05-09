Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CAE290BB7
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788828; cv=none; b=aTKXEzWS4T0nj+sV6Oxu+XhZraBEbX+7Imsf977chVD6khLUIoSfcZdm4hGMzdc0owml3bqhKf21jeeTV8KZZWhaPKZty/OHzU0lBH/67qM5Fz5pTPJHJj91HXpEhsAbFQ73Y9/aGwDMX3kAO7oFeFVyhQg5ZKHpChDdLLrUvNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788828; c=relaxed/simple;
	bh=xranPDn1OkC/NMUiO3u7jz/wgKrHQyAzstGTneAYvJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TvD6//FFec6Heuyojey6BIkpJfbhXXOVeXDACIzyaYni0fsMmEcSSfhpGEICXCX2Bp65gxiVOPl0p23rqBnO/tijhJzCfCg23lo5AiVGhC8xYW+ykKbRUhhoylPfF7sz6L9xIrinkxFNR0SpSiHJCd46eLgq+VKxPI6jqvLDixk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tADtBuj2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tADtBuj2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a108684f90so1015391f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788824; x=1747393624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/ugUs7fJj63IN/MNSKX5UMLi4/fRK7xsOMmgdlrCl8=;
        b=tADtBuj2ACcYtc6anYQGg1c1PTCpJPHv+zQuWM0YaC3aJDyaMSSbzAwz0MjpQDW4Lx
         CVIg79ZG72kmS+b0LmZhliIymGi9jhEHq0oPv0cI7omaxYTPGPkeXzxQKP/yPIPcsoZV
         RJ07pX4bYCtJX8Htkn2DVX74I7g8azDwY35sC0Ry5tAT/2NuihUa6GTeKyzdvX4eRGDW
         RogW5TR93r+QsAqDKO6YdO+xN6L/AoQNX5Rht8i2mrWzD1Rm7J3UKheazNQ0nyWZAZ8S
         gmXDKQs3sIeo3vr4/IkN07UgONRZuDMf4xyW2tlo5Hx2K/EQS7crC08TAQQxMI7gR/C5
         moQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788824; x=1747393624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/ugUs7fJj63IN/MNSKX5UMLi4/fRK7xsOMmgdlrCl8=;
        b=tMVuus7OeCZg3SqXbGLOwURgw0sqb9Zc3J+W/jeDLWrD3mNPxqDPy6bbOi3j9M3t3G
         wHeyCKrKk/DHeQFX6b7HWUjvQCJvpGv10EDyQSJez53K/uEGQek4yncmpxzOPAuAzyOn
         m79Qn7/JxF+CQIxZORGadUzarIBHaxE44vSFP3SrKScqYMREGs4VTdNf0KyBz3oBeqvq
         G7oh1l/mDXN4vPKMkSjMuwp2dmg7RhxhGbpLAottuZp8JNuMxvVtWqnplW138zTPd6+r
         w+xPgSMoT73aQpRhFftSnv9ukF0b85LYrwLsUn4yln8RqThysdTKjcrt28S1gxqWPj56
         AExw==
X-Forwarded-Encrypted: i=1; AJvYcCUR7yu7lhmq+u4gfYmwFdGaEZoNbXJVYKnaf5JLLYHE2SdBxjvEivadQryX1jM6Y5q2oA/ZHtO6/db9TAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE3AQvK39hre2gJaAruwcWmI1e06vgkMRkIZp5hYaLGDaw9nA7
	WqqT0WIYjNiz8N6NikfW+cbowCWMiCxqG+lHCzZXsP9NLrhuxT4Oluwgf99LtDg=
X-Gm-Gg: ASbGncukkwRdK9k5+LhIc6qho+K8bbcYEQUn30JV2zCb41gPiVO2jf8DbRWwoLbLXwl
	qAxhWnLS2ty3ChrC6ojm+7cM09F0WJM69aZjAwsOXeVbxCUrxqU8rzn0FRNbi+HLB1f3Ga8v4Sx
	0XqLoxTPBNUkE+EEVwL6LAKAkbCxjsOhdOpDyqrA5zpCF+VsPdCNpGgPA+YFjiOXc4aBCGeNw+1
	4x72gOv3/x0YlUMJWWMdCuPxsjp+gswetF/Hhw1RYlTSoa1kVH5a1eO6h8WL01uHwBQ7klwwIo8
	+8l6D7fxxiShLcRJnf/GnnE5KawF8sw/E8OHg4GFvqNJj4I=
X-Google-Smtp-Source: AGHT+IGt4VaJbNHq9FNQxWvc/835NhTOA2iiwAH7rDv6mlJrY9Iqd6PFdsksfuN5qOW+kOzhHmEEPA==
X-Received: by 2002:a05:6000:2404:b0:39c:c64e:cf58 with SMTP id ffacd0b85a97d-3a1f64ab930mr2978779f8f.55.1746788824315;
        Fri, 09 May 2025 04:07:04 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:54 +0100
Subject: [PATCH 07/14] spi: spi-fsl-dspi: Reset SR flags before sending a
 new message
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-7-32bfcd2fea11@linaro.org>
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

From: Larisa Grigore <larisa.grigore@nxp.com>

If, in a previous transfer, the controller sends more data than expected
by the DSPI target, SR.RFDF (RX FIFO is not empty) will remain asserted.
When flushing the FIFOs at the beginning of a new transfer (writing 1
into MCR.CLR_TXF and MCR.CLR_RXF), SR.RFDF should also be cleared.
Otherwise, when running in target mode with DMA, if SR.RFDF remains
asserted, the DMA callback will be fired before the controller sends any
data.

Take this opportunity to reset all Status Register fields. This is
required for enabling target mode for S32G in a later commit.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 902bf23d276a..b7363cfc649d 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1063,6 +1063,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				   SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF,
 				   SPI_MCR_CLR_TXF | SPI_MCR_CLR_RXF);
 
+		regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
+
 		spi_take_timestamp_pre(dspi->ctlr, dspi->cur_transfer,
 				       dspi->progress, !dspi->irq);
 

-- 
2.34.1

