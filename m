Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B51158DAC
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 18:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751134281; cv=none; b=Qp/wm9ao5Qbtlw0ncG2bnK76zBTVEsgn2LUDW8N2xl3u8KGgntiZu4XF8RpIz49oz6LASry/y/xi5JhjBOZ9/JjA8cInlcJSoUeFdx9cgScSDpSxcLwEqHYuw54eX84J3q0epifNQ3b4LU60XL5twYJGVJYE4mZigNtraJ1stSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751134281; c=relaxed/simple;
	bh=sMzOYnHdgpVcgrhJy7CaFl7jf7Qy6nohhn6zKrjhWTE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jUJk0TTQ7PN5zIck2yh2ziYbFtZ9zsXHxo2Xlcfe7IIT6+uzJ+jUP+U/IAotphU9i9/Bu3mT+JBpj/AwsrDUpaRTYf6NkYB7Lk1m3+DZEvKHmA9ycvUAtjn+aG7LNEgdoWvNELLMXu1h+EoDyLWzyaGAPprx4pKLeyq7A7VRpUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Ec8s2KMC; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Ec8s2KMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=6cpe4ktcdvd67ngbngfuz5xzca.protonmail; t=1751134268; x=1751393468;
	bh=dq6sTVoUvyIYla+M1WiLd0H4wGmmDdgUa/v1ni4cxzA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Ec8s2KMC4SC/8PnZ0fXrVzIwaMSosjk22f1lvjVVhR6WKSB8mHkF1ZnWUJDwRlN3d
	 O5Pa+f7QkVv/a+qR74ytqZMHjCJ8VrrKr4vZc1oqz1VOt8gs5SCFOUVcGAiJpBn9+z
	 xhGcxOc39tHaQRZtNuW564JTsgewLdlUEX3zcssxyu08TMP25TbGBt8TfY0w7OZ7Hs
	 8eWNu9Dl9ubtxdO/FpPp/d7jJ6bwnVx5btKdOhIRT/z93YE+jAZ9uJ9/XBo7MlToII
	 dBO9kLHPW1CNBKY/laqf+9Z0GdApiEclzFJ0qFIlrrHA//6I1gJHb4ubSJj37QThrv
	 vz/2gWSbPKmag==
Date: Sat, 28 Jun 2025 18:11:00 +0000
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] rockchip/drm: vop2: make vp registers nonvolatile
Message-ID: <20250628180914.1177177-2-pZ010001011111@proton.me>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 545f9ed5d7d61bdded3750b1707295524307882c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Make video port registers nonvolatile. As DSP_CTRL register is written
to twice due to gamma LUT enable bit which is set outside of the main
DSP_CTRL initialization within atomic_enable (for rk356x case it is also
necesarry to always disable gamma LUT before writing a new LUT) there is
a chance that DSP_CTRL value read-out in gamma LUT init/update code is
not the one which was written by the preceding DSP_CTRL initialization
code within atomic_enable. This might result in misconfigured DSP_CTRL
which leads to no visual output[1]. Since DSP_CTRL write takes effect
after VSYNC[1] the issue is not always present. When tested on Pinetab2
with kernel 6.14 it happenes only when DRM is compiled as a module[1].
In order to confirm that it is because of timing I inserted 18ms udelay
before vop2_crtc_atomic_try_set_gamma in atomic enable and compiled DRM
as module - this has also fixed the issue on Pinetab2.

[1] https://lore.kernel.org/linux-rockchip/562b38e5.a496.1975f09f983.Corema=
il.andyshrk@163.com/

Reported-by: Diederik de Haas <didi.debian@cknow.org>
Closes: https://lore.kernel.org/linux-rockchip/DAEVDSTMWI1E.J454VZN0R9MA@ck=
now.org/
Suggested-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Piotr Zalewski <pZ010001011111@proton.me>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index d0f5fea15e21..241060cc24cb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2589,12 +2589,13 @@ static int vop2_win_init(struct vop2 *vop2)
 }
=20
 /*
- * The window registers are only updated when config done is written.
- * Until that they read back the old value. As we read-modify-write
- * these registers mark them as non-volatile. This makes sure we read
- * the new values from the regmap register cache.
+ * The window and video port registers are only updated when config
+ * done is written. Until that they read back the old value. As we
+ * read-modify-write these registers mark them as non-volatile. This
+ * makes sure we read the new values from the regmap register cache.
  */
 static const struct regmap_range vop2_nonvolatile_range[] =3D {
+=09regmap_reg_range(RK3568_VP0_CTRL_BASE, RK3588_VP3_CTRL_BASE+255),
 =09regmap_reg_range(0x1000, 0x23ff),
 };
=20
--=20
2.50.0


