Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A802CCC0
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358382; cv=none; b=YcpBK19Dq1wFzaFjfsslOazn5oDaWMnlmxMYdw2ZNUO8T1/aJbRMtZsv9euZ6MNY7UHdXdJlCc3z/MVi2tII4So5M60fJ1Q7JY4G2PHkRRemFOzsmV05blHQQOXsC56ANoPGoyRIPRBCMPL0uwToIhH7tLdSJmjDN5EsvWI8Xe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358382; c=relaxed/simple;
	bh=yLFEz3isGxDdDlSUT7TZPVDwaKdBEy3alc679K+IW3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+8lIi8sM7spKnaYTUF3fcJODoxfgp4zql/K1tIIafJCW3uSbhlhc90erSshgyQOy6JKUbxMElHn4fapO/8BkUpfcm/InkSAfPUv5bWROPIYcnNmYUNKS7ATlxqjgox9nw4YulnaCByoWYdUAJsq1gbPhek1MumY5BFyeMma0sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIELTl9C; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIELTl9C"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30e8feb1886so3239628a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748358379; x=1748963179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LSvOqeZMchgdQOgzsXx3GXNhfS4N4OUcWNZspeGG6m0=;
        b=PIELTl9CHmg+TnymEnK06uFdQkOKcQse0NChjDPHtzHbc7XbPk56j6BWC2Gm3n5QC6
         JeKtZydyZ3e/GL+pz0MPxdj9x87fbyZ5WzG6vt/dmPFKMZkOBxt6T7EIc3DKNgWlxzVW
         LUQYFiirCwctPVx2eQ6eL43y0ytbyyXe1DepvBeOyT825TulkbSMEBkmMtg3g3PRrYjq
         SZjZkN8mBwfhBzb1xdic8BmpCTDUo21ZoksvmLYjRxfxVuwANWwZnxpr4Ib6vQtdo7FI
         RsgRxEKnRS6a8yJK9TbQ6scSgIrTAIQyzAPSx9QK9/PPC71S44IdLsRAfupgByNR/1F0
         N5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748358379; x=1748963179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSvOqeZMchgdQOgzsXx3GXNhfS4N4OUcWNZspeGG6m0=;
        b=fP2iT74xnUTPz/NBFNbqGO878HMTKRRjSxXdb06fR00TDU477aCTqDbBEHitvpZnXQ
         Lw+KDpbV2rD1nbxHYSFsexL/tCzMbJx3l5qf8ZwTA6bYz7KIlYr0d1FM3pKRUGRgMo+p
         TaNrcqNg5Gv0CRzhyqFCvZDvoaGnr4BjhsxVvvdGH2eu6MHF9grXVREYQWM8wOI2ySaj
         zwhTBwXyoKsgyX0dNmpdO/G079a1RMXRDk6EI9ZhBb18VtvlXXzW6+LJlHISwQ28TRol
         /A9CkSsYwZRZplzlb8wVNX06A6Mh/hfiuBeC3ImNsSsdrFG1chp/hHN5nx38vit50l1c
         EHDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyEZc/1WmUAL1F31X2oXu+Oce6E/iEZRFkYPDJOYsjVoFGr1AOBmyxKREPBaj6LVbaBrHrxk7HsIbCxOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYWoh/Ppz+veE4ejtyWpF4/vpTNb/8fs5kst19v1FvkadG8EgV
	ouBHwxWtwddvrLZs8vrFPb0CLByWEcmIyW1Ydx22LE+fXPCdvZ6ZIsfx
X-Gm-Gg: ASbGnctp2pNpQtjAybDgFDBULVh0sdti4OCXEqmhrSgWsdTLOFpHcaqrvVu9DgSfKS1
	fNIacjNGhogBFvT0I8xRT5Tm71wsH/M4oDR4Z7Q+ZmavPhjBdG57NhZo3g3W8w+D7mUIB/3imzA
	WikWcp2SlKPIKue4wmbFrs6QfsmYvKiQelFfYZMaG0WdbQLxPdTXVgbic8M1eIGyQaVui055K+h
	s3KWCB6GaqQtrjFlVJGiIZvs516NfclxK72AALdJab0GmWoH5qiAN4h7ETF3v1KpsR8r1mohbnb
	e+ZEz0+AKN1TS7NXYWNmtVwoXNQGo52rARU/WbMyMEIHoyHwtDeLLnjbS0lVXg==
X-Google-Smtp-Source: AGHT+IENRKfOpKeDaMuKYKCJrumQsZsYkryV005OlAkY/9d4/fo7G7RYytv32nCL77XHTRKmxBejig==
X-Received: by 2002:a17:90b:3f0d:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-311108a1d6amr24913841a91.14.1748358378843;
        Tue, 27 May 2025 08:06:18 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b158fsm14336896a91.8.2025.05.27.08.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:06:18 -0700 (PDT)
