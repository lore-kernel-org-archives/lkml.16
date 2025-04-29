Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0421D3E2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939602; cv=none; b=G2TyEzzeCuD1FahbqS2rt3GZOzC3/JL7VA9e4Alrkm06J4P/k14BietP6qbNQps5Ut5o/Sc7dqE3YVMkR02OsZFmxLsiHosVHJJbnhQgwXEW7vSpDoshJNohoB5SyNx5RcAxjByF19HFSy57z936F55fKn0VwCQAezBLaaHrne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939602; c=relaxed/simple;
	bh=b+WV1YgMrzOlLeB6/e1Q2R7G89OFhxRWSo9PzI4EV5g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DXk/X6MKRcIyberYtNhPl0VmsY41Nb6sI46lAXLz1DaCGRN9Uip1MkcSVz5BT3RPC1SVaDXXACsUryUWh5OU7M3lx7rllKfqx5mfqcuOL5Ck4jd+BT/qY3GmXpd+jrVwvKXHCKE2wSgpt/KsfUaLm58opLe84jwJZ9ZsNv4TPBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1u9mdr-0003aE-21; Tue, 29 Apr 2025 17:13:03 +0200
Message-ID: <06efb082c24176e6401265b4349b677468850f7d.camel@pengutronix.de>
Subject: Re: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC
 DTSI
From: Lucas Stach <l.stach@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Tue, 29 Apr 2025 17:13:01 +0200
In-Reply-To: <c5538590-efe4-4b90-b291-6c429d8fa3fe@kernel.org>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
	 <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
	 <c5538590-efe4-4b90-b291-6c429d8fa3fe@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Am Dienstag, dem 29.04.2025 um 16:30 +0200 schrieb Krzysztof Kozlowski:
> On 29/04/2025 11:39, Lucas Stach wrote:
> > Hi Krzysztof,
> >=20
> > Am Freitag, dem 25.04.2025 um 21:48 +0200 schrieb Krzysztof Kozlowski:
> > > Not tested on hardware.
> > >=20
> > > Ethernet interface, like other exposed interfaces, aliases depend on
> > > actual board configuration, e.g. its labeling, thus aliases should be
> > > defined per each board or each SoM.
> > >=20
> > > Some boards (e.g. Gateworks) follow this convention but many do not.
> > >=20
> > > This is continuation of my comments from:
> > > https://lore.kernel.org/r/16a98816-f43c-4f4d-940e-9da30cb1f73f@kernel=
.org
> > >=20
> > The i.MX boards have traditionally listed aliases for many hardware
> > peripherals with the same numbering that's used in the SoC reference
>=20
> ... which is not correct. Aliases should represent how boards are really
> labeled, not how reference manual labels them.
>=20
While that is the commonly agreed interpretation today, I do not see
any language in the DT spec itself or kernel Documentation/devicetree
that would mandate aliases to be used in this way.

In fact there are examples to the contrary like
Documentation/devicetree/bindings/serial/samsung_uart.yaml which says:
"Each Samsung UART should have an alias [...] as specified by User's
Manual of respective SoC."

So I would argue that there is no hard line between correct/incorrect
for the historical usage of the alias nodes on the i.MX platform.

> > manual. Boards always have the option to override those aliases if they
> > have a good reason to do so, e.g. labeling on the physical device.
> >=20
> > Other users besides Linux rely on fixed numbering provided by the
> > aliases. Both barebox and U-Boot number their ethernet interfaces
> > according to the alias.
>=20
> And?
>=20
Some usecases depend on the aliases being the same between kernel and
bootloader. Historically that has been guaranteed on the i.MX platform
by the aliases in the SoC DTSI, when the board didn't have a need to
change them. With this series applied some other users may now end up
with missing aliases if the only include the DTSI.

> >=20
> > While you seem to add back aliases for in-tree boards, this breaks the
> > majority of boards that include the kernel DTSI from an out-of-tree
> > board. I can understand that we can't always accommodate these users,
>=20
> This is not ABI, so every out of tree user is on their own.

I am not too sympathetic about out-of-tree users myself, but I don't
think we should make their life harder deliberately.
>=20
> > but I simply don't see the strong benefit of this patch to justify
> > creating churn and possible regressions with those OOT users.
>=20
> They should mainline their code.
>=20
> It is not only a "churn", but way to stop people from repeating the same
> mistake. Every time you bring new soc, people will copy old code thus
> this will never change.
>=20
In this specific case I don't see a need to change the existing code.=C2=A0

If new SoCs should change the alias use, this is something that can be
implemented on the SoC maintainer level. No need to introduce churn on
the existing platforms to enforce a new rule for newly introduced SoCs.

> >=20
> > Having those aliases in the DTSI has been common practice on the i.MX
> > platform since 2012, long before there was any strong consensus on how
>=20
> Many previous practices were poor practices and decent SoC platforms
> fixed and changed it.
>=20
> We made big cleanups - since ~2 years Samsung is warning free. Since
> similar time all Qcom boards use phandle/label override. All of them
> were significant effort and quite a shuffling of code. Such effort is
> necessary if you want to code to be maintainable and in best shape for
> future development.
>=20
> Unless you claim NXP SoCs are a legacy platform and we should not do
> such cleanups.
>=20
As I don't see the current usage as objectively wrong, I don't see the
need to do this cleanup/rework to the existing SoC DTSIs.

> > those aliases should be used. Breaking existing users for the sake of
> > aligning the i.MX platform with more idiomatic DT usage does not seem
> > to be a worthwhile trade-off to me.
>=20
> No existing users are broken. Everyone who decided to stay out of tree
> is on their own, but this was their choice. We are not talking here
> about ABI.

Yes, there is no formal ABI guarantee with this anywhere, so we can
break out-of-tree user when needed. However, I don't think the
improvements in this patchset justify such breakage.

Regards,
Lucas
