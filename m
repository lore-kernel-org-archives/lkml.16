Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFBD13635E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053274; cv=none; b=ShYQ/uQn+hJRLe0yM3VAGOT6YJMx8QYcxf13azZskdk9I44n/iLVzpqqYsVxzRmW19IIBa8bfUJkCBBJ7RWi88hVN1ksHSL6oFGuI2lA3N7qsBFVGS87m1aY1eUqkA54X1jPZQ3oGsHXk+FS+LCPE+BkfbPBmO17FLVBAytHzag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053274; c=relaxed/simple;
	bh=8iSz8jBeX1KZuRVVHaPIDDcwWFktOFemhE20zzNrMbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWGTqlqD8fHKqPKJe/DV5nWo0gtHD1Ou5H9FySC3UrdzjMo7dreMT2EomfFR7TgZ0P0EjkB0R8qhM9DQHfx7ORXTsq6UVRDkIv+BdodSBZ6AmAcauaXk6BGX/1Q1XB+sC3migXPlYJZo4eg/cIgKtd6quzbrmGmOHP3xSqhv0FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XEEC2sbL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XEEC2sbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747053271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hrbmXyUL7HXGUWgagRU2heQ2lgkOZ/iJWMnvv1t5buw=;
	b=XEEC2sbLTsqZnMRnts1BYsjAWLELeqpMBsreyOmvs4qLCz2ED2x5+nES01ayGSOJweCLlu
	XpJ2woI+bMy0ZmouDloX5PMN9+03IQAcX6Hw2F+wSu0cZSVs5tk+nsszOP8zcr7zkQcDGo
	pY81ONAro/B3J0xvautKdwD5CyFx/p8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-jYn_B_E9PfyAK8EFm1NE9A-1; Mon, 12 May 2025 08:34:30 -0400
X-MC-Unique: jYn_B_E9PfyAK8EFm1NE9A-1
X-Mimecast-MFC-AGG-ID: jYn_B_E9PfyAK8EFm1NE9A_1747053269
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442dc6f0138so9402875e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053269; x=1747658069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrbmXyUL7HXGUWgagRU2heQ2lgkOZ/iJWMnvv1t5buw=;
        b=m1coeqlW+aGodffYAmw2lNChJZiFJXpqa0GH8s4geghWq7FRnja2eT5oO2idZqdBMN
         tYZJz1PpZ3crbsaJNMx1f/n5nG+oIhKJxBlejZByoQQHnwY407YVQSNtQR3du2BTsThz
         wx8hxcGlCNlzmdGeqHmac43xLU0u5lQiw5X6H7EjyOdf4aTWl9mUovmPr8BJxsfdQC1P
         qSZrrmU+l0xXISsGmoE9oMfM8JVybVCJiszHdJuGQJ5wxFNfByRjZ8WZhU49cRNynvq/
         IjxYsMHGrZaUqJihBtKMyOEsN/MtRPxDWmXXDKc2AzBFEun70ozPCVC5SnSRCHbdoMet
         RCrw==
X-Gm-Message-State: AOJu0YxhuypUrr5Na8enb8Dk2O9366QwBPX4qkoGej/setkY0c94vFIX
	pgrktzCx09BrITWuOI+CezT6CciW9pQlsgibfUGcBeua7AvRLP1XJBv90njdqWjY7K1plUMVBrz
	tlNZisfLPoe7ToSPLxBVxwiJ15x3SZPt0Z1CrpGSIs7YLkHHbrqs/ayiiKbzDHos5F202nTdGoE
	7h1nWsI/ww/QAQHrMLOfNesfHrzwdvSs6RWJVA9BNayjfu
X-Gm-Gg: ASbGnctPtlYJlHDqeD2cBMPUdqxRVTRbiXiuMuvR7Z71eChtpC3d9aRXyF/A7+20kEE
	DrKep/Mu2QNb65KisHpDA8N//Ew+W3SQW4JsNOU//3JPFZBI552llIOXviGt4uZFy5+c5GWM8kj
	nWkQF2VaqZNAi8zH0Z0chCgxLkHyPcuXckNmEKx5gMiUC4ANU4e5GVjl/yXG83h/fqpY2OgrUx9
	/GW667z4LB6YB4UvPKe4SBerYEcZmZtLP+J9oLgWiqxifkUeyGLEJ9WRtaxoNcI/rzRDp5ddTr/
	UhzAauA/8hvTFmO4kY3/AJYK0fckN2Fau8Y9vdQoJOQ5S/2EOjQrnp752OVrn1bVDbxPpqgf
