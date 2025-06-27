Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5881DE8AD
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048379; cv=none; b=Z5BC4ky/Rcgi5fLyRT/iJx4ySiJc0VGKCpXPRONvFn1ojTCKGiFDj+Dm0x71lTNfgr9aR/5NFDHmmtqEyMfqsy8qnNygEWypauOl1CPZhWqiWpD/5s6T7BZEn9XzsNMm4GjkBr0mY6ZRJczlVgwZ/dRfvPES8dpmGkGcer38xPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048379; c=relaxed/simple;
	bh=L/+t4B4UqPiFs6T06MKpbhooF8vPcuC8n5LJInGuFco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlXsDZpDBTz8mSj0Xf6V3jSLkfDSV/4cXHB+R87iKOfsW0HxWWbsq0Gd+oDAHqqHAcX1FizoEiQyKLe3ls0wpFi3veHh9RBfbbcYxpRR8R4tsPTnqTGxYtZQSmbuLRw2ZWiJxJqz1yxuUyQn02j4F543BHKwKaLpf5vXyudBkBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rJbrk4P6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rJbrk4P6"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C5B137E1;
	Fri, 27 Jun 2025 20:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751048355;
	bh=L/+t4B4UqPiFs6T06MKpbhooF8vPcuC8n5LJInGuFco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJbrk4P66V18UpgBMooaWv0cZM4+Zdhe7sgeSwp88RQwWuNBkJ5xgn4X7P9MfZcKi
	 5n20lyYZCTqd2I3sLszoEl5mv8MLCusU2QsRdbokim1Gal6xtSrzdvrIZk93KmptB/
	 aHX62hVwhA97ZmoPRiXhfBzpKa8vzFTxwOwD1Vmg=
Date: Fri, 27 Jun 2025 21:19:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250627181911.GF24912@pendragon.ideasonboard.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627145058.6880-1-mike.looijmans@topic.nl>

Hi Mike,

Thank you for the patch.

On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
> XRGB8888 is the default mode that Xorg will want to use. Add support
> for this to the Zynqmp DisplayPort driver, so that applications can use
> 32-bit framebuffers. This solves that the X server would fail to start
> unless one provided an xorg.conf that sets DefaultDepth to 16.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 80d1e499a18d..501428437000 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>  		.swap		= true,
>  		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_XRGB8888,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> +		.swap		= true,
> +		.sf		= scaling_factors_888,

I'm afraid that's not enough. There's a crucial difference between
DRM_FORMAT_ARGB8888 (already supported by this driver) and
DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignored.
The graphics layer is blended on top of the video layer, and the blender
uses both a global alpha parameter and the alpha channel of the graphics
layer for 32-bit RGB formats. This will lead to incorrect operation when
the 'X' component is not set to full opacity.

>  	}, {
>  		.drm_fmt	= DRM_FORMAT_RGBA8888,
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,

-- 
Regards,

Laurent Pinchart
