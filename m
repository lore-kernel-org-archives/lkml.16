Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC2E1FCD04;
	Mon,  3 Feb 2025 08:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570581; cv=none; b=OL0pZGudP4xG0vNO95fdFOL6flMMfa2/XGSH3+xceSOPieD1+W9lZbe9iHJjjQIfjtw40yvHPFu8MqZRQ9q4Og9ROSErVYjwrsha7d7ZGgIbU+pWnOR8ZJcFJACR34XVO1Hcg0tCCEaI7QcVQj+eFoDkkq9d97jt2ymQaZxMOnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570581; c=relaxed/simple;
	bh=SYFOY9/9pS1ZDSN8y3IFVW/NJY04xzmPim1RwnXSvqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EC4AmInxT5aZ/PXo3/GQuQIzysezNNF55k6Yt6qo+XMYQ6sQ1bx7GTVsQHOaZLnDqhRYqzlqIMI1U9ldmzsknc9AbFaJpe1OQrL3R4VDD6aQCwsiRlbX0BwCXT0RqQnfN74TRBBOf3jQzFPK1H7lc3A5Xnbna/HeUmYESJJGAUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=GgmKnNv6; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="GgmKnNv6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jbaX86Vv1lBq83NgqcccZ8mOTJ42/HTehRVjxGwkm0U=; b=GgmKnNv6FAgIQv4tMugK1+eBHc
	+b1WEH4vrQqN6pBfNEUMbP5Ro3V9+JjnBm76d4pODXAKFgG2PsRjyoTanO6AKsHAK0bgK7Tl316S8
	31SWcz4bXnl5vLu5mtR3ejF+vfJ9H+KvCPCpMrO8aZ3V2S31FJgkr/6abgXR0n4on9WHp/tWCwNHv
	6O+npo3Nke0HiIMep76ma6Y5IYgLkadKVTeksWUGSyOBD6U0m/SFxf6LdIIawgzDYVGvs3q7IoEMe
	4Jj/BCNeBt6+YVqMXpFT5uu1LDb6rzhH+9YfJ8EL7zCnaumwumuKqlMNEQrYEIA0VdczJMrxMtuBi
	vUIPZh1w==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tercl-0005Vr-VB; Mon, 03 Feb 2025 09:16:08 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH] arm64: dts: rockchip: add support for sound output over HDMI on RK3399 Puma Haikou
Date: Mon,  3 Feb 2025 09:15:58 +0100
Message-ID: <173857053615.78657.12726189850185217501.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250130-rk3399-hdmi-audio-v1-1-406244333111@cherry.de>
References: <20250130-rk3399-hdmi-audio-v1-1-406244333111@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 30 Jan 2025 16:14:25 +0100, Quentin Schulz wrote:
> The Haikou carrierboard exposes an HDMI connector and audio can also
> be output, therefore let's enable it on RK3399 Puma.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: add support for sound output over HDMI on RK3399 Puma Haikou
      commit: 29fd3d7f8317d738b340ca7f5144bf915243cdea

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
