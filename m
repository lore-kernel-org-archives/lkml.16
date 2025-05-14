Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91E027A916
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230432; cv=none; b=vFY2KmkDv6FTFHygZ9DShcBLTNOo6hzQ5p25Pm7k7myS++qv/q+AuIAhLkYrBcm6Py8eJYrIR9x0A9Fy57aEg2RsLlfyqsqPAU50+PtARoxQ/kAj9jz9ZxrTWMFI+UqHsBQ8jfp2Uy28psOtm9NZ2/ej7zHIN4Il4Lj25FtU3cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230432; c=relaxed/simple;
	bh=r704CciIs6S8l1HQAxMJ8T5ehpg4WbCdT2WeOTpKhmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PvIqxwSGurXqjEJNXL9OaVhth3sMHaf509UpiAN4rx/HolcMGu3O+1yIAGUcD3TOdexLGLjCxikhzaXxZFeOpQKtX7u7cqQEtx5w/t+MykQ10HuMTGNayEW6ubG+07rGzRtguVpCbDVaCQbb/bybOs+qHGIC+glqDAGJfRKlq+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FmgYhhnP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FmgYhhnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
	b=FmgYhhnPiqYtp65Cn3n+JlomuP0/8PLLaiOEam5+ssZ3pvptRumKSr4/6/wO/U7t8zg97m
	/aa5spLpf+TNUyQwZIXgpwf16YL2DE3nWozWIuMl9/pXhSblfX+E5K8XZki2ViNVsjKZ9d
	vWHsF87C8suyqpZ4jewvAUTuJjcqSrw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-iNaPeyMBPuG2DivOuH3orQ-1; Wed, 14 May 2025 09:47:08 -0400
X-MC-Unique: iNaPeyMBPuG2DivOuH3orQ-1
X-Mimecast-MFC-AGG-ID: iNaPeyMBPuG2DivOuH3orQ_1747230428
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso5147065e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230427; x=1747835227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
        b=DWoGdrrr00ZNkbt4/yo4klMY2urg1IJaL/P8vUuezsySfcAklWqz4r7HeR6lzuM5IZ
         cmX/f/0Z+/ONArbFjnrOWMAiYBg3ZKn0q34Cqds63i5xExi6fuOF6IjqDTjuY1tvozHm
         Dy4oBHKduEECYluXzpRKEo/AdMimSaQttNOCRSJfWdQkdY1pxQOnPmNXMGX1YAKJoLXq
         ZT8/YZLu2ZK+p2GQlw0k01fmJHM+UspX49STByz682JFb1x1NdkR54ebrrmlO9EdnKHn
         ZH/IcStJjcB5T2d7GurBYpp1H3Xz1aewC5Dzbl5BYQ2vlQLey8iXtW9SgHEyyiRhVdyO
         OaNg==
X-Forwarded-Encrypted: i=1; AJvYcCUjLlfV+pQ5SLW26cIbbyVFFl31pEFynbKDTBfGYLC4HYbDNffdzNXWWgF9fqjHLz2URMvquVJisZA8Eog=@vger.kernel.org
X-Gm-Message-State: AOJu0YytBJzILXY1pHbR+bemKliXT+VUkY6KSAc/8+ey8OAi4FOgMMHB
	4058vpfEQW0EakmKrUpZNWRyVMiymHZ+xuYaIZH3lvByxkNGBSS/Ncp/ysItaA6FZgi0hnmxa8L
	YmMwa8oqJHUv9Qi/Jdn2CWlIoQcuIxWwmBF/hD7Ta4eerHX0Z0Rq9AgwSO0FD3w==
X-Gm-Gg: ASbGncu+TNSqs6fc2eqRq+RWOJjk+csRgbmHlN2zFQR8BSiabn+5gCSIt6XK70WQmAm
	gROSP/I74QxEGgV7HFRQMvkpSGGhQORuzibBVi0MWSn2622eCLaHWZjks6S7XzXDGJQQCT/TqeF
	Wm7VaYhvRZ8EgFAs38JRmxcO62aX+t+aaVR+c953ehm1adr7gnsn6zXrw5yJ9Fm4fK6jJP28irX
	3Sz4qmfo5xnznwykftyZONB5vMnW5YO2f6ZzHsIuofInU+DTMmcPJgokE1OvkL+fViZyHk6y1B8
	1V76ZEF/QlC1lg0HyGc=
X-Received: by 2002:a05:600c:4f53:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-442f1a0d906mr28926385e9.2.1747230427582;
        Wed, 14 May 2025 06:47:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQcNilqw5pw/zInUa+0ub8X2j9IE5W786j2MgQiDjsofCPC9ebkToa0QhXEfe/ocJNSBGqaA==
X-Received: by 2002:a05:600c:4f53:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-442f1a0d906mr28926015e9.2.1747230426999;
        Wed, 14 May 2025 06:47:06 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.148.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380615sm30931135e9.16.2025.05.14.06.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:47:06 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-integrity@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Wed, 14 May 2025 15:46:30 +0200
Message-ID: <20250514134630.137621-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134630.137621-1-sgarzare@redhat.com>
References: <20250514134630.137621-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

This driver does not support interrupts, and receiving the response is
synchronous with sending the command.

Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
->send() already fills the provided buffer with a response, and ->recv()
is not implemented.

Keep using the same pre-allocated buffer to avoid having to allocate
it for each command. We need the buffer to have the header required by
the SVSM protocol and the command contiguous in memory.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v5:
- changed order and parameter names to match tpm_try_transmit() [Jarkko]
v4:
- reworked commit description [Jarkko]
---
 drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
index 0847cbf450b4..f5ba0f64850b 100644
--- a/drivers/char/tpm/tpm_svsm.c
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -26,37 +26,31 @@ struct tpm_svsm_priv {
 };
 
 static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
-			 size_t len)
+			 size_t cmd_len)
 {
 	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
 	int ret;
 
-	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
+	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
 	if (ret)
 		return ret;
 
 	/*
 	 * The SVSM call uses the same buffer for the command and for the
-	 * response, so after this call, the buffer will contain the response
-	 * that can be used by .recv() op.
+	 * response, so after this call, the buffer will contain the response.
+	 *
+	 * Note: we have to use an internal buffer because the device in SVSM
+	 * expects the svsm_vtpm header + data to be physically contiguous.
 	 */
-	return snp_svsm_vtpm_send_command(priv->buffer);
-}
-
-static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
-{
-	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
+	ret = snp_svsm_vtpm_send_command(priv->buffer);
+	if (ret)
+		return ret;
 
-	/*
-	 * The internal buffer contains the response after we send the command
-	 * to SVSM.
-	 */
-	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
+	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, bufsiz);
 }
 
 static struct tpm_class_ops tpm_chip_ops = {
 	.flags = TPM_OPS_AUTO_STARTUP,
-	.recv = tpm_svsm_recv,
 	.send = tpm_svsm_send,
 };
 
@@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&chip->dev, priv);
 
+	chip->flags |= TPM_CHIP_FLAG_SYNC;
 	err = tpm2_probe(chip);
 	if (err)
 		return err;
-- 
2.49.0

