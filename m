Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F121B21CC4E
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746275038; cv=none; b=KSsonOiDzwUc1RjTJivt87Gmim/UhtLXx2ckVXRG256AbLgHrwow1LrApwCQCkdH5SVml2qqhZearWyp7D9+/xXb9d8wr3PEKrZrkjRdso4vhCziY2feOBiek1lqUD2z/4Er/kK2TktdKzJTs4sAukMeIcgN0HrpCN5sIisaBPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746275038; c=relaxed/simple;
	bh=5U//rETcjYrALmxzf525J1E7Pyy9MUHuynm6kg3AKMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y6E/bYADtlIIuFKUHHGhUj3fR07x4v7OlxFHjpHHBBVg2NPa0Z2pREZwJgukAdB72eMPc0FvNhfbwxen7IAXQtPl51vo32zRyOAJlRbONyi8EoM+UnOhP3TNMl8YVlWaOJACuS6DIfRPB1j0Vu5EmDRIqX1yo+p7+AbsSvPCm0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rKikO7kw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rKikO7kw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C27C4CEE7
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 12:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746275037;
	bh=5U//rETcjYrALmxzf525J1E7Pyy9MUHuynm6kg3AKMc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rKikO7kweNOKcaLINTL0iTVY5bZeFWJEPIc2Uoj3TIkRLpzl9p5Flhgbc/v9ip4KJ
	 +tb4iDVKcjcZLcBPgOQ0mJAb7B/A9Z9vZA6MXQUUbGbmAk7iIwl9hck0fbtdwyLiF1
	 NAbNFJ6FRV2wRlvVS3/lsWeK37g2L+qVFEtR5NPvn/yRPBCZnwvTUiFSm1bXQrHFwo
	 CeAV+A1Qh+zxgrL3UdZTl7o0LTO3x3AucgCNBbjJKSaj0E1dttV/i0RbvLfn0o//KO
	 GjIbtyImNerGVQVKqgy3TLnsMfrvg/1PSKPpeb/IKb8xREnGlRmaXC7XnfoyscTf0s
	 ZwP3bjMkCEchw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acb5ec407b1so479806966b.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 05:23:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU03oZ8+5sdsL+LApyY6f10NAalnG3HikH4MI4Qzd84vnIOqXKPGx82yEQKffNmwJhbD7BV0xklKAVYZDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyfMlgpKx/WB+04yQkzT/e7D+8rYGouONur0M9XvOVmwVaSh40
	AvGKOggw7iMevK/4qpxkcrI1xq7v5u0fjdzKSMQMey5Gx1y1wOAiyw99YzWJgrRDj8Gkev1kKMb
	NXHsFxJAXsB223YZ7BHhyO0nzNAc=
X-Google-Smtp-Source: AGHT+IFwvmqxI0osNQCxLa/CnSBo000Gybd0uDxYA3k0iyudFhRjL2EEMPspXaJURfaPr9DlJTLd2NX5CRDIuXzfeGg=
X-Received: by 2002:a17:907:9411:b0:ad1:8e78:3d79 with SMTP id
 a640c23a62f3a-ad1a48bc59emr67713066b.1.1746275035905; Sat, 03 May 2025
 05:23:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430090751.24056-1-zhangtianyang@loongson.cn>
In-Reply-To: <20250430090751.24056-1-zhangtianyang@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 3 May 2025 20:23:45 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7e2Ssr2A17XkQQg-VfNb6PAKtJeYC-2X9WCYcz2BJ=7w@mail.gmail.com>
X-Gm-Features: ATxdqUE9UDhCsT2u6FoPquYPxWM27N_1EZnAX41TYGBmkfiC3LxYB7wVjsiQsPs
Message-ID: <CAAhV-H7e2Ssr2A17XkQQg-VfNb6PAKtJeYC-2X9WCYcz2BJ=7w@mail.gmail.com>
Subject: Re: [PATCH V2] LoongArch:support CONFIG_SCHED_MC
To: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: kernel@xen0n.name, wanghongliang@loongson.cn, yangtiezhu@loongson.cn, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tianyang,

On Wed, Apr 30, 2025 at 5:08=E2=80=AFPM Tianyang Zhang
<zhangtianyang@loongson.cn> wrote:
>
> From: wanghongliang <wanghongliang@loongson.cn>
>
> In order to achieve more reasonable load balancing behavior,
> support for SCHED_MC has been added.
> The LLC distribution of Loongarch now is consistent with numa-node,
> the balancing domain of SCHED_MC can effectively reduce the situation
> where processes are awakened to smt_sibling
>
> Co-developed-by: wanghongliang <wanghongliang@loongson.cn>
> Signed-off-by: wanghongliang <wanghongliang@loongson.cn>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> ---
>  arch/loongarch/Kconfig                |  9 ++++++
>  arch/loongarch/include/asm/smp.h      |  1 +
>  arch/loongarch/include/asm/topology.h |  8 +++++
>  arch/loongarch/kernel/smp.c           | 46 +++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 1a2cf012b..3d6d129ee 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -456,6 +456,15 @@ config SCHED_SMT
>           Improves scheduler's performance when there are multiple
>           threads in one physical core.
>
> +config SCHED_MC
> +       prompt "Multi-core scheduler support"
This should be bool....

