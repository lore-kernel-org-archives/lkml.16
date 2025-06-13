Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C5119DF61
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822358; cv=none; b=S8xXbtDB8a9RZajHkQhYGcoLW8i6Wrwpv9JkMVbPXpRkxmpLbBFNNAyAkA+J5x9OKdYM8Hx4QLL9+u3oP3mn7RPKQo19NYmP99jq0eB4KJdBOu48O32xTePlzgEp/Nei0bPoxfzjGET/vpIVjx4/1+ajpyZbSqZGlevfWORawiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822358; c=relaxed/simple;
	bh=f9A13MP4L3RWWVp36KuCXfDhU7eoO52zb9eh83juLrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LSYDY6hsUYZ8kMzqW40RAzfGYiuEWk2Er8j393xMokAnzlVPjrVLdfFwZv+5Q9U3UwJe2zlOAT0Dm1nap9XlLc7fUZpdVtFXMlJcwNkXQFBrSlAYoAgW8I1OxsjcLFCOXHxzJRDm+M8+H4DcWz79KYAuLnukdZx1jiNTfJxwNjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TwJF4oCf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TwJF4oCf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749822354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wLQxLvmm4cnel7+fk2wS5R/B7wv5TBr8PUl4ea9Mgbo=;
	b=TwJF4oCfqWXPe5mj9NYq1WCa8xoYtN+tJMnBGNafX4urw46KETdvQ4yyx7A0Aa2yVV1PF8
	e0ivCyc0CrmnVNWPdjQjR+mU9fetyjzMooOI1n7EvehRM2oCiJFG7vFO5mt/nh7jnLkq97
	jMzJ3wYVjKR8LvcHvz+3YK61jEw5lb8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-vIjP7scCMYKLQjxCfoA2vQ-1; Fri, 13 Jun 2025 09:45:53 -0400
X-MC-Unique: vIjP7scCMYKLQjxCfoA2vQ-1
X-Mimecast-MFC-AGG-ID: vIjP7scCMYKLQjxCfoA2vQ_1749822352
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f55ea44dso1085448f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822352; x=1750427152;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wLQxLvmm4cnel7+fk2wS5R/B7wv5TBr8PUl4ea9Mgbo=;
        b=VS2XOc+aXGPtt+MZfg/xwCjwmkjOJQIGWMKvoVHDG+jw34SYPTwux7BeqFKbIPc4F1
         DnsAkikHOgQ4NhkCyA7CjlnwvLJ8aZHcyOHHkW06SmW75xrSubSg3v9FWvAbnKYQqFMZ
         Z54A7wv4DVyyHxoSkqK1PKI2SYboWsQ04m/gRwLk1c9ZbpVJz8N9o3hF50X5aR95YP5F
         H3cJPfwZx6pK6RmJ+aJHu0SoP/RejPXWJI2NoQzg/5XpSIocxND1pPExq8TPhoDnOggM
         X5dXLdqKXFpmeD+/RCjaKOh+pEmNWDPlafCeqVgonU/ZTQSBWP7FM2mlRlas1HFlY93B
         0mJg==
X-Forwarded-Encrypted: i=1; AJvYcCVJwbbGHKCU01wBZEGnV3OJiAatygOYejpubEiR49drTc6GCMrdUJNRXv7p11o6VLNyNy2DQG+xUpJnTgA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF93ByCACSTOeJLrQ2y4sGQPYiBkPEswevlsKsDer/a1fVXNWd
	zpF6Z3VsFAtvrzbQCI7yQmwtxH0Ou2jYWQmEVENWb5G32cD1/eXFrSjhHbpmlfe9ZaBPeRnZ5TZ
	CfDcDZFMlbN7oWg9TVURaPTd7GX3g0LRdrohELSchX2Q9al46pm5esLGK/dRhn+uHsA==
X-Gm-Gg: ASbGncuY1vocdcrC9bkGa24iLrJNqh/6Jc0kd9NJ5pC+fXsnVBKyV9MiSxCPe1iBakX
	Z96Ptap93CkBhlA+UrqvTZeMw7gZxzvwha0PQgi3JOSLa6UDclc9d9rN8VRhQdIflLb7HFZtMGB
	zDCStvM76r6pvr0Pr5TVZYCPIYfJKL9YyqgfEcA9BC2J34Go/e9Iq3FtDlMs1rLdRGrz3EM4SBK
	4ybiJEoEG8NqGgcGqGGXmEaPQ+wX2tELw6/weKw/rI+WquSReWSgts2lyS1dg9zw6xB28bk3lpK
	TW+PJRgr90u+MLVXW73GvV3HjgMxpE0ueABs+rgUQP8OzE13IuwjT11P1hhKG5WBfweD/GRboQR
	yab8Usbmqo9GGfIRcNCs1t+Y1MJ1Uz0iF7dCXYd1d61j5dNduRA==
