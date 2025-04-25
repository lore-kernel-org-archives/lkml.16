Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016BF29A5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611251; cv=none; b=sazkNXeXaFcAbfaiSm218RMy5vCSOB9e4A7whOpROYhyK5qxJD2AW5wsBHgB85r9jFlWi0Dcxee2KYVlo3bYj7MLa2/kqS7KfCy9oG7E8yzJQ4pX/+FkiaJ5/74Y5MPiPJKoyH3PYSm6O6kTL6LFRMgWngFzNFnbsP/z8cuTQTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611251; c=relaxed/simple;
	bh=a6+JQTsIgRc9pDgT44BOrIZwQPPPp7NtalWXb0q5F5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKfVqy5lM8KSRa9kLlZKJWe6qB7vA2sSfSqGRDgICH7/+7Ao3bgUAhBepW1vKM/qQ/SWN2zxk0erUWDbTNiBkqbUM2+HegK9n6YTfNnabn6RJgIQxBOTxdzE4X4PfzkLms8ixN+KRYi8CLamNc0pL7beZCczc814mm7uZ6SLA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d26JPcre; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d26JPcre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745611248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T8/4HYJEyKL0BmypDXzpIvuA602T0FZNtumDp2Gucts=;
	b=d26JPcregejvzteTqqwFI+Nt/wAvd4vSAKTb/5eh4IRxCdMeSp9BqUDJKNGz8ziCoTDVKa
	sNc/gf1MDq0R9Y3S9ymMOFijuuII6pBktbGuxO0MAM0f9q0rUdeBji84f6Cjox4IYD6k/6
	tQ+bie9VxCAa5k3N7aaiT1WlAl1nxM4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-mI8ddhJIOiqOCYGrfYynuA-1; Fri, 25 Apr 2025 16:00:47 -0400
X-MC-Unique: mI8ddhJIOiqOCYGrfYynuA-1
X-Mimecast-MFC-AGG-ID: mI8ddhJIOiqOCYGrfYynuA_1745611247
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so455024685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745611247; x=1746216047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/4HYJEyKL0BmypDXzpIvuA602T0FZNtumDp2Gucts=;
        b=ualZTsHSqebwTXg3iSXF8d4cwad5pAF9+PXHAxc+znSUST5dZ26uNmDkVFeH9bAvl5
         X8E/L6nj4Cxfi336TIVkxfPJYbjxVtw4pz98ArJ0V8lEZLFsuxVzcNyCKBZDsPw2VlWM
         JANnhI6qN5itix8OEt8tSmliKjA3yc7VwpkgHAPPoBkxjY6dKeTvHD23qtBawembuwmZ
         d6ZTsD5dZyYsi7CjBi+l+QkOZNi+EudbKOjCZky2SORc8B/Q64r3TIx8Adux4tXMGOzF
         lO1KqLiep6yVr2zv+6XmWCyJl4UnBbb9E3HTLBcf2vJZPW+c6bs2Vt2ekZNbLkXHdnK0
         6viQ==
X-Gm-Message-State: AOJu0YwmCVcbYGB/ya9Pzoe6rfx7BtYEd/OJh2laQiNRYHGDPjfgle3v
	L7EUyts33eRzTjT83GaPLO6X8Cv10D23u7/yBDQgrUpDHXVL3BlmP+Pjq2WMzW6QsmpQnjqQjOu
	0P0vG9c8p1+WKEPiOfnFPyLZpjefwdc59v1VtOVFbyUXz/Ei0BXW9ZS+Ewqdf6g==
X-Gm-Gg: ASbGncusj963B+XN30uNAvNY1/MNWqlQSz/gzQFtlntWWiMtHa2ds2IEmbq5jQLd3P2
	g3Tsq0PCgYy60KNMxG226XghGd4QIUNyyPJqjIhyzHFoy2pQnPJ3Dv6iJE5peqRRUYGMKR6B9pQ
	Xbub5xpYnjkVGKwILYqn/GakwNnM3240GTkHgxJNUOMRuVSwjOCJxiLC3akTpvDep3YTyORiteZ
	QGZpmHtKGZq4zpmLo5zMVvO4f9WWkk9oOlAnCGRqHgahw4yd90KrbVHn7NUpn031ym/IpgA6V3Z
	NRE=
X-Received: by 2002:a05:620a:24ca:b0:7c5:dfe6:222a with SMTP id af79cd13be357-7c960793e41mr556094285a.42.1745611246994;
        Fri, 25 Apr 2025 13:00:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp9AqScyuP//w2WTf2DZKa+eTenWSA/B8rLTtbznOGZp/n+4SX/uHlViZL3kDCGa1T/CH6wQ==
X-Received: by 2002:a05:620a:24ca:b0:7c5:dfe6:222a with SMTP id af79cd13be357-7c960793e41mr556088285a.42.1745611246549;
        Fri, 25 Apr 2025 13:00:46 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbe651sm258957185a.47.2025.04.25.13.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 13:00:45 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:00:42 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v1 04/11] mm/memremap: convert to pfnmap_track() +
 pfnmap_untrack()
Message-ID: <aAvp6umyw1AF2DbN@x1.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-5-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-5-david@redhat.com>

On Fri, Apr 25, 2025 at 10:17:08AM +0200, David Hildenbrand wrote:
> Let's use the new, cleaner interface.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/memremap.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 2aebc1b192da9..c417c843e9b1f 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -130,7 +130,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
>  	}
>  	mem_hotplug_done();
>  
> -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> +	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
>  	pgmap_array_delete(range);
>  }
>  
> @@ -211,8 +211,8 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>  	if (nid < 0)
>  		nid = numa_mem_id();
>  
> -	error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
> -			range_len(range));
> +	error = pfnmap_track(PHYS_PFN(range->start), range_len(range),
> +			     &params->pgprot);
>  	if (error)
>  		goto err_pfn_remap;
>  
> @@ -277,7 +277,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>  	if (!is_private)
>  		kasan_remove_zero_shadow(__va(range->start), range_len(range));
>  err_kasan:
> -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> +	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));

Not a huge deal, but maybe we could merge this and previous patch?  It
might be easier to reference the impl when reading the call site changes.

>  err_pfn_remap:
>  	pgmap_array_delete(range);
>  	return error;
> -- 
> 2.49.0
> 

-- 
Peter Xu

