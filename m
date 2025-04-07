Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AC222A4CB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010281; cv=none; b=tALw6xoav05XZa3mOi3IS7S63rhrnLOjmR7dH/zUeFypjrtMIXnMzmP/9uJefevGtB7pfyRRCr1XfSFZo7EWOqU+xVB/QcBTjifim8E540I179qoJztTzmzXCtDuhJfhFXoYqTjWNuhJ/A50ofV2jaSlOQ1Qo7VRyoUVPe/dr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010281; c=relaxed/simple;
	bh=ZfQMOAKgf3h0wQY63xd1dqWOYw4eLM03wklPxj3pBKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CpFyGnLwtwlqLD7LzgyjKmRcbq2GHCoGIx9xYROsRXXuZCPbHqNeU1iPSfyMW0Mn3rGNHut+uxfNMvXdLTvOg8P4SQI4Y7/Yc/RFWkQ7atZ1fqjcV7zY6PCQlju3LbpuEWm5+nX1QQtpxiLS901cJd9diUDSRbGyqMRtPblBrO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Ai9kF6Uj; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Ai9kF6Uj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KdUAOOSAppZrP2zaF9+Q2bZVNDNI+mu31ior4FSVRiE=; b=Ai9kF6UjsSD0f+9KkZno1zDRpi
	1fLEu/mpv1DwA2IZJ1J3aBMu63mE52xFGLTFV3KFI2jiwOmP6Gsrstlau14han8uBefwUTJ28D1aB
	J/MCarOsamtVmZqw+fzpvkWDqe+BFSl6KoXy8J2yx56Y19H05Dc9SDyGCRQXvXdRUZykVDWhB2iPy
	81Dz5GIYbR5QHUOdH7U0rG+my3IIP0Tzl0jzTjkVe83nSOzRmMWofx/mdDzyksk/IbM/RcX594lhy
	Zt3EACUI+PeVWhyH5qy+EtStCuZ02vTGk6ijfDHl8GO7NEaIn5/L81yzFnbMJyZsAfSa91PpAsQZh
	PvTRJByg==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u1gjv-0000tP-In; Mon, 07 Apr 2025 09:17:51 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sam Edwards <cfsworks@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Daniel=20Kukie=C5=82a?= <daniel@kukiela.pl>,
	Sven Rademakers <sven.rademakers@gmail.com>,
	Joshua Riek <jjriek@verizon.net>,
	Sam Edwards <CFSworks@gmail.com>,
	stable@kernel.org,
	Dragan Simic <dsimic@manjaro.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down
Date: Mon,  7 Apr 2025 09:17:40 +0200
Message-ID: <174401024392.372530.2675381411653155471.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250329165017.3885-1-CFSworks@gmail.com>
References: <20250329165017.3885-1-CFSworks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 29 Mar 2025 09:50:17 -0700, Sam Edwards wrote:
> The RK3588 thermal sensor driver only receives interrupts when a
> higher-temperature threshold is crossed; it cannot notify when the
> sensor cools back off. As a result, the driver must poll for temperature
> changes to detect when the conditions for a thermal trip are no longer
> met. However, it only does so if the DT enables polling.
> 
> Before this patch, the RK1 DT did not enable polling, causing the fan to
> continue running at the speed corresponding to the highest temperature
> reached.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down
      commit: fdc7bd909a5f38793468e9cf9b6a9063d96c6234

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