Date: Tue, 27 May 2025 11:06:16 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	jstultz@google.com, kprateek.nayak@amd.com, huschle@linux.ibm.com,
	srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
	linux@rasmusvillemoes.dk
Subject: Re: [RFC PATCH 1/5] cpumask: Introduce cpu parked mask
Message-ID: <aDXU6LUlrmBLL3ak@yury>
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
 <20250523181448.3777233-2-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523181448.3777233-2-sshegde@linux.ibm.com>

On Fri, May 23, 2025 at 11:44:44PM +0530, Shrikanth Hegde wrote:
> CPU is said to be parked, when underlying physical CPU is not 
> available. This happens when there is contention for CPU resource in
> para-virtualized case. One should avoid using these CPUs. 
> 
> Build and maintain this state of parked CPUs. Scheduler will use this
> information and push the tasks out as soon as it can. 

This 'parked' term sounds pretty obscured. Maybe name it in
a positive sense, and more explicit, like cpu_paravirt_mask.

Also, shouldn't this be conditional on CONFIG_PARAVIRT?

Thanks,
Yury
 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> - Not sure if __read_mostly attribute suits for cpu_parked 
> since it can change often. Since often means a few mins, it is long time
> from scheduler perspective, hence kept it. 
> 
>  include/linux/cpumask.h | 14 ++++++++++++++
>  kernel/cpu.c            |  3 +++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index 6a569c7534db..501848303800 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -84,6 +84,7 @@ static __always_inline void set_nr_cpu_ids(unsigned int nr)
>   *     cpu_enabled_mask - has bit 'cpu' set iff cpu can be brought online
>   *     cpu_online_mask  - has bit 'cpu' set iff cpu available to scheduler
>   *     cpu_active_mask  - has bit 'cpu' set iff cpu available to migration
> + *     cpu_parked_mask  - has bit 'cpu' set iff cpu is parked
>   *
>   *  If !CONFIG_HOTPLUG_CPU, present == possible, and active == online.
>   *
> @@ -93,6 +94,11 @@ static __always_inline void set_nr_cpu_ids(unsigned int nr)
>   *  representing which CPUs are currently plugged in.  And
>   *  cpu_online_mask is the dynamic subset of cpu_present_mask,
>   *  indicating those CPUs available for scheduling.
> + *
> + *  A CPU is said to be parked when underlying physical CPU(pCPU) is not
> + *  available at the moment. It is recommended not to run any workload on
> + *  that CPU.
> +
>   *
>   *  If HOTPLUG is enabled, then cpu_present_mask varies dynamically,
>   *  depending on what ACPI reports as currently plugged in, otherwise
> @@ -118,12 +124,14 @@ extern struct cpumask __cpu_enabled_mask;
>  extern struct cpumask __cpu_present_mask;
>  extern struct cpumask __cpu_active_mask;
>  extern struct cpumask __cpu_dying_mask;
> +extern struct cpumask __cpu_parked_mask;
>  #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
>  #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
>  #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
>  #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
>  #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
>  #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
> +#define cpu_parked_mask    ((const struct cpumask *)&__cpu_parked_mask)
>  
>  extern atomic_t __num_online_cpus;
>  
> @@ -1146,6 +1154,7 @@ void init_cpu_possible(const struct cpumask *src);
>  #define set_cpu_present(cpu, present)	assign_cpu((cpu), &__cpu_present_mask, (present))
>  #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask, (active))
>  #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (dying))
> +#define set_cpu_parked(cpu, parked)    assign_cpu((cpu), &__cpu_parked_mask, (parked))
>  
>  void set_cpu_online(unsigned int cpu, bool online);
>  
> @@ -1235,6 +1244,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
>  	return cpumask_test_cpu(cpu, cpu_dying_mask);
>  }
>  
> +static __always_inline bool cpu_parked(unsigned int cpu)
> +{
> +	return cpumask_test_cpu(cpu, cpu_parked_mask);
> +}
> +
>  #else
>  
>  #define num_online_cpus()	1U
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index a59e009e0be4..532fbfbe3226 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -3110,6 +3110,9 @@ EXPORT_SYMBOL(__cpu_dying_mask);
>  atomic_t __num_online_cpus __read_mostly;
>  EXPORT_SYMBOL(__num_online_cpus);
>  
> +struct cpumask __cpu_parked_mask __read_mostly;
> +EXPORT_SYMBOL(__cpu_parked_mask);
> +
>  void init_cpu_present(const struct cpumask *src)
>  {
>  	cpumask_copy(&__cpu_present_mask, src);
> -- 
> 2.39.3
