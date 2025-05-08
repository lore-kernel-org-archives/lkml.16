Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3A4286D74;
	Thu,  8 May 2025 18:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728900; cv=none; b=LvfaZwVlq7IU1fXoZ89JQMDul4a5mp+OIWIeAHPriNgEmBMacxyQ+Tc2cgX3QEop/pIBQ3dRPgd2Kp3LbmQR4oKeG1jW3ZEaZ3qTTzhkjhZBIvNIYolYU/do5fgk2XiF5h8JyQx3UyYKuFgK0yxNgt7SWw4LgSZJpzP8oyjlIbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728900; c=relaxed/simple;
	bh=blMsO4qaCWTNs3Oea59BQv8XQkGEnFGCGgW8etX9th8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbwoqrxIIuPTYtfdNTACvcUc+mtRWJqVwFwV4d/a1HDtzWyPGReXS09XFpb7PRgo0fnCT++OwJmiW07YgS1NAqYA+4EFhHPkHTmDsv5rQ9XM/LD36ybd4pnblTk7ZdKzDNamWKms3vrZ0kuwRfB3uMjVpCT0v1ax4glBTRD0tbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=B8CFgnA/; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="B8CFgnA/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=RunLEOIGqZcaHH5istx3/NRLaEmuvJ3v+u+tkMxtecY=; b=B8CFgnA/nvIjBiXcN3f6gyLwts
	NVXKQl5zaHVKcoAlQDm7NxjfNzwCxZ67VW2B9mIDZxLw8UUCZR26UbN4648Zt4z+wHyKvErtME6am
	8IPC4fzbwYxJnB8BhgoVk1r+rDPFN27etC6wqb4blNajN5SO/byBAf9HfSDoW7tEQL9l1Y+yhkkCe
	RIFPN6OaimgMiXO5Schn66jG6JMUFQrPp2FzMXX3DO0hiWE7tUR7t1FfLn5xac4mrAVXwmI2GLVr1
	KSRasTa11xw+7Ixt1HUjbvNBu/Q+eeDD3Dbp6BgvCfBoQGXdQjfP2god0L1FfMiJ6b/p4dvtK+8Pg
	mHAfUf0A==;
Received: from [61.8.144.177] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD5ya-0000tP-I3; Thu, 08 May 2025 20:28:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nicolas.frattaroli@collabora.com
Subject: [PATCH 0/2] Some minor cleanup in the Rockchip clock driver
Date: Thu,  8 May 2025 20:27:50 +0200
Message-ID: <20250508182752.1925313-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One fixup for the new grf-gate and bringing the grf-mux branch naming
in line with the oher newly added grf clock-types.

Heiko Stuebner (2):
  clk: rockchip: rename branch_muxgrf to branch_grf_mux
  clk: rockchip: rename gate-grf clk file

 drivers/clk/rockchip/Makefile                       | 2 +-
 drivers/clk/rockchip/{gate-grf.c => clk-gate-grf.c} | 0
 drivers/clk/rockchip/clk.c                          | 4 ++--
 drivers/clk/rockchip/clk.h                          | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename drivers/clk/rockchip/{gate-grf.c => clk-gate-grf.c} (100%)

-- 
2.47.2

