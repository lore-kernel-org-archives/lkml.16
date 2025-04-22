Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6E1266EF1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319666; cv=none; b=b47Fh1mMRq90shbuJSf6jt8VIbh8P9Hf3zecnMDEXFJzZ8ESv8aV4pruhKnw09KJwEhduVBcDYQnvXfPOFV6QIrI+TFoF3zYkdB14SfKlpIBj1hAn5/Epw8m/sVKDCSfpsZBYXqTxpm1pVNTyzjRc+DdNmsnN8N1CaNSKy2z8Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319666; c=relaxed/simple;
	bh=NSdF569dLqOyy91WLPZ7wYtdTLzRbNWztWhP+ZVEtr4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fo9t7iKhczqxpglhfok5IZDcR3jWEnAssJ+kRLdqkQXFpeqsgKeROabf4HYTcxNxMwtwD9DF5FCo4Ig4Oop9IfGF+KhE98FebOdJ/2LrvGXqIhUNt/j9wx+0NUOBYsZBUJU9cwfR6kKcEzm060BD53QCljjMhcUm8/YVbpf7YbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNBzcehE; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNBzcehE"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54acc0cd458so5799690e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745319660; x=1745924460; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=adznCSzt6/ObIR64DLpghowThib8K3mkItVvxppG+i4=;
        b=FNBzcehE3COGd5GaufjdgB7+kQSpRtOLi/brVZHY2Cgn6XrORuxDkMopCzMsBsNItU
         70qNzUKJCRsZ5knbTTrcgFXBnPtulgogd64Hr5Cva08rEr/dNxCR3XKqHYPrA99bSO0B
         xFSkYdpDiJfwc9GQavfiPFS9b5J+9YmL6ygHxW4uxAnOg9JBa+Q2cwMbA2s4iFYha9UU
         B0yD22LIsNZCRBvYeQMLEwVkTCsHf7fM5U3RoNz/xyz/TjMoZyROhHwj15HQXy9nfZ00
         qz46RO/BO7h8/hKWm8sefy3J7arF4NR2wiim6vggObtGMgLrqePadHLKyM/jBhE94Rm0
         80SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745319660; x=1745924460;
        h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adznCSzt6/ObIR64DLpghowThib8K3mkItVvxppG+i4=;
        b=SfaE88gDZKMhOApT8C/IdzPHDa492qIx23U1OzLZciXpl5on0nMAbwQzxyhEXcu8N+
         BziFcVcqnfM3VlcmBBz9O/KuMBVMw2TDBiWrQitas2Qo3WEhc1zgR5GZNCyhjzMyN4n0
         HcFRVp0huOa3NBtujOfus3GVyow5fVDYd/HgubkQFxinMjb6vv5U2JIE1Md4YcmbJmup
         hrZUT6xMa1mGyj/K5jEg8yBALhKkOh+AZv1Im3wz1tizJt5gV/Ms1sdXm2Xd4XcaJLbg
         FiWuHpjCaubccd4+cDcFuK+gB0b3JakTLMv6YugwuTUZPou9KW3cXagcrviU0lxe8cqm
         2Y/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyKM29IDDdTCdHEUpw+9hoalyNferDfnQhQGxlRUMWJMZ/U0trWMbuKEnDVZ4p3YavUOAr/43ytlgH/Fo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAEOlKhRasu1xhx2UF+JaFfkYZF8vEa1rxBaCdSBV/jO233hgI
	K7Lt55h+lk6/QPNhMtv4GFeanPhyno6XuknhijmXYUA7jjBwpS46
