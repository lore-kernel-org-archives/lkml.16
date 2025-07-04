Received: from out162-62-58-69.mail.qq.com (out162-62-58-69.mail.qq.com [162.62.58.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DD81D63C6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 03:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751599365; cv=none; b=rSFlKw1w6OqFK+VoEeGOpdPfklhVwbnQfn0ZM/8SwpPAI3qtZf0Ke+Uqh8Iqp/uMiIhLreA1jNwXDLnHAnNjJK3z9QNWW5Al4UI9ovX0dqFqg2ns3vWi4m0SS7hsqhBD9r4WWUcNUpZCupfqv17ekMi/5qutVXpzTZd5B8eaJrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751599365; c=relaxed/simple;
	bh=FFKq2PZ+r/jdlj1d5i8kuTlyI1sopFx2h9LZ79R5A+Q=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=BRvQRowR6mjTn8o95T3PxgbUh1yLE/ZyBqqBrkRc3e3iR7iT5FgBDOhWAQZwCvSt3RTglEeGmzDg41PEYXWoD1EdfyRpfBimD3ZZiIYD42jqh40qEQgWgXfGrRbKbesE04QSLipuEUxDfKVO9ehugHpfK6mjgZL1VlbfpX264rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=HxrAlQSl; arc=none smtp.client-ip=162.62.58.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="HxrAlQSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1751599358; bh=bFXOKhRD3XQTRhPLxEM3PAo9vfwaWA7EHK/JAyHGCdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HxrAlQSligk11Q4vaY13Px4BfPnu3LekGX1YiNEGtw1PE15M/ALflucsR6VkjSfUP
	 612rgOTwu+xfLTvS0f85VhDswoEenles78xdz7UgwWrNl0RlHw5hrvBh3uV2MKc1oa
	 z42JwS3AxxJNBaFxir7KTGUiHLKPdRaK3D6hYMlM=
Received: from VM-222-126-tencentos.localdomain ([14.22.11.161])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 41D374E3; Fri, 04 Jul 2025 11:16:29 +0800
X-QQ-mid: xmsmtpt1751598989tu9g03dp5
Message-ID: <tencent_54FF4252EDFB6533090A491A25EEF3EDBF06@qq.com>
X-QQ-XMAILINFO: NMCsm0XXqhsSqGHC+kB9Lm1HUBzPkmLgoLRzlOUijHischq+TH3av4I2cs12qA
	 NbyVwEH/4vWdutakSDTOWAiyWypzEkhoxF77bdbL413cWyaF2tOqh0++NUwDgGlzINgbAjlXlyWj
	 wNOmkQ64HjH0VPClFndT3hixvfDLijqJpHO8Tqzh26SNnUsaimbeKeVZd+uZYK4MYU/xDtLHzUBx
	 rGbBgg/+HkHRFMNQn35VJ+pnGD8O/2dj0sceXP2vO6yEDy2iraK5ALeuhAAa8rfT+DaiwessBNMa
	 Pzsi8p8Kjnyaee9tH4l8fFSuAgWwa+jWAt3mBnHuueOw3gGO1VEPwUECJjmcaLzDRBOvkAgIJYGL
	 4BOVewoX7h7gDFNpi9NcYvUquiAIhZGrc4ii3y3KvvtIxgXLuw1qeYkQ7fu5tBObVL5zxU56jY8i
	 FH4Clw3wVX6hXZcYqdb9Wgmoh7AE/L6GAwDF+vI512hV7DnRD923thEi1YFWUKxxC2+8sL53r8aC
	 x+zFBeY6WCHCVvPZEhIllT01w9Abbbn8KpBSyS8cGxWCv/udsSBE0pPLFuhNJnq3HDk7UvWX0Adp
	 AWdDHnZ2I7MQIJECkPmfYoyLbUrNmkpLqRRtTYJoDdI5ktBv/3viCSBemaLjWeBeSgfFzbP4qJFr
	 xjZUUHpGapKxRsoK/wZovE9kJ+8dSrhq5ElSa5L4FpjlmbjhaFapzcMY7pElT61499+jTPzO5JCW
	 6AtHih1I8HoTXBFHask0FuOLu3+pZRrTUOfbUzw/7q2x0FbPkBKpe6XhAf0UHx3vEeOzwJNh62mn
	 Kom91FHElD3a8dwdz9I9jp7nvajTDcR7oXKldVBfNeF0PcFMbKuuKanWZ9g7oLvlPIIOc3wsPqYn
	 p9yH9vdEsOx04RU+Qyf7DHqfrRUQ6KxNEunf3QkE5T6siaHo3Mon4UvNxFx2DXgDp1H6SyzxuqtU
	 GHzMJcRE/xN7khy9zB1/UN5nmbluUr66NOskKcvb+6K97n0wAbytaHkTtDriCpv+/ZvEkPDdz080
	 WyKijJJtZfX/YFbD1c5l+wJfZ1V58NG7AFCqp/UEXf/HwAY3KV/gIoI3EFXtJ4xu6bPhNahy6CEk
	 bFRPsu
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: jackysliu <1972843537@qq.com>
To: harry.wentland@amd.com
Cc: 1972843537@qq.com,
	Austin.Zheng@amd.com,
	Dillon.Varone@amd.com,
	Security@tencent.com,
	Sung.Lee@amd.com,
	Wayne.Lin@amd.com,
	airlied@gmail.com,
	alexander.deucher@amd.com,
	alvin.lee2@amd.com,
	amd-gfx@lists.freedesktop.org,
	aurabindo.pillai@amd.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	joshua.aberback@amd.com,
	linux-kernel@vger.kernel.org,
	linux@treblig.org,
	mario.limonciello@amd.com,
	ryanseto@amd.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com
Subject: [PATCH v2] drm/amd/display:fix a Null pointer dereference vulnerability
Date: Fri,  4 Jul 2025 11:16:22 +0800
X-OQ-MSGID: <20250704031622.3124142-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <220f9fb4-45ad-4997-9572-564242737dd4@amd.com>
References: <220f9fb4-45ad-4997-9572-564242737dd4@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: jackysliu <Security@tencent.com>

A null pointer dereference vulnerability exists in the AMD display driver's
 (DC module) cleanup function dc_destruct().
 When display control context (dc->ctx) construction fails
 (due to memory allocation failure), this pointer remains NULL.
During subsequent error handling when dc_destruct() is called,
there's no NULL check before dereferencing the perf_trace member
 (dc->ctx->perf_trace),
 causing a kernel null pointer dereference crash

Signed-off-by: jackysliu <Security@tencent.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 56d011a1323c..393f87cfe74d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -934,17 +934,21 @@ static void dc_destruct(struct dc *dc)
 	if (dc->link_srv)
 		link_destroy_link_service(&dc->link_srv);
 
-	if (dc->ctx->gpio_service)
-		dal_gpio_service_destroy(&dc->ctx->gpio_service);
+	if (!dc->ctx) {
+		dm_error("%s: called with NULL ctx\n", __func__);
+	} else {
+		if (dc->ctx->gpio_service)
+			dal_gpio_service_destroy(&dc->ctx->gpio_service);
 
-	if (dc->ctx->created_bios)
-		dal_bios_parser_destroy(&dc->ctx->dc_bios);
+		if (dc->ctx->created_bios)
+			dal_bios_parser_destroy(&dc->ctx->dc_bios);
 
-	kfree(dc->ctx->logger);
-	dc_perf_trace_destroy(&dc->ctx->perf_trace);
+		kfree(dc->ctx->logger);
+		dc_perf_trace_destroy(&dc->ctx->perf_trace);
 
-	kfree(dc->ctx);
-	dc->ctx = NULL;
+		kfree(dc->ctx);
+		dc->ctx = NULL;
+	}
 
 	kfree(dc->bw_vbios);
 	dc->bw_vbios = NULL;
-- 
2.43.5

