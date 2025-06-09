Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C243597B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 22:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749508651; cv=none; b=iY5RH303WuttrH9pXO9Uq1+IrOQJgv9t7W/CIhnvjsp/fYxzyeqCbBz6NUkrxoaSx7gV6IBOCi0wK3MMD6nQFgSOC4qyLURrwismaNdwoH6xDoIXDfXgqZrqWWtxTyEG/xpANdDhNoBUu0lBoDIhDM9/eAr9dKh4zhhPDJrPmUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749508651; c=relaxed/simple;
	bh=CVcNhkCzVJXNxsfjcFB0uximKknWhCLAWZi2qsiuWmE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lbTnPnQu+Y1UnUbkbeIPhRMNDP9Gdj2GrAOTmZaUzni3AZJbaqExnFEEkUCFpCxYB8r7z9bLyF8RENLTtyj/rTzsXK9an0big2W7lPeDl5DdGVz3vyiIq/1fsursRdxXft+AVkAAo/nVHhZp1jmDQfqI3kqB6O41yXn4qWjRiag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=WrJD5m+i; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="WrJD5m+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749508640; x=1749767840;
	bh=ePwAWTLBP0goybEt9LUIGj7rug40FGOIf/8aHv/KjBQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WrJD5m+ipdpSFadzxKB0513AbmaX9XQq4ZXwkX0b9R5PNLMlLgSklRsCqnqGmCz+B
	 l/FvELmUNanPkE9pn6163SFxF58VU5ztnU1KpG0xLGC3385+Q7m9SH5zr7D/HFHHCc
	 Hr99Mx7Xm01Q8YuABJDhPPpeg/4FrmCcSFX2sDdc9K7VEHcWkhXhZv/pqjtN9M3QqL
	 k2kvPFMdeb8ZTlmssngBovN8oQ11PhLI2Ibe1GUtTRmXzHwaY5+pbW77WPMvsnupJ2
	 4udTcopn6ZWkYH0TrRXqiZb55EFInMJVJOkBtEGvuRyjE1en5IXcVW4J0bR2hMawtS
	 QTjYTQ9YtZUXA==
Date: Mon, 09 Jun 2025 22:37:13 +0000
To: Diederik de Haas <didi.debian@cknow.org>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, Dang Huynh <danct12@riseup.net>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check color_mgmt_changed in atomic_enable
Message-ID: <4z0y_F1ZT_xfO0-DwU-D5NwL3t3wHuGmivOB3QFjDsn0hzpz_hOeU63pRVBIgSU1j89jmYPq-TJHPqMCj3fAygwwX6IaPoVsqKqVi2jxmCc=@proton.me>
In-Reply-To: <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org>
References: <20241206192013.342692-3-pZ010001011111@proton.me> <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org> <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me> <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 21961013ddd1adef816f64a8c4bc9f75454c6cf5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Diederik, sorry for late response

> Interesting that it also happened with drm=3Dy.

I actually checked now and i don't have the issue with drm=3Dy, sorry for=
=20
misinforming you all, hopefully no one's time was wasted.

> As you're more knowledgeable then I am with this, maybe look through
> https://lists.sr.ht/~diederik/pine64-discuss/D9AM2OOLREO0.2JMAI42J06TW0@c=
know.org
>=20
> to see if you may spot something relevant?

Heh, I'm not that knowledgeable but I will look through it.

> > happened twice and at short interval and since this patch allows for ga=
mma
> > LUT update regardless of color_mgmt_changed state this makes DSP CTRL G=
AMMA
> > LUT EN bit to be unset twice too. It seems that VOP does not like it. I
>=20
>=20
> Happy to see you found the cause :-)
> Do you happen to know why it was unset twice? That sounds suboptimal.

It is due to DRM modeset which can happens when CRTC (display) config chang=
es=20
"significantly". AFAIK modeset happens def. when you go out of suspend or
display timings change. I might have been fooled by serial console last tim=
e
as it does not appear to happen twice in short interval when i review the=
=20
journal entries.

> But (IIUC) setting a bit to a value it already has causing issues,
> sounds surprising as well.

Depends on what hardware does, when you write to a register it might cause
many other things to happen and seems like for vop2 it messes something up.

I made a second patch so that the first write is not permitted but all=20
subsequent are permitted (regardless of lut en state) - issue disappeared=
=20
too. So it might be that very first write to dsp lut disable happens too=20
fast (in relation to something else)?. It is not intuitive because when drm=
 is
a module it happens usually like ~second later.

part of the log with drm=3Dy
```
[    6.543099] rockchip-drm display-subsystem: [drm] GAMMA LUT DISABLE
```

part of the log with drm=3Dm
```
[    7.944120] rockchip-drm display-subsystem: [drm] GAMMA LUT DISABLE
```

> > patched vop2_vp_dsp_lut_disable function so that dsp_ctrl is set only i=
f
> > GAMMA LUT EN bit is set. I checked that this also does not break the ga=
mma
> > lut functionality with emphasis on out-of/into suspend behavior.
> >=20
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop2.c
> > index d0f5fea15e21..7ddf311b38c6 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -897,6 +897,9 @@ static void vop2_vp_dsp_lut_disable(struct vop2_vid=
eo_port *vp)
> > {
> > u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> >=20
> > + if ((dsp_ctrl & RK3568_VP_DSP_CTRL__DSP_LUT_EN) =3D=3D 0)
> > + return;
> > +
> > dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> > vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> > }
>=20
>=20
> I built a kernel with 6.14-rc1 + this patch and can confirm the screen
> has output again :-)

cool :)
=20
> > I will wait with sending a patch because maybe Andy has something to ad=
d
> > to this.
>=20
>=20
> Sounds like a plan. It could be that this issue surfaced an underlaying
> issue and if so, fixing that would be even better.

When i have time this week I will check on what version of the kernel i=20
tested gamma lut when i sent the patches and test there.

> Thanks a lot!
>=20

Thank _you_ for taking your time to do all the bisecting.

Best regards, Piotr Zalewski
