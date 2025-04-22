Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FFF1DDA1E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349591; cv=none; b=mCCCRo9Jye/pOXOkyMhiFD5hpWjrIbGVsRatVo4tegC2WsjMicrZiPScFJREwY8fbib0djnP1lX29omypq/T4HMhYi/eewtaMGSKUXWIdfcmGyGezE5+PbpcsC4FjQBtIKKXLuetg5RDHNvUccQ1Gs/Uh/84hNtZOv43HUK91qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349591; c=relaxed/simple;
	bh=sfBmd1OBbJI2abcZpauJWCnwwx49LFyiSAV6mfejFhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWfbou8WH0F9WSvyVKlo9sHx0a54nlVRHV0ODwr3IjRjIAQHwDTqAmGEUibrLExj3juUV0eY4SP27T8iMLYq2nHa4rE8xYxOnE6nxoRCS+/PbjCw+T6jGftHkHlbmk5LBCqlJPLFHRQmqQWczqY7tLX4MYR0gsOe9VdgKe2Jg3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AiZgtHuX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AiZgtHuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745349589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
	b=AiZgtHuXKmhHPdg+IxHBFxA9eL3pjXeRFJS98xrxLxTD96GXR3IkYqJqkza+fWr3xhc/+U
	lbKe159Ku1LirNmG2LDnNe35jUALPElhCrCo1WgH4VgXzldkUzd5cAfryWtMcZc/6hy6LX
	am0kjC5/x7ty++fW7Shes/0ObUhMSQs=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-a3fNUo26P2aH5SjLxbea0w-1; Tue, 22 Apr 2025 15:19:47 -0400
X-MC-Unique: a3fNUo26P2aH5SjLxbea0w-1
X-Mimecast-MFC-AGG-ID: a3fNUo26P2aH5SjLxbea0w_1745349587
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4767348e239so109355471cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349587; x=1745954387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DslNlnyYeBMO8E0a4QEwSeg6EwzYfoV0u5u9NaRMXyQ=;
        b=cFg+omeGbOg4voNEYRPxz1W7/eW7fLrnbq8iIX0QqA4eGQrVDHeJvFxDBO56VWKumc
         HPIvv/mi7jawWXPjLi2ZYdkzacUIkoD9h+VHAPr5Al5a76jFESV8pOC69nK4LQswehlC
         6P9eB25DlvvoUzpFoaf6+NIUS2DMffnctReRh2qwysPIyabeEBnzItBmHBLHzvfXwmGF
         X+fFvz7lPpksZN1HV9vSGu3IO7px9ey0ig+LJM3dEr9zvzJrF5BYFXUiigXsztwLqG4I
         ju1fyT75yLDULbaw5w/y+AmXmB2QjSVdlArj6k1PG1KZEd+JTjHZGsaOIkBNnJQABjBy
         0jUA==
X-Forwarded-Encrypted: i=1; AJvYcCXKLOf0mKnKGlVC7F7J5ScDArO0kXXJMumka/3JeYxQ4oFWuskP6XX8r3UUSJ0PiikSEEHkRcbMvMJz/vM=@vger.kernel.org
X-Gm-Message-State: AOJu0YziflmzDWZORbTj5SUNxyLJeQceMIVVLm+Kxn9k16eDrqut3rkc
	vkDQOm3/uEnf7xXabCK4sJtaxYba9fa6Zk7VxJu2woGYb/5r5Jy9AkmJHchx9YrlDRtP0428XID
	v74y2uPxcsrCnvBpP09koKbDRYMnklAW4YARAi2hTXkLqk6nal/J41dwOeNQelg==
X-Gm-Gg: ASbGncuaW7FlTGwiPz62hVYaPq6zeyz7hs3d8KP/f1BjqmRZwBKntUoKlva0CT/+D3U
	JsdWk6zs21xzJ/SSvCgZztASW2EFoeYk/THQgHbWMBzPCY7S1AA73gqRWERIc8KOowGi8Nh5jHA
	AVXnhbxcdUJfBpgv/4BihqkQ4jkkqc7PdKZAoMafXPHvK1dn27Zwdzs2+fdyIgnlTbNnbWtfAd3
	BZCx6XZ/wRxbgz3TO6M8UuD3aGi8Otpb9J3ey5a9wsHP4mEGBk/3A+0Mb7tAAUx7Gtnk5i3crm6
	5awnT1tJC6TTfV4WY3X3pm32tqpzarMJw94iMkZxE+E=
X-Received: by 2002:ac8:7f93:0:b0:476:7112:4add with SMTP id d75a77b69052e-47aec3ac014mr303867591cf.18.1745349587292;
        Tue, 22 Apr 2025 12:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyYuKD1qhPJ8ch5NTGQwzuHZqeIg/SkaansDtfBqNfdQ+I0LBmtC0h/nphRC3WEITMYo7yrA==
X-Received: by 2002:ac8:7f93:0:b0:476:7112:4add with SMTP id d75a77b69052e-47aec3ac014mr303867281cf.18.1745349586902;
        Tue, 22 Apr 2025 12:19:46 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47b01bef3ecsm40842141cf.55.2025.04.22.12.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:19:46 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dma-buf: heaps: Parameterize heap name in __add_cma_heap()
Date: Tue, 22 Apr 2025 12:19:38 -0700
Message-ID: <20250422191939.555963-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422191939.555963-1-jkangas@redhat.com>
References: <20250422191939.555963-1-jkangas@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for the introduction of a fixed-name CMA heap by replacing the
unused void pointer parameter in __add_cma_heap() with the heap name.

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 9512d050563a9..e998d8ccd1dc6 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -366,17 +366,17 @@ static const struct dma_heap_ops cma_heap_ops = {
 	.allocate = cma_heap_allocate,
 };
 
-static int __init __add_cma_heap(struct cma *cma, void *data)
+static int __init __add_cma_heap(struct cma *cma, const char *name)
 {
-	struct cma_heap *cma_heap;
 	struct dma_heap_export_info exp_info;
+	struct cma_heap *cma_heap;
 
 	cma_heap = kzalloc(sizeof(*cma_heap), GFP_KERNEL);
 	if (!cma_heap)
 		return -ENOMEM;
 	cma_heap->cma = cma;
 
-	exp_info.name = cma_get_name(cma);
+	exp_info.name = name;
 	exp_info.ops = &cma_heap_ops;
 	exp_info.priv = cma_heap;
 
@@ -394,12 +394,16 @@ static int __init __add_cma_heap(struct cma *cma, void *data)
 static int __init add_default_cma_heap(void)
 {
 	struct cma *default_cma = dev_get_cma_area(NULL);
-	int ret = 0;
+	int ret;
 
-	if (default_cma)
-		ret = __add_cma_heap(default_cma, NULL);
+	if (!default_cma)
+		return 0;
 
-	return ret;
+	ret = __add_cma_heap(default_cma, cma_get_name(default_cma));
+	if (ret)
+		return ret;
+
+	return 0;
 }
 module_init(add_default_cma_heap);
 MODULE_DESCRIPTION("DMA-BUF CMA Heap");
-- 
2.49.0

