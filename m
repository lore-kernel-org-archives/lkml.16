Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEAA1DE883;
	Sat, 26 Apr 2025 21:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745703987; cv=none; b=JTt2IqfQRfdVc9nmWxFUbzCkRHVrjKyrR1yeDtMfVXMRKa5lArV0iLwueHcXyF5B7K9CBCOsqG/0g68a3ABiok0kEAdZChw/a3FhFdnYkPxUojf/mEeWrPjYH6eXGPYM12ea2SQNuiMMKoCsLnrrPXT6/C+c58YfQPgc8Nenh8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745703987; c=relaxed/simple;
	bh=sx7/u1KcQADCXMAjhAUeqbk5JA1nBsSGLMVTKCxwmow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XZfXK1UZyahgOKQGKHis6Et+NqrSArs+jfUxah3oeHiB0jaWGHWhGjS6Nahtic3qRdXlGCahH2wUiiBaXNjqDz9zBzFLL2heJtC0kRdNyWdiFQvvFCI20xlDwX6zctPCVcMqK/tmRQd0qMZUaRjv3d54ADPxPaQNp1dgpzKExf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=hxesiz8i; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="hxesiz8i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Cer4wksqyIzXNmo0vxNsCzf3aimDFe38DROHviMKDT4=; b=hxesiz8iu0hYpmdBpjdA4tQlOF
	t0G50gBd6vwRQiUlQjjs/H5jxJmmUYU7dECITCv+C6fkEUI68BUzaje+1lznBUHTe/ssV4WrnATUa
	Xhn5jXW3npOvu/twM9ZWVN5fhNVMx0mRNoWAobNcrBshQ84Rv81JITPLxQvKkAuJoF/A7tS+rmLEI
	/0i5ZFaDLVXqrXWWdrVRugX2vzbG8ArI2iDeUiBJSnWcdQg0mrMS0+RoqpMAH0H/HxcS/1cWYLCfm
	ktLKeeUE3AOylBWqjEqRyKPhZ9NnCRVHBHGlhmUU8euNBOogYqa8wvYAzP5HuvM+1xhtfhZMm8E9o
	frSTOW5A==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLq-0001OR-Oh; Sat, 26 Apr 2025 23:46:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dse@thaumatec.com
Subject: Re: [PATCH v3 0/3] arm64: dts: rockchip: add and enable DSI2 on rk3588
Date: Sat, 26 Apr 2025 23:46:09 +0200
Message-ID: <174570370108.31943.14492430799638906763.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250226140942.3825223-1-heiko@sntech.de>
References: <20250226140942.3825223-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 26 Feb 2025 15:09:39 +0100, Heiko Stuebner wrote:
> This adds the dcphy and dsi2 controller nodes and adds an overlay
> for the Tiger-Haikou Video-Demo adapter that provides a DSI display.
> 
> changes in v3:
> - rebase on newly added overlay-test-infrastructure
> - add reset-gpio to gpio expander
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: add mipi dcphy nodes to rk3588
      commit: 2e177b85541d1a5c28a4d64dabec8bdce0461a79
[2/3] arm64: dts: rockchip: add dsi controller nodes on rk3588
      commit: 0d0947766d877b63729dbef502e75827bf4ebca9
[3/3] arm64: dts: rockchip: add overlay for tiger-haikou video-demo adapter
      commit: 14e506dcf3b0a311ef3df5a86b810fd9ede0f30f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
