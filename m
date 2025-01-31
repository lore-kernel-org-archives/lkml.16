Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3AE1E9B38
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343164; cv=none; b=lzRrrak1Hqy7UhzqanDLa5E/LyFgQzAbWG4gof5cQS1vweBAtSPoi6oe5EvtN7PF6ciiigaqq+WRPKl7CnbKZNxRTWem8++l80nER4nG3/0hKe9gcCsaZhJLSbqVRrPwMg3zTMcyC7siHtpwLLCNaev+mYCk5ZHQaNPSKB80X2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343164; c=relaxed/simple;
	bh=eVYz0IAaPzlS9RjP5Ytk3MNZyadk1DKbSwYK1N+sVWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AufueTjxZ2zZw5aoJJLgP/m5abJgOit2F90ye778WT5PUhUN1VfjHv2obhizH5ergLo5/V2DiDHC7d5yL9qDTM6eBotQHWBCK9mWaCJpRJwtzlPmPakhX8/Ck5YxBLg3VNzcGhKkJBPlE0+8hTim3DW9lmdtIgrOYYO4h4LQLDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=XKmSuL+q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="XKmSuL+q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso21804135e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738343161; x=1738947961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+G4waO4iWi5ppsP27MVzR5EHmBlY2mxPNF1CuedbFM=;
        b=XKmSuL+qms2JniBDZOBCpTcsUQ28XCqYHNEGDSOb1dwm40H4slaWxiRyys+mD4N2oT
         Olh/CVhy8RbSOVK/YTIt+ZzWaC9ZnDZTZVBkGr2bl/k38Rn9NSl01KYcQJTugnmWmodz
         NQ2jPoKa/APZ/UzFdgsWdtGEGu293+rXHsrbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343161; x=1738947961;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+G4waO4iWi5ppsP27MVzR5EHmBlY2mxPNF1CuedbFM=;
        b=hh0TuGOIlS4kVhwrb6b9hXLTE3H3QEhlRMxABWpHAFcIsARcSxkBRqO2lzcd2k7lsY
         nGKg5LjbeVXhyprT5TddywQ4HbWjjB/6/j22lLiv/Co65RnIvbQz/uWUnc9UcYLy+3A7
         7FdEQqg5GbuTt6hQrKwO/ymC2V4VaXrEARhsWvNDs63t9KWM2AH7JBN94SyBTifCTOpq
         eTUwh1YkpSJKKlxm8/CuuqK5gxH9w05OUdMU8JEcJXJZ8eXRGbbLcO0UW7YVy/G3P2SQ
         KtL/jA/4BadRtQT0dXur5/4E/Vat60MdB+4BH5H0lvyr3X/hhndJwxBxLEmVoSj16PFl
         tAow==
X-Forwarded-Encrypted: i=1; AJvYcCWaicHXM7ZQeE/ZqeuBqcjrSyptshDNiBZqXSAzx8eNxoYzj1szYBUChkAC+5vindI1kjnSSmE4RIncyWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOoqXlyWV0U0u0N0Tof6eE7lRI5auP5dNzFjiJq4pIs6Hv2AmT
	J4GK8NY79sdMdFej1l3ZBlYeVMxCO/rHDWIKfJ7bPZEM/ED7MheMNbdXFwuyDnk=
X-Gm-Gg: ASbGncvTk3XhttHaL4+P67PQPrMg9lFb6wzCM8YtsnMrzc8XKLlcwAgeCSa5b+aRvlA
	xgKG1LzVBtTyhhSb3APsKxvcuwLb+nCBsIE33gKwSRZM84dg7yulvYUGyYk+/u4c02v+bJhXEi/
	RtcGOR+TSXv8y106gfoSwuswAahr8jlh9NNVi4SC2Liu6oxiLU4XRgjdaTPGTOQyFtOmV7NabgT
	Jr5BUERbkCsjg53TAOcsde3dmzpBmwqSOllNknZxT8rknROFBpFQqS3GEWvyAcXWTeDZFy/EFPQ
	hvsV9laxoocDu+DzQGCfRvP5anw=
X-Google-Smtp-Source: AGHT+IHqJ7SXWObwA7TE2hNt8h99Mz+Rh4lA4VBEyCv4JI/V7wPQqHQuFCcfla/1mLYWhuuiSze4/A==
X-Received: by 2002:a05:600c:83c6:b0:434:f2af:6e74 with SMTP id 5b1f17b1804b1-438e170e7b5mr73728995e9.15.1738343161267;
        Fri, 31 Jan 2025 09:06:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23e5e53sm60120095e9.17.2025.01.31.09.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:06:00 -0800 (PST)
