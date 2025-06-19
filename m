Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC9D23534D
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344911; cv=none; b=AP5J9eI1zF3TQs+kufUrn7Fmi31Z3Ess1a1JVnKicaJdPL6dzA3GjR3cSUzil3lrbIb/62/NoCZSrUdtJa1WzkcKvYgW2uvq8IjxKfiBAN5GFNn+j8be4ers6uutfp7S4TsM9s7pqu73mYKmuFQaLbrbRkuc3lvxpxCoioBw/sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344911; c=relaxed/simple;
	bh=lSpTfIEsz9+Pa1rTiqnA01KZPNUjGiqXdkwSBDLfJFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YY4PffVBr8L0Vcu2VCu3rMnebqh2CLK1cBZaI43Xvz630KKqXK2V3WAuKoq29/Pi5fQuHbZyjaDMRLBo9xpzVnBWaVS+ECENOQ6GWcry1ecUv9MGIx2GrOsJ02sJkUiVs85wJmwVvN7DCGRAkGhXwOpzGYkDZtSHpskjPCBvWs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJXPnl5J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJXPnl5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750344908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+nIR3s6WyChuWWIwaj4SIlo+aTHkYFJ52GIb7pLAwAo=;
	b=bJXPnl5JaymmlmghqWo5tRhPWk6hx/q8DhbX47xyvX5OoyLR/CpOQYaB77JA5aZvI0vEuo
	wRqXyN8Yahc7f6VinmlwMkMF3W9jVBfqGC4Uy9rs/lUlkDJQw3nj/tnWhlQMWs1U+GqHPP
	oGDE6astKiP5hKgcqHUr1xBANAXi1Hk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-s41I5RFgNj6vaEJIu-NyLw-1; Thu, 19 Jun 2025 10:55:06 -0400
X-MC-Unique: s41I5RFgNj6vaEJIu-NyLw-1
X-Mimecast-MFC-AGG-ID: s41I5RFgNj6vaEJIu-NyLw_1750344906
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ceb5b5140eso139346785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344906; x=1750949706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nIR3s6WyChuWWIwaj4SIlo+aTHkYFJ52GIb7pLAwAo=;
        b=seXsE7UMz9R7Mo+Jh9RC0/Iom0EBOJTFWlEorZcjRAfzpRwUjbvfqurMUsvcV9/XON
         /F1IDgCmc6rGNEToWYRjq3z0vuDbNcfvgvscSvinNrhtuU2ELsT/ExavZ7WojBKLl0o0
         RO+bxJyCr2XNs3m6W1B6WNsTZQJTMHf570oJtG3fZ5u0nvbSgBlwGJtnhiweNpQdYMlC
         W2BIMuA+HPqxDQa2c2Irv8aTHDUhfC6C2tuqjAnTGAvXKL6n8L6CM7609GTrfXXkbQHP
         C+ihAtLwFCu1ZLjp6da+8ysgqvP9SJjxv6h4FFnuJEjEXNvSKW7vpXrvg8ngU3IOmgxP
         mN0A==
X-Forwarded-Encrypted: i=1; AJvYcCX9DsoGWXoNZ6h6Qesu/mq2rq4LSBCvs5YaCnaiWUoJlKEcuAoE2mosfE4Lvc0KneqP5WTWTeKvYobGvpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp9oLB7F8HXNEFflybbxwVelh/7g+lqcCYJl86/uhXS9c0kgLh
	FvkMRDGdLV18+nXLji38rXnkZDyUtpNs75rHMR9cAylMUuPCDyKNY6QfXQI21FcrouKkuVg7l1y
	hmkY88Bjutt/Yj/v+XBg1v6suVSN6KClVqIS/8Vr39fEz4NUrkwb3pF2xHlQPloF0eQ==
