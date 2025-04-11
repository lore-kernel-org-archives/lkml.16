Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889CB20F07C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 15:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744384983; cv=none; b=EMf8SwqNpA/gAH3XsVCPR5oyzf+Vt+ya7QU1Y+3j2aG7xtt4UumBizdjCA2E75wKQaqQGB8v8G6AUfpIrbqaIU7oUX9pC5pJFKjpQK7maoyFcgqg44dqkh5/10aoFneDdjLPstrJ45Wy38MBrYiTeFgAQOnswsBFUZQykNXhwd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744384983; c=relaxed/simple;
	bh=I19lFJtUrEcjzvtaH+8BBXCh+8MLYezZONgE4+yyF8c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o4Gdfad7i3Ws7f8LYbb5WnvCxOU0v8nx8k+03ykAoudk9j6NvNzNfrexN1iIdQ1voBx47JhEH+HYucK2e1oPx6k2MJYJaAXBwjFUi8Qtr/vWDyuvoSmGfzuRCvOAQ7qiu6S4VXL1jAT90UINm5IcS4d/VEqrIN8qJtaqZpIG0Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FYi+jxkC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FYi+jxkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744384973;
	bh=I19lFJtUrEcjzvtaH+8BBXCh+8MLYezZONgE4+yyF8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FYi+jxkCPsJl3GouqEbajJJwmRzDeBpt8mtUjtERQxSONdZzq7yKTlgQ5GCUC4GFx
	 YibqK3fw6mBq2++I4TJBCHH0xS4SR69Lo4uysDK03zJVlCqve0YAfa5XbcXM7pGdaX
	 vpDu3Zwv+co3eEa7SAaFdd5i2YqYx1vO5C6lhPPHlqGDFbz7Scj4EeB61kDrh8gI71
	 fnu7FOv/szre01F0+nRFXgsjg92ex84sH74Fz76d0F5/3l7Y5RyVKgCi4PlVRk81tl
	 Hifb6GSzrhoghEmLak4sGWO95FED1VCXWt+sHkrpI2ou8Jkgu0lfl0esQn2GAUWzc9
	 U7fzJz0Q0YXtQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC13717E0402;
	Fri, 11 Apr 2025 17:22:52 +0200 (CEST)
Date: Fri, 11 Apr 2025 17:22:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/panthor: Add 64-bit and poll register
 accessors
Message-ID: <20250411172244.1250a784@collabora.com>
In-Reply-To: <20250411151140.1815435-2-karunika.choo@arm.com>
References: <20250411151140.1815435-1-karunika.choo@arm.com>
	<20250411151140.1815435-2-karunika.choo@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Apr 2025 16:11:39 +0100
Karunika Choo <karunika.choo@arm.com> wrote:

