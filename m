Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F70258CCC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236781; cv=none; b=nTfp4Z+MfyD6BHQT0ZU03SaBSeOsjSA2GOUSdA2K41H/5ihBRH1TUQqRlcZElXeCJlbxELxqH2bsjRKdefgJ8XPBjFQ8Ml74mr4bofJv7h2VNWhzw9qTI49e4zzx9UIJWhanEHEGYiZxj0CXwIv5SHmE18CwOyuVdmbRyJH1JYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236781; c=relaxed/simple;
	bh=51m481W4yyASTuZyDIG4O3vGTZwhnyUVGIu0qCaaS6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Czzd2i6zZI24vlT6fAcdjVjagWxrUQAAZ8Bcyu1VHXAhJXjwPI0yeRVsUQ6y+/Fu+xhKeoXIvfB4I2obkSuSgbMjdE6QlgUdp1mwkfM9s08PnJfbof0gmtF+P7Sq8HZGW+Yud4IBqa1WXk3Z2giEDJ7O0XAdhUTT60rMeN0T4rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B734714BF;
	Wed, 18 Jun 2025 01:52:38 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 007803F58B;
	Wed, 18 Jun 2025 01:52:55 -0700 (PDT)
Date: Wed, 18 Jun 2025 09:52:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
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
Message-ID: <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com>
 <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617141810.GB794930@e132581.arm.com>

On Tue, Jun 17, 2025 at 03:18:10PM +0100, Leo Yan wrote:
> On Mon, Jun 16, 2025 at 06:47:25PM +0100, Mark Rutland wrote:
> 
> [...]
> 
> > > > ok this sounds just like as before except rename the midr check function and modify the
> > > > users in perf. will do in below steps:
> > > > - move cpu_errata_set_target_impl()/is_midr_in_range_list() out of cputype.h
> > > >   since they're only used in the kernel with errata information
> > > > - introduce is_target_midr_in_range_list() in cputype.h to test certain MIDR
> > > >   is within the ranges. (is_perf_midr_in_range_list() only make sense in
> > > >   userspace and is a bit strange to me in a kernel header). maybe reimplement
> > > >   is_midr_in_range_list() with is_target_midr_in_range_list() otherwise there's
> > > >   no users in kernel
> > > > - copy cputype.h to userspace and make users use new is_target_midr_in_range_list()
> > > > 
> > > > this will avoid touching the kernel too much and userspace don't need to implement
> > > > a separate function.
> > > 
> > > My understanding is we don't need to touch anything in kernel side, we
> > > simply add a wrapper in perf tool to call midr_is_cpu_model_range().
> > > 
> > > When introduce is_target_midr_in_range_list() in kernel's cputype.h,
> > > if no consumers in kernel use it and only useful for perf tool, then
> > > it is unlikely to be accepted.
> > 
> > I think all of this is just working around the problem that
> > asm/cputype.h was never intended to be used in userspace. Likewise with
> > the other headers that we copy into tools/.
> > 
> > If there are bits that we *want* to share with tools/, let's factor that
> > out. The actual MIDR values are a good candidate for that -- we can
> > follow the same approach as with sysreg-defs.h.
> 
> Thanks for suggestion, Mark.
> 
> It makes sense to me for extracting MIDR and sharing between kernel and
> tools/. I have created a task for following up the refactoring.
> 
> > Other than that, I think that userspace should just maintain its own
> > infrastructure, and only pull in things from kernel sources when there's
> > a specific reason to. Otherwise we're just creating busywork.
> 
> I agree with the methodology.
> 
> Since Arnaldo is facing build failure when sync headers between kernel
> and perf tool, to avoid long latency, let us split the refactoriing
> into separate steps.
> 
> As a first step, I think my previous suggestion is valid, we can create a
> header tools/perf/arch/arm64/include/cputype.h with below code:
> 
>   #include "../../../../arch/arm64/include/asm/cputype.h"

Directly including the kernel header introduces the very fragility that
having a copy was intended to avoid. NAK to that.

I've replied to the same effect Yicong's patch [1,2].

If we want to share headers between userspace and kernel, we should
refactor those headers such that this is safe by construction.

There is no need to update the userspace headers just because the kernel
headers have changed, so the simple solution in the short term is to
suppress the warning from check-headers.sh.

[1] https://lore.kernel.org/linux-arm-kernel/dc5afc5c-060c-8bcb-c3a7-0de49a7455fb@huawei.com/T/#m23dfbea6af559f3765d89b9d8427213588871ffd
[2] https://lore.kernel.org/linux-arm-kernel/dc5afc5c-060c-8bcb-c3a7-0de49a7455fb@huawei.com/T/#m6acbfa00002af8ee791266ea86a58f8f994ed710

Mark.

> 
>   static bool is_perf_midr_in_range_list(u32 midr,
>                                          struct midr_range const *ranges)
>   {
>           while (ranges->model) {
>                   if (midr_is_cpu_model_range(midr, ranges->model,
>                                   ranges->rv_min, ranges->rv_max))
>                           return true;
>                   ranges++;
>           }
> 
>           return false;
>   }
> 
> Then, once we can generate a dynamic MIDR header file, we can use that
> header and define the midr_range structure specifically in the perf.
> In the end, perf can avoid to include kernel's cputype.h.
> 
> If no objection, Yicong, do you mind preparing the patch mentioned
> above? Thanks!
> 
> Leo
