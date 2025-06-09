Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B417A2192F5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487128; cv=none; b=jQ/EuYmqsLCqo0fbah+Ah8zlRRv7yjVnbIO0/aCVpSJ619aa1pSX1F5Jmu/70evjUQrH28VFdY6Hd002qN3jWGS29NGJdESvceLnzldAFy1vtNWGhs2QgIcze6PZgX0VCvtMurRQKAGJ36BTATrriIEDiAuR/ocLzPIoXwG72JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487128; c=relaxed/simple;
	bh=BvT3AViH8sgxWBWc9wZqoE2T12Y4nLJR+QcS7OCEIV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkKr3X+Z2Blzl6TKmGp/Jnpc+gKcjpkhYeWnapJq4SSGN2378xkt5eSutVHsrrN2tt3/xWQgkwVJcH9/o0X0EHXsm/MGy8a9rUPgho3s/u0CHgxOu8sosGvt0lTecMoPw5gVTJrVs4r+TamWw/vVjikk/e6zue90uoTpjozAaJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3931C14BF;
	Mon,  9 Jun 2025 09:38:26 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFBED3F673;
	Mon,  9 Jun 2025 09:38:44 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:38:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/9] coresight: Appropriately disable programming
 clocks
Message-ID: <20250609163840.GL8020@e132581.arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-4-423b3f1f241d@arm.com>
 <e18507cb-bcbf-4cdd-8364-9bce0ea016d5@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e18507cb-bcbf-4cdd-8364-9bce0ea016d5@arm.com>

On Mon, Jun 09, 2025 at 05:11:21PM +0100, Suzuki Kuruppassery Poulose wrote:
> On 09/06/2025 17:00, Leo Yan wrote:
> > Some CoreSight components have programming clocks (pclk) and are enabled
> > using clk_get() and clk_prepare_enable().  However, in many cases, these
> > clocks are not disabled when modules exit and only released by clk_put().
> > 
> > To fix the issue, this commit refactors coresight_get_enable_apb_pclk()
> > by replacing clk_get() and clk_prepare_enable() with
> > devm_clk_get_enabled() for enabling APB clock.  Callers are updated
> > to reuse the returned error value.
> > 
> > With the change, programming clocks are managed as resources in driver
> > model layer, allowing clock cleanup to be handled automatically.  As a
> > result, manual cleanup operations are no longer needed and are removed
> > from the Coresight drivers.
> > 
> > Fixes: 73d779a03a76 ("coresight: etm4x: Change etm4_platform_driver driver for MMIO devices")
> 
> This looks suspicious. This patch covers a lot of components, but the
> above commit is only affecting ETMv4 ?

Since commit 73d779a03a76 is the earliest patch that introduced the
issue, it has been selected as the fix tag. We assume this will cover
any subsequent changes that have the same issue.

> The patch as such looks good to me.

Thanks for review!

> Suzuki
