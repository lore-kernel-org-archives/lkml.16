Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6643219049B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750706084; cv=none; b=Mzi8mPjCBBjJAf+RNAXEV/Qe0DVe0lheHl0G99aEO02oyujyG49rwcgDyABoJ5QtvFQg1zA+xzBFGkl2EZPSROG2IyF+LzSYYAaqIH3tnl82K+fLiYGfsPHU6bIUU5wzKtbQFmhBCPHnqottvvnn/0yrmHM9TbL3tmnG+RaYsHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750706084; c=relaxed/simple;
	bh=LvwmpMfEiFEHMBXFxjrYPWo16ZRwsLz4w8GxYFsWwKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9KoT2F65LEqOLHEHZV1Av/A+vqMfvrcfKUKwd3/iMTNby5o4YZVvLV0N1vL74V6pIqboCpJwxDuTI8RSq0kuziJJziyPnq2ZOP6uMJA3+ieariNgEkF965ddi7sDDw2uNPQnLlP4eO1lRlKSF9g7G0MKATQR1su70PsscwVjiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KcrIxraj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KcrIxraj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750706080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZncvHV48CZTvf0WGCYi+9lZbCWL0+Noe/kAfOSqrJbY=;
	b=KcrIxraj6k7Uywmjon78QT5zr08wH85asEVhQ8frqfEJNyYDEu4mwZbzz52hfid58sGsGu
	fFWdvr7qevdnBCK/DlMJ7NP+g1V0Nf0Io5j+BElLp0FNdvvOA2b9Ssvd5QewZIWIJw9TSw
	H6o5ioihHZaiV6CTIt3DeO+35Hr8GTc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-dKR_pmFUPEKZApWYDKNwZw-1; Mon, 23 Jun 2025 15:14:38 -0400
X-MC-Unique: dKR_pmFUPEKZApWYDKNwZw-1
X-Mimecast-MFC-AGG-ID: dKR_pmFUPEKZApWYDKNwZw_1750706077
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f8192e2cso2612521f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706077; x=1751310877;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZncvHV48CZTvf0WGCYi+9lZbCWL0+Noe/kAfOSqrJbY=;
        b=Ym3A8CqDjhpHBFf65OufYCxPq1cfJ4qPZ0dGXHR6dZBYIWCa4CU7xO0XNhxS0pFkxf
         hHz7va2+ae38wmVvrshy4tKjMAmUWm6lTS7V6/MbEmhb9rHr5mLO2Nji3G8IoPT4zLeN
         WUsHMaBn6kiziQU1WneSVVA+IvFkDMN2NyF6f53Ca0noEFKkthV8VAdai9qsrc35aVqt
         6pwgpB83pQyINhRq22D3ZeH6xND5OFciwQY3Af5pXrPge6JDkiRByh7JxzXI3wse2VYN
         IoCTl5Eu27YQ48bN6gCDgUdLcZ4Pey44BkVbveme9PgAn95FbHii1vS8aWbb5LKM9ZED
         u9wQ==
X-Forwarded-Encrypted: i=1; AJvYcCV35ebWIEruLPJpECWHa2r7zN5NowRKpNyBfCmgrdArUv5npYJsW7DV0Pkg8jBnJKoNYzv3dQLQw+YWj6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFT/3nfoYqx+WMGGAEtZ6Q+VzGUh1J3ChMT62N6Q4eljruULEw
	Ky5hAO7oXM9zSIjstx6P2vC5Y5wm+yJYcLrIGqW+X8Xp/yOe8Ys2cKKAAVjrLDmJxVi6q3IkM6c
	neTNTIkZ3beBdVz6Fe5A74nSvq4ldrtVdJAa3jgL9pBxkE9+gcxOMjJ/PXZYLoqp7Lg==
