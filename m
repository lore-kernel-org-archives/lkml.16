Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBC31F4CB7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483221; cv=none; b=PwKSLlDOPVZCwe6hevlYg2dBXR36jIDxM0f9GSbHiPl+/jGrIhJOJuzKjn31O8YOBZfpP7zAzIO/ju9XGEOHBuNX9IqUryKyrYkHTQmCbkbI3Vec5goBQD1XBc1+59/iM7nB4JnWqso2kMPlHV3AVxtbNMoGgXKxFWW2rJXi7eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483221; c=relaxed/simple;
	bh=4LtVV7NunJznOE+EaQyuaoEsQbLFTKYk/hWx//k49f4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VJmmPIM+RtDM2lMSImDzf44yQwE0ltSyw5XxShzxTEGeWKN2EnEkvJMNvPrqlz4T3S22IA4rz4HL7Z9f4/JeLAsF1bWRPDdLtYHL3zxSygf1dUEly9m69MBkjvPnWxdXGgj0sCMd1F9pNFTJJSfhMLiZNuNmbfDlnj4qhvdVLJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5UdW6C8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5UdW6C8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d7b50815so38381065e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749483218; x=1750088018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w76Nia4/b18xDXgyG3usj9/ef74AF078cya8aFseaFQ=;
        b=Z5UdW6C8UTAf0+LTnPgWxJmqTl2Wc7GWYSZ1K7d7r9W+DpNGkMGD8+e+Pfatnxwuw0
         F/GYES0PUhK9XEDBXOCG7NrMuRgy35k/Vyj51v2WVZlOlzm7Y+X3KUS7CjYcGiBRlKxc
         pLjUjYS2GAEx2g0CwF/rM0R9M7GoLWk+qQbLvDEMr5jKLx+BEiBWhE2cTvphfXf4bg3p
         qbGAjUlxc0x0XQKP65sZ4mD5pTEnXHoEM/RH5TLBn3vhZW8nwZHkVqmuU8zGVk1RHH/a
         MEOUZ8fHa5HEp93BYQHHBr+SKw391YUS9gphwfC4pghSSludhQrbs8j5TqfNZ07cdCGF
         J37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483218; x=1750088018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w76Nia4/b18xDXgyG3usj9/ef74AF078cya8aFseaFQ=;
        b=JyzOQalvYd4zSbqBkmObll/TDqHnruQlRp4ju++BIac1E6sOvJUBv1S+ZX77dXb8hc
         FdvcqbWBVrwakfrJ+btj55w/eS5Ipr/niUF11FyrR1d/xZuOXlzFnnJ3jWapPg0Pp1q6
         AWj59cmaMXopxb7ykVKlFfEQHxjQNwC7d7ytkyL5nANoIquurXgITu8ZEadRMq/ZAIKz
         BnJIWJDR0x9DPQW8ux+3HigOWkK45zO6cDgomgOQ0Z1e9CUzeSF20os3lvSHysuVqPuh
         iP6npSqZ0dpN7T2EkddhqFWMMGrBdjeIZM5MP3iJmbcz2q5FHL7j9bhHWk9P6leegmXq
         3kZw==
X-Forwarded-Encrypted: i=1; AJvYcCWIA9pCFg5sbGnaJsx91qrrZKc3PPAUTyVO62EU/JYzjPtiBIFsL4IJCITduwFnB1SU+KldZIQ9ut+eIgw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx3xF67Wu5EuK16rrnSIHXDbnxYUQM+HTWd3ONOo0oWGWJ7rTY
	xZ1V0/dxLYyGTSjGAmFRP4I1r36kwMNvi+sOnNSL5CAr3lM9p13Y1Qxpa1UDLYCjcJWIpcpyMNY
	jHN+EYnc=
X-Gm-Gg: ASbGnct2pwdvYsgCMzp5tPSLc+pjbzA0Sm+eTymJs1F6Lk1x/CpZ34sPs4GPBqcVycr
	Otk4QBRam62Xt27SjkHWAbct+fRZX1ckWIliFAN5yPEeU6D06HYCUoD69M5O9GaoCtw2tQMDiqx
	V6sOZkmiY7Sk2WutwLDKVJAkhExnJ8rjsnaQtvXbvIIb1LPP4J1kHZTUQGyTMiW139d7fPT4EFu
	pEFkMnjbJQaYIns0IlpD+egbQMxR0NIIwyx2srqUMec/in04P80R9isoRy73ijd40lScj2dfW1t
	1Eb1v9tDlbcUJGO2cuDdW1oxL4uWoxv6yS1U4JvJDOVsVz01NDeo09dS+0RH
X-Google-Smtp-Source: AGHT+IHTutHePoysGpxZsOPgKbbegSZRp1NNHCZCZ3DEAcLjya2vTKpfVY2DnsnGhoEdBoFuhmwPoA==
X-Received: by 2002:a5d:64ed:0:b0:3a3:6a9a:5ebf with SMTP id ffacd0b85a97d-3a531cabb5cmr10875439f8f.20.1749483218204;
        Mon, 09 Jun 2025 08:33:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137277basm115728695e9.32.2025.06.09.08.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:33:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 09 Jun 2025 16:32:38 +0100
Subject: [PATCH 1/4] spi: spi-fsl-dspi: Clear completion counter before
 initiating transfer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-james-nxp-spi-dma-v1-1-2b831e714be2@linaro.org>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
In-Reply-To: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
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
 drivers/spi/spi-fsl-dspi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 863781ba6c16..386a17871e79 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -983,11 +983,13 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
 			status = dspi_dma_xfer(dspi);
 		} else {
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

