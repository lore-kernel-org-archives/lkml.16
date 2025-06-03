Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98949202F65
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 19:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748977468; cv=none; b=BXQ5jArDjeZng0RvPzXjFCBeTchaDnCFRG/Ab+2jkGhEahuJ1VOsQK3r1shwN5Gdk9AiO1/Y+NPnjvMWjaOXZbP5CO197UGurW785Q4AKRyDuScjgx/gac/fMCBv8K+rEcvpeFDH2NrYwOPFoGdR6Hl0+K2h/eud7kUGplz7ips=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748977468; c=relaxed/simple;
	bh=Be9rZg2wVm5Jh98zlevbaUzkraeXZD+KJ2pLFhtjhK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWXDalvW7LebuZCuHDD+Ql8rZC6/gZcDV26xuXifLUXZCv+Ybe99Pkk9/LApTPYRNXaLp+/xz2jEdp55oQe7iobhrAvnhk/70Fg+y0t3g7DMMrJjaO9qiy7bDMe75rSNrhCM07AgC9z780KrD2W8fHlWTHlXLsKJHTFxso5r8cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u9BMIIzL; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u9BMIIzL"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso2102a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 12:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748977465; x=1749582265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upW65V3EzmhIq53ol8W+l4SqDfLitB19YO+d44FV2Xc=;
        b=u9BMIIzLIRTs5wjnCE24rtIDCehwmizNEi0JabC5233Tsao6QLSBYdZAbIfd18CROQ
         l2uMrQQ26q37WIib3A0kp7HO9xNV+Ub4NO0JVT/xXZIfLGPyoY9THW5MVhwfpHoK/TM0
         +BPy8J3/hWUuhZXS+y1ERIV6msySDLDyDs7CZ7v/z7BxKZSpMh2WsIpcADD//c30//qZ
         iCeSUZC+HPZOORXbvEQuNIwZcwhbEAinn4GSoke6RhcHQl9oDivkJesduuDBMYPhl0P6
         epvt71hFvqQ2tgqDUNODiaiI2ThPs41zxOwcUbWq///D5C8ItCfhF0C67FVJlWIdi8Mn
         L63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748977465; x=1749582265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upW65V3EzmhIq53ol8W+l4SqDfLitB19YO+d44FV2Xc=;
        b=UZuDLSbnOgDbhAUCdUNzzW2MA2n3EoVIZ91PHTgv4c77a+sfAKd/OMErTc4tjklCYn
         hESzgNjPMaGjQFp7rP1GBd4jtrps+7VLrcYDOiJpBx8fmSIfZo9j8bXgry0UFx+FS10y
         guihTFDrhSxrrsEKlgo7dUnWpE51gvhKhYuLJuYjUlUFXTRwOdt9Lr2+xF89vNhGr8IV
         b6GdR0GfcgydXR/S+j0M3AXA31AapR1DW3G3u/xvEMBf+WUw/yS6gaQH92b6JcmGkRxZ
         7n1/ps3eCpgiiwQhPDSxjRa3IfT5BA4K0mFp1FaTDxOS6+OEkq/Y9/dk//6EiPVzwO7r
         YQfA==
X-Forwarded-Encrypted: i=1; AJvYcCVzz7kBhFHIXJQfnfP3WSZRAp5MsRUF7WcC97P/i36pp5IRtOREuorP4RIURnQ39oRYj4IVwPDVvTY8vDs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7f1IH/iYvI0d5wjB91xWVzy8rylre4v46Yc78e0VeeCeT7ogB
	Ddj3n01BPtDP3IUJVi3GhaPwr4SGX2or4jugfs1NTYXFxEvSo7iH9dT9VAmlpym+ZrQ+9J0QV0+
	2fgtvyvKd++iAPSe4j+nHuXi3Yak3hz6/k8JHy+7h
X-Gm-Gg: ASbGncuTvt6cTEkl0Xulp/gp7sWe3suj4WmErPkB97fm015QDe4Vg7h1I7a90vTVBrP
	vFT9vcNE29CNUaUAVnIwIpb+GdOn6HT9xC/XSpBHstk5t8Ji8k8R+dPCrG29Qbw6sPaQQ2MUN7O
	+4w95L5N6TzMIpQBgt5d6UIczakK7OCfo8Hk+gO8OQP0htuA12FH3Af3tk55Alqt9Q/1OtIA==
X-Google-Smtp-Source: AGHT+IF27moEhGBhsm/ksC0oM3TPqemrqOpUYPAOkCX+3zVbgLX/VHp3AFay/v6jG66/ME7gmjt84tbCZzSThScYaow=
X-Received: by 2002:aa7:d4cf:0:b0:604:58e9:516c with SMTP id
 4fb4d7f45d1cf-606e887b718mr4783a12.5.1748977464523; Tue, 03 Jun 2025 12:04:24
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-fork-tearing-v1-0-a7f64b7cfc96@google.com>
 <20250603-fork-tearing-v1-1-a7f64b7cfc96@google.com> <aD8--plab38qiQF8@casper.infradead.org>
In-Reply-To: <aD8--plab38qiQF8@casper.infradead.org>
From: Jann Horn <jannh@google.com>
Date: Tue, 3 Jun 2025 21:03:48 +0200
X-Gm-Features: AX0GCFuy6Pe40ZC9PMfricVFy-j_0bakFIrtt-vNxRDcTJvFrwsni0IVhkAOpww
Message-ID: <CAG48ez36t3ZaG7DsDCw1xLpdOhKVWQMjcH-hwP66Cbd8p4eTAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/memory: ensure fork child sees coherent memory snapshot
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 8:29=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
> On Tue, Jun 03, 2025 at 08:21:02PM +0200, Jann Horn wrote:
> > When fork() encounters possibly-pinned pages, those pages are immediate=
ly
> > copied instead of just marking PTEs to make CoW happen later. If the pa=
rent
> > is multithreaded, this can cause the child to see memory contents that =
are
> > inconsistent in multiple ways:
> >
> > 1. We are copying the contents of a page with a memcpy() while userspac=
e
> >    may be writing to it. This can cause the resulting data in the child=
 to
> >    be inconsistent.
> > 2. After we've copied this page, future writes to other pages may
> >    continue to be visible to the child while future writes to this page=
 are
> >    no longer visible to the child.
> >
> > This means the child could theoretically see incoherent states where
> > allocator freelists point to objects that are actually in use or stuff =
like
> > that. A mitigating factor is that, unless userspace already has a deadl=
ock
> > bug, userspace can pretty much only observe such issues when fancy lock=
less
> > data structures are used (because if another thread was in the middle o=
f
> > mutating data during fork() and the post-fork child tried to take the m=
utex
> > protecting that data, it might wait forever).
>
> Um, OK, but isn't that expected behaviour?  POSIX says:

I don't think it is expected behavior that locklessly-updated data
structures in application code could break.

> : A process shall be created with a single thread. If a multi-threaded
> : process calls fork(), the new process shall contain a replica of the
> : calling thread and its entire address space, possibly including the
> : states of mutexes and other resources. Consequently, the application
> : shall ensure that the child process only executes async-signal-safe
> : operations until such time as one of the exec functions is successful.

I think that is only talking about ways in which you can interact with
libc, and does not mean that application code couldn't access its own
lockless data structures or such.

Though admittedly that is a fairly theoretical point, since in
practice the most likely place where you'd encounter this kind of
issue would be in an allocator implementation or such.

> It's always been my understanding that you really, really shouldn't call
> fork() from a multithreaded process.
