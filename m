Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3F42F1FE2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751050019; cv=none; b=BDrWQwKfSsRQMzvYRBkIwsSip3Fq0QcBuAzcG8v22ti63p8gGZUlhxqfmFYQo2eVr9QB0CyHuUO5rb8W7J7tMFLDC2wKrCdl0zC87Gf6hb6i0pSnX0yanlWUEknTmQEB1YSFHGI3ym8JH4va4ygm0sZcLywtNVvi5KGKH3XuigI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751050019; c=relaxed/simple;
	bh=flY69kVEnXnfcQQ45AsLPiwuqdUyVK7Moa0qGWPewPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWcv3DVatfywEhSpY5IiqApCrWdqEwELSSxa56hB/miLOZYAQ+ZQkBvhpl04VIlxQdi46+ygPm+ZTf/wPmCWSo5Lsg2QH69EmJqmWOw1RUJ25m2hEAsCQCJy+/ZUCAtK5UADdvLhlnDoCqGybVdZvMYXTTeN47Fr7nSjZM7uowQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DCWD4yUG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DCWD4yUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751050015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wPsuOShwW8rcUabyA/w40dAw+qv83nK9tnkMUhJXu8o=;
	b=DCWD4yUGm6ZS6QlE9p4Q99bC4D+36gok9uiaY6BQeJ9XWbwQCIW/ivIg7YMUwmEdWnthOQ
	79ERLLVfemRJWoe1J/46F8BN4uQHGVwW7TJnDCLc+nLGoc6T46hq+D37zZI9i4Wsvrgc+K
	Cd2PyNQ5yvoLsdnB+9mf8Cwb6qbHcSw=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-RZceZ7_mNQG8q_Ne9ZhBPg-1; Fri, 27 Jun 2025 14:46:44 -0400
X-MC-Unique: RZceZ7_mNQG8q_Ne9ZhBPg-1
X-Mimecast-MFC-AGG-ID: RZceZ7_mNQG8q_Ne9ZhBPg_1751050003
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40abfc09f67so929440b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:46:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751050003; x=1751654803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPsuOShwW8rcUabyA/w40dAw+qv83nK9tnkMUhJXu8o=;
        b=fqVJtLThm8z/IgL+rvglXjASppiWGDEzE2MkZGUTsAC37EzjZS/stkiYxKKUgzpEhn
         5+Q5K4tJAzgMYjvVt2L4zIK+KB5QBdjN081V/neFYNNjoHMav5asyfch/Dyi0Q0jeTxq
         SQyrCRNzFe/qq2yu9wNir6myUVeuxAzz/nLcBvr2URhAmhr3BUDc86X5z4ZFCdfIeEtz
         1UfRsnQeqsgkv+AN82VGv7V9SQ1uDveORTgpJwNnx/PZ/4e6uIIM/upd6Ave6dT51CHS
         foe0ItQA0054HjiydLQwoAJv9o0IXhfvze+qv4FLudZLjT4tVHgeBZ45s0af+vyCD8wt
         gkzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhxD8+RLscctzNxDTP3fGhqDWdBSOWajDSaNcWs6wpAbJ3yyq0seiKT7uCaqbvYEnHGPdZZtaZa9rQ2DI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPo/rV7ZJUt1+8wSVIqI8h4H43X7JVfNueAUFfzWW14DUoxvv/
	/JmUA4+0+GUiRJ2TSczlXEPhmj0eonoN9hQtlTFdBNaRzPw4oLLtq6+MU8080u6mEhVJXSc2puZ
	fuJ787CnfOSC4MoK9kGgpB49W1C20cHodEP5waznuKt++PFynzkON/XyUpZ5oqY4TnA==
X-Gm-Gg: ASbGncuyQeTm8uw0C/C5Gk8JmNreAvtn4NMzcSYCXulPqJ4lxdOp1uKktx7zVmJ6+/e
	8xodb6UR7D+ww8S4iMjWafabEwjFPhFGA9a5ChqDyOvpuSfgA8AAio44/865ObOm2uNGhmykHG9
	eajIFZYvc1x/tHFlI+zdiPZpkdEvi5wNIRDm7ubLCly8Zoi9BuplxNMYqwpgYTzsvvZflcodbrq
	CgSTbIEuxkUvboTEbWZtD51XceHLc4Q4x8s9rpJDzqb/iabUJYgyAy9prXrzB8Btut4ythzdmEk
	fK9FSmmLXP+l6Q==
