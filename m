Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F422B25485F;
	Mon,  9 Jun 2025 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464625; cv=none; b=Av16R6JAzY6a0n5DLKyntsap7emddj6vTfvn6zf1fKzyxr6u1Fb7dybT8osSFqGpJ+zHYhteQH/+bXUaAUrkhobDZCeqzUIsFEi6HJD9GJA5AObuNo+uAsmC+7lRGySLf5J0LoGwl356mrHdGz30OnH7F4G2JsPiKP6zVs68BX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464625; c=relaxed/simple;
	bh=r1Nljlz/cNkXgH6huapV577rwoZH9O1Tn3bKukaYUJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cDOJH9Ithc28KEnrVmRaMHVpXapcYhjfcwCGAVT7GNIqhhYSdmBCJ0JvKkzIjmAHa3pRAPdmuuFrsmwz/ASUePfPGkCp/z4wsRoYs52Z1uXmIF9q5fEC6rvg98uKvkU0SmOqLt/F3VGPbKkFE5/ZEVWDjdObwzwUGBHoeALFh8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=MAGJK8lS; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="MAGJK8lS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WgA9iDSNL7LoVYBeJupisyslNFsqQpP5M3SHNxVuOmA=; b=MAGJK8lS/jQ4xm07Q89bSrfWtM
	JPeaVzwQQpJ9y5O29IsxKdbcZZ6/HU8+WUZeisdxndhzQCJ9A78H7kDOXuiodS+OlFO3yqb2Ck32O
	mFi8jDh+N7NR8AI12sSinqV1fxdoa9v1mvrijEn1azPCsbXtOP3ZzrdJQg67L5k85s14NITXlOw/H
	t6vrYBEoX7lBzsqE3goioeNICVYokmbmvBZTW1r5rozhgWuoDUc21E3u3Sk1GoXx8AaVzrn5TqZ52
	cltmFn0kIgxaLQ7XKobqZyyENxkUa+b6RZucL+SExjZuII0QS7shhXjgip8IQxRh+Xuk+UQU4WH56
	oe1EQ4vw==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZfC-0006Av-8m; Mon, 09 Jun 2025 12:23:34 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	simic@manjaro.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	algea.cao@rock-chips.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength for rk3588
Date: Mon,  9 Jun 2025 12:22:58 +0200
Message-ID: <174946455535.762051.10507198799610616035.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250522020537.1884771-1-andyshrk@163.com>
References: <20250522020537.1884771-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 22 May 2025 10:05:24 +0800, Andy Yan wrote:
> For the RK3588 HDMI controller, the falling edge of DDC SDA and SCL
> almost coincide and cannot be adjusted by HDMI registrer, resulting
> in poor compatibility of DDC communication.
> 
> An improvement of the compatibility of DDC can be done by increasing
> the driver strength of SCL and decreasing the driver strength of SDA
> to increase the slope of the falling edge.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength for rk3588
      commit: af9feb0b85f92d2972061224839c5fea5ee39f6d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
