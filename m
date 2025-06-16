Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58CA2820AC
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095690; cv=none; b=Aa9Mj4VuxJYAChxhvoeJKiNPan7ieYJejTbM75aeO7KK3IwgRDuhD0SqtHzeEr9GN4BIYSr2Jn4Y5XL7m+RVdhp68HaLw7pZnPy1PMCXtZ3bk1MCBTc/FDj1YsdFw/7wY7oFNY6AZwwGu0zC0m9/DVvnX1gAv6Fh9S8K/fjSY+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095690; c=relaxed/simple;
	bh=/vgjYeNTVTX6rqRmqUDB+RtaLvgr6oHZObz3FWgpgTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYux39e1UiEpz74ubO9IdvvnuVm9+SlmE6WbhppuQJRqvP5C7K7nYKcRBO6SMmI+GH1SttA9oVxtxIrElDB8hU6jdByhHKopUZz5dNHakkcPau22LYfxBWgNnx0qsQQOb+kPn9yIFcseWiYilpombfMvchWNbBSndOY0iIjijA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2927150C;
	Mon, 16 Jun 2025 10:41:04 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AC5F3F58B;
	Mon, 16 Jun 2025 10:41:23 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:41:20 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Yicong Yang <yangyicong@huawei.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ali Saidi <alisaidi@amazon.com>, Leo Yan <leo.yan@linaro.org>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
Message-ID: <aFBXQGeYCO2nJYNG@J2N7QTR9R3>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>

On Mon, Jun 16, 2025 at 10:29:48AM +0100, James Clark wrote:
> I was also wondering if we could just diverge on the tools side, but in
> reality it also has to stay compatible with the definitions of all the MIDRs
> so might as well keep the whole thing identical.

I think that'd be the best option overall.

The only thing we really care about updating periodically is the set of
MIDRs, and we can factor that out to a cputype-defs.h header, and
possibly generate that too (as with sysreg-defs.h).

Mark.
