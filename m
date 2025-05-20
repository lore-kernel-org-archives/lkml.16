Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A101FFC54;
	Tue, 20 May 2025 19:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769579; cv=none; b=PEW7ROp+WUlO5zfpqPXSXsfXPJ8PNt8Sfs+3aqKx11nCKRRt158wW0HNEDaeWxWE2iwfLNT4ChPLamchRItzrkzs3pBoWQ7syRAvEd7MgMxkdm07LBTeZ1qg6uruqICzBFbgpzMCcQxLqcwJzu/DSHNw16eypYeRURHV2E0A6yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769579; c=relaxed/simple;
	bh=EZGRw9Q4tb3Mv4QMdVejmdHmY8SCNeUUNUC5LNs6Yac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHpnixR9Gvga/G+OcYvlp98jJoJfDtQMJORV/qinI52o7a9oyS9uO2Uow2S2JVqpQ2N0qvuI5ZYB9J3yRPcdnQwXg8tL9UUjcbIe/hWj3L7pR5ZqKtB1PX6f5mi7OFZidpHLjN7A25lH1f0wQ+eiNt1GoMv5eeC3mVwOEsUU01Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYVGk4KR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYVGk4KR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78C4C4CEE9;
	Tue, 20 May 2025 19:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747769579;
	bh=EZGRw9Q4tb3Mv4QMdVejmdHmY8SCNeUUNUC5LNs6Yac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYVGk4KRSLsCfbKkFb8O2MFI1ZA3lSnBE31g1iZ1lOqy/+g4geKEl1sM4Mzr/vlW+
	 eJPnG9FHK96DIzYhlbfUeMLTJOsIpgLBv3e5YpYTGIiGfHbKZ6XeHqd4+wafrjZNVp
	 Vw0mOrEp99UNXJDwHuFa1beVM8nlp3rqePIt6n24jD2S5Qd7xYceGQvTlHfJSWNkBa
	 Qs198R6ze3Bu33WdwC+qQFqhiY3eS3agIwsCSaHzy5jEVHAMhC7ZhlBYs+KjmlUAl9
	 oDnBReeD42fKi25zC9LhsvE0XCbCSkx7p4uHCitOJPAxk4Y4v2FN8DfISO+2qBghV4
	 CiJWKNEP7uTRw==
Date: Tue, 20 May 2025 14:32:57 -0500
From: Rob Herring <robh@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Zhang Yubing <yubing.zhang@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Diederik de Haas <didi.debian@cknow.org>,
	Johan Jonker <jbx6244@gmail.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH 2/2] dt-bindings: phy: Convert phy-rockchip-typec.txt to
 yaml
Message-ID: <20250520193257.GA1221161-robh@kernel.org>
References: <20250519024820.194-1-kernel@airkyi.com>
 <20250519024820.194-3-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519024820.194-3-kernel@airkyi.com>

On Mon, May 19, 2025 at 10:48:20AM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Convert phy-rockchip-typec.txt to yaml.

Thanks, but I already converted this one and it is queued up in 
linux-next. There's still a few more rockchip ones to do:

['mps,mp8859']
['realtek,rt5651']
['rockchip,rk3368-mailbox']
['rockchip,rk3399-cdn-dp']
['rockchip,rk3399-gru-sound']
['sitronix,st1624', 'sitronix,st1633']
['ti,tsc2007']

I see you already posted cdn-dp. Thanks!

Rob
