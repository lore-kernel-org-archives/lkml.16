Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A71FECB7
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738533558; cv=none; b=YH9Crxbparjx+61uFEzQRR3wlT9x+QNUr8J0+qsy7C3//KHjYzIQZM8mQiPoHjqrMzNu0/IishE2UwzQ1//lK4mf4LomREYCW/FkbwhGjfiMFoK4QLfSvtP8PEdrR4lsb/VmBWjIlT0iqvW4SO5gnSuYrI+yKxo/a72+SDhZtes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738533558; c=relaxed/simple;
	bh=WY3yr3sWfIZUr6qXOM68irF5twW72WZoMqlNPoqogg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h49P9xZljW2Wd+PSZWBS4Eqs6TlryzYGJQLHsuglN8NoYgkgzQPF0GPxy+s9M2H4xnEgSELsnxy8dLcMn8Lehc8pITJ9x2nIx+EeoVg8RRspGqjbCf05IBYdFoQHtadqgMuuDYfDgUuX9zIboF6azv5Erm8jShTFHSeTECSMuQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=dq6R95H/; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="dq6R95H/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=/1b6pCL7BvDkFdAvPm7iR7Qo7T8oE8Lf7B5G8xtmkls=; b=dq6R95H/mJ7NrwbC
	WIfojHMPKjKGPPYjvpQQcDH6dnJMUEj69p7dPUSdKRw8YIveXapEDqRhU7BH9IAZXmQVhfYRZczpW
	eI8jUxyi7ezb7hN6dPmD/DeIsKAKjwgG+VKkhBeDOTGHnanybyQdSfpMGEI+YdLwbUsDAtkaPEzG9
	ZI7yMaTiK5FjM55XZJuV9g3PNJHG//MG3OHxNmAj1/jQKzd8vpXyPK6mxiIeHrC1KaN+UBr4K9OoJ
	p1SemkeXxUEcxfN6TIb4QjHaPKdWs4cYj/R20X/IwYm36t4TtQCGPtCxwA4q7ILPgO3pqibNIBF+c
	PZLDOtqnbhe3mANKAQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tehzY-00D9GV-0k;
	Sun, 02 Feb 2025 21:59:00 +0000
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
Subject: [PATCH 4/7] drm/amd/display: Remove unused get_clock_requirements_for_state
Date: Sun,  2 Feb 2025 21:58:53 +0000
Message-ID: <20250202215856.252439-5-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250202215856.252439-1-linux@treblig.org>
References: <20250202215856.252439-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

get_clock_requirements_for_state() was added in 2018 by
commit 8ab2180f96f5 ("drm/amd/display: Add function to fetch clock
requirements")
but never used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 12 ------------
 drivers/gpu/drm/amd/display/dc/dc.h      |  2 --
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 76b39052e3a0..2e42dbabfbe6 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -5387,18 +5387,6 @@ bool dc_is_dmcu_initialized(struct dc *dc)
 	return false;
 }
 
-void get_clock_requirements_for_state(struct dc_state *state, struct AsicStateEx *info)
-{
-	info->displayClock				= (unsigned int)state->bw_ctx.bw.dcn.clk.dispclk_khz;
-	info->engineClock				= (unsigned int)state->bw_ctx.bw.dcn.clk.dcfclk_khz;
-	info->memoryClock				= (unsigned int)state->bw_ctx.bw.dcn.clk.dramclk_khz;
-	info->maxSupportedDppClock		= (unsigned int)state->bw_ctx.bw.dcn.clk.max_supported_dppclk_khz;
-	info->dppClock					= (unsigned int)state->bw_ctx.bw.dcn.clk.dppclk_khz;
-	info->socClock					= (unsigned int)state->bw_ctx.bw.dcn.clk.socclk_khz;
-	info->dcfClockDeepSleep			= (unsigned int)state->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz;
-	info->fClock					= (unsigned int)state->bw_ctx.bw.dcn.clk.fclk_khz;
-	info->phyClock					= (unsigned int)state->bw_ctx.bw.dcn.clk.phyclk_khz;
-}
 enum dc_status dc_set_clock(struct dc *dc, enum dc_clock_type clock_type, uint32_t clk_khz, uint32_t stepping)
 {
 	if (dc->hwss.set_clock)
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 053481ab69ef..81fbc8e9101d 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -1582,8 +1582,6 @@ bool dc_validate_boot_timing(const struct dc *dc,
 
 enum dc_status dc_validate_plane(struct dc *dc, const struct dc_plane_state *plane_state);
 
-void get_clock_requirements_for_state(struct dc_state *state, struct AsicStateEx *info);
-
 enum dc_status dc_validate_with_context(struct dc *dc,
 					const struct dc_validation_set set[],
 					int set_count,
-- 
2.48.1

