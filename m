Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8961C84D2
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750699242; cv=none; b=M83mqwcEpRGxZIX39auF3M6uNXdE/FNd46kayAdNabWQq8nGVMEkRvv8HraLB2EWdh/i5Bm49N3w/ftAX7ZULmFXx4eXENWv/VBSX38in0HWtfu/RzzkMFsvf+Hbklc9DYFN8Ekr4a/Bgok2N2ZL7tqfsWKqfnwH1AoT1MS/qiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750699242; c=relaxed/simple;
	bh=ol71yk5Hcmk0NhGEqwcSe1fTrTOdq3bwG64vkdTfS60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plDZdezMFft18o0DYpNd/xRx+DV7p0F7/Yk37Igu/Uhkk8Z94QuR1AhoXiuimVu1/i4cHXlr+EKt+BJNIPq8PS5B+WZDLmVMXJwAPMiIpg5xHudKC5UVH3zWqleoINaIJs8A4+FY9Xji23pAN7LkCk00FvUbC+7MM+b7WKI0Htk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A/Mlnk+m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A/Mlnk+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750699239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FUTCLfxa/GJlejCeDGSbw2C8zKhkZlTCU7NYv1Imp18=;
	b=A/Mlnk+moDXGa/cAn+a02NnnjxUqhtp4k1tc4tofc/ENsafAvusOakAnNOJdqFE5HYHN8D
	VneX+7GXWNqDl7GBYVSMUjg8PhvTHytilIBseFXnZ93Datjw2ZPe1d9xgUbIVOLE/EOjKm
	FOdjw+7M3eMUs3sF29H1UcMIeH5nnyM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-HvazVdnOMXyttGFPGOIYOw-1; Mon, 23 Jun 2025 13:20:38 -0400
X-MC-Unique: HvazVdnOMXyttGFPGOIYOw-1
X-Mimecast-MFC-AGG-ID: HvazVdnOMXyttGFPGOIYOw_1750699238
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a44e608379so131764781cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750699238; x=1751304038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUTCLfxa/GJlejCeDGSbw2C8zKhkZlTCU7NYv1Imp18=;
        b=HyPMcN/pxLi6/PmWsgfKsB7HPI4NHIxs19C3uq3iMWJx3Hn7MZf25gUmIScwMZwRbs
         OxK6wNLiZF9de2UO/4/u4EhCekshEwbaCBxdFsGxtsRke+eM87Ki1Hg4edu21VcgrbyG
         pi6YLiJcuFLZ92um40JyZ4GzOX+I9liGDThfozjzLpkqlSpOfFahS8pGtSgS1Xmso5Hg
         9Axqvs+mx15RUfcr1RK2kzQKhB5WdSWk0tFvSm6gHWWEreR87QTqpR7Ks2cpbbUmv0UT
         8HcB1+KIdyJHCmavB0oRp9zbTUq3ctLcPQkKpIe72rrfTorGIAgk5TV5fb4SvPerZp4t
         Ejng==
X-Forwarded-Encrypted: i=1; AJvYcCUXE0DWGtzVN/1SaxpiZOeMwOpPX90shYwBzpRIb1fNQdHXGhFIFCRyey0/jgKHCGyzA48bQYkugxtkJ+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrp+W4SNKy27Z+idXlqa55id4x+C7BQazam+cwEWxC0CAVdA7L
	QHtajt9UbtjklIIwZR3eXOzy3y6E44N/MYT1RKY22QPjYnN+cw4jOGQ0zV9WomjBoYldR7/F0tJ
	p9EyF5xdjheYQ4txux8Kj2GpFacb2OjDbTXUEJ5DRNg6MHTOie9bSZ9RpdnunuGEkqw==
X-Gm-Gg: ASbGncvt4MkzAVk2W+TeEZ55gus0NPJrUQ6a8VQXBt2lT/jRyazEBx3T8UZR/cO3pt1
	ZdfP5HTTPdr7KhHGzY20EalWx8hWIl8Oc7IZhBVq8UonB36LzuoKOpjlWrdA49biPRIfHXuGg5X
	6beXmzHF3563GDtsYW8Lfe8m8Oc5g1SXX77C8AGp1NcxClL5RgFPDhM+Z76fxk4YjKhqtlfU5hn
	n/dT083tp/E/+bFEApIfc2/5TpjKWqoqsC4AgKLQm0lK8AFaUTqtzKHwXyXT58sKMX/tOwDLSX7
	h/FWcjihTbrcAQ==
