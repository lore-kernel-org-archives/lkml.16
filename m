Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209682E339C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.240.19.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514068; cv=none; b=kOFOLAtSwFh2+MxJaYoWg0oHNRaox+3AFkTegjR2LVk0YczKdEUsjxSyzz9edDEf0/KhyNlKRpSXJp81jucUQcGV9fwqSlYQpHdKOY33c2tQCERO5lBgsdvQiejzIzu70cZCEN+zJ7t0jVL9Ot6wecYVbooDZj69kqqDINfxTFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514068; c=relaxed/simple;
	bh=yWml8y2u5zm0r64M1MCkrKnnq+7678zkuFHTswN1918=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LHIMOTfUGntCBpLIl1xyZyenXc21r1BioGXYfYVj1JYIzU+3XqJPjMu6n8ggtfoGDsTOIXMtkk0PX+YQXKTsAUzd0o7U8PyE0Ps8q2l1ppyM7i5lCeHiH0Rs3dPaf4/1T6fH7UB0JrdBYF0rCDvtGh6V9mDOVdH4jVx3NL7zmBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=haloniitty.fi; spf=pass smtp.mailfrom=haloniitty.fi; dkim=pass (2048-bit key) header.d=haloniitty.fi header.i=@haloniitty.fi header.b=fxULT5/r; arc=none smtp.client-ip=77.240.19.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=haloniitty.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=haloniitty.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=haloniitty.fi header.i=@haloniitty.fi header.b="fxULT5/r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=haloniitty.fi; s=default; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7ZhFowZYPb/ehWe3WI9YDzdqsWQBq6iqxIFEK20hOv0=; b=fxULT5/ryE6nrW7IvM++sEHUGg
	/Zgyu+03x5TWoOgeVWdoSCY3VlGGOuncrqGNHBNAkY67Dy1JwhjeWDi8tuq9ysnWJBHq440I7C/mb
	tS+1rFRf8nDyBParFYzVkoAR8/btiBW3xVe6awJGw9NvNTJuqNIRFxpaXCMMFLaYeH8qFErvn6Wza
	YUldOi+0pjK62jO0oWxpVlnECPuavByutr1Xmlf/ZuDwsJ2MBSe0mOXJummZv82XoSwTeuXCHZJ2N
	hTCga/344qp+GS4dg603VcRDqlDkXxS8wjzSrZ5tApQun0mN4eaR4lo6zQQphPYuZYIKs+VOT5jIp
	18qOXvEg==;
Received: from [194.136.85.206] (port=49796 helo=eldfell)
	by whm50.louhi.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <pekka.paalanen@haloniitty.fi>)
	id 1tzbeS-000000004cW-0byF;
	Tue, 01 Apr 2025 16:27:36 +0300
Date: Tue, 1 Apr 2025 16:27:32 +0300
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250401162732.731ef774@eldfell>
In-Reply-To: <20250331135337.61934003@eldfell>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
	<20250326-xilinx-formats-v4-3-322a300c6d72@ideasonboard.com>
	<CAMuHMdXM1B1c=62EpcuUdpdpaBRZSJLXb1GBB0egzp7Fyeo5-w@mail.gmail.com>
	<b195971c-52e6-463e-a440-83dde4346e65@ideasonboard.com>
	<20250327112009.6b4dc430@eldfell>
	<b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
	<20250327175842.130c0386@eldfell>
	<CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
	<20250331105446.098f0fbe@eldfell>
	<20250331082135.GB13690@pendragon.ideasonboard.com>
	<20250331135337.61934003@eldfell>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OLA4PRd4W1=pfOT/_baNr+x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id: pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 

--Sig_/OLA4PRd4W1=pfOT/_baNr+x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Mar 2025 13:53:37 +0300
Pekka Paalanen <pekka.paalanen@haloniitty.fi> wrote:

> On Mon, 31 Mar 2025 11:21:35 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
>=20
> > On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen wrote: =20
> > > On Thu, 27 Mar 2025 17:35:39 +0100
> > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > >    =20
> > > > Hi Pekka,
> > > >=20
> > > > On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen
> > > > <pekka.paalanen@haloniitty.fi> wrote:   =20
> > > > > On Thu, 27 Mar 2025 16:21:16 +0200
> > > > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:     =20
> > > > > > On 27/03/2025 11:20, Pekka Paalanen wrote:     =20
> > > > > > > On Wed, 26 Mar 2025 15:55:18 +0200
> > > > > > > Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:     =
=20
> > > > > > >> On 26/03/2025 15:52, Geert Uytterhoeven wrote:     =20
> > > > > > >>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen
> > > > > > >>> <tomi.valkeinen@ideasonboard.com> wrote:     =20
> > > > > > >>>> Add greyscale Y8 format.
> > > > > > >>>>
> > > > > > >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > >>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard=
.com>     =20
> > > > > > >>>
> > > > > > >>> Thanks for your patch!
> > > > > > >>>     =20
> > > > > > >>>> --- a/include/uapi/drm/drm_fourcc.h
> > > > > > >>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > >>>> @@ -405,6 +405,9 @@ extern "C" {
> > > > > > >>>>    #define DRM_FORMAT_YUV444      fourcc_code('Y', 'U', '2=
', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > > > > >>>>    #define DRM_FORMAT_YVU444      fourcc_code('Y', 'V', '2=
', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > > > > >>>>
> > > > > > >>>> +/* Greyscale formats */
> > > > > > >>>> +
> > > > > > >>>> +#define DRM_FORMAT_Y8          fourcc_code('G', 'R', 'E',=
 'Y')  /* 8-bit Y-only */     =20
