Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AD71DED51;
	Tue,  6 May 2025 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530159; cv=none; b=Y9DQnRpQAYJ409m8Xfx/dTAnaZpsaJrgxL8jpfU01PK6I9e0IfgXRIlRl9+0Usp0NpEI5bTacccOsQ0b8VAgolk7Z3gIRpQLeqgMYlXJ2SqjwijYYotozx62Ex5c2YxJBUZUd1qr6Gi/aqGYVny44IBo1ZBB9L9EPL5qrx32o9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530159; c=relaxed/simple;
	bh=5H1YHmqg1BfIge4wOyPuppiouxLBRjewLVC2HmMG7k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bsjoQB1wxdQ5jhe92Pa7nUR4OSh/clm3V+yhAX8EEdcPpFSSmTXM91e9Sp3xjFWuUn7HHNetlAr8liZ+sLwfL8mLJOPhxH9/BhHzbN8UOoagC4OuttZTISFaaAb/taSQVqD9vhPcSTm3hwskeTO5SdD1MrwOkU+Xuow7+u7FdG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Q9cFFKzd; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Q9cFFKzd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PjX4pdz/ggEMRHtgaXyYi2dUz9COuWm0CR9rLf0Od6Y=; b=Q9cFFKzdh5LtgPMqryJ59PeE6N
	ZyMwlTsx+/VInOIa/Hj69E4lw8UYYnCAuMQGvtqBvKF27NBAEkvCArJ3kkKIQPFQmXGTwHZfk+Ogw
	i95rf6acUDLueruRWXuwk+SQR4qguPXyBqsUUH8CLjYO1isDaUxxvctC3tQ1vE6WrD3Qa+4WlLfg8
	x91vMpNPs9VLo6H8H1H5S3YTdy19z16SMW9vgNOqqWlwH9Xxy0I/pLVblkaHx9N7mTLFfjxJDrRFQ
	8t9bzdUEERxN8ZGd4lNVK9fV5vtjVS6YW0vR7/6dzucLXtE8aXwNHRGlxr78yaoycIWlLkhTWWrih
	473gwvJA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uCGGv-0003Vx-Mq; Tue, 06 May 2025 13:15:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: dts: rockchip: Add pwm nodes for RK3528
Date: Tue,  6 May 2025 13:15:28 +0200
Message-ID: <174653011959.1371608.16023824654446843423.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250401120020.976343-1-amadeus@jmu.edu.cn>
References: <20250401120020.976343-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Apr 2025 20:00:18 +0800, Chukun Pan wrote:
> Add pwm nodes for RK3528. Most rk3528 boards use pwm-regulator to
> supply to CPU, add node to enable them. The PWM core on RK3528 is
> the same as RK3328, but the driver doesn't support interrupts yet.
> 
> Note that pwm regulator needs to be initialized in U-Boot:
> ```
> &vdd_arm {
> 	regulator-init-microvolt = <953000>;
> };
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add pwm nodes for RK3528
      commit: 9e701ad7c3551b3ab87ed5fa439569696ddf42e4
[2/2] arm64: dts: rockchip: Enable regulators for Radxa E20C
      commit: c6599944af5a09029259ff8c533d22754f2b1ba4

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
