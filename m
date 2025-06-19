Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFEE21C9F5;
	Thu, 19 Jun 2025 04:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305820; cv=none; b=YrCmDlPdhbno8c/7h6XSIOcxGBQXEczefscCV4Xr1WCaB/HpNwOOyRldfpOoroDc88IaXh6Q4UTbhs4eJFS4LEgKVVC13ldrFLrHQhnrHukuqk3GUHucHDWQkZkG6Yxwr3RIBl1Z0G/nOxVTP0GwZayZwAzcSrQt2xlu0YvC7NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305820; c=relaxed/simple;
	bh=w6/FZuWa3iTHH+/dFNePfKMu6CKeNLdn4jLfPQkWJHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtlCorLMDrh2LxtZKAMsVW2sEAhA4kKFcKKaEUtboHRBMf1GEjDgIWsV02TeVyp+lMxnX6XkxB9hJt8iNW5m46foJlE5giYvFWSD5P1lHr5euCXc46RPi1pj8AnVYfr+rDTlRoyOU9PWldjj4UniBcFDayQKvROUFdZc1J9Vkss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NAy//Pt8; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NAy//Pt8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=mebxJHfBUu+PEqj1h1kC5lphByggIbGVwWubkQZ+XwQ=;
	b=NAy//Pt8StCnO+J6isdiPSTwZBabJznZLHn78gfOQIYVXNSK4OiSg08u8bSyw5
	pHhMaV9+UFlQmDGG9GqD03fssfyhYOAYiufj6rKky7Z9JO34yNwLAA4uLmcMtK5S
	/FXDGpCpNh/dEFLQFF9YJOlFKv3Xn0LBePjgGEYdtyii8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_zzci1NofHL2AA--.60682S3;
	Thu, 19 Jun 2025 12:02:38 +0800 (CST)
Date: Thu, 19 Jun 2025 12:02:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 6/8] arm64: dts: freescale: Add the GOcontroll
 Moduline Display baseboard
Message-ID: <aFOL3N7Si7ZWfEYR@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-6-a8f0195420aa@gocontroll.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-6-a8f0195420aa@gocontroll.com>
X-CM-TRANSID:M88vCgD3_zzci1NofHL2AA--.60682S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWUGr4UKF1UXw1xuF1fXrb_yoWfuwcEyr
	WkAa17C34UJ3ykAr4fAr43GrWfuw45Xa1DW3y5trs7uFy5Gw1093WDtryrZF1Uua1xtFWU
	Z34fKFWrA395ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbG-e5UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIR4JbmhTi96deAAA3T

On Tue, May 20, 2025 at 08:34:55AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Moduline Display platform is a part of the wider GOcontroll Moduline
> ecosystem. These are embedded controllers that focus on modularity with
> their swappable IO modules.
> 
> The base Moduline Display board includes a board-to-board connector with
> various busses to enable adding new display types required by the
> application. It includes 2 Moduline IO module slots, a simple mono
> codec/amplifier, a four channel adc, 2 CAN busses, an RTC and optional
> wifi/bluetooth.
> 
> busses to the display adapter include:
> - 4 lane LVDS
> - 4 lane MIPI-DSI
> - 4 lane MIPI-CSI
> - HDMI 2.0a
> - USB 2.0
> - I2S
> - I2C
> - SPI
> 
> Also a couple of GPIO and PWM pins for controlling various ICs on the
> display adapter board.
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!

