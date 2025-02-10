Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24941CD1FD;
	Mon, 10 Feb 2025 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184008; cv=none; b=lgKd+ReyqFBNHDr2Esjj/WgOlpMxVcPaRxXHL6xfG+84X3VWZjPPOLFQL6nvuMBqGil/s6lJ3DkCq7G2jlhebVz84erpuSBG3LFgfOnSOUAnFRXZC7uxCdF0K0yZWPRV1RQ4kya3a3EHIiHbI60eKqeSj4TAIx9jL6IDOvwXsFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184008; c=relaxed/simple;
	bh=LGV8UANXcdj/j/zfoDz6O1P4t2FVGCOz9mpb60orzOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ds3R1NbSLIfE8XYXx9qyOdU8I8cXdcHFzqc0kJwDO4tq8SVuP1g8ckbb6lTaiiwrN9fNkEvSYauwUBvCM0e7SA3hylEELZ3E0psrjP51z9FRN+Tt+S+T5XBAgihQZaQAOL3Kb3UfyDjHsffTkqGPkJwXRdwswpI/foklJn2Azw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=jck3ldfN; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="jck3ldfN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4rCkVHh/Iwk/+3hJuNqrNMRtzjPUC7H5J66dt2WuGJM=; b=jck3ldfNHMAgjETkttyJMYsUMu
	E92vnw4Nx9pcPnO+WowumsHz237a35FAZMEiVak6550rssebJjnqeCuuZDOV/Uyn6s1cVbSgKUgp7
	ybgzfla0elZWKa+7Glsv9X+ZzbYRWytLjot1Ix4UWV8POEqNZdonZPWY/qBwFYsL05nrp/auDTB3u
	6ZrN1i4CEQfjO7MeNy5V3zNMvwaCU5cLjqSvsO+at5fqr6RCmh/VfTzNwI+uh/RezmMN1wIsW9vEj
	aVKYGrOwPu1YeH0Mnvdb6VWFWE9+SXRwMz1carNAMuhLkk0yoQf7O0bPcUPO++TKQKKmEIRnc7mvY
	g60nfHBg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thRCb-0000xs-VF; Mon, 10 Feb 2025 11:39:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Junhao Xie <bigfoot@classfun.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Dragan Simic <dsimic@manjaro.org>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] Add support for Ariaboard Photonicat RK3568
Date: Mon, 10 Feb 2025 11:39:33 +0100
Message-ID: <173918381711.1055685.16665650203421102883.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250114001411.1848529-1-bigfoot@classfun.cn>
References: <20250114001411.1848529-1-bigfoot@classfun.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Jan 2025 08:14:08 +0800, Junhao Xie wrote:
> Add dts for Ariaboard Photonicat RK3568.
> 
> This series bring support for:
> * Debug UART
> * SDIO QCA9377 WiFi and Bluetooth
> * M.2 E-Key PCIe WiFi and Bluetooth
> * M.2 B-Key USB Modem WWAN
> * Ethernet WAN Port
> * MicroSD Card slot
> * eMMC
> * HDMI Output
> * Mali GPU
> * USB Type-A
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: vendor-prefixes: Add prefix for Ariaboard
      commit: 8d9863487e58434d22dbacb10ad2f9dde326a25c
[2/3] dt-bindings: arm: rockchip: Add Ariaboard Photonicat RK3568
      commit: a81c10aee108d805259dac50c0ac509681c559e8
[3/3] arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568
      commit: 3834e1009c108a8a834a7e4625dfa805fcb1f71d

As seen by the reply from Rob's bot, there were some minor issues, that
I fixed myself:

- dropped clock-names from bluetooth node
- dropped reset-gpios from rfkill node
- dropped phy-supply from pcie-phy
  with vcc3v3_pcie marked as being supplied by vcc3v3_pi6c, all supplies
  should still be enabled nevertheless

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
