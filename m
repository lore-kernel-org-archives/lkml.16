Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D71E28B7E7
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293020; cv=none; b=AytLzygeO8Vdim7jLrgwaHAeG5kTGcKo3/qFJxCa0qsOzYHN1+1FE8k/g64oh8f7hF/E1t1g6vw62fNsF+hYE/wDnY7CXZPQA5VtSC3Qesbbl4uXckTBli1N4ZoSP873O660wWeEQiFjfW87qyRoUdSAmrYbaYHAMFc1u6r4qSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293020; c=relaxed/simple;
	bh=rqjT+nknBGF3QVxl4ssrXwHZp31NXVqo5PwlapVxCWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iIhVedV2cOs1fAEEX3PfpRLt0hrhYZbq0BZf4u4SEQ4Qcl6Vv9jZicMc+hfdqbJD0Ap3D3XvS8tNyB1pXAgPImkeerF3Jepi+bwhF7pm+IBWuhMASaOAArjfYgUwna7vlEdM1q1EAbfvqskOMjpYi1S72VWFI6EoRx7xGzAndD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC8331D34
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:16:41 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5AC6B3F66E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:16:57 -0700 (PDT)
Date: Mon, 30 Jun 2025 15:16:52 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Karunika Choo <karunika.choo@arm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Wait for _READY register when powering on
Message-ID: <aGKcVPWVh5d0C9oQ@e110455-lin.cambridge.arm.com>
References: <20250630140704.432409-1-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630140704.432409-1-steven.price@arm.com>

On Mon, Jun 30, 2025 at 03:07:02PM +0100, Steven Price wrote:
> panthor_gpu_block_power_on() takes a register offset (rdy_reg) for the
> purpose of waiting for the power transition to complete. However, a
> copy/paste error converting to use the new 64 register functions
> switched it to using the pwrtrans_reg register instead. Fix the function
> to use the correct register.

Good catch!

> 
> Fixes: 4d230aa209ed ("drm/panthor: Add 64-bit and poll register accessors")
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_gpu.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> index 534735518824..cb7a335e07d7 100644
> --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> @@ -297,8 +297,9 @@ int panthor_gpu_block_power_on(struct panthor_device *ptdev,
>  
>  	gpu_write64(ptdev, pwron_reg, mask);
>  
> -	ret = gpu_read64_relaxed_poll_timeout(ptdev, pwrtrans_reg, val,
> -					      !(mask & val), 100, timeout_us);
> +	ret = gpu_read64_relaxed_poll_timeout(ptdev, rdy_reg, val,
> +					      (mask & val) == val,
> +					      100, timeout_us);
>  	if (ret) {
>  		drm_err(&ptdev->base, "timeout waiting on %s:%llx readiness",
>  			blk_name, mask);
> -- 
> 2.39.5
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
