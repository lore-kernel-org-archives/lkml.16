Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F886EC2
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 03:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750476471; cv=none; b=JuHTfCj90alcDbyNTABCcOd21ovyQdR+BszCLgGSYmEwk6iUoidNVYZ0aM7Iq8QO7jE1DRRfWI6MAebuS7/zem6np7ms9oWIPv+H56kMNYG9XJIkpkJASXqDxUWhUlA73MKA7Ny0X4SL6GQhgfPDAHAE40ld+Hh9MDILE+knLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750476471; c=relaxed/simple;
	bh=sfYs9D91OAJaQCwk0QS24+rWVG0p4vN0q6to+fuW+ks=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=k8M49AQHJWbTHz36bwiFHw5RglMprBaqxhxbMGtFYEsXdIVxRnN5+kKo5x+gmVfN+bdAYJcBXMY4B9HX0Xv69ARdVt/UniUGhffNgWcvDioTUAcoZHN+jHnX0NtIWJQ7rkvCzm8TgOTxV7xheoG0eBPr9ZBZH50/6mBFHTyy3pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4bPKXv1QrNz51STR;
	Sat, 21 Jun 2025 11:27:43 +0800 (CST)
Received: from njy2app02.zte.com.cn ([10.40.13.116])
	by mse-fl1.zte.com.cn with SMTP id 55L3Recj078408;
	Sat, 21 Jun 2025 11:27:40 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app04[null])
	by mapi (Zmail) with MAPI id mid201;
	Sat, 21 Jun 2025 11:27:42 +0800 (CST)
Date: Sat, 21 Jun 2025 11:27:42 +0800 (CST)
X-Zmail-TransId: 2afc685626aeffffffffdc3-be099
X-Mailer: Zmail v1.0
Message-ID: <20250621112742498q_NLTyjSUQoBWFl8SFHu1@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <harry.wentland@amd.com>
Cc: <sunpeng.li@amd.com>, <siqueira@igalia.com>, <alexander.deucher@amd.com>,
        <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <fang.yumeng@zte.com.cn>, <amd-gfx@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vYW1kL2Rpc3BsYXk6IFVzZSBzdHJfb25fb2ZmKCkgaGVscGVy?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 55L3Recj078408
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 685626AF.000/4bPKXv1QrNz51STR

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_on_off() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/gpu/drm/amd/display/dc/pg/dcn35/dcn35_pg_cntl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/pg/dcn35/dcn35_pg_cntl.c b/drivers/gpu/drm/amd/display/dc/pg/dcn35/dcn35_pg_cntl.c
index af21c0a27f86..509bdb1ca9bc 100644
--- a/drivers/gpu/drm/amd/display/dc/pg/dcn35/dcn35_pg_cntl.c
+++ b/drivers/gpu/drm/amd/display/dc/pg/dcn35/dcn35_pg_cntl.c
@@ -24,6 +24,7 @@
  *
  */

+#include <linux/string_choices.h>
 #include "reg_helper.h"
 #include "core_types.h"
 #include "dcn35_pg_cntl.h"
@@ -236,7 +237,7 @@ void pg_cntl35_hubp_dpp_pg_control(struct pg_cntl *pg_cntl, unsigned int hubp_dp
 	}

 	DC_LOG_DEBUG("HUBP DPP instance %d, power %s", hubp_dpp_inst,
-		power_on ? "ON" : "OFF");
+		str_on_off(power_on));

 	if (hubp_dpp_inst < MAX_PIPES) {
 		pg_cntl->pg_pipe_res_enable[PG_HUBP][hubp_dpp_inst] = power_on;
-- 
2.25.1
