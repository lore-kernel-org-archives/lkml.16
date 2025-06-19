Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D39C23A98E;
	Thu, 19 Jun 2025 21:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750367866; cv=none; b=txjtsghh15FkRB77+Y8zRxZ/Nb3BIj+MGIWjRijwmGEQwPt67kX/4gBy6B53OZ4P22ZXikNE5ILwuyt/VvWgIKWmTmckeJJnp8IjDZL94908zi2+A1xbko6Pa6dbDJiMkpd22dtABsj1qA2z4QWQdtVaAxA2RVdztHw+VC38gY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750367866; c=relaxed/simple;
	bh=AIVPpJFR0iZ47AaDxX3AUFDuAUA3KZ9fcZZqwdE8+iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWgqL/iDonGVuUjNoFLLZzSoGBGnV05x8VlimsHGbQzSHyNBdJ1CRWMFclHNOSxc2ySymtWVCK+A3+W2xUUJHGpWxZvlLTpSHru+TgYFr4LPjyqbwpJZlQe/vILGXQZkD6zCe2m8Q3+0jQRURFp/pc3OGY9GnDifxcFx96qqDwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=13QisMHs; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="13QisMHs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IAC4eGdfZQMdssd9pLtd60tfv9XvxFunRjooWuyybl8=; b=13QisMHs8LZtjbdJeVBFbYQoLn
	tu4vzBrPojME55bTW72u2laJfwgh1ILq+naRtsDwuA886+5NslQobdrin5nAcVC6ghnJSacVHMfqo
	067VtNCFIqEAHvafEn1qhqOrUMM5+UQBeIOOb0CTfakIeahHwVh/A63NQYeQatsqC91YTHX6KobhY
	9x2LDr7kGzM22JD3HnWpnIydZiwntesZahXPBmaU7Z8Idefcw/0XKDxsGp7HG9MTaxJFc7P1zkgT9
	40RLtjOGfV7/5kcqUd7K7BMU4soAqlLapF7F8saal031+CiteFL/+RSerh7QQGn52zGAZaIKh85/y
	s6yohIkg==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSMde-0007fA-95; Thu, 19 Jun 2025 23:17:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Olivier Benjamin <olivier.benjamin@bootlin.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: rockchip: Fix the PinePhone Pro DTS' panel description
Date: Thu, 19 Jun 2025 23:17:26 +0200
Message-ID: <175036770853.1520003.14215884223488798716.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250619-dtb_fixes-v3-1-9cb02ddd8ce4@bootlin.com>
References: <20250619-dtb_fixes-v3-1-9cb02ddd8ce4@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Jun 2025 15:41:24 +0200, Olivier Benjamin wrote:
> Fix a few issues in the panel section of the PinePhone Pro DTS:
>   - add the second part of the Himax HX8394 LCD panel controller
>     compatible
>   - as proposed by Diederik de Haas, reuse the mipi_out and ports
>     definitions from rk3399-base.dtsi instead of redefining them
>   - add a pinctrl for the LCD_RST signal for LCD1, derived from
>     LCD1_RST, which is on GPIO4_D1, as documented on pages 11
>     and 16 of the PinePhone Pro schematic
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Fix the PinePhone Pro DTS' panel description
      commit: 987087864c88ec8617c311c39390ce578ae15195

Transplanted Diederik's Reviewed-tag and dropped the "DTS'" part from
the subject.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
