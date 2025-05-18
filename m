Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161A07FD
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 16:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747585962; cv=none; b=aBpMBLfAIWcQnJoXs0Ln648HWJ7kdgrdOTiGU3Irmyt65G7oRaUgNQ8n+XsC6L26j54uVYa22YSFQOZUwDvSe59mxDsWhV8nNSD68zm68eTsxE+qNKiFnM23/dAC3wak3oqTFP+4hlIJO1wbT9xVfv3WuMC0Q9cctE5yzYaJzEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747585962; c=relaxed/simple;
	bh=JHdv/Z72TWXViYJ0Rsa16LgQtAccvKnHT0kF89rw9UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2oUdBjqkiNzl7uSBOFf1vV6Jv2H0882mcVqQveibC7ZjeQP7roUqDS5hXSVfcBkv+Ih221Mu2P4tKSsFOCjB/J5zFiUMn7JCjR0pmlCRiP7unwTNd2SnSAv8jcnRSBwE9VTic4F4uP1y47+fJOl5R2Y1pTrd1mOkYkWRrmcD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=tl/lonSS; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="tl/lonSS"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c58974ed57so394291285a.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747585958; x=1748190758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z/qOAr1C4XEBB+DPsUOfABCO22V0vXaogzTyqJK2yU=;
        b=tl/lonSStAjkFbjv2P+EJL2+WnVo/or1/N1FV3jHRqmB0Lb9Dqu0nqfOzMMq5gvqEY
         8zq8VjIgRbIxDIXltKqjCuG1hghlXfv9EOSIwpNAEtR0uhKDdKvximP3X7LU5rg2pWjW
         upywfz/sRXbTPv4VptcJiQtt3IJCevrRTO5Qf8ezonRtPD1vVd0K89rY608rhBAZiJLp
         HSGqqVD3AldI4lZkwfV0and8xRNoHDszvmcUngMi2RYlHntOVylOGqfEoKmOknm1d0nq
         jrRWf5pszOjf+YdCe7UYSYT4mi9HfeQDMv48WMEfkmrYz/5POfcl8Bwz5EIqjs77Gm6v
         L/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747585958; x=1748190758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Z/qOAr1C4XEBB+DPsUOfABCO22V0vXaogzTyqJK2yU=;
        b=GZjwvwoQvBJh8QaAuIkBSX46klFaqIu2U14Q+rQ38RzJjy+78HxtSlqLg22bZcUEDu
         yMf7www2HuEetGjinY4aybukUPIsUUNqzwmGi0s3A/PsYy6uFt+9hyH2bNXUBOPxpBeo
         4jctofqEeGDfbkL9AFM2Jy1QwpOLpCQhDBCOYGJ7CJzNmGkLamp3xSu+CyDTAbAS8i66
         +JtJhFQymaj4+I7I1eHDVXue5irsarIl2BETjKcA/dHHw268FblQyjGxwcY1wQO/eiqr
         avrTk/ZOMgOSlWmTI5m6MFFQxrT6z3FgbSMaUcUQgbYzaRUAl3KWATLlrn0Kl8MK8jSf
         Pr/A==
X-Forwarded-Encrypted: i=1; AJvYcCVTJfWbohDaJsZMoNTNVj08G/tNOmcxMnVU11/7Ywf6+ZvOMxUmmZfnajFy5ux8koi2bvjQTRbdQvJxhl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZK+ReGXjlvy7vV1d/vnQr5K9l1gnvMGlM2lb4dxuZdfl9GpI
	MNjPfFZWkCLHlei95eAvg5hEtqG5QKGgPeAhF3m6mrkahfTV7JRIc+6VXGzn+4dbljU=
X-Gm-Gg: ASbGncuou6FIKh/vex2YH7B6ChMmoixm/g2Eh9N9eijNnlfIRDvX+z7kuwe86hU9k4F
	Yxm0fiZVCdN3imHV8XPPNWx8PL7+cTfDPD+FZH6mQXJ8zgD5KK8R2LXXCEneDarWXIPTNBt6alb
	iX/QhGlWfU0TIu6BCD1IUc2GZPoZunD+p2T03n3gVA04j87CIANTT7wPbBs4BhA+ny3gsoBt5o0
	dyRMYMWjdh9D2UWUJ0DT9Wd3L2Uya2j/7DkORNsI+PsnX/MultOByJYNIXZyWoZfTS1WRJlBXdB
	w+bu7pfOCKSVI8ryjZG01L6Icm/2aMB6ogCP6X81Ag/UdXGa+w==
X-Google-Smtp-Source: AGHT+IGsf25U50Gdmw0C4S0ZXZGTzX5YSOu16UhXHbvjfBEYkvTS0VTuoT8A0k/GYuJl2dRBlTYYhQ==
X-Received: by 2002:a05:620a:4483:b0:7c5:4b18:c4c3 with SMTP id af79cd13be357-7cd4673128amr1457156685a.30.1747585957753;
        Sun, 18 May 2025 09:32:37 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd468e5a77sm424567285a.116.2025.05.18.09.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 09:32:36 -0700 (PDT)
Date: Sun, 18 May 2025 12:32:35 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Message-ID: <20250518163235.GA731066@cmpxchg.org>
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <20250509200111.3372279-5-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509200111.3372279-5-ziy@nvidia.com>

On Fri, May 09, 2025 at 04:01:11PM -0400, Zi Yan wrote:
> @@ -22,8 +22,25 @@ static inline bool is_migrate_isolate(int migratetype)
>  }
>  #endif
>  
> -#define MEMORY_OFFLINE	0x1
> -#define REPORT_FAILURE	0x2
> +/*
> + * Isolation modes:
> + * ISOLATE_MODE_NONE - isolate for other purposes than those below
> + * MEMORY_OFFLINE    - isolate to offline (!allocate) memory e.g., skip over
> + *		       PageHWPoison() pages and PageOffline() pages.
> + * CMA_ALLOCATION    - isolate for CMA allocations
> + */
> +enum isolate_mode_t {
> +	ISOLATE_MODE_NONE,
> +	MEMORY_OFFLINE,
> +	CMA_ALLOCATION,
> +};
> +
> +/*
> + * Isolation flags:
> + * REPORT_FAILURE - report details about the failure to isolate the range
> + */
> +typedef unsigned int __bitwise isolate_flags_t;
> +#define REPORT_FAILURE		((__force isolate_flags_t)BIT(0))
>  
>  void set_pageblock_migratetype(struct page *page, int migratetype);
>  void set_pageblock_isolate(struct page *page);
> @@ -32,10 +49,10 @@ bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
>  bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
>  
>  int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
> -			     int migratetype, int flags);
> +			     isolate_mode_t mode, isolate_flags_t flags);

This should be 'enum isolate_mode_t', right?

(isolate_mode_t also exists, but it's something else)
