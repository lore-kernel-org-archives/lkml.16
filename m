Received: from sonic314-20.consmr.mail.sg3.yahoo.com (sonic314-20.consmr.mail.sg3.yahoo.com [106.10.240.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F95C21D5A9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691718; cv=none; b=mTG9pzHQNdlZf0on7l2Uyg11ssxr/iKxDcI5YVAn8fBzUdndJcYLlCeQpQfQmhy/8V5Mpkp2F5yjC4gOTxJBpXcD4yTH+rrUkKfIH3HF4Le1Qe8Jismdkfgm920cZne9K5epUjlWJ2a/dwZlbmruzW+SxFSD14jVlOQTNO5/e1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691718; c=relaxed/simple;
	bh=ZrnAq0IuNgUpeEiPhB3wQpdZsL7zL3sWVc2GoRNIiiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZPMwajSTBFS+H+QNC8QjzHjP6a21kJCDwYK6a73ZAnoV6nnge9dCSC9vMXXhXlFc00ZPkLsnHa2/urcKnkubtREhH8cJN1hzlSMEY5yMC2ONiG6Hc+737bCbq1teg45FOjUI1m7Z6xvIo1a2TJG/UK3qCumSW38xhE0SgaoGc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=anAupN4/; arc=none smtp.client-ip=106.10.240.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="anAupN4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747691709; bh=dMhdvCMDHfOzaQHLfNHzAlqFXumuXI3KNrHscno3n5A=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=anAupN4/YYYz7z5Vg1p/g8oj1u1bt2p4i3bze1v6aHPGUSwu+BnJRTWO1bNju2ymGlGZWF86CwoCEegBbTISTvOseZfb02T12kNV0HgkgWqZkErKqwCTKdpsKcyBpISvj8kgxTPXziuPER5/bgpHBZwArCYFfGMfa8qXQRJoTpow3e4qAtyDy1tySJvr6BzP1T7zckukX7ogBdCKfjYz85FjE9ALyN+0cEyTMJ9wJD+UtwqugCvOIbIjBGywv2W06hYtIvmntnEI0eyTjuKF0s30izwrmeQdslc1VJ+EgEGyZXS38xKnrF+/vQw5NZg4Gf422URJDKW5UF4t0ty/aQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747691709; bh=he+hh5rmTZ/nuLna5NYFVcKmRaz3rlPsts86ypf0Baz=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=j2c9RmTWRiWsayqWIBJBT8K6vPA+idWMx/rvL4eyMTENAL8LGcuvArWjzyHyUAwPTOY9AdrMXAjKuOY827NgqnzOtRuABjSmH1QpvjyMQ1K4JdBTYKQXrWNlMQzjuKajMd7jhoooJ50dnMCgWYSifI1NX8Khbo/k2qa+B6sQ/WquPzDmaVqOCGzTfNx+WbX8NxjtzLMYg/gA4YbVv4FPDJ+nSGA/UltxAumJmPM8XdOXy84/Rl4xCxDaS5IhEZekz66PE5dvoQmOass8xEV+r16hY6ST4eMkYKyUa1vxguTus4RCmwuuGJQ6fzq5Jbh86ekI5UKw3/x9zdTcj64IWg==
X-YMail-OSG: XMcwgRoVM1k3nZHnzYRcQ3zZZdW74vsnmPfnBSLdf3yE2i.rG8SuCVYnjZmEZZm
 VxVBCrbnwtROSyUia8bgoq8uMob3mS4PN7HnseHcxGY6x6oT1jrCqOazQ4y2pt7LYCNozCVm0tYx
 mP8lNxOU1MQ00spDAxKEP1vWsMLQVp8WLmtpm7fxuF0BaeU.zzJxqoUa1Ktmd3OagfydjwUuL60y
 oc5BBbAf3ZwyoEpAXm.qtVsA91FtrLH_LdaC.IZQQ.GqIs85THpWHJVl3FkzN0rQ1QpLHj8VxPeQ
 Km.V9I69J3pxgpE2PwXb5IjfXElciH1M92rso1QOMsVZpcD0XrraX907_lG9ydeddOAS6SqQ2T2d
 kQb01rtGBWqSFJk0zk4zjLSCbdv0v3dc_Xp0tydITov.al.9licxn5ZdCxrOwzYeFZnZtXSQZHx.
 1tSlKBV57xhZw3DIWDnQu73CPOw3B5IEkI5bTO3GXqUUd1eqySZ8p_5T_wnn547vCczUC.jXWIBP
 T_MRcbWD3XRxNhMKv7_iGK__FSaSHps2LutDOnMWKTor_ym7gSpD5r0tyHnUUjbXcXjPRbvK4jjR
 e7IRlCHAbKJAeFUAV1aWnCiXPMvZlpRXhPFZA.55HizuIa786e_jdQcaZ8rF6PV.6YbBFXAqPbhx
 mESVqS8i5AlA0UA1wz.j.EYROLdTvr55BV4ZI7wQVhmvtEDDW5jynBbqrRgEtqGXKQuJGKfcIn_Y
 V7_7dNWrNE0YZi2MEWhet15y2Tf.wf1OtgYASzYWhy0NGqrX6xjAgksD.AurM2ZOvZMjL2MkMLVS
 Z6NyNeJfvyAgdCoK.RNXeCnBe.nthvnD.KNhmMm5ZzI1a_DPvkE8mhijIYgRpUADxpmy7wHEVl02
 J2zeHLaRWlTTZuRjtHkZhl1QKtWqM2JwNd2R3OH9ERP_fu9E2CCDoIpIYDK3PizsVpUX.4ruAtNB
 gtw5eQtlsv5FHOZSOr6PqcnSQkbscpJVtaT7XLwfELDQwmJOruvvRn.PXV2QB2mq_6ptwJpjy_K0
 AtMTxD5tm8l6WQJB9gpHE6IfDMWYYLmTtFjlY5fVYzypsfy9th84K6gLuFnLrWPf1r77ljmraFeZ
 3DRVlG.hC6V8BexapYZTnoX0h8WPRMlLg5o6pjqHUp7oN2aQu79e1O1E3r5uCO2nhPhCkhetdYFL
 UkWSyVhz3usqcU0asXahQGabG7A3O1og17IyS94OAZ7yDnq3gow239CdOAPIxBq6hxtF2hXGmnKf
 7DKY2fmNHXgLXew6J9kUDZ78T.839ZtloVUTQoTlmkyh5DmcnvdvxX0hi3ihMwMdSkEjTfz4mPN1
 CzxHGx0n72EDRb_PpZAxVXV1P82ChgJN0AA65EXzteIkQGl1SINwdqeTY9.33XGHZ0lMSgpgoYzW
 n7YQLpTdIAgspIb.m0XKyfg_e.0egChISCy0eqpa5iaOpeg5djq2kMCidfNPYrvvUmrDHiPffeQt
 iGLgfPrKpC508n46J0zAtorJY5lTHE8eutVz1U4014V8aDDprI67QcXOQhjTL0vnmMMnU_zzUJOH
 WVS1gLeuqLIo9ss4afukrG7OVkTljpWsU4c0.ynRzFxRhWtQoNZJ.8NsXzvpt1GuHAKsxiq7lSST
 V2Buup9PrfKSBSeg.LDmv1vBWo2IlsHx1muG8EoHtl1biLRtp3y7d8uUBZTaNROF55yG1xnBIAVt
 NUGBo0X5a77t1cId7q28briZwEPADrHi6I.pukrmDXhgA.eYATFB8ViVFcHhtba6kgb9OuQwrZPR
 ZZQCgxnwYQIpwy5ZG52v.X4pkzQ1OEZiZi0SpEsO0wUC_kqMCQ9OGbZu.X1NgAys_mccHC3rE4Jw
 4coMLiUd9XaSwiJFCVjeQJP0vR0mvn6CE9IIeD0O0PKjfcGlH1vxzyPidab58RgLET23MRZq2XIV
 YDhrQVZjMShsAfLT5o47gyl8d0NZhTz.CQJV0Zi8D4nnWOAbH.BZ_BnkC8TRzZ__P3uaxjzLzN55
 Ad4vulWP6KbHYjZJSgXJgHJSspGGTgxTt1Hrfa05q1BWn8lPM1UliQ1o3sbLJMv1sx2YdV_vAz_3
 a.aeDElQShyLQzJZhIBOu1nKifs0Ep22NGcu0HBF_ro9ZcVFvzvNAFKKIouqz6zal3eYiOYxkvMZ
 EDEp.65HGOCAoolMrOyz1uzD8ZW8iTY_R3jAM7s7_Q3b3HKSt8A3eEsu.f.0O.XF.R8VSvreZMHb
 nhEjVXX7aF_WtMGMXAnHBC5E2kqUYimaAsolf.c3REl_m7Yi5wpIco9NR0lyN8kO5GyaJT8tXkFA
 FE0ix2oGSQaFCGiYis7oJW8pc6UJ22t8hv6Gv90KKiRU-
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 58b272d1-c173-4385-bcb6-c0629e8c989b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.sg3.yahoo.com with HTTP; Mon, 19 May 2025 21:55:09 +0000
Received: by hermes--production-gq1-74d64bb7d7-rstz2 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d5fa22a8ec8900100267a57050f58b0c;
          Mon, 19 May 2025 21:55:06 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] regulator: max8952: Correct Samsung "Electronics" spelling in copyright headers
Date: Mon, 19 May 2025 14:54:45 -0700
Message-ID: <20250519215452.138389-6-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519215452.138389-1-sumanth.gavini@yahoo.com>
References: <20250519215452.138389-1-sumanth.gavini@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the misspelling of 'Electronics' in max8952 driver copyright headers.

Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
 include/linux/regulator/max8952.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/regulator/max8952.h b/include/linux/regulator/max8952.h
index 8712c091abf0..61dcd8e00a2f 100644
--- a/include/linux/regulator/max8952.h
+++ b/include/linux/regulator/max8952.h
@@ -2,7 +2,7 @@
 /*
  * max8952.h - Voltage regulation for the Maxim 8952
  *
- *  Copyright (C) 2010 Samsung Electrnoics
+ *  Copyright (C) 2010 Samsung Electronics
  *  MyungJoo Ham <myungjoo.ham@samsung.com>
  */
 
-- 
2.43.0

