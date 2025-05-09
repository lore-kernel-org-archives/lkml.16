Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672212749D3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781058; cv=none; b=cZha1fZxrBAGzQ3Czm/NjtZvnUpQBN9yqPH80k8+YLz7n4q3OdTz2Rvee8FKsO/3PErAT34E38VsC2SxzCgGlF5/RoxAmyZcMveR1bnXlFuEMaqhiMTAQi2y2Nijupm76dj3GPbZUYS5lExsAJBlQ+smoZih7P/2VHMOJWl+6nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781058; c=relaxed/simple;
	bh=CwIU8tcj+L8HFA25cf1cTqoLO7wqS55dyVws9X+LrZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ql/R8/o9qqCYPgHEwYN4ANgGc3XWLOXX4Q4peMj+B8i1vJL8KpHB4deO0ugN75C5G0dF02CG4rtHlThARQVexLfvIAno61jTqNtxRstwWZa2/JXQTUzULzX4OTsNAgdXio7M2pZ9JAWyRqsaGECuPBNqK9n/gvKhsUDeYb83/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CxhsZuJL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CxhsZuJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1s3Je0ZFPe8U1bt0sD5VWH0wDBbOn/omwkgu7nK9eko=;
	b=CxhsZuJLB83MF362amo6xZYaoR0OwGLqSb8iqU3LKrGdhhpNJnTG2JnSnCKxFvd5yfi7Zt
	4p952Eu9bpESoD0jVaFjXOSLgoQMj8EHbHirYixzijY5UUejcE2qbPFZp7W1HxiqTiasBS
	rLgslw4QBhcuee4iveYWfnysFNuZKMs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-HjVdLO9mMveJlPmeIlNblQ-1; Fri, 09 May 2025 04:57:31 -0400
X-MC-Unique: HjVdLO9mMveJlPmeIlNblQ-1
X-Mimecast-MFC-AGG-ID: HjVdLO9mMveJlPmeIlNblQ_1746781051
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ace99fe4282so224758466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781050; x=1747385850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1s3Je0ZFPe8U1bt0sD5VWH0wDBbOn/omwkgu7nK9eko=;
        b=EyE8N4kXENPvYcIXYzvjNa0XcSWd4PL2357zYfwQMiKJybD+yePAZ4zDovZ4txGmk5
         L4StbP8oVZM7XLqTzfvRtbbp3LL3h9dAsai147UFeVk9Z3pDtAI78bTO8sjzfFYll6T9
         Dn5XazlS8ahn3bFnYpSGCgN5LMTRC0soa5tc5STsaHPAHhAkXjOwrKeSOhtWAQqtSFpa
         cxyuot4lV54i8Ba42QqCnzdKMBph3HZvXmNoIv2AKkXI8Qfs0ht1kYnxYx0gr35PP+Xz
         bG1rzPwqpdr9pasaxAvwQlWsaSlfpsPMIgcyBEbpMRS/UvbKxUantSQGmluqdDagsvM4
         TWMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXidpedRwPkUp1mxi21UKl/7cdKZWqFecHojLitOE5r33NrHdV+DJWr8JxGArfc/cjOQZ8juevsPdmaiq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMnoro2AlZPkudP6D6Xxah7cBJxZmExQb9bLZE0Ps0XTLvCRF6
	ViZ0I6JDsJR3btfOAe2y+ILJROK7oB0grhj6044fZ+uJ1tVAJYhjwuBReYEPhrz6g1c9IOgsylI
	Bh0cfv2o5Uz6KemeBv5FOZcBMkNV487Sq1QUh0krvElX+CL8SNyFXIWoB3lK60w==
