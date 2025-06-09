Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27FD2F37;
	Mon,  9 Jun 2025 10:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464621; cv=none; b=Dos8VemM3POIUYwVoCe4SsczDiU5VsXRXfy6QMA0zXrClXl88S92TsvbXcnPF/u3eIYO0PsgOv2y5njMeb7hFbFRJEiwx2Hug9Q8PaLOWWybbEQitvY1idRjleWNbprwmXlM8zo15lIkzss7Fkq6AKHsPCyUfwSyCFjs5cBMx7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464621; c=relaxed/simple;
	bh=IqIATT8ehLSCHyHPHIK0aeC0vBn26wKL58mOSzv+1aM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wrh0mHkfsPSVR5oOroI6RHBeIN8ZcGLJN7bpcHbFdFlEbUkVkuNb0V1JviCnk9ZXuwmXDPEHPQYf+Bo+MLMadzfP3qY2jtq+VbOAa6Esd/s460dbP8MnOtGxRJqa0tYcb0/PNNIj7VyCUFfKdDPCq/kNe5TIJHHkt4ZvS6kZ7mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=PkGkF+fe; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="PkGkF+fe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=MUho5YhueRpwOnAS8bp4/Ag/zAqHZPytVl1yhId01gk=; b=PkGkF+fewiq5/dyr93FzNBw2Bb
	VY70GVmhv2OmZBYisNs/ayTNEhe5evbu2m4uDutCQFwVZEEo6LuQw/XBpHC23HIvCLlWmJevTSNF1
	7dyPf4yetY/JM4x5EQV364s7XZhVNlOHzX/uWRz77p8UTyALEIXbQvmQIwIFkVEG8WdKrzEEMJFQ7
	0YoVN+YKMe0ErJZgK3A35yna88uz32a4TiaA+h18TLE2VQIE1n1PphbPbhsaxa/29yu1WJON3sp5+
	wwQyjHeNOUH/VK0IEgC1/ymA5koHoa80ReGUB8gblVR67KibcHFj3GztxNGMFF6/fdjYayb3zsa92
	xfoBKT8w==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfD-0006Av-9L; Mon, 09 Jun 2025 12:23:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Quentin Schulz <foss+kernel@0leil.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v3] arm64: dts: rockchip: support Ethernet Switch adapter for RK3588 Jaguar
Date: Mon,  9 Jun 2025 12:23:00 +0200
Message-ID: <174946455533.762051.10949954779035634818.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250604-jaguar-mezz-eth-switch-v3-1-c68123240f9e@cherry.de>
References: <20250604-jaguar-mezz-eth-switch-v3-1-c68123240f9e@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 04 Jun 2025 18:18:08 +0200, Quentin Schulz wrote:
> This adds support for the Ethernet Switch adapter connected to the
> mezzanine connector on RK3588 Jaguar.
> 
> This adapter has a KSZ9896 Ethernet Switch with 4 1GbE Ethernet
> connectors, two user controllable LEDs, and an M12 12-pin connector
> which exposes the following signals:
>  - RS232/RS485 (max 250Kbps/500Kbps, RX pin1, TX pin2)
>  - two digital inputs (pin4 routed to GPIO3_C5 on SoC, pin5 to GPIO4_B4)
>  - two digital outputs (pin7 routed to GPIO3_D3 on SoC, pin8 to
>    GPIO3_D1)
>  - two analog inputs (pin10 to channel1 of ADS1015, pin11 to channel2)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: support Ethernet Switch adapter for RK3588 Jaguar
      commit: 8674f059750571f168db9f43d3c02f1975debcc9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
