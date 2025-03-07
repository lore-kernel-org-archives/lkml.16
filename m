Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0442D23FC68
	for <linux-kernel@vger.kernel.org>; Fri,  7 Mar 2025 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741384780; cv=none; b=qbxTcjHaJqoEQcPp6OjLbAyZ9YgJK3ib9bs8hGC50dM0CXrX9V46uFS/ojMN+54eaSJxheQA+zKz791CKtQUBcFFppoXa9m70UN6VZAy+Hu/6ypNlrgLPlAWhqGHk/k/sbCaSye0CwO3cl5cIiRNGg3j9DQxoomDD384awMdC04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741384780; c=relaxed/simple;
	bh=6EchceztAW6CFtsUTWw4IQZ8aH/PJSZtQ7XND/0uu0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlZ/F2o+7C/a9b/aEoh9Oj1lQXHmjf5YXpLdfr5W3uNdfZeisIwSpZrbUQ2e7tKhwiYIpeVVexWagWVBe71nt9qd/6YBG+4c0ApK0D0DeNbuqz7hGol1oAxKXQHDhZeF6F7SJeOX0oPKjcWuwQWBLuOYG7lqW4YmhJoGbe5QGxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=KPih+DMa; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="KPih+DMa"
Date: Fri, 7 Mar 2025 16:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741384765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I5YH1gMXjYvHWKof3eUCQYsGSuXQkfMfI4FEeXllrZs=;
	b=KPih+DMa0rkvqdL/53iYFfAXRlPP3ItVPk238X6R113xcXTBtFvuhJeXL0caJYp6j3y722
	EV6aorD+Zdis5a3Xg+2Pco6SBX/ZP4j7PGLeuxdvBQWyUZpOon5yJlP4wZfQ9vx1JlbMGD
	Rey469cEKsDoPQ/KdeicoSDMkA/RvI/TqL9X9D1B1v1sW24l+hXsSszK/JoZRMnV1CMkD2
	mOXsUA4DEeG/CLBUAuEnB317THdXtQGEsgXiYZo7pYXeNM2kO10+3nnD45PuhzOCJZDVV7
	s3h0HQHBpYpsKM2z6fnoj6lAW+aqiNwWWWzRy7YxJnDM3/UzmRE6CLtTlgTeFQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jean-Francois Bortolotti <jeff@borto.fr>
Subject: Re: [PATCH v2 2/3] spmi: add a spmi driver for Apple SoC
Message-ID: <Z8tsOKbxVOXmOicF@blossom>
References: <20250307-spmi-v2-0-eccdb06afb99@gmail.com>
 <20250307-spmi-v2-2-eccdb06afb99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-spmi-v2-2-eccdb06afb99@gmail.com>
X-Migadu-Flow: FLOW_OUT

> +static inline u32 read_reg(struct apple_spmi *spmi, int offset)
> +{
> +	return readl(spmi->regs + offset);
> +}
> +
> +static inline void write_reg(u32 value, struct apple_spmi *spmi, int offset)
> +{
> +	writel(value, spmi->regs + offset);
> +}

At this point I don't think these are gaining us anything. Can we inline
them?
