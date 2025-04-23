Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC526657B;
	Wed, 23 Apr 2025 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745438313; cv=none; b=YHFnoY39yXe4LIfPzV0hkWkeQ1t3in6ME2blxdUx38Wk0FoPVBKGSMEN+Jyog2BnFpJ/lbXDdh1StTry3CwlJebGGb1XmvvnsaZQ9oS2ZspFhr+2CrUzsphZJVYrXSyVu7/KdL8oJencj1pwZo6YmLKn1X1bxxcwCBHmwaqc9aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745438313; c=relaxed/simple;
	bh=ZE+EzztTUSSYHUKRMcrzjo1dZmr1lvdw/aF918XXCQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVH8mNMgfPKaeR+AWIge075KiqO4wmnmKClByIPEGXOMu2WayTrfR3TMZ9LgMKK4BzKi0WBLcbt5lBclWrSOcerBPqPhHCsB12lF6EGIajPAVsNJjn0vY3DMSmRU22IkQ5VsLYUmbM3D+MYL4M05c8kVs6WNmHef0EvYXX+j6i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ucgK0ncl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ucgK0ncl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56DEC4CEE2;
	Wed, 23 Apr 2025 19:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745438312;
	bh=ZE+EzztTUSSYHUKRMcrzjo1dZmr1lvdw/aF918XXCQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ucgK0nclBGDo0bkNslgVdTLV+rdbYtrOkNJyLY2Y1i/SMm+9piNoBL3GMZmxTZCQJ
	 JJI7CuCCtFzHrVCNZwDFJTt+h1kJiNm+33jT3EpZROcEugibNsqJZGzv+gPCvZYBCn
	 bMfZOVDSaT73H2Bgaw+jGNutE7sUBDZxp4O1y6BB+alrI/PXkMeo9a5s2wJcRK0yuA
	 hlWGbu4dA+UfDN4VGogLaJjcUsyDKPIW0qS+kvvknTnT6lYSPJlfW/eUn/FsQl1NFO
	 X8+27KJsEUhNwo5fq7SbI1G1AKiVF3XDhOU4p4iEmQYSkl2bcpn4+EfGn2oJo3m/3a
	 mY6YJy96der0w==
Date: Wed, 23 Apr 2025 14:58:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	asahi@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v3 1/3] dt-bindings: spmi: Add Apple SPMI NVMEM
Message-ID: <174543830880.954251.4323421300724973645.robh@kernel.org>
References: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
 <20250423-spmi-nvmem-v3-1-2985aa722ddc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-spmi-nvmem-v3-1-2985aa722ddc@gmail.com>


On Wed, 23 Apr 2025 19:55:13 +0200, Sasha Finkelstein wrote:
> Add bindings for exposing SPMI registers of Apple PMICs as NVMEM cells
> 
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../bindings/nvmem/apple,spmi-nvmem.yaml           | 54 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 55 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

