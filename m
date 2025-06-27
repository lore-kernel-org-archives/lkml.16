Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E18723B61F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032319; cv=none; b=Dr0yxchXtLmeV+u7OLU+0t8UT+nBLSywk/4l/6Uuc0+uTBNyib0/xOvbNHThyB6cKVJTaSfGPvEdxTMCBB91nSZL/S0gdOOvW06VWQN6TmX1WIj6vh9j0JgB7yomMlEFoJAYa6QtFoz668vTF8PYIOj7V+5G0bvLGjVZ/MtoGsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032319; c=relaxed/simple;
	bh=jUMEv2c4z71duFOh6YjhSN+NhM/CZEpn4PdmDPk5+s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHQ1wu9LxLYh9IXO8TKR2CbtATEoNeAHRuGeXK+dZ4wo9A8/qxtOxrjlbxL6LRHCThLKX28qeP2g5a9enYsNtcJkWIfIZWG3uCrcfQYf5cYxQDh745wi36zy6Yb++hS3cH1WAJNaEYoC6oYmQ2At0vvNy7eHGKKBzCNCGH4DXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AVfjnmy/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AVfjnmy/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751032316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jdi8H7Y+WEaY2+EapncWAogUSUPPOlCTUAbjZIpMpK8=;
	b=AVfjnmy/l+V0cfOwub0GL6WAtM1aBbdwbYA1iSwj+PF/49yLLRtc3LjVDiAR1h+biU5TB6
	SXC+P1w/UwEnVo2px3qhz5za0a2uJdJatzX6uUYdb6soL/TyuHcQGWh88JRkXdp5Rt14+p
	FBK7VbEvWpwVxBDeNQSdSybQH/6Tnpo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-rRIa9sJAMMuEZv9UXZVqbA-1; Fri, 27 Jun 2025 09:51:54 -0400
X-MC-Unique: rRIa9sJAMMuEZv9UXZVqbA-1
X-Mimecast-MFC-AGG-ID: rRIa9sJAMMuEZv9UXZVqbA_1751032313
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fafb2f0a33so33616316d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751032313; x=1751637113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jdi8H7Y+WEaY2+EapncWAogUSUPPOlCTUAbjZIpMpK8=;
        b=Vr3ldOPodqwJaUD6JLYhMhanFNMJOrI0R8bNyvCrwk09KaHS3CeiV9/mCXA9F7TNBv
         M9W3ivzpTE+PVtn5qUhT3CMlm117tdkUeWwIz2Qk+81VfOUdQhvw+/9oAobXOanF3ZJq
         ZhL7KYXs0hzF/JdEr29wsOmnHZWagKrCD7KzBIfQaZ3ZuEv8DNN0UtvZPwvkuP/CYfLv
         wiNrHU2OOfUv9ObPN5J+znrRYZeuj+K6qxqb2jkrtqF0Nw/g/WOrg82UiPlUWqxuL1Z7
         knlwVfEjXLQsIU7SPCrlVKrCV+0dq482lN52g0YZ4h9cPi2f6NfFSvsdGuljjdtGd2Yd
         YA2w==
X-Forwarded-Encrypted: i=1; AJvYcCXUoSDuoAtgnS3UVAQV+51m2V+quLxVmErXsyORnhzmJ265OpLMN1GDIHGaMJQymmz4TXaDzAYfRvVmjQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoDlnyiqCkf0YbsWbQa/95GOmmMo37WprtmKQf4VZKCXI9Yl49
	8wjoQrSrpnyf8D8wP6AOrySOKGDF3Gz1r1KJ5Gju8u4+xHoe0cNbga2JZEX9zAsNomBTR5w8TfU
	4cHAj4DdCT6uIurIzJFSlrEpLq54eq5a3kdel4r1zi2dTKiZkRepVP73JnDuVw6n8xw==
X-Gm-Gg: ASbGncuXAxrxjpooOOyEwAOo5yi4ZQ651DTwSMxJJZiNHKLVdzWCV+qtAyS4Bhwcrgu
	I6PBhjFNTgQfwkN8fGA7qd8Au7JPieq2ky9Iy4ohLYLWiF9T4V8KlUh/9z0krxw/MK2AUjTrvXI
	JooCJo8mQCbt1BU8ZLBvjGguMkXMTo7bTrwVDsNN/vNcrTVoOWP2onVSgz6L3f7Kh8+PSwBCk72
	rea+kn/ZGilX+qtWuH1sYPKbyjiFBAftmGT5FqvOi8YCJN5RFkiii9AByghT2gpp2Q7MJj/eiD6
	NcWZ6qrpGJm6BA==
