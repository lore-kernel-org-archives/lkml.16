Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5699A205E0C;
	Thu, 17 Apr 2025 06:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872824; cv=none; b=frPkFhqSph0EevrroyrQOlXdtF9rqAtaHSRT7KpjwkCOKXmcngzmTurnkRKWBxgHt5eW+PQ7beFH6+KmMUDtVvOEg8WHmNXo/CPNH2ZlWhjv7AHQPXp5jZSFdjS068zCk2vYpbypS7mozOcGbGz2CUb+yqOhOOVjaQuEaDj1UfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872824; c=relaxed/simple;
	bh=C9PJP4UkeEpAAoNxz6hVCAneDrneZyGWwBSuhOWnKqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDITXuiwyH1C+pnWDuqFPKewzKWBGBl3aV9ri20w/jLVrwG7xn0kluogWlYbd8Fnv8NZ27bq3MYOOZ//qLyq0OP2ffeTa8dMEylOSUJu7QKP+Jd0grFzW+1I0jJhL8xbcWnupd4sByWs5I59yWsUhnqJsVhvjKGSCLqQAu9nZ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S734jLaF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S734jLaF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EC6C4CEE4;
	Thu, 17 Apr 2025 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744872823;
	bh=C9PJP4UkeEpAAoNxz6hVCAneDrneZyGWwBSuhOWnKqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S734jLaFHWX3qXivUZYGnlAgUCk2Gy0cVyeJrOiKNGdv9qgGEdqJhkDh1l5g2Pnh3
	 yLs2srVcPPP/1BMToiWz+WUtxyldKYdKM9NmgLfuMxw0y34g/bTbWj9vgIWJXkdUKo
	 zvmYPn7BSFU/42xvXranr/+PPnvnND5uKIpMsbK/sqJuuWWIRZWla5Sqa8vHa3aXnX
	 c6LnRWDzkUC0UHMEayez2PjbKMccKeuQRxb33jtWa0+86Mx1P3bfS4JStA6Sy7Rm3R
	 AoZ04Ol8pMkUPgZnRcyJSkngOIXaZIjK0cjseOuB5arh+BfXzg6GbNOT/gmvZBf6S1
	 MI74hhjTbfoxg==
Date: Thu, 17 Apr 2025 08:53:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Wunderlich <frank-w@public-files.de>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Daniel Golle <daniel@makrotopia.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 3/8] dt-bindings: phy: mtk-xs-phy: Add mt7988
 compatible
Message-ID: <20250417-competent-gray-spider-4d9b2d@kuoka>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-4-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416095402.90543-4-linux@fw-web.de>

On Wed, Apr 16, 2025 at 11:53:55AM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for xs-phy on mt7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

