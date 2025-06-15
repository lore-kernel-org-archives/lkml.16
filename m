Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AEE262FE2
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 16:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006357; cv=none; b=P+ZVXRhWxYf4KGmuP6mfoiJVopzIJlwAlm0piBNPCzUPu7eHl+QKAzpv4IG7wNkZp/mi4ac5Cub1tmudnIRSS7fB3NvrWXvinbfLqYV/oHUaeYLdHQPKXR8H9h2MwGmrIB8WqgyPe4kJD14pLWSWjF35QCho+n5+30m41i3ZiIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006357; c=relaxed/simple;
	bh=HAWTeDj+3sd9b+9FiKThyghoJ3PqZB2HO2NIzGCnFiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eQecJsB1ohbwAx0ifWwdR4ty33iirTpda3zT0lIm3pNrFKe6shRvHgMHKfM8AQGTFcUbXZ0XiMHekzyeAfbi+QqAYKTEp0SLtXVZLSHCsbJg9w6QQvCoszpnMx4LO7EimAVOGF7m61tkTBvsYBjyS3j9Nmx26R9476xetIZ7g4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mi/TV5hp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mi/TV5hp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD29C4CEE3;
	Sun, 15 Jun 2025 16:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006356;
	bh=HAWTeDj+3sd9b+9FiKThyghoJ3PqZB2HO2NIzGCnFiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mi/TV5hpcWPaInKAdCyoC6rBZuOyo5KIpoWfv86cyeQrl9w3wyPAtQLD03SLTtDpO
	 zXgEGAoEZ06GFXV9dnjiiIk8j6lcJT9cfKfJ8vhhzxavQX6dWVYtiG7CV2pglR417i
	 R1SPYnuaoino5n028Cctt+uOkxhtiZwnfX8tKft1G1BE1fzvW4DgMnkkKgcqyqQ2US
	 pd0yTw9X9VbsLCkpN1TpoC0Y00do0xiXmTfi6GvnlEm9KxTPPrJ81MtVM5ghWd6RFv
	 Xv1IHEZ1DYBuu2swiZQWYQtJoVLic/yU/IExJM+ulXdVbCV/r6I10n8ZZ7kGmWG7U4
	 5VukkOUAJmFvg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, christophe.jaillet@wanadoo.fr, sjakhade@cadence.com, 
 bwawrzyn@cisco.com, u.kleine-koenig@baylibre.com, 
 krzysztof.kozlowski@linaro.org, Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srk@ti.com
In-Reply-To: <20250610130133.2102196-1-s-vadapalli@ti.com>
References: <20250610130133.2102196-1-s-vadapalli@ti.com>
Subject: Re: [PATCH] phy: cadence: Sierra: Add PCIe + USB PHY multilink
 configuration
Message-Id: <175000635358.1180927.3012221075684762895.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 10 Jun 2025 18:31:33 +0530, Siddharth Vadapalli wrote:
> Add register sequences for PCIe + USB multilink configuration for
> Sierra PHY.
> 
> 

Applied, thanks!

[1/1] phy: cadence: Sierra: Add PCIe + USB PHY multilink configuration
      commit: 6767df73f2d36e7d1cf0eb3c4d9469c7e9fe9824

Best regards,
-- 
~Vinod