X-Gm-Gg: ASbGnct6GJpbU8BPc5Q7GP4rCQ1WVFa49y/P4TTXNn1TD66+qpUBgLep7W0fmVSmSHJ
	N4naCRZ9TWhjmTAEkmeF4lkVYSe1VoMU43QhoTOmNrNx0Dacmy3rnBJ/Wp+Fc9L3D+Yj5+jp8RN
	0N5yQlYpI/9ZeXGnJHD1Vnxkw2j6u7PenUTIhVxool6jm8K2/2gFUvvlt/nrw/kSRYr+O3z7Q0d
	eECPIutqJRWNHGppX3D0J35FBscSqkd7Bsc8simWtpcrWdIxt1ACdom1CRAFzBLYzGhuxaVo2RF
	fMSpW4kCcyzpqg==
X-Received: by 2002:a05:620a:40cb:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3c6c0d376mr3689365785a.8.1750344905706;
        Thu, 19 Jun 2025 07:55:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFzfYtvhWciWVVF5GyT6JlUpid1yuToLPfDm2d7WEu2TrPd8D0c+sMxu0V7+LQLYejLfKHqA==
X-Received: by 2002:a05:620a:40cb:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d3c6c0d376mr3689362885a.8.1750344905302;
        Thu, 19 Jun 2025 07:55:05 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f8e5ac5esm4759385a.79.2025.06.19.07.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:55:04 -0700 (PDT)
Date: Thu, 19 Jun 2025 10:55:02 -0400
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
Message-ID: <aFQkxg08fs7jwXnJ@x1.local>
References: <20250613231657.GO1174925@nvidia.com>
 <aFCVX6ubmyCxyrNF@x1.local>
 <20250616230011.GS1174925@nvidia.com>
 <aFHWbX_LTjcRveVm@x1.local>
 <20250617231807.GD1575786@nvidia.com>
 <aFH76GjnWfeHI5fA@x1.local>
 <aFLvodROFN9QwvPp@x1.local>
 <20250618174641.GB1629589@nvidia.com>
 <aFMQZru7l2aKVsZm@x1.local>
 <20250619135852.GC1643312@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250619135852.GC1643312@nvidia.com>

On Thu, Jun 19, 2025 at 10:58:52AM -0300, Jason Gunthorpe wrote:
> On Wed, Jun 18, 2025 at 03:15:50PM -0400, Peter Xu wrote:
> > > > So I changed my mind, slightly.  I can still have the "order" parameter to
> > > > make the API cleaner (even if it'll be a pure overhead.. because all
> > > > existing caller will pass in PUD_SIZE as of now), 
> > > 
> > > That doesn't seem right, the callers should report the real value not
> > > artifically cap it.. Like ARM does have page sizes greater than PUD
> > > that might be interesting to enable someday for PFN users.
> > 
> > It needs to pass in PUD_SIZE to match what vfio-pci currently supports in
> > its huge_fault().
> 
> Hm, OK that does make sense. I would add a small comment though as it
> is not so intuitive and may not apply to something using ioremap..

Sure, I'll remember to add some comment if I'll go back to the old
interface.  I hope it won't happen..

> 
> > So this will introduce a new file operation that will only be used so far
> > in VFIO, playing similar role until we start to convert many
> > get_unmapped_area() to this one.
> 
> Yes, if someone wants to do a project here you can markup
> memfds/shmem/hugetlbfs/etc/etc to define their internal folio orders
> and hopefully ultimately remove some of that alignment logic from the
> arch code.

I'm a bit refrained to touch all of the files just for this, but I can
definitely add very verbose explanation into the commit log when I'll
introduce the new API, on not only the relationship of that and the old
APIs, also possible future works.

Besides the get_unmapped_area() -> NEW API conversions which is arch
independent in most cases, indeed if it would be great to reduce per-arch
alignment requirement as much as possible.  At least that should apply for
hugetlbfs that it shouldn't be arch-dependent.  I am not sure about the
rest, though.  For example, I see archs may treat PF_RANDOMIZE differently.
There might be a lot of trivial details to look at.

OTOH, one other thought (which may not need to monitor all archs) is it
does look confusing to have two layers of alignment operation, which is at
least the case of THP right now.  So it might be good to at least punch it
through to use vm_unmapped_area_info.align_mask / etc. if possible, to
avoid double-padding: after all, unmapped_area() also did align paddings.
It smells like something we overlooked when initially support THP.

Thanks,

-- 
Peter Xu

