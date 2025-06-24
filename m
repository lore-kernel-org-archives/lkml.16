Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC64B27F170
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761399; cv=none; b=A4dF9ymAgXIh1JN7sU03jlV9CiGx0iUdo1rzJfhggxkeG8NN0FASr5UVTLsZgMlDjxcvgZyBC3bhbIwuZImatfh1ep53H1Zl6JggWF/YEj/oDmI4plWF+KG3oAF7z5PWSNc15vI0T9s4HKk6r1PnLHZ4qAJbETdgerul2EL9lSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761399; c=relaxed/simple;
	bh=I6Uh0W1U/pEscoVd7miIYAu5wzDsffordzyPGY3jblE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQcEMm5FuTRvFVYwYevXUnYoH7LLa+OWh1XmJqY74yCP3ayYEM/extUf6Wy72kk3CI6epj3n8wRQL3Xne7sYbpFppROJjZHeiR6bqwnNCFrvmXgeKTDYqg4Vf7z4qX9s/GYIcllZW+iwDH60VcmA8CxoQQBjmRHNq+g1F/wUhIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTsaeuoh; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTsaeuoh"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso44511215e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750761394; x=1751366194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkMuSosV7oMRxRtp9yYE+2UdziIG4xoxewf16F9X2EY=;
        b=MTsaeuohoQk6rMfnmVu/5ocbrCIwViKarJ+wRU+41QIl2B2E5VEZej+r9pBCBxwSZq
         4TmPFyxtmjLJ4Q3t4/ZT5YmJ5JBzfN6sbCVwg/ZBRegEU5APkC7uInrK0tBe19V8xrmq
         eFSrTWJFbDp+CY5wmFc1gayPNsAnJQPg2Pyg9/RfE4wfTjMM+f9jG8SCbwMBKcQAL4XD
         F/i9NnYLPDJtduMkY1LsD8mufwXlsbv0Eu0WWE+qXOsK5mEgI6pUYLqWhwrI97sczJcu
         tDouJ6bNfLyfpKRz7OvgiCWbLadw2TYulyPBZjn+BzMuu4ddCGbYFp2QncodqzMTJBbu
         K7rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761394; x=1751366194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkMuSosV7oMRxRtp9yYE+2UdziIG4xoxewf16F9X2EY=;
        b=q48ojoZtcF+FSiVwF1V9QzcvPjQguTjyowlgyPZFT8wLE/jYNNJbeCWpa3RFdTOfSR
         MVVDWRXGLLE5gfKy7w4c3hrgohL6htgE3GAeHVTNdHiQNH182/00MZGbWe6Fn7MTZoVE
         N0MAgGnJvEi8xTG/ZVeQWaLzYeAaoDg1g91PlN7dDernpFtusTb4LmL3C+b9jCykk9Kb
         Ut9M+3MDezGwUV4y6M3wgYyiM+h0MuWNlenvD1KXq1DVhEZI7ICbdbhxukyrXxgbgQr6
         c7Pt0111XEeZ0Cva2PclJtwcDepRdkAwNBKydmCt5f5P7FSpj/4alC8ddWWRlwMOJJID
         N37g==
X-Forwarded-Encrypted: i=1; AJvYcCXB1S7JsBbYCLZSmUhjlmorAC6A51xnnJ+BUssGOxORtixERdQgHZQdRM6m881/M0zfeKA5ruOHqccZOn4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rcB9VqbV3U39L0jyDgg2s8+rUTncS3bHhJragW8dcKwcS0dV
	GvcL+E/go5Tx+OU1Mlf+gf4bDh1N1v4aG2vNqg/y14J7t3hm05C0Dfav63rLwJLipKY=
X-Gm-Gg: ASbGncsvGI1KpXZ8kL6otzvyQcalw1PqNh3YvGmfViyjRLcMJWhEl9SI/D+KAyo9IN+
	NImrQzRr2UHLbl42kztroCfb0bg6Z3QgKk3v7JelqXNmKjMsGNDp8zhKTuVAcXl3c7mWSf6x3av
	K3tEWz8ctbq/8v5bMzde62IzMHQifhbrupPexTzK2lInFGq3tGGRszpqcACAQV9wNfBlTnfCCqT
	f+HrQqMx4LLRz4I9Z9V8rL1cKo3FzpnDgUrr8i1sQ7XWdh77WfjPmtb8ScJ1E7kkpkSInAYmqEe
	dszJ8C8jQqXCj9uQ/ROFCAx/bbQkIdqe8HuK6yp/AQ0LyuMfQDesCZmEOgpLcVTe5Y1OSoE=
X-Google-Smtp-Source: AGHT+IE1yzuJW1JyGG/GLYl2/Ucg2KNK2xeS+Q9P5XhB9Map8hlfvdK3p5oXRvu10nUbdGxDztsgdQ==
X-Received: by 2002:a05:600c:8b14:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-453659ca92cmr182600865e9.10.1750761393938;
        Tue, 24 Jun 2025 03:36:33 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb641sm143398245e9.3.2025.06.24.03.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:33 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 24 Jun 2025 11:35:31 +0100
Subject: [PATCH v3 1/6] spi: spi-fsl-dspi: Clear completion counter before
 initiating transfer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-james-nxp-spi-dma-v3-1-e7d574f5f62c@linaro.org>
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
In-Reply-To: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
 Larisa Grigore <larisa.grigore@nxp.com>, Frank Li <Frank.li@nxp.com>, 
 Christoph Hellwig <hch@lst.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

In target mode, extra interrupts can be received between the end of a
transfer and halting the module if the host continues sending more data.
If the interrupt from this occurs after the reinit_completion() then the
completion counter is left at a non-zero value. The next unrelated
transfer initiated by userspace will then complete immediately without
waiting for the interrupt or writing to the RX buffer.

Fix it by resetting the counter before the transfer so that lingering
values are cleared. This is done after clearing the FIFOs and the
status register but before the transfer is initiated, so no interrupts
should be received at this point resulting in other race conditions.

Fixes: 4f5ee75ea171 ("spi: spi-fsl-dspi: Replace interruptible wait queue with a simple completion")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 04c88d090c4d..744dfc561db2 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1122,11 +1122,19 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
 			status = dspi_dma_xfer(dspi);
 		} else {
+			/*
+			 * Reset completion counter to clear any extra
+			 * complete()s from spurious interrupts that may have
+			 * happened after the last message's completion but
+			 * before the module was fully in stop mode.
+			 */
+			if (dspi->irq)
+				reinit_completion(&dspi->xfer_done);
+
 			dspi_fifo_write(dspi);
 
 			if (dspi->irq) {
 				wait_for_completion(&dspi->xfer_done);
-				reinit_completion(&dspi->xfer_done);
 			} else {
 				do {
 					status = dspi_poll(dspi);

-- 
2.34.1

