Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BCF8615A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750090096; cv=none; b=sDadcN6QgZ+XPA+hjdi17/QGKOupZjUxWVqThlMbz/9d/dyySKrrbUmOul9lZwqr3e1f54XLtBpgZRrXJjajOpGSOCI+kPQ+PSj4h0Tj6fVo2nJQuoWyyCDnHQ0UaFNLJDSv86hf7GsriroYSt7mY28CIdK193sCRdqSGy1R9XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750090096; c=relaxed/simple;
	bh=nVULoYO6Vqsb9LSRiR3T/PI42YG97CzMGnwBwIWNtt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQZNOqiEhDg4epMKz57HSs90moXU3l6BEeRYRQOqcnrHgZZhYf29MDKAiMczgH6unucF1q14IXhYDdzkKQ6pELlrenYFLl6Jp1eziGmFi57MssKzY3H/TuePhvwwsK41Y24uClGewHzXU0lMn6uQHKF0zkYsjQIPAhq73zxGSGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 606641515;
	Mon, 16 Jun 2025 09:07:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 593B23F673;
	Mon, 16 Jun 2025 09:08:13 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:08:11 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	yangyicong@hisilicon.com, James Clark <james.clark@linaro.org>,
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
Message-ID: <20250616160811.GA794930@e132581.arm.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>

On Mon, Jun 16, 2025 at 11:04:08PM +0800, Yicong Yang wrote:

[...]

> >> +static bool is_perf_midr_in_range_list(u32 midr, struct midr_range
> >> const *ranges)
> >> +{
> >> +       while (ranges->model) {
> >> +               if (midr_is_cpu_model_range(midr, ranges->model,
> >> +                                           ranges->rv_min, ranges->rv_max)) {
> >> +                       return true;
> >> +               }
> >> +               ranges++;
> >> +       }
> >> +       return false;
> >> +}
> > 
> > Maybe we can make it more general. For example, move this function into
> > a common header such as tools/perf/arch/arm64/include/cputype.h. Then,
> > util/arm-spe.c can include this header.
> > 
> 
> ok this sounds just like as before except rename the midr check function and modify the
> users in perf. will do in below steps:
> - move cpu_errata_set_target_impl()/is_midr_in_range_list() out of cputype.h
>   since they're only used in the kernel with errata information
> - introduce is_target_midr_in_range_list() in cputype.h to test certain MIDR
>   is within the ranges. (is_perf_midr_in_range_list() only make sense in
>   userspace and is a bit strange to me in a kernel header). maybe reimplement
>   is_midr_in_range_list() with is_target_midr_in_range_list() otherwise there's
>   no users in kernel
> - copy cputype.h to userspace and make users use new is_target_midr_in_range_list()
> 
> this will avoid touching the kernel too much and userspace don't need to implement
> a separate function.

My understanding is we don't need to touch anything in kernel side, we
simply add a wrapper in perf tool to call midr_is_cpu_model_range().

When introduce is_target_midr_in_range_list() in kernel's cputype.h,
if no consumers in kernel use it and only useful for perf tool, then
it is unlikely to be accepted.

Thanks,
Leo