> > > > > > >>>
> > > > > > >>> This format differs from e.g. DRM_FORMAT_R8, which encodes
> > > > > > >>> the number of bits in the FOURCC format. What do you envisi=
on
> > > > > > >>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1', '6')?  =
   =20
> > > > > > >>
> > > > > > >> I wanted to use the same fourcc as on V4L2 side. Strictly sp=
eaking it's
> > > > > > >> not required, but different fourccs for the same formats do =
confuse.
> > > > > > >>
> > > > > > >> So, generally speaking, I'd pick an existing fourcc from v4l=
2 side if
> > > > > > >> possible, and if not, invent a new one.     =20
> > > > > > >
> > > > > > > what's the actual difference between DRM_FORMAT_R8 and DRM_FO=
RMAT_Y8?
> > > > > > >
> > > > > > > Is the difference that when R8 gets expanded to RGB, it becom=
es (R, 0,
> > > > > > > 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y) where c1=
..c3 are
> > > > > > > defined by MatrixCoefficients (H.273 terminology)?
> > > > > > >
> > > > > > > That would be my intuitive assumption following how YCbCr is =
handled.
> > > > > > > Is it obvious enough, or should there be a comment to that ef=
fect?     =20
> > > > > >
> > > > > > You raise an interesting point. Is it defined how a display dri=
ver, that
> > > > > > supports R8 as a format, shows R8 on screen? I came into this i=
n the
> > > > > > context of grayscale formats, so I thought R8 would be handled =
as (R, R,
> > > > > > R) in RGB. But you say (R, 0, 0), which... also makes sense.   =
  =20
> > > > >
> > > > > That is a good question too. I based my assumption on OpenGL beha=
vior
> > > > > of R8.
> > > > >
> > > > > Single channel displays do exist I believe, but being single-chan=
nel,
> > > > > expansion on the other channels is likely meaningless. Hm, but fo=
r the
> > > > > KMS color pipeline, it would be meaningful, like with a CTM.
> > > > > Interesting.
> > > > >
> > > > > I don't know. Maybe Geert does?     =20
> > > >=20
> > > > I did some digging, and was a bit surprised that it was you who told
> > > > me to use R8 instead of Y8?
> > > > https://lore.kernel.org/all/20220202111954.6ee9a10c@eldfell   =20
> > >=20
> > > Hi Geert,
> > >=20
> > > indeed I did. I never thought of the question of expansion to R,G,B
> > > before. Maybe that expansion is what spells R8 and Y8 apart?
> > >=20
> > > I do think that expansion needs to be specified, so that the KMS color
> > > pipeline computations are defined. There is a big difference between
> > > multiplying these with an arbitrary 3x3 matrix (e.g. CTM):
> > >=20
> > > - (R, 0, 0)
> > > - (R, R, R)
> > > - (c1 * Y, c2 * Y, c3 * Y)   =20
> >=20
> > I'd be very surprised by an YUV to RGB conversion matrix where the first
> > column would contain different values. What we need to take into account
> > though is quantization (full vs. limited range). =20

Quantization range is indeed good to note. R8 would be always full
range, but Y8 would follow COLOR_RANGE property.

> That makes Y8 produce (Y, Y, Y), and we have our answer: R8 should be
> (R, 0, 0), so we have both variants.
>=20
> Can we specify Y, R, G and B be nominal values in the range 0.0 - 1.0
> in the KMS color processing?

I think this 0.0 - 1.0 nominal range definition for the abstract KMS
color processing is necessary.

It also means that limited range Y8 data, when containing values 0-15
or 240-255, would produce negative and greater than 1.0 values,
respectively. They might get immediately clamped to 0.0 - 1.0 with the
first color operation they face, though, but the concept seems
important and carrying over to the new color pipelines UAPI which might
choose not to clamp.


Thanks,
pq

--Sig_/OLA4PRd4W1=pfOT/_baNr+x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmfr6cQACgkQI1/ltBGq
qqcyAg/7B5M9LjzwSycaieCw4rY2vce9hzdBsGuTQ9VLRFvXZF/OhbeaTsYJCg6j
NGDDcGHOq0SV25e6I8YvaSUfb7n+MbW+l8Xjo3Ivoz0S9Uy5aUeo58ZsjM3GO2yu
7JlWxw4cAJge22SukdPef5qmGa37+Lkl0HyowrjbIAJYUqdEzRKrqLZRl3EVG+98
SKR2Z4ZZhysT2lrlDCJaAz8UfYDXO7FoZ0qcDqYbl6tzSKv6kIizymb9RGrywcel
5Bsm3Y8ynnXVtZc02TMWswXpoCDPn3VxdOCz6D2pQkcgdB0cZjigAuiDtOXbnA7L
iQPJECcDK1vlSFpNk7Xa24SN3FNiCGpiGKpZp/vobDL8aDtOWvcburh+VZ6yq3WL
Pi1RDaePaCr5/vxJ8+Aw+tgWtx5kaSUEN5kCkQQ4ujVaeRsyE3qx/mITMEEx6LgJ
o23+CS7EmbM0Q3XLByu4MvzgerWz2kBpgBSRZ8bwFpwns3kAG6YCKjoE1sguj+qI
xTj7NH9zfRq9jIz8Td6Tix/jVPzqAEKUcwb2N9SCoJyc4eV0wLjp0xmyEL65soGg
ZqVyXyfhwtHemGOEQt37MQOmxEs+lclEhh8+Cg+LKCyMyrWrbSFlSqJp7ohmT8fd
S4N12JsErxzbtTtGsZETiaYc+tqrC9yoqW/x0IUQKZHHl7jeyyA=
=flgN
-----END PGP SIGNATURE-----

--Sig_/OLA4PRd4W1=pfOT/_baNr+x--
