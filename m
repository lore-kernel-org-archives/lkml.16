Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2919629DB8E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749561186; cv=none; b=EV2ea2a6MSWDYAEdASi1qgQPm0rm90ejJagkaGoYMKru0VJlrMgcJbQt4u6IUkc6siiLB1YXbNb84+RkY4BM1iUU7dEu8qGSM30Ru+aNZOT08e2oKh5FMg1hWEJcMU10Do3D+26VL5FhEdeTphGPV8RiX5dwTw1+NJiylGUZYys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749561186; c=relaxed/simple;
	bh=NfGd8wiVsnIGlkddAY6txj9tOa78YL4VYJnBGkbEwwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNcXN2A4hPjmiDZ3pNwoIPj5LndrF5lnxsaLcBl9Om9RdzSvw9MReeNpsSn2k7lvpSnxEOykSNPH6RInXtPKkjeY/iRDR41c5vHy/g4HKEbUNUZ6kUOEc2xylw8UZPJFNE2ZWV7zJ3cTX+pCAisDU7MsueeXvcmmclNexx+M/6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=enXCOOsl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="enXCOOsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PECxVyikQ9zU3hJ7MtiQUOf3zC4eClOuuMti35ulFIo=;
	b=enXCOOsleK4wf8WVCNU2SD7VmQ57CFvZpO7g2Pgs0NA288oBw+HhL8IIpCYjrKsrTkLYk4
	npVGPVYgfOiq6XLVD99W1frwgbdSAz7O6TsitC5vz+TDMTSHrIpHTAVWzeUTHMCBqeyKik
	p6fU3/9MhikskvGf0Yx0FcrFGN8KKgI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-R1eNUcJDN8WdvjmNEvZkYA-1; Tue, 10 Jun 2025 09:12:49 -0400
X-MC-Unique: R1eNUcJDN8WdvjmNEvZkYA-1
X-Mimecast-MFC-AGG-ID: R1eNUcJDN8WdvjmNEvZkYA_1749561168
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so1365665585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561168; x=1750165968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PECxVyikQ9zU3hJ7MtiQUOf3zC4eClOuuMti35ulFIo=;
        b=WFIgk54JciPveIzSRAuCSf3c6/w5xkf3/Q5AwxQi+q8R98/SUDjvn+ITskUqxD6gwb
         Ywi6Ep94NwdKhJ/ZSCpiNF2UzIqeW5/VzUqRZTj8Lwgn8Ug2LGZM+AQIDV4g5a18syGN
         tLC7CF/XhmDiWPtkdt4oxXCHNeqQp9LhkiuzETxwwUw5SQWJg2N29pPBE/x5l/cKb/tJ
         XczqNrdyJgomM9wDvtl10P0EZcLZotemexm4V0ZQoZWpOXtQ2Ujaoyl4HNGyxh+HoVz4
         D1FQcukuM4xpER21rOOhOhPJ/k8fbIAO6QSSs+jLvMPQG2B2R4onWLPmyWsfUBJxQrtG
         33bw==
X-Forwarded-Encrypted: i=1; AJvYcCXChCGwLF8NnWVAwF8h7pK140wXwOkjuNfeKS+bvM2wWSiwYcag1VZf8HoHBf67zoSAJoS38rrfKEM23wE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSTjT0tES1vd5LOP9+JGgNIY67wvZ//tzNUdZhFQhFS4BAhOy+
	PVYmcQMB72fABNQdsMhFZ1qZED3oQkGESfdBAG7704mTi7yGjCx+zW5cEiWGqoD1p6HowKQ0Dg/
	ZBNRGaAJYW/G2RCyBCK8pCFiPwbWpmaYMZ9t/QWD+c0GpEguVEESOij3vPvZfOAoOlQ==
X-Gm-Gg: ASbGncuR9/KH0wWuUdJih/7qVA8aWFloqze+/KxYLOF8uNZLvY9n/Rb+VtNj0rVfEjO
	BLHLJ82iDHRw2g0jlJs1IIHpODnsNV4Es8v/gIxexZxtSqHOiVRtRFqeqU8AVPzw60OMoM/3uKi
	lC+05LgMJRBrjWDZK3O0tNWy1vnW2KBOeBj9BDdIL5IKL2sqpzr7kXTkX/C8Z+/dPg+az2YCOeX
	aYQ8gtxpI8uFgvDcpm8lewUp8qgs9cW+xpFtB6PznSaUxn0HxLXfx6SyOeUC0nDVsxKfwEG1DbY
	6m+u0eJRwLNrlj6461CeBIajoxoo+gHYTGw3/uF0ljNZtz8kY30QyQ==
X-Received: by 2002:a05:620a:454b:b0:7cc:fef2:51b9 with SMTP id af79cd13be357-7d2298ec18fmr2737089985a.52.1749561167972;
        Tue, 10 Jun 2025 06:12:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5bCzCA/Bb8gTxULZZifA/R0afXX8wGKlcmbzwfFYe6YdDUcmddGY0FzDv8nfqETa2Ner9Hg==
X-Received: by 2002:a05:620a:454b:b0:7cc:fef2:51b9 with SMTP id af79cd13be357-7d2298ec18fmr2737085985a.52.1749561167617;
        Tue, 10 Jun 2025 06:12:47 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4301:5e20:98fe:4ecb:4f14:576b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25170615bsm696832285a.9.2025.06.10.06.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:12:47 -0700 (PDT)
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
Subject: [PATCH v4 1/3] Documentation: dma-buf: heaps: Fix code markup
Date: Tue, 10 Jun 2025 06:12:29 -0700
Message-ID: <20250610131231.1724627-2-jkangas@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610131231.1724627-1-jkangas@redhat.com>
References: <20250610131231.1724627-1-jkangas@redhat.com>
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
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

