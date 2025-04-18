Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6D680034
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744935695; cv=none; b=RYGvzYPpDVQ+qliBSCLKaZBc6PLdDrOQln5uVq80rBKPUqznAhjvH8RCLp12qQy7CW1zYaTqqm3JZ3RprEwVssZYGB5VQSQ7Ja6k6xiz2k9iaYWWWGIySQfSMuUZh3C2hAa91/CmszDEocYHXZzsH0vZxyW4ec5KqyvI0+JgISg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744935695; c=relaxed/simple;
	bh=/rVgs0wdwhBhpNre23i9q4iOk3BHTqBNUVJYfPcxPjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e3g6zKRwbe9hLbePn3Y7Ev1eO3IhLdt+PqLCgjF1UtHBdh6JFuUBc/Q8W+j3jGO4c0x8esJM6tl8eeR0LMeFh3u6qFleZxibo2/yveQBSJMuPUi2A+c3C6zULBEHDkAvdIhUNcADdt+Ca/GZBl3zZO/4qmJtFtNfG/oKUE7e2cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=fsv79n4F; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="fsv79n4F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=UnK+b2h8bTb3F6LGdc9yAFnsyCBDaFV8sHyN61KNjQE=; b=fsv79n4FJ88zyjZZ
	rKnyLBWkJ0QItC9HraNWrxWRXFNfyr/3nJD+NEf+vET+m54oNA/1DsC0Bfp+gAdpDfDaOAuKA0X0q
	cfsjZIbB3adre7+jaZKfTs2foTuvtTEKXV+djSd3xhGSqT4bkxjxp07haSHcrlF9bghK+mOtz5EbN
	DksRyrQzBOe9c8K3WiBAQBaKGsuyVBUsUO74BpAlA+9nQ0h/2lTgX8TEXKAhOIxpnzvr34fDRHiYs
	wN14YGHxPOtcR5dSzJePjblipHSU9wGOaD2iKKHbqIlDCL/f3e6APLradmrG6SYgCXPdKvX/FNYk9
	b2xlWcf1IrHqTlTzJw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u5ZTq-00CPl8-1p;
	Fri, 18 Apr 2025 00:21:18 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/4] drm/amd & radeon deadcoding
Date: Fri, 18 Apr 2025 01:21:13 +0100
Message-ID: <20250418002117.130612-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  Another set of deadcoding around amd/radeon GPU stuff.

Dave
Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (4):
  drm/radeon/radeon_audio: Remove unused r600_hdmi_audio_workaround
  drm/radeon: Remove unused radeon_doorbell_free
  drm/radeon: Remove unused radeon_fence_wait_any
  drm/amd/display: Remove unused *vbios_smu_set_dprefclk

 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c  | 14 -------
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h  |  1 -
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.c   | 14 -------
 .../dc/clk_mgr/dcn21/rn_clk_mgr_vbios_smu.h   |  1 -
 drivers/gpu/drm/radeon/r600_hdmi.c            | 22 ----------
 drivers/gpu/drm/radeon/radeon.h               |  4 --
 drivers/gpu/drm/radeon/radeon_asic.h          |  1 -
 drivers/gpu/drm/radeon/radeon_device.c        | 14 -------
 drivers/gpu/drm/radeon/radeon_fence.c         | 42 -------------------
 9 files changed, 113 deletions(-)

-- 
2.49.0

