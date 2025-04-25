Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461802367AF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569061; cv=none; b=nHQ2U+I6JVZ/+6qvsrB6oAOJjKdFr0CdGTo++pAGEwh6XCf5YYbs0WMAgmNElhvkZL9PgOgLWvJPFW21o3hksK5QrcP3tjbjpr1hjJZYDztIaYvXMSi/bGh3KWc6H8y6UWI0HNvVaEJvqB/PdiYrFiq50hckK7D+Vf5nJ7efOEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569061; c=relaxed/simple;
	bh=sC9yz9dD/oKAzPcvHGkMQY89EvvA7vBfDCo6bq+VwYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbGGGJ9RFsISE7Z86V13sX1BcA5QMG8gXtsNg8DFIeGY6bac01bP+D3i9rTrCTnkcAi9h43L69JN/yep2Ng1m38YcYT4UJuLhXEZMjFv/0cb3XStwq2IIwHAipkTtPSIiCyif8zsx2c1hyzWS8YJ5vz8mQj4v2ePXog546i5xls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MXcHyEts; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MXcHyEts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745569059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXejfGAknVxklqhHCW/V9liutcQQAQcJcrhEqzVyY78=;
	b=MXcHyEtsPO8VF+fiiOyAp4X2Tb67TxXReE5wJutwVvBwNUCIU0pZr/Yg4WqhftuEpohiND
	rQs+DFHKKWC0aU/z4TXusQvvs3Yi92hKH26VIfwsgw8botk2V6EWd8HIkSsCRfjPmlMp2q
	qyPOKMJD0n1wfcm1faRGmzQ5lKmmCq0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-FH9GsveDP7mfiO4TzWIr5w-1; Fri, 25 Apr 2025 04:17:37 -0400
X-MC-Unique: FH9GsveDP7mfiO4TzWIr5w-1
X-Mimecast-MFC-AGG-ID: FH9GsveDP7mfiO4TzWIr5w_1745569057
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c30f26e31so1170394f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569056; x=1746173856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXejfGAknVxklqhHCW/V9liutcQQAQcJcrhEqzVyY78=;
        b=uz2Zpcgh6KpmQ7pMZPsqEKNMQ30inYHZmSm6rcRpvYCzZoDmxnr05KWflP5tL6HRo4
         uVAuuxRavaDpS37U4CVTOAsliqbpWffTmOZPlQU9WExEAsniWp75u5s/tnLxwH0pd8N+
         WZGUx97K9GYT9LC1OkCEHzzC4CiWxOyGDqdU+KqXQ8GAUu7Is4e0PILpxt4ejEpBx+0x
         l6U6jrcxIT/5RhD81AWFBkHlBlhJwVNdglecbbsccKUhmyyE/m6iL5Oz69NgupH1UIKh
         DKN7s5a0hOVHiatHIz1Q1R1Dfc+0ue1lPSn9tjRvIXPsJtA2AXkuKdiNLzHUGOfm387c
         6KTw==
X-Gm-Message-State: AOJu0YytVykxdCXPdijbGxvMY+jk4GiwiXuiCZd0Y8rUIAUy/qgThhcm
	ygtVpOJ/CZASCXTzYU06mc1bW6UtZbLmLqxweUUzhhi8/nbDWo9DtoZjgCDUZoy/GjJ3qyiw347
	iVk3TICDQWoI7H3FyfjSsv6rre1sU/+dFsn+Od++TnShrgxtbU0pHAB5U8y3mFbKzgX0UPE0CV2
	b9uCaFAeCEyCtJ1LCRzZibzAsGjLubdyo48E1pY3xyxQ==
X-Gm-Gg: ASbGncsEZyGyVo21hC1q3YIqMDdmyWAB9hqjr/SYKkL/uUvv4Vwn20nE4LTfzscJTwi
	itmfJVI22WxyAxOArjVy8Up4BiGNAFlINo3tPJcJYnzRD0Z+mUzTLU5F35r58YMf0Mn84SBt00N
	ddCudJbYaQ9cz7/STtTc55bfgcoR5ZFcG+JegUIQCFQdEDNlb/1C0M8HQOqBcjCZaXx4uQONp5n
	r9OlWXU9NdMBi7gUekkdtSPq8UKgfsSLYpLSDDEGEnETtZ9LTaHiihK6x+Cs7TIMECVRNoB5wS8
	XIa2TAmCR5qiup61EJnEOBbFEBf8Oa0Ut5XDXQaWXpPpQ2/ALfggTRheFncMDa5UMel5lU0=
X-Received: by 2002:a05:6000:4028:b0:391:2c0c:1247 with SMTP id ffacd0b85a97d-3a074e0e4d1mr832166f8f.1.1745569056554;
        Fri, 25 Apr 2025 01:17:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU1X+NuNfEcvtfeCEnq/l8/EdxH0+aUnwVbo8Kq4KyW0RucKtS6876psW/EjwOajf1KdVRgA==
X-Received: by 2002:a05:6000:4028:b0:391:2c0c:1247 with SMTP id ffacd0b85a97d-3a074e0e4d1mr832108f8f.1.1745569056044;
        Fri, 25 Apr 2025 01:17:36 -0700 (PDT)
Received: from localhost (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073ca52e5sm1657353f8f.36.2025.04.25.01.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:17:35 -0700 (PDT)
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
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 08/11] x86/mm/pat: remove strict_prot parameter from reserve_pfn_range()
Date: Fri, 25 Apr 2025 10:17:12 +0200
Message-ID: <20250425081715.1341199-9-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Always set to 0, so let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/mm/pat/memtype.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
index 668ebf0065157..57e3ced4c28cb 100644
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

