Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972061DDC3E
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738533557; cv=none; b=oq5aQnzfXRoRm7GjbrNfmn/AcWPU0+radjBX3nSeZZbSaop3EwMokKN5y3hLSvV7Y55SldRagS9OUsWgJZTan5cAXt+47QAdjLOKnERGO5GBQ/BG+4732JaMXfGZP42qfl8RFCJ7jzjdX1dTs0yvvu5ePSyfYPiLVso6decp6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738533557; c=relaxed/simple;
	bh=JJe2oeO4WPPMHV7iT9dW9djvzt5YTGH2xFleNURv/vY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3HbfhjfIBLQ8MxhdY7/+2hh7SO71IchNiastSkZTgrDqrzOi/38JXf3ZSuka8zET/fiO0AWOU+v3SkHKsptvmghtm62GwUPaY+b9jr/9e29hD8KHKYbQAXrrO3i7MNx1a+kH+4PbZmqEsmRNFt4f2yvoK59dtiE1sml3eeSTHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=ExqYfCz6; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="ExqYfCz6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=GSnzrCxUEngAgik7AYtqUtnWRLHqHq4tUTTifRQr5Ew=; b=ExqYfCz6D9cBjzz6
	wH89VMpf3twPsNEwv1T4wZ/RyLZlW/meCBCtocVt+FoR/d/wFchE8HSDiPQMbpxPT6ycOHfzWzRyo
	ntRnDPJchwWV9hHkELGXfrN8PTK2Q6diDR9H/y3+cMjZ8A2Srd+t7RgIpO4q7SOE6grWLXXT/x916
	7v+OI9uxg/K7Xx6z/2wgQ3tu6Ewy585byiOsR1qEAElWSVZUxuW3dFhkYOQXa8UBToFwTsgL0k6qM
	Wh4ZkPiCzMRK+uKiGbk2U2pp9eVHzOJknSSmDMOrAt7QVZNG9WhQDWEmEGvk4sCsIR1WZAX6Nfi1p
	fUpdJDRn0oa6/DvbBw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tehzV-00D9GV-0v;
	Sun, 02 Feb 2025 21:58:57 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/7] drm/amd/display: More deadcoding
Date: Sun,  2 Feb 2025 21:58:49 +0000
Message-ID: <20250202215856.252439-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Another small pile of deadcode patches.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (7):
  drm/amd/display: Remove unused mpc1_is_mpcc_idle
  drm/amd/display: Remove unused freesync functions
  drm/amd/display: Remove unused dc_stream_get_crtc_position
  drm/amd/display: Remove unused get_clock_requirements_for_state
  drm/amd/display: Remove unused hubbub1_toggle_watermark_change_req
  drm/amd/display: Remove unused get_max_support_fbc_buffersize
  drm/amd/display: Remove unused
    link_enc_cfg_get_link_enc_used_by_stream

 drivers/gpu/drm/amd/display/dc/core/dc.c      |  39 -----
 .../drm/amd/display/dc/core/dc_link_enc_cfg.c |  11 --
 drivers/gpu/drm/amd/display/dc/dc.h           |   2 -
 drivers/gpu/drm/amd/display/dc/dc_stream.h    |  12 --
 .../amd/display/dc/dce110/dce110_compressor.c |  13 --
 .../amd/display/dc/dce110/dce110_compressor.h |   2 -
 .../display/dc/hubbub/dcn10/dcn10_hubbub.c    |  18 ---
 .../display/dc/hubbub/dcn10/dcn10_hubbub.h    |   3 -
 .../gpu/drm/amd/display/dc/inc/link_enc_cfg.h |   5 -
 .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.c  |  16 --
 .../drm/amd/display/dc/mpc/dcn10/dcn10_mpc.h  |   4 -
 .../amd/display/modules/freesync/freesync.c   | 137 ------------------
 .../amd/display/modules/inc/mod_freesync.h    |  26 ----
 13 files changed, 288 deletions(-)

-- 
2.48.1

