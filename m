Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB231482E7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065119; cv=none; b=TNRI+emyNpBZffmBtXHEXNrJOprSOD0pnZd52f0TzQj4VRlpVyKF7MhSNeMzh+cmDaSrtMb3k04R0Rh7Sn/LosaYLPI5B8M1l3UoLQHq4o1g2p/RHP7XFUIuInnhFSxikw2cCSfRZFmGVez8o9gJjsiHfsstYWu7bt8K3AaBi0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065119; c=relaxed/simple;
	bh=8/+vRJuS4GVuap1gz0Lu61hJ3rA3MRdBUD/nPZpnS/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnfpjGfSGUNEteJgu3N5Mb9RPc4AbXclsHHzyAHoAKGm8C7HXJNcvdIEJozKDQmfL9TbBU+ywO3h6T76vvtG5/pPrj5GqrQ9uaT47yspBZ6oT7M6DhND8VMCoQexjEj9OgqQragCJ1YHlx1spwcRO/4oh/aa1zw4JMRk+ZMEGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TCAGDdRU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TCAGDdRU"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37830666;
	Thu, 27 Mar 2025 09:43:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743065007;
	bh=8/+vRJuS4GVuap1gz0Lu61hJ3rA3MRdBUD/nPZpnS/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCAGDdRUMKfGAU/Yx7oIiFQVbaYnIhkhQtmCvbtJV6Nog9Jbs/mfL6yDwXYWMPN9m
	 SFBFWvMiA41/E0w8jypEdiTSSUsVxhEN0qy2c68Vmwh5oBrmjpU1Seh3RfqtWBzA8K
	 0Z3yvBpz0EH5HYZQ8MycWmBoQStvMaY+f3scfNJA=
Date: Thu, 27 Mar 2025 10:44:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: shao.mingyin@zte.com.cn
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn,
	linux-kernel@vger.kernel.org, zhang.enpei@zte.com.cn
Subject: Re: [PATCH v2] drm/bridge: thc63lvd1024: Use dev_err_probe()
Message-ID: <20250327084453.GA4861@pendragon.ideasonboard.com>
References: <20250327115249185_vgGyzfhDZjf43eXFwKqX@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327115249185_vgGyzfhDZjf43eXFwKqX@zte.com.cn>

Hi Zhang and Shao,

On Thu, Mar 27, 2025 at 11:52:49AM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> 
> Replace the open-code with dev_err_probe() to simplify the code.
> 
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v2:
> 	- reduce a PTR_ERR call since dev_err_probe() will add
> 	  the error value to the message
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index bba10cf9b4f9..8f3096fa3dd7 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -188,14 +188,9 @@ static int thc63_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, thc63);
> 
>  	thc63->vcc = devm_regulator_get(thc63->dev, "vcc");
> -	if (IS_ERR(thc63->vcc)) {
> -		if (PTR_ERR(thc63->vcc) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -
> -		dev_err(thc63->dev, "Unable to get \"vcc\" supply: %ld\n",
> -			PTR_ERR(thc63->vcc));
> -		return PTR_ERR(thc63->vcc);
> -	}
> +	if (IS_ERR(thc63->vcc))
> +		return dev_err_probe(thc63->dev, PTR_ERR(thc63->vcc),
> +				     "Unable to get \"vcc\" supply\n");
> 
>  	ret = thc63_gpio_init(thc63);
>  	if (ret)

-- 
Regards,

Laurent Pinchart
