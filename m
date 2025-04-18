Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C0C1A0730
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744955938; cv=none; b=Gjmwhl4rK8LvC61ZmBOJeB/MhcNe6pP0ubWgc16gR65xgYgEk3rjjyW1350+BluYz5y8p8Zvfru9s8rUgxty1IWRQnqhwIwMOeOXUFq7PKgSGGbrIVE4BMn6D0acNarMtPPL5bfruoFQixhLZBELYQmrSTL+pg67oWYj2YofXYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744955938; c=relaxed/simple;
	bh=9vzQM3t5vp/0pOozAYzw8sT/kUPRS92tdRYnfzsM3ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MxsP5pgp46mj5GUbABVir8ISfUI5Ovd1UcRjno+aSCCdrBwu3RUIqfsn5jOcW2rF1xlMfKQBOHFCj+55GkKw0gR3KiD9mf5MI2agcbehEZyvMb6vsux65nvJRKFaPMEcAlKx6PvoaEGvdCJWoHMjDJEo9FTLTlnP/8Rtq9V4LM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWdxi/HI; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWdxi/HI"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so2646642a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744955933; x=1745560733; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFhmOeXgIAlpgdzXmkuAFZPhvLmDKS09kQhKDPs7SSw=;
        b=QWdxi/HISx2YFfJGrAMKYH2CIctgux9CvDakPaZRtqMYIvIC+haank58pLqduZPA8D
         bbQZnDbNnJFEav/GmeMgvoTbVF81KIOD6dIYIYvwIv6vsAzBHqjfKwLc3k9p4qZTiuCZ
         /3n/q1NGU4duTRAJ40RII2D6TIdwaDSK9qXLFE7f2mf7lfgG2iLNoU8BKwieQE7j+dLV
         wlsbkixrRwvPos1/BwslU15lx/x2MgsCtVZgz1inUGHbo76G3RbLWsr6jzMwINElxtZp
         Q3npsuK4QR/wZyHNWG1XiWePPWUtJnxyVHGmuiUEEzCmw4dtdcV08g4nKWqcXhQskx0Y
         Xuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744955933; x=1745560733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFhmOeXgIAlpgdzXmkuAFZPhvLmDKS09kQhKDPs7SSw=;
        b=RiGY4N/xGw/o6JHVHqvRhtRsCCm3LoeULStr3MBU6ofUBc7ZMDJSxlL/Gj5dnvH+Lk
         EWmBtfGmkJtnM2+o4fyrze7o7GdxDiPHjIYUydnJnmKqF2AIHhlHPtefBCoPw+DSnYwA
         TPfKOil5gFpg8C66dl1p0WH0OBClgUKUkTHt0keC8fCRBc9dIvAL4AHDs9bVFuR14oZM
         JCMKbKqO/EI1o0Rmyw0PqwnCt6hB9SigcXLUd+YeEPsijQYCgvgC8u9yR5Ot0ztiD9aL
         iIglt99d9keACZOKdQbv+NAJhojFCZgvdCOx6Ygz5FboXabjafVMP1FT/1WpJ/dGM/mR
         hxlA==
X-Forwarded-Encrypted: i=1; AJvYcCUUnO5rOIqaw7OVIuXphjOAX/j+aJNmce1W0RNExIN2rgcWtWdr6NFSBhn0DdJ2NFo0VAWcJ0+8z4AdxII=@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0GbydMlBdAh/C3zvDleE4y+rF6jigeoVNnGXFYJdHry+Vwd9
	Klgr3UgsOct2I+p3uYhKh+4zhX+WMXu1fPxW54Y1FFOpBECbzZS+X1ZvfdO8ZAk6CAzJs0woIfE
	RSmvczFa39OEtjWtE0FDLvyh8rYG+Jf7S/tTrcQ==
X-Gm-Gg: ASbGncuxw5g1jPU8xpv657xKNxeWj8RShlOtSPEjBtT6T+0Dg9herUoCb3laUGHKbNf
	SQclNZOWALd3Wr9PecRIbHqfsPNQAtVxBU02xOyHAtzLbkOzB1hgCKEfriQgCxu1fyPup1N0aPT
	xqupktqxhxhwQkNbXoo2fvMkdvFPWemjui
X-Google-Smtp-Source: AGHT+IHh85joDb2VeapV3maVEqgQe9L9tm8FqA2mZKy01E0HnbaGNJfQUJ+nqSYGMzINt6uLO0DslAKNblccoGq618A=
X-Received: by 2002:a17:907:9712:b0:ac7:16ef:e994 with SMTP id
 a640c23a62f3a-acb74e19569mr100020766b.56.1744955933480; Thu, 17 Apr 2025
 22:58:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2c788c2ca0cab09a8ef4e384f272af928a880b0e.1744781329.git.viresh.kumar@linaro.org>
 <20250417015424.36487-1-nic.c3.14@gmail.com> <20250417050226.c6kdp2s5du3y3a3j@vireshk-i7>
 <20250417050911.xycjkalehqsg3i6x@vireshk-i7> <CAJZ5v0iO4=nHcATzPyiKiWumdETFRR32C97K_RH=yhD--Tai=g@mail.gmail.com>
 <CAJZ5v0gcf07YykOS9VsQgHwM0DnphBX4yc9dt5cKjNR8G_4mAQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0gcf07YykOS9VsQgHwM0DnphBX4yc9dt5cKjNR8G_4mAQ@mail.gmail.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Fri, 18 Apr 2025 11:28:49 +0530
X-Gm-Features: ATxdqUEgPyyaV3xmQOk0XfmWdfy0ew_P7jRJpbFnpMXANh3GgdaCIR7Xj1vkn-o
Message-ID: <CAKohpomN1PYn1NPSsxCxqpMfg-9nYgCRQD6dFGQ30B+76vneQw@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: acpi: Don't enable boost on policy exit
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Nicholas Chin <nic.c3.14@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, rafael.j.wysocki@intel.com, 
	vincent.guittot@linaro.org, zhenglifeng1@huawei.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Apr 2025 at 21:23, Rafael J. Wysocki <rafael@kernel.org> wrote:
> But the changelog isn't because the patch really doesn't address the
> issue at hand, which is most likely related to the platform firmware
> clearing the "boost disable" bit.

I think the patch and changelog were still correct as the driver was also
enabling the boost at exit(). So it fixes the problem, but not fully.

> Frankly, I'd rather get back to the state from before commit
> 2b16c631832d ("cpufreq: ACPI: Remove set_boost in
> acpi_cpufreq_cpu_init()") and start over with the knowledge that the
> platform firmware may scribble on the MSR before the kernel gets
> control back.
>
> On a way back from system suspend the MSR needs to be put back in sync
> with the boost settings in the kernel.

What about something like this instead ? Nicholas, can you give this a try
along with the $Subject patch (both patches should be applied) ?

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index 924314cdeebc..71557f2ac22a 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -909,8 +909,10 @@ static int acpi_cpufreq_cpu_init(struct
cpufreq_policy *policy)
        if (perf->states[0].core_frequency * 1000 != freq_table[0].frequency)
                pr_warn(FW_WARN "P-state 0 is not max freq\n");

-       if (acpi_cpufreq_driver.set_boost)
+       if (acpi_cpufreq_driver.set_boost) {
                policy->boost_supported = true;
+               policy->boost_enabled = boost_state(cpu);
+       }

        return result;
