Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF2020E032
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274745; cv=none; b=NSv1TurAbcqL09ifBHDqTwk2guv6qgeC6Y59RSEdkWmRYHhp3MwpQ6e3vJGrrDbwQ/4iPDSptSnbt5BxWhiDLn9MJ20MikcNRwBhnJ38wHkDnm8T5JTMZW3Al3zK2IMPHWjtC6x9ovGsT1gOrKg8BhinWi1FwrfoL5HqubzFGcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274745; c=relaxed/simple;
	bh=Xk1VTz99oaXPXWle19G2zMHoIPpOeSvs6Qc/pVHBAnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxL1mwqSY3t15DeBDR2nGYdOcLr4aLdLzyK/dLvtlcgYK67h8nrG9dxYVkv0UcJ+imo6sRU2+0fikt9bl2Jzn1rlCD4gH08Q+hNcujh9KXvqjad3DQKXJKxJqdFOp50zWhx/dtbzFKNKW8XoJ0ARld1+1Q71EOqt8G9kN2wl/TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EsKha93m; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EsKha93m"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1CA20EFF;
	Mon, 30 Jun 2025 11:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751274720;
	bh=Xk1VTz99oaXPXWle19G2zMHoIPpOeSvs6Qc/pVHBAnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsKha93mqQrmPtUWxFH2IC0l8vxECmEaf2z03chq8Hrcd4Vt7rjcbA1BKUrT05/JQ
	 fbXrMTGnuNulIzMcsMqYEtud0xn+ApPjs8jGMut1pvsAnAoWGo9mJmvA5b0X/OCla1
	 qS76F+yZW/A4HkTwqCsliyLT+Vyvp+BZrQCRQWZM=
Date: Mon, 30 Jun 2025 12:11:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Michal Simek <michal.simek@amd.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250630091156.GE24861@pendragon.ideasonboard.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630-psychedelic-tested-smilodon-adcbb3@houat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250630-psychedelic-tested-smilodon-adcbb3@houat>

On Mon, Jun 30, 2025 at 10:27:55AM +0200, Maxime Ripard wrote:
> On Mon, Jun 30, 2025 at 10:03:16AM +0200, Mike Looijmans wrote:
> > On 27-06-2025 20:19, Laurent Pinchart wrote:
> > > On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
> > > > XRGB8888 is the default mode that Xorg will want to use. Add support
> > > > for this to the Zynqmp DisplayPort driver, so that applications can use
> > > > 32-bit framebuffers. This solves that the X server would fail to start
> > > > unless one provided an xorg.conf that sets DefaultDepth to 16.
> > > > 
> > > > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > > > ---
> > > > 
> > > >   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
> > > >   1 file changed, 5 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > index 80d1e499a18d..501428437000 100644
> > > > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > > @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
> > > >   		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > >   		.swap		= true,
> > > >   		.sf		= scaling_factors_888,
> > > > +	}, {
> > > > +		.drm_fmt	= DRM_FORMAT_XRGB8888,
> > > > +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> > > > +		.swap		= true,
> > > > +		.sf		= scaling_factors_888,
> > > 
> > > I'm afraid that's not enough. There's a crucial difference between
> > > DRM_FORMAT_ARGB8888 (already supported by this driver) and
> > > DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignored.
> > > The graphics layer is blended on top of the video layer, and the blender
> > > uses both a global alpha parameter and the alpha channel of the graphics
> > > layer for 32-bit RGB formats. This will lead to incorrect operation when
> > > the 'X' component is not set to full opacity.
> > 
> > I spent a few hours digging in the source code and what I could find in the
> > TRM and register maps, but there's not enough information in there to
> > explain how the blender works. The obvious "XRGB" implementation would be to
> > just disable the blender.
> > 
> > What I got from experimenting so far is that the alpha component is ignored
> > anyway while the video path isn't active. So as long as one isn't using the
> > video blending path, the ARGB and XRGB modes are identical.
> > 
> > Guess I'll need assistance from AMD/Xilinx to completely implement the XRGB
> > modes.
> > 
> > (For our application, this patch is sufficient as it solves the issues like
> > X11 not starting up, OpenGL not working and horrendously slow scaling
> > performance)
> 
> Given that we consider XRGB8888 mandatory,

How about platforms that can't support it at all ?

> this patch is a good thing to
> have anyway, even if suboptimal, or broken in some scenario we can
> always fix later.

It needs to at least be updated to disallow XRGB8888 usage when the
video plan is enabled, or when global alpha is set to a non-opaque
value.

-- 
Regards,

Laurent Pinchart
