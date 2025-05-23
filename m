Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF5A224B0F
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747980882; cv=none; b=DoPgtyrFnS4E/a9w7yvUx3Exj08xDTk8sxI9LRuSbLNng2xJQmaH6xI/wlO7NjP+TAawRhFByWs3UYNhLO+oXXIHBIY8EmzzF5EdSb7BgqbxrYczRmB2AdfTH1X0AACN/JG6lxPclHwx87v5T6RUyur1logzFLABWgzfYy6TDMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747980882; c=relaxed/simple;
	bh=i1bOGr7LuV2jKyN0Rft+VDurbQhZ0sqDSfa/APXexLU=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=TuOGVTlcUvDMz8e+HxcRqI7itQwN3fZDI9+/tpnsk+/K0xaGmCJotyXtCqrZmLP7+Rq1ghshC0aUWDSSeVItKsTYO9AOWNnI9ORlkx3lJG997lJ6FaTX24avrG/M1H6cC7BwVRoW2QkvQ1iez81CHTV38UB3uOBscD3Lfvhophg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4b3Zch5Lk9z8R040;
	Fri, 23 May 2025 14:14:28 +0800 (CST)
Received: from njb2app07.zte.com.cn ([10.55.22.95])
	by mse-fl1.zte.com.cn with SMTP id 54N6EKZ3007656;
	Fri, 23 May 2025 14:14:20 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid201;
	Fri, 23 May 2025 14:14:22 +0800 (CST)
Date: Fri, 23 May 2025 14:14:22 +0800 (CST)
X-Zmail-TransId: 2aff6830123effffffff981-8e65f
X-Mailer: Zmail v1.0
Message-ID: <20250523141422844GEA-yzba-OvN0lZirDsS-@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <jani.nikula@linux.intel.com>
Cc: <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
        <tursulin@ursulin.net>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>, <fang.yumeng@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vaTkxNS9kaXNwbGF5OiBVc2Ugc3RyX3RydWVfZmFsc2UoKSBoZWxwZXI=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 54N6EKZ3007656
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68301244.004/4b3Zch5Lk9z8R040

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_true_false() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
Signed-off-by: Yunjian Long <long.yunjian@zte.com.cn>
---
 drivers/gpu/drm/i915/display/intel_display_debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 8d0a1779dd19..0e3e62468902 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -5,6 +5,7 @@

 #include <linux/debugfs.h>
 #include <linux/string_helpers.h>
+#include <linux/string_choices.h>

 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
@@ -972,7 +973,7 @@ static ssize_t i915_dsc_fec_support_write(struct file *file,
 		return ret;

 	drm_dbg(display->drm, "Got %s for DSC Enable\n",
-		(dsc_enable) ? "true" : "false");
+		str_true_false(dsc_enable));
 	intel_dp->force_dsc_en = dsc_enable;

 	*offp += len;
@@ -1183,7 +1184,7 @@ static ssize_t i915_dsc_fractional_bpp_write(struct file *file,
 		return ret;

 	drm_dbg(display->drm, "Got %s for DSC Fractional BPP Enable\n",
-		(dsc_fractional_bpp_enable) ? "true" : "false");
+		str_true_false(dsc_fractional_bpp_enable));
 	intel_dp->force_dsc_fractional_bpp_en = dsc_fractional_bpp_enable;

 	*offp += len;
-- 
2.25.1
