Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E62CCA9;
	Fri, 27 Jun 2025 20:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056402; cv=none; b=kxiBO03S2Fos5WjRwiMbAgzh2fk/7ZHYCCZ6KoGIIwmv7okELE3vqeCF9SsXMbTeryCu5kIiOCJzvOzzNXUt6DFPQy73MeaxyrhQbbHxEFcnW3c99Q/vIIoeAL7uxAqaplDrRIhOXFWfoDd26Cg7Hc+gSeL6YzZ3+zKrobX3fVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056402; c=relaxed/simple;
	bh=hPZ7lToHIehpbVEj+iZ8trkNNhtocc/67HoeOJ6kKWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCJYzsf+YMhx3y6MB4rvKIhczO+OnpV3VnOdTF7SVTKW4tMUr49qE2R8m7PdyAVlaotLN9i4i4G3XtK5m1SrWMQaQuM5AsiNkhRNdciZzz8LJ2M7m36n7l8gX6L9kvEPDbuiHemIYq9gnXSJgYMl2STrtLUqLXlgyUAgznzXB/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AX85DbaL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AX85DbaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40458C4CEE3;
	Fri, 27 Jun 2025 20:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056402;
	bh=hPZ7lToHIehpbVEj+iZ8trkNNhtocc/67HoeOJ6kKWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AX85DbaL0/jRcW8qAkrfWqUIYxW5upEleCQfrkFIQ9l3j/49qbgExMnru1oVSAmHI
	 Twk8tcsHa6tVa9RR67QewvK6t8OQmndqJG4/P/GHTIdoSPnyO2QEHxzBWHgrrvZLCC
	 lroFTbn64C1V05Mw6jAVe0Ywdq7CUGq/72JZoDeIY8yMr6X6nMqOpEWsJpJjs96OQ2
	 qnZ0lLFRESfGLx7jFxoWkrVZqG03UH2NHblNtDkSkHLomX2tWmfMKuIfkq8nOaczcY
	 pR1qemPMgQxw1cPIdY7H7VpPWTRFGDdl51XEWKzLXccF2crp/N9zU4nWootqvLTQqR
	 B6dVYZSsCtJUw==
Date: Fri, 27 Jun 2025 15:33:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, imx@lists.linux.dev,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH 1/1] dt-bindings: net: convert lpc-eth.txt yaml format
Message-ID: <175105640098.36252.2031564154179426300.robh@kernel.org>
References: <20250624202028.2516257-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624202028.2516257-1-Frank.Li@nxp.com>


On Tue, 24 Jun 2025 16:20:27 -0400, Frank Li wrote:
> Convert lpc-eth.txt yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/net/lpc-eth.txt       | 28 -----------
>  .../devicetree/bindings/net/nxp,lpc-eth.yaml  | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/lpc-eth.txt
>  create mode 100644 Documentation/devicetree/bindings/net/nxp,lpc-eth.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

