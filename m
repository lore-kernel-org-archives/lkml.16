Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C9028EA41;
	Thu, 10 Apr 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296772; cv=none; b=SlYrVrokTiSioExjgEibpc1i8Cs+SOZ5lD3IVJcIm3vg2SPAesb+EuGbIaDsdNh+wuUo5oodNmYXaBSLrQVySDZ4hhNm62rGa1R38YPmsslL5iYN8e+/D9oqXI1zrVC29pvXeoEghpHQdcsYJ2p8wNBVTAsRK+H+Amd1R79wAH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296772; c=relaxed/simple;
	bh=SKGLsqwwRBN8Pk3nODUJU55G7TVnhdZjdEvPLBTlfRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVKnbXjPANHqwI7zaQjgjAPUBbGFtjqTp+VntXszjHeQAn95oFEFR5m0/LOUHg2o6xp6vzganu3++wT3J3/+IjOF7hMrxai8zFl7OgC1ArwQpu/YXBiCL9kWsvSv1ZqOAv6uAgIQQVGF8RTUcFv88zNkPDiIjAJ+QeDUzQmiHKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=OOTLB+ey; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="OOTLB+ey"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=iJn1Z7AeBAcITUdgwhks/NDpv6LzzL6aEB2Wcwj5P0w=; b=OOTLB+eySxaxv1N/Fd+RNdDn+P
	8GAqxc+mODU9q7jz+BIuda8002f4DXr8yTJGg9RF3S7xHpg4J3RU3DfKSM0dJKP5b/8NLfh80/vpC
	w6YcIo37ZsM/GVU7wsjN5pu+1XIFFER7pa9Hnd3svWenXbSceNSStB2JAvBWG+5R685+ekn4/k6rG
	/tMb9Y+1mznsSEazUbwbMuwuLRPxE89rhRf7eaXfDgZPstN0ay7AnCWVwtBSbJ1UStPXH1XhFaQSY
	PHJWGiVeyXmwlzWoqqHl9v3qRcaqnch6ijSxHMqNTEUm+K70ARIbNWJmz/bQ3su1ac7uwKbg7SG47
	zYS9g1ow==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGh-00012N-98; Thu, 10 Apr 2025 16:52:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: Add DMA controller for RK3528
Date: Thu, 10 Apr 2025 16:52:24 +0200
Message-ID: <174429674411.910874.7341307376411610204.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250401100020.944658-1-amadeus@jmu.edu.cn>
References: <20250401100020.944658-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Apr 2025 18:00:17 +0800, Chukun Pan wrote:
> First commit adds missing uart3 interrupt for uart3 node.
> The next commit adds the DMA controller that can be used
> for spi and uart. And add DMA description for uart nodes.
> 
> ~# dmesg | grep dma
> [    0.103466] dma-pl330 ffd60000.dma-controller: Loaded driver for PL330 DMAC-241330
> [    0.104212] dma-pl330 ffd60000.dma-controller:       DBUFF-128x8bytes Num_Chans-8 Num_Peri-32 Num_Events-16
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: Add missing uart3 interrupt for RK3528
      commit: a37d21a9b45e47ed6bc1f94e738096c07db78a07
[2/3] arm64: dts: rockchip: Add DMA controller for RK3528
      commit: 762b1f6503340b4729bc8a5fa6a5780712012cd8
[3/3] arm64: dts: rockchip: Add UART DMA support for RK3528
      commit: ab6fcb58aedf7df1d146b47d5fedd844a7c346e2

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