X-Gm-Gg: ASbGnctSJjzttazQlvp3gCHAEKatfRx0fUKjMVksNHds71CVoa9QesRYRqejqfMqClV
	LMrNbzEHyBOEfhKhwlZj1iDCZ+zHyp18lA1vgNORFfpFzWX3aCKBaTX0n5akfOd8EoD0WtgnG09
	I3sql8wun/faQnAxhK9OavVxPsKgwx+QPOI8y9iEi8SW3Rkgb9ROb3VZJ3xwfAfIhsPbm8WG4O8
	ZHGRLiGlszxQM3FYgdS90EenSmB+nTq9xpYqJCOaoCsNikmBawixb9dBYSKZELuHJVHKmzFWLMG
	4Qatuak4LG4BpSW7Z12ir4AjOQ==
X-Received: by 2002:a17:906:c111:b0:ac7:2fbb:ba5 with SMTP id a640c23a62f3a-ad1fca0b654mr675485966b.7.1746781050360;
        Fri, 09 May 2025 01:57:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHagLstxpWB5hayRxG0xJtF3NJ71NxcNJHJL8yuwox8dKV4UaoASRd63LLbW6wYVNLrCnSs7g==
X-Received: by 2002:a17:906:c111:b0:ac7:2fbb:ba5 with SMTP id a640c23a62f3a-ad1fca0b654mr675482266b.7.1746781049648;
        Fri, 09 May 2025 01:57:29 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2193495bdsm117976566b.70.2025.05.09.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:28 -0700 (PDT)
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
Subject: [PATCH v4 1/4] tpm: add buf_size parameter in the .send callback
Date: Fri,  9 May 2025 10:57:10 +0200
Message-ID: <20250509085713.76851-2-sgarzare@redhat.com>
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

Add a new `buf_size` parameter to the `.send` callback in `tpm_class_ops`.
This parameter will allow drivers to differentiate between the actual
command length to send and the total buffer size. Currently `buf_now` is
not used, but it will be used to implement devices with synchronous send()
to send the command and receive the response on the same buffer.

Also rename the previous parameter `len` to `cmd_len` in the declaration
to make it clear that it contains the length in bytes of the command
stored in the buffer. The semantics don't change and it can be used as
before by drivers. This is an optimization since the drivers could get it
from the header, but let's avoid duplicating code.

