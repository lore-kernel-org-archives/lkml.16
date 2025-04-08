Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441C71DF99C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149972; cv=none; b=WNej0w9tehgdrW3W5LBx7H2j+WAjLHMAYoGP912nmQmMYqO1ELKx/KrQNMW1CRQq2CRl9HUR+zn0oP3BV48BwX1zbSh2ZbL1aljRFQoJow9TPvgK3FdzM1JXSPug0GNLBHpS1BUXgsSRg62PDB0lGQsIhVujw506b9AUGDIVlXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149972; c=relaxed/simple;
	bh=kUS+n+GTXvuQCLB81fJehz4UPVJxutBqIIzDQS1ALc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DufeQXn4dOjvzD1H97TBOGo4JpgQKkiwZd14HBNvGUSD52aI6vBa4XviApMuBNmbNPqFMgA1wPM6dVBFl5e6vPkkhRKfgtO7t+a41RQ8LqjsPtILR4Q5TCJ92AfzQE5FqJhGbP2EUi8Q+3F/oQlMcg17iT7wJ2H5iBo2p8lweYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjW4BRwD; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjW4BRwD"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ecfc7ed0c1so52091476d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744149970; x=1744754770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sWLYldlaXwJJPgG72TFrHed0gpDpTfsmgOoFVasc1s=;
        b=BjW4BRwDPePttlqR+WsHGnI6+jI+zOeJezI0FEOMlhmZWX2wAA09IuymSuaH3JBzEI
         RXIMobFVpqHm5vfQEVUp/f0C823OdDuwoYkrJJOnOMO6Jp1Y7qGaIrul26yFH/xwA2d1
         3Ln//qq5oRBqHT7dKsvnNHzWnP/77PUdyZ5y8Huce/P1lsuiHpuuQtYqnJwBEEVH3rqZ
         /4Dx35gZEN2VB8w2W1gttSKvKTXaaCYibLo2e2IFvtxVFPZZA0q3yh/tEUuH+x5yxKjV
         jn7Pc1jPRGmNVg9cCmzUDitXuR3ZneCt7T47dC92xjrIuNZG5L5vdQ/k2Y/NVuA9ApSN
         0Vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744149970; x=1744754770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4sWLYldlaXwJJPgG72TFrHed0gpDpTfsmgOoFVasc1s=;
        b=iEQweyQC9MEahQGkvJem8GKlslJjjfQ1DEGe1D1A7wdauEOSE0qR1Jg6Fid9UcBay7
         EZEh5jC7fHo8eZUDSBKJXK5lGX32LiAsHwZfKOmstmEInxupK8rdaiw0FmNXNFr5s+1s
         L3J949J4B+PvEiJKfs6p7Bc45PKjQ9UnorLyH7pAgrrcNzWK+n5hB84Bu0hK8qE+pR7x
         /rb4gDRVDTnT06Z2HfWNbdRCMDJgFEjKl5atAaBZ/bTub1Yete5N+AqlSkYTo2gBAs+8
         uGt/rJgJi8PfHRQJfGMQTYUbo6xi6CCa7SPFKNbDMd2RuCsfha06V4yfOEwhA7F/Exh3
         Y0YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDPb68EO/3bt6dkKbdJAHlvz2m0g5/azfGgsXrEor6SOHGiuaePW7WORE0I56XI6uaJdoykucnZvsHnUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLJpsC1K3Qenu4YPrB1JZEpBO26FStKfOR+rAjO7GfqQxKsaxd
	qo9a+sxLMXnS0kmjiIGUqmWdo91xSco6rFIIvUqXZKIKAqlRuHOQJrPCDrhCnH29SOU5Csqhx+i
	xnERQnZID/4Ht8nCLK29/GIPYjQrXNjA5
X-Gm-Gg: ASbGncvShjri/LK9a0Q2blJ8sFJMxeDi2IGRgq+N0sHyuFygpnWb+ZWF71gJ7uyyp1d
	E6xsM88oL0w9uMkfUO/5dQR2vl7fuq29kPWgNNdRKnwQkG+QXGshhawFk0aLAYARWq4XkLvis+U
	9gKxQpeb9kpnwfLtz2GPnntvti+BUa0NWLOChCh7BEB4M2Nj2sE1VpKG0Ncg==
