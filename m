Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AAE18D620;
	Wed, 14 May 2025 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747254768; cv=none; b=eqpO79w7JWXxLzn2AgU/cXuWZes0FFw1Y7e7+M0g1dF9x30smrXI6gYccr8TaACFM/oxvlqXSlg1X76Cdy3orFOY1fdbQAT3o9MGShH+rC0z+w2j+IRN12w2oA4RxBLH3XTx40uIlICopxmq+1TBvAH5hJYXkRnBG7NgowXN51c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747254768; c=relaxed/simple;
	bh=kLT7AGaYUt0x4NzoA2YDU9G75SMw3aG+JzfYzl7I3Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klpP+xSohjOy887QDxC+IXyB/LKOCfkienb10TbJ15bCNiWTxH0jwJ0U++dft6TxytM2cW2PHSOklaAn1XENdJcxCXu1YTaeA6UAQXA2MJBF2a/FeVHRhuUu4+PMXJLBWV3tS38CAxwSG2C+JL+aS5KENzmo7H+LD94DOEUoZs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICG+eVII; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICG+eVII"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A41C4CEF0;
	Wed, 14 May 2025 20:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747254768;
	bh=kLT7AGaYUt0x4NzoA2YDU9G75SMw3aG+JzfYzl7I3Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ICG+eVIIpxahdMCHBUGlL9M1KEwP5DFHg9pi7dUBMp4+rwzaWaJba4pXL9DkEyN8Z
	 ZTAkn+NGT3KYeJ1DgU3+z71ZUbSBV6fAkuIcAvQ8F7OUbbUeZ6f/S4oVl7L4ZM0FVq
	 Ig5VueF2TkPXd8jcIRySrHhRwF+kNg6nbqhor7FHnLZg11+3nGr1c0ViVbqtwn8GYF
	 GY08FAhLWl4iC6ddTVCTUb75VoXSVU7kaZONDMpCV5ICN1ivdoCCkTsr8bM7hWv1oq
	 BqRPj7dvoi1PqgRSyqurSy1201ox26alOgKD1B4TpmvJVpUBeYPWPce5qAJTVGx+HY
	 yhj85+yTp0UIg==
Date: Wed, 14 May 2025 15:32:46 -0500
From: Rob Herring <robh@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, R <rqou@berkeley.edu>
Subject: Re: [PATCH 0/7] Support exposing bits of any byte as NVMEM cells
Message-ID: <20250514203246.GA2958656-robh@kernel.org>
References: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510-nvmem-dt-v1-0-eccfa6e33f6a@svenpeter.dev>

On Sat, May 10, 2025 at 07:44:40AM +0000, Sven Peter wrote:
> Hi,
> 
> I'm preparing USB3 support for Apple Silicon Macs for upstreaming right
> now and this series is the first dependency. The Type-C PHY requires
> configuration values encoded in fuses for which we already have a
> driver.
> Unfortunately, the fuses on these machines are only accessibly as 32bit
> words but the Type-C PHY configuration values are individual bits which
> are sometimes spread across multiple fuses.
> Right now this is not supported by the nvmem core which only allows a
> subset of bits within the first byte to be exposed as a nvmem cell. This
> small series adds support for exposing arbitrary bits as nvmem cells.
> 
> The second part of the series then adds the nvmem cells required for the
> Type-C PHY to our device trees. While it's technically independent I've
> included those changes in this series for context.

The idea in the DT is normal addressing is byte-wise, so the only thing 
needed to specify bit level addressing is a 1-7 bit offset.

If you have access size restrictions, then that should be handled by 
your driver. The nvmem layout shouldn't change because of that. You 
could perhaps define the access size with 'reg-io-width' property, but 
really compatible should imply it.

Rob
