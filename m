Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A3419E82A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738953229; cv=none; b=meFJIMYHNw9uJHcfQ1eft4K1czivibjUptELwssc+/ZFpQTN45zXyH/snNVIkqecUM2XnPCpDjqGyLGTQBORdpvpg6cg0oHjfoePB95CJV7oTzKNJRZaDNyhiI8nfmH96UZ5h9r+0TFdWqJ8XzvEsIIwhylCDPFMBS4MH+ike3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738953229; c=relaxed/simple;
	bh=nsvreyKbULHQViKCHN8Xzu3sXBSkdh4jaUA6rkaR12A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnW8LFCcZZku3utQ0U1L+Z4VmizqtNirGBznjoCFqeTj9yC1FndYNaBVh+OVqaa26XYvez0dxSktckjoGse9dUROqIw6uc/kX3uU4Qj9AOgn0ZjBVhWoC18/K+PlUY3BwUu6N9LS8Acv0AWXDIRtmeJEP4N+YXQU/xfnRs8b6/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JrZpndX+; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JrZpndX+"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5dcef33eeceso4353984a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 10:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738953225; x=1739558025; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LSfjVDdFy380pTqlr6fb1AB4PEji/7GivU8X5uTYCzs=;
        b=JrZpndX+nRMIgfk70D9stwxrTHn2tjVAL9/EMto7TUKyp+afimc9hLpJwOUYx/+3HN
         bYPma54s5IpxuTlMDWGI/lNNZN/dRNnWWwZ2sB/10CTi/oPO3Tr/QVU1kNLx609A/Euj
         0//5JPhMpukXu4+itJgZheqP3tfpfwTm942X8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738953225; x=1739558025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSfjVDdFy380pTqlr6fb1AB4PEji/7GivU8X5uTYCzs=;
        b=eEVOc1eWRJcYYXsoxCBaPhpOFEdqlvKAD7vPg96XLR4qHBjK8zcZeale3KN/zGO5d2
         y8THzUDeOAxpVAWsFkvPiewe+V7m26aWdGlUBs++0UBbQyTVF6MkZo2atbeSSDqFogFY
         Eh2ITqyisVmRxhn7HJZjzyRPC+apto/2uAZk8Q/anAVhS6qKCQPGaWH73/ZvcP0zJXtV
         5YmirynGrRTy3NuOx5u3Nm5NUG4T/86kxPLyMzF6dtHXLo8TK5HykF/B+KSyBXIag332
         QtB+L3zlY2jcoyamFG3laIMOm4Ub9IQD7Z2ulvgYYZHtJCRhVlnimgf/wspfvuV3whUv
         1oYA==
X-Forwarded-Encrypted: i=1; AJvYcCXwxkrdsDyQdkEPKuC3BC/VJ1N+KH4mKZoKS/YjB1qXv5KxTTMAPetsQTmsP5izJtP3oq9+uAuhbUGnty4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBfmAkDTsknxkykxjhqGxow8arxLLj7bfvZ/mSy1h7TqIa9qBq
	eziz1WB8dPPUoQYU3ZoP9d6Hw+vkJGxwnueyCUVJhKdHEBqZBp/Ei1s4SthYx5hCLWaMx09F1du
	pLM0=
X-Gm-Gg: ASbGncsAzOfvgWUDgwGg1WhL/4Gd34h94ktg2pzSiCMWEFoRRFdefQaoDkTxU8Uqzi9
	sBPoG/rfoZopJ92W0KPUTZLQctIEUTiUfQ7MUC1qQjUVg5lO767FBzphojMV8/IhGCRToS0uNpf
	QetYf2trNlfaiuf/1Or41YWjowVlhK1QftjP4UgrWNe6cGfOPN1UjRXN5oJPK0pAJje7ScC/6Lp
	tszQIZh6LJyO3LPOC2bbGHqEMAJc5r5H6q2DIEEuYQdUfCs/B4Z6QT/gd1oETztC3H1oo2J7mKJ
	pd7x+pSfYymz/4nqoEBsexDzdAF8GmNfntRZJ3R+mDlgReKeCfZ6aXkijD47tnliww==
