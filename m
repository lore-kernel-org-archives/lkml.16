Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A362D5C92
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864958; cv=none; b=r8w6ATXdQO3o3PiFdG1uJGNJlQqblmuQpIzhMZgWw9u8d1fRu1ex4Q9aax7Zqb9xE0hwniI0laNw+AD0VX/dPi61xt+8nh0yUlnaUXTmtTwZCm4+80glaFSuaKcqIDxK5Rott+7QwasjGSYYmeovPfnVbzB2ymNkGmoDUIDxq6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864958; c=relaxed/simple;
	bh=yCYdZbO+dpu/mVZGwv9i1PkdqA5piWFDPL5hOs2zx7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hYbLR23nyIYffBRuUmrQ1nF42/CziCvEr+LoH88pwyesV8KRK1/kazqOMCBlO4cIX3hGhWrghhYqswpu8RmfzptNke2vu4S4OqVzpJfvhuRj8C7sAzxiPnPwj41RKl1kDTZ6eco9HBdcN/Nk2jN+nXMZrIxqzH4JUfqO3lRxmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GmLd/q/a; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmLd/q/a"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-60d6303a11eso7467eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864953; x=1751469753; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nF0VBzbDTNCK1Xw9av27PYfa00tvOG6PAv4XXmzSQFU=;
        b=GmLd/q/akNfHtLQW8btOv1hf8CsiKeAy+BoKZO0k9DGJ/Ez1SkYSsrx/drYZDwhLTu
         9DCxPnJ5cwOoY8Km3KWnZ+/t039ctWPTZ9ARuDZhlzTTR44YEA6+fhQkanxt2k48Q+pS
         6kQKx6wtOV26LWlARfPU8lHKhzrmZqdIrH5JxW5Sk/Hz/cXVZzkgeirBm1dcLGjpm8xy
         bhrfPwWgt2f2VPPoWPWcQI4LcGlOswkRiF8QM0ikbX4YoVoYAfo08Aee8Fx5R0pDacRu
         a3gGsk+GnckLpqJZ7BcL7KxGpiJgFjs9f55jhL3Zq9aMCAzz6VdBcXnU/mf+H2orTgVI
         zQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864953; x=1751469753;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nF0VBzbDTNCK1Xw9av27PYfa00tvOG6PAv4XXmzSQFU=;
        b=Q2+Q9oiKJyySrmRQF7W6SYNLLMXvPLUoPmil0Ca6Z8ePk7vD2baJOhyH96q1OvQBJb
         6zh1rihRy0lWJqqGd3m0xbxLy7xaTc+36LBkaFBRgKoZpqBXatR7v86NCLuW5wbe56dp
         BHzMP22M1mTlPKpPQLAHUSs+UM4Vn83f1tALrH9qOZaFvmWw1XWVhZfo7mfgdqxYb+KR
         1As2EtT8BPh+m2tCjJNrlGQS1AlEE5vbnNT17dx6M2F/Vrc/XLt4U5Jw0gZiOw4Fhx7p
         D/TYPZiUOuZp7tPKurzd0gCEBFzKXGYr1pxi8oSfqm0qhZwNDSPcWnq3FQgjbmeCNMqO
         mjjg==
X-Forwarded-Encrypted: i=1; AJvYcCVHXdrIWlY+GMyq8ov6jaKKZEm50tqe6eh/zpu/D7M1TxEpnGzoWhjQWSZnCop/El//+kp2Tt9au/BKHt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUWJiDrBWrFTE6ThmlhHci6ehWTu1w66lUzX5ZZiE7oCIQmbZF
	FlkyFyvWVCqNM//BpFBK+g19ksNVmw7bGsc/mbhNAgsSqB1nl4oqRk2VHSQ2MaSUkog=
X-Gm-Gg: ASbGncuEVKMApcGgDU+fhL1VqJeYFdAfWGzp/CL8qvRDrd9EnOj2NP0ABJu1kxRKr1+
	gpVz7DjtmPAQYwOtB4tNk611R41RSI5nfqQY03zPaDSAEkpHCeilIW1ehzZYNVNlABH/qHmOHbk
	JRqEIvom1TA4fH8fEXEJ7eJWFEsvdJftMq+5sYQdIrYEDW0NErKKofWIE2CQoPdKOVpO4KTNHby
	vtcaibvadDV3IhpTtyTiqD9aACGiy8fUzAb7dRRBtS9v/PqLvgQdIIY3nIYb+aF9j5AkrdQusjX
	pXW3WnGsigGY2z8HL5b6/qS/c56DisNocLsDqzVl22+N/Rec5D8H4BI9jKmvRYduuNJBtQ==
X-Google-Smtp-Source: AGHT+IHuQoqa1u0DUHvl6z0O9mvk8424s2tdSOokLX0655c7GkLUoXhQQnFWEefCze0j3O7DZKz2Sg==
X-Received: by 2002:a05:6820:99a:b0:611:6fc6:e6ee with SMTP id 006d021491bc7-611aa3f4864mr221261eaf.1.1750864953563;
        Wed, 25 Jun 2025 08:22:33 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6115b7f813dsm1629279eaf.40.2025.06.25.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:33 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:22:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This was returning IS_ERR() where PTR_ERR() was intended.

Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 6501843ae72d..3a4645f59a44 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -966,7 +966,7 @@ static int imx8mq_mipi_csi_parse_dt(struct csi_state *state)
 
 		base = devm_platform_ioremap_resource(to_platform_device(dev), 1);
 		if (IS_ERR(base))
-			return dev_err_probe(dev, IS_ERR(base), "Missing CSR register\n");
+			return dev_err_probe(dev, PTR_ERR(base), "Missing CSR register\n");
 
 		state->phy_gpr = devm_regmap_init_mmio(dev, base, &regmap_config);
 		if (IS_ERR(state->phy_gpr))
-- 
2.47.2

