Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534027E7CF;
	Sat,  3 May 2025 20:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303959; cv=none; b=UI26DrS1BO9mgJ4ilxyFdW/gLECHxaQkZIQiqz3iusiHqkXN/N+740LMY3FxngWJMccDLdS/vZ8RQO8zsP1X9bkeF9jrzQsywxvSOw/zJ91jBJLnAyVMzN2w+LDowpHZr0+UM9v4IxeKbNhIh4FevviZJBwlI5rO2/ObEEHXakU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303959; c=relaxed/simple;
	bh=UOOQrMNclBrQ8xiw7zOaZZq7FkhTMucjLuygZd2iFmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SYiLeJXM4C+TtCFrhJqdoVtAQabL2QjZ5y5srWRuDOu56/WIiftUojjJr3VrZ70jcixLzNwSVMyDN9Q+EpwPvsTmR5PPWO8zZBr5oTynXd0aw+1U1CxNh0OCbWmM55CCmAe+PdWmUIx38b16IT+JBv3m4xdkx2gxeiY7ZKGwFN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=a3x3v7Qa; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="a3x3v7Qa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=KNtr5PT0dXz0YHq1FB4htXBiW/mFemNZgrQEEs1haDg=; b=a3x3v7QaQzonymVnxrEP7O/qJs
	Lmkhg90XvUnvaj66TQyYDD8vrR7EfWsu9+YmWANEPIzPa0d3Xob1oJDsF6tKtXslKoLuJPvxzkwaD
	ghBxrZCh+x9Xub1kNBKysEZ/8vKukAGHW1hte568nvRJep7Jtvgwmc4L+mutHtfqogqP+zNxkPnjU
	677OL1CH4tCOv1BlGF9zjluyOQkNbFP0yMexCmNfA5dr375c1dKAI8bLX5tn73xtq6HKVb+m1nMsO
	R7jvJ3oTNqdTUns8OJsiQjjW2JaLLaiuv/e6xol9KyRbIj9YtRJadFL8w5SPvbeDrOUD8b9IXwW99
	ZiH6JN6Q==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJQn-0001s2-V3; Sat, 03 May 2025 22:25:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] Correctly implemet the usb480m clock on rk3036
Date: Sat,  3 May 2025 22:25:28 +0200
Message-ID: <20250503202532.992033-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the original clock driver the usb480m clock was "stubbed" as a fixed
factor clock, but instead it actually does have a mux-bit to switch
between the 24MHz osciallator and the actual 480MHz clock supplied
from the usb-phy.

Both the register layout, as well as the implementation is very similar
to the rk3128, which seems to be some sort of cousin to the rk3036.


Heiko Stuebner (3):
  dt-bindings: clock: rk3036: add SCLK_USB480M clock-id
  clk: rockchip: rk3036: fix implementation of usb480m clock mux
  clk: rockchip: rk3036: mark ddrphy as critical

 drivers/clk/rockchip/clk-rk3036.c      | 11 +++++------
 include/dt-bindings/clock/rk3036-cru.h |  1 +
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.47.2

