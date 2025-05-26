Received: from mail-m19731102.qiye.163.com (mail-m19731102.qiye.163.com [220.197.31.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EAB7483
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265824; cv=none; b=JScnuF10Hz5/F+gdn1w+in0a4C5spNpQ8yUYU1jme/Lykh2hErYlQs6q/TIIe+qIqi1vGZEcG/G9ReaMMSviqzpHInQotBCcPP1IYxA5iPLtJDy89YbnMrjG56rGrYY0agjl7hcaNCy8Ed/03uyWD+uOkqkOHZh0WbefAT/4I94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265824; c=relaxed/simple;
	bh=F7DUUBlHEmFn2tOU9JR1JkwLwTsaZrshfzhE8XtGNYc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VOrTzjOp8dayZUaExbMuPb68ZGJ3Lu696r1AzHQhj9lI3RyOiZKN41WWBI6Cp7ShHC0OZdNDRueF6u1r2uvWZQS8tTkdV1SVRRaCCP8noZyYZMDusc7fQlotBRt6Cu1JPaZfoPNQ1tmQ5MlIlBzX34ASiG2sqZOsS9lpXfrpVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=OtIWIlKP; arc=none smtp.client-ip=220.197.31.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="OtIWIlKP"
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 166d9dc7d;
	Mon, 26 May 2025 20:08:02 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: andy.yan@rock-chips.com,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	l.stach@pengutronix.de,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v1 0/3] Apply drm_bridge_connector helper for the Analogix DP driver
Date: Mon, 26 May 2025 20:07:39 +0800
Message-Id: <20250526120742.3195812-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh0aQlZOSB8aQx8dSB5PGBpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	1VSktLVUpCWQY+
X-HM-Tid: 0a970c7e23d203a3kunm0ad0490252545c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pkk6Nxw*HDE#IgwOPlE1OBgM
	P0waFA5VSlVKTE9DSU1KSUNPSENOVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTk1ONwY+
DKIM-Signature:a=rsa-sha256;
	b=OtIWIlKP4EL4syWe2tXIHkJIar+CXGpIoabGYjZZVzZWNUjVraiJyEjzRtHW+Ryb+8Az4qHwyRD5D3kx9MwRfXE58an7R1Z/88DsQ8GEDuW/hwAkhyo3ucRXoO40rGk39/lvexs6JkGE3zKEJsxoejACQhDhlWXTUox9yWa0Fmk=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=lljjPoI6SdvD8GOzzIvTZHMV542gJWVDXF4AErEZ/zw=;
	h=date:mime-version:subject:message-id:from;

PATCH 1 is a small format optimization.
PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
PATCH 3 is to apply the drm_bridge_connector helper.

Damon Ding (3):
  drm/bridge: analogix_dp: Formalize the struct analogid_dp_device
  drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
    &drm_bridge_funcs.atomic_enable
  drm/bridge: analogix_dp: Apply drm_bridge_connector helper

 .../drm/bridge/analogix/analogix_dp_core.c    | 312 +++++++++---------
 .../drm/bridge/analogix/analogix_dp_core.h    |   8 +-
 include/drm/bridge/analogix_dp.h              |   1 -
 3 files changed, 153 insertions(+), 168 deletions(-)

-- 
2.34.1

