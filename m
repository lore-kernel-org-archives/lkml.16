Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EFC136349;
	Mon, 16 Jun 2025 23:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750117965; cv=none; b=cwdtMbzRja1SThuTe09NQz0zPbwa8gs0UbZmv1qFyDks+o11p/LrcfH4JKZnYmgxeiqihuvXiAaQN+pUzuj/wpDeCcyRRgnEDuE29hf3yrTf9lTC27d9+RPXFiD00BP/v4Ma55y+7p3zVpS/716/hjF2QTw+F63OvhrTIstc8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750117965; c=relaxed/simple;
	bh=DzxOX8lm03zmzqxfjbEe/q4YApuNDEm9OMQG/6CWcXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cbk66cfXD/eD1s7WAfd7A+saUTUvZ2jd86IOwJiNgyfIYNgjrZJoPHOauCS9J6o8Po5q90CbfJDLp4yeUBA+rubqjwgTmnbXSi4FxErNgzmCev+qhtcQ0q8B4fxrZqo/8kKTHzqK0yb3U2CL01dwPmhwfQPK5BryGSd4VEezI1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=oAeIQ271; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="oAeIQ271"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Nx2VXidiB5UsT2nnGwnvJjTlLUfXLsHpiKrWVggKhyM=; b=oAeIQ271lYVhYBQevrGYAx60dK
	aMJQ5JVPKwVEyOWyncFuLKaa0JHTZ98Ge2aK4dPo4TZ3Cw0nB45mojyvV9K6xU1QOrbLhJMv4xLlL
	KCysaQDLjz40DQBjvJyoYTenAAyXY0f7V+8AB0UOx0QMRU3o5KwYhpNVtMfYF/MdvnJ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRJcq-00G6c1-5V; Tue, 17 Jun 2025 01:52:28 +0200
Date: Tue, 17 Jun 2025 01:52:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Nvidia's GB200
 UT3.0b platform BMC
Message-ID: <34be8ac4-8414-423e-a6e3-a566ad1e9f11@lunn.ch>
References: <20250603203241.727401-1-donalds@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603203241.727401-1-donalds@nvidia.com>

> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-rxid";
> +	max-speed = <1000>;

Yet more broken aspeed DT. Don't you monitor other patches sent to for
aspeed BMCs, see what has been rejects as wrong and avoid the same
mistake yourself?

Please search the list for why these last two lines are wrong.

	Andrew
