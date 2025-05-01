Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C29711187
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746099957; cv=none; b=qFFwS/VmJ/8UQZBdoiMMoxQzl6kgARPVzmyfjblqtRsM90AuFWij3D1iGEE8JLFNhHR7yf/p0PUnEnHU2ZTRFhc3O/LUaUFPTu6a/gKOle5cNLw2197FTnDFtAryPOW6NquWwJTurwYCojYp4T+FZNulL1/HLYzk/Aw5znVnxd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746099957; c=relaxed/simple;
	bh=BfmTgZ82CbQxw9bIK6jW1e8QsSmxpGTtSs9ZvF1DfQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtXdGHUdsQDpROKxtVz7DMqa8D5BG25rFAVK27y7B3fpCWG1uoK6HPYpHoA5VpjkN3BV3DgnvqbMuXLPcVOUCkHqK7ICRJRZx3+2OroN/DHijsPnPFx6n1PdIYAMuU0I8ey7+kmf8D1LlhFBJqBoFW8Lisca4hwzHF5vAo7Kc6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DEBF106F;
	Thu,  1 May 2025 04:45:47 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C24043F5A1;
	Thu,  1 May 2025 04:45:54 -0700 (PDT)
Date: Thu, 1 May 2025 12:45:46 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: etm4x: Remove redundant claim register setting
Message-ID: <20250501114546.GL551819@e132581.arm.com>
References: <20250501104216.2375126-1-leo.yan@arm.com>
 <16bf2a1e-2a98-41b3-b780-c0215db5a6dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16bf2a1e-2a98-41b3-b780-c0215db5a6dc@linaro.org>

On Thu, May 01, 2025 at 11:54:58AM +0100, James Clark wrote:
> 
> On 01/05/2025 11:42 am, Leo Yan wrote:
> > The claim register is set twice in the restore flow; remove the
> > duplicate operation.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > index 5c20ed4cf4ed..228317991ec2 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -1958,8 +1958,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> >   	if (drvdata->numvmidc > 4)
> >   		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
> > -	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
> > -
> >   	if (!drvdata->skip_power_up)
> >   		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
> 
> Reviewed-by: James Clark <james.clark@linaro.org>
> 
> Semi-related to this patch but probably not worth fixing: There's
> technically a race condition with an external debugger here. It would be
> better to use coresight_claim_device_unlocked() and report the error that's
> returned instead of manually writing to the whole claim register without
> checking it before and after like the claim function does.

I thought again and conclude the current patch would be fine (at least
not bad ;)

The reason is the ETM driver has acquired the OS lock during idle
states, this prevents the race condition with external debuggers.

And if a CPU detects pending interrupts and abort a low power flow,
the CoreSight self claim tag is still set.  In this case,
coresight_claim_device_unlocked() will report unnecessary warnings.

Thanks,
Leo
