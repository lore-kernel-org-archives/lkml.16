Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABF682C60
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750812536; cv=none; b=Y4N2e97qbgj8ZE8NVMHRiZ5PkRsfsa2E6yAKc1CG69hUw6tYROC1sPXx3TxPxDPuGS9YALP4o1rasygsMVpcNGa9cj467sz0bwuC1iCX6Q4hzBHrJ/dBrmo5pyxz8nw3YYF2WRHgsoyCekLVPBfc1w1efwPw0OP2EV89ER0ySLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750812536; c=relaxed/simple;
	bh=qHROMc/v6a+LI/DloySRTjvHCMTsscdoiEN0J8MNYrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZ7SWEZE0n2fIVVVMjo0q3qSDZxwUbtb0Iot1yzQ6p5nDEjdzuigCRN2oOCEBBVZsKcXAmhZLLQQvthEt3YkUB+DpC9CE3M9c7Vti8mOO7FxzuV7Ha9DPWz9IYaXTrwkK28/ALMzLEEWVtKhZr8VziURciV7ll7aXKeUZP08Jlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gztvc6ot; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gztvc6ot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750812533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bJc/tRw3aj6KzpT4rJTNsgKmKIFeKpkxIH932eVSgok=;
	b=gztvc6otPhar0Az6aW3s6FXkzYxpoPnveMydd5j6twVdT3CeOZnITqABLvwdb1HIDYMaUZ
	DYs5XiT+JjMhdaidaGCCpwMBEDzFfQrNX1clc8SCnTPwf6ccUVUqV97RdK5FXdvKM5mOdE
	K2C9WRTAN4GAjeCuXDWdqVUxbHVsdoU=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-wtvcLaW0MiOI8JtstSqAgA-1; Tue, 24 Jun 2025 20:48:51 -0400
X-MC-Unique: wtvcLaW0MiOI8JtstSqAgA-1
X-Mimecast-MFC-AGG-ID: wtvcLaW0MiOI8JtstSqAgA_1750812531
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74913385dd8so6023737b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 17:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750812530; x=1751417330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJc/tRw3aj6KzpT4rJTNsgKmKIFeKpkxIH932eVSgok=;
        b=PpfNCWudodUqJxl4I0NE17GujB4qkctb+XDbdeGFfRq1Z33yVNlz8tE3U+mpl6luYy
         FMPj21FPiK/Dgtg4/nhp3/Eua2I4PT2nQSO57xTxaeoP22y1kNscmnDLA9zNi45LtuuJ
         XCbvKmTYTng+VrrETClMcR5ummdKKvKGSPd98D3Kt/M1Wpn1dglVrkb0YNiwEbbEHGZK
         6NMK9t64aYHVVU5cLj7A9ocNzlXdSbKVwkCj5oILNkZHEk+OHZcmzgCDv3YgnGOPcBaL
         YrfPIVrjl4JGXJ+3aoYu3RrTXKO5CV2HcPrYuBLtTN23mbSfbukVahTMalDIn7Pc7x7A
         CU3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVAKFV6G0UKcQghrUyd1umJvE1Im9IAF4LEUM+G6caOUQLymMRXT9IfePrJ0ayuCofRqtKDW70U32Gx+cA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+8EWpziSKxbizWRWd8Y1r8BGRRu38jTTxeMs0DxczBQlEqZn
	AOK35Kre66rNKwxvhbLpstcTlkcIEr9cwNt+ila27z+J+IbdbNrrvFvDEmGfJGaffKcVeY11cKG
	TQWruRW+3zOEBHQqhalROcXzMEkGbnEuBn6KOGCiHkBO40ELFy1IeY8YTU47uk3+q6w==
X-Gm-Gg: ASbGnctevj8VliLdZSuCJO50G8COcvpe3DGOkQegPpttAZZ2Tv0krezjAoi6JUo/QAK
	GP9S/JnVPRXZWVcwHCLDH7ioxse8+11bOKrhWA73bD8wMxrbw4J/XSj1Hn363GnqT3stJ+411Ji
	fZlK3VSZiM4c9Q54U25cS1OLnNIEGgn9fS2G/qA5/cQP+TgndRoqgOuy3YLe/ZJax8N3ScjtZ6/
	Gv83qLro8rNbb9DYZ13SMDhXgQ3yC+YL6X8t/lFeu6etMLbxBZnx2EQ9qZqmNWW/7D3ttUKWZ0b
	Ma/0HgbqntO6RQ==
