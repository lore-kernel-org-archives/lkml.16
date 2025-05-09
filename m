Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28B9220F56;
	Fri,  9 May 2025 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820843; cv=none; b=mxHQEQfzOgPfT3IP2D/p5kKVgHx4IeZyf4QNywyWPQU8DJnqcWGNNire4RA8y5GhJjPf4NKDlNmZ0zjt+LnSSStMk+Ft1htYivtbbzw1+02Zb8IlEDFRk5DEUpwDRLIr1gBM+BtARjWOnOlCMjBSC6JkQyIdE5EFyFev+Ts74QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820843; c=relaxed/simple;
	bh=s805KXzf1YcWivCU9B8DwY6MQ5X0zCl298WP4agv7us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKMw1WiQX5R7YqULPyGDLYfXBzGQ/JuqeUKSvDgTO5LZYzeEDU4Jogx7Izr1H2PigU96iwg6Fia49VpoPQ6Fa1AThHKL5jTjy84zQcO+cR3XIiIAJ4EzBsAL++7OZew0+PyTn9OTt+8NzothwqIran8sAdcQmY1IX2tmKwkWWi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=TYRuy/vq; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="TYRuy/vq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=sUACwQMdDJ75lG0pGjfTnKwjnJF++bZxZNoTnQ2fhcI=; b=TYRuy/vqOjUpiRaH09BEgokIQQ
	PsFDF5hMwGNEdTqks5SLF/5XSbnIT2Pb2w5I3pqagDPpgG8AF2xjG2m0l9GFNorzEXTunkye/Qejg
	/w1T/hGQ2kkjtLdE75Na9jKMZHxPaPGdZn2P+Iu4KKNW1IlEpElTszk5x4ax/POSWHPe80cq3sZkl
	jQPUALICeso7KIr7hcq31YMwJnIH711JlJZgHRQos2Ju5hAKiSdApSD5BzjiSzFvwAT6ELUdrbcm1
	qiKJN51269Gxllfs8OWjIqsu6BYk5gjEkKkAaJVhimbSKUyhK2Xa3+vMJfyUBGhckcEbSU/kDScAB
	WI7ZfXlQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDTtb-0004Jo-6g; Fri, 09 May 2025 22:00:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/5] arm64: dts: rockchip: add ROCK 5B+ support
Date: Fri,  9 May 2025 22:00:22 +0200
Message-ID: <174682074870.2029046.8482000655658409755.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 08 May 2025 19:48:49 +0200, Sebastian Reichel wrote:
> This series adds support for the ROCK 5B+, which (as the name suggests)
> is an improved version of the ROCK 5B. It also adds initial USB-C
> support for both the ROCK 5B and the 5B+.
> 
> Changes in PATCHv2:
>  - Link to v1: https://lore.kernel.org/r/20250324-rock5bp-for-upstream-v1-0-6217edf15b19@kernel.org
>  - Replaced DT binding patch with the version from NAOKI
>  - Dropped unused pinctrl for vcc5v0_host_en from the shared DT
>  - Moved USB-C SBU DC pins to board specific files, since they differ
>    between Rock 5B and Rock 5B+
>  - Added pinmux for SBU DC pins
>  - Rebased to latest version of Heiko's for-next branch
>  - Disable USB-C on Rock 5B for now
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: rockchip: move rock 5b to include file
      commit: aadfbdcf7e1e7f3892e0e4bdcc3c9c7c9adfb723
[2/5] arm64: dts: rockchip: move rock 5b to include file
      commit: aadfbdcf7e1e7f3892e0e4bdcc3c9c7c9adfb723

The two above squashed together as intended and talked about
on IRC.

[3/5] dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
      commit: 874c1117621d441e0ef4a609665f228a4b8a1932
[4/5] arm64: dts: rockchip: add Rock 5B+
      commit: 376cb9696298df2028afb620a9dc6c4b10a18605

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
