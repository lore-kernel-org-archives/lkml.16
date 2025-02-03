Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469401FE475;
	Mon,  3 Feb 2025 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570579; cv=none; b=hTwsoTSKuXv2+bWVkHUr9rW0TEmscNnSWanvhJQLkK5KWsyMsZ6GfNsfCE0OmbJ2O78PE10+eEF5gjSpSBYI8GCeoY3ZnwWeZ3KvmkoLYAIY/rlAMwu9cJVhHChk3yChDdrpZ/W3zxj3PdSU3BUzHf5lw9YvCxEmEatLZl4TvEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570579; c=relaxed/simple;
	bh=oO5KhbZvLDUuMkeBqDs72JzMia8xQMReg2IbrapGNqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jSH4OEaEZ+8Z9zqJ1gwQq4y5gLqd5ZBIn85h9xRMxUESU49dCjlSp5JhjdsGj4+K/6NVkkMeJZwuP8w+PKpnwZgdjI0kzg16xcHjXasSEOKs7ff1bb1u+Gcft9qraYXs68CNMfuaOqU8vHT2EtuBJXdCurjCF4fKmxoQNVkFH00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=xWKctEdP; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="xWKctEdP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ik41dgyjlw+9TChaY48btmDAd5C/ThMKLX6iSZ9VoAc=; b=xWKctEdPbbCKrsivx/7r2nEIyB
	U+C++sN4iBu7EvVHMpajdHRlZKDqC6Edqm7Prchbqw3HWhBgtFX6gkdEU+A/wXVGiX+ZTGl9hn7rQ
	8hqjw6cJ6qVdGz5beu0xK52JtplVbumoWFT1kRMpUTo0fza2J2Tab3bugKZlYkI6px0nSXSERQCtk
	PvAIKGdpDJLf6erb6OFyV1imD4gJnyWgMsMn5nl7W1RgzRdPYug0+7dX9hlvNitE6Ds5YMEjaeunQ
	JjTLDkSh8AgTh5sKSpnB9LtrHN2071LjAeh6Uw2dCuHppBJjvWrXV+PFYD7UZwXSCcGQmRWwfU+pD
	rcqxQ47Q==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tercn-0005Vr-1W; Mon, 03 Feb 2025 09:16:09 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	quentin.schulz@cherry.de
Subject: Re: [PATCH v2 0/2] Disable DMA on secondary UART on PX30 Ringneck
Date: Mon,  3 Feb 2025 09:16:01 +0100
Message-ID: <173857053620.78657.12420738003783521778.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250121125604.3115235-1-lukasz.czechowski@thaumatec.com>
References: <20250121125604.3115235-1-lukasz.czechowski@thaumatec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 21 Jan 2025 13:56:02 +0100, Lukasz Czechowski wrote:
> The PX30-uQ7 (Ringneck) SoM has two external UARTs, connected to
> uart0 and uart5 controllers on the PX30 SoC. The uart5 does not
> expose RTS/CTS pins on the Q7 connector, as they are used for
> different purposes. It was observed that UART controllers without
> hardware flow controller behave unstable if the DMA is enabled.
> This patch series moves the pinctrl-0 to SoM dtsi file and uses
> /delete-property/ to remove DMA from this UART controller.
> ----
> Changes v2:
>  - Update commit message of patch 1/2
>  - Add Cc: stable@vger.kernel.org
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Move uart5 pin configuration to SoM dtsi
      commit: 4eee627ea59304cdd66c5d4194ef13486a6c44fc
[2/2] arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck
      commit: 11534d3c53d5f3bd93285f8c1adcb793a733ad60

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