> This patch adds 64-bit register accessors to simplify register access in
> Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.
> 
> This patch also updates Panthor to use the new 64-bit accessors and poll
> functions.
> 
> Signed-off-by: Karunika Choo <karunika.choo@arm.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.h |  71 ++++++++++++
>  drivers/gpu/drm/panthor/panthor_fw.c     |   9 +-
>  drivers/gpu/drm/panthor/panthor_gpu.c    | 142 ++++++-----------------
>  drivers/gpu/drm/panthor/panthor_mmu.c    |  34 ++----
>  drivers/gpu/drm/panthor/panthor_regs.h   |   6 -
>  5 files changed, 124 insertions(+), 138 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index da6574021664..40b935fcc1f4 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -428,4 +428,75 @@ static int panthor_request_ ## __name ## _irq(struct panthor_device *ptdev,			\
>  
>  extern struct workqueue_struct *panthor_cleanup_wq;
>  
> +static inline void gpu_write(struct panthor_device *ptdev, u32 reg, u32 data)
> +{
> +	writel(data, ptdev->iomem + reg);
> +}
> +
> +static inline u32 gpu_read(struct panthor_device *ptdev, u32 reg)
> +{
> +	return readl(ptdev->iomem + reg);
> +}
> +
> +static inline u32 gpu_read_relaxed(struct panthor_device *ptdev, u32 reg)
> +{
> +	return readl_relaxed(ptdev->iomem + reg);
> +}
> +
> +static inline void gpu_write64(struct panthor_device *ptdev, u32 reg, u64 data)
> +{
> +	gpu_write(ptdev, reg, lower_32_bits(data));
> +	gpu_write(ptdev, reg + 4, upper_32_bits(data));
> +}
> +
> +static inline u64 gpu_read64(struct panthor_device *ptdev, u32 reg)
> +{
> +	return (gpu_read(ptdev, reg) | ((u64)gpu_read(ptdev, reg + 4) << 32));
> +}
> +
> +static inline u64 gpu_read64_relaxed(struct panthor_device *ptdev, u32 reg)
> +{
> +	return (gpu_read_relaxed(ptdev, reg) |
> +		((u64)gpu_read_relaxed(ptdev, reg + 4) << 32));
> +}
> +
> +static inline u64 gpu_read64_counter(struct panthor_device *ptdev, u32 reg)
> +{
> +	u32 lo, hi1, hi2;
> +	do {
> +		hi1 = gpu_read(ptdev, reg + 4);
> +		lo = gpu_read(ptdev, reg);
> +		hi2 = gpu_read(ptdev, reg + 4);
> +	} while (hi1 != hi2);
> +	return lo | ((u64)hi2 << 32);
> +}
> +
> +#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
> +	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false,	\
> +			  dev, reg)
> +
> +#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
> +				     timeout_us)				\
> +	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us,	\
> +				 false, dev, reg)
> +
> +#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)	\
> +	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false,	\
> +			  dev, reg)
> +
> +#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond, delay_us,		\
> +				       timeout_us)				\
> +	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us,	\
> +				 false, dev, reg)
> +
> +#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond, delay_us,	\
> +					     timeout_us)			\
> +	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,		\
> +				 timeout_us, false, dev, reg)
> +
> +#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond, delay_us,		\
> +					timeout_us)				\
> +	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us,	\
> +			  false, dev, reg)
> +
>  #endif
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 0f52766a3120..ecfbe0456f89 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1059,8 +1059,8 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
>  	u32 status;
>  
>  	gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
> -	if (readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
> -			       status == MCU_STATUS_DISABLED, 10, 100000))
> +	if (gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
> +				  status == MCU_STATUS_DISABLED, 10, 100000))
>  		drm_err(&ptdev->base, "Failed to stop MCU");
>  }
>  
> @@ -1085,8 +1085,9 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
>  
>  		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
>  		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
> -		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
> -					status == MCU_STATUS_HALT, 10, 100000)) {
> +		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
> +					   status == MCU_STATUS_HALT, 10,
> +					   100000)) {
>  			ptdev->reset.fast = true;
>  		} else {
>  			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 671049020afa..fd09f0928019 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -108,14 +108,9 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
>  
>  	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
>  
> -	ptdev->gpu_info.shader_present = gpu_read(ptdev, GPU_SHADER_PRESENT_LO);
> -	ptdev->gpu_info.shader_present |= (u64)gpu_read(ptdev, GPU_SHADER_PRESENT_HI) << 32;
> -
> -	ptdev->gpu_info.tiler_present = gpu_read(ptdev, GPU_TILER_PRESENT_LO);
> -	ptdev->gpu_info.tiler_present |= (u64)gpu_read(ptdev, GPU_TILER_PRESENT_HI) << 32;
> -
> -	ptdev->gpu_info.l2_present = gpu_read(ptdev, GPU_L2_PRESENT_LO);
> -	ptdev->gpu_info.l2_present |= (u64)gpu_read(ptdev, GPU_L2_PRESENT_HI) << 32;
> +	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT_LO);
> +	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT_LO);
> +	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
>  
>  	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
>  	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
> @@ -152,8 +147,7 @@ static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
>  {
>  	if (status & GPU_IRQ_FAULT) {
>  		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
> -		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
> -			      gpu_read(ptdev, GPU_FAULT_ADDR_LO);
> +		u64 address = gpu_read64(ptdev, GPU_FAULT_ADDR_LO);
>  
>  		drm_warn(&ptdev->base, "GPU Fault 0x%08x (%s) at 0x%016llx\n",
>  			 fault_status, panthor_exception_name(ptdev, fault_status & 0xFF),
> @@ -244,45 +238,27 @@ int panthor_gpu_block_power_off(struct panthor_device *ptdev,
>  				u32 pwroff_reg, u32 pwrtrans_reg,
>  				u64 mask, u32 timeout_us)
>  {
> -	u32 val, i;
> +	u32 val;
>  	int ret;
>  
> -	for (i = 0; i < 2; i++) {
> -		u32 mask32 = mask >> (i * 32);
> -
> -		if (!mask32)
> -			continue;
> -
> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
> -						 val, !(mask32 & val),
> -						 100, timeout_us);
> -		if (ret) {
> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
> -				blk_name, mask);
> -			return ret;
> -		}
> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
> +					      100, timeout_us);
> +	if (ret) {
> +		drm_err(&ptdev->base,
> +			"timeout waiting on %s:%llx power transition", blk_name,
> +			mask);
> +		return ret;
>  	}
>  
> -	if (mask & GENMASK(31, 0))
> -		gpu_write(ptdev, pwroff_reg, mask);
> -
> -	if (mask >> 32)
> -		gpu_write(ptdev, pwroff_reg + 4, mask >> 32);
> -
> -	for (i = 0; i < 2; i++) {
> -		u32 mask32 = mask >> (i * 32);
> +	gpu_write64(ptdev, pwroff_reg, mask);
>  
> -		if (!mask32)
> -			continue;
> -
> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
> -						 val, !(mask32 & val),
> -						 100, timeout_us);
> -		if (ret) {
> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
> -				blk_name, mask);
> -			return ret;
> -		}
> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
> +					      100, timeout_us);
> +	if (ret) {
> +		drm_err(&ptdev->base,
> +			"timeout waiting on %s:%llx power transition", blk_name,
> +			mask);
> +		return ret;
>  	}
>  
>  	return 0;
> @@ -305,45 +281,26 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
>  			       u32 pwron_reg, u32 pwrtrans_reg,
>  			       u32 rdy_reg, u64 mask, u32 timeout_us)
>  {
> -	u32 val, i;
> +	u32 val;
>  	int ret;
>  
> -	for (i = 0; i < 2; i++) {
> -		u32 mask32 = mask >> (i * 32);
> -
> -		if (!mask32)
> -			continue;
> -
> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + pwrtrans_reg + (i * 4),
> -						 val, !(mask32 & val),
> -						 100, timeout_us);
> -		if (ret) {
> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx power transition",
> -				blk_name, mask);
> -			return ret;
> -		}
> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
> +					      100, timeout_us);
> +	if (ret) {
> +		drm_err(&ptdev->base,
> +			"timeout waiting on %s:%llx power transition", blk_name,
> +			mask);
> +		return ret;
>  	}
>  
> -	if (mask & GENMASK(31, 0))
> -		gpu_write(ptdev, pwron_reg, mask);
> -
> -	if (mask >> 32)
> -		gpu_write(ptdev, pwron_reg + 4, mask >> 32);
> -
> -	for (i = 0; i < 2; i++) {
> -		u32 mask32 = mask >> (i * 32);
> +	gpu_write64(ptdev, pwron_reg, mask);
>  
> -		if (!mask32)
> -			continue;
> -
> -		ret = readl_relaxed_poll_timeout(ptdev->iomem + rdy_reg + (i * 4),
> -						 val, (mask32 & val) == mask32,
> -						 100, timeout_us);
> -		if (ret) {
> -			drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
> -				blk_name, mask);
> -			return ret;
> -		}
> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val, !val,
> +					      100, timeout_us);
> +	if (ret) {
> +		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
> +			blk_name, mask);
> +		return ret;
>  	}
>  
>  	return 0;
> @@ -492,26 +449,6 @@ void panthor_gpu_resume(struct panthor_device *ptdev)
>  	panthor_gpu_l2_power_on(ptdev);
>  }
>  
> -/**
> - * panthor_gpu_read_64bit_counter() - Read a 64-bit counter at a given offset.
> - * @ptdev: Device.
> - * @reg: The offset of the register to read.
> - *
> - * Return: The counter value.
> - */
> -static u64
> -panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
> -{
> -	u32 hi, lo;
> -
> -	do {
> -		hi = gpu_read(ptdev, reg + 0x4);
> -		lo = gpu_read(ptdev, reg);
> -	} while (hi != gpu_read(ptdev, reg + 0x4));
> -
> -	return ((u64)hi << 32) | lo;
> -}
> -
>  /**
>   * panthor_gpu_read_timestamp() - Read the timestamp register.
>   * @ptdev: Device.
> @@ -520,7 +457,7 @@ panthor_gpu_read_64bit_counter(struct panthor_device *ptdev, u32 reg)
>   */
>  u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
>  {
> -	return panthor_gpu_read_64bit_counter(ptdev, GPU_TIMESTAMP_LO);
> +	return gpu_read64_counter(ptdev, GPU_TIMESTAMP_LO);
>  }
>  
>  /**
> @@ -531,10 +468,5 @@ u64 panthor_gpu_read_timestamp(struct panthor_device *ptdev)
>   */
>  u64 panthor_gpu_read_timestamp_offset(struct panthor_device *ptdev)
>  {
> -	u32 hi, lo;
> -
> -	hi = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_HI);
> -	lo = gpu_read(ptdev, GPU_TIMESTAMP_OFFSET_LO);
> -
> -	return ((u64)hi << 32) | lo;
> +	return gpu_read64(ptdev, GPU_TIMESTAMP_OFFSET_LO);
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 12a02e28f50f..a0a79f19bdea 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -510,9 +510,9 @@ static int wait_ready(struct panthor_device *ptdev, u32 as_nr)
>  	/* Wait for the MMU status to indicate there is no active command, in
>  	 * case one is pending.
>  	 */
> -	ret = readl_relaxed_poll_timeout_atomic(ptdev->iomem + AS_STATUS(as_nr),
> -						val, !(val & AS_STATUS_AS_ACTIVE),
> -						10, 100000);
> +	ret = gpu_read_relaxed_poll_timeout_atomic(ptdev, AS_STATUS(as_nr), val,
> +						   !(val & AS_STATUS_AS_ACTIVE),
> +						   10, 100000);
>  
>  	if (ret) {
>  		panthor_device_schedule_reset(ptdev);
> @@ -564,8 +564,7 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>  	region = region_width | region_start;
>  
>  	/* Lock the region that needs to be updated */
> -	gpu_write(ptdev, AS_LOCKADDR_LO(as_nr), lower_32_bits(region));
> -	gpu_write(ptdev, AS_LOCKADDR_HI(as_nr), upper_32_bits(region));
> +	gpu_write64(ptdev, AS_LOCKADDR_LO(as_nr), region);
>  	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
>  }
>  
> @@ -615,14 +614,9 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
>  	if (ret)
>  		return ret;
>  
> -	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), lower_32_bits(transtab));
> -	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), upper_32_bits(transtab));
> -
> -	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), lower_32_bits(memattr));
> -	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), upper_32_bits(memattr));
> -
> -	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), lower_32_bits(transcfg));
> -	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), upper_32_bits(transcfg));
> +	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), transtab);
> +	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), memattr);
> +	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), transcfg);
>  
>  	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
>  }
> @@ -635,14 +629,9 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
>  	if (ret)
>  		return ret;
>  
> -	gpu_write(ptdev, AS_TRANSTAB_LO(as_nr), 0);
> -	gpu_write(ptdev, AS_TRANSTAB_HI(as_nr), 0);
> -
> -	gpu_write(ptdev, AS_MEMATTR_LO(as_nr), 0);
> -	gpu_write(ptdev, AS_MEMATTR_HI(as_nr), 0);
> -
> -	gpu_write(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
> -	gpu_write(ptdev, AS_TRANSCFG_HI(as_nr), 0);
> +	gpu_write64(ptdev, AS_TRANSTAB_LO(as_nr), 0);
> +	gpu_write64(ptdev, AS_MEMATTR_LO(as_nr), 0);
> +	gpu_write64(ptdev, AS_TRANSCFG_LO(as_nr), AS_TRANSCFG_ADRMODE_UNMAPPED);
>  
>  	return write_cmd(ptdev, as_nr, AS_COMMAND_UPDATE);
>  }
> @@ -1680,8 +1669,7 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>  		u32 source_id;
>  
>  		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
> -		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
> -		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
> +		addr = gpu_read64(ptdev, AS_FAULTADDRESS_LO(as));
>  
>  		/* decode the fault status */
>  		exception_type = fault_status & 0xFF;
> diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
> index a3ced0177535..6fd39a52f887 100644
> --- a/drivers/gpu/drm/panthor/panthor_regs.h
> +++ b/drivers/gpu/drm/panthor/panthor_regs.h
> @@ -232,10 +232,4 @@
>  #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
>  #define CSF_GLB_DOORBELL_ID				0
>  
> -#define gpu_write(dev, reg, data) \
> -	writel(data, (dev)->iomem + (reg))
> -
> -#define gpu_read(dev, reg) \
> -	readl((dev)->iomem + (reg))
> -
>  #endif