X-Gm-Gg: ASbGncv63QOS5H/fORl3+9F4Fz1lrohtIRw32ce6o84ahSaJgdQuUzwvY9jw3VkKIIn
	Om67PbYa7031JCkLAgv/F9SyIefVXZ+40tXoGESyaDDwcUU2YwNXI6Yl+R9Rsloj328npqhSiHr
	7m2Ff27WXpkgm8CRSsyex33D+jljN5r+saxOT2p5i3+6QHr+7lPBgZ60Ad3aLEma4HSpEOTH0VU
	Pdq2KPF5pEdR/I9iuCoZ8Se+YJ9jDBqEdUMTsb2JMIjzD8fgYOmmo3oCloEibGlX18Rdys9C8Yl
	z6HlJNWP3iqXLzYM/nI6nS7EbZKS9jtbtYE=
X-Google-Smtp-Source: AGHT+IFH64vXs9Z5X8ld0XCbJzZBtq7/amrOMDyGpsZmNyKsL64xji9OCrx+VWMHCuN/8oW9/SI1qQ==
X-Received: by 2002:a05:6512:a87:b0:549:6451:7e76 with SMTP id 2adb3069b0e04-54d6e636f1amr4372571e87.33.1745319659226;
        Tue, 22 Apr 2025 04:00:59 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e51a8sm1166450e87.178.2025.04.22.04.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:00:58 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:00:55 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20250422140055.64b98cc1@eldfell>
In-Reply-To: <CAMuHMdUcG_K=5RHMaq9vTpQo8dPpLAvXfxP8XuzGnx4Nte7++A@mail.gmail.com>
References: <20250327112009.6b4dc430@eldfell>
	<b5cf15a4-7c65-4718-9c39-a4c86179ba4c@ideasonboard.com>
	<20250327175842.130c0386@eldfell>
	<CAMuHMdVEpTVWmwrYt+G-QSWucT91goUcFor9qbo5rZ+X2jnRog@mail.gmail.com>
	<20250331105446.098f0fbe@eldfell>
	<20250331082135.GB13690@pendragon.ideasonboard.com>
	<20250331135337.61934003@eldfell>
	<20250401162732.731ef774@eldfell>
	<73bd6628-374d-417f-a30f-88a4b1d157bb@ideasonboard.com>
	<20250417111315.62a749e5@eldfell>
	<20250421145039.GA19213@pendragon.ideasonboard.com>
	<20250422121107.572cb7ad@eldfell>
	<CAMuHMdX+yaw_PYsM_N8Gzrt2hbn_5cRN375jLKpwE13ygTvwHA@mail.gmail.com>
	<20250422130137.2658c646@eldfell>
	<CAMuHMdUcG_K=5RHMaq9vTpQo8dPpLAvXfxP8XuzGnx4Nte7++A@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kwn83vJATXbqj.Xg.12U9HC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Kwn83vJATXbqj.Xg.12U9HC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Apr 2025 12:12:21 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Pekka,
>=20
> On Tue, 22 Apr 2025 at 12:01, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> > On Tue, 22 Apr 2025 11:41:29 +0200
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote: =20
> > > On Tue, 22 Apr 2025 at 11:11, Pekka Paalanen
> > > <pekka.paalanen@haloniitty.fi> wrote: =20
> > > > On Mon, 21 Apr 2025 17:50:39 +0300
> > > > Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote: =20
> > > > > On Thu, Apr 17, 2025 at 11:13:15AM +0300, Pekka Paalanen wrote: =
=20
> > > > > > On Wed, 16 Apr 2025 11:59:43 +0300 Tomi Valkeinen wrote: =20
> > > > > > > On 01/04/2025 16:27, Pekka Paalanen wrote: =20
> > > > > > > > On Mon, 31 Mar 2025 13:53:37 +0300 Pekka Paalanen wrote: =20
> > > > > > > >> On Mon, 31 Mar 2025 11:21:35 +0300 Laurent Pinchart wrote:=
 =20
