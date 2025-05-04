Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E55C1EB18E;
	Sun,  4 May 2025 17:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379120; cv=none; b=d2zxiXxPVIymx7ZeWRAI8mLRx4T5Mte/vn85IcSfw0pSNIgX8qa8vBZfgJHQ8CoHLdvsF/4RXPBmElMEUWHEOuQhsN/mczxGT/CgsG7o48Ke/V13VgRRSKTVaVIrgehzsMm5OTJujLGgIlbF/l6C/AdL4Mms8092lRXsJoRxlQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379120; c=relaxed/simple;
	bh=ow67rl+I81AZmU/AbwWdAgXncW9WG2OxGDTYKSRV0SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gwf0hSA+iZv7tUkfh3YDn8Qi/hZrTziAaU/9ZmOtHa704Qb3Y3QOUpMBHCS++PfuzA3e6TdgQoF0Fzde4SZPaGiwaPS8JgYXhh/yS1OLFo2LGmezzdu64Q9c+gSH4BW5cVhqIoCe/uPN7pIGpzffMYT5YPmKSg4g2XMG/edQ3ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZVJj48J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZVJj48J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCEBC4CEE7;
	Sun,  4 May 2025 17:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746379120;
	bh=ow67rl+I81AZmU/AbwWdAgXncW9WG2OxGDTYKSRV0SM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZVJj48JcWEVDod/zwAnCXaGLX7Fa4O0OJ2NrK46tb/vrDCmldTX3YjiXDN6B2NJH
	 mp9hBM/EeOvUqyFSjjYQ/4s80JnVQ/AUF9+l4ZP/rARTTv57yOoGE56Ea7mhQ6OgSR
	 jSf4hj8R/zNkGpahF2JEFFlE9JoELzfKHg2YA2sReooOntc+AK10LeuYUwzZ4NIrbr
	 iY0GmuDKVhDGhMv+Gmlj6kj5v84RhQuzYzcXEUGtoBl+I1wVC7H6GaDVoyonS9q6Rj
	 dsN2qXN7ztxhhT09dOcegWpAMY61HYTpjD4A5ZhjIgA1uXr+eq7SMJ4wzq21N/fV4C
	 B7ErSixZpcFjQ==
Date: Sun, 4 May 2025 19:18:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: hwinfo: Add VIA/WonderMedia SoC
 identification
Message-ID: <20250504-hallowed-muscular-gopher-f07547@kuoka>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
 <20250503-wmt-soc-driver-v3-1-2daa9056fa10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250503-wmt-soc-driver-v3-1-2daa9056fa10@gmail.com>

On Sat, May 03, 2025 at 03:52:31PM GMT, Alexey Charkov wrote:
> VIA/WonderMedia SoC's have a chip ID register inside their system
> configuration controller space, which can be used to identify
> appropriate hardware quirks at runtime. Add binding for it.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../bindings/hwinfo/via,vt8500-scc-id.yaml         | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

