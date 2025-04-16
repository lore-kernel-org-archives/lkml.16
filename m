Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF052080DB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817218; cv=none; b=rzDIDm/c/dcm0a8nFOYwhBlYy7wnJr1qY/pF7OpXq4DO1FalFrrmPY2nf5l2eMZ8Ly/N62N6EJeCWwRErbz2nfvcOKrPy1uAGYob2zV4prXHcAHLxqzn6EnmvZB+WR+bmV1X+rIfn7PC35aNkltupUL/qWVn5LqW41HfAuDXjDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817218; c=relaxed/simple;
	bh=lw3AVtJbpuAwOe11LdCap/7mFJF4YAPAEl8JSKKuzOs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IyG/q5zta5SOc2cnYhAfmpGpIxNaIR4/MS4e1DRilTko8yIwCsa8Ff/TK2MgaOQkV04xSAfcCLhr7IwN1ADWuR88St/HH5G3UqVlOidnlnkgWXmCQxvYMLY6MzccLQrdj1JIDltgm3qe0TFim0uFKgbHOR2+AJcyFJPa93FuqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hjsXrviy; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hjsXrviy"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5e5c5ea184dso6420853a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817215; x=1745422015; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySUALm4kAiEtFHHbP93/9gqyCVQ7SC9yKGUHGHBoiHU=;
        b=hjsXrviyhWBG+ylfCl1U5eKuoBg2ZsHTISJiytZKGG8YPrn9g4KPUOYC6B6t7Cg6BI
         B05cGtiAuKn9c0jzkNTOdj2CGHS1yHf+lyP7dwZU38z7Ez0D1BtroQl046flSr/v7ZZ2
         ejPH2G0UzuP+1pYdUsjphUR1GTI5kv2ZAzCzgbIx0S6hkDBelErfxBu/FUJTCiwcOLNU
         GRFoqIDRDdUDnsNgJnoQkfgAyML2MjsYCFyG9Rhq9i5SWdKXPZ1ms2yhhcQioGsbd0gR
         qltWyuMFR5HJUBekmtJ8sfhwIJxoo3vwVaOq8isAefsa/sVrlACwhFGCvmxRuRSSIHeT
         mO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817215; x=1745422015;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySUALm4kAiEtFHHbP93/9gqyCVQ7SC9yKGUHGHBoiHU=;
        b=Suk55neh9Hu1GmdJq4L6a+XyeIjtI/B7WCMM4XfXYFR8CRU1Gs9DMOqwTCpq2rmfuF
         0aaXzsFqlqTfTVKEj6WLvIYvR22mGnQ8D5ivdqwHuwfHhBkzUo8T3MSCU83fqeYDtd9n
         1Fo9/1cngfFudwzMocKNx1kKQBbcDME2ozacnwaZjRqJKXVtek2VfioFpfhF74XbbEVj
         1WPy+JJxKlPBlK1w4oDqI2XfHeLDIYp2wvjBrDPjjRCIqZr8sxFuqZ/Kj01xluFhZ6gN
         L3V6zmPlqRmZ/YtKlUCfyOr8iAAVNMnZA3AXoNgvUwjGDB+z42aTmE8C0XMOqK6X9vH8
         88Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXwY/WwlIwds01pE1o3GeLZEHw+StHdY9utGM9x03HzkNkogyJvYHqZ6CmCZRBihuhlnQG7/UiGDdq1VAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAy+Y5gzRAxqC9BYvwdSwO9CbFF7yy8cqgi1dgPafFR++e8iF1
	WDEXD7mLunl5OgkMwY3unWX4xzIF7fWoSe/OlHOBOruVscLxhYW1FaaKFt9t0t9541YUYH2uUwO
	U+LqF1g==
X-Google-Smtp-Source: AGHT+IFO6LqLQpchltIVKkcVMTkkcoAUlzOcNnFkY+QSrpAdIOkv/ajoQQVC0VjwY0/SmeO3qq2XvFKzCmMO
X-Received: from edb17.prod.google.com ([2002:a05:6402:2391:b0:5f4:b71f:15a6])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:26c8:b0:5f4:c619:2392
 with SMTP id 4fb4d7f45d1cf-5f4c6192660mr959365a12.1.1744817215420; Wed, 16
 Apr 2025 08:26:55 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:42 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-3-qperret@google.com>
Subject: [PATCH v2 2/7] KVM: arm64: Fix pKVM page-tracking comments
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Most of the comments relating to pKVM page-tracking in nvhe/memory.h are
now either slightly outdated or outright wrong. Fix the comments.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/memory.h | 29 ++++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index 34233d586060..178028172c0b 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -8,20 +8,29 @@
 #include <linux/types.h>
 
 /*
- * Bits 0-1 are reserved to track the memory ownership state of each page:
- *   00: The page is owned exclusively by the page-table owner.
- *   01: The page is owned by the page-table owner, but is shared
- *       with another entity.
- *   10: The page is shared with, but not owned by the page-table owner.
- *   11: Reserved for future use (lending).
+ * Bits 0-1 are used to encode the memory ownership state of each page from the
+ * point of view of a pKVM "component" (host, hyp, guest, ... see enum
+ * pkvm_component_id):
+ *   00: The page is owned and exclusively accessible by the component;
+ *   01: The page is owned and accessible by the component, but is also
+ *       accessible by another component;
+ *   10: The page is accessible but not owned by the component;
+ * The storage of this state depends on the component: either in the
+ * hyp_vmemmap for the host state or in PTE software bits for the hypervisor
+ * and guests.
  */
 enum pkvm_page_state {
 	PKVM_PAGE_OWNED			= 0ULL,
 	PKVM_PAGE_SHARED_OWNED		= BIT(0),
 	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
-	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
-
-	/* Meta-states which aren't encoded directly in the PTE's SW bits */
+	__PKVM_PAGE_RESERVED            = BIT(0) | BIT(1),
+
+	/*
+	 * 'Meta-states' are not stored directly in PTE SW bits for hyp and
+	 * guest states, but inferred from the context (e.g. invalid PTE
+	 * entries). For the host, meta-states are stored directly in the
+	 * struct hyp_page.
+	 */
 	PKVM_NOPAGE			= BIT(2),
 };
 #define PKVM_PAGE_META_STATES_MASK	(~__PKVM_PAGE_RESERVED)
@@ -44,7 +53,7 @@ struct hyp_page {
 	u16 refcount;
 	u8 order;
 
-	/* Host (non-meta) state. Guarded by the host stage-2 lock. */
+	/* Host state. Guarded by the host stage-2 lock. */
 	enum pkvm_page_state host_state : 8;
 
 	u32 host_share_guest_count;
-- 
2.49.0.604.gff1f9ca942-goog

