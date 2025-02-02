Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1050214A74
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 21:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738533560; cv=none; b=uLnNEveNLANAms80e2Fy3g88vlC0f/+q7Z9Sw1aOnKWvsVnkGYSNyD8M6Q4iG4itP9ikQg5+oyhoqWoCuZbnEyzPTNNe6rlM1zTACT+jdEnU2A56Q0JqXrug1SNgYlf/vryragQ2b0Hi1PAhxe3EP/Z56CmmtHh88wZPLZIWGRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738533560; c=relaxed/simple;
	bh=T4+YsupubNd0olYDS3ZET2KRCT9MsTcWKNMTdMN2uXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAVyv2Q16yNYzrd6eOcYklQ4CChZGKGvdRCFP6MMDkpW9/ja5KgQ3c0xr5POocI1ZrxVvekFbc8njn7fHeJfegEC0ZSKl0tvvtMww1G8MnHPSf/Y+kQRpj1+gu7WtA6qkF4XiN8UAuljhwRZKCMY7RQJe6SdSFRkGeQ7MNU5kQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=m3HAYvo1; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="m3HAYvo1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=zB8VhMlMX6u7pxPTXphsXxQbKI9GdJdL3pZhEJ1Qsss=; b=m3HAYvo1fqxddrFe
	YKNgnyR4V0Rdn8caHKC0YTCoq2nMzH7l3uPXBn9BZ2OY9LU+5fOP4SQXeI8d69/8OuIyXi0jd2DmF
	VhhMEQD9QO/gcScEGqCi3ghb1KLS/PThedCxTof03qyKNkRfnqDqFs5Zx2gg6eT9XDTCXtcAHmCUM
	qDmYnSpMuFxRwtljoYdn7K9By1yhNnnzbZ7DBB1AgHnsbI/P47teVb4hvGIeiaRzTSVE6B82fHPX9
	/O3RPvCNqvR9ApGVTm5en/Qfgy+lAQimcscgrXLYBaIR9D3dDsbPBCgHN9YB4iunAfVzD/xgTXIGO
	JBktysNydzjH+Xm5pQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tehza-00D9GV-2R;
	Sun, 02 Feb 2025 21:59:02 +0000
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
Subject: [PATCH 7/7] drm/amd/display: Remove unused link_enc_cfg_get_link_enc_used_by_stream
Date: Sun,  2 Feb 2025 21:58:56 +0000
Message-ID: <20250202215856.252439-8-linux@treblig.org>
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

link_enc_cfg_get_link_enc_used_by_stream() is no longer used after
2021's:
commit 6366b00346c0 ("drm/amd/display: Maintain consistent mode of
operation during encoder assignment")
which introduces and uses the _current version instead.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c | 11 -----------
 drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h     |  5 -----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
index 039b176e086d..08b4258b0e2f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_enc_cfg.c
@@ -559,17 +559,6 @@ struct link_encoder *link_enc_cfg_get_next_avail_link_enc(struct dc *dc)
 	return link_enc;
 }
 
-struct link_encoder *link_enc_cfg_get_link_enc_used_by_stream(
-		struct dc *dc,
-		const struct dc_stream_state *stream)
-{
-	struct link_encoder *link_enc;
-
-	link_enc = link_enc_cfg_get_link_enc_used_by_link(dc, stream->link);
-
-	return link_enc;
-}
-
 struct link_encoder *link_enc_cfg_get_link_enc(
 		const struct dc_link *link)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h b/drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h
index dc650be3837e..f1afb31ac70b 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/link_enc_cfg.h
@@ -96,11 +96,6 @@ struct link_encoder *link_enc_cfg_get_link_enc_used_by_link(
 /* Return next available DIG link encoder. NULL if none available. */
 struct link_encoder *link_enc_cfg_get_next_avail_link_enc(struct dc *dc);
 
-/* Return DIG link encoder used by stream. NULL if unused. */
-struct link_encoder *link_enc_cfg_get_link_enc_used_by_stream(
-		struct dc *dc,
-		const struct dc_stream_state *stream);
-
 /* Return DIG link encoder. NULL if unused. */
 struct link_encoder *link_enc_cfg_get_link_enc(const struct dc_link *link);
 
-- 
2.48.1

