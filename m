Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5261531C5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743114948; cv=none; b=S6xMLwCyBiif3cA8euDoxEhpM7YQ4wvFaoTjROYWuPX+z46SqeOkQYsHDQq8EW+npJ1TFSMca5qETUOiBIMKWIy0UclZEohBHQDftgkkLsRvj49clGT0dUVsNNEs9aVwuE+ty7j+o/OhKVgakrZ9Ng92WRYOKMmOnDWqBQlSEi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743114948; c=relaxed/simple;
	bh=QmwuXzQJBsO5fkqALvnpXDy+SIH97mFToLVea4wUuHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kA5KH29cdUe6wsQ4yM0D89Buxu1WOrW/WFKCG7ffl47rk4dGlxiBiKT4JPRd0+H/CHfMbZpWgON2eYC1Bn2svaxFVOe1KtIZXBBz3IF+2GL13gJgAhahchp7Yk1+KvsMm59p2uX2/Swd1as/TdLkqDOm6DVJu4QYpqVknwugKUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=T5VYShcv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="T5VYShcv"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B558446;
	Thu, 27 Mar 2025 23:33:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743114836;
	bh=QmwuXzQJBsO5fkqALvnpXDy+SIH97mFToLVea4wUuHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T5VYShcviVcf4kS9Gke22a5TZlCibgjOir429AAFhV/KnNaAMOR4GK6/Tw4YeEJ/T
	 vzf6rVLbSsfGeA5iZeajGSK4DKmDgkeMkVc4JbWz9ovmbYtvAAFAJnPrcwBNZFzA8d
	 O0JsD6TWjfnKegIJbd5QxoaOABQ7MsfZIgWuxbWs=
Date: Fri, 28 Mar 2025 00:35:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
Message-ID: <20250327223520.GA11049@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-8-322a300c6d72@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-8-322a300c6d72@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Mar 26, 2025 at 03:22:51PM +0200, Tomi Valkeinen wrote:
> Add support for XV15 & XV20 formats.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index b9883ea2d03e..1dc77f2e4262 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -297,6 +297,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420,
>  		.swap		= true,
>  		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_XV15,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_XV20,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart
