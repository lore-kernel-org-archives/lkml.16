Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895E21FC0ED
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738824942; cv=none; b=L2KgkFYHQx+7CJxqKCtO0PAXo+i5C81MB3TdKgm86eqyMmabO1FW8bQLLqhJJ76416fH+ixS1bhecJ+dGv/3rIsDAjdEUOWlgV6gI/3r0eDC+6wYPN7QCzlVlsQX8sglZxLqDTu0DYWSnSQo0aSZmV2YKTWR6OWQFx5KvJA1CO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738824942; c=relaxed/simple;
	bh=wvZpzFqsjPACbzTXMQdG48n0MCvr8dXwRSU6JwN/jLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2JwLlHytTjnc34m5sk5HGWoHhTVLG7zwTk+ccM2hpd+0yoRisZLr6dPhTeEenR8SwSqtUViTXUFK4/3gMbwWrC7ojk9fOyNbv9uRqD20egrCY7azxoEIFO2AXYItkKI1GHilP5mFICPkoJa+TD0KkJjFFn/Ec1BpcWOTOG2HyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDPu49YZ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDPu49YZ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-307325f2436so5154251fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 22:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738824938; x=1739429738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYxML1IvkX/tlwSsdd/qDyAsTAIzYWO3WovQD8yPps8=;
        b=cDPu49YZw8i1CsC8Au+BB4N7Oga1AOH3d831FwpddTJmcES4aARgvOuPuVq6VfANb2
         noiWBzyhA0+H3slBxzcgX/Tdut0+DlQPerdTLqw98U7kMzYst1Oiqb+E/FoPhx5AaI1b
         2tKG38x6baM+tTzT5FvpUS5FeXFcptX06tNgVaOfWFFpd0cOYjnmUPGrmSjmg6enCqzX
         5sbdHDvWuxpe6+492o2fb+gDciztWFPW4e0Xo+jVgJyVDOENR4LtUYYwe2AJYdbd6YsE
         0Nz4ph/hhzSNPzAevBLz3iSDzXcCN0HFhVD02W2Z1RXX+M01Wp1FYAsC45x9YTGX54Bh
         kzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738824938; x=1739429738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYxML1IvkX/tlwSsdd/qDyAsTAIzYWO3WovQD8yPps8=;
        b=rt1YKeuThcbtEU9p2BJxNsuWrQIu8ttXRDURxxe+jiHaEujDCazNfiCHji20tmG86I
         YaC10PoV2V6Asw378/Z2SdCzQeSdlIpSQSpJdohh+8FCQbh+L5woz9IikCF0BUQRIAXr
         z7R8cxg8VPJWw9S/ZkpR4occIktaXL1M5Iu60jTLLXUSP90CRGNaNOConeq2dsc9giBY
         vgMpdgs9dCBb+Xd7tDRN2dyvomtipf0/kcugiwSz51T1WHv559077JBZpuHw3kPzC9y2
         g3yuQbUcYFSyiE+U2oHL685GGIx6ZvGkk2NRaWQkeBUJIYjS4vyQHXfY5+5yY/Y/RkXO
         JAqA==
X-Forwarded-Encrypted: i=1; AJvYcCW/hgVhF6YEULnVr7wjyOWYr2wxp9aPCOr9WWYM5d8L5eHHHR26R1f9jN9i5YTzkKa8B5pWzxk4rcABWuc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5fiXS7SysVkWxlH+r1sghoZadZBV3t5Y6M6iUhfx2n3Md1y9
	D7r2c9knR9yyJbzxUKVmcoTmP5gi0zELQZsZFjHjQrDlt15BrzW5/BXdbtFMs41BxqK5qT1RfeZ
	GB1U5IH7VTJws1Y7/lA7k7pYctI0Hb6GOB+c=
X-Gm-Gg: ASbGnctjkmTV8WR2LRySuFjKIbYHjIXNHE1USOfIEVaik2qOkIs289RGOx+/pYEaglH
	I1MPtistNnASLgG101rK4zM0gn07udRrCBUH5T85/3estsfeRwHrzJ8+ZyLChXbqjQPno4M9L
X-Google-Smtp-Source: AGHT+IEoRUgWvsN+VPa1Lnr21xtLoHTS1yZYhwFh18Q05mc2Z5sFhWyJRAYjCrkEH1KxoE2+BMFU2O8Zs1330IgxfMU=
X-Received: by 2002:a05:651c:2225:b0:302:3c78:4ea4 with SMTP id
 38308e7fff4ca-307cf370fefmr19656601fa.30.1738824938259; Wed, 05 Feb 2025
 22:55:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org> <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
In-Reply-To: <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 6 Feb 2025 14:55:21 +0800
X-Gm-Features: AWEUYZmxJd7uZ-US7tSScgg6iDTwpXgeuX_q0pRG49_fxDXdBe6tPR1AAidDZnY
Message-ID: <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 11:49=E2=80=AFAM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (25/02/01 17:21), Kairui Song wrote:
> > This seems will cause a huge regression of performance on multi core
> > systems, this is especially significant as the number of concurrent
> > tasks increases:
> >
> > Test build linux kernel using ZRAM as SWAP (1G memcg):
> >
> > Before:
> > + /usr/bin/time make -s -j48
> > 2495.77user 2604.77system 2:12.95elapsed 3836%CPU (0avgtext+0avgdata
> > 863304maxresident)k
> >
> > After:
> > + /usr/bin/time make -s -j48
> > 2403.60user 6676.09system 3:38.22elapsed 4160%CPU (0avgtext+0avgdata
> > 863276maxresident)k
>
> How many CPUs do you have?  I assume, preemption gets into way which is
> sort of expected, to be honest...  Using per-CPU compression streams
> disables preemption and uses CPU exclusively at a price of other tasks
> not being able to run.  I do tend to think that I made a mistake by
> switching zram to per-CPU compression streams.
>
> What preemption model do you use and to what extent do you overload
> your system?
>
> My tests don't show anything unusual (but I don't overload the system)
>
> CONFIG_PREEMPT

I'm using CONFIG_PREEMPT_VOLUNTARY=3Dy, and there are 96 logical CPUs
(48c96t), make -j48 shouldn't be considered overload I think. make
-j32 also showed an obvious slow down.

>
> before
> 1371.96user 156.21system 1:30.91elapsed 1680%CPU (0avgtext+0avgdata 82563=
6maxresident)k
> 32688inputs+1768416outputs (259major+51539861minor)pagefaults 0swaps
>
> after
> 1372.05user 155.79system 1:30.82elapsed 1682%CPU (0avgtext+0avgdata 82568=
4maxresident)k
> 32680inputs+1768416outputs (273major+51541815minor)pagefaults 0swaps
>
> (I use zram as a block device with ext4 on it.)

I'm testing with ZRAM as SWAP, and tmpfs as storage for the kernel
source code, with memory pressure inside a 2G or smaller mem cgroup
(depend on make -j48 or -j32).

>
> > `perf lock contention -ab sleep 3` also indicates the big spin lock in
> > zcomp_stream_get/put is having significant contention:
>
> Hmm it's just
>
>         spin_lock()
>         list first entry
>         spin_unlock()
>
> Shouldn't be "a big spin lock", that's very odd.  I'm not familiar with
> perf lock contention, let me take a look.

I can debug this a bit more to figure out why the contention is huge
later, but my first thought is that, as Yosry also mentioned in
another reply, making it preemptable doesn't necessarily mean the per
CPU stream has to be gone.
