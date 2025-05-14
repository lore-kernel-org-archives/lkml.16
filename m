Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8026827A44A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230419; cv=none; b=soePOkVnaESM7saI/iKXbRhaYBdVJM7MdbNV8sBGczuwoi32pWpZvlST6H//7DgomyQwtZM6oldf4f0yt/U8xb4ZBGSerJ2ZXC30amzCUQz7kDNn1dTcfnPOFT4sLdaHm1jiEQ5gf5kKMS+C5dXilhOkU1uDa9MDH9XBEsl0uVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230419; c=relaxed/simple;
	bh=ha8DqHOX2rnYJ73/d/pv6dX8MWM3OBUeyEKEBtDXY4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQlMINOqdYYKP7a13rVJKxv7PWKZqRgkVbELqXYUerHcUY9qszd6SNQy2XEbqbOm/3Q0bKz8iKXDZqGyvgxOhT9CwEpCmxyZ8Hy+1ttTQQkJBejf645pa9dLKkBJ4jm/aCbqdWlrpjwwI942LFdzdZIoCGup8Md3G+IjGoVFcPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eAt2jYNN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eAt2jYNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM3A1DQYgNN+uT3lHR2nzVPEIJjvspM419SembxT0i4=;
	b=eAt2jYNNf18+JaTqvlrV0XVUfHanQ6DpvKTM9W3dC+bSEbEfZQvz2DDjLb2PDphMU8lG8B
	20HG29iY83GxYGIr/wpYmnMdntM+741blBg+zrqtUCVpCQNV6q8/KlbVDT3aDJNeqNwv0h
	+49A7UHSlGkfYlZeIKNSvMh6+7LFcFo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-GGjX5xFpO4OSDr_nfYXRSA-1; Wed, 14 May 2025 09:46:53 -0400
X-MC-Unique: GGjX5xFpO4OSDr_nfYXRSA-1
X-Mimecast-MFC-AGG-ID: GGjX5xFpO4OSDr_nfYXRSA_1747230412
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a0b9bbfa5dso2512909f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230412; x=1747835212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HM3A1DQYgNN+uT3lHR2nzVPEIJjvspM419SembxT0i4=;
        b=im0p2Ieu/kwC2jfKKTRo4n1cl3zfiLwrdN5lhb9zGCVZ5jNyQjmw0clxAF21bQ6eoF
         qVPBj1QWtgdgMlhSbaKjAjNywz4fhnZ1Wzq28UFGMl25t8aRhoz/lxA2gl/lODhxAy00
         s8J5JjytUtFDqtfVSGPyMFSolBpCQ4jHrYmGfHPa3gqT297Im1d0yM+DUCj0v/F8YxF0
         PH9fEd3zxCT9rQs6fo8LkU1wUPC/I22lWPuT9OJgqslw8hYFFyq5k0hUis2xRnNgpwS5
         7/vYgspklmg3M8petCYFA+vL8eUrcz9K64fSkmwikAxNUqKSjZryjS6kwIwHA0cnoX7v
         08tA==
X-Forwarded-Encrypted: i=1; AJvYcCUfLVC0bUgwIWMIaVyKctsw8copQmJ7OwVHMBgybGfbZiNzoZPvVtdU12fA8wskD24gh3jcw5Pa2dt6nIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxuCRQOqO46+VDINfNQXg/NdG3U1Pwp2NtCJhadAQHnDMUst/Q
	Ho4PvQ9OnIboy9iuMdvA2GyFT4NdDKA2gYaFTTm9K2Qwb3J4aLx+Ymjx8JLx8F6Xm9rbg8G9L0+
	/Dp0HGK4HAcsSgYTBhowFc3oyUJayw5Jo2W/lzQlyPYhaLm2t5axfBpo9wQWWiQ==
X-Gm-Gg: ASbGncs/Qz1/oI+DuhQm//QL5CbhKoTwSbEDT6bPYYTmbChf7TqQVStG2B5+SGJzE8L
	Km9R0pA8fUbnr1DcXsXXfR81bMcW/b2AaADYrED2YLdyOow8Envo+wpWrK3wZmL5k68L/jnLywi
	a33DiAMaXjajtmnRvxnyHoQkpDC8M2luVgIrdnFBor8H/yfxYSYEVfu09NAJud5wqNtw7yETst0
	3vKopXMArL8W1CriucU96bse0atUpqIHRYy/qf3+4PRaylPgM0wyylDrC03/9lsCJeckiZqyzw4
	Tx5dFxsQshcZr7tAAzg=
X-Received: by 2002:a05:6000:4285:b0:3a3:447c:c341 with SMTP id ffacd0b85a97d-3a3496c20bbmr3094557f8f.27.1747230412074;
        Wed, 14 May 2025 06:46:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH78JQgYCZi7PAI6RbgXsNStikuLBd+X8aPd5vCyBuwPC57MACif1PRt1AJ3M7lUf2aeHKigg==
X-Received: by 2002:a05:6000:4285:b0:3a3:447c:c341 with SMTP id ffacd0b85a97d-3a3496c20bbmr3094514f8f.27.1747230411506;
        Wed, 14 May 2025 06:46:51 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.148.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2a07sm20175282f8f.50.2025.05.14.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:46:50 -0700 (PDT)
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
Subject: [PATCH v5 2/4] tpm: support devices with synchronous send()
Date: Wed, 14 May 2025 15:46:28 +0200
Message-ID: <20250514134630.137621-3-sgarzare@redhat.com>
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

Some devices do not support interrupts and provide a single synchronous
operation to send the command and receive the response on the same buffer.

Currently, these types of drivers must use an internal buffer where they
temporarily store the response between .send() and .recv() calls.

Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
If that flag is set by the driver, tpm_try_transmit() will use the send()
callback to send the command and receive the response on the same buffer
synchronously. In that case send() return the number of bytes of the
response on success, or -errno on failure.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v4:
- added Jarkko's R-b
v3:
- fixed comment style [Jarkko]
- renamend `out_send_sync` label to `out_sync` [Jarkko]
---
 include/linux/tpm.h              |  1 +
 drivers/char/tpm/tpm-interface.c | 20 +++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 10917087b70e..33f2aa1a75ea 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -351,6 +351,7 @@ enum tpm_chip_flags {
 	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
 	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
 	TPM_CHIP_FLAG_DISABLE			= BIT(10),
+	TPM_CHIP_FLAG_SYNC			= BIT(11),
 };
 
 #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index 816b7c690bc9..512882ac0db1 100644
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

