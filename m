Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD382C325C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774210; cv=none; b=XrpzU2c4GVY/tXg0CpvgXJww9AVdsM+cbckaPE1QOZkUBgECHznNNdZusQH+RQdYgg3Zlt+C1kT0Zla6pdB8+1cAG4wYrIrrHvDG8X9mrxlqL+wk/+ptJEDsh7aFEEuZDNZEkpPmoULy9vvHfT0hEI1COklSZ0Oli9KFMTeqEKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774210; c=relaxed/simple;
	bh=qj/CWqHLyhMEEnGdAVi2FKgDX7NQhEFCDAoqdAeRp2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7IlbxcRN1b7PuuOB1Zq640D2bjNJf6IMntBZqnmvqiBWs+qdFti3bShMQlXIiRKnyr5cSGnBBNi9PsrThbqY/BXFOp0VbVNzzzvo20k7Y+vKkqFkUSLfUsGUCt7DnFOlIUhvKfeOUuN0DdqHbVj1Qi21r1fpIn1W3YZ6iHD4a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Xi27Plsy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Xi27Plsy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450dd065828so4658655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750774207; x=1751379007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MQ7CvyZIlkZs87gjY0NM1qz59baVwPwR/W8k37uo164=;
        b=Xi27PlsyZzSlZ1Hm5UeBtd4XfHF2eUXlrtvOhE/GTof2j8pvV7qU+ulra0manN8uhx
         SxgEXA1rUtksBTYFws/XJZxJ77ccb0I5fFvOxi7DJLciG6036XIpeYiO0FoSc3W04W6j
         BgXwyal62Tkb2ouuNDFpJAh2omVWlBw2iLk/7qa/fna46KUZm1t5l0UqvUsPuSL2Gzrf
         ltiTPj4uRrkL3DABeWm7whb2Sztia4kDmPPZwj6/sbnQbv6cU/2qcJ4QXoRz/Qc/fC5R
         QgzEfVymKOklYE1rPbn9ynPS7g7Xg6ID6NnCLAuC7oM7q69Wei256jJuOe6Ugr5OEZMB
         UUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774207; x=1751379007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ7CvyZIlkZs87gjY0NM1qz59baVwPwR/W8k37uo164=;
        b=ksjV7/9ejL7yMybsIpzVgdCwmgDPACFBcxv+KW3iNRYkdp4fFQcBMiMXBMKPtMfQ1t
         3URs9yDaHsSGvx2GA4JvaM+Anyja8l5JIcbQTkdFPLmbqMNSTDVHc5k71Gje43vK/MUT
         i5ZRs5Cz/CrtRGNm7CUOJgjfjm9eP2cKRV0lrAWkn5I9puSDPy6MLvVu5pvzJOJO9p8K
         d36+ycvPrZT3qcudexCeBJlWLf2TSp7JqqfiNPvZE83blrgunQ+64xpNc+goUue81IGO
         WmdbU1W2z8kgl+r7XyjV9bNGDQ7oEC1pBOZunI1ax+S7FSyO/Sa6WVxhpxhuXOWcn7hu
         nJtw==
X-Forwarded-Encrypted: i=1; AJvYcCUywJRBQFDNgZzS3zJ/Xh+FEPa+BOdPa/aE4Z2emCntG75IZ15HLFdwr+zFtVhZrkHRt8ZZpad8vAID0fM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2LanadoYGr1WOEePz/cX6cQbCfqnNaQOAdpmeml31N9AnQgCj
	DEke9Puh9ZiJqFrU+xZTMmJ5VWdxExl11jKJO+nUcJjNm4XHl60gK1JaB6dQTerY2Ho=
X-Gm-Gg: ASbGncsFuHbN+aDmw3dXDwUvcS9ICh17+KpadwA9QMFOCyjqoSiPXJnSAr5OCtSxCx7
	GS3ePPZg5uPID8H84Rn2EjAiFjkHu4nT/CPzTCJ0/BL8QKYiF/OuiTG50ZaXtYDWiKifj94JLYN
	yXajBQ6aKibMlRUufdViDwX739hOS+5+hcTM9E6PZznD5bO5mgjExAW+nIfzprBmuLHIG22z/hU
	DL+GfpcXiCBEQSIsZAKqn0UvGVlMRyYiNLY3hCvVWi0uAzmjCtMUx0WxN03pu8jx0s3zJAMOGWK
	x/lScKH80sdlgKfb4/KJTl+FHDk+gEeZMsFE/iUVrywIB0Kgmg==
