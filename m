Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF248280A21;
	Tue, 22 Apr 2025 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326616; cv=none; b=dZF5woX42rwqEYAi8wY2KmzMx9cq4cSLj8z2tIJNK+LFIFQA6UrL4KPR/90dg05HhapfG5+bsUFbBTgxrAl1y8w52AQqHDxpfowUWEi+UUwlONFQCTEvlajU9PtBER+IdVnjhU0ibIYDpza2aDsm5S12Ek5auZDWXcFlvnHGA9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326616; c=relaxed/simple;
	bh=jYEOUEpAwOn3yr5q5yZLWBNVs85A+4vFAdoYWIC0Rz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgyXv1G/4cm+MXvKX6+2X3MlR+44jg2eafA1Y1/SlVuldNYgEfZDg1etymdt3mzN1OLPyifnZXMkYg1/IpFJMUn9q61EEd5M/JcHq01sFh3MosIFS8OI11+KFZgQZ6i+SxgOZSDTXFIg/RMFcFxgs2lZ+nHcB9SBXTb+GZHat8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyOfS9Co; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyOfS9Co"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 082ABC4CEE9;
	Tue, 22 Apr 2025 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745326616;
	bh=jYEOUEpAwOn3yr5q5yZLWBNVs85A+4vFAdoYWIC0Rz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyOfS9ConEWjGM9GoZPRI7lw2WMPgFn5fzB7Cx+VjgMJx0eJULzecJomjQgXLGV/6
	 B2ghLoLBIxIPFPxGxJAhACE03s8LUoYHb/rd18Ax/C7O8wBCQGVw9OUnCvOCD0px6m
	 Ovg99aoTtyImGfWjsqtRFKqXld0aZuOjQAPuS6w5VqftkBVmffwORSWdwEN7k/Rf0L
	 19I07Z7sQRmLFFTtYLeyMcndzgjiSeXHcIAkcx/8c5mqSxGGVB/xWGYdUOjO/GVw7t
	 5wggmaSBPT1950LSiYz+GmjQ42Ld+BEkJpQtnoTY0VnWv5hbV6DQkFG5diIStAKd58
	 6KtDcOCs9ixNQ==
Date: Tue, 22 Apr 2025 07:56:54 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: fsl: convert m4if.txt and tigerp.txt to
 yaml format
Message-ID: <174532661282.962885.3469691185487125433.robh@kernel.org>
References: <20250417150608.3569512-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417150608.3569512-1-Frank.Li@nxp.com>


On Thu, 17 Apr 2025 11:06:04 -0400, Frank Li wrote:
> Convert m4if.txt and tigerp.txt to yaml format. These just use reg to
> indicate memory region.
> 
> Additional changes:
> - Add compatible string fsl,imx51-aipstz.
> - Add fsl,imx53-tigerp and fail back to fsl,imx51-tigerp
> - Add compatible string fsl,imx7d-pcie-phy, which is not real phy and just
> indicate a memory region.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../arm/freescale/fsl,imx51-m4if.yaml         | 41 +++++++++++++++++++
>  .../bindings/arm/freescale/m4if.txt           | 12 ------
>  .../bindings/arm/freescale/tigerp.txt         | 12 ------
>  3 files changed, 41 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,imx51-m4if.yaml
>  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/m4if.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/tigerp.txt
> 

Applied, thanks!

