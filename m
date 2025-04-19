Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA32B9AA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 01:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745027955; cv=none; b=senUqg3mMypfoyICLMyrVs9JZ0cLGGTd9SR99TivZzuJMVgDLRe+prBbiq8XekgBWU0BFhcoq9FDjN3rKI0rVEKAgk59XU8jDU1IOGQa2yER7f1tZRl04ZmvISKlYC6TAGLowAjxR66qBllfj+H/LHcQaLVLodlj1x58lKfR7oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745027955; c=relaxed/simple;
	bh=9n9HtjJv8+BJmPIFKBtxa5gCuPSM+N4P1U/vEDnhiSo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=O882aEXmia1jiAj0hFU9bAYFAUnflKlVM5CKke4hKzHQnVnKgiZdp6CEbNsxDhtDw3qNmALdx7XhVAywk962yclHOlclmv1rfnbZV2PsQtHs0R3lUhd9ykyQ+HX8gEbdGS6jJGW41Ht04HVz7zkeCHGB1RsU7nMGn7hRwuj27ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SkDAy9pc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SkDAy9pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745027951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MyE2GzEt6O7iPqkt2gvQatRQFTaplB3Bd3IRBQ3niCU=;
	b=SkDAy9pcb3DKpkWxQoLBxIoOaADZSPFBPlEpq/S8oEBke174Y/fBqBxnaE7jzKauqiYRHi
	I15Z+uEZMsqHCjIsNYpv5qN6eetV59Smx6eNGm1mrKxyx7vo+rsJlVaRvHp+ylw5uGevjT
	z9KI70vMarlmr6QfGP1+M8+EaEZpx5M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-uwovp6oePwyN5WX89hJv0A-1; Fri, 18 Apr 2025 21:59:07 -0400
X-MC-Unique: uwovp6oePwyN5WX89hJv0A-1
X-Mimecast-MFC-AGG-ID: uwovp6oePwyN5WX89hJv0A_1745027947
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5750ca8b2so331814585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745027947; x=1745632747;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyE2GzEt6O7iPqkt2gvQatRQFTaplB3Bd3IRBQ3niCU=;
        b=f7d54y0dukdc/vLJ5Zfk/Ri54CpOW1BbX46UT6FW55bnV3QB2k6lUYBWJiReGEDtgE
         IhAaKAobkcG3Nc2tYR+mkV6Xo3Cq2/2EHk8FnHDNaf3qyHcv9g1/bXx++wzOBIRTRb5m
         PkS0qmaZgo70rPnPWvPfHssunM5ImVim8luWN2BBCxb65e4uWvLMSbiKoHmdXH6/O5ck
         MXAhY0JB8xuIlWoEr4Rz66+gAg16OLSTYvwHyM1Ddsag+mnDR9GUPvGsPbYpp3ghOc7v
         vN1mXhyQXHGDbCSMTIK7T03LT9n4Re44968lZ2TExaqYfqkwIPHlo+bQBT9qF7ryGUQr
         Nvtg==
X-Forwarded-Encrypted: i=1; AJvYcCVhxg8xEssCyiFy324i0MQnjUgX0u+KqZ2vISFGuY8Xv6wFvgTRsFwPAf7omVeAdK4X50RiH8Bum4Zs64A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzTAr2vhMym86IqK5tG8lbRHbXrkdYeUQzeSLrzUl8BbHO/6Sw
	MN0Ad22jZQRQfgOGbnUF+Xiu0YJNwN8TX0HQioKaUI0nI3cX6MVem3PbAqBTRgFNzn6eSpofFLa
	ldqg1yGzg4QxqbXf5FsQ4wy7hH3CWmSXymQEEga9qs4K6K3CIGJeTDgkC8dRanA==
X-Gm-Gg: ASbGncvyUNN6Pf7tMLISaxipzbC3f4jc90OK+BY9PfOrfJqyjbPywDHyr2YnrNJsgAM
	6aeBkkZdI5hyABYvBVUv2x1XCzxHSpw8XzjZDviabrernZeI2F+Owu0vcz1haFouLCk5QWRlsFn
	BhC1mzT4/5EXZbo/eojlXIoG27o1lmf+gFKOxBR9PbVCG/cKPzZ5erisd08jZXId1t6KK2otE3p
	4upISIRdVo58fS3MIw9uL5WKPGEdPmXbzVBIBca4uCo1ty6Fu4BPGzE41rEgukc3len3liMUg94
	NvOhxJAR8nopMzpmKhEQHnAReFt5yq46cpzUU2bMUXwIVJWZww==
X-Received: by 2002:a05:620a:2a12:b0:7c5:3b52:517d with SMTP id af79cd13be357-7c92804942dmr920493285a.54.1745027946867;
        Fri, 18 Apr 2025 18:59:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcXj4b/NM1OREe7QzWswzHIaHccrZVLgLJcaMbiSk/L6WwkHUEvx8kXDiJC2XmvPRO2v/pUg==
