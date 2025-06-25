Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872361C861D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750886488; cv=none; b=K9U360qIheiHl/asrpPL+f5Vy+tgQ/dSwOUpQttQn5RQCYkrSvF2lPM4LuYRaZcak+Kcq2WHbuYebUFd1WFklvzBnAd666UwiPqB/Qr6R0kp9EVLsP5x2QPG8/LzevSwX0U4+/xWyACWFgOehEh0OzoQKNRH/GPKkdRSyb49T7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750886488; c=relaxed/simple;
	bh=Pt21otXyXKEGcRzN7ZXaHM6yL89dud0yxfNpglElLZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flkl3iV94iEzy0x/m2Gqi2RrRHFS0Y6Zszjc+5+lsWokc6WgKxwTj17G7wJeW3lX2fNJOEkcgQGdGq1A2fwg+DITYPB2FiizGeJXk9C79FY/yo+wTgAGetIoPA07KhOHOD2dVayo7uLUV/H4zjMyxhRIS9hkpSE3HeMLXrhGxxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TMLy3/5S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TMLy3/5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750886485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Bj+UH922j662yX6trdmweqSKvM6gAaSUppg+VLEvbg=;
	b=TMLy3/5SknwcK2wy+UD7pK4V3INTEzTQwkU6lJWZ1Z2k3zHmNpTbCxTiwtRmnrG34VNPya
	kZ4IjNsuMfK5A6UMpujax0YYeNpmL6n5uvoynovGcX62aDc6b1ESV4mszrXFjjnKvb3mdi
	LMLz+o56OZmMrX/aGe/CKxH8fQniNX4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-WwhxUkkKPiK6WkzJTkuaCw-1; Wed, 25 Jun 2025 17:21:23 -0400
X-MC-Unique: WwhxUkkKPiK6WkzJTkuaCw-1
X-Mimecast-MFC-AGG-ID: WwhxUkkKPiK6WkzJTkuaCw_1750886482
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d4133a2081so34166185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750886482; x=1751491282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Bj+UH922j662yX6trdmweqSKvM6gAaSUppg+VLEvbg=;
        b=u1T2hqi4oRN71fBJQ03917zMlwSSMMnXHu4sFsPRhnCKFnTuJhud1UQ5acaDGF0qNa
         16Jmf9iAK/fLxW17FBOlB+DW/LKwvMtiVNE7aj8+vxXSC9cU9iRfKgxA5hob90zbQXnl
         1FB+HgvC8s8/bnZCzIxvbSvlNmxOIfCewSEk3znUS55+e8+KQ6hSG0SwlQpIe/PnLMdz
         wY+8G21cjNEjR03deCJek7UQ+toW8ORJrg4jB5myRMZ5CAjWES/67FOeuQbxqhY+3qI8
         KQ71kXel23wTWM52c6fe9wXRXNTJchYLi/RkPTBZorjQ4pwqPffHwKdq60PnFsY0HgVf
         0gPA==
X-Forwarded-Encrypted: i=1; AJvYcCW0Vg1XmwSMB+Zw37eIfCAn9q4GpxtszdFRL8ycvyAPvpKhODB5B17xAogtdJopmelKuYV9P35Bb8LtGkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4505DTSRHRS3CpqFgwLrKgSsswyo6IvsEAuO+b6vrHE/KwpqP
	hEkQZ+Z6GwnpUlIi/d5aFPhwrv96ImijWnmJMrRDlWFLLhf01mI9Ooo6xb8suwam3OsEYKse/E4
	sYQWK24ArG0ZAl5QyhTB4kt7odivb26TGhH+6+Lweg5JZffv963G2r/MeY1QYkjnKvw==
X-Gm-Gg: ASbGnctwHiDhglSN8HgouhNOiB8IlKAe1Odaa0XUXHnZ5sUg2Z+3uhg0BHYzxQqZgXy
	Nf9rFYZXHJSfG49WF+TwpB2EShhtwNWbKqfhgLie/Afzn4pLRYlM+rL40jgzUwkQKzrm/e4b0Yv
	pfgArZ8zOaT4hzEs3dHYKr/MrJU+Q/R8jppU11d6t2yoLoybD5+7A7qQAGZ+p57Cml9igXPpDXP
	caEb/eVpc3R9DQDJFKISfgusxmTdI9wAY/T9RM06zN6R8Jvb8KV/NubaOg8LoqTFknlHJ99x9lu
	NeialTRtbZ1COg==
