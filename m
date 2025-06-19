Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3911A5BB2;
	Thu, 19 Jun 2025 01:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297312; cv=none; b=nKVw3AV3h7wCvoY8n8vhEg/KZPg1hnzX1xr/QTFTTmOqkab3a3oY3lrjKAJpOqlRhPvvj1K0ff60iQTH+lIziw5IL64pko7OI58uDybsPOkZJinSx2pfy9xqqggsx+oI3nLfN0Bmp3pZ1i5Lq9VugReN9lZbIpXeipYa67L8soE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297312; c=relaxed/simple;
	bh=jPPAWZ6a1IrtleYP3TvGyyyx0jme2jWVfzN/+FdueM0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=dFbzbMOLzEtaZA6Ta2yWdiV4z7Majc+YFgQ0/KVKisiPyC8MBe21d2o0rttpLeR8pEAr7j1Wca9lfj/Bx0/P1qSkB/ogW5qSoUZejEnXosfBFApkKm6AS0IGPUFkaOvwxQgMgOEHHdkoNdmm4Ykp9g3EItVjvEGjqrR1i2fVgyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwIWOxp+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwIWOxp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AF6C4CEE7;
	Thu, 19 Jun 2025 01:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297311;
	bh=jPPAWZ6a1IrtleYP3TvGyyyx0jme2jWVfzN/+FdueM0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HwIWOxp+6ZACT6nebixJHM4yLmmxBKUoxQ9NyNclBP0KMnb26/FJFOvxuFgjCZTDl
	 D1FE1aiexBbxGKzN2/NJ/yFzV5RDAWkkSe+476tiPjRGU5RplbI6ERic0E2QNCwuFn
	 YUPDrL+ed6tN4/LJX4H5kMNcKAbOyWnkFjc5/yUmHGTOPvjchudQOjAKbVUCTNR4lb
	 V0iZKuFk6TCS5UYxc+xDKU3rz70kbrkfUJDnR1yqLZT0ItDKJLVLGPrYRNPenPtwWx
	 nTL1IUbozWv637+2iq4MWtgQgk+O7lqFSmyAT1M4MfZb05LykxXnSl97KkKcnb8Rhl
	 p7azIku6Ml/OA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521211840.77487-1-robh@kernel.org>
References: <20250521211840.77487-1-robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: clock: Convert marvell,armada-370-corediv-clock to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:41:47 -0700
Message-ID: <175029730701.4372.1570645679382779093@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-21 14:18:39)
> Convert the Marvell Armada 3xx Core Divider clock binding to DT schema
> format.
>=20
> Add the missing "marvell,armada-390-corediv-clock" compatible and
> "clock-output-names" property.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
