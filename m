Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663EF230D0E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079261; cv=none; b=ZN/aw+cSLuTmqq4b8Z+ggGwtCCoOW91bhMhMZgLdvF597IbVmOX/6/eFDqEYBZYTyWc5ZydcG8u8SZLZ0PzB/UaiyqpAvqRK7hqQuWAaosgxhSPEk5Y4+pB+vnPHaejK5DwiHq2YK3Sna8fllN3xzM4810vHUoxTT1hUYICtcJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079261; c=relaxed/simple;
	bh=i4lHa4SO8/jpJE7I03bTO13DTbPQGl88LszrhqcRpH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfdgugV7qkWTc+1ps4zDMXIiL8O0mHArFBhPBdy6Dt4BswJPtan6zwEKS6t3s2XNNwmMINCEjuYH8ezZ2c87wWEqruusKmpfWyDtdP2AU/OtVymSNMp7fmhZ1Zj0eyup+q94SNNGUuVvE0j0PU4/KGh6jH0wgqUWgk9nr41yO48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05463168F;
	Mon, 16 Jun 2025 06:07:17 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 273733F673;
	Mon, 16 Jun 2025 06:07:38 -0700 (PDT)
Date: Mon, 16 Jun 2025 14:07:36 +0100
From: Leo Yan <leo.yan@arm.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: James Clark <james.clark@linaro.org>,
	yangyicong <yangyicong@huawei.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ali Saidi <alisaidi@amazon.com>, Leo Yan <leo.yan@linaro.org>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	yangjinqian <yangjinqian1@huawei.com>,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
Message-ID: <20250616130736.GA788469@e132581.arm.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>

On Mon, Jun 16, 2025 at 09:54:43AM +0000, Shameerali Kolothum Thodi wrote:

[...]

> > > -bool is_midr_in_range_list(struct midr_range const *ranges) -{
> > > -	while (ranges->model)
> > > -		if (is_midr_in_range(ranges++))
> > > -			return true;
> > >   	return false;
> > >   }

> > Looks ok to me.
> > 
> > You could do it with slightly less churn on the kernel side if you keep the
> > function name and arguments the same there. There's only one usage in
> > Perf so that one could be renamed and have the midr argument added back
> > in.
> 
> +1.
> 
> Can we use a separate one for perf here, something like below(untested)?

Thanks for working on this. Agreed.

> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -842,6 +842,18 @@ static void arm_spe__synth_memory_level(const
> struct arm_spe_record *record,
>                 data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
>  }
> 
> +static bool is_perf_midr_in_range_list(u32 midr, struct midr_range
> const *ranges)
> +{
> +       while (ranges->model) {
> +               if (midr_is_cpu_model_range(midr, ranges->model,
> +                                           ranges->rv_min, ranges->rv_max)) {
> +                       return true;
> +               }
> +               ranges++;
> +       }
> +       return false;
> +}

Maybe we can make it more general. For example, move this function into
a common header such as tools/perf/arch/arm64/include/cputype.h. Then,
util/arm-spe.c can include this header.

Thanks,
Leo
