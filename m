Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C296275864
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781063; cv=none; b=cMZ0sLsbVKjbWXi7hfwNzMJYBe68X1NZHkCzDQB0+dOZuqmAzHfFH5Ygu3c7xOLmpt4AhHGwbMwUwoYOhhqIAf3tfIayZuPLo8S4xRIHcaztACrW7z2XIdHo9RRf0vEon9pxUsYS60o61LabEN+LQERGnEV2XwhrQoR4RQW/K10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781063; c=relaxed/simple;
	bh=zRCxlcH/ra8GADDFcLT7DJcTWYPmd55lgBOJaTcmkfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tN2JiwMAYXsbR1934PhvCXabe/KRDAJRxvmtblzA04CPcEj/IQkzg5JOTAKiabr9OVTUOC2GgbkzNp3KdGkQb+naDEYprAEaCtGh4PIsJR4cW1amiGdFdWm7Xog+5zqGkdh85a9+iFJTyw1+hzwvkNLClMnfrdt9EUEW/eErTTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X7ipJrnN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X7ipJrnN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDWPbShizfOGB/EjWmdUWFa8dOmwyE7Lp4wOXMg3HCo=;
	b=X7ipJrnN+b0cShn5pfSICSjr+iYRvdtHgxqxnQdZap6z2A3dGA89954tl/4gLxiFydk0Pc
	Uhix0u122uOCQ+l4zV4Jn0kPu+awz0R0YlvQx3/IMzostE7MjEsAw0nsNxsLIc9+DM7IWA
	RtVLDvr629H3OT8P+zSoHLF5g6SV3Ek=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-6Yk2EQ_nMY-YnRGlhjRY1Q-1; Fri, 09 May 2025 04:57:37 -0400
X-MC-Unique: 6Yk2EQ_nMY-YnRGlhjRY1Q-1
X-Mimecast-MFC-AGG-ID: 6Yk2EQ_nMY-YnRGlhjRY1Q_1746781057
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ad2200eb1d0so35108466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781056; x=1747385856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDWPbShizfOGB/EjWmdUWFa8dOmwyE7Lp4wOXMg3HCo=;
        b=JnyW7gi+yyQK3f6ujjeHT+n8tsr9AUurgZKYVzQYbN/7kd69ZK/CWkuB/0zjR+Uh15
         KbVnTvu9pGReiumxvpMMSq7eSwJyQpDop0Fwv8wi0Rp5/mZ45LArcgf/WYjPP3jdMbf3
         y3BsV/Z6qLWfWG0la7FR6mQhi6zLL22nVCHHOPrt1NKmCHNmf+2HkIBUs+0KdR8t7Tcd
         bySgkcwognaedc2caKfR+2ULcU7eh2+RB5/FDXkARoHixCZjlFkFNZMJ82yYaEZecN5M
         pQB4jZsgPclykrI4zssqKDrXYZOFeqFmsuDZCwt+TBLEOxxCQa9r4I3VwyZLBff5A+rR
         7Ytw==
X-Forwarded-Encrypted: i=1; AJvYcCVd2ZDEHDoiCO91kKQ97m05RNrFqekEbECYb8vJjPYVNhYap8O0S2rQ7ipqeQftUaKS17QroFVc8bqFSpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkMJuPRbsh3LGiVLixZ5Yv8fe24Dmo6bfI9/zxq1fQib3PheHl
	h4YhGelpZblvibR37CwAXoiA+gP3XoksgaPPB3GamMSUlul+teYxDFhI6n01ehKP0wbfRKboeJo
	PPtcOTn2TYioNW+mlNrBTNf91iUtWOXeSY3w20KvT3bzX9MUdH4EN4+Zd70XSRg==
X-Gm-Gg: ASbGnctLnrJvYdtFBHn3I0pHS/sHyPaJx8ghPxXYWdOSlRg2HEQxAnWWK4aV9fSlM2j
	S7cklAa0Lyy3D9XTSeDsK0FyP19nQd5tClf/oEXsLyild77cP1Mhix3ZmiEc8D8EZYZmh/Uk98P
	WeUZxh25Mxv+GZXrQ5FFJj1YasrD6kLaN5e+SQpHBU+EkYOn7lw1lEbQyJ7jxJxDJg9Wu9fnU1F
	z42QwRPIa10VSI+1l6IxTirwYMLQY7Dc6RUi2ikjrRZD0yGuNoedbEdXWHPqEGSk/MMrIAVa8KG
	DydGjyXGAwEHg5kz0Oqi9lnjSA==
X-Received: by 2002:a17:907:6d17:b0:ace:d442:e3a0 with SMTP id a640c23a62f3a-ad2192800admr253473366b.39.1746781056571;
        Fri, 09 May 2025 01:57:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWC2UI3h5FxOwhQZy5rykHQm7izno8puX6wcw4GMYOzhRsRbgt+ZXqQ0AfZuUWsqn/llgi1A==
X-Received: by 2002:a17:907:6d17:b0:ace:d442:e3a0 with SMTP id a640c23a62f3a-ad2192800admr253468866b.39.1746781055796;
        Fri, 09 May 2025 01:57:35 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd37dsm117478266b.124.2025.05.09.01.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:35 -0700 (PDT)
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
Subject: [PATCH v4 2/4] tpm: support devices with synchronous send()
Date: Fri,  9 May 2025 10:57:11 +0200
Message-ID: <20250509085713.76851-3-sgarzare@redhat.com>
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
index 7ac390ec89ce..681661c93869 100644
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

