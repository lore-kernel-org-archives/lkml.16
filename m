Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AED327CCE7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324992; cv=none; b=TRnkI02oFpxH++RZpsDY30WUBWNsepU0xj8QsdPZtbY/D6hWBAsXxgBSqi5HShDNjq+sj7ePexn+2GxTuy6ktt0GGPtqA4Wyei+7kiKCZnBfHEoog7acEPX6K22Nqv/7Psby2HopbKS4zUWmkJvlr9YW4RcuCKSk/y7bxdeSnGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324992; c=relaxed/simple;
	bh=2Ikwd1cfW3b8/rhEFyBuu63at+vaOv44zblArB1cgkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoxrVTjVL+kpGXFOUMwAHD1igek1nfsKgvZsKp9RubqUhtnnDs7IbpsRhynCifgerBTMgCG0GFd7tPGSxOa5kC56CnkwGvLrX/HsVwAl5ERTvqhA4mT//89cyswDZl3OphIemMPQE2nAQgJ14WrveFMFanViXfPbRzF4Gu2nTVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AA8E152B;
	Tue, 22 Apr 2025 05:29:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAB443F66E;
	Tue, 22 Apr 2025 05:29:48 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:29:46 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v1 6/9] coresight: Disable trace bus clock properly
Message-ID: <20250422122946.GF28953@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-7-leo.yan@arm.com>
 <89aa249c-ac1d-40e3-8518-1b5a545b28c7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89aa249c-ac1d-40e3-8518-1b5a545b28c7@arm.com>

On Thu, Apr 03, 2025 at 12:55:46PM +0530, Anshuman Khandual wrote:
> 
> On 3/27/25 17:08, Leo Yan wrote:
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
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> 
> This patch probably should be positioned right after [PATCH 4/9] which
> replaces pclk clock init with devm_clk_get_enabled().

Sure.  Will reorder patches for this.

Thanks,
Leo