X-Google-Smtp-Source: AGHT+IEJeX4diRkZ29kEnrmPsfhU9TcNr2AZ9X1Thlmc1YkCR6UEhFhLrNxHaOV0+h9u10fRDQFJlw==
X-Received: by 2002:a05:600c:3b24:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-453653cf416mr150568745e9.5.1750774206936;
        Tue, 24 Jun 2025 07:10:06 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e81106b8sm2090841f8f.91.2025.06.24.07.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:10:05 -0700 (PDT)
Date: Tue, 24 Jun 2025 16:10:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Add common supported test
 cases
Message-ID: <20250624-d7b4b9ba702fcaf2f42695b1@orel>
References: <cover.1749810735.git.zhouquan@iscas.ac.cn>
 <7e8f1272337e8d03851fd3bb7f6fc739e604309e.1749810736.git.zhouquan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e8f1272337e8d03851fd3bb7f6fc739e604309e.1749810736.git.zhouquan@iscas.ac.cn>

On Fri, Jun 13, 2025 at 07:30:13PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Some common KVM test cases are supported on riscv now as following:
> 
>     access_tracking_perf_test
>     demand_paging_test
>     dirty_log_perf_test
>     dirty_log_test
>     guest_print_test
>     kvm_binary_stats_test
>     kvm_create_max_vcpus
>     kvm_page_table_test
>     memslot_modification_stress_test
>     memslot_perf_test
>     rseq_test
>     set_memory_region_test

Half this list is already build for riscv since they're common. See
TEST_GEN_PROGS_COMMON. If the other half can be built and run then
please send a separate patch, not something tacked onto this series,
since they're all unrelated to the series.

> 
> Add missing headers for tests and fix RISCV_FENCE redefinition
> in `rseq-riscv.h` by using the existing macro from <asm/fence.h>.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/testing/selftests/kvm/Makefile.kvm             | 12 ++++++++++++
>  .../testing/selftests/kvm/include/riscv/processor.h  |  2 ++
>  tools/testing/selftests/rseq/rseq-riscv.h            |  3 +--
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 38b95998e1e6..565e191e99c8 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -197,6 +197,18 @@ TEST_GEN_PROGS_riscv += arch_timer
>  TEST_GEN_PROGS_riscv += coalesced_io_test
>  TEST_GEN_PROGS_riscv += get-reg-list
>  TEST_GEN_PROGS_riscv += steal_time
> +TEST_GEN_PROGS_riscv += access_tracking_perf_test
> +TEST_GEN_PROGS_riscv += demand_paging_test
> +TEST_GEN_PROGS_riscv += dirty_log_perf_test
> +TEST_GEN_PROGS_riscv += dirty_log_test
> +TEST_GEN_PROGS_riscv += guest_print_test
> +TEST_GEN_PROGS_riscv += kvm_binary_stats_test
> +TEST_GEN_PROGS_riscv += kvm_create_max_vcpus
> +TEST_GEN_PROGS_riscv += kvm_page_table_test
> +TEST_GEN_PROGS_riscv += memslot_modification_stress_test
> +TEST_GEN_PROGS_riscv += memslot_perf_test
> +TEST_GEN_PROGS_riscv += rseq_test
> +TEST_GEN_PROGS_riscv += set_memory_region_test
>  
>  TEST_GEN_PROGS_loongarch += coalesced_io_test
>  TEST_GEN_PROGS_loongarch += demand_paging_test
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 162f303d9daa..4cf5ae11760f 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -9,7 +9,9 @@
>  
>  #include <linux/stringify.h>
>  #include <asm/csr.h>
> +#include <asm/vdso/processor.h>
>  #include "kvm_util.h"
> +#include "ucall_common.h"

These should be included directly from the tests that need them.

>  
>  #define INSN_OPCODE_MASK	0x007c
>  #define INSN_OPCODE_SHIFT	2
> diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
> index 67d544aaa9a3..06c840e81c8b 100644
> --- a/tools/testing/selftests/rseq/rseq-riscv.h
> +++ b/tools/testing/selftests/rseq/rseq-riscv.h
> @@ -8,6 +8,7 @@
>   * exception when executed in all modes.
>   */
>  #include <endian.h>
> +#include <asm/fence.h>
>  
>  #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
>  #define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
> @@ -24,8 +25,6 @@
>  #define REG_L	__REG_SEL("ld ", "lw ")
>  #define REG_S	__REG_SEL("sd ", "sw ")
>  
> -#define RISCV_FENCE(p, s) \
> -	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
>  #define rseq_smp_mb()	RISCV_FENCE(rw, rw)
>  #define rseq_smp_rmb()	RISCV_FENCE(r, r)
>  #define rseq_smp_wmb()	RISCV_FENCE(w, w)
> -- 
> 2.34.1

tools/testing/selftests/rseq isn't under KVM's purview, so this should be
a separate patch CC'ing the appropriate people and lists.

Thanks,
drew
