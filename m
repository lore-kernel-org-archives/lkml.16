Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089AE230D08;
	Thu, 19 Jun 2025 20:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750363917; cv=none; b=TLmN8yRFl3do5bthqwJnTjgpdeHDve0ok26Ks8osra1K7NmjFZ8OwMYkRnGJ/OQ30I5X51gZShArwlms8V43/278tR4J5eEQL3gutyDH+yaG2DyGmwFhL/Fq8PoKhnZhyL6uvtpGcU00acNmh7OwA2sWyXHhrpxDQAjh7NEZwmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750363917; c=relaxed/simple;
	bh=lKt8A6+QjYnjFL3np6K20XlH4x7ehiuuzMqxVDQaqE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNd4ibr/64ds9yKVm7Qo+WA74ZUV3eSBC6Wi5CO75jhd7IvdhDpwqupwMcIhmvDTtf3IG1v1xiWOAXMDxyr6snCcve4LUOs2fz+RNlKBO/T5OeJHpNrR9ulkDcbWscQpbSv77wYZd8uSBHC5mkOdqXMZtOSnTwcKcf7bJqsZMz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=0nF/Qs58; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="0nF/Qs58"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=lKt8A6+QjYnjFL3np6K20XlH4x7ehiuuzMqxVDQaqE0=; b=0nF/Qs58MprQxQpPF81gdBhcaM
	ZiPwdbLNIv9i7HdS7fcXKCxdpfc1ap8teHa7zc20uFIgBjGOkJ8YWr5BSc+n1ae3FATDOrzK7wPBM
	fg/gJjxdhtGgMywi3Sbz9+IRBBR8mTOndTBfiE9Vd1ephKjaeN6ThPY8UK226SvDhHu37wBWAzcuh
	3O9+SlEoKGaBsw5DuMCjcEeX1ny6eb8odrrp2e3cbUUbiJFVf+UH30FPG+9Lussjfa9DJ8kh0xvUu
	FWVolb6GLAWqFAs4zg8hvWQAPfMX/RXldvaxaCzwP4gxN4Z4Z9Rg+ut3x+Cl6CfyhM56P5+uNVMDm
	HytK+xPQ==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSLby-0006tx-Lj; Thu, 19 Jun 2025 22:11:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Michael Riesch <michael.riesch@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject:
 Re: [PATCH 2/5] dt-bindings: phy: rockchip-inno-csi-dphy: add rk3588 variant
Date: Thu, 19 Jun 2025 22:11:49 +0200
Message-ID: <17533727.geO5KgaWL5@phil>
In-Reply-To: <8ba2f458-4a66-44f6-8528-4654cfe379ff@collabora.com>
References:
 <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <0f2b8934-9b3d-4913-b734-b4fe7f0c7d0a@linaro.org>
 <8ba2f458-4a66-44f6-8528-4654cfe379ff@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 18. Juni 2025, 08:32:25 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Michael Riesch:
> Hi Neil,
>=20
> Thanks for your comments!
>=20
> On 6/17/25 11:31, neil.armstrong@linaro.org wrote:
> > On 17/06/2025 10:54, Michael Riesch via B4 Relay wrote:
> >> From: Michael Riesch <michael.riesch@collabora.com>
> >>
> >> The Rockchip RK3588 variant of the CSI-2 DPHY features two reset lines.
> >> Add the variant and allow for the additional reset.
> >=20
> > No names for the new resets on the RK3588 ?
>=20
> I left the names away because TBH I don't see the value in them (in that
> case).
>=20
> Downstream uses reset-names =3D "srst_csiphy0", "srst_p_csiphy0"; and
> there is no better description. One could guess that the second reset
> corresponds to "apb" but this is just guessing and we would still have
> to guess/find a proper name for the first reset.
>=20
> Amazingly the mainline driver does not seem to do anything with the
> resets (unless I overlooked some implicit magic). Downstream does a
> simple reset_control_{assert,deassert} before configuring the PHY. Now
> if the different resets are handled in bulk mode, does it really make
> sense to address each reset individually?

it might not make sense now, but possibly in the future?

A binding and the attached devicetrees are meant to be "forever", i.e. a
new kernel _should_ support all those old devicetrees you throw at it -=20
if they conform to (at some time) established bindings.

So while all drivers might not need the specific resets now, you don't
know what quirks you'll have discovered in two years ;-)

And instead of trying to update the binding and then carrying both the
new and the fallback code for the old binding around, why not do it now.

Then when you find a need for a specific reset, things magically just work.


Heiko


