Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E343721B180;
	Thu,  1 May 2025 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096156; cv=none; b=b/nl0O9cdBSc6NeSq4bc2h7qXRV2bUE7Ej4GRMPe4C2VtKp2HFL/taZJ4JxK3WSPr2JZxihg26QI97hYF1N8yOZUlngvYiyqXx9Sq6ly7xst221Ie2jJPfcO2FYaPiZ7PXrbBvOl7xjE+FKjWmrLeyf1DeTstjkC60zQpoMJv8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096156; c=relaxed/simple;
	bh=4cznTst+qMqAAsGv1y6jRbf7QjInPMGR/6V/AHkDLBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GV2F+UylHRZaRD89Ip/3p4ZAnVMvWmKmAP5MTaltMR/S44orvAjfrJ4RsU8cO7VQ7s8hEYtN0yTlokd/c/eBD+gIUTQ6TBhOFVkWQCAzCUATSsknV8vrz7I9jkigK1ryAiMk8JMP5Scrg6CpMvHtK1UK1uRjKLWNdUNSKGGUt6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=wQf5hrLK; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="wQf5hrLK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4cznTst+qMqAAsGv1y6jRbf7QjInPMGR/6V/AHkDLBc=; b=wQf5hrLKogjFIn7iu54HIj9gVV
	B8l6U698R3Z1PpmjNHnCOs7AHTHCUQU29vUSVT1KOK/4SLCNUvM8yFwuo+MRLwmVbNNZG/TkjB5MT
	G8isND8Nw+40ArVtlNxt6e4DJYLxTTagx36EsSSIKtBbCG7aQH42uqyI115Y2my0QErlEeq38/Pyp
	c8s5d8VYOLpN65Ohk64s17csO+DoGYaG5dm/EX4jKA7109NbUb9i5OqgbIfF+eJh9+FxqIyfSVDfv
	1Md7ZCJc1guNuhA4XrirQWWs20UzOmpFMOhM+aUiGsLHSrTx13UR/BNtNnzNiR1X7DGkLj04kJ0/D
	8mGK8paw==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uARMx-0007pM-5S; Thu, 01 May 2025 12:42:19 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject:
 Re: [PATCH v2] dt-bindings: phy: rockchip: Convert RK3399 Type-C PHY to
 schema
Date: Thu, 01 May 2025 12:42:17 +0200
Message-ID: <3149284.mvXUDI8C0e@phil>
In-Reply-To: <20250416202419.3836688-1-robh@kernel.org>
References: <20250416202419.3836688-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 16. April 2025, 22:24:17 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Rob Herring (Arm):
> Convert the Rockchip RK3399 Type-C PHY to DT schema format. Add the
> missing "power-domains" property and "port" and "orientation-switch"
> properties in the child nodes.
>=20
> Omit the previously deprecated properties as they aren't used anywhere.
>=20
> Drop the 2nd example which was pretty much identical to the 1st example.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


