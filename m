Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4D11DF977;
	Wed,  9 Apr 2025 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180915; cv=none; b=XWZdocFk56Lh0Xwbe62TxRq/F+JeB1OLAEcTZ/M0sraCUlt6+affYJmgWFsSY6YB1HVzLnL08jrFAhuWfltEz0DMaBA7iSkQiRMdvc3W4ZInH1iaRtZdwTOz3R+gPDr/US6cRSDWIY/y1Eal+1tOWizhiHqikGQ3tdqU2yoWkeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180915; c=relaxed/simple;
	bh=5GSTcf2r9lrcUtSxo2UmSqLMuIyIyxm5zM5x9Wa3VmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdxqrTBfSpteFFccCDn3Cf91IVtWxfbRgj4J4vAx4gseOFoc/0k+u2Yzfqn2jM1y6jwN0MykYEYNb5auOhd7WfeoUCBP/qw8106G3xGMszftWfLYYMAPs14x23f9H46juMxK66zRTU2llpG+gwpBsNSGgjGtb4Wt0z3enQNJAX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAOQ0jN1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAOQ0jN1"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54991d85f99so418133e87.1;
        Tue, 08 Apr 2025 23:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744180911; x=1744785711; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YuicuWNl+78SMq+BOx5Lp7ZhEP+45+5kk+zhckCm74k=;
        b=fAOQ0jN1tIjcMRJ1J71OVj+jjBoMyfNHFx43222WHJ1gSbbSUiRpoX14/MEdVv2Zwt
         OXpuJLvt6WWsRqjFm8utsRjBcwiKDhCZeb0XsRtHCjH47uOTR2ZnRVTFya5ddRUE8JqB
         a6LMK4mMrVKhLyjrcKGNwAQZON7mDJoYGOpty5+zfquSEibYm93O+coFHc7Ofd7bgk0g
         yaBtOi+mt7uxLguNUTMjPx9fwG0ubiXK7badmsxbeoGebunyt233Q5+bvYlxeFI9o6Om
         3KgydIhyHyasjLeMLrj8wCCdzML5TCrYeGzyR377TgDuoTjM/mSlBj0PaFwvYDWtRXcV
         O4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180911; x=1744785711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuicuWNl+78SMq+BOx5Lp7ZhEP+45+5kk+zhckCm74k=;
        b=Kan4+hUcKsOfl+k1E3fXAOXPJszRVCVyFm3o5g3ZULKr4wdaNYXmlz9tmROMdzcc2U
         NsR9z2hQgSs0e4Lt/G3SezV6LVmUPQJ95kcDxoYAC9OAedu56NMxWvqOwMdmwTp98zg4
         CMXHKiSUGpRvCNid3UDaXGsTC/Uzc2QohORnoRffLp+3Gg0BY9+98eAgiQntNUiKlI3Z
         XBzivShD/OJZlT8l1umtlQUpPN2IV0Vxsowc0qJCd10EFd+eYb7n75ocN0Xi3rjDAnmn
         lAfbJLU+2bp6qwnxyul3rSE+YfP3tgi3RZt9rTTnixbOBkPwPTvRQ+GSXXJ5Jy8CwTor
         B3NA==
X-Forwarded-Encrypted: i=1; AJvYcCVlzjUGsYjBXWDtVDoeM7qJxNLNFIh+Y3LKFZuR8+lzCu1PTzD2Z0XiIQNzCDZ7U02nt3Vk6zK8V/e7LY+K@vger.kernel.org, AJvYcCXdesFR8z1Hx8s6gBH2P5e2Y3KT/rylyKBAfojmd58dv1VADRW0TdIdl1pGK6aWKa6jDbyncYhKilAd@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWZB23ha7CicvfKvFrigR0Fcj3gMCnr3wK972sr4lHqw5aip5
	FbZj2kgX3pTpkOe5s4Cxr3g5n5guo9/Jic5RRBnCYCRO7p8s+wbi
X-Gm-Gg: ASbGncuBrhp6lm/UPfY78c1Ilbo2KQtEXHMkzmZprtGsNHRr/z8bx9TtPsB/RYgmIoF
	E8y2/ZtD/LyuQ3PcOXlKmIgZ72ZvDgxFLAz+2NH2isojj6+tAcBpq24znPfkKgosTM521DI52JA
	LTebkniGmrXhPuNdpnAkk1wEnRYy0+AglpGmO6t0eFmExvYJSSSetfRz2cw50tiNdvPj2t0Icl3
	JMgSfSwt+zbC6Kes6/QxC/XPFEnAI/zfs0tSugGbweuDtUNkmxPx7E3OhcYNlpLvGqU6vMClkOS
	hc/NWEpsrJiPsgoKqjnNipLO0ti0KGT5ZeG9RuETWK+Dxd8kSspCUqJL87J0TC4XZwETXUjhDHb
	kug==