X-Received: by 2002:a05:620a:2a12:b0:7c5:3b52:517d with SMTP id af79cd13be357-7c92804942dmr920491585a.54.1745027946562;
        Fri, 18 Apr 2025 18:59:06 -0700 (PDT)
Received: from [192.168.130.170] (67-212-218-66.static.pfnllc.net. [67.212.218.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a6ea8dsm168807885a.9.2025.04.18.18.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 18:59:06 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <9bcb139c-451b-4ea5-b4ff-21916372d94e@redhat.com>
Date: Fri, 18 Apr 2025 21:59:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] cpuset: rename cpuset_node_allowed to
 cpuset_current_node_allowed
To: Gregory Price <gourry@gourry.net>, cgroups@vger.kernel.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, mhocko@kernel.org,
 roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev,
 akpm@linux-foundation.org
References: <20250418031352.1277966-1-gourry@gourry.net>
Content-Language: en-US
In-Reply-To: <20250418031352.1277966-1-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/25 11:13 PM, Gregory Price wrote:
> Rename cpuset_node_allowed to reflect that the function checks the
> current task's cpuset.mems.  This allows us to make a new
> cpuset_node_allowed function that checks a target cgroup's cpuset.mems.
>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> ---
>   include/linux/cpuset.h | 4 ++--
>   kernel/cgroup/cpuset.c | 4 ++--
>   mm/page_alloc.c        | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
> index 835e7b793f6a..893a4c340d48 100644
> --- a/include/linux/cpuset.h
> +++ b/include/linux/cpuset.h
> @@ -82,11 +82,11 @@ extern nodemask_t cpuset_mems_allowed(struct task_struct *p);
>   void cpuset_init_current_mems_allowed(void);
>   int cpuset_nodemask_valid_mems_allowed(nodemask_t *nodemask);
>   
> -extern bool cpuset_node_allowed(int node, gfp_t gfp_mask);
> +extern bool cpuset_current_node_allowed(int node, gfp_t gfp_mask);
>   
>   static inline bool __cpuset_zone_allowed(struct zone *z, gfp_t gfp_mask)
>   {
> -	return cpuset_node_allowed(zone_to_nid(z), gfp_mask);
> +	return cpuset_current_node_allowed(zone_to_nid(z), gfp_mask);
>   }
>   
>   static inline bool cpuset_zone_allowed(struct zone *z, gfp_t gfp_mask)
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 0f910c828973..d6ed3f053e62 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -4090,7 +4090,7 @@ static struct cpuset *nearest_hardwall_ancestor(struct cpuset *cs)
>   }
>   
>   /*
> - * cpuset_node_allowed - Can we allocate on a memory node?
> + * cpuset_current_node_allowed - Can current task allocate on a memory node?
>    * @node: is this an allowed node?
>    * @gfp_mask: memory allocation flags
>    *
> @@ -4129,7 +4129,7 @@ static struct cpuset *nearest_hardwall_ancestor(struct cpuset *cs)
>    *	GFP_KERNEL   - any node in enclosing hardwalled cpuset ok
>    *	GFP_USER     - only nodes in current tasks mems allowed ok.
>    */
> -bool cpuset_node_allowed(int node, gfp_t gfp_mask)
> +bool cpuset_current_node_allowed(int node, gfp_t gfp_mask)
>   {
>   	struct cpuset *cs;		/* current cpuset ancestors */
>   	bool allowed;			/* is allocation in zone z allowed? */
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 5079b1b04d49..233ce25f8f3d 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -3461,7 +3461,7 @@ get_page_from_freelist(gfp_t gfp_mask, unsigned int order, int alloc_flags,
>   retry:
>   	/*
>   	 * Scan zonelist, looking for a zone with enough free.
> -	 * See also cpuset_node_allowed() comment in kernel/cgroup/cpuset.c.
> +	 * See also cpuset_current_node_allowed() comment in kernel/cgroup/cpuset.c.
>   	 */
>   	no_fallback = alloc_flags & ALLOC_NOFRAGMENT;
>   	z = ac->preferred_zoneref;
> @@ -4148,7 +4148,7 @@ gfp_to_alloc_flags(gfp_t gfp_mask, unsigned int order)
>   		/*
>   		 * Ignore cpuset mems for non-blocking __GFP_HIGH (probably
>   		 * GFP_ATOMIC) rather than fail, see the comment for
> -		 * cpuset_node_allowed().
> +		 * cpuset_current_node_allowed().
>   		 */
>   		if (alloc_flags & ALLOC_MIN_RESERVE)
>   			alloc_flags &= ~ALLOC_CPUSET;
Acked-by: Waiman Long <longman@redhat.com>