X-Received: by 2002:a05:6a00:2d89:b0:748:de24:1ade with SMTP id d2e1a72fcca58-74ad44ada69mr1719167b3a.7.1750812530601;
        Tue, 24 Jun 2025 17:48:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd4CqtbF7gS396Rpz/I4tWCNn10tCGvF/5/VrOAGVnYRP8qbZq5Ll9WitZXtz8k9UIjGbUCg==
X-Received: by 2002:a05:6a00:2d89:b0:748:de24:1ade with SMTP id d2e1a72fcca58-74ad44ada69mr1719133b3a.7.1750812530171;
        Tue, 24 Jun 2025 17:48:50 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c882ced4sm2980577b3a.85.2025.06.24.17.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 17:48:49 -0700 (PDT)
Date: Tue, 24 Jun 2025 20:48:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>
Subject: Re: [PATCH 5/5] vfio-pci: Best-effort huge pfnmaps with !MAP_FIXED
 mappings
Message-ID: <aFtHbXFO1ZpAsnV8@x1.local>
References: <20250617231807.GD1575786@nvidia.com>
 <aFH76GjnWfeHI5fA@x1.local>
 <aFLvodROFN9QwvPp@x1.local>
 <20250618174641.GB1629589@nvidia.com>
 <aFMQZru7l2aKVsZm@x1.local>
 <20250619135852.GC1643312@nvidia.com>
 <aFQkxg08fs7jwXnJ@x1.local>
 <20250619184041.GA10191@nvidia.com>
 <aFsMhnejq4fq6L8N@x1.local>
 <20250624234032.GC167785@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624234032.GC167785@nvidia.com>

On Tue, Jun 24, 2025 at 08:40:32PM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 24, 2025 at 04:37:26PM -0400, Peter Xu wrote:
> > On Thu, Jun 19, 2025 at 03:40:41PM -0300, Jason Gunthorpe wrote:
> > > Even with this new version you have to decide to return PUD_SIZE or
> > > bar_size in pci and your same reasoning that PUD_SIZE make sense
> > > applies (though I would probably return bar_size and just let the core
> > > code cap it to PUD_SIZE)
> > 
> > Yes.
> > 
> > Today I went back to look at this, I was trying to introduce this for
> > file_operations:
> > 
> > 	int (*get_mapping_order)(struct file *, unsigned long, size_t);
> > 
> > It looks almost good, except that it so far has no way to return the
> > physical address for further calculation on the alignment.
> > 
> > For THP, VA is always calculated against pgoff not physical address on the
> > alignment.  I think it's OK for THP, because every 2M THP folio will be
> > naturally 2M aligned on the physical address, so it fits when e.g. pgoff=0
> > in the calculation of thp_get_unmapped_area_vmflags().
> > 
> > Logically it should even also work for vfio-pci, as long as VFIO keeps
> > using the lower 40 bits of the device_fd to represent the bar offset,
> > meanwhile it'll also require PCIe spec asking the PCI bars to be mapped
> > aligned with bar sizes.
> > 
> > But from an API POV, get_mapping_order() logically should return something
> > for further calculation of the alignment to get the VA.  pgoff here may not
> > always be the right thing to use to align to the VA: after all, pgtable
> > mapping is about VA -> PA, the only reasonable and reliable way is to align
> > VA to the PA to be mappped, and as an API we shouldn't assume pgoff is
> > always aligned to PA address space.
> 
> My feeling, and the reason I used the phrase "pgoff aligned address",
> is that the owner of the file should already ensure that for the large
> PTEs/folios:
>  pgoff % 2**order == 0
>  physical % 2**order == 0

IMHO there shouldn't really be any hard requirement in mm that pgoff and
physical address space need to be aligned.. but I confess I don't have an
example driver that didn't do that in the linux tree.

> 
> So, things like VFIO do need to hand out high alignment pgoffs to make
> this work - which it already does.
> 
> To me this just keeps thing simpler. I guess if someone comes up with
> a case where they really can't get a pgoff alignment and really need a
> high order mapping then maybe we can add a new return field of some
> kind (pgoff adjustment?) but that is so weird I'd leave it to the
> future person to come and justfiy it.

When looking more, I also found some special cased get_unmapped_area() that
may not be trivially converted into the new API even for CONFIG_MMU, namely:

- io_uring_get_unmapped_area
- arena_get_unmapped_area (from bpf_map->ops->map_get_unmapped_area)

I'll need to have some closer look tomorrow.  If any of them cannot be 100%
safely converted to the new API, I'd also think we should not introduce the
new API, but reuse get_unmapped_area() until we know a way out.

-- 
Peter Xu

