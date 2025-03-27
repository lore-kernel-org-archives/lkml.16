Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D231DF251
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743116374; cv=none; b=hWrSBEmCGmwC9UeBWk4k/gLAMn6ZdANFNTniYDvnGArer5okziY2+3+6AHbVUFaqvM88RlBjRRNoASbSuquVRkZMJFW5HGB4T24e3p4swaRk9NzfV2rHzfLtKFkBYzMq87RgXRmDPhTrL46hGXMh1px5zC5+scPFKWcP0u+oN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743116374; c=relaxed/simple;
	bh=ce43ubclLYVDVVwz6u4lLxtqmLE2iNCLrwoRsYmtNqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgrHQ2erQutLpu4NOksjPicOVpKNuZKRiVYrgA0+O0255kNKWbMgEfqcbt7lS3MGjNmsHg/qCCrQA7j81/qRLo5rNASOyk//e65QwJ67Jh3G+m289H4m6rzVSTCzKIfTFjfPX0GFO9lOdZ1J1UUSpSUNeBS6OUctDpnvVHfUK08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WSO4Kgga; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WSO4Kgga"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C90B1446;
	Thu, 27 Mar 2025 23:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743116262;
	bh=ce43ubclLYVDVVwz6u4lLxtqmLE2iNCLrwoRsYmtNqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSO4KggaskYagYGaS9JPISt/OXxyWcHuUf9/lOddzr5svUzDfUbLeuCNPtT8wg6S7
	 lU/8YckBbsiPSlaX/lnHmfgO1AuhQFlzdrCnGLoycgDP9TAnBoHIScf3mE4dw0tYm5
	 D/A3qA6KZ5JPCBUELgM4emeqbnsUD6WJKC/aa5RQ=
Date: Fri, 28 Mar 2025 00:59:06 +0200
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
Subject: Re: [PATCH v4 10/11] drm: xlnx: zynqmp: Add support for X403
Message-ID: <20250327225906.GE16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-10-322a300c6d72@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-10-322a300c6d72@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Mar 26, 2025 at 03:22:53PM +0200, Tomi Valkeinen wrote:
> Add support for X403 format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index ae8b4073edf6..ce685dfbf31f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -317,6 +317,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
>  		.swap		= false,
>  		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_X403,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart
