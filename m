Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B79295DA5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424926; cv=none; b=h26iDry0XN98Bqy2oqh1GK0i0AQfmyMQuZfXdVCjJKhfdlEZ84hlCL7LzhuGhy3JTNd4Hm8a/qwKU3ZUJQw9UV1f/HHCbNLQbUjIAlZsHlZngbfLYIHM5rkRa5NkkX4bTfpobb3sUb4rJo3po71ss8dRw+I9t76gzBURMQiDGEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424926; c=relaxed/simple;
	bh=SGqgKoG22b6C1KUVZdjUSTs2kaB+RNsW6eQB1XhBn8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSBHZ+1FB9TBN2IktWUcjzFO55J4hGdbGPdHtyaIm6lCX5+/WzSwPxW6AZASVR+UDA07yzNlI37fR2l+4Nk9cBQSPzPETEWrrUs25NutFg+bO3VY/WorOsRzkArMZW8YWVzE9yoXQ6EwO6xqsBWSeMOQJQsKhnt+if0yJlEdhI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=indMRVrf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="indMRVrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mU6fRW0bf+EYAAFC1zO6IHYHxJSiouX7LXjrsfJfSvc=;
	b=indMRVrf1f+sEIA5sZ5dCR1F1aNZYJJPrhll8jSrw3cHMSW/bEh3qfn6VnlZrnUdgu2w/i
	jzPi27s4iZQAlhxNB3yhWKW3Ap8TCX+Y/YVz5djQGTZtBOwii0nVIjIf6b/CRmbDCSukVN
	8CwmB40IGgtuGdxIoAKe0l7A/ls5yMk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-qx8N8pLIPn27Zet9ewz6ww-1; Fri, 20 Jun 2025 09:08:42 -0400
X-MC-Unique: qx8N8pLIPn27Zet9ewz6ww-1
X-Mimecast-MFC-AGG-ID: qx8N8pLIPn27Zet9ewz6ww_1750424921
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so916772f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424921; x=1751029721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mU6fRW0bf+EYAAFC1zO6IHYHxJSiouX7LXjrsfJfSvc=;
        b=sEVRJNHc/J1u6RJnH5VMtFNzke2P7EmFBiAptf443Xm3mhWFPQuQsOU1ZC8/EncY//
         f+8LAInVEk8T6rVfQtdcwtrmngL0hnpl0OKNC1iOetAG3rRKZGY+X4zTKQnHtUZepCni
         asnzaGGQDuc5XWdE3bxGkBpPFHqf/PI3vJtcHYoTJyFNMc9xxt64tXrYe/aHFyK8FMDH
         qgKnbEPfe4iiHonYwYcFu2AhmwNl9p83TgSMNKKL406QLkC27EfrjUdlmg+l7l469Yv3
         ZaLVm9+O848Gvl2m9gssKLC36sqs71jqlhIqSewKkRq/bDatTKSZla/8d4BCP+qifbta
         JTug==
X-Gm-Message-State: AOJu0Yyh9jwDmv/kzHT61Q5vY9k6Ah/oV6f1D/KhkBgMkp6AW39mD/XP
	au5JkF/J1Qd3bU7lwfRsUGlOg6eCMJvL88gf2IME7jlLE0i2i2+Nh1ALEYXee9HhRNOpu6kgQRg
	6yWXLcEgGTbuCyhCdVFdiupSprMG6DQ5Tv0Pv9dkfQ3ftj1vyiEhlXcx3hpg8tdXKcQ==
X-Gm-Gg: ASbGncvIa/0xw2pAZ+zwNNMM11cK2Osct4Mpu20bigQeAo8B9jm+Hbfaanc/yRAK5Ey
	yynh4gBXWtAHdS4WKEKV0XF2D8GcGeUjZLbTtsB5LNqV7z5kVfxLnqElMo+TGeR66IS85Ksrq+8
	hxgAoNWhlTTyPTQYVUUhUqzdLzqRQdh1sn43uomrt0UiT6V05ym4jTOGQsYLS+7Yxghu/2vqw9l
	7DnpQLi5QOzvlIrrCtYOeLRxAo1SjdjegiUA4oxpoNsIaL+D+Nzkimvkt7CXVBvii/RO3P0VFRf
	JSnUpbp50e3K704rV81hNAFrmBy6BmHIgGE=
X-Received: by 2002:a05:6000:2dc4:b0:3a4:c909:ce16 with SMTP id ffacd0b85a97d-3a6d12e8b9amr2295002f8f.49.1750424921112;
        Fri, 20 Jun 2025 06:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMsc23lsWWlIHXqE+KHJfC+ZldUu1vo9dW8yxZbj2jYFLBGKoFW23IJVfV5e9H69ci92Gx7w==
X-Received: by 2002:a05:6000:2dc4:b0:3a4:c909:ce16 with SMTP id ffacd0b85a97d-3a6d12e8b9amr2294941f8f.49.1750424920468;
        Fri, 20 Jun 2025 06:08:40 -0700 (PDT)
Received: from localhost.localdomain ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1815dsm2006309f8f.28.2025.06.20.06.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:08:39 -0700 (PDT)
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
Subject: [PATCH v6 2/4] tpm: support devices with synchronous send()
Date: Fri, 20 Jun 2025 15:08:08 +0200
Message-ID: <20250620130810.99069-3-sgarzare@redhat.com>
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
index cafe8c283e88..804fbbe3873d 100644
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

