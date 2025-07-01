Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BDF4A0C;
	Tue,  1 Jul 2025 08:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357072; cv=none; b=F5kdhXgtmBk6fCSxyMZVh8E+a50w5bIHEPPEN3JlhHWTE4xWkrhsiidCQx3qyZYS3BMCe7V5Pyco6IFPSEhhqaIlE4iGOJ8VaDPOya7vNZpABlfRU6dz9snSuYX3WDis0EQMstNUkp0UBDscOENisDrLXyfn/2hQaFiensVBT50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357072; c=relaxed/simple;
	bh=XR9jDohx2+YhItNyaDv7Pg0vMjnF3uLLK93y84AWj14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3dxmAtwDia3/uAFawvGNnvfzJ8ZdJU/LxknKSJJO6iS7fwHRbsmPEqZituCaaVHGYdun795NVln4Y83e7rnz3qsu312Yc8i9f1R46FWpmLO9fnPr0pX3r++IsqGSvjMPR3de+4/nwcPfEED1EDDDTWRKrxxH49pwMql4GE/PXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDLE6KRa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDLE6KRa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BACC4CEEB;
	Tue,  1 Jul 2025 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751357072;
	bh=XR9jDohx2+YhItNyaDv7Pg0vMjnF3uLLK93y84AWj14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDLE6KRaFgHYfI45ve/XExNF1c5plly4IiUiW/t3mecUvktqfSi0kePxOGCGhf92/
	 wMlRcmEVHrMvHv2maG2wu3Tgj5rMBsAyQR3LMCNRmPUcSWwPwCBkLcZQzQp+R9JDKm
	 Drz7IxWQzf8TKxv+g2juxNjjZ311AlFpO8xbK/bo8vznEuX0HsRgAJ6Ho469f3nIRw
	 kFb1YrmzEecZVhNlbCJqxzZjEROTjuS8cQxYRhl+qwNoDEDmTXwH/M/ev+hBykIlWk
	 h7Zb7BbkPwW3cQt1KBiTKS7Q0HAJcZyG6Z8vLIEcJW4FVUVZeyOoLjxV+Y/SkH3N9V
	 6sjeobFIy37fw==
Date: Tue, 1 Jul 2025 10:04:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Message-ID: <20250701-wooden-arrogant-goshawk-ed2f12@krzk-bin>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
 <20250701002239.972090-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250701002239.972090-2-laurentiumihalcea111@gmail.com>

On Mon, Jun 30, 2025 at 08:22:38PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add DT compatible string for the i.MX8ULP EVK9 board.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

