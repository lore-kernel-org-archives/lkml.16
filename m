Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6CA1C84AE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743116807; cv=none; b=K/AEXvhK8hA5SNANDF330Q3WWm5R1Am/vMazIxXlMsRBj0tPTg9+SO48iNK3nbx5yQlmCPMuT8ru31AHx3ot6n4NWjjU7CsWTfDvorByh+f4bexGELH/QqkcLm1qTKTN9LtDRIp58/MWVU0AigT49BLmGBwwe8iQlVio+bJHEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743116807; c=relaxed/simple;
	bh=Jg0lay9DQTanzPgGVu0GDPUwJJjKFNGOTQpAD6wb1LU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbe8JRoFRYBA4Wc1q7D4mKNXIk4/KKqoMNqInfR0Di/lpO0RecrobO+1FH1bAygRhFbqjmLUkhLzUwVjIdc2rO+D6cVr9o/StnKumcJnc7kGrNeAVgmGgInGpeU/I2VeLg2TWD5pVgULc9JTCMqn/M8IoFJ0vwDk6oe+tP8x05M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FLbtod8/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FLbtod8/"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57E5D3DA;
	Fri, 28 Mar 2025 00:04:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743116694;
	bh=Jg0lay9DQTanzPgGVu0GDPUwJJjKFNGOTQpAD6wb1LU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLbtod8/qhWpgj251QPTnmeCPBgmLYhkvNKL3C8DvdM9NmjpjMCJGIDAJCw9AhQnl
	 Nx2RAVQ37idvF4rViSSvA7i3IlltNWvibGwdyJb06oSoXyr41UGNRJcQNiPpmGy18D
	 pNp3d6ht1KaEwOedYgcULuxNsBgppRE5MNDpLCYI=
Date: Fri, 28 Mar 2025 01:06:19 +0200
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
Subject: Re: [PATCH v4 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
Message-ID: <20250327230619.GF16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-11-322a300c6d72@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-11-322a300c6d72@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Mar 26, 2025 at 03:22:54PM +0200, Tomi Valkeinen wrote:
> Add support for XVUY2101010 format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index ce685dfbf31f..79f58e06f38f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -322,6 +322,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
>  		.swap		= false,
>  		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_XVUY2101010,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,

I'll have to trust your word on this, the documentation is just too
wrong in too many places to trust it. Assuming you've tested this
format,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart
