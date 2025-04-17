Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A999F24FBE2;
	Thu, 17 Apr 2025 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744898228; cv=none; b=FMjyvdg8/411i280w5bameTcTAZAlzz08IEheJanGM8IBWnypr7ZwiYKZ0oY54GHMzwdgE6ZpcKVC8yz05YAhnHTEDKikdBv9dKgV1hqbGekS6YoYBUZDqnORpoSLSBx7EUujTaUDc7IXtXrgKvWflxM+weipgwPA67eHTxXPC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744898228; c=relaxed/simple;
	bh=mO8e5Rhkif4H9wdgoBkn/zjw5CfO9Vgmvdy3dOH39So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qB+miaC0fBDxIcj34rX5rNlDqbrw6SEr2aFSxMD3bDcNJdZHd9MKRHTLbyMxaMmG3YlxYjJ20TQgQOuSQa2xoS2jdNm1ZNZg9R0+NMrW+GDhDyayMRNYDjXZ+BAUtxCGpr9C29j7d/xQhBJiacAAQafiyUMmL5hNxKhUERqdWDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmSZCyss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmSZCyss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D18DC4CEEA;
	Thu, 17 Apr 2025 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744898228;
	bh=mO8e5Rhkif4H9wdgoBkn/zjw5CfO9Vgmvdy3dOH39So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmSZCyssOdstwXHGeEVJDT92GEUBsvus4C957V+PkqkZGkPALnth2iV9sPXM1/Yc0
	 aw6PyzVm0QTvU39vAFgdnlhiuHLqubvPrCRhshmsR1DHypzxJda8DNnrriJIAy6vGS
	 SY2GfpXHwvVMLIQZgUX3OjaYWu4Fbk29TNxUpHOhcCzDjHjoHOwsWLol/DORSFqPiu
	 W2U0DqpO6kGCqAUyP3YG1Dn8Ll19772e2DBseaEk+nrSjBYaq5d2FMcfmgt5d55Hn9
	 sPP1ig+HDrLf6R0X6lF5aBJsCOD1KHhrjfwc69SuF/slzKr54cn0T+fWxSsWZbGmF/
	 cjU1bSLD0tymQ==
Date: Thu, 17 Apr 2025 14:57:02 +0100
From: Srinivas Kandagatla <srini@kernel.org>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
Message-ID: <20250417135702.GA30334@srini-hackbase>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
 <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
 <aAEG6D2hjtVOlhS4@blossom>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAEG6D2hjtVOlhS4@blossom>

On Thu, Apr 17, 2025 at 09:49:28AM -0400, Alyssa Rosenzweig wrote:
> > > +config NVMEM_SPMI
> > > +	tristate "Generic SPMI NVMEM"
> > > +	default ARCH_APPLE
> > Why default is set to ARCH_APPLE?
> > 
> > This will endup with y in arm64 defconfig, means increasing the size of
> > kernel.
> 
> I mean, eventually I think we /do/ want M1 properly supported in the
> arm64 defconfig, no? I'm not sure what the criteria is for any other
> driver to be defconfig or not, though.
cat arch/arm64/configs/defconfig  | grep APPLE
CONFIG_ARCH_APPLE=y

Criteria for other drivers default should be not selected, 
and should be module if they are part of defconfig, rather than
inbuilt. Not sure how most of the ARCH_APPLE drivers ended up using
default ARCH_APPLE.

--srini
