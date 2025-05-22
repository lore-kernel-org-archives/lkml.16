Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC9828D8C8
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925566; cv=none; b=KlM8RKYgSqznqKVlGMop1lwUAKc1H38l62/CCq5juERq7TuCAEWxTxoLCkzSl8SQfxCqw0zkb9Ll1llFobAb4syLNwt72iAwyiOO2WQ3k0pfP0Q6R2MjPnszbcf3HB3daVVA6GHj0P/YEvYowsURKj9ufX1ScfQ+wKcW93uvZIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925566; c=relaxed/simple;
	bh=Gr3cboO2VgYqQP244ZhA1hFWwPu7MtqcNmqMsKaVD4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l0zyOg/PPnX19788tYgU7fv1H9iuYk8NGFJVMS6huyDpnSa9eKSx+bdEZFAEAwnRSX1wNjaPSdCnXg9rQ82rBljr+R+1oYkvfpVkjC06MkxwW549hj9dYZJ+oYQnElGPGZwp96uWIjFQm8qrB+2VJowvVssv8RSEtaDXZfeDqng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q767goUG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q767goUG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-441ab63a415so87078935e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925563; x=1748530363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WnsHBRMSS57g5A6Zsxv5fUehUSBOq6hPCzrwmSugvPA=;
        b=Q767goUGtzwsNUTnxze5UvPEBfG7fzoVJyLCED935FvsB6lwbzvWxuabklQDnHAl28
         njMFvURZztaFUzhoFCktOd0OPgxcbYlzg3Yy8fEAn4fdB5DO72I/NmFKW68OLyhTa50K
         hk4LL81gPCLqUXWbicGlrnuBN+O64o5e5DFYYReH54Lvz3wYV/jAiVp01MnsASErLfnc
         ZUbvRh35WMNOSb+CgcY2jMn87HAm7dPfjV0BiQAKpHkMdIwQWgSH4JLmCvyblFrngcOC
         w1toT49CTW/05kn7v8i+niLSvtWdsOhPmnou1OYHkapOLkF7e4WEJJfkpDay+xCCPp/d
         57RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925563; x=1748530363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WnsHBRMSS57g5A6Zsxv5fUehUSBOq6hPCzrwmSugvPA=;
        b=sowygC5v0Bmo7R6WbPIansNd87+uyV2Qg/G8IkqRwfIN3tf8vFq2vUQiYnmsaprIkm
         Bh9bt/0nwRl/K0iT9krdBBWxfcTtR+LsEN0rAL7RXycNmWz4fY/WBv8a46T7mn90kiNr
         KkMd0UjDarAakYFUXP17BuIXfKVnUur0eorAG0CPYTDvYy04iDAsM05ZPSxfmaOEKh6f
         AEaAFd63LbajUo5hEC4Qq5Eto78D9YallcstmUeq7rmms8RZEgm8n+FjUv02TgipQxCQ
         rqtbL9IKCyvMfhfHak6am+A6M4XH+nSdW4jClLGQFA/eHiU2p3ZD/gBfzsAX79i5MGWF
         nZaA==
X-Forwarded-Encrypted: i=1; AJvYcCXi4bUOQzSWNxJKmn+e2HOfrg1PV84yFGcZR7f0DiePmkrNpk3rXTkrlqsaMHZrEzaUNpogPxX2PRcIWyM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlp/aBrO7VtgRSmzcrjTk30I2t343yrLGVkGgsqMt1uyZ/D6iz
	NWLuF5VBZN6v9TrvRvg7I/vNhvuZPKH30jYnw68FFNb7aBl0+fjDUlKVCKg8/nX6HyI=
X-Gm-Gg: ASbGnctyNxlTty1wwSZWb/20sqy4s6DsmdihnA6YsKS6TxhkQRmMNf6iAIa8KhOi/uc
	uLcRFcc6uU0NH0BgRPK7KIzSL2rUSS/2wS18UWH6l6hqD9/01XXoNNZtt2NVMKJ+iqsVmBwv+bi
	Zy0KgDE0AJTkVK8D0T3yn99wivGMusW+JxxQRO22s9Gby7OEMi5Ls4rdi0oqsQBlDULJQsZza3z
	rGrF5NX8IcAMR2v6CTYAkgF/ikylkRNwZ/v5B18jDDvlHMiywHXeZ+otWqhII4LKGYyk1m3Q5h3
	BiZupzE6AWzsvsu/uN4UBwjpdyvZPl4tbKc6IlVFsy3GXOGm3TWkW51sQzRi
