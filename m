Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566E51F3FED
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483224; cv=none; b=M8adKhpaSBV72cEeEQdo5vHcDaQySjjic3b7F3x67OAMUIl1TA9d9ElBhGjQ3SeD5CE+1WRCOSqe8r8hMhoLpq0pVQQmg6XTprRUkTUgA7vjlVCYg3YeRv+WFOe+1Z7IsjXcojL+EFr2E2NstzxGYVMVqqJMooqribWQbAGw27s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483224; c=relaxed/simple;
	bh=rSD3V0AZT5bLu6rMQRRnpLdBVVlg+XpF/h6tXK3/+rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=afJ/YQsFWwMzVzhyDZ7nv+NdTybnu3KDVzNIl9ZBDI63P8FOT7Z0da21IhOmmcAtJDlOE5pqP8i75UT6XffOK78N6/Px0gm7xggZl7oKh0LsAXpezC4WO5OCVda+dc258MmdOXmGN7+8xfXoOn29RrlaYR9xkGQg4vcGoVdkxSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GuQBuNaX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GuQBuNaX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a376ba6f08so2467703f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749483221; x=1750088021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T2evMSgmcTfKpLULhAcIQOum0d8EQihiDCpbd2Ef3t8=;
        b=GuQBuNaXuBRfjWxZbnjXxjiN+yIEQJh4w4FWmq6rDlDO8XA7oNrWKFmENzZxxtcCFt
         QhMX+6kKlrCWkdHxCxd5fWYhUPO0bbn3JxvcRSBx/0bmJmfGaf44w1GsQ2TLiEZhOlmC
         DpxvfsCeYUV/F49J0bI8rpoHnAkk/HJ2WA0u3oCX3ZYHFoKbNTmAOq2K32WwImdQUVf3
         L2pLXsDVWa42jFbEoyFNIM2AfyfwMVpe/i+XcpN85VIcRq7QqyG3/OaznCfa1NRDA16p
         0KYGuINm4EHd3KXUcCdB8xQcHiVb+QHKaO3TgFQdXVEcitL6LGP1Tfab2ESSS+FvfVGS
         qeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483221; x=1750088021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2evMSgmcTfKpLULhAcIQOum0d8EQihiDCpbd2Ef3t8=;
        b=t5UX8CPmADWVYzNOFH8IDlF8BsJ7AudoVoggRdZ+BcmphGh0pcYSblkR560rd/Vaa8
         I3iLXxOrotZOwDeWKuSCws3fBy8b12j3LSFV0FBEXsU1rCfe7SwEvxRiEU2Ksme6ik9w
         xy5lHuK7fcBOuX/i4iUufkW7zcnOspJtV7Ad783hSNOaZx+pxMdp1Qeke1XRqBPTkyo5
         jhP2vyjqsD0fy9P6gjtP98vvkiOoBvHU7SD2p7DnN4+iem6G45Ul+ueerHSZ4h+cR4dD
         R5vpf0pOfhDFN13/M8ph2D8p7KBgKbWnMDtXbfiRFM4/D3cQLEualPmlEuCyp+6Msvge
         SscQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI3AxbSux7zVOOF5KXQcrNAnaKQoFEBseb7TJ+rPaEmr6Ts20VhvgmbHzZh8XBmtH7EYq2+4eSiuxJLlw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzlt8cKKziO6QcubmW1dUMDEerOcl8V0LP2rzurlb7k6W/wg13
	91YkgZzEC16avHOEUUForJu+Mc5uumsAP1UPgVfbOsiOYjE5ICjfDZyCMfGfpe8aJt4=
X-Gm-Gg: ASbGncvZb7r+3UXpyaoHqxK6gdfXqKmM99/kaHGwmH3nrWwLm2ojrvxg3ROI4DdjUcy
	rUL6q5hQ98hAHxg90Y5lLE1BsQrG3RvWQhmMSEJ7cR2bIBhQ1M6siRFfVGx2cZAwZbq9iT6oLkY
	iblu3/NR8RBKxzYRiiaDAv2/UJbQ/MS/ivF9dAU28Pcbuay3lD8dbQx4qWet7wj3aPMR29pYmm+
	GyND5FCRr5knTI2NB6DgUIwZI5xxNfYpk6eJqrWlSicXxV90MyKZTM3dZl3hNIymE/Vm23seRs0
	L0uT9btVxQh4IM5cNmJIVuwjByZK305d8D3tR2IsjWJZOsOY4cn9nGDXZrbJBkWMTVbmthg=
