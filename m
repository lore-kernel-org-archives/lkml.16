Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D83A1CF5C0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827647; cv=none; b=RnOd5CGmgm9AusvGU5s0uMxxHKvgJFqkA9/ft2/4ESquWldZP6CNAKXbaq9vP9d8SySGsyF12R6FvUbTsKHhVQizD7rdEo2w6qeU4LH1BYjU9FK5yVCE4f8ag0jnTIAjYBsi4kqER8tpDoBfSyV5qGzV8uircLf1L7dC35JGeT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827647; c=relaxed/simple;
	bh=3TIz6OAQmYLhbLY1qSaIvmuTb2/43KiHb6ODmrOqixs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQ/1RL+P1A3WGO+nYxYhpbqohZCCWaXzriIJxwZktvXDVpSUqj6lYPNf4arHuk6NKutBc5ar54I635UQSYNc80hqf1jiGU7eh6WB6Kw2L6oB1axr+hQr/qt0MRRfoEq7i5QbsebkCEiatnmS+LM8+cuMkXig01ffjM5GJa/EBNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YbSUFx+b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YbSUFx+b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749827645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JF2rLNj2o6Yy22RrN3ArJe5rs1T3q2yW+wRZEQZZ/u4=;
	b=YbSUFx+bJX7R0jOexesukFoSOPzF+PEmxtNVb1TI5DoPmkdLM/Fr8Ys4Vmghy+adL6GMqC
	D4BQLSYA/Ju+m1LmIwjAIaSu4YgOC3xNAfqqR8OlyhhG0mZsSlCfysVgPiFM1COBumHUNl
	eoX7LRGWYXzFd2xplk9p9YzFYYFUNx4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-bR5Qk_PjMXuuDNjTAenPCg-1; Fri, 13 Jun 2025 11:14:04 -0400
X-MC-Unique: bR5Qk_PjMXuuDNjTAenPCg-1
X-Mimecast-MFC-AGG-ID: bR5Qk_PjMXuuDNjTAenPCg_1749827643
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faca0f2677so58806106d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827643; x=1750432443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF2rLNj2o6Yy22RrN3ArJe5rs1T3q2yW+wRZEQZZ/u4=;
        b=faUulHx0BYbFPgO4egVO3zoydHoPm0yOLYQzSbqaaM9Poo1DP0FJ3imMJp2bRjSUM0
         2b8zpJpYUcFqOE5aCyb0cATy5/fbGECQSQCm8Ba23sd6MIDiGGJE9he9+fSiBlMIBxve
         bEEjq3MT7wAqm6gZKa9Is6T4HbVgnsVqam0Ydrv1RdcmjuPY9NON6wBVtWwxKqxlv76T
         pETxEEwhv2xb3x/+JzCTBAz93FeFaxo5RaPqGDLcXnenGY92iURnPuLwKrO0olWJwGEq
         /bzv/u7arMzKusufoYDgOMeraa1CCi6FxhSkYcDsGvBw6ZDd4DG2Llzy01oZsZRQ+Kya
         i6gA==
X-Gm-Message-State: AOJu0YzWFCac5XEv7lYfj9HJkeHLqurl8W63ipazVZ1T7+PHnEs4D3Jg
	fok94nk6jELLoU3XkbI/PgoKNMm78huC1hDoGEFMkm/OBiAOSsFU/2VZprLiAWLzcTYTroVVn8j
	ylyBsMa9D8Luwph+74V/UACp45gu/ha1pDeD9tynPMPMisEQizAF6NnhH3Hb33+v/Ww==
X-Gm-Gg: ASbGncu9FqWvH28CYGzzpe5XCyHyhJWrTOHaJF2l+z67eTacEb3ZMAe9yxfOI/6oTVa
	LdfQhXKHY4sqVrtRkdtKcipa3b24wUJp31VamYZ9rbc1QedRi3FWh0U5P73YejQB+ODEKJ75VEQ
	82YHujOzMCirtd3o25+mtzVOcsQ23ryWWfqq+rXKAZ2YayZgxDFKNv26GliiOpQNWY+tANQw8CS
	aOGa3/8jMf9yHyhrF5aSOIB8z5+S+McMI5V8p5XW9VB57oiVREumyqsQklNN81u812/0kyAErMj
	zV8pzcr9wBPKIA==
