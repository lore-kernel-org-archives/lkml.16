Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71797405A;
	Tue, 29 Apr 2025 11:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927346; cv=none; b=Ji+Fq0KcngP0zCu0gvy/tFd39mMELegs3mUnbcOG9jb1Q6fjlAqQAz2UqdbDvr4okdJkkTpEWe3WARTV9kDWd6FdEVN1+32lsoIPM9dh0SLDYXFO0dvAMuetdq60Tr3potAWQlhZyu4RHRRFB8ROqWFNEPLne5Tr7HeZhFrPJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927346; c=relaxed/simple;
	bh=LNxe9L/dVH+WsWoZiDeGo991fLnDBQKuOgP13ml2SeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAMt6VjdhNUFdwY8kNKzhcr1F12klT59g39HMHcGJ6xsVuonj+cljOiS1FOX60lJwWsRkCT2rrF1RGxoC58lk686FHDyArc6bDA2ZLYypbQAD9SowNsD/CVNJt7PPC2oJauJWecUgbApVN/rcKaEad60aHeVAZydeMgo13mmGSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=kZN9ESih; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="kZN9ESih"
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 070E81F945;
	Tue, 29 Apr 2025 13:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745927343;
	bh=oDwIkddYcjzqpY0qn+RN60cxRzSZFEEPA0b1jtHao/Y=;
	h=Received:From:To:Subject;
	b=kZN9ESihpGKMvPY4cStlEn6RlCOnHRvDpolr94jqob8QWMXuZSmIGMA/LL2RgepaF
	 enHO+t6u/Ug1npMjfqK4EfrjvnMgezzOJ3Jo8m2UxqJUjiJ9n/1of4majt2inv70wb
	 bCcNx/65qczywfHfoXMUXd/8fWtBDSqnbZYHUlQ3ct85QGyW8JtoamDHRg0ryC8cX8
	 7djC+wHLUcFTMTd5gfWaTt5aKa4j7lF5d5zJBs1GhxFm4frAhxQKakwhnMjLEtPoAe
	 Dl5lhkIU4s/GInKY8O7f2co6OAwK2PAMBnbGeFe8FR06mn3vQKtxo1j9rs/cH5vxLn
	 H3slz76KCoPOw==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 7A8997F9D9; Tue, 29 Apr 2025 13:49:02 +0200 (CEST)
Date: Tue, 29 Apr 2025 13:49:02 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Lucas Stach <l.stach@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC
 DTSI
Message-ID: <aBC8rvt-u8P4Qlzw@gaggiata.pivistrello.it>
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>

Hello,

On Tue, Apr 29, 2025 at 11:39:20AM +0200, Lucas Stach wrote:
> Am Freitag, dem 25.04.2025 um 21:48 +0200 schrieb Krzysztof Kozlowski:
> > Ethernet interface, like other exposed interfaces, aliases depend on
> > actual board configuration, e.g. its labeling, thus aliases should be
> > defined per each board or each SoM.
> > 
> Breaking existing users for the sake of aligning the i.MX platform with more
> idiomatic DT usage does not seem to be a worthwhile trade-off to me.

FWIW, I agree with Lucas.

Francesco

