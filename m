Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CCE1F582E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 21:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738679; cv=none; b=b5JjYzeOlGwhkM6iDfKdGZbRZvUFsGAMKCMzLxlJxXZ5beLnKySAKy4aC9a+HtTRuN9nU7qgoVtYZcsEsSASVbgIAflGjND1uKsCdZCGMPxIu0lCNxJ/0Xq00LMLExWuEPXQOc26ObhuvCFNfPhd9Up1Lxfa9A7qoNjwyIniJPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738679; c=relaxed/simple;
	bh=LCQvKjDuO7jPDZ1f+hv4XNK3F79WHM7039FlU0Lg7nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTqyPksAIqt+P3aVcnTe4SCBUuMO4j9iV4CdDHiYR/m6BMZ6mv7do2sLpf9PAqZFSLOp6Yzg9uLN+xJ1GXP0hD+ZWse49pKBEvf4BUK19wbeaBFXMRoXzr6xvqRSNjSW2aX2LCqpOjLNx6bm0Ogi8cEvBET37Qluqfs6hcRSVuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=RAmAEoTg; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="RAmAEoTg"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f53d271c4cso13880126d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1746738675; x=1747343475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=to2VTB0dsU9LuPjVTIw9CYILbskoySiJU15wPzSexz0=;
        b=RAmAEoTglTp3uhNWGR4HtVSjr8g5QFhMRHvppDvAATH4PDh2SGv266Lrfcdmo21oBv
         2T/6qApFE04wG/karwbhfJhRUlUF70iIjSNL0pfrArWOkv5IAQNRlr2v+ljk8sdGoeuz
         0MR275B3OLNltHMHcYF+QB2TSLSTI2CUoTNEtmh4IAHOzPFhhkBVhK0X+4WcHDZryrnv
         wVIUebWgGr/WN5hFUckjWTBdD5M88nmzVas4GoxLbRWja5r65uYrQo/Yhhc0MwWWDRIT
         ytG0/tXEB/ESXqTKMDmnzog2pn2QgXPxYNF8+eLYwOMOkMghRq6Ii6o+amhL4hhiXvMb
         QEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738675; x=1747343475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=to2VTB0dsU9LuPjVTIw9CYILbskoySiJU15wPzSexz0=;
        b=mriLy4N1aa3KhREHNwguRk+ndEJYdFIBRexal/rbp3JyDBlo+IV5ZauI7uZ43KlnkZ
         /BaX1xX51Wxx9n82/RQw4xa4X2/KypiXG5wPc+x9dY7M90z2M87OAY21EaIPZ/NyIRzH
         x8ZnHlWED941sv2UMfoNNRYUWsyiCW1fYxrMGEtdEahMupas3h8mB5w5wcLiMnXznvKV
         ctf2Et8WnLN6vWdUZcgNK1FpsypFzFfx+MaKGl+IbtYICJeXmERRC0Iu6DOXHY5ARaTr
         TJM9d2v+wyncWRU0zHkDF0iByD3XPKV/GPSMp5txROleE3VFY6MFJRG0EPEnO73DwVSF
         +Neg==
X-Forwarded-Encrypted: i=1; AJvYcCWkSW0kblyXE3UK+NL9W2SSMc1YKIimCJ/Fr+Djrs40hRZ4NkbOgylxR61A4cEhw4QstmED5CQ3NEXqhmA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5X2itLcDdpgvz2ZTMpUEyhu3KtK75KQp7gz1zf2E+S8hkXxL
	Mr+lWSTwn/6XM6QIEfAlcnH/KOFu/n2O22IMB8Ocz9xODJT423swHQLDKALXxIU=
X-Gm-Gg: ASbGncshYrZSgYDU2E0Gb80LVF/jH0E1A9vsFfrth2bHehpy8gcmeI53nkyFi5BrD7Z
	gmY1wIp/lGcNriFnHU9fi07fNSWb72JHOCjtcNsMvwNfZqKuUqSpK6Rpl3hD0KQ2Aryl3wTZ/aV
	SaBN29Ne0mpy5V26hunX1TDgTy7SVOCYrSg2rexAwfTlcR1b0pBIzrUjyXSmcQtT8lzMtW5zUbw
	jGXBYXnzcHOva9nSTQco9BcJY2rsP07hcPqC63CpBhn5Ko+uJrfCJqLY638j9ufK22yt5KsHc4Z
	pymtqbPJocMGzLiEM3P733GsIFJx9J79Msxs2qY=
X-Google-Smtp-Source: AGHT+IGIPxnpUPLpbFHy2sXlMpZGIoGaQowKtoDHJq0z7POkMJKcObuUGiNCETIMLOEklRQ9iF/UMg==
X-Received: by 2002:a05:6214:c28:b0:6e6:6505:ceb2 with SMTP id 6a1803df08f44-6f6e48053cemr14183656d6.36.1746738674866;
        Thu, 08 May 2025 14:11:14 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39e06a6sm4439386d6.2.2025.05.08.14.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:11:14 -0700 (PDT)
Date: Thu, 8 May 2025 17:11:09 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] mm/page_isolation: remove migratetype parameter
 from more functions.
Message-ID: <20250508211109.GC323143@cmpxchg.org>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-5-ziy@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507211059.2211628-5-ziy@nvidia.com>

On Wed, May 07, 2025 at 05:10:59PM -0400, Zi Yan wrote:
> @@ -22,8 +22,17 @@ static inline bool is_migrate_isolate(int migratetype)
>  }
>  #endif
>  
> -#define MEMORY_OFFLINE	0x1
> -#define REPORT_FAILURE	0x2
> +/*
> + * Isolation flags:
> + * MEMORY_OFFLINE - isolate to offline (!allocate) memory e.g., skip over
> + *		    PageHWPoison() pages and PageOffline() pages.
> + * REPORT_FAILURE - report details about the failure to isolate the range
> + * CMA_ALLOCATION - isolate for CMA allocations
> + */
> +typedef unsigned int __bitwise isol_flags_t;
> +#define MEMORY_OFFLINE		((__force isol_flags_t)BIT(0))
> +#define REPORT_FAILURE		((__force isol_flags_t)BIT(1))
> +#define CMA_ALLOCATION		((__force isol_flags_t)BIT(2))

Should this be a mode enum instead? MEMORY_OFFLINE and CMA_ALLOCATION
are exclusive modes AFAICS. REPORT_FAILURE is a flag, but it's only
used by MEMORY_OFFLINE, so probably better to make it a part of that
instead of having both a mode and a flag field.