X-Google-Smtp-Source: AGHT+IHBXdZ7nRsdTP/ieOD8Dsk48GSLcaI+CHSrivHzqKwnQ4+fdPwvoxNtjRK48GGMl4ok4emrhw==
X-Received: by 2002:a05:6000:2411:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a53168448amr10210931f8f.9.1749483220742;
        Mon, 09 Jun 2025 08:33:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137277basm115728695e9.32.2025.06.09.08.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:33:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Jun 2025 16:32:41 +0100
Subject: [PATCH 4/4] spi: spi-fsl-dspi: Report FIFO overflows as errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-james-nxp-spi-dma-v1-4-2b831e714be2@linaro.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
In-Reply-To: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

In target mode, the host sending more data than can be consumed would be
a common problem for any message exceeding the FIFO or DMA buffer size.
Cancel the whole message as soon as this condition is hit as the message
will be corrupted.

Only do this for target mode in a DMA transfer because we need to add a
register read. In IRQ and polling modes always do it because SPI_SR was
already read and it might catch some host mode programming/buffer
management errors too.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index e211e44e977f..75767d756496 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -228,6 +228,7 @@ struct fsl_dspi {
 	const struct fsl_dspi_devtype_data	*devtype_data;
 
 	struct completion			xfer_done;
+	int                                     xfer_status;
 
 	struct fsl_dspi_dma			*dma;
 
@@ -504,12 +505,22 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
 
 static void dspi_setup_accel(struct fsl_dspi *dspi);
 
+static bool dspi_is_fifo_overflow(struct fsl_dspi *dspi, u32 spi_sr)
+{
+	if (spi_sr & (SPI_SR_TFUF | SPI_SR_RFOF)) {
+		dev_err(&dspi->pdev->dev, "FIFO under/overflow");
+		return true;
+	}
+	return false;
+}
+
 static int dspi_dma_xfer(struct fsl_dspi *dspi)
 {
 	struct spi_message *message = dspi->cur_msg;
 	int max_words = dspi_dma_max_datawords(dspi);
 	struct device *dev = &dspi->pdev->dev;
 	int ret = 0;
+	u32 spi_sr;
 
 	/*
 	 * dspi->len gets decremented by dspi_pop_tx_pushr in
@@ -531,6 +542,12 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
 			dev_err(dev, "DMA transfer failed\n");
 			break;
 		}
+
+		if (spi_controller_is_target(dspi->ctlr)) {
+			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
+			if (dspi_is_fifo_overflow(dspi, spi_sr))
+				return -EIO;
+		}
 	}
 
 	return ret;
@@ -918,6 +935,8 @@ static int dspi_poll(struct fsl_dspi *dspi)
 		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
 		regmap_write(dspi->regmap, SPI_SR, spi_sr);
 
+		if (dspi_is_fifo_overflow(dspi, spi_sr))
+			return -EIO;
 		if (spi_sr & SPI_SR_CMDTCF)
 			break;
 	} while (--tries);
@@ -939,8 +958,12 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
 	if (!(spi_sr & SPI_SR_CMDTCF))
 		return IRQ_NONE;
 
-	if (dspi_rxtx(dspi) == 0)
+	if (dspi_is_fifo_overflow(dspi, spi_sr)) {
+		WRITE_ONCE(dspi->xfer_status, -EIO);
+		complete(&dspi->xfer_done);
+	} else if (dspi_rxtx(dspi) == 0) {
 		complete(&dspi->xfer_done);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1032,13 +1055,15 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
 			status = dspi_dma_xfer(dspi);
 		} else {
-			if (dspi->irq)
+			if (dspi->irq) {
+				WRITE_ONCE(dspi->xfer_status, 0);
 				reinit_completion(&dspi->xfer_done);
-
+			}
 			dspi_fifo_write(dspi);
 
 			if (dspi->irq) {
 				wait_for_completion(&dspi->xfer_done);
+				status = READ_ONCE(dspi->xfer_status);
 			} else {
 				do {
 					status = dspi_poll(dspi);

-- 
2.34.1

