Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8220D1F461A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194459; cv=none; b=XZrk3/qhnyZycgJzEv5ja41V0d+5UjzDenBmEPOekGmiTF7bVC2MuciWRTQjj9AuWOfI4dcrEL6K7n6EKG+CFrzo/qSYve1iI6OY0efgKmQptFtnujfIJGaYYOPRh2D81GdkLDbZo8qKbxIUvanvynOz34ywyO5y2TZvH/6wAwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194459; c=relaxed/simple;
	bh=/YMbad19V6TpsG3MEiZ2mbTgkuu9Y0VSL2UolHVg1UE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjVTYCSVPaU9O3C1nf5fc1xhk49BMMGsTvbpoOI4nDjyPmM2d8hKc5zfx8elwJcgoPnPZ4NafigFUrSN02nGLhxr6DvbB5mSdD1NVPOndeZx0v7429kl1qyCrDKAdmKFw4VQjaGTFKIR3LK+tq8+fG6kZ/4p42HXGjVdzoBT3sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BT8SN6/y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BT8SN6/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750194456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9waNqRMmOjunuN18CikjvGF9bugNIg2AINTl6Y0HXgo=;
	b=BT8SN6/yzXX6+muAoHdxwKv8ML8gBXo0y29CdzojdvVNmPooO0Fld1vnvJgineSQSNiFOH
	pujhdUZ0WBeo4go763+6o6slYVAB+Vt/tTnP23x/wZhMpXpaAe9dCK7vb/jAKlhWAqnKs+
	GivrFrO8IQhqdg2VptNHUnJ+H5aIkLE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-VjSjiNc-NyqKEbYZFL2Brw-1; Tue, 17 Jun 2025 17:07:35 -0400
X-MC-Unique: VjSjiNc-NyqKEbYZFL2Brw-1
X-Mimecast-MFC-AGG-ID: VjSjiNc-NyqKEbYZFL2Brw_1750194454
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a4369e7413so130675801cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750194454; x=1750799254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9waNqRMmOjunuN18CikjvGF9bugNIg2AINTl6Y0HXgo=;
        b=kytCRur9YXiMcGK6q4wxDv2/2toUqAfaxPFlJ2dqV35vmoXQrUHsG5TDNYlU52QrMz
         yFPB4iq5bwGv9GEgzkrKUzuezwcf/3yQPVjSQNnay+7WvQxI4qk8mvyarnbMXn4Q41mH
         g5JYZxYwS02tSOZkM+qYlXAdd2jGlYQBZYkooKzgsyethStSET5v6UVMCp0cI+EUocUF
         Hx+AqVnShuYVKuem0vV874P9UinkKHWYzHgv87lHHQ1VllF1yKf/ukudzb5AMdTMK4ab
         HIuohus12EXwgJ3WvXw0k8ek+bqzkr/bJGKyyE5VL90Vnb/eimXZdBdd+d/5Qjio34Pt
         cN7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW8ybmpH3HlQhEeblGEMaj2KWFeMHfWGD8a3unNhu+9rluwPCvAenig+5TpJoiQ7V62ESm4x9JmPAPkXNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXxSSAT4luk57G0JLfm6hhFsDdP7WtmnQb9kgXcGv5DkY4WzeR
	89fsa71N4PYqgUJxSKj00bvA02O7OvQS9bLdRpfpVMvVBke2li46Dwn3UcMQpVWud5C7oAm4cQE
	hgye44IzdSjph6l41h4TBQrntB/qPOZ3qA4dMqtJhSBWE++Bmbe/i7Ko7WoROmVd6Qg==
X-Gm-Gg: ASbGncte8wmI3lyoNJwCW24LC4I1srYgGPtGBSeiIA7aNNznCOAU9AE6TtTu5Bq57sA
	HDPfJe64Mf7tagdoo5PEWp6XhbfxMXneXhmryp/IwKTeTUAPNMHN0Z/+JTTqsoSsxePHuH2kZD9
	Er0x7UkVhjLHW9+xmE0o3pKhz/I7RLTGwgh+h5g9KKJ6A4DHPYAK1VtUSiUqlaVZIvRUm82vmKy
	wIbJgfoBjWR/5U1yc34h2+FSOt/RovtCH0yxSC5aZ2/r4Ynl1ENuZ0q0PPoV8aDacBeD7sxku5E
	oMYR+25yL8UggQ==
