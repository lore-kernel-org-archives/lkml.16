Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC6613541B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745302625; cv=none; b=gcS6grUDr0VXseowy/CriWACEI80BqR7+QBtF9X7RCAznACNJUIn3+pR0lWlXGTGsPEkhPBHTHND9WJl3kOE2WJ2tqdJV98BaxLOhacOJFoRL+tFoxcdNKlvjBASmmISdjJbHIBgO25LHGLVXreLxAn0eZjnlbTLB+YO+VcAarg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745302625; c=relaxed/simple;
	bh=5D2izRsgAKYHtxRvzimEvoU0qAt1TpW/2ApDuRS+Tj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ez2ANXjqkHQeiGoJQuYxYSoDgn+VuTSPkDfqPB4FRb3xcnk0sOct61DDxlZM6BuD4gz/uqw5RWIUR8NLQWQtXFfdyaYYFtI7CJaNOcBySUfT1Y7RuITTzAYlsqNm9kfEIpnN/btaEjKZtQKglde7jbfWe4y0OvPHhrHWnYFzGFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Wp7mPs3s; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Wp7mPs3s"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfc8faef9so44197921fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745302621; x=1745907421; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D2izRsgAKYHtxRvzimEvoU0qAt1TpW/2ApDuRS+Tj8=;
        b=Wp7mPs3spkgrIc6JmNrG5ZGxrrSqw/y45+WeP8rmA0FSDyEBmbZsP5ApsMcoaBIRJO
         +9Yutr/IEusLIR7tqnNkVQ7SbtjjPPwB1K5crtTCQfFlbijaHbQ5ENCwOOK7OspjISFA
         7eEVsSO0aj+yxhBWe9+eTEJTT86FFQCrYOgLTZPiYMwMlBMNuSZ8J3RUAQpAD+F0PLwi
         dj7zXRPSpTQljKMeLHmKyzdiLq+RpjTg0+E3DK0a8fvdyi8vwelTkGTC08eKvnDEghrf
         POFPp/sX3yl1hJ0M4FHi4fXJsV7dr9KZc/EeCLSCbKEs7JwZzOn4KeMPs7qdOyjcI4cP
         Ir9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745302621; x=1745907421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5D2izRsgAKYHtxRvzimEvoU0qAt1TpW/2ApDuRS+Tj8=;
        b=vRp4Bgwtt2avQgp5mGP3jRjD0Cd+KBQnKgSCo7rabfhwtR7hrU/ywqQWe2BFojzPP6
         d9JD2nOIy7VsxywzyBVa/YqRaHZUl8EtEhXzD/DIv7xRaUydIEaLH0Lck1y7EhlSvrYj
         Wrv9yJNtr+gP8uNkyyGzT/wh0dnnpAuIDlSIjtq40biWWLTsas0Ra/CEOjR722wwtKsS
         MJqtJYb9DK35Tw9DpDaJ7fhzAOgmzPgpZNvz9GNjOAcTl0026SqJuAO/MdxSd5c08VjS
         YhcTr2Op4Nwng7znSQ9LUpk80x+XsWRkp3j+ue028iUuI7g9fKUhZH40HtqUnifcJ6Ja
         0XGw==
X-Forwarded-Encrypted: i=1; AJvYcCVjir5iQNbsb91zoTnk+sdMeIz+4U1zBKaRqeaghdrI23HGwcN9gFJkCPIyLpLcOphWwSDgQTYDBTa/Oms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuH8eQG8tqT5FGmRRfv4LOEBcbVQ/ZTs/6MBwt/VNytof2E4VL
	JR41XAfJJzkjPrLs/OieXa5E3db6Puktm5cDMU44C55+6yHC997fNL0UskUQKf6zlOjnx+iQhgA
	Pzp5/y616WE2xAMQrzr/6Du0VV0GiOSN/E2ZZEQ==
X-Gm-Gg: ASbGncviu7dag5qB/JJ5GgNE38P4x00W7ImBpxRu1oQWYnLJh5AsQ3wMFXNrX5tsw0X
	bhZtpplTKO2yrl6/z41XGUu2LjLOlNPkQdz49DIA9zBIK5j7G2yTxHGnoT/0FHyt7pVAUWkgj2R
	OhOsMzC1fAiMjTG8m83TdNZNKBnSI9s8BdNvkMLom/WPmanw==
