Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C115A20409A;
	Fri, 27 Jun 2025 19:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051668; cv=none; b=ZbTMxgtbFBcRqQ43pbQAMesiwcRh76mlsFyG4CpNwAic+UxQHP1NeCkmD8dIEm27Peyv3C395N9VsmGNj6kdWP695zTx4ElCeRjB19UAGN4WZHlXBSnCT2hjQUq+A1G3VMn+yQ6WTykve4Pk3V32KDTGcbP5rqAUZH3fV2MYzwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051668; c=relaxed/simple;
	bh=teaBeVflJzwLOgj3pdIrQdVRadg6BKthTGhmskdlwsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WyKIoe+FTuTmksKDckZgaN6CcTgITrpME3F2czi/3qqCBeTL0fAHARfTHvhSM25F9sYE7S5gaV9aERUgwFPEk8U4ANHq1UThdDGAmIlLymKlID7I3CVdn/yrA75ybhoCpNpht9xXdsg6OvpRVAmPizoXfAC1E65qci8Z6Xq3eww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvOLcJSU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvOLcJSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435DBC4CEE3;
	Fri, 27 Jun 2025 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751051668;
	bh=teaBeVflJzwLOgj3pdIrQdVRadg6BKthTGhmskdlwsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvOLcJSUDs8C+EDyCzAd5mujAXx45vTaw8vqXSBkMBe7Yx7JShtKAC3SJ3gq1HdY+
	 M5fL+Ur+1zJTXSlXS6XfrQjXXQr3Zf6pRW7RoP/DvzykSkkBQS1zmEKzHY7L3Mle0X
	 nPTSZAI+iO26sQHHHojDxTNeLX+pVvBTFZSwbSSckYyYriChQOE+cenPtv5me4bptr
	 OOenA6HcDmb31Qn2aqyzoVIr1GLirr0MT+ClCVcwRxyqBGGAQpr2zdN+7ASeuxMzOW
	 R4rdc9giMbTikNt6pv7jfA6YLZBHWI9UOF5ZR3FuYtn1upsJs8BFmrjUtpU3lacNDZ
	 zBpRh7FuKYWbQ==
Date: Fri, 27 Jun 2025 14:14:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jagan Teki <jagan@amarulasolutions.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Vinod Koul <vkoul@kernel.org>,
	Collabora Kernel Team <kernel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/5] dt-bindings: soc: rockchip: add rk3588 csidphy grf
 syscon
Message-ID: <175105166709.4025295.58399620161615591.robh@kernel.org>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
 <20250616-rk3588-csi-dphy-v1-1-84eb3b2a736c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-rk3588-csi-dphy-v1-1-84eb3b2a736c@collabora.com>


On Tue, 17 Jun 2025 10:54:42 +0200, Michael Riesch wrote:
> Add CSIDPHY GRF syscon compatible for the Rockchip RK3588.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

