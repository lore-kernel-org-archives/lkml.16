Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9D8EC2
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 03:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750476365; cv=none; b=YTfd7GQg/W5FLEEfD9XGJJRTRgSbmviDV889HNlHli5VeMr4lOmstPTTbyvj7/pPBhVnDtUHVXRWSOMJtJoYb7WdeaZn7qJjowhWDmMzxpKMVuolX2LNDnpf+3PgOmwzJubFMeb5ekPc70F/FgrKv0WOcsKw1hhrLGFoVkXIOwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750476365; c=relaxed/simple;
	bh=TkL8NC+n40cKBwgvT0qUslQgj2wJRIbnRLG+IBmSscY=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=e0LQt+Bj/E2XWtMnXC43r2CfYG0JFdPOFfdszEI7xVTiebStoFu5IGZR5evKd+twMeHgajKCdK++MyDFFdTuy3KglxuNY31ceJ+VH+HpuhzU1OhvZ5AXphc1oaOiuF6VRecZxNVvCgUk9DXQl3waFUzZFeXFFn3Xn1+Yx4PBFLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bPKVk55gbz8R039;
	Sat, 21 Jun 2025 11:25:50 +0800 (CST)
Received: from njb2app06.zte.com.cn ([10.55.23.119])
	by mse-fl2.zte.com.cn with SMTP id 55L3PmqI092905;
	Sat, 21 Jun 2025 11:25:48 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njy2app03[null])
	by mapi (Zmail) with MAPI id mid201;
	Sat, 21 Jun 2025 11:25:49 +0800 (CST)
Date: Sat, 21 Jun 2025 11:25:49 +0800 (CST)
X-Zmail-TransId: 2afb6856263d54d-d0810
X-Mailer: Zmail v1.0
Message-ID: <20250621112549751vVGpmB0y4iZLN_I_Dzik5@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <alexander.deucher@amd.com>
Cc: <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <hawking.zhang@amd.com>, <kevinyang.wang@amd.com>, <xiang.liu@amd.com>,
        <tao.zhou1@amd.com>, <yanzhen@vivo.com>, <fang.yumeng@zte.com.cn>,
        <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <xu.lifeng1@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>, <mou.yi@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vYW1kZ3B1OiBVc2Ugc3RyX29uX29mZigpIGhlbHBlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55L3PmqI092905
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6856263E.000/4bPKVk55gbz8R039

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_on_off() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c | 3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
index cbc40cad581b..c3c88d8e1ce2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c
@@ -22,6 +22,7 @@
  */

 #include <linux/list.h>
+#include <linux/string_choices.h>
 #include "amdgpu.h"
 #include "amdgpu_aca.h"
 #include "amdgpu_ras.h"
@@ -873,7 +874,7 @@ static int amdgpu_aca_smu_debug_mode_set(void *data, u64 val)
 	if (ret)
 		return ret;

-	dev_info(adev->dev, "amdgpu set smu aca debug mode %s success\n", val ? "on" : "off");
+	dev_info(adev->dev, "amdgpu set smu aca debug mode %s success\n", str_on_off(val));

 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
index 3ca03b5e0f91..81dcc7ebac3b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  *
  */
+#include <linux/string_choices.h>
 #include "amdgpu_ras.h"
 #include "amdgpu.h"
 #include "amdgpu_mca.h"
@@ -519,7 +520,7 @@ static int amdgpu_mca_smu_debug_mode_set(void *data, u64 val)
 	if (ret)
 		return ret;

-	dev_info(adev->dev, "amdgpu set smu mca debug mode %s success\n", val ? "on" : "off");
+	dev_info(adev->dev, "amdgpu set smu mca debug mode %s success\n", str_on_off(val));

 	return 0;
 }
-- 
2.25.1
