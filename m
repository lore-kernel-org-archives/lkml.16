Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE6298CA2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019734; cv=none; b=mvvbhT6jmrD+GKOoavou2SM8FP9W6lWSxPyj2H/+7JcQu1F3EWwavfpZJs9QqPzYqaaCUFWjGRJx7UaktnlGYIE1VD3i1ew6vRkPHpQW+JEhX5ZlECZPlXze539EiygEJZXcGNSbRkvhFcesaQwJniJ0aGlBVZJX8nBV9vWMrZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019734; c=relaxed/simple;
	bh=u3+3xTgg8ySwFwJSh4UIH/QbNDMkPzATVebHq3ynfNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uoqwG6hQ6iYEF6tUTYXqU8n8jTgMywAg+ojQXD/KAlKeHFHgJ8bczkjF/d5ung8Ab5PplAwiYqJKWQfFEUoSrh198P5QUZr18n3TLkFGa6yTUA/rVrmzgHgAQO+JCH/l34Q8l5HmjQnPE+/eZcDDkR90duSZBFwVJaAPSrG0GuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mhGDS2xQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mhGDS2xQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cf214200so15034055e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751019730; x=1751624530; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCVCFwjAnkMVnM2TrNuY2f6SQdKDIj82hiVpU3a366c=;
        b=mhGDS2xQ4Ae8/i8Ev03u2s7nAz6l9VFRC/xnP8E5rxjADgdo3dy8S4EpK4NA/JPHjS
         Kz0OpVgvoJqdaY2UItq0iK9hf5Q5uppsX8WnsllTEJH61VswDsSDTXOpA75DgMH3X6Lj
         0VanKMBsv7wn9W8uPvOXcsACqaECZuEdR1CcNwG4UbkQ9805gs7ytJO9wu0RDFXo2NVF
         biv/PohKBege3Irh4DLwzeKaoHAkFsXK3NDUB+7vHzmNd2w0unXj2KxEDa93Nlnap3o/
         W9koUDwvAJxJEAZyiEk5q7UcjC8cT2hMhAbfDczE6hTuejrWbTjF3kHtHFso378Didkh
         hdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019730; x=1751624530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vCVCFwjAnkMVnM2TrNuY2f6SQdKDIj82hiVpU3a366c=;
        b=CNOsY8vAIpEWSIXwxz8zMZl1shuMZH9TNyiM7peCzcQsruVBWVjychk6cjHwzt5V53
         KkLAfaVekJyUfOlvFl9oRgomIrXVkUR3aFsecoQz0OF4yT0nNgKxCm6qHWeK00eXbSJ0
         igoTyhp1JP88NdZlPI8WXNkNjWRo8TWuvY208bX9oVC8zB8I7eg3xsyGPpg/24DGyksw
         EgNyvlWlUluMlw3s7wLo4q4OLh9ErVitG9bjENElDEPTJu6sLj09btP4m/pJ0++oqZFP
         lr2HEGP2OIPBgWTztVfVRma7nfq4xcsxXA0v4sqvxWaaM0+fJxTSaJmqcYsXrvvHCo+3
         tXgg==
X-Forwarded-Encrypted: i=1; AJvYcCUVoXYJ0i/i3uIFZiQI8mZMAI+2gKWcsPGUPI3EddJgGiOKnePWcm2ETQoII7HX019Hc5EuXeU2jSPgjT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTalJ0H38wwyn64W0b45LPI10CqDfZ9+2Pr1RbGJiV6KKzS1/J
	rHuA+j+MVOv0E9h5OBQs9Q2LyFewy0bH4kt2faEfEgu8uX9qF1kVzeqZZuHc/ccnwBY=
X-Gm-Gg: ASbGncvYOVa5bsmJs6i8kgKUYVC2/t94uqtC0TnUqVpcAY8RVTUSxNepRpzvGBfvySI
	s1HB0YISti4BDPQMR7LlBI1srntYRnZ+B85y+VcC0C6xAD6eFFfWE8Cmhd5IlOya81C0AEH1s7H
	Dmnp2iKVhYB0ykU2Q6X6EtkqBIqTY7YsO00IvvsLh8WubFkwVkN3CJJtYq2fav9aSYyfPu73bIa
	VYTiOsvsN+P/XBf6MTi0BO2oEmRzXojz+hgCil6yvHx65itXl5aXRgPwh0NJ2zvxjMGXgu/YLem
	4zT8XgIl7lr9pp2jTthvVG4Zqm1Wp7BH+JI/cwnELJ67S6L2O95r8TaaNcvdrmZbrv5r5+s=
X-Google-Smtp-Source: AGHT+IFkxpAvv3NX+mkvbpnx8oeFvyJPpp2vOli48509Lsv+DaI/U3dnvJcfYEQZDOvJnNBBW4GAGA==
X-Received: by 2002:a05:600c:a087:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-4538ee42c26mr35820825e9.10.1751019730502;
        Fri, 27 Jun 2025 03:22:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a5599sm47250955e9.13.2025.06.27.03.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:22:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 27 Jun 2025 11:21:37 +0100
Subject: [PATCH v4 1/6] spi: spi-fsl-dspi: Clear completion counter before
 initiating transfer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-james-nxp-spi-dma-v4-1-178dba20c120@linaro.org>
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
In-Reply-To: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
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
 drivers/spi/spi-fsl-dspi.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index 04c88d090c4d..4bd4377551b5 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1122,11 +1122,20 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
 		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
 			status = dspi_dma_xfer(dspi);
 		} else {
+			/*
+			 * Reinitialize the completion before transferring data
+			 * to avoid the case where it might remain in the done
+			 * state due to a spurious interrupt from a previous
+			 * transfer. This could falsely signal that the current
+			 * transfer has completed.
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

