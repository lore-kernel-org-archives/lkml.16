Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F8B20CCC9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630073; cv=none; b=DsaxVslH7rbyLJkKPBcz0tdGLdC2H0lflDYu2El+aSRenuB601my6fQJTnw++foUZ8hSx5cPC/kKBVC+bcmBVR/ujJEEF5ykjAX3SK/elj3d403DeJctXzAqGdaiOZhH0QYfyOkFLfB+Xg/XeP+NvnFyhj0UdPeauq17KmNHVww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630073; c=relaxed/simple;
	bh=fQQSHMKl+HL1fOr8j4fGORV1eLERCQ1r6wFgntDTzvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEWaN5tZYY9+nyP/q7CpAOOm0G4uhIVFySOjoWUZZ3yvYO1meBSQILJnp0rAwbVApojrAIYPjsuigibD//RJG/jmibVJfxLNd5a3V54fBRgqDcq5TxklhETVfuvNoRrrapALCola5YTEyMvWUlS6a/Gj+HVeFoMISneth9VUkrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjJC27Yu; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjJC27Yu"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0ad744811so66446d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630071; x=1747234871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P88DLJwjZTV6+YJp5PA5/tnjoUbLaNgJShCD98PEJw=;
        b=WjJC27Yu+f9pfVKGtJmepanGDUF8/Yuov/Heos0n2tC+8F8UFUs9KoJQEzh6HHufWo
         8/+B7QvQ5PVwU0mgZtohV7HZAqs47Pll8ptW8AKwLh9U024d4ThybSi/H3PmnbgeMkjS
         gtmE+nynCIwE/Sj5B93hrXBx6BNEW0fD+dgotmSGeFKn2fRGuOMvRHpIlhMxgSzQ+cr4
         aUK4WsEsMaPOw88b0VbhEFcqJAzNq9YTFiDyWJENZKg2eIAq1xZqGgXPgz1S3sw+NB8/
         7ktzjh1Yln6yCBkjEa2NUGe0r4yTYyTTnjaHmcr1jjhMLDIvR5jMfZx8xfpTW8ETc8rO
         wJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630071; x=1747234871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P88DLJwjZTV6+YJp5PA5/tnjoUbLaNgJShCD98PEJw=;
        b=VIrj/rk9EKEGwtNdKFB7vcGEB5kiUkqDDsNFlQ1tQeXbBtx1pSg/LRBaodQHvSymuu
         oA5giNhb/nMcthW4n+66r3WVzQE/ARe5HbM92AKNUbJ7ImEKXhuBip98P/29lwqtUSvY
         5kpWNePyv4m7JCFqbd1jmlmSos2ztvLxBiAcLGHdts+a+JhFzWIiQcL1dGZDrkppKfek
         lvELDCisBCce75x5FcFUt/BtZGv3IBoAG0frFplFvbKahN0T2saV3pDXqssA9jY+uEGI
         hHS3YPoxopP9wKun2ssvEkm0ZfF8XKpjyHE/+HEvkzROYXWsARKZmzaCs1ulrnABg0Uf
         u1dg==
X-Forwarded-Encrypted: i=1; AJvYcCW4emgvHy57hKfbz5ApR7LTCxoytL+T/g3tn4BFIfDrs7U/lQ5YyZf31yCYV21QBV+UbvVRyPuLDuY5x4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbR9nwSBEBhlLDkGeedqQSRliIbuikEpOFSnymlw0k0+rnaR0A
	k0me0tMQyHlyDG+Wi779JnyQXFjFvNNglds4KvYqoXsJI4a+ilsNRuaYnzKjfCv3x49xu9NRwdC
	ssPWaJOc4m/ifEbIxbkmQjBS/0Eg=
X-Gm-Gg: ASbGncssZ8qL6UI5qJeJJr4DEkN4Zi5h0flOw2hhfyRrkoK8GKPMz7s3D599+zHpeCE
	gr7X6TyBbam5Jn9+/T+D/5bx/YKvwznGQ7TePkE/sIQJ6Rvt2JKrSc7Yc+1nXDs+kjJLpzoXhVE
	EH1vk8Kbsd+BWp4IwAYX93B9c=
X-Google-Smtp-Source: AGHT+IFFpBEl3tD+vAAO3AKleiaarL+ScnybGt92nCTf5nORPfhlz+Z0Rwo3ogxYQXshqUgF+V+GBVifm7gBsWgoZoE=
X-Received: by 2002:a05:6214:cc4:b0:6e8:9a55:824f with SMTP id
 6a1803df08f44-6f5429b354emr52557756d6.6.1746630070743; Wed, 07 May 2025
 08:01:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
 <aBqzcIteOzC9mRjY@harry> <A3307E1B-B741-4C23-8053-72A1CA04D923@nvidia.com> <CAGsJ_4yBn7j3WpCttPB0PVuRCYTYBcDbW2221AaPNLOHSmKADA@mail.gmail.com>
