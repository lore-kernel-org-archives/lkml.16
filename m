Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DA727511E
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781076; cv=none; b=HB0JSPbfNqd9NqX+o0fyEnFz3V+Oh1LYPvBhYPkjfd46m3Hm8O9a1Wg58PfGSOqBjmTYEXrrwQoZ9JvHYEi4DL/IhJdRN+5D3NVUrWpDqpZw5tc4L4ZEX0sgvHX1gbmNx/qVt5uWNcQOiFCgs14BrcmUBe5akEooGdglGGn6AIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781076; c=relaxed/simple;
	bh=OQERegVmsM9QvVsX1j9lmHiktOMTs/IV5jXHkAbPRL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Im9iqc64rdx5lhlh2QvtjM9juq1iPQRIQPZuDKxX+rPGfbfiGSUx1BYCc2sFA9jQa8qsH0P3364Q/SHKY7hjw179Vb2Ekxb5N3pNKtaWjRSMsLk58kTg7M0QnLhqc7RzyEfkVsHC0nJZUnAefqFTrjMF09Pz6IfhBytgFJlMmNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LNZ3zYnP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LNZ3zYnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6gkeb/9Kdfy78P2DpuPGWOQmqeRSDCl/s8JKK0Bwndg=;
	b=LNZ3zYnPTEE4GWVZDtd3e63ME+wWsjTxFvWdQ/fDbyrYyBZSLvmwiddfoulpaEG3zGfjwX
	7GRvRfcjsCQpDfKndq6qMSscwcFW6rR8+V/Nl4BHWulz4XCrmTsF8K80grEu7xLAyeuvIi
	F7OIFkbafYmL//UphsfxXMPwkP6DwC0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-0E9bXF3CM0aJZpDOd4rteg-1; Fri, 09 May 2025 04:57:51 -0400
X-MC-Unique: 0E9bXF3CM0aJZpDOd4rteg-1
X-Mimecast-MFC-AGG-ID: 0E9bXF3CM0aJZpDOd4rteg_1746781071
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ad2200eb1d0so35133466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781070; x=1747385870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gkeb/9Kdfy78P2DpuPGWOQmqeRSDCl/s8JKK0Bwndg=;
        b=GvF2oV8kmblTbWOFLYS6x5ODKOybPqVO0egEhYUvm5Hr2m2t+6UEqMgf9DLaqsEkoC
         pIaLf17QH+S+3eiw/T6NB+xG3mEhKmNANBFdsYDee/f4KJC2l4gFG+Vsn24pBB8c5z8P
         bKxSmDr/RcC6L16FBca3kJi4zdVPoE68zgWZOwXi5/t8BtjZlB6Z7EyL7lhZeCQPrgpr
         jjId1JlWFFoGjlXlJAkiDkz2DOs9f66lAqPh/Q9BFwuD1h6wdORsgBQQGhXLKCQar84G
         VF1JgXvTjlGnKUiP/rL19CedZAdkOIxrvQRFRGHaPYg+A4r3h8lztf9+egKsnsDFSllL
         XEUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2GyCX9K/VTtBpIQSLmL8a0lBboYvWe0RnVZQGEYghPhIrTR0ga/N8zpV/OxvE8TcA/8IiErdxfDazRE4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH40CuUiWkWTV59QnFeEsLf/3nYSG8GrixlX0rgpIRB8biVjkc
	9CJiCzgRXpypvoS0do0hNpV/RO2g5ovk1fdXBDFdHZLb2f7urHzG+25Q2SgaQMpAWfAFd/axHMM
	NEwq2FrJg/Nl5Lez4fxkmxRcFBoJAOVNBBfTDIGzXE3KXzxBLJgwzWbNYKeFFgA==
X-Gm-Gg: ASbGncszhBqTzt9hzoz81sPegybTfgSWT6wqXvagnfODZVJNKy/x/bqPIZpTVMuhqym
	4ruDjCg7YI3sAqNE+bLmvl0PQ2f+0sgzo971BOlMDE5xxY7EDa+n8ZMMJQLqYoJZwNJkGp120Bd
	YAPyuNxjsUFfOj6om1Z8eSyxRXXc19lWtt7eIcBaJNq4zTlVwO3mNj/bRuYlEoNv6BMZzLEXcE/
	Uh+i4izKNUTSRRDJipLoEf1QJ0VaJgq4qwoDc7Eag8e+Ptk40zKu3rcNVNjrdS4PD0/1eQoDGph
	7HyjBisfEC895jFT4Q3UjlVdaQ==
X-Received: by 2002:a17:906:ba90:b0:aca:cda4:9aae with SMTP id a640c23a62f3a-ad21927d0d6mr208672566b.37.1746781070380;
        Fri, 09 May 2025 01:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm/6oRhoG7o/lfsJVdPERf6/D/JJirfP83vdMoj15DtJopabMpuCr2u+MViV0A2cvILTEMug==
X-Received: by 2002:a17:906:ba90:b0:aca:cda4:9aae with SMTP id a640c23a62f3a-ad21927d0d6mr208668366b.37.1746781069774;
        Fri, 09 May 2025 01:57:49 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219348781sm119504566b.61.2025.05.09.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:49 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-integrity@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v4 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Date: Fri,  9 May 2025 10:57:13 +0200
Message-ID: <20250509085713.76851-5-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509085713.76851-1-sgarzare@redhat.com>
References: <20250509085713.76851-1-sgarzare@redhat.com>
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
v4:
- reworked commit description [Jarkko]
---
 drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
index d3ca5615b6f7..db1983072345 100644
--- a/drivers/char/tpm/tpm_svsm.c
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -25,38 +25,32 @@ struct tpm_svsm_priv {
 	void *buffer;
 };
 
-static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
+static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
 			 size_t buf_size)
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
+	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, buf_size);
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