> > > > > > > >>> On Mon, Mar 31, 2025 at 10:54:46AM +0300, Pekka Paalanen =
wrote: =20
> > > > > > > >>>> On Thu, 27 Mar 2025 17:35:39 +0100 Geert Uytterhoeven wr=
ote: =20
> > > > > > > >>>>> On Thu, 27 Mar 2025 at 16:59, Pekka Paalanen wrote: =20
> > > > > > > >>>>>> On Thu, 27 Mar 2025 16:21:16 +0200 Tomi Valkeinen wrot=
e: =20
> > > > > > > >>>>>>> On 27/03/2025 11:20, Pekka Paalanen wrote: =20
> > > > > > > >>>>>>>> On Wed, 26 Mar 2025 15:55:18 +0200 Tomi Valkeinen wr=
ote: =20
> > > > > > > >>>>>>>>> On 26/03/2025 15:52, Geert Uytterhoeven wrote: =20
> > > > > > > >>>>>>>>>> On Wed, 26 Mar 2025 at 14:23, Tomi Valkeinen wrote=
: =20
> > > > > > > >>>>>>>>>>> Add greyscale Y8 format.
> > > > > > > >>>>>>>>>>>
> > > > > > > >>>>>>>>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@lina=
ro.org>
> > > > > > > >>>>>>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ide=
asonboard.com> =20
> > > > > > > >>>>>>>>>>
> > > > > > > >>>>>>>>>> Thanks for your patch!
> > > > > > > >>>>>>>>>> =20
> > > > > > > >>>>>>>>>>> --- a/include/uapi/drm/drm_fourcc.h
> > > > > > > >>>>>>>>>>> +++ b/include/uapi/drm/drm_fourcc.h
> > > > > > > >>>>>>>>>>> @@ -405,6 +405,9 @@ extern "C" {
> > > > > > > >>>>>>>>>>>     #define DRM_FORMAT_YUV444      fourcc_code('Y=
', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> > > > > > > >>>>>>>>>>>     #define DRM_FORMAT_YVU444      fourcc_code('Y=
', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> > > > > > > >>>>>>>>>>>
> > > > > > > >>>>>>>>>>> +/* Greyscale formats */
> > > > > > > >>>>>>>>>>> +
> > > > > > > >>>>>>>>>>> +#define DRM_FORMAT_Y8          fourcc_code('G', =
'R', 'E', 'Y')  /* 8-bit Y-only */ =20
> > > > > > > >>>>>>>>>>
> > > > > > > >>>>>>>>>> This format differs from e.g. DRM_FORMAT_R8, which=
 encodes
> > > > > > > >>>>>>>>>> the number of bits in the FOURCC format. What do y=
ou envision
> > > > > > > >>>>>>>>>> for e.g. DRM_FORMAT_Y16? fourcc_code('G', 'R', '1'=
, '6')? =20
> > > > > > > >>>>>>>>>
> > > > > > > >>>>>>>>> I wanted to use the same fourcc as on V4L2 side. St=
rictly speaking it's
> > > > > > > >>>>>>>>> not required, but different fourccs for the same fo=
rmats do confuse.
> > > > > > > >>>>>>>>>
> > > > > > > >>>>>>>>> So, generally speaking, I'd pick an existing fourcc=
 from v4l2 side if
> > > > > > > >>>>>>>>> possible, and if not, invent a new one. =20
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> what's the actual difference between DRM_FORMAT_R8 a=
nd DRM_FORMAT_Y8?
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> Is the difference that when R8 gets expanded to RGB,=
 it becomes (R, 0,
> > > > > > > >>>>>>>> 0), but Y8 gets expanded to (c1 * Y, c2 * Y, c3 * Y)=
 where c1..c3 are
> > > > > > > >>>>>>>> defined by MatrixCoefficients (H.273 terminology)?
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> That would be my intuitive assumption following how =
YCbCr is handled.
> > > > > > > >>>>>>>> Is it obvious enough, or should there be a comment t=
o that effect? =20
> > > > > > > >>>>>>>
> > > > > > > >>>>>>> You raise an interesting point. Is it defined how a d=
isplay driver, that
> > > > > > > >>>>>>> supports R8 as a format, shows R8 on screen? I came i=
nto this in the
> > > > > > > >>>>>>> context of grayscale formats, so I thought R8 would b=
e handled as (R, R,
> > > > > > > >>>>>>> R) in RGB. But you say (R, 0, 0), which... also makes=
 sense. =20
