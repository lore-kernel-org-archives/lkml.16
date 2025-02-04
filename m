Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24A320D503;
	Tue,  4 Feb 2025 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670557; cv=pass; b=KrsHLFF4XZlYRHNIuUCtUxZoJmCQF554a/OeVEYuW6qCktxaIY7pifnS/ZA0XNwOoARdu37Nmq2U2QS08HbcRJVg/zrzG24TQa5mPaUeiGF+LQUTTpfW+EbJe7mHkB2T0hcmy0FgtB2Lb9aJBPeP0YxoqSn493LPtGBhaCXvwyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670557; c=relaxed/simple;
	bh=jJChn1EBZKoA8hq4IZ9lhAQlb4nQjkzHWTxQD/b1Ml4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L0cLapJR3DdMH6lVTN1Qb2vxsRSgGWwKXz/8BdWNHMf0wSHKOSJvnt9XAywCZvkR6+r9bsNV61/y5ipII5z2mZwlaah18iTstOJQFPNf//xsz65rbQ7DI+7SuEW75yBvtdS3mTQ8QTC02p9TuqlZSLOZpl3Jl01orHbwbClOjwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b=YWYyoggy; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="YWYyoggy"
ARC-Seal: i=1; a=rsa-sha256; t=1738670529; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MPcT3PirMFcVUC6K5t+AiATIRZ+CMVblzoAioon0E9pkEuM2cUC1z4kjP7uYQtIcyaumTz18yDQpwyn2QEdER4c7lzK1SiTuCT+jRmSF/sNHUYzIQ8fkEzqADo3BdLbSddZGFIxqWyBKtNXEqG1Hy16wXypfDq5jODSb+jfKxhw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738670529; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lMfIKaiQsZajbFthZnROtOHbljWUDtuc2xlWJrPjPX0=; 
	b=YZPNdX1MnjKFJ9O96tMPuDrRfJVY8wtHPSsgYhFFSXoRWgmNqE/INkx3i51/ak7zlBP5JKm17S+EJMnTsBwb8Ouq4Nvrnz0lmpckWdsPLw0rTElqMKvMrd/bfRHNYNmSRduySP3XIfH/IH/iCoMwK3LDglh4G3i23elkQuvdo8M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738670529;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=lMfIKaiQsZajbFthZnROtOHbljWUDtuc2xlWJrPjPX0=;
	b=YWYyoggyW7pIQOCMB9+QJEPhc3auu0nXNRL7xu6GYC1bF/iogPSf+nvn+yW8/5YM
	g6zcipTx7iODxfC/u7p2XAkMN3FMMSA6vl6LFjQUQje3LhzyF4nm1SYcS5Iowyko7++
	qtEMfgi2eTUA10TAyWv5mGTdkMM1gP5ztFVhMjRw=
Received: by mx.zohomail.com with SMTPS id 1738670525370363.03205209504824;
	Tue, 4 Feb 2025 04:02:05 -0800 (PST)
Message-ID: <59eb99d253676ca7f117726260122363469867ab.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Steven Price	 <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Tue, 04 Feb 2025 13:02:00 +0100
In-Reply-To: <2d1780d3-ae78-4adf-a20a-8b6b3891b9b0@kernel.org>
References: <20250130-mt8370-enable-gpu-v2-0-c154d0815db5@collabora.com>
	 <20250130-mt8370-enable-gpu-v2-2-c154d0815db5@collabora.com>
	 <2d1780d3-ae78-4adf-a20a-8b6b3891b9b0@kernel.org>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Thu, 2025-01-30 at 14:17 +0100, Krzysztof Kozlowski wrote:
> On 30/01/2025 13:31, Louis-Alexis Eyraud wrote:
> > Add a compatible for the MediaTek MT8370 SoC, with an
> > integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core),
> > with the same platform data as MT8186 (one regulator, two power
> > domains).
> >=20
> > Reviewed-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
> > ---
> > =C2=A0drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index
> > 0f3935556ac761adcd80197d87e8e478df436fd5..7b7e9f6f620659a7fdcb5d907
> > ebc4f01eca876e0 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -859,6 +859,7 @@ static const struct of_device_id dt_match[] =3D {
> > =C2=A0	{ .compatible =3D "mediatek,mt8186-mali", .data =3D
> > &mediatek_mt8186_data },
> > =C2=A0	{ .compatible =3D "mediatek,mt8188-mali", .data =3D
> > &mediatek_mt8188_data },
> > =C2=A0	{ .compatible =3D "mediatek,mt8192-mali", .data =3D
> > &mediatek_mt8192_data },
> > +	{ .compatible =3D "mediatek,mt8370-mali", .data =3D
> > &mediatek_mt8186_data },
>=20
> Nothing improved here. All my previous comments still stand.
>=20
> Best regards,
> Krzysztof
Hi,

I'll reword this commit message in V3 to add that despite GPU
architecture difference (making them being not compatible), the MT8186
platform data can still be used for MT8370 too because it only
describes supplies, domains and enablement of power management features
in the driver.

Regards,
Louis-Alexis
