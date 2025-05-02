Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD5DBA50;
	Fri,  2 May 2025 01:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746149412; cv=none; b=PiIOIw5n+VhEz677NL1SoIi9BpyI40iJJgPezHe3bVu1fOomk0Dg2h6dDDjRMapRkHSAsspi6T0nuGTLfcxXFozQv4hNOwdvQ+IJx7lJZ+hZ7jzSNTn+/F3t8OOcy89UFSTQ9G9mN0c3vvbiKMge6Sk9BXYmmaMfZcwHpI8cD+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746149412; c=relaxed/simple;
	bh=7yPiM/BTKprD4dt1k+8OG/eUHYXJCorznVvQ6X6X/Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDHCCVKvnNuNl6RceTEP/HK4sHFt4fhYgkTA9Xx4Ievi2NjYCn31ksTdRLC9pTZSk8ecktBr5OLrt4q2vZ83l4ARvtBIqc0RJEdmDaw98sTfbRlzmvEGItta97Nd2TOEZtFsEbynoFBT8najOM2swVw6lPwqD/Gag8W51/lN+Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYjHviPr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYjHviPr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CF4C4CEE3;
	Fri,  2 May 2025 01:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746149412;
	bh=7yPiM/BTKprD4dt1k+8OG/eUHYXJCorznVvQ6X6X/Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYjHviPrXUxcfLLV6rgJajN7utTKn9Gt6bKvVT4rPDHzEFeRV4Zabxll1z5MPMmNq
	 wFfAcZt4grrvoqSvzcHZGU4rPJGY8e5QA1awo/Fzopelk9bvu4/rUwKaA1ptjQrKqH
	 mkM8d+aldzRzIhac950E6ITQG0OXA2Z8rsNH6AZlnO5LxvtXV4oy8lDwJVd5poQlgw
	 USpMSEBhvs1f7zAU/YBQo2pZ8+MlKJUiEIYmXhc5Exd+ujSYSQcpH1jpTq6V+kHb29
	 iySZwI6udC+ygJ4CFxig9QneVM7rE1/bSXJsAcrh9EnX/B8QdSChNW9i5BWYis6j9M
	 5lIHItPsE7smA==
Date: Thu, 1 May 2025 20:30:10 -0500
From: Rob Herring <robh@kernel.org>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: Chaoyi Chen <kernel@airkyi.com>, FUKAUMI Naoki <naoki@radxa.com>,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>, Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add rk3399 industry
 evaluation board
Message-ID: <20250502013010.GA3405545-robh@kernel.org>
References: <20250430074848.539-1-kernel@airkyi.com>
 <20250430074848.539-2-kernel@airkyi.com>
 <174602375195.3396795.11425847299435773154.robh@kernel.org>
 <9c51863c-95a6-4c40-9268-0b2be9b8835b@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c51863c-95a6-4c40-9268-0b2be9b8835b@cherry.de>

On Wed, Apr 30, 2025 at 04:48:35PM +0200, Quentin Schulz wrote:
> Hi Rob,
> 
> On 4/30/25 4:36 PM, Rob Herring (Arm) wrote:
> > 
> > On Wed, 30 Apr 2025 15:48:47 +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > Add devicetree binding for the rk3399 industry evaluation board.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > ---
> > > 
> > > (no changes since v1)
> > > 
> > >   Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > 
> > 
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> > 
> > If a tag was not added on purpose, please state why and what changed.
> > 
> > Missing tags:
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> 
> To be fair, the Acked-by was given on the v1[1] after the v2[2] was sent, we
> cannot expect Chaoyi Chen to travel back in time :)

Usually a sign of sending new versions too quickly...

But I just send this semi-automated email so we capture the ack and I 
can clear it out of my inbox.

Rob