> > > > > > > >>>>>>
> > > > > > > >>>>>> That is a good question too. I based my assumption on =
OpenGL behavior
> > > > > > > >>>>>> of R8.
> > > > > > > >>>>>>
> > > > > > > >>>>>> Single channel displays do exist I believe, but being =
single-channel,
> > > > > > > >>>>>> expansion on the other channels is likely meaningless.=
 Hm, but for the
> > > > > > > >>>>>> KMS color pipeline, it would be meaningful, like with =
a CTM.
> > > > > > > >>>>>> Interesting.
> > > > > > > >>>>>>
> > > > > > > >>>>>> I don't know. Maybe Geert does? =20
> > > > > > > >>>>>
> > > > > > > >>>>> I did some digging, and was a bit surprised that it was=
 you who told
> > > > > > > >>>>> me to use R8 instead of Y8?
> > > > > > > >>>>> https://lore.kernel.org/all/20220202111954.6ee9a10c@eld=
fell =20
> > > > > > > >>>>
> > > > > > > >>>> Hi Geert,
> > > > > > > >>>>
> > > > > > > >>>> indeed I did. I never thought of the question of expansi=
on to R,G,B
> > > > > > > >>>> before. Maybe that expansion is what spells R8 and Y8 ap=
art?
> > > > > > > >>>>
> > > > > > > >>>> I do think that expansion needs to be specified, so that=
 the KMS color
> > > > > > > >>>> pipeline computations are defined. There is a big differ=
ence between
> > > > > > > >>>> multiplying these with an arbitrary 3x3 matrix (e.g. CTM=
):
> > > > > > > >>>>
> > > > > > > >>>> - (R, 0, 0)
> > > > > > > >>>> - (R, R, R)
> > > > > > > >>>> - (c1 * Y, c2 * Y, c3 * Y) =20
> > > > > > > >>>
> > > > > > > >>> I'd be very surprised by an YUV to RGB conversion matrix =
where the first
> > > > > > > >>> column would contain different values. What we need to ta=
ke into account
> > > > > > > >>> though is quantization (full vs. limited range). =20
> > > > > > > >
> > > > > > > > Quantization range is indeed good to note. R8 would be alwa=
ys full
> > > > > > > > range, but Y8 would follow COLOR_RANGE property.
> > > > > > > > =20
> > > > > > > >> That makes Y8 produce (Y, Y, Y), and we have our answer: R=
8 should be
> > > > > > > >> (R, 0, 0), so we have both variants.
> > > > > > > >>
> > > > > > > >> Can we specify Y, R, G and B be nominal values in the rang=
e 0.0 - 1.0
> > > > > > > >> in the KMS color processing? =20
> > > > > > > >
> > > > > > > > I think this 0.0 - 1.0 nominal range definition for the abs=
tract KMS
> > > > > > > > color processing is necessary.
> > > > > > > >
> > > > > > > > It also means that limited range Y8 data, when containing v=
alues 0-15
> > > > > > > > or 240-255, would produce negative and greater than 1.0 val=
ues,
> > > > > > > > respectively. They might get immediately clamped to 0.0 - 1=
.0 with the
> > > > > > > > first color operation they face, though, but the concept se=
ems
> > > > > > > > important and carrying over to the new color pipelines UAPI=
 which might
> > > > > > > > choose not to clamp. =20
> > > > > > >
> > > > > > > Is the behavior of values outside the limited range something=
 that needs
