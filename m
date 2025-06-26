Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19F716DEB3
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951927; cv=pass; b=qjblPk64YksJw1fotM+dYjSQPq4hJf8mv25ZzOmQ4kTxNbxMeF9YlV+3XtOm0wapYKzpzyapT0oQ0V7KEaYahkdvPkoCKwub4ZIHHqbvQbJaNMpFU5moC+VLs1Xrd+REsSJ22ZOxFHIDE1IkPPApAJhnvsAL32jA+WXGa3a9rRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951927; c=relaxed/simple;
	bh=QzJ+mw1mZ61E4BVBc6eVU0mJdCfS5N8n38LYhvIVPcQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QxP5WVYSQSVDf2yusUQNLA3XZRQB3LWGfmpMYlnkcCMTFB81LpOv79vzHEiAvt5YErzuYXX8sBR2l9qFJoPLTxnr/JpsgUvILQ8J8IwfeZoqts4BlUPLoBBK1OxAH1sr1XWITLFVkINSQR8roi77dPmGC7WRMEh4uSFbi1W0ch4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=GPwvi2JE; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="GPwvi2JE"
ARC-Seal: i=1; a=rsa-sha256; t=1750951908; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FrndBkfH5Yb2hczHdjvZqLHKmGh24t0qRtvSHL54QVLoPvLancdd9ugXgSDXr1yfWFaiA+96D7SNInWSRIKjBaLrLdQcAxuHyJq9MS5VMMa5UgH2p09eOnrl17YZJyo16szJHeWrAAtqomNQ+5ViaIM1hU/hkTXtvrj6Q00z1qY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750951908; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QzJ+mw1mZ61E4BVBc6eVU0mJdCfS5N8n38LYhvIVPcQ=; 
	b=EnEyuXkYIqKLKBz4gRYejn0GG5+5NQ6QGEYB0o2XKiJKwpHS49P9LskOZViHoDDIIZ5evX2ic6yYL8d5UhZETAE+OTkyM8fpwjcSYHfaFl4MYm9lN+t4cppALW0Rxd/wbR8VMzaf2vRHjzpSjXo3+wb1HDLn98cLTZqDzutbe8M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750951908;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=QzJ+mw1mZ61E4BVBc6eVU0mJdCfS5N8n38LYhvIVPcQ=;
	b=GPwvi2JERhAm14b28wt6nqJSJUgC5hmNtxTniKoaSYSUD26Dut6Qy7SZDtqXlPC+
	u+c4iDnGone5HN01r5dARbuDDXUm9+qTLPZzTuUjRh2hrZAh0W9XL3Q/3opVM/RKrGC
	fGjtjiwqkyO+q2Wrigk0TmnOpkut8cQUyksJUZmc=
Received: by mx.zohomail.com with SMTPS id 1750951905438943.3169151421496;
	Thu, 26 Jun 2025 08:31:45 -0700 (PDT)
Message-ID: <e6b3c842625d9740da2481f9b5893015ac699db0.camel@collabora.com>
Subject: Re: [PATCH] arm64: defconfig: enable further Rockchip platform
 drivers
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Heiko Stuebner
	 <heiko@sntech.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	 <will@kernel.org>
Cc: kernel@collabora.com, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Jun 2025 11:31:38 -0400
In-Reply-To: <20250626-rk3588-defconfig-v1-1-39a19a41c181@collabora.com>
References: <20250626-rk3588-defconfig-v1-1-39a19a41c181@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Thu, 2025-06-26 at 17:16 +0200, Nicolas Frattaroli wrote:
> The RK3588 SoC, and its sibling, the RK3588S, are supported by
> mainline
> Linux. However, some of its SoC drivers are currently not enabled in
> the
> arm64 defconfig.
>=20
> Enable rockchip-dfi, rockchip-rga, and the Rockchip specific
> extensions
> to Hantro as modules.

Personally I don't think the first paragraph adds much, so I'd drop it.
=C2=A0
Also I feel like you're missing the most important information here,
which is what these modules are used for, so I'd focus on that eg
"Enable configs for rockchip-dfi, rga, hantro, etc. This enables
monitoring of DDR load, usage of the hardware codecs, etc"

>=20
> These drivers are also used on other Rockchip SoCs that mainline
> supports, notably RK3566/RK3568, as well as RK3399.
>=20
> Suggested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> =C2=A0arch/arm64/configs/defconfig | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm64/configs/defconfig
> b/arch/arm64/configs/defconfig
> index
> e071f8f45607dbfd8e00b915b27999949ee0fc88..8b5ecb20ed6450faa0da14a6fdb
> 4cb227a1f735f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1789,3 +1789,6 @@ CONFIG_CORESIGHT_STM=3Dm
> =C2=A0CONFIG_CORESIGHT_CPU_DEBUG=3Dm
> =C2=A0CONFIG_CORESIGHT_CTI=3Dm
> =C2=A0CONFIG_MEMTEST=3Dy
> +CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=3Dm
> +CONFIG_VIDEO_ROCKCHIP_RGA=3Dm
> +CONFIG_VIDEO_HANTRO_ROCKCHIP=3Dm

You should run make savedefconfig and commit the configs from the
generated defconfig so they're in the right place in the defconfig,
rather than just appending them to end like this.

--=20
Thanks,

N=C3=ADcolas
