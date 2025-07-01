Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B827EFFD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=165.204.156.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751388629; cv=none; b=kwiK/cwwjjhSateu1VoURgBsbvISNQhWcyRM4Zp2HSucWbVJsI1CQDHYEDbHvSnRgmx5Ew+mu/jV9qEM9DEj+qUNSKeT2BBXPfQKMZ++ZhPIvAeUWPjmVF+j1OEOm4KMm4NON487BKdsPsbFjdGTloRVMf0W2X3VQTWsN5hwUfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751388629; c=relaxed/simple;
	bh=hNReecMWLCmLLEiX14z2dIz6QHr9N+PeUUkjlhNgDHs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fjec8PXvnImkOqysv/JOxIPk+8Lrd4TxPkaSb0E7vR2shA70RA3d/cAwN4Q77wsUy3G+mK2Lz5uv5HpRJp/nmx+hSbM91R5EVXeuPPYz3ym6rbgsscb3ufD+6uYrp9RrG7FsIEMqbJteKnLAAxKyztBs7AFb8B0nMlAEF81Rlio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com; arc=none smtp.client-ip=165.204.156.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 561GnrNp008154;
	Tue, 1 Jul 2025 22:19:53 +0530
Received: (from sunil@localhost)
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 561Gnokr008135;
	Tue, 1 Jul 2025 22:19:50 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
        tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
        linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v9 0/4] Enable debugfs information based on client-id
Date: Tue,  1 Jul 2025 22:19:44 +0530
Message-Id: <20250701164948.8105-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

client-id is a unique id across the system no matter if its from a VM
or on a host system. This unique id is a good base to use create
client-id based dentry in debugfs in the root directory.

This directory could be a unique directory where drivers could dump
the debug information.

For amdgpu driver, we want to dump the VM PTBASE address and MQD for 
userqueue which can be used by a tool like amd umr to dump the memory
and that is really important to debug userqueues and VM related issues.

One of the challenge in this how to access the root directory which is
beyond the drm_device hence moving the debugfs related information to
drm_debugfs.c 

Sunil Khatri (4):
  drm: move drm based debugfs funcs to drm_debugfs.c
  drm: add debugfs support on per client-id basis
  drm/amdgpu: add debugfs support for VM pagetable per client
  drm/amdgpu: add support of debugfs for mqd information

 drivers/accel/drm_accel.c                   |  16 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  52 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c   |  52 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h   |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |   4 +-
 drivers/gpu/drm/drm_debugfs.c               | 113 ++++++++++++++++++--
 drivers/gpu/drm/drm_drv.c                   |  14 +--
 drivers/gpu/drm/drm_file.c                  |   9 ++
 drivers/gpu/drm/drm_internal.h              |   6 +-
 include/drm/drm_accel.h                     |   5 -
 include/drm/drm_debugfs.h                   |  11 ++
 include/drm/drm_drv.h                       |  14 ++-
 include/drm/drm_file.h                      |   7 ++
 16 files changed, 265 insertions(+), 46 deletions(-)

-- 
2.34.1

