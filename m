Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com [95.215.58.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69322262168
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739299513; cv=none; b=gZQ+zDoEXWrzWAiMvUHYZaJx6sYekF5lDnLuKS5w+IOzyOCgKP97vfgT4YDO9SczQwhljkBAQ2q4tRFOnN2FixPP0u/6T9fGRwJj1+LCb98IEll+oA1ILrNK53Ec016DpWTy3udOXMGyWNqQeNM8KLdLnDQhUVdbrCSuONSWS9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739299513; c=relaxed/simple;
	bh=oAD576S9n1J0vyvxAsNYW6OhHuVIozQD3eVwmTLQ3Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KlNTMPUIO9iGr1vlAo+LfFOOt3bYxm+T0RRYRrI+IhvrxtSk1gXtKHHZXuQVI5MbHLPFEV1Qxo0QAoyjeVozYTwrIRQV5zc+VNRcEljiZX6CF04AXnsa4zVva7hmEsaMBdBXFBPe03ga9Lk5xFiVcLoUrBlYRuW7EUUzwUUFR4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=jgNtjRIL; arc=none smtp.client-ip=95.215.58.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="jgNtjRIL"
Date: Tue, 11 Feb 2025 13:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1739299499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U4tuzbNamXDhTB3CQeJRBV8whPYczSlBM97G6IiYYkg=;
	b=jgNtjRIL7zbY+GY9njC7eEcP6A0gx18yDzEH72va/9CgiZRmY6E2TLKfZ41WrP5VinrLqj
	EJLdUxUnQcKN2bMzSk4BAaHBLbIf+AJxrUhZAoN5tCAWoUVTDGOOQxEvCD+KeQqsfLIom0
	X6KKHl2Km/bpOqw6pKCrH+JXaRlAPwJw16tnUGLTr+yo+gVAo9SSalkZxdt8IQOMoKJl5c
	VvkwE1USxSHFwndQ46VRk5fwWpZN4Rt0RH/sqkp0Fkm2JoxIaQeU309KlLGv+6z0ksOZfj
	8aCrn2ByVUZgjdCVxCw8c04Sy83DT7wZnV5TDUcFFyv2cyP2IUhqUXUiDdRAZw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/5] iommu/dart: Skip reset for locked DARTs
Message-ID: <Z6uao2OnBcg9zkrc@blossom>
References: <20250210-locked-dart-v1-0-5d97fe247f35@rosenzweig.io>
 <20250210-locked-dart-v1-2-5d97fe247f35@rosenzweig.io>
 <98af5c02-5006-4272-aaf0-a0e30c312059@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98af5c02-5006-4272-aaf0-a0e30c312059@arm.com>
X-Migadu-Flow: FLOW_OUT

> >   	struct apple_dart *dart = platform_get_drvdata(pdev);
> > -	apple_dart_hw_reset(dart);
> > +	if (!dart->locked)
> > +		apple_dart_hw_reset(dart);
> 
> Not much point saving anything on suspend either, in that case.

Quite right. Fixed in v2, thanks!
