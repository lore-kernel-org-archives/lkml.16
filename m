Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ABC1A8401
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749137113; cv=none; b=SQ9hx98d+xL/0ZkEHfvzAJ1pupVTFWgqvSCgfkNbeUo60mqU9VsXyX8BbHmq2nvRzoId0M1Qsr+tcqeEaUFTSZh3KWYQVVBoivz21QhWU8Aw6Tst+STX5wvbImbOuNLv/ekdrTtgcPoFAQzz4ck6rO6mGVa1MHn1MpC8OiKFPXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749137113; c=relaxed/simple;
	bh=loOlydsc2oqR1PmkPJcTiOSrXoBbZcznqk/ta78EMF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHSLFkSG/+UnX6xOz4L5dJNGtNcbGhLWBkGbdPY1OqWgzQ3+hECmWcAnRRxbUKXpiUwB4QhguTwQ7v2lmu00Vh9MPX+9905k2+ugLcukYvFEIDvKA7NTGo3q5IbjMBEKvS+un2DE18N47SMsL74rbex9kICl4Bozq0tyJrWM6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=au7X5WUZ; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="au7X5WUZ"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e5e6ab7b8so11074827b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 08:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749137111; x=1749741911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hywIa1C5VWmiWv5K8Y4aCyROkM0KVWGznJdti4Qv9UY=;
        b=au7X5WUZh0DCgT635uTS7cnA8LmqlbHRkyC1rhm5JH9LhJApjhj6FzG/t7v1ryn+5z
         UShitC2lc053wGVNCPrxLU5W825wjIs1Ic3mmJWDevB75fr/rpHyBJNDDLwAW8N4OdNA
         Yi/dXIcSf0rXX2PDc5a7aRTESiicMarzPngAEHrT+tNki1Puro7z9yZLB34/6ptK95wX
         UTnODDGgHQFBpkd8+Lp2jUjTGEJbOV8kRdqpCPJRUxkjzuhqCvWcgvG5JYa9ZhHg/Y5i
         ETH6WWkDXKVDCU497lLVPYs6DXB21c6INm0qXqSgW9YBgVkt+5QymHch9YQQTK5S76OL
         x+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137111; x=1749741911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hywIa1C5VWmiWv5K8Y4aCyROkM0KVWGznJdti4Qv9UY=;
        b=DrM6BCNh2pBKhtyjmStgBzoO1zD+ISjJU9VOQut3iAOzf5oxr1+v20lKUfnl1Fg0NV
         3G+kF26N+EqepaWVJR+9FqRMxuYEoXJfDQm0Ht7VtK4hG5s3yBGtwrCXC3E36hc324LO
         1Pez5d9baNfhenOh3YL1CHHuHvBO5A0aSqjL3bRuDP5erEo66Wlc7q56z8pAvIagKWun
         ibRTGng2w4l5GYPEdAZw83if9QP04Gv0oWxfKUPV9d6YGu6LUsMwCHnJ95+nFTTHloE4
         WvBibARMjauu7VGO7twQCqDtRq0iMshL3ajKeDZgxYW2FjHmTM+4NUoG5t7q6ufj9SaJ
         Vi0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXppv7dOQgi4x4hs4RCPQ6CAwLM/qI7NN7oVkDKckJ6qxBz//ASSOFl9g3hDXLJVgFJ30/UsQxEu+piyzc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvKQlPP8BmQy/PIhdcLiHLPgVvxz46SEhZ525cCNb9tnFVmOxC
	QDcWY1gJlugj4xkPCtyvk+FEocwniVjQ/MfNION9t4PffT371XMD2HVZ
X-Gm-Gg: ASbGncuXdZDPgYVwtnVjX5r0IfP7d8AaRPx5MKPV9zrw1hNsfqZKuCnserWXvmYkbDZ
	eUBAjLJqJtGu79i09RZ1wZ4ak8pKbFPQr3A1iiR5/a/OQTFT1ODpai9eT4Bh4wqppaWz6s/C3j+
	19OKuAJO6TGcjADmUXizX4oPEjVsLu5ZS8uJQqu4HXnSjl81QS/pecfXFISZrP0aI/l/wguXc7N
	098t236d+sXleX87UK38usffHVNFdh+i1IbXxU/Vz9XVE+AGbKS3bWbA6s1BlTgckTVsWqIGUse
	D+qfEnGH+JRp41oHFeqE/XOYtg2YKMzjJZTpC2KZYw+0aqQQoA==
