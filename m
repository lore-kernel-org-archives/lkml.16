Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 398CC22173D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747842770; cv=none; b=JmCNPsIIs0huqFlGmOKJXuwtTcJlO+Bs+KI+NpVpMNEq851V6Ix2o+JUA1pnG9KQwGBGpJwwGCDwh1CgHy3z+KrbUMy9KDnTBJAQ74VE7xrCpmQPzzc2Q0f92Vait5pPpu0uP6q1b/C5tsg4JT2E6fDWjHXneNt9yaAuJkmmiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747842770; c=relaxed/simple;
	bh=+wOzfamimJ5NhNOuK0jlZWQ9pIiKLUo9/CzoeaGaRPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jhIlTo6U4J7lIUSD+3cfd6JaZVXF/s2M1ANqymn92wsc9gmYSrqGmtzU9YIZ8D2i3z2KtIURf3f9A8dkHATVP+QsjtBl121kQwn/ZNX52uZbDaoaBnzwJi4uJWwfYjrXZdJMJReOdUI61othRMFI5BQJyCYCF4Ynw+5LXJbbSog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86E391515;
	Wed, 21 May 2025 08:52:34 -0700 (PDT)
Received: from [10.57.23.70] (unknown [10.57.23.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 317F03F6A8;
	Wed, 21 May 2025 08:52:46 -0700 (PDT)
Message-ID: <e1d1df54-ae5e-4620-a33b-cfcd9ca5f809@arm.com>
Date: Wed, 21 May 2025 16:52:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/panfrost: Fix panfrost device variable name in
 devfreq
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250520174634.353267-1-adrian.larumbe@collabora.com>
 <20250520174634.353267-6-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250520174634.353267-6-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/05/2025 18:44, Adrián Larumbe wrote:
> Commit 64111a0e22a9 ("drm/panfrost: Fix incorrect updating of current
> device frequency") was a Panfrost port of a similar fix in Panthor.
> 
> Fix the Panfrost device pointer variable name so that it follows
> Panfrost naming conventions.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: 64111a0e22a9 ("drm/panfrost: Fix incorrect updating of current device frequency")

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 3385fd3ef41a..5d0dce10336b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -29,7 +29,7 @@ static void panfrost_devfreq_update_utilization(struct panfrost_devfreq *pfdevfr
>  static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
>  				   u32 flags)
>  {
> -	struct panfrost_device *ptdev = dev_get_drvdata(dev);
> +	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>  	struct dev_pm_opp *opp;
>  	int err;
>  
> @@ -40,7 +40,7 @@ static int panfrost_devfreq_target(struct device *dev, unsigned long *freq,
>  
>  	err = dev_pm_opp_set_rate(dev, *freq);
>  	if (!err)
> -		ptdev->pfdevfreq.current_frequency = *freq;
> +		pfdev->pfdevfreq.current_frequency = *freq;
>  
>  	return err;
>  }

