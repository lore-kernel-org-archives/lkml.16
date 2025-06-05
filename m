Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB2718A6AE;
	Thu,  5 Jun 2025 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148135; cv=none; b=W0OOAs9yW75QmduWKrKJ23hbegFWRnVKMRsEQrc9j2VVdCFUc63PbwLBVVIFjeEgvOpRgtVAdWSSvQ+9zXe56lUzC6GW/cHz+go7IxEMlp/xzSmo9cXKPoRmJkeHAmCWyvsfeoBfndKSNfIkAUYLdzUcPCGL1+mm9uTNsSmunhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148135; c=relaxed/simple;
	bh=SxpCD6ISZ6SNV7q5q5PMNqCiQzrvFjlEMuMk0hZKHNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pxx9J3jyFovN4i5jTbZOMfo0541wf9S82Ywzpgc2It9XP7Ez88u5ifGlOqgFciFCvWfghKUtXv2MzJsFc3FQqyz9NAxOPjvSJJ8Ofzl8yd62S+vs9PMRZNqLre+ekJVK3dcRlLMFRVjFwljwsgnxC3ZKyF9eZrVZrlICJMHEjnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbr+e/HG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbr+e/HG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5E8C4CEEB;
	Thu,  5 Jun 2025 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749148135;
	bh=SxpCD6ISZ6SNV7q5q5PMNqCiQzrvFjlEMuMk0hZKHNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hbr+e/HGgvpeQJh6yW6or2nZr4ZfFYL8fAZJYSY95Ear0/KmNWxkYyLIvzUGMiAKo
	 Rqrplat/dc/fSpzFNnL+eGpPtowTXRuDVaCaS+923qM+9yvSlgUFJvRwnFSdMSRPsF
	 NptqeeiElj4/OQ3F8jbVqleqAmV/ylOzkBSTVulWzH3f38dy1UO8foevSrzTkobRUY
	 1xT0+n4M6rNB//nE0Jq/U5aFfcqqd99QYY7heY34oTr2zdOkjvB5UwdV68kN8ZmCmv
	 pxtSBhmqWaCG4ItmEA9vwXR+1fKjuMd/H801aFoUcBd87s7KDveNiqTrDAIcU94Ymr
	 pi6jvxByoOOWQ==
Date: Thu, 5 Jun 2025 13:28:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: covert mxs-audio-sgtl5000.txt
 to yaml format
Message-ID: <174914812962.2988981.13376867927592691613.robh@kernel.org>
References: <20250528165755.692264-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528165755.692264-1-Frank.Li@nxp.com>


On Wed, 28 May 2025 12:57:54 -0400, Frank Li wrote:
> Convert mxs-audio-sgtl5000.txt to yaml format.
> 
> Additional changes:
> - Add compatible string:
>     bluegiga,apx4devkit-sgtl5000
>     denx,m28evk-sgtl5000
>     fsl,imx28-mbmx28lc-sgtl500
> - Remove audio-routing from required list.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed commit change (all decleared in Additional changes of commit
> message).
> ---
>  .../sound/fsl,mxs-audio-sgtl5000.yaml         | 81 +++++++++++++++++++
>  .../bindings/sound/mxs-audio-sgtl5000.txt     | 42 ----------
>  2 files changed, 81 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

