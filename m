Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5183824501D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180077; cv=none; b=ur3O7g9sjOHFqpeYO2wpJxnW7nsxU3RG5072F9Eqel7ykuSV93DU+aeFUb/ZJ1CZtPyYEbgyE6WXLjgj+duYHNIxanXEggtBkpm2S6yhfz6/C8LcneSSrRPHgb9yRBf5u9GuifGe0objGEBdbA4CqunVHHFJAtpNis7mxxIG+pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180077; c=relaxed/simple;
	bh=K6D/di6lA+uVA6E3AQ7OcMI+aIt5a8gGMoofegAlu74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mkxrnLQI5RK0Uwswg5eJx/uaCM3aZwOOYA61vsA7xpNuzZyb+fgpWmEnh01/4W+zuAv+09ESau1dr7FHWfrxKwVc3Eym55nqysRFpU3JPpfMcRhrAivCH1yiPZgMYYvQktmps4jXd2hoclQWm8l5WCBwJV/tvmVv5FggTKaqV2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udsnngaM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udsnngaM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acbb85ce788so422101566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180070; x=1746784870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1anNv4Z25lfJ6IEDtR0M/iXAZvESKw8M2gLCl/3GqgY=;
        b=udsnngaMiu4HZwa72tQ13KsWDqtwRtRluVrAszilSe4HH9W1TGkq+VLjlNoWyuRZvO
         nOEW8xOs5u6zWvCFsslAKAgVImXaDLN9S3nh+lgBS6yi2ajf7ZFZH7qlIfvygqi9l5YS
         vuIYW6lfewu0h+A50BBwkYfLujgImh7HFWmqFowpZzJYZfLA9YgzWX5vI4jp+7mJc64t
         ZwsI4t1teZMq+qqSgpsQwxMDlfzP8/+du+jnLjHh8Xt25GWRa50unQ2LLkepm2Au5yEi
         lrhrPKwWkOpAV6p0MFRDkY3tOUMdP15VkrCr0J7YGwS51d/bgSkZIn1+rBxS0ackmIQ0
         fMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180070; x=1746784870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1anNv4Z25lfJ6IEDtR0M/iXAZvESKw8M2gLCl/3GqgY=;
        b=GNATGl0HBESFPunnBJEkfClkabRqfSBk2SFmnvy3dMbQRScYLlpoR5f88qdURVMgc8
         /zuntSR4SvEvpxcDyfgoLdsL9Erpi7zj3S9Jbix1SLtGy8L+OQ23VbOqycP5eczSRSVc
         iB0b2Rw1bXBYpHUc3eO6ywOIHjKudOQHl7/SmHuc0QeS/oZRd/EfpNC653yJaJs9k6k6
         Pj1MQIhEwcf7AcSjcD9QeMjfkpjageEOo817hvqnYQ+/OIx0j4c8I8UhyFC933aROlVZ
         3CjjY570cSNGM5Qio+CZpWfkwgE//yrvWQv8EGIW79JdoOdpux5zca7Aee9/tHgcS2w7
         EExA==
X-Gm-Message-State: AOJu0YwMtIOXqlmn9UtZm3TSl41PFNxeNU1nR31qx4izHHYT6Qx3AGvO
	BBjzIU/W9FLQtl6L7KMrmsQgzd+4dUfV33JWgpcahDGoP4tFczu5kt77uNmyvvvl4T17CnUZkQi
	Z3yw=
X-Gm-Gg: ASbGnct9ZtHhiqminpo+jUch/zPK/HXgivFSHlznfj1CJQ2A6q5cK6+kGHHCDH7TLYm
	9HusOCntO9o+o1Aaj6nyOqsXYyMLuHabLpn2mEFwgzWuiMGaBFeeKel93NhBxobk+vzB1C3Nof2
	uHcbeyTbaIAvRx3M7Skt5bJOHwOb9E9vcGshHrEecHwA8p+saSqboVGWlKnywipFwTIrlec6e6I
	JMlBnrYBaaxCAzl0bQWLXu+4PyodKgge4e5xuTTNNyrIhHfKH7mJ87dLEYs4//FcvA39gSjzI++
	/gUYg3lVL1Qr26MAfOMkC49VxFOXxCqssalAbaKO5TadSpLHdzVsGRCT0chUfmIVOt+ImnIp3KV
	G079tg7hRQ3qdva1JQw==
X-Google-Smtp-Source: AGHT+IGbNYwwYka0rS/o95u834QMshNlm6ZE08gyDe8QEBQfbOvJaJeikFzKXGrLN54PFU3NRdyFmg==
X-Received: by 2002:a17:907:7255:b0:ace:f2c2:5a4 with SMTP id a640c23a62f3a-ad17ad5d279mr201865366b.13.1746180070053;
        Fri, 02 May 2025 03:01:10 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:09 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Subject: [PATCH v8 09/14] cma: export cma_alloc() and cma_release()
Date: Fri,  2 May 2025 11:59:23 +0200
Message-ID: <20250502100049.1746335-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the two functions cma_alloc() and cma_release().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 mm/cma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/cma.c b/mm/cma.c
index 15632939f20a..c60901e73a26 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -915,6 +915,7 @@ struct page *cma_alloc(struct cma *cma, unsigned long count,
 {
 	return __cma_alloc(cma, count, align, GFP_KERNEL | (no_warn ? __GFP_NOWARN : 0));
 }
+EXPORT_SYMBOL(cma_alloc);
 
 struct folio *cma_alloc_folio(struct cma *cma, int order, gfp_t gfp)
 {
@@ -1002,6 +1003,7 @@ bool cma_release(struct cma *cma, const struct page *pages,
 
 	return true;
 }
+EXPORT_SYMBOL(cma_release);
 
 bool cma_free_folio(struct cma *cma, const struct folio *folio)
 {
-- 
2.43.0

