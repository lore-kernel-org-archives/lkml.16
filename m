Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093F8204F83;
	Thu, 24 Apr 2025 08:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745485149; cv=pass; b=PJ5o9LQMLb9/ynXx3/ElZg9BE7wudXapdYoOth8yz23/ICxNb2ZQ8c3MPcJYICHzhKHJ7Gxdyn4hImQiAq+7grPuMODo7LufoMsv2F+FNSQ2QWWHHDd4m1LChgVTJR7WaYiwdHTlpmnS/IiU03WcYsm743ksPgjImvWTiCU0TfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745485149; c=relaxed/simple;
	bh=zDWc6nxv/h21OoGkVTdcFrzjcHE7JIncVZ3LhKXbeB4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CUbLM3Eazhf77kLhjky96Bm9IPon2OWchqHFNT+eJutUSwVsn3szuIxiTkn/R3avj6G2TCmsJMsTpnEzY2h+4+wmrLfjHR0POB/ap7s7dV5jEenGgWlW82g+0nT6RByOmiLSkRZW7K8/kPS+kllSo4vMYlNaWQ9l+NVROV2LRo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b=PVQCVxDx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="PVQCVxDx"
ARC-Seal: i=1; a=rsa-sha256; t=1745485127; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jaV0x3qj/eqBLIwubtgE8KUAQn2b86GxCDmo0XTJPYmIQTCRZbHHx0dxGpQTlkucxhzTG8QN0tqyWNwbybF2orNap/vE+IniaHZmVhYTKUglVdEtAjxrRAN0Wl+Bo3LED2AF7NTBBIMkwPo5qwWvSn9acvulMqHIjcwXx+oew/Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745485127; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J3UW6p735sL0uDpuTdjeAlDlTVS5KOHJnqXmFJV22mw=; 
	b=PmhFNP+E145dBDrIHOeTs0XSN9iyyy8OMNz0BuUQwX46Mkf5FxF5MGKd1dBTFthSHwJf8+8aQ1joZbq8rqJyIebtkFxVGo+yWMl41irPEGix+JVYVESlFrASouINYXD3iWsUFA59uxtpFr0t6XJGkr9ib8FZLt/yza5kr2Hk5C8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745485127;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=J3UW6p735sL0uDpuTdjeAlDlTVS5KOHJnqXmFJV22mw=;
	b=PVQCVxDx9e3a/r7iDgv31fTD2bXDL/+qSkeZBxJWbJ8zNwiBRVfcuBefy6RXabAe
	Sc2ek7+pOwcCZIEVeI1Yum4rlDFRBOahhVZqOXaRDYlQ0yK0R+/u04vJf80yQSppVeh
	WMk3rWdafvd4LohpsEpBvGwUy/zpt8OxbD86yNf4=
Received: by mx.zohomail.com with SMTPS id 1745485124022311.75237554150374;
	Thu, 24 Apr 2025 01:58:44 -0700 (PDT)
Message-ID: <fd4f9f760c4860216aeb58a91a75c24dda64919c.camel@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Force ssusb2
 dual role mode to host
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado"
	 <nfraprado@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Thu, 24 Apr 2025 10:58:39 +0200
In-Reply-To: <eb350c96-379a-46db-8a54-e1b9c71be431@collabora.com>
References: 
	<20250331-mtk-genio-510-700-fix-bt-detection-v1-1-34ea2cf137f3@collabora.com>
	 <2da6560b-8444-48ae-bb01-397756cecbc0@notapiano>
	 <eb350c96-379a-46db-8a54-e1b9c71be431@collabora.com>
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

Hi Angelo,

On Thu, 2025-04-24 at 09:24 +0200, AngeloGioacchino Del Regno wrote:
> Il 23/04/25 22:48, N=C3=ADcolas F. R. A. Prado ha scritto:
> > On Mon, Mar 31, 2025 at 11:25:52AM +0200, Louis-Alexis Eyraud
> > wrote:
> > > On the Mediatek Genio 510-EVK and 700-EVK boards, ssusb2
> > > controller is
> > > one but has two ports: one is routed to the M.2 slot, the other
> > > is on
> > > the RPi header who does support full OTG.
> > > Since Mediatek Genio 700-EVK USB support was added, dual role
> > > mode
> > > property is set to otg for ssusb2. This config prevents the M.2
> > > Wifi/Bluetooth module, present on those boards and exposing
> > > Bluetooth
> > > as an USB device to be properly detected at startup, so configure
> > > for
> > > the ssusb2 dr_mode property as host instead.
> > >=20
> > > Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add
> > > USB, TypeC Controller, MUX")
> > > Signed-off-by: Louis-Alexis Eyraud
> > > <louisalexis.eyraud@collabora.com>
> > > ---
> > > I've tested this patch on Mediatek Genio 510-EVK board with a
> > > kernel
> > > based on linux-next (tag: next-20250331).
> > > ---
> > > =C2=A0 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 8
> > > +++++++-
> > > =C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-
> > > common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-
> > > common.dtsi
> > > index
> > > 60139e6dffd8e0e326690d922f3360d829ed026b..3a9d429f0f14b501ae41551
> > > dfe7272f242345138 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> > > @@ -1199,7 +1199,13 @@ xhci_ss_ep: endpoint {
> > > =C2=A0 };
> > > =C2=A0=20
> > > =C2=A0 &ssusb2 {
> > > -	dr_mode =3D "otg";
> > > +	/*
> > > +	 * the ssusb2 controller is one but we got two ports :
> > > one is routed
> > > +	 * to the M.2 slot, the other is on the RPi header who
> > > does support
> > > +	 * full OTG but we keep it disabled otherwise the BT on
> > > the M.2 slot
> > > +	 * USB line goes obviously dead if switching to gadget
> > > mode.
> > > +	 */
> > > +	dr_mode =3D "host";
> >=20
> > Hi,
> >=20
> > while I agree with this change, now that this controller is fixed
> > to host mode,
> > the connector child node here which is supposed to probe with
> > driver
> > usb-conn-gpio, which would monitor the ID and VBUS lines and change
> > the USB role
> > as needed, will fail to probe with:
> >=20
> > =C2=A0=C2=A0 platform 112a1000.usb:connector: deferred probe pending: u=
sb-
> > conn-gpio: failed to get role switch
> >=20
> > as indeed there no longer is a role switch registered.
> >=20
> > For that reason, I believe as part of this commit you should also
> > disable the
> > connector. Since role switching is no longer supported by this
> > controller,
> > there's no sense in even trying to probe this driver.
> >=20
> > Thanks,
> > N=C3=ADcolas
>=20
> Can we instead go for role-switch-default-mode =3D "host", with a big
> comment
> in the devicetree saying that the controller is shared between BT and
> the other
> port? :-)
>=20
> Cheers,
> Angelo
Using role-switch-default-mode property (set to host) does work as an
alternative fix in order to keep the dr_mode set to otg and also not
having a error about the connector too.
But I also needed to change the associated GPIO polarity, otherwise the
role mode would remain device and the BT module would not still be
detected.
I'll make those changes in the v2 patch.=20

Regards,
Louis-Alexis