X-Received: by 2002:a05:6214:c67:b0:6fd:6fc6:3961 with SMTP id 6a1803df08f44-70003c8eae7mr58596466d6.37.1751032311273;
        Fri, 27 Jun 2025 06:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiC41jUhRVuBAY/tvm/vWlRrKGu+kuTwOtZUZIehF8tIJVZBE67diI3DWMUfhyMY0RMShs4w==
X-Received: by 2002:a05:6214:c67:b0:6fd:6fc6:3961 with SMTP id 6a1803df08f44-70003c8eae7mr58592736d6.37.1751032306777;
        Fri, 27 Jun 2025 06:51:46 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44317195fsm131113185a.38.2025.06.27.06.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:51:46 -0700 (PDT)
Date: Fri, 27 Jun 2025 09:51:42 -0400
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
Message-ID: <aF6h7rYVnVTMtJ0S@x1.local>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <114133f5-0282-463d-9d65-3143aa658806@amazon.com>
 <aFxZUHcQh3hSraqe@x1.local>
 <7666ee96-6f09-4dc1-8cb2-002a2d2a29cf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7666ee96-6f09-4dc1-8cb2-002a2d2a29cf@amazon.com>

On Thu, Jun 26, 2025 at 05:09:47PM +0100, Nikita Kalyazin wrote:
> 
> 
> On 25/06/2025 21:17, Peter Xu wrote:
> > On Wed, Jun 25, 2025 at 05:56:23PM +0100, Nikita Kalyazin wrote:
> > > 
> > > 
> > > On 20/06/2025 20:03, Peter Xu wrote:
> > > > [based on akpm/mm-new]
> > > > 
> > > > This series is an alternative proposal of what Nikita proposed here on the
> > > > initial three patches:
> > > > 
> > > >     https://lore.kernel.org/r/20250404154352.23078-1-kalyazin@amazon.com
> > > > 
> > > > This is not yet relevant to any guest-memfd support, but paving way for it.
> > > 
> > > Hi Peter,
> > 
> > Hi, Nikita,
> > 
> > > 
> > > Thanks for posting this.  I confirmed that minor fault handling was working
> > > for guest_memfd based on this series and looked simple (a draft based on
> > > mmap support in guest_memfd v7 [1]):
> > 
> > Thanks for the quick spin, glad to know it works. Some trivial things to
> > mention below..
> 
> Following up, I drafted UFFDIO_COPY support for guest_memfd to confirm it
> works as well:

Appreciated.

Since at it, I'll comment quickly below.

> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 8c44e4b9f5f8..b5458a22fff4 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -349,12 +349,19 @@ static bool kvm_gmem_offset_is_shared(struct file
> *file, pgoff_t index)
> 
>  static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
>  {
> +	struct vm_area_struct *vma = vmf ? vmf->vma : NULL;
>  	struct inode *inode = file_inode(vmf->vma->vm_file);
>  	struct folio *folio;
>  	vm_fault_t ret = VM_FAULT_LOCKED;
> 
>  	filemap_invalidate_lock_shared(inode->i_mapping);
> 
> +	folio = filemap_get_entry(inode->i_mapping, vmf->pgoff);
> +	if (!folio && vma && userfaultfd_missing(vma)) {
> +		filemap_invalidate_unlock_shared(inode->i_mapping);
> +		return handle_userfault(vmf, VM_UFFD_MISSING);
> +	}

Likely a possible refcount leak when folio != NULL here.

> +
>  	folio = kvm_gmem_get_folio(inode, vmf->pgoff);
>  	if (IS_ERR(folio)) {
>  		int err = PTR_ERR(folio);
> @@ -438,10 +445,57 @@ static int kvm_gmem_uffd_get_folio(struct inode
> *inode, pgoff_t pgoff,
>  	return 0;
>  }
> 
> +static int kvm_gmem_mfill_atomic_pte(pmd_t *dst_pmd,
> +			   struct vm_area_struct *dst_vma,
> +			   unsigned long dst_addr,
> +			   unsigned long src_addr,
> +			   uffd_flags_t flags,
> +			   struct folio **foliop)
> +{
> +	struct inode *inode = file_inode(dst_vma->vm_file);
> +	pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
> +	struct folio *folio;
> +	int ret;
> +
> +	folio = kvm_gmem_get_folio(inode, pgoff);
> +	if (IS_ERR(folio)) {
> +		ret = PTR_ERR(folio);
> +		goto out;
> +	}
> +
> +	folio_unlock(folio);
> +
> +	if (uffd_flags_mode_is(flags, MFILL_ATOMIC_COPY)) {
> +		void *vaddr = kmap_local_folio(folio, 0);
> +		ret = copy_from_user(vaddr, (const void __user *)src_addr, PAGE_SIZE);
> +		kunmap_local(vaddr);
> +		if (unlikely(ret)) {
> +			*foliop = folio;
> +			ret = -ENOENT;
> +			goto out;
> +		}
> +	} else {		/* ZEROPAGE */
> +		clear_user_highpage(&folio->page, dst_addr);
> +	}
> +
> +	kvm_gmem_mark_prepared(folio);

Since Faud's series hasn't yet landed, so I'm almost looking at the current
code base with an imagination of what might happen.

In general, missing trapping for guest-memfd could start to be slightly
trickier.  So far IIUC guest-memfd cache pool needs to be populated only by
a prior fallocate() syscall, not during fault.  So I suppose we will need
to use uptodate bit to mark folio ready, like what's done here.

If so, we may want to make sure in fault path any !uptodate fault will get
trapped for missing too, even if it sounds not strictly a "cache miss"
... so slightly confusing but sounds necessary.

Meanwhile, I'm not 100% sure how it goes especially if taking CoCo into
account, because CoCo needs to prepare the pages, so mark uptodate may not
be enough?  I don't know well on the CoCo side to tell.  Otherwise we'll at
least need to restrict MISSING traps to only happen on fully shared
guest-memfds.

OTOH, MINOR should be much easier to be done for guest-memfd, not only
because the code to support that would be very minimum which is definitely
lovely, but also because it's still pretty common idea to monitor pgtable
entries, and it should logically even apply to CoCo: in a fault(), we need
to check whether the guest-memfd folio is "shared" and/or "faultable"
first; it should already fail the fault() if it's a private folio.  Then if
it's visible (aka, "faultable") to HVA namespace, then it's legal to trap a
MINOR too.  For !CoCo it'll always trap as it's always faultable.

MINOR also makes more sense to be used in the future with 1G postcopy
support on top of gmem, because that's almost the only way to go.  Looks
like we've made up our mind to reuse Hugetlb pages for gmem which sounds
good, then Hugetlb pages are in 1G granule in allocations, and we can't
easily do 4K miss trapping on one 1G huge page.  MINOR is simpler but
actually more powerful from that POV.

To summarize, I think after this we can do MINOR before MISSING for
guest-memfd if MINOR already works for you.  We can leave MISSING until we
know how we would use it.

Thanks,

> +
> +	ret = mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
> +				       &folio->page, true, flags);
> +
> +	if (ret)
> +		folio_put(folio);
> +out:
> +	return ret;
> +}
> +
>  static const vm_uffd_ops kvm_gmem_uffd_ops = {
> -	.uffd_features	= 	VM_UFFD_MINOR,
> -	.uffd_ioctls	= 	BIT(_UFFDIO_CONTINUE),
> +	.uffd_features	= 	VM_UFFD_MISSING | VM_UFFD_MINOR,
> +	.uffd_ioctls	= 	BIT(_UFFDIO_COPY) |
> +				BIT(_UFFDIO_ZEROPAGE) |
> +				BIT(_UFFDIO_CONTINUE),
>  	.uffd_get_folio	=	kvm_gmem_uffd_get_folio,
> +	.uffd_copy	=	kvm_gmem_mfill_atomic_pte,
>  };
>  #endif
> 
> > 
> > > 
> > > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > > index 5abb6d52a375..6ddc73419724 100644
> > > --- a/virt/kvm/guest_memfd.c
> > > +++ b/virt/kvm/guest_memfd.c
> > > @@ -5,6 +5,9 @@
> > >   #include <linux/pagemap.h>
> > >   #include <linux/anon_inodes.h>
> > >   #include <linux/set_memory.h>
> > > +#ifdef CONFIG_USERFAULTFD
> > 
> > This ifdef not needed, userfaultfd_k.h has taken care of all cases.
> 
> Good to know, thanks.
> 
> > > +#include <linux/userfaultfd_k.h>
> > > +#endif
> > > 
> > >   #include "kvm_mm.h"
> > > 
> > > @@ -396,6 +399,14 @@ static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> > >                kvm_gmem_mark_prepared(folio);
> > >        }
> > > 
> > > +#ifdef CONFIG_USERFAULTFD
> > 
> > Same here.  userfaultfd_minor() is always defined.
> 
> Thank you.
> 
> > I'll wait for a few more days for reviewers, and likely send v2 before next
> > week.
> > 
> > Thanks,
> > 
> > --
> > Peter Xu
> > 
> 

-- 
Peter Xu

