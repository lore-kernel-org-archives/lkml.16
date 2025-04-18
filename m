Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEB02E40B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744956044; cv=none; b=KfQUZhVQHUNGk9kwuQXyszCBzonEGK7X8cZIZ7n5KoguwX+5bslWzE+H2pm7rjCpKjvdYiNCkDSdk1fDBkG/6o+yDxiTqS5Nd4vKxJqMJsJO2Sf1scLwLtJTatrOX/z0oNT+51EC8OCGLQs0suSsTmhK8XNJvxPc4nSNmAEDpl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744956044; c=relaxed/simple;
	bh=AQEGS95z85YKcGLQ75OsvUWy4lTSopmYDFcTt2h/ujc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ld146A1RAQxWEdFa2FF0VSivdkJB2+Lh2SRXTWs2KkrStQpOq2Gb8t7+AJpoDGlHiM6c6v2OtL+Fz08Yd5RiDNq75l4vswsAgcakevJbt7ZJfCJ7vTKLUEdUszWo7XHt+uY53uw3bpHgJF0+FQhJ4x5f0X8l6Tw90kHHrfYGqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 69f96d841c1a11f0a216b1d71e6e1362-20250418
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:4624039c-d6ef-4ecf-8c0a-aaaa1beb80d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:b712aa31f8a859ac46bd1d6ff95763ca,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 69f96d841c1a11f0a216b1d71e6e1362-20250418
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <liujiajia@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 982102950; Fri, 18 Apr 2025 14:00:22 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id DA2A4E028EA0;
	Fri, 18 Apr 2025 14:00:21 +0800 (CST)
X-ns-mid: postfix-6801EA75-73491675
Received: from kylin.lan (unknown [172.25.120.81])
	by mail.kylinos.cn (NSMail) with ESMTPA id 52697E028EA0;
	Fri, 18 Apr 2025 14:00:19 +0800 (CST)
From: Jiajia Liu <liujiajia@kylinos.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nemesa Garg <nemesa.garg@intel.com>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Nitin Gote <nitin.r.gote@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiajia Liu <liujiajia@kylinos.cn>
Subject: [PATCH] drm/i915/pch: fix warning for coffeelake on SunrisePoint PCH
Date: Fri, 18 Apr 2025 14:00:06 +0800
Message-Id: <20250418060006.807216-1-liujiajia@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

i915/pch reports a warning on a mini PC which has a CoffeeLake-S GT2
[UHD Graphics 630] [8086:3e92] and an ISA bridge - H110 LPC Controller
[8086:a143].

[3.490423] i915 0000:00:02.0: [drm] Found coffeelake (device ID 3e92) int=
egrated display version 9.00 stepping N/A
[3.507160] ------------[ cut here ]------------
[3.523341] i915 0000:00:02.0: [drm] drm_WARN_ON(!IS_PLATFORM(dev_priv, IN=
TEL_SKYLAKE) && !IS_PLATFORM(dev_priv, INTEL_KABYLAKE))
[3.523356] WARNING: CPU: 5 PID: 199 at drivers/gpu/drm/i915/soc/intel_pch=
.c:92 intel_pch_type+0x1c3/0xe10 [i915]
[3.709685] CPU: 5 UID: 0 PID: 199 Comm: systemd-udevd Not tainted 6.15.0-=
rc2-up-fc96b232f8e7 #1 PREEMPT(voluntary)

Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
---
 drivers/gpu/drm/i915/soc/intel_pch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/soc/intel_pch.c b/drivers/gpu/drm/i915/=
soc/intel_pch.c
index 82dc7fbd1a3e..011bc9757e9b 100644
--- a/drivers/gpu/drm/i915/soc/intel_pch.c
+++ b/drivers/gpu/drm/i915/soc/intel_pch.c
@@ -90,7 +90,8 @@ intel_pch_type(const struct drm_i915_private *dev_priv,=
 unsigned short id)
 	case INTEL_PCH_SPT_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found SunrisePoint PCH\n");
 		drm_WARN_ON(&dev_priv->drm,
-			    !IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv));
+			    !IS_SKYLAKE(dev_priv) && !IS_KABYLAKE(dev_priv) &&
+			    !IS_COFFEELAKE(dev_priv));
 		return PCH_SPT;
 	case INTEL_PCH_SPT_LP_DEVICE_ID_TYPE:
 		drm_dbg_kms(&dev_priv->drm, "Found SunrisePoint LP PCH\n");
--=20
2.25.1

