Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1034F2E3B14
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750169896; cv=none; b=mFGCk0c/v3nmwa5+ft49hKqjUsiHTzuEn6gM38RdQxt/5KF7SvKhUyayi0NgnpgflMm6d0vLzJBNhZLX3Rm5VLFp5B4m7Qy07gnsq53/FaY7uXH32aObNCesIthaLHzNaCJDOCvaSstg24YOjog/rQxiTnEmhq0Il234/B+czBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750169896; c=relaxed/simple;
	bh=asQ1iN27xLLjtCDv3Ppwn/ikbkJu6bhkI9I+TfYNBgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvN2olvxWUz31/H+FjLhfFyaw4hcj218FJskufQ5EQwYUI0qCsrvW702dn1giJsE/IvGeP4hKm3E8lBCHoLgWaD83ShsTPNpfJl3yh9DUdX18XOZdE/DkVcMJxkVHgFV626Pck+5zzUhJ9jED3USZz8qv01dod5l73r5em6gcJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20F3A150C;
	Tue, 17 Jun 2025 07:17:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5BF73F58B;
	Tue, 17 Jun 2025 07:18:12 -0700 (PDT)
Date: Tue, 17 Jun 2025 15:18:10 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
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
Message-ID: <20250617141810.GB794930@e132581.arm.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com>
 <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>

On Mon, Jun 16, 2025 at 06:47:25PM +0100, Mark Rutland wrote:

[...]

> > > ok this sounds just like as before except rename the midr check function and modify the
> > > users in perf. will do in below steps:
> > > - move cpu_errata_set_target_impl()/is_midr_in_range_list() out of cputype.h
> > >   since they're only used in the kernel with errata information
> > > - introduce is_target_midr_in_range_list() in cputype.h to test certain MIDR
> > >   is within the ranges. (is_perf_midr_in_range_list() only make sense in
> > >   userspace and is a bit strange to me in a kernel header). maybe reimplement
> > >   is_midr_in_range_list() with is_target_midr_in_range_list() otherwise there's
> > >   no users in kernel
> > > - copy cputype.h to userspace and make users use new is_target_midr_in_range_list()
> > > 
> > > this will avoid touching the kernel too much and userspace don't need to implement
> > > a separate function.
> > 
> > My understanding is we don't need to touch anything in kernel side, we
> > simply add a wrapper in perf tool to call midr_is_cpu_model_range().
> > 
> > When introduce is_target_midr_in_range_list() in kernel's cputype.h,
> > if no consumers in kernel use it and only useful for perf tool, then
> > it is unlikely to be accepted.
> 
> I think all of this is just working around the problem that
> asm/cputype.h was never intended to be used in userspace. Likewise with
> the other headers that we copy into tools/.
> 
> If there are bits that we *want* to share with tools/, let's factor that
> out. The actual MIDR values are a good candidate for that -- we can
> follow the same approach as with sysreg-defs.h.

Thanks for suggestion, Mark.

It makes sense to me for extracting MIDR and sharing between kernel and
tools/. I have created a task for following up the refactoring.

> Other than that, I think that userspace should just maintain its own
> infrastructure, and only pull in things from kernel sources when there's
> a specific reason to. Otherwise we're just creating busywork.

I agree with the methodology.

Since Arnaldo is facing build failure when sync headers between kernel
and perf tool, to avoid long latency, let us split the refactoriing
into separate steps.

As a first step, I think my previous suggestion is valid, we can create a
header tools/perf/arch/arm64/include/cputype.h with below code:

  #include "../../../../arch/arm64/include/asm/cputype.h"

  static bool is_perf_midr_in_range_list(u32 midr,
                                         struct midr_range const *ranges)
  {
          while (ranges->model) {
                  if (midr_is_cpu_model_range(midr, ranges->model,
                                  ranges->rv_min, ranges->rv_max))
                          return true;
                  ranges++;
          }

          return false;
  }

Then, once we can generate a dynamic MIDR header file, we can use that
header and define the midr_range structure specifically in the perf.
In the end, perf can avoid to include kernel's cputype.h.

If no objection, Yicong, do you mind preparing the patch mentioned
above? Thanks!

Leo
