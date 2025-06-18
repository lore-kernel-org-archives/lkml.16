Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497C02BEC28
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245885; cv=none; b=ixyIvi4FQfr2G49Ia2Rcq44/dmgHlxqE867I53CBAf8okUl0NifE57o0tjL1Ml5ovjlpWBMpilCYaIQ4b0pCtr4XpEuCZJwfLB87BxeJS1+oY1MRU4GKmnETn//ouvtP4pdmjdYdV3ZHAP5Wd0HB5lKRoBNQF4AhrerSKejdYNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245885; c=relaxed/simple;
	bh=FdB5rUe7cZ51PwCLnW1fBm2Zr3UR9Vyfn4oG25eFAKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfzyV2K2TLOx0myEcD2EmQXMnaJMEtC5l7aUKMDooymcKKPI0eFEwh5UGMHgmEJDzt1QvFsQm8/rAvo4xt8GLus8Xdk7Ma7mazEHx7uhr+4Lkwqh9K5NfcQ1Ym6t6qpTFr/KbHrnQJV1xGsakbv6ISPWqHVZfRKgg3oXPdPnyI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC4951BC0;
	Wed, 18 Jun 2025 04:24:21 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 132823F58B;
	Wed, 18 Jun 2025 04:24:42 -0700 (PDT)
Date: Wed, 18 Jun 2025 12:24:40 +0100
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
Message-ID: <20250618112440.GC794930@e132581.arm.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com>
 <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
 <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFJ-Za6oRGKKASN1@J2N7QTR9R3>

On Wed, Jun 18, 2025 at 09:52:53AM +0100, Mark Rutland wrote:

[...]

> > > Other than that, I think that userspace should just maintain its own
> > > infrastructure, and only pull in things from kernel sources when there's
> > > a specific reason to. Otherwise we're just creating busywork.
> > 
> > I agree with the methodology.
> > 
> > Since Arnaldo is facing build failure when sync headers between kernel
> > and perf tool, to avoid long latency, let us split the refactoriing
> > into separate steps.
> > 
> > As a first step, I think my previous suggestion is valid, we can create a
> > header tools/perf/arch/arm64/include/cputype.h with below code:
> > 
> >   #include "../../../../arch/arm64/include/asm/cputype.h"
> 
> Directly including the kernel header introduces the very fragility that
> having a copy was intended to avoid. NAK to that.

My suggestion is not to include the kernel header, nor to modify the
copy header. :)

Instead, I suggested creating a new header within the perf tool (under
perf's arm64 folder) and then include the copy header in tools:

  tools/arch/arm64/include/asm/cputype.h

> I've replied to the same effect Yicong's patch [1,2].
> 
> If we want to share headers between userspace and kernel, we should
> refactor those headers such that this is safe by construction.
> 
> There is no need to update the userspace headers just because the kernel
> headers have changed, so the simple solution in the short term is to
> suppress the warning from check-headers.sh.

Sure, makes sense for me.

@Arnaldo, as Mark suggested, do you want me to send a patch to remove
cputype.h checking in check-headers.sh or it is fine to keep the warning
until finish the header refactoring?

@Yicong, could you confirm if you proceed to refactor the MIDR? thanks!

Just note, I searched tools folder and found kselftest also uses the
cputype.h header. The refactoring should not break the files below.

$ git grep cputype.h
perf/check-headers.sh:check arch/arm64/include/asm/cputype.h '-I "^#include [<\"]\(asm/\)*sysreg.h"'
perf/util/arm-spe.c:#include "../../arch/arm64/include/asm/cputype.h"
testing/selftests/kvm/arm64/psci_test.c:#include <asm/cputype.h>
testing/selftests/kvm/lib/arm64/vgic.c:#include <asm/cputype.h>

Thanks,
Leo

> [1] https://lore.kernel.org/linux-arm-kernel/dc5afc5c-060c-8bcb-c3a7-0de49a7455fb@huawei.com/T/#m23dfbea6af559f3765d89b9d8427213588871ffd
> [2] https://lore.kernel.org/linux-arm-kernel/dc5afc5c-060c-8bcb-c3a7-0de49a7455fb@huawei.com/T/#m6acbfa00002af8ee791266ea86a58f8f994ed710
> 
> Mark.
> 
> > 
> >   static bool is_perf_midr_in_range_list(u32 midr,
> >                                          struct midr_range const *ranges)
> >   {
> >           while (ranges->model) {
> >                   if (midr_is_cpu_model_range(midr, ranges->model,
> >                                   ranges->rv_min, ranges->rv_max))
> >                           return true;
> >                   ranges++;
> >           }
> > 
> >           return false;
> >   }
> > 
> > Then, once we can generate a dynamic MIDR header file, we can use that
> > header and define the midr_range structure specifically in the perf.
> > In the end, perf can avoid to include kernel's cputype.h.
> > 
> > If no objection, Yicong, do you mind preparing the patch mentioned
> > above? Thanks!
> > 
> > Leo
