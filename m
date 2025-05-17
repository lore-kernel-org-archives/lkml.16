Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562B41DEFDC
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747474327; cv=none; b=jbZsZKI01gqUC+7FNU4dUtwU5qVaH2IvkRn2azzX3CzOKS9tw6eXV+PhsyBA+8lZh0VYrBwF6vtAQAzTvwz+7hWo5zucWLY7r4RRaRgwq0kE4kZv7N6MgjEEoE3TCQmfVAzGY/vSrKBlIT63awTXAk7bAUOf6ughj90VvzP910I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747474327; c=relaxed/simple;
	bh=D+YJzSi0/uqBQqKxIgKe3/wkFNEJZRSryTzv91KdRGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GhvIBr/lm1RUXeuov69qa+Dk6xLuHCtclGo7oJ3p0xb8+HkwBR2yJ/erhlS7AXkTDyy6b5QeAzcO6lXkRUC+eBT/L8iE/OETNLu7S0A0ddDHp54KPHilSyZCiItrcP7bjau+5gx/y+vky73JKbpx8B1FNZO0oH6sAoDlViwDRfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWEz6OYs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWEz6OYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEC7C4CEE3
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747474326;
	bh=D+YJzSi0/uqBQqKxIgKe3/wkFNEJZRSryTzv91KdRGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AWEz6OYs8Sr76ecLT8Jbwt7c49gkqsPDVIwxDaiaAtH67dBnR0/PJtBiG+xpFo0aT
	 xy1fS6b4mFwtM/+eNH6PIYuQiaoLuDX+gebQ+uRJbC2maMuPOU2FqdYaafUA8y1xFI
	 B+cyzQ/N+j4nFqt/EPOmHDL8tKHTDg1prhaP9+LcOAXKOgMStvPth4BxRD/UVAaXST
	 fFRS8AzPBopnV/wfPBwUTDH36DR3ugvOCbdYO9kRJUpy8OnAhlGgX8AAvYFCepP70m
	 1O0ubhjQiuYXBdy0qvwnxbDkgDr4g9P6bfU/y6aE2Yq4xxJuTfm29TnGb5MQF7flvF
	 GbcDAtrAxN77g==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad5297704aaso381209466b.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:32:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtBCmbq3DHc2rVKAVQkeM7mfodywCMlHtQP7LH7H7xGbEko9p/q6V3SGGOUtWwjwAlfpJOnQI4wyl/3QE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkdb6YVhHy3yV5fTDGOsGUBZkHzsp3eaz660/XGlYKn5eaoPy4
	0nF0xgKsRFOrrjfbNiauDC/VYPPYw4qDGOHdnnzuD0jl9d9hGgiGzNmZOtzesTqDZ//GmLnOR7E
	m5H6Vrx5krj9xRTzJaw081qMaBbvgGpQ=
X-Google-Smtp-Source: AGHT+IH8BJJbkcd+cByHnhMEdGYAZ8paulvCkus7HhXahIPVltHPcwYoxQbDXLwHKWeCy3ffqffwDpqHnYVaOOm7r5M=
X-Received: by 2002:a17:907:7e85:b0:ad2:25e9:f7a1 with SMTP id
 a640c23a62f3a-ad52d5b9fb8mr655040166b.40.1747474325484; Sat, 17 May 2025
 02:32:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507100755.9129-1-zhangtianyang@loongson.cn>
In-Reply-To: <20250507100755.9129-1-zhangtianyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 17 May 2025 17:31:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7Fv6H6bDjZzDqNJYxy4NKBMOorEGgbZo1KgofuL04iXw@mail.gmail.com>
X-Gm-Features: AX0GCFtNqJSMj8bjSNyrS58NvcuP8fg0PZOWp8DGZtU30MEIUuUuWt-vfPLEdX8
Message-ID: <CAAhV-H7Fv6H6bDjZzDqNJYxy4NKBMOorEGgbZo1KgofuL04iXw@mail.gmail.com>
Subject: Re: [PATCH V3] LoongArch: Add SCHED_MC (Multi-core scheduler) support
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hongliang Wang <wanghongliang@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied with small changes, thanks.

Huacai

