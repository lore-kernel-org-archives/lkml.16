Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDAF2641C6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101147; cv=none; b=Ui3JknRfhoW0tl1tKkgyPQGar8hGKXzgrDXquvFT6Mz081aZ3BjP3XTt4w51qepR7g+x8fsaI0Nacbw5wOGwBylSy3kuQl31r5woCCchUAOIwtBs6iTWh2XIJquUvJ7jJyLLZlhaEsNjokKMHibLz4nK8bkYCFJ5V6OGny9zyPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101147; c=relaxed/simple;
	bh=WvbgwlAGGsl+4IleITMI6e4y/KHe7f57c66lAWpy3NI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p0+6As4D0UwJvix7cIBRSJHb4p2qy4ROWw9FYIH3I6TuqkIRPOjoEfBtIafljUN68YlPsDB34k4b0K+F2APXm2cVvCTzGIPuHe6SIe1oLzqUnHBWKEE49jwAa6RHZJ9hc/e5X8j3+z0j/GPRVZZ6dZzrhY91fHvB/gLgCg2J/hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QzYIbl3l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QzYIbl3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDE/YZIPCEEz/h330X/plomZy4BudCgqspAc85dgVok=;
	b=QzYIbl3lvtm3aKVhR8N6vqyZcmVUPaBGR6S1oYXEaPRHX7m3zN89lrKRnW5kIiQCIpIv7m
	WUfC3sdtPLnMQ0LSEw0xnHM2yDomt4jA61TGaLhNGxRh3+/eCaKDZLsfStufrVqNTk9YCp
	Hx+fahkvYDTAMfP5iifjmk7w4j62KMs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-X8DMtTk6Oz2vdMnqLRvuBQ-1; Tue, 08 Apr 2025 04:32:23 -0400
X-MC-Unique: X8DMtTk6Oz2vdMnqLRvuBQ-1
X-Mimecast-MFC-AGG-ID: X8DMtTk6Oz2vdMnqLRvuBQ_1744101142
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so36341715e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101142; x=1744705942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDE/YZIPCEEz/h330X/plomZy4BudCgqspAc85dgVok=;
        b=SsbEZFOGSTGFoXMrQ0IsFP0ftEwqpfH4kFuiEULxNx+JHRUyFPKYmAg/WGzGYSU80C
         LMOLxYV/mIWwQfQjDJIyDUSEJAHsBBAfY9z1XYFtcjaCAdjI9PDQMspEtWmOqQIOX/cB
         Gzr1+d1mXGOJo4YEd4c679UxVUbjaRXrRDS8ddK7vM9JMm7/I058zubUHTNCy6Osk3B+
         1FzVn1Ulqr0UDem6QQR5mD0+o/RY2DcJPgHHxW3wKjn5ZHUiFgeG8sXkg8TntXFfYxVZ
         OqxC0vdmYF69B9o4I9zlhlvcxhQxKwl4oT1YZSl24p9Q8n1K38316ZVnMLo6mym6MJCz
         /V8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiY+aupYBoF2bPPF/CDxgSGGDyZ4Fy8IVB2J1iNcR8rwWV7Sb8csId0ufVUjDursxSO5YmwBcwipGXPaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxykFYuQRkWxB5TqXKH+6J0Cq2OmMLUZOPUaCDdeeBkpzv1gjFB
	tNIIuqbYQX/sZucnGuNS+UlH+nvBFGp+IO8dJ9e4rKvc3L2UwJAD11lJp6rOVg2q+n9DK/LJiWz
	tKZlbhHRR9H+TdqCFLrdicYBGIHy+HyCaFUpx1nBzjEpE/0gKgbdVg8rwu7wg9srYXOSryA==
X-Gm-Gg: ASbGnctjg+FAv6NOGOR/TYDKfCvavw0+uZ0XuntLdVfmknn38O9NoFTUnCwJAuRKPIE
	QwtD+JTtalOak3gscCA3SNJ8LoRR28pyfZhXjl7VpfewmIG+kUk+VG6MQSJUuX3JihHUpqKTcCT
	hTu6xWj5NQyH+3UVToCrsTwPI2B/2uAXlaDr27ASlatKP/q3teh/BVhfaiMmhJLac/vGc8yMIo4
	5Ue2LW8RBUm4oYNf3oyZlqxWzteFRWnaQ8QxA9aluD0EsHDodgvIC+Ejb9tWvx2r2N0sd5s5v+3
	3k13qvrLuRCOASPAZf2GRfwJrEQqsMQWDm0s48yDMX0db40W8ux4hsAkxAj1VRS0Tw==
X-Received: by 2002:a05:600c:1e13:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43ecf8d0b48mr141342885e9.19.1744101141993;
        Tue, 08 Apr 2025 01:32:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQhp1MgrEqOjc+4MW66KZXrp62NtlwXCuZ1w3QWz8IsRQIARyOk/4wlryzdly6gRSlx08ezQ==
X-Received: by 2002:a05:600c:1e13:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-43ecf8d0b48mr141342355e9.19.1744101141383;
        Tue, 08 Apr 2025 01:32:21 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3009680dsm14051923f8f.7.2025.04.08.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:32:20 -0700 (PDT)
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
Subject: [PATCH v2 2/4] tpm: support devices with synchronous send()
Date: Tue,  8 Apr 2025 10:32:06 +0200
Message-ID: <20250408083208.43512-3-sgarzare@redhat.com>
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
 include/linux/tpm.h              |  1 +
 drivers/char/tpm/tpm-interface.c | 18 +++++++++++++++---
 2 files changed, 16 insertions(+), 3 deletions(-)

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
index 3b6ddcdb4051..9fbe84b5a131 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -114,8 +114,17 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 		return rc;
 	}
 
-	/* A sanity check. send() should just return zero on success e.g.
-	 * not the command length.
+	/* Synchronous devices return the response directly during the send()
+	 * call in the same buffer.
+	 */
+	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
+		len = rc;
+		rc = 0;
+		goto out_send_sync;
+	}
+
+	/* A sanity check. send() of asynchronous devices should just return
+	 * zero on success e.g. not the command length.
 	 */
 	if (rc > 0) {
 		dev_warn(&chip->dev,
@@ -151,7 +160,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
 	if (len < 0) {
 		rc = len;
 		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
-	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
+		return rc;
+	}
+out_send_sync:
+	if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
 		rc = -EFAULT;
 
 	return rc ? rc : len;
-- 
2.49.0

