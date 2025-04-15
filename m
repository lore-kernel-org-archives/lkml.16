Received: from mail-m49248.qiye.163.com (mail-m49248.qiye.163.com [45.254.49.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475BA27B4EF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713450; cv=none; b=AP0SSj9uLRc/a/9GTQ4SO/9xRzA70ZhojXI1bqHfJ/hKextTgD91Rp/LA3ssSdItBqfBCRR2pYndQM69V5tGrl6y1H0krSVlji+i2hwLNGq/NCz5m9Pk5FyntoCEaAa+/Yx1ecyZskXq/Y17oVqcfG2Cj9IbHH++KcVon9JkUgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713450; c=relaxed/simple;
	bh=G6s31lFPPHK06KT1aG7l3N+gLrsc/j9/9+/Y/LWTImw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ea87UiIc+Fp0TM9hYw+wnyL1y9CxmxrFFs0/pGd5LJ9B5Lbe43DHdRDooeecFskN0lvQI4rPtUiv/rhYXnFqrI5QuFc4mmloBtyltrEx4jlXzTKeAqqON4PtJKCh1Gkd/b+GPoHN1R7u6jBCFXo4sBaOHs7blwo/O5WPDbYnDe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=EfC4sK23; arc=none smtp.client-ip=45.254.49.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="EfC4sK23"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11f2f6015;
	Tue, 15 Apr 2025 18:32:10 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 3/3] nvmem: rockchip-otp: Add support for rk3562
Date: Tue, 15 Apr 2025 18:32:03 +0800
Message-Id: <20250415103203.82972-4-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415103203.82972-1-kever.yang@rock-chips.com>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0IYVkoeHk9LTh9KSENMQlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a963901a25b03afkunm11f2f6015
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nkk6URw6HjICEhgMFBgZIiE4
	CktPCxdVSlVKTE9PTEpISkhJSUtDVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUpNSUw3Bg++
DKIM-Signature:a=rsa-sha256;
	b=EfC4sK23XRiJ7p7rSdymQJ/3mM6Mrl8gix4vDQT7F8LEMdZXMCdYJ/1dx3tPnAhb1jBov8XyTwxpYq1xuayS25WsmFTtiEs3JnWnO7u98sm36bHsY3/OsWpn7XGN8WK3ohUKhgZ2uj/eGAvgSvT7n+CmLfnFypCTZPgv5OfQUcg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=x2rU+2/DAdfeDTzcu3czX3OXDy+kV2hraQlukBVYidA=;
	h=date:mime-version:subject:message-id:from;

From: Finley Xiao <finley.xiao@rock-chips.com>

This adds the necessary data for handling otp on the rk3562.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v3:
- Use rk3568 data structure for rk3562

Changes in v2: None

 drivers/nvmem/rockchip-otp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index cfb69bc58869..62ce22d72586 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -376,6 +376,10 @@ static const struct of_device_id rockchip_otp_match[] = {
 		.compatible = "rockchip,rk3308-otp",
 		.data = &px30_data,
 	},
+	{
+		.compatible = "rockchip,rk3562-otp",
+		.data = &rk3568_data,
+	},
 	{
 		.compatible = "rockchip,rk3568-otp",
 		.data = &rk3568_data,
-- 
2.25.1

