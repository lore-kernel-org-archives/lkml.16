Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A021C84C3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880736; cv=none; b=pOUqYc0NzkNpbSCL6yEPTaqsGd17i5HfxProsqyqTUhnl6s9FzxqvZw60YnI5DXUICY/zENxfXkrxLlgX/XTGfoFExiCDjhV5l2oZwBzq038qh4s6X56sPhh6wURw0cwnUOJt0x5Ttx5td17CGUBRSfL7p6JsIIEQmCFiA/QN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880736; c=relaxed/simple;
	bh=fO+u0HoLrx27J93N/zIzMWEaLsEZCDXK95MOCrWa7CE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PMaUBM6UOG5ASMSw8/A7lQp7AVwtgI5Az0b7WbmZN7yUTfijCovh9VHsbD5Ch0mW/+i2/+msAOM4siTATxF82/r4KaCMCGUIs/o6yolXAgIxmKB9NyCRhVY4UK3HXreyHyn5bmXXE8OLm47qK0xqqqy2Y82W3Ks/BLDVWWpt2yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K9dVTNXv; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K9dVTNXv"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af908bb32fdso466451a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744880734; x=1745485534; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=he2carAXS1I0zVR7D1T5Leo8tKXttHOzr9UM3u594pM=;
        b=K9dVTNXvmgEmPwY4qaEJPseYTI4gvjyvdT1AdXg5IOs3IYieInzoGnmB4DGvcYBmYW
         nCHPo3NamqmT8tyjXIwnbb9NZWUIIdMaqOlmLGmr2UPrgiiCBEtg6evNlB50DwS/nHeR
         kmtf30h5z7oHfKf2JctCPEmESJUoJebDpqDmSPKTxdefcYzFW3LYmvi9V0meyTYRsL2n
         1qHE5QjEJtbSiehxc53ETeB5+qmurwFpwmUUr3Xm57daQsZ1Wm3dpZi3BvVq+GwZ3ViZ
         QDP0Tq2lqRO0w3bdXgEgI7B8TDlvalanqx3Jf1/R2GwvGYkziQacNSfExx+ptqaXMcD2
         XaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744880734; x=1745485534;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=he2carAXS1I0zVR7D1T5Leo8tKXttHOzr9UM3u594pM=;
        b=FNbZzXWSnHwmZIaH6GDJjSADmk9j596jocTW/3DUoKO8RjRcFjUzDG65fNlyd3wFTu
         l/1ZWE76hkW5nJKgWRGpsmZQtLVmY2Qii53Xl9L/DiGsH5yjmsNKLdZ9ORi6V7lajtKa
         VQacKTG0WgmrknVUc3NRSPsQRfp6H09CEqYUNwgfPk8R46Skj83B8tBHV9+Kti/ZlrUy
         ZPCK+aegs0TpuKIrTNrzA9tewpO/zHZgSzkE91bhCpO060cQgkkQiKmIAIHiknEIVcKl
         HJVDlQ6XCCNDPnLeYAjchJAyp2z0gKl9fAsbYy8Z9K350aJwHAJbHCUHoQf56siYLgG0
         4k+g==
X-Forwarded-Encrypted: i=1; AJvYcCVPqsfcxabcmQ9z0klHPT8L4GFeW2EGTrzEr9kbeJW+5rgbWj/hFrOA4DabZKRxC+zF/03x/guTLcypol4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx7UbLzOsrtdSCGtp5gxgyVxaxh2m9r6fKbjAm+Q4BM5YIIBiY
	29xB3GR4cBpGBAlcbezpsesmbe+i6hjqllUjmaNQN0AFYNurOUg3DwGIzu3ZgQ==
