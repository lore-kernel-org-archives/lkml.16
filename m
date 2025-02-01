Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97991CF9B
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 01:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738372486; cv=none; b=Gcy+Ai95vZB2ZwnWVqBxPSX+tzwFUwQf2CH9geH6QSUaiDZo8RYEVDktCJ/PgS7QPjuzcCaV7V8vqpTkiKUppvRDtYr+VGjGWfcw8McD/tXTnBr0p1xKGGlzwLHtDfUNOzBuVc4/+0dImcEN7csDDiDxKCiOxBkiQu1lrJyxH/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738372486; c=relaxed/simple;
	bh=G8I4tFqU4e/506J8Cre5eYh9DKUKVRCwJD8TSMdU1G8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ROBiXihMg71JjkgiukRNC09KcpdnfZbxVVyjzbLDLleqgv2Pt4dIdW4iMuhs01w4vO4htiDNLySUNsKEIfPMd17VbFNAPX9ei9CqrMbGj1GZMz80RcidsExOSu5JQjEvpEfQsj+7B/JAGKt1uxPgVFG/XicUInyuqZ9+mbcAkHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=pJ55Wa0j; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="pJ55Wa0j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=/mmRK1wWK7L03xNe4fJ1XjLrqgzcw5ABx6HbTehR5DQ=; b=pJ55Wa0j46g7Oqgd
	tKP2GOwnDHsiz7g9erbA8Cp2drdgby3TX40bXr8jKX0ana3odkQadzuGRpwTmkCpgutTU2cnoRKUN
	mQLPT86kIZeoUub7Fc3wdZGQCtC17Zs1kmEEuhmTKg+3OdpzxoXlwH2E94yWHGE5L+ZxOXRsFV108
	YJAbxURiQ5RE/yyn6UkHfHEddN4DJvTTUguexSxBuKtNLo6WK5L1Iu5n5ePf4JRCg8JA2KUukXUfN
	YMo0ng/9F7zo9hnWISLrfPlzpahtveFX8/018dCA7m/9CcH/cE8JmufP2Rm77L20KOTmEN8qRDlkF
	TuJ7imQLkE4Vzg7chw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1te25j-00D1NI-2F;
	Sat, 01 Feb 2025 01:14:35 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/gma500: Remove unused mrst_helper_funcs
Date: Sat,  1 Feb 2025 01:14:34 +0000
Message-ID: <20250201011434.453879-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The mrst_helper_funcs const was added in 2013 by
commit ac6113ebb70d ("drm/gma500/mrst: Add SDVO clock calculation")
and commented as 'Not used yet'.

It's not been used since, so remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/gma500/oaktrail_crtc.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index de8ccfe9890f..ea9b41af0867 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -658,10 +658,3 @@ const struct drm_crtc_helper_funcs oaktrail_helper_funcs = {
 	.prepare = gma_crtc_prepare,
 	.commit = gma_crtc_commit,
 };
-
-/* Not used yet */
-const struct gma_clock_funcs mrst_clock_funcs = {
-	.clock = mrst_lvds_clock,
-	.limit = mrst_limit,
-	.pll_is_valid = gma_pll_is_valid,
-};
-- 
2.48.1