X-Google-Smtp-Source: AGHT+IHGRS0qXzqle3yGdgHA6X1Qi3PEyAPNmnLh3Z4tRHEAfO7fglaouhYhsnKctKLyXZ43gMvBVIsV8Ih4fj9V2oc=
X-Received: by 2002:a05:651c:154c:b0:30b:fdc0:5e5d with SMTP id
 38308e7fff4ca-310904c7bc7mr43871941fa.4.1745302621034; Mon, 21 Apr 2025
 23:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
 <519e12b9b1f8c31a01e228c8b4b91a2419684f77.1745225696.git.hezhongkun.hzk@bytedance.com>
 <972CD38C-9084-4CC0-8AD7-127745CACCDF@linux.dev>
In-Reply-To: <972CD38C-9084-4CC0-8AD7-127745CACCDF@linux.dev>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Tue, 22 Apr 2025 14:16:23 +0800
X-Gm-Features: ATxdqUE7T5mpqo-BO9nWbrFqaTpCcysceYqZubv9UTiQZybzW2fT_qeWz6DV_qY
Message-ID: <CACSyD1Ouy=iYY85V7rEHq5sU_VNUsninMkBow=RWbyOSJ6n4WQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH V4 1/4] mm: add swappiness=max arg to
 memory.reclaim for only anon reclaim
To: Muchun Song <muchun.song@linux.dev>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, mhocko@suse.com, 
	yosry.ahmed@linux.dev, yuzhao@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 5:35=E2=80=AFPM Muchun Song <muchun.song@linux.dev>=
 wrote:
>
>
>
> > On Apr 21, 2025, at 17:13, Zhongkun He <hezhongkun.hzk@bytedance.com> w=
rote:
> >
> > With this patch 'commit <68cd9050d871> ("mm: add swappiness=3D arg to
> > memory.reclaim")', we can submit an additional swappiness=3D<val> argum=
ent
> > to memory.reclaim. It is very useful because we can dynamically adjust
> > the reclamation ratio based on the anonymous folios and file folios of
> > each cgroup. For example,when swappiness is set to 0, we only reclaim
> > from file folios.
> >
> > However,we have also encountered a new issue: when swappiness is set to
> > the MAX_SWAPPINESS, it may still only reclaim file folios.
> >
> > So, we hope to add a new arg 'swappiness=3Dmax' in memory.reclaim where
> > proactive memory reclaim only reclaims from anonymous folios when
> > swappiness is set to max. The swappiness semantics from a user
> > perspective remain unchanged.
> >
> > For example, something like this:
> >
> > echo "2M swappiness=3Dmax" > /sys/fs/cgroup/memory.reclaim
>
> We already have this kind of style (mixing numbers and strings) within
> io.max under cgroup v2. As a result, I'm okay with this change.
>
> >
> > will perform reclaim on the rootcg with a swappiness setting of 'max' (=
a
> > new mode) regardless of the file folios. Users have a more comprehensiv=
e
> > view of the application's memory distribution because there are many
> > metrics available. For example, if we find that a certain cgroup has a
> > large number of inactive anon folios, we can reclaim only those and ski=
p
> > file folios, because with the zram/zswap, the IO tradeoff that
> > cache_trim_mode or other file first logic is making doesn't hold -
> > file refaults will cause IO, whereas anon decompression will not.
> >
> > With this patch, the swappiness argument of memory.reclaim has a new
> > mode 'max', means reclaiming just from anonymous folios both in traditi=
onal
> > LRU and MGLRU.
> >
> > Here is the previous discussion:
> > https://lore.kernel.org/all/20250314033350.1156370-1-hezhongkun.hzk@byt=
edance.com/
> > https://lore.kernel.org/all/20250312094337.2296278-1-hezhongkun.hzk@byt=
edance.com/
> > https://lore.kernel.org/all/20250318135330.3358345-1-hezhongkun.hzk@byt=
edance.com/
> >
> > Suggested-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> > Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
>
> Acked-by: Muchun Song <muchun.song@linux.dev>

Thank you for your time, Muchun.

>
> Thanks.
