Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904031BB6BA;
	Thu, 10 Apr 2025 04:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258351; cv=none; b=VZ0vToLZJy1GBOhEwolSwhuT9lD88y3JfVu7fhtanF9AxybJhIqVf5rPbTPaU+eAjITTXaJINnU1DRqL2rr4ihUL8bkkcl1NH/gsUZhmWX1ZyBUNoVTBdVjsS2usYOp/jNurpqlEq3ZNCZEdw8aibdAajtSkb/Mll29vZqKnMzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258351; c=relaxed/simple;
	bh=vpU0jqyzYggE9pqYkka5SOv7jl7U8aHC+OFdlFP+Mus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+AoAEEOPAW1KeYyuFg8ZNahQSszQ2NqHkvo1OAxvu8PgOtZGMOBEh6bwp6qm91j4zj4oVJPKGwQTL35fH1lXvt0QqBmjDojCtRiKvftO2VsXTXloiCJcFEQgjGPzKKPHwavQ7kupX4FquEI37LaFO7fPUzYJz51vSp4fvje1TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=hCWABpiE; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=LBc7TJQ6; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="hCWABpiE";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="LBc7TJQ6"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id C899C12FB451;
	Wed, 09 Apr 2025 21:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744258348; bh=vpU0jqyzYggE9pqYkka5SOv7jl7U8aHC+OFdlFP+Mus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hCWABpiESCZwmNdguKYrROd+srKJ6YMfrJrbZTm0uKb8zOxUw2TXWYOL9D5fB1/gx
	 g2DTOAGxD3TKSnglhXv5CWVNmChorZRMrhB7kXKz9asGah0uwdA9+7xnsMvRjAssj5
	 GMmaKGZlLpVW4xsH4z8DxzwxJbUtJkSz6be3es9tPkOGT1Zvm11hZx7iaE5yNGPfcE
	 CP/oQXwDdLjrH4KG1LTeJZDGkVMIfXTPO0+GgoxwA1oonn35WMUfrRnQ4xeVJ7ZBj8
	 ic1BeQ2kN1gDqk4q5H5w1btSkWm0F4mS0HOP4+VrVt92atiBuk2aZh67d1RU3yvr0s
	 R5vWuvn1EhGTg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CSmZvWc90vW; Wed,  9 Apr 2025 21:12:25 -0700 (PDT)
Received: from ketchup (unknown [183.217.80.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id AAACE12FB430;
	Wed, 09 Apr 2025 21:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744258345; bh=vpU0jqyzYggE9pqYkka5SOv7jl7U8aHC+OFdlFP+Mus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBc7TJQ6LNgmZMi0U0v3CO6KLvvq1xjvWdg6L+o+h0WboloJpHGJi+QZUr8BbXHVK
	 hqmVbmedYMqMGQd8mNz+SwYnZMFW31lcviw5g2ABrC21uY52PWyhYzb8AkOsfDUAP5
	 ZAfsIU4xWyDZiFioL3DP6boikHFqnl24hf7Q46qaGXX+2uOKycHxDEnPKXpVvQxLtp
	 IN2+DwEqtcWegErlM83Di6BluBZhaOByUXmGZ8Wg+WqFiVLoVJy1gymZuZM54Bcea8
	 tWyyXn+pEAx107Wq48guANSAiPW8KjYhKzg/nhaICsIbfJmGbi/rNTQt3dRm603YeZ
	 h8JHrHFstcz6w==
Date: Thu, 10 Apr 2025 04:12:17 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v6 6/6] riscv: defconfig: enable clock controller unit
 support for SpacemiT K1
Message-ID: <Z_dFIavJT9_KwT1O@ketchup>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-7-heylenay@4d2.org>
 <e2c5c2c2-61a8-458d-8e95-521c5ea752f9@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2c5c2c2-61a8-458d-8e95-521c5ea752f9@riscstar.com>

On Tue, Apr 08, 2025 at 02:37:35PM -0500, Alex Elder wrote:
> On 4/1/25 12:24 PM, Haylen Chu wrote:
> > Clock controller unit, or CCU, generates various clocks frequency for
> > peripherals integrated in SpacemiT K1 SoC and is essential for normal
> > operation. Let's enable it in defconfig.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> > ---
> >   arch/riscv/configs/defconfig | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 0f7dcbe3c45b..011788d16d93 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -252,6 +252,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
> >   CONFIG_CLK_SOPHGO_SG2042_PLL=y
> >   CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
> >   CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
> > +CONFIG_SPACEMIT_CCU=y
> > +CONFIG_SPACEMIT_K1_CCU=y
> 
> Maybe these could be specified with default values that
> are based on the value of CONFIG_ARCH_SPACEMIT instead of
> forcing them to be defined here?

As mentioned by Inochi earlier[1], putting defaults configuration in
defconfig instead through a "default" kconfig property is the preference
of clk subsystem, so I'd like to follow.

> 					-Alex
> 
> >   CONFIG_SUN8I_DE2_CCU=m
> >   CONFIG_SUN50I_IOMMU=y
> >   CONFIG_RPMSG_CHAR=y
> 

Regards,
Haylen Chu

[1] https://lore.kernel.org/all/xwo2jjqy634z4rimgyrbjmxlgzxzauxmqzl57qr5oasph74qwj@7we45fnhwfzh/
