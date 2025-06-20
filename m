Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2903530E85C;
	Fri, 20 Jun 2025 07:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750404450; cv=none; b=NQ2ksQGIrEAJoj07HEQf647aQxhsDJF3DEmItIsAOFXb4HxXEeo8dH68mugVj/0aw77ZnhjJWxg8+a/RqDbiYnj5DE0gb22nomr9setMUNB7ZWFKq7uMgtQzhdYv7ho0idBDu4rfC+tTWbkSzV0r3OCb2SieLzRljGeTNKJJf8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750404450; c=relaxed/simple;
	bh=MhprGVcZlM0xX2rGXL57sd0X3f5ZLMkM1iqucpKcq7E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LMEvqWeQ/mZwLTdrahMQukooV1pmVbOZRCod0GWf2NOY0QPwdOvenyUpnuc0pOZpWhbt0mJlId73RLgpH7EpQlUx6ftSZVyLAu1yTg8J2A+mexXUo+J0FYE/oNRA90RjSwLL2iVotrh5O6dfbDlBZi9PV86METlofaOl4lAk1iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=l4hcFMv0; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="l4hcFMv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750404446;
	bh=Llxea915k6LzdSVVh5d347vix2QwFPkuKoZ1a41Dx6Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l4hcFMv0ZLtCfDwqChqiSB5rAz3iNblcm5qseWJ5OgeDRuPfYl+Tvd7ZpGBP2ek7w
	 26jD82lDoH9yVBqfqEYJ4ERn+SACy0Q3/mQ7CkeQuDOFRKXuFc+DQvEueeQRrrQNnW
	 wgZGVNgO3UYKXEKYcDneS5bAHxXO9POMZQBGjKUOwlwuvZRGZLqVr+2IdjaHFSn7NN
	 n5q37/NwLBf6oxnkbV26YaDdc+ctbuElQlRB2riLvUjNS+6Q9IpUSEleYdiGwGtieI
	 aWJ4HrDbms0F0A28V0xUHo2zHWznEIJAxkAUBBF9y9Xk2Z/UusHT1DKLIaPQFMHCc4
	 yZfGX/io7IRlA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 08AD3640A0;
	Fri, 20 Jun 2025 15:27:24 +0800 (AWST)
Message-ID: <623c8da5fdf3bb69b6b63733beb4a63b38cf6c7d.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4] ARM: dts: aspeed: yosemite4: add gpio name for uart
 mux sel
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: MarshallZhan-wiwynn <marshall_zhan@wiwynn.com>, patrick@stwcx.xyz
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Fri, 20 Jun 2025 16:57:24 +0930
In-Reply-To: <20250618070823.4136687-1-marshall_zhan@wiwynn.com>
References: <20250618070823.4136687-1-marshall_zhan@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Marshall,

On Wed, 2025-06-18 at 15:08 +0800, MarshallZhan-wiwynn wrote:
> Add gpio line name to support multiplexed console
>=20
> Signed-off-by: Marshall Zhan <marshall_zhan@wiwynn.com>

Thanks for fixing the email situation. However, I notice your git
username is set to `MashallZhan-wiwynn`, which is different how you've
filled out the Signed-off-by tag. I'd prefer you make them consistent.
You can do this with:

   git config --global user.name "Marshall Zhan"
  =20
Some people choose to include their employer like you have. Typically
this is done like:

   git config --global user.name "Marshall Zhan (Wiwynn)"
  =20
The patch is fine otherwise.

Thanks,

Andrew
