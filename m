Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D3E1A08A4
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041071; cv=none; b=TjlDvN6OgsiHA7jWgH9K31bRucva3y2I0Hi59UE1eW2tL61JCMsLSCRmh69zQbFhaRV5Dxq+sFZVY6W1aiSD86AkaTSrM3vc5aCyaae0+A0fpBO6EFd9Gw6hgPQIhcPG9uUhSE/kkYfcBsJA13cp/SD5ETCbuJjOyA0/pPfXwXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041071; c=relaxed/simple;
	bh=EpS50sVTieLd5hWIVkfDWKZoZmCkWzzgRnyPvqG2f74=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f/aG6M0k+rn9kc8q1nDh2/E4oFkX4I9z5oGY8Ym2sMJH7AlDTM+hFm6NBVXUgA0WB32YzhA+5yqanwppSrfE/E6gfEwxLM+e3pa74ahuBpqO8v64jWuiLBmt4mtatj1Vi6nUpgBEmehgQmM1gesQJFn4gg3Ex9A5Bqwm2/TsfNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlj-00013q-0m; Fri, 27 Jun 2025 18:17:39 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlh-005e4h-0c;
	Fri, 27 Jun 2025 18:17:37 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBlh-000QK1-0G;
	Fri, 27 Jun 2025 18:17:37 +0200
Message-ID: <0802d06dafc270799f05d3ccd9fb8a46eb0836e0.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: renesas,rzv2h-usb2phy: Document
 RZ/V2N SoC support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Fri, 27 Jun 2025 18:17:36 +0200
In-Reply-To: <20250528133031.167647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: 
	<20250528133031.167647-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On Mi, 2025-05-28 at 14:30 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the USB2PHY reset controller found on the Renesas
> RZ/V2N (R9A09G056) SoC. The reset controller IP is functionally identical
> to that on the RZ/V2H(P) SoC, so no driver changes are needed. The existi=
ng
> `renesas,r9a09g057-usb2phy-reset` compatible will be used as a fallback
> for the RZ/V2N SoC.

Applied to reset/next, thanks!

[1/1] dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/V2N SoC
support
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dfd4a06a2e166

regards
Philipp

