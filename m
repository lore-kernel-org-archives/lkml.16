Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C34EB660;
	Thu, 30 Jan 2025 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738239373; cv=pass; b=rcp9sz6JjV0VMX1yd4AXkkQEPYTN1wdb2EE8E6Id/KamyUEvwkUFs+Nntdt1yUJ62lM4Ni7FpoRprUh+RuVtrf4PwQPVXYbVqF4bwrTO+F2Vp3fmhuXDViIlHOJCXu9BI1AZmdA1GJBngSjWxq52utUyt6O1/W1eusI2NTp7DlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738239373; c=relaxed/simple;
	bh=NhjWn71blrawadwTQcygIseL1rRYAGUDgnjHvN3IQ9A=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=NOCgTHyAYrhuU5Ok9UxRMpkvX/uWSxEK9RDUZU/H0LR2vBVZlkrLubmfa92pEUCawUIqsQ08mnOa42WHrpeRUumnQicstBJl87yBs40IyIR7I1oD6lOgXNunXxLVxPd7oncqK/f/fPY7PXCeXe1aL+30L5nKdKGNmFrxpLndHpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b=Xy6QLsBv; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="Xy6QLsBv"
ARC-Seal: i=1; a=rsa-sha256; t=1738239343; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kUKLD131ujnf9MGxdR4qc0pAWhSJI16fuG3rsd7YkP9WoGJOl3ngEVtMmhHhRaDgMOl+qDKC1FktFleXTsoNQnexiVnZI6rgnMTjpTiR41qM8906YQSNDpOVIaiR0/h7YMSqzyr/srfN9nZSBj/IUYjYEnNrT6SEOX5cK6cfhc0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738239343; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vtqvkjW++P13EILfu6kPduF5HHVIDhPG3bCc05q2yIw=; 
	b=RN52rTs/CG5wK9wqAIr1XIzrinACSwAq/TPtbhYbeFWdW02NSPaSKMJ22qRzI7AYNGXdVMaVHxrgx9J0OZ4JVwpM+a0RUgmi1hvWVD/uUZDLBds05yon9a/2VmgBiD3zSWquGaP6ZY4SEn9rqgDkwWKYkdXWMt2mNakHmzJ7WxU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738239343;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vtqvkjW++P13EILfu6kPduF5HHVIDhPG3bCc05q2yIw=;
	b=Xy6QLsBv399RQrHj3yLnO4xSaVy1gQtccoGnHwsh1kT7Z3gRzhZp81Oul7fJFv2F
	oLiyxt2zC0WDndQG+BnhKMXGik3kSVOB/qb3v0vAF6Ye/Q/ImQkn7g8MWPVPN+jSNcy
	UGtwIHj4VbItttr+CjWKeQPcD3f6ArGfn5ryfpd8=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1738239340867764.380040312308; Thu, 30 Jan 2025 04:15:40 -0800 (PST)
Date: Thu, 30 Jan 2025 13:15:40 +0100
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>, "Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	"Boris Brezillon" <boris.brezillon@collabora.com>,
	"Steven Price" <steven.price@arm.com>,
	"kernel" <kernel@collabora.com>,
	"dri-devel" <dri-devel@lists.freedesktop.org>,
	"devicetree" <devicetree@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek" <linux-mediatek@lists.infradead.org>
Message-ID: <194b7237128.10f9923a41656565.5574753983898665940@collabora.com>
In-Reply-To: <20250118-meticulous-black-caracal-ec7f0d@krzk-bin>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
 <20250116-mt8370-enable-gpu-v1-2-0a6b78e925c8@collabora.com> <20250118-meticulous-black-caracal-ec7f0d@krzk-bin>
