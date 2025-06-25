Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EF91DD877
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750892005; cv=none; b=eqdf8MzHUK4NImXM8fjKLv65u/Myc2Vhw+PvhH3XO4oXq1E25P1hf45kMW2xIZ+TsL7YVxK4OSThtm/hbR3PAUlzgtmJi802iOj0TW/MMfL4/ajVOZ670Cbr7SGCF40ZLvulwbdBT+V3mSedAxMvEpenr6y6DDkeZYnUUeXmZXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750892005; c=relaxed/simple;
	bh=1hR09h0h2EckMuSMZGYDLvVqv3cyb5erjp61cRldZRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rK1cf7CuKna7d+zx6VaNMOMTIT7ft+rUHQBccCKZ8i9TT315VFQkJut5guwIDjA2Pb7rmSaTzZYp71+P3jguKfdsS4Nm/I36ZEw1y5cr55/hUaBi9Xq2yWl6H3sE/rJAdrnRDy1Y75LuA7kDyR/1Ck/xPcREw9794cJSJhbf7OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YX1x8z0P; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YX1x8z0P"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7490cb9a892so344140b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750892003; x=1751496803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjVZNJVj1VyecmvfQv75DLyG9gWL1xdoouzFtGiwWo8=;
        b=YX1x8z0PmNissju7HKl+QocNQKqZB/1d+stzkTEFe2QLPZVs4+vY2CTzjRt4Wt2vD5
         GAZoSjHyFZzCbmKgCm8kEW1s9fs8w+TlER5apZEXVULWKCaL8gBFkWNGLU14PXpweNnN
         czoM9u2N/SpCXxoEK++ZlDm6lEPQfoaTIcvCGJNBOrAynEQTvz6PUmDbgGQxDyi+WHpH
         nh6gYAVWfdOwd/S+Ck3EPOFUK7xwBDwS5GCBhbECyA37inkrYFvWAOxlQIBvmb97chmj
         f7FqzzfaUp/TcAo0yeTzEW0pc81Gp8xuaEyEElMPlaOpIoxMw2kAxX3lD704yW66JNdZ
         DT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750892003; x=1751496803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjVZNJVj1VyecmvfQv75DLyG9gWL1xdoouzFtGiwWo8=;
        b=dDVJvCpaxaLh3Fy/N2bsIYo3nnqTeLPuVmXCtlPedYDqDpGcW1Yz7aBfGcJ9Vfp8Cn
         CgAzw+cuIFpR5/BZJMn8rfn3lDHA7rCWgSiVdSFMXITs2eutMp/7KuBogpuUrYul57kc
         P6PVdyWe8OTA/iTJaSmREONMVumt+WXnym700JVFV8uJSDX6Cbe4984plutlR74CqlfL
         4mKjTP3AuT3O12e03GjCKClOeYwT5gTnUkJLKS7FBP1ye8vaY+P6AiL95X0nfI/2DNuF
         jNaw7g/4Prtwms8pJVJ+S0v5kW5BiCOU7Ln/mYvskFqHYm0RTdHkpU2Z7mDX98yYAGYv
         B+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVztfVMMBFKmVa+C9ubZjbpKxG6SXd7IrYlgpRG8cNPDpWQnv+bL9glKkThupSylhbHIRaPWq6srq5JEK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiwVlXu8cy6V93yCe9YfHunpnft4Ze6ZAkFp6qaP7+jeLmtduq
	DRSlv970+8wlRM1oM+T+PPIenaWgZKZr+bOiOQ+E+XOI+Osng7Eh5yKw
X-Gm-Gg: ASbGnctCCZOfXBU2A5DFAM9844msPetzuoMa+FkQ0PWBKZWgT/wEAQ7+8d3SJyc/E2n
	uZGb2iURzi+78+nA8sA8qqpxQatbNVfJwkYNO+3sjQVh4CerfuRpZaevTM5iLyZwsfqZ+2nELL4
	uf30YFWnLHcKb9Lca1tcoC4rAYtLqsfD5ReDOQJUz8V0du7WG/gr/Aqi1SIboJ4bDmJQVb1qHBd
	7k+YwqNnwwDGM2IA/qUCSSJH5TEu8sMsX1Zs7GDjuaE99sipCSNqDZ2lkJNs7XkRJR0jGMuge9F
	lHW5814WN+zV7Dvhbymy8GVBxioHpSuOO5ExkK1g2RI3RGibljb3CEQrrkTv2MJzzc7ulLEs
