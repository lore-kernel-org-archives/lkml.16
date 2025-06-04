Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED876217F3D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749045921; cv=none; b=rLSDtzhVyqOogu+2d0hFydupCgVf+gC8M9lrEbg6Xt+89K7OToaio3uzGiypZ0D0eEIGVTxVk8CryRaIJSTwep9EkvupCw7pXjjMQdEl5nDus9VqrePhqCNY5/SlHKt5kOtis/I5bpsFgCLdg3rCXa447wd2f0TeNrA51Xt5x0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749045921; c=relaxed/simple;
	bh=mEwl9cjLTVI7sQBAMbLWgpBd5baQ5Bc1TVQKwpPImzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQfXJXLx9aU6HpQ9m1uqJjcwZTncx8eHhgA0xYDl0+iYgkNc3zgV+RkbrhrG2kSZXsvZub6L6vJEkXraW7Vk3go9q7mUcPDwyMFlSxOqtqdzu25/7E7SOupAJC1L9Zrrmmf2qq8NRdxG8qnyIC70HxcHZ3wfWLk1bGQ4EU3vwjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgdB7Q9a; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgdB7Q9a"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c4476d381so953098a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749045918; x=1749650718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v6Jziq1CHUFj2h2WHZH1SsgeKe9ouBnoMuGPhTV1Jhc=;
        b=RgdB7Q9aBvBDEQc0Js6RMYRtRabxKA/gjMISdZ2UigIbaZvBNA+KjTnDXOSUwaeO+o
         AxnkR5Oa4UgIvmknZ0gO+BETpLlv+fRiiKbw4HuQXZJiinY/0vUCslfptaQfzVDpzo1T
         XWy9PTCrVSrYS5lIPgZwM73xGTcUp84RyL6jC5h8AVnJIIVZo/DE/KG82iLzhXlbld55
         idrYWPvRLWTfgTYtvr1/WNmCYO+gThLIJ85Cn9S8RPppepAV0iHI7SGjrfZ3cas14zUy
         A5xH1x7+KfLjEpa+FODwKE2bJ7dpA9UqskWD2aavIflCyEfDCkQkIxE9WPcJNCldrxtN
         SnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749045918; x=1749650718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6Jziq1CHUFj2h2WHZH1SsgeKe9ouBnoMuGPhTV1Jhc=;
        b=nTBWI1upgUs5es4b5NUFr0UvoiWhaohkZ5pVfldt3/AbiglN6r5k4T/MoAyNcSNVLF
         E2lNu93GrilatQXPDfwotSFsVxOZTTjZvVbg4TwBzIETnqOCms95s6ubZ8M6OCO0s9Ty
         vz9Xk1KPOerHmHLHB92vaSiiadXtxuyyVYDTVwOUSDnEm0eOeluFZaligEEXrs5zgOWf
         txw4fKvvTtPMkon+1IKQ6mwknnVIuYcFCK2Pctp9r0wH92xrEsUUir8ALU6NHR1js3Q9
         1BrbjxHuP3Zy49EUpbOI9n0HyeFhFnpBfl1s3uFQfyzm3eyYTzfZkY+hsKdeHwvqE9GB
         eXCg==
X-Forwarded-Encrypted: i=1; AJvYcCXERQ6Q7c9gJ2kwBfpFj+vCByey9SFBF/Eqyc4pXbHDkYzdW1YSmiB8YCP7X8DzUF8/w0hgfafbQi6UKOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDV9rhn/aljLkqmMQ2Hhd+126Nb3EHr8Fp5H25mL63feRcvO0W
	hDwkE22hSE1AiAVYKafnAmtAqqgu+BKnQwT4rL2OcKlSFMoGJtkmGc20
X-Gm-Gg: ASbGnct7ZiaPsarYC0/CJtuo6bx9Yg3qy0d9+gmaLbCxAbOElPvlIhh1G4Iw7Vr2bAC
	9OPO26uUtMe3AbkhLnZNuz437WpvTPPcYl/vmdiXhdon9jakqeDaIExV5kkaZaOGlBPB4Zjv7Ca
	/OSnM95OkvwxeFEzYZ+owvMzFGoqXwkDIUP3P9B6M9qU6ewOzDo+adPrBdiktzHr+mJt64SqQEF
	k/4md0a3sDkdVx/DzmKNADX+pz6J39w1fStQ3PWepioQh3106f4HKT2drRVduO8cYQXrDQAvzNf
	SgyVxJA66ywubOZl2mRFsMKMZC3H9UqG6IscWNJca98hLaVCYKY5Y87xMZ1Nq6QRLqYYLXOT
X-Google-Smtp-Source: AGHT+IGia8s6X3GZlBFPLsgqEqQgiGPPVpTkPceVeeAMoSe4mGLufOBweHuJTtcLa/zr9tCg2atx1g==
X-Received: by 2002:a05:6a21:a8e:b0:218:2ee9:2c67 with SMTP id adf61e73a8af0-21d0cad48cdmr10623686637.9.1749045917873;
        Wed, 04 Jun 2025 07:05:17 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb36961sm8754616a12.43.2025.06.04.07.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 07:05:17 -0700 (PDT)
Date: Wed, 4 Jun 2025 10:05:15 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: idle: Skip cross-node search with !CONFIG_NUMA
Message-ID: <aEBSm7Lm9Gx_anMo@yury>
References: <20250603082201.173642-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603082201.173642-1-arighi@nvidia.com>

Hi Andrea!

On Tue, Jun 03, 2025 at 10:22:01AM +0200, Andrea Righi wrote:
> In the idle CPU selection logic, attempting cross-node searches adds
> unnecessary complexity when CONFIG_NUMA is disabled.
> 
> Since there's no meaningful concept of nodes in this case, simplify the
> logic by restricting the idle CPU search to the current node only.
> 
> Fixes: 48849271e6611 ("sched_ext: idle: Per-node idle cpumasks")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>  kernel/sched/ext_idle.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/kernel/sched/ext_idle.c b/kernel/sched/ext_idle.c
> index 66da03cc0b338..8660d9ae40169 100644
> --- a/kernel/sched/ext_idle.c
> +++ b/kernel/sched/ext_idle.c
> @@ -138,6 +138,7 @@ static s32 pick_idle_cpu_in_node(const struct cpumask *cpus_allowed, int node, u
>  		goto retry;
>  }
>  
> +#ifdef CONFIG_NUMA

It would be more natural if you move this inside the function body,
and not duplicate the function declaration.

>  /*
>   * Tracks nodes that have not yet been visited when searching for an idle
>   * CPU across all available nodes.
> @@ -186,6 +187,13 @@ static s32 pick_idle_cpu_from_online_nodes(const struct cpumask *cpus_allowed, i
>  
>  	return cpu;
>  }
> +#else
> +static inline s32
> +pick_idle_cpu_from_online_nodes(const struct cpumask *cpus_allowed, int node, u64 flags)
> +{
> +	return -EBUSY;
> +}

This is misleading errno. The system is nut busy, it is disabled. If
it was a syscall, I would say you should return ENOSYS. ENODATA is
another candidate. Or you have a special policy for the subsystem/

The above pick_idle_cpu_in_node() doesn't have CONFIG_NUMA protection
as well. Is it safe against CONFIG_NUMA?

> +#endif
>  
>  /*
>   * Find an idle CPU in the system, starting from @node.
> -- 
> 2.49.0