X-Gm-Gg: ASbGnctWenhG0HbcUF8jX5NX+hn9aeF8GLrGo4Jd78Y2IyJ/nc4kyyeQ9lGAJj+BSuE
	pavcq5nvLrB/On77H0lmSMtHQIxkX96BxzjISMkKBcZ8wdo1oHcYHSDoSbgeVs0nUcwRArCpG0D
	li4EflqFV6DjnCw+mHEFiZWIvfyBn0aILg58bbnFdN03y8SQUpfjRDw1kQ/FPqtH+Q29OEyyqc6
	d87VJy4siK8ZAYD/EYuh7x4R/2XB8hanM8EtfrnQxEdKxlv9xDkA9ayuMX4BMpk9oCBtAYXSbdn
	4nmtZQEdXd+LwibkEAXzR0ozUz4/uArKqjMQnp1c2Sx6y2N9bQn6YSNk0xyzW4qnZMuMaD9Jk3v
	e+VphqZWsZPn5QEK5XTOWlSfdeCDYAMwUcn0=
X-Google-Smtp-Source: AGHT+IHjGPNmDP3jrdvcgINWXbFKc3qbQIEIpqNEt4FacxAXIFKjTN7Gks14FR85TEHV2MFOEcEBjw==
X-Received: by 2002:a17:90b:6cf:b0:2fa:42f3:e3e4 with SMTP id 98e67ed59e1d1-3086f3c7908mr3096752a91.3.1744880733967;
        Thu, 17 Apr 2025 02:05:33 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611d6dadsm3092058a91.5.2025.04.17.02.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 02:05:32 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:05:22 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: David Hildenbrand <david@redhat.com>
cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
    Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
    Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH] MAINTAINERS: add reverse mapping section
In-Reply-To: <eb71267a-80ce-49f9-a475-5260df607458@redhat.com>
Message-ID: <1f31faf2-917f-7e2a-c029-f8f1165836e4@google.com>
References: <20250417084904.16806-1-lorenzo.stoakes@oracle.com> <eb71267a-80ce-49f9-a475-5260df607458@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Apr 2025, David Hildenbrand wrote:
> On 17.04.25 10:49, Lorenzo Stoakes wrote:
> > Separate out the reverse mapping part of memory management and assign
> > appropriate maintainers and reviewers.
> > 
> > David has long been invovled in work with the reverse mapping and continues
> > to do so, so is well suited to maintain this area of the kernel.
> > 
> > I have a lot of experience working with the anonymous reverse mapping and
> > continue to work in this area, and also have good knowledge of the walking
> > code and code related to VMAs.
> > 
> > This helps people identify who to ask for help, and also additionally makes
> > life easier in review.
> > 
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >   MAINTAINERS | 13 ++++++++++++-
> >   1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8d834514a047..4f6d09c3fd9d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15499,7 +15499,6 @@ F:	include/linux/mm_*.h
> >   F: include/linux/mmzone.h
> >   F: include/linux/mmu_notifier.h
> >   F: include/linux/pagewalk.h
> > -F:	include/linux/rmap.h
> >   F: include/trace/events/ksm.h
> >   F: mm/
> >   F: tools/mm/
> > @@ -15539,6 +15538,18 @@ F:	mm/page_alloc.c
> >   F: include/linux/gfp.h
> >   F: include/linux/compaction.h
> > 
> > +MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	David Hildenbrand <david@redhat.com>
> > +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> > +R:	Vlastimil Babka <vbabka@suse.cz>
> > +R:	Harry Yoo <harry.yoo@oracle.com>
> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +F:	include/linux/rmap.h
> > +F:	mm/rmap.c
> > +
> >   MEMORY MANAGEMENT - SECRETMEM
> >   M: Andrew Morton <akpm@linux-foundation.org>
> >   M: Mike Rapoport <rppt@kernel.org>
> > --
> > 2.49.0
> > 
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 
> Let me CC Rik and Hugh, if they also have interest + capacity.

Thanks for the CC, gesture appreciated: interest yes
but capacity no, and I'm almost never an R: I'll just
keep on fixing bugs where I find them.

Hugh
