Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDB517591;
	Mon, 10 Feb 2025 10:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739183992; cv=none; b=pu83AEqNyAh9d8OYEiB7GjFKtzUd+Z5ohf2fp/0/ipzpTBMz+1KXii6TvcmjkE0lLDezeLdbMiOqe6jn12kVcMxps2tkz27qwZGe+37jI6mA3+Z8bOmLR79pOjPpqbiiO/QizK0vyN/muvE5W8C1+oBK18/k1ftTT3hxAwLaUlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739183992; c=relaxed/simple;
	bh=b2Fajp+6Xat5MCKPgG11H9pUqAI05T/Rn54v1xgrDww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cMoMcNAK/pSeizkWiNeuAEp1imReVjlVqC/zg4LGt3Xa00uLyP+2z7mczptVJfrFtnsOwIvgGcel1XY5VCNLwSu7CvWnyA7MmGiqgXHq0xY+MRtT8lBWPCz8vWhtgj3MUJYcHp+D3KxkigmmuLtELzLkB+FfvmTiYgRH53M8IqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=tTegOwHY; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="tTegOwHY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yZb6mUuL2RIdfpHlRYetMESCRDxt1EtIQQVhl92SvAQ=; b=tTegOwHYE0U+gQ5X64JfI1SeVf
	iBg44ZiMpobXICvY+OLRBRnyFlJy956Fg80QK7snXjT8+mffp2S5z8t3UaAiTgFb+zdGh2cFaPtPY
	idP9Vsaf+OASKlSrsvH3+b3HaHO+l7wfxJWrmu0oyGYtogFxzEv117S/K9+I+ZySOALw2ctNTTccI
	5YOoy2zHOtaamD9TwpzhyfQfub268yJxLQxRtJMqy4ofmPtxl3Z5Jol+qCHhuWRkLtIif7scV/HCx
	GYGaHXJxyuJuJtx3V39SZeYvDiNQjYOdZ6ppz6at0gY0Zia1R4wwuhuuWGf4E9a8i7BijZ4j6kFG0
	mrekDPUA==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thRCb-0000xs-CV; Mon, 10 Feb 2025 11:39:45 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: switch Rock 5C to PMIC-based TSHUT reset
Date: Mon, 10 Feb 2025 11:39:32 +0100
Message-ID: <173918381709.1055685.13812643367447361492.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250204-rock-5c-tshut-v1-1-33301e4eef64@gmail.com>
References: <20250204-rock-5c-tshut-v1-1-33301e4eef64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 04 Feb 2025 13:02:28 +0400, Alexey Charkov wrote:
> Radxa Rock 5C supports both CRU-based (default) and PMIC-based reset
> upon thermal runaway conditions. The former resets the SoC by internally
> poking the CRU from TSADC, while the latter power-cycles the whole board
> by pulling the PMIC reset line low in case of uncontrolled overheating.
> 
> Switch to a PMIC-based reset, as the more 'thorough' of the two.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: switch Rock 5C to PMIC-based TSHUT reset
      commit: b2e537749524f09ae34e9e11a5f020eccc8aff22

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
