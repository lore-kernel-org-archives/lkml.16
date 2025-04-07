Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D99513777E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021836; cv=none; b=dDr9asQgUnU+loRMRzltWtqcpH3JTxYIHVPX2UzkKabc+usfNuH9+qG1xSUAXeD5yOUNvXQut/j16+NsFXZYyxgP8jNZb6eGKXWsxKU3mRqfoU4t6tnPF7nb/yrnReHWPOV5LdBYRghPLiHa80PTUxrG1zgpVPoM0KOUHjwo6dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021836; c=relaxed/simple;
	bh=4MmmsNnJmBCtjihgTEtAM1RiophjAm0ItwyqsGtZZ14=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qEwuw/HO01u6QY+7gEkidUD/6yLUXBDDJ1UJnedpNYI67gNMh5em8FGe1uaMhTUSr9rWDjAo12xi270lPp6Mml0paEEAhfHMXXpcXKRPd4p+qs2QI9gv8TYO/hIytiXDWpw2IfRbJxNYh1ZLSnpXxJI7TzgFOWjzwNEKLlPORI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u1jkB-0003Ep-7A; Mon, 07 Apr 2025 12:30:19 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u1jkA-003k9z-2v;
	Mon, 07 Apr 2025 12:30:18 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1u1jkA-0008q2-2f;
	Mon, 07 Apr 2025 12:30:18 +0200
Message-ID: <7af15c80a6b0f99f0bd1a67252e0403804d39691.camel@pengutronix.de>
Subject: Re: [PATCH v1 0/2] TH1520 SoC: Add Reset Controller Support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, m.szyprowski@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 07 Apr 2025 12:30:18 +0200
In-Reply-To: <20250303152511.494405-1-m.wilczynski@samsung.com>
References: 
	<CGME20250303152520eucas1p250f2e6d8eaf1172d8813b04ceb88679c@eucas1p2.samsung.com>
	 <20250303152511.494405-1-m.wilczynski@samsung.com>
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

On Mo, 2025-03-03 at 16:25 +0100, Michal Wilczynski wrote:
> This patch series adds reset controller support for the T-Head TH1520 SoC=
,
> which is used in boards like the LicheePi 4A. While part of a broader eff=
ort to
> enable the Imagination BXM-4-64 GPU upstream, these patches focus on prov=
iding
> a dedicated reset controller driver and the corresponding Device Tree
> nodes/bindings.
>=20
> Bigger series cover letter:
> https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski@samsung=
.com/
>=20
> Michal Wilczynski (2):
>   dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller
>   reset: thead: Add TH1520 reset controller driver
>=20
>  .../bindings/reset/thead,th1520-reset.yaml    |  44 ++++++
>  MAINTAINERS                                   |   3 +
>  drivers/reset/Kconfig                         |  10 ++
>  drivers/reset/Makefile                        |   1 +
>  drivers/reset/reset-th1520.c                  | 135 ++++++++++++++++++
>  .../dt-bindings/reset/thead,th1520-reset.h    |  16 +++
>  6 files changed, 209 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-=
reset.yaml
>  create mode 100644 drivers/reset/reset-th1520.c
>  create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h

Applied to reset/next, thanks!

[1/2] dt-bindings: reset: Add T-HEAD TH1520 SoC Reset Controller
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D30e7573babdc
[2/2] reset: thead: Add TH1520 reset controller driver
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D4a65326311ab

regards
Philipp

