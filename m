Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA37F5FDA7;
	Mon, 23 Jun 2025 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690075; cv=none; b=dOVRB2RR4jE8g2M9LFQr29HZeIDAsdw/xdfs3YV9bQdZthhDQPmFNnToqXW/Fu/ysN0CIRVZcNYtTkAMeoKOrxaqwr0mr7/vYZ6kqAYgNHCS8q3ARCK1LFLQrT2fn6SceYK8FaLxefL56Gs2+OF2ny6lFoIpt9Wmbwl2Njm9858=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690075; c=relaxed/simple;
	bh=Xt1hh3KfTCgYjAak5CmTzLAVgU0QVp4GVJKi1bsKKgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lunRicJ+V58bLnUtEXpGGkZRIuc1vD548tqGESwPWtyZu3zDduHGgITxdRrgwWnuyRoJSQ7QcmSYtfaCoHaMPNspe2G8N11h8EnvXwh8/P2efLik3FFXTll1hXd5nywTZqwIa2zR1irG4ve0FLKKsdWIR7DaN1hqJ13fho0ILYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dO/vj4nR; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dO/vj4nR"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d38cfa9773so454539385a.2;
        Mon, 23 Jun 2025 07:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750690072; x=1751294872; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TvaoQueazd6LHf+2LxXZLHdU07cbaf8jpwjp0xXouuk=;
        b=dO/vj4nR0TnLBTo14vJBUBp+jM46W1jZrOsvP//lpW05/kFXj13ch2Q+4Ib9ksv9j3
         wer4muKrmK5rNXCmVlc+80RShLpUozEPlurFHaFGceQ01JITAgHF+KGIQU70fOxO4PVw
         EF7ij7mXcpfIOR4gPHGXquEpG5vvmFlXF+s1fGcfZlsurdjPStc2egJBTgIR61Ir+Eh8
         IqPo9wK+CL7jwY1/B3Brl3ohynK501Vhn1fbTLgSAIeLE+EM6NhbM58Ow9wNthgvJSDV
         j67F2+xI3FAc60UuMZoHZDYg+afwbLkVchvDVqciOH0rpLUiSVpxhGgOzCy3J7v8lTQY
         zoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690072; x=1751294872;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvaoQueazd6LHf+2LxXZLHdU07cbaf8jpwjp0xXouuk=;
        b=mwJWcQ9skPKHXhJKj6iGPWypVXqajL+PU7WHPXCo88JAaTJ2mC85v9pod+qecQf2K9
         g+chNM9QUYcGxHWQgmVoFOLFoBE02FXPumeJeVemhC3/kj3tCSsW1HTZERKu8fYBRlrQ
         riKWl/RPKTQtchJH36VVCQ92Z70LPAyBS6ylsUjZCPHbzrVmkvBfX3uKQYjruUXswNOS
         4seTsJ7Z4IIbnCZXxeh8pfO+fLW081MhSduNDBzylcTK7yxixre1aHq/Y0nrw2CRluCA
         zyaSft8JRyp2xgljTA7s8pcdWjSmzr5faduXZfjTwrJUqEJPCSeqt5+bWKwzbdGwNOHd
         AFnA==
X-Forwarded-Encrypted: i=1; AJvYcCUpBFZZI703a37PA9VJOgz3dzRTPdMi6n+qTABIInzYsoZtaBKtlyvCx6KOfmSEdhDL+cp658RZ4S/Owng=@vger.kernel.org, AJvYcCW8ZSUt0O+wgkj1LrCVpfEWg3ZQYsH+5WmYPT422d8iLKDphS+jgBjjLb3RZBDCcq4cybMlzmHXmMRun0LRflA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcSmHB5tgePUx/KGLGh6K9Qq6fKW216sL8Al4+QGrdzKQwiN/P
	w4S477L2kgA+s956wd+S3yjrdRYJMP1Ds780cmD7tjGvvps2Y0VQtI7Y
X-Gm-Gg: ASbGnctux52Ri7TqutAfgMxB9Y0F6NGasbf+lmYISlBkoZxTRb/LrzScCTxY0xD6JK7
	+9GNbJ0XQpxQwVOzeDIy8krhMoH7Ebn5aJovvkUH8QZDevQhjBRa0AEWPTiz2fimr9KyYLGkJ9A
	Hs488G1wk88+r4fuDvWlptHQLt+4VI+r4TWVF8N3FbHXy/S0Z7SOrXfbNXvjsjObdSIIC/qZrTd
	XvCJ0vdougf+B50t7Dje6YYLPYwN0HqrhULN7Q+dPU0+cmZMbpxcUyaq0QPaShoP1bR1wT4tHlU
	FJk0e1vAn51YfXIVNHQB2cV/VrCcHjZt0r9CxXhZTjdmodyCkusuhhWbH9F+wqUB6kbEYkHvKRH
	MKrjoyfM0VooG53vsDgjyc6dTTMdhLKS1l3NrFCHViWJdL3GJsNql15sbDJbGxPk=
X-Google-Smtp-Source: AGHT+IEk7agEg+82HUhVi+K1CGvdVRT9HjAB1WcN895aPigC7lUFvGeFM2UUZYfjcen5ARVkZ43EUQ==
X-Received: by 2002:a05:620a:24cb:b0:7c8:c9c:2a8a with SMTP id af79cd13be357-7d3f993c418mr1943684385a.49.1750690072436;
        Mon, 23 Jun 2025 07:47:52 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99fbe11sm393314485a.81.2025.06.23.07.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:47:52 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7D6631200066;
	Mon, 23 Jun 2025 10:47:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Mon, 23 Jun 2025 10:47:51 -0400
