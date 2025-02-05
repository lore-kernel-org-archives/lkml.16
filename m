Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D450213E6F;
	Wed,  5 Feb 2025 20:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787806; cv=none; b=QgC0G4h0rup1WY7cIg1pWd6nHYOFNDfgWFLZ9atchnPgyqf20SsM73MxGt/x3cnjSRRN57GULrb6OEfPJCOSjQWWLMnOLHOGbURpt0yd2tual2rozAD/2grTHm4I8DSRFTyR9wPJ+5B46s/1OXQU4ITH+4ufLB3XqOzPIgyfr88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787806; c=relaxed/simple;
	bh=iuXh0TwQYZ/oRfuf6C74IO87n76azj0vyRXdJEtUi7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=kTts1PQ/kiSamYNj1fa3wdfPhMSFfiT+UuFEI4335EuW9Wgl8xHPC07E4zM0/R3GD6hCAkZhVMTe3FNXhAXetrH6daAgEFOcwFVsaDO/2aQaS/LnpsUdgQEJbVa+1LFnGIDptw/A6SdKY8cmi/3MiAvuw2ARWhkdy5a5NG+D+vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izA7tnhi; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izA7tnhi"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaeef97ff02so40141066b.1;
        Wed, 05 Feb 2025 12:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787801; x=1739392601; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7LaIHhUhM3MiwbNj642cr48xuyOAOk/UPtx3aLDwDwM=;
        b=izA7tnhimNgVNimCRHsTZ2XQV0iTD6f6dIOmLP5bZ64mlQXweUG83WSPVVINUGfkzP
         AAt8G6SrxaimFegyBvHOgIAt2wt2L5Ht8ttROVRRZhgH3nGC9JP2MsdkAdvFvFvwMOQy
         vhFq5eReP9HpR92cSTsAMTtfcUcBb23/z4u0qA2AnK3uE/fYyrkS/UuEAGvJx2qarTk4
         9b1BdjaS4ISvg0/m4T/tHRDISF4PvogKHtvYWFNTrdWgFxSDy45HGwc1FqrwUPdH+oBQ
         yy8dk/6nVIzqEBXSAa6D/mtfKOvPan8mkFDez/k9b9AhPIjlv0l7fLtyVGru6J2zYUHm
         34Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787801; x=1739392601;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7LaIHhUhM3MiwbNj642cr48xuyOAOk/UPtx3aLDwDwM=;
        b=PUY8vw+MZqlyJ5s0ELWgsUAmc2eonv8Lo9PQt+ieaxsBmD9FcJDKTKvYFu5wIE1iBX
         1+8aM7BD0XxgmC3VcxyMRNpN/Ork6e7D62cfIyMASksD8pbW2A+GusuiVb5mjFf6igJ7
         qyW9IL3uOKd+c2WV5ctecqx0jQYxpgxPNHPkZRu08vMLYMZXV35cvv/hqgA96aWfE2eJ
         jikippUeoU1B3fiPGyPp5ORuvn32I01g2e2GTcVDm9yg9bkCDb5Hk0/iWICUFruUoLJ4
         NS6zeMpQomo5ekjLJTuIn7RtT99hjQreKUTiT1xPJjiUiKbFbGJ0+5QahAUCPIzu4wj5
         wg1g==
X-Forwarded-Encrypted: i=1; AJvYcCUFwkuflP3PaWZy7qQWSJIiVok77aBukvYU8Np+USg4gt7rv79B+GB1bv+MKCH9tXIEhrZcslkNh+qyQPM=@vger.kernel.org, AJvYcCXA985v65Eca1aOp4KTVGQiHmOtLyk0J6RqXoU1yNkpWtJYxjaWznvprHgcS49Zsq5tFf5TF6dYY/4l5jWqK2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk+hUXuzbqZyT0rWzM5m9b5ZTGEiR932DsNTz7cMwyMMOXej/z
	4iW89zW68XvACGxgEpCsVkTyGN+Ic4lTYmmC5r6khje/xhew+M24k7SRrJcR7JFpsV145AyMKKq
	TRqFTC2KgCttHMid+2PDxiQc5VZfnLA==
X-Gm-Gg: ASbGncsLPQJo99EjQg/lU9fK6nFSgEeKcdp3DfSVpwRcqhCMQHyGn+HB/hSxsWQ+fKA
	SneQhWVel8E7JRtk+4GCG6jWGH5lUxo8+cBOfSUYLuXbd1CIWrIFxERb/vgiWjOTrLvWByA4=
