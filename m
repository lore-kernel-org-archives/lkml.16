Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46801CBA18;
	Mon, 10 Feb 2025 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739181802; cv=none; b=jsH029N8kinuj9haH+gNjXOUGVQ9MVKusgIKZO3hfuVasrEJe+DeMie38kCMhMD8Z95MeBcm8HCVnJXnPl11NK/iXpXhQNHnVWZZ1AKAwgZF+3QoT/XOtmZPcphwllxLB/Geab0BK45Bye+fzD1vUz5ap+KI3uxlG2EQxOgg+R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739181802; c=relaxed/simple;
	bh=3qI78dSTgjezorW3Ya+Br1RW/kymvh01hDyW5ZpBCgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIWjU5B5k/z81C6pSrPZEJsOybonz3WKAFFOKFT2OoDY1baDqH8NU9vQWuaPOqa/vCiG88CtdioKzvl8XlnFqlpKOB4Ywqn1ltNZj0pfzgmrxleo3ip7/8f99tMYAYtee+hszv8Oqi7BNK8PRqKr9BNL0XiPrzSnJqGaPXSkhgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cx/wuaXV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cx/wuaXV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CA7C4CEE5;
	Mon, 10 Feb 2025 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739181802;
	bh=3qI78dSTgjezorW3Ya+Br1RW/kymvh01hDyW5ZpBCgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cx/wuaXVFgPCx8jZ1bW4nazcSY5RlQYySWTJXTltFkV/5ld9k/js6nMZXzZg4YMrg
	 /ivsmp2fHYGxN/+Etk2N+cLEtyfw43A+6I6xtIRJwNqeV5kCGisyM5UnSJJqiLzdxe
	 RCYms7WiGR+lHK01AiNNOYd73PCXyTvFTKTCRh8hS63HszDc62+LnrgbjogHawTTMj
	 GfbN3hX1w9vozO/hjXbIn1EIWJV+ctbSs6t4MOv0JdRFg6zpRKlWchtxp61pSXKHLj
	 7dAVCVYMExThWFQuP0vzYWSnSUlhHxGUnzgOQ0EyEFFnYR7OTp/Fte117dHT+6wojt
	 evupnaYZH69JA==
Date: Mon, 10 Feb 2025 11:03:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, daniel@fooishbar.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v13 11/13] dt-bindings: display: vop2: Add missing
 rockchip,grf property for rk3566/8
Message-ID: <20250210-vermilion-bittern-of-diversity-cd4ef9@krzk-bin>
References: <20250206064457.11396-1-andyshrk@163.com>
 <20250206064552.11466-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206064552.11466-1-andyshrk@163.com>

On Thu, Feb 06, 2025 at 02:45:48PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The clock polarity of RGB signal output is controlled by GRF, this
> property is already being used in the current device tree, but
> forgot to describe it as a required property in the binding file.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

