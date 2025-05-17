Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC3B661
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747490782; cv=none; b=F2WcJPsU5z1u7QOz528VaqqI3RmB75fykstVGeGPmwb017Ua4QQ4+Wze5k1TgWz1nkhC0F/Do+pagZXaLfhcNmZc9xffC0SlIweBVQXqkRzlYk3HT7gbyv5V6DHrgJpqLFJTuUH/jd6QbjCRthstFPPl7AOextqVCMfkupgbVLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747490782; c=relaxed/simple;
	bh=V06g8hrNK3Ss5baC8W9lAcyYGrXvMeywgXb8MDbYNUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgQ59aJDxuWpYv5HEgO4CqMBKgBoVdcWL0Xty91MxRmiL14dIYRGnLxy5qT6hMKNPj68wgxcrwckExICZN8asqQ2atSrZE2hnrC6fqOzxtomAivncvZxeofRFS7qjKbNsUHm0O8GFRfAPN5IRQrtGI97ebtyvIcXEvgjF6y79i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=nRCQ87GH; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="nRCQ87GH"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c597760323so336028485a.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 07:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747490778; x=1748095578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NhvXy1V/6+eGgB5qAljkspgVToq5uQ0qNnLt1dtTF8E=;
        b=nRCQ87GHOKm//mZw3TDNdzJAdz2DpVO9AGACZqar0x2M9+Fgyhd5G5PF2Kj8c6jlO3
         z5xLWE/9s9fjq7jBbvnnri04A3gz3yjExq+0PW+zrqZtLUR095Ko96yp6PR1itF/kXMe
         ThW2Q1ctu/9YVoq6HP30Qw1L7v5cSEoi/VGS+lv4HQD1gmd0RMRMoWqy6gZ+FpmK9mB9
         5mXmgm3iZsORGkAfHfg0E0pnVUyvwFzbms3y3QqkMpdoxSCddCJT3G3OVtLREDZf+q0U
         J7e42VqnElTiwNKhnNkqBSCIgkuYEYxQqqG2E0i5mKUU4kDTzlreW6CTUFyclbhyAYBP
         pWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747490778; x=1748095578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhvXy1V/6+eGgB5qAljkspgVToq5uQ0qNnLt1dtTF8E=;
        b=uq2o3s2h1ch5m9uz/2TKMbiuK8rJdZkGj/vUOob79yF6ToMXcGBHDHfvy6UWbfxJYm
         L5YWpqPX5jdaL+fZJXxG5ZsFfCatCmCU5zKvN+fA/8XF669wYlI0H1/sPENOgHNAmVR2
         2J3R1/QSvgyyacA/TfhV7PeDWtMqJhDByvxcc63VfnVuHhrUq9qWKMkU6PRwO6yzIZWa
         uxv3rHvRkZnOxopDMKid0ghlyzkm3PVhra191+C/LjoXpqo9UO4NnQim+5nNl7SQKPZr
         +q6TvFqkhtQgsuWsDI72BLtNFVifNfdl1kiO2XmuOXpuekW2APmRPpq6CLZ/bjecqaVD
         oYiw==
X-Forwarded-Encrypted: i=1; AJvYcCUJIlwxpEGSmbsDAdlhWEBhEb9AV5W34ZE0+cjADIdcOVAv496INC1CisCVo4zRCM/SdB74wTDoh6bidvk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9S8HO7VxZeo6fSE7qEU0Wm10JxzSx7zZdWk9ZIY6gvawwsqg1
	2GIkV1xXlA4lIUK2Xx5+/x687rztaDIaDZ74MFU6FYIJdN3W7JX1tU2mNjjY2FcIJoU=
X-Gm-Gg: ASbGncsmDYHUDoEcA0RlT2Quzg1BHJzkGgXUwU9ZGwISZ6Ojy1lmKtfycaL785CIzv5
	LTKuk4OoNikpimedaiYoC2ZSqfmkcNa45K/WTC+aO5qd1CapBN0tp/uqCIF6gA8wLr/pmzP/XDB
	b2+LzeiHdxhyLgobi5zUO++utCCknfS12KJjaZ6ZIrj9CfM4yJpzUz2hnE7GD0itexxGR2mcRyI
	kZJMWgNGdvrLK9QNQjT0H/sE0pQ1SOzidsaxabwfs8GWZPA2rtURgWQZgMko2eWFf+hhlzdv36g
	5TSHkwWKoTQQXq0r/L5a3IlZjew+AkNiXmugFabB1vPZYryRVQ==
