Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC66B7404E;
	Mon, 30 Jun 2025 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276765; cv=none; b=eZolbZUdVkBXyE2UQ6/NI0OtrkcYFXheH06NHiqq4mxFZnCz1rlPgl5g7haQ8HLm2VxO0s+11H50Mw06xwQkm+Mek8xhucCZpamskxVEO9C5P4Zrwgkrm6N0ZihjxMkARAROxIpwJmisrDber3++kpmptf4sZuDjohTA7FyRlx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276765; c=relaxed/simple;
	bh=y49dy+tmJ2cvDO1/TNESvUVYyGA4uYr+CtL0WrZGyGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iOUkYzlcgEWsUO6SKeMpKOMdJSTHAGtAujlIKO812Cv4f4iaLeuk/4tx9fw9pPdfOf+Pzlrsr4sdKM/ZtMVWQbihY9eoqcp+4pDXcMf8ALvW5HGJJpOaZQ1xZpEr4PQ5oTkdB08ob7I4yTc5pJXEcjVv8AqLu0cdmWF9NH2UJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=i6E84CgA; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="i6E84CgA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=FEx1FP37iC4a8DlrnPd+Y4IHbK2CIl5hs6MpX/CmorY=; b=i6E84CgAw30oBBT8WA+laoNCAU
	bLXkPBN6JeTbPIKyshz3ocIBhWa4H+49GXTenM6KXpaFmhB9ajk+7WFLFa+DUiBzecqsDQtL+x+1a
	0lPS8PbrOYVmS1M1aHNWyUSrGyPLtrqvLClkKECWqc9AqMGoysXEGefvdb5VXbyosDbARyU9SGiaA
	HzhXtYzoRkZTOXzIJ1BtF5fim2sVrElKv64h9MhXKPpVv77tDxl/xVvkuxHlniCzSaeC9jx6ewj8t
	oLOiYoECHTbo0xXDjP4GEVTXaxDDsOopGxckidZ9tzC/A5/gdiH2hoBM7zMskfMup03xe9nY6Akw0
	BzHmncTg==;
Received: from i53875bfd.versanet.de ([83.135.91.253] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uWB5L-0006Zc-0x; Mon, 30 Jun 2025 11:45:59 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: enable PCIe on ROCK 4D
Date: Mon, 30 Jun 2025 11:45:46 +0200
Message-ID: <175127673172.138768.17598009818347376680.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250621-rk3576-rock4d-pcie-v1-1-2b33c9f12955@collabora.com>
References: <20250621-rk3576-rock4d-pcie-v1-1-2b33c9f12955@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 21 Jun 2025 16:37:55 +0200, Nicolas Frattaroli wrote:
> The RADXA ROCK 4D board has a PCIe controller connected to a flat flex
> connector, compatible with the one the RPi5 uses.
> 
> Enable the associated combphy and pcie controller node, as well as add
> the remaining pinctrl definition for the reset.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: enable PCIe on ROCK 4D
      commit: 29ff4bbff793334d6aff2238fdc3ccf3859d60da

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
