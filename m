Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B701C4A17;
	Fri, 13 Jun 2025 00:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749776231; cv=none; b=k1/5Z15I5YjoMoGtMj45xO1/9Qh3HhutMcVOdztWZTj1jVMhlakvntZVwAIhrsC/O+TwLvMQPX1T0M0DdNjHD4v90ntN7+cRHc8Cz1ysLCgM+AZqrXtWLjuz29eKs63FHem+mVQhsZvmK37HC9QYESOYC+p5fSrxG062jdp0TMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749776231; c=relaxed/simple;
	bh=rva0RzQIkUYUcYPpIJdvS6jyS8ngpfdISZUwpw5dy60=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YF9UvrAp4tP6qYsX1R72fTsxaiYQxg3F2EeV2awBe3bmrJSVgyzDPYlePjE8JfXSRPP+5yemyfAbYqiksjd1gPDRC9pyvWC+wHsHQbfKn4jnjDKuGxUAnnIOqGmCfablFFKaq/edq8J4jlqqq9iWjH2cjQ2oVWLeQUW09l1W1o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=GCUIthgL; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="GCUIthgL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749776227;
	bh=rva0RzQIkUYUcYPpIJdvS6jyS8ngpfdISZUwpw5dy60=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=GCUIthgLYeq7D5761tx1yj+y8VqQXqv6qRWZ0/43kAIIjK7O84Ey9LDhbekpp4ryg
	 mq/1+2pumYSwArM5LUUK/8XkBEE3/1JDey9ckJup2qjEs/PAhHXvNgdPAMSnhZQkhi
	 go0PlroEhiksYOsUZS9wcnS1BHW93tfTIUAGnFdzZC8mtN9NVLCVq2VF9SUOdKacl/
	 LDPk1Zbmzsx2D1CqAurEfi6VtBpyh+2DPJ4EDgyRc38kDjdqcTGbgk21Zarttvr3td
	 j7WWOvId8CmjOJDonUn3+LMXWlK4xCUHtTfSXxkhI8lOXO3vFz1F1SVR4QOsbaar4s
	 WAbbR4ijK4j1A==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D9D746445B;
	Fri, 13 Jun 2025 08:57:06 +0800 (AWST)
Message-ID: <831a5bf06f6e7cd7dccce77d11209b5cc0f1387c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/2] mailbox: aspeed: add mailbox driver for AST27XX
 series SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>,  "joel@jms.id.au" <joel@jms.id.au>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Fri, 13 Jun 2025 10:27:06 +0930
In-Reply-To: <TYZPR06MB6568BA93BCEEBEE3B9DE15EBF177A@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250610091026.49724-1-jammy_huang@aspeedtech.com>
	 <20250610091026.49724-3-jammy_huang@aspeedtech.com>
	 <13b88c1e404a9abe5cfae6673cb93e0b020e3524.camel@codeconstruct.com.au>
	 <TYZPR06MB6568BA93BCEEBEE3B9DE15EBF177A@TYZPR06MB6568.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-06-13 at 00:51 +0000, Jammy Huang wrote:
> Hello Andrew,
>=20
> You can find it in chapter of ast2700 datasheet below.
> =C2=A0 III Function Registers -> 12 Inter Processors Communication (IPC)

Great, thanks. The description in the memory space allocation table
doesn't match the chapter heading, which is what tripped me up
("InterProcessor Controller" vs "Inter Processors Communication").

Andrew
