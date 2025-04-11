Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCFE347C7;
	Fri, 11 Apr 2025 20:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744404936; cv=none; b=g2Hy0+s4JfWtoAfikqhqrD1nOLI1r5+pbfLj+lsBz74ccddMdypWZzNCjbV/g2TBy7CKp9MQQpevtBCwORTnMwXASkta5MmT7y60KxKVXPIXmyQZliNvAXTQtz1s+0bY0xHvHO+gw0ph/62CFWSvQJogjoZMzJBg68BzSiqgeM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744404936; c=relaxed/simple;
	bh=0uf2xpXdJtaI564a4ykCW3oUVBo/655/Dm+Eb8aWhR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBu+xBOh/4JF8kS7rmsNGvK+K4eIbYfeeFmH8+SQlUjskGnFBy+tdciAUqobK/sdJohorbjLhpMmDGXIlFhChmEqxgFZteMbwJel0/aU7GSXD0aiM1G1gl5HMRnG7TTKIBTGppF2OKwhOmO2hGdNjCsVSVWlnVQhkN8UM+lhF+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iUv+stlK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iUv+stlK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7735BC4CEE2;
	Fri, 11 Apr 2025 20:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744404935;
	bh=0uf2xpXdJtaI564a4ykCW3oUVBo/655/Dm+Eb8aWhR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iUv+stlKr4JKySBJKOaaWOV54eevoV3BK0DmjoM/JirEVLfWhjUT0zaPR5G2OcYwC
	 hOpGmOW2gBfpy3v19Vms4GWQqzGsEU76SzmuYLQgfU0a1aPjxTaFMq+ox9ywD01OMt
	 gZl08tAwIasKGsFTvRhrDLgTSd58IdBRfe8Lp+F4yhWL4Qj4Pr4Hs+YprvhejRGUMD
	 ZDM3AOv8xhXDyBkPTm7HEztZWDcqo/Y3fhBsYmfU8PKwi9bWBjT1j+YPMMzyD2F8fv
	 TUOTpi0Og5QZQ3ARsGbMTghfS5mkiG2B5Sgh+bUHTwkmd2ebIpxOj0WReIjExGwzG/
	 d0PaycTcwOVcw==
Date: Fri, 11 Apr 2025 15:55:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] dt-bindings: soc: amlogic: C3 supports clk-measure
Message-ID: <174440493359.3986896.9405749578527326467.robh@kernel.org>
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
 <20250411-clk-measure-v1-2-cb46a78d019a@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-clk-measure-v1-2-cb46a78d019a@amlogic.com>


On Fri, 11 Apr 2025 20:42:44 +0800, Chuan Liu wrote:
> C3 adds support for clk-measure.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

