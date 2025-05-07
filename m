Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3E28AAF8
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632374; cv=none; b=ea4iALgQeo9cQGwwtpY7Y7I77Jfkd3s1zTNfn4TrQ0sLCFrfWxarCoDkq6CrAnhHDCuoBcniTc03VfoF8rpJFMs/XLUpjdC8NI0nAEi2DdmMFi5vF5DrdzGF/oN4+eGTDLLb1rYhnEwtLri+oryhseupNcPnDmi7Bc1xwOpNUhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632374; c=relaxed/simple;
	bh=17d1KkqkFnjgiB4XE80ZvS8SIM/DtM9+avsi95yhHsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCPaFZbUW9RSarvYhc+H+kX01OGfE9jgS8PhiYI3p0r3fg/K6uANfHDUIV3nYuhwPdOz03ktgQ+DTOqlmYhHSzqQYHQN/RpqtI6UB7FhJ2MGZFKxKUUwaz4kEPIEx1GUEUc+Vc4pgpS1aILHZoaXTOYezjmFaIkC/6MGJ7Vp5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iM6KmSgS; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iM6KmSgS"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e78e6396d36so6350276.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746632371; x=1747237171; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KUaFNJP87BHH/Bw6m4JMEgvEp0MBArNEe9xjuJyEGA8=;
        b=iM6KmSgSZiroQcYGYCsE4TKiGYN+6U3ZhEOGBJRGpI9sJFYxAElbUqQClUFcrUU+fS
         4hX/2Xogm1HYdBzH7WdXe0iSRVZucRJhA1PfwQSvZgvxIY5fXuMd11fByf9szoX6gshF
         l2ATiR3OlvUIXYDx54tAG+5J6fR+BGhw9d49puVt2h23IeCq0DucEP6RFHxni+aFPqhb
         sEoi8A01/HB8WeSXHHDHPwz1aLTFxlTpybpDbBVZvxziQqqRygY1Zq3LxfO8mo5jqWVM
         46ddCiLk/PoPkAv4R4zDaWX7xmpfbLxReyWbJbkow4QcDtAdp8gGevfB2Iuj+943d945
         uQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632371; x=1747237171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KUaFNJP87BHH/Bw6m4JMEgvEp0MBArNEe9xjuJyEGA8=;
        b=svxwcmQBQ+McnYwnZL5YZPyP2dWkB81hA2mVVTcCaCucmoH/M4gy7keGSY8STiqZfV
         KNfybFBlJqTC5q9o8jgiXr1dU1APpDP2GoN6jJleYiKGA+fVedea6DVDUPEoePDgek1w
         rLWZETYYD3WeBspv14csdxnetu+wM5o8p54jeLWDS6NbWCUzvnci0qOdHk+cQJJ+Xuc0
         uGu7Yi8a3ewbWs1gbDkhyTiHT1Jx0kqYoo2VvsDvRDYUMjLwULaeAWYqfY3BWPlSnaoe
         alzEEYmc6jzgb32D28xnI9HeAgQuK0+ZbccT4kog4cfL2N4/WGLsZNTkLzhnZkwC8kJT
         c2Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVRaIToZOQvH9h9u/fvmUwxPrqeBmzUU3hbARDPA+eAr2WfDn6HfrZWMR/+oK/uEX3ogNOBqilU7Ako7WE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz47oHkmFuItzV8ce53XN5Hw0Z4NrSlBvH5HB5+6FHcdg+KR36F
	tFb67kdXA2mcn1xhw9AajsH+VyEEzMhEdizcF2MayfCIIcmrMI3QpNdPx36UvpmYFNi52i2XU5Q
	1C6DA3X4EgUXpLtfJNZkYzn1c6cQuBFktmdvhtg==
X-Gm-Gg: ASbGnct33lxAwQ/y1beMa9UH0b8Ct9FoOPNvMh6r8Gfs4qLP7dvlvqnnedXuZ4trBK4
	TrImm7GMmtD2KNvEbOch23n/aevnZqRrYeDw50oaIcWdBWrSWHg+DDRtxa/fk3Ysk73eEDgz8AA
	jdRcttAUvOntUr96b5kJei8Kk=
X-Google-Smtp-Source: AGHT+IF9tPa8GbcrKOeIVgTLn4flQMyG+LAp86lN9JQlhuMq209YYQoDzpR+zMRtGPpSalHSBTctwfBP2N4FaOqIM70=
X-Received: by 2002:a05:6902:15c7:b0:e60:7d3b:1e18 with SMTP id
 3f1490d57ef6-e78821fd184mr5050846276.40.1746632371526; Wed, 07 May 2025
 08:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <12677254.O9o76ZdvQC@rjwysocki.net>
In-Reply-To: <12677254.O9o76ZdvQC@rjwysocki.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 7 May 2025 17:38:54 +0200
X-Gm-Features: ATxdqUH1CUr6fuhuzl2HziQB0l1TdiOvfKKTtfkdtk-QErj0L6uEDcfmgLnrmo4
Message-ID: <CAPDyKFoWVgGQ3KvGqw=6TcndosFo-2kTCHOMSRCL_rNvjj86zw@mail.gmail.com>
Subject: Re: [PATCH v1] PM: sysfs: Move debug runtime PM attributes to runtime_attrs[]
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 16:29, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> Some of the debug sysfs attributes for runtime PM are located
> in the power_attrs[] table, so they are exposed even in the
> pm_runtime_has_no_callbacks() case, unlike the other non-debug
> sysfs attributes for runtime PM, which may be confusing.
>
> Moreover, dev_attr_runtime_status.attr appears in two
> places, which effectively causes it to be always exposed if
> CONFIG_PM_ADVANCED_DEBUG is set, but otherwise it is exposed
> only when pm_runtime_has_no_callbacks() returns 'false'.
>
> Address this by putting all sysfs attributes for runtime PM into
> runtime_attrs[].
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/base/power/sysfs.c |   15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> --- a/drivers/base/power/sysfs.c
> +++ b/drivers/base/power/sysfs.c
> @@ -611,15 +611,9 @@
>  #endif /* CONFIG_PM_ADVANCED_DEBUG */
>
>  static struct attribute *power_attrs[] = {
> -#ifdef CONFIG_PM_ADVANCED_DEBUG
> -#ifdef CONFIG_PM_SLEEP
> +#if defined(CONFIG_PM_ADVANCED_DEBUG) && defined(CONFIG_PM_SLEEP)
>         &dev_attr_async.attr,
>  #endif
> -       &dev_attr_runtime_status.attr,
> -       &dev_attr_runtime_usage.attr,
> -       &dev_attr_runtime_active_kids.attr,
> -       &dev_attr_runtime_enabled.attr,
> -#endif /* CONFIG_PM_ADVANCED_DEBUG */
>         NULL,
>  };
>  static const struct attribute_group pm_attr_group = {
> @@ -650,13 +644,16 @@
>  };
>
>  static struct attribute *runtime_attrs[] = {
> -#ifndef CONFIG_PM_ADVANCED_DEBUG
>         &dev_attr_runtime_status.attr,
> -#endif
>         &dev_attr_control.attr,
>         &dev_attr_runtime_suspended_time.attr,
>         &dev_attr_runtime_active_time.attr,
>         &dev_attr_autosuspend_delay_ms.attr,
> +#ifdef CONFIG_PM_ADVANCED_DEBUG
> +       &dev_attr_runtime_usage.attr,
> +       &dev_attr_runtime_active_kids.attr,
> +       &dev_attr_runtime_enabled.attr,
> +#endif
>         NULL,
>  };
>  static const struct attribute_group pm_runtime_attr_group = {
>
>
>