> > > > > > > to be defined? We can't know how each piece of HW behaves with
> > > > > > > "undefined" input, so should we not just define the behavior =
as platform
> > > > > > > specific? =20
> > > > > >
> > > > > > Hi Tomi,
> > > > > >
> > > > > > it's not undefined nor illegal input in general. The so-called
> > > > > > sub-black and super-white ranges exist for a reason, and they a=
re
> > > > > > intended to be used in video processing to avoid clipping in
> > > > > > intermediate processing steps when a filter overshoots a bit. T=
here are
> > > > > > also practices that depend on them, like PLUGE calibration with
> > > > > > traditional signals on a display: https://www.itu.int/rec/R-REC=
-BT.814
> > > > > >
> > > > > > I think it would be really good to have defined behaviour if at=
 all
> > > > > > possible.
> > > > > > =20
> > > > > > > In any case: I can't say I fully understood all the discussio=
ns wrt.
> > > > > > > color spaces. But my immediate interest is, of course, this s=
eries =3D).
> > > > > > > So is there something that you think should be improved here?=
 =20
> > > > > >
> > > > > > Right, the range discussion is a tangent and applies to all YUV
> > > > > > formats, so it's not a new question.
> > > > > > =20
> > > > > > > My understanding is that the Y-only pixel formats behave in a=
 well
