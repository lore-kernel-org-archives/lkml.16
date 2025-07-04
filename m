Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90128640B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617311; cv=none; b=tBSJxJpObNop6xGBv5J6N/JAkFYalmYOo8PmKvn2wyX5AxwwnaAzZVGhBM0g28FGhskUVQqR44LT2iV18oyy61uytiJhWe2FuLrHdrF3SmXM8NvxNgxPE76SmbFC4EhwoqeZbcNz/tNwUKsJ7v9gengoSWy8ey4aGLyuf4vGYj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617311; c=relaxed/simple;
	bh=FfFgM3w89Awms9ouorvrgypiEYg34rdveJXyfHtSI7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fCwgGlsOKiql76dOhlbMZqHSUp3WMIcVkn5CtWHfDsk7hPz+PXOWDabV6ksp4Q4Bk3Fh0UlssHUKhweEhHT0CWs/EvwRWfpbX9b4S3A0x8eALyzi6L3MxOoidZOfPAEaGsFSd7dLp/gO4v4Nj769jB7gsUY1aBIi/vOeHeD5Zrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=brNKqTev; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="brNKqTev"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7490702fc7cso505187b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751617308; x=1752222108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrmplSRpTLjvU/Va5okWFiaAeK95G6eUg5bBPQchAfY=;
        b=brNKqTevBOgKwPtTsO9WRWeDphqfkFHq34hJ9aosqdWkOegn1wSQyTmGdBSkdEpV1a
         vzuE/h+f7quD/4KCqFFA4nzEsV/KXRfSRAgFGfFV6EPRhYCH1p52jzYssGDpeFbLyhS0
         sg6N0XWXiptwq4mRuoysGskUMpuffCCIx2VxppoBHbrVfBFCnSd0XyLoNN20N3qKELQu
         L1Ra+as1f12DGZyt3jMIvsSO1osNKobk24KEpv03s/WAz21B15ouGhw1m5XD4x+rjJ8J
         AxCV4bLcsMBr8JOtOQAEeGlND/nGLB7zT1AydQzl5f7u8QrzrghYtR8qr9T1sgRev4Dy
         Q9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617308; x=1752222108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrmplSRpTLjvU/Va5okWFiaAeK95G6eUg5bBPQchAfY=;
        b=RgfY9mGYrAVneCacbq2Xwddo9j7/fGESbZpq4gBKpI4pvXnh6qs0gaR934LhvwyywG
         W7HjeUlRUJkMDAjw/yGDjLHF8dnhZuhKjNPpmhzOMABaQaAlkeDLUFuAWk4NOTMFJAa1
         TrMg4TtEuTwqVXRr5JKl8OoIg2dTTl5H9SbV3LhjKSskEzivGxsN/3WWbn93UsNTCWMD
         fcOpXreB8GdDbs9Znmq8BOqNgfXMimfpgnMR5bzsWgXBOcScBCGCuzU7rABTlv9srIch
         GVjv0kqZCMfVbOXMPfZLqrfYTkfTJvPPaMPdLL63GdxEcpOyd24SNqthRq/IxYKH38W1
         yQkA==
X-Forwarded-Encrypted: i=1; AJvYcCVaGjDdU+YfCPOJ5FptR9pJHGWrhwItqRg/1oGw8HbZDIvriZT/R+AiAZjyrZmsMtIfukQ7znXWOdR8qRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfFLAfcPmIfVotpvNIqw4AF5XLYUrcm0/F6HxT29R8t9A9fJ3
	ZuOENjUNirCf00cDIFu2QNGt4sqPvLJkuIsjLU5H2yTx7BU3T17ehsrf9nZig4awUkMyIiztezT
	UFEJw
X-Gm-Gg: ASbGnctFjBx5AJigYLlsRSkxGv9rqw5bNoS+pRh6RO22q/ScrP/b2k7hhJ6ctFL8u3z
	lSRePLJV9o3GMnqP8C5w/rXIb47ixUYXcfi1ZeunLIYRymGGPxxacpHyIsrFEcqTampUQGqc++T
	ZBaut2evD+nVc48YWTrCp8BAOeWQYTr14gI7G88io8QURlQpZ6G7etkVV8WQCNy51lfTipWJBsL
	Y6bdxdToMpaGUxLAA86+wsy04wLBklT0cElK8fMJHdgHxNjdobpJFWPAFUV51OpYEJbCho5vd1h
	aekCPIqXBT+O+VrfFwl0I7xc444oPtILvR1tkf7drlGo6aDk+icGv/IUcurwblDLWV7go09MST/
	kxl41YIDHo4uqKw==
X-Google-Smtp-Source: AGHT+IEQSnitJcJwwymY7BAhQB7Bq74NDZ5Q89nksgDSVvuG7bIuc9yS6M7KIOggYg5ZF+gQ+5gttw==
X-Received: by 2002:a05:6a00:2e15:b0:749:112:c172 with SMTP id d2e1a72fcca58-74ce69c53f3mr2224202b3a.16.1751617307987;
        Fri, 04 Jul 2025 01:21:47 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cdaaasm1483166b3a.61.2025.07.04.01.21.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 01:21:47 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	jgg@ziepe.ca,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH v2 1/5] mm: introduce num_pages_contiguous()
Date: Fri,  4 Jul 2025 16:21:30 +0800
Message-ID: <20250704082130.11804-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <97d3993c-12aa-4917-9bbd-d9c94fbda788@redhat.com>
References: <97d3993c-12aa-4917-9bbd-d9c94fbda788@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 4 Jul 2025 09:56:23 +0200, david@redhat.com wrote:

> On 04.07.25 08:25, lizhe.67@bytedance.com wrote:
> > From: Li Zhe <lizhe.67@bytedance.com>
> > 
> > Function num_pages_contiguous() determine the number of contiguous
> > pages starting from the first page in the given array of page pointers.
> > VFIO will utilize this interface to accelerate the VFIO DMA map process.
> > 
> > Suggested-by: David Hildenbrand <david@redhat.com>
> 
> I think Jason suggested having this as a helper as well.

Yes, thank you for the reminder. Jason needs to be added here.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>

> > Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > ---
> >   include/linux/mm.h | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 0ef2ba0c667a..1d26203d1ced 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -205,6 +205,26 @@ extern unsigned long sysctl_admin_reserve_kbytes;
> >   #define folio_page_idx(folio, p)	((p) - &(folio)->page)
> >   #endif
> >   
> > +/*
> > + * num_pages_contiguous() - determine the number of contiguous pages
> > + * starting from the first page.
> 
> Maybe clarify here here:
> 
> "Pages are contiguous if they represent contiguous PFNs. Depending on 
> the memory model, this can mean that the addresses of the "struct page"s 
> are not contiguous."

Thank you. I will include this clarification in the comment.

> > + *
> > + * @pages: an array of page pointers
> > + * @nr_pages: length of the array
> > + */
> > +static inline unsigned long num_pages_contiguous(struct page **pages,
> > +						 unsigned long nr_pages)
> > +{
> > +	struct page *first_page = pages[0];
> > +	unsigned long i;
> > +
> > +	for (i = 1; i < nr_pages; i++)
> > +		if (pages[i] != nth_page(first_page, i))
> 
> if (pages[i] != nth_page(pages[0], i))
> 
> Should be clear as well, so no need for the temporary "first_page" variable.

Thank you. Doing so makes the function appear much clearer.

> Apart from that LGTM.

Thank you for your review!

Thanks,
Zhe
