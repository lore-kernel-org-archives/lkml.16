Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6550330E82B;
	Thu, 19 Jun 2025 19:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362871; cv=none; b=ZYyTwqA8BYT3He1Brb2OMwJWFzSNMpc8BQczWRw+PftrKpjJk5P7o9GKaMfTjZxpkjbsPv3sA18DL4RRmUgbDlWECk9PLylGKFRsrw8K4p8ZrgvyjAqX568U6gnzhFbKTa+J86va1d1dvtwFLjg22GXVBFoom2d68qKPkUHyMhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362871; c=relaxed/simple;
	bh=lLUNA2btcTVM+29cX0zM/hTgXoUCcTegeYyK/w6c0IU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lBt73oRh+7dAP+fdaUaMq7VGP2IIOVBGFqHr7u15m3RHs1AN4jg1E4AVSfMXXywXsrOZanIfYsm4/Srkvh77JCDi3IxhxgJv3SzcAQhdiMIDSy0Bvz475Wvd2x/skHp2XkaIV/lXTazLLLhmztoxo22lfwRBpS9nGvPqyeK2PJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9YRHxfC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9YRHxfC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6B3C4CEEA;
	Thu, 19 Jun 2025 19:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362871;
	bh=lLUNA2btcTVM+29cX0zM/hTgXoUCcTegeYyK/w6c0IU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=u9YRHxfC2xlyG6DZZGG2H4+kRICD2k+XrdDMTw95UheQdSuU7WXUyqa7d/X/I/5W9
	 lds/oNSwWQMZ9+9D9buuuMwKk8/BP7S53VMzCF+tcmORbRyK2N2bEn8fglN5Z4RmS0
	 looOeJz4yzN/XHK6M+HsBczKMbUZwPHBtqF5FyACkFc56WuU2H5Hx3gXGidLOpDDqg
	 jhv2DQG4XnwNkLRyR9LCQ9dIChLOjhglo4qR7O+BYpaT0JwevNdxDsfXjxUqz3/tzq
	 W36TozvzLJZRh5Z+WHwssmjL4oNAKG3Bj7gH1JgI31kMERvkG3lmY3LQhcmoy4Vwb4
	 ltmC0ePBpT2jQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619171025.3359384-2-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org> <20250619171025.3359384-2-wens@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: reset: sun55i-a523-r-ccu: Add missing PPU0 reset
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>
Date: Thu, 19 Jun 2025 12:54:30 -0700
Message-ID: <175036287011.4372.17190370496961036062@lazor>
User-Agent: alot/0.11

Quoting Chen-Yu Tsai (2025-06-19 10:10:24)
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> There is a PPU0 reset control bit in the same register as the PPU1
> reset control. This missing reset control is for the PCK-600 unit
> in the SoC. Manual tests show that the reset control indeed exists,
> and if not configured, the system will hang when the PCK-600 registers
> are accessed.
>=20
> Add a reset entry for it at the end of the existing ones.
>=20
> Fixes: 52dbf84857f0 ("dt-bindings: clk: sunxi-ng: document two Allwinner =
A523 CCUs")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
