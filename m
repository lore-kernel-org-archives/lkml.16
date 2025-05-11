Received: from mail-m2491.xmail.ntesmail.com (mail-m2491.xmail.ntesmail.com [45.195.24.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A053C78F52;
	Sun, 11 May 2025 21:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.195.24.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747000248; cv=none; b=eXyn9hObqLEBP1hE1UxgdbAf3TmIYlubhgN2gYN/K/LJh6pQkzhpGvHtHPhnTWfb8dBxHouGAv/JC0uOIGbA57QQj3uJcM92gJ/Q+cqjtcdRNLWf86KNmZQylgs2agg3uECvGBFtz6baTcB5FhP/sErnCjqokw9Oag0ELdq1ze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747000248; c=relaxed/simple;
	bh=OOUdApa0JThYxCoz78OPV6tqoLIrTEdW0j0Sn5iyVqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vD6ZiFjXdYqk/c72lnbAdSWidLxIc8bBssffFO5GWa6AG30wOvOz9mClhMbRdPZZTPpvV/4Z2zzCNy3ldVf4Mkm3SHBdGsuqua3NS83CfTISzeC9xVwXg0xSnVRlv30OllJh5rGZvxwP7ZQytKLLRuXOozk89mILr/oK91FQEXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.195.24.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c03:9b0:dce1:ee4:cfd7:5cd7])
	by smtp.qiye.163.com (Hmail) with ESMTP id 14a30f72c;
	Sun, 11 May 2025 23:01:04 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: heiko@sntech.de
Cc: amadeus@jmu.edu.cn,
	ziyao@disroot.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Sun, 11 May 2025 23:01:01 +0800
Message-Id: <20250511150101.51273-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <3317829.AJdgDx1Vlc@diego>
References: <3317829.AJdgDx1Vlc@diego>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHxgaVhgaHU1JSUNPTEsdHVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtIQUIZS0EfGB5KQR4eT0EYHR9MQU4YH0xZV1kWGg8SFR
	0UWUFZT0tIVUpLSEpMTU1VSktLVUpCS0tZBg++
X-HM-Tid: 0a96bfdd298703a2kunm14a30f72c
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjY6Nio6GDJPGUoLFB8zHBMo
	OgoaChNVSlVKTE9NQkxOTU1OSklMVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0hBQhlLQR8YHkpBHh5PQRgdH0xBThgfTFlXWQgBWUFKSExONwY+

Hi,

> I might be blind, but I don't see a tab missing here? #adress-cells and
> #size-cells are in the same level of indentation as the other properties
> of spi0? I did move the -cells down though now.

Sorry I didn't make it clear. This refers to -cells.

> hopefully caught all pwms now

The pinctrl-names of pwm4 to pwm15 are still "active".

> +		saradc0: adc@ff730000 {
> +			compatible = "rockchip,rk3562-saradc";
> +			reg = <0x0 0xff730000 0x0 0x100>;
> +			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +			#io-channel-cells = <1>;

> > `#io-channel-cells` should be put above `status = "disabled";`
>
> moved now :-)

It looks like saradc0 forgot to change.

Thanks,
Chukun

--
2.25.1

