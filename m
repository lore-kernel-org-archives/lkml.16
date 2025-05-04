Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8C7246769;
	Sun,  4 May 2025 17:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746381261; cv=none; b=O2CrPTCVOYm6FLtzYKY9Nkk8lSagPggkYdHibSz7pOzn/H9vsZMO4JkyK9L/UGKPh1Lf8+1djFKay2JLrQ3asPSPi06Rn+3iIcRH6XzH6agfwGYs78gRhSjQYDgvWLs/K26Cr6JhobDxurn2QKfMRCvbo/7h4poSogaMYM3CIxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746381261; c=relaxed/simple;
	bh=odMWSPdmr++aBNnQA5k+dYU5w/MbPwcbzmcpEEe5tcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BCysAPt8yxGoaIdfGD/tP6/3DpkDx2JQvKYFXtb4W6PWJTz1CLVVFIkIId+jIILEKVqXvAgjXwurjPoPLrMxwwLXpY3doT8Ond0428G1uBaBfNgrME47Vz3kowUHxuRTw8k5Qqgj0iSuTXPaCyfcpeWmD/wKW3xLR1X/V2moklk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLQVFZZF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLQVFZZF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBF6C4CEE7;
	Sun,  4 May 2025 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746381261;
	bh=odMWSPdmr++aBNnQA5k+dYU5w/MbPwcbzmcpEEe5tcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLQVFZZFAXzicCz7P8xVAjzRBG8Aih+uFdPNmbhRIDlfidsTV6u117wopT4Khr7IB
	 rjOrGB5Oi8p2YLsUGBAu2ervzUPXO4GTE6Wluzd53XLL8SDsfkc0OywW5HAgvTfpou
	 zPGGmv0OO8P1sWBUaSQt9zmX2w0Tfal3yvVsxRUs6+VD/YX0CmNnET9uFLnIe5o7F1
	 to7bisInovLyih/h0IajnLVQQNi33Zq5Fc5qXF3uFXyevNCFOR1ElCytDbnjVt3N6n
	 GUPozsyAjpLSbaPxwFGAMl+qQ6rHfGDjoQ/SkowjBzn4vbeYznTDLUO9NiYXpFTWgA
	 ePYHKZ0XipPKA==
Date: Sun, 4 May 2025 19:54:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: John Clark <inindev@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nicolas.frattaroli@collabora.com, detlev.casanova@collabora.com, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576
 board
Message-ID: <20250504-sociable-golden-antelope-fb795b@kuoka>
References: <20250502205533.51744-1-inindev@gmail.com>
 <20250504102447.153551-1-inindev@gmail.com>
 <20250504102447.153551-3-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250504102447.153551-3-inindev@gmail.com>

On Sun, May 04, 2025 at 06:24:46AM GMT, John Clark wrote:
> Add device tree binding for the Luckfox Omni3576 Carrier Board with
> Core3576 Module, based on the Rockchip RK3576 SoC.
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

