Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB01D1DE88C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743116043; cv=none; b=rlEPW0nLtgWCtqYamYciZxxTCF7aoGJFzIUYpjfsxFz7QmgnJY3bw7zSXKDeaZ9GMdjn3NaxKXHrhXn7GL8ol55cruMbEr4fuIEuiPO9ATfZs7DYVTzPNpl5Rq9YeSSlE5wALOC2mBgbkVOqhSf24/vlf+EUQhJabnMQUkPUu/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743116043; c=relaxed/simple;
	bh=fiZK4FTkrTpRByJQSa2cqFJPbfgsTtrs1aKW2apm0Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0zdQ7HLhA0/iV5TCPkZ37IcBpNum3rQTW88VO2vBSk8Ww+sL0RyUhz1Isn7ADcaJTa5gQ9J2S6F3rLKxIrm5Ih3bLHMrl5ZfcnIogaHl+w5rJUVgVtNs/PX3tbK3UKyIGZZILpux0sbgQBBBSpzVEi/Jrhxm6ElKooUNk3vMOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pzYB38MX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pzYB38MX"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10D7E446;
	Thu, 27 Mar 2025 23:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743115931;
	bh=fiZK4FTkrTpRByJQSa2cqFJPbfgsTtrs1aKW2apm0Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzYB38MXvQZ0EGPoQEEuRvTmoX4gRFHyy3p2dISb16n6o75DSfpz2z9l+JCvhAKrT
	 7JsbK56ZztyOjVqQSe82bEsSuS2V7XIvoEbH7jWH+0tmhi+d/mZtbByp8fvgSq2Te9
	 /blLq7eKaXSOp83Zuughytr1hGHvBdyEWMPqGbJQ=
Date: Fri, 28 Mar 2025 00:53:37 +0200
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
Subject: Re: [PATCH v4 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
Message-ID: <20250327225337.GC16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-4-322a300c6d72@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-4-322a300c6d72@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Mar 26, 2025 at 03:22:47PM +0200, Tomi Valkeinen wrote:
> Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
> 32-bit container.
> 
> The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
> packed, A - 10 (as in 0xA), 4 - 4 bytes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_fourcc.c  | 3 +++
>  include/uapi/drm/drm_fourcc.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 355aaf7b5e9e..e5f04f7ec164 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -353,6 +353,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
>  		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
>  		  .hsub = 2, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
> +		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
> +		  .hsub = 1, .vsub = 1, .is_yuv = true },
>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 751b8087b35f..f6316adbeb97 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -408,6 +408,7 @@ extern "C" {
>  /* Greyscale formats */
>  
>  #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> +#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
>  
>  /*
>   * Format Modifiers:

-- 
Regards,

Laurent Pinchart
