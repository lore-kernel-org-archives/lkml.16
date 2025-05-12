Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61E2951BB
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053290; cv=none; b=YlxY/qs1LnGssJcBH2iit+T2hWf3JrYzzQ3sZQt3ffNM4VXmu9UImgU9wAD4CY3XPw8iMq/V6HEA8tyiKpcJCt4nCayO6U2CKBcTH166e45WCTPaVX0yF/2XVK3e0W5t0sKEZM16Dox7mLh+yb5DETV46RYmWMbw+mLODX5P4q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053290; c=relaxed/simple;
	bh=plUyq9xd8ySzP2AAXo2oJ8d2YD2N8nsTkRb0LYdC5Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAYl/kb1pjBGp+yeCusTUeyob3hTwNIeReQJFhVlj/OKDRP92woO6w6OJteOYIwi7vWY7JqpIasm8OvAWrfF0xT4VX2FpyrQwT1B/xUlUCew3HdXBdmhXGNEa97NZcwNRaky58wiwRdHwqWJwG7XRpSGGRHHMGmEomwxVuNNesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a9fPBcb0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a9fPBcb0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747053287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=damHjxLzdKBqIDkI5LPVSGeFU6dth6KBhucvp/6hc2Y=;
	b=a9fPBcb0IvUn9oNcxLPb1a6/ncFV0eCorxjukqhG8dd+roY+0HbwHh8dLbrzcWa8O9r2GN
	fYJjk7Ih5cp1s0S9rsTO+D/QnGCZiIxHhsdZVSyr1VW/4XMvKpZaj2jb6xdK3xocPDWY+l
	e3tVrNpLcO/KDETnyiOPH6+eDdVMuLg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-6ISKYOnSMjSylFQ5u9saQw-1; Mon, 12 May 2025 08:34:46 -0400
X-MC-Unique: 6ISKYOnSMjSylFQ5u9saQw-1
X-Mimecast-MFC-AGG-ID: 6ISKYOnSMjSylFQ5u9saQw_1747053285
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a2046b5e75so363975f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053285; x=1747658085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=damHjxLzdKBqIDkI5LPVSGeFU6dth6KBhucvp/6hc2Y=;
        b=N1U6jo8cukQQrqD100sUysMB20NOD8zFfOSkruNeaIsQEpbUBii7XN2eerPMyF81oH
         dacV74iaY5554W6r5dE7+UapAYpPJguQRxy7Qx9W4lyqJ0rYTm2y1sGywGYDLEFcHULy
         yzaSOf+9JeixEZ8h5TZqrfeF+v0OZ/E1n1CZllm+piwIyGnFa7n+XzQwjoKTPtWmfy/j
         3lzMywTCEQ5A4MKF+z9za8qdBZZY3veRCHQmesonf/CvGbbrej6MhhFM5RYC1UTTlk6+
         Im0i3g6x0NZnKGzTbiJXnbecI4p/82Y7PoZEua8l13KRTulViEp96UO+A5cSxRVafJ9q
         s6jQ==
X-Gm-Message-State: AOJu0YwEK0RA2hK+lms7/VqLW8a9s/SpR6mxHmNx0VsIzVm3pR5Hlf7M
	CDh9fhtWhVDa/zMa+QnCsONH+1U3+r0Rj8zfIwUoeh5nvnyOQMDlqenF3OeVbLbsVjlDLuoUD7B
	5wAHvZ8YonFzEEfYsntDiodHb/c4LEmI2SB6tn3goPTmnmIKq37zOEqnkNQSvkdybFgR1kUQkc1
	/JnoxwfaYEQZVeO6GfNTKSDp8lLXfBVvvAPVPJDIT0GYaE
X-Gm-Gg: ASbGncufx8AvX7mim8JkFO2jQSF0rl7wwz7CJZGG0fM5RLEekFAYIus0sl+GGA2by1b
	myoKr9akvw/BAE3W5FRg04OE2uMHUrE17mtFwaZAnOZpSWV1hp6B8xVV8o/dUlZ4/tGhteYqdpT
	keV8+hY4uCHIDT1UVT4j+763lDzCVc2iJEWwTLlPfnYGq/JKeIo7Lv/JUHRtSOYUg3IVEPcTAB8
	SgrZhiib+rKQDrE3WDL3NIptkBMkSGnz7kE2Nwy0FhxDCHuh9fvXr7fgguLB7gicKkSA3LlRV3y
	nLjhiO9WKgMRI+YDHL+L6aBx2cZdvUmzORzk2U6T+jblPBQqmD2ZjqxfdN2OHvIqUWRxx0vB
X-Received: by 2002:a05:6000:2011:b0:3a0:b455:a1fd with SMTP id ffacd0b85a97d-3a1f643d7f2mr9690561f8f.32.1747053285234;
        Mon, 12 May 2025 05:34:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmU3EtVrQ/jxHU8AUaqqw41jpYBGCmzwmgCEh+gCBZD+u2TEH9U2eBlpYNMTeAuFBo11Jgg==
X-Received: by 2002:a05:6000:2011:b0:3a0:b455:a1fd with SMTP id ffacd0b85a97d-3a1f643d7f2mr9690506f8f.32.1747053284744;
        Mon, 12 May 2025 05:34:44 -0700 (PDT)
Received: from localhost (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd32f238sm164887305e9.11.2025.05.12.05.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:34:44 -0700 (PDT)
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
Subject: [PATCH v2 07/11] x86/mm/pat: remove strict_prot parameter from reserve_pfn_range()
Date: Mon, 12 May 2025 14:34:20 +0200
Message-ID: <20250512123424.637989-8-david@redhat.com>
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

Always set to 0, so let's remove it.

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index c88d1cbdc1de1..ccc55c00b4c8b 100644
--- a/arch/x86/mm/pat/memtype.c
+++ b/arch/x86/mm/pat/memtype.c
@@ -858,8 +858,7 @@ int memtype_kernel_map_sync(u64 base, unsigned long size,
  * Reserved non RAM regions only and after successful memtype_reserve,
  * this func also keeps identity mapping (if any) in sync with this new prot.
  */
-static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
-				int strict_prot)
+static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot)
 {
 	int is_ram = 0;
 	int ret;
@@ -895,8 +894,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
 		return ret;
 
 	if (pcm != want_pcm) {
-		if (strict_prot ||
-		    !is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
+		if (!is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
 			memtype_free(paddr, paddr + size);
 			pr_err("x86/PAT: %s:%d map pfn expected mapping type %s for [mem %#010Lx-%#010Lx], got %s\n",
 			       current->comm, current->pid,
@@ -906,10 +904,6 @@ static int reserve_pfn_range(u64 paddr, unsigned long size, pgprot_t *vma_prot,
 			       cattr_name(pcm));
 			return -EINVAL;
 		}
-		/*
-		 * We allow returning different type than the one requested in
-		 * non strict case.
-		 */
 		pgprot_set_cachemode(vma_prot, pcm);
 	}
 
@@ -959,7 +953,7 @@ int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
 {
 	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
 
-	return reserve_pfn_range(paddr, size, prot, 0);
+	return reserve_pfn_range(paddr, size, prot);
 }
 
 void pfnmap_untrack(unsigned long pfn, unsigned long size)
-- 
2.49.0