X-Google-Smtp-Source: AGHT+IFKgP5b3rRmeu100Vg2csRRR2cxN4MyQ8g5gK0KVrLhsIwOxgu/whtgrI5JrALBQh9eixFOvA==
X-Received: by 2002:a05:690c:84e:b0:710:e9b1:485f with SMTP id 00721157ae682-710e9b15030mr33158717b3.20.1749137110770;
        Thu, 05 Jun 2025 08:25:10 -0700 (PDT)
Received: from localhost ([2a03:2880:25ff:e::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ad25be6sm35189437b3.122.2025.06.05.08.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:25:10 -0700 (PDT)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	kernel-team@meta.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 1/4] mm/damon: introduce DAMON_STAT module
Date: Thu,  5 Jun 2025 08:25:07 -0700
Message-ID: <20250605152508.3275113-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250604183127.13968-2-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed,  4 Jun 2025 11:31:24 -0700 SeongJae Park <sj@kernel.org> wrote:

> To use DAMON for monitoring access patterns of the system, users should
> manually start DAMON via DAMON sysfs ABI with a number of parameters for
> specifying the monitoring target address space, address ranges, and
> monitoring intervals.  After that, users should also wait until desired
> amount of time data is captured into DAMON's monitoring results.  It is
> bothersome and take a long time to be practical for access monitoring on
> large fleet level production environments.
> 
> For access-aware system operations use cases like proactive cold memory
> reclamation, similar problems existed.  We we solved those by
> introducing dedicated static kernel modules such as DAMON_RECLAIM.
> 
> Implement such static kernel module for access monitoring, namely
> DAMON_STAT.  It monitors the entire physical address space with
> auto-tuned monitoring intervals.  The auto-tuning is set to capture 4 %
> of observable access events in each snapshot while keeping the sampling
> intervals 5 milliseconds in minimum and 10 seconds in maximum.  From
> a few production environments, we confirmed this setup provides high
> quality monitoring results with minimum overheads.  The module therefore
> receives only one user input, whether to enable or disable it.  It can
> be set on build or boot time via build configuration or kernel boot
> command line.  It can also be overridden at runtime.
> 
> Note that this commit only implements the DAMON control part of the
> module.  Users could get the monitoring results via
> damon:damon_aggregated tracepoint, but that's of course not the
> recommended way.  Following commits will implement convenient and
> optimized ways for serving the monitoring results to users.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---

Hi SJ, thank you for this patch! I have been looking forward to it : -)
I had a few questions about the init function:

[...snip...]

> +static int damon_stat_start(void)
> +{
> +	damon_stat_context = damon_stat_build_ctx();
> +	if (!damon_stat_context)
> +		return -ENOMEM;
> +	return damon_start(&damon_stat_context, 1, true);
> +}
> +
> +static void damon_stat_stop(void)
> +{
> +	damon_stop(&damon_stat_context, 1);
> +	damon_destroy_ctx(damon_stat_context);
> +}
> +
> +static bool damon_stat_init_called;
> +
> +static int damon_stat_enabled_store(
> +		const char *val, const struct kernel_param *kp)
> +{
> +	bool is_enabled = enabled;
> +	int err;
> +
> +	err = kstrtobool(val, &enabled);
> +	if (err)
> +		return err;
> +
> +	if (is_enabled == enabled)
> +		return 0;
> +
> +	if (!damon_stat_init_called)
> +		/*
> +		 * probably called from command line parsing (parse_args()).
> +		 * Cannot call damon_new_ctx().  Let damon_stat_init() handle.
> +		 */
> +		return 0;

I was hoping you could educate me about how damon_stat_init_called works here.
I think my confusion comes from my lack of knowledge about kernel modules : -)
In the cover letter, you wrote that DAMON_STAT is a static kernel module.
My understanding was that this would mean damon_stat_init would always be
called, so I was wondering under what condition it would not be initialized.
I see the comment you wrote above, but was still a little bit confused.

Also, should we perhaps call damon_stat_init() if !damon_stat_init_called?
That way, the first caller would just eat up the time it takes to run
damon_stat_start().

One other thought I have is that if this config checks for whether
damon_stat_init was called, this can be moved to the beginning of the function
before the other checks are run, but that is just my thought : -) Feel free
to keep the input check first, since having this at the beginning of the
function would mean incorrect inputs would be silently ignored.

Thank you SJ! I hope you have a great day!
Joshua

> +	if (enabled)
> +		return damon_stat_start();
> +	damon_stat_stop();
> +	return 0;
> +}
> +
> +static int __init damon_stat_init(void)
> +{
> +	int err = 0;
> +
> +	damon_stat_init_called = true;
> +
> +	/* probably set via command line */
> +	if (enabled)
> +		err = damon_stat_start();
> +	return err;
> +}
> +
> +module_init(damon_stat_init);
> -- 
> 2.39.5
