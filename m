Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F7F211484;
	Thu,  5 Jun 2025 23:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749167075; cv=none; b=VLftTDlwABcgNvJgwTnqqZX77dQTVns6fnlIcI2+3tJ5PWaghQ7+sAKrWgk+u5hjYuQQjga4YRvhSC5I8nyKZNBKzK8HspMKXafArtcTIdK1V2kkd4CnQdRbstbVyrd016S9cV2OW5SrE8kbGP7j5VLz6+SuQQIZ69ZxXwRqrnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749167075; c=relaxed/simple;
	bh=uLnzJMygHu8Tutkf6XRz1D8vcZXOGaOVsErURKnt+gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFnq1j0dDXHxMKNMTnJHLm/v8WlHZ/lqRLYOrl68T1WCfHEHRo9OGSIwh562EKzeiq7uUD/evLFdcs96+bsvR+miaDih1BWVcfLF3/z/uqye5NN2EGyTccgQb8DN1GGAjejocBps/bdERJqvnr2u2ZCWuM/YNffgeOW7vfmfPAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HfK6jviX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HfK6jviX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E592C4CEE7;
	Thu,  5 Jun 2025 23:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749167074;
	bh=uLnzJMygHu8Tutkf6XRz1D8vcZXOGaOVsErURKnt+gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfK6jviX+s81FJV1x7o2MMM+yujt7hf+LRO5tnojRkJ53FvdGAWd0WuV1yY8iK3CM
	 2FSQufCf9T9pVQOqhYkmROLIFrjYbPKa4+AzmJPqtlj/ioV40tWR5zAZ4a4os7B/im
	 /wk3eLBdBlcOUh54GWA2ij/D4okS7KSXg6NI+LDMIOW2qT41vjQVK3wRm1N7rCGkcY
	 14JwtjWwd3+xmZWz/qD/zAldBAY7EmMyDcUPaSq7OjSf1ZuiNzT71/kFMwoUx3bF05
	 e4aTb8qpbq6sS1eQKgo55vj9RK+LJHalRpTLuUNI/ArhwVXoC8dUb7wZ83BmlNBvIR
	 TjD/WiFDnIgRA==
Date: Thu, 5 Jun 2025 18:44:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: soc: Add fsl,imx23-digctl.yaml for
 i.MX23 and i.MX28
Message-ID: <174915544909.3193294.9385556983515352599.robh@kernel.org>
References: <20250528183549.694434-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528183549.694434-1-Frank.Li@nxp.com>


On Wed, 28 May 2025 14:35:48 -0400, Frank Li wrote:
> Add fsl,imx23-digctl.yaml for i.MX23 and i.MX28 to fix below CHECK_DTB
> warning:
> 
> arch/arm/boot/dts/nxp/mxs/imx23-sansa.dtb: /apb@80000000/apbh-bus@80000000/digctl@8001c000:
>     failed to match any schema with compatible: ['fsl,imx23-digctl']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add more description about digctrl hardware module
> - fix double /
> ---
>  .../bindings/soc/fsl/fsl,imx23-digctl.yaml    | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,imx23-digctl.yaml
> 

Applied, thanks!

