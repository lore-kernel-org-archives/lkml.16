Received: from sonic309-19.consmr.mail.sg3.yahoo.com (sonic309-19.consmr.mail.sg3.yahoo.com [106.10.244.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2162213244
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747559294; cv=none; b=qBq9RIGNWoWbptcYv1bPfbTvPfznx48pNLyE9SfI9uscGqR5JWy6mJj0DOdNb2hRPyD9ZAclRVfZY5EsHmCBE1DGxCVlXyReX9LyLVfNDVDGLEEvqBMCenV19tKIz8zAOcbBVzhYDRr9++ePaFq0frKFLqAS7yqipx0Uoy/BNOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747559294; c=relaxed/simple;
	bh=VlAtTkui2OE/Rj3vmwWMNBwi/G2Hq8iTTDWWq8Dwb2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVMP5GC28SpFTUcGuV2gkuLppgL33Lsxdpv3cbQ8LplMd5Cz0OrjGle6HfqPfWdRF6I6ythKxUgDptzStVUXapcJtZXcBVe5Cwgw4qztcC5PI55o0X0QQWafJEkl7JL/1co2SmTBa89OOxhhwFojScdc7iQRP1+WnCI6LXhfa+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=TrytZ80W; arc=none smtp.client-ip=106.10.244.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="TrytZ80W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747559291; bh=ooiFODwM/51nuWtn5tsBmkyc2AA1PeL5txGvUP6Gu3o=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=TrytZ80WeNoU2Ms5tmpcywwTKUHDqycRxG64ilZXh+EzsI8nRsxtTmtMPY1pWsK2u9/yFi7Jx3W2mn0AdejSI+k3WZ/zoJMOFZtSwpUTpsN+665qppE8siER3hY1n2zKzQGr8CL2TFWePQXVjv9JSlsDIqptztk6TkDGSnexmBWmcjIDa3omrJOfqo7JC+ldfWK12kw/wRkkwhdj4augaDbfdFQAJYdgOShHDQFi011moG50pBV1hWX0Q/ygUnGFkSLohybM0RNdCZWq3La3nW1g3fJ16VZxy5SXIQXk0akzfP8UIK82NF43evGJ3KATJGhvs7TZbHQqAFMr5svEnw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747559291; bh=JVpqkkEGp+liETKnrERkytAMLc3hsBk1zcZeWR0Pyvp=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=cXLK3xmFh4aDTLlV/bZ0netengDyCx6fImrsrehti7Kow/z70LLwZ0D1xs3xx4QpiM8AI928NA7U3xrLY+QEityxqxEW17Z/gYf78RCecZ6/yGxjyU5mRP4Hm4tu12rUQIqtvbYZcKOl5135TwN3wFTfNDgbJsye7vMRrSnr5juinSziMMxOBHZNdSSFs6NcZZkEKkK1dEQzCQb59cdQbQvH+U+D4GHBHXv5nWlD+ejli6N3OYcK/kSOa7jwgSX+cT7uojHO3Vx+wvY+ePUkP/rHE3IfWodtwdEjHS9Gv8I2TA2HxrQk0vJFr04ti565qpB7D5XhNj1YOP/mQWqC6Q==
X-YMail-OSG: JdrmyA8VM1mnr_0myN.SiyuStvTRAhgRsqJN9GQ3_OGTpaJe4yk4qvCGGiRrfkA
 YXUwW9d8uoslN8vhLpdBaSwCyBbYs3ulQHPaYhxMEj.D9yukvA.a2QzfNH7scbUSN3IMOeU3AyGx
 bCGpQ53uMst_j.wQxtcfD0QRMA4FPW7VpG7FUZkgUgP4B7kOVj8URP57Vr45VxIoVPvu4jvMH0bC
 Dv9EUYvprkGK_q8JlNFKjwARG1De_Jun95_6eVDfyiFRW3SpTBR8Dh43Zp0IGXvsPB3YC8pd2.BL
 qA.kRKt4jCWqxOMkGjjNwzHtyIragfJ2L1w6tTCoRK9vE4T6T3pvKKKr16JwaYa9bjIug9Vajag1
 3EExcvblU.pEGVbYPH_TBY7kOG1GIN6NsISlfKa3mkWCc_Ex5Y7l8B2vTO0l8i77MKk4I1Rxpg2P
 JNbMcLTgmQSPRVYh6UPmcluQULMrq_ZuDYZN2EjzIH0p7KLKm3LB008waPVzl0yVdqiQm_lOG.n6
 d0KYUyLMLU7Fg4UTFD5HgJl8wW1ew9FEzEosZawd2lTdCyiUunB1tVTHRhjxgiFecvAl.YBkRRhB
 cfU7_joEn1wzw3zJbNFBorXo2y5SVk3sOvKwROX5QJuyjD9aKWuIWCyFgQxYT8UFq2jEgdaAkovs
 kbuUETfn1zrgMwlv7iwFLBM6zYBjOnFOvFcLjuCk3n2Tyjp0dm6Z6IacJYQgaRRHBUm6Nx53eTkr
 MROHEn6l2Lt.WMHrEWVmQsho_6UidCwrENMOyD2p2pgT21H9JYmf4KlJNd4RHdjAs6.ntLaqCEye
 go.9YVuwjBmMihLZxFa7JwNJ7NQFIaJSUieQV8r3bmBdSAk7fklKHIUrm8XaXjOgu2ax.7hoW7hP
 aIrtRbM1yYGnoGYIlLkMlHEIVY6PKYGOw.2j6ToC.IsfXISgLEf8YsOf6dyaqrN8ZmOa0odmKIRt
 51QwvDkHqNLAfuUF9RULhwH_TLVFgAkK5vub3w2rgZFU7v.21Uys602Wv5z0ikkzoM5X5152mkzO
 HZu0kz7uMuaqY0zHtrbdHUPg1V01HvFW3nLKfk1BppflwGmPM5mYDmyHgLpaOW7j_QBDxpnmkblh
 jHin6Wfmdd1NUPfv0700lbbb4QSwHwtMGa19EZBrsvOXwYvJXGqorMkTLGoANk84ocf87WGpsz7h
 b0TENJSyOziavDxPQn9WiKcJYSHJjDpw2a0nS9IkIU4sRrgSbI6ysFlMLkUu3L0.x08H.Cg5Sc0Y
 lmmlgbGK9wkZseD6mOm5mx0vlEiQCC6H4G3eC81sLBnQF56eburBYtInWJVoMmq9sN6DlHDNzxpz
 cuwrm1C9LMcTYkzIWsnB8vqeirhrMJjBD20HWQflY8KzkETq_RBLCCEXivXwhAf9IU9Ozb4u4fvb
 B1LgCKXQhGCXuqUrGcqhfNByCqOBVbhj_F5USiTSVHbEOWMejs5cvtUv4HM4bwe0p_ERA0sjr.vb
 vuD9x924bQFADv81Fi.eFDN2iQNyMZ_UqeS2sEh5fTrjHp0v6igrkV._szFBHeULLxw4F2cLzy_i
 APbmDPvT3J8vRVWENOZgcf1hFBnqW2KRsgcR35jNuAdDxUl5IgCedvf_CJqyuymKdaaaJId2g.P.
 4sV3bVHeMcUmJKUTgBCdfKea1ueDZwTkJtzOxbFVs.Sm3UtmNV5aI0yFBjW0bvkASadeGPMC7HmX
 lZmohm70_tveX6MLPihKJInKffGRp3.blh7JIc38KbPRJpIecHbDgAe93GNKdIzR0cINw3XEY24a
 RtGu19XCROCYiv_KB5c_9M0pnRMBWD4KiXOYw__WWLmwrBgeBp92hi.kTcnHCpXKHmB27T1Emb.Z
 otTrplE9osL_C.EIMKhFOqmJ6mZq8wXiseDKYoV3AwaAos.Rwev1aaWzrbZpcJmoS1bMron_iYMm
 qnDN5pv0HkXRXi1uCYWnT8BZzxOFFcZjlUpihhhlODntbTHMa3tmoKn2chiFBCkaXYXGUEaWXvjv
 gvCVygZ1yCRKSp3TkD.G3RHyQ4B1h2vJfKjJtsDVmA.wAEjy6mEY7J9qtYYBghwbsokN.qwU.Ymn
 dB3.dlRy_Gpgx6xhxPa_tvmCMREmO19EqQXfXWk_GYwkq20qGUWjdTr60_V0NaUgkRn9ANmKnmNw
 5ZD7In6CB5jHlpYKuafW0yMXsxbipy2cHZY83tYo67vBgW6LuRmmUyDnbZUlsdw7UZRKNevO.qjZ
 .RjjyfZg-
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: abe1b631-53a3-49db-ae2a-1e58939f44b6
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.sg3.yahoo.com with HTTP; Sun, 18 May 2025 09:08:11 +0000
Received: by hermes--production-gq1-74d64bb7d7-k2g2q (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c07c4a4ea2b90ef9265870a2a8be7fd4;
          Sun, 18 May 2025 08:57:56 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: cw00.choi@samsung.com,
	krzk@kernel.org,
	lee@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] mfd: maxim: Correct Samsung "Electronics" spelling in copyright headers
Date: Sun, 18 May 2025 01:57:30 -0700
Message-ID: <20250518085734.88890-5-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250518085734.88890-1-sumanth.gavini@yahoo.com>
References: <20250518085734.88890-1-sumanth.gavini@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the misspelling of 'Electronics' in MFD driver copyright headers.

Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
 include/linux/mfd/max14577-private.h | 2 +-
 include/linux/mfd/max14577.h         | 2 +-
 include/linux/mfd/max77686-private.h | 2 +-
 include/linux/mfd/max77686.h         | 2 +-
 include/linux/mfd/max77693-private.h | 2 +-
 include/linux/mfd/max77693.h         | 2 +-
 include/linux/mfd/max8997.h          | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/mfd/max14577-private.h b/include/linux/mfd/max14577-private.h
index a21374f8ad26..dd51a37fa37f 100644
--- a/include/linux/mfd/max14577-private.h
+++ b/include/linux/mfd/max14577-private.h
@@ -2,7 +2,7 @@
 /*
  * max14577-private.h - Common API for the Maxim 14577/77836 internal sub chip
  *
- * Copyright (C) 2014 Samsung Electrnoics
+ * Copyright (C) 2014 Samsung Electronics
  * Chanwoo Choi <cw00.choi@samsung.com>
  * Krzysztof Kozlowski <krzk@kernel.org>
  */
diff --git a/include/linux/mfd/max14577.h b/include/linux/mfd/max14577.h
index 8b3ef891ba42..0fda5c2e745a 100644
--- a/include/linux/mfd/max14577.h
+++ b/include/linux/mfd/max14577.h
@@ -2,7 +2,7 @@
 /*
  * max14577.h - Driver for the Maxim 14577/77836
  *
- * Copyright (C) 2014 Samsung Electrnoics
+ * Copyright (C) 2014 Samsung Electronics
  * Chanwoo Choi <cw00.choi@samsung.com>
  * Krzysztof Kozlowski <krzk@kernel.org>
  *
diff --git a/include/linux/mfd/max77686-private.h b/include/linux/mfd/max77686-private.h
index ea635d12a741..e6b8b4014dc0 100644
--- a/include/linux/mfd/max77686-private.h
+++ b/include/linux/mfd/max77686-private.h
@@ -2,7 +2,7 @@
 /*
  * max77686-private.h - Voltage regulator driver for the Maxim 77686/802
  *
- *  Copyright (C) 2012 Samsung Electrnoics
+ *  Copyright (C) 2012 Samsung Electronics
  *  Chiwoong Byun <woong.byun@samsung.com>
  */
 
diff --git a/include/linux/mfd/max77686.h b/include/linux/mfd/max77686.h
index d0fb510875e6..7c4624acd1db 100644
--- a/include/linux/mfd/max77686.h
+++ b/include/linux/mfd/max77686.h
@@ -2,7 +2,7 @@
 /*
  * max77686.h - Driver for the Maxim 77686/802
  *
- *  Copyright (C) 2012 Samsung Electrnoics
+ *  Copyright (C) 2012 Samsung Electronics
  *  Chiwoong Byun <woong.byun@samsung.com>
  *
  * This driver is based on max8997.h
diff --git a/include/linux/mfd/max77693-private.h b/include/linux/mfd/max77693-private.h
index c324d548619e..8e7c35b5ea1c 100644
--- a/include/linux/mfd/max77693-private.h
+++ b/include/linux/mfd/max77693-private.h
@@ -2,7 +2,7 @@
 /*
  * max77693-private.h - Voltage regulator driver for the Maxim 77693
  *
- *  Copyright (C) 2012 Samsung Electrnoics
+ *  Copyright (C) 2012 Samsung Electronics
  *  SangYoung Son <hello.son@samsung.com>
  *
  * This program is not provided / owned by Maxim Integrated Products.
diff --git a/include/linux/mfd/max77693.h b/include/linux/mfd/max77693.h
index c67c16ba8649..8e77ebeb7cf1 100644
--- a/include/linux/mfd/max77693.h
+++ b/include/linux/mfd/max77693.h
@@ -2,7 +2,7 @@
 /*
  * max77693.h - Driver for the Maxim 77693
  *
- *  Copyright (C) 2012 Samsung Electrnoics
+ *  Copyright (C) 2012 Samsung Electronics
  *  SangYoung Son <hello.son@samsung.com>
  *
  * This program is not provided / owned by Maxim Integrated Products.
diff --git a/include/linux/mfd/max8997.h b/include/linux/mfd/max8997.h
index 5c2cc1103437..fb36e1386069 100644
--- a/include/linux/mfd/max8997.h
+++ b/include/linux/mfd/max8997.h
@@ -2,7 +2,7 @@
 /*
  * max8997.h - Driver for the Maxim 8997/8966
  *
- *  Copyright (C) 2009-2010 Samsung Electrnoics
+ *  Copyright (C) 2009-2010 Samsung Electronics
  *  MyungJoo Ham <myungjoo.ham@samsung.com>
  *
  * This driver is based on max8998.h
-- 
2.43.0

