Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2892367A6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668671; cv=none; b=I8OocmNg801cRqt4Zc0I1CJGHhgxKGd+e3IsdZ6ARqbWiKPR1eSpmGBMSb/ee8tgaf9G/WbXniP7z+ZX1oksaZCcZICforntwqsUkVIbEL7gPtx1QsCSjXrGi7DOkfO+ufCs0DmSHHANn8LJn8w5jCkVK5StGEPpz3+xGxeb7jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668671; c=relaxed/simple;
	bh=+dyykSKpkvAg1cHrSs79NNyyF4y8YNApu5EJxpATbO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5HazpBacIQ1FQJJci1g22Lndi7Cn0EiOWFAniWz7Btf+Laf7ddvZpX50iQom2DY0k9acMEL1s00mDl9biBmDfzA2w1nnUqCkUzlP656mq3dwRKQSa+imbxPfXeit9057G64y43oYiQLn0xkIIsgkj9HbskotiRRu2VQEBRUshA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Nw4EAU7C; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Nw4EAU7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750668667;
	bh=+dyykSKpkvAg1cHrSs79NNyyF4y8YNApu5EJxpATbO4=;
	h=From:To:Cc:Subject:Date:From;
	b=Nw4EAU7CFQonoVgTc0cjbGdIeOE5CEJA0kHu40whVXl4H9hnPxs9xjLT5GzltAZ8Z
	 MwYLkul8+HL6oJkRlrcphhDVQyA0NIdl4kZi+9x0LNVdIHCTttG6MznvsC7kZHqNk2
	 6809ieKwKVP03rPQcgog2ERXPyUzDTjY3429AgMW2e1+2IF+Lqo0x6Jr35R4E4LMst
	 Ma6fagq1XfoG40RJDNh+ZbHmeTiNPcz3IHjst5zbnapg5jeGzH8zhV2N30lb3GpIKP
	 6Saj8VMJEAATaQ07RgJa3MCNf7wFlw1HK1Iio8ylYesHaEAYQfm2bRtS4jV+uqOmNp
	 cjkR4pBlHETJA==
Received: from debian.. (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 52F9D17E0CE6;
	Mon, 23 Jun 2025 10:51:04 +0200 (CEST)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	daniel@fooishbar.org,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	robin.clark@oss.qualcomm.com,
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
Subject: [PATCH v4 0/2] drm/ci: Add devicetree validation and KUnit tests
Date: Mon, 23 Jun 2025 14:20:26 +0530
Message-ID: <20250623085033.39680-1-vignesh.raman@collabora.com>
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
https://gitlab.freedesktop.org/vigneshraman/msm/-/pipelines/1455734

Link to v1,
https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/

Link to v2,
https://lore.kernel.org/all/20250409061543.311184-1-vignesh.raman@collabora.com/

Link to v3,
https://lore.kernel.org/r/20250417030439.737924-1-vignesh.raman@collabora.com

MR,
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/173

This series depends on,
https://lore.kernel.org/all/20250514050340.1418448-1-vignesh.raman@collabora.com/
https://gitlab.freedesktop.org/drm/msm/-/merge_requests/169

Vignesh Raman (2):
  drm/ci: Add jobs to validate devicetrees
  drm/ci: Add jobs to run KUnit tests

 drivers/gpu/drm/ci/check-devicetrees.yml | 50 ++++++++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh   | 19 +++++++++
 drivers/gpu/drm/ci/dtbs-check.sh         | 22 +++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml         |  4 ++
 drivers/gpu/drm/ci/kunit.sh              | 16 ++++++++
 drivers/gpu/drm/ci/kunit.yml             | 37 ++++++++++++++++++
 drivers/gpu/drm/ci/setup-llvm-links.sh   | 13 ++++++
 7 files changed, 161 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml
 create mode 100755 drivers/gpu/drm/ci/setup-llvm-links.sh

-- 
2.47.2

