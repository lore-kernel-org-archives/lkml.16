Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF701E49F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748312224; cv=none; b=icYAB7RtrmUwXViDc/C0AG8mbdePVHPY5wkrQMRTg23RVSubZ5aNDttrGZ0kRS/URJEni7S8Ne4vfXyEtNMmFRG1AfTaB7IislTYpoPe6PSbHERQR9lqZL+Yy8v4kcBJdCKqTpyb/jZArtUj43HMLuWsZNCktyJclOtxJvIIZO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748312224; c=relaxed/simple;
	bh=BYUqYKU7Zb50udk1adRc49TsZfwdyy5RxDIFvL7Jf1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArKF/B1ptmZP2VLa6xh95+6rkjY3QI/qOCIffYHmSS664p6nGBJQ8dfLszDJeWiEuTSZ7GMsrIHUj+CPHjsbo3TDeTdohZ7bs0o1URqUGd/dT88f8+0nsWppJ9vmLUfOaffESJAIQBDQJFNE3nJZ6fL+K7pbQMNT6Abxkgs0BkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GIKvtmEH; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GIKvtmEH"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-309fac646adso2993932a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 19:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748312221; x=1748917021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACVoLlaU3ur0JkZbezUkrwCZbhnGFLL9/FLncuMO858=;
        b=GIKvtmEHLm5Y2j9bWCu8Qva6MscPgCiRC5+sxRtS51MZj9taf0f5gkpeOMuQ+3geRy
         gM+jb1b1iK4sMm5KuwvcEtUk5GRfw5IzF1oilSULtHzFmKVsA2m4mKvPZnqOS8lrlOlt
         7r7lPIjcp3rcI+vWQW+zMC/iM4FN/QjOMk0+Fp7c1QS/ZFeBVbZTMC76LigKvMh3uQvi
         u0J+z815EdiDmN2g8jt9OKAs+igKRb8o3UUHY0WbOW9J3q8dID14paPTaidtqUtSGBSl
         ML9e3geN+ffFNR01FKbeWr+rihg5gauJDXju5sXV1naN8GC9YdGTBHORH27rRHyS1ria
         oqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748312221; x=1748917021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ACVoLlaU3ur0JkZbezUkrwCZbhnGFLL9/FLncuMO858=;
        b=M/+BqnHmDHZXAZDCSAqedBDAO3DsIcgj7PwNb4aqJGEoTPT+p0wxMAKN05EPyIGQNP
         +6MVDY2LUmWHiB+OgCrO9UgUZbp+CPq5RK/U3I8Lg7S10ryEaC5bL7v2PtKuTd5dqIXX
         rk/N8aXGSCH384RtWGaE2s+ZQvq4+zkblEvBE4acCXgjeHpniOxe8O8Z05elds3DEkFz
         XOgRA+pg0i8rrvhF2qBpFdXcp7fJNUT3kF8DJNGtWzl2Bwzm8E23idJOvRuOIyoXxxYd
         62xI2pd7Q9drvPlKHaUh2zOMm8yTMyMHZ1F3zUtTR1IrvxPvnNyuQh9LsqRcOZqpgv2B
         A9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGvrw3mCQvHDTe1aqq2k7Wo8cioNDm8hZjqmlFjnt+DDjKpURCZOtJRA9z+KZX+IYpNV34OFeEjl5/X7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcIajk1XA3aHnnCqsVeA94CZeze0JxV6Tr7Salfm9i1wsMJhhG
	zfSRMznH8T+SNUV+FgWOX5xe30HIf6wqBrGeE84z7GQcUGCRI5UssO+af8rxABMBfI0=
X-Gm-Gg: ASbGncsCedcfb4fCKtbTcWBqf39rjPKrgpQ7sKEl3p1XZlx7uqASzhQ8FwPcfQjhjgw
	Xn3TplQeqEvGvrfDBRig1NLuUnytW4Rlcb9kwSFOoXiXItP82YmVQB44QHDA3LXsrLfeMfhbQA6
	LxtVhzdhbvFmOYab8TBj/yNYElsyLtPEfrZrIsm8KZaPx9b6Z55FRPiNnKVTvWuSVuEtz4RO6Sl
	z8t32Skrgjc/ATZR3d2tTJB0EQM9jd83nvMdmhn0QCoAj3wrGQQKSqjO4AEBm4wcVA1+le5ezcs
	RS0bGDtHa4jwEiCt9FrwApO7IYYCxpy/tGjKotIxkMEasvREZTaxX+SIfVH1cjk9z8/OHadLDps
	rxppKniJwSg==
