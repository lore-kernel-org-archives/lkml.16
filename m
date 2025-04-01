Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E831EB5FA;
	Tue,  1 Apr 2025 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498328; cv=none; b=jle9TimYqzOh3y6zJdf4Xr5K5qIXoNQpc6o8SDuhrmsVCTvoFcCLvfV4vRECvykUhtzQZ5vurBgsm9viJUdVKSHStHqE7wtf95WiGUVNLa8A4lDzYXvBUGmYnCtsmczvJgU3Xqt3OnKmY17+HILGR7QNY5cVSsHzTNrJZelLA94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498328; c=relaxed/simple;
	bh=ZEWpwtkyU/NgK+Jm/2/mf76fom5y6Nra8Tn5NtkNtTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kORmou7e0xNYZwxQrdcrz7+Mp+74xIuGPF5KmlXngPsKwvmtMvSMSBTTGu6tAsyA7q5mqJOrnPyTw8ahXu5JfEGIKbVAd2K9QpeAMEGAGV9zI7z6C3bTZcPZPrslCQHpp2D3UG4k7bACBZZLK/WQSaj7jXqXpfckgIeRE4zEw7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:430:ae31:3177:4f09:da96])
	by smtp.qiye.163.com (Hmail) with ESMTP id 104ddcf66;
	Tue, 1 Apr 2025 17:00:12 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 0/1] arm64: dts: rockchip: rk3588: Move SHMEM memory to reserved memory
Date: Tue,  1 Apr 2025 17:00:08 +0800
Message-Id: <20250401090009.733771-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUofVhhLGhgaT0NMH0kdSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQU9IS0EaHkhKQUhKTExBTx1LQkEfGkJNWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a95f094679703a2kunm104ddcf66
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OiI6Kyo5DjIMOQpOEyEvNFE4
	HBwwFBVVSlVKTE9IT0JDS0pITk5DVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBT0hLQRoeSEpBSEpMTEFPHUtCQR8aQk1ZV1kIAVlBSk9OSDcG

Inspired by recent rk3528 thread:
https://lore.kernel.org/lkml/20250306131016.281290-1-amadeus@jmu.edu.cn/

Nothing seems wrong:
~# dmesg | grep scmi
[    0.056987] scmi_core: SCMI protocol bus registered
[    3.331482] scmi_protocol scmi_dev.1: Enabled polling mode TX channel - prot_id:16
[    3.332265] arm-scmi firmware:scmi: SCMI Notifications - Core Enabled.
[    3.332869] arm-scmi firmware:scmi: SCMI Protocol v2.0 'rockchip:' Firmware version 0x0

Chukun Pan (1):
  arm64: dts: rockchip: rk3588: Move SHMEM memory to reserved memory

 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

-- 
2.25.1

