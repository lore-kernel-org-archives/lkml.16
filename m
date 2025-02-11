Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA073250C01
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299214; cv=none; b=lOZFTUGcFBGMf7E+hMD+lISZ3QtpIaFdO5SSctVrr2C79pzcW9ecmdGcMT25n24qBFzbtVwqLkFapNXR9hGXNIUJyH01pLMVbS8vdMKJurDanEoYW2BZXMJbGldUoJSptuj4a/tI5YgmVXevzfTiZk5S8LdA3rL9KX4fNQpTCgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299214; c=relaxed/simple;
	bh=douAAtq1juT4etZFymJAHKVVxPzVgwUUhJUWCYFwR9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hv/umvlfBaPOyYMcX89MOlwz0v5vgXjYGInf2Y5Tki4ZBksTgwaCneFVVmfL9JGi6Ha7qjOn8qU4RuhdTvV1R+wO8H2j9uMiQt39T+mvdnSSmjB7Ou6TdLQVQ5+ZF9hB9cBGOi2+KF772/O6jJVlpEEMeQ5ciwD1dxo5TW1g8BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=DEP9DTdO; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="DEP9DTdO"
Date: Tue, 11 Feb 2025 13:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739299210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TAqhdEJIac1nBI7ghVhE2bBif5ol3c9AIgGMBRie10Y=;
	b=DEP9DTdOL7rgm9GNUJd6f3Y15SCXoMpg/zGbtOV3YCnDxmMHyOfbamgMAEtFnkbQ9XNUm+
	MNw1pcp/LWTC1B+uJMKjcG5+3N9OeKlZWSoTbJmYBVdgrHLjOgskY7ZE3decNuTCUvHyRp
	3CeV3xiGX1VHrxkMU/bGgEmKJUVhQmG1xMP65Tp37UsFCMdNMSIQmOjPsLLuyhFseo7qsj
	PgOPDlaCfAqLkkGGguWC+wdPYj41eZWPEOnASbTHsZ4/5C7ZwpoFKKL67dASGx1ETp00q4
	wdXWp+4qmJqoLYHAKoplMwVk+bsNqAe35ttAdXPXTwiVpv4hlnJQmT/ndXtstg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] iommu/dart: Set DMA domain for locked DARTs
Message-ID: <Z6uZhQtPAE8Ck_b0@blossom>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-3-5d97fe247f35@rosenzweig.io>
 <1d6b3fe7-9376-422b-a2e6-ebaed7b6cd75@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d6b3fe7-9376-422b-a2e6-ebaed7b6cd75@arm.com>
X-Migadu-Flow: FLOW_OUT

Hi Robin,

> > This is required.
> 
> Now that we can, I'd really rather do this properly and not offer an
> identity domain in the first place when it's not available.

I'm reading through iommu.c but I don't see a way to avoid offering an
identity domain without the DMA override here, just reading through the
logic of iommu_get_default_domain_type. Could you point me to what you
have in mind?

Thanks,
Alyssa

> > --- a/drivers/iommu/apple-dart.c
> > +++ b/drivers/iommu/apple-dart.c
> > @@ -941,6 +941,8 @@ static int apple_dart_def_domain_type(struct device *dev)
> >   		return IOMMU_DOMAIN_IDENTITY;
> >   	if (!cfg->stream_maps[0].dart->supports_bypass)
> >   		return IOMMU_DOMAIN_DMA;
> > +	if (cfg->stream_maps[0].dart->locked)
> > +		return IOMMU_DOMAIN_DMA;
> >   	return 0;
> >   }
> > 
> 