X-Received: by 2002:a05:620a:5d93:b0:7d3:e88d:a1d4 with SMTP id af79cd13be357-7d43bb1ecffmr123872385a.33.1750886482280;
        Wed, 25 Jun 2025 14:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNYIcGDvsgyZRgWPZ6MPr0UkxoZuHovC8C6SCCnUYBwaF4pM2QCfqbsaAuKNSdMvQtNIOIBQ==
X-Received: by 2002:a05:620a:5d93:b0:7d3:e88d:a1d4 with SMTP id af79cd13be357-7d43bb1ecffmr123869485a.33.1750886481856;
        Wed, 25 Jun 2025 14:21:21 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99a5d14sm650843885a.35.2025.06.25.14.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 14:21:21 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:21:15 -0400
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Nikita Kalyazin <kalyazin@amazon.com>,
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
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 4/4] mm: Apply vm_uffd_ops API to core mm
Message-ID: <aFxoSzdDGRkYLyr2@x1.local>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <20250620190342.1780170-5-peterx@redhat.com>
 <CADrL8HVZccikHRZ+PP4EfKQBkgXZ0E9S3GFtwWVYLD2NMhg7EA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADrL8HVZccikHRZ+PP4EfKQBkgXZ0E9S3GFtwWVYLD2NMhg7EA@mail.gmail.com>

On Wed, Jun 25, 2025 at 01:31:49PM -0700, James Houghton wrote:
> > -static inline bool vma_can_userfault(struct vm_area_struct *vma,
> > -                                    unsigned long vm_flags,
> > -                                    bool wp_async)
> > +static inline const vm_uffd_ops *vma_get_uffd_ops(struct vm_area_struct *vma)
> >  {
> > -       vm_flags &= __VM_UFFD_FLAGS;
> > -
> > -       if (vma->vm_flags & VM_DROPPABLE)
> > -               return false;
> > -
> > -       if ((vm_flags & VM_UFFD_MINOR) &&
> > -           (!is_vm_hugetlb_page(vma) && !vma_is_shmem(vma)))
> > -               return false;
> > -
> > -       /*
> > -        * If wp async enabled, and WP is the only mode enabled, allow any
> > -        * memory type.
> > -        */
> > -       if (wp_async && (vm_flags == VM_UFFD_WP))
> > -               return true;
> > -
> > -#ifndef CONFIG_PTE_MARKER_UFFD_WP
> > -       /*
> > -        * If user requested uffd-wp but not enabled pte markers for
> > -        * uffd-wp, then shmem & hugetlbfs are not supported but only
> > -        * anonymous.
> > -        */
> > -       if ((vm_flags & VM_UFFD_WP) && !vma_is_anonymous(vma))
> > -               return false;
> > -#endif
> 
> Hi Peter,
> 
> Thanks for this cleanup!
> 
> It looks like the above two checks, the wp-async one and the PTE
> marker check, have been reordered in this patch. Does this result in a
> functional difference?
> 
> The rest of this series looks fine to me. :)

Thanks for the very careful review, James!

Yes that's a small tweak I did when moving. I don't expect to have any
functional change.  Maybe I should at least mention that in the commit log.

Here I did the movement because fundamentally wp_async depends on the pte
markers, so it may be slightly more intuitive to check pte markers first,
rejecting any form of file wr-protect traps.  Otherwise it may looks like
we could return the true for wp_async==true too early.  In reality IIUC it
can't happen.

For example, currently userfaultfd_api() has:

#ifndef CONFIG_PTE_MARKER_UFFD_WP
	uffdio_api.features &= ~UFFD_FEATURE_WP_HUGETLBFS_SHMEM;
	uffdio_api.features &= ~UFFD_FEATURE_WP_UNPOPULATED;
	uffdio_api.features &= ~UFFD_FEATURE_WP_ASYNC;
#endif

So when wp_async can be true above, pte markers must be compiled..  IOW,
above code clip should work identically with below lines:

    #ifdef CONFIG_PTE_MARKER_UFFD_WP
       if (wp_async && (vm_flags == VM_UFFD_WP))
            return true;
    #endif
    
    #ifndef CONFIG_PTE_MARKER_UFFD_WP
        if ((vm_flags & VM_UFFD_WP) && !vma_is_anonymous(vma))
            return false;
    #endif

Then it means both chunks of code cannot be compiled together.  The order
shouldn't matter.

But maybe I should just move it back as before, to save the explain and
confusions.  Let me know if you have any preference.

Thanks,

-- 
Peter Xu

