Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5C8264F88
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104881; cv=none; b=cQ0jofHfI9x4RKpVIkjNmGaHdv6R6VlOZpff8KOukXuiz2j++rynWMYF3SYURovUr1TX5XZo+zhl2iRfveq0pYbO60twilLlMl7u/H/z2CTfAsOhFJ/lNGZFgxuFZQxlZnMdCbP9SUijW5Wt+bOc2HW+4gyLMFiwzesSDmXacdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104881; c=relaxed/simple;
	bh=Mw9BipaX03ecmtlnzgP3qZmLo1pRUnsgk//oLUm+1HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iajI3Q3Bae4/2bdappcILWCYXYDCMiDSOfQ6pTE37fGpXbTdHSm90G7uEjHhtw2bh9bWYn5OWokMEL/aXPUABLE1xkfssgsCxzYkr6pXpz6yRemP/fpeGlW2iIL0qh2wboJGuoexJ5TAjjks/DneJfPj1AnfyBdgazDBOteqgwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eWCNtmRP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eWCNtmRP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ede096d73so21907725e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744104877; x=1744709677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AtwwP4HqDMoVhJV9AOJlIF1w0v00JywAQfC5Yv29UZk=;
        b=eWCNtmRPElP9JIEJ8YFf/H5brmVGi28kqIlcGN/fLsoigddIiXnQgqmE0qZXAqrZll
         vx7I/P/CkALBhdt2/91Ik6VMGcn9eHx74UXTErBwq9wU/ElV62C9yjSxUndh1TsalCG+
         Tam5o72TD0xp9LKnPe1ofGBQ1n0ZhFdoQoZhPgQPzP7SZYw6bDCuKTvc5sJ3POzXbuQg
         aYUPEm/q1iUPfBGquPU1nyAYyOP2eBU+nmpePRKGiASRYKI9tEW3/vR931H7L7PjfQy8
         rsRgkXSVjtQ0dwi/iQJ0mNgJCgOgALd65H4aH3eyNexSd1vzedx+t+LOnH/+PWSZqslw
         w22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104877; x=1744709677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtwwP4HqDMoVhJV9AOJlIF1w0v00JywAQfC5Yv29UZk=;
        b=kaknuoqfqL4uwCHMe0Gen20VI8HxP1lX1//4viKFo/24WH1YkS/QQR3izQX/TUw/Yr
         7ZD58kJN2Hx5ZhrTHCZX87j/BYcD+gXMno0ZJ0UyshOlPlG8NeE3laI4THgNGqt6L6C2
         CYWbS7H/ObPOBV3c9g/TlBUzyr7CyjO+N17Mq6ioucBa9VESoOxGRbfbAKYr1Buwlyhf
         0ma9V/daDrWKDD1qpsS3Ez0AwXmEYR/9WdZ/s9Ngmw3nfToF+rFm0TmuI7usalxOHgvH
         ca0TyYLI+n0W8ZfuzqTj7OobqtOmjrDVWd7+yL4QmuvYv8uYyImXoI1mLgY7vul+jQ+w
         bZiw==
X-Forwarded-Encrypted: i=1; AJvYcCXCBdvjJ8Y+UnIDiUHD1FxU8MmKwBoORc0CSSkUGGZ0h05OaUfchKywXmIUz86k1aBfmGWmjkuoN6FtSS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81l+l/HCPPl4dcY24LDeNr1927U8EQAh5poHwPifVT2hfK0d0
	X3zcTkq4lgkY4h2HCkt39/7RfvDML8BOUG3jNQZx4oWS+twB77wHU+QKH8f1brs=
X-Gm-Gg: ASbGncsodmQEUPub6mHllP2Ij16i+mRmukfsTfdSGwLGp01qF3W4npg2WWaF3m0Vp2z
	heSj4A/TV6f2rxb/4qLElBCQKAg/NYj2sYiYx9uofUtuTIJffpDFImgihgtvW6mdTjDi20Q/uAQ
	npEUvBsTCQvIUAuR47bdRZnM4jsufAIB6n4FWSrJDmHiVSgkFlBVgt76N6mfLsMWDqAKuysHNlz
	tw9/tUa+Jjl1lzAPHSiEIDmVzXz0oRjCMIpAYrFJN/5sUDMjEirbUkfKu77WFmBA8B3ooSuMMuX
	t9k3H8uT+ZwXVv9doS9kd0ivGQyE3TzIYMti6RsD8r/kElMnY42iYlg=
X-Google-Smtp-Source: AGHT+IEjRZm4TK0RyiZ3PAjlRVU6L5oyxaErbz97TRvApb6+B+nBpIqS5LQTTXTNW8eDHsr7ZSAprw==
X-Received: by 2002:a05:600c:3b13:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-43ed0bde8a8mr144207385e9.11.1744104876909;
        Tue, 08 Apr 2025 02:34:36 -0700 (PDT)
Received: from localhost (109-81-82-69.rct.o2.cz. [109.81.82.69])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec364d07csm154393655e9.28.2025.04.08.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:34:36 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:34:35 +0200
From: Michal Hocko <mhocko@suse.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <jackmanb@google.com>
Subject: Re: [RFC PATCH 2/2] MAINTAINERS: add MM subsection for the page
 allocator
Message-ID: <Z_Ttq-uBXdqlewEa@tiehlicka>
References: <20250407200508.121357-3-vbabka@suse.cz>
 <20250407200508.121357-4-vbabka@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407200508.121357-4-vbabka@suse.cz>

On Mon 07-04-25 22:05:10, Vlastimil Babka wrote:
> Add a subsection for the page allocator, including compaction as it's
> crucial for high-order allocations and works together with the
> anti-fragmentation features. Volunteer myself as a reviewer.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Mel Gorman <mgorman@techsingularity.net>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Brendan Jackman <jackmanb@google.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Michal Hocko <mhocko@suse.com>

Feel free to add
R: Michal Hocko <mhocko@suse.com>
Thanks

> ---
> Extra reviewers would be welcome, including/not limited the people I
> Cc'd based on my recollection and get_maintainers --git
> Also if I missed any related file please lmk. Thanks.
> 
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4fe7cf5fc4ea..610636f622b1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15511,6 +15511,16 @@ F:	mm/numa.c
>  F:	mm/numa_emulation.c
>  F:	mm/numa_memblks.c
>  
> +MEMORY MANAGEMENT - PAGE ALLOCATOR
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	mm/compaction.c
> +F:	mm/page_alloc.c
> +F:	include/linux/gfp.h
> +F:	include/linux/compaction.h
> +
>  MEMORY MANAGEMENT - SECRETMEM
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> -- 
> 2.49.0

-- 
Michal Hocko
SUSE Labs
