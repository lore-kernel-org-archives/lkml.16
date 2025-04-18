Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEE645009;
	Fri, 18 Apr 2025 18:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002625; cv=none; b=sdiGDxuEQXNaIECxwv/cjSnGMZj3dzbZCvhQdVBM7bk+khVIe0kRskTy6u/B8QSVmy1Iwo1L7f85wzfCHFSYukDSw7ssNTi/xkzImlR5dvI4FkssF3RPdPxCzZeHPYl6FUdwPrZauDeHoB3kaB2xlZo0FWGyuBUtwY1Dfw4TqP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002625; c=relaxed/simple;
	bh=AMz0+a5YMHK1AZJpcT6+WmTciGSPZiOTZwixeeNRYTw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q/MHNjtaQz4DgcUeYIRUYWVjgDZdwAvz2lB7UDnFFenFkRGynQY3ewbIBC4uKl0X1aKXiqOfAM7KKOOKygLxZR5P+Y7mb6r3Gk4fN5YF+YkqHWA/Y9Pm9DYnqXzhI2FpdFFNQMxJUTkAkRUy/TYdq/kjEq5n4v53ksTB746hPCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mLJWMsWc; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mLJWMsWc"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIuvaS1061144
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 13:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745002618;
	bh=tcrNxE+0JGcCoKsLbE+QviBfNrctHLlmF8zwyaLUIlQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mLJWMsWc4stQvTtBi9jK5QAkx4VF2Ik1jqVIEvb2KhZhfb2G0wLWQfsrtkg5Daz+m
	 LnoOJ/nx9fj6FrIqhiO1MwcGn2pMCPM6pU71YbeT31oNf+UTRkbvsRddYok/n8vwqh
	 rZD0WAXMGq4/rdKmGNwT0ycANWlV4G273bzbZm3g=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53IIuvuR108580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Apr 2025 13:56:57 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Apr 2025 13:56:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Apr 2025 13:56:57 -0500
Received: from localhost ([10.249.36.23])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53IIuv9T116986;
	Fri, 18 Apr 2025 13:56:57 -0500
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j784s4-evm-usxgmii-exp1-exp2: drop pinctrl-names
Date: Fri, 18 Apr 2025 13:56:56 -0500
Message-ID: <174500258303.95192.1919212906702588939.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250411061425.640718-1-s-vadapalli@ti.com>
References: <20250411061425.640718-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Siddharth Vadapalli,

On Fri, 11 Apr 2025 11:44:25 +0530, Siddharth Vadapalli wrote:
> The "pinctrl-names" property is not required since it doesn't have an
> associated pinctrl configuration. Hence, drop it.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j784s4-evm-usxgmii-exp1-exp2: drop pinctrl-names
      commit: 5e5da30f2e255f14c3098723fe171e6aec8d7db0

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

