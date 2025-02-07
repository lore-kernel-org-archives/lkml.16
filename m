Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268451F4169;
	Fri,  7 Feb 2025 13:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738936472; cv=none; b=bTseosiTaFguagEhDBBxXLro9djrLqdtXnSZwb+g63C2rkOvuMYk/iUsgMge1i9sekcyT0EYMaUzQKSw/5YyBMMPLll0KyGFahW0lw9GU4M5tkpOQScsqweEoQ9Wu92EKkEha33ujNIt3eysbeGw/QChiqVdKD1jZpjPLUagoqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738936472; c=relaxed/simple;
	bh=Hpf80LgbTQN2vdnXpc+7IlbSWs0fEJnOvnGxfOERoYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=swTTLqdWxxleIdifULLFwiTQCp25nscGlpLzKdMuBzgRA+SCz0LJjWPm/6JqES/NMpJx5Ww62N05JqCUiYHT9p3chuIszS24b5SFi6aaJ3rmKqasp0FJh0drJObnaYvoTLE0+1SIhGPzQgO3+hAaL/vtu0hPjRfE75pDJWLorW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=McjOa39a; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=cexhNhoe reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="McjOa39a";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="cexhNhoe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738936468; x=1770472468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nTIUisbXh4QjJS+LI8f+3ax5wyozSgfahYNeRHOmjd8=;
  b=McjOa39aQadaQ7JHLisnurl9xlRky8rK31PuIYU1dNe+bkJBuOoQEKiC
   dW6n0aGPT2gW/a9a7of0X5zY/O3r/W1d+IqiHXc4s+39IUg+4ivbojW2N
   hZOH3HVQhHLt5BNMJMDanKQfcQ8SDqXOEum4GqP3RSJn11P76gXF5aZrg
   Z9a9SYc3HR6uxHvj7AmRmyUDxDyu0rI7a2lcGLfDWu3gYhLO2PTHB0wYB
   Tb4mLV0GjNjAFa0cxC6mPpYFFPg/k7uyDZKifuHZKSHEwrlTkg8c/WEBF
   25p1/NZrQ+Ow2b1gAxQd8DvbNA9JRiPX0C0NDZzmg+fLuH5HA6R7T4fXD
   w==;
X-CSE-ConnectionGUID: SkqYzeS5Rt+3j4CFbpj6KA==
X-CSE-MsgGUID: MgMByEkoQciFcPo1UoKVkg==
X-IronPort-AV: E=Sophos;i="6.13,267,1732575600"; 
   d="scan'208";a="41645049"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 14:54:03 +0100
X-CheckPoint: {67A6107B-3-8F72533B-EF5B5974}
X-MAIL-CPID: 3037226F90E1CD7D000B19975831E324_1
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E727E166061;
	Fri,  7 Feb 2025 14:53:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738936438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTIUisbXh4QjJS+LI8f+3ax5wyozSgfahYNeRHOmjd8=;
	b=cexhNhoejlZHe3odS8rdMig4FKDNX8jkHE+AAJeDbCmBDLy8YuQUlbzP6fWBZiP1rC0QLT
	yWXEmulgysfbhX1aRVaZBJ6BwTCj6qIjGrR9UudolHbudaVgdUeNc0Io0215+DKf9tfVGG
	vNwvY/VrGhBJkn1DLwIbnRJZcWZCQGC6a60dPEeMRnMy66gwEKJnLEUUThGGgKvNzdw3+f
	I6OS76LGXJaMrOq83RL6pGv+iA0fJE6DcjitJujqnj6saXLOuA59dtnBIiXUCdn85yCMrn
	DPRFLnpKm7FBwq2E3x0fg47691IDkpNncOOJKTr6cUiG/r+63vrBrTRZcSQhsg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] TQMa93xx fixes
Date: Fri, 07 Feb 2025 14:53:56 +0100
Message-ID: <3882355.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
References: <20250107141117.984652-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hello,

Am Dienstag, 7. Januar 2025, 15:11:14 CET schrieb Alexander Stein:
> Hi,
>=20
> this series includes small fixes to TQMa93xx DT:
> * Sorting DT nodes alphabetically
> * Invert default for Powerdown/Disables on Mini-PCIe slot
> * Swap order of ethernet devices
>=20
> Alexander Stein (3):
>   arm64: dts: freescale: imx93-tqma9352-mba93xxca: sort pinctrl nodes
>   arm64: dts: mba93xxca: Do not assert power-down pins
>   arm64: dts: tqma9352-mba93xx[cl]a: swap ethernet aliases
>=20
>  .../freescale/imx93-tqma9352-mba93xxca.dts    | 54 +++++++++----------
>  .../freescale/imx93-tqma9352-mba93xxla.dts    |  6 +--
>  2 files changed, 30 insertions(+), 30 deletions(-)

Any comment on this series? Thanks

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