Date: Fri, 31 Jan 2025 18:05:58 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: David Hildenbrand <david@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Message-ID: <Z50C9tyZC_wQS6Ux@phenom.ffwll.local>
Mail-Followup-To: David Hildenbrand <david@redhat.com>,
	Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, nouveau@lists.freedesktop.org,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20250129115411.2077152-1-david@redhat.com>
 <20250129115411.2077152-6-david@redhat.com>
 <Z5tLmYOQaZrdWQHN@phenom.ffwll.local>
 <2670f65f-e973-483e-aed6-526d00125ad7@redhat.com>
 <Z5t4rrkRiOsRY2jH@phenom.ffwll.local>
 <z7s7xb2ftv5hqg3uzjqkou6enguleazwwehxbi5zulbkar2aej@zlbdh2kdewdn>
 <d552cc03-b7af-44be-bcaf-13da720a2226@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d552cc03-b7af-44be-bcaf-13da720a2226@redhat.com>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Fri, Jan 31, 2025 at 11:55:55AM +0100, David Hildenbrand wrote:
> On 31.01.25 00:06, Alistair Popple wrote:
> > On Thu, Jan 30, 2025 at 02:03:42PM +0100, Simona Vetter wrote:
> > > On Thu, Jan 30, 2025 at 10:58:51AM +0100, David Hildenbrand wrote:
> > > > On 30.01.25 10:51, Simona Vetter wrote:
> > > > > On Wed, Jan 29, 2025 at 12:54:03PM +0100, David Hildenbrand wrote:
> > > > > > Let's do it just like mprotect write-upgrade or during NUMA-hinting
> > > > > > faults on PROT_NONE PTEs: detect if the PTE can be writable by using
> > > > > > can_change_pte_writable().
> > > > > > 
> > > > > > Set the PTE only dirty if the folio is dirty: we might not
> > > > > > necessarily have a write access, and setting the PTE writable doesn't
> > > > > > require setting the PTE dirty.
> > > > > 
> > > > > Not sure whether there's much difference in practice, since a device
> > > > > exclusive access means a write, so the folio better be dirty (unless we
> > > > > aborted halfway through). But then I couldn't find the code in nouveau to
> > > > > do that, so now I'm confused.
> > > > 
> > > > That confused me as well. Requiring the PTE to be writable does not imply
> > > > that it is dirty.
> > > > 
> > > > So something must either set the PTE or the folio dirty.
> > > 
> > > Yeah I'm not finding that something.
> > > 
> > > > ( In practice, most anonymous folios are dirty most of the time ... )
> > > 
> > > And yup that's why I think it hasn't blown up yet.
> > > 
> > > > If we assume that "device-exclusive entries" are always dirty, then it
> > > > doesn't make sense to set the folio dirty when creating device-exclusive
> > > > entries. We'd always have to set the PTE dirty when restoring the exclusive
> > > > pte.
> > > 
> > > I do agree with your change, I think it's correct to put this
> > > responsibility onto drivers. It's just that nouveau seems to not be
> > > entirely correct.
> > 
> > Yeah, agree it should be a driver responsibility but also can't see how nouveau
> > is correct there either. I might see if I can get it to blow up...
> 
> (in context of the rmap walkers) The question is, how do we consider
> device-exclusive entries:
> 
> (1) dirty? Not from a CPU perspective.
> (2) referenced? Not from a CPU perspective.
> 
> If the answer is always "no" to all questions, then memory notifiers must
> handle it, because we'd be answering the question from the CPU point of
> view.
> 
> If the answer is always "yes", there is a problem: we can only make it
> clean/young by converting it to an ordinary PTE first (requiring MMU
> notifiers etc.), which makes it quite nasty.
> 
> Mixed answers are not possible, because we don't know just from staring at
> the entry.

I think it's the gpu's (or whatever is using it) responsibility to update
folio state while it has ptes pointing at memory. Whether that's
device-exclusive system memory or device-private migrated memory. Anything
else doesn't make sense to me conceptually.

And I don't think we can just blindly assume even for device-exclusive
mappings that they will be dirty when we convert them back to a real pte,
because we might have raced trying to set up the gpu mapping and restarted
before we even put the pte into place. Or maybe someone was real quick at
writing it back after the gpu already dropped it's pte.

I guess maybe some clear documentation in all these functions
(make_device_exclusive, hmm_range_fault, migration helpers) that it's the
drivers job to dirty pages correctly would help?

But nouveau definitely does not look very correct here, pretty sure on
that.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
