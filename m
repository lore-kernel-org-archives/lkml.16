Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35D61E2602
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173734; cv=none; b=oqJ3in4Kjw8mnVQE1sXZ5cWY7esb8LBnEKLfvQBthjZe3hYqXmDprNYWqTMqnaa/PH9aaF/MxHBeCZ0maYpIMr2uiMwmx/LJgDMuo1GQJbvfavC/b5yaULonD5HGaSUcjhqgu7B9yuhwMxaxepuL3pseEbatuq60bPUEPZWhIQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173734; c=relaxed/simple;
	bh=DLmaPxusCI/5vdPbi93xp/T2LRMb98SvKS9bKEOXGPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVLKjs/+kNnUdxi6ZteevRwVpLxsmXkhAaZw7tSiZ0AjTxDEN1xaCYBHdxYbqmgJRK/iw3v5ejJMsjCSXESudKSndLbCjNey65Dofa15CZMHW7y5u2S+Mc5D5lNVc8r1W+xRsR/JAicLqaimieGAqh4Kl96PME9kb/pPGZVzmtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=fJcN1pHp; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fJcN1pHp"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d3862646eeso352826885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750173732; x=1750778532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hAlJYdD693dMCPqgshGz2YSTkDAS4ntCvbnIFJeTdbU=;
        b=fJcN1pHpoEr2sGbri0CA/PAY4a+MsfINCtNv5AhIa22AZG/9WyieHNEZV9X/30nePU
         QHczTzx2BaseRIEvgS2yAWr41jcnOP4xAr2b7wqd7rMlHqnj4zPcR46ubo6cV0JD6Vgr
         YNuvyAqGvNDvMvAiuUXi3yUI24gZm2QhwZ+A8lb4UkdlwUsaJWHaqo4/KCV2b/ThWRJ9
         OifzVUTVLPaqqzEDevlK/eqJOI4dSrO5JsNtVeS4v8prfNe9kP5AFTu1gZAB+4c3QQB2
         lta0xeK3hWfohFGl076o90ssTnlt0lpGwiKBiqqLKD+27wrhIGXM0tBOm/DwQEVCZep4
         hQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750173732; x=1750778532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAlJYdD693dMCPqgshGz2YSTkDAS4ntCvbnIFJeTdbU=;
        b=d+GZf9iCGJCGzSCBdthWXVbZ6ZhC83X5fTubQHjf6ISRrOGJh8GAneFe/hN+9RrICT
         H21Ug7Qr6n0hjZsBQoKnJrTltePiBg4Pq/8ymwOjvu+08zsOr1H5mgv2nwvTZSrXt4YI
         7egUfMijziGgr12TvhDlEGVpegqVPT/mL6CgFsDFdibPH7kf0YM9whKVGyh2UOe/A10l
         z4K5tQk21BWo5SFponJouGHxBb8QnhV/UYpqz7drxsiPa4x1snQ3RgjzMwhtMmpwWGje
         0lKeW/Q9jm9Uk1a+WNKt4fRTnuBpz+o8NA3FcTi86ZMFT1msuIlCMBtB0QO4hdti1s+W
         PkIw==
X-Forwarded-Encrypted: i=1; AJvYcCXCGcyP7ODbTjv4uiYHHH+Ht9Xu0rITgk1oJpx71EyIInEVFcQe97xjAhFitd6jDVfD3cfYx2m7hwspcmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjT2ori43/Kiu84oBSBRm46gtafoG3LOF7MKOcjhMXj6lZ22kV
	j/N7vTeUowPwR/G9ZLlb9xwjc5b592Yw0XCnKPUmeI3c0duyIUeJqPC5KdZnwE9rc1w=
X-Gm-Gg: ASbGncvV3JuZwplqUWk/b6rciQZaQbWMyuW4v4y/sKILoohfcKDz33l+rrz+Ll4aCWG
	TnlQRtJBqjd+DVWR6lccUjgK8wl7LiUxAhZHBdr2WW+fHVMPub6xmHsmnekI2rEZqkzBkQZ6Ytj
	wUChXhg8jNMQ01WmCEXux4Glz1O+XuTdRe2KAFyyChk617Gr2I0AQEa/Mb+z76eadcNMZtsjusm
	S4HbaTMzfgHK0GcBXacwPwuwV3T2Vgf/MyzAitbTkml0sQGbAlLMXQnf0eaj1pX2+KBex1L39p9
	eXMSbWLgYSO6PIERB6snwhmjr6htsS3Dn3S2J+FAprLxXQCIYEtqlvQazvtYJPZMYtDUbUkK8H4
	OTI7Shtqvxxf6iG42fyL3SD0/6bneYhijcJjC1Q==
