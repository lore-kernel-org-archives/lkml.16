Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DE11FC7E7
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781575; cv=none; b=bqYN5CgdXsaEzQLmexnNj1oDEjHb0OyianLGCs/GmacB/YrE+Du/QoLgy99hBjZvO697mvLzlgQdVVe5pH2IlEMp+Hsz2Pd4vwV6v7Li1/zDjOBP0BM9p8IVUv2uE+527Da1RYl7TIjgxC/h+TC5PDohuoOjYJ/zZGEcOMZAghE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781575; c=relaxed/simple;
	bh=wTQiBPhtG/LA/pI3K/rKZEgoocSO4ktBAZk2Ts29GvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWntRxmocQO4aJWXy+mYivuLse2w0W6iaBqnqv+Iur38qNKggkxy5Ztfd+DdcKKs1EbQ/5q3AtYgxx3gaP/WF7vhhjRm6Hjk2BhCGG6DR6oVpD489RWZQVDdCHXIFzeScsa9dMOwPvcs+hGFnn4zxXy7mnX9O8Rmijg1qIktP1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=hfXip/4F; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hfXip/4F"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436281c8a38so605425e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 10:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738781572; x=1739386372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePVNd0w+sVoa196Zz6yKJq58LAUrkT1uJTWGzJaE14w=;
        b=hfXip/4FgRIo30Osg0j198+oL+uOjkqdxC6VZtoophC3UYxvgsDBlgbscVl/4+zZYN
         CKAoXWSfjQGFOCY6t7fqbPMd0swTu4tmiiOo+u6sazTl6H16uPKCCucGqxvufNZzA/1G
         PLYRngfZHbZe30wwBAV7lI4Uzkc0K0cNN7J+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738781572; x=1739386372;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePVNd0w+sVoa196Zz6yKJq58LAUrkT1uJTWGzJaE14w=;
        b=RqXRymjkDd8j6PqYtQX0zNYOleQXeq01346P+VmV1ctjNAmLSSI1H24Z43UN2XlLYh
         9xzU+RVtwjknx1dYNLz8fYisi4Rvf+kgOnvkoL7gIc0wXGkJ5otVEm6KQZJZDDUAmZc2
         QrOQ/ZHDnxVKpW4Hk5pF3+QvJHuQbkyyIy3WyBt4o0DQOX8Q3d5RgzJqFzUelg4yi9D2
         BGkvkruyzt1pEMwlZUiTEYx8BRQwJL0/K9BD33g+LfQzTYq+QwIY7VBSubXl1mnh1OSx
         oDEXdj/NS9RH3q9dAbBUoS+LjxVDjeaSgG3SEpKaOI/+mKgIC3MHWeRLsMXV7INfD8KK
         ebPw==
X-Forwarded-Encrypted: i=1; AJvYcCXcigyyp73rSbC/lBe+bpoT4TNDrDbmlXNhj1II5CP+5yro2TNrvJQHXu+TH2JWziWgkv9THQCLQ3BUDuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaOS0CuMBBrFPSnA2moYDy8MngfzJQ+gmG4DTAxN/VXhaNVXyH
	PSd1DVj8/fHOCHwmDbtCoFDuYNiUwAv+6sdRgAU7WhVvk/AsZ+eLDeIFV1cLWX8=
X-Gm-Gg: ASbGnct2aXUwjNw+r1W/yo3FeadYg0M5Aw0ZsHRuPjdIRsX1RvP9wG+pXXuhxjdisu3
	WigFttXyKsepG4oh7Pg/5efmym1waqKz/0B2JBnTKviVj2Xyq/cIUwM8mBK5ZuwXNDwvf4VxR/C
	K6Mwq/IYgvLyGpk+2sS2ZKbNOmHTDysDnts7xuKLxw82erGOsK24rRz1PuWqyQOnlDktbJa8Dv3
	mu5dBSxJ+wbtgonjJ/l/CDijr4XBrp3ao8rtyfuSE18VBME66NHa2IB5h5tuV0NgCxAJWI1/KVp
	uLCbsIVEW97vhE4SRUqx8BJaF2Y=
X-Google-Smtp-Source: AGHT+IFj/bNfkP952mgSDtZ9yP9hHw6wGl45/r2VXPQTulXqtOd73dZIJPv3lk+l159xaf5CNE6cdw==
X-Received: by 2002:a05:600c:1d9d:b0:434:ffe3:bc7d with SMTP id 5b1f17b1804b1-4390d43d796mr41071805e9.16.1738781571766;
        Wed, 05 Feb 2025 10:52:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11264sm29164665e9.35.2025.02.05.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 10:52:51 -0800 (PST)
Date: Wed, 5 Feb 2025 19:52:48 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Hector Martin <marcan@marcan.st>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	DRI Development <dri-devel@lists.freedesktop.org>
Subject: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
Message-ID: <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
Mail-Followup-To: Hector Martin <marcan@marcan.st>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, phasta@kernel.org,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	DRI Development <dri-devel@lists.freedesktop.org>
References: <Z4D5a5NYrAbNxUL6@pollux>
 <Z4kG5AcVeQKegLnb@pollux>
 <20250128092334.GA28548@lst.de>
 <293df3d54bad446e8fd527f204c6dc301354e340.camel@mailbox.org>
 <20250130154646.GA2298732@nvidia.com>
 <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com>
 <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com>
 <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Tue, Feb 04, 2025 at 03:46:14AM +0900, Hector Martin wrote:
> Adding Linus
> 
> My 2c: If Linus doesn't pipe up with an authoritative answer to this
> thread, Miguel and the other Rust folks should just merge this series
> once it is reviewed and ready, ignoring Christoph's overt attempt at
> sabotaging the project. If Linus pulls it, what Christoph says doesn't
> matter. If Linus doesn't pull it, the R4L project is essentially dead
> until either Linus or Christoph make a move. Everything else is beating
> around the bush.
> 
> Rust folks: Please don't waste your time and mental cycles on drama like
> this. It's not worth your time. Either Linus likes it, or he doesn't.
> Everything else is distractions orchestrated by a subset of saboteur
> maintainers who are trying to demoralize you until you give up, because
> they know they're going to be on the losing side of history sooner or
> later. No amount of sabotage from old entrenched maintainers is going to
> stop the world from moving forward towards memory-safe languages.
> 
> FWIW, in my opinion, the "cancer" comment from Christoph would be enough
> to qualify for Code-of-Conduct action, but I doubt anything of the sort
> will happen.

Yeah no.

https://chaos.social/@sima/113942119012147959

This was about you, because typing a proper answer takes a bit longer. It
was also about your toots on fedi, like this:

https://social.treehouse.systems/@marcan/113941468353031993

And "haha it's only a joke" does not work with your public profile and following.

I do understand the frustration and temptation to just burn it all to the
ground, head the call of the sirens, or maybe for me more pick up goat
farming in the Swiss Alps. But you can't have it both and expect to also
be part of and contribute to the same community. And personally I don't
appreciate getting drenched in gasoline while I'm trying to quench flames
on the ground.

And this isn't the first time or the second, by now it's a pretty clear
pattern over some years. And with the first I could explain why you react
like that and you had my full understanding, but eventually that runs a
bit thin as an excuse.  Now I'm left with the unlikely explanation that
you just like thundering in as the cavalry, fashionably late, maximally
destructive, because it entertains the masses on fedi or reddit or
wherever. I have no idea what you're trying to achieve here, I really
don't get it, but I am for sure fed up dealing with the fallout.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
