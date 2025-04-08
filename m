Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA2E223714
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744137387; cv=none; b=qIinA3q35vFpreL8E3Gg8JEbR8qWRwjpgfoRj87ABtWjocDaO/mv8/sA8YCPsjZHKvoNOicoH/lJLSIGF3tXvv2vLKfhMasqkZIgdFr+PbvOj9mxomfcP41RGkruR8Q3bIOUksxGfv6BN4iakKIRwVq2os90wrnt94wg8YRGhyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744137387; c=relaxed/simple;
	bh=WfWzdxBkhf6dBcEkzQSrptAQ1l/B6nErMT45c4yWgA8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=W3NJvMzFkmkq6DJOHy70NNQkPyvTiO2NB/UxTJl1wATWJisyPQ2H8JT1e6kVSxfd3Qqd2q/vdLrfUzGOUbqSMvpIcNJo8y8Bd1lq0/cxwyarp1/9iN/olbw1N/qtvpkm+lfhViNr9fReNJb+LuzjXs9lHREwvin/Tx50Xn1Sb9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iYXimukB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iYXimukB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744137382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Se1FHByXQ0bG9ZLAbgCVErfU/qkKL9uOy+5u+NBsYCA=;
	b=iYXimukB1e8/2/+U3PMeJG27WUmU9rjG74UrPh3yb7am/DOwvSITWWYEIB7FQRQob/WD9I
	jV1+zoq7HIKf8mOmbeGDpCUfeVQhkct/fZcf4yJEt/COb091y6Mdz33Q9lGOOWoUJNi+mm
	NV8AdgVhDvtMaO5V7mJ+DN/uPYRcu00=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-ByhznCcXOOii6NoB3EG6vQ-1; Tue, 08 Apr 2025 14:36:21 -0400
X-MC-Unique: ByhznCcXOOii6NoB3EG6vQ-1
X-Mimecast-MFC-AGG-ID: ByhznCcXOOii6NoB3EG6vQ_1744137381
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d5b381656dso129736835ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 11:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744137380; x=1744742180;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Se1FHByXQ0bG9ZLAbgCVErfU/qkKL9uOy+5u+NBsYCA=;
        b=hLt/fqgMpcwCyFK4FiXKRFnxhB9Z11ywWt7AjUlpgMQUWFYAJbJ48dgTir+GWG9386
         FpkW5hCT5d2fQ+/0yemJDrrjEXRpLxznDepMQsJMXX0h6KzZrH32o5I1LrMoyBgUgfti
         V83xGYus0mmLy2QJpwWKyThjC1rQca0m08z/wnb+g+1EtaVKeoxTXEpDIgggOGIDWAej
         r3vC70kOudgqNpqW2tnuzah3T40IVbRyJXRliHStlLXLx+1BTT7D6veouBT5M58kmoA8
         /6BBB6QPrgfa20GrWTxqTRMJNgBiAEmmDqadeIUqM+32Rtw7N14Kd/wwAal0yXVD5Qwq
         4/5A==
X-Forwarded-Encrypted: i=1; AJvYcCUjyKAmq6h1yUYyFvpTFGvmu55HFOX63Hf+9xvlbUeYhXs9LgE/8qmSJR8x9/ragypNPeFegDCOLvK0jYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4GoTnlC7m3UZte04bfPDvYNL+Hfly30g/yKBduDLTqSDodf2
	qC8/HBB3Y/eOmZSj+H8YW1I21SlVe8SFlHsC8VKeeGR/wvf48tETCXw8QWWnARxv6qVoytZW0CI
	XoOEHheaA1COr1876A8FvMyD1bA5qv144+GbzntMStRAgKx7KYM7NNYlPZLPiow==
X-Gm-Gg: ASbGnctNYm5fETwUeFiYoqaVCGeHks0zNWrryVfM9ixl5SlIoXk4Bbw+gd4SXN01Wf2
	NVayH1XVza3HG5DKXUaPH2rzAdv87Z/3TQRK+e+CJYen78+8WVUTVSoY1NuibSSaoehn/4b5tQw
	8j9wDnX7eQrqC6hIbhBLPcopso0NGzb1V66TTqj2uU8O8yXHQJtrjynyEbeE610iNIL4hTKoUi1
	K1gxvmXfAW7Zegy5Xw6tL395tvUQM7ZarO0KzPxbpbahFZzwy7yYzX6wqmuRKPUhkDnjKsInZ+n
	3X6RkoEBfWWuW40AGDjZh9fMjw90bCZKjSFmg9NV6gCfOfN97hJYvAb8NXVlAA==
X-Received: by 2002:a05:6e02:3712:b0:3a7:88f2:cfa9 with SMTP id e9e14a558f8ab-3d77c281bfemr116855ab.11.1744137380663;
        Tue, 08 Apr 2025 11:36:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE7yFZdGQ6awpFHZ0/pUXwSjXgM/x9GR8AYdv0kxsLsofBNsZ3deO5hBmn+DaHXlnkd8lByA==
