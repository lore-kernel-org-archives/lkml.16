Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6314F1C84BF;
	Thu,  8 May 2025 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729069; cv=none; b=meP6ogWzUMOdvugNcfrAG6s28tB+68h8kDdGK0DtVtzyt8yBGRRauah2gHjMbSeVk6ncY9Q3BpxzkiBMpxufMW69h/6q/1JdFeUKmGZrSRObtyk7ez+qiZbBwzxQLAzVtHk0A9/6JAhXNsAL40H8htNRhEY8q5eEPUYI0kpNErQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729069; c=relaxed/simple;
	bh=ScCrgY66NWXVaZDOykxTT2JOn6uAsfZm64O1fUbmNxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZLpok8q8qzs4cdP7qzM9NndeWvzpHIABmjNPNNll5U3pI8y9aU+LmYlF4aqNum2kZ0H2Zj1+ERgBxta/Q285O1RF3iNlyAVyOUHwHUs0ejXR6OP/T2ajQbcxWRGpnFM3Wr+eKycKE59uRxgr0pc9tL+T/WmhnUS7YJieJEWNMbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=OaPDzJii; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="OaPDzJii"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=T7KUB66ex20KKbW6a9zIjBnH56YYjFLFeSIV7Lf5sII=; b=OaPDzJii2050EtK1qhFtB8+nCi
	X8I6PNRJgiMH3Ia5j9jJPVVCXT8ETlBAiKH/V47JhXbMmI61aeY6X19BfeQ4YV+cxZHGNzo5jQ59E
	ynD3GdidrsNiGXoEvD/zs2lOAhMSWrtHb5yeeyK45PGFvMr04hPtt+onaCPXPXSX4QTGzCXBAQpew
	0K2NpV0XDD9VWn1pnXzqG1g3V0IBVLrZDj6b1giKCan5m4dNQodoiH2MplrWjy97fcZEOmeDgzkJl
	bBAn/qXRrdutShJN5xFCw+qB8nBMls1P9zu0f63sluAgoQsAjLww2ZSClqy5RCs5gZednLNC0n4IY
	sOdScCyw==;
Received: from [61.8.144.177] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD61J-0000vi-Qa; Thu, 08 May 2025 20:30:57 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
Date: Thu,  8 May 2025 20:30:44 +0200
Message-ID: <174672902820.1927548.18239697985612657696.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250308093008.568437-2-amadeus@jmu.edu.cn>
References: <20250308093008.568437-1-amadeus@jmu.edu.cn> <20250308093008.568437-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 08 Mar 2025 17:30:08 +0800, Chukun Pan wrote:
> Following commit b956c9de9175 ("arm64: dts: rockchip: rk356x: Move
> PCIe MSI to use GIC ITS instead of MBI"), change the PCIe3 controller's
> MSI on rk3568 to use ITS, so that all MSI-X can work properly.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: rk3568: Move PCIe3 MSI to use GIC ITS
      commit: fbea35a661ed100cee2f3bab8015fb0155508106

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
