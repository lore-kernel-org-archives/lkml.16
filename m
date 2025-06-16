Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9281E832E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066194; cv=none; b=vAbjt29uizaXG8Ra0CgqpqiGu5dxkje8vi29KkLWDyckfDuGttkMcL0zigx90UdDBQ8VnMJk2XiTCauK6B8ia71JS7qFvyTM+ls8pYLgqcTQeB3hZc/7BT229Pz6xJYIljJIEkCKiUKjr6PcZGOSjDIf2L0eDGtEaOS41YxfkOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066194; c=relaxed/simple;
	bh=9wBdIbovrxAFFtW4lRBvON6/qaP11gHI4+md+AI5au0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6/Y73aa6eV8SU/pYQsAKCTHokzEOaRAc/3OrF6ST8FSrjOrA4ORTp4P5oY2O5rvMI/phavJwAo9DO4Qss1AA3XNCNtiXtaJvlmc+qM2IQBBB5qVhJWSxvie91AAgAMuc07YSsxojWI2XG4L5jrnJN77mh5tYqwFhA/NOmjGl9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NXJ5aft0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NXJ5aft0"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so35477205e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750066190; x=1750670990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kwGcLft6rw4uMuBLKiidHxvv3eG5O6mTVnZqBOvMc3M=;
        b=NXJ5aft0c0mpPpsdeVzYIpwwxqsnzpqwY2sPF/iVEEx2vVR8BCULDAGqOqowOuzxm5
         Ilv/2vLycCAr5fnma9oyssmzObfbrw5bjYxglKspGv6kKm1n31Dj8+v8anHjkY0RNAP7
         lpfnxiDM6Ix8nHeHtrKaNwA9xTk6JE7NPIayVJfCuH6/aHwIy21dQziwPovgvoFVaJVB
         gqyiwkdGHcer87IkLzGlfGiUqC0tgf17DJnCvYccNo8vbhGovLAZwsgV4kycW46ybyz9
         JPlxP7Zh6Id1YMKM5juOxQl6muXLA68oz8rArTNUGYUq6TTrfZ/cWdJPjiKVwi//gH+q
         iJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066190; x=1750670990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kwGcLft6rw4uMuBLKiidHxvv3eG5O6mTVnZqBOvMc3M=;
        b=TnMS3CveFpNm5Cf6Dv+0MBG2zXy8PaxBGZ7KE6AKa2qYWrBiOn5ugC/v3y4RwfuE17
         kJAfN2eEPYhytIAKlPpvwMT0XSIcKAh29qk71/FoH+YvRzMjzGlYJial8JuxNSMcQBJ/
         TcKas2becOyxtxnG6qyFFNAy/IuWVf8djgZMr4lHoITdpdkXB0atqK5xAjLF3oPb35su
         6jJ2Q9PMI7X/rQDyiQCB9njJYguQTn5LRZzTa4uLVdZlW6gTLMyBjqLnN3X2jBRyG/md
         ksnnRKNq8rt7iuWU1do/3ErMxn9aMSyNEKiezKHFOmwrRtxIljWCDfBemIR4e/3yl/+o
         UoNw==
X-Forwarded-Encrypted: i=1; AJvYcCW8oSQ0Xtu6ps6yz29zNSrhk6zTQ3dRDCbD315ME8bCjJQrWn0qa9rDbmg6ZuacW4JhKFcN+EAh+ftg5Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxshvyr3b+1PAqNGKTMCpGK1hH/OVg3eSJ8AbuEl2aWh2Su5f9A
	KwudU4Xp/LnOW8MWgb+KHMrTptkq/uqqItLvAvrB6OT5S2/VCLDoL2SXetJNPiYZM1kpVhvfyZw
	yrXN8
X-Gm-Gg: ASbGncsb8daqwtv9kGLD+Upyzm2IseqEe6lXC2lq9xVwGSjm8VoyQ4uzTWMWPkOobia
	EDyY6G+ZPHr23vYsXRPAP0p4pFhimMSxiCv3Ms2GLOdV6DRwL1Flyi2v40HK9fL4vC/4ile5Bbl
	fxpG7k5hpGpF0x7MseBUfhE+M03fudL08hTT4tJayV7Xftxi+A8eaS9mS1tYgdR1/o13jO+UaHt
	YmJ+lDs+RbHxCNdLKeNRE2uMJwFdfJfnNCh6DS0cbQr+vD9THMDFY8xEAlf3Soxx400vDW3/2w1
	RB/bGJY8qLQVyCekTW4dsLdh9QRvUv4vO5b2ELcDtbV8xdo2jsuxam+avU1J7/7txCU=