On Wed, May 7, 2025 at 6:08=E2=80=AFPM Tianyang Zhang <zhangtianyang@loongs=
on.cn> wrote:
>
> In order to achieve more reasonable load balancing behavior, add
> SCHED_MC (Multi-core scheduler) support.
>
> The LLC distribution of LoongArch now is consistent with NUMA node,
> the balancing domain of SCHED_MC can effectively reduce the situation
> where processes are awakened to smt_sibling.
>
> Co-developed-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/loongarch/Kconfig                |  9 +++++++
>  arch/loongarch/include/asm/smp.h      |  1 +
>  arch/loongarch/include/asm/topology.h |  8 ++++++
>  arch/loongarch/kernel/smp.c           | 38 +++++++++++++++++++++++++++
>  4 files changed, 56 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 1a2cf012b8f2..609b15a26621 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -456,6 +456,15 @@ config SCHED_SMT
>           Improves scheduler's performance when there are multiple
>           threads in one physical core.
>
> +config SCHED_MC
> +       bool "Multi-core scheduler support"
> +       depends on SMP
> +       default y
> +       help
> +         Multi-core scheduler support improves the CPU scheduler's decis=
ion
> +         making when dealing with multi-core CPU chips at a cost of slig=
htly
> +         increased overhead in some places.
> +
>  config SMP
>         bool "Multi-Processing support"
>         help
> diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/as=
m/smp.h
> index b87d1d5e5890..ad0bd234a0f1 100644
> --- a/arch/loongarch/include/asm/smp.h
> +++ b/arch/loongarch/include/asm/smp.h
> @@ -25,6 +25,7 @@ extern int smp_num_siblings;
>  extern int num_processors;
>  extern int disabled_cpus;
>  extern cpumask_t cpu_sibling_map[];
> +extern cpumask_t cpu_llc_shared_map[];
>  extern cpumask_t cpu_core_map[];
>  extern cpumask_t cpu_foreign_map[];
>
> diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/inclu=
de/asm/topology.h
> index 50273c9187d0..6726298a85ec 100644
> --- a/arch/loongarch/include/asm/topology.h
> +++ b/arch/loongarch/include/asm/topology.h
> @@ -36,6 +36,14 @@ void numa_set_distance(int from, int to, int distance)=
;
>  #define topology_sibling_cpumask(cpu)          (&cpu_sibling_map[cpu])
>  #endif
>
> +/*
> + * Return cpus that shares the last level cache.
> + */
> +static inline const struct cpumask *cpu_coregroup_mask(int cpu)
> +{
> +       return &cpu_llc_shared_map[cpu];
> +}
> +
>  #include <asm-generic/topology.h>
>
>  static inline void arch_fix_phys_package_id(int num, u32 slot) { }
> diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
> index 4b24589c0b56..46036d98da75 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -46,6 +46,10 @@ EXPORT_SYMBOL(__cpu_logical_map);
>  cpumask_t cpu_sibling_map[NR_CPUS] __read_mostly;
>  EXPORT_SYMBOL(cpu_sibling_map);
>
> +/* Representing the last level cache shared map of each logical CPU */
> +cpumask_t cpu_llc_shared_map[NR_CPUS] __read_mostly;
> +EXPORT_SYMBOL(cpu_llc_shared_map);
> +
>  /* Representing the core map of multi-core chips of each logical CPU */
>  cpumask_t cpu_core_map[NR_CPUS] __read_mostly;
>  EXPORT_SYMBOL(cpu_core_map);
> @@ -63,6 +67,9 @@ EXPORT_SYMBOL(cpu_foreign_map);
>  /* representing cpus for which sibling maps can be computed */
>  static cpumask_t cpu_sibling_setup_map;
>
> +/* representing cpus for which llc shared maps can be computed */
> +static cpumask_t cpu_llc_shared_setup_map;
> +
>  /* representing cpus for which core maps can be computed */
>  static cpumask_t cpu_core_setup_map;
>
> @@ -102,6 +109,34 @@ static inline void set_cpu_core_map(int cpu)
>         }
>  }
>
> +static inline void set_cpu_llc_shared_map(int cpu)
> +{
> +       int i;
> +
> +       cpumask_set_cpu(cpu, &cpu_llc_shared_setup_map);
> +
> +       for_each_cpu(i, &cpu_llc_shared_setup_map) {
> +               if (cpu_to_node(cpu) =3D=3D cpu_to_node(i)) {
> +                       cpumask_set_cpu(i, &cpu_llc_shared_map[cpu]);
> +                       cpumask_set_cpu(cpu, &cpu_llc_shared_map[i]);
> +               }
> +       }
> +}
> +
> +static inline void clear_cpu_llc_shared_map(int cpu)
> +{
> +       int i;
> +
> +       for_each_cpu(i, &cpu_llc_shared_setup_map) {
> +               if (cpu_to_node(cpu) =3D=3D cpu_to_node(i)) {
> +                       cpumask_clear_cpu(i, &cpu_llc_shared_map[cpu]);
> +                       cpumask_clear_cpu(cpu, &cpu_llc_shared_map[i]);
> +               }
> +       }
> +
> +       cpumask_clear_cpu(cpu, &cpu_llc_shared_setup_map);
> +}
> +
>  static inline void set_cpu_sibling_map(int cpu)
>  {
>         int i;
> @@ -406,6 +441,7 @@ int loongson_cpu_disable(void)
>  #endif
>         set_cpu_online(cpu, false);
>         clear_cpu_sibling_map(cpu);
> +       clear_cpu_llc_shared_map(cpu);
>         calculate_cpu_foreign_map();
>         local_irq_save(flags);
>         irq_migrate_all_off_this_cpu();
> @@ -572,6 +608,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>         current_thread_info()->cpu =3D 0;
>         loongson_prepare_cpus(max_cpus);
>         set_cpu_sibling_map(0);
> +       set_cpu_llc_shared_map(0);
>         set_cpu_core_map(0);
>         calculate_cpu_foreign_map();
>  #ifndef CONFIG_HOTPLUG_CPU
> @@ -613,6 +650,7 @@ asmlinkage void start_secondary(void)
>         loongson_init_secondary();
>
>         set_cpu_sibling_map(cpu);
> +       set_cpu_llc_shared_map(cpu);
>         set_cpu_core_map(cpu);
>
>         notify_cpu_starting(cpu);
> --
> 2.20.1
>
