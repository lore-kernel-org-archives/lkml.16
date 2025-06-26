Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946301459FA;
	Thu, 26 Jun 2025 23:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981849; cv=none; b=e+S0glPh/mOUKdtxTwjJed6WYd5Mf2lvQFwjWT8ALsW8WgYOtObnpT5iflp9iFco5SwC8w8qCfjpH2hwc3vJDyi/lLvshCKRmBpdNi9kq9IWPYXQAVdIjYa09LL0YL2s9wiWDQR+WE9cqOX2DoP7uMoy5LXkKnZWfhJxUNj1onY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981849; c=relaxed/simple;
	bh=Cux7d7o6s1reAw2y55484JgLSPWg5ReReLlow0n8JmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSY9vA72x3U/dW3Pr+HdoAa5Zz33V3tMOKTrxPPrl2D1JL75R+GBlh7N3PtNhg54Ym4t3nwr9unJp9vjT7Ea2L4KX4A1aUlj+kt6iw6d7KcA3n+QOz69Fwb6NOKreSYbPH5WHtuaq922Ym0Nshb48RwYbcAJGzL9reAWowfdEmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pfm5cde7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pfm5cde7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38CBC4CEEB;
	Thu, 26 Jun 2025 23:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750981849;
	bh=Cux7d7o6s1reAw2y55484JgLSPWg5ReReLlow0n8JmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pfm5cde7edrH+jAJkui0gcpO/BUhE39G7FXZlqDhra38fSk9u/n+eRJ3054+20CSY
	 JVTo0cSTz5UcBEl5HvAdST8Nh51rFlDOoGyaY89AWZK/5kYfA6YRnohPkAg8veWAWG
	 TJP6SXH8M9zp7sxvf5r6bzO3ZRgiDZt3KmemtmhBBkY3Cr28gUi3lkdcAuewTXxYNh
	 d3MYdd3/vrtpzNHkfK6dXqNIZ4B/eigYLcbvyD+Mg197vItlZHGKTvEHxL6nPexz6y
	 kr89EW1wA4SL6zLps7WCR/8igpgDBZgISLgXjx1Cz66maEpVAX7kG5AUgHE2w2LU4m
	 0JbeJyJWTPmeQ==
Date: Thu, 26 Jun 2025 18:50:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, Shawn Guo <shawnguo@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: Add bindings for SolidRun
 i.MX8MP SoM and boards
Message-ID: <175098184781.1426950.6408937893785063066.robh@kernel.org>
References: <20250614-imx8mp-sr-som-v1-0-3ca3269883c4@solid-run.com>
 <20250614-imx8mp-sr-som-v1-1-3ca3269883c4@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614-imx8mp-sr-som-v1-1-3ca3269883c4@solid-run.com>


On Sat, 14 Jun 2025 17:20:56 +0300, Josua Mayer wrote:
> Add bindings for SolidRun i.MX8M Plus System on Module based boards:
> 
> - CuBox-M is a complete produc with enclosure including the SoM
> - HummingBoard Mate/Pro/Pulse/Ripple are evaluation boards with common
>   design but different available interfaces.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

