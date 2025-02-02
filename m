Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4112144D6
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738533557; cv=none; b=n/Ezt7T7as0RhILbcgwDFv4HK1GAFEqLSfblubEuFGEeBC7PWTepCY9gxJ6W0/fICPxwFQCbklXNnc1K6EXdMg3ER0vLAcimkgyXjbf8istNu9VlKrVnDinbaDmnWa4QsvtThkpW2D0K8ozRDzUQI9LJKg47x5fnYPMO3mJ0Exg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738533557; c=relaxed/simple;
	bh=apvzNuqAPrOJbi1QdhHgxJgARcnD+t3mhNGlY6JYbHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oe4Ga2USNnkw8/nYuaTXlAzmX8qJ7zAC1QfLFJ4KQDWYp5kvx0eSJfd0UX1wxkIMaFv/wWoG/V4AxCRlAEoViXkbJeljN8PpmqkmdytMS5djMVIq5ZkkTaKyeGOaLvuAVIueaDoe3MdzQrHRILTFzVdbQxnZsfMHoFLQ4+cZKcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=NtJwAPb4; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="NtJwAPb4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=28elsu1t62he74DEYIgKoW2bZYZ56l/4XaRobXPlcXI=; b=NtJwAPb45fyq0Uyr
	0D9VebYG38zqm34JN9TtgtVPiS3CU0cIKl97VmcTPXiHDvxKKJ+5No3wXp7HB/8a5R07E+RN5/psT
	i+Lw1GdDWUnjJ0Ixurn/PSuR39lbWEWGSsUtat6Z4vKuiYLSrf5EBey3Z4YgX593ltTDG8psrvvnI
	tis/rO5LLBClBVLFqO+cHjlO3ODK1Oe88UIxAA1vCPBLnhz8QZBDTf5RPF8pmqsW4VQcilhFGtTts
	2kxKMzu2mpFtt4/R0KqA8oEJBKFD8iy1dOcsPmGkleSbwQuhXRfVtZwOJK3NPqKlKWSjr5w1J5W4S
	XNpgwVFAHA3x3zMOUA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tehzX-00D9GV-1l;
	Sun, 02 Feb 2025 21:58:59 +0000
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
Subject: [PATCH 3/7] drm/amd/display: Remove unused dc_stream_get_crtc_position
Date: Sun,  2 Feb 2025 21:58:52 +0000
Message-ID: <20250202215856.252439-4-linux@treblig.org>
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

The last user of dc_stream_get_crtc_position() was
mod_freesync_get_v_position() which is removed in a previous
patch in this series.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c   | 27 ----------------------
 drivers/gpu/drm/amd/display/dc/dc_stream.h | 12 ----------
 2 files changed, 39 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index cecaadf741ad..76b39052e3a0 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -515,33 +515,6 @@ bool dc_stream_get_last_used_drr_vtotal(struct dc *dc,
 	return status;
 }
 
-bool dc_stream_get_crtc_position(struct dc *dc,
-		struct dc_stream_state **streams, int num_streams,
-		unsigned int *v_pos, unsigned int *nom_v_pos)
-{
-	/* TODO: Support multiple streams */
-	const struct dc_stream_state *stream = streams[0];
-	int i;
-	bool ret = false;
-	struct crtc_position position;
-
-	dc_exit_ips_for_hw_access(dc);
-
-	for (i = 0; i < MAX_PIPES; i++) {
-		struct pipe_ctx *pipe =
-				&dc->current_state->res_ctx.pipe_ctx[i];
-
-		if (pipe->stream == stream && pipe->stream_res.stream_enc) {
-			dc->hwss.get_position(&pipe, 1, &position);
-
-			*v_pos = position.vertical_count;
-			*nom_v_pos = position.nominal_vcount;
-			ret = true;
-		}
-	}
-	return ret;
-}
-
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 static inline void
 dc_stream_forward_dmub_crc_window(struct dc_dmub_srv *dmub_srv,
diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
index 3e303c7808fb..e0bfddaa23e3 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
@@ -528,12 +528,6 @@ bool dc_stream_get_last_used_drr_vtotal(struct dc *dc,
 		struct dc_stream_state *stream,
 		uint32_t *refresh_rate);
 
-bool dc_stream_get_crtc_position(struct dc *dc,
-				 struct dc_stream_state **stream,
-				 int num_streams,
-				 unsigned int *v_pos,
-				 unsigned int *nom_v_pos);
-
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
 bool dc_stream_forward_crc_window(struct dc_stream_state *stream,
 		struct rect *rect,
@@ -578,12 +572,6 @@ bool dc_stream_set_gamut_remap(struct dc *dc,
 bool dc_stream_program_csc_matrix(struct dc *dc,
 				  struct dc_stream_state *stream);
 
-bool dc_stream_get_crtc_position(struct dc *dc,
-				 struct dc_stream_state **stream,
-				 int num_streams,
-				 unsigned int *v_pos,
-				 unsigned int *nom_v_pos);
-
 struct pipe_ctx *dc_stream_get_pipe_ctx(struct dc_stream_state *stream);
 
 void dc_dmub_update_dirty_rect(struct dc *dc,
-- 
2.48.1

