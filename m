Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1F4170A37
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234643; cv=none; b=IoY0YZrc/aPRZD4uiVjo13o3DVvaFRRF84iQ1n/CnEU+rJKYAxQZwQv499tbTKF9whAyHJzj5SIrhvh6/ZA3YIfLfWsp0hFHRZV/OYSvy/3tFVYHNuE2/7NDuszYgFJ2pW2GJHKYdsfaksEGwQ6w1HCjgz0WL/Eutdh60TojR58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234643; c=relaxed/simple;
	bh=+bRresNkyzf7kLLBGSXYENy5LCMU+0H2AT0/ugKM2/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPt/eNWO7WOfcZg99BaG6NbnsEtIC2GoN7/JJNEhalXJv2cAy0VW9bKKmFXpSRokv780dgYls4ZsQktDvf3hUlFGeE+ob5Wv25AyZClSetCDowQIdSiQ48miNh+gEu7pwnOjXyqPfFCb1sw9pPnSkpJJbi+bZSFV43+Z0fn0IFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JslfCGEJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JslfCGEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F58C4CEE3;
	Wed, 14 May 2025 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234643;
	bh=+bRresNkyzf7kLLBGSXYENy5LCMU+0H2AT0/ugKM2/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JslfCGEJiHOZLE0Kr7329jI9bpczv2hNwxE0adnEKVg2Q2RVNYJNXFZ2qIr+RAEM7
	 07PXwr97Z5bvCbGi0wojl7SLa27VtUfSqNeTCdkGPduGT0xkAcDnLzPmlbQ3tYz9bc
	 7k1MH7SOFKyEKJXsak0zgMFqNTh/LQy2IBFRs9TmQDV1yRZuLr++Iur2wPzIjdejDt
	 3TplfoYNnSzD0WofevLdFQ+WvVRjH5OQQfbxbm4vxWDzbqQ014MOYovYNV6C2WpeXe
	 VDZnr9arur+baugK1ydbhjD0T9GLavO6lvvwj+d8uhdk8cet5e7/vDvlCGeH/JNavn
	 fvCNJklqZ2J/g==
Date: Wed, 14 May 2025 16:57:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [PATCH 1/2] drm/tidss: Add some support for splash-screen
Message-ID: <k4ygpeoof7a2i5q6fuemqwg7pytgjlksz6u7z2wawu2zgthbbr@yogvvqymyb6w>
References: <20250416-tidss-splash-v1-0-4ff396eb5008@ideasonboard.com>
 <20250416-tidss-splash-v1-1-4ff396eb5008@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="s3xoj765hrmru65j"
Content-Disposition: inline
In-Reply-To: <20250416-tidss-splash-v1-1-4ff396eb5008@ideasonboard.com>


--s3xoj765hrmru65j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] drm/tidss: Add some support for splash-screen
MIME-Version: 1.0

Hi Tomi,

On Wed, Apr 16, 2025 at 02:06:29PM +0300, Tomi Valkeinen wrote:
> Currently when the driver's probe is called, we do a full DSS reset. If
> the bootloader has set up a splash-screen, the reset will disable the
> video output, and after that it may still take time until the display is
> usable (all the kernel modules have been loaded) and even more time
> until the userspace is able to use the display.
>=20
> In a perfect case tidss would take over the fb memory set up by the
> bootloader, and use that memory for tidss's fbdev, thus retaining the
> splash-screen. However, we're not there yet.
>=20
> As a partial solution, this patch changes the driver so that the driver
> will not reset (or change) the DSS registers until tidss_runtime_get()
> is called when the display is being set up (because of fbdev modesetting
> or modesetting from the userspace).
>=20
> This is achieved in two parts:
>=20
> 1. Probe
>=20
> At probe time, in dispc_check_hw_state(), we check if the DSS is idle
> (videoports disabled). If yes, continue as before. If not, we know that
> there's a splash-screen, and we set the 'tidss->boot_enabled_vp_mask'
> field to reflect the enabled VP ports.
>=20
> We then enable the corresponding VP clocks (to ensure they stay on), set
> the IRQENABLE to 0 to make sure we won't get any interrupts, and then
> exit leaving the fclk and VP clocks enabled, and the runtime PM status
> active.
>=20
> 2. Runtime get
>=20
> When the tidss_runtime_get() is called the first time, as indicated by
> the 'boot_enabled_vp_mask', we know that we have the splash-screen
> showing on the screen, and that the pm_runtime_resume_and_get() call in
> tidss_runtime_get() did not cause a runtime_resume callback to get
> called.
>=20
> We call dispc_splash_fini() which essentially returns the DSS into the
> state where it would be in a non-splash-screen case: dispc_splash_fini()
> will do a DSS reset, manually call the runtime_resume callback, and then
> call clk_disable_unprepare() and pm_runtime_put_noidle() to counter the
> actions at probe time.
>=20
> Finally 'boot_enabled_vp_mask' is set to zero to mark that we're no
> longer in the "splash-screen mode".
>=20
> =3D=3D=3D
>=20
> A few notes:
>=20
> If fbdev emulation is enabled in the DRM, tidss will set up an fbdev.
> This will cause a modeset, and the blank framebuffer from tidss's fbdev
> will be shown instead of the splash-screen.
>=20
> I see two improvements to this: either we should memcpy the pixel data
> from the bootloader's splash-screen to the new fbdev buffer, or the
> fbdev could use the splash-screen directly as its buffer. I have done
> some hacks for the former, but I'm not sure how to implement either of
> these properly.

So, DRM kind of has support for it, but not really.

What you're trying to do is essentially what i915 fastboot is about:
booting flicker-free, and speeding up the probe process.

i915 does so using two things:

  * IIRC, the UEFI exposes its splashscreen through ACPI, and this in
    turn is exposed through sysfs. Plymouth then picks it up, and does
    its own thing with it. I think it would be fairly easy to do
    something similar for simple-drm: the memory is typically reserved,
    so it will stick around, and you just need to expose the memory
    buffer as a sysfs file. If we want to make it simpler, I guess we
    could expose it as BMP, and that would possibly require a format
    conversion. But yeah, it shouldn't be too hard.

  * Then, the i915 driver has a custom reset hook. reset() is about
    building the initial state, and most drivers actually go from a
    pristine state. However, nothing prevents a driver from building a
    custom initial state by building it from the register. Then, you'll
    only get a flicker if the compositor initial modeset actually
    requires a modeset. Otherwise, you can just do a page flip.

We discussed it with Sima in the past, and here's a more detailed
description of what it would entail:

https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPvJ=3D=
9BwmvfU-O0gg@mail.gmail.com/

Maxime

--s3xoj765hrmru65j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaCSvSgAKCRAnX84Zoj2+
dlApAYDjj2vwm0Mbw76mnvJcq2718s5wgnPrwvKsjwj34aaKEFwZL32WYq/b5QI/
S8d2GSUBfA9peu2IcrSmNVSv0YokVDRaDSMEHs7HKvLxW0x6yIsAsC3e3IHHJeFV
j/1Z3JEaTw==
=htFy
-----END PGP SIGNATURE-----

--s3xoj765hrmru65j--
