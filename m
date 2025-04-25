Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918BD21D3D0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745609999; cv=none; b=rDPE5Sf5V/4ANNPSPqgtIIxdjGRj9WT1UG+Cf5EtlNZ88341DpEiQZg2QU2/x1DPTR4u7dynp7Myl/Qnvdmkt3vblqGz4Lsv+016BJVfv6IZvz/GmW2G8M7ltFP/SxveDzaED0sZdNPD7o2s6WboYj1tJnry+tLp9ch4yp1MuIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745609999; c=relaxed/simple;
	bh=ryOxdyLcSAv0AGNsueSdWeAlBdewX0rq6J6yIZ9kzHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9AEURZ0tlQVb5cU/gsMOVlh/FNtmx0pjDoO2+QmcbyVgURLb8MNajUyFnzXsHplcamhRj7Spe3/lkSfU7juP8G2FyojCkcw0mjsaqpXkGiNsRAH9nFIoo3qiB2+N87+oQUenx4v6zlr/E15YhAaSZQsVDULtus+qGVnX9F1yJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lHdcyMHH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lHdcyMHH"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so2387542e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745609994; x=1746214794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfSIX9jpfiWRSxgHFlpEDElrGRa3eqYVEWZZrqsW9bI=;
        b=lHdcyMHHlZ6gumNHBONRXIrjbUufdo5SWZyA0oJHt6d8LQS+w55nL/IxKbI+QTCqYT
         NCBTlh3WaWS8liLq6pBC3Dwd2C4zXugl40x0APBM7DuhRG19E3cI0ldIbRC4+wNW0w6I
         NKmwisJWw0nu5SuM3qQUgV3jExgeSZ7k4uYhjGKCxsPrqHuSu28oJe5/CAYbtktROTgt
         r2DB49z2zNmF4hMhYQ6wdJi9RCuJ8GQkY1Yuz6PBWDMH1lTMQuSTW6wyxjLFLOfovZ89
         qEJFMOEdh46taenC6x4o2fi1n8WVLL6qmIcssAbqwiuEPppOGF4lIjqZE+GzFNdeMMlf
         RLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745609994; x=1746214794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfSIX9jpfiWRSxgHFlpEDElrGRa3eqYVEWZZrqsW9bI=;
        b=tdeYH1hjJ/HUPKue0GSo0uOPk3gu6BRobaBtDuRIdIvOLBNFV7ZFhrixNhqkRHOoBV
         RKhDxsFvNzlxrbo1GjvJumlmMrl23mViPXPMntOI6Q4V4lSyUEuAQ9WwFvQIRINeRu4s
         FYsrBUFdeEz8+maLc6Xb/y6xElVdPBg9yUuphENVBmopV835C2fEEn5AOj9kQOA56nNW
         CVenw4iu4LyD5/hC/JpZme+Lr/URkSWU+8WLRLwXoS1d06uDmW3Uqc3ryIAAJvAom2RJ
         elObgJ4EBVnLoVeXOLe8st09pIZiVZrxTIOIp+LBXLDTEUQP4k2wCqI4I8CrGITJt/bw
         3myA==
X-Forwarded-Encrypted: i=1; AJvYcCWBrpG5AkUcSVX89/1hCApgYRHNrQtEOyc/NUJtF3ybfY6pCEZQQd4KUAlkPwnmarynXnxskedc/fxABQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFiBlvaZ9yaNsoY/2RG7nJ1UPucrtuYg+Oir6ett5XdtE4vOBg
	yANC3nBrIYi1+DDzW4GQuzq8+I5CvV43P6VNQiQ8aiLaZG7En4S7oocZQMc5ywnDK3fKUPfZZEq
	vngDBqsfiZibzZx/3DnfGWVUKZ4qV4DMdnQZAwMuIbCY7L6xViJc=
X-Gm-Gg: ASbGncuoa0fdLZu5544bLmxqTqOVqCTUESvYOWVgaH13enQEyyPiaTZo37GoSA063LT
	TpIOWz4mF0dYBi2dWJetQUBES0d2kVqNeBP7Wjl6m8cnzmTHGGNUHsabdtbmmfBtsmTekddW1Hx
	arCuW2N6cNkLeGlBTTGvN8MZXxj5kRVRPr+JIGWUbSGt3MB8w0t/8=
X-Google-Smtp-Source: AGHT+IHUbAh5N12vJaC4y50M7cNDxVxLCPYrcMSTN18M4pC1Y8L+yTG0UPsfIVPETtsJQssOgUaeDFzFHB1JvR/EmjM=
X-Received: by 2002:a05:6512:239f:b0:549:8db6:b2dd with SMTP id
 2adb3069b0e04-54e8cbe0789mr1187301e87.31.1745609994088; Fri, 25 Apr 2025
 12:39:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422191939.555963-1-jkangas@redhat.com> <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat> <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
 <20250425-savvy-chubby-alpaca-0196e3@houat>
