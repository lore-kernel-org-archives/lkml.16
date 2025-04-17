Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5CB227B9F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881649; cv=none; b=VuRP500Mxry+cM2hr/DeMu9f2ksmcuqz+SbJYYlbIfxRYtQmHOVhlpfE3jzRmkVIq9Wh0TvXUb0KPTkJBYdkdvSeaE9HdjWdVyPoiixWVOk2R11oMkhttRLdlSpNNVsw9eErCC3icsLzf/Y8/zfVXbpGHsoNgVKnfdGfqVGqdmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881649; c=relaxed/simple;
	bh=mcotlRJEHULxAEHD6/dNnbZI6XTb1V+HX5P4fB+TNS4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f7IXrGt8uWpCoFLPDEVYib6pF70lT+nM3ma4WRm/tLDP89S6bFmGJgkf6ko8GoTfcddtBXc6LMve9iQF3suMyzEotP+nyKzc0NLYz65UbVlpNiT6iocIlnEQg/4V5BbD9Cim6VcZHbtPi5MI5QCrGUCvOsOcaAjJKrp8NsuQnAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u5LPy-0004rU-Mc; Thu, 17 Apr 2025 11:20:22 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u5LPu-000j5C-0z;
	Thu, 17 Apr 2025 11:20:18 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u5LPu-0004Pq-0d;
	Thu, 17 Apr 2025 11:20:18 +0200
Message-ID: <aacb8b4cfccdc2131191829cd2630f5566365cd3.camel@pengutronix.de>
Subject: Re: [PATCH net-next v8 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Richard Cochran
 <richardcochran@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>,  Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Thu, 17 Apr 2025 11:20:18 +0200
In-Reply-To: <20250417084015.74154-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	 <20250417084015.74154-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Do, 2025-04-17 at 09:40 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P)
> SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
