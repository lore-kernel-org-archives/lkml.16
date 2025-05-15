Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596E629ACD7;
	Thu, 15 May 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313466; cv=none; b=TGehvT0LEZr95hUZMjSMEAWBd/U8D4pygOPOiUH1H8sTgDSG5YTQk3g3XFd9pZdDqURXubggvvdOGKmElQqMQzY2uWTFu5RstpEu94fg84yFMKn6LMOeOUUe0NeTKY2VapacYaXoOjMqWF5udA8SoK22ZBOxOK7WeBPC/4K87/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313466; c=relaxed/simple;
	bh=dGNaWkGgS9U31fWTHyQBFUOXdmxvm/T2H+mtOiW2Qcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJhOrcJzPhOeQOsagyIZUCZ+a42LzXOG5Q9PSkDZ5xEuVKyrooV1NUxHOYuh94erpDXm9Cwiml4xywWpqqLAAv1L6Le3TzIkDHCkFesmoOJ1G9mDrkJ4hZUhrs/rwZFPp1ZcRqUQiTi7yQwIoO9m9vOHWBzCLn4fajCkslWh/MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=QwMHcV9K; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="QwMHcV9K"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QaorzZ1NhBrQjON3+nty+UxvATBO1FN3Ey2kw1dXSHA=; b=QwMHcV9K3OBIS1QzeAX6NAb4vg
	WPH/JpNo0ANxNir+AML2JbRsJV8k69cVa+APK/0gg2iDCyQEzi0w8eqb18VswH+blDAvspTSWPr/G
	fqd1amrwEtNbXqn3t9BPsPPKpa4877g4MfcsIXXzPfY5U/4r/GfLDXz3Q2GPxUBvYAKwYMs+wuTj5
	1/4dXyTZZZswUt9hdt8AMOgsWAlvK2/ALPsPmvT0fr2KzhAhuGPWStGK6ioyXDOVuiycEgTI6yMc5
	yhnj4BkI2CFmHBsBzLeQfPOAu4WjiJY5l+vHw0dTibVHMDD3Lfkdv36+dzUMWFb0kXnUxLVzX7FBf
	ltdmNQMA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFY38-0004ph-0W; Thu, 15 May 2025 14:50:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	nicolas.frattaroli@collabora.com,
	ziyao@disroot.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] clk: rockchip: rk3576: add missing slab.h include
Date: Thu, 15 May 2025 14:50:42 +0200
Message-ID: <174731343064.2524804.7884388044477445638.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250515082652.2503063-1-heiko@sntech.de>
References: <20250515082652.2503063-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 15 May 2025 10:26:51 +0200, Heiko Stuebner wrote:
> The change for auxiliary GRFs introduced kzalloc usage into the rk3576 clock
> driver, but missed adding the header for its prototype. Add it now.
> 
> 

Applied, thanks!

[1/2] clk: rockchip: rk3576: add missing slab.h include
      commit: 92da5c3cba23ee4be2c043bb63a551c89c48de18
[2/2] clk: rockchip: rk3528: add slab.h header include
      commit: 276036283716b9135525b195675ea42801bde204

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