X-Received: by 2002:a05:6000:2089:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a5686fdb37mr3040927f8f.13.1749822352102;
        Fri, 13 Jun 2025 06:45:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyRFyJJwbfY3gXU949NwjFHTpf5oLAOeT3DPP6xTQUPKFaeAUvjVd2SxYdkrYYlK//rZ/gVg==
X-Received: by 2002:a05:6000:2089:b0:3a4:eda1:6c39 with SMTP id ffacd0b85a97d-3a5686fdb37mr3040884f8f.13.1749822351680;
        Fri, 13 Jun 2025 06:45:51 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4? (p200300d82f1a37002982b5f7a04e4cb4.dip0.t-ipconnect.de. [2003:d8:2f1a:3700:2982:b5f7:a04e:4cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a543d9sm2416437f8f.5.2025.06.13.06.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 06:45:51 -0700 (PDT)
Message-ID: <5a50eeba-b26d-4913-8016-45278608a1ee@redhat.com>
Date: Fri, 13 Jun 2025 15:45:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/4] mm/mempolicy: Expose policy_nodemask() in
 include/linux/mempolicy.h
To: Bijan Tabatabai <bijan311@gmail.com>, damon@lists.linux.com,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sj@kernel.org, akpm@linux-foundation.org, corbet@lwn.net, ziy@nvidia.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, bijantabatab@micron.com, venkataravis@micron.com,
 emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com
References: <20250612181330.31236-1-bijan311@gmail.com>
 <20250612181330.31236-2-bijan311@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250612181330.31236-2-bijan311@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.06.25 20:13, Bijan Tabatabai wrote:
> From: Bijan Tabatabai <bijantabatab@micron.com>
> 
> This patch is to allow DAMON to call policy_nodemask() so it can
> determine where to place a page for interleaving.
> 
> Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
> ---
>   include/linux/mempolicy.h | 9 +++++++++
>   mm/mempolicy.c            | 4 +---
>   2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
> index 0fe96f3ab3ef..e96bf493ff7a 100644
> --- a/include/linux/mempolicy.h
> +++ b/include/linux/mempolicy.h
> @@ -133,6 +133,8 @@ struct mempolicy *__get_vma_policy(struct vm_area_struct *vma,
>   struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
>   		unsigned long addr, int order, pgoff_t *ilx);
>   bool vma_policy_mof(struct vm_area_struct *vma);
> +nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
> +		pgoff_t ilx, int *nid);
>   
>   extern void numa_default_policy(void);
>   extern void numa_policy_init(void);
> @@ -232,6 +234,13 @@ static inline struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
>   	return NULL;
>   }
>   
> +static inline nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
> +				pgoff_t ilx, int *nid)
> +{
> +	*nid = NUMA_NO_NODE;
> +	return NULL;
> +}
> +
>   static inline int
>   vma_dup_policy(struct vm_area_struct *src, struct vm_area_struct *dst)
>   {
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 3b1dfd08338b..54f539497e20 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -596,8 +596,6 @@ static const struct mempolicy_operations mpol_ops[MPOL_MAX] = {
>   
>   static bool migrate_folio_add(struct folio *folio, struct list_head *foliolist,
>   				unsigned long flags);
> -static nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
> -				pgoff_t ilx, int *nid);
>   
>   static bool strictly_unmovable(unsigned long flags)
>   {
> @@ -2195,7 +2193,7 @@ static unsigned int interleave_nid(struct mempolicy *pol, pgoff_t ilx)
>    * Return a nodemask representing a mempolicy for filtering nodes for
>    * page allocation, together with preferred node id (or the input node id).
>    */
> -static nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
> +nodemask_t *policy_nodemask(gfp_t gfp, struct mempolicy *pol,
>   				   pgoff_t ilx, int *nid)
>   {
>   	nodemask_t *nodemask = NULL;

You actually only care about the nid for your use case.

Maybe we should add

get_vma_policy_node() that internally does a get_vma_policy() to then 
give you only the node back.

If get_vma_policy() is not the right thing (see my reply to patch #2), 
of course a get_task_policy_node() could be added.

-- 
Cheers,

David / dhildenb

