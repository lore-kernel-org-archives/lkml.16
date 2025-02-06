Received: from mail-m15599.qiye.163.com (mail-m15599.qiye.163.com [101.71.155.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2094C8F;
	Thu,  6 Feb 2025 03:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811371; cv=none; b=A5AfY3I+AG4n5nwgUo6RWPU8dipOL4d7YyjUvuReKD68SnmlyCcg9fx+l0FeOcVQazg6yvO72YlkFPVrzWXqZYgBVXJw2hYf4DEWoEtAD+qMHvQc0LzBr+M5yYeLIljHXRLBCpEi9xHPkpfZHiI0ltCbTF3tcmfEAUFYI0R1858=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811371; c=relaxed/simple;
	bh=dNZT3JsYYtAs2vqS4CbgU8EpoTZki1QGNV+kTM0ewt4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HCJsNk1+29V1WeHuuBdFP7YnQYQu+qnYvahwHRf2netJLAGbfokjgN0vnlvUNTjLY+kGl5rxgc0moqw7ztXV8ZbbsuIIf/bMuFvDdaQ/1pYBIFwW5D0p/yqEs600nu4B2KXivI1K3sbKZdkjBa8wh35GQjdCwEUzv3YxeUx0bDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=hmxGW/uj; arc=none smtp.client-ip=101.71.155.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="hmxGW/uj"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a47c7aa7;
	Thu, 6 Feb 2025 11:04:16 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 0/2] Fix label name of hdptxphy for RK3588
Date: Thu,  6 Feb 2025 11:03:28 +0800
Message-Id: <20250206030330.680424-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pPT1ZPSx1LGE1CTxkaSkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d937235a03a3kunma47c7aa7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OSo6Qhw5TTIJFgkhFS80FS4s
	OhUwFDJVSlVKTEhDQ0pKS05DSExCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS05KNwY+
DKIM-Signature:a=rsa-sha256;
	b=hmxGW/ujnIBUnqOd2kHaYMDkwiyHlXllkRrXoVAfcVaTt2di6w368VAv/rbgQYgiStTbse0vwbnsCirj2+ys8xbVE2KvoLxnz6tRcDmjKBxphES/Vy7oYP8jvlIdEkxLn2PONn/3iqP0ZqLRQ4yqjTKj71s+Duo1Y13l4++fAFg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=FKRHF1m9vSxG53fGyhmajJ13PLGzPs6jS768SI2ZSR8=;
	h=date:mime-version:subject:message-id:from;

Picked from:
https://patchwork.kernel.org/project/linux-rockchip/list/?series=927102

The hdptxphy is a combo transmit-PHY for HDMI2.1 TMDS Link, FRL Link, DP
and eDP Link. Therefore, it is better to name it hdptxphy0 other than
hdptxphy_hdmi0, which will be referenced by both hdmi0 and edp0 nodes.

Damon Ding (2):
  dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
    HDMI TX Controller
  arm64: dts: rockchip: Fix label name of hdptxphy for RK3588

 .../bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi                 | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts              | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts     | 2 +-
 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts           | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts                | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts               | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi           | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts              | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts              | 2 +-
 21 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.34.1

