Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047462D9EF1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170121; cv=none; b=iyKF93JMzQyi+uXUUlwrZ5M+FSXQS5CdHeICgNGJoohTBY4B3sCx4l184D/L+28eShLmAAZ1U+QHpBV0CbLuP9bh5AdDExhx14Gd49HBnwUtVMiZmgS7pgx8pDrqR1+DC9m69h+i5MGP555IhfR1ce/zHo7Zj7YRG4VXEeqF1Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170121; c=relaxed/simple;
	bh=m5H3llY72enjkEdNIToGWJYvPuL2qq4dnT9xlwtzu20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKaTWaPj3QQwu92X2Zs74DePpmGFe4qlC0fLAXhmNqv427cOHx/KZQhsnQZVXtsHMXeHGmoGyCt/DGByOUg5IlYPmBUMWfdo1LLXLG2XOsFPtAW/vuYTpipXZxuWaBeozVv1w7ASPXOGEwnjPYjiSRIYG5PQRmiCcrSlcn1c+bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnkgsDZd; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnkgsDZd"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so59100626d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750170119; x=1750774919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5H3llY72enjkEdNIToGWJYvPuL2qq4dnT9xlwtzu20=;
        b=YnkgsDZdltnEnQsE0Udc/SVbKIkI4zwdX5m91+9r7cvdrSEI14Io9gnYDRRWcwzTxt
         Ocja5w+3yFPzeiEYe1vNqQ7pRe5wRo2wL3cWzyzpAhwv74Pe6MSCqcvQpiRTq8buk6dA
         rnXc+CAee9c90cz98clC+4N0Kq1dSSguz2m186GZpdt2Sq/kRx9vscPx2uQJMrHOpPKB
         zVCQ6kXqRkdWxrOH+HbyLoA3mQHtMuU3fs9cUBOT+0KovVbAwlDVOoXwTohgdl4a/38v
         Pj9pzJ1DbNe3a79Z7zAZSCs2oRkwTya646aO7sEW3sNP56LSXURVMiSbuTdMInrTJlzx
         B6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170119; x=1750774919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5H3llY72enjkEdNIToGWJYvPuL2qq4dnT9xlwtzu20=;
        b=bdeFY87wHQ3WLOijFXecmSjslZ0HLdu7OCJGDgJDGch4fQtxcmXbQoEv9bUE0ilvAf
         wrPCQwKRUtot80RnI9K8DnsZ25uVO7IQob22KWHaV7omKiYjSSXfUd4VDHRQsl6o8fsf
         DT2RomxPABPzH7nElnOYOJTglDc6SBKzGzIaRTwCF7I26uk7UAwXmt5CTPsmapLiUE70
         r5ns8X+srVjLTetB7oJiCP1j/4P+S07iqHDHUAiIbfmDB1IT0ydLMOuMJPkz8XkhWLj9
         AAVJu252k8XJH1bqrwYYtPN/Q2anVIIn1TiMZmVYcleJAkDweRxX7Rg4/by//vfVSnWG
         c2zg==
X-Forwarded-Encrypted: i=1; AJvYcCVY4f6+SZBaqhDLMU9zRdmv+hQZReyMlVaeXZfJA8tnWs9Rgqnkxqac9DLPLiJaGKyEh8QqdNAJ5hF/8wc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEGnbirruX+h5qi2HT+1hieJcArUnXP1/EoFX0+yJnxgYZ9A+l
	oDgT2W634v0AbdWuzmi+64w46mOw94sMYR8To3JEfYvSGbPrTMgJrDfSv2pOAy7Yuv6xIJvnc1O
	Hd8NDHNLCpx4tvsCRWObqPro4hlVz158=
X-Gm-Gg: ASbGncsQYjD2G+MWQFUzd1ourzOaIDecKFvPrXPn9eh1l1RxsDwwtI4+HGDRWeGLK0y
	YCIT6XTkcGxMGNW5SsX0+dXgUjyaOyEJN43c+ZQ3rbctWVUlqs3vFZkTxnlc5DVx6dDK25gjKOf
	XJlhOXlPTemvLFii/T1xL7XiCGD96Kdnnw1vpMWfYIlg==
