Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0C288C37;
	Wed, 14 May 2025 20:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747252921; cv=none; b=CfPfbV65p9eQYXfutlkrdjPOV7l4h5VW0afwiWEny+PsUSPr2x5HyEq9EHHPbAS23zpWKJfAx2i82m3B5pXhMHAiSAYCrtAF1t8SYS5dOZcXsswR/Knm86LpLluXp4xzaJ6u45+SUpoPbDZBkmG/HRUxJ6/RDm4qF0dF00SSZFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747252921; c=relaxed/simple;
	bh=JI+ICFrIj/b5sZpzyiGA9sjL2/dMeBAEF1D8xL1cHyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKGPVDf90KAc6ef+wNYOxgezQi5udT/bO1dR2t+IpBo2tNEq0AWcyWpbisAQnzrPwp0kGtZThtjLvRelWPcMZNWsqUoHxf3/Q70EQTGukeg0LoJ1jdPQqCTqPgn7XExAdLcLnEfLwPSiHYuI9zuDR0h7qexTp+R+v4w5HpanXkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DS8qB7Gs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DS8qB7Gs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF13DC4CEE3;
	Wed, 14 May 2025 20:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747252921;
	bh=JI+ICFrIj/b5sZpzyiGA9sjL2/dMeBAEF1D8xL1cHyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DS8qB7GszMeZwaTsOn5bMQUgTXXqXoSV1llRN0P5/k3ZjPTDamqG+QBpdyWJ4wK8t
	 g0CRoNAZG7e3VmXe+jaeIQeWvim2xg+hRtlsq2Zkm2/AX/Jn/wJFC/JUfUzJBmz1av
	 FOZeXAiICnAcK2a25WZlz2lLu3U8Q92B9PbDXpcAMZwT1OcV8kag115miQs5MoareB
	 STha8oSD3UJAWfHDsp+ywKhH5BNDgAYo1k6RhDPkcNjwjPgJKCvWWjbRJlkAUgR33D
	 pNaX+98OBhRgZJzhjukqGXeFUIgZ3H08ldpc/w+aEC/0IhBVy+JvQB6Pdcfhy49zRX
	 05Sj0JC93Xuaw==
Date: Wed, 14 May 2025 15:01:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: John Clark <inindev@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH RESEND v4 2/3] dt-bindings: arm: rockchip: Add Luckfox
 Omni3576 and Core3576 bindings
Message-ID: <174725291822.2934315.15782059306366204305.robh@kernel.org>
References: <20250509122637.26674-1-inindev@gmail.com>
 <20250509122637.26674-3-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509122637.26674-3-inindev@gmail.com>


On Fri, 09 May 2025 08:26:36 -0400, John Clark wrote:
> This patch adds device tree binding support for Luckfox Core3576 Module
> based boards, specifically the Luckfox Omni3576, with compatibility for the
> Rockchip RK3576 SoC.
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

