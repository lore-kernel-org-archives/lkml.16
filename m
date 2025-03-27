Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDB2155C83
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091299; cv=none; b=kQKp+WZBpYPWE0enCko+UfbE1MYcstieKM9/EnMZR2/o3py9Yklx7S1z7oFZzTmik3HY1UZdT2dbus5QxhUZK/qROV/Jazs0wS6LGFtLW5D1cykUXEqJM0YRbQsskFjI2FMKiNAQpzitLbhmoAMlLgPTlacrarxovs2SdTKDods=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091299; c=relaxed/simple;
	bh=CJMXttHZW24GLFDyoCbAWCoq1dZEZGyrIQbFWrK58xE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HUKg+s63bJMFCMbzF9qorvoj18b3CyLU/g4uXn0nWX1jWMK75ggv6ijQ4Nn/Dj2aN4LgE0rHT5zkTF+TG/Eau511YFjlEb7Nxc4giOO6m9KXXx3wypSNms1z642SlqGpQMM5aj+2i3FAumdD7S2UZaw25CXAKBkk034e+FDUyRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M/KY0KHU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M/KY0KHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743091295;
	bh=CJMXttHZW24GLFDyoCbAWCoq1dZEZGyrIQbFWrK58xE=;
	h=From:To:Cc:Subject:Date:From;
	b=M/KY0KHUFmVKK4tmSBN2loVG7JNRJ3k/k7w0hsaXP7SnT7JlETGy/HDysgq+Yut5i
	 TcR4JmxZvq81fVP7ZfGbGLv5ay4pRq/SUo3ahAALvEi1OThQCPFbPOaOjyha9vWm99
	 gvSywvMBxK8h5uS51ieXU2UTAGmCFsuKo5l2ZUMpYY2wP9F/MkbFFSs9oy75mUwPLq
	 LF37eWprcf6KgpuDLNxw4rso0XDhC6PeFpy2i4UJrVFNvi8GjLPk7qSQ9dxNbmOCPO
	 nxG4RVxsqQtsgytixUMzRpWm0WSGFEcD8yfh1WxMs3TkzKoHmB3wV12Ap6BgFKpBWS
	 NQAMg+YY2I7uw==
Received: from debian.. (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 800C017E091E;
	Thu, 27 Mar 2025 17:01:32 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
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
Subject: [PATCH v1 0/3] drm/ci: Add devicetree validation and KUnit tests
Date: Thu, 27 Mar 2025 21:31:09 +0530
Message-ID: <20250327160117.945165-1-vignesh.raman@collabora.com>
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
https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1390797

Vignesh Raman (3):
  drm/ci: force use of BFD linker
  drm/ci: Add jobs to validate devicetrees
  drm/ci: Add jobs to run KUnit tests

 drivers/gpu/drm/ci/build.sh                | 14 ++------
 drivers/gpu/drm/ci/check-devicetrees.yml   | 38 ++++++++++++++++++++
 drivers/gpu/drm/ci/dt-binding-check.sh     | 18 ++++++++++
 drivers/gpu/drm/ci/dtbs-check.sh           | 41 ++++++++++++++++++++++
 drivers/gpu/drm/ci/gitlab-ci.yml           |  2 ++
 drivers/gpu/drm/ci/kunit.sh                | 34 ++++++++++++++++++
 drivers/gpu/drm/ci/kunit.yml               | 19 ++++++++++
 drivers/gpu/drm/ci/override-ld-with-bfd.sh | 16 +++++++++
 8 files changed, 170 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/ci/check-devicetrees.yml
 create mode 100755 drivers/gpu/drm/ci/dt-binding-check.sh
 create mode 100755 drivers/gpu/drm/ci/dtbs-check.sh
 create mode 100755 drivers/gpu/drm/ci/kunit.sh
 create mode 100644 drivers/gpu/drm/ci/kunit.yml
 create mode 100755 drivers/gpu/drm/ci/override-ld-with-bfd.sh

-- 
2.47.2

