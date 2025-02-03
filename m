Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469971FE47A;
	Mon,  3 Feb 2025 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570579; cv=none; b=BKn5atZQaNldOue2DIMOTY+fAzjEkygnnIRn9SPiDitYiRbzypMSmojSkDRqF07s1mE3gS69vO/wfLWCNojQVp8gt6loxtsWTLDR9bQkAaFgKT1CU4+39IzxO6+AHAo9hVxmwRP8yLacwoUmMzrza/O2zpz+u0kKE1ZWGMXeN8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570579; c=relaxed/simple;
	bh=/pOpIZuyCA/LonJaFg55tIn1ZsMr5A43+ICwg7K4g78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PGsPtt5pvemADAARLY46fFNo1K+9pMpfw4KPq5JlQRFtApHUwKQ9vxlvYyyU+HEbsfAJ14jmo5qwJgIXQTVLVJR+/75hzL811F+o2SsQCqHGSd5WmESQ+lZ5GQYk2zxGjofxhsbR7+B8hGmz3rT5qWYfrLzQZ0cSst8PuEtBcSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=trnxp7F1; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="trnxp7F1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IRjbn6U3FQPXkyS2qDd2d9UidCrrWbdz9+kxShMj7Y0=; b=trnxp7F1jFSGLF53R57hKnbCv7
	yRMlVGnJB16IuQG9Skd0/3dlCnrRF8SiCgef1xARTDjYbeb9hcB7Rmo/bAEU0rlmeLDS3oXledwBd
	mka0SVqqvzQsiXr66CdjvPEkF15P0Rp2p3QBHgOtg4385bVkfLRX1buM9Q2zEiQgwuEQrKsL3kVYJ
	MpEl2zuYR6Vpgu7c6lz6WvrWIDxeKgDXRylwKDuw4+U0cct9pEuFRfhyrY8kjLmWoGQK+qPLwX8mm
	ww0wsMfrofV1QkbPMtVpUtwd2TiyCNdx7cYv718DWYeRBb2OuIqf8C7XbxBFmIQI/yAO1cwfsMxJg
	IUixtIBA==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1terck-0005Vr-Dx; Mon, 03 Feb 2025 09:16:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	didi.debian@cknow.org,
	marcin.juszkiewicz@linaro.org
Subject: Re: [PATCH] arm64: dts: rockchip: Describe why is HWRNG disabled in RK356x base dtsi
Date: Mon,  3 Feb 2025 09:15:55 +0100
Message-ID: <173857053622.78657.16352325923556757290.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <6b272e2f8f916c04b05db50df621659a5a7f29ab.1733149874.git.dsimic@manjaro.org>
References: <6b272e2f8f916c04b05db50df621659a5a7f29ab.1733149874.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Dec 2024 15:44:06 +0100, Dragan Simic wrote:
> Despite the presence of the hardware random number generator (HWRNG) in the
> different Rockchip RK356x SoC variants, it remains disabled for the RK3566
> SoC because testing showed [1] that it produces unacceptably low quality of
> random data, for some yet unknown reason.  The HWRNG is enabled for the RK3568
> SoC, on which the testing showed good quality of the generated random data.
> 
> To avoid possible confusion in the future, [2] let's have this described
> briefly in the RK356x base SoC dtsi.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Describe why is HWRNG disabled in RK356x base dtsi
      commit: 5afdb98dcc55917df4a8568fd07a119844a7d391

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
