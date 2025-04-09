Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86081DDA1E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179379; cv=none; b=rgwe+GKft/65Id6odX5Q2WZshPFelk4GvDSFGKP6C7uwDzPuzG3w4XYIHPIIVo1fZPhrwnApVjy+bphzmHfGTBV14Y5VeBIrT9TedBBz1cNnONdQserN3koPrZb06SYX8AhxCo+yHaxPaZCTcWmuJAAnBceQKGNRQnlGFf/PmZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179379; c=relaxed/simple;
	bh=SLEwkDgEJaXPW5NwtSyzfWo09UnZPy7zaAWdY6GYGu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y8mRTzP/1fEbwwT2/X00dBhyRWhRv20PHLNO1FXxxnjCVgE3J2vGO83ukD+gkpF/4mI85bt51AOMPw9GDMqYHXQJR0IXSJbBs+Jne+syD4WVtwCIi+zAayRJTDOhUtOE24O7PbDa4RBvKV1+LdnOX71uZ5nz40EWEKdhCVeDIbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WMnGRGkg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WMnGRGkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744179375;
	bh=SLEwkDgEJaXPW5NwtSyzfWo09UnZPy7zaAWdY6GYGu4=;
	h=From:To:Cc:Subject:Date:From;
	b=WMnGRGkgSw5pGu6UYtQwxiap9xYtyWx1cRSwbTPRCGaV8eGvTlVdlWQY6sYh5bS1J
	 +Q19vL1nhSiGxZxKbX368HAqLUHr4W+ueXXaGYDXjuiH4bvDotVdErght7852VvBs0
	 /FcibVp7GNd9FUvmJ+4KxqUwbdYVELITSOJK41vAfv8QerjZG3KqCxe099tJFrYCsX
	 b9A84myF1aqDQ56oN/gIDydgih1UZz+bxdMccw0QPMUBQQ85wSWu8ijNcdXJt1TGDu
	 RQkBoSQysv34O6rwLhxJOv/AOGrhS3Z7dyF9byR5Y64epGvviy2zjsKu0dFgxwHMPD
	 P9XHMyVNM2b+Q==
Received: from debian.. (unknown [171.76.83.191])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A27017E0F85;
	Wed,  9 Apr 2025 08:16:12 +0200 (CEST)
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
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/ci: Add devicetree validation and KUnit tests
Date: Wed,  9 Apr 2025 11:45:37 +0530
Message-ID: <20250409061543.311184-1-vignesh.raman@collabora.com>
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
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1400550

Link to v1,
https://lore.kernel.org/all/20250327160117.945165-1-vignesh.raman@collabora.com/

Vignesh Raman (2):
  drm/ci: Add jobs to validate devicetrees
  drm/ci: Add jobs to run KUnit tests

 drivers/gpu/drm/ci/check-devicetrees.yml | 43 ++++++++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh   | 16 +++++++++
 drivers/gpu/drm/ci/dtbs-check.sh         | 19 +++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml         |  2 ++
 drivers/gpu/drm/ci/kunit.sh              | 11 ++++++
 drivers/gpu/drm/ci/kunit.yml             | 32 ++++++++++++++++++
 6 files changed, 123 insertions(+)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml

-- 
2.47.2

