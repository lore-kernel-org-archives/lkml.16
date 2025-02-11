Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1981E8835
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268162; cv=none; b=SWiUVWy1ZgjuK7fjJK6cEacLdCdgr0CsOVyslOWG5SinHTap54L3C7iP99EZEKbUN8DqGi5P4v6BeTEvi1MbcAvHZz+B/NhQfC2s5CMyW1TszQ/RvA924TGe5K9jNL4szpy/GC1KbPZlIUVXWc/f3xPbsApF5f+NmmLKbjLV02k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268162; c=relaxed/simple;
	bh=WDKNPjiPF6VWfA7jc6yUC9uakVSKGaDOa7W6V9I8LtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkTbQStVtEY3Y0K0+0zVNca2qv7TDwG5qimNkrDZN2PFkqVX5adHxJoV4PY0FhMqmf5n7SDyaK10WHk7fkeMy38hrl71qf/Fym96RjBkXnSm09CY5X/HOSmX/kqimBBuK49tFcs5NA9vT1cODcUK6vx3m2EoYGPW4x+aDf3PDBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=psUIZpjr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="psUIZpjr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f55fbb72bso65188935ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739268160; x=1739872960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LawanDDHMjAWuwn6kkbSpPIPu7T1Xm3IJQExiBBX4Uw=;
        b=psUIZpjrkjgUnjkDvLfSw1qSh5P1cTcz9vWQ+XRQQwdnbkJM7Ass3aguA+aZ5xqr97
         MEl5CMS5KtpWpAMWlvbKOc14ZEL8zNNbc3Wf5zKdmxILOpYVx9eZl4EEl2SDd5k4H3VU
         Nfa9Ba3JHrWaZfQpNbWki55FBxad7d+GLiH7lj2DxpXAy9QjXNdYugfiZgSaxV9IKX5N
         WqyV/XkMBNlsOaHfA8sCs90SEjp85OvfPFXRuWvF6d7AbZWquQhGhSBU0sVs7PruDRD4
         evUBN3Xp24K50IA+P4Kbo8MGAcMLtNNY1xTevJ1NUHhpk+YXKbHJJwLK5bLywTbE0cp2
         PkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739268160; x=1739872960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LawanDDHMjAWuwn6kkbSpPIPu7T1Xm3IJQExiBBX4Uw=;
        b=J3lLzsibyVUTNas2c57ioxdbyC755l5tEhpZ+24rR/fd73MqgTnlzAeOGfM9brXrhT
         2fajahe7f854FcycBSCCfWpT4MorKkI38UNnypYgVuK1WfD8awt9MwVsfGYFdvkanlvZ
         K2vDNs4AOJr6TGXfmTjIf1+5jZvCOtxrFXtRnGll2LGXFeWQnyAiAfAFUYPgQrmidDwH
         okCvvGzkcYo0RkzPieQq2ztrK/wPZpn/VFdl5Aalg8D/4rFHrwbiKdcprmYLihGo2PPs
         R/GsaZDvciaF93M+sThDhxyMLD01gxkGP6/aV53Roz1m5mo3PaVQ6JtZaZxmbMeE4g8p
         24ew==
X-Forwarded-Encrypted: i=1; AJvYcCUaZI+IXcLlbsJ73yrwGHt1UcDLhXPdaU58A9SUvUOeh41n4ttUic0livow0CjQvSPfRZMPZb8UPi2TZIg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5WwHUcl5rd0vtAe8fqSqpHJh8ymqePzVo0jh89UDqSqaphtCx
	JTkk+IdKLx7VcvnuIUUuNENAbTpSvI/17qBbCa6Avg43mrOUmk+OCGHyNRpcCaQ=
X-Gm-Gg: ASbGncvQ0DLoT33oDQ+PdBfhKcDZ4SLW9hMPqtRyS+eAUAFO5PUAoltPEbBXQz/BAI9
	j8Xzq4sTSp7rkdVgReThBz5s8+ijZimbw0EpMm2HbuIWc3rb/sPuKyRJqEWaepEV98UzrC2VEEn
	9oG/khRgcxB00FVi4yrtwq4XKgN788X5YayTJwTytlQmshgjB2c5tGcpTwDPAmoNDyoewpkd2GU
	Khmp+HbozJis/Qtzlbn0j8RzIDlHqfXiPmE7tVJbNK12gjyz0+JhA0muW5I3NWezQX0k2hr/EN8
	7/qNtoy/KiZlV8Lu0A==
X-Google-Smtp-Source: AGHT+IGxtNiHpfjO6oCMWUcwWUsQX6gTAMRPhPvi+aF+HBTExi++a87MpePgkbA1/PSWJ0O9TmRTVA==
X-Received: by 2002:a17:902:e5ca:b0:21f:6885:2b0b with SMTP id d9443c01a7336-21f68852c6bmr167497965ad.26.1739268160056;
        Tue, 11 Feb 2025 02:02:40 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b02dsm92369735ad.74.2025.02.11.02.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:02:39 -0800 (PST)
Date: Tue, 11 Feb 2025 15:32:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rjw@rjwysocki.net, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Amit Daniel Kachhap <amit.kachhap@gmail.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH] thermal/cpufreq_cooling: Remove structure member
 documentation
Message-ID: <20250211100237.r32hu366jbihndbc@vireshk-i7>
References: <20250211084712.2746705-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211084712.2746705-1-daniel.lezcano@linaro.org>

On 11-02-25, 09:47, Daniel Lezcano wrote:
> The structure member documentation refers to a member which does no
> longer exist. Remove it.
> 
> Link: https://lore.kernel.org/all/202501220046.h3PMBCti-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501220046.h3PMBCti-lkp@intel.com/
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/thermal/cpufreq_cooling.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
> index 280071be30b1..6b7ab1814c12 100644
> --- a/drivers/thermal/cpufreq_cooling.c
> +++ b/drivers/thermal/cpufreq_cooling.c
> @@ -57,8 +57,6 @@ struct time_in_idle {
>   * @max_level: maximum cooling level. One less than total number of valid
>   *	cpufreq frequencies.
>   * @em: Reference on the Energy Model of the device
> - * @cdev: thermal_cooling_device pointer to keep track of the
> - *	registered cooling device.
>   * @policy: cpufreq policy.
>   * @cooling_ops: cpufreq callbacks to thermal cooling device ops
>   * @idle_time: idle time stats

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
