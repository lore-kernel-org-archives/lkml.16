Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D2728FFF0
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788825; cv=none; b=pw44MYmdXZspCQtScDC0CcOl9t/hLX0trvYmrNpso7pd/hNwJw+wTHBoNw6VovA3ERkOcP9kvInlhiFIhnhPX9Y0d8GSVzZU8ZaoNCFV797EaenM+RQLE59bdCDaNV10jBLTRHVc7wCiCvmqqrj4hCVkVGYtjZx4WmjNCO1gpB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788825; c=relaxed/simple;
	bh=D+fL2YJhn78smRy/FVA67pJck8oxKruZt+xjNMzmkhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QSXC8WpDWzhuf5z77HNpxiznk8r57IBu5eV9XWwLr6mAFjVn4abkxgxfCH5QSIwnehlSRHIHVL/d8/vrQfZ4dNaIuBURpl9xnYY8WR+Skrt2VlJvslOSutOABXIgucREpPZJueofnck2qnNeyPkcUDXZC1LIMjbYS6nN3m3Utfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BaJbqu2w; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BaJbqu2w"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0b6aa08e5so1820265f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788821; x=1747393621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82buFIB+rtX6lyncKzfqQ1BjFEonYyuZcyA3lmRU5C8=;
        b=BaJbqu2wieti/Q0iXiU+KNwCmkqfsm46IRcDT0Ic90dMo041YTrb3WmtPFulT0II0e
         L+yMYlMpzk0s7RWVxkjun3Yov7fspRHi8yldOAvdwqU9uXRzDNDmCqTalhdMqSkXVON9
         7B3Q2fxNae95yl5+xosoUTK15kaGYO31ca3SYoA2txh1cm8I5NaniZ4NemfEI94GyD1L
         17ANwzPmnIHbkL6ps4zGKecybSfSlV4Z5yTdloKCkEzsioap3E4GsvCe+6AH2Sh+UQBQ
         a1NHtQK3mjpP5NefEP0FX3uLP2FZDqmruTce93z7ga8x+sabKe+oCO+1eTOjuf+lgAm6
         Qndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788821; x=1747393621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82buFIB+rtX6lyncKzfqQ1BjFEonYyuZcyA3lmRU5C8=;
        b=to1nt4APMCibPoukeGhx7xyCer+UqMENC9DUVmW7JqiGKxQSwIlI9nM4zlo9HT3Rvb
         oQVsM3T3c+3IRHnNfdHmpB/SDYpNONHYtEe/z3QpujVG7TyuyJLdAuBVdMlaE9CfOtC0
         9VldrpmJ1oucQUXlW69EZchBZhHrbbkFD7/ItNbPd8GOZD7h02qEa2wsTDsd3tIy9R13
         nxGD6eqYsyrnHhrR6cp4DQ1XBR6B6BbImcFva50BjMJCUBqkLuKw8u7UwT+FzdhFWHW1
         8EQNx8eKPeXhFOpCFEQcYcp4eUpAlUSVuwTGadg8ZjHbivN/oosse3lDCRxXb34u068/
         y2DA==
X-Forwarded-Encrypted: i=1; AJvYcCXxRDGMkIGwGQC5Z0Ld2mhVMVftnibpHREbtE5haYlngCRy7zLGFJN+mBLbkxmAqQPH9tnQFKzcBzlHarI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3j/tZkXvq3La/HBXPnFs5n6b9JBDgdvqx+/OepNeWMnj2iWQm
	d10UhoJyq9BXAfeQRSANspjN6dQHhvD3laka8VFyCB/CEy7oOw66+kSJW3tPxnY=
X-Gm-Gg: ASbGncul7BdeyLUQi57PMICQ+wAx8CnHM5AmkXF4jzxnilFkpZX29J91m41sxReTql0
	y4kj/fQldp0MF+PyJ79EPxff6xrB2Pwfknzlwtp4gQWJwO+F8aqF31mMWxUOPVabAjH0cNSx3Hg
	tB23WsCAwU06JBQPff+dHDNtGjyjDLBEQ9nuu+mbDxNGNZDetFSL7ScSlhf80gBUjWk4QKVTh6C
	tGsppuGl/3jm7n4AwslEVKsqlGkd3QJ2xbn4uYSNdJHKDd43uxX6Y0QCf39RaCIFuJp4XIYVOe+
	4p+xAypVsJhJ/hKO8wdij7jM+Gbc1kijkoY1yBENRpJKhk0=
X-Google-Smtp-Source: AGHT+IEE94+EF9/8yZCVzM9YnUpAQNsIoaIC6oYQfj4cjZjT31gCTBuncCPpzbHVyG2nFW+mquupKA==
X-Received: by 2002:a05:6000:220c:b0:3a1:f5d7:b041 with SMTP id ffacd0b85a97d-3a1f5d7b0d7mr3035935f8f.25.1746788821614;
        Fri, 09 May 2025 04:07:01 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:01 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:52 +0100
Subject: [PATCH 05/14] spi: spi-fsl-dspi: Use spi_alloc_target for target
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-5-32bfcd2fea11@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, Marius Trifu <marius.trifu@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Marius Trifu <marius.trifu@nxp.com>

spi_alloc_target should be used for target devices. This also sets
ctlr->target automatically so delete that line.

Signed-off-by: Marius Trifu <marius.trifu@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index df6f85122bfe..f7f9425a19e1 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1340,7 +1340,10 @@ static int dspi_probe(struct platform_device *pdev)
 	if (!dspi)
 		return -ENOMEM;
 
-	ctlr = spi_alloc_host(&pdev->dev, 0);
+	if (of_property_read_bool(np, "spi-slave"))
+		ctlr = spi_alloc_target(&pdev->dev, 0);
+	else
+		ctlr = spi_alloc_host(&pdev->dev, 0);
 	if (!ctlr)
 		return -ENOMEM;
 
@@ -1379,9 +1382,6 @@ static int dspi_probe(struct platform_device *pdev)
 		of_property_read_u32(np, "bus-num", &bus_num);
 		ctlr->bus_num = bus_num;
 
-		if (of_property_read_bool(np, "spi-slave"))
-			ctlr->target = true;
-
 		dspi->devtype_data = of_device_get_match_data(&pdev->dev);
 		if (!dspi->devtype_data) {
 			dev_err(&pdev->dev, "can't get devtype_data\n");

-- 
2.34.1

