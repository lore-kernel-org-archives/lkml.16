Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21171BA3D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251778; cv=none; b=Nr90fgZcMKwj5WSx1rvsw07F3HUWtL+M0hR8ZVXHsnIXCQRC920GnBv46Wl8yjda/SnT7Ayo013MYVbHfcNWcDzdFezHhwgtk51u+ngM4QBTQAQ03I2XkKgP/KeuZ4IhDFxPpV42tFwPxkDUvZIpR2lB4gBjZqBrDBNuwZ1JPRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251778; c=relaxed/simple;
	bh=D2kxht+0JextLA7O/SiY0pt8oOXgrxy1p3wycyeO01A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FS8Y111KLIc1Hq/08cZ1f9WVURGUJLL2pRZWGD43EehvUa2m7EZJZG+oqcxFfR/K2v/IFcEn7UPeBY4Rx1oSgD0aSv3dnhuHsfRYwDPeT+JX8x6GzbfXnCsL5ja5sWrPlDPWtlHYVPz1U6FLMOJRozhYGXrmFdATLMLvQV1AX4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEF4614BF;
	Wed, 18 Jun 2025 06:02:35 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D72BF3F58B;
	Wed, 18 Jun 2025 06:02:55 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:02:54 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>, yangyicong@hisilicon.com,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	James Clark <james.clark@linaro.org>,
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
Message-ID: <20250618130254.GD794930@e132581.arm.com>
References: <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com>
 <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
 <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
 <20250618112440.GC794930@e132581.arm.com>
 <3dbc1f1b-a325-1525-f9f0-8172033438ec@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dbc1f1b-a325-1525-f9f0-8172033438ec@huawei.com>

On Wed, Jun 18, 2025 at 07:51:03PM +0800, Yicong Yang wrote:

[...]

> >> Directly including the kernel header introduces the very fragility that
> >> having a copy was intended to avoid. NAK to that.
> > 
> > My suggestion is not to include the kernel header, nor to modify the
> > copy header. :)
> > 
> > Instead, I suggested creating a new header within the perf tool (under
> > perf's arm64 folder) and then include the copy header in tools:
> > 
> >   tools/arch/arm64/include/asm/cputype.h
> > 
> 
> sorry for the misunderstood.:(
> in this way we still have the divergency in the long term and as a workaround
> this works same if we partly update the tools/arch/arm64/include/asm/cputype.h
> with only necessary MIDR updates and keep is_midr_in_range_list() unchanged.

Yes. So Mark's suggestion is reasonable that we can do refactoring first
to avoid syncing header.

[...]

> > @Yicong, could you confirm if you proceed to refactor the MIDR? thanks!
> 
> please feel free to take this over.

Thanks a lot for confirmation!  And thanks for working on the reported
issue.

> > Just note, I searched tools folder and found kselftest also uses the
> > cputype.h header. The refactoring should not break the files below.
> > 
> 
> they shouldn't affected. I did a kselftest build test with my latest patch
> and they were not affected.

I expect tools/arch/arm64/include/asm/cputype.h will be removed, and
a generated header (something like sys-midr.h) for MIDR refactoring.
If this is true, then we need to take care kselftest.

Thanks,
Leo
