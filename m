Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFF31A3168
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745049614; cv=none; b=LXGpHSOumeuihOKIil7SxBihMxTh7DU9My3Q0TuFEmKZmN4cjznCaLsIZiBIPhhuLuLIgoAiMHDiAfW6IzlPZpB+/wSgYESh0MhVIo7hgAH62Z5qJp8zJHyAlvBD/8naY5ja75KJbBfZsileauQRyewnpBWDpFCVoCJh1ieWeQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745049614; c=relaxed/simple;
	bh=X+zrXcLiKWo9n6nY9lEQJMwv9BX5LAeu/9hpwNJIHjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k4bn/XL4V844HMYdYlilJhqASZxDwcu8UXTTQmM/y/kcGsnBKUaQ17EWHPHUw6kSt27xroo5MTlI7bx+65H7I9hdBUh9AsrVc8QuLMQq/PXuYoM/R5zvYyTA57ZMIy8or/BhiW6xjNDEFhcNOQAiZmsb6SMgm8y8mQavGKxXqXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [119.122.214.249])
	by smtp.qiye.163.com (Hmail) with ESMTP id 126b5e5d2;
	Sat, 19 Apr 2025 16:00:05 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	dsimic@manjaro.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	ziyao@disroot.org
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: rk3528: Add CPU frequency scaling support
Date: Sat, 19 Apr 2025 16:00:01 +0800
Message-Id: <20250419080001.16514-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bcedff66-26e4-4630-88cd-6ab9fbcf5598@kwiboo.se>
References: <bcedff66-26e4-4630-88cd-6ab9fbcf5598@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQklMVhpJGB9OGkMeSxkZTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKT1VJT0JZV1kWGg8SFR0UWUFZT0tIVUpLSUhCS0NVSktLVU
	pCWQY+
X-HM-Tid: 0a964d0fd4e803a2kunm126b5e5d2
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OD46Eyo6IjIMKA8PEzYdSiEO
	VjYKCxhVSlVKTE9OS09CTUtNSkhKVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpPVUlPQllXWQgBWUFJSU1NNwY+

Hi,

> There is only one cpu cluster on this SoC, I suggest we name this node
> opp-table-cpu with a cpu_opp_table label.

Sorry for the late reply, I was sick a while ago.
Will do in PATCH v2.

> Both 408 and 600 MHz freq will use a normal PLL and based on the vendor
> opp-table there are chip variants that presumably require 875000
> microvolt.
>
> Because of this 875000 is the lowest microvolt we should use in the
> entire table, to ensure all chip variants can run stable.

Running at 408 to 1008 MHz frequency under bsp kernel, one
of my boards voltages is 850mV and the other is 875mV.
I will use 875mV here instead.

> For remaining freq TF-A will use PVTPLL and configure an osc ring length,
> then the voltage supplied in opp and chip quality will determine/limit
> the real cpu clock speed.
>
> This means that the voltage used is less important when it comes to
> stability. However, we should keep 875000 as the lowest microvolt for
> all opp above.

According to your suggestion, I will use 875mV for 1008/1200 MHz.
Maybe it would be more appropriate to use 900mV for 1200 MHz.

> The voltage for remaining opp does not matter, historically mainline
> picks the highest voltage from vendor tree to ensure stability. With the
> use of PVTPLL that should not really be an issue, and we could pick
> voltages that will give closest speed for majority of users.

Thanks for your suggestion, I will keep this part (> 1200 MHz) unchanged.

Thanks,
Chukun

--
2.25.1

