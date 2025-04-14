Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5D1F4616;
	Mon, 14 Apr 2025 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744667018; cv=none; b=qMEkaI8q1vFZ6t4KAkvvz47C5EIeKuWPPAFK3UYGEQ3OVxJNVcHq81zywoZ1PAgXu8dRxypLfmGzK5k3VvECdPzwND02J+9BkFe5ZOQc0M12t2FJjDG7qqXwpsg9ZuBIvhwPP8+sY6uQGsM1sDhIdQL6/WW9NlNnLFNL5CBpboY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744667018; c=relaxed/simple;
	bh=oRWRcSg3da335Bzlhh7WOfoNL1GC15AWamTh54T4lFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slHBPABgb2Yd6x0NCUYnOBFzT9OIl0r/qzoTLrUzh0Z0wrSkd6QqR9Hag3AjbgU38lq0FgOLsABn7Lzl43/csyVfK5WIpwRfEGXjINcPi7htSI2bWstHcVPHycGkSYa4UuUEJi9V6DlQdmbhjJaXPd1InAtHX8KrqtNsIBgV8H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2307934306C;
	Mon, 14 Apr 2025 21:43:34 +0000 (UTC)
Date: Mon, 14 Apr 2025 21:43:30 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v7 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
Message-ID: <20250414214330-GYA29591@gentoo>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-5-heylenay@4d2.org>
 <b557a075-a184-4234-9793-ca1d13eac9df@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b557a075-a184-4234-9793-ca1d13eac9df@riscstar.com>

On 13:12 Mon 14 Apr     , Alex Elder wrote:
> On 4/12/25 2:44 AM, Haylen Chu wrote:
> > The clock tree of K1 SoC contains three main types of clock hardware
> > (PLL/DDN/MIX) and has control registers split into several multifunction
> > devices: APBS (PLLs), MPMU, APBC and APMU.
> > 
> > All register operations are done through regmap to ensure atomiciy
> 
> s/atomiciy/atomicity/
> 
> I think Yixun can tweak that for you.
> 
sure, I will take care of it..
(if there is no more iteration)

> > between concurrent operations of clock driver and reset,
> > power-domain driver that will be introduced in the future.
> > 
> > Signed-off-by: Haylen Chu <heylenay@4d2.org>
> 
> This looks good to me!
> 
> Reviewed-by: Alex Elder <elder@riscstar.com>
> 
thanks
-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
