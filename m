Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79053074AF;
	Wed, 25 Jun 2025 19:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750881235; cv=none; b=YWEaiIiGqCCK4mX1Z6CE5w7kUDb6f3xPF4cj6cAffpdBD/xEhG+Y/IQZ/rKAi5JARbAOQjS0qIIbD3dUzBucJojJ2xq/XNTjEvfwjwuTdFJVN28Dyut3Wd6GJQhVyIlnv22ZzwT4S+W4uV04AUsPs+fjQ032CAHO82SsDLNidQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750881235; c=relaxed/simple;
	bh=oJtgrg2aA4uaKMpl0XbF1os0gOTS7tT5N0iR2jpFqpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toe02KH79gzvatF6B7zGDYwbXI4H3ZJRItzoj2W3hvY4Vg8uZuiNArPwgFLGHFMpFEInKcYw8tf45828P7oTf7dgqNjC4LDDYW5E66vt5/wyFbQKxF2bXUVTBrqY73CyiBOhFnAExuwQr+PXWEOl1wEZPdEwIE8gpT+zGvyiKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=my12Yse9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="my12Yse9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC77C4CEEA;
	Wed, 25 Jun 2025 19:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750881234;
	bh=oJtgrg2aA4uaKMpl0XbF1os0gOTS7tT5N0iR2jpFqpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=my12Yse9ZQ25NYuivmGajU2Pw04oJr1rqieUW14Uj4uFYeERWhkJFrJiSmRjfNcqb
	 Mkbs9ACh34pjCAUjM4zCmQHTQKIdOrmVWTTyuJYiJ9XDusGQqueyai1nioJRqFWa1U
	 Sk84oYwOzyROLg3LdvwnA5lUWm2W/5sc5YPVT1BvvNjkiYhHMNfDbz6jkWlaH4bXDg
	 fl4tDyPCJholtV7u2vo+Maf9sa3nnQyPa/+wVhiD89t9m0pDQclO8ThbhK74OXdXq0
	 EReaLAixXVs6l7q/1bvrOmkrGx+6oqmp12A3LWOcIB9vrLLpNaDVgvdkAShAxbHNHC
	 MWOrvJUyoauRQ==
Date: Wed, 25 Jun 2025 14:53:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: fixed-layout: Allow optional bit
 positions
Message-ID: <175088123275.2111151.12116802075746070552.robh@kernel.org>
References: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
 <20250610-nvmem-bit-pattern-v1-1-55ed5c1b369c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-nvmem-bit-pattern-v1-1-55ed5c1b369c@kernel.org>


On Tue, 10 Jun 2025 17:17:34 +0000, Sven Peter wrote:
> NVMEM nodes can optionally include the bits property to specify the bit
> position of the cell within a byte.
> Extend patternProperties to allow adding the bit offset to the node
> address to be able to distinguish nodes with the same address but
> different bit positions, e.g.
> 
>    trim@54,4 {
>         reg = <0x54 1>;
>         bits = <4 2>;
>     };
>     trim@54,0 {
>         reg = <0x54 1>;
>         bits = <0 4>;
>     };
> 
> Before the conversion to NVMEM layouts in commit bd912c991d2e
> ("dt-bindings: nvmem: layouts: add fixed-layout") this extension was
> originally added with commit 4b2545dd19ed ("dt-bindings: nvmem: Extend
> patternProperties to optionally indicate bit position") to the now
> deprecated layout.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

