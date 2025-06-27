Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC3335957;
	Fri, 27 Jun 2025 18:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751048735; cv=none; b=uWsDUfxERaHe4A1gpV6Pj93tUOZLd7WjjpR5wr+eTYAO6s48DV+A27tdIqlWUOy8t5hlSQbEpmzpwAW7cC3z6i/oVO4rY5UEraDOrEYKR5rUEjFKBSL7sTYzriIUK72/YrtDmhSXEm6uS6MzqCsjMV7fxmffKHYlxcRtlRlSnBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751048735; c=relaxed/simple;
	bh=PjJQt6R+2Pb0XGHkIwzKosDZ/u+lUxtx+ilk3A++byg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lcSuCBbFQLtdggWV/hm7Ph/NVXUr+xPcRxcApD5Y1QQm7pFB/Cpp1UU3euo0pMI3/ihw+hCV4Ok2P9BRfVQtICvCer8ff5rzHgz6EH6vkvAGAUIm4l3/julQ3t3dm5XLhNiYyHy5iHcTgFuEEjXrRdEEfLSsuRJI3PzhphDsl3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=HcpRcSSz; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="HcpRcSSz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=AcyZ33LazzChsEAUzIIB359Y93Og/rELjwXfNDaBkEM=; b=HcpRcSSz1aCLDictpkpp3PuP8n
	016GmdmvMyFTr8Fp3goWlzDWt6g+Qg1UQnq19KLPDu5XfrsfGy54AeysX+I7b5EKWhJNwc3G3aIJH
	6MxIeD5TZRDXYXkEWWwhUorD+HAPmBCXbYiEQpcYsK/60fbQ0QiNT3BCc6XsT51j7ylorjGHgyvk4
	LAjIG7D8xgOgYJRBYlD+t4WGvJJeL6GUaYKKgk3KDs7mBXsxLku1ItYfQivQjw4M44RFKl8xpAIZY
	xWjreGFjjXbkK3L6Nl9gPdT6tXt2AXij+qt7dHgCcjrz+03Ba6odHEvAXf8WmjOJYwo7Z+2oqYMv+
	LNt1qWzQ==;
Received: from i53875b81.versanet.de ([83.135.91.129] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uVDl7-0006Qj-Ee; Fri, 27 Jun 2025 20:25:09 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399 boards
Date: Fri, 27 Jun 2025 20:25:07 +0200
Message-ID: <5121698.88bMQJbFj6@diego>
In-Reply-To: <DAXGZG0DEKS2.7RLXKSDO0C9T@cknow.org>
References:
 <20250627152645.740981-1-didi.debian@cknow.org>
 <b1c789bf-1369-42ec-8bb3-d7a45c92abf0@cherry.de>
 <DAXGZG0DEKS2.7RLXKSDO0C9T@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 27. Juni 2025, 18:52:08 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Diederik de Haas:
> Hi Quentin,
>=20
> Thanks for taking a look.
>=20
> On Fri Jun 27, 2025 at 6:10 PM CEST, Quentin Schulz wrote:
> > On 6/27/25 5:16 PM, Diederik de Haas wrote:
> >> The #address-cells and #size-cells properties are not useful on the DSI
> >> controller nodes; they are only useful/required on ports and panel(s).
> >> So remove them from the controller node and add them where actually
> >> needed on the various rk3399 based boards.
> >>=20
> >> Next to that, there were several (exact) redefinitions of nodes which
> >> are already present in rk3399-base.dtsi to add a mipi_out endpoint.
> >> Simplify that by referencing the mipi_out phandle and add the endpoint
> >> to that, which allows the removeal of the ports redefinition.
> >>=20
> >> And fix 1 instance where the mipi_out referenced node was not sorted
> >> correctly.
> >>=20
> >> This fixes the following DTB validation warnings:
> >>=20
> >>    unnecessary #address-cells/#size-cells without "ranges",
> >>    "dma-ranges" or child "reg" property
> >>=20
> >
> > Too many unrelated changes in this commit, please split into multiple=20
> > commits.
> >
> > I could identify:
> >
> > - moving address-cells/size-cells from SoC.dtsi to board dts(i)s,
> > - reordering properties to better match DT coding style=20
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-s=
tyle.html#order-of-properties-in-device-node
> > - use phandle to directly access ports,
> > - reorder DT node to better match DT coding style=20
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-s=
tyle.html#order-of-nodes
>=20
> I initially had it as several commits, but that resulted in (f.e.) 1
> issue being fixed, but 1 (or more) others would pop up.
> Those were then fixed in follow-up commits, but I assumed I'd get Rob's
> bot screaming at me for introducing new warnings (first).
>=20
> And as they all relate(d) to fixing the dsi node, I then choose to
> combine them (but still separated by SoC).
> IMO there are several ways to organize the commits and each would have
> their pros and cons, so I 'settled' for this arrangement.
>=20
> So I prefer to wait for other people's opinion first before reorganizing
> the commits again (if there's a different consensus).

personally, I can live with the current setup here, because as you said
it's all DSI related, and also not a functional change ;-) .

I guess you _could_ move the clock-master + status moves into a separate
patch, as that should not trigger any warnings.


> > The change for RK3399 Puma Haikou Video Demo DTSO is fine for me.
>=20
> Thanks :)
>=20
> Cheers,
>   Diederik
>=20




