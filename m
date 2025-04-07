Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2222F1FDA65
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035904; cv=none; b=JGBfXos8Ns1107nGqAT7pzvfos2YwlGoomIv/8doz3p8fTqxU33D81qrh2cQMTEc0GCtF/KyowHKaeagB7pshR8yfWP/7l8JfRwzs3EnYfzbpcwpM8Qr6EPqZpauZcNeANWSs+PAmq+uoxHi6L6iJAmxCvfNjbQDCS8ZB7D/1I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035904; c=relaxed/simple;
	bh=zeJ3Qmp8HxZCC+FHNgPku/ntrvNn3A2plfxQ5698gf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYLCNM1/LQvQk1CIu5+QCX49Tzxugnt7yJBM1jIgFjwnwwIZV3kQ9FHT0SiFhCJ54ziRa8qEIWTpYBpgCiGUcYlfvX/wiAG15Bs+Ks5mz+cm49GB/rZaJZqzJf1Gnk7CqmC4tU0/DM/zLZqLWwMw/DLjXAuil1NzL2BXubj6SHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=myk3vk7N; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="myk3vk7N"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c7913bab2cso51220285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1744035900; x=1744640700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BtcFtvJWeTzd8aEaFE4jLS25j/Exm+iAFUHkYo8U5l4=;
        b=myk3vk7N/gkYJQhjuPU5AYuYdMaT8aS8obpKS9vqRcdipt6KtBmRnFlIhNcJGWXX+R
         uaw8H4Mt76ZFfA2jn3/tk/VCNogBrFKKK8kkhLt4jEtrfjzeLf2ymBV09gCVnh/JI225
         lRUJgPyMougMsH5ORgsracAo7Zaamv1iLfzK/qqAI2wfGSrEIQVgIjgokC9vcePoO0+X
         Ua5R+BMEKzmWIJ+ZsRRPgsV6sLWD3sOtowCeJ8tl4pWNsqebtW+81qdSXsrWYR9aB49C
         BfIPFLfc1DX9ReF2Rm3eU7NiBKCpAPbAmoVtTFsW8vZskgPkWOr+DLB/KaMFSFMfbiEK
         mj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035900; x=1744640700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtcFtvJWeTzd8aEaFE4jLS25j/Exm+iAFUHkYo8U5l4=;
        b=RRDC4by0a104sLAHDW8034W987kIyKhfXGj4T0Tn1j2/jnguMXgqxnwtnfq19y7kTB
         xWEPM+y0KclM26QsgjZV7stiz/ZLUX3Z7ODlrBKRTb7uIcBWLpsLz0TYSbyWKeujT5TT
         QZPMQa7zctuiAwhMxTjM8AVTx6oZJjci/E/NoDnyrH6N5WU7TwUIUzCHz+gBISlHgeSv
         5Cr8ULkYGcu/VcnyNbr6BixQffhXCpLpH8WbXt/Ur4l+XP5Zi95o0JcC5aGy3nAvgItq
         FSkfxk3K1mFDr27verwmWXZyrDuk7U569thpojpaqY8v+8FEal9Yb7BXZ1tft4JPe7OS
         3fEw==
X-Forwarded-Encrypted: i=1; AJvYcCVQY4BKKhCZV0ZwwMasPUbg21Llasgt4UIsMA4+Rg1K3wnLImSLHXkEwonpObFdIwMvFhZUI5hF4l/2zok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbfxgCIRynXVh40NdMFqULOmVY5USXInOvWomXEjGVarvoOQ6a
	yW7Gy7/6d0zptYZDYcXH5395DQbtx8roULWXCUiG0Hx3eWDCbEUkLqCaIaecvz39gKsiXmckAiS
	W
X-Gm-Gg: ASbGnctLDkmVmAGKzh/zZbSwva4W/5XN1MzM4lgs0hJyxrtFPREBV9RjIUw3aH5NtJT
	nJVhytSCYxsG3XvOrxf7WT9BafFet8ChpEV3V/aqgPMbylI4bFPFVnDG1Kdo3Ga7hBfITIlbeYw
	INC6Z/SbpJv0u+Ia6ggLpqXyyg72AvUXF3r543b8+UD6JeJZGGD06cfx92abzE00im4JP3zD0dc
	8rirUrOLfmAGXuH6FwDBFlQYx7op9Ni05/UYrRbs0vaQxU53cEwvocNAhb7fo/067Ku2VX+qJ76
	R7F3osn/cnQe2JUfN4G0tnHIljiWS6ht0Hp/rVqm9QA=
