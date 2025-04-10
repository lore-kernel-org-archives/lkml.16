Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACAA1E5B6F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744256935; cv=none; b=aJsl7yBzucfSs+Jl3RgAcZKWI0woCBNuos2WDxWCdZy1BhsnMBvkHrp8GBLfp2gSQrHJcmBFQkupF/6/GHMahPuCcgj4QTIEZLK9nqYvcLBtv/qgpQ1ghVWmXW45XkJrLeurLYhI+lntcOEe31mTw884mvEtg6JOiPfQ2q1TV+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744256935; c=relaxed/simple;
	bh=UOzs+SDADQYEqwd+BcYaNVD7rk0Cb4BIbIh102bT6QM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=izC9prxR7y7Qr1/XgWubWYKR4XsBm1A8B82/aFX6VvqvOhvJ++h/J8yocKD7seTirVRFnCBtp3jtfuWBpxPbFujAgZN4FHeJ1stH3AjqtSXJThVziH+VyhbjD9sx29/Jr9xIjC4tWFQbJYAIrrR/EmDBoxMMHK0JOLNLUdT5juM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GjyVnmiu; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GjyVnmiu"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so443727e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 20:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744256931; x=1744861731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFEobiF77Xtm1NLYLUKziWY3dV021WSRPxibCoOdOTA=;
        b=GjyVnmiupzeveAMC/R5dFSJ1Zb67EG9cfFldrpQsUbsZJ032ZD2wfGQpjKOioYq0IH
         nTeydiAiy/7lWGbBRffiOmFEaYev7BPfrUlT0psFJkPINsybyF+141ZykF4BDx6D/xFl
         MOMHpErhDs24wELR4GNKCuLlA3GnsQCk1J7f0gO/B4zDX0X8JZ2bvrhw0NCnnYu6hbtw
         p4d0M9t84eMkumjgbLqFv240X7REJyQJp5NV8cJUje95osGS6hGNwXS0xPapVDwejOk5
         WUWpAu3VNXwWopuqkqMFFcQCHAOIIl4Yn8rQVuiSSGBA5AMkEEVPTLyldDsyRaCDk+Ks
         RTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744256931; x=1744861731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFEobiF77Xtm1NLYLUKziWY3dV021WSRPxibCoOdOTA=;
        b=aNo0JnTWbhKf8Ptimgq2Ey/Jwloa2tB4Xa9cCxDSsFp9SeB35gcujQ1uX/MJ0O4545
         T9tyHmrURzULYKNu6P2MHjsBBf9FjukazJWFTl7QeMyFCPEl8rhohBQVkntomnS7QJ2m
         g+V9ha1i9mTrP6rLjRoCzq0Apb3wDF4nD086+5eQvZ1yAyLhPwbXabOCiMYQ25URrjNH
         ljcyA3v/mdUvZVBZw6XXazoUDPMnjIzUTRMphLlRMKEY4fdjImLgL9IjxhtJlj36sST2
         /QfIa0drUbjI+POaqz7f/aaaewIt0yoQdpPJpXIIWRGqsjt8OUaAqLYgVoKCpPlY6Cj5
         n1rA==
X-Forwarded-Encrypted: i=1; AJvYcCWa/VAdpVNbqfYp0wVbxqHFgIf1VrzDfyelswh5h2Q4HK87/DNOiB8El3Im3aSjPUALUVI+grBH8bTqGrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpZdwiiLEGJW+IUbI5V6lT7DyXd7aFR1QMs67MJWNWQvM94wMq
	KN6uCMjJ9i7yC5yzKKQv9ALq7anr8omyOxFY59YEU67N0CX+OUJW2DGvKHmK2MfA5i9mF2lcft0
	U6iN+xx1pdkK3++cuJbvtEIHGFW0RKpHrDnj3ew==
X-Gm-Gg: ASbGnctl+L2O4AlyCBtXPVlzk/OZq4FoVNiDX8gYq9srOi0VhHMQWgBVsc1WSRXMIUo
	K/eohhVHyGbWStHTmAWLtgU9tx/N6W1D7lF7S/HupjEs0HxSaQMKecL5IEODTpYlOVotQ3FSWVp
	HiSAQx8Aw1b/2+kRgferWqv9EJaHjkXqyt49M=
X-Google-Smtp-Source: AGHT+IHCd0S/mKr+zDeztx1oYbkZsJ8x25MQK6iXPpSdtWnmpNJ+LDqPjn53QebjIJrvsB8DTFlH6p+yOIdlj2BpZ88=
X-Received: by 2002:a05:6512:1325:b0:545:441:52d2 with SMTP id
 2adb3069b0e04-54caf5b03e5mr282819e87.23.1744256931011; Wed, 09 Apr 2025
 20:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
 <720e8e2c5b84efed5cf9980567794e7c799d179a.1744169302.git.hezhongkun.hzk@bytedance.com>
 <20250409190933.3f08db6d6c1f13bc14a170f9@linux-foundation.org>
In-Reply-To: <20250409190933.3f08db6d6c1f13bc14a170f9@linux-foundation.org>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Thu, 10 Apr 2025 11:48:14 +0800
X-Gm-Features: ATxdqUHXv7zHPa7GukApUvtnAIBtUVDgzl9cvrMAx0TDyFwNsSc2s0IF1qkRrso
Message-ID: <CACSyD1NbZag42VQ0kdyjnDPU2cJimF9K51d7k__pXi-4joJa9Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH V3 1/3] mm: add swappiness=max arg to
 memory.reclaim for only anon reclaim
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hannes@cmpxchg.org, mhocko@suse.com, yosry.ahmed@linux.dev, 
	muchun.song@linux.dev, yuzhao@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 10:09=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Wed,  9 Apr 2025 15:06:18 +0800 Zhongkun He <hezhongkun.hzk@bytedance.=
com> wrote:
>
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
> > ...
> >
> > --- a/Documentation/admin-guide/cgroup-v2.rst
> > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > @@ -1348,6 +1348,9 @@ The following nested keys are defined.
> >       same semantics as vm.swappiness applied to memcg reclaim with
> >       all the existing limitations and potential future extensions.
> >
> > +     The valid range for swappiness is [0-200, max], setting
> > +     swappiness=3Dmax exclusively reclaims anonymous memory.
>
> Being able to assign either a number or a string feels a bit weird.
> Usually we use something like "-1" for a hack like this.  eg,
> NUMA_NO_NODE.
>
> Perhaps we just shouldn't overload swappiness like this.  Add a new
> tunable (swappiness_mode?) which can override the swappiness setting.
>
> I guess it doesn't matter much.  We're used to adding messy interfaces ;)
>

Hi Andrew, thanks for your review.

In the initial patch, I used 200 (the maximum value of swappiness) to repre=
sent
the semantics of reclaiming only from anonymous pages. However, someone
pointed out that the current usage needs some fine-tuning. Later discussion=
s
suggested using max(swappiness=3D201) to represent this specific
semantic explicitly
in the code. It was then discovered that MGLRU already includes this logic(=
201),
so it's only necessary to make the intention of the code clearer.

So we can add the max to memory.reclaim and lru_gen.

More info please see:
https://lore.kernel.org/all/Z9Rs8ZtgkupXpFYn@google.com/

>
