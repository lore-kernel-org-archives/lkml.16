Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10671EFF80;
	Wed,  4 Jun 2025 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043482; cv=pass; b=V/0adaXcslbJLPQ4oFLjlwdi8JjSPOn6LwdEyPRFF4p+I7+pTCY9nugWq/0kUQWL0R6tPYpgkSc6BvVu9Op/4HGIpulpibkoBYAE5bKGCNOxA6qtG4w40cNH6hiMvnVyIbZ+OjwPTiXVY7UFpo1nLP8xlCucnNTAWE7ESbG2GbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043482; c=relaxed/simple;
	bh=WwNZ3AI2TacFgCaCJN2Dr0iF8pej/Zyd3d1CffWyS1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JNh/Q2DKYZzSZqSnPaeHpA+w3Aa1BfaWD3uxKDMA80SJKkPGQDjYMq7Atcig1/xU/qHmwnwuMb2PrHhOkNFG+iieWKfxEHOUm2nkd7kcTZfL2N94M71rati8Mx3+B3aF56IENMjgEXBIzj8gYUNErRMqkR8MXYrC5GsueKqH1uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=UFuUk7U0; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="UFuUk7U0"
ARC-Seal: i=1; a=rsa-sha256; t=1749043468; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kh2iUeK+/ZYvPaLk72mpcP5zsfS7Ua6a0zQkfuPR0A8pLHFxw5SebyZVlhNSojGKB6mARcZGBI4FSAjlXaUquHJtOK4j+mWE0XCvntWTcQZ+9Ou393Zy51U70n4BKZVPRaj7xeUyJlidIhlLYyZeuXIk61Xep5NLtYfJCGQQ+74=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749043468; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wCNTPJfskIhANg0RiKYHsBz7kOPSHztZlUotAgnVEF0=; 
	b=mNAlllKP7hd6uFXPYjbLfO0KOaSUQoKMkvprCj3dlSDo+EvdRXd7Q4e+n4FxAQWZglZZQgJ9zO2N1prnuR7tnTA9J1YupRZmfVE3AQE9xNrb1F7Gd7fWTm9MFH/ZT/57jN1BJ7/jClg2bZFWjgDPoLeB+Y/At9gCIdGGN4sHO4U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749043468;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=wCNTPJfskIhANg0RiKYHsBz7kOPSHztZlUotAgnVEF0=;
	b=UFuUk7U0iVkVcYwV/BWOTKu/Mn7HG3BvcbST3LvUU6rPkqSe1mJ96LESVOJ85ore
	G69LWWzPm1Ne4TX1P1PQ/qN3qn0y0Sv/VngAVb7tQmkKnn1EES8ldDwEDh9Kbrckav+
	O05rTCJcYTQhscMv1DcWSeDHAPfCiwC+WyD9Nhz4=
Received: by mx.zohomail.com with SMTPS id 1749043466448171.76502669274078;
	Wed, 4 Jun 2025 06:24:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/4] arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
Date: Wed, 04 Jun 2025 15:24:22 +0200
Message-ID: <4317526.1IzOArtZ34@workhorse>
In-Reply-To:
 <CABjd4YwtbMTT1W1rEdZzZ=KC3_EXXYKQBsTMiH5mPXPhgvQ=Lw@mail.gmail.com>
References:
 <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <5590100.Sb9uPGUboI@workhorse>
 <CABjd4YwtbMTT1W1rEdZzZ=KC3_EXXYKQBsTMiH5mPXPhgvQ=Lw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 4 June 2025 08:52:51 Central European Summer Time Alexey Char=
kov wrote:
> On Tue, Jun 3, 2025 at 9:51=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > On Tuesday, 3 June 2025 19:01:14 Central European Summer Time Alexey Ch=
arkov wrote:
> > > Enable the two USB type A ports (USB2 and USB3) present on the ArmSoM
> > > Sige5 board.
> > >
> > > Both ports use just one xHCI controller, with the USB 2.0 signals fed
> > > off the same USB OTG PHY through an onboard hub. VBUS of both ports is
> > > controlled by the same GPIO regulator (VCC_USBHOST in the schematics,
> > > toggled by GPIO4 RK_PA6).
> > >
> > > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > > ---
> > >  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 38 ++++++++++++=
++++++++++
> > >  1 file changed, 38 insertions(+)
> > >
> >
> > This is already done here:
> >
> > https://lore.kernel.org/linux-rockchip/20250507-rk3576-sige5-usb-v3-4-8=
9bf5a614ccf@collabora.com/
>=20
> Oh cool! Sorry I missed that one. Your series is much more
> comprehensive, so this patch of mine can be dropped. Thanks for your
> work!
>=20
> Would you mind chiming in on the other patches here, given your
> knowledge of the hardware?

I gave the others a brief look yesterday, I'll give a more in-depth look
and test today and send you my Tested-by and Reviewed-by.

>=20
> By the way, you guys don't seem to carry those patches of yours in the
> Collabora tree [1]? Nor the TSADC updates as far as I can tell.
>=20
> [1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/=
=2D/blob/rockchip-release/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.=
dts?ref_type=3Dheads
>=20

Yeah, I just sent them upstream directly, since at this stage it wasn't a
SoC and board in wide enough circulation yet where a ready-to-use public
tree with all the in-flight patches made sense for the added chore of
rebasing things when new version of patch series get submitted imho.
Though since some of them have been languishing with no upstream response
for quite a while (*cough* TSADC *cough*) and some more RK3576 hardware,
notably the RADXA ROCK 4D, released in the meantime, it may make sense to
have them included in either our rockchip-release or rockchip-devel tree.

If you want to keep up to date on what's in flight, our RK3576 mainline
status matrix at https://col.la/rk3576status is usually kept fairly up to
date.

Hopefully once v6.16-rc1 drops, upstream maintainers/reviewers are in a
better position to take a look at some of those patch series again, I'll
resubmit them when the time comes. Nothing lights a fire like a RESEND
prefix in a series.

> Best regards,
> Alexey
>=20

Kind regards,
Nicolas Frattaroli


