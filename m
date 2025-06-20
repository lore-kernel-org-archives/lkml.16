Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02195299A9E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424943; cv=none; b=QnQ+SvUfqTAZFPnDNFK8hklI7nZHnbS12+PlavXykEr/f3+HUSpMBeJOKDOSRKNpAjoR9VPZSN8YxEB1IMWWGONQ6/+oLh22fdK5/R5GCZDfi350AR8kpA97Eyg5sIO9h9YfA7+eNnWlDBFoMft/kap7VCLdN0bp/pGDnPtr4KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424943; c=relaxed/simple;
	bh=r704CciIs6S8l1HQAxMJ8T5ehpg4WbCdT2WeOTpKhmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7N+deWWHSm4JXuC0fuEmAmDTnFbrYgbdsZdufAUYU0l8XWe1ue1vmdh0Cv3XdmbVKEDA/uqoCndeptk/fB1TaqPj844UcqoX0Lf3JmKFSxOtUNCh+ASXVybN5MBPISKtEEsmCz/Kq4Yxj1M0A4RGe7zvXqmkqGZppT1o6UOV0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AYwH43wz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AYwH43wz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
	b=AYwH43wzpj3b+tIulaSovDTTVS4J3ruRn3RmfL759qMDxGAMpl5G9lmTe+MYv6DbcJpVMa
	AP24oRjVVYqogwHBvxVxEOPt6G/FnVGYX5gvrCKcz0FKezRspUOIowag7yHjd+eznlpy/d
	0JihPkpNAPJKD/jBG6l5lD1wqkTLDXg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-kmZyjoBMOUGCOXm6Kkg1cQ-1; Fri, 20 Jun 2025 09:08:58 -0400
X-MC-Unique: kmZyjoBMOUGCOXm6Kkg1cQ-1
X-Mimecast-MFC-AGG-ID: kmZyjoBMOUGCOXm6Kkg1cQ_1750424938
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso1057763f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424937; x=1751029737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dM1iIgQEOaOLBHShUWBj9x+RovZVG7Za/6uALilylTw=;
        b=n+coGao73yG5gGm61Jl9aua/fPw5pyZpKRcdIvx10RJ4a7Qj2iM0wz7OGKy/QrOqkz
         bJ9ZmwPQFFdbBisVK6zNQG4hnhVqaPCB7NBR22w4xEL7pSc/ik8C0uWF/0X2Sibq/G0Z
         D/vsYNyzWBf+ONcCmyh3WgiusURxvP1H2XIjIQ6ffF9ubvdTOkc2/VKuGnnDwBd8Ntkp
         yrMzo2+0ZpAd8r3b0hmQVBIQa2ik3GPRFliyXQoYllkoNUyBfC3ecOPYxPJUguU3nGUz
         k2De5EO9uwlMXAgXw1wADtG9VPmAVue4cjCRNHm+zbDmGe9PGtaEW7kGwws3qnqIEgv6
         JWTA==
X-Gm-Message-State: AOJu0YwjGK7e3P1hfPhBRlkI3hgS7x90IEUncNEusWdZx3mnDEJ7QnFW
	hLNexxak96B4XAPapE8wwRi6EStEFVvcOYnQSnSZX5INYO5ROBh6ijvTAHUtRCOkAtXxnGF2QMm
	+vi7x9m2/6uItYwt4QKAvyN2FpmYX3HfmAmCKS2BtqiiVaGdkRxZZH3zMUUhQQiD8VA==
X-Gm-Gg: ASbGncsLua3lhvb34J2+jajxQcU32SU9U7K8buouRZxMWyIsFSZmS7YD7E7MLFX+0xh
	w7DEmgVI4+VKowSXCbQPcYFmOuAB+xyXp1pzpGyyxFaVISVmGiqxQUTrpuRyjqw3YXCuakMjO6j
	no6R1/REqaO9Xgj3JoAuGzPqYnCxFKEO+pxTYA0EDzOYI4WY8WXQHTaQv3caTzTX7NVPPv5/+53
	U3xHBaNUWrdVxSIJgTBRFXJAZiMoOZHavWLt8gPpcohGgNM8CA0chB4FDXJcOVDmuwxksw3ckFI
	ZP8jdjxddUNcKCt6z8kDDHkf9Ob0I6YEwPc=
X-Received: by 2002:a05:6000:23c1:b0:3a4:fcc3:4a14 with SMTP id ffacd0b85a97d-3a6d13176fbmr1522860f8f.34.1750424937550;
        Fri, 20 Jun 2025 06:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErCfEU/IVq7uI6YOAV42Q6eu/6bPqI5NWLxqRlPFpxO3LmsQRBOu3Tts8nxYdGgHaYTR596A==
X-Received: by 2002:a05:6000:23c1:b0:3a4:fcc3:4a14 with SMTP id ffacd0b85a97d-3a6d13176fbmr1522807f8f.34.1750424936821;
        Fri, 20 Jun 2025 06:08:56 -0700 (PDT)
Received: from localhost.localdomain ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18215sm2026391f8f.29.2025.06.20.06.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:08:55 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Naveen N Rao <naveen@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v6 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Fri, 20 Jun 2025 15:08:10 +0200
Message-ID: <20250620130810.99069-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620130810.99069-1-sgarzare@redhat.com>
References: <20250620130810.99069-1-sgarzare@redhat.com>
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

