Received: from pop36.abv.bg (pop36.abv.bg [194.153.145.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF5E17A2EA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.153.145.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519879; cv=none; b=KmGSg89AkrG2ewhxkzZr3B2rNF6aIdqeCJtMVLk4WdRcpZRDEO4f8cOUk0SICSI6jVeiWZH6fQPP27+VUjUlFy1Obaaup2e0ZdzYBPFrN/tKPqBc1Yzw1elQTQIyAhb71tyyr2OZojaNs+lV/zjWPH5M6a+3YbkQNoBVdk/6AO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519879; c=relaxed/simple;
	bh=Yl1I7GSjuSUE2DuiBjIR5OyDwgH2qXgKb+STCPqA4PM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPEuNJfk6DImAxGgSXaJyt7mPHjpxcG1ZtyYvX+zwmkw/rl9kvJmhqE2SZku2o3G4xWi9vT9dWHi2rViF4wrXYHmrYmG4b4jTEyIWqAgOTVuV+JoffeQFiWfv1iQRULwJAC/P87c61Z4botaYx4WxkR/pPAoslWad7VyzdH6jcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=abv.bg; spf=pass smtp.mailfrom=abv.bg; dkim=pass (1024-bit key) header.d=abv.bg header.i=@abv.bg header.b=PZDZQc85; arc=none smtp.client-ip=194.153.145.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=abv.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=abv.bg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=abv.bg header.i=@abv.bg header.b="PZDZQc85"
Received: from smtp.abv.bg (localhost [127.0.0.1])
	by pop36.abv.bg (Postfix) with ESMTP id B05621805D29;
	Thu, 24 Apr 2025 21:37:53 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abv.bg; s=smtp-out;
	t=1745519873; bh=vJsJYKKCAboGpLq0CAiXL5li3+HPTt5PnuNQ75PMrds=;
	h=From:To:Cc:Subject:Date:From;
	b=PZDZQc85QnPaY8qhHcEIvLhzDc7B6QMWoi6hgE+VmZjUrSsxYfWM2guoU1rkjY9Ts
	 5Gg6lA0MaJCaaci3AaU3VEqegjXC68p8mZOCfZnW3ZSfxL2Sayd5b0JIvHHW9Wk7Sy
	 7Swx8vpRk6vzRi/t++aAPWgU9b09ZOusPr5iMw2w=
X-HELO: laptop..
Authentication-Results: smtp.abv.bg; auth=pass (plain) smtp.auth=ivan.shamliev.dev@abv.bg
Received: from pop-144.92.escom.bg (HELO laptop..) (93.183.144.92)
 by smtp.abv.bg (qpsmtpd/0.96) with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted); Thu, 24 Apr 2025 21:37:53 +0300
From: Ivan Shamliev <ivan.shamliev.dev@abv.bg>
To: austin.zheng@amd.com,
	jun.lei@amd.com,
	harry.wentland@amd.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ivan Shamliev <ivan.shamliev.dev@abv.bg>
Subject: [PATCH] drm/amd/display: Use true/false for boolean variables in dcn314
Date: Thu, 24 Apr 2025 21:37:20 +0300
Message-ID: <20250424183720.26387-1-ivan.shamliev.dev@abv.bg>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 1 and 0 with true/false for booleans in display_rq_dlg_calc_314.c
to follow Linux kernel coding style, preferring C99 bool with true/false.

Signed-off-by: Ivan Shamliev <ivan.shamliev.dev@abv.bg>
---
 .../dc/dml/dcn314/display_rq_dlg_calc_314.c   | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
index b7d2a0caec11..8c43b84ad034 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_rq_dlg_calc_314.c
@@ -119,10 +119,10 @@ static bool CalculateBytePerPixelAnd256BBlockSizes(
 
 static bool is_dual_plane(enum source_format_class source_format)
 {
-	bool ret_val = 0;
+	bool ret_val = false;
 
 	if ((source_format == dm_420_12) || (source_format == dm_420_8) || (source_format == dm_420_10) || (source_format == dm_rgbe_alpha))
-		ret_val = 1;
+		ret_val = true;
 
 	return ret_val;
 }
@@ -259,8 +259,8 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib, display_rq_p
 	unsigned int swath_bytes_c = 0;
 	unsigned int full_swath_bytes_packed_l = 0;
 	unsigned int full_swath_bytes_packed_c = 0;
-	bool req128_l = 0;
-	bool req128_c = 0;
+	bool req128_l = false;
+	bool req128_c = false;
 	bool surf_linear = (pipe_src_param->sw_mode == dm_sw_linear);
 	bool surf_vert = (pipe_src_param->source_scan == dm_vert);
 	unsigned int log2_swath_height_l = 0;
@@ -295,37 +295,37 @@ static void handle_det_buf_split(struct display_mode_lib *mode_lib, display_rq_p
 #endif
 
 	if (total_swath_bytes <= detile_buf_size_in_bytes) { //full 256b request
-		req128_l = 0;
-		req128_c = 0;
+		req128_l = false;
+		req128_c = false;
 		swath_bytes_l = full_swath_bytes_packed_l;
 		swath_bytes_c = full_swath_bytes_packed_c;
 	} else if (!rq_param->yuv420) {
-		req128_l = 1;
-		req128_c = 0;
+		req128_l = true;
+		req128_c = false;
 		swath_bytes_c = full_swath_bytes_packed_c;
 		swath_bytes_l = full_swath_bytes_packed_l / 2;
 	} else if ((double) full_swath_bytes_packed_l / (double) full_swath_bytes_packed_c < 1.5) {
-		req128_l = 0;
-		req128_c = 1;
+		req128_l = false;
+		req128_c = true;
 		swath_bytes_l = full_swath_bytes_packed_l;
 		swath_bytes_c = full_swath_bytes_packed_c / 2;
 
 		total_swath_bytes = 2 * swath_bytes_l + 2 * swath_bytes_c;
 
 		if (total_swath_bytes > detile_buf_size_in_bytes) {
-			req128_l = 1;
+			req128_l = true;
 			swath_bytes_l = full_swath_bytes_packed_l / 2;
 		}
 	} else {
-		req128_l = 1;
-		req128_c = 0;
+		req128_l = true;
+		req128_c = false;
 		swath_bytes_l = full_swath_bytes_packed_l / 2;
 		swath_bytes_c = full_swath_bytes_packed_c;
 
 		total_swath_bytes = 2 * swath_bytes_l + 2 * swath_bytes_c;
 
 		if (total_swath_bytes > detile_buf_size_in_bytes) {
-			req128_c = 1;
+			req128_c = true;
 			swath_bytes_c = full_swath_bytes_packed_c / 2;
 		}
 	}
-- 
2.43.0