X-Received: by 2002:a05:622a:81:b0:4a4:2d36:51cc with SMTP id d75a77b69052e-4a77a24bc8dmr232678311cf.14.1750699237606;
        Mon, 23 Jun 2025 10:20:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4wi9tQAc/9yif3JCRlqRs0yHTLl1j19VTwOMdX0XNBBM+LuCzlVmiA8DDT3807WworT2SIg==
X-Received: by 2002:a05:622a:81:b0:4a4:2d36:51cc with SMTP id d75a77b69052e-4a77a24bc8dmr232677781cf.14.1750699237252;
        Mon, 23 Jun 2025 10:20:37 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e5d262sm40388491cf.50.2025.06.23.10.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:20:36 -0700 (PDT)
Date: Mon, 23 Jun 2025 13:20:33 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
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
Subject: Re: [PATCH 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aFmM4XXTC6gEmdR-@x1.local>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <20250620190342.1780170-2-peterx@redhat.com>
 <1e6fcebf-f74e-46ad-912b-d7df13527aea@redhat.com>
 <aFld0LpB429q9oCT@x1.local>
 <0126fa5f-b5aa-4a17-80d6-d428105e45c7@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0126fa5f-b5aa-4a17-80d6-d428105e45c7@redhat.com>

On Mon, Jun 23, 2025 at 06:50:42PM +0200, David Hildenbrand wrote:
> On 23.06.25 15:59, Peter Xu wrote:
> > On Mon, Jun 23, 2025 at 10:25:33AM +0200, David Hildenbrand wrote:
> > > On 20.06.25 21:03, Peter Xu wrote:
> > > 
> > > Hi Peter,
> > 
> > Hey David,
> > 
> > > 
> > > > Introduce a generic userfaultfd API for vm_operations_struct, so that one
> > > > vma, especially when as a module, can support userfaults without modifying
> > > 
> > > The sentence is confusing ("vma ... as a module").
> > > 
> > > Did you mean something like ".. so that a vma that is backed by a
> > > special-purpose in-memory filesystem like shmem or hugetlb can support
> > > userfaultfd without modifying the uffd core; this is required when the
> > > in-memory filesystem is built as a module."
> > 
> > I wanted to avoid mentioning of "in-memory file systems" here.
> 
> I thought one of the challenges of supporting guest_memfd on anything that
> is not a special in-memory file system is also related to how the pagecache
> handles readahead.
> 
> So ...

See uffd_disable_fault_around(). We should make sure no such happens into
pgtables when some special type of file is suppoorted, if it ever happens,
besides shmem.  IIUC readahead on page caches are fine for non-MISSING
traps.  So a file can support MINOR, for example, but then it'll also need
to make sure all those aspected are well considered.

> 
> > 
> > How about an updated commit like this?
> > 
> >    Currently, most of the userfaultfd features are implemented directly in the
> >    core mm.  It will invoke VMA specific functions whenever necessary.  So far
> >    it is fine because it almost only interacts with shmem and hugetlbfs.
> > 
> >    This patch introduces a generic userfaultfd API for vm_operations_struct,
> >    so that any type of file (including kernel modules that can be compiled
> >    separately from the kernel core) can support userfaults without modifying
> >    the core files.
> 
> .... is it really "any file" ? I doubt it, but you likely have a better idea
> on how it all could just work with "any file".
> 
> > 
> >    After this API applied, if a module wants to support userfaultfd, the
> >    module should only need to touch its own file and properly define
> >    vm_uffd_ops, instead of changing anything in core mm.
> > 
> >    ...
> 
> Talking about files and modules is still confusing I'm afraid. It's really a
> special-purpose file (really, not any ordinary files on ordinary
> filesystems), no?

One major reason I wanted to avoid the term "in-memory" is that we already
support most of the files on WP_ASYNC, so emphasizing on in-memory might be
misleading, even though WP_ASYNC isn't much taken into the picture of the
vm_uffd_ops being proposed.

The other thing is, besides the original form of userfaultfd (which is the
MISSING traps), almost all the rest (sync-wp, continue, poison, maybe even
MOVE but that's still more special) should be at least logically doable on
most of the files like WP_ASYNC.  When proposing this API, I wanted to make
it as generic as possible when people reading about it.  Hope that makes
sense.

Thanks,

-- 
Peter Xu

