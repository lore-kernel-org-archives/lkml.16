Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9CA157A5A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409324; cv=none; b=FoxSXPGCgpmlbCvMWiP1tHbjTPSAg41/D1+k4wWqXZYkkkvTuCwidIA1ExGtYaEYK3qAzfUn1yI0HuVndsIVmFUuH5yJglBxYAAmoxu3pxU4mOFLLi8MPLFnuOZX/B8TgX5E8LQqLHBGgdPTjAX4owBPglG+kFTD4ZxxGD8W3VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409324; c=relaxed/simple;
	bh=tUrrndyetcQdf+fJlK/WuPN0EMaUdeLYo6Dod9/nY6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heON49z3J3szp3vn/aUd+lgx5tj+oOT2zfpaS+6cKZc2vwAQ047L8SwTuSZUzYXY7JC0REjyGtMreQzjvco/r0C4/PUUNZhsay6y8cOG/BuUtfX2uNHalGCJ9sppu3B/CQSJPDjSMv140X01VuRv05lncwatKU4KOyJTDUbuJuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sox2lVNC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sox2lVNC"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8154250;
	Mon, 31 Mar 2025 10:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743409209;
	bh=tUrrndyetcQdf+fJlK/WuPN0EMaUdeLYo6Dod9/nY6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sox2lVNCEUZ1fv2QDPfZ8SNuu1x+9s4JVyz55uRTltFx/HfltKgOyoJm43X89aism
	 mPPWstyuYlXvBtatqUZUU2Z+bGs8PSyL+LjCNh73J3Xhp311XBx+HI+Y56w/IUdURc
	 7NIjXgksgogiFrLzHDgrcmdsEBxcDBfNuyhKYIHY=
Date: Mon, 31 Mar 2025 11:21:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Vishal Sagar <vishal.sagar@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250331082135.GB13690@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
 <CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
 <b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
 <20250327112009.6b4dc430@eldfell>
 <b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
 <20250327175842.130c0386@eldfell>
 <CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
 <20250331105446.098f0fbe@eldfell>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250331105446.098f0fbe@eldfell>

On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrote:
> On Thu, 27 Mar 2025 17:35:39 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> > Hi Pekka,
> > 
> > On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen
> > <pekka.paalanen@haloniitty.fi> wrote:
> > > On Thu, 27 Mar 2025 16:21:16 +0200
> > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:  
> > > > On 27/03/2025 11:20, Pekka Paalanen wrote:  
> > > > > On Wed, 26 Mar 2025 15:55:18 +0200
> > > > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:  
> > > > >> On 26/03/2025 15:52, Geert Uytterhoeven wrote:  
> > > > >>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
> > > > >>> <tomi.valkeinen@ideasonboard.com> wrote:  
> > > > >>>> Add greyscale Y8 format.
> > > > >>>>
> > > > >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>  
> > > > >>>
> > > > >>> Thanks for your patch!
> > > > >>>  
> > > > >>>> --- a/include/uapi/drm/drm_fourcc.h
> > > > >>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > >>>> @@ -405,6 +405,9 @@ extern "C" {
> > > > >>>>    #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > > >>>>    #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > > >>>>
> > > > >>>> +/* Greyscale formats */
> > > > >>>> +
> > > > >>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */  
> > > > >>>
> > > > >>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > > > >>> the number of bits in the FOURCC format. What do you envision
> > > > >>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?  
> > > > >>
> > > > >> I wanted to use the same fourcc as on V4L2 side. Strictly speaking it's
> > > > >> not required, but different fourccs for the same formats do confuse.
> > > > >>
> > > > >> So, generally speaking, I'd pick an existing fourcc from v4l2 side if
> > > > >> possible, and if not, invent a new one.  
> > > > >
> > > > > what's the actual difference between DRM_FORMAT_R8 and DRM_FORMAT_Y8?
> > > > >
> > > > > Is the difference that when R8 gets expanded to RGB, it becomes (R, 0,
> > > > > 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1..c3 are
> > > > > defined by MatrixCoefficients (H.273 terminology)?
> > > > >
> > > > > That would be my intuitive assumption following how YCbCr is handled.
> > > > > Is it obvious enough, or should there be a comment to that effect?  
> > > >
> > > > You raise an interesting point. Is it defined how a display driver, that
> > > > supports R8 as a format, shows R8 on screen? I came into this in the
> > > > context of grayscale formats, so I thought R8 would be handled as (R, R,
> > > > R) in RGB. But you say (R, 0, 0), which... also makes sense.  
> > >
> > > That is a good question too. I based my assumption on OpenGL behavior
> > > of R8.
> > >
> > > Single channel displays do exist I believe, but being single-channel,
> > > expansion on the other channels is likely meaningless. Hm, but for the
> > > KMS color pipeline, it would be meaningful, like with a CTM.
> > > Interesting.
> > >
> > > I don't know. Maybe Geert does?  
> > 
> > I did some digging, and was a bit surprised that it was you who told
> > me to use R8 instead of Y8?
> > https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell
> 
> Hi Geert,
> 
> indeed I did. I never thought of the question of expansion to R,G,B
> before. Maybe that expansion is what spells R8 and Y8 apart?
> 
> I do think that expansion needs to be specified, so that the KMS color
> pipeline computations are defined. There is a big difference between
> multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
> 
> - (R, 0, 0)
> - (R, R, R)
> - (c1 * Y, c2 * Y, c3 * Y)

I'd be very surprised by an YUV to RGB conversion matrix where the first
column would contain different values. What we need to take into account
though is quantization (full vs. limited range).

> I forgot to consider that in the discussion of single-channel displays,
> because the displays obviously do not consider any other channel than
> the one.
> 
> Using DRM_FORMAT_Y8 FB with a single-channel display might even be
> surprising, because the proposed Y8 definition would result in c1 * Y,
> and not Y. The default c1 comes from the BT.601 matrix IIRC?
> 
> Therefore I think the difference between R8 and Y8 has been found. Now
> we just need to determine whether R8 means (R, 0, 0) or (R, R, R) to
> nail down the color operations as well. There are questions like what
> is the outcome at the video signal level when we have one KMS plane
> with an R8 FB and another KMS plane with an RGBA8888 FB on the same
> CRTC? What about Y8 or NV12 in the mix? What if the video signal is
> single-channel, RGB, or YCbCr?

-- 
Regards,

Laurent Pinchart
