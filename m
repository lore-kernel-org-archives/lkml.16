Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D3AC8DC;
	Fri,  2 May 2025 01:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746149129; cv=none; b=Dt1s4KMUpnbpdeW5eV1akh/pvdtIWBoZ33Nj45vUAiGgBuUlnhDL8+28uQXWFJeOXHjidOo8noWDa5t8jqktOC3k5/DGmwhAQ1OC7cEycFjbEUSIxLb7C6hW7f9TDCxl4HeP224QVcU/TelHVEgXxDOEqIJtTrTUDpwN3MAweFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746149129; c=relaxed/simple;
	bh=zd1nFbgKeSy+5nrsokDv/2xy+ygCCJKZYz9HQZRZkhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sD42T4wVZ40FSiWqi60oCxAVbKB8D3whj9mAtxvXkeY7aw3+HXpmVgETAshgQU/UfnwFMs53lm+LjG5LXR+VrKbzAtug4+VASSPLT4A1xNc+SliPEWdIti9F2EANgtdou9TDz48Szv+0JSht7GsS4v1ERig9FfRTjsVhwX9qpXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SG7WZ4ck; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SG7WZ4ck"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6A3C4CEE3;
	Fri,  2 May 2025 01:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746149129;
	bh=zd1nFbgKeSy+5nrsokDv/2xy+ygCCJKZYz9HQZRZkhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SG7WZ4ckh0bLimdNODNSxU+3V7AFpWUyQWg1hRwERt07Hh1GoPwLLpnQrry08Pm8u
	 TwoGXDB1KqO026gv8CNvrmC2cS+r/d/GokgGSwKv9Dvccs9+Zc86mRXCc3XBg0QP4X
	 UyvdoFFEfOiZdvGQ0vndna4Y8m4az2UI3sWpaXABi6ZaMulNyf7Mu8xF4ORF8whd2Y
	 eovF+jXHE54UhxsPP1SbZ0Kd1Wu9YiR2lfp9Jw2Cbb1qoCcxYkMqT9m1tVWa5chCZ2
	 s3GJcdtXq5xsP75tqJe2oF7dpABHcqLikMpPw0OBNkb63mSsITDRLIQhszwTRW6QzH
	 CO0B7+kzxKi2w==
Date: Thu, 1 May 2025 20:25:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: psci: change labels to
 lower-case in example
Message-ID: <174614912290.3401660.6761201989918368612.robh@kernel.org>
References: <20250501150934.77317-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501150934.77317-3-krzysztof.kozlowski@linaro.org>


On Thu, 01 May 2025 17:09:35 +0200, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase, so adjust the example
> code.  No functional impact.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> v2: Only Ack
> ---
>  .../devicetree/bindings/arm/psci.yaml         | 30 +++++++++----------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 

Applied, thanks!

