Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F2C22068B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745612621; cv=none; b=fSUIoUm8lz2BnStUBJGTHR2lsRs2Ddv/P/Syp6wQ0jHlTN9FGFSO/pUik3QGhfAugtTAy9oS/dJPJUfE+U5ACmYziE5COyk2Q2UckUGguebuSR34flUlYnm8kC19VBScvfvXolAHVy7Y6cYMqejokCEWPRkPW4+ks27Z/x6iQv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745612621; c=relaxed/simple;
	bh=TzBSGSj6jGOetYQyWr//XfuEnO/nibgpaRK8a5Y7DVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAHHsXiRXM1lYUhb+R2keqAgYUCtfR6EAY6vdDchgj9YwbU02xnNiWpYCSb8UeA83d1eQa7VRS54R6f1WmKpPakqNWkICSrJ0anGgoqiARq4Cc+RTK7iF9uptUxurtc9c1PEHn8rGXCQ5AC77EqA3Ewpqh4go/gmqHlVqkNT5KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EZBoPtEt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EZBoPtEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745612619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lnuw5o7CPzgYgSg30nFZeV0xqdVhh4HEfg3UbcumuG4=;
	b=EZBoPtEti1vBtNOoxnf+TEehupvW9gttCYiaxUF/fLs85NiN/XHa2SIlCHrljk+1CzM/60
	zEJfUDZttLXxAjxu49hg8sJvG4wwMga04wVOoQeJZ1KRb+O2Xj1LWi95B6GaXQ5yJvdKay
	u+q5qe5EyWtMujIw2M1amN3Al6XBtzw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-iT8UHxadOWuZrr_ARfC_9w-1; Fri, 25 Apr 2025 16:23:37 -0400
X-MC-Unique: iT8UHxadOWuZrr_ARfC_9w-1
X-Mimecast-MFC-AGG-ID: iT8UHxadOWuZrr_ARfC_9w_1745612617
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f6443ed5so65861956d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745612617; x=1746217417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lnuw5o7CPzgYgSg30nFZeV0xqdVhh4HEfg3UbcumuG4=;
        b=k2e0Tt4L0faRzSp9CJ8dYejsAOqphJRJ9WC9/Wxq2zroMcydmcIaslNgrrr0+z42uC
         OOqGJOyyW1GKCM4BYm6deRUYK69Z6nFS8wGtO+u6aIkcsL4nWOLiArphydvcgrsWIv3h
         WHRgl8FDIlTSHr9y1cTgdlpkcxhb/VgXBlRxfI5mfh9jMmBKOari8onzvRLJ0piR1RoC
         D7sm0nEZUPA23A9SyLdJhC5/bQG/OuDc4fECfPW/RxsnSWkyM/dCFaw9+4M7QMC1/wJf
         4Jd8OvY1FDeKvh72+xC/2zf65ydSltg7SmMhBbCYmnqpoihkVuw+tFYwOS9wNgB5Q/Yd
         5UAA==
X-Gm-Message-State: AOJu0Yy8RrK1Lz0pKpduKtl2YXUurZqE+lVo0Lr7dAYhZPh3GBBA38wF
	/nB/u3QINjhtEu+uGFZX7qlv9gesyfAJRrVR/iY+vhJALkkOSF9ze36BE9k0QqXo3GRTS93tIBf
	7SG90DnZZiFxktm9K0zdcsZs7/RyFZ/QlLnRGtHOXf+hU2pnVWw1L7vd6iUSj94RsxRmvqA==
X-Gm-Gg: ASbGncsL/0w0vIXGws1AVlOjhScQVliJIWZipG1s/9z08Jev31SMq9bekmRSbz+Xd2f
	+FUysqHNw+cuO3v8m+qBhrqab7RLIN3K4+2LPilU0ZQv7KF2bPAsHu5W4yVznmPrRWLSnq6O8xm
	EhaJ51c377eXZAldrX7LTJZr950Sc+G5z5TdcLgpsbfrTDF08Pfh1aF7BDXkvrZs5grJCX57YC+
	puN+OUodiqk8iM8uhM2dkCh0IQ1Ti4/shiJCM3JWjus5A1QgClcwBgd2GO8JlF+ItZk00ScVteN
	aUk=
X-Received: by 2002:a05:6214:ca2:b0:6f4:c939:a3f5 with SMTP id 6a1803df08f44-6f4cc38cae8mr50223896d6.17.1745612616900;
        Fri, 25 Apr 2025 13:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAbB9VBhNfVFkn16GQ1jhi8yEPGvnD0kLIi/1k7vzQQf+ePUU4ZzjJOht8FgMwVJBxtCN+iQ==