X-Google-Smtp-Source: AGHT+IHYNkrCgtJHt2hFgEP+iYzHoZb39T53y/Gl2gXFOZbEhw0D+9micgfKOfZ2G95P3OgJvLkG2Kh/Ej/C/K4Aaj4=
X-Received: by 2002:a05:6214:5b04:b0:6fa:fcb0:b88d with SMTP id
 6a1803df08f44-6fb4777844amr254933506d6.28.1750170118787; Tue, 17 Jun 2025
 07:21:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MsP6LGjMRNyaHnO5MkE_ne-u-cKLbGfVQcSR-ALoxBwA@mail.gmail.com>
 <20250616034106.1978-1-21cnbao@gmail.com>
In-Reply-To: <20250616034106.1978-1-21cnbao@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 17 Jun 2025 07:21:47 -0700
X-Gm-Features: AX0GCFsLfKaP0pe5rAQXmN-MLD8Oy91foKqjJyGMkrVUvROAKlnJQR793e_ehyQ
Message-ID: <CAKEwX=ObLVcbR9q7ZvR3WE2hhmxLpk1bSuvcbWZwo5o5vPCDRA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Barry Song <21cnbao@gmail.com>
Cc: hannes@cmpxchg.org, akpm@linux-foundation.org, andrew.yang@mediatek.com, 
	angelogioacchino.delregno@collabora.com, casper.li@mediatek.com, 
	chinwen.chang@mediatek.com, james.hsu@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org, 
	matthias.bgg@gmail.com, minchan@kernel.org, qun-wei.lin@mediatek.com, 
	rppt@kernel.org, senozhatsky@chromium.org, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 8:41=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> Hi Nhat, Johannes,
>
> >> The way you implemented this adds time-and-space overhead even on
> >> systems that don't have any sort of swap compression enabled.
>
> I agree =E2=80=94 we can eliminate the time and space overhead by refinin=
g the
> code to hook kcompressed only when zswap or zram is enabled.
>
> >>
> >> That seems unnecessary. There is an existing method for asynchronous
> >> writeback, and pageout() is naturally fully set up to handle this.
> >>
> >> IMO the better way to do this is to make zswap_store() (and
> >> zram_bio_write()?) asynchronous. Make those functions queue the work
> >> and wake the compression daemon, and then have the daemon call
> >> folio_end_writeback() / bio_endio() when it's done with it.
>
> > +1.
>
>
> But,
> How could this be possible for zswap? zswap_store() is only a frontend =
=E2=80=94
> we still need its return value to determine whether __swap_writepage()
> is required. Waiting for the result of zswap_store() is inherently a
> synchronous step.

Hmm, I might be misunderstanding either of you, but it sounds like
what you're describing here does not contradict what Johannes is
proposing?

>
> My point is that folio_end_writeback() and bio_endio() can only be
> called after the entire zswap_store() =E2=86=92 __swap_writepage() sequen=
ce is
> completed. That=E2=80=99s why both are placed in the new kcompressed.

Hmm, how about:

1. Inside zswap_store(), we first obtain the obj_cgroup reference,
check cgroup and pool limit, and grab a zswap pool reference (in
effect, determining the slot allocator and compressor).

2. Next, we try to queue the work to kcompressd, saving the folio and
the zswap pool (and whatever else we need for the continuation). If
this fails, we can proceed with the old synchronous path.

3. In kcompressed daemon, we perform the continuation of
zswap_store(): compression, slot allocation, storing, zswap's LRU
modification, etc. If this fails, we check if the mem_cgroup enables
writeback. If it's enabled, we can call __swap_writepage(). Ideally,
if writeback is disabled, we should activate the page, but it might
not be possible since shrink_folio_list() might already re-add the
page to the inactive lru. Maybe some modification of pageout() and
shrink_folio_list() can make this work, but I haven't thought too
deeply about it :) If it's impossible, we can perform async
compression only for cgroups that enable writeback for now. Once we
fix zswap's handling of incompressible pages, we can revisit this
decision (+ SJ).

TLDR: move the work-queueing step forward a bit, into the middle of
zswap_store().

One benefit of this is we skip pages of cgroups that disable zswap, or
when zswap pool is full.

>
> The use of folio_end_writeback() and bio_endio() was the case for zRAM
> in Qun-Wei's RFC.
>
> https://lore.kernel.org/linux-mm/20250307120141.1566673-3-qun-wei.lin@med=
iatek.com/
>
> However, the implementation tightly coupled zRAM with reclamation logic.
> For example, zRAM needed to know whether it was running in the kswapd
> context, which is not ideal for a generic block device =E2=80=94 the role=
 zRAM
> is supposed to play. Additionally, the code was not shared between zswap
> and zRAM.
>
> Thanks
> Barry
