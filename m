Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56969200B8B;
	Wed, 14 May 2025 20:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254847; cv=none; b=GYe1MMqyQj95QaVhiSWWnLi0TdU6o9yxKgvfEwIeoQWxLjk86YDc3LRafA1sPhTgortw2whxGS5n3XXAXT2aj1NXUIfFrRvDnRLyBCqCfkcaNhARfXcLBMbplbDrwsxer7SrBooWtt3HjLlwAII3pvQcCxLKNBHsK5JwCYenpXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254847; c=relaxed/simple;
	bh=AgWdADdayZopmP9VMGnSFuTnzWeLgg/ptjyuunN8QJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvrjyYAnHxVXQ2UBabpSMm0XGMzTE28+QiSPRLmgmTlU/pgzaeggwLXnHcLZ+aJDIoocy0mL6EvL7cYS9unR55SVbxnSxCXH32aQFox/ouY3c+kgfJV+ChjucOX/zaxDND4RD5LFR9Oak9IkpUzjhTpDBVOero32gXZOaJ7suCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0yMcsnx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0yMcsnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DD7C4CEE3;
	Wed, 14 May 2025 20:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747254845;
	bh=AgWdADdayZopmP9VMGnSFuTnzWeLgg/ptjyuunN8QJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0yMcsnxuyC75aDmpTJvEQYQdhY8MPSe1xylgWhKekSh7/xl0bUWZElGh5Het2mLv
	 OyKa4Ocluq+vHXNlWUAKIcjhVCcAWbJHbLugmKXCL3ayNrML20A19a5x6zPUXMlRtw
	 tz76RwpyOpGMj/gRfSLiJuCySDe6/E9tbTeDjcp9eVGhVeFbMtJngt9aesbmb5VHHb
	 gOHIvGvyfOjur401ROw0HWenBWglpbYYfn9f7Hof3Z5BE08LEULecWJ8ciljcOkOYR
	 SxjmNzXMPqWlQmxj3jGaBR3pNc55ck5pRj6OCM6BqzozxkLLAtiIzJcbDxr0zcByVX
	 +0bUOP4MCAflQ==
Date: Wed, 14 May 2025 15:34:03 -0500
From: Rob Herring <robh@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: nvmem: apple: Add T8112 compatible
Message-ID: <20250514203403.GA2989424-robh@kernel.org>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
 <20250510-nvmem-dt-v1-4-eccfa6e33f6a@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510-nvmem-dt-v1-4-eccfa6e33f6a@svenpeter.dev>

On Sat, May 10, 2025 at 07:44:44AM +0000, Sven Peter wrote:
> The eFuse controller found in Apple's M2 is compatible to the one found
> in M1 SoCs
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  Documentation/devicetree/bindings/nvmem/apple,efuses.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