X-Google-Smtp-Source: AGHT+IEEnL0AwSgWq2bYA63OtnC1+P7QnpEoLRfTsEdORqc+T0IgUfQz79hV8Iy6qv+3uTrGgqrCEJgdruYLf9nMQ/w=
X-Received: by 2002:a05:6214:1253:b0:6e8:9866:7398 with SMTP id
 6a1803df08f44-6f0dbbd8d00mr16377836d6.22.1744149970018; Tue, 08 Apr 2025
 15:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1743810988579.7.125720@webmail-backend-production-7b88b644bb-5mmj8>
 <0dbbbe9d17ed489d4a7dbe12026fc6fd@beldev.am> <f8063d3fa7e148fecdda82e40b36e10a@beldev.am>
 <CAKEwX=NMjfC1bKTVsB+C7eq3y=O0x3v8MW7KxUfhpg6UUr23rw@mail.gmail.com>
 <f023ba8341f9b44610cc4ac00cf0ee33@beldev.am> <CAKEwX=MXD9EB242WkB50ZBmZgV-CwrAHp=_oE+e=7yHDfrMHtg@mail.gmail.com>
 <3f013184c80e254585b56c5f16b7e778@beldev.am> <20250408195533.GA99052@cmpxchg.org>
 <24e77aad-08ca-41c4-8e64-301fcc9370b1@konsulko.se>
In-Reply-To: <24e77aad-08ca-41c4-8e64-301fcc9370b1@konsulko.se>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 8 Apr 2025 15:05:58 -0700
X-Gm-Features: ATxdqUGmlsm6fccF-ip74f4yqSSt7Wk7y4OxBKshFRqf4g9Y2PQvAlmsn63UjdM
Message-ID: <CAKEwX=Pf3qA=u7KBcknnkYnfJ48YmUj8FYN=X5C8OCXrsMW9=w@mail.gmail.com>
Subject: Re: [PATCH v2] mm: add zblock allocator
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Igor Belousov <igor.b@beldev.am>, linux-mm@kvack.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 2:38=E2=80=AFPM Vitaly Wool <vitaly.wool@konsulko.se=
> wrote:
>
>
>
> On 4/8/25 21:55, Johannes Weiner wrote:
> > On Tue, Apr 08, 2025 at 01:20:11PM +0400, Igor Belousov wrote:
> >>>>>> Now what's funny is that when I tried to compare how 32 threaded b=
uild
> >>>>>> would behave on a 8-core VM I couldn't do it because it OOMs with
> >>>>>> zsmalloc as zswap backend. With zblock it doesn't, though, and the
> >>>>>> results are:
> >>>>>> real    12m14.012s
> >>>>>> user    39m37.777s
> >>>>>> sys     14m6.923s
> >>>>>> Zswap:            440148 kB
> >>>>>> Zswapped:         924452 kB
> >>>>>> zswpin 594812
> >>>>>> zswpout 2802454
> >>>>>> zswpwb 10878
> >>>>
> >>>> It's LZ4 for all the test runs.
> >>>
> >>> Can you try zstd and let me know how it goes :)
> >>
> >> Sure. zstd/8 cores/make -j32:
> >>
> >> zsmalloc:
> >> real 7m36.413s
> >> user 38m0.481s
> >> sys  7m19.108s
> >> Zswap:            211028 kB
> >> Zswapped:         925904 kB
> >> zswpin 397851
> >> zswpout 1625707
> >> zswpwb 5126
> >>
> >> zblock:
> >> real 7m55.009s
> >> user 39m23.147s
> >> sys  7m44.004s
> >> Zswap:            253068 kB
> >> Zswapped:         919956 kB
> >> zswpin 456843
> >> zswpout 2058963
> >> zswpwb 3921
> >
> > So zstd results in nearly double the compression ratio, which in turn
> > cuts total execution time *almost in half*.
> >
> > The numbers speak for themselves. Compression efficiency >>> allocator
> > speed, because compression efficiency ultimately drives the continuous
> > *rate* at which allocations need to occur. You're trying to optimize a
> > constant coefficient at the expense of a higher-order one, which is a
> > losing proposition.
>
> Well, not really. This is an isolated use case with
> a. significant computing power under the hood
> b. relatively few cores
> c. relatively short test
> d. 4K pages
>
> If any of these isn't true, zblock dominates.
> !a =3D> zstd is too slow
> !b =3D> parallelization gives more effect
> !c =3D> zsmalloc starts losing due to having to deal with internal
> fragmentation
> !d =3D> compression efficiency of zblock is better.
>
> Even !d alone makes zblock a better choice for ARM64 based servers.
>
> ~Vitaly

Could you expand on each point? And do you have data to show this?

For b, we run zswap + zsmalloc on hosts with hundreds of cores, and
have not found zsmalloc to be a noticeable bottleneck yet, FWIW.

For c - in longer runs, how does zblock perform better than zsmalloc?
In fact, my understanding is that zsmalloc does compaction, which
should help with internal fragmentation over time. zblock doesn't seem
to do this, or maybe I missed it?

For d too. I see that you hard code special configurations for zblock
blocks in the case of 0x4000 page size, but how does that help with
compression efficiency?
