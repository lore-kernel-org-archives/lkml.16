Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4810C264615
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101152; cv=none; b=FyotqXT9NtrKyg+2013PubpLsGpnccXq2YfNOoMIjKS1s/SN+5fKqasPYGNNwbDpnGwiLsx8L4VgQyi4GHCtGErPliZJF0bHPHDUsF8lUdpAcl1Kfk0QdUPaRwyqslJpFi1f7t8gbqDDDEhLLR4CXck/rmK1F3wQqYxWr5kjc4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101152; c=relaxed/simple;
	bh=U1qC/sy3KM3pFlSOrOxYv2VmI/J+Xj4HkqFlDY7nkB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9tNrF3vxCXRRdYfj+nQZqitcPmDZKJJrrnmFe1eqbhPHVnk4ZfjxBEgb0LcufwunSqAsAdufzCOkQo2tufCTlS7LcbAtWPI+dQGY3FgbJmjrutrkrHWl3YpXlWqNepIuCViWHRLkSAFgKjo25PEQLCuPkOUkd91LKXzyLFlgBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ra7NiWGY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ra7NiWGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jjogm03xe8uH9FEbFpCE/wwTjsk8lbbHkAYLp5l0W8=;
	b=Ra7NiWGY0V4yEsseV5LOEAtiUvOTi+cknemd1ClGoKoo244WO5z3bkB9TiJoyu4OpVSeJd
	1x4Ji27kZQtk1zEEJ6gUxFUXkPvAff8AIro/Zrmcm7Go7r0ziH1D8Bi79+bS9uTJz8ujk7
	BAMgEZqq62VPgdeRMljK2BRClxjHyrg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-4QdoPkt2PfGjeOWtwAyaXg-1; Tue, 08 Apr 2025 04:32:28 -0400
X-MC-Unique: 4QdoPkt2PfGjeOWtwAyaXg-1
X-Mimecast-MFC-AGG-ID: 4QdoPkt2PfGjeOWtwAyaXg_1744101147
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43947a0919aso37696855e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101147; x=1744705947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jjogm03xe8uH9FEbFpCE/wwTjsk8lbbHkAYLp5l0W8=;
        b=cbQkdWcgeGAQJfP6YsWp2EiUoaajPt2wA+Nar0lLNSmUUkxhD4+O5gkGKmDZd5CBep
         CxxwNPjroJ3Cf3E+aCPbr63uIWizHQPLdfu/wM8GJlI2dqe6DU+UnrR+olS5NTPadQIy
         /5lpgilH68WpTTvccbw1wzsfCfMS7s5MpFsIWuXQ319QpkTsP0pkpvqZe9jxpBlVueIb
         4zNLYcaKPfTBmzaGctinncP06AsOXQVzxLL6XVmn9xIsY9ynLRcxCU8bnJ8ENsKOXVLt
         zveiaOiNgPd4GGGoIMk5HFM5GnbKIwKtj5UOT57mEGaTE+8VSQ7dyhN4L6BtAax4iqZw
         ibNg==
X-Forwarded-Encrypted: i=1; AJvYcCX8VC9jZHsa6/sVyQVVaqpjdkPZD7L0/Cg6D5PuwYw9cU6xYkVxmhZM4GKfd9tZFEI8AY/c4C51uqFgjRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1mQz1WXjb7t+kWBEEQWU9ZM5e7PHvhtUt/SJaJYgwPbm/uRlA
	3g/FgaKAdONoVOogKcGAYyqMxZI3lGEVFWc1BOCDZcxYkoloS/vbWa5C6w1Nm1lmN+v5XTUbXGB
	ISnoKbz9N3RvNU+VKAnpRpQj0JX2nRPLp5ekLkL+75z4eY1HxoS8D84268T/+Mw==
X-Gm-Gg: ASbGncsi82PuR4G2z3lN8tqu83By6fGFp72ufWoszQbN1yYivhmB20VBhrt1l7g9Rhu
	DH2AbBecLtITfUQ+0MZtZvCzn3jG4W9Hg6eYg9G3L3nfGWXyBLAmjDk3LeuxOJnq1HrsCFUdIbC
	+X+FjnD+OZlHTZSCbbdixCQwohekRw6cA1y6NBrNTgROg9QJTrtMOjQ83oTD+uvrWbBAqSB3hCn
	O4jflC4ujoZV/euT/sdC+BTtVOrvQs0xs2Q2LjGIoTc/TjUvATlCI1TJG7tDX8X/Q5rcWuuZMHF
	1FuUES/8IEOL5+28PxPJd3wbaXq2NlNm1E6cJlbVZ2mbxqhRPlOL6CPFmA942WfIVA==
X-Received: by 2002:a05:600c:3489:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43ecf9c77ecmr122637465e9.21.1744101146618;
        Tue, 08 Apr 2025 01:32:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGO0mHtfU6tjdIaTwIU3mFKYSEAXTq1PTv+mq26VUWkOFRfaSqPIV+zWD9QaZteOnlwamweeA==
X-Received: by 2002:a05:600c:3489:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-43ecf9c77ecmr122637075e9.21.1744101146092;
        Tue, 08 Apr 2025 01:32:26 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm14565216f8f.66.2025.04.08.01.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:32:25 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sumit Garg <sumit.garg@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Date: Tue,  8 Apr 2025 10:32:07 +0200