While we are here, resolve a checkpatch warning:
  WARNING: Unnecessary space before function pointer arguments
  #66: FILE: include/linux/tpm.h:90:
  +	int (*send) (struct tpm_chip *chip, u8 *buf, size_t cmd_len,

Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v4:
- rework the commit description [Jarkko]
---
 include/linux/tpm.h                  | 3 ++-
 drivers/char/tpm/st33zp24/st33zp24.c | 2 +-
 drivers/char/tpm/tpm-interface.c     | 2 +-
 drivers/char/tpm/tpm_atmel.c         | 3 ++-
 drivers/char/tpm/tpm_crb.c           | 2 +-
 drivers/char/tpm/tpm_ftpm_tee.c      | 4 +++-
 drivers/char/tpm/tpm_i2c_atmel.c     | 3 ++-
 drivers/char/tpm/tpm_i2c_infineon.c  | 3 ++-
 drivers/char/tpm/tpm_i2c_nuvoton.c   | 3 ++-
 drivers/char/tpm/tpm_ibmvtpm.c       | 6 ++++--
 drivers/char/tpm/tpm_infineon.c      | 3 ++-
 drivers/char/tpm/tpm_nsc.c           | 3 ++-
 drivers/char/tpm/tpm_svsm.c          | 3 ++-
 drivers/char/tpm/tpm_tis_core.c      | 3 ++-
 drivers/char/tpm/tpm_tis_i2c_cr50.c  | 6 ++++--
 drivers/char/tpm/tpm_vtpm_proxy.c    | 4 +++-
 drivers/char/tpm/xen-tpmfront.c      | 3 ++-
 17 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 9ac9768cc8f7..7ac390ec89ce 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -87,7 +87,8 @@ struct tpm_class_ops {
 	const u8 req_complete_val;
 	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
 	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
-	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
+	int (*send)(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
+		    size_t buf_size);
 	void (*cancel) (struct tpm_chip *chip);
 	u8 (*status) (struct tpm_chip *chip);
 	void (*update_timeouts)(struct tpm_chip *chip,
diff --git a/drivers/char/tpm/st33zp24/st33zp24.c b/drivers/char/tpm/st33zp24/st33zp24.c
index c0771980bc2f..3de68bca1740 100644
--- a/drivers/char/tpm/st33zp24/st33zp24.c
+++ b/drivers/char/tpm/st33zp24/st33zp24.c
@@ -300,7 +300,7 @@ static irqreturn_t tpm_ioserirq_handler(int irq, void *dev_id)
  * send TPM commands through the I2C bus.
  */
 static int st33zp24_send(struct tpm_chip *chip, unsigned char *buf,
-			 size_t len)
+			 size_t len, size_t buf_size)
 {
 	struct st33zp24_dev *tpm_dev = dev_get_drvdata(&chip->dev);
 	u32 status, i, size, ordinal;
diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index 8d7e4da6ed53..3b6ddcdb4051 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -106,7 +106,7 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 		return -E2BIG;
 	}
 
-	rc = chip->ops->send(chip, buf, count);
+	rc = chip->ops->send(chip, buf, count, bufsiz);
 	if (rc < 0) {
 		if (rc != -EPIPE)
 			dev_err(&chip->dev,
diff --git a/drivers/char/tpm/tpm_atmel.c b/drivers/char/tpm/tpm_atmel.c
index 54a0360a3c95..5733168bfc26 100644
--- a/drivers/char/tpm/tpm_atmel.c
+++ b/drivers/char/tpm/tpm_atmel.c
@@ -148,7 +148,8 @@ static int tpm_atml_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 	return size;
 }
 
-static int tpm_atml_send(struct tpm_chip *chip, u8 *buf, size_t count)
+static int tpm_atml_send(struct tpm_chip *chip, u8 *buf, size_t count,
+			 size_t buf_size)
 {
 	struct tpm_atmel_priv *priv = dev_get_drvdata(&chip->dev);
 	int i;
diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
index 876edf2705ab..38f765a44a97 100644
--- a/drivers/char/tpm/tpm_crb.c
+++ b/drivers/char/tpm/tpm_crb.c
@@ -426,7 +426,7 @@ static int tpm_crb_smc_start(struct device *dev, unsigned long func_id)
 }
 #endif
 
-static int crb_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int crb_send(struct tpm_chip *chip, u8 *buf, size_t len, size_t buf_size)
 {
 	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
 	int rc = 0;
diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
index 53ba28ccd5d3..637cc8b6599e 100644
--- a/drivers/char/tpm/tpm_ftpm_tee.c
+++ b/drivers/char/tpm/tpm_ftpm_tee.c
@@ -64,12 +64,14 @@ static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
  * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
  * @buf:	the buffer to send.
  * @len:	the number of bytes to send.
+ * @buf_size:	the size of the buffer.
  *
  * Return:
  *	In case of success, returns 0.
  *	On failure, -errno
  */
-static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
+				size_t buf_size)
 {
 	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
 	size_t resp_len;
diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
index d1d27fdfe523..572f97cb9e89 100644
--- a/drivers/char/tpm/tpm_i2c_atmel.c
+++ b/drivers/char/tpm/tpm_i2c_atmel.c
@@ -37,7 +37,8 @@ struct priv_data {
 	u8 buffer[sizeof(struct tpm_header) + 25];
 };
 
-static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int i2c_atmel_send(struct tpm_chip *chip, u8 *buf, size_t len,
+			  size_t buf_size)
 {
 	struct priv_data *priv = dev_get_drvdata(&chip->dev);
 	struct i2c_client *client = to_i2c_client(chip->dev.parent);
diff --git a/drivers/char/tpm/tpm_i2c_infineon.c b/drivers/char/tpm/tpm_i2c_infineon.c
index 81d8a78dc655..25d6ae3a4cc1 100644
--- a/drivers/char/tpm/tpm_i2c_infineon.c
+++ b/drivers/char/tpm/tpm_i2c_infineon.c
@@ -514,7 +514,8 @@ static int tpm_tis_i2c_recv(struct tpm_chip *chip, u8 *buf, size_t count)
 	return size;
 }
 
-static int tpm_tis_i2c_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int tpm_tis_i2c_send(struct tpm_chip *chip, u8 *buf, size_t len,
+			    size_t buf_size)
 {
 	int rc, status;
 	ssize_t burstcnt;
diff --git a/drivers/char/tpm/tpm_i2c_nuvoton.c b/drivers/char/tpm/tpm_i2c_nuvoton.c
index 3c3ee5f551db..169078ce6ac4 100644
--- a/drivers/char/tpm/tpm_i2c_nuvoton.c
+++ b/drivers/char/tpm/tpm_i2c_nuvoton.c
@@ -350,7 +350,8 @@ static int i2c_nuvoton_recv(struct tpm_chip *chip, u8 *buf, size_t count)
  * tpm.c can skip polling for the data to be available as the interrupt is
  * waited for here
  */
-static int i2c_nuvoton_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int i2c_nuvoton_send(struct tpm_chip *chip, u8 *buf, size_t len,
+			    size_t buf_size)
 {
 	struct priv_data *priv = dev_get_drvdata(&chip->dev);
 	struct device *dev = chip->dev.parent;
diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 76d048f63d55..660a7f9da1d8 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -191,13 +191,15 @@ static int tpm_ibmvtpm_resume(struct device *dev)
  * tpm_ibmvtpm_send() - Send a TPM command
  * @chip:	tpm chip struct
  * @buf:	buffer contains data to send
- * @count:	size of buffer
+ * @count:	length of the command
+ * @buf_size:   size of the buffer
  *
  * Return:
  *   0 on success,
  *   -errno on error
  */
-static int tpm_ibmvtpm_send(struct tpm_chip *chip, u8 *buf, size_t count)
+static int tpm_ibmvtpm_send(struct tpm_chip *chip, u8 *buf, size_t count,
+			    size_t buf_size)
 {
 	struct ibmvtpm_dev *ibmvtpm = dev_get_drvdata(&chip->dev);
 	bool retry = true;
diff --git a/drivers/char/tpm/tpm_infineon.c b/drivers/char/tpm/tpm_infineon.c
index 2d2ae37153ba..7896fdacd156 100644
--- a/drivers/char/tpm/tpm_infineon.c
+++ b/drivers/char/tpm/tpm_infineon.c
@@ -312,7 +312,8 @@ static int tpm_inf_recv(struct tpm_chip *chip, u8 * buf, size_t count)
 	return -EIO;
 }
 
-static int tpm_inf_send(struct tpm_chip *chip, u8 * buf, size_t count)
+static int tpm_inf_send(struct tpm_chip *chip, u8 *buf, size_t count,
+			size_t buf_size)
 {
 	int i;
 	int ret;
diff --git a/drivers/char/tpm/tpm_nsc.c b/drivers/char/tpm/tpm_nsc.c
index 0f62bbc940da..12aedef3c50e 100644
--- a/drivers/char/tpm/tpm_nsc.c
+++ b/drivers/char/tpm/tpm_nsc.c
@@ -178,7 +178,8 @@ static int tpm_nsc_recv(struct tpm_chip *chip, u8 * buf, size_t count)
 	return size;
 }
 
-static int tpm_nsc_send(struct tpm_chip *chip, u8 * buf, size_t count)
+static int tpm_nsc_send(struct tpm_chip *chip, u8 *buf, size_t count,
+			size_t buf_size)
 {
 	struct tpm_nsc_priv *priv = dev_get_drvdata(&chip->dev);
 	u8 data;
diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
index 4280edf427d6..d3ca5615b6f7 100644
--- a/drivers/char/tpm/tpm_svsm.c
+++ b/drivers/char/tpm/tpm_svsm.c
@@ -25,7 +25,8 @@ struct tpm_svsm_priv {
 	void *buffer;
 };
 
-static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
+			 size_t buf_size)
 {
 	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
 	int ret;
diff --git a/drivers/char/tpm/tpm_tis_core.c b/drivers/char/tpm/tpm_tis_core.c
index ed0d3d8449b3..5641a73ce280 100644
--- a/drivers/char/tpm/tpm_tis_core.c
+++ b/drivers/char/tpm/tpm_tis_core.c
@@ -580,7 +580,8 @@ static int tpm_tis_send_main(struct tpm_chip *chip, const u8 *buf, size_t len)
 	return rc;
 }
 
-static int tpm_tis_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int tpm_tis_send(struct tpm_chip *chip, u8 *buf, size_t len,
+			size_t buf_size)
 {
 	int rc, irq;
 	struct tpm_tis_data *priv = dev_get_drvdata(&chip->dev);
diff --git a/drivers/char/tpm/tpm_tis_i2c_cr50.c b/drivers/char/tpm/tpm_tis_i2c_cr50.c
index 3b55a7b05c46..1914b368472d 100644
--- a/drivers/char/tpm/tpm_tis_i2c_cr50.c
+++ b/drivers/char/tpm/tpm_tis_i2c_cr50.c
@@ -546,13 +546,15 @@ static int tpm_cr50_i2c_tis_recv(struct tpm_chip *chip, u8 *buf, size_t buf_len)
  * tpm_cr50_i2c_tis_send() - TPM transmission callback.
  * @chip:	A TPM chip.
  * @buf:	Buffer to send.
- * @len:	Buffer length.
+ * @len:	Command length.
+ * @buf_size:	Buffer size.
  *
  * Return:
  * - 0:		Success.
  * - -errno:	A POSIX error code.
  */
-static int tpm_cr50_i2c_tis_send(struct tpm_chip *chip, u8 *buf, size_t len)
+static int tpm_cr50_i2c_tis_send(struct tpm_chip *chip, u8 *buf, size_t len,
+				 size_t buf_size)
 {
 	size_t burstcnt, limit, sent = 0;
 	u8 tpm_go[4] = { TPM_STS_GO };
diff --git a/drivers/char/tpm/tpm_vtpm_proxy.c b/drivers/char/tpm/tpm_vtpm_proxy.c
index 8fe4a01eea12..beaa84428b49 100644
--- a/drivers/char/tpm/tpm_vtpm_proxy.c
+++ b/drivers/char/tpm/tpm_vtpm_proxy.c
@@ -322,11 +322,13 @@ static int vtpm_proxy_is_driver_command(struct tpm_chip *chip,
  * @chip: tpm chip to use
  * @buf: send buffer
  * @count: bytes to send
+ * @buf_size: size of the buffer
  *
  * Return:
  *      0 in case of success, negative error value otherwise.
  */
-static int vtpm_proxy_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t count)
+static int vtpm_proxy_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t count,
+				  size_t buf_size)
 {
 	struct proxy_dev *proxy_dev = dev_get_drvdata(&chip->dev);
 
diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-tpmfront.c
index 80cca3b83b22..66a4dbb4a4d8 100644
--- a/drivers/char/tpm/xen-tpmfront.c
+++ b/drivers/char/tpm/xen-tpmfront.c
@@ -131,7 +131,8 @@ static size_t shr_data_offset(struct vtpm_shared_page *shr)
 	return struct_size(shr, extra_pages, shr->nr_extra_pages);
 }
 
-static int vtpm_send(struct tpm_chip *chip, u8 *buf, size_t count)
+static int vtpm_send(struct tpm_chip *chip, u8 *buf, size_t count,
+		     size_t buf_size)
 {
 	struct tpm_private *priv = dev_get_drvdata(&chip->dev);
 	struct vtpm_shared_page *shr = priv->shr;
-- 
2.49.0

