Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453223A9A4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607642; cv=none; b=L58lDNfpQsp9jlyBgcHobY6UImBHmS882dErJrb16fno1aj8h8jgz/oBjbAtGyPY5Ob/JLwj2HKl7/2AegY54Ot3IdqW8UDuZEiSHHVT9pXw4DFmH1TLgjL699p1RGQamIHKonvsT1rxswaBctnRRLVBkxrxfYa7KkFEUHb1nGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607642; c=relaxed/simple;
	bh=txtat177/PlnHm55yhzLIBUhJ0o9pOS1InRhNIvgap4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrVCXuxtwZcWJORytIYSdNSN/C0/qAc9zd2v+rjqNVGy8FlLSwFy33aBwrZMISlQXhOr7c/szEWIF92s6apRAHozWKcTU2B9EpDyZcVeti3DMH/slULNfFb852mdvlLDGbeJKcCm1qtdrYEk9INUZ0bj+tjsIijirYGmvXcYrdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=XjwhcKjK; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="XjwhcKjK"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5f720c717so102577985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1743607637; x=1744212437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=swp0ERIz+E6S0fYtrVurk6RuHTXtNkHGNmb4MbsFy44=;
        b=XjwhcKjKyJuTXM2BEZEMeEt1f2Ol7MbCxJtPm/R+W6D/B7Q6LUs97ezS1rLcVsONwL
         rCFKiYctSPiBZ4blHEy9+g3BE1gar8WBQDt3wQIGKV8Nn1W/EZXQPX2jmScHeJrX3CBt
         JqXNopPXcNShqaGWlvJn+k164OVgQ4JwX/J8thzqMAdBbZE8jlM5HUZ0g53iO9es+XVx
         1kGfhzF3YUVhT1W6TfqoAYZPIt7GUAq91qZHdT4TPvMJXHPMbpLWb4h8mA0a2LqapVp8
         sAhWIIcXJdnylM2svQpQ12Ig4xiVT+e+UfMT2qfiAkKnBT+oSqfXaQqXO+R7svCOKMoG
         g8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607637; x=1744212437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swp0ERIz+E6S0fYtrVurk6RuHTXtNkHGNmb4MbsFy44=;
        b=vP/lUGLU3uJhr8oOELnJzXYy7EYQAxadWQFICIkoUTgzwpKi3z4pYtH+iUZSEcw/JV
         i/dUuMts9hXuIpf8rUEwR5uQJA6AXpveyKat3qLhpzGGH8AlsDe9gPKLXaGwfri6uN4m
         NM6G24Z/xBfG2+nk/jBi8jvX3ozkPLHKd/3IFS0qRuGNRzHpIHrTka5pVgx4fsH3OdrY
         Oe3Kuat3p7zi1Ah+hkX8xfWxCiPab32iwQ49ECL85JsasuMCbEUwcqtIkk2SNwx+/1se
         XakbbiKrtgMLDB9klQyH7NsmZLnXuI+g3wWymFW5JJTECghD/C0Rf21kykuMxr+hNM6G
         NW+g==
X-Forwarded-Encrypted: i=1; AJvYcCVjnZ3TFiiLxzIUmbcdI5rtqgNPLgi9CcIPYMFyC3CqUeXarfIgSK/W7sAE1DFSq3M+YS4YNYeDdbZOXaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3rGE1xenmw6XLudt8qzO4lhKXKBosq25gSq3s+K/SDfrNGbcb
	55tJl0pHoSkC89mKc8Yf/57bXnBZ7Zo0b+U2dqWEZUELvvIPLk6szKGIIybjwxhSwWehpMDV0A0
	H
X-Gm-Gg: ASbGncup4nH160JRoqQSl14uOJO+4mVTZGwTLZ2EOaFLzrwpnxcBTkyJrEaowXBSY4t
	4e8wo2Qja7Oc76qseppzQzM2V06Fx7nixHLic+xnIoc6KDYeONXS0qzSfkU8dxyS3qOhINuNgWh
	BC41i78JM6Mi9qkA6HngHhsbhm3vGy6NuGpmQj1srV9a5CMtpiPdhaRbg5fROB5hdngSm+q5xOb
	blLqF0W0SJezKHri9YvLU8wqpcayZL5l3Vw721Oy93VCKHOQca2zLFjW1JYUdaEY3aDnfFouJBP
	sO2DH2ZXa3Y0h8jw/ymEQV0uF9soU24TZg7CSkPkr34=
X-Google-Smtp-Source: AGHT+IHJsyMfk1EJsf13VfMIMZgUAxHzVAUrgG99uJym7wCUyl4f8lI2YuB3eaEGFaakifl2T8iN8g==
X-Received: by 2002:a05:620a:2806:b0:7c5:e8c5:a307 with SMTP id af79cd13be357-7c768236b36mr334604985a.9.1743607637061;
        Wed, 02 Apr 2025 08:27:17 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6eec9798807sm74840846d6.116.2025.04.02.08.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:27:16 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:27:15 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Rik van Riel <riel@surriel.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	cgroups mailinglist <cgroups@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH] memcg, oom: do not bypass oom killer for dying tasks
Message-ID: <20250402152715.GA198651@cmpxchg.org>
References: <20250402090117.130245-1-mhocko@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402090117.130245-1-mhocko@kernel.org>

On Wed, Apr 02, 2025 at 11:01:17AM +0200, Michal Hocko wrote:
> From: Michal Hocko <mhocko@suse.com>
> 
> 7775face2079 ("memcg: killed threads should not invoke memcg OOM killer") has added
> a bypass of the oom killer path for dying threads because a very
> specific workload (described in the changelog) could hit "no killable
> tasks" path. This itself is not fatal condition but it could be annoying
> if this was a common case.
> 
> On the other hand the bypass has some issues on its own. Without
> triggering oom killer we won't be able to trigger async oom reclaim
> (oom_reaper) which can operate on killed tasks as well as long as they
> still have their mm available. This could be the case during futex
> cleanup when the memory as pointed out by Johannes in [1]. The said case
> is still not fully understood but let's drop this bypass that was mostly
> driven by an artificial workload and allow dying tasks to go into oom
> path. This will make the code easier to reason about and also help
> corner cases where oom_reaper could help to release memory.
> 
> [1] https://lore.kernel.org/all/20241212183012.GB1026@cmpxchg.org/T/#u
> 
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Michal Hocko <mhocko@suse.com>

Thanks, yeah, the investigation stalled out over the new years break
and then... distractions.

I think we'll eventually still need the second part of [2], to force
charge from dying OOM victims, but let's go with this for now.

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>

[2] https://lore.kernel.org/all/20241212183012.GB1026@cmpxchg.org/

> ---
>  mm/memcontrol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 7b3503d12aaf..9c30c442e3b0 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -1627,7 +1627,7 @@ static bool mem_cgroup_out_of_memory(struct mem_cgroup *memcg, gfp_t gfp_mask,
>  	 * A few threads which were not waiting at mutex_lock_killable() can
>  	 * fail to bail out. Therefore, check again after holding oom_lock.
>  	 */
> -	ret = task_is_dying() || out_of_memory(&oc);
> +	ret = out_of_memory(&oc);
>  
>  unlock:
>  	mutex_unlock(&oom_lock);
> -- 
> 2.49.0