X-Google-Smtp-Source: AGHT+IE88beKHh6OBkAbtxFt7Nvsoy5yyN1uxp5998LeU3T9z5d9GIj7QrS9GiVPtDjcAz7GT8jNfQ==
X-Received: by 2002:a05:6a00:2185:b0:747:ab61:e4fa with SMTP id d2e1a72fcca58-74ad456a27emr6990406b3a.14.1750892003065;
        Wed, 25 Jun 2025 15:53:23 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8850c9fsm5735950b3a.109.2025.06.25.15.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 15:53:22 -0700 (PDT)
Date: Wed, 25 Jun 2025 18:53:20 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Subject: Re: [RFC v2 9/9] [DEBUG] powerpc: add debug file for set/unset cpu
 avoid
Message-ID: <aFx94BDKk_WJ48pK@yury>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-10-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625191108.1646208-10-sshegde@linux.ibm.com>

On Thu, Jun 26, 2025 at 12:41:08AM +0530, Shrikanth Hegde wrote:
> Reference patch for how an architecture can make use of this infra. 
> 
> This is not meant to be merged. Instead the vp_manual_hint should either
> come from hardware or could be derived using steal time. 

If you don't add any code that manages the 'avoid' mask on the host
side, all this becomes a dead code.
 
> When the provided hint is less than the total CPUs in the system, it
> will enable the cpu avoid static key and set those CPUs as avoid. 
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/paravirt.h |  2 ++
>  arch/powerpc/kernel/smp.c           | 50 +++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
> index b78b82d66057..b6497e0b60d8 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -10,6 +10,8 @@
>  #include <asm/hvcall.h>
>  #endif
>  
> +DECLARE_STATIC_KEY_FALSE(paravirt_cpu_avoid_enabled);
> +
>  #ifdef CONFIG_PPC_SPLPAR
>  #include <linux/smp.h>
>  #include <asm/kvm_guest.h>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 5ac7084eebc0..e00cdc4de441 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -64,6 +64,7 @@
>  #include <asm/systemcfg.h>
>  
>  #include <trace/events/ipi.h>
> +#include <linux/debugfs.h>
>  
>  #ifdef DEBUG
>  #include <asm/udbg.h>
> @@ -82,6 +83,7 @@ bool has_big_cores __ro_after_init;
>  bool coregroup_enabled __ro_after_init;
>  bool thread_group_shares_l2 __ro_after_init;
>  bool thread_group_shares_l3 __ro_after_init;
> +static int vp_manual_hint = NR_CPUS;
>  
>  DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
>  DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
> @@ -1727,6 +1729,7 @@ static void __init build_sched_topology(void)
>  	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
>  
>  	set_sched_topology(powerpc_topology);
> +	vp_manual_hint = num_present_cpus();
>  }
>  
>  void __init smp_cpus_done(unsigned int max_cpus)
> @@ -1807,4 +1810,51 @@ void __noreturn arch_cpu_idle_dead(void)
>  	start_secondary_resume();
>  }
>  
> +/*
> + * sysfs hint to mark CPUs as Avoid. This will help in restricting
> + * the workload to specified number of CPUs.
> + * For example 40 > vp_manual_hint means, workload will run on
> + * 0-39 CPUs.
> + */
> +
> +static int pv_vp_manual_hint_set(void *data, u64 val)
> +{
> +	int cpu;
> +
> +	if (val == 0 || vp_manual_hint > num_present_cpus())
> +		vp_manual_hint = num_present_cpus();
> +
> +	if (val != vp_manual_hint)
> +		vp_manual_hint = val;

This all is effectively just:

	vp_manual_hint = val;

Isn't?

> +	if (vp_manual_hint < num_present_cpus())
> +		static_branch_enable(&paravirt_cpu_avoid_enabled);
> +	else
> +		static_branch_disable(&paravirt_cpu_avoid_enabled);
> +
> +	for_each_present_cpu(cpu) {
> +		if (cpu >= vp_manual_hint)
> +			set_cpu_avoid(cpu, true);
> +		else
> +			set_cpu_avoid(cpu, false);
> +	}
> +	return 0;
> +}
> +
> +static int pv_vp_manual_hint_get(void *data, u64 *val)
> +{
> +	*val = vp_manual_hint;
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_vp_manual_hint, pv_vp_manual_hint_get, pv_vp_manual_hint_set, "%llu\n");
> +
> +static __init int paravirt_debugfs_init(void)
> +{
> +	if (is_shared_processor())
> +		debugfs_create_file("vp_manual_hint", 0600, arch_debugfs_dir, NULL, &fops_pv_vp_manual_hint);
> +	return 0;
> +}
> +
> +device_initcall(paravirt_debugfs_init)
>  #endif
> -- 
> 2.43.0
