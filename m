Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF9021ADB5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576019; cv=none; b=DlZI30VIBrpEUh20fy4KxEp38OZvKxUQBcPMZMU/lQRLHFwShLPaoypGf8heENApxtu2T8jKkKjZ4+WixdlGOsqsDCpIu1eVZ31d9MOTydkRPGjBLKckN9Ey+q1ZOtGmakJsG5RLVhYIbYTUU56VofEHBCgl+3dAfnCcExUz5vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576019; c=relaxed/simple;
	bh=MzhB8SgpO91E94cGPaUZXDiJCZRh8U3Yn6qnM9Wvq5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i0wz7vVm2djGSxdprH1VJ1YCvXX3Wd2TDs4r3ETEfBDE5RrT+GObng0QYQHewxHbRYr+cFUF8yUSbtOs9W/l8VV1YB8e9pwrpyM+fbJ1hJlImCSfLRAJLfKXiG9NI+fWY3Y2vauzx1d2xiSQPGS7ssqql/O7JY+H9/5mVI3Ft0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nnxA36hi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nnxA36hi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751576015;
	bh=MzhB8SgpO91E94cGPaUZXDiJCZRh8U3Yn6qnM9Wvq5g=;
	h=From:To:Cc:Subject:Date:From;
	b=nnxA36hiHrNJo1j5cIfU+mxZubuP2518ohigVkwP/vIK2h5cQwSz3li5FcgJnehOT
	 DKvz+GrrfuNAuYfD6NQNSRPX6VknUlwFyTATwe8wlrPwwWuypzwShCAXvwqlyYA0w4
	 NtWRd6klBn7AS/W0u0MeDVmPV9q6NnS6QBJxwO2wS4N7jWACA5KsuA/WO3BNsVZBSE
	 EskIiDwcptrrfUuWOeMc1fTf0vSLxXtp6/JH2eLo0kKvdUwQSXWpMk8Q7jA/YMPkNf
	 RtsyvvG7h5emqXZffvMwroQi5Yhs1s9+CDUZm4tN8vIaAW7/XYJCqivJEI13I0VH4e
	 rQgFrzmCt7SXw==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [90.168.160.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nanokatze)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B028117E0B1E;
	Thu,  3 Jul 2025 22:53:33 +0200 (CEST)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
	"Maxime Ripard" <mripard@kernel.org>,
	"Thomas Zimmermann" <tzimmermann@suse.de>,
	"David Airlie" <airlied@gmail.com>,
	"Simona Vetter" <simona@ffwll.ch>,
	"Frank Binns" <frank.binns@imgtec.com>,
	"Matt Coster" <matt.coster@imgtec.com>,
	"Karol Herbst" <kherbst@redhat.com>,
	"Lyude Paul" <lyude@redhat.com>,
	"Danilo Krummrich" <dakr@kernel.org>,
	"Boris Brezillon" <boris.brezillon@collabora.com>,
	"Steven Price" <steven.price@arm.com>,
	"Liviu Dudau" <liviu.dudau@arm.com>,
	"Lucas De Marchi" <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	"Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Asahi Lina <lina@asahilina.net>,
	Caterina Shablia <caterina.shablia@collabora.com>
Subject: [PATCH v3 0/7] drm/panthor: support repeated mappings
Date: Thu,  3 Jul 2025 20:52:52 +0000
Message-ID: <20250703205308.19419-1-caterina.shablia@collabora.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds OP_MAP_REPEAT flag, which lets the user map a BO
region over an address range repeatedly with just one map operation.

Sparse resources in the Vulkan API let the user leave regions of a
resource unmapped (from the API perspective.) Accesses to such regions
must not result in program termination, but loads produce undefined
values.

To implement this feature on Mali hardware, Vulkan sparse unmap is
implemented by mapping the specified region to a "dummy bo" so that the
accesses do not fault. A newly created sparse resource starts off
unmapped, and therefore also has to be mapped to the "dummy bo".  This
"dummy bo" is small (a page size) in comparison to the sizes of va
ranges that we might want to map to it, and a large number of vm_bind
ops can be necessary. For example, if the user were to create a
100e6-byte sparse resident resource, we'd have to poke VM_BIND with
ceil(100e6/0x1000)=24415 map operations.

OP_MAP_REPEAT addresses this particular inefficiency by letting us
implement a single Vulkan sparse unmap operation and sparse resident
resource initialization with just one map operation.

The panvk changes making use of this uapi can be found at
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35287

No changes in v3.

Changes in v2:
- Make panthor use this stuff.
- Make it possible to express a repeated mappina of any suitably sized
  and aligned range of a BO, rather than strictly the page size -sized
  prefix, generalizing the API. Rename DRM_GPUVA_SINGLE_PAGE to
  DRM_GPUVA_REPEAT.
- Clean up parts of drm/gpuvm affected by these changes.

Link to v1: https://lore.kernel.org/lkml/20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net/

Asahi Lina (2):
  drm/gpuvm: Add a flags field to drm_gpuvm_map_req/drm_gpuva_op_map
  drm/gpuvm: Add DRM_GPUVA_REPEAT flag and logic

Boris Brezillon (5):
  drm/panthor: Add support for atomic page table updates
  drm/gpuvm: Kill drm_gpuva_init()
  drm/gpuvm: Pass map arguments through a struct
  drm/gpuvm: Add a helper to check if two VA can be merged
  drm/panthor: Add support for repeated mappings

 drivers/gpu/drm/drm_gpuvm.c            | 182 ++++++++++++++++++-------
 drivers/gpu/drm/imagination/pvr_vm.c   |  15 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 +-
 drivers/gpu/drm/panthor/panthor_drv.c  |   3 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  | 154 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c             |  13 +-
 include/drm/drm_gpuvm.h                | 101 +++++++++++---
 include/uapi/drm/panthor_drm.h         |  23 ++++
 8 files changed, 408 insertions(+), 94 deletions(-)


base-commit: 026a60e3c1c55845bd9fdaa202dad81c3f95ae6b
-- 
2.47.2

