Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA2B148832;
	Mon, 14 Apr 2025 07:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744615607; cv=none; b=LrV8LDOu34Z3vdMo4Om46kBDLBEjXtQjXmKNUou/y8sKHionGhJzuH5CrzvcbtUjb6xrKwTsP93fDni2fNjXxwyEuohTBn3Pvnj0N6OMXiSvqvSmavcbMnRaQ+1abBBFXcvG6Hhx3iid2jKQC850c4DLoX7Mb0yXNDYtSTj5uyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744615607; c=relaxed/simple;
	bh=B5aWKWH2FORQFNpAWOtD5r+9LPdCnzGQZHEkjywxDVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILCg7dtelAkXkDDWibtaAHnLR6h/jqqC2Hw3hmvR/sHm/pDAMRfYcKQcBCA7YuFgc5OW29AqnrrkXxlLSgvVleTUStFrx+nw8z3oohUmxb/BYN7jVoyLHTwUKTIfstD/uNqWMh7HoWZ+emK42VR3IVqduYVTTCCsXv8U/VJN/Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvkA14uf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvkA14uf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DB1C4CEE2;
	Mon, 14 Apr 2025 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615606;
	bh=B5aWKWH2FORQFNpAWOtD5r+9LPdCnzGQZHEkjywxDVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XvkA14ufc5R0yibMxePJMAuvTCUdkfjLaz+u1o1kazGDjsXZVnin8IklNLq6t9t6Q
	 j4629ZES7tetWbWjxK4CtZnr/79RrZQIKyYIH6OvFM6Og+9IWGSizuRQN99jzIf4s+
	 hI5FOaCQ+TxFm5nfYsm39ZfXLxw4DBaFMbWaTRQtqZmVPeiab2pN1dSPHgBcCg2iIe
	 YrT88ukt5bElpzx9Uybz69OTYlQVroXxLU0KkdwTBpIImf792PELU/0fg8/ibG/Dkh
	 aC947MFroRYdqEDVsDbHKJV1JA0CQkqBvJGAT5C8aFS2hvoh4tEcObmf0EvwqjW1NN
	 Sbx/eoo2HIOng==
Date: Mon, 14 Apr 2025 09:26:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sugar Zhang <sugar.zhang@rock-chips.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	kernel@collabora.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 05/11] ASoC: dt-bindings: add schema for rockchip SAI
 controllers
Message-ID: <20250414-xanthic-tortoise-of-experiment-dcbfda@shite>
References: <20250410-rk3576-sai-v2-0-c64608346be3@collabora.com>
 <20250410-rk3576-sai-v2-5-c64608346be3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410-rk3576-sai-v2-5-c64608346be3@collabora.com>

On Thu, Apr 10, 2025 at 09:39:57PM GMT, Nicolas Frattaroli wrote:
> Rockchip introduced a new audio controller called the "Serial Audio
> Interface", or "SAI" for short, on some of their newer SoCs. In
> particular, this controller is used several times on the RK3576 SoC.
> 
> Add a schema for it, with only an RK3576 compatible for now. Other SoCs
> may follow as mainline support for them lands.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../bindings/sound/rockchip,rk3576-sai.yaml        | 144 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 150 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

