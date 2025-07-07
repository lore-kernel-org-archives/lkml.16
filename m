Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F5A19F40A;
	Mon,  7 Jul 2025 06:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869022; cv=none; b=r0kUAUvNTcNCB2+CF5W9iBBCIbrRyrKJg1qnWfBqpWvMC6uhAR1QbJhO3pk09N4iYBudAdwwgsv0ch851Hbf7xxm5ZX2JsD+70+U/95YLObCCFoa0WKK3u1TTh6Ydv0iI5SEFBcqtrGV5Uvb+qKBm3Iw1bBzCB3N1993Lz/C2zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869022; c=relaxed/simple;
	bh=lhxzKPvMbvLCdIvBc3l1/2og+QLpTeNSU1qnRGsO/28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jr0u8CHlrLy5hg+py33qBSX1UYJOqhgH7W7duVpIPkTtwxsmcgUFdgXQbSh5BzoANgRslzbK/FexpNsvL7QHHPfC2yzI17aN2vo5czxfNGOtTrXtZeVqCsjxjcSF3nbNm7BuR5BvE9+smu5Y8XOsMFKVuKUp7QDw1vm22xg9UGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1CXJdEF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1CXJdEF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05F3C4CEE3;
	Mon,  7 Jul 2025 06:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751869022;
	bh=lhxzKPvMbvLCdIvBc3l1/2og+QLpTeNSU1qnRGsO/28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q1CXJdEF4a9dZcgWl/ng2pagMHreJKakjs7JulyaC9OKRFjLhJlQTHKdFQ+dtZhvb
	 ubNvVWBvatb6Fz99PyHlhciLgozjrH+DjsUkNM21pMjkjFqIm88gNb5o9i0uQDGVFE
	 f5ZuRCnOgOe927KPZDm1ShrrvM/xTVJ2JN+Cis+FDA9VFzGIOWZmR5rj6FwtOfbW9Q
	 m0BBE5A5z4VPTQc6Pft28zjU7qy1sqyISET0lsM47ayIhSstowBWQZ8lQEjcG5RsU1
	 HnZpYYs2C2v148MY9FKiwe6CH9n2ckxLboYfDyNfGWKZvHoHycB+a4tmi0krOxgKpt
	 GhAlI3htgkS+w==
Date: Mon, 7 Jul 2025 08:16:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mo Elbadry <elbadrym@google.com>, Rom Lemarchand <romlem@google.com>, 
	William Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>, wthai@nvidia.com, 
	leohu@nvidia.com, dkodihalli@nvidia.com, spuranik@nvidia.com
Subject: Re: [PATCH v11 1/3] dt-bindings: clock: ast2700: modify soc0/1 clock
 define
Message-ID: <20250707-spectacular-platinum-hippo-9ab32e@krzk-bin>
References: <20250707011826.3719229-1-ryan_chen@aspeedtech.com>
 <20250707011826.3719229-2-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707011826.3719229-2-ryan_chen@aspeedtech.com>

On Mon, Jul 07, 2025 at 09:18:24AM +0800, Ryan Chen wrote:
> -add SOC0_CLK_AHBMUX:
> add SOC0_CLK_AHBMUX for ahb clock source divide.
> mpll->
>       ahb_mux -> div_table -> clk_ahb
> hpll->
> 
> -new add clock:
>  SOC0_CLK_MPHYSRC: UFS MPHY clock source.
>  SOC0_CLK_U2PHY_REFCLKSRC: USB2.0 phy clock reference source.
>  SOC1_CLK_I3C: I3C clock source.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Acked-by:Krzysztof Kozlowski <krzysztof.kozloski@linaro.org>

Don't edit or fake the tags. You must paste it exactly how you received
it.

This needs fixes. I suggest using b4 in your workflow, so you will not
make such mistakes.

Best regards,
Krzysztof