X-Google-Smtp-Source: AGHT+IEm/t82lB7n4D+jawYNq22d+sbqAeLEow+7pvP2Bzn0+lqXr94xgdIsdIfmG8+O8swf/6lS3g==
X-Received: by 2002:a05:600c:3112:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-442fd606b99mr238110635e9.7.1747925562768;
        Thu, 22 May 2025 07:52:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:31 +0100
Subject: [PATCH v2 02/14] spi: spi-fsl-dspi: Halt the module after a new
 message transfer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-2-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>

The XSPI mode implementation in this driver still uses the EOQ flag to
signal the last word in a transmission and deassert the PCS signal.
However, at speeds lower than ~200kHZ, the PCS signal seems to remain
asserted even when SR[EOQF] = 1 indicates the end of a transmission.
This is a problem for target devices which require the deassertation of
the PCS signal between transfers.

Hence, this commit 'forces' the deassertation of the PCS by stopping the
module through MCR[HALT] after completing a new transfer. According to
the reference manual, the module stops or transitions from the Running
state to the Stopped state after the current frame, when any one of the
following conditions exist:
- The value of SR[EOQF] = 1.
- The chip is in Debug mode and the value of MCR[FRZ] = 1.
- The value of MCR[HALT] = 1.

This shouldn't be done if the last transfer in the message has cs_change
set.

Fixes: ea93ed4c181b ("spi: spi-fsl-dspi: Use EOQ for last word in buffer even for XSPI mode")
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index effb460d436d..1fa96e8189cf 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -62,6 +62,7 @@
 #define SPI_SR_TFIWF			BIT(18)
 #define SPI_SR_RFDF			BIT(17)
 #define SPI_SR_CMDFFF			BIT(16)
+#define SPI_SR_TXRXS			BIT(30)
 #define SPI_SR_CLEAR			(SPI_SR_TCFQF | \
 					SPI_SR_TFUF | SPI_SR_TFFF | \
 					SPI_SR_CMDTCF | SPI_SR_SPEF | \
@@ -921,9 +922,20 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 	struct spi_transfer *transfer;
 	bool cs = false;
 	int status = 0;
+	u32 val = 0;
+	bool cs_change = false;
 
 	message->actual_length = 0;
 
+	/* Put DSPI in running mode if halted. */
+	regmap_read(dspi->regmap, SPI_MCR, &val);
+	if (val & SPI_MCR_HALT) {
+		regmap_update_bits(dspi->regmap, SPI_MCR, SPI_MCR_HALT, 0);
+		while (regmap_read(dspi->regmap, SPI_SR, &val) >= 0 &&
+		       !(val & SPI_SR_TXRXS))
+			;
+	}
+
 	list_for_each_entry(transfer, &message->transfers, transfer_list) {
 		dspi->cur_transfer = transfer;
 		dspi->cur_msg = message;
@@ -953,6 +965,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 				dspi->tx_cmd |= SPI_PUSHR_CMD_CONT;
 		}
 
+		cs_change = transfer->cs_change;
 		dspi->tx = transfer->tx_buf;
 		dspi->rx = transfer->rx_buf;
 		dspi->len = transfer->len;
@@ -988,6 +1001,15 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 			dspi_deassert_cs(spi, &cs);
 	}
 
+	if (status || !cs_change) {
+		/* Put DSPI in stop mode */
+		regmap_update_bits(dspi->regmap, SPI_MCR,
+				   SPI_MCR_HALT, SPI_MCR_HALT);
+		while (regmap_read(dspi->regmap, SPI_SR, &val) >= 0 &&
+		       val & SPI_SR_TXRXS)
+			;
+	}
+
 	message->status = status;
 	spi_finalize_current_message(ctlr);
 
@@ -1245,6 +1267,8 @@ static int dspi_init(struct fsl_dspi *dspi)
 	if (!spi_controller_is_target(dspi->ctlr))
 		mcr |= SPI_MCR_HOST;
 
+	mcr |= SPI_MCR_HALT;
+
 	regmap_write(dspi->regmap, SPI_MCR, mcr);
 	regmap_write(dspi->regmap, SPI_SR, SPI_SR_CLEAR);
 

-- 
2.34.1

