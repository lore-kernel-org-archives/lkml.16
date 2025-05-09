Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A61911CBA;
	Fri,  9 May 2025 06:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746770594; cv=none; b=nquoYlPYhGD7pbTiI1FL6xAzZSYVDBTasDaHpIg9MH6FpULr1mqUfOzczrc0wWT8yfSEwW80NbKPl/B/AG/HjK92gMZZr7zcKdH8nxtWqMu19WYy9vVBt3PgRG2FIGxyzEHeznS/sDvGKmvO0WFNYjIkraBLWmZlafgDPI+M8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746770594; c=relaxed/simple;
	bh=miqYtWyTKqalmWH/MGZunXZc53zAHSRNBQvWm45NGQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKX0BS1tkQG0wbVMEyMcdcclYj2W9Gx5Cd35OG3kbjHHt0zpczaK1js4eTBR73ice2EdKZcp4pZGx1eE0ySQouW2nW9KWaa5B477g5ORC5g2y0Oh/Q253l2AOAiBXaZYQfTqSnE9Ck90f3cxG6PVUTGO67L2yun7K0suWNP82v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDvfscBn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDvfscBn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51685C4CEE4;
	Fri,  9 May 2025 06:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746770593;
	bh=miqYtWyTKqalmWH/MGZunXZc53zAHSRNBQvWm45NGQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cDvfscBnFjzX5lYFVRWG6HqIvO2BmUHXP4zFLn5QBcuK2I4fgvV0Gqf+PjThAc0cx
	 dtRc+LWiQv87umLgJ78pVfk0qpIROY64IG+qnWyNx4HlqTEQnUO+EyibIMB4bo/jOW
	 RuM27JQIdkhpEXtKDmJot+11r9jRUXeM2f1Odv1r6JQTWkW/Xh/sdFnzlo68WpO92H
	 Ro4xSyi7MCUWh2ikYungCMBqbZJaM0v6HxtY7MGie6Fz4Uv3r3VkcFOECk19h4lGKG
	 eUeq4ceJoisr4sYDZ/6e3W8WD8FG20XVrGBoIUFSSG1rWws+U2kT4gc0cN7Xn01ztv
	 ZrhXtKYGV+a5A==
Date: Fri, 9 May 2025 08:03:11 +0200
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
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add
 RK3528 variant
Message-ID: <20250509-secret-smart-kangaroo-fd3b58@kuoka>
References: <20250509004121.36058-2-ziyao@disroot.org>
 <20250509004121.36058-4-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509004121.36058-4-ziyao@disroot.org>

On Fri, May 09, 2025 at 12:41:19AM GMT, Yao Zi wrote:
> Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
> or USB 3 mode. Document its compatible string.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---

Eh, no...

>  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> index 888e6b2aac5a..bd064754e537 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - rockchip,rk3528-naneng-combphy
>        - rockchip,rk3562-naneng-combphy
>        - rockchip,rk3568-naneng-combphy
>        - rockchip,rk3576-naneng-combphy
> @@ -102,7 +103,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: rockchip,rk3588-naneng-combphy
> +            enum:
> +             - rockchip,rk3528-naneng-combphy

Still not tested. Neither v1 nor v2 was ever tested.

Best regards,
Krzysztof

