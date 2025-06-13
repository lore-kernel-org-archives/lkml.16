Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F73B7082A;
	Fri, 13 Jun 2025 05:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793061; cv=none; b=Ft8+OWmkkdXUYwzdKP0AVzR9JYDS7jLQZXHeM6lNpRzRpNXQzSFU+p/CGC18MPRT5zsAQWNkveBThLThUnapUZU03ButNoFT/65pmB2d01gyJxGGDSV7q/0xFXwzS6/zljAN8snmhsd28jubKn565Hdbt2gZ/T6UwvTGDMjUH/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793061; c=relaxed/simple;
	bh=qTsqu+DOx+21CY/r/BwoRLXgK8ySuyG3xyrbS4vT4dM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fBrjcqEunykuSuzzguwZaPPKBogxHeu0O/WQgl7A0ij3M3mpD4bkJubeXWcQDYB6eD5zZTYmIGtt/322gDSp6dJNcXvZNJ3kLIb2uGeHFXELuoZCYpen6QoNESHaWDr+g4ugGUT1RjvuDAJc9QPAHtOXCuIWTZgrW0oD9ALphUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=mAUilWM2; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="mAUilWM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749793050;
	bh=m3k1yr4GslKpTzf5lqnCGMcEjSghKmBJjnIvXsOuWCc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mAUilWM21VC7VSJqWG0x27cxIkQzvrwFDSVB5KSKvDE9cRXOzAys05cSFQ0cOXawd
	 IgOPWk7nlVlI3B8Ovt9CMgQps65zkZ3WyAnjRUiRhamZjUIZ+sVyNdg9emdwGzYk5a
	 8hvwEeYNdivCAuWWNeYndziLQeHNjfRRE0ZuzRQ/CRdQteb+PK39YJGQR5MHwGhicq
	 B7lBcvGfmNrYMZVMVBQSSfVX1UZhUU/1U0JhBdcnUnvMDYGecwE9OVDQUUbg3HvC17
	 KgE2RlbyhioHPG78vPgk/xjs7BEnFiOocWdLH/hSRF0yx6f3+QAcl2soQ1wVPYHMVX
	 p7JKPApw5UHpQ==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9C11E680F3;
	Fri, 13 Jun 2025 13:37:29 +0800 (AWST)
Message-ID: <6a51eda96a7ffbb228ec08877a4f6649413c9bef.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 1/1] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200 UT3.0b platform BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Donald Shannon <donalds@nvidia.com>, "robh@kernel.org"
 <robh@kernel.org>,  "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "joel@jms.id.au" <joel@jms.id.au>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, Ed Tanous <etanous@nvidia.com>
Date: Fri, 13 Jun 2025 15:07:29 +0930
In-Reply-To: <PH7PR12MB72826C4B588D08923A512E91D774A@PH7PR12MB7282.namprd12.prod.outlook.com>
References: <20250611013025.2898412-1-donalds@nvidia.com>
	 <20250611013025.2898412-2-donalds@nvidia.com>
	 <67c89ca729669f55e2659ad8070a154c59ef83db.camel@codeconstruct.com.au>
	 <PH7PR12MB72826C4B588D08923A512E91D774A@PH7PR12MB7282.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-06-12 at 16:59 +0000, Donald Shannon wrote:
> Hi Andrew and Krzysztof,
>=20
> The difference in this device tree is adding more GPIO expanders and
> changing the networking.

Can you please include a description of these differences in the commit
message?

>=20
> Would it be best practice to create a new device binding (in this
> case nvidia,gb200-ut30b), even if it is just a slight modification on
> gb200nvl-bmc? Or can I reuse the gb200nvl-bmc compatible string and
> avoid the yaml binding change all together since it would share the
> same drivers?

You can include the aspeed-bmc-nvidia-gb200nvl-bmc.dts file and
override the nodes where the differences lie if that helps. There are
existing examples of this strategy, for instance:

   $ git grep '^#include .*\.dts"$' arch/arm/boot/dts/aspeed/
   arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dts:#include "aspeed-ast2=
600-evb.dts"
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dts:#include "aspee=
d-bmc-ibm-blueridge.dts"
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dts:#include "aspee=
d-bmc-ibm-rainier-4u.dts"
   arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts:#include "aspeed-=
bmc-ibm-rainier.dts"

Whether or not the differences warrant a separate compatible - I'm not
sure.

Andrew