X-Received: by 2002:a05:620a:40c3:b0:7d2:2698:aab1 with SMTP id af79cd13be357-7d3c6c18fc1mr2412799585a.19.1750194454397;
        Tue, 17 Jun 2025 14:07:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjDInY101hnNdJuIa1SM4o6S/CNrzg2R+QnI69RAx4dIk51ymk26jNQS+KJeGfyRDLUZEXbQ==
X-Received: by 2002:a05:620a:40c3:b0:7d2:2698:aab1 with SMTP id af79cd13be357-7d3c6c18fc1mr2412795385a.19.1750194454011;
        Tue, 17 Jun 2025 14:07:34 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e2173csm690984185a.52.2025.06.17.14.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:07:33 -0700 (PDT)
Date: Tue, 17 Jun 2025 17:07:30 -0400
From: Peter Xu <peterx@redhat.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	kvm@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Alex Mastro <amastro@fb.com>, David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/5] mm/hugetlb: Remove prepare_hugepage_range()
Message-ID: <aFHZEtepArJdkLB0@x1.local>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-3-peterx@redhat.com>
 <4rypovqoa4j6f4fyfqzrm5xeiv3dng5hc5dlfhmnehkydk6gcd@z6f3k3joaoli>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4rypovqoa4j6f4fyfqzrm5xeiv3dng5hc5dlfhmnehkydk6gcd@z6f3k3joaoli>