In-Reply-To: <CAGsJ_4yBn7j3WpCttPB0PVuRCYTYBcDbW2221AaPNLOHSmKADA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 7 May 2025 08:00:59 -0700
X-Gm-Features: ATxdqUEizMgKIBqWKtTySGenm7msLmuvbZBCtMD6RABSUsHW1bY0saY3YhYcLjM
Message-ID: <CAKEwX=NyZnNmiERFzwMUGQ8CJ7Pqm_XqHWMQoPjJKnBQefZkiw@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Barry Song <21cnbao@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Qun-Wei Lin <qun-wei.lin@mediatek.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 7:04=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrote=
:
>
> On Wed, May 7, 2025 at 1:50=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> >
> > On 6 May 2025, at 21:12, Harry Yoo wrote:
> >
> > > On Wed, Apr 30, 2025 at 04:26:41PM +0800, Qun-Wei Lin wrote:
> > >> This patch series introduces a new mechanism called kcompressd to
> > >> improve the efficiency of memory reclaiming in the operating system.
> > >>
> > >> Problem:
> > >>   In the current system, the kswapd thread is responsible for both s=
canning
> > >>   the LRU pages and handling memory compression tasks (such as those
> > >>   involving ZSWAP/ZRAM, if enabled). This combined responsibility ca=
n lead
> > >>   to significant performance bottlenecks, especially under high memo=
ry
> > >>   pressure. The kswapd thread becomes a single point of contention, =
causing
> > >>   delays in memory reclaiming and overall system performance degrada=
tion.
> > >>
> > >> Solution:
> > >>   Introduced kcompressd to handle asynchronous compression during me=
mory
> > >>   reclaim, improving efficiency by offloading compression tasks from
> > >>   kswapd. This allows kswapd to focus on its primary task of page re=
claim
> > >>   without being burdened by the additional overhead of compression.
> > >>
> > >> In our handheld devices, we found that applying this mechanism under=
 high
> > >> memory pressure scenarios can increase the rate of pgsteal_anon per =
second
> > >> by over 260% compared to the situation with only kswapd. Additionall=
y, we
> > >> observed a reduction of over 50% in page allocation stall occurrence=
s,
> > >> further demonstrating the effectiveness of kcompressd in alleviating=
 memory
> > >> pressure and improving system responsiveness.
> > >>
> > >> Co-developed-by: Barry Song <21cnbao@gmail.com>
> > >> Signed-off-by: Barry Song <21cnbao@gmail.com>
> > >> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> > >> Reference: Re: [PATCH 0/2] Improve Zram by separating compression co=
ntext from kswapd - Barry Song
> > >>           https://lore.kernel.org/lkml/20250313093005.13998-1-21cnba=
o@gmail.com/
> > >> ---
> > >
> > > +Cc Zi Yan, who might be interested in writing a framework (or improv=
ing
> > > the existing one, padata) for parallelizing jobs (e.g. migration/comp=
ression)
> >
> > Thanks.
> >
> > I am currently looking into padata [1] to perform multithreaded page mi=
gration

TIL about padata :)

> > copy job. But based on this patch, it seems that kcompressed is just an=
 additional
> > kernel thread of executing zswap_store(). Is there any need for perform=
ing
> > compression with multiple threads?
>
> The current focus is on enabling kswapd to perform asynchronous compressi=
on,
> which can significantly reduce direct reclaim and allocstall events.
> Therefore, the work begins with supporting a single thread. Supporting
> multiple threads might be possible in the future, but it could be difficu=
lt
> to control=E2=80=94especially on busy phones=E2=80=94since it consumes mo=
re power and may
> interfere with other threads impacting user experience.

Right, yeah.

>
> >
> > BTW, I also notice that zswap IAA compress batching patchset[2] is usin=
g
> > hardware accelerator (Intel Analytics Accelerator) to speed up zswap.
> > I wonder if the handheld devices have similar hardware to get a similar=
 benefit.
>
> Usually, the answer is no. We use zRAM and CPU, but this patch aims to pr=
ovide
> a common capability that can be shared by both zRAM and zswap.
>

Also, not everyone and every setup has access to hardware compression
accelerators :) This provides benefits for all users.