X-ME-Sender: <xms:F2lZaPimY1UJHGPe0rsgfT-kMZNXfcNyLAT1ksh1eEydHXUbzOvqtw>
    <xme:F2lZaMADByiiKavPDNSDNYoZGLkw4rhQG_5NzSgSVYkQmnZI00Fs1sQhM7TPKeIY9
    uk0OEfdIuaDPut_9w>
X-ME-Received: <xmr:F2lZaPFwu0Su5eIu44vtLM_cwKyKUBcVFHH3et65wkTNVIkcKOfRJLnw5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtgeehleevffdujeffgedvlefghffhleekieeifeegveetjedvgeevueffieeh
    hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihorhhkse
    honhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuh
    igsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomh
    dprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrrdhh
    ihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlh
    esghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:F2lZaMQIVww3a6nZUHHp6aGw2nCIYLK6meC4QgmY-dtAO5teQU2U-Q>
    <xmx:F2lZaMyX4rt--I-PFQh5MtlMHxwwFr63wuKrCrrTwrdyvTkgXsJk5A>
    <xmx:F2lZaC6G0uw7h6CrU-XDI3RVGSQ8lESgYCaK7q9Bca3L1ZnZSrABvA>
    <xmx:F2lZaBwHNgMg1EyYlwQ1BycIqUxWGpr6OtimZEmmb_ufx9MKTuzgZA>
    <xmx:F2lZaMj75MbA0qnQM6SeYDPe0zaVTBCSsHkvSHVoDRLh4Vtitz58VWrT>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Jun 2025 10:47:50 -0400 (EDT)
Date: Mon, 23 Jun 2025 07:47:49 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, peterz@infradead.org, mingo@redhat.com,
	will@kernel.org, longman@redhat.com, felipe_life@live.com,
	daniel@sedlak.dev, bjorn3_gh@protonmail.com
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <aFlpFQ4ivKw81d-y@Mac.home>
References: <20250621184454.8354-1-work@onurozkan.dev>
 <20250621184454.8354-3-work@onurozkan.dev>
 <DASY7BECFRCT.332X5ZHZMV2W@kernel.org>
 <aFlQ7K_mYYbrG8Cl@Mac.home>
 <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org>

On Mon, Jun 23, 2025 at 03:44:58PM +0200, Benno Lossin wrote:
> On Mon Jun 23, 2025 at 3:04 PM CEST, Boqun Feng wrote:
> > On Sun, Jun 22, 2025 at 11:18:24AM +0200, Benno Lossin wrote:
> >> On Sat Jun 21, 2025 at 8:44 PM CEST, Onur Özkan wrote:
> >> > Adds Rust bindings for the kernel's `ww_mutex` infrastructure to enable
> >> > deadlock-free acquisition of multiple related locks.
> >> >
> >> > The patch abstracts `ww_mutex.h` header and wraps the existing
> >> > C `ww_mutex` with three main types:
> >> >     - `WwClass` for grouping related mutexes
> >> >     - `WwAcquireCtx` for tracking lock acquisition context
> >> >     - `WwMutex<T>` for the actual lock
> >> 
> >> Going to repeat my question from the previous version:
> >> 
> >>     I don't know the design of `struct ww_mutex`, but from the code below I
> >>     gathered that it has some special error return values that signify that
> >>     one should release other locks.
> >>     
> >>     Did anyone think about making a more Rusty API that would allow one to
> >>     try to lock multiple mutexes at the same time (in a specified order) and
> >>     if it fails, it would do the resetting automatically?
> >
> > But the order may not be known ahead of time, for example say you have
> > a few:
> >
> >     pub struct Foo {
> >         other: Arc<WwMutex<Foo>>,
> > 	data: i32,
> >     }
> >
> > you need to get the lock of the current object in order to know what's
> > the next object to lock.
> >
> >> 
> >> I'm not familiar with ww_mutex, so I can't tell if there is something
> >> good that we could do.
> >> 
> >
> > It's not a bad idea when it can apply, but we still need to support the
> > case where the order is unknown.
> 
> I didn't have a concrete API in mind, but after having read the
> abstractions more, would this make sense?
> 
>     let ctx: &WwAcquireCtx = ...;
>     let m1: &WwMutex<T> = ...;
>     let m2: &WwMutex<Foo> = ...;
> 
>     let (t, foo, foo2) = ctx
>         .begin()
>         .lock(m1)
>         .lock(m2)
>         .lock_with(|(t, foo)| &*foo.other)
>         .finish();
> 

Cute!

However, each `.lock()` will need to be polymorphic over a tuple of
locks that are already held, right? Otherwise I don't see how
`.lock_with()` knows it's already held two locks. That sounds like a
challenge for implementation. We also need to take into consideration
that the user want to drop any lock in the sequence? E.g. the user
acquires a, b and c, and then drop b, and then acquires d. Which I think
is possible for ww_mutex.

Regards,
Boqun

>     let _: &mut T = t;
>     let _: &mut Foo = foo;
>     let _: &mut Foo = foo2;
> 
> ---
> Cheers,
> Benno
