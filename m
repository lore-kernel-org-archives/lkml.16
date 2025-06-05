Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CE117548
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749154126; cv=none; b=ED3XUwlO0RdQIXPsD7epAKDFLLUXvzy8NbdRtAhfwzAXpOaeRMap/pC2TJKQ4iD/b04AvIEPLNd9BzVTmxHmXo8P19/A5w5PN3wAY8W1Sf9ScHjcz/PdrHW5coAKktIwb570XQmvXhSd9x4CdClz+OxHbmIdD3sQt913WZ3H1PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749154126; c=relaxed/simple;
	bh=All3Z4VwrzQYXIGmNwilYw7rwMzrUxaYeCkaV3szsF4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:Cc:
	 References:In-Reply-To; b=I1yXa+XGixK7z5Ul9ajEttmVDbvUcny/DbnmK6J9l8avhCOnPvrNgQs+lhdS0ILZIjgUT5mF8W03cdRAAmzhqPKnpFHP+h+TBDPuXy2m6nnc9AgQTHHKftdAUhTc8IWz8lKDtJAo8gdzyEeNb3msx+Ql8b0hEXbvvJmtbC7uYZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=YQKEQUi2; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="YQKEQUi2"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1749154121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OK3R5dXcTJj2wL9xZzZ3c6xb7EGe7PgQLjn11tnh4TQ=;
	b=YQKEQUi2Pstu3EzNcko9YE4QP82nsguw95NIR1TrkXxSBPFfqHVmxSLC0aBunnrbJZ0UOF
	QgA62cCzKRJeL9e9piPRVRaIs6WyksCdYgn/6Vzzzr4yEJ6Cbi9nfH0bbh5tMlVFyr6hZ0
	ySCyOuaYO8IF/V+9O0NwXLCDJmyEAz8dfdCElwdALQ9zHGnCA45OG8Oi7Ny3O0rYPl1J+p
	FDVtAIkvSSSnWpY/lr1YP8vZovPJW/6GTQVmR15gloQa4Kd0JmgVemDbq4y6OsuEfrUmVp
	wTaDMu/oUc93GDsEUPHUZGJ3xmAHDbtguz5bV1fq7Wf4hbQaMA+I2RdG6/8wtw==
Content-Type: multipart/signed;
 boundary=57318c575cf0bc267bcbb636acd15cccce634ec5c21f129cbe5e981a9e70;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 05 Jun 2025 22:08:29 +0200
Message-Id: <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
To: "Piotr Zalewski" <pZ010001011111@proton.me>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, "Dang Huynh"
 <danct12@riseup.net>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241206192013.342692-3-pZ010001011111@proton.me>
In-Reply-To: <20241206192013.342692-3-pZ010001011111@proton.me>
X-Migadu-Flow: FLOW_OUT

--57318c575cf0bc267bcbb636acd15cccce634ec5c21f129cbe5e981a9e70
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Piotr,

Since kernel 6.14-rc1 I have the problem that visual output is no longer
shown on my PineTab2 and a ``git bisect`` pointed to this patch/commit
as the culprit. What is important to note is that ``CONFIG_DRM=3Dm`` seems
to be required as the problem does not occur with ``CONFIG_DRM=3Dy``.

Near the end of my bisect session, something interesting occurred.
I was booted into a 'bad' kernel (ie no visual output) and when I
started to build my final kernel, I closed the lid of the PineTab2 which
made it go into suspend. When my final kernel was built, I opened the
lid again, which made it resume, to transfer my final kernel to it.
And much to my surprise, I then did have visual output.
When I read the (below) commit message of the 'offending' commit, it may
not be such a surprise after all.

When I build a (new) 6.14-rc1 kernel with a revert of this commit on
top, then I did not have the above mentioned problem, confirming this
commit was the 'bad' commit.

I did try it on a Quartz64-B (also rk3566) and it did not have any issue
(output via HDMI).
I don't know what the cause for this issue is, hopefully you do.

Cheers,
  Diederik

On Fri Dec 6, 2024 at 8:26 PM CET, Piotr Zalewski wrote:
> Remove color_mgmt_changed check from vop2_crtc_atomic_try_set_gamma to
> allow gamma LUT rewrite during modeset when coming out of suspend. Add
> a check for color_mgmt_changed directly in vop2_crtc_atomic_flush.
>
> This patch fixes the patch adding gamma LUT support for vop2 [1].
>
> [1] https://lore.kernel.org/linux-rockchip/20241101185545.559090-3-pZ0100=
01011111@proton.me/
>
> Suggested-by: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 0c8ec7220fbe..d259f1c6571d 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1601,7 +1601,7 @@ static void vop2_crtc_atomic_try_set_gamma(struct v=
op2 *vop2,
>  					   struct drm_crtc *crtc,
>  					   struct drm_crtc_state *crtc_state)
>  {
> -	if (!vop2->lut_regs || !crtc_state->color_mgmt_changed)
> +	if (!vop2->lut_regs)
>  		return;
> =20
>  	if (!crtc_state->gamma_lut) {
> @@ -2669,7 +2669,7 @@ static void vop2_crtc_atomic_flush(struct drm_crtc =
*crtc,
>  	struct vop2 *vop2 =3D vp->vop2;
> =20
>  	/* In case of modeset, gamma lut update already happened in atomic enab=
le */
> -	if (!drm_atomic_crtc_needs_modeset(crtc_state))
> +	if (!drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state->color_mgm=
t_changed)
>  		vop2_crtc_atomic_try_set_gamma_locked(vop2, vp, crtc, crtc_state);
> =20
>  	vop2_post_config(crtc);


--57318c575cf0bc267bcbb636acd15cccce634ec5c21f129cbe5e981a9e70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEH5QAAKCRDXblvOeH7b
bo+zAQCF7eO0LKR0BrCxe85yPqZUywQSlor81IjdsdhLATzzDQD/ZlzKuhnWKhP4
3U0JPH5a2g4+MJx3D3O3+nc6OyIN2gQ=
=ZAVT
-----END PGP SIGNATURE-----

--57318c575cf0bc267bcbb636acd15cccce634ec5c21f129cbe5e981a9e70--