X-Received: by 2002:a05:6214:ca2:b0:6f4:c939:a3f5 with SMTP id 6a1803df08f44-6f4cc38cae8mr50223586d6.17.1745612616494;
        Fri, 25 Apr 2025 13:23:36 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0aaf9a3sm25917506d6.98.2025.04.25.13.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 13:23:35 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:23:31 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to
 pfnmap_track() + pfnmap_untrack()
Message-ID: <aAvvQ1h9bg11hiqI@x1.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-6-david@redhat.com>

On Fri, Apr 25, 2025 at 10:17:09AM +0200, David Hildenbrand wrote:
> Let's use our new interface. In remap_pfn_range(), we'll now decide
> whether we have to track (full VMA covered) or only sanitize the pgprot
> (partial VMA covered).
> 
> Remember what we have to untrack by linking it from the VMA. When
> duplicating VMAs (e.g., splitting, mremap, fork), we'll handle it similar
> to anon VMA names, and use a kref to share the tracking.
> 
> Once the last VMA un-refs our tracking data, we'll do the untracking,
> which simplifies things a lot and should sort our various issues we saw
> recently, for example, when partially unmapping/zapping a tracked VMA.
> 
> This change implies that we'll keep tracking the original PFN range even
> after splitting + partially unmapping it: not too bad, because it was
> not working reliably before. The only thing that kind-of worked before
> was shrinking such a mapping using mremap(): we managed to adjust the
> reservation in a hacky way, now we won't adjust the reservation but
> leave it around until all involved VMAs are gone.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/mm_inline.h |  2 +
>  include/linux/mm_types.h  | 11 ++++++
>  kernel/fork.c             | 54 ++++++++++++++++++++++++--
>  mm/memory.c               | 81 +++++++++++++++++++++++++++++++--------
>  mm/mremap.c               |  4 --
>  5 files changed, 128 insertions(+), 24 deletions(-)
> 
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index f9157a0c42a5c..89b518ff097e6 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
>  
>  #endif  /* CONFIG_ANON_VMA_NAME */
>  
> +void pfnmap_track_ctx_release(struct kref *ref);
> +
>  static inline void init_tlb_flush_pending(struct mm_struct *mm)
>  {
>  	atomic_set(&mm->tlb_flush_pending, 0);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 56d07edd01f91..91124761cfda8 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -764,6 +764,14 @@ struct vma_numab_state {
>  	int prev_scan_seq;
>  };
>  
> +#ifdef __HAVE_PFNMAP_TRACKING
> +struct pfnmap_track_ctx {
> +	struct kref kref;
> +	unsigned long pfn;
> +	unsigned long size;
> +};
> +#endif
> +
>  /*
>   * This struct describes a virtual memory area. There is one of these
>   * per VM-area/task. A VM area is any part of the process virtual memory
> @@ -877,6 +885,9 @@ struct vm_area_struct {
>  	struct anon_vma_name *anon_name;
>  #endif
>  	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> +#ifdef __HAVE_PFNMAP_TRACKING
> +	struct pfnmap_track_ctx *pfnmap_track_ctx;
> +#endif

So this was originally the small concern (or is it small?) that this will
grow every vma on x86, am I right?

After all pfnmap vmas are the minority, I was thinking whether we could
work it out without extending vma struct.

I had a quick thought quite a while ago, but never tried out (it was almost
off-track since vfio switched away from remap_pfn_range..), which is to
have x86 maintain its own mapping of vma <-> pfn tracking using a global
stucture.  After all, the memtype code did it already with the
memtype_rbroot, so I was thinking if vma info can be memorized as well, so
as to get rid of get_pat_info() too.

Maybe it also needs the 2nd layer like what you did with the track ctx, but
the tree maintains the mapping instead of adding the ctx pointer into vma.

Maybe it could work with squashing the two layers (or say, extending
memtype rbtree), but maybe not..

It could make it slightly slower than vma->pfnmap_track_ctx ref when
looking up pfn when holding a vma ref, but I assume it's ok considering
that track/untrack should be slow path for pfnmaps, and pfnmaps shouldn't
be a huge lot.

I didn't think further, but if that'll work it'll definitely avoids the
additional fields on x86 vmas.  I'm curious whether you explored that
direction, or maybe it's a known decision that the 8 bytes isn't a concern.

Thanks,

-- 
Peter Xu

