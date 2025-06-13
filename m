Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E547819C558
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822087; cv=none; b=uE3V6q+4l0LClHUQLT6b1x925LwZN+LSY5uzhdMGxwpCdZuNdVCa3ysK5Htw54y1XymTJw81OW8cE81+B+LM7JLTVVach0UAsec37H4yPz5P2DIR3BgN2tTcL/7w0anlxTh4YY/HTvzs0HwkIA8trwOK7vOZ6PYT3ady7i632UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822087; c=relaxed/simple;
	bh=gTS/EUIP8VCBOB3dazG/2BtugSlfm9QH354rN6o3IrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6egHUScEtO/LqBtqTnsYX5fUDb2oqogjaqL4/8LMiQ0/eJ/d1zakyDslLh8P99k6+WOB5JmSIxtYr4ZB61ncO5lK1o5YdHi8vlrEO/fIUdFBr1Nakty9Sg7mzhbCkoxgoWkkKvLRizsDe0DfL9voQE0b5jLYNHTmtt6NTqh15M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fKPAeiDH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fKPAeiDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749822084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z7W5IE9G9/u3/1BfK2SYpnNa28U9EpjOusASuWz1vAk=;
	b=fKPAeiDHVTjBPT8xl0lpCcQp1oU46UnHsQYLFppnvM7elKT83o3bavMS4jGmxNb5jtO/Ph
	+aJxz2b6SBaMuU5Y2L+2VRkenVVqGodRUihxo2aUhJlPTtu9aY5x0Rm6DumcPk5Mgv/2jh
	uN+v4AxqXGCrfKCP8U7meLkRfnPLgsk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-B_jeZO5gNUSjzW_XQoZyQA-1; Fri, 13 Jun 2025 09:41:18 -0400
X-MC-Unique: B_jeZO5gNUSjzW_XQoZyQA-1
X-Mimecast-MFC-AGG-ID: B_jeZO5gNUSjzW_XQoZyQA_1749822078
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e6f5so534686585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822077; x=1750426877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7W5IE9G9/u3/1BfK2SYpnNa28U9EpjOusASuWz1vAk=;
        b=qf25tW34iq8KbFZJ/y+tT4RpTjwwWm69ACqI/xadiVY1cZ8X7bu6b7RauTRu1sV1un
         2GPKnO09WsOFREntsXS9hwB96cxENN9RE01h9A0SC+euzCyNRn/sdeuuLQNBushstU8T
         u8+asU1KpuB+n7uOMrc/ppSRHEUHPgCokm1zkgyqYtSRHda+1WnjkUdNc988rwTyBxHj
         Il7iqXKPkYQ5dX6vyBja8pf/8RfJ1E4jnNW67NzJ2WhnORLTbaA9R8FZgNaqtgxBNcQv
         IAkhLA1ERUq/xewM5Iany7H7bsz+pBLWtb7Y9Vjbqzzamc6jBgnh8BpvysgVwkdbuTft
         qbEg==
X-Gm-Message-State: AOJu0Yw9Zc3vtXnxeMriVIUBYagK+ek5RLlrU+CnyshiMOGQotqTX8NV
	FnEhqW6QahIx8HKPUakA/Lkgij/gqB0BXMWaXJcH/4M0mnw2h9/i5QznbcZ3VE0CpupM6521PoA
	lH9drjxZI1RDT0SfeXJ8XqTgr0PKQ2+ho9bney5e8NB+2tcHvMbz/njWEXch5X0P72XQXvvl77J
	WXy9CkjeL+47SMpI6e7NJhMN9Z12vkNwh1tUI8YnSCmPdpR0o=
X-Gm-Gg: ASbGncu1Cme7mCD8M2X74Ibuny3w3QPMV3K0cuLW0ZVvjF70Di1CRYqhNrTgmqoc4sS
	ctaSK1JNgPCdwifv9Iv7cv0Auqsixt7C5KgpN2+muS4wh4eBQVUXART4cqkU2DOroZ4wnriw3WL
	HdTPSPXShWa3FZq08y9eQTFSTcLTSAShWsHjxNMO9YDnLtGXSgw6fxyRfCTygXD9eXAEwXgiHSg
	CqFL3RxoFfAGJr+XY4XM7z6/jzRm5Qiqx42HevQZgKaCYDcsvSReJcelvMeYLrUahN3htXJyjVD
	Dhp1Fq9SvT0=
X-Received: by 2002:a05:620a:3728:b0:7d3:914b:abe8 with SMTP id af79cd13be357-7d3bc4475a7mr706293885a.36.1749822077573;
        Fri, 13 Jun 2025 06:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLW9momYNJwfmPgxDbKad4mtJlNzLyJURmiqrfzObWILrSALY5rlf3s+E58Q/NYKr9xf6MiQ==
X-Received: by 2002:a05:620a:3728:b0:7d3:914b:abe8 with SMTP id af79cd13be357-7d3bc4475a7mr706288985a.36.1749822077027;
        Fri, 13 Jun 2025 06:41:17 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ee3f72sm171519285a.94.2025.06.13.06.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:41:15 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>,
	peterx@redhat.com
Subject: [PATCH 1/5] mm: Deduplicate mm_get_unmapped_area()
Date: Fri, 13 Jun 2025 09:41:07 -0400
Message-ID: <20250613134111.469884-2-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613134111.469884-1-peterx@redhat.com>
References: <20250613134111.469884-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Essentially it sets vm_flags==0 for mm_get_unmapped_area_vmflags().  Use
the helper instead to dedup the lines.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/mmap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/mmap.c b/mm/mmap.c
index 09c563c95112..422f5b9d9660 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -871,9 +871,8 @@ mm_get_unmapped_area(struct mm_struct *mm, struct file *file,
 		     unsigned long addr, unsigned long len,
 		     unsigned long pgoff, unsigned long flags)
 {
-	if (test_bit(MMF_TOPDOWN, &mm->flags))
-		return arch_get_unmapped_area_topdown(file, addr, len, pgoff, flags, 0);
-	return arch_get_unmapped_area(file, addr, len, pgoff, flags, 0);
+	return mm_get_unmapped_area_vmflags(mm, file, addr, len,
+					    pgoff, flags, 0);
 }
 EXPORT_SYMBOL(mm_get_unmapped_area);
 
-- 
2.49.0

