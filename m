Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49003074B1;
	Wed, 25 Jun 2025 19:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750880799; cv=none; b=fhnDnDEWQbmgCdz+mGvc4ipqoObHXHazDAcQQ9/gLccsfi3JOSpmHmhhfBd3/G6RZwXDXzFs7HwgpZFHxfsNTbtv6CfwIRPwUy4nmmaisyy8BL0XDr1O9L6Foz2pPed3rukEz8kRtmV5+CKf1RfO/cQP3EE9Ewn3RRH4OnSMlPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750880799; c=relaxed/simple;
	bh=NODulXK9mLHVaLI9aDIG8467kKcmn3NIW0YaOkXodiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MUwxdiR2pSZIWBCDgigMQ6/CF44KgOoS/0hKDy8mzp+kckOyAOKeUPYKhzmou6qsY+Ajl8s4s9a+A0ymWG3xHxqPJ7KOZLemZHWDMmUiCCNZ7u3vsJt6dVj1463fefAmdRMzU07KiOK7ytUw36uHiM8MOwV05mEpDt91KFKpdl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=as2omF8E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="as2omF8E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D85C4CEEA;
	Wed, 25 Jun 2025 19:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750880798;
	bh=NODulXK9mLHVaLI9aDIG8467kKcmn3NIW0YaOkXodiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=as2omF8Ee8BkRGXkdGdQQSLwl2mF2fOIbCOBaJx1KR9FgkLStWvbk2ML3Ql9DlQaI
	 cd8bd4cxc9c6kyLTi2aYDkP7WW1cOEm8eePxXBbLDELH/sns1RTZwVUyk+cy8yJs7p
	 DTFa+wXt+FXHAlI7jmD3NRZF3+qUz9yCQjGa0lQ12lVI+Q0pZSldXZbqyVTwGqkR2l
	 s5Q3epf1dJy+GVOUU/IMgfQycUwcwjAMPWAcb+8qdEWcThi9SKKV6oLL4tW/DmKcdE
	 0LLu2/p1YCrsNgEHnLZukj5qh0kWxq9DA7aCXEgpLqMUfBnQxV9us8KGVVE9Z2vnrH
	 1xFNQRShp4G/g==
Date: Wed, 25 Jun 2025 14:46:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
	nicolas.ferre@microchip.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	broonie@kernel.org, krzk+dt@kernel.org, andrei.simion@microchip.com,
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH] ASoC: dt-bindings: atmel,at91-ssc: add
 microchip,sam9x7-ssc
Message-ID: <175088079681.2102370.15282339476917735877.robh@kernel.org>
References: <20250610065005.64070-1-varshini.rajendran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610065005.64070-1-varshini.rajendran@microchip.com>


On Tue, 10 Jun 2025 12:20:05 +0530, Varshini Rajendran wrote:
> Add microchip,sam9x7-ssc to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
> 
> This patch is a rework (adapting to the newly converted yaml file) of the
> leftout patch sent [1] as a part of the series adding support for sam9x7 SoC
> and sam9x75 curiosity board.
> 
> [1] https://lore.kernel.org/lkml/20241010120345.92844-1-varshini.rajendran@microchip.com/
> 
> ---
>  .../devicetree/bindings/sound/atmel,at91-ssc.yaml     | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