To save your time, I have fixed this typo, refresh the title and
commit message [1], you can download it and then submit V3.

And if needed, also update the version in the internal repo.

[1] https://github.com/chenhuacai/linux/commit/17c9a8142696c428e2da37109ac3=
0deb5133eaf7


Huacai

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
> index b87d1d5e5..13955d726 100644
> --- a/arch/loongarch/include/asm/smp.h
> +++ b/arch/loongarch/include/asm/smp.h
> @@ -26,6 +26,7 @@ extern int num_processors;
>  extern int disabled_cpus;
>  extern cpumask_t cpu_sibling_map[];
>  extern cpumask_t cpu_core_map[];
> +extern cpumask_t cpu_llc_shared_map[];
>  extern cpumask_t cpu_foreign_map[];
>
>  void loongson_smp_setup(void);
> diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/inclu=
de/asm/topology.h
> index 50273c918..dfaf45d57 100644
> --- a/arch/loongarch/include/asm/topology.h
> +++ b/arch/loongarch/include/asm/topology.h
> @@ -36,6 +36,14 @@ void numa_set_distance(int from, int to, int distance)=
;
>  #define topology_sibling_cpumask(cpu)          (&cpu_sibling_map[cpu])
>  #endif
>
> +/*
> + * return cpus that shares the last level cache.
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
> index 4b24589c0..7b9e996a1 100644
> --- a/arch/loongarch/kernel/smp.c
> +++ b/arch/loongarch/kernel/smp.c
> @@ -50,6 +50,9 @@ EXPORT_SYMBOL(cpu_sibling_map);
>  cpumask_t cpu_core_map[NR_CPUS] __read_mostly;
>  EXPORT_SYMBOL(cpu_core_map);
>
> +cpumask_t cpu_llc_shared_map[NR_CPUS] __read_mostly;
> +EXPORT_SYMBOL(cpu_llc_shared_map);
> +
>  static DECLARE_COMPLETION(cpu_starting);
>  static DECLARE_COMPLETION(cpu_running);
>
> @@ -66,6 +69,10 @@ static cpumask_t cpu_sibling_setup_map;
>  /* representing cpus for which core maps can be computed */
>  static cpumask_t cpu_core_setup_map;
>
> +/* representing cpus for which llc sibling maps can be computed */
> +static cpumask_t cpu_llc_shared_setup_map;
> +
> +
>  struct secondary_data cpuboot_data;
>  static DEFINE_PER_CPU(int, cpu_state);
>
> @@ -102,6 +109,42 @@ static inline void set_cpu_core_map(int cpu)
>         }
>  }
>
> +static inline bool cpus_are_shared_llc(int cpua, int cpub)
> +{
> +       if (cpu_to_node(cpua) !=3D cpu_to_node(cpub))
> +               return false;
> +
> +       return true;
> +}
> +
> +static inline void set_cpu_llc_shared_map(int cpu)
> +{
> +       int i;
> +
> +       cpumask_set_cpu(cpu, &cpu_llc_shared_setup_map);
> +
> +       for_each_cpu(i, &cpu_llc_shared_setup_map) {
> +               if (cpus_are_shared_llc(cpu, i)) {
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
> +               if (cpus_are_shared_llc(cpu, i)) {
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
> @@ -406,6 +449,7 @@ int loongson_cpu_disable(void)
>  #endif
>         set_cpu_online(cpu, false);
>         clear_cpu_sibling_map(cpu);
> +       clear_cpu_llc_shared_map(cpu);
>         calculate_cpu_foreign_map();
>         local_irq_save(flags);
>         irq_migrate_all_off_this_cpu();
> @@ -573,6 +617,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>         loongson_prepare_cpus(max_cpus);
>         set_cpu_sibling_map(0);
>         set_cpu_core_map(0);
> +       set_cpu_llc_shared_map(0);
>         calculate_cpu_foreign_map();
>  #ifndef CONFIG_HOTPLUG_CPU
>         init_cpu_present(cpu_possible_mask);
> @@ -614,6 +659,7 @@ asmlinkage void start_secondary(void)
>
>         set_cpu_sibling_map(cpu);
>         set_cpu_core_map(cpu);
> +       set_cpu_llc_shared_map(cpu);
>
>         notify_cpu_starting(cpu);
>
> --
> 2.43.0
>
>
