Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E554E23BD09;
	Wed,  2 Apr 2025 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597171; cv=none; b=SsU/LW4SGNLwLJ4uetTBQgJnCazzc0fS8rTabUD1t6riNOv9YzqqbNKO10V8FedVFLfqIeidV6w+84QF2ChcD88oivCsms1w+Lxqiz48pmTcJSYNg+BMjT4Bf4JOYxxHxG2AbsZzHoP2hxIxA0yF0UIqhhbjtmcovX1fNfCk19E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597171; c=relaxed/simple;
	bh=2eRSjAqq4dRA92FQXWfbQYLmjHUN1/OJEIyDCopuqeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PN+fORVvfCijdlBIzdqoD2kjKCYKa7vKz8BqtTd86ih2vuBlo6DodyO/V5vo59hne9FXJnCxEI1TpnXnhwViqOf4oa7gofwllTA9qeqaiXG2et98NV7I11xi9Uv03OfOZ1aO4HcKkZdm77pElj5hssZ8kx/Ms0YbYAciabNSTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=chYKSqCm; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="chYKSqCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=oGUkH
	84hkPBzmx/lS7RDwXwqM5OPP1Xjz5Ep4c4bpzw=; b=chYKSqCmtnnZUjyAf+UAH
	mCRrVrrJ1FXKyjopzqe2GmeDC4k6D66qgOhLl38eXGUEtktVV9Iz6Bkjo03O6+pG
	Z/Qn4NbF+1ZcT4eP23UZMRAHjaySKHWDP0yAPA4sBForiDS3BJJOpuxtwb1lX8nL
	L8gXDcUdHq2W8kZuEpHIJM=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnd405Lu1nJwOJBA--.36321S2;
	Wed, 02 Apr 2025 20:31:57 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 0/7] Convert inno hdmi to drm bridge
Date: Wed,  2 Apr 2025 20:31:34 +0800
Message-ID: <20250402123150.238234-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDnd405Lu1nJwOJBA--.36321S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF47WFy5uF1rJF4fGr48JFb_yoW5JF15pa
	98Ary5ZF1xC3WIqrs7AF48ArWayayDJa1FkryxJw1fZr4F9F1jyr9xuFs0vrnxAr17AFsF
	yr4xGa4UKFW7ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7b18UUUUU=
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h4jXmftK+o5IQAAsi

From: Andy Yan <andy.yan@rock-chips.com>

When preparing to convert the current inno hdmi driver into a
bridge driver, I found that there are several issues currently
existing with it:

1. When the system starts up, the first time it reads the EDID, it
   will fail. This is because RK3036 HDMI DDC bus requires it's PHY's
   reference clock to be enabled first before normal DDC communication
   can be carried out.

2. The signal is unstable. When running the glmark2 test on the screen,
   there is a small probability of seeing some screen flickering.
   This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
   by GRF. This part is missing in the current driver.

PATCH 1~6 are try to Fix Document in the dt-binding, then add the
missing part in driver and dts.
PATCH 7 converts the curren driver to drm bridge mode.

Changes in v3:
- Convert to drm bridge driver
- Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/

Changes in v2:
- Included the HSYNC/VSYNC polarity fix
- Link to V1: https://lore.kernel.org/linux-rockchip/20250324103332.159682-1-andyshrk@163.com/

Andy Yan (7):
  dt-bindings: display: rockchip,inno-hdmi: Fix Document of RK3036
    compatible
  dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
  drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
  drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity setting
    for rk3036
  ARM: dts: rockchip: Add ref clk for hdmi
  Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"
  drm/rockchip: inno-hdmi: Convert to drm bridge

 .../display/rockchip/rockchip,inno-hdmi.yaml  |  20 +-
 arch/arm/boot/dts/rockchip/rk3036.dtsi        |   5 +-
 drivers/gpu/drm/bridge/Kconfig                |   7 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 .../inno_hdmi.c => bridge/inno-hdmi.c}        | 907 ++++++++++--------
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 187 ++++
 drivers/gpu/drm/rockchip/inno_hdmi.h          | 349 -------
 include/drm/bridge/inno_hdmi.h                |  33 +
 10 files changed, 760 insertions(+), 752 deletions(-)
 rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (52%)
 create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
 delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
 create mode 100644 include/drm/bridge/inno_hdmi.h

-- 
2.43.0

