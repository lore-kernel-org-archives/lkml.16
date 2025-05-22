Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F0C29A317
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941292; cv=none; b=cogL1LOVN2Ehi47girgiLO0jJdzJhRmg4z7kEkEDZJX+prOoQUTDUkojiwDjoYP/4MwmgVY8Pj6mRdc7YBKrwM01NhNsxCQfOa2DG93rR/hDmPivwUPH8EMt0u8McEtZ0ZZz6N3BWbQw3cYBRpvSNkYzm+9bpDmzigoHeypgRaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941292; c=relaxed/simple;
	bh=48KOU03C6ig9fpKOv9cqZfxnQQrj+t5IAgMqA1jMLOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnTSybIdnViQIYkjHYt6ltPPLuXyWJ1TPcusOvz3YokMnQe3ELOuhniKJDKA7vNAfZdM5tRdm+RBj3l1rYkvJBmhkBveo/HNYUtSrDjYKZNlHY+eFb1rkSy6bnC3vIa9iQpcpF3gM04dnWxuMKBYg69OUUCS+Emjh+fGCOWY3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJ/llPph; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJ/llPph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747941289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxcIBXbY9aD24z/Sdb9axXzItBI4qzUHLrNE5Q1QDjU=;
	b=bJ/llPph6xfk4vtiugTvKrO1JJjsfiklz7r10lyzY6LeTZyc5zkDqI+GuS1M6EyApb2vZI
	mN1I7JWTRMYk5Cm/8m9n2aaOh8DfeGkpkejn0BhY6B17kltPl9YUYZ/9KgWBk2eNC1qrao
	MlAPpgCAuJMqsxNkjbOdEp9SEahubUY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-3n-i2b0rOt2HXaT2mteKNw-1; Thu, 22 May 2025 15:14:48 -0400
X-MC-Unique: 3n-i2b0rOt2HXaT2mteKNw-1
X-Mimecast-MFC-AGG-ID: 3n-i2b0rOt2HXaT2mteKNw_1747941288
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8bdefcb39so3567416d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:14:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747941288; x=1748546088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxcIBXbY9aD24z/Sdb9axXzItBI4qzUHLrNE5Q1QDjU=;
        b=BKwC7dUuTx4mY8NDtZESHrMW3NKNP1OK7k9ziDXhewosVa8Ry3G0f7zGK+U9ti17eZ
         10ESoDbkMVLZkQRqfvkvbzKrlOvavH9LegmcUFeM/1rfNOCXImTf0DAJ2B784xxQ6Zjz
         c/k8nGBm+pO/VBFzWSd7c+wIVXIQnoY2FkHh6GuxoLvoK89y4LB3FekIqEgqaimIgr8z
         ZsxiSeeLEH6BCAoX471CufBfBtItdMKwT1HRQPdWKcIyM0d3BxDpEI8eVYnSl5qQxsCv
         LPctX0wehgWh5M4Y3GaAG8wiMTMM7RmwIk4FQNaNhQ71AeySP59s9YSGGNS30M7+YcXJ
         VEWg==
X-Forwarded-Encrypted: i=1; AJvYcCUI5IoB2hca2tptLXE3sPYJ6TuKBS1Ak0oVnKNNgsN+dpfZupiS8Vtwn2KlMxKfcYdM4lvXfMzSStKTylg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwipltkWx4CKzFuOssNa3a/RWOAoKmiGWabaVywZUbsiImvS74G
	9DXQ8MrdrRrpt1za4HpbgHaHPlHZYLRmr2xlbhBGlVV++zI6L0hTdCXzpkYFgTxmfm5dI8ufd8N
	zy9VdccUr8/DgaRQcZ/uDfj1vQ+LndNxShhJz3r2LClmELp8NKh9z0u9LH+QuUJhgSQ==
X-Gm-Gg: ASbGncuTB4sxVZvDnjLjyFA0nvQfN6z6CDjVVpn4rPZc0fMFV0DB/x4UipJm1cXBye1
	QoG9RwUkUvIpEb5KcOzVIm+9UQXkI4HSBlfBdfvztvh6mKWkuSqDcwYe9xGTLNyn1hW7UUeR12s
	l2T8jiZFSd75dDumzKdzFLQQt2CDbg1P6YElWlyJfLoitI/5zk36rQ0CdPOpUUURwPMNOxMHdHI
	IXMC+1Jg1Ew3F6B+FcS6ya9MCyFfTCsh1iD5is40iuY4wh8qelhg4wY2RBezPMnHQw0uQo1uzXb
	Fgcspw/TeghEGpbyTf6qqWVzfe1WRafcVgwLQaxAPw0=
X-Received: by 2002:a05:6214:21c2:b0:6d9:ac3:e730 with SMTP id 6a1803df08f44-6fa9359ba0amr9187986d6.5.1747941287824;
        Thu, 22 May 2025 12:14:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXDudy5Pg6bUCPRtP0KahbCyP3R5ipmAB0kn6jEZFdIdpWn2q6/ZPEaqhoAbgeWBZfIF4h6Q==
X-Received: by 2002:a05:6214:21c2:b0:6d9:ac3:e730 with SMTP id 6a1803df08f44-6fa9359ba0amr9187686d6.5.1747941287499;
        Thu, 22 May 2025 12:14:47 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ab862sm102862916d6.38.2025.05.22.12.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:14:47 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
To: sumit.semwal@linaro.org,
	benjamin.gaignard@collabora.com,
	Brian.Starkey@arm.com,
	jstultz@google.com,
	tjmercier@google.com,
	christian.koenig@amd.com
Cc: mripard@kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Jared Kangas <jkangas@redhat.com>
Subject: [PATCH v3 1/3] Documentation: dma-buf: heaps: Fix code markup
Date: Thu, 22 May 2025 12:14:16 -0700
Message-ID: <20250522191418.442390-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522191418.442390-1-jkangas@redhat.com>
References: <20250522191418.442390-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code snippets should be wrapped in double backticks to follow
reStructuredText semantics; the use of single backticks uses the
:title-reference: role by default, which isn't quite what we want.
Add double backticks to code snippets to fix this.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 Documentation/userspace-api/dma-buf-heaps.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
index 535f49047ce64..23bd0bd7b0654 100644
--- a/Documentation/userspace-api/dma-buf-heaps.rst
+++ b/Documentation/userspace-api/dma-buf-heaps.rst
@@ -19,7 +19,7 @@ following heaps:
  - The ``cma`` heap allocates physically contiguous, cacheable,
    buffers. Only present if a CMA region is present. Such a region is
    usually created either through the kernel commandline through the
-   `cma` parameter, a memory region Device-Tree node with the
-   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
-   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
+   ``cma`` parameter, a memory region Device-Tree node with the
+   ``linux,cma-default`` property set, or through the ``CMA_SIZE_MBYTES`` or
+   ``CMA_SIZE_PERCENTAGE`` Kconfig options. Depending on the platform, it
    might be called ``reserved``, ``linux,cma``, or ``default-pool``.
-- 
2.49.0