X-Google-Smtp-Source: AGHT+IHOWfnPFzpHtRF/W2IbEp3fvdHVUeMVNujL1Q/an8stjFUG/mRNeySqS3CZ4AjxpSGguvlPXQ==
X-Received: by 2002:a05:600c:528e:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-4533cad3ca8mr65943535e9.21.1750066190358;
        Mon, 16 Jun 2025 02:29:50 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea15b0sm140616455e9.11.2025.06.16.02.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 02:29:49 -0700 (PDT)
Message-ID: <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
Date: Mon, 16 Jun 2025 10:29:48 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
To: Yicong Yang <yangyicong@huawei.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Ali Saidi <alisaidi@amazon.com>, Leo Yan <leo.yan@linaro.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jinqian Yang <yangjinqian1@huawei.com>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Kan Liang <kan.liang@linux.intel.com>,
 Namhyung Kim <namhyung@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16/06/2025 8:56 am, Yicong Yang wrote:
> + linux-arm-kernel
> 
> On 2025/6/14 4:13, Arnaldo Carvalho de Melo wrote:
>> Hi,
>>
>> tools/perf (and other tools/ living code) uses a file from the kernel, a
>> copy, so that we don't break its build when something changes in the
>> kernel that tooling uses.
>>
>> There is this tools/perf/check-headers.sh that does the "copy coherency
>> check", while trying to act on such a warning I stumbled on the report
>> below.
>>
>> More details at:
>>
>>    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/include/uapi/README
>>
>>
>> If you could please take a look at this that would be great, the initial
>> copy was made at:
>>
>> commit 1314376d495f2d79cc58753ff3034ccc503c43c9
>> Author: Ali Saidi <alisaidi@amazon.com>
>> Date:   Thu Mar 24 18:33:20 2022 +0000
>>
>>      tools arm64: Import cputype.h
>>      
>>      Bring-in the kernel's arch/arm64/include/asm/cputype.h into tools/
>>      for arm64 to make use of all the core-type definitions in perf.
>>      
>>      Replace sysreg.h with the version already imported into tools/.
>>      
>>      Committer notes:
>>      
>>      Added an entry to tools/perf/check-headers.sh, so that we get notified
>>      when the original file in the kernel sources gets modified.
>>      
>>      Tester notes:
>>      
>>      LGTM. I did the testing on both my x86 and Arm64 platforms, thanks for
>>      the fixing up.
>>      
>>      Signed-off-by: Ali Saidi <alisaidi@amazon.com>
>>      Tested-by: Leo Yan <leo.yan@linaro.org>
>>
>> - Arnaldo
>>
>> ⬢ [acme@toolbx perf-tools]$ m
>> rm: cannot remove '/home/acme/libexec/perf-core/scripts/python/Perf-Trace-Util/lib/Perf/Trace/__pycache__/Core.cpython-313.pyc': Permission denied
>> make: Entering directory '/home/acme/git/perf-tools/tools/perf'
>>    BUILD:   Doing 'make -j32' parallel build
>> Warning: Kernel ABI header differences:
>>    diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
>>    diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h
>>
>> Auto-detecting system features:
>> ...                                   libdw: [ on  ]
>> ...                                   glibc: [ on  ]
>> ...                                  libelf: [ on  ]
>> ...                                 libnuma: [ on  ]
>> ...                  numa_num_possible_cpus: [ on  ]
>> ...                                 libperl: [ on  ]
>> ...                               libpython: [ on  ]
>> ...                               libcrypto: [ on  ]
>> ...                             libcapstone: [ on  ]
>> ...                               llvm-perf: [ on  ]
>> ...                                    zlib: [ on  ]
>> ...                                    lzma: [ on  ]
>> ...                               get_cpuid: [ on  ]
>> ...                                     bpf: [ on  ]
>> ...                                  libaio: [ on  ]
>> ...                                 libzstd: [ on  ]
>>
>>    INSTALL libsubcmd_headers
>>    INSTALL libperf_headers
>>    INSTALL libapi_headers
>>    INSTALL libsymbol_headers
>>    INSTALL libbpf_headers
>>    INSTALL binaries
>>    INSTALL tests
>>    INSTALL libperf-jvmti.so
>>    INSTALL libexec
>>    INSTALL perf-archive
>>    INSTALL perf-iostat
>>    INSTALL perl-scripts
>>    INSTALL python-scripts
>>    INSTALL dlfilters
>>    INSTALL perf_completion-script
>>    INSTALL perf-tip
>> make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
>>   18: 'import perf' in python                                         : Ok
>> ⬢ [acme@toolbx perf-tools]$ cp arch/arm64/include/asm/cputype.h tools/arch/arm64/include/asm/cputype.h
>> ⬢ [acme@toolbx perf-tools]$ m
>> rm: cannot remove '/home/acme/libexec/perf-core/scripts/python/Perf-Trace-Util/lib/Perf/Trace/__pycache__/Core.cpython-313.pyc': Permission denied
>> make: Entering directory '/home/acme/git/perf-tools/tools/perf'
>>    BUILD:   Doing 'make -j32' parallel build
>> Warning: Kernel ABI header differences:
>>    diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
>>
>> Auto-detecting system features:
>> ...                                   libdw: [ on  ]
>> ...                                   glibc: [ on  ]
>> ...                                  libelf: [ on  ]
>> ...                                 libnuma: [ on  ]
>> ...                  numa_num_possible_cpus: [ on  ]
>> ...                                 libperl: [ on  ]
>> ...                               libpython: [ on  ]
>> ...                               libcrypto: [ on  ]
>> ...                             libcapstone: [ on  ]
>> ...                               llvm-perf: [ on  ]
>> ...                                    zlib: [ on  ]
>> ...                                    lzma: [ on  ]
>> ...                               get_cpuid: [ on  ]
>> ...                                     bpf: [ on  ]
>> ...                                  libaio: [ on  ]
>> ...                                 libzstd: [ on  ]
>>
>>    INSTALL libsubcmd_headers
>>    INSTALL libperf_headers
>>    INSTALL libapi_headers
>>    INSTALL libsymbol_headers
>>    INSTALL libbpf_headers
>>    CC      /tmp/build/perf-tools/util/arm-spe.o
>> util/arm-spe.c: In function ‘arm_spe__synth_ds’:
>> util/arm-spe.c:885:43: error: passing argument 1 of ‘is_midr_in_range_list’ makes pointer from integer without a cast [-Wint-conversion]
>>    885 |                 if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
>>        |                                           ^~~~
>>        |                                           |
>>        |                                           u64 {aka long unsigned int}
>> In file included from util/arm-spe.c:37:
>> util/../../arch/arm64/include/asm/cputype.h:306:53: note: expected ‘const struct midr_range *’ but argument is of type ‘u64’ {aka ‘long unsigned int’}
>>    306 | bool is_midr_in_range_list(struct midr_range const *ranges);
>>        |                            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
>> util/arm-spe.c:885:21: error: too many arguments to function ‘is_midr_in_range_list’; expected 1, have 2
>>    885 |                 if (is_midr_in_range_list(midr, data_source_handles[i].midr_ranges)) {
>>        |                     ^~~~~~~~~~~~~~~~~~~~~       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> util/../../arch/arm64/include/asm/cputype.h:306:6: note: declared here
>>    306 | bool is_midr_in_range_list(struct midr_range const *ranges);
>>        |      ^~~~~~~~~~~~~~~~~~~~~
>> make[4]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:85: /tmp/build/perf-tools/util/arm-spe.o] Error 1
>> make[3]: *** [/home/acme/git/perf-tools/tools/build/Makefile.build:142: util] Error 2
>> make[2]: *** [Makefile.perf:798: /tmp/build/perf-tools/perf-util-in.o] Error 2
>> make[1]: *** [Makefile.perf:290: sub-make] Error 2
>> make: *** [Makefile:119: install-bin] Error 2
>> make: Leaving directory '/home/acme/git/perf-tools/tools/perf'
>> ⬢ [acme@toolbx perf-tools]$
>>
>>
> 
> The changes should be introduced by arm64's errata management on live migration[1], specifically:
> - commit e3121298c7fc ("arm64: Modify _midr_range() functions to read MIDR/REVIDR internally")
>    which changed the implementation of is_midr_in_range() that the MIDR to
>    test is always read on the current CPU. This isn't true in perf since
>    the MIDR is acquired from the perf.data.
> - commit c8c2647e69be ("arm64: Make  _midr_in_range_list() an exported function")
>    which moves the implementation out of the header file.
> 
> Below patch should keep the copy coherency of cputype.h to implement the _midr_in_range_list()
> as before.
> 
> [1] https://lore.kernel.org/all/20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com/
> 
> Thanks.
> 
>  From 44900e7d3d9fa34c817396275f55a2aab611cd32 Mon Sep 17 00:00:00 2001
> From: Yicong Yang <yangyicong@hisilicon.com>
> Date: Mon, 16 Jun 2025 15:18:11 +0800
> Subject: [PATCH] arm64: cputype: Allow copy coherency on cputype.h between
>   tools/ and arch/
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
> arch/arm64/include/asm/cputype.h is copied from arch/arm64 and used
> by perf to parsing vendor specific SPE packets according to the MIDR.
> The header diverge after errata management handling for VM live
> migration merged [1]:
> - commit e3121298c7fc ("arm64: Modify _midr_range() functions to read MIDR/REVIDR internally")
>    which changed the implementation of is_midr_in_range() that the MIDR to
>    test is always read on the current CPU. This isn't true in perf since
>    the MIDR is acquired from the perf.data.
> - commit c8c2647e69be ("arm64: Make  _midr_in_range_list() an exported function")
>    which moves the implementation out of the header file.
> 
> In order to allow copy coherency on cputype.h [2], implement
> is_midr_in_range_list() as before [1]. Introduce is_cpuid_in_range_list()
> for kernel space to test the MIDR of current running CPU is within the
> target MIDR ranges. Move cpu_errata_set_target_impl() and
> is_cpuid_in_range_list() to cpufeature.h since they're only used by
> errata management in the kernel space and don't needed by tools/.
> 
> No funtional changes intended.
> 
> [1] https://lore.kernel.org/all/20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com/
> [2] https://lore.kernel.org/lkml/aEyGg98z-MkcClXY@x1/#t
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   arch/arm64/include/asm/cpufeature.h           | 11 +++++
>   arch/arm64/include/asm/cputype.h              | 40 +++++++++++--------
>   arch/arm64/kernel/cpu_errata.c                | 30 +++++---------
>   arch/arm64/kernel/cpufeature.c                |  6 +--
>   arch/arm64/kernel/proton-pack.c               | 20 +++++-----
>   arch/arm64/kvm/vgic/vgic-v3.c                 |  2 +-
>   drivers/clocksource/arm_arch_timer.c          |  2 +-
>   .../coresight/coresight-etm4x-core.c          |  2 +-
>   8 files changed, 60 insertions(+), 53 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index c4326f1cb917..ba2d474fb393 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -1048,6 +1048,17 @@ static inline bool cpu_has_lpa2(void)
>   #endif
>   }
> 
> +struct target_impl_cpu {
> +	u64 midr;
> +	u64 revidr;
> +	u64 aidr;
> +};
> +
> +bool cpu_errata_set_target_impl(u64 num, void *impl_cpus);
> +
> +/* Different from is_midr_in_range() on using the MIDR of current CPU */
> +bool is_cpuid_in_range_list(struct midr_range const *ranges);
> +
>   #endif /* __ASSEMBLY__ */
> 
>   #endif
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index 661735616787..89fd197e2f03 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -251,16 +251,6 @@
> 
>   #define read_cpuid(reg)			read_sysreg_s(SYS_ ## reg)
> 
> -/*
> - * The CPU ID never changes at run time, so we might as well tell the
> - * compiler that it's constant.  Use this function to read the CPU ID
> - * rather than directly reading processor_id or read_cpuid() directly.
> - */
> -static inline u32 __attribute_const__ read_cpuid_id(void)
> -{
> -	return read_cpuid(MIDR_EL1);
> -}
> -
>   /*
>    * Represent a range of MIDR values for a given CPU model and a
>    * range of variant/revision values.
> @@ -296,14 +286,30 @@ static inline bool midr_is_cpu_model_range(u32 midr, u32 model, u32 rv_min,
>   	return _model == model && rv >= rv_min && rv <= rv_max;
>   }
> 
> -struct target_impl_cpu {
> -	u64 midr;
> -	u64 revidr;
> -	u64 aidr;
> -};
> +static inline bool is_midr_in_range(u32 midr, struct midr_range const *range)
> +{
> +	return midr_is_cpu_model_range(midr, range->model,
> +				       range->rv_min, range->rv_max);
> +}
> 
> -bool cpu_errata_set_target_impl(u64 num, void *impl_cpus);
> -bool is_midr_in_range_list(struct midr_range const *ranges);
> +static inline bool
> +is_midr_in_range_list(u32 midr, struct midr_range const *ranges)
> +{
> +	while (ranges->model)
> +		if (is_midr_in_range(midr, ranges++))
> +			return true;
> +	return false;
> +}
> +
> +/*
> + * The CPU ID never changes at run time, so we might as well tell the
> + * compiler that it's constant.  Use this function to read the CPU ID
> + * rather than directly reading processor_id or read_cpuid() directly.
> + */
> +static inline u32 __attribute_const__ read_cpuid_id(void)
> +{
> +	return read_cpuid(MIDR_EL1);
> +}
> 
>   static inline u64 __attribute_const__ read_cpuid_mpidr(void)
>   {
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 59d723c9ab8f..531ae67c7086 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -27,38 +27,28 @@ bool cpu_errata_set_target_impl(u64 num, void *impl_cpus)
>   	return true;
>   }
> 
> -static inline bool is_midr_in_range(struct midr_range const *range)
> +bool is_cpuid_in_range_list(struct midr_range const *ranges)
>   {
> +	u32 midr = read_cpuid_id();
>   	int i;
> 
>   	if (!target_impl_cpu_num)
> -		return midr_is_cpu_model_range(read_cpuid_id(), range->model,
> -					       range->rv_min, range->rv_max);
> +		return is_midr_in_range_list(midr, ranges);
> 
> -	for (i = 0; i < target_impl_cpu_num; i++) {
> -		if (midr_is_cpu_model_range(target_impl_cpus[i].midr,
> -					    range->model,
> -					    range->rv_min, range->rv_max))
> +	for (i = 0; i < target_impl_cpu_num; i++)
> +		if (is_midr_in_range_list(midr, ranges))
>   			return true;
> -	}
> -	return false;
> -}
> 
> -bool is_midr_in_range_list(struct midr_range const *ranges)
> -{
> -	while (ranges->model)
> -		if (is_midr_in_range(ranges++))
> -			return true;
>   	return false;
>   }
> -EXPORT_SYMBOL_GPL(is_midr_in_range_list);
> +EXPORT_SYMBOL_GPL(is_cpuid_in_range_list);
> 
>   static bool __maybe_unused
>   __is_affected_midr_range(const struct arm64_cpu_capabilities *entry,
>   			 u32 midr, u32 revidr)
>   {
>   	const struct arm64_midr_revidr *fix;
> -	if (!is_midr_in_range(&entry->midr_range))
> +	if (!is_midr_in_range(midr, &entry->midr_range))
>   		return false;
> 
>   	midr &= MIDR_REVISION_MASK | MIDR_VARIANT_MASK;
> @@ -92,7 +82,7 @@ is_affected_midr_range_list(const struct arm64_cpu_capabilities *entry,
>   			    int scope)
>   {
>   	WARN_ON(scope != SCOPE_LOCAL_CPU || preemptible());
> -	return is_midr_in_range_list(entry->midr_range_list);
> +	return is_cpuid_in_range_list(entry->midr_range_list);

Looks ok to me.

You could do it with slightly less churn on the kernel side if you keep 
the function name and arguments the same there. There's only one usage 
in Perf so that one could be renamed and have the midr argument added 
back in.

I was also wondering if we could just diverge on the tools side, but in 
reality it also has to stay compatible with the definitions of all the 
MIDRs so might as well keep the whole thing identical.

