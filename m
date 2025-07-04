Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB63324F1A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=165.204.156.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615838; cv=none; b=WnIPSy9CjuDcrjl0zpAFX5p9MmIEU8e3WWwss/uK5fZsmhBpqXwdAOmVzzQJTpRSBVLfj4IP2LgeDMKwQvv3SF9ADOICUjGU5LjHaIhI+3DrrDZTL3wWwY0/hJFcwA7YyYdB88Wm/QGfhpn/gKbFKdoVIudMZ57nDgkCU6OGVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615838; c=relaxed/simple;
	bh=rsCtpxapV2C9Pg1CGlR6spjCYIp/YQr9UlcMbxGD8vM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BDYJnFFXcYdm9LNmr/sduOK5w3CHpy7bvZy2hb9Nsa0AGTkrxayQ6nf8nCMoEUo0pfI4Jd/Mzsr8HaRSRywsf9mHVqTDvBV3QqArrMReLSQB9rd4tnAHX814s5kvi5vWcKoehtlPvdJsrQ/N+ZW9b8EQeC+1jwO9a30Ej/kINQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com; arc=none smtp.client-ip=165.204.156.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=rtg-sunil-navi33.amd.com
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id 5647uUeo1550148;
	Fri, 4 Jul 2025 13:26:30 +0530
Received: (from sunil@localhost)
	by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 5647uQA01550123;
	Fri, 4 Jul 2025 13:26:26 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
        tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org,
        linux-kernel@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v10 0/4] Enable debugfs information based on client-id
Date: Fri,  4 Jul 2025 13:25:44 +0530
Message-Id: <20250704075548.1549849-1-sunil.khatri@amd.com>
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

v10: rebase patch 1 and patch 3 on the drm-misc-next. In the process
move the drm bridge code to have access to drm root node for patch 1.
for patch 3 remove drm_file from amdgpu_vm_init and call the vm debugfs
function directly before calling the amdgpu_vm_init

Sunil Khatri (4):
  drm: move drm based debugfs funcs to drm_debugfs.c
  drm: add debugfs support on per client-id basis
  drm/amdgpu: add debugfs support for VM pagetable per client
  drm/amdgpu: add support of debugfs for mqd information

 drivers/accel/drm_accel.c                   |  16 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  52 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.h |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c   |  52 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h   |   1 +
 drivers/gpu/drm/drm_debugfs.c               | 118 +++++++++++++++++++-
 drivers/gpu/drm/drm_drv.c                   |  16 +--
 drivers/gpu/drm/drm_file.c                  |  11 ++
 drivers/gpu/drm/drm_internal.h              |   6 +-
 include/drm/drm_accel.h                     |   5 -
 include/drm/drm_debugfs.h                   |  11 ++
 include/drm/drm_drv.h                       |  19 +++-
 include/drm/drm_file.h                      |   7 ++
 14 files changed, 273 insertions(+), 44 deletions(-)

-- 
2.34.1

