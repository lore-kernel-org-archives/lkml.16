Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7FA2989B0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745351884; cv=none; b=b/XSeaHPRxzvUutgHbOhvLdu0W9Zqwu+R0s7DmNWfb/i2ZbwbEDSIWioq+rqQPlWrXdAojsm+l+P24FVcjrdzp3f20/HY2wmQ7F24r6D5At4N3YM/b8/fRZgGCJPo4lz0wGWUb5LpP2UEkte2nXLBwujlq3xMiX5cwXSv99cays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745351884; c=relaxed/simple;
	bh=wsFk7SmZMk84qBZqNh0ZMgVjRpY1xXUEU2RlfQzOwNw=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pvc7s10+fEViolFAo9pUhKjTf941+0GT8JMmu0LV/5ZJQIE5kzNNilL+fQU+qv2urk0+iat5xD3XegCRfT5CtE4momDFNJLIRK2h8k5X55X2qBsO2PPVj+BvrXKVmP79pTQ8YoxFzfOVkll88W5jO845C5Yx1hio43toFaSaF1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NFNfeiwt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NFNfeiwt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745351882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUY+s/OQUXFXP8L09NRnyD2RvAyHXBwWpTAF7YObAcU=;
	b=NFNfeiwtWNgzChELbV21yWXgbm3pC7QIiDQqTBqklApy3fLm2cLtdh1g+ExkzyfneOMqd7
	5wNfezCbXTPIVDJ89IemA65t/9U/JXznqAIVfrVJENHb6MNIbPCK/yz5f2DXFD0oKc9Dqk
	T3T0hqR2NLTYSUFwmsQvr7lLbJ6NGLM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-tW5_l9dNPb2pEodxgCSGmA-1; Tue, 22 Apr 2025 15:58:00 -0400
X-MC-Unique: tW5_l9dNPb2pEodxgCSGmA-1
X-Mimecast-MFC-AGG-ID: tW5_l9dNPb2pEodxgCSGmA_1745351880
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767bab171dso55136161cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745351880; x=1745956680;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUY+s/OQUXFXP8L09NRnyD2RvAyHXBwWpTAF7YObAcU=;
        b=cGMth/vZvGkLMkOQWxpp2MKrqc54MUInhjfOiQUKlhslvdkhmtpE48PL6Asj3u0R28
         2l4FTI0LohdRfo/6b32eyQKz2QzWpUtysE/H3P+UEC7GY4UPP+lOuXWYtyePjEURtgby
         S0ADwWzt9nqwaCf2DIdO1ph168MC608scbQxh8eFfi5Fovon909rL7Ir9MWl16qICrdl
         siJTcqIP2zC2ePMOdTrbbv4RbSgRBRwFV4ke5qa4o5scUjfYenXUoyVkOS8/qgv3pxMI
         9XOu/pE/TkxHwe6jd0Cf1dtoS+w61Z5pNMJx6sm1Sc1Bd4NoRyoSggEk7m/hBcyT8f/A
         FFPw==
X-Forwarded-Encrypted: i=1; AJvYcCUWco7Ypc8Np+64qmmX5pz5DOCQWCrfOLG1gJSi5i1opBlnIaYcVYNBkmQhsX14Cp0SJIMAx2ApfCXOsAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGZQoqT0gXbqwUCqXJkMTLldo8FmukZvKrmOKCARl0/+UfqqkS
	O5/2Di/a+IR88LbJ31Ow9+K+kZMk/jdBhnm4WamhwMQ1lczVY//84lNT4eepqlrgCww1DzFRvNa
	z2AvIFPkoU19yLVQUv8ttrkIjBhSTlVsaRDeQ3oOfVA2l0SRucjDIAdbVOvsxmg==
