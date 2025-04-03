Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9252A296BE5;
	Thu,  3 Apr 2025 19:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743707687; cv=none; b=MfaQt+YzwVx+G5cJ1qWQi61x70EXMeCaoONYk1z80DN0+GTxmXPJ448a3dLfqKFkON8HOI9fiiaJDWqKNYPlPh8blKm0ZSDbtHtYRU1NtYxIy9B8zjxoRbd4XCZjrpNnOHdFJHM+XDfCeaStFIfMIVrCrQfBs1OS9qgzv3A/44A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743707687; c=relaxed/simple;
	bh=rkKuz933FEHxdUL/5+1WUTOu7CoJgDLgYSN+J1Ym2w4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MNAnjVpiJZukL/HqJjdz+JvdnYJirdOthtyFgdVAvN6JecOwMsfrBvMV7an1xOpGUvNVLMLnzCt/+/S0SLVpHPc6mZ+Yp9HicjUb/ISA3gQYnY2fnSy1TkvU9DSZ74MgNYJD6J/LYvMAV80vGTaxTLRp1Sq+JQNKMWPWeF6hXeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hu7zNH0W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hu7zNH0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68715C4CEE3;
	Thu,  3 Apr 2025 19:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743707687;
	bh=rkKuz933FEHxdUL/5+1WUTOu7CoJgDLgYSN+J1Ym2w4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hu7zNH0Wn9OexD7i/nYjV3zzSLFao2uK93T32EYgVIacGHy6ZwPj+IKBW59TLh2m8
	 QlRUUhzDy+bTLas4MY0Ev05vSS3QpUYASQpQSEoUtVvmsHrlmD2htMAT+1nJc/437s
	 6HgUQKe+gbyK8db7utgQfRAvdWTk3tMgP1DUYYRy7A6T4wapd9FO7kbIYJ5TUSBYZl
	 0lzeaNlSW+MWrSlsmfXbEVlLWK837bindwUlhNXLF0yhar3Hz66h4ZBX26Rac4YC86
	 kgYm4IeXpYHxVZDuGcR1GDQyBiCG5mokyFsT023j7VRmTjI05oj5id6GHmdeANzC4m
	 nyhufohAGEX/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryan Seto <ryanseto@amd.com>,
	Dillon Varone <dillon.varone@amd.com>,
	Tom Chung <chiahsuan.chung@amd.com>,
	Daniel Wheeler <daniel.wheeler@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	austin.zheng@amd.com,
	jun.lei@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	alex.hung@amd.com,
	colin.i.king@gmail.com,
	aurabindo.pillai@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 32/44] drm/amd/display: Prevent VStartup Overflow
Date: Thu,  3 Apr 2025 15:13:01 -0400
Message-Id: <20250403191313.2679091-32-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191313.2679091-1-sashal@kernel.org>
References: <20250403191313.2679091-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit

From: Ryan Seto <ryanseto@amd.com>

[ Upstream commit 29c1c20496a7a9bafe2bc2f833d69aa52e0f2c2d ]

[Why]
For some VR headsets with large blanks, it's possible
to overflow the OTG_VSTARTUP_PARAM:VSTARTUP_START
register. This can lead to incorrect DML calculations
and underflow downstream.

[How]
Min the calcualted max_vstartup_lines with the max
value of the register.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Ryan Seto <ryanseto@amd.com>
Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 8ed49a9df3780..c1ff869512f27 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -15,6 +15,7 @@
 //#define DML_MODE_SUPPORT_USE_DPM_DRAM_BW
 //#define DML_GLOBAL_PREFETCH_CHECK
 #define ALLOW_SDPIF_RATE_LIMIT_PRE_CSTATE
+#define DML_MAX_VSTARTUP_START 1023
 
 const char *dml2_core_internal_bw_type_str(enum dml2_core_internal_bw_type bw_type)
 {
@@ -3726,6 +3727,7 @@ static unsigned int CalculateMaxVStartup(
 	dml2_printf("DML::%s: vblank_avail = %u\n", __func__, vblank_avail);
 	dml2_printf("DML::%s: max_vstartup_lines = %u\n", __func__, max_vstartup_lines);
 #endif
+	max_vstartup_lines = (unsigned int)math_min2(max_vstartup_lines, DML_MAX_VSTARTUP_START);
 	return max_vstartup_lines;
 }
 
-- 
2.39.5