X-Received: by 2002:a05:6808:1887:b0:3f6:6d8f:1365 with SMTP id 5614622812f47-40b33c181f7mr3137109b6e.3.1751050003462;
        Fri, 27 Jun 2025 11:46:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBkeyZbHONdPICNY/ngZpaDDN33V/Cjjb5FkFPOhcDzAO8OcJNj0te7ITvNSIpnVPEr+Vc1Q==
X-Received: by 2002:a05:6808:1887:b0:3f6:6d8f:1365 with SMTP id 5614622812f47-40b33c181f7mr3137094b6e.3.1751050003038;
        Fri, 27 Jun 2025 11:46:43 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b324050c7sm470446b6e.30.2025.06.27.11.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 11:46:42 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:46:31 -0400
From: Peter Xu <peterx@redhat.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 0/4] mm/userfaultfd: modulize memory types
Message-ID: <aF7nBzakfWRU_A0Z@x1.local>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <114133f5-0282-463d-9d65-3143aa658806@amazon.com>
 <aFxZUHcQh3hSraqe@x1.local>
 <7666ee96-6f09-4dc1-8cb2-002a2d2a29cf@amazon.com>
 <aF6h7rYVnVTMtJ0S@x1.local>
 <7455220c-e35b-4509-b7c3-a78fde5b12d5@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7455220c-e35b-4509-b7c3-a78fde5b12d5@amazon.com>

