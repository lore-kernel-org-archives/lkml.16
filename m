Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2161A1946DA
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746133649; cv=none; b=txcWYO5h1UiLclmVWQWAe3F/is1ofeJOM2vAyonWwJtHlncCCKeJeTedwBSkRwX+YKFweP1BkYJ7FkJrMYVgRGkhpbihXb4LR7+8CTWIshLWtQU5mrQ8Bkaru2aMrLVeK64ckt/WYWLLTgl4v4iShjOXtlDjwYauw9zOmyNS6kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746133649; c=relaxed/simple;
	bh=6I+wTuyBtYTGlyoLP4o5irzYF83IBcJp785dKpECqiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKmaHTAatzNbD/jSqP+bVQV9X2MxhrgOnHlXPhIlgjSPCPgo5e0w58hTZwKbKe3ixlQZLiIzSkosSU1gDmdnOdo6kyn4+82oUacjE8cFOWoMLYZSkgpL3CIwI6HV2PcvZGv/1OZx20aAg9wiD/r2j2Wo4diJoaiRds/pQhrlY1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RmAV41X7; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RmAV41X7"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47e9fea29easo31401cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746133647; x=1746738447; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xy6WPL8IgV8oIt4FWUz6x7SfYAVHFe0+2Pds+erCLV0=;
        b=RmAV41X7vOp3IY5Y1REFbIMcTXvFHAuq0SvZre0ADZXHFap8IAAiC10nKU9adLsLvU
         QyuCW6TUDbGUA3PspUEmxv4B7GZGVURb9X1R4yPFOHq37+jRoZeWP83cr+ps+VN6hUFJ
         lAbP79ljVEORgzqRVVv9A5d3h82CDbF/94JZ2gZgxSOE8Le7dZ5n0+Lwv0nIKAcoF1qT
         2oe9rKHXxRHPrTBjcgz4MtiTzT1S1nfCBA/Z5x4tIj3IGa2ID2vBv4KqpNwzBd5FVAAA
         74LBVuUhEkk+ok5QbvaCXsrcaCAax+X1Tjj1LCwwm7wpbg1WRPGFU2rBWaHACG3hwsO7
         bkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746133647; x=1746738447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xy6WPL8IgV8oIt4FWUz6x7SfYAVHFe0+2Pds+erCLV0=;
        b=kCJ9PeEznOGx2oK25y/eLMP8NOr6tLhvfROORndI44rpiSV74Ok4cNINTBI76N82o7
         5wYk2O1A4Gt8j75ci7JP8dmTapXRacXZDYCItl0T838SnflYDspF4h8KKAleko6VYJWi
         WJLAETJvp0+bhs5sqyIy7i0M9jRjONmfvKDJRau4GgMFT2zp37Ubk8yoHSSvsPLxYCgK
         UbOuJ2UfIsPu9sP9faoocw0UyYB1DSxMCkbxvqnDYOxi2NUo0cM3uIa3ZB0uJ8Wi6Lpw
         BRGXsdCAyMrbLQvOf8Ramkfkjra1MK9Tgftd3fWxcNnXaXL2AnaDtn25ZH07lbaL7jmY
         zxEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpHFHrgSNsLal1rDt+6e15D8HfZzd+P2zkFc2Nwd3QhQ1UJBvGtkFmCTY+GcNJfcaL5dNb8RQi9/0Wb1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs9BN7k3uFREhhwsDOsgyxPioxdVZs0OEP1k3MQnM1ekS86Vya
	eaU4RRBmKAArAnwFJb19dmzepVC4hQDavMGblNunI+rVlLFojn8+18M2AjzwyWZeCM8PekU/lLP
	Zi33mHXARProGfZUxSGxXNgcfF2EitIR+X2t2
X-Gm-Gg: ASbGncuJCQVyAGAMhcoWM2iozlZgbCcVYmb2H5vDXci7Ip1EKtq06HvtDXXHqgj6mja
	wjydftgpmKvpy8yatFYNnMQ0eyp0gyZbhj8Po0UMFKrLFO3LkqUlRNcLxfcUGNzyMgjGHdGApbN
	7nTZZumOPpJmv2/WNx6YFYkAnGyG2aCfjzfnsEuyZk2KNv8nmuFZwU6nWY
X-Google-Smtp-Source: AGHT+IGvnP8urudJpxOJ6z3FyGr9MhaER5BLt2ywO0G+UQqU0GWB149WNRFB6WlvIo4GaxjZKVKVo8gUFfalw6ne5BE=
X-Received: by 2002:ac8:7f83:0:b0:486:a185:2b8f with SMTP id
 d75a77b69052e-48ae9e81af4mr5810981cf.8.1746133646561; Thu, 01 May 2025
 14:07:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <aBO_laRsZDYgjEfL@casper.infradead.org>
In-Reply-To: <aBO_laRsZDYgjEfL@casper.infradead.org>
From: Juan Yescas <jyescas@google.com>
Date: Thu, 1 May 2025 14:07:15 -0700
X-Gm-Features: ATxdqUE0i0pAVlHPUIfuSzJGk1bNTpRNT-sUhQHoyQekasgTpUc_olKxPd4LNJA
Message-ID: <CAJDx_rjX3e2sprPxhGa6hVwZBYH_NP3pguYNPe2FHofTh7jrOA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Matthew Wilcox <willy@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, tjmercier@google.com, 
	isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 11:38=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Apr 30, 2025 at 10:25:11PM -0700, Juan Yescas wrote:
> > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> > and this causes the CMA reservations to be larger than necessary.
> > This means that system will have less available MIGRATE_UNMOVABLE and
> > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to the=
m.
> >
> > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
>
> Sure, but why would any architecture *NOT* want to set this?
> This seems like you're making each architecture bump into the problem
> by itself, when the real problem is that the CMA people never thought
> about this and should have come up with better defaults.

Sorry Matthew about my previous reply. I think I misunderstood you.

You mean that we should move the configuration to mm/Kconfig as per Zi
suggestion so that other architectures can utilize if need? and have
something like this in mm/Kconfig

config ARCH_FORCE_PAGE_BLOCK_ORDER
       int "Page Block Order"
       range 1 ARCH_FORCE_MAX_ORDER
       default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
       default 10 if !ARCH_FORCE_MAX_ORDER

Or should we include ARCH_FORCE_PAGE_BLOCK_ORDER only on the
architectures that configure ARCH_FORCE_MAX_ORDER? In this case

arch/arc/Kconfig
arch/arm/Kconfig
arch/arm64/Kconfig
arch/loongarch/Kconfig
arch/m68k/Kconfig.cpu
arch/mips/Kconfig
arch/nios2/Kconfig
arch/powerpc/Kconfig
arch/sh/mm/Kconfig
arch/sparc/Kconfig
arch/xtensa/Kconfig
