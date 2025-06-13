Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D819192B84;
	Fri, 13 Jun 2025 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825538; cv=none; b=Y0B4ZKTRHbKUKKk0JnPMqP8OyMocoYwf8KPgKFpwPLkbZmLb9++hLxqgLXxKG4/KaL3C7ul72i7YgoHVjRh6jJ942xAP9WZea+rMG9GBoIFoR4VElJ7Ytq9oUz4nhRKaK0mGUOp22dFlfcFb4pOaSVZ2SVPs/Ob0HajtyXwuFeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825538; c=relaxed/simple;
	bh=xrFkZTYOl+Mqw+MnXtAP1z+pwD14ChtvOblUtxTfkXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lNOlFDDvdI4t8q67j30sRW8MtlnLmUGY0TUmK2fIloXjEw0uuXHp9SzUgi9RPxKj9rrWzcX4HsE+3MgmJ817lrytGyJXYFZskZ+lQQ0GF7mVwAB1tre17zqKgP4nR4OsxXHHg4H9UyemKhKuFvcS6AKCSJPIvoFf0/yG/FzRrpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLfplMoX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLfplMoX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C81DC4CEE3;
	Fri, 13 Jun 2025 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825538;
	bh=xrFkZTYOl+Mqw+MnXtAP1z+pwD14ChtvOblUtxTfkXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gLfplMoX1JV+9xs3L9h7WbHAZKEUMGWzRVo/cvt7qFp7WFa428Sa9mEQeyuD6BZNC
	 wPX/cSbiKhDONQXokSzlLtoE/U17YsIwR+TDoGEJE9dWSv+fcWtbqVxxBwWjO+DJJa
	 3dxO1dRtj9c8uYiZ8ag36JsN58gRPyGK/HhQI0yIlWTNyT0keXpzt8zx0czPv6hOqf
	 smgg1swTkfLvqYvye/u4buKy5LPsz2ATtXQxZBLivVWK3VNpk+A3LJLVyjWrgfomC2
	 3YxiZGqmcSsRpHFxvUiW78up/4oJP+ASvVU1CZkYyUczff5odNKkdpKjSue5gi26uw
	 4wHAp0jc0sfXA==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: Move touchbar mipi {address,size}-cells from dtsi to dts
Date: Fri, 13 Jun 2025 16:38:47 +0200
Message-Id: <174982533895.547352.2988220636703408038.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250611-display-pipe-mipi-warning-v1-1-bd80ba2c0eea@kernel.org>
References: <20250611-display-pipe-mipi-warning-v1-1-bd80ba2c0eea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 11 Jun 2025 15:18:53 +0000, Sven Peter wrote:
> Move the {address,size}-cells property from the (disabled) touchbar screen
> mipi node inside the dtsi file to the model-specific dts file where it's
> enabled to fix the following W=1 warnings:
> 
> t8103.dtsi:404.34-433.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> t8112.dtsi:419.34-448.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: apple: Move touchbar mipi {address,size}-cells from dtsi to dts
      commit: 08a0d93c353bd55de8b5fb77b464d89425be0215

Best regards,
-- 
Sven Peter <sven@kernel.org>
