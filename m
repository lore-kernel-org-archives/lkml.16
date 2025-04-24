Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212021F4613;
	Thu, 24 Apr 2025 07:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480136; cv=none; b=P2wPEHRVuWrqa7hRieXOQ2nDmbpgxRh98LD1S159Y3lw/V3eLMIVsylQ7SQe0aWxjaMWWEtvYe3X7ysmZAxnlDNgQ6d8p9u2JqDIJ7H9B39sPeSfq8chX7r3nzIm0tuS9siULu04HhZ1RT520ElC9YV9q+BJ86vmPicodJggJVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480136; c=relaxed/simple;
	bh=sV/Yr3t57Hh/fnbj2+R1XyIyQYmRB7215HEEUpCxgYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jezRYsi8id1Olk0fgRLPtqVHC9ZweHdqkJUL4TWKm/tC3hedncIjzU6Ht9rUmwR4mQwn314gtul8aEtdlguw3BlOF/6eNHCg9FsUhQxsq8ARufGijTt7Wuq5t2kANXUNoc/678Wfrw5Gul72KTYNvak50ydfKErdnhq3+E9q4Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELlU6AYu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELlU6AYu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68DD2C4CEE3;
	Thu, 24 Apr 2025 07:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745480136;
	bh=sV/Yr3t57Hh/fnbj2+R1XyIyQYmRB7215HEEUpCxgYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ELlU6AYusnI8ir3dVO55soTQNJSzVBOn/7GbD/RxuNat+/E45JAoE6sKxpq1PbBMU
	 itGPjl+465sDgV94/T4xi1geU3PT+VT4FvrPiapx7lVmnv94NsDyMXuNUDnh6rZRV7
	 QVv6cuYPx7O/HHrJie6gbNvZ8fhaAkTqMO9UXgwYqylF11+mCpIRbsXXi1y3OWM6RD
	 icfkLOJ/+1f+w5TV7+qm1bAj7goVryAtGeY+e4EQQMP7It/makIhEHnodHMgdqeCKl
	 n9w+OIKzh8VOE9OH7bxSg/jTCw259zNDWlOy0tr8Z0r//x0RV0RYGYoLKDIhQrlWkG
	 zOgABwaEMMYSg==
Date: Thu, 24 Apr 2025 09:35:33 +0200
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
Subject: Re: [PATCH v4 5/8] dt-bindings: mfd: syscon: Add mt7988-topmisc
Message-ID: <20250424-cornflower-waxbill-of-promotion-4e24a7@kuoka>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-6-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422132438.15735-6-linux@fw-web.de>

On Tue, Apr 22, 2025 at 03:24:28PM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for Mediatek mt7988 topmisc syscon.
> This hardware block contains 2 functional blocks
> 
> - a powercontroller which is not needed (switched by atf)
> - a multiplexer for high-speed Combo-Phy
> 
> This compatible is only for the multiplexer part.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