Message-ID: <20250408083208.43512-4-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408083208.43512-1-sgarzare@redhat.com>
References: <20250408083208.43512-1-sgarzare@redhat.com>
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

So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
return responses in the same buffer used for commands. This way we
don't need the 4KB internal buffer used to cache the response before
.send() and .recv(). Also we don't need to implement recv() op.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
@Jens @Sumit can you test/review this patch again since we changed the
core a bit adding TPM_CHIP_FLAG_SYNC instead of send_recv() op?

Thanks,
Stefano

v2:
- set TPM_CHIP_FLAG_SYNC and support it in the new send()
- removed Jens' T-b
v1:
- added Jens' T-b
---
 drivers/char/tpm/tpm_ftpm_tee.h |  4 ---
 drivers/char/tpm/tpm_ftpm_tee.c | 64 ++++++++++-----------------------
 2 files changed, 19 insertions(+), 49 deletions(-)

diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
index e39903b7ea07..8d5c3f0d2879 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.h
+++ b/drivers/char/tpm/tpm_ftpm_tee.h
@@ -22,16 +22,12 @@
  * struct ftpm_tee_private - fTPM's private data
  * @chip:     struct tpm_chip instance registered with tpm framework.
  * @session:  fTPM TA session identifier.
- * @resp_len: cached response buffer length.
- * @resp_buf: cached response buffer.
  * @ctx:      TEE context handler.
  * @shm:      Memory pool shared with fTPM TA in TEE.
  */
 struct ftpm_tee_private {
 	struct tpm_chip *chip;
 	u32 session;
-	size_t resp_len;
-	u8 resp_buf[MAX_RESPONSE_SIZE];
 	struct tee_context *ctx;
 	struct tee_shm *shm;
 };
diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
index 637cc8b6599e..b9adc040ca6d 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.c
+++ b/drivers/char/tpm/tpm_ftpm_tee.c
@@ -31,46 +31,18 @@ static const uuid_t ftpm_ta_uuid =
 		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
 
 /**
- * ftpm_tee_tpm_op_recv() - retrieve fTPM response.
- * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h.
- * @buf:	the buffer to store data.
- * @count:	the number of bytes to read.
- *
- * Return:
- *	In case of success the number of bytes received.
- *	On failure, -errno.
- */
-static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
-{
-	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
-	size_t len;
-
-	len = pvt_data->resp_len;
-	if (count < len) {
-		dev_err(&chip->dev,
-			"%s: Invalid size in recv: count=%zd, resp_len=%zd\n",
-			__func__, count, len);
-		return -EIO;
-	}
-
-	memcpy(buf, pvt_data->resp_buf, len);
-	pvt_data->resp_len = 0;
-
-	return len;
-}
-
-/**
- * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory.
+ * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory
+ * and retrieve the response.
  * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
- * @buf:	the buffer to send.
- * @len:	the number of bytes to send.
+ * @buf:	the buffer to send and to store the response.
+ * @cmd_len:	the number of bytes to send.
  * @buf_size:	the size of the buffer.
  *
  * Return:
- *	In case of success, returns 0.
+ *	In case of success, returns the number of bytes received.
  *	On failure, -errno
  */
-static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
+static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
 				size_t buf_size)
 {
 	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
@@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 	struct tee_param command_params[4];
 	struct tee_shm *shm = pvt_data->shm;
 
-	if (len > MAX_COMMAND_SIZE) {
+	if (cmd_len > MAX_COMMAND_SIZE) {
 		dev_err(&chip->dev,
 			"%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
-			__func__, len);
+			__func__, cmd_len);
 		return -EIO;
 	}
 
 	memset(&transceive_args, 0, sizeof(transceive_args));
 	memset(command_params, 0, sizeof(command_params));
-	pvt_data->resp_len = 0;
 
 	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
 	transceive_args = (struct tee_ioctl_invoke_arg) {
@@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
 		.u.memref = {
 			.shm = shm,
-			.size = len,
+			.size = cmd_len,
 			.shm_offs = 0,
 		},
 	};
@@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 		return PTR_ERR(temp_buf);
 	}
 	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
-	memcpy(temp_buf, buf, len);
+	memcpy(temp_buf, buf, cmd_len);
 
 	command_params[1] = (struct tee_param) {
 		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
@@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
 			__func__, resp_len);
 		return -EIO;
 	}
+	if (resp_len > buf_size) {
+		dev_err(&chip->dev,
+			"%s: resp_len=%zd exceeds buf_size=%zd\n",
+			__func__, resp_len, buf_size);
+		return -EIO;
+	}
 
-	/* sanity checks look good, cache the response */
-	memcpy(pvt_data->resp_buf, temp_buf, resp_len);
-	pvt_data->resp_len = resp_len;
+	memcpy(buf, temp_buf, resp_len);
 
-	return 0;
+	return resp_len;
 }
 
 static const struct tpm_class_ops ftpm_tee_tpm_ops = {
 	.flags = TPM_OPS_AUTO_STARTUP,
-	.recv = ftpm_tee_tpm_op_recv,
 	.send = ftpm_tee_tpm_op_send,
 };
 
@@ -253,7 +227,7 @@ static int ftpm_tee_probe(struct device *dev)
 	}
 
 	pvt_data->chip = chip;
-	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
+	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
 
 	/* Create a character device for the fTPM */
 	rc = tpm_chip_register(pvt_data->chip);
-- 
2.49.0