X-Google-Smtp-Source: AGHT+IGCNARq/S6flKBk1hsdDpgzC0mJGccw8CN73wZw3M31xCCPOI69qccB2KG7dZGEukQGOPb+n7mn03YtMGHd1pw=
X-Received: by 2002:a17:906:f593:b0:aaf:c27e:12e8 with SMTP id
 a640c23a62f3a-ab75e35dbc2mr567563366b.37.1738787801129; Wed, 05 Feb 2025
 12:36:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z4D5a5NYrAbNxUL6@pollux> <Z4kG5AcVeQKegLnb@pollux>
 <20250128092334.GA28548@lst.de> <293df3d54bad446e8fd527f204c6dc301354e340.camel@mailbox.org>
 <20250130154646.GA2298732@nvidia.com> <2025013030-gummy-cosmic-7927@gregkh>
 <20250130172437.GN5556@nvidia.com> <2025013148-reversal-pessimism-1515@gregkh>
 <20250131135421.GO5556@nvidia.com> <2b9b75d1-eb8e-494a-b05f-59f75c92e6ae@marcan.st>
 <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
In-Reply-To: <Z6OzgBYZNJPr_ZD1@phenom.ffwll.local>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 6 Feb 2025 06:36:28 +1000
X-Gm-Features: AWEUYZl4PgDWEAOqJs8geanKYzm8-RmxJs8QL-ZQeTHW_IM3hse2lK_-6T3WYCA
Message-ID: <CAPM=9tzPR9wd=3Wbjnp-T0W8-dDfGah-H3Ny52G85B+2Ev9ksA@mail.gmail.com>
Subject: Re: On community influencing (was Re: [PATCH v8 2/2] rust: add dma
 coherent allocator abstraction.)
To: Hector Martin <marcan@marcan.st>, Jason Gunthorpe <jgg@nvidia.com>, 
	Greg KH <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	phasta@kernel.org, Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>, 
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

On Thu, 6 Feb 2025 at 04:52, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
> On Tue, Feb 04, 2025 at 03:46:14AM +0900, Hector Martin wrote:
> > Adding Linus
> >
> > My 2c: If Linus doesn't pipe up with an authoritative answer to this
> > thread, Miguel and the other Rust folks should just merge this series
> > once it is reviewed and ready, ignoring Christoph's overt attempt at
> > sabotaging the project. If Linus pulls it, what Christoph says doesn't
> > matter. If Linus doesn't pull it, the R4L project is essentially dead
> > until either Linus or Christoph make a move. Everything else is beating
> > around the bush.
> >
> > Rust folks: Please don't waste your time and mental cycles on drama like
> > this. It's not worth your time. Either Linus likes it, or he doesn't.
> > Everything else is distractions orchestrated by a subset of saboteur
> > maintainers who are trying to demoralize you until you give up, because
> > they know they're going to be on the losing side of history sooner or
> > later. No amount of sabotage from old entrenched maintainers is going to
> > stop the world from moving forward towards memory-safe languages.
> >
> > FWIW, in my opinion, the "cancer" comment from Christoph would be enough
> > to qualify for Code-of-Conduct action, but I doubt anything of the sort
> > will happen.
>
> Yeah no.
>
> https://chaos.social/@sima/113942119012147959
>
> This was about you, because typing a proper answer takes a bit longer. It
> was also about your toots on fedi, like this:
>
> https://social.treehouse.systems/@marcan/113941468353031993
>
> And "haha it's only a joke" does not work with your public profile and following.
>
> I do understand the frustration and temptation to just burn it all to the
> ground, head the call of the sirens, or maybe for me more pick up goat
> farming in the Swiss Alps. But you can't have it both and expect to also
> be part of and contribute to the same community. And personally I don't
> appreciate getting drenched in gasoline while I'm trying to quench flames
> on the ground.
>
> And this isn't the first time or the second, by now it's a pretty clear
> pattern over some years. And with the first I could explain why you react
> like that and you had my full understanding, but eventually that runs a
> bit thin as an excuse.  Now I'm left with the unlikely explanation that
> you just like thundering in as the cavalry, fashionably late, maximally
> destructive, because it entertains the masses on fedi or reddit or
> wherever. I have no idea what you're trying to achieve here, I really
> don't get it, but I am for sure fed up dealing with the fallout.
>

To back up Sima here, we don't need grandstanding, brigading, playing
to the crowd, streamer drama creation or any of that in discussions
around this.

The r4l team and drm maintainer team have this sort of thing in hand,
it's not like we don't understand the community of the Linux kernel,
and having this first reaction to blow shit up and dramatise it just
isn't helpful.

Being toxic on the right side of an argument is still toxic, please
try and be better, and maybe take a step back and consider is what you
are posting going to help the discussion or just adding pointless
drama to it.

Dave.
