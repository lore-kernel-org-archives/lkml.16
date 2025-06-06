Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A740A28850C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210691; cv=none; b=XJiA5yjbbmkwsLgGH1MhgK/6D3ycEzyKf31z9tgxVYKLvLnqqb3lfYNxZZjtXUjv/kx9lGbOoq4P3P2M+KW9rXOIOb/XZtDNQZTPfk46nbkfjbz26E9KopAWpZFeGD19igFmcGeBKq+dR83u5Xw3SfhsTTfYoocpc6CBrSNPyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210691; c=relaxed/simple;
	bh=zbnH3pInG6RT5w6ACeygENQ7RmnTomfZEB2GDkjzMQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALu25bdTbB7M5sR4xaN5Mn6lRjNnusftp8YnX110Rs1X1AntdZpKK5ElClOLRp0zGUfMXj6R7OrpOhsB2pUGYAK9gCa1NZgQnD4UxYwyT5DO5BrVoiZ52snMMhW1Kg0+ZqwBLlLNaRKouoB/xPNIENQk6nSeU3EUYR7Dp7fC04U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dffrT20r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dffrT20r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749210688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HBNIv4v4CDaVQ8ZIjf4kNfpcVgMGwx5JzlOzvqm3Fu4=;
	b=dffrT20rXXhOo6nYwTtFAFgxWjrDN9YFHlEdu+TY63rozhJQ963jjHycitsoIj6b3iLC5c
	l6N5u3Z6fSmP1ozCvHALquUtUOkOzOjgAbqEUyRPVofXWLdSHAGzAUQlatgLLLIIcSwdq8
	M/fIACdQKrPtc4Ikl/tX24N4JQUDtwY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-nqDrCHUZM-m0W3A234Zb3w-1; Fri, 06 Jun 2025 07:51:27 -0400
X-MC-Unique: nqDrCHUZM-m0W3A234Zb3w-1
X-Mimecast-MFC-AGG-ID: nqDrCHUZM-m0W3A234Zb3w_1749210687
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4517abcba41so11529195e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210686; x=1749815486;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HBNIv4v4CDaVQ8ZIjf4kNfpcVgMGwx5JzlOzvqm3Fu4=;
        b=wVY1Nx6tkIT/BhfIWN65rFvsB6txLNL9LLjfAip6KfKpT0kajz8qCZd7tZmmokITOZ
         IWETkpvkHoqkUDm+mxoCmZVlEYOmCxEvohO4jAGsPzpMwsUTjUNbPZtoaVSzQsFVjD85
         aKr6HOthAadQxhnRGZLQB2FhxMWgzDS1aextsKWBcQ7aNniOd/b467bhOyajGIeJtbmZ
         52vNj58rvmKHnFT9+9kZ8vwQ2k10kpltvglzIoowem1nAa8MKMRZZMfilmIFOsaJ/HqX
         OWNcdG/FzkjKEFrZyYRNYdT5ydoHjjNC1mL0fC9/0Ee7AE3YVOrS0O5BFgmKiWNHYzzx
         oj0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5CmHPoeQMhk7+ojqcEtw8jI1MYbqvzk2kxJLC2hHlRq1PS7J2oM/DVMAG5hcpKJsYhIsF6kpsMGpct3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLM9kJee+aSbRuOwexLBZrGCBq+HtpTuy9149EgXZ34wyQXhEx
	0jUGUeLdLDSd3FLuKlQ1J4V39/kfPR5JbnInvSzf10/Ei7qWK5DAyvtJTe1Q1XIeYuzX8qLEDua
	onwqenESS2bPrVhj/dJHBWyyIDqs6D8JNAj0TVtroVi40GNhPgMDXGB8XtyZAoBdtiA==
X-Gm-Gg: ASbGncsbZLK8D1n9ujSKE1Wvn6IHzvT/P+8GghZ0kgaA7zNtC72HdvPx3rrdFv6YnF2
	SIvdU/cH+nhx2YZYbfllw0pYiSbdNDcBsEdfzavGK4AcyEoFsvIinIhCW1nzuZLULKgat92Xhys
	luOmru5iwrhR7i02mWFjeQv7cq9HbBm7Qhx9U3837IFrqM1qZwtxAEugUx1MPtP+TuhKEDCbwkm
	q0aVOlTli9y+q/xA2zDUzNbJPrr344HNuWLFTOC0TynZ6GBZitlP83C+e3Zl9ytg98uyuZ6cGo/
	Qcembk2JsvHgAW6kd6R5mGrYh/SejFsSRSxJxZhhOCxAlnj+6mJ/HxWv7R2zPHZz5MpJJQgwDr4
	EQPUZW4LVDLrYldq8+xChVZIoLFxIQlE=
X-Received: by 2002:a05:600c:5396:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-452013681efmr36330185e9.2.1749210686523;
        Fri, 06 Jun 2025 04:51:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElH7bwO57ALfHi1SkLqsprEBH0fmkDmJSbPoYUAVfRjcV047e6NdMnUnc45QEilr6SuOtg9w==
X-Received: by 2002:a05:600c:5396:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-452013681efmr36329955e9.2.1749210686142;
        Fri, 06 Jun 2025 04:51:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243664fsm1672259f8f.65.2025.06.06.04.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 04:51:25 -0700 (PDT)
Message-ID: <3a6f0f37-f4a9-46c0-bc3f-5c6dbf4a765d@redhat.com>
Date: Fri, 6 Jun 2025 13:51:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] drivers,cxl: Use node-notifier instead of
 memory-notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250605142305.244465-1-osalvador@suse.de>
 <20250605142305.244465-7-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605142305.244465-7-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 16:22, Oscar Salvador wrote:
> memory-tier is only concerned when a numa node changes its memory state,
> specifically when a numa node with memory comes into play for the first
> time, because it needs to get its performance attributes to build a proper
> demotion chain.
> So stop using the memory notifier and use the new numa node notifer
> instead.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>   drivers/cxl/core/region.c | 16 ++++++++--------
>   drivers/cxl/cxl.h         |  4 ++--
>   2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index c3f4dc244df7..a8477a3e175c 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c
> @@ -2432,12 +2432,12 @@ static int cxl_region_perf_attrs_callback(struct notifier_block *nb,
>   					  unsigned long action, void *arg)
>   {
>   	struct cxl_region *cxlr = container_of(nb, struct cxl_region,
> -					       memory_notifier);
> -	struct memory_notify *mnb = arg;
> -	int nid = mnb->status_change_nid;
> +					       node_notifier);
> +	struct node_notify *mnb = arg;
> +	int nid = mnb->nid;
>   	int region_nid;
>   
> -	if (nid == NUMA_NO_NODE || action != MEM_ONLINE)
> +	if (nid == NUMA_NO_NODE || action != NODE_ADDED_FIRST_MEMORY)


Dito, one would expect "nid == NUMA_NO_NODE" to never even happen here.

-- 
Cheers,

David / dhildenb

