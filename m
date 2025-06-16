Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BF81E493C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108249; cv=none; b=pyIPcxpGt72ihF79IVit6P2pSq9jeOBjhWap7/mz+rvQB3CHhn8XWqmhuvJKM2pyI+nQL/CyI2kmocDGvM+EmEV43egypYzZwsb4dokNKusUu6FmZr9xz+S0RJxPzr5I1HQn83TdubwZMpMav/2p1v+miVDfXW63HN4y/YSgYfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108249; c=relaxed/simple;
	bh=bPWcmvFmMRZesEoSFPifFY9tbDvWuCdsktV5W/W9U0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r15TtkrCF1n1kzFxWOitPk0MG6NJhl5yOfQdG2ikZ7fL4TMsb42uvScvvv7k3S+szaYtL5TkvdRPeKuC1x+ECrkZzhXYYEkNzmSNOiSmv0pG4PNGnuwge84JvHs+5L8HvxA5yTtPfdtDYBYUOzgtFovZp4BSHTHcI41jziTiiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=auTYot3r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="auTYot3r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750108246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=dd/e6rQd8zM2UzNDGmR+mMRyC56Zt9fGKkm+3L0MO5w=;
	b=auTYot3r8nmVJ18blWFUiVFOZ8ETaOAkbo17hSlfJKcUGaJE0uuBHeTyzknlZZMUkwcs+6
	cCvIyl4/hzZdxNsk42yMWfoHy/U3WOiHycCtTqAyLDriqa047M/aOZSVDnvIFzBDivHvRi
	qSPsk/4X6eS/yx/4LD/VOa8mZ1FQkLU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-3g_1ci4NNnmJm0Q6VrgclA-1; Mon, 16 Jun 2025 17:10:44 -0400
X-MC-Unique: 3g_1ci4NNnmJm0Q6VrgclA-1
X-Mimecast-MFC-AGG-ID: 3g_1ci4NNnmJm0Q6VrgclA_1750108243
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eed325461so31380505e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108243; x=1750713043;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dd/e6rQd8zM2UzNDGmR+mMRyC56Zt9fGKkm+3L0MO5w=;
        b=gPFIJ8fuyRT1WgnOSZjAhMFD/c2oeThWCiCDeSKFc5JyAc0gy80RIURrGWV5mC08p3
         CINigMu5h9q9jSMMiSx93jVYARXrLcpCTUcSjypew7g8x8d3h4gIrnFLlh4xiIh7wdYB
         MD1Ky51jfmQxR1YspgXhNsoKqveJkrWUqQkYIjqv/93Zwn2RjgMQK/ItLx9QAmp0zjZq
         swGH08/YQqePaDOIEkllY8Ul9h4tU8zNDHxhPMZukgjrT2N8CF4rU2s3P+2mG5Ysy0S7
         EwrbpkWzCiLqJQbPfq2BEImTPTY7smwQRKj7INnw/x6zoHsu/ZMdGvNM3T1nvv7ogWQx
         J1XA==
X-Forwarded-Encrypted: i=1; AJvYcCXt25af4jGhuNNWucvYO8TMuG826qWxj7nJsUepAee7UKr0htGP7JUbA7iJyPxbD86ns6mRTutEJBLLTX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRp1vnQockofJJrWp0Q6GbsOP6EqJPbtI//wjzQHudR740V13H
	zdpj0tq/ks3beuVrO3aI+rkyZHH2HZnygoDlaD/pgSXxKiInEp+7YohhUQB/x5V3Rdncvu46U8T
	aCEf1ETJUEFBIyiSkLwbQifeDiKFGMTHDAj5ksFcfEYD3v0xzsWn0AuFzc0kK8tdV1Q==
X-Gm-Gg: ASbGncvT9mBdckw6iSDOq9DrmnmXWWhz8EjBcU8oPeBgD+klVFR+ZHuJGgZ9JxeBSHW
	GxtghxI/9FaDkIiZ/TaeVyxv7z5GC+GZbFCE6TJumJtxxAUt/oSckdTobL10PrXQ3GjyrUOqgXp
	HlRrDOb6Ncp+Eyo0m/kJSmAXADb+nhvhgJisQEl2HNHOrQ0IjFPC8NfnC5HoOJNbVnRVm04h43B
	0es5Zl2aTO/9T/DFkMbjgP0VnipTUzELx88hGNvqY/DQ8aDxVTbV7+i+APBHupkWFIrZhmocsAj
	NCySD80wWKjUoBFwXWmgKFEUd4WuygkRN5MAaHyi1QOSgU4m1ARV4m7TPUHjiqHC7nBXfXjHSPO
	maXho3K6D26m2P6h5wMv8snQMdZTsYoDd1tMmSwtF9udj69ol6Q==
