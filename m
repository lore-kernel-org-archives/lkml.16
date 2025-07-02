Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDAC2D94BB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476817; cv=none; b=fq81YJPDbtWWBFNIUbtyoXZjhw4FlsYYXr0BCbidiwfvWbNna5DL1qYSvkj1Tnly0/QzN0aN5YgqBrcGBsvPqUlWEFAAdU3wDJLpp07ne3ZRFSKZAQAo04Gb9g3F7chwqL6Q3pZgyK8ihCLJv2B6B+55SvLJb0dmNA0bpHt0fhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476817; c=relaxed/simple;
	bh=FWRZKvWiItvy6hxJjRoYrslXi/LBIi5lbHx16cmY1qc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n88r6Q8BwX44uo8NJliY3y3rix96tcVu/OD9EM+TVteUGjOlBYHpk2Iua6/ds0UTuza7ni/FicmAHe9yKIL4hYOdpO8k6J6ffnT1iikCdzhrhd7P+qVvqNv2sbScumwsmy5hjodfzP5N5qpHXeh0tB46B2bbhvhWkGVCgwZ+/BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LquZRlGE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LquZRlGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751476812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X4OXeIMkVHqZr0TmFdZKIZ9QEBYkowbL9PbKefie20c=;
	b=LquZRlGER+W1FUq65Cp1l/yTXkW9C5sdE1SifHF/sPLTWmNDC2/905FC8Gsb30/HhqMwGj
	cuECMdJdEVQY96aI4hNvkgDnAAOfpymX74b4l0Z8AVEV8XGgiAq95v2m+bR7oJH9iP6qHG
	xIfmzaiBagbeTViJB4K04udjBdupMKs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-QCt6uVYNNYKR8whtD2Wpdw-1; Wed, 02 Jul 2025 13:20:10 -0400
X-MC-Unique: QCt6uVYNNYKR8whtD2Wpdw-1
X-Mimecast-MFC-AGG-ID: QCt6uVYNNYKR8whtD2Wpdw_1751476810
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3f0958112so1045358585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476810; x=1752081610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4OXeIMkVHqZr0TmFdZKIZ9QEBYkowbL9PbKefie20c=;
        b=XqBnPDwTWKamzMCoZ75FQdpWXx89wdL9j/fHRXgT8539VI1xnesAkL+HaFGBnk3fqp
         ZojPdN76M9uBog3UWzTmOdv1vZ1V77FN+VY2TS2VcIZgV4S+LM4FCMIed0k56DryfWu+
         FAobYxx3mHvJ+9h60EEJ/Na3Z0CKwvaOFnNXEpVoqOVmkuacGlC11LSFeOk4p+n9NyVq
         rIfyUoFJ/oAE4Jw7BrUJiusQKfviL96jdw1fTmitMemGX7acaVGp+lkt7hpHkPD8J6Mw
         u9dY8RQSEWDR27r8O71TuBX4eT+ZLp8KseGnROacz/A9+cSXYneFvMsAOTZ+cwbADcrz
         pYaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYyvGTRW889zFux1sV5wFAvYRP3COiL8psnX+NLsQ/COnmci6BhOZmz5pYCOgIuVIAnWOecl9XwSyaSFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsYgT0tqYASm6mXGa0Ihf4QbyHbH2KI/cr5lQLnITP+X9GpESt
	tmUdXRh3nJC49e4ztE+Cl/0SL4y7OnqgmcB2SDNtF4PfxKmSStBL7kTU4mio8b9BeZdUSuJCTxo
	3OO5Rok9u10vimWTte+1Mht6xIcsIy1S+y/G1zivPWSoZ9ZSMILUTDvEC1+XedzjBbg==
X-Gm-Gg: ASbGnct0xKl+XolxIqLCODD5sdXoB7fzdpR9Bt50N+oOEDQpjQIUAwOe5sEw/gXlvQV
	3NuINg3wL4j85OgRtNd4izIr+G0/PqCUlC2Y7iu9RxoHNDvxVSRISPZhseTKcwq61WsuhouMM7b
	uLAaucnVSvJev5TKdxn8WELWOs/6qMDxPb2tezvj7x+ZTbOwDzSIp6W33wGAOtOLPhe1noBnC/R
	OqSAuKmJ3c/Xh9/Ki+bGw0rVWvC3sR4j7KgLpYS2ZCOFL7ZZJYZEgK9wS5UqBdgKIZkFc9FCWFi
	djg8h8u/bk9jUA==
X-Received: by 2002:a05:620a:2493:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d5c462ac6bmr497721585a.0.1751476810087;
        Wed, 02 Jul 2025 10:20:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEABzvdSXcUcA35EvmAadp6Gl0tgp7duV0eKH1z56ocBWqywdOnkcWFAdC7968vXYiaa2gJNQ==
X-Received: by 2002:a05:620a:2493:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d5c462ac6bmr497717285a.0.1751476809650;
        Wed, 02 Jul 2025 10:20:09 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443134f32sm971947685a.12.2025.07.02.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:20:09 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:20:05 -0400
From: Peter Xu <peterx@redhat.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] mm/hugetlb: Remove prepare_hugepage_range()
Message-ID: <aGVqRQKWu9IDVwk6@x1.local>
References: <20250627160707.2124580-1-peterx@redhat.com>
 <jjwzfnbz7uzuniwd2qc6prfg4sboa7dnjswnbeotjbaqngbs6s@2y42bsqcjpv6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <jjwzfnbz7uzuniwd2qc6prfg4sboa7dnjswnbeotjbaqngbs6s@2y42bsqcjpv6>

On Mon, Jun 30, 2025 at 10:26:13AM -0400, Liam R. Howlett wrote:
> * Peter Xu <peterx@redhat.com> [250627 12:07]:
> > Only mips and loongarch implemented this API, however what it does was
> > checking against stack overflow for either len or addr.  That's already
> > done in arch's arch_get_unmapped_area*() functions, even though it may not
> > be 100% identical checks.
> > 
> > For example, for both of the architectures, there will be a trivial
> > difference on how stack top was defined.  The old code uses STACK_TOP which
> > may be slightly smaller than TASK_SIZE on either of them, but the hope is
> > that shouldn't be a problem.
> > 
> > It means the whole API is pretty much obsolete at least now, remove it
> > completely.
> 
> Thanks for rewording this change, apologies for the late response on
> your change log.  I think it's fine.

That's totally OK, thanks for keeping an eye.

> 
> I think the only meaningful difference is that the failure would have
> aborted entirely if stack_top - len < addr, but with this change it will
> attempt to search in the opposite direction.  Unless I missed something?

IIUC the prepare_hugepage_range() API shouldn't affect the direction of VA
allocation yet, but rather a (likely proven unnecessary by this patch) way
to fail fast for hugetlbfs for no good reason.

It is currently only invoked with MAP_FIXED, and if it returns 0 it'll
further move on to the core VA allocator.  Then the allocation can happen
either TOP->DOWN or DOWN->TOP.

So "stack_top - len < addr" check is meaningful no matter if MMF_TOPDOWN or
not, because we want to make sure it won't overflow in any direction.  It's
just that it's already covered at least by the two archs providing this
hugetlbfs specific hook.

> 
> I suspect that this wasn't meant to happen in the first place anyways,
> and I bet there are no tests for it and no real-world harm in changing
> an error scenario into a potential successful mapping.

Yes, checking stack for hugetlbfs so far just looks redundant.  Maybe keep
digging the history we may found why we had it before, but so far it looks
not useful at all.

> 
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Thanks,

-- 
Peter Xu

