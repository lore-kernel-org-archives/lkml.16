Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44A82F4309
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175048; cv=none; b=IR6lp6+E03/IBsc5rgxPFCXTZh8RbJzMEEjQW0TL1smngr53KLIqgk3Tsl4eH2If1zkDMiqROPjQ7k+Tyw6mPn9wlB3/RbjvTqdT8pgputOLiAGZUNNth94M4lxSMPjMfj0VH+6DiZhKE1JC87QPqKl/jX7yoWisTzkPMVd+d4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175048; c=relaxed/simple;
	bh=AaLRVPcfUejWvJOHKekM/3Bd9o1DBMGCz5AGg2IT7Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3NluLQONVYN7mDK/oXBdPQnvhBK31Q328n8f15lPcedboVZgJEFyGrMCHnLHFacPlg4VGbwl77vIhuXVQqDg9ZSGEqIrDQ1B2HQgCPv5Y8IoZVA937MxiqDZXPz6xMHaHiudbpeLlXHdK5o4AnwHhAi1Z3Ix/W8EAHm0UGcMhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ghhlphs1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ghhlphs1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750175046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZKss+ViQ3XsGRfMnfUZIAkjKJYTTy4h8nMBjUoSR6g=;
	b=ghhlphs1tkT2NyItL67FD25ANVqM5Fw3POoV8UI83m1DgqE1z5gZLQvozrgQJ3UyEXnXUp
	630d5zW2Crtt76tXEtmfcLT7JCuTffnZX1cBaTCbmaW4YGiKJs3agj6z7U3/nwRKLd4Uyu
	/vLtKqjXIZ7u3m9A8odZHomp7Ar1zGU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-SVEpRpw5Nbeppqa2RRkpjg-1; Tue, 17 Jun 2025 11:44:03 -0400
X-MC-Unique: SVEpRpw5Nbeppqa2RRkpjg-1
X-Mimecast-MFC-AGG-ID: SVEpRpw5Nbeppqa2RRkpjg_1750175042
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eed325461so37322285e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175042; x=1750779842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IZKss+ViQ3XsGRfMnfUZIAkjKJYTTy4h8nMBjUoSR6g=;
        b=p8dj3py2/G70K6BwCdF1uMWssPe+WKSCKcHxEGaq+tPOQ9/QdEi98f56tqaLSL2oFh
         AC1ni8o4+U8Wu/3Yu4ue64AmFf8uHdOuEfyF9zr/0mO4CKhzgFdSdorgPgJZh8LGp5H9
         UtsfEnr3JgRdJ9zM24pPmHglK7rc9JXk+oPnkUmCnLQXCqn6YA1b7fKrMSARuGKzUwbo
         McUqAX74I9RhgO7kNpD3lhPlvaMrXgcpqP2E4iaD3EQINGf9xwkOHrrBN21cBG2sBFxK
         CfekBYghF3D+L/aj4aTxkvQYlYxxZVPrS8bJC/9k0rm4SGqFhkzXRlJiWf6ZTBnoBkFn
         6e9w==
X-Gm-Message-State: AOJu0YxvAqpBlPibhqKE+i1wT3DZsxazVEoTeuYnmpuZ7Yv76GdWUBYN
	fb5va+YmebdKGFZGWrGHUmtvGCGQGo80Jv5rWGLFGkyBN0ZdO0Ojj0UVpvUoDXs53XhEYPgO2t3
	Lg0cFrwoi4OV4qgs9bobdt307ZSyWYfXt2A50YDEDe5e901rU2JbmfiEcHBlgOOsvIV3DZmAVj5
	kWbvaaExSuBWh0dPS0cGSZUcaw9bnmC7bQeXM6m3+NNu4D/wjH
X-Gm-Gg: ASbGncsbaK600qdKkPMdnPNw7634WZkaKfQlkQ4ZsntINlYNWLfhm7ktj+N/daa2UZt
	f7q5ZZyxTxiAAi9ZhudUq3Fki8jyJwbg596zRAJ6KoyWGRtePOUCuJQrpxeyoisTVF9xrYOAcR4
	NYb7lY3CRJ858M22HugYK4JUX+Jp/sn/fZIf+llXUQrQi+mhHQCO/BgDiHTxWYXpCY4XcK2cSgZ
	gR0UNZ3AvewDzKBoSJKuGVircDJDmZa06SeFFpwAG0seiYp5PKuni0MtiA/pw1ov42lUkFYeZwI
	+KmpUyt9Geo2urSVA6Osm+MCcuQoe3n1C3LorbVMiDPPYs6pYY94b5kG9KJSssRFQBpup0klYZW
	fGZX8Zg==
X-Received: by 2002:a05:6000:40ca:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3a572e9e7bfmr10544499f8f.56.1750175042219;
        Tue, 17 Jun 2025 08:44:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEizYNw7dc5qMU4ZYxHKAQ+J5Vp2J4wukFj23PAnuBxSQs+o+0P3zEnBC8W1ti7paRppqlPmw==
X-Received: by 2002:a05:6000:40ca:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3a572e9e7bfmr10544452f8f.56.1750175041775;
        Tue, 17 Jun 2025 08:44:01 -0700 (PDT)
Received: from localhost (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e25ec9fsm175719105e9.34.2025.06.17.08.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 08:44:01 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	nvdimm@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alistair Popple <apopple@nvidia.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: [PATCH RFC 06/14] mm/huge_memory: support huge zero folio in vmf_insert_folio_pmd()
Date: Tue, 17 Jun 2025 17:43:37 +0200
Message-ID: <20250617154345.2494405-7-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617154345.2494405-1-david@redhat.com>
References: <20250617154345.2494405-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like we do for vmf_insert_page_mkwrite() -> ... ->
insert_page_into_pte_locked(), support the huge zero folio.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1ea23900b5adb..92400f3baa9ff 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1418,9 +1418,11 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (fop.is_folio) {
 		entry = folio_mk_pmd(fop.folio, vma->vm_page_prot);
 
-		folio_get(fop.folio);
-		folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
-		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
+		if (!is_huge_zero_folio(fop.folio)) {
+			folio_get(fop.folio);
+			folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
+			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
+		}
 	} else {
 		entry = pmd_mkhuge(pfn_pmd(fop.pfn, prot));
 		entry = pmd_mkspecial(entry);
-- 
2.49.0

