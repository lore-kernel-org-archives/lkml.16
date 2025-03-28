Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C88F49
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743157700; cv=none; b=M9JKvssBtAASLTJ+M0G+5XxnIolw3nc/yrdOd8UdcaAIRWXq7MrKN+zhRsN37om9t5OBrCVN4754LLPho56Yhl4Sv10zxdz0B1nQKjuyFWxAPgMK+O5tMTCrcMoEcA34jjgJ6m4ED4NqwzO7GZOqH4NbHohyjd34qAOwI+j5is4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743157700; c=relaxed/simple;
	bh=OTwI9aGqFKxdOoAi9IRebrULyZqV3oGbyNLGr/YD3+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3xMcfppsr97MkDkiSAG6hpaJAM4Uflon4BqHqS2y5vBgM07zR4/7GB6Lsjqsnm/c+hlYqTvdBwImqVZ33hqApqzPv/J41t3D/a0VjP0V6rVQBWcGxlm1nCBWaUpNU+l+HvJh+6aUC4GE6zHnAv6GmvM1Ey5dKgMIS85i1ttf6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mn3jL0hf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mn3jL0hf"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 296EF752;
	Fri, 28 Mar 2025 11:26:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743157587;
	bh=OTwI9aGqFKxdOoAi9IRebrULyZqV3oGbyNLGr/YD3+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mn3jL0hf/e80kH2AjGhu3uy3ViQOOYxjuLq+tx/E8kMGOOoBPtvBZAYtnb1mI3EA8
	 6Pm9/pWynXpTNYkcknaMy2BwPzB3x0KeRELYNZHIHDfjKsh2nV0tqgtIgpBTclUMfg
	 uMF48BhYkFQGqt4EEdwiPhMHX1rO0AgBOh+A6ngU=
Date: Fri, 28 Mar 2025 12:27:52 +0200
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
Message-ID: <20250328102752.GA2639@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-2-322a300c6d72@ideasonboard.com>
 <20250327223449.GA16629@pendragon.ideasonboard.com>
 <5282b9f9-edef-45fd-8228-16096981a11a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5282b9f9-edef-45fd-8228-16096981a11a@ideasonboard.com>

On Fri, Mar 28, 2025 at 12:05:40PM +0200, Tomi Valkeinen wrote:
> On 28/03/2025 00:34, Laurent Pinchart wrote:
> > On Wed, Mar 26, 2025 at 03:22:45PM +0200, Tomi Valkeinen wrote:
> >> Add two new pixel formats:
> >>
> >> DRM_FORMAT_XV15 ("XV15")
> >> DRM_FORMAT_XV20 ("XV20")
> >>
> >> The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
> >> subsampled whereas XV20 is 2x1 subsampled.
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
> >>   include/uapi/drm/drm_fourcc.h | 8 ++++++++
> >>   2 files changed, 14 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> >> index 2f5781f5dcda..e101d1b99aeb 100644
> >> --- a/drivers/gpu/drm/drm_fourcc.c
> >> +++ b/drivers/gpu/drm/drm_fourcc.c
> >> @@ -346,6 +346,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >>   		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
> >>   		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> >>   		  .hsub = 2, .vsub = 2, .is_yuv = true},
> >> +		{ .format = DRM_FORMAT_XV15,		.depth = 0,  .num_planes = 2,
> >> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> >> +		  .hsub = 2, .vsub = 2, .is_yuv = true },
> >> +		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
> >> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> >> +		  .hsub = 2, .vsub = 1, .is_yuv = true },
> > 
> > It appears we can never have too much (or enough) documentation, as
> > reading the format info documentation leaves me with unanswered
> > questions.
> > 
> > Looking at drm_format_info_min_pitch():
> > 
> > uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
> > 				   int plane, unsigned int buffer_width)
> > {
> > 	if (!info || plane < 0 || plane >= info->num_planes)
> > 		return 0;
> > 
> > 	return DIV_ROUND_UP_ULL((u64)buffer_width * info->char_per_block[plane],
> > 			    drm_format_info_block_width(info, plane) *
> > 			    drm_format_info_block_height(info, plane));
> > }
> > 
> > For the first plane, the function will return `buffer_width * 4 / 3`
> > (rouding up), which I think is right. For the second plane, it will
> > return `buffer_width * 8 / 3`, which I believe is wrong as the format is
> > subsampled by a factor 2 horizontally. It seems that either
> > char_per_block and block_w need to take horizontal subsampling into
> > account (and therefore be 8 and 6 for the second plane), or
> > drm_format_info_min_pitch() should consider .hsub. Or there's something
> > else I'm missing :-)
> 
> The buffer_width is already divided by the hsub, in 
> drm_format_info_plane_width().

The function documentation doesn't clearly indicate if buffer_width is
the width of the buffer (as in the width of the first plane), or the
width of the requested plane. The variable name implies (for me) that
it's the width of the buffer, not the plane.

I've checked users of the function, and it seems to be a mess. The
following users pass the plane width to the function:

drivers/gpu/drm/drm_framebuffer.c
drivers/gpu/drm/drm_gem_framebuffer_helper.c
drivers/gpu/drm/tests/drm_format_test.c

However, the following users seem to pass the full buffer width:

drivers/gpu/drm/rockchip/rockchip_drm_vop.c
drivers/gpu/drm/tests/drm_format_helper_test.c

> >>   	};
> >>   
> >>   	unsigned int i;
> >> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >> index 81202a50dc9e..1247b814bd66 100644
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -304,6 +304,14 @@ extern "C" {
> >>   #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
> >>   #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
> >>   
> >> +/*
> >> + * 2 plane 10 bit per component YCrCb
> >> + * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
> >> + * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian
> > 
> > I believe this is right, but I have a hard time validating it, as I
> > think the corresponding figures in UG1085 are incorrect (they show a
> > 8bpp format as far as I can tell). Do I assume correctly that you've
> > tested the formats ?
> 
> Yes. kms++'s master branch has support for all the formats in this series.
> 
>   Tomi

-- 
Regards,

Laurent Pinchart
