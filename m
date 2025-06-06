Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A573283FFB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200663; cv=none; b=d1MbHFrSFNXy5n18she0vlHbZM3ODkgJN4E9ucOzWJ7rZ4fxTbkiAv8jOo5LQCugY1cyU+G345GYepS/07vOu3ej3ST0G2Z9ivfxPKpLK3jhqfGcbNKOedqoS7ijkQuHyMhJ7Qu7AVyuxzQHQCFOdTL/HSSlERVIiHzGptniZ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200663; c=relaxed/simple;
	bh=atA00FElL1PdAn8QEx0N6GgZX//dcCoPP67oO9WxXfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7Hu3jN1wU19Gh1i0luXUSneeGhUMShpO3LNoyOtFlzx1jxQHSu7QdbNVnbQbD1bOJjrWzJoM0ybn5rXNtohWPwvZM+VTpAdo0lF1PJdnxaubaWaGZoK8Getbvtyu5s4Tdjxs4rAKWYc+WVueegtPg+q6V7UwfiL9EBE3nMwnyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLBdE6Ky; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLBdE6Ky"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso5922535e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749200660; x=1749805460; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f+0n8NKWl3riyF7/7I5pRPKqW7VrVfcXJo61+Gw+kIg=;
        b=FLBdE6KyuWCOEJ6DiXopQgcFNtVLB0ly443e90Gh7P+zYuFY6tBGjir/iwBQc8CkOY
         62oNPoizn4tGbJn/app7aq2Ai2NEuqSQJMFK6rSJ7mFBSfeMXgKylT3g+Zu9JtpQmW1w
         /kUSJn3rAHmgmOqKshbeGuBdib1jBT09PqLx69EMYj448NQqfdI00M12OlVw7d9HWOjV
         z1/tdYqUi8/EkpvwvDiL7uQukUTL/1LFlLLr2EAM51MPm0VZZjJN0aZedogcXjXm+d2L
         k7rSfokygEUPo7ff5ziU+EsHh25FeAnw2lGQr3t3Sa8CCVFb/bOJ11/MbXRcVmMNnhvN
         Kq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200660; x=1749805460;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+0n8NKWl3riyF7/7I5pRPKqW7VrVfcXJo61+Gw+kIg=;
        b=aaTD2mtqF4qGn6B1TuZKDwTaq2lAYhAauZQycCvVPPmvxkiBr0vTnmqJ8Q1vAkf29f
         C0mGsDEfsrHwCyB10su7rUw0LCPa9g7sf8SNmNZnCwI83zg85TXhvDEDkSDrGLe2j1pT
         yFFry2ISE3hFakRZHPgCKshxYnGRTznKpZDuMfWKLHm9PVcQ0isQsHgv2Uthiv2lMxJB
         vTRQmsYSsIhkroCxHNjA2QM4pJCpFER0PukABEXkWZBgVTqa0vos4CVzCiEtg7DRpgGH
         48mu2068CSYW8X0Jqrjb7cMQvGlzO0PXB/dYvOjYo/MbyEWPARrZfI8E4ZBEcKzrSgBj
         1ViA==
X-Forwarded-Encrypted: i=1; AJvYcCW0XanDo6nIJmha2DBf9xw0IqqqnE7IjWatggbfiWVI5tKW2UwtT9wp2OkZn2JxQdxiCf36ojnOb21Bdfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIiLmoVheM3TeE4xVB/luNv9+bbDQ7c87leNaBiJbY99r2epb/
	Yp3RmBoxopUbWI6q0ru4B4YiI1tHrM7TYovbJnvtoaItC+gBm5DNPEQMZWc4jQ3Ie64=
X-Gm-Gg: ASbGncvanB3a2wxdBn9WydyEftndLjJYWXAsFzN2ueLsKcHi5DPSU3OaQQMu4ImaTWd
	O09Emy5LVkRcfV3+pKp6WxwLl5izSbimC9TQQgEgQ6xssteD/0EiffqTyQP2kAzJpsqzM+tsk2x
	5UkIih17VRMl87Y8SOQkBUPEqDhsedhdlYIpUyxK8Y4fYh2fQtD5UuKy7g3Vh7nsabve0V9JsYm
	p1Rj1fP9eVDQDRCB9mr9OmU3LBOZOjBkCdP4DIBejfv8X8lZTFcezMMIHWGhFCLa43CuGaZL8eg
	uWNAyJDb4Q7zUuv0P9aVxoMlz634ndA++OYAtMAzaXDZ/AHO729T55OPIFwS+rJfs88=
X-Google-Smtp-Source: AGHT+IEMgnQm6IyXJETnU1joAUlaC9jQwH6ZYJk+ZFID2NbYjHHTWiY2iKL9SlP/kooNnTgG9NsR4A==
X-Received: by 2002:a05:600c:3b0e:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-4520147f41emr28594825e9.18.1749200659602;
        Fri, 06 Jun 2025 02:04:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4526e158428sm14173225e9.14.2025.06.06.02.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:04:18 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:04:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thangaraj Samynathan <thangaraj.s@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: spi-pci1xxxx: Fix error code in probe
Message-ID: <aEKvDrUxD19GWi0u@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return the error code if pci_alloc_irq_vectors() fails.  Don't return
success.

Fixes: b4608e944177 ("spi: spi-pci1xxxx: Fix Probe failure with Dual SPI instance with INTx interrupts")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-pci1xxxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pci1xxxx.c b/drivers/spi/spi-pci1xxxx.c
index c6489e90b8b9..9112d8a1a0c8 100644
--- a/drivers/spi/spi-pci1xxxx.c
+++ b/drivers/spi/spi-pci1xxxx.c
@@ -765,7 +765,7 @@ static int pci1xxxx_spi_probe(struct pci_dev *pdev, const struct pci_device_id *
 							   PCI_IRQ_ALL_TYPES);
 			if (num_vector < 0) {
 				dev_err(&pdev->dev, "Error allocating MSI vectors\n");
-				return ret;
+				return num_vector;
 			}
 
 			init_completion(&spi_sub_ptr->spi_xfer_done);
-- 
2.47.2

