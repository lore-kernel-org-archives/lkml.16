Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAFA126BFA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743494050; cv=none; b=Be7kxId0T4kPsFdw/qYIP8OC2J/SP5foKwuw3aLlv+o9xfl0zCV7zEeW575grxwqIA79Ly+u4rO+iJreGPrCgYjmciDeAxlFMA20vRGULvfkCqIYZpXJ++koel8cMMZuFt0UrGcTC+O5zQ7YvIb3rfwqSYnDPF/fAfUsb3sqzNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743494050; c=relaxed/simple;
	bh=LP3b15IRlpCPLwb6oO8pnHVW44JCkcP1KqMqvoLVt8A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KWVoRWKrwD/d0FhKr2oq8WlaeH8wI5+8NhUWkysRQSkkonPvNEKu4uor6Fl3gpkpSvlO14ri3hx/0TD3OEOmz8wjfcleoe941U29sL6C+dYjV/I/5tpetN2HeKcd8b0TCn2sLfbmiyEHNV8C8OdJUzUxik0CojUrtyBKCSb7OEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAhdre+k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAhdre+k"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9592C4CEE4;
	Tue,  1 Apr 2025 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743494049;
	bh=LP3b15IRlpCPLwb6oO8pnHVW44JCkcP1KqMqvoLVt8A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gAhdre+k58gGWMBJrHlHd+2fNXWiI/OmxrsRxfqujeLma3PwYQL7AcjrvxpXByky9
	 l5MZlrWZXSy2JtzfUx8I5EzJSKbKcJ8u5rMJ27rjJtrC/g8BrfG+f2m424K1s9Vrbk
	 WoVEDF5n4L1koEK9frCiwJLOQp5fGG+RoeserBoha0egT88BUMOY8kHC6EdmgGWuiM
	 kx0MNtigGb74LkX8tG92i3CfvaATdtXSET4uXKpg+gJbGltIqjYqP2Zo7YfR+I90b8
	 QULeFP/PtJoRU9QwPbUi1/0ikZCLhEO5mo1Z+QyDJxu7dhXKNzyB6Q1odgK/dFg6KS
	 fzbdCfTaXS6Ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B4AC36014;
	Tue,  1 Apr 2025 07:54:09 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v3 0/5] drm/bridge: it6505: fix DP link traning and improve
 compatibility
Date: Tue, 01 Apr 2025 15:54:54 +0800
Message-Id: <20250401-fix-link-training-v3-0-7f60f2ab7b8c@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM6b62cC/22NOw7CMBBErxJtzUb+Q6i4B0oRGSdZATayLQOKc
 ndMaCnfaObNAslFcgmOzQLRFUoUfAW5a8DOg58c0qUyCCY044LjSC+8kb9ijgN58hMqw1WnVae
 M1lB3j+hqaXOe+8ozpRzie7so4pv+bFKYP7YikOFeG3uQzIyasRNl19pwb/MT+nVdP1qohU2zA
 AAA
X-Change-ID: 20250121-fix-link-training-461495494655
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743494115; l=1714;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=LP3b15IRlpCPLwb6oO8pnHVW44JCkcP1KqMqvoLVt8A=;
 b=hOHci6erGeiK2XIgs8hBQ/43rZThwuHNpxAa4C+6/Zhy4ag1h+NIgmyklNI3DNvCspQjzmAJM
 GgMoWBE6Is4A/dxTd/zEfAbesW0/R/9nq8fmI1fVKl0X+MKUMS1bQWW
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

IT6505 supports HW auto link training which will write DPCD and check
training status automatically. Some DP device can not pass
HW auto link training and must set link training step by step.

when HW auto link training fail, it may trigger video FIFO error,
and link training process will reset to beginning, and never try
step training method.

Modify training method improve compatibility to these DP devices.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v3:
- Patch 1/5 : add commit message for detial about changes
- Patch 2/5 : fix lost variable struct device *dev;
- Patch 3/5 : keep changes and remove refactoring
- Patch 5/5 : merge condition "it6505->step_train_only" check form if condiction into for loop.
- Link to v2: https://lore.kernel.org/r/20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw

Changes in v2:
- 1. Split [PATCH 1/3] into 3 commits
- 2. Drop non necessary variable auto_ttrain_retry
- Link to v1: https://lore.kernel.org/all/20250318-fix-link-training-v1-0-19266711142c@ite.com.tw/

---
Hermes Wu (5):
      drm/bridge: it6505: fix link training state HW register reset
      drm/bridge: it6505: check INT_LINK_TRAIN_FAIL while link auto training
      drm/bridge: it6505: modify DP link auto training
      drm/bridge: it6505: modify DP link training work
      drm/bridge: it6505: skip auto training when previous try fail

 drivers/gpu/drm/bridge/ite-it6505.c | 88 +++++++++++++++++++++----------------
 1 file changed, 50 insertions(+), 38 deletions(-)
---
base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
change-id: 20250121-fix-link-training-461495494655

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


