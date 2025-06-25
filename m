Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AF21E834E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750834128; cv=none; b=cDRsuC1b5dUc7tkuKcfmVLfEhwXdp4JtY5Hu49uQSC1RtisZUlismmwARjJ6lUmRHVFen4fxPgJdY96Fp6FjyX4rOEuU59UWZQP3l7fqbR8n8+ySxr3YpmtfTsO2qdfAVY3ywSViL3Qbh819VWChcZ2JivnNkEVfDzsnmFYn8bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750834128; c=relaxed/simple;
	bh=mnHiCoeOkHxSowu4uwieuqANpZ5X2UYKIGE3kSysyVc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=a4GZJrr7zlVJfxoLyfrPFGhlC8A1QDk4emCYWyoIBnX/9y+6+OEphk5sr7BmC4PWfdDNEJlSt5ym/rShYEj/8VfHpohJhMFPYzSof9Z/T5x3lI/4yf4QKeeZSlfy6Qwjoez4xcEpQkiJR7qzi5bq1qR4ImUwVNPMQHprxE3+0do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvypccSN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvypccSN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B78C4CEEA;
	Wed, 25 Jun 2025 06:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750834127;
	bh=mnHiCoeOkHxSowu4uwieuqANpZ5X2UYKIGE3kSysyVc=;
	h=From:Subject:Date:To:Cc:From;
	b=mvypccSNI/8j4QTjjK6T+luyXYzxmTwrRROr4OeKCmyR3s6GK1Rjzy02u1DUhOcAW
	 5pA6adL6eCuKsn0m9LUsSTkgqfE3xee/ZM0IAtcMTWUbIkjhVf6ONOGSX6lbmsLLIk
	 sTcHXbWeSkPHJJ+bTRP0Lcfh3FplOKPO+cDK7/0jDzrmta3KpzGZ0/Jkn306vgwGTa
	 bmSkmD6WC7aRKrSq5qyZK54XssnV9PN4WH3wcgQWT2+okxUqLGi1vpCL52kzdXVdz+
	 zjG8RKEzahRPMqBOTLGSz1f89/DDFtTDpDu64xE8WkjbXTUhXLxZZ8xDyxrDCxhSp3
	 6xQx/9U5ZUhoQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Date: Wed, 25 Jun 2025 08:48:37 +0200
Message-Id: <20250625-drm-panel-simple-fixes-v1-0-c428494a86b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMWbW2gC/x3LSwqAMAwA0atI1ga0/qpXERfVRg1oLQ2IIL27x
 eVjmBeEApPAkL0Q6GbhyyWUeQbLbtxGyDYZVKGaolU12nCiN44OFD79QbjyQ4LGdqvWc28qpSH
 NPtAf0jtOMX48ivjfaAAAAA==
X-Change-ID: 20250624-drm-panel-simple-fixes-ad7f88b9a328
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120; i=mripard@kernel.org;
 h=from:subject:message-id; bh=mnHiCoeOkHxSowu4uwieuqANpZ5X2UYKIGE3kSysyVc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnRs0/yCNRoLzu1t6jMieUCq/TiT+mT+hsZH969GOe/j
 2tKMl9yx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiISiljw/Ge6ao79pqfFHvr
 7thox8w41+8V904u43bXJ3l3Igrdfs8J2mY+66rhysm7/mT1W5RNZaxT+nlAdSVD2FZ+DsHU6Jc
 by2w2JJjdqdX5PjlDa84LPZFFBvGTOe5ur/lqmJ/nE8W+3AYA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

Here's a series fixing (hopefully) the panel-simple regression for
panels with a panel-dpi compatible.

It's only build tested, so if you could give that series a try
Francesco, I'd really appreciate it.

Thanks!
Maxime 

Link: https://lore.kernel.org/dri-devel/20250612081834.GA248237@francesco-nb/
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (5):
      drm/mipi-dsi: Add dev_is_mipi_dsi function
      drm/panel: panel-simple: make panel_dpi_probe return a panel_desc
      drm/panel: panel-simple: Make panel_simple_probe return its panel
      drm/panel: panel-simple: Add function to look panel data up
      drm/panel: panel-simple: get rid of panel_dpi hack

 drivers/gpu/drm/drm_mipi_dsi.c       |   3 +-
 drivers/gpu/drm/panel/panel-simple.c | 131 ++++++++++++++++++++++-------------
 include/drm/drm_mipi_dsi.h           |   3 +
 3 files changed, 86 insertions(+), 51 deletions(-)
---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250624-drm-panel-simple-fixes-ad7f88b9a328

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

