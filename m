Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3531DF991
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841626; cv=none; b=Pe6Wemsr2linYxK1dB7PCNG98IWSFFd3i9kM2u2GmWQJDIXVUhmkcxWm+sNOjN5QyLDyseJkGELCE67/nVfCgQ5aSmNHWGsQjY7ZtpKicW1KC15QCNCjRcWHQCmCUtsH+v6XWuNHkKGbZkA/7IyYEW0F3E1teRAhQbHuqu3D02g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841626; c=relaxed/simple;
	bh=5Ylwxsagy9BcuU2JAYZnrJJd1vvmF0pXj6e9cT0jGr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eqPld2YkAel1NRZSxBwOb53LPoOFM0OGrMWqKJ5DUAExh4HCoC/GkQQjczPkJVdyh8si9m4kFA83NEkboQqXGCLZer2u4ToVLpdnvLtCurA7ra7FqggZU/5K3lRyRmnecLvCalvSkyxKJFQQkAmrpTeNd2VC3ks32CF7IvPlgxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lb2CmwKn; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lb2CmwKn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=abrAL0/TmomWhVV9asJAZc8JhxAb/961Ch2hqbhx6As=; b=lb2CmwKnx2eS2jnhcYoUWprObj
	/urVEMzdjsaeYE0J4u7cpE/vcd6kZ4Gn0axKBkUJn78LqVGrtu46HKlZmWqWBsnfBpmW3SnvVlTgH
	8wJDyHAKWOBupWN4AZwOkG6P1+I6sGtgUHRJ8bSCN1jDUyNVHO4C0nl5p+QBAAdJMVVnZny1xbf2e
	vRba0UBRRLOedcYmlJFyXsZZrTycmQ882Wtk45Epbxfs13H9H3mqc2kUuQiiA4ndVk1wxsmhggqi+
	2gz3IrvEaL5H8yg/9Ku5Ths4DBhxycoMCHgeI1kMvUrOigndmcjcrhQD3vfsWdCjT5Y0bbzo/8rR3
	qJSfs0fQ==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uHlRi-00BGxd-E8; Wed, 21 May 2025 17:33:30 +0200
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
Subject: [PATCH v6 0/3] drm: Create a task info option for wedge events
Date: Wed, 21 May 2025 12:33:20 -0300
Message-ID: <20250521153323.935974-1-andrealmeid@igalia.com>
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

>From https://lore.kernel.org/dri-devel/CAFZQkGwJ4qgHV8WTp2=svJ_VXhb-+Y8_VNtKB=jLsk6DqMYp9w@mail.gmail.com/

For testing, I've used amdgpu's debug_mask options debug_disable_soft_recovery
and debug_disable_gpu_ring_reset to test both wedge event paths in the driver.
To trigger a ring timeout, I've used this app:
https://gitlab.freedesktop.org/andrealmeid/gpu-timeout

Thanks!

Changelog:

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

André Almeida (3):
  drm: Create a task info option for wedge events
  drm/doc: Add a section about "Task information" for the wedge API
  drm/amdgpu: Make use of drm_wedge_task_info

 Documentation/gpu/drm-uapi.rst             | 17 +++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
 drivers/gpu/drm/drm_drv.c                  | 19 +++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_reset.c      |  3 ++-
 drivers/gpu/drm/xe/xe_device.c             |  3 ++-
 include/drm/drm_device.h                   |  8 ++++++++
 include/drm/drm_drv.h                      |  3 ++-
 8 files changed, 68 insertions(+), 10 deletions(-)

-- 
2.49.0