X-Gm-Gg: ASbGncsbVmZKbCRXN+Fqr/RntdJ7LxxX5NvF0J33j/uVvc7ksO3Xo22bWElfkOeYsnT
	eqNMIsIlOemqvep7WcDikzBrYG4OlUFdnVMDwL7pUdkahOv444lR01cn/9HXK5N7VY2vj70QtT7
	O2iguVH4grSJv0Nf+mXl2017xSelCQ82tTPiGKXngcjeg9OEIBUj55TKTwc8QCmhRs1pCToXqlx
	H2P8HPIYFC0iKelQTU14/bIuusXXtF2JOi9IniM0aXfirZOTZ71om+McvzDGHmzdYLMe8WuRcF9
	zhrYQUvJ49Z/3H7ZSjENqSdqXlEaaifCyYrYSdRlzw3i7TsoUpH7mC2RFPOJLxxsZqImMGRLP54
	d09/jkdNJXVlrb2OTY9HjLRXxVXo3g8LFKIW15dB8x2dDWDRZWw==
X-Received: by 2002:a05:6000:2108:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3a6d12dea0dmr8270696f8f.32.1750706077345;
        Mon, 23 Jun 2025 12:14:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFuCizsmYhYUTD1NUj/lBMAvTGdZZvueK/IAkU/saIe1x5K8UrHG1Xttc8M6Neprz0Y7hDjw==
X-Received: by 2002:a05:6000:2108:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3a6d12dea0dmr8270686f8f.32.1750706076893;
        Mon, 23 Jun 2025 12:14:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10138sm10095008f8f.3.2025.06.23.12.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 12:14:36 -0700 (PDT)
Message-ID: <0067568e-a604-46d3-96fd-41b62968a90e@redhat.com>
Date: Mon, 23 Jun 2025 21:14:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] mm/mempolicy: Expose get_il_weight() to MM
To: Bijan Tabatabai <bijan311@gmail.com>, damon@lists.linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: sj@kernel.org, akpm@linux-foundation.org, ziy@nvidia.com,
 matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
 byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com,
 apopple@nvidia.com, bijantabatab@micron.com, venkataravis@micron.com,
 emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com
References: <20250620180458.5041-1-bijan311@gmail.com>
 <20250620180458.5041-2-bijan311@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250620180458.5041-2-bijan311@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.25 20:04, Bijan Tabatabai wrote:
> From: Bijan Tabatabai <bijantabatab@micron.com>
> 
> This patch exposes get_il_weight() in mm/internal.h. This patch is to
> allow other parts of the MM subsystem, such as DAMON, to make page
> placement decisions based on the global interleave weights.
> 
> Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
> ---
>   mm/internal.h  | 6 ++++++
>   mm/mempolicy.c | 2 +-
>   2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/internal.h b/mm/internal.h
> index 3823fb356d3b..b718ebe7cad5 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -1169,6 +1169,7 @@ extern int node_reclaim_mode;
>   
>   extern int node_reclaim(struct pglist_data *, gfp_t, unsigned int);
>   extern int find_next_best_node(int node, nodemask_t *used_node_mask);
> +extern u8 get_il_weight(int node);

No new "extern". It's a blast from the past :)

>   #else
>   #define node_reclaim_mode 0
>   
> @@ -1181,6 +1182,11 @@ static inline int find_next_best_node(int node, nodemask_t *used_node_mask)
>   {
>   	return NUMA_NO_NODE;
>   }
> +
> +static inline u8 get_il_weight(int node)
> +{
> +	return 1;
> +}
>   #endif
>   
>   static inline bool node_reclaim_enabled(void)
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 1ff7b2174eb7..b1713430ee9c 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -165,7 +165,7 @@ static unsigned int *node_bw_table;
>    */
>   static DEFINE_MUTEX(wi_state_lock);
>   
> -static u8 get_il_weight(int node)
> +u8 get_il_weight(int node)

The function name is shockingly confusing when used outside this file. 
Do we have some namespace to at least highlight what this is about?

node_interleave_weight() might be a lot clearer?

So maybe let's just rename it to something less confusing as we use it 
from other files.

>   {
>   	struct weighted_interleave_state *state;
>   	u8 weight = 1;


-- 
Cheers,

David / dhildenb

