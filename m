Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58B6219E8;
	Fri, 27 Jun 2025 02:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750992843; cv=none; b=JRUzdCnq46OUQp2E9tGzYvwsMaIZ+pvR5UMKbApfdNnqCFXFhPnnBqMH5Hkh8rzOwNGCYJEQtbuQ6R07scLgOsPG9FXsyHJjKkeSc9ZAOo9TIdkveXZITvgkWjSVCk5ZLuQNI02ReWZmwpQS5c0AeCk1+oTgw5udimoJrDzLPnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750992843; c=relaxed/simple;
	bh=wJU75AN5N+JxJt9IZ2mvZjmzC4qrJoZMLNvd/Qo/ExM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QB+CsXe3xZ50fmxRM3D9WeM1z1JaoOdpAujrSyakaNTd+Wf0gNPrcp5JMLbWSz7QqDMoFX8zc5HqoHJNjDc+Ktz9pAFLg+Jteovo+anzUCuaBPSIebUcGDCPSPdjj2o/epTS1Mfkwgu2LAf+Fh923NN7bKnVa/Oh6z0Yf4WEWFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TcalxWvV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TcalxWvV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E4AEC4CEEB;
	Fri, 27 Jun 2025 02:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750992843;
	bh=wJU75AN5N+JxJt9IZ2mvZjmzC4qrJoZMLNvd/Qo/ExM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcalxWvVP9yRcG5K3apPJR/q/HrhYXui6oxpghlN4jnuzrm+cmewTrJP6QjKHYMhn
	 HS2bX+r7lTtU+AgAIjepIuP4wk5b4GR1g4SFoM+SK6Eo+S66D8fm9M/ZlueggJ0Dn4
	 3mnRPGtFmFQnOff1vr3XEZXMId4vU0jP4JVNOvGxhhaMtdivlAJr6WoWoXR6u5ov6d
	 iTY7Y6nZXXvhCoTqbUTdKk45ivswpIeuLoazTBNEC7IxLcjMiuUfW7dVciAODNHAto
	 ULhScgqezGb/NUykTiwlnU8NbTF+C2geXvazmb3yq2j5nONATqjTTVOfWrgITn62ui
	 YPLRv7zEavDXA==
Date: Thu, 26 Jun 2025 21:54:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/1] dt-bindings: interrupt-controller: Add
 arm,armv7m-nvic and fix #interrupt-cells
Message-ID: <175099284158.1668434.12568575546399483829.robh@kernel.org>
References: <20250624224630.2518776-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624224630.2518776-1-Frank.Li@nxp.com>


On Tue, 24 Jun 2025 18:46:30 -0400, Frank Li wrote:
> According to existed dts arch/arm/boot/dts/armv7-m.dtsi and driver
> drivers/irqchip/irq-nvic.c, compatible string should be arm,armv7m-nvic,
> 
> Fix below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dtb: /interrupt-controller@e000e100:
>     failed to match any schema with compatible: ['arm,armv7m-nvic']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - keep arm,v7(6,8)m-nvic compatible string according to rob's suggestion
> - allow 1 and 2 for #interrupt-cells according to rob's suggestion
> - keep arm,num-irq-priority-bits as required according to rob's suggestion
> 
> change in v2:
> - fix example interrupt-cells
> - commit message add driver information
> - remove unused compatible string
> ---
>  .../devicetree/bindings/interrupt-controller/arm,nvic.yaml     | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Applied, thanks!