X-Google-Smtp-Source: AGHT+IHWBMMotqfr4nsNp8lecmYtympKIxi+YGDbxrUsOSHbOUbLc2e8psMU4hZPvStlhj++SdmhTg==
X-Received: by 2002:a17:90b:3851:b0:311:9cdf:a8a4 with SMTP id 98e67ed59e1d1-3119cdfabb5mr3964084a91.8.1748312220844;
        Mon, 26 May 2025 19:17:00 -0700 (PDT)
Received: from [10.68.122.90] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3111934af89sm5187730a91.28.2025.05.26.19.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 19:17:00 -0700 (PDT)
Message-ID: <1c734a50-1ada-40a1-833d-4b94b9849c96@bytedance.com>
Date: Tue, 27 May 2025 10:16:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, list_lru: refactor the locking code
To: Kairui Song <kasong@tencent.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Chengming Zhou <zhouchengming@bytedance.com>,
 Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>,
 linux-mm@kvack.org
References: <20250526180638.14609-1-ryncsn@gmail.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250526180638.14609-1-ryncsn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/27/25 2:06 AM, Kairui Song wrote:
> From: Kairui Song <kasong@tencent.com>
> 
> Cocci is confused by the try lock then release RCU and return logic
> here. So separate the try lock part out into a standalone helper. The
> code is easier to follow too.
> 
> No feature change, fixes:
> 
> cocci warnings: (new ones prefixed by >>)
>>> mm/list_lru.c:82:3-9: preceding lock on line 77
>>> mm/list_lru.c:82:3-9: preceding lock on line 77
>     mm/list_lru.c:82:3-9: preceding lock on line 75
>     mm/list_lru.c:82:3-9: preceding lock on line 75
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202505252043.pbT1tBHJ-lkp@intel.com/
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>   mm/list_lru.c | 34 +++++++++++++++++++---------------
>   1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/mm/list_lru.c b/mm/list_lru.c
> index 490473af3122..ec48b5dadf51 100644
> --- a/mm/list_lru.c
> +++ b/mm/list_lru.c
> @@ -60,30 +60,34 @@ list_lru_from_memcg_idx(struct list_lru *lru, int nid, int idx)
>   	return &lru->node[nid].lru;
>   }
>   
> +static inline bool lock_list_lru(struct list_lru_one *l, bool irq)
> +{
> +	if (irq)
> +		spin_lock_irq(&l->lock);
> +	else
> +		spin_lock(&l->lock);
> +	if (unlikely(READ_ONCE(l->nr_items) == LONG_MIN)) {
> +		if (irq)
> +			spin_unlock_irq(&l->lock);
> +		else
> +			spin_unlock(&l->lock);
> +		return false;
> +	}
> +	return true;
> +}
> +
>   static inline struct list_lru_one *
>   lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
>   		       bool irq, bool skip_empty)
>   {
>   	struct list_lru_one *l;
> -	long nr_items;
>   
>   	rcu_read_lock();
>   again:
>   	l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
> -	if (likely(l)) {
> -		if (irq)
> -			spin_lock_irq(&l->lock);
> -		else
> -			spin_lock(&l->lock);
> -		nr_items = READ_ONCE(l->nr_items);
> -		if (likely(nr_items != LONG_MIN)) {
> -			rcu_read_unlock();
> -			return l;
> -		}
> -		if (irq)
> -			spin_unlock_irq(&l->lock);
> -		else
> -			spin_unlock(&l->lock);
> +	if (likely(l) && lock_list_lru(l, irq)) {
> +		rcu_read_unlock();
> +		return l;
>   	}
>   	/*
>   	 * Caller may simply bail out if raced with reparenting or

And the code readability has also been improved.

Reviewed-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks!



