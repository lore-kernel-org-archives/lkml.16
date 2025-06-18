Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1353B2E8E0A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257859; cv=none; b=ijwpvbyf/i4VgTBVJq8F1KbMPVUtqn6YW3riFE+3+Yrmf/UdO2u4pAcNlA6gP3Jipz7VA61OWTiPADsYmTTgIOyk9VgILzztXf71jNQTmROo7e4TcPxwD+nrk00STP37XsmBwpFnjakf769oWhq4OYi+OLCb90HLYZ1jtH31rKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257859; c=relaxed/simple;
	bh=qx0sdTwlL1JYZvGGiTxucxdX+oO1ASmMYNh7nvFE5yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTi71BLK1Yncc2wC40o/qHHZPilSBt0y3F2oytekgOuCrQWWD6vLIAIrVzkstgG9lNr8eeRRjIO0BbphmSZNspydQo0RV3D/btnpnTdM5nUScvHS0jaaEp7kxnIjd5m+7Q7t/9EiEFQCvejj1hmRyMcD9Fxi435EPv+y18jf8NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6A1514BF;
	Wed, 18 Jun 2025 07:43:55 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E88D53F66E;
	Wed, 18 Jun 2025 07:44:15 -0700 (PDT)
Date: Wed, 18 Jun 2025 15:44:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	yangyicong@hisilicon.com, James Clark <james.clark@linaro.org>,
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
Message-ID: <20250618144414.GF794930@e132581.arm.com>
References: <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com>
 <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
 <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
 <20250618112440.GC794930@e132581.arm.com>
 <aFK72GUlT-EStfU2@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFK72GUlT-EStfU2@x1>

On Wed, Jun 18, 2025 at 10:15:04AM -0300, Arnaldo Carvalho de Melo wrote:

[...]

> > @Arnaldo, as Mark suggested, do you want me to send a patch to remove
> > cputype.h checking in check-headers.sh or it is fine to keep the warning
> > until finish the header refactoring?
> 
> It is ok to have the warning, its just this one at this point and it is
> serving its purpose.
> 
> When the refactoring gets done, it will go away. Think of it as a
> reminder :-)

Fair point. Thanks for confirmation!
