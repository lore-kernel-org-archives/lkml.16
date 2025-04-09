Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF001DE3AA;
	Wed,  9 Apr 2025 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189815; cv=none; b=lgOpQHViVqDJvios5E7zhMBXF6PxOJj6/mWFTjAcutwwBH7ZPQ1KrAdWXyojLOCkRjPI7mltqddY1y0/XujWHj/XsfaXUVweZrKGQrLOprY2rd8pD5LHPZR25W9xH5uhAxL1gBC/FcpXS3O9mJsRZiTEsrzAB5BzDYKh5oUgHBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189815; c=relaxed/simple;
	bh=1BErre+1YrsgvpSOm70ydSSZiRCm4uZbh9W8B+UV/tw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ajNRgu45UF6mk0HDvP1F9FS71g93w+duzPiZyGAaLz696RX2eZQq3Go5biYhZp7lNUR7amnJ01o6myoaOdJt5scA6rwQysmCRzmt5JT+Q1HkjGcZ/koFfIwO4uFh5RpmhzO4AeKtG4oX0m5mngtjGkooX6rjNSay72rBuQQTqRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=o/wJaXjG; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="o/wJaXjG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Chcrrmltg8lJD6q+d1jGSA/zsPM8icsB5uVp0MwIi8s=; b=o/wJaXjG5d8IUQuvtcEqHA53sU
	PKJeR02EsUor5c3I/mm3nC2+R0sKaKucxEKUONrzxfwHN31qGEcQEH8rvVI/n09mNsXHhffqSVxdO
	/Kbi8fPV40I9FwNUKtmAh3A0gQKSIYSrVrqQJP/LSvKgsI8Qn5z6MQ1kw5uIzOy0B8QdCCUXEmr0i
	h943DBM+NPNI9V7VUnU9TOg6sGlSYvNUXtraYN0y+DTvwZilhby/mRJy9GDtnIqRkueIETIk8AlYx
	ZYoY/HGkilj/u0WKYFqLYI1cAZOWrZACbPqpkQ+kz+3A0AtCSSUBItJUt9kn/H3vHvwwdYjG5BZdc
	Q/VMkWgg==;
Date: Wed, 9 Apr 2025 11:10:02 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Sukrut Bellary <sbellary@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Tero Kristo
 <kristo@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml
Message-ID: <20250409111002.5b88a127@akair>
In-Reply-To: <20250404014500.2789830-3-sbellary@baylibre.com>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
	<20250404014500.2789830-3-sbellary@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu,  3 Apr 2025 18:44:58 -0700
schrieb Sukrut Bellary <sbellary@baylibre.com>:

> This binding doesn't define a new clock binding type,
> it is used to group the existing clock nodes under the hardware hierarchy.
> 
> As this is not a provider clock, remove #clock-cells and
> clock-output-names properties.
> Though few clockdomain nodes in the dts use these properties,
> we are not fixing dts here.
> Clean up the example to meet the current standards.
> 
> Add the creator of the original binding as a maintainer.
> 
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> ---
>  .../bindings/clock/ti/clockdomain.txt         | 25 ------------
>  .../bindings/clock/ti/ti,clockdomain.yaml     | 38 +++++++++++++++++++

I am wondering whether this should just be part of a converted version
of Documentation/devicetree/bindings/arm/omap/prcm.txt. I doubt there
is any other usage for this compatible.

Regards,
Andreas

