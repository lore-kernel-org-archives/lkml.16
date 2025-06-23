Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56D3C30
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750659427; cv=none; b=TU7J3hX3hY0tyMPnRunIN12/QJflGYLZucJa5WGAsi0zqiOw5eWPc7ZP611oDR2FJF36KUw6yB/J7TNSeMudS91ocWAMuqKlZUH6QXg+xWXgAxEQPI+akQlS7+OZY5Ok0ycq0IcSyrzyBf2WmM4Vy4523vBhV6Co9nE4j9pqIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750659427; c=relaxed/simple;
	bh=2GFKcKVw5UeaFY9S6aEsZ0Sr0nRZOqS+hi6kWIwR5jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J6MiOJWMM7G1fc/NjEVxUbUOlRFs14Jy3DjzUbOAFv56HWa/kFm2JtbGKeiugb2xksHeXvu43+PGmXzIabUSj0yLPKNX1FDuGUqgiTG4jquyBJeGybWisFSAEV2SEsuh62CvueGC4R3/6QnKlI3KWeB4aHl0v6f0FNeN4saTWUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=T7QMiEMf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T7QMiEMf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750659417;
	bh=2GFKcKVw5UeaFY9S6aEsZ0Sr0nRZOqS+hi6kWIwR5jQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T7QMiEMfvD7ulOY1Ym3hivK9TMxvLhTEowy5/k5fOZcGHpkEXlO2EbPdWd/oOXWMZ
	 Syh3wPJc8vSnW5z9UAy9RPRm9I2HbFj18VzrmtE8QmgMI4646pGBp0I6/szYw6eApp
	 cNRj0fHVqx9MaJHuNqx+GgT5JcQnMUXkhZfIquAPdTKCFQW+tduc8+QnbN4279MPu6
	 lnQJ5m8N5WKSk/VHGNTYKQFOThH40UQMzgDZmpBu5t2gVlxbobfbtC4xJHfeR2qHnR
	 sSjkRVz2hV+WcLgCFD5M0oPpRuFSuwA2838VhFoj+/evNwyzsO2+bHYGfHUaRP7vh0
	 BHldZYz92uclA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:16f1:973:959b:9b0c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 40BE217E0CF7;
	Mon, 23 Jun 2025 08:16:57 +0200 (CEST)
Date: Mon, 23 Jun 2025 08:16:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] panthor: set owner field for driver fops
Message-ID: <20250623081651.26fd2cd5@fedora>
In-Reply-To: <20250620235053.164614-2-olvaffe@gmail.com>
References: <20250620235053.164614-1-olvaffe@gmail.com>
	<20250620235053.164614-2-olvaffe@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 16:50:50 -0700
Chia-I Wu <olvaffe@gmail.com> wrote:

> It allows us to get rid of manual try_module_get / module_put.
> 
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

