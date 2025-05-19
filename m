Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8FA26B09A;
	Mon, 19 May 2025 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644121; cv=none; b=oxcS5zSXIwF5G2m/1VWmy0mK4la0g1yqzadcX/1Ig1SvX8DqSut3z8LLh2x+X6fPg0btXRwxmF77nBPVz9uy/1FciNgwnvyjOhBH7BWhIzHLNac618YHfEJNiMlEOqtmEztSyeE4PdeOEGzRU7Shh5B1cjVj0x88rG9laWDG5f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644121; c=relaxed/simple;
	bh=d5pZXYxQl/A6KUqhL6ZrBl0iDEsBsPRHCiK4Rf7Rbwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMEw8AYpNm2sHsMT+WZrNj5WNOlEVdpvgtGefUAR4HTFFyrp4G6Jg+bGuM5+qw5xGUTXcN5bZDTKSI2zbVcscLLr76Dkz+goe8hTZcdw3FrbW1QAWSXVeXrkP3Bbke33eQ84nuaRbQZLQNcWkX2vXhs7VPTF7yNDhlblQchWRis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrrLHCW3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrrLHCW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484BEC4CEE4;
	Mon, 19 May 2025 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747644120;
	bh=d5pZXYxQl/A6KUqhL6ZrBl0iDEsBsPRHCiK4Rf7Rbwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TrrLHCW3bvS8JdZT/OcRtLpDvhVnI/NU2tfVTjBnnWthoyCrx5GR596GVmuWCE/NC
	 SQCb5qIcVDjPm5Oacg7YZFQ5dfrvyGwIYM1NZ46RkfHIQW74mgNjRiWfYr8JiBZDEA
	 gJe/ntblvXhdiWG/p7z60Lcx/g3FE5kY76IpE7SCY12IvlUgsC04ZY5nnCrW0UMuao
	 V4s0vxYVU9NlW7niUt+LDxYM56I0JYM4gEGzgyHKjyKyMhGWIwSxbnBaPXTnur5yhY
	 uVp6Gov1fGAsWNkb3+/RIg10RkS+DrF+B/gnvuSXWwPSmB9HKN3gjVDXrVhwY6Ys2A
	 F72kmI61VPhuw==
Date: Mon, 19 May 2025 10:41:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neha Malcom Francis <n-francis@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, u-kumar1@ti.com
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: ti: bist: Add BIST for K3
 devices
Message-ID: <20250519-bold-dodo-of-cleaning-d9b9f8@kuoka>
References: <20250514072056.639346-1-n-francis@ti.com>
 <20250514072056.639346-2-n-francis@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514072056.639346-2-n-francis@ti.com>

On Wed, May 14, 2025 at 12:50:55PM GMT, Neha Malcom Francis wrote:
> Document the binding for TI K3 BIST (Built-In Self Test) block.
> 
> Signed-off-by: Neha Malcom Francis <n-francis@ti.com>
> ---
> Changes since v2:
> - move from redefining ti,bist-under-test to using existing ti,sci-dev-id
> 
>  .../bindings/soc/ti/ti,j784s4-bist.yaml       | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/ti/ti,j784s4-bist.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