X-Received: by 2002:a05:6e02:3712:b0:3a7:88f2:cfa9 with SMTP id e9e14a558f8ab-3d77c281bfemr116395ab.11.1744137380146;
        Tue, 08 Apr 2025 11:36:20 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d703b6bb26sm5893725ab.7.2025.04.08.11.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 11:36:19 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <b978ec91-306f-45d5-8d88-91febebb8e48@redhat.com>
Date: Tue, 8 Apr 2025 14:36:16 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] vmscan,cgroup: apply mems_effective to reclaim
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com,
 akpm@linux-foundation.org
References: <20250320210919.439964-1-gourry@gourry.net>
Content-Language: en-US
In-Reply-To: <20250320210919.439964-1-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/25 5:09 PM, Gregory Price wrote:
> It is possible for a reclaimer to cause demotions of an lruvec belonging
> to a cgroup with cpuset.mems set to exclude some nodes. Attempt to apply
> this limitation based on the lruvec's memcg and prevent demotion.
>
> Notably, this may still allow demotion of shared libraries or any memory
> first instantiated in another cgroup. This means cpusets still cannot
> cannot guarantee complete isolation when demotion is enabled, and the
> docs have been updated to reflect this.
>
>
> Note: This is a fairly hacked up method that probably overlooks some
>        cgroup/cpuset controls or designs. RFCing now for some discussion
>        at LSFMM '25.
>
>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> ---
>   .../ABI/testing/sysfs-kernel-mm-numa          | 14 +++++---
>   include/linux/cpuset.h                        |  2 ++
>   kernel/cgroup/cpuset.c                        | 10 ++++++
>   mm/vmscan.c                                   | 32 ++++++++++++-------
>   4 files changed, 41 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-numa b/Documentation/ABI/testing/sysfs-kernel-mm-numa
> index 77e559d4ed80..27cdcab901f7 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-mm-numa
> +++ b/Documentation/ABI/testing/sysfs-kernel-mm-numa
> @@ -16,9 +16,13 @@ Description:	Enable/disable demoting pages during reclaim
>   		Allowing page migration during reclaim enables these
>   		systems to migrate pages from fast tiers to slow tiers
>   		when the fast tier is under pressure.  This migration
> -		is performed before swap.  It may move data to a NUMA
> -		node that does not fall into the cpuset of the
> -		allocating process which might be construed to violate
> -		the guarantees of cpusets.  This should not be enabled
> -		on systems which need strict cpuset location
> +		is performed before swap if an eligible numa node is
> +		present in cpuset.mems for the cgroup. If cpusets.mems
> +		changes at runtime, it may move data to a NUMA node that
> +		does not fall into the cpuset of the new cpusets.mems,
> +		which might be construed to violate the guarantees of
> +		cpusets.  Shared memory, such as libraries, owned by
> +		another cgroup may still be demoted and result in memory
> +		use on a node not present in cpusets.mem. This should not
> +		be enabled on systems which need strict cpuset location
>   		guarantees.
> diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
> index 835e7b793f6a..d4169f1b1719 100644
> --- a/include/linux/cpuset.h
> +++ b/include/linux/cpuset.h
> @@ -171,6 +171,8 @@ static inline void set_mems_allowed(nodemask_t nodemask)
>   	task_unlock(current);
>   }
>   
> +bool memcg_mems_allowed(struct mem_cgroup *memcg, int nid);
> +
>   #else /* !CONFIG_CPUSETS */
>   
You should also define an inline function for the !CONFIG_CPUSETS case.
>   static inline bool cpusets_enabled(void) { return false; }
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 0f910c828973..bb9669cc105d 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -4296,3 +4296,13 @@ void cpuset_task_status_allowed(struct seq_file *m, struct task_struct *task)
>   	seq_printf(m, "Mems_allowed_list:\t%*pbl\n",
>   		   nodemask_pr_args(&task->mems_allowed));
>   }
> +
> +bool memcg_mems_allowed(struct mem_cgroup *memcg, int nid)
> +{
> +	struct cgroup_subsys_state *css;
> +	struct cpuset *cs;
> +
> +	css = cgroup_get_e_css(memcg->css.cgroup, &cpuset_cgrp_subsys);
> +	cs = css ? container_of(css, struct cpuset, css) : NULL;
> +	return cs ? node_isset(nid, cs->effective_mems) : true;

As said by Johannes, you will need to take the callback_lock to ensure 
the stability of effective_mems. I also second his suggestion of 
defining a cgroup_mems_allowed() here and do the the memcg to cgroup 
translation outside of cpuset.c.

Cheers,
Longman

