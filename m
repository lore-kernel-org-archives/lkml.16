Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088825A2AA
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216308; cv=none; b=g966UmHne6E+DtLayRBsQYzITHEmOm5VIzcve4pjrDv3fA49ap9jNLUNSJ1UBEdxcFjLO0hbNTfs5+ZuGV8qEXa3W9DrQ+Q/sUrX4Qen/WTcnTo5ZZvCDHUBJVNEBtHJgtGlgZbfyWBzrx9at6d1ouUiFixL2y/ci1iZbCUtXhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216308; c=relaxed/simple;
	bh=L16e+mH6ktPBqGV6aP9/w+AaZ+mPEhmgfdTbdQ7/2+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=riKe3maIGzqkNqZ8ftSOIB1+E2LsL7glGtIQdfe2Y2JwwshahjDFW3GAtQ2AgZizAD/cJrUPjAiop1R4CUoiDDYOJoRwrU4PJT6Qv9G6PxKjZy8bs9DD1ZSbkfPQohJ6vVnfohr2svXqq2K/JBUyQrY7KECU145Qs4Mf4c9ywJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KfS4/8jo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KfS4/8jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739216306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mARFTZKeX08fN9+zJg7ejGdzGLsE2rU+aFhmUgxRNAg=;
	b=KfS4/8jodMlKiJVwcVyxdPzC5rjodW+uMZr1E8j5emxB1DZQa0h028WB4EWfwhXvsVqwl7
	XdxLCUvtYlmf8VpPiW6mmnp4VZIBl61gmUhchaV8OT8M/H68ydKZ6v5vyI3H0Q9pxqegqu
	zP7AZIx9CUxYsEcpL1X8EBneiTfF3oc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-iq9lMjPPO3eqagFpnPQcTg-1; Mon, 10 Feb 2025 14:38:24 -0500
X-MC-Unique: iq9lMjPPO3eqagFpnPQcTg-1
X-Mimecast-MFC-AGG-ID: iq9lMjPPO3eqagFpnPQcTg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43626224274so28058565e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739216303; x=1739821103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mARFTZKeX08fN9+zJg7ejGdzGLsE2rU+aFhmUgxRNAg=;
        b=lDMpoFKcrIQdufljjAZGDLO29kKjXF+RTu6abuVMBmJeqpMRtSV/xlBJCptu7FguAW
         RR77jhoQpmrgzG+91BdOuGqiiWZnUC3UpMOAkahiBYxGebYw5ImxDLvw2feCYBQb956G
         qAQvOoQVmXmOhpGQucxvr8lEXQFTkyrzQ55BQHSF2aS2na4SwKYge3FvnEQZYjcANcuu
         7285w/5hp35tDdFtuKi8hxXzewek9uw7+tYmdQVvZIXlP/O3RLWpZ1XDxHMx9XqirETh
         Yx0I/BJ/hDDneGB3GFNfYm3mNeObqXRWifQ/twRQ8SIQ2p0SYGaKKgn1nw2C1nU7K1De
         bq0g==
X-Gm-Message-State: AOJu0Yy6ttJ3BoEI2HAFf5+PbVIJK7seUuSdVYn/Xg2pgLgMbjkgEYmG
	tEqk12XcPtE0UesuWEOmy803a+ptUPAU2J/sJuXRAT6Nng4iUrhUXTiU59yLBOPQggCVRlM6/jI
	nGZzy3ICddmW55P9kiS0hUxbbNApuLM8TNNdrGsg0r8Tt8ncMuqhFita1AqxzDAFKSLkUHrHfXH
	2UnE24X93semaHdyQfZEYGPw9lpLGX0U6VfaIqknaHBWte
X-Gm-Gg: ASbGncsePn9XfIWlKpapox1F9TLltMP/3yEIsxEdDcbOYl0jKdT6KwQmcVCUQRl3q9i
	U2WoiDVgoazhkuNw5I/1MRFxKPTTqkw1bnzhELNBA+QKk60PICu0T9FS4PgUYxOotqDOeu2KufX
	gVBORFhG83i3u06STJqGR4jKj3De1L4w2ewAS7YWtzesHssfUsI1g2vKhDzHFIECiHIyO1Q0MTE
	f5cV62+zsrytmsOO1bs1tDKul6Dx1BBtkSRteGMVLGIq9kZVh9FSLr5VIva5fABYJMTUos8kDLs
	Aq7g+FBf6L5YIm+Yc9g2yk/cJoPpjMYxW2q0MVpIy2oNCy9BPDNBn+e/6lTVtvBwKQ==
X-Received: by 2002:a05:6000:18a5:b0:38d:e33d:d0db with SMTP id ffacd0b85a97d-38de33dd2b2mr2312812f8f.14.1739216303604;
        Mon, 10 Feb 2025 11:38:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1Llhtf765OHh3Rdp8g77cDKhZyIe7rPLF3LamWfRFHXBXmPgwl/7uacqNHueSdZU9tH9+kA==
X-Received: by 2002:a05:6000:18a5:b0:38d:e33d:d0db with SMTP id ffacd0b85a97d-38de33dd2b2mr2312758f8f.14.1739216303053;
        Mon, 10 Feb 2025 11:38:23 -0800 (PST)
Received: from localhost (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dd3fc7ee5sm7734941f8f.39.2025.02.10.11.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:38:21 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	damon@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 05/17] mm/memory: detect writability in restore_exclusive_pte() through can_change_pte_writable()
Date: Mon, 10 Feb 2025 20:37:47 +0100
Message-ID: <20250210193801.781278-6-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's do it just like mprotect write-upgrade or during NUMA-hinting
faults on PROT_NONE PTEs: detect if the PTE can be writable by using
can_change_pte_writable().

Set the PTE only dirty if the folio is dirty: we might not
necessarily have a write access, and setting the PTE writable doesn't
require setting the PTE dirty.

From a CPU perspective, these entries are clean. So only set the PTE dirty
if the folios is dirty.

With this change in place, there is no need to have separate
readable and writable device-exclusive entry types, and we'll merge
them next separately.

Note that, during fork(), we first convert the device-exclusive entries
back to ordinary PTEs, and we only ever allow conversion of writable
PTEs to device-exclusive -- only mprotect can currently change them to
readable-device-exclusive. Consequently, we always expect
PageAnonExclusive(page)==true and can_change_pte_writable()==true,
unless we are dealing with soft-dirty tracking or uffd-wp. But reusing
can_change_pte_writable() for now is cleaner.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 539c0f7c6d545..ba33ba3b7ea17 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -723,18 +723,21 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 	struct folio *folio = page_folio(page);
 	pte_t orig_pte;
 	pte_t pte;
-	swp_entry_t entry;
 
 	orig_pte = ptep_get(ptep);
 	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
 	if (pte_swp_soft_dirty(orig_pte))
 		pte = pte_mksoft_dirty(pte);
 
-	entry = pte_to_swp_entry(orig_pte);
 	if (pte_swp_uffd_wp(orig_pte))
 		pte = pte_mkuffd_wp(pte);
-	else if (is_writable_device_exclusive_entry(entry))
-		pte = maybe_mkwrite(pte_mkdirty(pte), vma);
+
+	if ((vma->vm_flags & VM_WRITE) &&
+	    can_change_pte_writable(vma, address, pte)) {
+		if (folio_test_dirty(folio))
+			pte = pte_mkdirty(pte);
+		pte = pte_mkwrite(pte, vma);
+	}
 
 	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
 					   PageAnonExclusive(page)), folio);
-- 
2.48.1

