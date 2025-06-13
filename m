Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CB5192D83
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822233; cv=none; b=m4GU1J+6oBuLWjpUKnv92w/kWnzCxpkFzp8j2SzE0v9LKHU7SWcXlEssgSyqfRddYQ6fE5acIIOyjndRFqF1IJpSmFrUW63gobY0XmbVy4R7aMmUaUhJs31jQrqsLLpvsvkNdsDJOq1JkCiIj4IJkJ4UwchsHur/TmY/MJ5Z4Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822233; c=relaxed/simple;
	bh=seKdTl2W/RT9viwJKCdkyNgAt0zpfKgJ1iY35jU8bBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V54kQihZ/D+kdKRYkeY6d1+bWyP/rQt4gUl+xHwF9MNa/w03iiJSPeSoO60AXWgm2Z2ApFNQHHnAPzzmlxPtE7KP7sChuL6qCZbSHnfrCgB7M1ssGlN+UwePB1BCUD49LKT3xXLlPiN5NxbHRQEZ+TkiuYXNWhxGyxRqkwocEkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D0xeJLeX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D0xeJLeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749822230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qGWkEpYd0zLIhVUZax4Nw/WT8Nlu9ZESAXAHqlejMnw=;
	b=D0xeJLeXHYRGFBFWxWSwKNsy2IKF5dY2bxI+ptkxQowi2Ux04+D0yEWBlfr/WabYkeOUCf
	eEBrhGXmzdF3NBsV1vMRfjqm+w0q1lGt39C7KkiMHaHQdEAAS18uM/OrNIywrd+vzIGWtf
	SMXcL1HqTgnidOP3rx/fHl1BO1zWCzY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-3jGBAhdLPt-Qx2uU9ET49g-1; Fri, 13 Jun 2025 09:43:49 -0400
X-MC-Unique: 3jGBAhdLPt-Qx2uU9ET49g-1
X-Mimecast-MFC-AGG-ID: 3jGBAhdLPt-Qx2uU9ET49g_1749822228
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451ecc3be97so9766965e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822228; x=1750427028;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qGWkEpYd0zLIhVUZax4Nw/WT8Nlu9ZESAXAHqlejMnw=;
        b=u24RH0E7itzambIOikMX46x5GTV/Fn9Zg85Vv3LPR32FEum1lpvR5eV+McMOG+Rvxf
         gv9rc3FLf6bPmyK6fbmN1HKZo/s+b3Eovb7d4t1SPi6b43jhIKJ9rMmwWwJMlxSELd4D
         eWQJSTpo9joGmLaTBGI9a+EIdJhgw5CNFaBnccXP8ys+EhhuhsMaJLz7g0sCpqroD7Fc
         uUxms0zqVQHrxKBvv4jsbOBOKoExhismAbCDNVuBVTGJmc48A/IhP47/8yUOsT0eKNJT
         4p0p6lKxOawDgwTns2hHdNJlRcxaxTZ+C4iW5dyaQ96XQu+ymTPY5077HPLTmUAdLQUE
         D8ng==
X-Forwarded-Encrypted: i=1; AJvYcCVI6pQi893im4BjhxxiWBJFLTyYDqKESYGlFKfT00J5bATQmelhiw7xQcuck/BsL59KUQjH7PGG5YlK7DI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZE07Vi/dHGZHSNAsnxmDtuBrRSi+6GTSxXLW99hfCQF3tYJx
	suMr6ZbpcdArIXI8rTJL23Q0Q/aXamvyCWep/wDdmfMalHx7M4HF2Xda0d0sBugnnDb4L/66XyQ
	Qc2wFZqgrwUlhhvKm06cj9laUKvtaX1bf0SV+Dgl08lG1NSSaCh7b+8lSCu945A5Jkw==
X-Gm-Gg: ASbGncvMAYrMVIYFdSJGrUXOumzfU5K3/3Fs/k9Q/7tZ9eHo3PGju12tdypxdYodP/w
	kXPOsILOwdJFVxbJpvPRxeYfS/EhXx3Mr6Apwm9NhSDJsMjIlI0ugV42wORyP7tpFs6zHTHo8nb
	Ffw3DN8WiCHbhkD+2z7AdZiCBlZJ4vjTHJOkwHHZTwjjRsfpMYQp2kYcOcMQsjZhVD0TVkr6z4j
	J6NHuO4tC2z/qYzLzYX6zGWTw0Aj1UU4UzU0et2pCrn+pZyeAgUUBSc4u3nSmrul6mSY5ixSt1h
	EaUZxNK0KVsoy+ruwLvoYyGZ4Rld8wG/Qd70G+G/Wc9iNspuAWPAAaqq8XshrjWGdxz64n9WpFD
	HanDw8z4QRdLK9mcKchXd9QOYCvsT/UwZSTxTvXCxuj4qNJ3RxQ==
X-Received: by 2002:a05:600c:3b99:b0:453:84a:8cf1 with SMTP id 5b1f17b1804b1-45334af76e7mr29547595e9.33.1749822228249;
        Fri, 13 Jun 2025 06:43:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4tTtWCHC4OYYQqNs7GOV5yILEU3FbUC3arHGhrZDYQHT5RcWONCvzaxn5Dip0sptO86pC2A==
X-Received: by 2002:a05:600c:3b99:b0:453:84a:8cf1 with SMTP id 5b1f17b1804b1-45334af76e7mr29547125e9.33.1749822227806;
        Fri, 13 Jun 2025 06:43:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13d014sm53347475e9.24.2025.06.13.06.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 06:43:47 -0700 (PDT)
