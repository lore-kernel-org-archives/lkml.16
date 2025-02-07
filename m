Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB92F1A3150
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738952710; cv=none; b=P/MMCXONG5BFrIZLiaJVNB/7zx6//pQEKd8K+BZ3x9FwtEx02SVEIIFNaD/1h04WRAomVylkYS4wR8kAubNet8QWC+HiV0mlbfzfsKhrHaJyRdNXAS/UjXHUi2o32o4NMfGEA8PIOXweC8tPO7Z/Fzmwbk3bnfFF2WuWKPRnHrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738952710; c=relaxed/simple;
	bh=QEs1vL5fLdrDO02NgUIdXoiAZquVRlJigS4z+doWA34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTZ7UPEAfnSN5EO6Nkm9UEHLflEuAAzhkFjWN+qsASvt7v27CsFJRhk5URU5WOqCXTRjzkTzmw/HGcOJk6YlecJbah6n+bxTSCwQvgCRmA/KsN8CcwvioVr46Ya9SG88h3sHoRqRkOx9CYrlR266hfe3P5eZNLkMD5pAcirioQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bhkwbS47; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bhkwbS47"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f2cfd821eso44622795ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 10:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738952708; x=1739557508; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QEs1vL5fLdrDO02NgUIdXoiAZquVRlJigS4z+doWA34=;
        b=bhkwbS47kz4P27H3aDGNe05fK2e5tDEeMlNAoMKac0dqNF8X3v4TM5JE//g6YhcvQc
         81HydgHANvEodCPnStIjNytFI/Y80jLXH2HTiDvEMALcA2+jZyIldNW8Wl9L6r+gUUDy
         JcpzY+eB27LJ6jFyqDnq1TGdG8WiWM51fzcp8LA5VRAH2/A4RWCMFcrRV4Y8iagVDfyd
         J2R/zvSitQqwQs1Sq04kQYpbBYKVygLFsXvmgegjSQoXHTFTOaGUchlKXLR8Q2wpbNb7
         bmlc331utLhN3OozWGgpsmB9Qlpu9ElPwxyccGjsYDlKEFiRPj5kAUgEE5YXJaFTNa5U
         gfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738952708; x=1739557508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEs1vL5fLdrDO02NgUIdXoiAZquVRlJigS4z+doWA34=;
        b=NtMT6FEYhu7PDtKBBCkwZOomImM28aofB5nQHsUGq/+ll2nWqXxY5CMZMmYVvNW22F
         2X1G050iB1z2jb1RvZoUhDX2J92JtAd3LheCc8iTksFqW3x2yAv5Y+N8Cqc7Hf3WaTh7
         UNlKgsqj7zv366Nir9/XCS7bcnP6AtmsuAizc2PQgXU4bYfWtIsYjOpFCjNYfDpj8dKY
         2rAVR0PDUmYAHX1qzhsatFreCk6jAbKlqLD7GjgSTCMK/QUbbXoFzPeswF4za3Io/Hq3
         uCNcJ4VDJmdKD0FZ74jduqYgwYkz8RqBLfO7p3Mim7SqTxKgtXcyGhDMEZEuRLBWAGaE
         2Dxg==
X-Forwarded-Encrypted: i=1; AJvYcCVfIKLrCb4dVYnj7/QdaKxzauQ7DmvH9wWcDrSbii0Qn3ioGaz3NlgbthCjneytfG+yqUlQ0Qh7yrE5F6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyiiaHri1bjjfOyXMZYWQZmGxwwsgaVvEbx8OIFLOKPddoioeF
	11n8df5XakKFThf72t/WMHWIOb39spzuAjGQ/X+3rPqNpiyhCbLaIfpWQYPDEIeZoIF9TG/l4bZ
	2L5oqT57pVFiQ26GYWRJx6PCwQsK/VsnmgISI
X-Gm-Gg: ASbGncukJwI6dyqlzbL2zr1xPmOQmoT+MH1szdFweLCX7BT4vsw/9qWEmAJuAy1QBo2
	PFUqLWCSvjX2/H8OMFgBhyJu1dr1GCY0EYV59ch25/KK93NmmmbVRUGSXsxXAAsrkZUhkOJJKNg
	==
X-Google-Smtp-Source: AGHT+IGRkVmRO2u/SlDWG50Rj6yj+HPwQebJner2xZ3FgEKMl+oBHBAvI0B0gcetNliGu0caMaF8Eyn4QqfV7BsBTmI=
X-Received: by 2002:a17:903:2345:b0:216:6fb5:fd83 with SMTP id
 d9443c01a7336-21f4e716972mr55208225ad.29.1738952707543; Fri, 07 Feb 2025
 10:25:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206175114.1974171-1-bvanassche@acm.org> <CANpmjNOsf1RnYJuZ7pmWVYNqVYMYe+eTL0vhDKU5sLihR9fN-g@mail.gmail.com>
 <90c7a807-b0a0-4b42-866f-f74c5d1c62e5@acm.org> <20250207084223.GX7145@noisy.programming.kicks-ass.net>
 <Z6XM6zjK3mtqYfan@elver.google.com> <20250207090827.GZ7145@noisy.programming.kicks-ass.net>
 <94fa4f05-929f-4be8-b2d1-0277826984b1@acm.org>
In-Reply-To: <94fa4f05-929f-4be8-b2d1-0277826984b1@acm.org>
From: Marco Elver <elver@google.com>
Date: Fri, 7 Feb 2025 19:24:31 +0100
X-Gm-Features: AWEUYZndxSshxEky12UHDDDqf1YOXW_XzAX5VWDTaDCSt_T-1oC8c30J-dj0eOs
Message-ID: <CANpmjNNX072Uz+XCOuXwF6u8dHHkv+Wv=mN4mtV34AUS7E3Ozw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/33] Compile-time thread-safety checking
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 18:46, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2/7/25 1:08 AM, Peter Zijlstra wrote:
> > On Fri, Feb 07, 2025 at 10:05:47AM +0100, Marco Elver wrote:
> >> Yes, you can add multiple guarded_by. But it's just going to enforce
> >> that you need to hold both locks before you access the member. If you
> >> want the rules to be more complex, the best way to express that is with
> >> some helpers. E.g. something like this (tested on top my series)
> >
> > Oh gawd, this is going to be a pain, isn't it :/
>
> The Clang thread-safety annotations are used widely so behavior of
> existing attributes must be preserved. I propose to introduce new
> thread-safety attributes when useful to annotate kernel code.

Agreed - we can't change the existing semantics, but if absolutely
necessary we could think about extensions (which I already started for
something else: https://github.com/llvm/llvm-project/pull/123063)

> As an
> example, the Clang try_acquire_capability function attribute does not
> support functions that return pointers although this is a common pattern
> in the Linux kernel. I think that introducing a new function attribute
> to support functions that return pointers is a better solution than
> trying to annotate such functions with any of the existing Clang
> thread-safety attributes.

try_acquire_capability / __cond_acquires(cond, capability) is happy
with pointer-returning functions when using int-literals for "cond"
i.e. 0 or 1 (Clang's documentation says it only wants bool, but that's
wrong). I just tested this on a pointer-returning function, and it
works.
