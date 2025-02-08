Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042EE20328
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739024504; cv=none; b=J3kn9zZPfCE26VenQongYzCqdnK7tLlBNo3O9+Q3w3ao6r6qx4zSTAw5gwJs6DX2nh42RSvf64oOStcFDJVoz3+5Qt3y8Fi0eLoKIkJ5F/Y6H6RZ55C/I73byfpBoCmIVVLlxi8SJgpP7h7nVj5YrOhh+PtpysEY5Xv6L80sD4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739024504; c=relaxed/simple;
	bh=WU+sOOHT6k3K6YZ/b2hxBHd5CiMb8fuXeIQVlDyaYqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evESzwjg4PUIFJMKp1pFZJzw2cGh7WuReART8yRDRuPDiT3nZdBDigqSN6ySxA88LLfPjKO93EaMniMaX28KvL87HcCSTZ1Q3Ol/2H8falMfI7Z6VTEjIqfZCaZEtAI7wcKWa1ErjZF14XIQA+tzj34FKMDp+Jz8/ixo+MdKzwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ENXDSNgV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ENXDSNgV"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A183E82A;
	Sat,  8 Feb 2025 15:20:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739024418;
	bh=WU+sOOHT6k3K6YZ/b2hxBHd5CiMb8fuXeIQVlDyaYqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENXDSNgV2OV6z8Bh46vXfQTGd1/4d0TTteGN95QOS4Lisju1Ypra8p+rdujk3Qq6O
	 9IPuwEzFjfx9Dh6f7Z32a504X0Q3Z6PATh+To2SqdD+X1yCidysPhxMe+Qj/0FULVH
	 xoEfMavuBYbegzpFwXLVwF0qFGERRa7UcD8OnM28=
Date: Sat, 8 Feb 2025 16:21:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, michal.simek@amd.com, vishal.sagar@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: Add NULL check in
 zynqmp_audio_init
Message-ID: <20250208142125.GC21843@pendragon.ideasonboard.com>
References: <20250208100323.11625-1-hanchunchao@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250208100323.11625-1-hanchunchao@inspur.com>

Hi Charles,

Thank you for the patch.

On Sat, Feb 08, 2025 at 06:03:22PM +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure,but this

s/but/ but/

> returned value in zynqmp_audio_init() is not checked.
> Add NULL check in zynqmp_audio_init(), to handle kernel NULL
> pointer dereference error.
> 
> Fixes: 3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> index fa5f0ace6084..f07ff4eb3a6d 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> @@ -323,12 +323,16 @@ int zynqmp_audio_init(struct zynqmp_dpsub *dpsub)
>  
>  	audio->dai_name = devm_kasprintf(dev, GFP_KERNEL,
>  					 "%s-dai", dev_name(dev));
> +	if (!audio->dai_name)
> +		return -ENOMEM;
>  
>  	for (unsigned int i = 0; i < ZYNQMP_NUM_PCMS; ++i) {
>  		audio->link_names[i] = devm_kasprintf(dev, GFP_KERNEL,
>  						      "%s-dp-%u", dev_name(dev), i);
>  		audio->pcm_names[i] = devm_kasprintf(dev, GFP_KERNEL,
>  						     "%s-pcm-%u", dev_name(dev), i);
> +		if (!audio->link_names[i] || !audio->pcm_names[i])
> +			return -ENOMEM;
>  	}
>  
>  	audio->base = devm_platform_ioremap_resource_byname(pdev, "aud");

-- 
Regards,

Laurent Pinchart
