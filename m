Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E95923AE96
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674226; cv=none; b=lCBvj1iCYN9oykei51pfKz7Th3RK/d2mqJhOEm7wRmTkCj6m4nxqV9mYA11vaUUOmLEMdW8Izr3QEMHFeR4riA1cttV7kz3/mHFznZ34rez36U3iPShxFOnqDnP9AMwRHeaOBtK5lrTn/r+ZN4nJXQlFhbmQF8IWRuvRf/yQTsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674226; c=relaxed/simple;
	bh=poG3/nNgtkjTrd/3HmFbi2XSJJGWBddePF4M9XtxFfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T5SmUcOWTKDyTmfq3Rm8EXQFLiSZbE5d2Zviod3J5gFLYkr3nv1RUnhEEtQQURUma101JOHHxET8AMq6BpzjdUdxWWNx9mBhmO5h3A4t2NnIpDa6KDF2kDFMSTUwNlnGSc2OtduUUVgz49NLYLvfzssb1EYLLl4GBcpX1frbJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59CCD113E;
	Mon, 23 Jun 2025 03:23:25 -0700 (PDT)
Received: from [10.57.29.183] (unknown [10.57.29.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF6CA3F58B;
	Mon, 23 Jun 2025 03:23:39 -0700 (PDT)
Message-ID: <a0481aed-825f-4ba9-b112-df7891299015@arm.com>
Date: Mon, 23 Jun 2025 11:23:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] drm/panthor: Support GPU_CONTROL cache flush based
 on feature bit
To: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20250602143216.2621881-1-karunika.choo@arm.com>
 <20250602143216.2621881-7-karunika.choo@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250602143216.2621881-7-karunika.choo@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/06/2025 15:32, Karunika Choo wrote:
> As the FLUSH_MEM and FLUSH_PT commands are deprecated in GPUs from
> Mali-Gx20 onwards, this patch adds support for performing cache
> maintenance via the FLUSH_CACHES command in GPU_CONTROL, in place of

NIT: s/GPU_CONTROL/GPU_COMMAND/ (also in the subject and below).
GPU_CONTROL is the register page.

> FLUSH_MEM and FLUSH_PT based on PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH
> feature bit.
> 
> This patch also enables cache maintenance via GPU_CONTROL for Mali-Gx10
> and Mali-Gx15 GPUs for consistency.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

I'm puzzled by this patch. You're introducing a new feature bit which is
always enabled on all GPUs at the end of the series. I think this should
be reworked to either:

a) Remove the feature bit and change all GPUs to the new GPU_COMMAND
cache flush mechanism. This should allow a minor code cleanup too.

b) Only opt-in new GPUs where FLUSH_MEM/FLUSH_PT are unavailable.

In particular this patch as it stands does two very different things -
it enables a new feature to be used on the new Gx20-onwards *and*
changes the existing behaviour on older GPUs (which has the possibility
of causing regressions).

A third option is of course to split the patch - add the new feature bit
but don't enable it in the first, and then the second patch is just
enabling the feature bit for existing GPUs. That makes reverting in case
of problems nice and easy. But there's also no point having the feature
bit if we don't expect any users of the old behaviour - so only do that
if you have good reason to think we're going to add a GPU using the old
behaviour.

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_hw.c  |  6 +++++
>  drivers/gpu/drm/panthor/panthor_hw.h  |  6 +++++
>  drivers/gpu/drm/panthor/panthor_mmu.c | 35 +++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
> index f5127a4b02dc..5ec9d7f28368 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.c
> +++ b/drivers/gpu/drm/panthor/panthor_hw.c
> @@ -99,9 +99,15 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
>  static struct panthor_hw panthor_hw_devices[] = {
>  	{
>  		.arch_major = 10,
> +		.features = {
> +			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
> +		},
>  	},
>  	{
>  		.arch_major = 11,
> +		.features = {
> +			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
> +		},
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
> index 1a3cbc5589fd..2bb372fe9d4d 100644
> --- a/drivers/gpu/drm/panthor/panthor_hw.h
> +++ b/drivers/gpu/drm/panthor/panthor_hw.h
> @@ -16,6 +16,12 @@ struct panthor_device;
>   * New feature flags will be added with support for newer GPU architectures.
>   */
>  enum panthor_hw_feature {
> +	/**
> +	 * @PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH: Perform cache maintenance
> +	 * via GPU_CONTROL.
> +	 */
> +	PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH,
> +
>  	/** @PANTHOR_HW_FEATURES_END: Must be last. */
>  	PANTHOR_HW_FEATURES_END
>  };
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index b39ea6acc6a9..f9ccc8627032 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -29,7 +29,9 @@
>  
>  #include "panthor_device.h"
>  #include "panthor_gem.h"
> +#include "panthor_gpu.h"
>  #include "panthor_heap.h"
> +#include "panthor_hw.h"
>  #include "panthor_mmu.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
> @@ -568,6 +570,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>  }
>  
> +static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
> +				       u32 op)
> +{
> +	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
> +	u32 lsc_flush_op = 0;
> +	int ret;
> +
> +	if (op == AS_COMMAND_FLUSH_MEM)
> +		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
> +
> +	ret = wait_ready(ptdev, as_nr);
> +	if (ret)
> +		return ret;
> +
> +	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Explicitly unlock the region as the AS is not unlocked automatically
> +	 * at the end of the GPU_CONTROL cache flush command, unlike
> +	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
> +	 */
> +	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
> +
> +	/* Wait for the unlock command to complete */
> +	return wait_ready(ptdev, as_nr);
> +}
> +
>  static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  				      u64 iova, u64 size, u32 op)
>  {
> @@ -585,6 +616,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>  	if (op != AS_COMMAND_UNLOCK)
>  		lock_region(ptdev, as_nr, iova, size);
>  
> +	if (panthor_hw_supports(ptdev,PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH))
> +		if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
> +			return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
> +
>  	/* Run the MMU operation */
>  	write_cmd(ptdev, as_nr, op);
>  

