Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BF921D3F9;
	Fri,  9 May 2025 07:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776262; cv=none; b=YjKDuGo/yziOj7/KKRqNtuQgmJqA7YMhqfSGEHKpBGuW7FpkwXPGDgWYEEmENAfJGKXpYfJUHsrVHXI7uaZcfqHDjsMlveZO32jjiOHHl2Ia7iAjW0B4IHU3rw0soUl4sbIJEfZLD3tYcaXbkuV4GCxbuQ2sgPjMC5Jho+34/M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776262; c=relaxed/simple;
	bh=vyaf3O81ftGk4hXMqvkE+LhSreJTUx7RqGyR3ijoJoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsMq207BYhYuMdti2WRzqfhh9Vav/JcAdCRDK8eNFqzwNCQ9yBOQ+6B0PVXCEz5eV0S05Bup1mUgGHX5sNo3hH2ysZmwlf9yJ6vNh3ryKFGY/zpcz0as6IgAOj3BYWoySiWCC03KYtWMSgatkxJtJD/tTfvZhwrZi5mYS1iGedM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=kQOx/pRA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="kQOx/pRA"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id ED3AB260E2;
	Fri,  9 May 2025 09:37:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSzk7zSKnJSd; Fri,  9 May 2025 09:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746776256; bh=vyaf3O81ftGk4hXMqvkE+LhSreJTUx7RqGyR3ijoJoY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kQOx/pRAmqD1GFKciaR0iDR/hrxI9cX+Un8/Ux+TQfOaLdCnoQ4NTugMZ8wFLAL2l
	 ShN/qUsbnKUQvRQZXsvUHPrkIgt5dTh9rGKfGouNXoNe+CxvcJC/hy/8uzhpEkK95F
	 BpU51SO5Umd/7H7cjJ0tt9JMJno50tG1+TPWXJOKcegcbK1RrvDJHsvgpFEYrhbVEP
	 tMofglj2iBNwQBd+zDkZY97aBrOmue5x3DibPxd/2qJG2HSyVoRQkOp04VF28CjTOr
	 I8bqFUpPnVjulaG++Bm/wHZPRmyLZjqawThzkZhLYRsaeaj/AzFkhZom9MKRch7pxo
	 Wvam/vb1E8pLg==
Date: Fri, 9 May 2025 07:37:17 +0000
From: Yao Zi <ziyao@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: phy: rockchip: naneng-combphy: Add
 RK3528 variant
Message-ID: <aB2wjKa1D832FKBH@pie.lan>
References: <20250509004121.36058-2-ziyao@disroot.org>
 <20250509004121.36058-4-ziyao@disroot.org>
 <20250509-secret-smart-kangaroo-fd3b58@kuoka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-secret-smart-kangaroo-fd3b58@kuoka>

On Fri, May 09, 2025 at 08:03:11AM +0200, Krzysztof Kozlowski wrote:
> On Fri, May 09, 2025 at 12:41:19AM GMT, Yao Zi wrote:
> > Rockchip RK3528 ships one naneng-combphy which operates in either PCIe
> > or USB 3 mode. Document its compatible string.
> > 
> > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > ---
> 
> Eh, no...
> 
> >  .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> > index 888e6b2aac5a..bd064754e537 100644
> > --- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
> > @@ -12,6 +12,7 @@ maintainers:
> >  properties:
> >    compatible:
> >      enum:
> > +      - rockchip,rk3528-naneng-combphy
> >        - rockchip,rk3562-naneng-combphy
> >        - rockchip,rk3568-naneng-combphy
> >        - rockchip,rk3576-naneng-combphy
> > @@ -102,7 +103,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: rockchip,rk3588-naneng-combphy
> > +            enum:
> > +             - rockchip,rk3528-naneng-combphy
> 
> Still not tested. Neither v1 nor v2 was ever tested.

Oops, somehow I missed warnings about the indentation...

Thanks for pointing out, I'll drop the tags, wait until the prerequsite
series get merged and send v3 with this problem fixed.

> Best regards,
> Krzysztof
> 

Thanks,
Yao Zi