X-Google-Smtp-Source: AGHT+IGK6eD7aI2Err8GHK9YsHuDYpVSIxGRVIvR72HXl/w/7xQC5Grfki+phpp5KFktfiO8EpqdXQ==
X-Received: by 2002:a05:620a:430d:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7cd46779caamr1017827985a.43.1747490778049;
        Sat, 17 May 2025 07:06:18 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:cbb0:8ad0:a429:60f5])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd468e5a77sm257916385a.116.2025.05.17.07.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 07:06:17 -0700 (PDT)
Date: Sat, 17 May 2025 10:06:13 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	Alexei Starovoitov <ast@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Harry Yoo <harry.yoo@oracle.com>,
	Yosry Ahmed <yosry.ahmed@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tejun Heo <tj@kernel.org>, bpf@vger.kernel.org, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v3 1/5] memcg: disable kmem charging in nmi for
 unsupported arch
Message-ID: <20250517140613.GB104729@cmpxchg.org>
References: <20250516183231.1615590-1-shakeel.butt@linux.dev>
 <20250516183231.1615590-2-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516183231.1615590-2-shakeel.butt@linux.dev>

On Fri, May 16, 2025 at 11:32:27AM -0700, Shakeel Butt wrote:
> The memcg accounting and stats uses this_cpu* and atomic* ops. There are
> archs which define CONFIG_HAVE_NMI but does not define
> CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS and ARCH_HAVE_NMI_SAFE_CMPXCHG, so
> memcg accounting for such archs in nmi context is not possible to
> support. Let's just disable memcg accounting in nmi context for such
> archs.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---
> Changes since v2:
> - reorder the in_nmi() check as suggested by Vlastimil
> 
>  include/linux/memcontrol.h |  5 +++++
>  mm/memcontrol.c            | 15 +++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> index f7848f73f41c..53920528821f 100644
> --- a/include/linux/memcontrol.h
> +++ b/include/linux/memcontrol.h
> @@ -62,6 +62,11 @@ struct mem_cgroup_reclaim_cookie {
>  
>  #ifdef CONFIG_MEMCG
>  
> +#if defined(CONFIG_ARCH_HAS_NMI_SAFE_THIS_CPU_OPS) || \
> +	!defined(CONFIG_HAVE_NMI) || defined(ARCH_HAVE_NMI_SAFE_CMPXCHG)

                                             CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG?

> +#define MEMCG_SUPPORTS_NMI_CHARGING
> +#endif

Since it's derived from config symbols, it's better to make this an
internal symbol as well. Something like:

	config MEMCG_NMI_UNSAFE
		bool
		depends on HAVE_NMI
		depends on !ARCH_HAS_NMI_SAFE_THIS_CPU_OPS && !ARCH_HAVE_NMI_SAFE_CMPXCHG

>  #define MEM_CGROUP_ID_SHIFT	16
>  
>  struct mem_cgroup_id {
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index e17b698f6243..0f182e4a9da0 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -2647,11 +2647,26 @@ static struct obj_cgroup *current_objcg_update(void)
>  	return objcg;
>  }
>  
> +#ifdef MEMCG_SUPPORTS_NMI_CHARGING
> +static inline bool nmi_charging_allowed(void)
> +{
> +	return true;
> +}
> +#else
> +static inline bool nmi_charging_allowed(void)
> +{
> +	return false;
> +}
> +#endif

...drop these...

> +
>  __always_inline struct obj_cgroup *current_obj_cgroup(void)
>  {
>  	struct mem_cgroup *memcg;
>  	struct obj_cgroup *objcg;
>  
> +	if (!nmi_charging_allowed() && in_nmi())
> +		return NULL;

..and finally do

	if (IS_ENABLED(CONFIG_MEMCG_NMI_UNSAFE && in_nmi())
		return NULL;

here.
