Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71016283CBF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295533; cv=none; b=SyEQJWRV8tih2Ag4psOcjnk6vtNWKR20WZDH11/U0DadTiF/NuiskfT2xVvA73H/yGT0hLrFS2cvD2riaNLw1NJIFDn/7y0eZB8ooimhqtbRayJ5o6JIoB2dSwQpYfatIDSGLAblbTHyNkZw3uu1b1Zjgxco1Q+sb+Gk2Ksz/1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295533; c=relaxed/simple;
	bh=HfgE9Y8sAY7yl3KTQbV39xlbk+Pg3l5rIqWBrt0nb3Y=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=WCWkcd/QXfunZBoD2EvD1h6aUaqVP8YRUlt+/oZ1fCssjtYNEn+vL6ULqPeeENi7f/SrrbCZzWXTgp2/3lvt7G0xe+NN7uQ76ylkk1430raXR+440o+8le0I3wwus4bVulrZ2hHKBFnd2UMBSDmjidzfafDzZjNmU1TW6/YYUUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGFGXL0M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGFGXL0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744295529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5l5TS2YOv3DW3bRT2qlSdV2KlHjmhjl74v5jwt6E+m0=;
	b=IGFGXL0MunoMe8Cl7rGXIUUDr4UVXBcMtwtLn/Ow9NFiQdPe1nH6RV2L8DB4ZtQbbwywUa
	q6Wrc29fRz51B2muT+wLYrwmVZ7uQ1GVuabEdOL6s5Jc2wPRU0ZaDL5R7dwmt+9hDlUrhc
	feyM4ZgINDujutaKCz8bgxWpSIbvnto=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-hfhxKpmrOQOyAUJ8_zi27Q-1; Thu, 10 Apr 2025 10:32:07 -0400
X-MC-Unique: hfhxKpmrOQOyAUJ8_zi27Q-1
X-Mimecast-MFC-AGG-ID: hfhxKpmrOQOyAUJ8_zi27Q_1744295526
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47779dbdb62so29618451cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744295526; x=1744900326;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5l5TS2YOv3DW3bRT2qlSdV2KlHjmhjl74v5jwt6E+m0=;
        b=IXtlS9r+a9q59g4tnubbVwB4C2O1s+pa63NLRhiyn0gJnlI3OTFzoIdgtttdLDebIe
         nXiXnZxCYU2M5EsZoq4CvcgcodW4emB7AcriO4vc6WOL6pARwPZ7JUuk90HfFjRmkGC6
         HsItvOHh0GVknEJi/mkgbvphrRvUAX2089rYllgUriSyH/zJKJTaPlTY+swcf8Rzo0vV
         dSHbZw0YxVKTNoHUcJQ/xPgBeqjyB2TjiYeCDd6AnF4YiRA8gguXgzsOAR4MgEFUbawU
         Uf1fDgWiezidfLef4mm04uVHXwSXZvTSEKuFk3EjotOimSvZPcuhGEtpDJG04S7nFe0m
         J8Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVVXQGfX/hzA72xbNd7NJ08LNPVq3j8QG52iEJUiu5MNyxXKxOY3bgUDj9+TzDXugglcCsqj52PmURDMgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztm0+DZsqqkT0i1a4xYqtmS4OheAf2rb136v7MfVdEInUWnx/J
	R1hzROkQJ35cKmYcWv2BkL8CO70rSsTNdeRS+KWlHaTmmyFMLjsENm2SaqOfmZ+x92cYj5AgNGN
	cIfK20Ip7aw3/0nwkywUtUCjI1dWvpxleazxEVcwSGVoOiSnN+G2U9pM1FRQ6LVXM3aYO2g==
X-Gm-Gg: ASbGncvo6msUVLThITQgiTVwdUBzdeU3+5Ul83RyncIAnfdxNy0R/QqLDRwOpaXtsrK
	t+O8It8hOkil02Nn+lXQL3UmDaej6o0As8O8fqi4PKARssYn8L0FuSRabhAJnf/rk4aChV/ko1j
	w3Ta0hkBTXFlL7XW2ukaDTPsAScMBXXnESCb2Ij9NF/+g2JQCQSTMF7rcK4m2nDQMA8LdE2ZGyF
	j/COXt/geqZz32IOEfjdw2uI8cLsRzsjPuWl72/2b8g3d+cqRcqrEa1dfsNm0LP3g8EFWVjJMqs
	MvLGSO9YY90F4g/sRqHERzsNdYhWaEFpTsRBKYTfRl0UkoRJ42ewYJe63A==