X-Received: by 2002:a05:6000:144e:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3a572e998a0mr7748573f8f.50.1750108243441;
        Mon, 16 Jun 2025 14:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEbIkeV5ImVPgmPifzv3s5eR3mcULcgnvN7KvTzaRmpGwdMuqRG0IYgR2jUHBy9b5SZJ8aIg==
X-Received: by 2002:a05:6000:144e:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3a572e998a0mr7748562f8f.50.1750108243014;
        Mon, 16 Jun 2025 14:10:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5? (p200300d82f3ae300c6604ff55bfbf5c5.dip0.t-ipconnect.de. [2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534226aa44sm82768125e9.13.2025.06.16.14.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 14:10:42 -0700 (PDT)
Message-ID: <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>
Date: Mon, 16 Jun 2025 23:10:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add further core files to mm core
 section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 22:38, Lorenzo Stoakes wrote:
> There are a number of files which don't quite belong anywhere else, so
> place them in the core section. If we determine in future they belong
> elsewhere we can update incrementally but it is preferable that we assign
> each file to a section as best we can.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> this. even if they are not quite best placed a 'best effort' is still
> worthwhile so we establish a place to put all mm files, we can always
> incrementally update these later.
> 
>   MAINTAINERS | 28 ++++++++++++++++++++++++----
>   1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4523a6409186..a61d56bd7aa4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15740,10 +15740,6 @@ F:	include/linux/memory_hotplug.h
>   F:	include/linux/memory-tiers.h
>   F:	include/linux/mempolicy.h
>   F:	include/linux/mempool.h
> -F:	include/linux/memremap.h
> -F:	include/linux/mmzone.h
> -F:	include/linux/mmu_notifier.h
> -F:	include/linux/pagewalk.h
>   F:	include/trace/events/ksm.h
>   F:	mm/
>   F:	tools/mm/

Probably better to have some section than none ... was just briefly 
wondering if "CORE" is the right section for some of that. Some of that 
might be better of in a "MM MISC" section, maybe.

> @@ -15764,16 +15760,40 @@ S:	Maintained
>   W:	http://www.linux-mm.org
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>   F:	include/linux/memory.h
> +F:	include/linux/memremap.h
>   F:	include/linux/mm.h
>   F:	include/linux/mm_*.h
>   F:	include/linux/mmdebug.h
> +F:	include/linux/mmu_notifier.h
> +F:	include/linux/mmzone.h
>   F:	include/linux/pagewalk.h
>   F:	kernel/fork.c
>   F:	mm/Kconfig
>   F:	mm/debug.c
> +F:	mm/debug_page_ref.c
> +F:	mm/debug_vm_pgtable.c

Wondering if there should be a MM DEBUG section. But then, no idea who 
in their right mind would be willing to maintain that ;)

> +F:	mm/folio-compat.c
> +F:	mm/highmem.c
>   F:	mm/init-mm.c
> +F:	mm/internal.h
> +F:	mm/interval_tree.c
 > +F:	mm/io-mapping.c> +F:	mm/ioremap.c
> +F:	mm/list_lru.c

Smells like reclaim/memcg.

> +F:	mm/maccess.c
 > +F:	mm/mapping_dirty_helpers.c
 >   F:	mm/memory.c> +F:	mm/memremap.c

memory hotplug related. Well, one could argue that it's just a memory 
hotplug user. It's mostly ZONE_DEVICE handling. Wonder if that would be
worth a separate section ...

> +F:	mm/mmu_notifier.c
> +F:	mm/mmzone.c
 > +F:	mm/oom_kill.c

This contains quite some meat. I wonder if a OOM section would be 
appropriate (Michal, I'm looking at you :) )


-- 
Cheers,

David / dhildenb

