Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58CC29553F
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053296; cv=none; b=vAs4cbxRfU6Muto1iJGf4vcdvcL367gwou6fRkNQPJL70HEv7ZTaM0/YNw9woHDaCpJvXP5vnMfkiPzPAiAtMLZzONYEGYY4xveJr6PSShV/Sc0bOr/D3mx+4Er86nR3R8TPoWx9syt5gicd47dpsE6NFFthbQZdaNJku8ydpDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053296; c=relaxed/simple;
	bh=pVi4R8RYxTF7t8uftAo4cDXigtBNE8xhnByzL6xMI50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBxHEueuP+Z95KzlITh0681e/fKYKgpn9geMiQlxeoLyavbpf7OxTmtDh/7hkbzNn6tRa1TCcDXDzlFaa++JzhNXgu/7awJa3ou+7KqlgGQCDO9JAmaFVtLR7RHA4Tl6Uxhexmx4zZ6oQ/ic/O25bK9/xN6UfedWwdKiGZKoVK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HIAIGOwF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HIAIGOwF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747053293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7NNc3thH4gIlgL655OdyQ8soQ2dq/lJKbobAXK9pSA=;
	b=HIAIGOwFvhbMghFDXhi34b7OPjVHwcYPaopgZyqU8XU8LdKNPag0rBjlA01K8qiXD4Pns1
	M1399LkYIgRVm0mVUiX4da9aDrH95HRMZWdAK7GsluWl+udhkXyDQyI1DBNhv0ziMSDQOH
	42JZ/hNR/SxEzcHLh4zIV7BFWkYQr8g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-RcXie036M5C55hm8t9UgGQ-1; Mon, 12 May 2025 08:34:52 -0400
X-MC-Unique: RcXie036M5C55hm8t9UgGQ-1
X-Mimecast-MFC-AGG-ID: RcXie036M5C55hm8t9UgGQ_1747053291
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442d472cf84so19760815e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053291; x=1747658091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7NNc3thH4gIlgL655OdyQ8soQ2dq/lJKbobAXK9pSA=;
        b=YOyd/m1Nt7nNNeAY5hGjvSLb07GDde3wWhSp3T3GlOPTSENnAAuuJ0i9KjXXs6wdWO
         s4DfY84tkOQFLTruEq0YqLBIC7lWJSx6z99O6+xSe8w3mvXRlnEAGsiNYqVlMI3Z5XiC
         6VkWbpmBskKR4K3tB+U9VWkQ8QMfRlbi2fF7kfkmPE2b+GAXuUaEDk2Pno/T30cIAA1s
         yGN/VTmNIo2o9nkYlr/yto9+SrLQbAaWfUS3MMkS6e8PH2bJ+vmFfUCkPfayMoffYppG
         PsiPHHgI1Ydg9EJqSvtCKpIfpj6am0EjBBOct9qatZ/JF+3FaWz/UJQA1kZ1dIThUjfJ
         P+6A==
X-Gm-Message-State: AOJu0Yy286YncmUlyJsvzr4kCcgobuaJQJpXFCRuq7rF8aIO8G0izj8g
	IT+8WS1UBQDnZeHgO/rTJT3ycqHeVtxz9JxC6pn1L8aYZ9wvqz7BamqglOUogrGs6eo2ODd2qJ0
	xSSdKCbroFnQUsYu/CsHsH4QlLZ0pq/jlBRKV7NeH3sBg4czcSPfNjWOuSl5quWL12XDRX9cvHS
	tbF+h7DO+33ltQ+50nb67nwG0pEUPwmY4k6rzTpT0ONN46
X-Gm-Gg: ASbGncvvKBg9iHa0KBi0u4AkR6MNNG9YXVBtIJ3WoEsTEe4s+zh4q5o3t/Mgqofsq5q
	JWmnFOdqk8XduPf8Rye+LsZIwDIiI3HJdwJGnIPXoEFgSENssBRWJ57ojJd5vJ/K58invUqw0wL
	SH1pp5UFzzs4eKfkep1UbT4KccbisCg9P+UYHe2jCr7qqKDtsiE2YeDdS8UzwvH7504JHcel2OQ
	QtuP3oyF5Lbe0zYCA4/4y7ga/0sWe3O8v55ctSzhK82uq7Mj2q/Yd4JxP4VDoVdXBWshggx6Q28
	DeYNwEgpe5ihKYkZHKqomRIBHORC1ultdxyKSm8rppiPRn6wb4vIk8aEuRKdMpf/HBqZhR9C
X-Received: by 2002:a05:600c:6488:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-442d6d6ace2mr126162235e9.19.1747053291275;
        Mon, 12 May 2025 05:34:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5jxWWVElGWxNHl3crVYv65IUanKXS9MQimx+SU1bSVoqMYrPVegNxma7hfxGl7cXYCgZC+g==
X-Received: by 2002:a05:600c:6488:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-442d6d6ace2mr126161635e9.19.1747053290770;
        Mon, 12 May 2025 05:34:50 -0700 (PDT)
Received: from localhost (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd3aeb79sm167091005e9.27.2025.05.12.05.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:34:50 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v2 10/11] drm/i915: track_pfn() -> "pfnmap tracking"
Date: Mon, 12 May 2025 14:34:23 +0200
Message-ID: <20250512123424.637989-11-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

track_pfn() does not exist, let's simply refer to it as "pfnmap
tracking".

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/gpu/drm/i915/i915_mm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
index 76e2801619f09..c33bd3d830699 100644
--- a/drivers/gpu/drm/i915/i915_mm.c
+++ b/drivers/gpu/drm/i915/i915_mm.c
@@ -100,7 +100,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
 
 	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	r.mm = vma->vm_mm;
 	r.pfn = pfn;
 	r.prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
@@ -140,7 +140,7 @@ int remap_io_sg(struct vm_area_struct *vma,
 	};
 	int err;
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
 
 	while (offset >= r.sgt.max >> PAGE_SHIFT) {
-- 
2.49.0