On Sat, Jun 14, 2025 at 12:11:22AM -0400, Liam R. Howlett wrote:
> * Peter Xu <peterx@redhat.com> [691231 23:00]:
> > Only mips and loongarch implemented this API, however what it does was
> > checking against stack overflow for either len or addr.  That's already
> > done in arch's arch_get_unmapped_area*() functions, hence not needed.
> 
> I'm not as confident..
> 
> > 
> > It means the whole API is pretty much obsolete at least now, remove it
> > completely.
> > 
> > Cc: Huacai Chen <chenhuacai@kernel.org>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Muchun Song <muchun.song@linux.dev>
> > Cc: Oscar Salvador <osalvador@suse.de>
> > Cc: loongarch@lists.linux.dev
> > Cc: linux-mips@vger.kernel.org
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  arch/loongarch/include/asm/hugetlb.h | 14 --------------
> >  arch/mips/include/asm/hugetlb.h      | 14 --------------
> >  fs/hugetlbfs/inode.c                 |  8 ++------
> >  include/asm-generic/hugetlb.h        |  8 --------
> >  include/linux/hugetlb.h              |  6 ------
> >  5 files changed, 2 insertions(+), 48 deletions(-)
> > 
> > diff --git a/arch/loongarch/include/asm/hugetlb.h b/arch/loongarch/include/asm/hugetlb.h
> > index 4dc4b3e04225..ab68b594f889 100644
> > --- a/arch/loongarch/include/asm/hugetlb.h
> > +++ b/arch/loongarch/include/asm/hugetlb.h
> > @@ -10,20 +10,6 @@
> >  
> >  uint64_t pmd_to_entrylo(unsigned long pmd_val);
> >  
> > -#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
> > -static inline int prepare_hugepage_range(struct file *file,
> > -					 unsigned long addr,
> > -					 unsigned long len)
> > -{
> > -	unsigned long task_size = STACK_TOP;
> > -
> > -	if (len > task_size)
> > -		return -ENOMEM;
> > -	if (task_size - len < addr)
> > -		return -EINVAL;
> > -	return 0;
> > -}
> > -
> >  #define __HAVE_ARCH_HUGE_PTE_CLEAR
> >  static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
> >  				  pte_t *ptep, unsigned long sz)
> > diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
> > index fbc71ddcf0f6..8c460ce01ffe 100644
> > --- a/arch/mips/include/asm/hugetlb.h
> > +++ b/arch/mips/include/asm/hugetlb.h
> > @@ -11,20 +11,6 @@
> >  
> >  #include <asm/page.h>
> >  
> > -#define __HAVE_ARCH_PREPARE_HUGEPAGE_RANGE
> > -static inline int prepare_hugepage_range(struct file *file,
> > -					 unsigned long addr,
> > -					 unsigned long len)
> > -{
> > -	unsigned long task_size = STACK_TOP;
> 
> arch/mips/include/asm/processor.h:#define STACK_TOP             mips_stack_top()
> 
> 
> unsigned long mips_stack_top(void)                                                                                                                                                                                                             
> {       
>         unsigned long top = TASK_SIZE & PAGE_MASK;                                                                                                                                                                                             
>         
>         if (IS_ENABLED(CONFIG_MIPS_FP_SUPPORT)) {
>                 /* One page for branch delay slot "emulation" */                                                                                                                                                                               
>                 top -= PAGE_SIZE;                                                                                                                                                                                                              
>         }                                                                                                                                                                                                                                      
>         
>         /* Space for the VDSO, data page & GIC user page */                                                                                                                                                                                    
>         top -= PAGE_ALIGN(current->thread.abi->vdso->size);                                                                                                                                                                                    
>         top -= PAGE_SIZE;
>         top -= mips_gic_present() ? PAGE_SIZE : 0;                                                                                                                                                                                             
>         
>         /* Space for cache colour alignment */                                                                                                                                                                                                 
>         if (cpu_has_dc_aliases)
>                 top -= shm_align_mask + 1;                                                                                                                                                                                                     
>         
>         /* Space to randomize the VDSO base */                                                                                                                                                                                                 
>         if (current->flags & PF_RANDOMIZE)
>                 top -= VDSO_RANDOMIZE_SIZE;                                                                                                                                                                                                    
>         
>         return top;                                                                                                                                                                                                                            
> }
> 
> This seems different than TASK_SIZE.
> 
> Code is from:
> commit ea7e0480a4b695d0aa6b3fa99bd658a003122113
> Author: Paul Burton <paulburton@kernel.org>
> Date:   Tue Sep 25 15:51:26 2018 -0700
> 
> 
> > -	if (len > task_size)
> > -		return -ENOMEM;
> > -	if (task_size - len < addr)
> > -		return -EINVAL;
> > -	return 0;
> > -}
> > -
> 
> Unfortunately, the commit message for the addition of this code are not
> helpful.
> 
> commit 50a41ff292fafe1e937102be23464b54fed8b78c
> Author: David Daney <ddaney@caviumnetworks.com>
> Date:   Wed May 27 17:47:42 2009 -0700
> 
> ... But the dates are helpful.  This code used to use:
> #define STACK_TOP      ((TASK_SIZE & PAGE_MASK) - PAGE_SIZE)
> 
> It's not exactly task size either.
> 
> I don't think this is an issue to remove this check because the overflow
> should be caught later (or trigger the opposite search).  But it's not
> clear why STACK_TOP was done in the first place.. Maybe just because we
> know the overflow here would be an issue later, but then we'd avoid the
> opposite search - and maybe that's the point?
> 
> Either way, your comment about the same check existing doesn't seem
> correct.

I will fix up the commit message to mention both archs:

  Only mips and loongarch implemented this API, however what it does was
  checking against stack overflow for either len or addr.  That's already
  done in arch's arch_get_unmapped_area*() functions, even though it may not
  be 100% identical checks.

  For example, for both of the architectures, there will be a trivial
  difference on how stack top was defined.  The old code uses STACK_TOP which
  may be slightly smaller than TASK_SIZE on either of them, but the hope is
  that shouldn't be a problem.

  It means the whole API is pretty much obsolete at least now, remove it
  completely.

> 
> I haven't checked loong arch, but I'd be willing to wager this was just
> cloned mips code... because this happens so much.

They define STACK_TOP differently, but AFAIU there're some duplications in
pattern of the two archs.

Please let me know if the fixed commit message works for you above, thanks.

-- 
Peter Xu

