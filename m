Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B139C1B6D08
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743116157; cv=none; b=jWGBTcgZUKW+UufaDe/DJH7fvTWwMQTtV+KoFfy1QGUt77gGpCzYeMgH61HgbwCTCFhqnpwrsW2l5AdgmtkOSpficZo9MwnQp9OufxfzIXCyImhUBXXLQ9WzK3kWxLic2Fiv0ZEsncSh3ExHAvTHpV50kRzd3sAnCeIIBVuquSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743116157; c=relaxed/simple;
	bh=5dcJ6twb0oWsmBHIlhgdwYsyHCMN1hm7TsGSl/bOP6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJH+nNZh4Ov2mfDcuZeEeuBnMOWwJG+Xg+nAJwrTgMII4escIylKyVZEfU5oSNulf89nnNpuVkLuYZw6HvYIJMjCRyD1rsdsTbMjFNKlpauT8bW3egnop6JeygjmyUIsPLQyH/sAEJjx84wmknG+EUPExk1uDTtN98w0hYaIbcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Q594SFK9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Q594SFK9"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF13D446;
	Thu, 27 Mar 2025 23:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743116044;
	bh=5dcJ6twb0oWsmBHIlhgdwYsyHCMN1hm7TsGSl/bOP6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q594SFK98lcwolGilpPbFx8WmfRPeHs/Yum6qAGR6florz+BR5Z6D1IjMOwfKqURb
	 9JlKAudv8NVL3JliDbBfmpqvBRkoFrJEf6EGHvWNG5V1vdjvTC3Zgbfi3+948UD1o3
	 GxcmHAaDnPo6ERZUxG5SXR5Sk8odCrE7nFBvpGaY=
Date: Fri, 28 Mar 2025 00:55:29 +0200
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
Subject: Re: [PATCH v4 05/11] drm/fourcc: Add DRM_FORMAT_X403
Message-ID: <20250327225529.GD16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-5-322a300c6d72@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-5-322a300c6d72@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Mar 26, 2025 at 03:22:48PM +0200, Tomi Valkeinen wrote:
> Add X403, a 3 plane non-subsampled YCbCr format.

I'd add 10-bpp somewhere in there.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 3 +++
>  include/uapi/drm/drm_fourcc.h | 8 ++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index e5f04f7ec164..60684f99f4a7 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -356,6 +356,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
>  		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
>  		  .hsub = 1, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_X403,		.depth = 0,  .num_planes = 3,
> +		  .char_per_block = { 4, 4, 4 }, .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
> +		  .hsub = 1, .vsub = 1, .is_yuv = true },
>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index f6316adbeb97..10d77f6f6e95 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -385,6 +385,14 @@ extern "C" {
>   */
>  #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
>  
> +/* 3 plane non-subsampled (444) YCbCr

/*
 * 3 plane non-subsampled (444) YCbCr

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
> + * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
> + * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
> + * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
> + */
> +#define DRM_FORMAT_X403		fourcc_code('X', '4', '0', '3')
> +
>  /*
>   * 3 plane YCbCr
>   * index 0: Y plane, [7:0] Y

-- 
Regards,

Laurent Pinchart
