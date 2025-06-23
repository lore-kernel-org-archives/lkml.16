Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C2122E406
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668155; cv=none; b=TlV1H5JRvFJkHsvurmedIPTzj6iUxYh32gk9W3lr+LEFQL1SF9LDieNmGCvnVDCGvFXaRgtFCtrPxWDtFddV4/TfV5LbEUXDfMEHZ1HyTma+hnJ8gawgj1pWboi9G1mKIKIC2M9WpSmcyY88wcst3S/DKRSWd2U83/oNeVIPEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668155; c=relaxed/simple;
	bh=7g8l36q1vQRN7rDxMQWUL4Ei0G20r0s7BcWhGqB7UZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TG3qbf6SgxG18QUMZwtdhgq3pPdbBTaY43BhrEXgTfPlh1eIqH3SJR6K3JlmjWrP3d7u7DLGatmRFoqju6kr1R/8UoQfZEB8XBbODpisrWnvYmTZjRtSyqG7yVP0HEUT26XlryMsBJyxpau+oQhc2POVdTyKVVtW38fgu76NVbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F6F8113E;
	Mon, 23 Jun 2025 01:42:13 -0700 (PDT)
Received: from [10.57.29.183] (unknown [10.57.29.183])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2305D3F63F;
	Mon, 23 Jun 2025 01:42:30 -0700 (PDT)
Message-ID: <f76f56af-91dd-49ce-bf7d-f42dba07eeaa@arm.com>
Date: Mon, 23 Jun 2025 09:42:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] panthor: set owner field for driver fops
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250620235053.164614-1-olvaffe@gmail.com>
 <20250620235053.164614-2-olvaffe@gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250620235053.164614-2-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/06/2025 00:50, Chia-I Wu wrote:
> It allows us to get rid of manual try_module_get / module_put.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 1116f2d2826ee..775a66c394544 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1400,14 +1400,9 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  	struct panthor_file *pfile;
>  	int ret;
>  
> -	if (!try_module_get(THIS_MODULE))
> -		return -EINVAL;
> -
>  	pfile = kzalloc(sizeof(*pfile), GFP_KERNEL);
> -	if (!pfile) {
> -		ret = -ENOMEM;
> -		goto err_put_mod;
> -	}
> +	if (!pfile)
> +		return -ENOMEM;
>  
>  	pfile->ptdev = ptdev;
>  	pfile->user_mmio.offset = DRM_PANTHOR_USER_MMIO_OFFSET;
> @@ -1439,9 +1434,6 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
>  
>  err_free_file:
>  	kfree(pfile);
> -
> -err_put_mod:
> -	module_put(THIS_MODULE);
>  	return ret;
>  }
>  
> @@ -1454,7 +1446,6 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
>  	panthor_vm_pool_destroy(pfile);
>  
>  	kfree(pfile);
> -	module_put(THIS_MODULE);
>  }
>  
>  static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
> @@ -1555,6 +1546,7 @@ static void panthor_show_fdinfo(struct drm_printer *p, struct drm_file *file)
>  }
>  
>  static const struct file_operations panthor_drm_driver_fops = {
> +	.owner = THIS_MODULE,
>  	.open = drm_open,
>  	.release = drm_release,
>  	.unlocked_ioctl = drm_ioctl,

