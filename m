Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19EA1FC8;
	Thu,  5 Jun 2025 06:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749104017; cv=none; b=OinE4GriQikwHdu7WNVaHzN2htPKs4YEb9Ow0YhzDHPWiW4BvsrUw+MM8/Pczef+R63XEieFE6xe2aQRK5ySSC1pVdUiUiWMZAE6S5+6RGCzDH5U9YO5A2eYjK5N23VaDFlc/dSzU57rsVZPimqKy/QE7PaEaCu92c4H970kwoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749104017; c=relaxed/simple;
	bh=0Z12a9urky0EfVJEAMILGaGy5U/pdpfbX0qpuILFgSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLkMJrmRJn4g+mELcwudsYklHaajXCKYvDgPTV9NPA83HP7Q+i5tnp1tZD4J3AHpIMpC0As7g47ljKT0S8nFxmg+ynVyH0N+YwxNjd6kyspPJyE2KZP0K7kfOBUM/bEejtlacHoQfMDEd6hp8asSjYxoZsoHv5DqKMjVrDnLXlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDSMyQ/B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDSMyQ/B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E96C4CEE7;
	Thu,  5 Jun 2025 06:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749104017;
	bh=0Z12a9urky0EfVJEAMILGaGy5U/pdpfbX0qpuILFgSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDSMyQ/B/ns7Byo18f+lSH0QZYBX/A+EPpIcB71numscRgJ5A7gQkXMYEAS7hHIr9
	 CTaOxMa1AxjB3zgVUp3YiDxxIsbg/h6vC0kKhqyW58TAwjftgn2+Di97+mONZogOSM
	 YHeilgKog9hZmBJuP2F6SHD6P8GSFACw59cy6ljWsidP9px9gsEwf2HI8jHKUqqC7u
	 X4t1GBVnPG45eF6rqAnXElxPw07inRdzBNSghj38wnD/sGJDYHmmpsKAEA9UDA3WlR
	 MubaDIrX7auXpUcSaH8Lrc69nkNE/RMZOgKdbQsv/vhyfxrK/eAZX1icwDeaOTW3rO
	 rYNTaCRSFyczw==
Date: Thu, 5 Jun 2025 08:13:34 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Noah Wang <noahwang.wang@outlook.com>, 
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Naresh Solanki <naresh.solanki@9elements.com>, 
	Grant Peltier <grantpeltier93@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kever Yang <kever.yang@rock-chips.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/1] dt-bindings: trivial-devices: Add compatible
 string synaptics,synaptics_i2c
Message-ID: <20250605-beautiful-impartial-woodpecker-ebef7e@kuoka>
References: <20250604191720.1158975-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250604191720.1158975-1-Frank.Li@nxp.com>

On Wed, Jun 04, 2025 at 03:17:18PM GMT, Frank Li wrote:
> Add compatible string synaptics,synaptics_i2c for synaptics touch pad. It
> match existed driver drivers/input/mouse/synaptics_i2c.c.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - fix order in vendor-prefixes
> change in v2
> - update vendor-prefixes

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

