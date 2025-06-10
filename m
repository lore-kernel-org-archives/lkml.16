Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B9924679D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749581951; cv=none; b=BVVwHa6ZlcK2mA/376ZRlOSLQlI1k/u2n+dOcyn9omSOd2ivFAYbW36u+h4rkhCoTDMoBqM6ojithRm14bQ+pd3M/iMV2vfOgzfOc7ZDzJtl1R1XSQZYzaXpUBOnvt+pQHA4VQdIleqGKk5B/da7f10ukFdyvnhuwCx27YqGppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749581951; c=relaxed/simple;
	bh=KmAUf3dXXB0p66orx+B4ProFOgjmT1ub5RqekKbl/Bg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hbj1rAZ1XW+CuiPhbz8kYIlWxz3wAZbc/zE8yrRAC2A84xmK8wCE88wrg6IMpkeCQNWtWmCkar1xoDFgHvo9hUIWidLOqNwgSnslGB/6QzdfsREZ5P1QgOhFiUAnu1eVCCsgb18qGSKSFWkicdnZnx13Lh3jligHsBulynfuGbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMlIR81M; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMlIR81M"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234fcadde3eso68663505ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749581949; x=1750186749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nuQyHIKwgfo8nIn1AH5ah64VfwYi3IlgMCaC2ZFDPgg=;
        b=RMlIR81MWMLeikfXTHDf3WMGh06Yervkq+dXqzQrB2C3VNDdTDWH7dg0qKusfasUul
         MpnCw7/EIkD/a60hFpEiIiA9mZtZDhS3NsRjvApdFGQ8Mba0RX79ob80y1YGvx1Xug5e
         S68ns7oS8T4hrqawv8lAeocBWkHxV6NTz0+IdThtR9vXY2qn9JnMEYz4KS7/WtkkwnLi
         2xLVmbgIe38cZSx4OgWeeMD2mT5v9HdAXWwR2JJ55kNKHSYMd3TIbKQzNa3CejUSQceK
         Na/0sQqxFycfPDnU5QzInGpT+Gn90jK839PDlpHyVEQMu2Rs7Zlpt9/nx9aC1xhxKjMY
         6xBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749581949; x=1750186749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuQyHIKwgfo8nIn1AH5ah64VfwYi3IlgMCaC2ZFDPgg=;
        b=Iv1Ha3AUAO8jfwksQlQgImX4Dw+weTUu10HJ69fcosoHYr4l+JyPnT1DX3g0yP83hK
         gCSbauAa7RUkg8z4l7Sw/bhSYwnjrXXosrEFhh1S5yFsboFoGawYt3/z3b9nM2ynMeKp
         1CBCwzvuZpwhiIzC12fzePszVjr+fS8IeQev6j1UnNRk+bAiWfAZOoU4ynAihn7NFgZs
         RRnjW9cY9U3p6fC6QF1uMVVlm2xcFQHWOKaEEHO21X/M0rgbPlrUJkKR0kl6LwgB9T90
         u2Ko8CpmHtISipwqe5R1d53OYvRBswI7fIP1zqBOl6REk+W6U90JbIur9qCZ4cYsmSWE
         BtQA==
X-Forwarded-Encrypted: i=1; AJvYcCX5yFJP6BXCMRdIKrbEy0eluqgqm6xQvldQvVX4jYHj5dL2RVpCKY05bf6om3Wb0KHaotvbkqRvQFjzaTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMMIVR8CnyNyxcAw+oNiGJQ+r1HqVMxrKJSUnKuctzVHP/Ddxg
	a424l1RDh5AbIhztNuYynoolf8utFL8f5n+w7yoPdwRlJLPyfuBBWEW2
X-Gm-Gg: ASbGncuHpUaITb8WRW7ShwrVzCxz103j+RIIVbZyo+O3m89NK/z6NVktqSDj2xlUY09
	wfqO2qda0TiSPOlVydH8pHfzOmVt+PrggRSHbpuLToeA2rQyQaj8xxiHkJoroHsxROQ0vp3mbam
	xXvXgcbxMGMHevVJoK8K/sr1Qmc1lsfBollcGTE1GOLEaT4ukomP7/uZtjUdyEm3gPHAvaT5qfQ
	uk1NgI/9MbNi0A07DQrov54P2QtGY/kSqcZaOcY39L6lc5ZIrzb8F/oOtv1DA3zmoZ5uBJN0TUd
	pTaie2F+j/JKm8sk2Di3Lwy87920RsKNpDwMRua4qpPuWlX3WgMVfIYIf15Gcg==
X-Google-Smtp-Source: AGHT+IGzxym8gJ1yHWZbtoVZajUyc1+BH9ZtT0Z+sZ0X22uDfVAa1W1uYpWl5SzqPBMBVqF7RrQWCQ==
X-Received: by 2002:a17:903:94c:b0:235:f078:4746 with SMTP id d9443c01a7336-23641b15626mr4825795ad.42.1749581949173;
        Tue, 10 Jun 2025 11:59:09 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcd13sm74553315ad.90.2025.06.10.11.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 11:59:08 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:59:06 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] smp: Defer check for local execution in
 smp_call_function_many_cond()
Message-ID: <aEiAepW_zRYtC1Is@yury>
References: <20250606202732.426551-1-yury.norov@gmail.com>
 <20250606202732.426551-5-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606202732.426551-5-yury.norov@gmail.com>

On Fri, Jun 06, 2025 at 04:27:31PM -0400, Yury Norov wrote:
> From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
> 
> Defer check for local execution to the actual place where it is needed,
> and save some stack on a useless local variable.
> 
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> ---
>  kernel/smp.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/smp.c b/kernel/smp.c
> index 715190669e94..867f79689684 100644
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -779,7 +779,6 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>  	bool wait = scf_flags & SCF_WAIT;
>  	int nr_cpus = 0;
>  	bool run_remote = false;
> -	bool run_local = false;
>  
>  	lockdep_assert_preemption_disabled();
>  
> @@ -801,11 +800,6 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>  	 */
>  	WARN_ON_ONCE(!in_task());
>  
> -	/* Check if we need local execution. */
> -	if ((scf_flags & SCF_RUN_LOCAL) && cpumask_test_cpu(this_cpu, mask) &&
> -	    (!cond_func || cond_func(this_cpu, info)))
> -		run_local = true;
> -
>  	/* Check if we need remote execution, i.e., any CPU excluding this one. */
>  	if (cpumask_any_and_but(mask, cpu_online_mask, this_cpu) < nr_cpu_ids) {
>  		run_remote = true;
> @@ -853,7 +847,9 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>  			run_remote = false;
>  	}
>  
> -	if (run_local) {
> +	/* Check if we need local execution. */
> +	if ((scf_flags & SCF_RUN_LOCAL) & cpumask_test_cpu(this_cpu, mask) &&
> +	    (!cond_func || cond_func(this_cpu, info))) {

Dan Carpenter's robot pointed the bug here: it should be:

        (scf_flags & SCF_RUN_LOCAL) && cpumask_test_cpu(this_cpu, mask)

I'll resend it shortly.

Thanks, Dan!

>  		unsigned long flags;
>  
>  		local_irq_save(flags);
> -- 
> 2.43.0
