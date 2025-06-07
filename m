Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DB838DEC
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749310344; cv=none; b=XuUEMeArcP65Y6sXlvq/K9PAddnvDBaFnsWM9Vb0V0q6vgQ3n3lDlWD2/mrffVN8XkmeUXe1JjKDlRfrhfNfmKZ1cjjocXUM3UHVsr7oD7NMK5+7E4vzOmVUp6d+zowfC2allgRucoIGK0wyquzayiMdN5WPxApoIxw7qi5lvGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749310344; c=relaxed/simple;
	bh=gvbxnUgRFBMWdeIANvRl8BGLckj66c+EtDmClvsMtfU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OuZaQkew5cJyUvrpllLEP0n9ywOo/U5LWDjSfUlziMHmRwsVChBbkmPfC+psdXinjKiLiaskmTYsojbOu7A+6r96H4IdxlavW3T1u1HSvaOGxv8f3wdUJVgPJjbYjiLL72f/WrC0yyEbyTI5dZPBoh6b+1qOcY64JKny3rz55Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=BdhtvZMV; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="BdhtvZMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749310333; x=1749569533;
	bh=gvbxnUgRFBMWdeIANvRl8BGLckj66c+EtDmClvsMtfU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=BdhtvZMVRJQEFBsaQIeeUMjlWEDt/rtSZs19jXDkD9EPgtm7gExe4UQHnESUmwq5B
	 VjikVewQf+brgldPU7fHlppj/aotNxznUHAE6VqGGpVk0Oz2DM24Jws8W9eAi/gtnL
	 3JPbO/xC30AAqiAQTN6tDtt8+cAxJBSbWKqFGxmAj96GlHKjY+f9onEQSZcdGvxaFt
	 duTjYhRLqVFmlj/8MJHWBqq/uekhJH6jRke199b+RzbFiJJVXGw1bAfS42zAP20k7w
	 NcQXN+hVVwPXqIngyrmeFoKBDCJW0Uzz3iVYHvN6e9YsYKAAMSRsamROauO0GM/t2Q
	 na1NozBdCZXdA==
Date: Sat, 07 Jun 2025 15:32:07 +0000
To: Diederik de Haas <didi.debian@cknow.org>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, Dang Huynh <danct12@riseup.net>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check color_mgmt_changed in atomic_enable
Message-ID: <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me>
In-Reply-To: <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
References: <20241206192013.342692-3-pZ010001011111@proton.me> <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 352bfcde3cb3dc6da16c674e8ab61db239ac70f4
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thursday, June 5th, 2025 at 10:13 PM, Diederik de Haas <didi.debian@ckno=
w.org> wrote:

> Hi Piotr,
>=20
> Since kernel 6.14-rc1 I have the problem that visual output is no longer
> shown on my PineTab2 and a `git bisect` pointed to this patch/commit
> as the culprit. What is important to note is that `CONFIG_DRM=3Dm` seems
> to be required as the problem does not occur with `CONFIG_DRM=3Dy`.
>=20
> Near the end of my bisect session, something interesting occurred.
> I was booted into a 'bad' kernel (ie no visual output) and when I
> started to build my final kernel, I closed the lid of the PineTab2 which
> made it go into suspend. When my final kernel was built, I opened the
> lid again, which made it resume, to transfer my final kernel to it.
> And much to my surprise, I then did have visual output.
> When I read the (below) commit message of the 'offending' commit, it may
> not be such a surprise after all.
>=20
> When I build a (new) 6.14-rc1 kernel with a revert of this commit on
> top, then I did not have the above mentioned problem, confirming this
> commit was the 'bad' commit.
>=20
> I did try it on a Quartz64-B (also rk3566) and it did not have any issue
> (output via HDMI).
> I don't know what the cause for this issue is, hopefully you do.
>=20

Hi Diederik,

I tested and confirmed that this happens with drm=3Dm but also in my case=
=20
it happened when drm=3Dy. After some testing I found out that at boot modes=
et
happened twice and at short interval and since this patch allows for gamma=
=20
LUT update regardless of color_mgmt_changed state this makes DSP CTRL GAMMA=
=20
LUT EN bit to be unset twice too. It seems that VOP does not like it. I=20
patched vop2_vp_dsp_lut_disable function so that dsp_ctrl is set only if=20
GAMMA LUT EN bit is set. I checked that this also does not break the gamma=
=20
lut functionality with emphasis on out-of/into suspend behavior.

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index d0f5fea15e21..7ddf311b38c6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -897,6 +897,9 @@ static void vop2_vp_dsp_lut_disable(struct vop2_video_p=
ort *vp)
 {
 =09u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
=20
+=09if ((dsp_ctrl & RK3568_VP_DSP_CTRL__DSP_LUT_EN) =3D=3D 0)
+=09=09return;
+
 =09dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
 =09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
 }

I will wait with sending a patch because maybe Andy has something to add=20
to this.

Best regards, Piotr Zalewski
