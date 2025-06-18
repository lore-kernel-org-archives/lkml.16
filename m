Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AB1277CB8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230385; cv=none; b=JonHAd6CHYOfKeAAUzyzeoJSuKyBPt0hyYZ14PYx8w60KrlM1/a9rAjAWvhQ3dYTD3O6ddislzTowniUjdIaHZl3KNG6d6W5R9pIELFq7dZ+WsRKoLFETIrF/qgRxzFJB7cktoVdWe/a4nJ+sWfb0yM+9RvftRpySFsUE7bFppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230385; c=relaxed/simple;
	bh=A2xQRh82eLpfV/4XZ2JrVg3cKaAyJ1bR0+eEjm8yzy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Alj/8O1c1Is4DQuNEtOU+juBAMMeOqsT3AggTeoX/eaWJa6/gmynSBz62wrQTi2Gy57dQyju6/iPi7YBcH56uS+avIcX4k6kWhu8IujttC2odIeTo+PEytMpv/qgmsBGK8F6O6GzhRntnbr30kTqCKfnCxwaYGrxyW6ufZzMRgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TZutrawO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TZutrawO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4530921461aso56238035e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750230381; x=1750835181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P8ak0u57mwKY+la7IosABlsldAqqF1M3hqL1GnHeB7I=;
        b=TZutrawOsuYe4kSjD9Tt7C6FbAU9HJ/r/Hbw8J8qSZb4piIUi10RSOUC5LfE2DZ+Of
         t6CsxDlbC1gRq2j88ROLe2iCvVKYcbmbJ1t4QhTYs7S3K6Dj+dYU3auyDyFDjzJNU1Wc
         FFOllNkmgQKnKORpYdRtkwsQxdEVfzxfh7zriqmRz1vm2A5IGlf3OHBpXRpe/GVPq/7U
         UM4M/Cxa2S9Iu4NH8G3aonxUNM/GZOVNqqMk5pEofdh2kPZKEHUCznnuIYx5UVPQREMN
         ydOyqpK2mFgsT7Q4pd32BM159JeFMFbP4v/Inr9D3+TMnkZpD0qHFQfo09Eh6ijRNgMB
         xjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230381; x=1750835181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P8ak0u57mwKY+la7IosABlsldAqqF1M3hqL1GnHeB7I=;
        b=E50EP9cfBtITaITkIS+epUwcl9uwsyJwPeDMhDq6wgpdTRecbEEQII+mTS5VGvxatT
         gMGNfCKeZELOC42lMFQbOVZBkIvz6mtmbS2cpGG5xFrvHVDTMErl2kOQwa5PIVtu5lyA
         4prEmeZVW2dKJTNOgHGRWKUltN/Xf/7fLg7COgLZGiBDR+q/uQLCaQmm0z4FlzNGXDmi
         zvQUk6s4BwTXXf1Fc6C40MXwDRXdCV66BzriuyxXumL60fBdYqmbX9Q5gEEz/2mo6Ty1
         xbgQuhMYsmjc4OHAEoairiXo6pc1HerXS4GX9RNQkfzeAv8wKRp3UoeAc2G+ZeXiTJGI
         +13A==
X-Forwarded-Encrypted: i=1; AJvYcCWB3Ax7Znge4lFlyCVQjxqBRycocSAd4EPX8WsHbG15qtsydLotrIHrv3qrsz3p5ckfjTY3GTzgis69gYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmHmSfQPZ0GMTUvi4QMQD9/uiOvflre1PF18+sW5TF6fjFUSrL
	eGkpmImsg+o+LeLUnOj4Q7dfKHdSqfqRHeno0L6jl1y3bgXFUJpht0Y4NAwBkFIlLfM=
X-Gm-Gg: ASbGncuXpt/O6sOakWWLAmEX8OIeO2fub/8KTpjlGFqNZGhbHdV3Lnh5C8ovtIXYMQ1
	JzOGnee2vJL9Fc7cD1mt3dFpQWnt6PSdOQpcL+q52nTwAltrhWAwVLn+Pd7fABb/ObihHfD3NMN
	2l0KaXQAnbk1j24S+qzUvfs1dAFqPLCgiB9ajPT3Jjcykc0ScB8q0QUHbzw0B25xh5aXvEFE/R/
	Wy1cHy2QQXtwxF3u4su1yN8PijSudDgF0fmLaMZhApOkhHJsTH0sb6AR9EwbCf3SgvgJt6WGXJu
	WrDY7v3IIoH0kGYN8YmjmPrFS1yju6/IBo4iyA9L5mGBrr3U/jFJ+MtZF84f6hbxqeJwcx0169o
	=
X-Google-Smtp-Source: AGHT+IFimzhLX/ijd7oNELOScBvX3FkMVVc/Tv3+hG5vD6SxptgJFsZJSYZ/wB5n6DFIXSEA+AMKDg==
X-Received: by 2002:a05:600c:4e0d:b0:453:c39:d0d0 with SMTP id 5b1f17b1804b1-4533ca6905bmr165409335e9.13.1750230381447;
        Wed, 18 Jun 2025 00:06:21 -0700 (PDT)
Received: from localhost (109-81-93-212.rct.o2.cz. [109.81.93.212])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a54e71sm15794410f8f.1.2025.06.18.00.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:06:21 -0700 (PDT)
Date: Wed, 18 Jun 2025 09:06:20 +0200
From: Michal Hocko <mhocko@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	David Rientjes <rientjes@google.com>,
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mm: add OOM killer maintainer structure
Message-ID: <aFJlbF9DHb3LfIJE@tiehlicka>
References: <20250617085819.355838-1-mhocko@kernel.org>
 <002eac51-1185-4a51-94f9-49987db84202@lucifer.local>
 <aFHJYymXpMQu6nEv@tiehlicka>
 <20250617173141.8f7e110aa027fab242f8debc@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617173141.8f7e110aa027fab242f8debc@linux-foundation.org>

On Tue 17-06-25 17:31:41, Andrew Morton wrote:
> On Tue, 17 Jun 2025 22:00:35 +0200 Michal Hocko <mhocko@suse.com> wrote:
> 
> > Andrew, do you want me to respin with the sugested change or are you
> > going to pick those up?
> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: mm-add-oom-killer-maintainer-structure-fix
> Date: Tue Jun 17 05:26:51 PM PDT 2025
> 
> fix mhocko email address (SeongJae), add files (Lorenzo)
> 
> Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: SeongJae Park <sj@kernel.org>
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Michal Hocko <mhocko@kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Thank you Andrew. LGTM

> ---
> 
>  MAINTAINERS |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> --- a/MAINTAINERS~mm-add-oom-killer-maintainer-structure-fix
> +++ a/MAINTAINERS
> @@ -15851,12 +15851,15 @@ F:	mm/numa_emulation.c
>  F:	mm/numa_memblks.c
>  
>  MEMORY MANAGEMENT - OOM KILLER
> -M:	Michal Hocko <mhocko@suse.com
> +M:	Michal Hocko <mhocko@suse.com>
>  R:	David Rientjes <rientjes@google.com>
>  R:	Shakeel Butt <shakeel.butt@linux.dev>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  F:	mm/oom_kill.c
> +F:	include/linux/oom.h
> +F:	include/trace/events/oom.h
> +F:	include/uapi/linux/oom.h
>  
>  MEMORY MANAGEMENT - PAGE ALLOCATOR
>  M:	Andrew Morton <akpm@linux-foundation.org>
> _

-- 
Michal Hocko
SUSE Labs
