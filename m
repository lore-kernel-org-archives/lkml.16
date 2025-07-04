Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A49280CC1;
	Fri,  4 Jul 2025 07:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751614662; cv=none; b=pZaiJHEf5gOtiq5ilgrJq5a+p4VJdETvbQ9M/5MwILaH+Gbb6tzyfs36NklLK+LRhZryJSG7Hv2gEH/56RcYxpfhLhv6T18oOZNZMAJfwC0jAUR8vF7dpqypQ/uTjFhdc9l9g//VlntLGNJBVyNOnbg4Gf2YSXf3Wo8e5AfeybA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751614662; c=relaxed/simple;
	bh=7TS+GPjg3sX6vp225yAQ40TlxQx1FkzB1Rlq6D7dvZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bgVGrjm0ObX1yQ5o04Ek1X/kXQs66Y90iccOY7PjD+yV6ABRGotnzfKlCaNAz4DzmVZjUFjugTI/Mm+BhyhoFMAMcZqu8pkxQUitrF4pmxj8SBAibhY3qLSLuyPPA3+gOwF0cAG0pdvKPs6Xw+1HA/k2M21k+zzDLLgzI6v/WHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=u6rduk2c; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="u6rduk2c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BBUFPfqcb5RmlLprxF2vX8GSwab9JKWQEi3JfpeiZSg=; b=u6rduk2cLDiZJ613kl3yXRcvou
	PluTPpMFX5LPyyLMgyVmlIndU0nfNy2cm9KDz2Wd2FO5PUiCTPKRsZuws0DuvHXgUEHawd15w6KIU
	tc7vp6WuCc8gqz7fU0EnlPHx8g2VKDt7KEhR9C/7DTrG58Rv9q3gXw9gWvolr+g+AdwM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXaz2-000B1n-IZ; Fri, 04 Jul 2025 09:37:20 +0200
Date: Fri, 4 Jul 2025 09:37:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <rentao.bupt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC
Message-ID: <95ff4056-d1cc-4564-8c44-0535196e7428@lunn.ch>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-6-rentao.bupt@gmail.com>
 <a6f6966b-50ee-4b4f-9422-96c6ac9391a2@lunn.ch>
 <aGW8Nm8ZWMwRYVOo@localhost.localdomain>
 <220ac6c2-8373-4742-86fa-f322d6ada624@lunn.ch>
 <aGcBEHMEyQJuzmjj@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGcBEHMEyQJuzmjj@localhost.localdomain>

> Hi Andrew,
> 
> Got it, and thanks for sharing the context.
> 
> I will reach out to ASPEED offline to see if they are actively working
> on the MAC fix, or if I have enough knowledge to work out the patch.

There was some discussion about what needs to be done a couple of
months ago. Look for emails from aspeed and IBM.

	Andrew
