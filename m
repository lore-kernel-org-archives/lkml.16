Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B15C283CAF;
	Thu, 10 Apr 2025 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296767; cv=none; b=EHFp8wunNphzBKzesjYYsIGTdBu8dMPK68Os7mwRfrthaMYSDvhjb+fAhz1I8+sJ5gcgWAW9kaJrfpt2svzhF/icegxX1N29mxeq5POOGeRgfbabBAhLsd0yV9ArLQjqq7qoRbce0JYxxXnDPErBiJAAlzD8trQGbKo+q2HcAiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296767; c=relaxed/simple;
	bh=RUrH1iirLO8tNkMYbm6yisBXU1HLuOYenz1QkZ0gIjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dsd7j1/UpGLU1qiYyofU8TxB1GxSVfn4KcFZtPKonXRmCi0tMdVEatDuHBYvBiFjMmRWMu/Tu2nwtXkjAXq0xyKh8GWdvb1jIrqbVRGaV570fmRzXqTyemC894m80feW/tIAx/9gX96l8VuQkrmAvUG1zZ9y1Ls8K9HXhXx+mSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=1j55grGE; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="1j55grGE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LbqT13J53edS+fyf8egJnUeNsEUgrz/xn8khgjeEXAg=; b=1j55grGE4MwHPAJ2hPmeqFUSqy
	kJIuCz/HcNHsilRUwpBcCXkzEl2+/avBMc3y7fqXyZyQtAhRah8t6CIWh3GDwYG4CjhX5Y5IKxWWg
	vJQTHTeb5TLL2ANMNQJuOTH44e4hqaDGiJMK9F4EzGMRKkLVr7Q8bltrP4bUbA9wYxDisAUbPyrLl
	sM2fwxdbYn0tDi65vm2lu7YoNoXIZz/VCp84TPjLvWFuPoYLs43RRGba3ps1uejdChyr9RQm0oPKb
	Vq4YXgrHZ2X/ZH0rMIGOg/aRckis1GXNvt9m4haNSa+qOU0Vutk+66lsMlgMc9xIawylVv+SeeXDu
	HNdRIBxQ==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2tGi-00012N-1m; Thu, 10 Apr 2025 16:52:40 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: px30-engicam: Use "regulator-fixed" for vcc3v3-btreg
Date: Thu, 10 Apr 2025 16:52:26 +0200
Message-ID: <174429674408.910874.6701444480288043126.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250409205047.1522943-1-robh@kernel.org>
References: <20250409205047.1522943-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 09 Apr 2025 15:50:46 -0500, Rob Herring (Arm) wrote:
> The vcc3v3-btreg regulator only has 1 state and no state gpios defined,
> so "regulator-gpio" is not the correct binding to use. "regulator-fixed"
> is the correct binding to use. It supports an enable GPIO which is
> needed in this case.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: px30-engicam: Use "regulator-fixed" for vcc3v3-btreg
      commit: c8c59bcac9300c22abf1afd7e236978a413c3644

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
