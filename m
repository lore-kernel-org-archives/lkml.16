Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025C927E7ED;
	Tue, 29 Apr 2025 23:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970669; cv=none; b=inIst9u4AC1Dqs+vVXENCJZwo95medh672DEDYeHWdltq7n9UwRrWye8j1PWVk9u7hV1St6s+zwhM9CxU6l+9Sl1EugiSSZmuzRAQ/RlDuuQOBT0NKigQIqsROQzKQAV6I0eTuDCXgu0l1SMalTzxLRdGp1RN9vaMuSf0U9hRag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970669; c=relaxed/simple;
	bh=7Mqkh/DfpJaKhMCrCkYPgeCnFVkfSR9IgPhX19vd/Ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ubxKVIP7mcglrMuDGoNN9XtdpqXIOH/YD1HF3J2k1DJTb1GyQnPoPuuKj7ZJVyoy9WLoYw0WMyt8X1rI9TuEFQ7ge2UL86wfEurPEFAxn400twMSQPeirlnIWtfO3AaXo71UYY7m4txroMRh3WsNosCkGHw7nt6PTIiUgNzgI5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1WagvpW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1WagvpW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD52C4CEE3;
	Tue, 29 Apr 2025 23:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970668;
	bh=7Mqkh/DfpJaKhMCrCkYPgeCnFVkfSR9IgPhX19vd/Ro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B1WagvpW60CqVWXkFLuP8fPR+m4iqUOyTztr/4o0QmZxWYenuuh09hQNSNdR/Eck2
	 IhJ548iVz8fE7YoT0bsyX/iNiI/mT6HhdQY79EHVZIlc7v4+voePt4UtXX6UCTLpZv
	 bs5OY2uVp6HELoEwQnG8d5w+IRBHS7VHsImadFGcewzjVD8e/NqdM/kYDf5hllQ7WD
	 nEbe7tR3etWgrlhTNohaVyZUyj/Txwsb77N8sas2XP0GvtESuIMVAnOnZ3dlAkMD+A
	 J1/3OkHW85tqvZ95sUwlM4RctoGffYBMxVkWPdlNOeaPJ09YcCfVLWT/tn8AWnjFtF
	 9isf6B8FdPiVA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nicholas Susanto <nsusanto@amd.com>,
	Charlene Liu <charlene.liu@amd.com>,
	Zaeem Mohamed <zaeem.mohamed@amd.com>,
	Mark Broadworth <mark.broadworth@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	austin.zheng@amd.com,
	jun.lei@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	Charlene.Liu@amd.com,
	chiahsuan.chung@amd.com,
	nicholas.kazlauskas@amd.com,
	paul.hsieh@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 32/39] drm/amd/display: Enable urgent latency adjustment on DCN35
Date: Tue, 29 Apr 2025 19:49:59 -0400
Message-Id: <20250429235006.536648-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235006.536648-1-sashal@kernel.org>
References: <20250429235006.536648-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.4
Content-Transfer-Encoding: 8bit

From: Nicholas Susanto <nsusanto@amd.com>

[ Upstream commit 756c85e4d0ddc497b4ad5b1f41ad54e838e06188 ]

[Why]

Urgent latency adjustment was disabled on DCN35 due to issues with P0
enablement on some platforms. Without urgent latency, underflows occur
when doing certain high timing configurations. After testing, we found
that reenabling urgent latency didn't reintroduce p0 support on multiple
platforms.

[How]

renable urgent latency on DCN35 and setting it to 3000 Mhz.

This reverts commit 3412860cc4c0c484f53f91b371483e6e4440c3e5.

Reviewed-by: Charlene Liu <charlene.liu@amd.com>
Signed-off-by: Nicholas Susanto <nsusanto@amd.com>
Signed-off-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
Tested-by: Mark Broadworth <mark.broadworth@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
(cherry picked from commit cd74ce1f0cddffb3f36d0995d0f61e89f0010738)
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
index 47d785204f29c..beed7adbbd43e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
@@ -195,9 +195,9 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_5_soc = {
 	.dcn_downspread_percent = 0.5,
 	.gpuvm_min_page_size_bytes = 4096,
 	.hostvm_min_page_size_bytes = 4096,
-	.do_urgent_latency_adjustment = 0,
+	.do_urgent_latency_adjustment = 1,
 	.urgent_latency_adjustment_fabric_clock_component_us = 0,
-	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
+	.urgent_latency_adjustment_fabric_clock_reference_mhz = 3000,
 };
 
 void dcn35_build_wm_range_table_fpu(struct clk_mgr *clk_mgr)
-- 
2.39.5

