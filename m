Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467AE1E8342
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467695; cv=none; b=ZekV9WHfUMQ8F4vTnHBzPL64XFz0CslRZb9tBDPhsiclETpMYxqP+TLooxJNrvzSCfS1/QX9NV2dJgFyM9UwU6xjAmScOyU6ojZilE6JbttJQI023G41prAr2Zdwa3D0IvZPskNTyOTl3CpJqNtiG6OLfbgvNz7vqAf2DS4E4oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467695; c=relaxed/simple;
	bh=9J4T6PCK6LDe9fYmDaIk4F/VysUp3DALxfb+kinou94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APKalxLQp5uMHmoF0lINq8REx0TlL8u9zOuYjnd3lgfXD8TgMBgLcn3LPcCMCLBNim1PrWdd/Va3tJjlQrnENRk9U7id0MDdI5I7EC/FRUrDT2y2+U48mpoolsaBnLKRrobm3nHOx0iaMTEKjtla5VAV7he9L4hJKSkrWa7ggRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFFCC113E;
	Mon,  9 Jun 2025 04:14:34 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F9E3F59E;
	Mon,  9 Jun 2025 04:14:53 -0700 (PDT)
Date: Mon, 9 Jun 2025 12:14:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Add ISB after TRBLIMITR write
Message-ID: <20250609111448.GI8020@e132581.arm.com>
References: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>

On Mon, Jun 09, 2025 at 11:19:05AM +0100, James Clark wrote:
> DEN0154 states that hardware will be allowed to ignore writes to TRB*
> registers while the trace buffer is enabled. Add an ISB to ensure that
> it's disabled before clearing the other registers.
> 
> This is purely defensive because it's expected that arm_trbe_disable()
> would be called before teardown which has the required ISB.
> 
> Fixes: a2b579c41fe9 ("coresight: trbe: Remove redundant disable call")
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8267dd1a2130..10f3fb401edf 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -257,6 +257,7 @@ static void trbe_drain_and_disable_local(struct trbe_cpudata *cpudata)
>  static void trbe_reset_local(struct trbe_cpudata *cpudata)
>  {
>  	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> +	isb();
>  	trbe_drain_buffer();
>  	write_sysreg_s(0, SYS_TRBPTR_EL1);
>  	write_sysreg_s(0, SYS_TRBBASER_EL1);
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250609-james-cs-trblimitr-isb-523f20d874d6
> 
> Best regards,
> -- 
> James Clark <james.clark@linaro.org>
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org
