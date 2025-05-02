Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBBF79D2
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 17:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746208239; cv=none; b=rFaECoVUS8+MKifHNJYNeIyg94oJlLqhOr31ZOPVope+wdYzBWtfjf0N0VcWgwuXSQ/Lm1aOdPs6K789k29GVVqytQY/5lAQntfRShFdZxpv+z85GtDL/YyC35vcr49hP1CjJ0FhSphueRoDCLdsaxwoPQpVrAooKN73++cxAHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746208239; c=relaxed/simple;
	bh=zgfxRf6IsVzVbDKUKk4F8iC10YP/toscr/nA+vXA3hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7kWX7VhsBFtAoOI+EtnKyLvYIrJ7IXWB3/q8LAnDSXMiTxAgGEd/r90tNUCI6WbLIV7o6V0p9dmKrOfLFOIiCdtR0UXyo5m8z9c9IiCXvQKGIgd30aV8wWSY+YYLdMiTVl4AARP+MT4ZmF5uw5CfQMBfETz9/laseLhVY1+nnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E16EC4CEE4;
	Fri,  2 May 2025 17:50:34 +0000 (UTC)
Date: Fri, 2 May 2025 18:50:32 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH v3 3/4] arm64/kernel: support store-only mte tag check
Message-ID: <aBUF6JduwlhHVR9E@arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-4-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410080723.953525-4-yeoreum.yun@arm.com>

On Thu, Apr 10, 2025 at 09:07:22AM +0100, Yeoreum Yun wrote:
> Introduce new flag -- MTE_CTRL_STORE_ONLY used to set store-only tag check.
> This flag isn't overrided by prefered tcf flag setting but set together

Nit: s/overrided/overridden/

> with prefered setting of way to report tag check fault.

The preferred mode set via sysfs is about whether we want synchronous or
asynchronous tag check faults for reads/writes (or asymmetric). The
store-only checking can be combined with sync/async, so they are
slightly complementary. The question is whether one wants some global
knob to turn on store-only in combination with sync/async. We could add
more strings for sysfs like "(a)sync+storeonly"

It would be good to hear Peter's opinion from an Android perspective.

-- 
Catalin
