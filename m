Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C45216617
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738743436; cv=none; b=kBSM9CGwFvwq0xRTr5t9xkMjRRYMLaR9KNR2VWY7TPZFZZ9EIX2628hfZRqzIn8nugwUg6dgXVGFI7hq8zIoaqeT5C/t2Skyhv8ukmySbJ9/aE4vvOMd6JvMSvr3tsurcfAMLo0vixk6+Dx6iI+T/qIHWU6aWERbMOOCZ5+5pwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738743436; c=relaxed/simple;
	bh=5pzgqUleGLu1LVcCS6A0NDwS0fzFq+0ef1U3G8sw2uY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BfNYTNgYCQdzWKB8dplk7cyYGMhwO5iE4YAg9PlP8ppQrcGpnFrzqO5RNLXE7nwW6sJgQfdDyebjj6v+PeNP+JfpkkWdhwS8c3VSXk6D7FqK0M+AFJ5ygT54MIQM3wg2QCALohkkZB48CgeSt4FxMDQpolu53sUCDTn+gxnBXXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B9x1gP7q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B9x1gP7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738743432;
	bh=5pzgqUleGLu1LVcCS6A0NDwS0fzFq+0ef1U3G8sw2uY=;
	h=From:To:Cc:Subject:Date:From;
	b=B9x1gP7q5uYFDr5s+zlmpzqgtfaW4a53udI09DNCmRcfXQYmOiYyJ7G+kMt/xjy7v
	 9C4MalyXPg5PnwpBOkdLOXosfXy0ZUT467APVx6aYL2/YVd8LahjAnD6+fz6IcLH6/
	 lCiJxWkcVDhmCOqZw5FUWiznWq3FjeH7O7Be18vwDW012pPp9cojxkEBXEayenfbG2
	 f2cO2nBiwA3vJrE/TNAgG/s3hQLT/lOedRuBgL0yMC803qWoQygI5p/tW6z1/gacR1
	 TDtXxchtdpeP5gbIkKEQCTDsBSpBtbrb47CtyPaQWWNrmE/W7GhLOnQqXe6Nhay2YX
	 cvEALvH6ggGvw==
Received: from localhost.localdomain (unknown [171.76.83.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C613C17E0DD8;
	Wed,  5 Feb 2025 09:17:09 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	jani.nikula@linux.intel.com,
	dmitry.baryshkov@linaro.org,
	mripard@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm/ci: uprev mesa and modify gitlab rules
Date: Wed,  5 Feb 2025 13:46:45 +0530
Message-ID: <20250205081652.1928927-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uprev mesa to adapt to the latest changes in mesa-ci,
including new container jobs and stages. Update the
lava-submit script to align with recent mes-ci changes
for using LAVA rootfs overlays. Modify gitLab rules
to include scheduled pipelines. Also update the
expectation files.

Pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1358207

Link to v1,
https://lore.kernel.org/all/20241128042025.611659-1-vignesh.raman@collabora.com/

Vignesh Raman (2):
  drm/ci: uprev mesa
  drm/ci: update gitlab rules
  drm/ci: update expectation files

 drivers/gpu/drm/ci/build.sh                   |   2 +-
 drivers/gpu/drm/ci/build.yml                  | 104 +++++++++-
 drivers/gpu/drm/ci/container.yml              |  22 +-
 drivers/gpu/drm/ci/gitlab-ci.yml              | 195 ++++++++++--------
 drivers/gpu/drm/ci/igt_runner.sh              |  13 +-
 drivers/gpu/drm/ci/image-tags.yml             |  11 +-
 drivers/gpu/drm/ci/lava-submit.sh             | 100 ++++++---
 drivers/gpu/drm/ci/test.yml                   |  37 ++--
 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   2 +
 9 files changed, 325 insertions(+), 161 deletions(-)

-- 
2.43.0

