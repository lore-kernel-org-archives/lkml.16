Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80554226161
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557039; cv=none; b=ePORwLVCOQ/vXvQXI05dev3ljyKgiRtzcsHKgrXOUlNO+pkkg386Ub9kQQZnwJHviQOGygbrwgQM+WJG1KxXfFslaS5EFPalBUW9eS7POEP7nA5f3qaQ3ZCWsSNiE1cEsgH1Oxrj2zuu6NLt8j5QuY9dAvxUA8yV0vwGu8InCbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557039; c=relaxed/simple;
	bh=6vfL8eHPLLPHKmUNbHGcD2zcB+Vk2/ZQs6Kq8DjnMIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5UzVl8Et5fnnZWLTUxU+u3S/wYLhMfFEKbtUMsedjpP84F1UbseJ+BHFZxcwz/KEluhCIQKGxUg0BPkK82WohTN1l9AMy/sM5iY96ZQC5b/9u098DRFniqyQE13a3Bzc8BsdavHwRZ5womLWSo+eLUOyWlv5BTgRRekJDuiiBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92B3014BF;
	Tue, 10 Jun 2025 05:03:37 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D1B13F673;
	Tue, 10 Jun 2025 05:03:56 -0700 (PDT)
Date: Tue, 10 Jun 2025 13:03:51 +0100
From: Leo Yan <leo.yan@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
Message-ID: <20250610120351.GQ8020@e132581.arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
 <b30fc361-a04f-4a48-b8e2-f7c2da213e6c@arm.com>
 <20250609171413.GO8020@e132581.arm.com>
 <b20a6309-ae31-496d-a1ad-61ea358ad7a9@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b20a6309-ae31-496d-a1ad-61ea358ad7a9@arm.com>

On Tue, Jun 10, 2025 at 04:09:32PM +0530, Anshuman Khandual wrote:
> 
> 
> On 09/06/25 10:44 PM, Leo Yan wrote:
> > On Mon, Jun 09, 2025 at 05:58:34PM +0100, Suzuki Kuruppassery Poulose wrote:
> > 
> > [...]
> > 
> >>>   static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> >>>   {
> >>> -	struct clk *pclk;
> >>> +	struct clk *pclk = NULL;
> >>> -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> >>> -	if (IS_ERR(pclk))
> >>> -		pclk = devm_clk_get_enabled(dev, "apb");
> >>> +	if (!dev_is_amba(dev)) {
> >>> +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> >>> +		if (IS_ERR(pclk))
> >>> +			pclk = devm_clk_get_enabled(dev, "apb");
> >>
> >> AMBA driver doesn't handle "apb" clock ? So we may need to retain that here
> >> ?
> > 
> > Here checks the condition "if (!dev_is_amba(dev))", it means the device
> > is not an AMBA device (e.g., a platform device), the APB clock is
> > enabled at here.
> 
> Just exit early for AMBA devices when 'pclk' clock is still NULL ?
> 
> 	if (dev_is_amba(dev))
> 		return pclk;

If it is an AMBA device, we should return a NULL pointer, as this
indicates that the APB clock is not managed by the CoreSight driver.

In this patch, I did not perform any refactoring and simply made a
straightforward changed.  The refactoring is done in the patch 07, as
you suggested, where the function is refined as:

    if (dev_is_amba(dev)) {
        return NULL;
    } else {
        pclk = devm_clk_get_enabled(dev, "apb_pclk");
        ...
    }

Would it be acceptable to keep this patch as it is?

Thanks,
Leo