X-Google-Smtp-Source: AGHT+IHyuzC5+kG2dk5Msmyxn0gHtav7B/XZxK3w72aKlsga3evi7tqvhUM7FAm8nD/j1XIQV6Dy/w==
X-Received: by 2002:a05:620a:bc2:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7c774dfa5f5mr2014121585a.53.1744035899741;
        Mon, 07 Apr 2025 07:24:59 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e75c085sm601668785a.40.2025.04.07.07.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:24:58 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:24:55 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Waiman Long <longman@redhat.com>
Cc: Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 1/2] mm/vmscan: Skip memcg with !usage in
 shrink_node_memcgs()
Message-ID: <20250407142455.GA827@cmpxchg.org>
References: <20250407014159.1291785-1-longman@redhat.com>
 <20250407014159.1291785-2-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407014159.1291785-2-longman@redhat.com>

On Sun, Apr 06, 2025 at 09:41:58PM -0400, Waiman Long wrote:
> The test_memcontrol selftest consistently fails its test_memcg_low
> sub-test due to the fact that two of its test child cgroups which
> have a memmory.low of 0 or an effective memory.low of 0 still have low
> events generated for them since mem_cgroup_below_low() use the ">="
> operator when comparing to elow.
> 
> The two failed use cases are as follows:
> 
> 1) memory.low is set to 0, but low events can still be triggered and
>    so the cgroup may have a non-zero low event count. I doubt users are
>    looking for that as they didn't set memory.low at all.
> 
> 2) memory.low is set to a non-zero value but the cgroup has no task in
>    it so that it has an effective low value of 0. Again it may have a
>    non-zero low event count if memory reclaim happens. This is probably
>    not a result expected by the users and it is really doubtful that
>    users will check an empty cgroup with no task in it and expecting
>    some non-zero event counts.
> 
> In the first case, even though memory.low isn't set, it may still have
> some low protection if memory.low is set in the parent. So low event may
> still be recorded. The test_memcontrol.c test has to be modified to
> account for that.
> 
> For the second case, it really doesn't make sense to have non-zero
> low event if the cgroup has 0 usage. So we need to skip this corner
> case in shrink_node_memcgs() by skipping the !usage case. The
> "#ifdef CONFIG_MEMCG" directive is added to avoid problem with the
> non-CONFIG_MEMCG case.
> 
> With this patch applied, the test_memcg_low sub-test finishes
> successfully without failure in most cases. Though both test_memcg_low
> and test_memcg_min sub-tests may still fail occasionally if the
> memory.current values fall outside of the expected ranges.
> 
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  mm/vmscan.c                                      | 10 ++++++++++
>  tools/testing/selftests/cgroup/test_memcontrol.c |  7 ++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index b620d74b0f66..65dee0ad6627 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -5926,6 +5926,7 @@ static inline bool should_continue_reclaim(struct pglist_data *pgdat,
>  	return inactive_lru_pages > pages_for_compaction;
>  }
>  
> +#ifdef CONFIG_MEMCG
>  static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
>  {
>  	struct mem_cgroup *target_memcg = sc->target_mem_cgroup;
> @@ -5963,6 +5964,10 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
>  
>  		mem_cgroup_calculate_protection(target_memcg, memcg);
>  
> +		/* Skip memcg with no usage */
> +		if (!page_counter_read(&memcg->memory))
> +			continue;

Please use mem_cgroup_usage() like I had originally suggested.

The !CONFIG_MEMCG case can be done like its root cgroup branch.

>  		if (mem_cgroup_below_min(target_memcg, memcg)) {
>  			/*
>  			 * Hard protection.
> @@ -6004,6 +6009,11 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
>  		}
>  	} while ((memcg = mem_cgroup_iter(target_memcg, memcg, partial)));
>  }
> +#else
> +static inline void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
> +{
> +}
> +#endif /* CONFIG_MEMCG */

You made the entire reclaim path a nop for !CONFIG_MEMCG.