X-Google-Smtp-Source: AGHT+IGnK7PXkJ+L6CjXWqZh8OzMZ+weHfx12icLLrocLM0E77ol+B/SdgT5iFdlL+5bQvwq8U+Xsg==
X-Received: by 2002:a05:6402:2085:b0:5de:3747:cddf with SMTP id 4fb4d7f45d1cf-5de4503ffd0mr4808720a12.7.1738953225440;
        Fri, 07 Feb 2025 10:33:45 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de4d250084sm1133465a12.16.2025.02.07.10.33.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 10:33:44 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dcf0de81ebso4698050a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 10:33:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7ZHstzOaT9iKgRmyhoJcvmYhdDV/MCFnrqCnsZ0B/ph+IvXOM1FWKk9cCF6z061XzUJTZYNdiG9VbHXE=@vger.kernel.org
X-Received: by 2002:a17:907:3f12:b0:ab6:8fda:3bcf with SMTP id
 a640c23a62f3a-ab789c85e91mr475100466b.56.1738953223934; Fri, 07 Feb 2025
 10:33:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025013030-gummy-cosmic-7927@gregkh> <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh> <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st> <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
 <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
 <208e1fc3-cfc3-4a26-98c3-a48ab35bb9db@marcan.st> <Z6UPXxEJYpanU9iU@cassiopeiae>
 <4c0a7cf9-26e1-4a19-8a6e-7c30bc3aef86@marcan.st> <20250207-mature-pastel-rottweiler-e6dbd9@lemur>
 <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
In-Reply-To: <1bbdf8b7-a70b-4994-865e-7fcb8d53ebef@marcan.st>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Feb 2025 10:33:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiQUya5_zTwLFNT2XkX-bf_H1vJiJ3zuADnO-3EwOOjVA@mail.gmail.com>
X-Gm-Features: AWEUYZnMc9rrYSL8b5KBAFdfhmKQWSDBm7ZGh4b76ktZGQGeBJNjsWmuQH4lWbE
Message-ID: <CAHk-=wiQUya5_zTwLFNT2XkX-bf_H1vJiJ3zuADnO-3EwOOjVA@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Hector Martin <marcan@marcan.st>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Airlie <airlied@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>, 
	phasta@kernel.org, Christoph Hellwig <hch@lst.de>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, daniel.almeida@collabora.com, 
	aliceryhl@google.com, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	airlied@redhat.com, "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>, 
	DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 10:02, Hector Martin <marcan@marcan.st> wrote:
>
> Meanwhile, for better or worse, much of Linux infra *is* centralized -
> for example, the mailing lists themselves, and a lot of the Git hosting.

The mailing lists are mostly on kernel.org, but the git hosting most
certainly is not centralized in any way.

The kernel.org git repositories used to be special in that I didn't
require signed tags for them, because I trusted the user maintenance.
But I was encouraging signed tags even back then, and once it got to
the point where most were signed anyway, I just made it a rule. So now
kernel.org isn't special even in that respect.

Now, kernel.org is very much _convenient_. And you see that in the
stats: of my pulls in the last year, 85% have been from kernel.org.
But that is very much because it is convenient, not because it's
centralized.

But that still leaves the 15% that aren't kernel.org.

Since I did the stats, in case anybody is interested, the top
non-kernel.org hosts for my pulls are github.com, git.samba.org,
gitlab.freedesktop.org, evilpiepirate.org, git.infradead.org and
git.lwn.net (and there's a handful of other ones in there).

(And while I did the stats just for *my* pulls, if you look at total
merges over-all, the non-korg repositories are actually at 20% - I
think my percentages are higher simply because I tend to pull from
mostly top-level maintainers, and those are even more likely to use a
kernel.org account).

More importtantly, not being centralized was very much a basic tenet
of git, so *if* git.kernel.org were to become problematic, it's very
easy to move git repositories anywhere else. Very much by design.

              Linus
