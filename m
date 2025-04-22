Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81359280A34;
	Tue, 22 Apr 2025 13:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329972; cv=none; b=Wwm0QV1ZaadWefo6cYw7xy+wg4yQkQgjXTCaQU1zIhgveBW2MR9qm6OuGR+7qG9Dip9yWE2V6koPm4WKMKOQW4WAmpi6UwiyHc2jCW+3lOqX4p2nWII1jK8ctiA6gz68vTFBZF8ogWWPFqFdoTqpLg/iCTw1rWE77FZ9t2FrabM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329972; c=relaxed/simple;
	bh=kQnL1xyATLdYheZxJC2HtpPYDmqM6al4GJOI2F2bQjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLTcT5BC73ethfb7WRsXgRx1LeLmp8knvkYtJnpvgb1A16awC+jL4sXLs40EgaLOYS/syvWhPhU2Lovcl4kwN8DMQsYMnGzx40/AKkGttK9C4b0kyVCIwj0m4s8k7nYn8SbvijKDacO4cg/YA6IZ1h0LVxhY5VbXMZasIouQTP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liectbEX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liectbEX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EF9C4CEE9;
	Tue, 22 Apr 2025 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745329972;
	bh=kQnL1xyATLdYheZxJC2HtpPYDmqM6al4GJOI2F2bQjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=liectbEXQohowLkL2nCrkrHkuA6T18ncpI9oHapCWd4Ry9/+hvLEcUlEKAKmoLN/Y
	 7RQQsJdYooya+riTynKLuEFW0qwkUcQxtJhfoA96CyyWoBzO0qaQ94Cc7HjSXngs1J
	 uVmKa2wpXDSXkDI4DgHn2FwyK/CASm6wH5PbuptHLWccG9VgSCy90y3zE/EW+Ue+bE
	 RQAKHiIi2e3sZKDVhY95VBu66KnNtGSC2QipjFlPffH2tzhkO41EvGIPvHkBlLTX1r
	 Ri2hFtcERzrXv10IVxNJgw9ohJX97dZ0IZTldp1GkzAtDfzjEaCPIS648Rm1tkv0xr
	 6+MATFw+TcPzA==
Date: Tue, 22 Apr 2025 08:52:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	FUKAUMI Naoki <naoki@radxa.com>, Conor Dooley <conor+dt@kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add rk3588 evb2 board
Message-ID: <174532996962.1131838.7764666053549071176.robh@kernel.org>
References: <20250418014757.336-1-kernel@airkyi.com>
 <20250418014757.336-2-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418014757.336-2-kernel@airkyi.com>


On Fri, 18 Apr 2025 09:47:56 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add devicetree binding for the rk3588 evb2 board.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