X-Google-Smtp-Source: AGHT+IHhOv68rhuOsFIfHaN5jjUV2xZjgW6ScWH+EgGxpcNazcuKo7y9IaAPOCSULwCgT+vyOmBzwA==
X-Received: by 2002:a05:620a:2989:b0:7d3:8f29:d1ac with SMTP id af79cd13be357-7d3c6c1e5f0mr2138020885a.19.1750173731683;
        Tue, 17 Jun 2025 08:22:11 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8f0b35csm660925385a.102.2025.06.17.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:22:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRY8Y-00000006VzD-2tNI;
	Tue, 17 Jun 2025 12:22:10 -0300
Date: Tue, 17 Jun 2025 12:22:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: lizhe.67@bytedance.com, alex.williamson@redhat.com,
	akpm@linux-foundation.org, peterx@redhat.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Message-ID: <20250617152210.GA1552699@ziepe.ca>
References: <20250617041821.85555-1-lizhe.67@bytedance.com>
 <20250617041821.85555-3-lizhe.67@bytedance.com>
 <20250617134251.GA1376515@ziepe.ca>
 <460e16a0-c8d9-493a-b54f-2c793c969eb1@redhat.com>
 <21958961-259f-4520-ae60-e234383945d7@redhat.com>
 <ccabb051-e645-4a6c-8357-64a2640289c1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccabb051-e645-4a6c-8357-64a2640289c1@redhat.com>

On Tue, Jun 17, 2025 at 04:04:26PM +0200, David Hildenbrand wrote:
> On 17.06.25 15:58, David Hildenbrand wrote:
> > On 17.06.25 15:45, David Hildenbrand wrote:
> > > On 17.06.25 15:42, Jason Gunthorpe wrote:
> > > > On Tue, Jun 17, 2025 at 12:18:20PM +0800, lizhe.67@bytedance.com wrote:
> > > > 
> > > > > @@ -360,12 +360,7 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
> > > > >     	for (i = 0; i < npages; i += nr) {
> > > > >     		folio = gup_folio_range_next(page, npages, i, &nr);
> > > > > -		if (make_dirty && !folio_test_dirty(folio)) {
> > > > > -			folio_lock(folio);
> > > > > -			folio_mark_dirty(folio);
> > > > > -			folio_unlock(folio);
> > > > > -		}
> > > > > -		gup_put_folio(folio, nr, FOLL_PIN);
> > > > > +		unpin_user_folio_dirty_locked(folio, nr, make_dirty);
> > > > >     	}
> > > > 
> > > > I don't think we should call an exported function here - this is a
> > > > fast path for rdma and iommfd, I don't want to see it degrade to save
> > > > three duplicated lines :\
> > > 
> > > Any way to quantify? In theory, the compiler could still optimize this
> > > within the same file, no?
> > 
> > Looking at the compiler output, I think the compile is doing exactly that.
> > 
> > Unless my obdjump -D -S analysis skills are seriously degraded :)
> 
> FWIW, while already looking at this, even before this change, the compiler
> does not inline gup_put_folio() into this function, which is a bit
> unexpected.

Weird, but I would not expect this as a general rule, not sure we
should rely on it.

I would say exported function should not get automatically
inlined. That throws all the kprobes into chaos :\

BTW, why can't the other patches in this series just use
unpin_user_page_range_dirty_lock? The way this stuff is supposed to
work is to combine adjacent physical addresses and then invoke
unpin_user_page_range_dirty_lock() on the start page of the physical
range. This is why we have the gup_folio_range_next() which does the
segmentation in an efficient way.

Combining adjacent physical is basically free math.

Segmenting to folios in the vfio side doesn't make a lot of sense,
IMHO.

Jason