X-Received: by 2002:a05:6214:d64:b0:6fa:c3e4:4251 with SMTP id 6a1803df08f44-6fb3e5719d7mr46483266d6.15.1749827643453;
        Fri, 13 Jun 2025 08:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdBjMSk7YKIV0op3TtzIelmTfKNwur0ZcJs+2tL3OQHDzunva6bG3CM8eywBoKAmCfxSjVWA==
X-Received: by 2002:a05:6214:d64:b0:6fa:c3e4:4251 with SMTP id 6a1803df08f44-6fb3e5719d7mr46482696d6.15.1749827642973;
        Fri, 13 Jun 2025 08:14:02 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c31657sm22516816d6.64.2025.06.13.08.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:14:02 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:13:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>
Subject: Re: [PATCH 3/5] mm: Rename __thp_get_unmapped_area to
 mm_get_unmapped_area_aligned
Message-ID: <aExANjUUpmkpo3p4@x1.local>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-4-peterx@redhat.com>
 <20250613141745.GJ1174925@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613141745.GJ1174925@nvidia.com>

On Fri, Jun 13, 2025 at 11:17:45AM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 13, 2025 at 09:41:09AM -0400, Peter Xu wrote:
> > @@ -1088,7 +1088,7 @@ static inline bool is_transparent_hugepage(const struct folio *folio)
> >  		folio_test_large_rmappable(folio);
> >  }
> >  
> > -static unsigned long __thp_get_unmapped_area(struct file *filp,
> > +unsigned long mm_get_unmapped_area_aligned(struct file *filp,
> >  		unsigned long addr, unsigned long len,
> >  		loff_t off, unsigned long flags, unsigned long size,
> >  		vm_flags_t vm_flags)
> 
> Please add a kdoc for this since it is going to be exported..

Will do.  And thanks for the super fast feedbacks. :)

> 
> I didn't intuitively guess how it works or why there are two
> length/size arguments. It seems to have an exciting return code as
> well.
> 
> I suppose size is the alignment target? Maybe rename the parameter too?

Yes, when the kdoc is there it'll be more obvious.  So far "size" is ok to
me, but if you have better suggestion please shoot - whatever I came up
with so far seems to be too long, and maybe not necessary when kdoc will be
available too.

> 
> For the purposes of VFIO do we need to be careful about math overflow here:
> 
> 	loff_t off_end = off + len;
> 	loff_t off_align = round_up(off, size);
> 
> ?

IIUC the 1st one was covered by the latter check here:

        (off + len_pad) < off

Indeed I didn't see what makes sure the 2nd won't overflow.

How about I add it within this patch?  A whole fixup could look like this:

From 4d71d1fc905da23786e1252774e42a1051253176 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Fri, 13 Jun 2025 10:55:35 -0400
Subject: [PATCH] fixup! mm: Rename __thp_get_unmapped_area to
 mm_get_unmapped_area_aligned

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/huge_memory.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 52f13a70562f..5cbe45405623 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1088,6 +1088,24 @@ static inline bool is_transparent_hugepage(const struct folio *folio)
 		folio_test_large_rmappable(folio);
 }
 
+/**
+ * mm_get_unmapped_area_aligned - Allocate an aligned virtual address
+ * @filp: file target of the mmap() request
+ * @addr: hint address from mmap() request
+ * @len: len of the mmap() request
+ * @off: file offset of the mmap() request
+ * @flags: flags of the mmap() request
+ * @size: the size of alignment the caller requests
+ * @vm_flags: the vm_flags passed from get_unmapped_area() caller
+ *
+ * This function should normally be used by a driver's specific
+ * get_unmapped_area() handler to provide a properly aligned virtual
+ * address for a specific mmap() request.  The caller should pass in most
+ * of the parameters from the get_unmapped_area() request, but properly
+ * specify @size as the alignment needed.
+ *
+ * Return: non-zero if a valid virtual address is found, zero if fails
+ */
 unsigned long mm_get_unmapped_area_aligned(struct file *filp,
 		unsigned long addr, unsigned long len,
 		loff_t off, unsigned long flags, unsigned long size,
@@ -1104,7 +1122,7 @@ unsigned long mm_get_unmapped_area_aligned(struct file *filp,
 		return 0;
 
 	len_pad = len + size;
-	if (len_pad < len || (off + len_pad) < off)
+	if (len_pad < len || (off + len_pad) < off || off_align < off)
 		return 0;
 
 	ret = mm_get_unmapped_area_vmflags(current->mm, filp, addr, len_pad,
-- 
2.49.0


-- 
Peter Xu

