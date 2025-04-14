Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3585C2749C5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642650; cv=none; b=GSZyEluYIdHme+CieaIBzXCJrAn8MA2BlpzVgdxhNeFbEXTwaoTXUhkiHIqWian2wbBb2BshQPbart1qf62OAjYEvZtdBqH8Q/JfQX7vSE5p1RjKOEylHfGz7v82YcvoUwqZCl/gFbJ1RcMmM0x2cVtQ4H3wmuKU/Xnyn0GlR6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642650; c=relaxed/simple;
	bh=R4QnQFcPiz+4K8ZI7WgD12ZMOQhjXOvc9mMXJ8CRwMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grg1XOaCdcEb9OqeZ2F9eokC2u9vZEJFyl1oXnSyE+J8qKMs4qWNHeGBbYt0gmtRypL8hoH+sb3ke0UQMR4qemTjQtpsCA9nBN7pbSJsG0knS2NhP3Sf+hGqm5nndDjFcsrliitNa2WvWi/MLFucwk3A01Z/2IgraZsGartn1kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvzyCt7g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvzyCt7g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744642648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8R/1ZeDKDjc3H414LGRfrF2tWtTtWCHG2fr+aJnFmy8=;
	b=UvzyCt7g3/pOXYSXOSNh8t3iQY9bMQkCVUcIy8vDw9+R9UyrHRZgAFEYxsF1xP3tYjga5n
	S/qjlMaeJTbIGQlOq/tQ8RyuwljOQpkZD9iiDn9JL8YPUMqLJgoWowo4BiMJ+PawPpsf5K
	Qx4x5YD6USa3a+P4l7Yxbl+ChdYdMDU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21--MJrkHQJOIqeTirOTkKFAg-1; Mon, 14 Apr 2025 10:57:20 -0400
X-MC-Unique: -MJrkHQJOIqeTirOTkKFAg-1
X-Mimecast-MFC-AGG-ID: -MJrkHQJOIqeTirOTkKFAg_1744642639
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39c30f26e31so2988626f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642639; x=1745247439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R/1ZeDKDjc3H414LGRfrF2tWtTtWCHG2fr+aJnFmy8=;
        b=t8V54yoDgztgQ7KoNpSIDG2chyDdh4BdAaHxWERUGyh31fR/Qp3xSHtDQ5QaDGcrz3
         doc+Je6vwFqkW1HLyZ/RaqXVv17k3nlEPQBUCRmK7Mh/VootNATBwj2iRc8M7lAXz7/E
         eKWQVYlv7N9lKZpkAp+Bat9xsJo8viNlOtTvoxDJAIQVvayxseFiidaH/n5Iu2UchwA8
         8ORzdRtSZgQSWaR5GI48yJ2J2xPPYdsfv7vBfg7rtMqDS9GZ2HimNOlCeoIR2/cz4Xln
         Una1kDXnjGjy6koTKzmGJQ6oPQhDcfYeebkOGSdjwcadTomMse9RsXq4jwYTVrrJYzJK
         uPPw==
X-Forwarded-Encrypted: i=1; AJvYcCW9ZSudGmj2vcH0VZXZIg9bv9QwbznQtgS/61Xn9wtVAZQn3rbWDSWBG4F+dITifBAOChhlypW9O+3MhDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5DjHBueNRXh38mm0VUgAaM8mBOm3fmteSXsZmO8kpcRsOqOSZ
	NOp9lcAxOT9RamH3OhG3IoNdzA6YxTL6is6OKKME8793Din1eVUQqe0P3G6CITHk0+q9mHmJyE8
	PGn8LkoIFVDIFtlgBcSi2b+TCmemtTTjhznSMOG7qoGW2crjGgEZhPNNHe50U7Q==
X-Gm-Gg: ASbGncvmea5kwCisBqR7IUDbDpKhR3f28Z7mg0IivdjQCcr0nWVyEwyhcLmkUpsmV4R
	YMbUTCnAFYhPZ7B9jaCqnNbXwFEETJsdSIGfXPLOb9iUHbvxUh6Hdm/+5UphX6uKHFVx4zZN/11
	kGrikTGOHmNNCSTvq2cw/VlpDhLQyZj4sZSVg0gP0ZwhQpIA9YFguybASElaNtUt3C/fYATg3AH
	cWT2A1T5OXsgqWL4L7nBrpSpVfyIGcs+hQSoycyXBmdV20uVlyQlcJS1a7KXpISttraDVfSG10m
	ExMSEURjgz1xNHEdGrwGzT7x
X-Received: by 2002:a05:6000:1787:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-39eaaed2015mr9037544f8f.53.1744642639385;
        Mon, 14 Apr 2025 07:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHztG+erjxi0kPl4f2XqgvwdUxEBu7vsO7NjlFZ0D8kctkVzUnk4g2BZgxZgM+ahM52VN9G9g==
X-Received: by 2002:a05:6000:1787:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-39eaaed2015mr9037507f8f.53.1744642638681;
        Mon, 14 Apr 2025 07:57:18 -0700 (PDT)
Received: from localhost.localdomain ([193.207.151.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cce3sm11395582f8f.74.2025.04.14.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:57:16 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Huewe <peterhuewe@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 2/4] tpm: support devices with synchronous send()
Date: Mon, 14 Apr 2025 16:56:51 +0200
Message-ID: <20250414145653.239081-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145653.239081-1-sgarzare@redhat.com>
References: <20250414145653.239081-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

Some devices do not support interrupts and provide a single synchronous
operation to send the command and receive the response on the same buffer.

Currently, these types of drivers must use an internal buffer where they
temporarily store the response between .send() and recv() calls.

Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
If that flag is set by the driver, tpm_try_transmit() will use the send()
callback to send the command and receive the response on the same buffer
synchronously. In that case send() return the number of bytes of the
response on success, or -errno on failure.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v3:
- fixed comment style [Jarkko]
- renamend `out_send_sync` label to `out_sync` [Jarkko]
---
 include/linux/tpm.h              |  1 +
 drivers/char/tpm/tpm-interface.c | 20 +++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 2e38edd5838c..0e9746dc9d30 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -350,6 +350,7 @@ enum tpm_chip_flags {
 	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
 	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
 	TPM_CHIP_FLAG_DISABLE			= BIT(10),
+	TPM_CHIP_FLAG_SYNC			= BIT(11),
 };
 
 #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index 3b6ddcdb4051..3dc06836f932 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -114,8 +114,19 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 		return rc;
 	}
 
-	/* A sanity check. send() should just return zero on success e.g.
-	 * not the command length.
+	/*
+	 * Synchronous devices return the response directly during the send()
+	 * call in the same buffer.
+	 */
+	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
+		len = rc;
+		rc = 0;
+		goto out_sync;
+	}
+
+	/*
+	 * A sanity check. send() of asynchronous devices should just return
+	 * zero on success e.g. not the command length.
 	 */
 	if (rc > 0) {
 		dev_warn(&chip->dev,
@@ -151,7 +162,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 	if (len < 0) {
 		rc = len;
 		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
-	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
+		return rc;
+	}
+out_sync:
+	if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
 		rc = -EFAULT;
 
 	return rc ? rc : len;
-- 
2.49.0

