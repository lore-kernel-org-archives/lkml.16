Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ACB7F7FC
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521334; cv=none; b=DUrZ69M3/9g6fyZRozjUQJCsZSBQCacvv8OxAnlsJoQuFVoY8j9qtVOil8RTMaplx7qyvNzhUHA7nypzN8Bb5X9cXX5J0alXutHtto9b+6p0xMsdWH+I8/z0/gB9zZ+mcYFXwrVg5nFS9c7bXAjYoIP4ObFSR8igcufypm2vQi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521334; c=relaxed/simple;
	bh=K7qjULalyjMkAxL7PVeGCHXQouk2F6broaGq36eQD0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWZPx2zBw4a+VnTX04y7My2LMK3euvuufxESOd/Xo5Inswod6rdU8+pNEuQ7mokwTh9BFw9NH0p1T1r034aS6Hed8T0IhaajUTAacdxsbrB4M/QQXs6vReWS4mcZoGRleUvfXukpwhH26YuUT0IHwkLEQWYdVFw02CONFZEv03g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QCwpzbep; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QCwpzbep"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cd6b511cso5276415e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748521330; x=1749126130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=al8287RxjgUX+nRH6wDLFLDnBZ/mAzEmTjClCtJoDew=;
        b=QCwpzbepmjUqNLhiIsZsfzmN79FdLnNpzM534qoCvbZuLDVa83mlgV9cacr32shmeA
         94QV3Lyq62DHmYZxHh6+TrRIqsGvs74W2BkO95kI2YnAxc6CUCNBwvX2BxyWPmCCCXK9
         mGzjmDTFASnxTra0fkuc4JgABj6mI5U02/o8aFCnMlksNDkYyycpwD3YM1/03WaeU8Hk
         o8fCKlSr2H0nOn68/c0fHozsv2tAd9A13BaNNrvBeW6NCiCfAQh3d/1nL5HstjZUl2my
         D3UgTBophu9ZdwsGHVxu4WgcRx/n18pqHz4h6jB4P/wenCn5MCMrPa2NcyiUVRrSoRJO
         z4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748521330; x=1749126130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al8287RxjgUX+nRH6wDLFLDnBZ/mAzEmTjClCtJoDew=;
        b=QYJIRWGB9I0b9d6EzLTQxY0/F1FZNDFlsN5QqfCohF1SueuQGi4l6tE5K1Xb4v1VlE
         F/pIS2Szs3hA71itTUI5YGwSAaNxY277Hzja9zB947fGv+dGQa0nvIMUm8z2t2GTrRNR
         nBmqJf3ciHULl7wfIync2d07efH3Fdna6uIYcc1knSJBMsQFDKqvQ768L1gPK/hjfCIX
         2TpSnqLhKdSaNedyURmaInjjo0PGaPTHwDETBUd7Knfh76YdMZHaihdd6NcoUnQgYqrJ
         GjptGu8LyD+IsvjzKYlR5p1adBDWDWscfOhqRk8e8aOFGVvSH05wet0D03t9T13Yka3c
         OZWw==
X-Forwarded-Encrypted: i=1; AJvYcCUrUnwBdLqd1m9W0vuHW9KP3T9M7SzHetF0kP2hkofJmXYrwvsWS4KsWW1ARQAVcZPKuZdT96JfHZWrn1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1UaxMMV4oSewcTFgPuySWCf4xGZ3T74/qLZLC6nD3nT3KO1TK
	GFXW/aIlmw9QcJrKOJKgf8u3vKR8WC5DOXdalLARndInHNyuAHHAu8ClH0zBpop4nNI=
X-Gm-Gg: ASbGncvf6SM5CVVZ0BLbebetyLtuauTov4Hl5RRwyQegxctV/b6P5KE7f9SvFhnPKJ4
	9Idy8N231V8/FkeWkyQPoNwrvgegHTFKsDrUuFj6wQgk5SSQWjeC7CU3WrpV4MF1nteCruYzpWK
	AMR2nvFXkBWsLuIRig+sNBFNHwLpHbwj5qodlMgi1H6CoA9Dhgo4CW3puh4FrFJSt0gO5BkU0nn
	cm8Ajn8bEKcfdZ5hNZEXt8PPUJPf6vwxSkL7N554scm+9XYr4i1zzR5fa8fkIQxfCZPRzztA6Uh
	ASHZCcCYb0BhMvqXLgCipdbfPCyFr3oovsjvr0u301JLsKeDDFYUWApdt4fjUk9H
X-Google-Smtp-Source: AGHT+IEi5QGaE/L2kia77TwpAy38jFwnSSaQnSkGGXHD3NLBpfAk7antH461TuYl2AZ2tzXQyeDH2w==
X-Received: by 2002:a05:600c:a00e:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-45072553bb3mr59385965e9.14.1748521330468;
        Thu, 29 May 2025 05:22:10 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc16275sm18627795e9.22.2025.05.29.05.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:22:10 -0700 (PDT)
Date: Thu, 29 May 2025 14:22:09 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Hongyu Ning <hongyu.ning@linux.intel.com>, stable@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] mm: Fix vmstat after removing NR_BOUNCE
Message-ID: <aDhRcXcqctogIITw@tiehlicka>
References: <20250529103832.2937460-1-kirill.shutemov@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529103832.2937460-1-kirill.shutemov@linux.intel.com>

On Thu 29-05-25 13:38:32, Kirill A. Shutemov wrote:
> Hongyu noticed that the nr_unaccepted counter kept growing even in the
> absence of unaccepted memory on the machine.
> 
> This happens due to a commit that removed NR_BOUNCE: it removed the
> counter from the enum zone_stat_item, but left it in the vmstat_text
> array.
> 
> As a result, all counters below nr_bounce in /proc/vmstat are
> shifted by one line, causing the numa_hit counter to be labeled as
> nr_unaccepted.
> 
> To fix this issue, remove nr_bounce from the vmstat_text array.
> 
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> Fixes: 194df9f66db8 ("mm: remove NR_BOUNCE zone stat")
> Cc: stable@vger.kernel.org
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Hannes Reinecke <hare@suse.de>
> Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Cc: Jens Axboe <axboe@kernel.dk>

Acked-by: Michal Hocko <mhocko@suse.com>
Unfortunatelly a common mistake to make. I have seen you have a followup
fix with a stricter build time check. Will have a look.

Thanks!

> ---
>  mm/vmstat.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index 4c268ce39ff2..ae9882063d89 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1201,7 +1201,6 @@ const char * const vmstat_text[] = {
>  	"nr_zone_unevictable",
>  	"nr_zone_write_pending",
>  	"nr_mlock",
> -	"nr_bounce",
>  #if IS_ENABLED(CONFIG_ZSMALLOC)
>  	"nr_zspages",
>  #endif
> -- 
> 2.47.2

-- 
Michal Hocko
SUSE Labs
