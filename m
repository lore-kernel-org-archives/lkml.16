Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B89B1401C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487404; cv=none; b=UkMdDKDv7aG7Hmv+dy5CKyBmD8tWjPOTM1ABWW4epAmulxeEalgLwpEtgpwe4bVOcTaTFE/aRNWBmqtLW9ob0lTuerO9gQnAr7/xXl+RytSjuE0tmnI0N9zCwL4vYGqr0fsKHtA2vjrVzClt9y/dq/kmDlTvP13G74QCgfHJK9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487404; c=relaxed/simple;
	bh=LP1eKURwx/hbR16rl3c25bV2lUVOv/q6/vb+tFLVCuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g30aqDm0QRr4NvrtfmcsYvdOlV0OMMOkVNPIwQV6rKJyc5dWczWSa7mayc/IFBcgvCvys2IHZZPdhS8ONG1pUsF4DnuNh/ZuA4NDum97RPSSKz8l+oZVnj6qgkZDvYtJs3YovVSXkHzcs+iePiL+SLbDuq+iV4B4Tq/GPcjiiyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAD181515;
	Mon,  9 Jun 2025 09:43:03 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FA973F673;
	Mon,  9 Jun 2025 09:43:22 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:43:20 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/9] coresight: Appropriately disable trace bus clocks
Message-ID: <20250609164320.GM8020@e132581.arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-5-423b3f1f241d@arm.com>
 <89f9fede-3a0f-4ed6-a42d-43827f7a4fca@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89f9fede-3a0f-4ed6-a42d-43827f7a4fca@arm.com>

On Mon, Jun 09, 2025 at 05:14:09PM +0100, Suzuki Kuruppassery Poulose wrote:
> On 09/06/2025 17:00, Leo Yan wrote:
> > Some CoreSight components have trace bus clocks 'atclk' and are enabled
> > using clk_prepare_enable().  These clocks are not disabled when modules
> > exit.
> > 
> > As atclk is optional, use devm_clk_get_optional_enabled() to manage it.
> > The benefit is the driver model layer can automatically disable and
> > release clocks.
> > 
> > Check the returned value with IS_ERR() to detect errors but leave the
> > NULL pointer case if the clock is not found.  And remove the error
> > handling codes which are no longer needed.
> > 
> > Fixes: d1839e687773 ("coresight: etm: retrieve and handle atclk")
> > Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> Can we consolidate the ATCLK handling to the core coresight helper for
> APB clocks ?  It is an optional clock for all devices anyways ?

Yes. ATCLK is always optional.

Could you check the patch 07? It is exactly a consolidation to put ATCLK
and APB clocks into a central place.

Thanks,
Leo