In-Reply-To: <20250425-savvy-chubby-alpaca-0196e3@houat>
From: John Stultz <jstultz@google.com>
Date: Fri, 25 Apr 2025 12:39:40 -0700
X-Gm-Features: ATxdqUERSINXjgZozjhH6OJicqqRpLdRfV1ZPdW61MN5MO_O8cl1SzEcLT4val0
Message-ID: <CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
To: Maxime Ripard <mripard@kernel.org>
Cc: Jared Kangas <jkangas@redhat.com>, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
	christian.koenig@amd.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 11:58=E2=80=AFPM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Thu, Apr 24, 2025 at 05:13:47PM -0700, John Stultz wrote:
> > On Thu, Apr 24, 2025 at 1:34=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > I appreciate this is kind of bikeshed-color territory, but I think "c=
ma"
> > > would be a better option here. There's nothing "default" about it.
> >
> > I disagree.  It very much is "default" as it's returning the
> > dma_contiguous_default_area.
>
> My main concern here is that it's "default" as opposed to what, exactly?
> We have a single CMA allocator. We could have multiple buffer
> attributes, but then "cached_cma" would make more sense to me if we
> expect to have uncached CMA allocations at some point.

Well, there may be one CMA allocator, but there can be multiple CMA regions=
.

So in the kernel, cma_alloc() always takes the cma area as an
argument.  And dma_alloc_contiguous() lets you do allocations against
a device, which may reference a specific cma area. Or if the device
doesn't specify a region it will utilize the default region.

> > There can be multiple CMA areas, and out of tree, vendors do reserve
> > separate areas for specific purposes, exposing multiple CMA dmabuf
> > heaps.
>
> By "CMA areas", I guess you mean carved-out memory regions? If so, how
> is it relevant to userspace if we use CMA or any other implementation to
> expose a carved-out region, and thus that we carry that implemenattion
> detail in the name?

So, no, I don't mean carve-out regions.  It's more about dealing with
competition between multiple CMA users. In some cases, where there are
known fixed buffer sizes, say camera buffers, it's much easier to
reserve a separate specific sized region to allocate from so that you
know it will always succeed and you don't need to waste much on safety
margins. Having this added as a separate CMA region makes it a lot
easier to account or reason about, and the kernel can still make
(limited) use of the CMA space when it's idle. Then you don't have to
worry about some other device having a short term cma allocation that
pushes back the alignment for your large allocation, possibly
impacting some other devices larger allocations.

And unlike with just using a carveout, you don't end up just wasting
all that space when it is unused.

So userland may want to allocate contiguous memory, but it may also be
relevant to userland to be able to allocate contiguous memory from a
purpose specific pool.

And while not used in Android, you could imagine having separate
purpose reserved cma heaps with different permissions on the heap
devnodes, allowing less trusted applications to allocate cma from a
small pool without having the potential to DoS the system.

> > There have been patches to expose multiple CMA heaps, but with no
> > upstream drivers using those purpose specific regions, we haven't
> > taken them yet.
> > I do hope as the drivers that utilize these purpose focused heaps go
> > upstream, we can add that logic, so I think being specific that this
> > is default CMA is a good idea.
>
> If heaps names are supposed to carry the region it exposes, then it
> should be default_cma_region/area. If heap names are supposed to expose
> the allocator (but I don't think it's a good idea), it should be cma. If
> they are meant to carry all that plus some policy,
> cached_default_cma_region should be used.
>
> Either way, default_cma seems to me either too specific or not specific
> enough. And we should really document what the policy for those heaps
> are supposed to be.

I don't see it as such a problem. It is clear it is cma, it also is
clear conceptually that it is the "default" region that the kernel
uses when devices aren't specific.
But I wouldn't object to cma_default_region/area as a name either, but
I don't see it as particularly improved over cma_default.

To your larger point about policy, I do get the tension that you want
to be able to programmatically derive or evaluate heap names, so that
applications can consistently derive a pathname to get what they want.
But I also think that there is so much variety in both the devices and
uses that there is no way that all use cases and all devices can be
satisfied with such a static or even programmatic mapping. From my
perspective, there just is going to have to be some device specific
glue logic that maps use->heap name. Same reason we have fstab and the
passwd file.  That said, I think advocating for naming conventions is
definitely useful, but I'm wary of trying to enforce too specific a
schema on the names as the incompleteness theorem will bite us.

thanks
-john
