Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B55220E6EB;
	Wed, 28 May 2025 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440650; cv=none; b=gTvQoaaRi2i5pk5aa4fjGOepcMEw5WknAcmh3JTXhwmXpIIGiYs81O1cs3yjls0CPFtDHEW1WCjcwMNGNVrsMKAJm9pOL5Qhkvz4mlW+Mjh1nBrJSuQBJ9GR6nq6EsQdFvlwH5Z7J6Y+Qx+ADns8d6apu4VV2nMXs3DUfbm/Yg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440650; c=relaxed/simple;
	bh=re9cRmPSpTjjnS1xkzSl4ZvxwlyiJAj7HZDGSgvROcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEBR2Rc1zX9POgR8GrQQ5nDWrmmPxe2Z8zgmlNxm1L5iQaub5rNC6pAaC9BclXr233xCjO9yzChTc2C7nEl2dfnpDQYpjZb9SnTy1QAvIm47JbDWaBEVqNQBdZES90/rsXWHWe/IMzc6gDyM181AWF4QTEpPPjlNpYIbOc2oPFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rxx79Xja; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rxx79Xja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89C6C4CEE3;
	Wed, 28 May 2025 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748440649;
	bh=re9cRmPSpTjjnS1xkzSl4ZvxwlyiJAj7HZDGSgvROcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rxx79Xja/lpk9Jv96m91WBwxJVpbig0PH+b3FXzT2BVLwQJHaIUnCM2KsR7/VNAR8
	 5tLUVDfGrhMpLSU6PxOQUL3e0cigY+a2Ka1u/F4pMOhrbkuV5hW7CKoBcnSCQOtwOW
	 X685PM4Fq7qW5h8ruQfyMv5aX0uDY//ips2p5osVrAKO4PKBa944IngsY9K02pYWZd
	 16FE/R9FZQ50P6LkAoStIxhJa6LE1tPnN2dXTmPdug8tM0PVg+yE8V0XTI3RxQyrxW
	 IO2KMLKlfutlThMmSYvjFi+zj4D/aAf4fBl5Ynl/82H5Gt7Cm+ERZLYeTwJzcfs5gv
	 M0fjiAHOphslQ==
Date: Wed, 28 May 2025 08:57:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, imx@lists.linux.dev,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: timer: Add fsl,vf610-pit.yaml
Message-ID: <174844064699.3859704.6624203332315321505.robh@kernel.org>
References: <20250522205710.502779-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522205710.502779-1-Frank.Li@nxp.com>


On Thu, 22 May 2025 16:57:09 -0400, Frank Li wrote:
> Add binding doc fsl,vf610-pit.yaml to fix below CHECK_DTB warnings:
> 
> arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dtb:
>   /soc/bus@40000000/pit@40037000: failed to match any schema with compatible: ['fsl,vf610-pit']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/timer/fsl,vf610-pit.yaml         | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
> 

Applied, thanks!

