Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFD941C69
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844493; cv=none; b=kC2Ej3Jzsgz61kOVKbtcJmOtX1GCQOKiukDvcOiypbwvzs5susz9bJmYSMaqibBnydB7pylyAcNw1zo9CcTeXzgDsr+KMv6l/z3o844kJnuaCSe6/cXnUa59P397afYpeIYoVDilcg42skHpU9kM2Qh9kekIfxPpVkYzKyy6Kk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844493; c=relaxed/simple;
	bh=GMZ79Ka9Zuz0oUI6o1Ps1mXaCLk1qG2tl7WCl7R7XF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tR8JTdx3w5/XxDy18Z79n9SMvLKu+7l3P3R8+SU6BsYyKw6SAY959dzkcV6j2JphOYiyKCPOuSa4CTFOj5+63f4NVOqPL6hCCLIJCM6SaURNGgzSfiwphRpGsw9YvTKhbR22eR6evktItnvVZw1Iuk+burePxS/0/6ZNrB4c/hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hG01GBAw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hG01GBAw"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad51ba0af48so1111288266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747844489; x=1748449289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oL/6WGZ49yisoo8P60FKnpsWqxjc4g3Ax8sW2bJwTIo=;
        b=hG01GBAwt60C6wjLnF0kyASzcFWSLYwFsw4cyQtSRwomszxXVPylQKbA9To9aQWbMs
         kgJxHurYth0xf24u2WsMaW0Ku576u0SDyERE5kY9FepTMz4DKekyx09tJmnalSZ9z+6B
         yIdiYvvK6IVHfFjrFpELTZH23dNP4tKPiDBmNg81VrwK7j9QGQsitrEe91uvmHnVFrI7
         gVrB3IiFrTcCZOeayYC8Dy/2ujktANvJ+H+39dWn8rn5CkQ7VYnaVjCpxz4UrHF/iWd4
         J001ggq7QcjAMMBbKIIUz3zDFavRaLla/MUe96v7bSJZ6anLpJ9Ldg2HVR+6BgTlkLhc
         mr5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747844489; x=1748449289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oL/6WGZ49yisoo8P60FKnpsWqxjc4g3Ax8sW2bJwTIo=;
        b=PB0IEaun00RcPOGlMkYflla3PS6YBpuZ1jP2iGa/gywkPgk7Ih07+o5nDwf9gL4bWH
         p6dy6f7KBFDUWsEJ5eMmwhZAq3EI/jA2kDX4/7mO6eM8yasCcpoVa+wFsooVs7GNZuoc
         jNT4HoTG5a5oxr+PGKAiiK66saJyzE2eFZUSjxEWgAiqr2PtSeLGa/2gTtMkTdjtWPx5
         DHsUDBjSLK0R647fS20fdHsdY4PYFjzs+fJrZl/UvWR/piv9LIMeoUlcElfaBbVO9q6L
         xyXC5a9V2jHPeeKSiXHVNLbsQhSgFC23EcaDT5Hpg0Vp1L/B3BmQDI5EKHU7yq7/K8DQ
         qLKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCtTTPMcyxmmY4mVXQIhb5N/yZyGLLdfMoB+VKYRrdB/Qq0IplZLQ3AXpbrDZ3ZEWK7l60b1b4jttA3XE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd2tNF0DffZriBUrxx2dGdW6Hq0X9KkLEbbm2ns3AUJb5UfVXU
	C3XtJEibd4Qzd2f3XB5m1im8vel7rjcoUaqX0mJQCeM+huyBh24cZgWO
X-Gm-Gg: ASbGncvxRyiMbFQkt0oU8VV2kPYvG8Auv3B0laU6FuAXkobdX2kcjCaNvDZyXaQX+bz
	0YFaCVgmYFKAHfgwkQEhhu27R28mv2T2ypTjA8cUzqcJbmrOdMEELKg64j9TSMOqhAJll2Ztg9G
	MfkTIXTqnC+O7qYVGM6nSB0ylpcuWyPh0Rh1tLdfOe+q/sTEwWdvNmgKQ4h4FaLvpKZw0jiWdH9
	oHGOVnuz5yuKwz0DZmD5Q0PdelbAWGzioYV88zNu2EMPSVzftsTW82DyD/k1ob7+PBU56wYTsIA
	XeWz/jW/1y8jfd5VjFkAH7o1OjBiwIaDltuwUMUnbYISRL3pfqypyw+QGj8MWRcH31IPqpucHz0
	N9EEgLG91nmgJKCx5P6WnNJPfgoc=
X-Google-Smtp-Source: AGHT+IFgErTuQ6iVa4p/cBsI+I3rxvv7DCD4bCdYsQzl3HjHX9lB0i5S5P6ETzecZn2CKa7Fkc7jiw==
X-Received: by 2002:a17:907:7ea5:b0:ad5:61d1:d8ac with SMTP id a640c23a62f3a-ad561d1db3amr1503300566b.6.1747844489208;
        Wed, 21 May 2025 09:21:29 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325:8d0:f08c:4e6a:b32f? ([2620:10d:c092:600::8a7e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d48ff8bsm917492466b.124.2025.05.21.09.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 09:21:28 -0700 (PDT)
Message-ID: <da5a2a97-060d-441d-b66d-9a0dd6bb7a7a@gmail.com>
Date: Wed, 21 May 2025 17:21:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: slub: do not warn when allocating slab obj extensions
 fails
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, vlad.wing@gmail.com, linux-mm@kvack.org,
 kent.overstreet@linux.dev, cl@gentwo.org, rientjes@google.com,
 vbabka@suse.cz, roman.gushchin@linux.dev, harry.yoo@oracle.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250521142521.3033264-1-usamaarif642@gmail.com>
 <CAJuCfpGtb9j1y93bksErU4NfjPX6tGrP6qvMrazx3+M7dJWtxQ@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAJuCfpGtb9j1y93bksErU4NfjPX6tGrP6qvMrazx3+M7dJWtxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 21/05/2025 17:02, Suren Baghdasaryan wrote:
> On Wed, May 21, 2025 at 7:25 AM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>> In memory bound systems, a large number of warnings for failing this
>> allocation repeatedly may mask any real issues in the system
>> during memory pressure being reported in dmesg. Failing this
>> allocation is not indicative of a bug, so remove the warning.
>>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
>> ---
>> v1 -> v2:
>> - remove the warning completely. We will have a way in the
>>   future to indicate that the mem alloc profile is inaccurate.
>> ---
>>  mm/slub.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/mm/slub.c b/mm/slub.c
>> index dc9e729e1d26..06ab9a558b73 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -2102,9 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
>>
>>         slab = virt_to_slab(p);
>>         if (!slab_obj_exts(slab) &&
>> -           WARN(alloc_slab_obj_exts(slab, s, flags, false),
>> -                "%s, %s: Failed to create slab extension vector!\n",
>> -                __func__, s->name))
>> +           alloc_slab_obj_exts(slab, s, flags, false))
> 
> I thought we agreed to having pr_warn_once() here. Did I miss something?
> 

I had [1] yesterday but I saw Johannes's mail [2] in and Harry mentioned in [3] that
failing to allocate the extension vector can happen during normal operations. So I
thought maybe there are more votes for removing it.

I am ok with either pr_warn_once or removing it completely.

I guess the question is, is it considered OK to fail here?

[1] https://lore.kernel.org/all/64b19c8f-e02e-490b-b987-9a996f36be21@gmail.com/
[2] https://lore.kernel.org/all/20250520171814.GC773385@cmpxchg.org/
[3] https://lore.kernel.org/all/20250520171814.GC773385@cmpxchg.org/
