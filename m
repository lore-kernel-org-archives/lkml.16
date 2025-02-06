Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF53F19D884;
	Thu,  6 Feb 2025 19:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738868734; cv=none; b=Rronqfyvch2pkUvf/Nin2k2oRuq4c21aw37IEf16B3InQJWyyDp5LOG9HpRUhFi7z6UAyVlQCjIjhB+m8kAnxmqysPM5FDVs/Xn7TrBQ5XjtBwn1N/XJrj8O5Cu9Yjucyon85eYTXJq/dxG3vN+OyBYl5oAv/G2Wtl8p6UtgUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738868734; c=relaxed/simple;
	bh=9uQVOmifnreGhQsc1A9lVrH5St/iFksctqFWAQBdxkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfYfYgptqByhIq0HNSh5tvspmkXrVipMjTynoWI88ERr275lnFJv+sIbBhEbDJLgGn/aWOq2x5IfrOil6xBLKfihAfEoL2W0pAClU+KVbV9qHTb+09WMt0pzaURV0AbNlnAHvQ7Y7SAWrXuY7lv1Dia9iX3SFzv929CzVPBghOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFyLyS8O; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFyLyS8O"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5440d1f506aso1406541e87.2;
        Thu, 06 Feb 2025 11:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738868731; x=1739473531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWe/2ua+fmh35CLfAMD65N/tcnFfhiqpINTofFDfa4s=;
        b=iFyLyS8OhWx70qdmlIVIj1vXx7cNvGG/jkBCk5yoXNZqEwGPj6TL4wqsBrHp/IDLH2
         m2hI0Skp8I6nE+q34QxMZfQEnOTKg9WbKeOui6sEiPlRospWZYXy3iTaIONInNyXM1LA
         UInm6aieSKsoU3hYiUy9/uBWLJGCpUHBSIyYpyL2aIkx7jVLELrhGGlBsMzFZrCGY/Bj
         GxgyH0GJHOxRziuuFgwzD5lg76ucIQtD5UB6bULgk7kdrGPWliPhlgnmybK1qjgU0aa6
         sHcywuORPj35So3+zakOgOW2OM4TKOHSbLRvDRVUxmVcdsCjMzLofx9ElnhYo21tNnPe
         Lbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738868731; x=1739473531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWe/2ua+fmh35CLfAMD65N/tcnFfhiqpINTofFDfa4s=;
        b=Bnmi3tsbm4AFAPafD/arRly+R0GI0PNPaAAdKpDWm6MXuLufpZUiyQL5GpqPTrb2VW
         DHTdDGBfw+1lf7++zsBMt3kNEbWeaIfyGk2Oq0XIKlPt++anDrFhIhf/I5KvOaRlnAjt
         ujsivC+8vjEDrD4qishOqk1BU8jKpOQwA3SVtSWT4YMqWCuxG0kRAbFUSaNwLaNRmXmo
         thRtdu44boSpljiYleAbvSbZxRE6UslJytd4MMPQelbww3J2Uy0dffMVDYSlXktkcf62
         KVSC2lME5rhUaB6EXFY+zcP9PfJh6Zkk8P1doNgOZfiZ7lfBhc7PXKOu1x4l7+bD0rs9
         MzKw==
X-Forwarded-Encrypted: i=1; AJvYcCXk/l33H/dvGyHlViktgmMukMiJA7RPFbn38CeSW3sfeM4y7d7v1xJnCBU6id4v0BS426FFB5CMYJK/wI79L24=@vger.kernel.org, AJvYcCXkL4BaRHNERWazToiLDQU704PJZDiqNiJlRXxE/KZkXcjxFx4taZ/UvR5cT/q+P0LHB5KsWPCvcpZ0MwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPjPghvjrgZMF5rT0vVTvBJD+ieZvlbFGBBNfe5nrFligA/l/l
	fqycLP3HEetXN9QMh3FTSpfm2jUCy+mia0+gRZ+l7l1B4YbKXikJ+RYf5uGWe3OiuEGASlyT4+4
	/WZPOW5jH1EUnoCA56iU/afikLuM=
X-Gm-Gg: ASbGncu2Z/2eWTBb4p1LJi2oBYpHTEAEBh0RBaMfjHS2g5tf4fysz4oExaqLmd1xd6e
	VUUtPmWRh1QSMWYSTQg7yRaonxEMwIcsGzYvXDv0zXoH04+CrkZRC7+aiaXwpMRUpdRZui+KlVL
	VmYpm6XMLTNYTDDhLbM7rjGwl2qLj8
X-Google-Smtp-Source: AGHT+IFb/vF56J/Q4fncJH5D5onPYZnsacNHsk//1uyVv8nEb2/jnZ4MfdBuw2ZeWkVaH6sI4P7kJQed7OhU5P9x8BI=
X-Received: by 2002:a05:6512:2399:b0:540:206b:c355 with SMTP id
 2adb3069b0e04-54414a9d0bbmr24781e87.19.1738868730481; Thu, 06 Feb 2025
 11:05:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
 <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com>
 <Z6T5sOWXxmUsflW7@pollux> <CANiq72n7jx5ve9UL3oDD08=PjY55QHoMY8fyfsW9RNEvjH_b4Q@mail.gmail.com>
 <Z6UGNbowcvqTN0-T@pollux>
In-Reply-To: <Z6UGNbowcvqTN0-T@pollux>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 6 Feb 2025 14:04:54 -0500
X-Gm-Features: AWEUYZkktBtBZNaQMCoEzUE1Y4SVul1Gh2koh9oJg_zJds6xgzDkBGw1WFiJBy0
Message-ID: <CAJ-ks9mwB+9F8Bz89TB0ZecijOftM49yfPzn5GgcyPDEput+xg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:58=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu, Feb 06, 2025 at 07:20:20PM +0100, Miguel Ojeda wrote:
> > On Thu, Feb 6, 2025 at 7:04=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> > >
> > > I previously checked man posix_memalign(3) and it says:
> > >
> > > ERRORS
> > >         EINVAL The alignment argument was not a power of two, or was =
not a
> > >                multiple of sizeof(void *).
> >
> > Yeah, but that may not apply to `alligned_alloc` as far as I can see.
>
> What makes you think so?
>
> AFAICS, the man page applies for posix_memalign, aligned_alloc, memalign,
> valloc and pvalloc.
>
> In case behavior differs between the functions, this is stated explicitly=
, e.g.
> in the "RETURN VALUE" section.
>
> The "ERRORS" setion does not differentiate, hence it should apply to all =
the
> functions above, including aligned_alloc.
>
> Do I miss anything?

The writing is definitely obtuse.

> Return Value
>.  aligned_alloc(), memalign(), valloc(), and pvalloc() return a pointer t=
o the allocated memory, or NULL if the request fails.
>
>   posix_memalign() returns zero on success, or one of the error values li=
sted in the next section on failure. Note that errno is not set.
>
> Errors
>   EINVAL
>     The alignment argument was not a power of two, or was not a multiple =
of sizeof(void *).
>   ENOMEM
>.    There was insufficient memory to fulfill the allocation request.

It seems that the errors section applies to posix_memalign only. The
description section also contains:

> The obsolete function memalign() allocates size bytes and returns a point=
er to the allocated memory. The memory address will be a multiple of alignm=
ent, which must be a power of two.
>
> The function aligned_alloc() is the same as memalign(), except for the ad=
ded restriction that size should be a multiple of alignment.

So aligned_alloc has the same alignment requirement as memalign, which
is only that it's a power of two.
