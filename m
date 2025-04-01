Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274E81E9B39
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743541900; cv=none; b=DeB48N+9Og20u3j6jayiKfqCQdvY1Gr/ZYvgXVIBATPeucpVa6NLtCCzKCCYZ05pzwz7htjGD/bftDNX1GidMR1S2w+/SVPuoKxXqKJ4i706NLAi9WCQS9Q7a7wck/smgO+ghwaIVvoxI1x/7T+xuI23d7xVT6nUd0k0SUGCMqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743541900; c=relaxed/simple;
	bh=y3Hkn/iaLk1s44Pr2yUzphbW9gozDeH6sgCK9ponr08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVNqYxV34f6IV49hvGVVyaSSjg6Y9NQTUlbHagSmQLu/+uPrGArDIOfY3g4Sl/NkyaZMva9SzNdGHZWIHz1kTDjSrLYucnga1eJmpd3FiB9etBni0Atomda70yIwKp7sWTG71TFgIalPIkUeStrityPDMtLmVGelEMda1nY0jW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD8C1106F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:11:40 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 473ED3F694
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:11:37 -0700 (PDT)
Date: Tue, 1 Apr 2025 22:11:23 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: shao.mingyin@zte.com.cn
Cc: j@jannau.net, chunkuang.hu@kernel.org, fnkl.kernel@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn,
	tang.dongxing@zte.com.cn
Subject: Re: [PATCH 2/4] drm: arm: =?utf-8?Q?hdlcd?=
 =?utf-8?Q?=3A_Replace_custom_compare=5Fdev_with=C2=A0component=5Fcompare?=
 =?utf-8?B?X29m?=
Message-ID: <Z-xWe6nHEvKHdvsd@e110455-lin.cambridge.arm.com>
References: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
 <20250331173018043nQB6z_xgZxuYx0AkGeixh@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250331173018043nQB6z_xgZxuYx0AkGeixh@zte.com.cn>

On Mon, Mar 31, 2025 at 05:30:18PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Tang Dongxing <tang.dongxing@zte.com.cn>
> 
> Remove the custom device comparison function compare_dev and replace it
> with the existing kernel helper component_compare_of
> 
> Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu Dudau

> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index c3179d74f3f5..45b1dc5613bf 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -346,11 +346,6 @@ static const struct component_master_ops hdlcd_master_ops = {
>  	.unbind		= hdlcd_drm_unbind,
>  };
> 
> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int hdlcd_probe(struct platform_device *pdev)
>  {
>  	struct device_node *port;
> @@ -361,7 +356,7 @@ static int hdlcd_probe(struct platform_device *pdev)
>  	if (!port)
>  		return -ENODEV;
> 
> -	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
> +	drm_of_component_match_add(&pdev->dev, &match, component_compare_of, port);
>  	of_node_put(port);
> 
>  	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
> -- 
> 2.25.1

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
