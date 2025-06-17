Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985611F874C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164626; cv=none; b=Uo8PABWh1Bdk3caUrcJrPx3e40FNYY0VJUODBan2Z0uHBV8VHsZ5+er7IlINaD0TitNWYCp2Gwn3B1/F0zsh+OYbIoO+cAD4C3FbCBf6qHtJc0/SaicAa0VMd60I14CaHskAw6rh1kLl5A+PbfQDaE0YxvNAVtocaKtStJXgGVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164626; c=relaxed/simple;
	bh=osVfOCjch1KfCwjm+XC22vBYF85A65ScdHNH0mGcPEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lk0gRYBub95VJ9v5ErTUh27JBitzFVs1vWN/DCh2jAa6VqsKhRM5d6vlP09wbQ6iREV4QYL5ZTx19IfIamfJSubulmHC9ubREj6glw3KGkPlRkuj9Uexw51kNjHQPRb+iV1rjgc0nYsH42y1u1PJum1rtv5XF0lOwxbhSZcQ2Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=GA7/1iJL; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="GA7/1iJL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=O2OFhfn/1VI9M++uzWjDUIjHLZVYB0R/5cmHbOXDhAI=; b=GA7/1iJLvjBp52WPEbJNxdN9mA
	+P8N9bdC9zXlBd2OUXUjZrOGwNd5gNdEsjrDvWbrywDjwuzpmFZlgodNw8mF1zUQ1/F7SaN2ZZ59F
	b1G3JEGo8U4HNhrdlihKbSng91JKKX0svXDfEs4U8FL4zW+/D5s5oC8al+dgq6EnflLQLcsEhAirI
	LI+sHGjGLXEfIbuvnEnK4OwRzrAWExY6lRxu0JyFwgxYKcwVirR/zwzJntjW1B4I1JFwhWzxRfWVU
	2r1/FViBKTLhMtNQ4aVNPsxUwVlvpjDYPJiE8JPpGPWbWZso0u5lSuSxgAH/471ll9tR2EI4a6yMc
	cSCF4Khw==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uRVlI-004ans-Od; Tue, 17 Jun 2025 14:50:01 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	siqueira@igalia.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	"Raag Jadav" <raag.jadav@intel.com>,
	rodrigo.vivi@intel.com,
	jani.nikula@linux.intel.com,
	Xaver Hugl <xaver.hugl@gmail.com>,
	Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v9 0/6] drm: Create a task info option for wedge events
Date: Tue, 17 Jun 2025 09:49:43 -0300
Message-ID: <20250617124949.2151549-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset implements a request made by Xaver Hugl about wedge events:

"I'd really like to have the PID of the client that triggered the GPU
reset, so that we can kill it if multiple resets are triggered in a
row (or switch to software rendering if it's KWin itself) and show a
user-friendly notification about why their app(s) crashed, but that
can be added later."

From https://lore.kernel.org/dri-devel/CAFZQkGwJ4qgHV8WTp2=svJ_VXhb-+Y8_VNtKB=jLsk6DqMYp9w@mail.gmail.com/

For testing, I've used amdgpu's debug_mask options debug_disable_soft_recovery
and debug_disable_gpu_ring_reset to test both wedge event paths in the driver.
To trigger a ring timeout, I've used this app:
https://gitlab.freedesktop.org/andrealmeid/gpu-timeout

Thanks!

Changelog:

v9:
 - use `if (task)` instead of `if (ZERO_OR_NULL_PTR(task))` at
   amdgpu_vm_put_task_info()

v8:
 - New patch "Allow NULL pointers at amdgpu_vm_put_task_info()"
 - Dropped inline for amdgpu_vm_print_task_info()
 - Code style changes for "Create a task info option for wedge events"
 - Drop check before calling amdgpu_vm_put_task_info()

v7:
 - Change `char *comm` to `char comm[TASK_COMM_LEN]`
 - New patches to encapsulate struct drm_wedge_task_info inside of struct
   amdgpu_task_info
 - Remove struct cast for struct amdgpu_task_info, now we can use `info =
   &ti->task`
 - Fix struct lifetime, move amdgpu_vm_put_task_info() after
   drm_dev_wedged_event() call

v6:
 - Check if PID >= 0 for displaying the task info
 - s/app/task in a comment

v5:
 - Change from app to task also in structs, commit message and docs
 - Add a check for NULL or empty task name string

v4:
 - Change from APP to TASK
 - Add defines for event_string and pid_string length

v3:
 - Make comm_string and pid_string empty when there's no app info
 - Change "app that caused ..." to "app involved ..."
 - Clarify that devcoredump have more information about what happened

v2:
  - Rebased on top of drm/drm-next
  - Added new patch for documentation

André Almeida (6):
  drm: amdgpu: Allow NULL pointers at amdgpu_vm_put_task_info()
  drm: amdgpu: Create amdgpu_vm_print_task_info()
  drm: Create a task info option for wedge events
  drm/doc: Add a section about "Task information" for the wedge API
  drm: amdgpu: Use struct drm_wedge_task_info inside of struct
    amdgpu_task_info
  drm/amdgpu: Make use of drm_wedge_task_info

 Documentation/gpu/drm-uapi.rst                | 17 ++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 13 +++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       | 11 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 22 ++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  6 +++--
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c        |  5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c        |  5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c        |  5 +----
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c         |  4 +---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c         |  5 +----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c      |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c   |  8 +++----
 drivers/gpu/drm/drm_drv.c                     | 21 ++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_reset.c         |  3 ++-
 drivers/gpu/drm/xe/xe_device.c                |  3 ++-
 include/drm/drm_device.h                      |  9 ++++++++
 include/drm/drm_drv.h                         |  3 ++-
 22 files changed, 102 insertions(+), 52 deletions(-)

-- 
2.49.0