X-Google-Smtp-Source: AGHT+IFdnlxer68Yln0fuFLV1bJP2lPBgYXnZwBE2tazPW/qAEw5qRAr1HSLKKeZe59pVJ/g7Y58kw==
X-Received: by 2002:ac2:5f7b:0:b0:549:9643:68d0 with SMTP id 2adb3069b0e04-54c3bbbd60amr1572364e87.17.1744180910558;
        Tue, 08 Apr 2025 23:41:50 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c4566dc80sm53867e87.192.2025.04.08.23.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:41:49 -0700 (PDT)
Date: Wed, 9 Apr 2025 08:41:47 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmrmann@suse.de>
Subject: Re: [PATCH v3 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <Z_YWq4ry6Y-Jgvjq@gmail.com>
References: <20250408-st7571-v3-0-200693efec57@gmail.com>
 <20250408-st7571-v3-2-200693efec57@gmail.com>
 <87cydn9bkx.fsf@minerva.mail-host-address-is-not-set>
 <Z_Uin2dvmbantQU4@gmail.com>
 <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ylj4ERT0Ocye4RUt"
Content-Disposition: inline
In-Reply-To: <87ecy1g8z8.fsf@minerva.mail-host-address-is-not-set>


--Ylj4ERT0Ocye4RUt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Javier,

On Wed, Apr 09, 2025 at 08:11:23AM +0200, Javier Martinez Canillas wrote:

[...]
> >> > +static int st7571_set_pixel_format(struct st7571_device *st7571,
> >> > +				   u32 pixel_format)
> >> > +{
> >> > +	switch (pixel_format) {
> >> > +	case DRM_FORMAT_C1:
> >> > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_BLACKWHITE=
);
> >> > +	case DRM_FORMAT_C2:
> >> > +		return st7571_set_color_mode(st7571, ST7571_COLOR_MODE_GRAY);
> >> > +	default:
> >> > +		return -EINVAL;
> >> > +	}
> >>=20
> >> These should be DRM_FORMAT_R1 and DRM_FORMAT_R2 and not C{1,2}. The fo=
rmer
> >> is for displays have a single color (i.e: grey) while the latter is wh=
en a
> >> pixel can have different color, whose values are defined by a CLUT tab=
le.
> >>=20
> >
> > I see.
> > Does fbdev only works with CLUT formats? I get this error when I switch
> > to DRM_FORMAT_R{1,2}:
> >
> > [drm] Initialized st7571 1.0.0 for 0-003f on minor 0
> > st7571 0-003f: [drm] format C1   little-endian (0x20203143) not support=
ed
> > st7571 0-003f: [drm] No compatible format found
> > st7571 0-003f: [drm] *ERROR* fbdev: Failed to setup emulation (ret=3D-2=
2)
> >
> >
>=20
> That's a god question, I don't really know...
>=20
> But fbdev does support XRGB8888, which may be another good reason to add
> it and make it the default format. Yes, it will cause an unnecessary pixel
> format conversion but the I2C transport is so slow anyways that compute is
> not the bottleneck when using these small displays.

Hrm, I now realised that I have another issue.
Not all LCDs that will be attached to the ST7571 controller will be
grayscale.
The display I've attached to the ST7571 is a monochrome LCD for example.

Maybe the right way to do it is to only support XRGB8888 and specify=20
if the display is monochrome or grayscale in the device tree.

Or do you have any good suggestions?

[...]
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

Best regards,
Marcus Folkesson

--Ylj4ERT0Ocye4RUt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmf2FqcACgkQiIBOb1ld
UjJlFA/+Mvgnw0GHgT/CbvHMZfsKrzVui9dIXTaP9ruHztPyzxKfhzb/VOxWIqm2
Grdh3t1Q2HqElAM/cpET2LpPRej5WHklHoah93ATdVsE29LDwkULtRSqAND7laJc
FGjvEM23bcXSeToZ7kvJZHYziu3ABhJKtGmGOKGfUFOPg7LOvdpkBWxj2dzni/mq
02OVArtj0gmMvdyQDXBLrAVN0OvbWCc0IIDlVfQ6EiZeag/Kefqt57kL02y2ffVo
OR7DHz2QrkPJLzK61dfVwA3uMC+RP6S5a+nGcB+Qw5z0KMkiO7S8hOIOxoyW+eF2
FFrPjv1fnPZPjjfulVcKJHAk84hqOiyTnll9YDUMefB0BrwYCtTc56CKa+abATuH
trbrdtDY6BnKSNN/fzwkHeKtRwWoISvJ1s+WcO5bf2nsA751uuxpVXV/xy+ZrMZ/
IIraaNw+mHPpCeUZW+bjf9sSiGvGKjBiWFQGCCUiEzbbhnd4CQcLl0N61umLWjZT
3IAY67lI0vk5Bms0wJnP1vZwop9c8MX7GVK6gd+5fy5q1AXa/sVAQsz74rwaLyX9
uErGQKENWaTdlVes8hzJUOSIlgamh9M+P/H29qGfaQqCfI6UkdH+qFowo3JV0A/j
OQOe8CHsfLkesxn7/18YT3eiP7PPOR+TuapvXPoSCBLQjzmBajs=
=oJhl
-----END PGP SIGNATURE-----

--Ylj4ERT0Ocye4RUt--
