Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1162250C18
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744898384; cv=none; b=qCzmtEUBPs8GEwqmBHHrLVvHxq4IQe4iNu/LMffsDTKSt+2UJXcW5xNwD/qgIQP8hUNKt+D2uQIjtJtiTx3ghnms4H6uy7fpVXgprl8XM8dIptDaLyN77BHwue/0omo8r4kAws75IhP2abu23lGxzXHF7IvXRK4DqWNKCz6dCE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744898384; c=relaxed/simple;
	bh=fgH1CKVOmfG+294L+pYJ2aiyXRxKPVBkR881lSexhU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSRD+z4u/9+cbhnR8bwVkcfyGqFdnyhRnMsKxiRv7nQZDufHiOYFc1H7QtbFUDInbFGIBh51BfRDLXPL1dTGpz5iDPC/J/TnPMLs4cIyw7yai//ZzIvMwOwwyT9kcjNJUVR1+hno6ZKxy7ncJuLHYUO8xW8Ywq+hMECSpVloguM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=yoB5yeLF; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="yoB5yeLF"
Date: Thu, 17 Apr 2025 09:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744898369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c6lFI/iw8VttnaUykqGDhlFSTUICpXN2N2OorKYkdrY=;
	b=yoB5yeLFZ8Yl4YM6gcZS0vPgo2wR9A5XvWX9lI0+bHVyqRNaFrJuuINLOt8hgF4TLd7QNw
	I4FPl4ECF7TArfmQlaTmejGOgoWELkGl9/DTPMXtjS+olzmwARHts7o1PWKyf41WEcSP/0
	oZLnfNry5exku3QKivOqnj/ZmNqHbg1gnI0Mbalol0pI89ytRvREC/DGj2XOKdwo1/ttQj
	UwFY0i3kA/YNpPiucEoTiM3GL6rs2kvK3EI4sD2uQLgFhGizVPLoLcQrI8yEPBLwcZoaHb
	JIZ1Kx9azJo9uOHJlOF8fghKxYkwL8xCZyIr3I6h+YnrsjCGD5ELdwGdkGhpxQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
Message-ID: <aAEJPMotHxguJzC_@blossom>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
 <81fb1290-fb39-40b7-9d79-f147fae5b269@kernel.org>
 <aAEG6D2hjtVOlhS4@blossom>
 <20250417135702.GA30334@srini-hackbase>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417135702.GA30334@srini-hackbase>
X-Migadu-Flow: FLOW_OUT

> > > > +config NVMEM_SPMI
> > > > +	tristate "Generic SPMI NVMEM"
> > > > +	default ARCH_APPLE
> > > Why default is set to ARCH_APPLE?
> > > 
> > > This will endup with y in arm64 defconfig, means increasing the size of
> > > kernel.
> > 
> > I mean, eventually I think we /do/ want M1 properly supported in the
> > arm64 defconfig, no? I'm not sure what the criteria is for any other
> > driver to be defconfig or not, though.
> cat arch/arm64/configs/defconfig  | grep APPLE
> CONFIG_ARCH_APPLE=y
> 
> Criteria for other drivers default should be not selected, 
> and should be module if they are part of defconfig, rather than
> inbuilt. Not sure how most of the ARCH_APPLE drivers ended up using
> default ARCH_APPLE.

Oh, I see what you mean, module vs in-built. Understood now, thanks for
explaining :)
