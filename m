Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07418EAE7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 03:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744859253; cv=none; b=TGz5SXmiKofCIQefSnRLio5pOPOq4u/Ti+CaROBWiV23BtJ0ioY+zkFMxQeSU1m5dHuXh6vt6Bgusmi1g2/2oi0Cd/VFOOcSZVhKCHZRocLzZDBWhgLGwZhyM0O9KogNvypqiihrj+gL3HXQqLcPdSyrZHzzOAhh2ptYerUvIp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744859253; c=relaxed/simple;
	bh=mDpkobhoQL4PNWXT29qGY/yyCO1zlsm9Sut3uliZO2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EBtgwmphrwh2qvLfFl1S/LLzpOXcTxz25aZ7VcO6o0keB7Qt5tk0zM/I0lywGDW7O5RnUnAI+qCIrDr+ZjAlXmblfaxPmcWQdyo//g/rnGCanVUcg7xEqohADjY8pg99e2BPE4BuMhnM5THyK22YsAhzJJzEsoHydHPQ3LQqaYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LcSpYXOi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LcSpYXOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744859248;
	bh=mDpkobhoQL4PNWXT29qGY/yyCO1zlsm9Sut3uliZO2A=;
	h=From:To:Cc:Subject:Date:From;
	b=LcSpYXOiGuV2lTL04sauyoVZLjh9NMil0IKqqwF7+D4CyBvJ8jZ0VjpiUu1vkx2RI
	 WUy+6jBSbtVhAj7Qkre8ogw47dx28gj75CeUdaZLaACk86pG36xvcOMrjbwDIiORSV
	 SvxhNlZ9Unzu3PC4tp7S8NwzNfufQBmXiVq0o6k56y42tOF3Io/uY2JdfZxWUVjtue
	 dJWRx9YCyYFD5y2qGUvlzbztTZnEvdIHcDbxROA2j71ULZryx/L/HEwLzCjHLYZL0Q
	 3bc2fPvwF9xjAtsPfmQuDQKNS9o+w43C3j/8TjhFf30/QYCs+19cogWfUb+qRenumh
	 64/1KqrAnDSGw==
Received: from debian.. (unknown [171.76.80.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4C7F117E0CA7;
	Thu, 17 Apr 2025 05:07:25 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	daniel@fooishbar.org,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] drm/ci: Add devicetree validation and KUnit tests
Date: Thu, 17 Apr 2025 08:34:33 +0530
Message-ID: <20250417030439.737924-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add jobs to validate devicetrees and run KUnit tests.

Pipeline link,
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1407489

Link to v1,
https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/

Link to v2,
https://lore.kernel.org/all/20250409061543.311184-1-vignesh.raman@collabora.com/

Vignesh Raman (2):
  drm/ci: Add jobs to validate devicetrees
  drm/ci: Add jobs to run KUnit tests

 drivers/gpu/drm/ci/check-devicetrees.yml | 44 ++++++++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
 drivers/gpu/drm/ci/dtbs-check.sh         | 19 ++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml         |  4 +++
 drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
 drivers/gpu/drm/ci/kunit.yml             | 33 ++++++++++++++++++
 6 files changed, 127 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml

-- 
2.47.2