X-Received: by 2002:a05:600c:444c:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-442d6d3dcc8mr126250245e9.10.1747053269349;
        Mon, 12 May 2025 05:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7YFyagUZ9y+fevUV3BzP4ffMO+2lnku0MMlhrkvHNYDdbfZ5KLiwSKLyxUHWcSulKlrGmcw==
X-Received: by 2002:a05:600c:444c:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-442d6d3dcc8mr126249585e9.10.1747053268821;
        Mon, 12 May 2025 05:34:28 -0700 (PDT)
Received: from localhost (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d687adc0sm123327975e9.35.2025.05.12.05.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:34:28 -0700 (PDT)
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
Subject: [PATCH v2 01/11] x86/mm/pat: factor out setting cachemode into pgprot_set_cachemode()
Date: Mon, 12 May 2025 14:34:14 +0200
Message-ID: <20250512123424.637989-2-david@redhat.com>
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

Let's factor it out to make the code easier to grasp. Drop one comment
where it is now rather obvious what is happening.

Use it also in pgprot_writecombine()/pgprot_writethrough() where
clearing the old cachemode might not be required, but given that we are
already doing a function call, no need to care about this
micro-optimization.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 72d8cbc611583..edec5859651d6 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -800,6 +800,12 @@ static inline int range_is_allowed(unsigned long pfn, unsigned long size)
 }
 #endif /* CONFIG_STRICT_DEVMEM */
 
+static inline void pgprot_set_cachemode(pgprot_t *prot, enum page_cache_mode pcm)
+{
+	*prot = __pgprot((pgprot_val(*prot) & ~_PAGE_CACHE_MASK) |
+			 cachemode2protval(pcm));
+}
+
 int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
 				unsigned long size, pgprot_t *vma_prot)
 {
@@ -811,8 +817,7 @@ int phys_mem_access_prot_allowed(struct file *file, unsigned long pfn,
 	if (file->f_flags & O_DSYNC)
 		pcm = _PAGE_CACHE_MODE_UC_MINUS;
 
-	*vma_prot = __pgprot((pgprot_val(*vma_prot) & ~_PAGE_CACHE_MASK) |
-			     cachemode2protval(pcm));
+	pgprot_set_cachemode(vma_prot, pcm);
 	return 1;
 }
 
@@ -880,9 +885,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
 				(unsigned long long)paddr,
 				(unsigned long long)(paddr + size - 1),
 				cattr_name(pcm));
-			*vma_prot = __pgprot((pgprot_val(*vma_prot) &
-					     (~_PAGE_CACHE_MASK)) |
-					     cachemode2protval(pcm));
+			pgprot_set_cachemode(vma_prot, pcm);
 		}
 		return 0;
 	}
@@ -907,9 +910,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
 		 * We allow returning different type than the one requested in
 		 * non strict case.
 		 */
-		*vma_prot = __pgprot((pgprot_val(*vma_prot) &
-				      (~_PAGE_CACHE_MASK)) |
-				     cachemode2protval(pcm));
+		pgprot_set_cachemode(vma_prot, pcm);
 	}
 
 	if (memtype_kernel_map_sync(paddr, size, pcm) < 0) {
@@ -1060,9 +1061,7 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
 			return -EINVAL;
 	}
 
-	*prot = __pgprot((pgprot_val(*prot) & (~_PAGE_CACHE_MASK)) |
-			 cachemode2protval(pcm));
-
+	pgprot_set_cachemode(prot, pcm);
 	return 0;
 }
 
@@ -1073,10 +1072,8 @@ void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
 	if (!pat_enabled())
 		return;
 
-	/* Set prot based on lookup */
 	pcm = lookup_memtype(pfn_t_to_phys(pfn));
-	*prot = __pgprot((pgprot_val(*prot) & (~_PAGE_CACHE_MASK)) |
-			 cachemode2protval(pcm));
+	pgprot_set_cachemode(prot, pcm);
 }
 
 /*
@@ -1115,15 +1112,15 @@ void untrack_pfn_clear(struct vm_area_struct *vma)
 
 pgprot_t pgprot_writecombine(pgprot_t prot)
 {
-	return __pgprot(pgprot_val(prot) |
-				cachemode2protval(_PAGE_CACHE_MODE_WC));
+	pgprot_set_cachemode(&prot, _PAGE_CACHE_MODE_WC);
+	return prot;
 }
 EXPORT_SYMBOL_GPL(pgprot_writecombine);
 
 pgprot_t pgprot_writethrough(pgprot_t prot)
 {
-	return __pgprot(pgprot_val(prot) |
-				cachemode2protval(_PAGE_CACHE_MODE_WT));
+	pgprot_set_cachemode(&prot, _PAGE_CACHE_MODE_WT);
+	return prot;
 }
 EXPORT_SYMBOL_GPL(pgprot_writethrough);
 
-- 
2.49.0

