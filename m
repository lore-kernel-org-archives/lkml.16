Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398AA21B1AB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747692270; cv=none; b=Ow+617FOtojFys2DmXgJuIs213qpoNmqFN5LwKToilO30YiUyrHzcmax0eaZ+M8IoVVmMQlodyY06FlXHYlmQbAUXbLE2KAoX0uBQhMk1XACFJaWWcC76bM8Vh9Oii6l7yTLxpP90oqWa/35d4R/erdPDqiHlX7GQ1faThFE9ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747692270; c=relaxed/simple;
	bh=HlmIc8bI750/Ow/G5gxuX1VpMMuiThmZhxr9htrLJfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZlUjE8iZeQdTQvxf3yiBVbAOG6pQwDcOkNXvIvXBhdQ+Y8klWUriugmSaRv47dL842kkPm5dgXHrfZjJreFlR8SyeJcdTnYb/HMmyUZbvbLsIAtWZtP04qYSsND/FBkSZkuL2lKvlPBVM/kRULtxoB279zShbohDLRvW+cOyPqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=iu/fAhda; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="iu/fAhda"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=UOWP6M8I0SgDLfsLJUHYEe9np38WUuM8ybuUNNbXhoE=; b=iu/fAhdaDqHRM3z3I/gei++ZkT
	6S1epoLZnXQKB28KtSKC1t4KXHCbPtzoyT93bI8hEFzWrMy617ls2DhN2FpgdOdR8zNNki2z3nhFQ
	Oi0tJDIKC4M4OnPVba63r9UR45iQ4hZaHlxQtgEt2D/kl+T692kVwtUR4w70llJltZTkTL3grldwA
	RCXPYqAEnhQGKhx2rzYp5ecnHiRdfedhKsMq2hVbWHZoJmz7Gn5ITW7qg36fPhaNe9I6nvKXQKk3T
	uOJRiV8VmOFBpuICWAMj4a+K2s+z91LMBe/PVCjXgpX/STMTmZl2EGOFmFRpkiVRGHzzxLgYSGCe7
	tQgZe1vQ==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uH8ag-00AQwj-2T; Tue, 20 May 2025 00:04:10 +0200
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
Subject: [PATCH v4 0/3] drm: Create an app info option for wedge events
Date: Mon, 19 May 2025 19:03:29 -0300
Message-ID: <20250519220333.101355-1-andrealmeid@igalia.com>
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

André Almeida (3):
  drm: Create an app info option for wedge events
  drm/doc: Add a section about "App information" for the wedge API
  drm/amdgpu: Make use of drm_wedge_app_info

 Documentation/gpu/drm-uapi.rst             | 17 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
 drivers/gpu/drm/drm_drv.c                  | 16 ++++++++++++----
 drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
 drivers/gpu/drm/xe/xe_device.c             |  3 ++-
 include/drm/drm_device.h                   | 11 +++++++++++
 include/drm/drm_drv.h                      |  3 ++-
 8 files changed, 68 insertions(+), 10 deletions(-)

-- 
2.49.0

