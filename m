Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EC114A8B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.133.245.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743139543; cv=none; b=Qcixe9Rb+OHLvoYhlD56mcNsWc/dTs9WL0MzM8Ygh2E+UGT7cqi9Nznfn3zuiJEgs6enJPVvo2ecuxS+y7okg3UaE60M4vOrSYoCIadk0hYebZuVfPuV7MI+Cs1ViGMlLGkvRdDhM3Si2c/2CBHDmAdERRMqSQePW314c/2fr4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743139543; c=relaxed/simple;
	bh=QKLjGWpoY6vF1d2h8C/5Hete+LF1GwTt151HrxzTtW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aRW0trQ8LvdrGCbtOzqCuxLYMFmrBBxh/YiwflcP3nS30c7iTv+7Cmm3z/orUGIraglPCOrCW7Y1+YomI3rWLrE2uqhQlB7bgtUmIPQt712+vtE6871qWXEeAH/cZZFPrVxa6bzezKaQ4VV9FdJWoeGPLoGakN8ZjaEdtA2PzMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru; spf=pass smtp.mailfrom=nppct.ru; dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b=K94onynM; arc=none smtp.client-ip=195.133.245.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nppct.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nppct.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nppct.ru header.i=@nppct.ru header.b="K94onynM"
Received: from mail.nppct.ru (localhost [127.0.0.1])
	by mail.nppct.ru (Postfix) with ESMTP id 1ECE31C2435
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:25:40 +0300 (MSK)
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:to:from:from; s=dkim; t=1743139539; x=
	1744003540; bh=QKLjGWpoY6vF1d2h8C/5Hete+LF1GwTt151HrxzTtW0=; b=K
	94onynMcU5Yd6oxaAmfGN0PKkNNzM6CJnLYGsDuU9ZSZvhLehgy2LZvTtAs0Gfdg
	JVuBBc1cNuFQW5jr9RpxhcX/iYzwjYCm1z/ufxktv3UB3uXu5B4cEQTI/AEu40zy
	Pi/Ah7bLh93cmLlTiGBN090YHBOTlN1yUQIBn6u9FM=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Received: from mail.nppct.ru ([127.0.0.1])
	by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jHmklzvHMrYU for <linux-kernel@vger.kernel.org>;
	Fri, 28 Mar 2025 08:25:39 +0300 (MSK)
Received: from localhost.localdomain (unknown [87.249.24.51])
	by mail.nppct.ru (Postfix) with ESMTPSA id B42BE1C242C;
	Fri, 28 Mar 2025 08:25:25 +0300 (MSK)
From: Alexey Nepomnyashih <sdl@nppct.ru>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Alexey Nepomnyashih <sdl@nppct.ru>,
	Leo Li <sunpeng.li@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Alex Hung <alex.hung@amd.com>,
	Wenjing Liu <wenjing.liu@amd.com>,
	Daniel Wheeler <daniel.wheeler@amd.com>,
	Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Subject: [PATCH 5.10/5.15/6.1] drm/amd/display: Avoid overflow assignment in link_dp_cts
Date: Fri, 28 Mar 2025 05:25:11 +0000
Message-ID: <20250328052512.1206068-1-sdl@nppct.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Hung <alex.hung@amd.com>

commit a15268787b79fd183dd526cc16bec9af4f4e49a1 upstream.

sampling_rate is an uint8_t but is assigned an unsigned int, and thus it
can overflow. As a result, sampling_rate is changed to uint32_t.

Similarly, LINK_QUAL_PATTERN_SET has a size of 2 bits, and it should
only be assigned to a value less or equal than 4.

This fixes 2 INTEGER_OVERFLOW issues reported by Coverity.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Wenjing Liu <wenjing.liu@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
[ Alexey Nepomnyashih: backport fix dc_link_dp_set_test_pattern()
 to dc_link_dp.c. ]
Signed-off-by: Alexey Nepomnyashih <sdl@nppct.ru>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 3 ++-
 drivers/gpu/drm/amd/display/dc/dc_dp_types.h     | 2 +-
 drivers/gpu/drm/amd/display/include/dpcd_defs.h  | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 82b747c0ed69..4a70cbd05bd9 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -6159,7 +6159,8 @@ bool dc_link_dp_set_test_pattern(
 			core_link_read_dpcd(link, DP_TRAINING_PATTERN_SET,
 					    &training_pattern.raw,
 					    sizeof(training_pattern));
-			training_pattern.v1_3.LINK_QUAL_PATTERN_SET = pattern;
+			if (pattern <= PHY_TEST_PATTERN_END_DP11)
+				training_pattern.v1_3.LINK_QUAL_PATTERN_SET = pattern;
 			core_link_write_dpcd(link, DP_TRAINING_PATTERN_SET,
 					     &training_pattern.raw,
 					     sizeof(training_pattern));
diff --git a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
index 296793d8b2bf..6703be2fc157 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_dp_types.h
@@ -715,7 +715,7 @@ struct dp_audio_test_data_flags {
 struct dp_audio_test_data {
 
 	struct dp_audio_test_data_flags flags;
-	uint8_t sampling_rate;
+	uint32_t sampling_rate;
 	uint8_t channel_count;
 	uint8_t pattern_type;
 	uint8_t pattern_period[8];
diff --git a/drivers/gpu/drm/amd/display/include/dpcd_defs.h b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
index b2df07f9e91c..1b073e9e7b11 100644
--- a/drivers/gpu/drm/amd/display/include/dpcd_defs.h
+++ b/drivers/gpu/drm/amd/display/include/dpcd_defs.h
@@ -76,6 +76,7 @@ enum dpcd_phy_test_patterns {
 	PHY_TEST_PATTERN_D10_2,
 	PHY_TEST_PATTERN_SYMBOL_ERROR,
 	PHY_TEST_PATTERN_PRBS7,
+	PHY_TEST_PATTERN_END_DP11 = PHY_TEST_PATTERN_PRBS7,
 	PHY_TEST_PATTERN_80BIT_CUSTOM,/* For DP1.2 only */
 	PHY_TEST_PATTERN_CP2520_1,
 	PHY_TEST_PATTERN_CP2520_2,
-- 
2.43.0

