Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2791A76D4
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749101336; cv=none; b=NVI5cCnXfVR3LRVAHmI9DE1goTrzfL2BeqJcNb31OTmkgm3oKNcPwI1ZqaPHwZQIydan30ACA9EwntfGaU9XJ8YCoqAq9xvIwJsFA52B4szNQTWQcP8eAQ2aJBcuhZD3gxJ4/nROvTH093V/b+c+MqDU6dI1axlF3qrdIe3cEKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749101336; c=relaxed/simple;
	bh=KFcGoLRLWg8X4zWzB4O40GYzNM4iFqXsVs9PzNXVnas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aFLsN9i5ZUCsTLjagkL5Yr63cRnfZVyvtTP2UF1wEFBxMUkIwYV9o9qH5fE+STZzUs7yrJ9IfT1Kf7MDfca0U447BsYvKO5mdXUl7PLI/DDo+76LOGQMw2kYr+24A1IsZ/T/8HrjqPMh5Kq8uGvHYOMTYEhZMARutGOAtnWchus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=IBl0Re54; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="IBl0Re54"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gSyoNzyQ9XoEccUpbjxD2l1GqkZQQAGZqYL17arYIw4=; b=IBl0Re54obuqf9mSNuDqiOdJSg
	ZbAClafroxSPdNCooQo7wmW3UuFNVVfSQ0g0133SSmzv7dmuSQjuB5YO+3AFn7HKLEj0xZa+EIhXL
	ti2ut08nRCAuyvbI5CEFDg0K7TGPwtS+8sQm+volFpjwc25+EPWgRWbhWAOb0eevbUINuPmhuWzoe
	mlaZMV4BPE8UlPC4SESrmf5+W0S6lI+AaS1zhByg4M9MWVFbD9wydk6gpjYlyqCPWCTWRGT7fL0fy
	/9iljmJ1JPI564QznOrndjMoT331uTaMX6TqwSi3Ya1A5HxheGQlpTqPcExUpmIePmkwHDr5w4x0C
	a5y2uQhg==;
Received: from [37.209.163.134] (helo=[172.16.18.203])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uN39Z-00HNjd-Dm; Thu, 05 Jun 2025 07:28:37 +0200
Message-ID: <5b18b631-c570-43fa-ac76-a09f0fb4363e@igalia.com>
Date: Thu, 5 Jun 2025 07:28:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] sched_ext: Make scx_locked_rq() shared
To: Andrea Righi <arighi@nvidia.com>, Tejun Heo <tj@kernel.org>,
 David Vernet <void@manifault.com>
Cc: linux-kernel@vger.kernel.org
References: <20250604143547.708202-1-arighi@nvidia.com>
 <20250604143547.708202-5-arighi@nvidia.com>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <20250604143547.708202-5-arighi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrea,

On 6/4/25 23:33, Andrea Righi wrote:
> scx_locked_rq() is used both from ext.c and ext_idle.c, so make it
> public and declare its prototype in ext.h.

scx_rq_bypassing() is the same, but it is defined with "static inline".
Would it be better to define with "static inline" for consistency? And,
anyway scx_rq_bypassing() is used only within ext*.

Regards,
Changwoo Min

> 
> No functional changes.
> 
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>   kernel/sched/ext.c | 2 +-
>   kernel/sched/ext.h | 2 ++
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> index 3e483138dff60..941603ec67e27 100644
> --- a/kernel/sched/ext.c
> +++ b/kernel/sched/ext.c
> @@ -1265,7 +1265,7 @@ static inline void update_locked_rq(struct rq *rq)
>    * Return the rq currently locked from an scx callback, or NULL if no rq is
>    * locked.
>    */
> -static inline struct rq *scx_locked_rq(void)
> +struct rq *scx_locked_rq(void)
>   {
>   	return __this_cpu_read(locked_rq);
>   }
> diff --git a/kernel/sched/ext.h b/kernel/sched/ext.h
> index d30f2d1bc00d5..cda5dfa4dad09 100644
> --- a/kernel/sched/ext.h
> +++ b/kernel/sched/ext.h
> @@ -18,6 +18,8 @@ static inline bool scx_rq_bypassing(struct rq *rq)
>   	return unlikely(rq->scx.flags & SCX_RQ_BYPASSING);
>   }
>   
> +struct rq *scx_locked_rq(void);
> +
>   DECLARE_STATIC_KEY_FALSE(scx_ops_allow_queued_wakeup);
>   
>   void scx_tick(struct rq *rq);