X-Gm-Gg: ASbGncu2dWIbyyHlXykrdfE6YcGMfoQ0n6jrry4fAmtoyqJ5SsuX2e+xDm2ED2b4YDu
	cz3eZQgRCA8g6ZnEqJwrB+sgJuZbbrUBsBHzAVROyoB877NkDgmmqxre68SNjUPh/ilNu0LruKu
	o7HiUO0FVtsHlBRgmeuRZ/NFvycY637WiJSR7LOlIrRbzGmGwZHsb9F1igYF368m6uNOiDYsCYw
	N8KXW2xbUjPWu/RooAerzL4pYeYY5V1RfHaRxblRXshp2tIccXBiSiOn1GyLOhKuiQoYp4mHV83
	EdlQzYovxAlcKA3X9Kj8asEszSUn/KtoSB2zDQmU1tSaezcHOXxcunU2PA==
X-Received: by 2002:a05:622a:3c7:b0:476:8ee8:d8a0 with SMTP id d75a77b69052e-47aec39232bmr307223321cf.2.1745351879755;
        Tue, 22 Apr 2025 12:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHd7hAQKx+/wNns5UwdTf6osByvR4cMbQCvwsh66hbH0j+pw3ra8yVAyn4cmmasa59/fdUmHQ==
X-Received: by 2002:a05:622a:3c7:b0:476:8ee8:d8a0 with SMTP id d75a77b69052e-47aec39232bmr307223011cf.2.1745351879485;
        Tue, 22 Apr 2025 12:57:59 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9ce265esm59111901cf.61.2025.04.22.12.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 12:57:59 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <ded4c23a-fecf-40ff-94ac-0d121a421297@redhat.com>
Date: Tue, 22 Apr 2025 15:57:57 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpuset: relax locking on cpuset_node_allowed
To: Gregory Price <gourry@gourry.net>, linux-mm@kvack.org
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, hannes@cmpxchg.org, mhocko@kernel.org,
 roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev,
 tj@kernel.org, mkoutny@suse.com, akpm@linux-foundation.org
References: <20250422012616.1883287-3-gourry@gourry.net>
 <20250422043055.1932434-1-gourry@gourry.net>
Content-Language: en-US
In-Reply-To: <20250422043055.1932434-1-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/22/25 12:30 AM, Gregory Price wrote:
> The cgroup_get_e_css reference protects the css->effective_mems, and
> calls of this interface would be subject to the same race conditions
> associated with a non-atomic access to cs->effective_mems.
>
> So while this interface cannot make strong guarantees of correctness,
> it can therefore avoid taking a global or rcu_read_lock for performance.
>
> Drop the rcu_read_lock from cpuset_node_allowed.
>
> Suggested-by: Shakeel Butt <shakeel.butt@linux.dev>
> Suggested-by: Waiman Long <longman@redhat.com>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> ---
>   kernel/cgroup/cpuset.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index c52348bfd5db..1dc41758c62c 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -4181,10 +4181,20 @@ bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
>   	if (!css)
>   		return true;
>   
> +	/*
> +	 * Normally, accessing effective_mems would require the cpuset_mutex
> +	 * or RCU read lock - but node_isset is atomic and the reference
> +	 * taken via cgroup_get_e_css is sufficient to protect css.
> +	 *
> +	 * Since this interface is intended for use by migration paths, we
> +	 * relax locking here to avoid taking global locks - while accepting
> +	 * there may be rare scenarios where the result may be innaccurate.
> +	 *
> +	 * Reclaim and migration are subject to these same race conditions, and
> +	 * cannot make strong isolation guarantees, so this is acceptable.
> +	 */
>   	cs = container_of(css, struct cpuset, css);
> -	rcu_read_lock();
>   	allowed = node_isset(nid, cs->effective_mems);
> -	rcu_read_unlock();
>   	css_put(css);
>   	return allowed;
>   }

Except for mislabeling RCU read lock instead of callback_lock as pointed 
out by Johannes, the change looks good to me.

Reviewed-by: Waiman Long <longman@redhat.com>