> > > > > > > defined way (or, as well defined as the YUV formats), and the=
re's
> > > > > > > nothing more to add here. Is that right? =20
> > > > > >
> > > > > > There are two things:
> > > > > >
> > > > > > - Y8 follows COLOR_RANGE property, just like all other YUV form=
ats.
> > > > > > - Y8 implies that Cb and Cr are both neutral (0.0 in nominal va=
lues).
> > > > > >
> > > > > > I'd like these explicitly written down, so that they become obv=
ious to
> > > > > > everyone. I suspect either one might be easy to forget when wri=
ting
> > > > > > code and taking shortcuts without thinking.
> > > > > >
> > > > > >
> > > > > > Laurent,
> > > > > >
> > > > > > I did find a case where (Y', neutral, neutral) does *not* seem =
to expand
> > > > > > to RGB=3D(Y, Y, Y): ICtCp. The conversion from ICtCp to L'M'S' =
does
> > > > > > produce (Y', Y', Y'), but the LMS-to-RGB matrix scrambles it.
> > > > > >
> > > > > > I didn't dig through BT.2020 constant-luminance Y'C'bcC'rc, but=
 I
> > > > > > wouldn't be surprised if it scrambled too.
> > > > > >
> > > > > > Of course, both of the above are not just one matrix. They requ=
ire two
> > > > > > matrices and the transfer characteristic each to compute. KMS c=
olor
> > > > > > operations cannot implement those today, but with the colorop p=
ipelines
> > > > > > they will if the hardware does it.
> > > > > >
> > > > > > That's why I think it's important to document the assumption of=
 Cb and
> > > > > > Cr when not part of the pixel format, and not write down a spec=
ific
> > > > > > expansion to RGB like (Y, Y, Y). =20
> > > > >
> > > > > Every time I discuss color spaces, the scopes of "RGB" and "YUV" =
seem to
> > > > > expand more and more. This makes me wonder how we define those two
> > > > > concepts. Taking the conversion from RGB to ICtCp as an example, =
would
> > > > > you consider LMS and L'M'S' as "RGB" formats, and ICtCp as a "YUV"
> > > > > format ? =20
> > > >
> > > > sorry for the confusion. In this specific context, my use of RGB and
> > > > YUV refers to the channels in DRM pixel formats. It might have been
> > > > better if all channels in all pixel formats were "anonymous" and me=
rely
> > > > numbered because all formats can be used for any color model, but t=
his
> > > > is what we have.
> > > >
> > > > There is some disambiguation in
> > > > https://gitlab.freedesktop.org/pq/color-and-hdr/-/blob/main/doc/pix=
els_color.md
> > > > The doc is some years old, so nowadays I might phrase things
> > > > differently, but maybe it's easier to read for those new to things =
as I
> > > > wrote it when I was just learning things.
> > > >
> > > > I would classify ICtCp in the YUV pixel format category, because the
> > > > CtCp plane can be sub-sampled (right?). I would classify LMS and L'=
M'S'
> > > > in the RGB pixel format category because they are not sub-sampled A=
FAIK
> > > > although they also do not actually appear as buffer contents, so the
> > > > relation to pixel formats is... theoretical.
> > > >
> > > > IOW, we have a completely artificial split of DRM pixel formats to =
RGB
> > > > and YUV where the only essential difference is that YUV formats can=
 have
> > > > sub-sampled variants and RGB formats do not. =20
> > >
> > > RGB can be subsampled, too...
> > > https://en.wikipedia.org/wiki/Bayer_filter =20
> >
> > That's true. What difference are we left with, then? =20
>=20
> RGB contains three monochromatic color channels (which may differ from
> Red, Green, and Blue, cfr. truncated RGn and Rn formats).
> YUV contains one luminance and two chrominance channels.

I think I get what you mean. RGB are directly related to the power of
each of the primary emitters in a display. YUV OTOH carries the overall
luma and the difference from neutral (chroma) signals. This difference
is the difference between color models.

Monochromatic is not the right word here, unless you explicitly refer
to the primaries of BT.2020 which are laser-like. Most display
primaries are far from monochromatic. The closer to monochromatic
display primaries get, the more pronounced the differences between
color vision in people become, even if the people were all classified
as having normal color vision.


Thanks,
pq

> > We have DRM pixel formats which imply some color model, but do not
> > define the variant of each color model (e.g. the Y'CbCr-to-RGB matrix).
> >
> > I guess the implied color model then implies which API, e.g. KMS plane
> > property, is responsible for defining the variant. =20
>=20
> Probably (IANADX --- I Am Not A Drm eXpert ;-)
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20


--Sig_/Kwn83vJATXbqj.Xg.12U9HC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmgHducACgkQI1/ltBGq
qqdsVw/+I1+c1XyKLq5zWTTprkIbh1pWtF3P+AXhaNHju8KEA5fQeIRTDfVryjxE
wFXZpjE3UN2ubfYl2DTlcIiSlxfg81HsklTouM0v11gkqCMCtYzCKKQYI6Ntr51p
CF0TnlC5oJzzWZmc5Yk641UhygE+ZeY6SiiLZqqVChcXndYz/Ga0q7pGsPXeIANV
S+Kgz0m+o/kGKUgFIh+QCNsvhhCxA6kWKOKPsdjZVSfzD+IQ1S3hpcGYvSr7Jye6
TPzMwsC43PZp7jmdhHLeDZVSKSQeva3eYvoO86hPOQ6vUegAcUjOGsABpgYtiBul
cfL2ZDKDneJUsh51icIIAcUyWvb/8fyy85kXjKThm2ojGSwrq4QlRZXZ3xOTnTBE
3tpouf0rrVv4Wi+kKzUVPmfbMCrNgjEO5/+RoCpCueLwbWhu/LqQzsdPZjkWrO1X
tfdnDqhMRQnIJfHl5eg838HuVjNxn4gLp1YXBV5iku4IOA4v4UZXL1LDqubx+5fv
3Eivrc1VvjjETuWuq4ZwKQjmlW3Ttsrnwtf0tQRmsl0gXSGaHLY3G/898pdbFif9
lREZC9NPyV0/VYfPuToiwwZR8A/jd2XEt0DmA+tXN/+oie7fOM4PmIHA7Og037RD
J9Bi/xgIFvmVxqleKn+u+tJftKPmJAoLyJnNHJ78lKiu1LVm4xE=
=Ls/K
-----END PGP SIGNATURE-----

--Sig_/Kwn83vJATXbqj.Xg.12U9HC--
