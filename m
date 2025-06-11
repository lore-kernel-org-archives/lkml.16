Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D115925BEEA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639725; cv=none; b=VajXG1y52nM7rEgSXGCWVBXf27Xpa40tT0HzI7sDlRq2UQI2FqEyrviuMQz/W27r7EtzbCO0a2Ua3BnPdsdu0O/rCaWDG7NuDmK7VONpvIuKKP1dAGFuwLNl/Oim0We7iJ+iQBQHbULbLeM88GfhiaW/0w2J4fga77yw3e7lkAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639725; c=relaxed/simple;
	bh=65jF5NE3I8Fc+8S92Emr3Z+vVJ7RS5+69CCZgK+ZoFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pezI/RFMBmpwDyZEjGUJYy8ur0S8qWZ5O+vOrAaN4u8JJ/TizPKtuPImCciwP8w8Aw42A42CVEAwyTq5/AISQ9M2u5DAcHWt3QVbA/o4X+LE8VEed8pqFl0cd73txnOQPDQqAeku5xaD2NE2d/DrJoT6WuWzsvg/UXKDRnWX9qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8F272A2A;
	Wed, 11 Jun 2025 04:01:43 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7CE83F59E;
	Wed, 11 Jun 2025 04:02:02 -0700 (PDT)
Date: Wed, 11 Jun 2025 12:01:57 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] coresight: fix indentation error in
 cscfg_remove_owned_csdev_configs()
Message-ID: <20250611110157.GU8020@e132581.arm.com>
References: <20250611103025.939020-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611103025.939020-1-yeoreum.yun@arm.com>

On Wed, Jun 11, 2025 at 11:30:25AM +0100, Yeoreum Yun wrote:
> Fix wrong indentation in cscfg_remove_owned_csdev_configs()
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506102238.XQfScl5x-lkp@intel.com/
> Fixes: 53b9e2659719 ("coresight: holding cscfg_csdev_lock while removing cscfg from csdev")
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
> 
> Sorry for my bad forgetting to run checkpatch.pl...
> 
> ---
>  drivers/hwtracing/coresight/coresight-syscfg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 83dad24e0116..6836b05986e8 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -395,7 +395,7 @@ static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, voi
>  	if (list_empty(&csdev->config_csdev_list))
>  		return;
> 
> -  guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
> +	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
> 
>  	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
>  		if (config_csdev->config_desc->load_owner == load_owner)
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
> 
