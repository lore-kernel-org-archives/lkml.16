Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F305B230BE2;
	Wed, 30 Apr 2025 10:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008578; cv=none; b=Hu1TWTl6ERyydOleD8kzmbaG3vgbtoHapiB4P10gwHv3DwFiCIa1riyUehASXvpZXgRsDeUzVCcecDi6clm1q9O2BqkQOKZQQvZso/QTzFmXa0MsTb4Ohnu6ci8kbk5htYWUucuwaqvcU4ZMYyy4jAFnAGQQ1oUxNa1SCXWvDc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008578; c=relaxed/simple;
	bh=3Yw9ztdY5WEc4kBWw0QPEtWQp8inoc+qPFkV13xi6rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/tgXFBzuNZVnwyfDU8ol+u3CE07DrrY9k2rFyhqdPBhEBFO+scENHrlbrM+LoTPw3eEim2yjBw/Zq4l8VwtXhzAKoVSXQqIyRpejh+8uB1PvEwjXWy2PSi4KOEhfKXBPvMcK54Rc6ds75pX1YnSrBMHaWoiZab7s7gXX8hatew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHtxCrlV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHtxCrlV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AC0C4CEE9;
	Wed, 30 Apr 2025 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746008576;
	bh=3Yw9ztdY5WEc4kBWw0QPEtWQp8inoc+qPFkV13xi6rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KHtxCrlVKQ/c7Di3/EPrP4Klw2sjrcpp0ng93iIQd0JjoHnRQLbGXkbhx0Ujz2zAV
	 HD9gcP5h6jiGU6nFPnu3w7h7kdZuCma8f8/q4OSJYysgOnWqOdrhoHDd0495PHeNjl
	 Wf5/QpHW0IamoyeZrvBi3oBvlEOs0Hsmjp0WpzDEDF+NT8WAR0eVsVuT/ZX2ddHB+r
	 YyDeS/9KFYdtYvMrBPY+yNzmYbHTTV0bacwcDYUgTc/8rvkxXsm7VFLdaTmJshfgfv
	 kP5mio1gMtnGEA3czsFJiYTbseAmQAhUsUcGN+xcN6TdurME3r26bA3Iqzm/Zv8LKU
	 mz+b/rVpnf0mw==
Date: Wed, 30 Apr 2025 12:22:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Kever Yang <kever.yang@rock-chips.com>, 
	Jianfeng Liu <liujianfeng1994@gmail.com>, Dragan Simic <dsimic@manjaro.org>, 
	Jimmy Hon <honyuenkwun@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	FUKAUMI Naoki <naoki@radxa.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Alexey Charkov <alchark@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add rk3399 industry
 evaluation board
Message-ID: <20250430-light-chital-of-cookies-b8f2ab@kuoka>
References: <20250427094211.246-1-kernel@airkyi.com>
 <20250427094211.246-2-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250427094211.246-2-kernel@airkyi.com>

On Sun, Apr 27, 2025 at 05:42:10PM GMT, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add devicetree binding for the rk3399 industry evaluation board.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