X-Received: by 2002:ac8:58d6:0:b0:476:97d3:54f with SMTP id d75a77b69052e-4796cbb4abamr40724231cf.14.1744295525986;
        Thu, 10 Apr 2025 07:32:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEW+XBKcfmtudG6c9oaSuB8e3Zcrc0iQqJSkA8qRKrFf0raL4QOWp3KnfY4DmCrpy2YKBZjg==
X-Received: by 2002:ac8:58d6:0:b0:476:97d3:54f with SMTP id d75a77b69052e-4796cbb4abamr40723851cf.14.1744295525627;
        Thu, 10 Apr 2025 07:32:05 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb2b4easm9377461cf.34.2025.04.10.07.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:32:05 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <f816b9cd-7797-4b70-9899-d2f56a0b785e@redhat.com>
Date: Thu, 10 Apr 2025 10:32:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] timers: Exclude isolated cpus from timer migation
To: Gabriele Monaco <gmonaco@redhat.com>, linux-kernel@vger.kernel.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250410065446.57304-2-gmonaco@redhat.com>
Content-Language: en-US
In-Reply-To: <20250410065446.57304-2-gmonaco@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/25 2:54 AM, Gabriele Monaco wrote:
> The timer migration mechanism allows timers to move from idle CPUs to
> active ones to improve the overall idle time. This is however undesired
> when CPU intensive workloads run on isolated cores, as the algorithm
> would move the timers from housekeeping to isolated cores, negatively
> affecting the isolation.
>
> Exclude isolated cores from the timer migration algorithm, extend the
> concept of unavailable cores, currently used for offline ones, to
> isolated ones:
>   * A core is unavailable if isolated or offline;
>   * A core is available if isolated and offline;
>
> Keep a cpumap to easily track unavailable cores and change the concept
> of online/offline tmigr to available/unavailable in code and
> tracepoints.
>
> A core is considered unavailable as idle if:
>   * is in the isolcpus list
>   * is in the nohz_full list
>   * is in an isolated cpuset
>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>   include/linux/timer.h                  |  6 +++
>   include/trace/events/timer_migration.h |  4 +-
>   kernel/cgroup/cpuset.c                 | 15 +++---
>   kernel/time/timer_migration.c          | 72 +++++++++++++++++++++-----
>   kernel/time/timer_migration.h          |  2 +-
>   5 files changed, 76 insertions(+), 23 deletions(-)
>
> diff --git a/include/linux/timer.h b/include/linux/timer.h
> index 10596d7c3a346..27fb02aa3d780 100644
> --- a/include/linux/timer.h
> +++ b/include/linux/timer.h
> @@ -190,4 +190,10 @@ int timers_dead_cpu(unsigned int cpu);
>   #define timers_dead_cpu		NULL
>   #endif
>   
> +#if defined(CONFIG_SMP) && defined(CONFIG_NO_HZ_COMMON)
> +extern int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask);
> +#else
> +static inline int tmigr_isolated_exclude_cpumask(cpumask_var_t exclude_cpumask) { }
> +#endif
> +
>   #endif
> diff --git a/include/trace/events/timer_migration.h b/include/trace/events/timer_migration.h
> index 47db5eaf2f9ab..61171b13c687c 100644
> --- a/include/trace/events/timer_migration.h
> +++ b/include/trace/events/timer_migration.h
> @@ -173,14 +173,14 @@ DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_active,
>   	TP_ARGS(tmc)
>   );
>   
> -DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_online,
> +DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_available,
>   
>   	TP_PROTO(struct tmigr_cpu *tmc),
>   
>   	TP_ARGS(tmc)
>   );
>   
> -DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_offline,
> +DEFINE_EVENT(tmigr_cpugroup, tmigr_cpu_unavailable,
>   
>   	TP_PROTO(struct tmigr_cpu *tmc),
>   
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 306b604300914..47495ba4012b5 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -1323,7 +1323,7 @@ static bool partition_xcpus_del(int old_prs, struct cpuset *parent,
>   	return isolcpus_updated;
>   }
>   
> -static void update_unbound_workqueue_cpumask(bool isolcpus_updated)
> +static void update_unbound_interference_cpumask(bool isolcpus_updated)

Unbound workqueue is a special workqueue. The name 
"update_unbound_interference_cpumask" doesn't make sense. I would prefer 
you to use names like "update_exclusion_cpumasks" or 
"update_isolated_cpumasks".

Cheers,
Longman


