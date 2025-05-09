Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A382238C19;
	Fri,  9 May 2025 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746809514; cv=none; b=IQOO3d7n881EXR1WlHoy9ALSpq8BoGJNoZLdhBfHWYVfSa7L5HT/0o7/rxSQUB/dvNd+FCZH5Sl9yKXKd+d0U6MYhJhgHOiyOfLILifomuLB0Dbl10u7166BIsnieNH0uDpg6IvmStYMnOrlA2Fffm7z4RplVPy1QSayVL5skZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746809514; c=relaxed/simple;
	bh=9tmfUQl7n6sCe4B6VOxGhrGgZC2hfLqoLZRw4v0V5dg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=joAaeE0UGAFZu2qvuXgh6cUIWW4n4A71OHEzfjfacLJ5AIs1U4J2gbtkY2C0nZsQr8nGZESuHuurmHAj2BBowQaCO7Z9Mm4GTg4EwN8i6FfVcfm6m6OwrGV1i9H4VqTxWE2U2+i2AOs57RyY54oY9xR7dMRwwyqcAOuiBNa72IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=P/NX0RgH; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="P/NX0RgH"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746809509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ckl3vux5StOjvP2+47jrXU3fLRpLeSvxiApo1TU/VDQ=;
	b=P/NX0RgHit5EEJXk2v6IpDcc0CmX9jjuKGJ8J8O5RFsGJ+rX/Zfmu63/p9HRzmJ0SEju20
	pN/gP6SdukESlLnnl2aOcQMGBMKpLbRL94g/juVXzwRKDpD05cfRZQ8VUzJA29MnSUgMZo
	ZY4jHyKEEzcKFwwvHSoce0HjegXD/XQoC3oHYQxUqnMJtD5Job1emTRTCTV1VNsFpYqyB4
	jx8bXA/Cqycgs8BL93wm4v4emqKSe08tJV905bRCSeEdKjQlyHIPr69944V7VG5RAvu1H0
	GyRVpehpmWhks+9m0/OocqJs2C+FWFdssWbUkQJHyPXeEUX0eMh99gpsf78PVA==
Content-Type: multipart/signed;
 boundary=3e23f8a3f7dd23a047277bc59f050a2e77210dee6735ec02b945a8d601bd;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 18:51:21 +0200
Message-Id: <D9RSA5K547DD.1LYPIZZM4XALS@cknow.org>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Dragan Simic" <dsimic@manjaro.org>, "Rob Herring"
 <robh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use
 GIC ITS
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Diederik de Haas" <didi.debian@cknow.org>, "Chukun Pan"
 <amadeus@jmu.edu.cn>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250308093008.568437-1-amadeus@jmu.edu.cn>
 <D9RQN76VZXO8.T3I0046FNVG3@cknow.org>
In-Reply-To: <D9RQN76VZXO8.T3I0046FNVG3@cknow.org>
X-Migadu-Flow: FLOW_OUT

--3e23f8a3f7dd23a047277bc59f050a2e77210dee6735ec02b945a8d601bd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi again,

On Fri May 9, 2025 at 5:34 PM CEST, Diederik de Haas wrote:
> On Sat Mar 8, 2025 at 10:30 AM CET, Chukun Pan wrote:
>> For a long time, rk3568's MSI-X had bugs and could only work on one node=
.
>> e.g. [    7.250882] r8125 0002:01:00.0: no MSI/MSI-X. Back to INTx.
>>
>> Following commit b956c9de9175 ("arm64: dts: rockchip: rk356x: Move
>> PCIe MSI to use GIC ITS instead of MBI"), change the PCIe3 controller's
>> MSI on rk3568 to use ITS, so that all MSI-X can work properly.
>>
> I tested this patch on my NanoPi R5S with a 6.15-rc3 kernel + a number
> of [vcc|phy]-supply patches that have been accepted for 6.16 (and a
> small WIP LED patch).
>
> With this patch I get the following kernel warnings:
>
> pci 0001:10:00.0: Primary bus is hard wired to 0
> pci 0002:20:00.0: Primary bus is hard wired to 0
>
> If I 'unapply' this patch, I don't see those warnings.

I was pretty sure I had seen those messages before, but couldn't find
them before. But now I have: on my rk3588-rock-5b.

> It's possible that this patch only brought a(nother) problem to light,

So it looks indeed to be this.

Cheers,
  Diederik

>> Chukun Pan (1):
>>   arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
>>
>>  arch/arm64/boot/dts/rockchip/rk3568.dtsi | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)


--3e23f8a3f7dd23a047277bc59f050a2e77210dee6735ec02b945a8d601bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaB4yngAKCRDXblvOeH7b
btTxAP9xcOOm/DKb1fMqBqNcR6qUMiNnWv1MKSyU06BFXAH6LQEAocEqmFyRa4iT
xDj91oyTLTpAr8k0/xJZDB//WWhFPgs=
=V4q7
-----END PGP SIGNATURE-----

--3e23f8a3f7dd23a047277bc59f050a2e77210dee6735ec02b945a8d601bd--