On Fri, Jun 27, 2025 at 05:59:49PM +0100, Nikita Kalyazin wrote:
> 
> 
> On 27/06/2025 14:51, Peter Xu wrote:
> > On Thu, Jun 26, 2025 at 05:09:47PM +0100, Nikita Kalyazin wrote:
> > > 
> > > 
> > > On 25/06/2025 21:17, Peter Xu wrote:
> > > > On Wed, Jun 25, 2025 at 05:56:23PM +0100, Nikita Kalyazin wrote:
> > > > > 
> > > > > 
> > > > > On 20/06/2025 20:03, Peter Xu wrote:
> > > > > > [based on akpm/mm-new]
> > > > > > 
> > > > > > This series is an alternative proposal of what Nikita proposed here on the
> > > > > > initial three patches:
> > > > > > 
> > > > > >      https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com
> > > > > > 
> > > > > > This is not yet relevant to any guest-memfd support, but paving way for it.
> > > > > 
> > > > > Hi Peter,
> > > > 
> > > > Hi, Nikita,
> > > > 
> > > > > 
> > > > > Thanks for posting this.  I confirmed that minor fault handling was working
> > > > > for guest_memfd based on this series and looked simple (a draft based on
> > > > > mmap support in guest_memfd v7 [1]):
> > > > 
> > > > Thanks for the quick spin, glad to know it works. Some trivial things to
> > > > mention below..
> > > 
> > > Following up, I drafted UFFDIO_COPY support for guest_memfd to confirm it
> > > works as well:
> > 
> > Appreciated.
> > 
> > Since at it, I'll comment quickly below.
> > 
> > > 
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index 8c44e4b9f5f8..b5458a22fff4 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -349,12 +349,19 @@ static bool kvm_gmem_offset_is_shared(struct file
> > > *file, pgoff_t index)
> > > 
> > >   static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> > >   {
> > > +     struct vm_area_struct *vma = vmf ? vmf->vma : NULL;
> > >        struct inode *inode = file_inode(vmf->vma->vm_file);
> > >        struct folio *folio;
> > >        vm_fault_t ret = VM_FAULT_LOCKED;
> > > 
> > >        filemap_invalidate_lock_shared(inode->i_mapping);
> > > 
> > > +     folio = filemap_get_entry(inode->i_mapping, vmf->pgoff);
> > > +     if (!folio && vma && userfaultfd_missing(vma)) {
> > > +             filemap_invalidate_unlock_shared(inode->i_mapping);
> > > +             return handle_userfault(vmf, VM_UFFD_MISSING);
> > > +     }
> > 
> > Likely a possible refcount leak when folio != NULL here.
> 
> Thank you.  I was only aiming to cover the happy case for know.  I will keep
> it in mind for the future.

Yep that's good enough, thanks.  It's really something I'd comment
passingly, it's definitely reassuring to know the happy case works.

> > > +
> > >        folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> > >        if (IS_ERR(folio)) {
> > >                int err = PTR_ERR(folio);
> > > @@ -438,10 +445,57 @@ static int kvm_gmem_uffd_get_folio(struct inode
> > > *inode, pgoff_t pgoff,
> > >        return 0;
> > >   }
> > > 
> > > +static int kvm_gmem_mfill_atomic_pte(pmd_t *dst_pmd,
> > > +                        struct vm_area_struct *dst_vma,
> > > +                        unsigned long dst_addr,
> > > +                        unsigned long src_addr,
> > > +                        uffd_flags_t flags,
> > > +                        struct folio **foliop)
> > > +{
> > > +     struct inode *inode = file_inode(dst_vma->vm_file);
> > > +     pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
> > > +     struct folio *folio;
> > > +     int ret;
> > > +
> > > +     folio = kvm_gmem_get_folio(inode, pgoff);
> > > +     if (IS_ERR(folio)) {
> > > +             ret = PTR_ERR(folio);
> > > +             goto out;
> > > +     }
> > > +
> > > +     folio_unlock(folio);
> > > +
> > > +     if (uffd_flags_mode_is(flags, MFILL_ATOMIC_COPY)) {
> > > +             void *vaddr = kmap_local_folio(folio, 0);
> > > +             ret = copy_from_user(vaddr, (const void __user *)src_addr, PAGE_SIZE);
> > > +             kunmap_local(vaddr);
> > > +             if (unlikely(ret)) {
> > > +                     *foliop = folio;
> > > +                     ret = -ENOENT;
> > > +                     goto out;
> > > +             }
> > > +     } else {                /* ZEROPAGE */
> > > +             clear_user_highpage(&folio->page, dst_addr);
> > > +     }
> > > +
> > > +     kvm_gmem_mark_prepared(folio);
> > 
> > Since Faud's series hasn't yet landed, so I'm almost looking at the current
> > code base with an imagination of what might happen.
> > 
> > In general, missing trapping for guest-memfd could start to be slightly
> > trickier.  So far IIUC guest-memfd cache pool needs to be populated only by
> > a prior fallocate() syscall, not during fault.  So I suppose we will need
> > to use uptodate bit to mark folio ready, like what's done here.
> 
> I don't think I'm familiar with the fallocate() requirement in guest_memfd.
> Fuad's v12 [1] (although I think it has been like that from the beginning)
> calls kvm_gmem_get_folio() that populates pagecache in the fault handler
> (kvm_gmem_fault_shared()).  SEV [2] and TDX [3] seem to use
> kvm_gmem_populate() for both allocation and preparation.

I actually didn't notice fault() uses kvm_gmem_get_folio(), which has
FGP_CREAT indeed.

I checked Ackerley's latest 1G patchset, which also did the same that
kvm_gmem_get_folio() will invoke the custom allocator to allocate 1G pages
even during a fault().

Not sure whether it's intentional though, for example, if the tests in
userspace always does fallocate() then the code should run the same, and
FGP_CREAT will just never be used.

Thanks for pointing this out.  I definitely didn't notice this trivial
detail before. Looks like it's not a major issue, if the folio can be
dynamically allocated, then MISSING mode (if/when it'll be supported) can
capture both "!folio" and "folio && !uptodate" cases here as missing.

> 
> [1] https://lore.kernel.org/kvm/20250611133330.1514028-1-tabba@google.com/T/#m15b53a741e4f328e61f995a01afb9c4682ffe611
> [2] https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/kvm/svm/sev.c#L2331
> [3] https://elixir.bootlin.com/linux/v6.16-rc3/source/arch/x86/kvm/vmx/tdx.c#L3236

-- 
Peter Xu