Message-ID: <67e225d5-f512-4e90-9211-6cd04b22558f@redhat.com>
Date: Fri, 13 Jun 2025 15:43:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] mm/damon/paddr: Add DAMOS_INTERLEAVE action
To: Bijan Tabatabai <bijan311@gmail.com>, damon@lists.linux.com,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sj@kernel.org, akpm@linux-foundation.org, corbet@lwn.net, ziy@nvidia.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, bijantabatab@micron.com, venkataravis@micron.com,
 emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com
References: <20250612181330.31236-1-bijan311@gmail.com>
 <20250612181330.31236-3-bijan311@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250612181330.31236-3-bijan311@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.25 20:13, Bijan Tabatabai wrote:
> From: Bijan Tabatabai <bijantabatab@micron.com>
> 
> This patch adds the DAMOS_INTERLEAVE action.
> It interleaves pages inside of a given region according to the weights
> in the iw_table. To reuse existing interleaving code, the target nid for
> a folio is determined by calling policy_nodemask, therefore only folios
> belonging to processes using the MPOL_WEIGHTED_INTERLEAVE policy will
> have their pages migrated.
> 
> Below is an example of its usage where pages are initially interleaved at
> a 1:1 ratio and then changed to be interleaved at a 2:1 ratio. The
> alloc_data program simply allocates 1GB of data then sleeps.
>    $ cd /sys/kernel/mm/damon/admin/kdamonds/0
>    $ sudo cat ./contexts/0/schemes/0/action
>    interleave
>    $ echo 1 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node0
>    $ echo 1 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node1
>    $ numactl -w 0,1 ~/alloc_data 1G &
>    $ numastat -c -p alloc_data
> 
>    Per-node process memory usage (in MBs) for PID 18473 (alloc_data)
>             Node 0 Node 1 Total
>             ------ ------ -----
>    Huge          0      0     0
>    Heap          0      0     0
>    Stack         0      0     0
>    Private     514    514  1027
>    -------  ------ ------ -----
>    Total       514    514  1028
>    $ echo 2 | sudo tee /sys/kernel/mm/mempolicy/weighted_interleave/node0
>    $ numastat -c -p alloc_data
> 
>    Per-node process memory usage (in MBs) for PID 18473 (alloc_data)
>             Node 0 Node 1 Total
>             ------ ------ -----
>    Huge          0      0     0
>    Heap          0      0     0
>    Stack         0      0     0
>    Private     684    343  1027
>    -------  ------ ------ -----
>    Total       684    343  1027
> 
> Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
> ---
>   Documentation/mm/damon/design.rst |   2 +
>   include/linux/damon.h             |   2 +
>   mm/damon/paddr.c                  | 112 ++++++++++++++++++++++++++++++
>   mm/damon/sysfs-schemes.c          |   1 +
>   4 files changed, 117 insertions(+)
> 
> diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
> index ddc50db3afa4..c50d2105cea0 100644
> --- a/Documentation/mm/damon/design.rst
> +++ b/Documentation/mm/damon/design.rst
> @@ -455,6 +455,8 @@ that supports each action are as below.
>      Supported by ``paddr`` operations set.
>    - ``migrate_cold``: Migrate the regions prioritizing colder regions.
>      Supported by ``paddr`` operations set.
> + - ``interleave``: Interleave the regions according to the weighted interleave weights.
> +   Supported by ``paddr`` operations set.
>    - ``stat``: Do nothing but count the statistics.
>      Supported by all operations sets.
>   
> diff --git a/include/linux/damon.h b/include/linux/damon.h
> index a4011726cb3b..81d26a203337 100644
> --- a/include/linux/damon.h
> +++ b/include/linux/damon.h
> @@ -117,6 +117,7 @@ struct damon_target {
>    * @DAMOS_LRU_DEPRIO:	Deprioritize the region on its LRU lists.
>    * @DAMOS_MIGRATE_HOT:  Migrate the regions prioritizing warmer regions.
>    * @DAMOS_MIGRATE_COLD:	Migrate the regions prioritizing colder regions.
> + * @DAMOS_INTERLEAVE: Interleave the regions by the weighted interleave ratio
>    * @DAMOS_STAT:		Do nothing but count the stat.
>    * @NR_DAMOS_ACTIONS:	Total number of DAMOS actions
>    *
> @@ -136,6 +137,7 @@ enum damos_action {
>   	DAMOS_LRU_DEPRIO,
>   	DAMOS_MIGRATE_HOT,
>   	DAMOS_MIGRATE_COLD,
> +	DAMOS_INTERLEAVE,
>   	DAMOS_STAT,		/* Do nothing but only record the stat */
>   	NR_DAMOS_ACTIONS,
>   };
> diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
> index 4102a8c5f992..e989464635cd 100644
> --- a/mm/damon/paddr.c
> +++ b/mm/damon/paddr.c
> @@ -535,6 +535,114 @@ static unsigned long damon_pa_migrate(struct damon_region *r, struct damos *s,
>   	return applied * PAGE_SIZE;
>   }
>   
> +#if defined(CONFIG_MEMCG) && defined(CONFIG_NUMA)
> +struct damos_interleave_private {
> +	struct list_head *folio_migration_list;
> +	bool putback_lru;
> +};
> +
> +static bool damon_pa_interleave_rmap(struct folio *folio, struct vm_area_struct *vma,
> +		unsigned long addr, void *arg)
> +{
> +	struct mempolicy *pol;
> +	struct task_struct *task;
> +	pgoff_t ilx;
> +	int target_nid;
> +	struct damos_interleave_private *priv = arg;
> +
> +	task = rcu_dereference(vma->vm_mm->owner);
> +	if (!task)
> +		return true;
> +
> +	pol = get_task_policy(task);
> +	if (!pol)
> +		return true;

Why is this not using get_vma_policy(), which will fallback to the task 
policy in case there is no per-vma policy>

-- 
Cheers,

David / dhildenb

