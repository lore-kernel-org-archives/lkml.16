Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76AA23A6;
	Tue, 27 May 2025 06:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748328458; cv=none; b=sZO1GJ+/+1ejyZWO7FrNvLBXImK7FVyWE4uwx7hXHFZiRxDtc7fpLM6gh5/98QruL5fmt101/FhHN5+58gh72QkoJURYkw0lNuUJO+fp78q7ZjpBsy/xL6C+OP7POiPmWqKRyj4j9lNEgmLctlMqGMfu2rgh0v27GM+euQMPTXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748328458; c=relaxed/simple;
	bh=/pstASAAdU5HMcN6gKRnngJO2l7aRoiRmGIw04Yt6CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtkKwZjf3Ofg2eYKghOQHo+OnLOfHXZuptt+upZ2qTdoMkcintpCS6vp4wIGZIWg4bADMTCRq0qdyAy6hE09XHqT06deVWbVQYYWhVkS9GPHtkfds9rYwMMR/JErf8NtyYxDZmexpkZeIPXVtKqJfNZiPVGJP9hMC0pfID3vPXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qdO6IYtn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qdO6IYtn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC02C4CEEA;
	Tue, 27 May 2025 06:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748328457;
	bh=/pstASAAdU5HMcN6gKRnngJO2l7aRoiRmGIw04Yt6CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qdO6IYtnl/A0QJHyrMkXYCudtVIAs0GvVdFdvYWhIeFJKbwhNy3CE7zuRM1PX3tqN
	 oXXVxyUHqzExPCwnAjvm3Wfj2PPVUaoRMlp/+aBilqBkuBYf487nHOuWE01D5LriHu
	 NdS4Eg3vzyMgTzVRa9r0Ih1hzVS3KwrJWMztztKEsMcUmeCVi0lxEjv60IBvxwQlLN
	 hmtAiWIDvZV8BuDJxXhKREJs6/Wb1Hz4YIdzkqJL7kaavH8shfkue2i/YVFwzJqaA9
	 fhQSXvDjFJFBfuuEFjJJv3GlYYHJ+/5OOmnA7G125tD94GEcsizwM8WqqHNv+QmYdE
	 c+3yfpTSAOWqw==
Date: Tue, 27 May 2025 08:47:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: usb: dwc3: add support for SpacemiT
 K1
Message-ID: <20250527-amazing-hedgehog-of-opposition-bc968b@kuoka>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-1-63e4e525e5cb@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-1-63e4e525e5cb@whut.edu.cn>

On Mon, May 26, 2025 at 10:40:17PM GMT, Ze Huang wrote:
> Add support for the USB 3.0 Dual-Role Device (DRD) controller embedded
> in the SpacemiT K1 SoC. The controller is based on the Synopsys
> DesignWare Core USB 3 (DWC3) IP, supporting USB3.0 host mode and USB 2.0
> DRD mode.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  | 116 +++++++++++++++++++++
>  1 file changed, 116 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

