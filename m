Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07DD27E1BA;
	Tue, 22 Apr 2025 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326896; cv=none; b=FMYKvpp1SEBBRmJC/AATdiux269Zn0J2wZSQnWVSAOEoZHooiv/iRISmkVwSl07HuyXhPgJ9GCrqTsURflsaAC00JbSBu7XKwFNHI2K9drjl2C+Ncf9uIMMZqCmKvxm/4I9bw55Qrx9wysN0YMbTfkN1gB7SlV4cEyvzssajVcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326896; c=relaxed/simple;
	bh=RRIWZyujwpn/9gYhBWQmbIspSVHn2nUMBWge3vwA/1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oemi1AimAsYyj3wWkiyVKHX2jVZsshbAmb296gEOQZjJplXHjFtmAHQ6iPo2rHq/zdxt4hkyFhOqi6+Xr2bMAZ/RZaWpdiZI32lijer3xvp4z5Blzwqxp3zAuSXWvRe40gS47h3V+C5PmHxqY0HQHlMPaPjUxTsJbPI6/kpSz8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZHrIVZuQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZHrIVZuQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBC8C4CEEA;
	Tue, 22 Apr 2025 13:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745326895;
	bh=RRIWZyujwpn/9gYhBWQmbIspSVHn2nUMBWge3vwA/1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHrIVZuQUvmzUNEIHzd7TOkPNb5sQP0KEfYQXjI1oACP5b8nJbnDTc3h4xJAK1+qh
	 ExBKXTWe7MStmiI5yLWwJ41XFzBFB1MFEg67sFssIqSRr7fWd21oI1aVTI0BDgIh6u
	 RLxX3jHSP7dcVrqZZmpW/FtPdYOCN/edhoqIRAINvvw1QYO6wwuGvv4ymjooI9BiDv
	 EMyOZowTmY3tMxDGGDF7QSblHyr+Ohbil0D/vONFaVkJcfhe7atveyxC+eK4S8LcIE
	 ADoZq823TzEBKta4M6GQLcMOXbx/rpHsXJCCco8PaFxYVpi2hlAjsZ6I1Sz6uBhDgs
	 2X4dqibGldpwg==
Date: Tue, 22 Apr 2025 08:01:33 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: fsl: convert fsl,vf610-mscm-ir.txt to
 yaml format
Message-ID: <20250422130133.GA964797-robh@kernel.org>
References: <20250417151526.3570272-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417151526.3570272-1-Frank.Li@nxp.com>

On Thu, Apr 17, 2025 at 11:15:22AM -0400, Frank Li wrote:
> Convert fsl,vf610-mscm-ir.txt to yaml format.
> 
> Additional changes:
> - remove label at example dts.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../arm/freescale/fsl,vf610-mscm-ir.txt       | 30 ---------
>  .../arm/freescale/fsl,vf610-mscm-ir.yaml      | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.yaml

Move this to bindings/interrupt-controller/
