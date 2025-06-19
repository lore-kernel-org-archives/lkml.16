Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6640F1A3174;
	Thu, 19 Jun 2025 01:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297241; cv=none; b=rYUQMQHB6BNMKkZD/Xr42zD50VlpWobGkoN5z5h27941AM5yToBcszr5l6QsBAWutTB+Uy2+0+iau9HIkt8cWFfYVvFz2b0tZoLVAVrVnB+hlNflIVPhclVead7PEIeHeh3TS36D3Wo+5h4ipvdl2Ts0KKDUauvCOwF4XOvVydY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297241; c=relaxed/simple;
	bh=xj9BhZGY3FabblHPf79B9zLk0YN8Jg6mcZNozouIkS0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lSpxknoitgUUZEylDxXNmih2lBkVRjEX6v4hAcmOMpKQbDK5LwRU4blMbEXtiwmjk92XT2V1yfMTuMNLH1H8oQ7IY6KLHhiJKBuQkmjKJKHaaoEkWeH3Xrjo7LOFlXH3/GUbvS7uNq8csFCHhJhXylYkqNstcikKVY3EUfYZp0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlVuKL4C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlVuKL4C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DF1C4CEE7;
	Thu, 19 Jun 2025 01:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297240;
	bh=xj9BhZGY3FabblHPf79B9zLk0YN8Jg6mcZNozouIkS0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YlVuKL4CQ+N2ZyoK4jctdYn+mkPf57yESbVhUWRfncKw04Rc3DwCcvKIgcq9Ezp++
	 8o9bLRRJu49YfR9b53UAjf0awRUlMK3jlE/c52dl+/e6ZJiGm4VgzXuKzMAku3NCln
	 lPLVp336DyXllMOCFkCPALAHv8B1z0DAkBfx763OwB2lteYw2bv6jNWr265CYTaR5K
	 iY89h2EPyCZIKiCACJNs04W9dC6Tca4ZKktPrRfxgrjt3/xVDtmjyq93Lsbjyzzq/x
	 eTzdiIvsMAQVslQWRL/U8EOGVZP82bJPnFFAwXeC4Yt0nNxaiDkxRS+oo1gfk6wf47
	 Qqm4GVvr9Q5sA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521210826.61957-1-robh@kernel.org>
References: <20250521210826.61957-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert marvell,armada-3700-tbg-clock to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:40:40 -0700
Message-ID: <175029724008.4372.8731461749567597127@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-21 14:08:25)
> Convert the Marvell Armada 3700 TBG clock binding to DT schema format.
> It's a straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
