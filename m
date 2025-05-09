Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A3230BC7
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 02:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746759500; cv=none; b=oXIKiOPRtOh0OOnFUX033vw0bqbXwe6urxkdxnsxHUmtNeRqYHkcDRlUlJIRRtC7zpidTWUCDyC/JyC4IL7c43puUcjNCM0QhzUewZbkTtWYmZR/gEwKZoV9mZpcT3eJ87rA61u36843iyM6dnY1nvKvS/2eIRUbC2plWrKxfY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746759500; c=relaxed/simple;
	bh=RoaSOiYy72hJrKlgjpJYlENd5gh6MmuvYpqxrgZegHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uYUuKFR7+LfsrtTSWzEXXU31uMjDig3V5HZX2Vf7wAk3JXOuzzN5acEvFN6xdpjw7eq++BtNVmzX0smWpdl4fqTitJQ9ORjj+AUw4Fr8XL/XXQYSkhvHokKsFBoKmi+OG1WlbbTxgxulkO+HGBUlgTUc8zwNTl2H11tV/GJM7x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=f5SPd31G; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="f5SPd31G"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c33677183so16825775ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 19:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1746759497; x=1747364297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qecPSibK/c1TU6GFYHi+5TvLhoag6EshMmObfKr7QKQ=;
        b=f5SPd31GUEWxA7uO6BrcQfG55SfV1lip0tKYlQVsyubqiSUkLCFJFOZPH1rHKuKXce
         9mr+vZORLZ4rftSOdnG6BHVO8sWVy8C/o8qdAoGUyTxf/kLSaWCrvXWFHU3C4dDsyVzF
         XNLSnyE4UkwgDgT+gfyQgBSzaREqIvveOvBWCyxNbPdgIvizJpQKL7itaFa1tIJhm5nt
         Qme5e7FPC43JpKDyTOhKl2SH4dlsYEu1fndzZQnOCioYCkPgy1WOMaC+GlaBcLcxdzHz
         32Y4ax5utJZe1CJF7jd3vhiZG0319Lk8/ab0fGQx58qXMSpwkuKBqUNnJnQq29ZY6jDh
         rAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746759497; x=1747364297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qecPSibK/c1TU6GFYHi+5TvLhoag6EshMmObfKr7QKQ=;
        b=TAWQGODSXmJUZjPTi8xoIAD7JDA+5zQLJIIZsIFAXpgGX7uuf7bBpE380UtWdGtUjo
         aStTq7xssR1mnsHx/HVTs4oWiFCFWsyDHzfmOpQg6xvJHwN3RVQEMPI+H9292X0zqyw4
         ExMgcKHnqbCDC+vKv+Eez9lBPf1hJN4TIgtIEnPrTFqerzO4eqGHALqXJriFBCQaQ0A9
         SEroRkd5fJhE14UiAs3PICTvC2cuy83o4sG4OyfNmjs4S4PPwGSARHT4UkOjf3wlwN9j
         FZhdxLaHS+s+KF3Dt9rrCCMBpUfDkQbuIY6enNnJx2RK3HcFeMdWGhQ7nY9T3F4wv/T7
         xzHg==
X-Forwarded-Encrypted: i=1; AJvYcCUh7c8XkjQHCHg+oVa1FlxdhUCPjdpFkzym/JKWroyHiURn8h6Z7eYxvXeGdChITFag5YS8ioCbinxl5Dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1bpbE0V2N4QtT6hXEFnA4AmiLaqaAs9sV/ViSvDPGTRq9hmh
	xhh8tQEXAIVg7P9ZMjd0xhuyRwYDN7yxl9HWs4NfbRYD/EeNKjWiqHoe6B1QN6c=
X-Gm-Gg: ASbGncs9qPoeCFpNjxOfAj0YNRtNy4/NcVFlLM6fNhs2YvX57LlFL5e2PHIH/Nf+Icp
	A8gw3fwrAgNPEtNYqAC1/jifdODdw87dMkJXBd3bta8Q0WwUKiWSSdmy/Wkj3pAteyPvu0rSKGW
	cvNCS/nDqRjXPqBSArhqbCvX+liJU77IJAh8ylGJRvUHYEGRMYPWscMCDRvKbDRLv4jqa8QbpXn
	aNCGxP1ktkIgcDq1qoYaCjcy70oyFrNUAr8/9DqnAZ6LuwphSz8rmZukakCU9nN3KOn1PSQVdfy
	vKdqFMaUCnGsalmiNzOa6AO6YXRustslMf9BaYg0YT16tV0RdHXSaBdVx4kNCEQWK5HEZCCSk7a
	x
X-Google-Smtp-Source: AGHT+IGdfkKPgqdaAPxUdUvMSRpp89jyh7ZWme0I5ZkKT5F4wQlgxnhGNbxcGkoU61GIqvasa+6KVQ==
X-Received: by 2002:a17:903:1a44:b0:22e:7971:4d30 with SMTP id d9443c01a7336-22fc8e99d4amr21130615ad.39.1746759497517;
        Thu, 08 May 2025 19:58:17 -0700 (PDT)
Received: from [10.68.122.90] ([203.208.167.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc764a541sm7323065ad.65.2025.05.08.19.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 19:58:17 -0700 (PDT)
Message-ID: <6135bd8b-7198-4186-b020-358cdd1fb9a0@bytedance.com>
Date: Fri, 9 May 2025 10:58:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add mm reclaim section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand
 <david@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lorenzo,

On 5/9/25 1:37 AM, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> files - establish a reclaim memory management section and add relevant
> maintainers/reviewers.
> 
> This is a key part of memory management so sensibly deserves its own
> section.
> 
> This encompasses both 'classical' reclaim and MGLRU and thus reflects this
> in the reviewers from both, as well as those who have contributed
> specifically on the memcg side of things.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> REVIEWERS NOTE: If anybody feels they ought not to be here, or if I missed
> anyone, let me know!
> 
>   MAINTAINERS | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccc45b0ba843..a755b9dbf6cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15577,6 +15577,20 @@ F:	mm/page_alloc.c
>   F:	include/linux/gfp.h
>   F:	include/linux/compaction.h
> 
> +MEMORY MANAGEMENT - RECLAIM
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +R:	Johannes Weiner <hannes@cmpxchg.org>
> +R:	David Hildenbrand <david@redhat.com>
> +R:	Michal Hocko <mhocko@kernel.org>
> +R:	Yu Zhao <yuzhao@google.com>
> +R:	Qi Zheng <zhengqi.arch@bytedance.com>
> +R:	Shakeel Butt <shakeel.butt@linux.dev>
> +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	mm/pt_reclaim.c

Do we have plan to add mm PGTABLE section (at least should
contain mm/pgtable-generic.c, include/linux/pgtable.h, etc)?

I'm not sure which section, RECLAIM or PGTABLE, is more
appropriate for mm/pt_reclaim.c to be included in, but either of
them is fine for me.

Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks!

> +F:	mm/vmscan.c
> +
>   MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
>   M:	Andrew Morton <akpm@linux-foundation.org>
>   M:	David Hildenbrand <david@redhat.com>
> --
> 2.49.0

