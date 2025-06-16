Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396412BEFF0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095125; cv=none; b=T7XKIBL5LbZScxXbOS8gF2zlJYy5m1C8qnanxMXbfzRvDSv+eGIb09fRqi5aocfvXenb3Q8ONCXpTK0UidKiqfKZRuzVLpjc7E+/zdCX9JrwD14h+z/Og5Qhox1kgOVFV4zjiySvgMg1EDQOco2NMpxrARZ/iz7g2OwaH4TqieQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095125; c=relaxed/simple;
	bh=JhhJGBA0/EyCx0gmSsYbnWwP9wMBDp+1SBs2G2GCX+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XO11ySxI96/voGfJkWLtevF09Pwlc+Nw5zDTHJQKDSQTaG0zNyrdSkgpJj9y635G1i0Hq2PjQXks6U+ahkDuAVZrk7+7qI7KEEULdANh1UXqZwzdk3JRcvAMznZfDzpcPUc4y6F7p642rrSIV+u7m3neb4OxtXeij+/hWzFtYR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQeYAeim; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQeYAeim"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8C4C4CEEA;
	Mon, 16 Jun 2025 17:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750095124;
	bh=JhhJGBA0/EyCx0gmSsYbnWwP9wMBDp+1SBs2G2GCX+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NQeYAeim1RStu+++zDlxFdavXDpAzRYyIHZA3H2A8SwtUkb4btg9tx4jMeY5Xvxtu
	 gF2+49nlI76HJThhBlPtfVEhv0rBOR/1Yq1BwcQBvH2NoqCXQNF90FrgM2wtdXcq+b
	 aZm9tV4+T2pIuuwPHtWDHuQEmWbPusm0dVd6Us5EkDTS4b7h+XSCGxG10rD6jQjaN9
	 coIZ5Lku6YoLQcbYLgOECKtzzjN3AQtfzLPrMr0ECe5T/2wBd4Wv7HkE2Xn8FgBUfa
	 ZEobo8pBe3PgdZ1bfh3EfHIDVTmvRxNttZTgUGGy4sZI8BleNfYSTt2bQXj4sULJeP
	 L+9OKspNU4YCA==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, sjakhade@cadence.com, rogerq@kernel.org, 
 thomas.richard@bootlin.com, robh@kernel.org, 
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srk@ti.com
In-Reply-To: <20240615093433.3659829-1-s-vadapalli@ti.com>
References: <20240615093433.3659829-1-s-vadapalli@ti.com>
Subject: Re: [PATCH 0/2] Enable PCIe Multilink and USB support in Cadence
 Torrent SERDES driver
Message-Id: <175009512158.77433.13273380062207072518.b4-ty@kernel.org>
Date: Mon, 16 Jun 2025 23:02:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sat, 15 Jun 2024 15:04:31 +0530, Siddharth Vadapalli wrote:
> This series adds support for standalone PCIe Multilink configuration
> along with the support for PCIe Multilink + USB configuration in the
> Torrent SERDES driver.
> 
> Series is based on linux-next tagged next-20240613.
> 
> Regards,
> Siddharth.
> 
> [...]

Applied, thanks!

[1/2] phy: cadence-torrent: Add PCIe multilink configuration for 100MHz refclk
      (no commit info)
[2/2] phy: cadence-torrent: Add PCIe multilink + USB with same SSC register config for 100 MHz refclk
      commit: 351e07e6b2ecc16ef8669713b14b6f67518c945d

Best regards,
-- 
~Vinod


