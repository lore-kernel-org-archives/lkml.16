Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8518D253B47;
	Tue, 24 Jun 2025 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750966; cv=none; b=uHgjt0XBEuCqLUJ5+bVrAds1okOkbUcLcmepBzOaS4oXpv9n836lCroUsUlqQ6SopBXClqF8XkignR5I+ptm2OO0sjTsFaHmdHtE5TrGkKr2Wy+RnVSgj5KGTNVLXvrwmyfaF7QhwiHlzO14AdokeMhuDwhSF4s/6YorPYF3Ynk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750966; c=relaxed/simple;
	bh=WBaglMgmsNR9cwyCV58jjVrD6lxTJfrwBw3z95EKGDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZy4IBC8nqK7iPHm+zcPIqYoz7MCh92KsJKQJTT1qOPMhhlCyoPfFL7xX7bBfitdgVdkHw4OjR8/ENQ4OUULMq9nPFk5OL71JZ+xX9OViCR4ja+X42/NsnxUXCegu+IGbuzoPKKKRN6TWR/yUTP5BfIMhnSui10WeMFc7q9WmNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ras4Z74X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ras4Z74X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F39C4CEE3;
	Tue, 24 Jun 2025 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750750966;
	bh=WBaglMgmsNR9cwyCV58jjVrD6lxTJfrwBw3z95EKGDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ras4Z74XQOb6XrKKxaKPMa+A5OowaHyysdGsFElfO18pkL/LpEyC9XZ5QKYk/XpQo
	 FaUKZJTum0nS2x/j0M/k3fDitol6/1/k0H/8TwIGIUOxgqCXhfkHIX+/iXSgZ2Tpq8
	 Yb+peXIzw3ElSIA/gLSgAaUrOhD/8otse1SXC/AYY+ZsvzvKUEsk4rn+x+MInytFCQ
	 6TIIpGmeeoLxO5CIxd1CVzd9KDCf/bZP02jidZpqu1eF0pXNL1NnP3uyZlQ3xxYY/W
	 LuK9jq5UTCY2iEXVkBi7CBTiIp29YpBucYpPbYK8xYoHEzpDLlcIXRC0CWp0ffj4zX
	 Dow6lOMoX5k+w==
Date: Tue, 24 Jun 2025 09:42:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
	Andy Yan <andy.yan@rock-chips.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Shresth Prasad <shresthprasad7@gmail.com>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] dt-bindings: phy: rockchip: naneng-combphy: Add
 power-domains property
Message-ID: <nhsqnvfrz5s2635zm33nvhehcxoqowh7kipnh6e2wlvjdbxee2@6yd43t7kariv>
References: <20250624033733.50197-1-ziyao@disroot.org>
 <20250624033733.50197-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250624033733.50197-3-ziyao@disroot.org>

On Tue, Jun 24, 2025 at 03:37:29AM +0000, Yao Zi wrote:
> Though isn't described in existing devicetrees, most Rockchip combphys
> belong to a specific power-domain of the SoC. Taking RK3588 as example,
> combphy 0 and combphy 2 belong to the PD_BUS domain. Document the
> power-domains property to allow describing the information correctly
> in devicetree.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

