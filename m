Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF2430E82B;
	Thu, 19 Jun 2025 19:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750362877; cv=none; b=eMn0YNqDlBUmqZV37T3X72RUvKCXex+h9uXMMPbKRJdK+AeK4Q2XFR5xt1jY5hnD97FOw0cbM6fZeKWnfIRgy1UobAx9/vWrL9svFbUL4ykHrESl+yUJ/0/P2D/sJJZQZQHHVzpyVWsAsseeDGpqq+upyt70BbJa/fTl12fb2n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750362877; c=relaxed/simple;
	bh=rWufee79LmCp4cY9NcorLs0fohV01FS8UrEAxvFpX8o=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bY+4ze3IAILsE260Q0iGtDBZnWpGz4AFtYXmPQ7qsFOUDMEKC25V9ZIrtG0TBxwtg2ZCXLE7biTCSzSTQ2VV7BCTnKbAXRRnc4vVbZGy7gZj60LZjldCeMWx5RCu+2bXhxqomZjXUa6YT6WZL05l7Jv+CNttSk3svTM/Cc6n48A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqCYK5Rz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqCYK5Rz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270BEC4CEEA;
	Thu, 19 Jun 2025 19:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362877;
	bh=rWufee79LmCp4cY9NcorLs0fohV01FS8UrEAxvFpX8o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SqCYK5Rz8YvF0vcvtzOdxJftdiR4Ku5Kg/+UB/wt9lfIapBdM7EgslJXlwWARdpim
	 WvT2mH7T8ciXJGF3uluweqCm3Dalpgbm7YpT9JASuSX9V+RHXPljTPtkuPZj2QnyzP
	 9Y75A50hutA0AjWGlMXh7V9tWiuA2uvHAAPcFTvLINIACd2KYBWnDQm2hbr67FNhXs
	 w+0K/+KIOJhuz1To6GWST7NjPRJPFULHggPbUYeR94Hfpfe8qbJXfAT4MTBK53smqp
	 zMbTO5YDNVWIpEug9qO7Prg6iRNc1DleXUDZafIa3NPKyB8uVR9sd8qZSKhyZhIU2z
	 6YC/4iy+AHr2A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619171025.3359384-3-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org> <20250619171025.3359384-3-wens@kernel.org>
Subject: Re: [PATCH 2/2] clk: sunxi-ng: sun55i-a523-r-ccu: Add missing PPU0 reset
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>, Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>
Date: Thu, 19 Jun 2025 12:54:36 -0700
Message-ID: <175036287647.4372.1701190769589982450@lazor>
User-Agent: alot/0.11

Quoting Chen-Yu Tsai (2025-06-19 10:10:25)
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
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM C=
CU")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