Subject: Re: [PATCH 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello,

sorry for the delay,

 ---- On Sat, 18 Jan 2025 17:08:10 +0100  Krzysztof Kozlowski  wrote ---=20
 > On Thu, Jan 16, 2025 at 03:25:58PM +0100, Louis-Alexis Eyraud wrote:
 > > This commit adds a compatible for the MediaTek MT8370 SoC, with an
 > > integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core), and adds
 > > platform data using the same supplies and the same power domain lists
 > > as MT8186 (one regulator, two power domains).
 > >=20
 > > Signed-off-by: Louis-Alexis Eyraud louisalexis.eyraud@collabora.com>
 > > ---
 > >  drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
 > >  1 file changed, 10 insertions(+)
 > >=20
 > > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm=
/panfrost/panfrost_drv.c
 > > index 0f3935556ac761adcd80197d87e8e478df436fd5..1d51b64ed0f0660cc95263=
a289d5dad204540cfd 100644
 > > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
 > > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
 > > @@ -837,6 +837,15 @@ static const struct panfrost_compatible mediatek_=
mt8192_data =3D {
 > >  =C2=A0=C2=A0=C2=A0=C2=A0.pm_features =3D BIT(GPU_PM_CLK_DIS) | BIT(GP=
U_PM_VREG_OFF),
 > >  };
 > > =20
 > > +/* MT8370 uses the same power domains and power supplies as MT8186 */
 > > +static const struct panfrost_compatible mediatek_mt8370_data =3D {
 > > +=C2=A0=C2=A0=C2=A0=C2=A0.num_supplies =3D ARRAY_SIZE(mediatek_mt8183_=
b_supplies) - 1,
 > > +=C2=A0=C2=A0=C2=A0=C2=A0.supply_names =3D mediatek_mt8183_b_supplies,
 > > +=C2=A0=C2=A0=C2=A0=C2=A0.num_pm_domains =3D ARRAY_SIZE(mediatek_mt818=
6_pm_domains),
 > > +=C2=A0=C2=A0=C2=A0=C2=A0.pm_domain_names =3D mediatek_mt8186_pm_domai=
ns,
 > > +=C2=A0=C2=A0=C2=A0=C2=A0.pm_features =3D BIT(GPU_PM_CLK_DIS) | BIT(GP=
U_PM_VREG_OFF),
 > > +};
 >=20
 > No, people, stop this nonsense. This is exactly the same as previous.
 > Don't duplicate entries just because you want a commit.
 >=20
I added this new compatible in bindings and panfrost driver because there w=
ere no other matching compatible=20
Using another mali-vallhal-jm compatible would make the driver probe fail b=
ecause of power domains number difference.=20
Using mt8186-mali compatible would work without modifications but as it is =
not the same architecture (mali-bifrost), it would be incorrect.

I've also misguessed on the dt_match array modifications, sorry.
I'll amend this patch in order to reuse the mt8186 platform data instead.

 > > +
 > >  static const struct of_device_id dt_match[] =3D {
 > >  =C2=A0=C2=A0=C2=A0=C2=A0/* Set first to probe before the generic comp=
atibles */
 > >  =C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "amlogic,meson-gxm-mali",
 > > @@ -859,6 +868,7 @@ static const struct of_device_id dt_match[] =3D {
 > >  =C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "mediatek,mt8186-mali", .da=
ta =3D &mediatek_mt8186_data },
 > >  =C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "mediatek,mt8188-mali", .da=
ta =3D &mediatek_mt8188_data },
 > >  =C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "mediatek,mt8192-mali", .da=
ta =3D &mediatek_mt8192_data },
 > > +=C2=A0=C2=A0=C2=A0=C2=A0{ .compatible =3D "mediatek,mt8370-mali", .da=
ta =3D &mediatek_mt8370_data },
 >=20
 > No, express properly compatibility or say in bindings commit msg why
 > devices are not compatible.
 >=20
I'll reword in V2 the commit messages to make the compatible need more expl=
icit.

 > Best regards,
 > Krzysztof
 >=20
 >=20

Regards,
Louis-Alexis Eyraud
