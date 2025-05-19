Received: from sonic312-20.consmr.mail.sg3.yahoo.com (sonic312-20.consmr.mail.sg3.yahoo.com [106.10.244.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889726AEC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747697444; cv=none; b=LNSI7MqX+YecRblwyBBm24SPSd6CcHzZ0V08HBRtVr35s0BPy4j4gVIjg7cyjmcWkKl6JnUpAy4mY9fKn+mkAHnUDeFCoRCligg6Wnve5n/7JNn/rg7hGqv39b0M5AxZqXcChk01HqbmV8ZFnbAOe2YguCQ6aEBTHUSlOo9ijKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747697444; c=relaxed/simple;
	bh=VlAtTkui2OE/Rj3vmwWMNBwi/G2Hq8iTTDWWq8Dwb2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=b5EuCKPvBlOjSSjczeN7ctQFrxD8sdCy+rwm+mmqzCUtyokQJxPNxDf8DIsvpDPPJkAL41KyCbQldlWwbiONSs9gxOsUIDBPfeHg5FF3d2rAuGM+R02GLdq7vXb07HXkfHO2yfcBJ5dNXG6t8w3bDMTnemDFQJHyxdO6KqMakk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=KKSDb3uM; arc=none smtp.client-ip=106.10.244.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="KKSDb3uM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747697440; bh=ooiFODwM/51nuWtn5tsBmkyc2AA1PeL5txGvUP6Gu3o=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=KKSDb3uMhTZTH+s4BN5gNxJlMH3FGsll8PgNWItL3ACoUW6F9aqIH3ICsBpH2Nwh2btu9pfn19nCgRviKLsaLvAEGeCohYekD8Y0AaZgJjETBQHSPmwLEt65dd7mI54bBnpZvlzbbB9czPxhWOb08YA7QMDmxf196ZmIezhwpxuvJhhFPujqLcyvtcw0zaIxSQVbf9ZkXB6xQY5KZExZCuWw5dsCtAAL2JCZ9hU6w4bzlEPtUGuYiWuvuxCkNOWvm4Wy8shc/sth15Uc8RodOFa8lr7DGebpXVssTunuK2qCleTkesMu5uuh10gbLMYjlHBT01dt7IUNwJK0HIhvCA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747697440; bh=G08dH/OBmA8rnLia7XfllFov07lC1RTspB6Xhvi0kct=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=WBC6LUHR7hOzPp+Rpr0l1J9IkkMOi1JGnLQZONnX+dvbDUfzc76vd2pKzAtDEVbvIxaCX5mcKmxyuk8KtquwfSWNMF8hmf2ehM73C26jmLdrUZM1E27tAFd7LW4QT5kTAV3cCLprIVXJoNlbYBIZ4lJqHu6h4SaN6T+8Mz5TN/rvB1tJnPoM601/ehHr/6ECDOP99u85zQy+z53oSbjpt0gODzIWpFbTMrOjvTAr7JKz+FMtMNnz81Dp6qzP2k8RZgS6TSkSlMS9w8fz5CRRWdSiRV2bI1GgZoZoTqLXSbUHSnGqb4GpEFo0wIr91HOUQ7j3xlysNquI6rmJ2x1vhQ==
X-YMail-OSG: Qn7anEwVM1kweaSAtR_geLqGbJFoK6mc6.PXhM7qPHeqJF9kN_uV6rGe0LsaSMj
 JzBEHT.wMdOBmgLcR0gttuGYXFLeObkGT2A8sDYnkd9mHmoL81VofUTluMVr7Y_JW6UgxEfN3xdt
 6Syj2Sp77S1opROe9T.P_RxjcmbUOxptFxM9rI1AwFR87KVTh1AQmJ7ZRsqaxuHdOl9X6FuENMlW
 XOMa1WfU0khdexx6Y37ESB8lW0f.yP9GS3OJ4C5TQUPfzHxQnCxvORPoqG.3xf5Dgy15HBT6aGgG
 3.dEJoCK2KtY.7M5M8bjGApYwJyDPxOVQJlK23BcBNBrrxH01KG1J_a_OZkljc7UUHbXGNhb.2xj
 a0BeJtkEZJ8NuardCp7NYzStF9OFor7uNTVFrUJBRTBaF0bf1VdFALIvtyPPUfgI8WOd8Iv3y3HJ
 8dr0QmhUuuJDsZh2frcD6OfDldfcpX243nAsn4axVfihLDwo.9hp5IQAJJY6zfvyQ9hv.eri0vOf
 2MYBIGj6l.N7NGTybYBIvnOUegN.VIpCdaMLVxbR4bBwsXFEOfdWGRmjt94Yr8Yk8CdnNjZRa2VC
 uZNphIOVFRsEd.bDOV52H4CuTSBUZ_BNpDfZ5SfSIzqKPROyLCPzvHtnaZFnCF4WBpUWv41fOD3h
 AjtMQaOorWpxURA.wFCF96XPCOKeQhv2vvUsHD8NhFjlvJ_7uK4SlNub3M.t1llhdRYQq00A_.Ow
 UwGAyJoHkDjJxZ1HyBtbPQbltXZYtnnfpO8zNSP8wtvt963vw.pjEurtK.wzReOqQPShL3.ZTPWK
 L8ycPS59ji2QQLWP5Qm5I8CGuTopRMR42nH4It_dtq1LLFfJ5EiQCGBtG5HK4ayhqpkSkg1ILqca
 yAzfKJsaHrPqJqE0cB_.b__YJBTNIIZ.VQxLGMiQ10pnlM4Sdg2O0xipvaNxPdy0jqFJ9z9vf9mY
 W7NWgUjBGo7Nzp74lwFa_UmSr7wuUac.xHy2hCWgcxUnqR1pK5YG_lS68QLvU4PJS4.g4BY6kjNd
 CUE577Eqvt169gMaVrgxxRAi4cUCqKAF0k7DWzmfoeiK6hWeTBDtaDTE_hQJT27ysV5hbl8q.3Nf
 si.t2yZm_dcHAKLTEdYSEIicMpUr1mWztsM02eb2hwVXog34I1js8FAJAvY3Ojo8ddoMZ_gvtYtJ
 ezLXcSU1ia8eGe5hdzGHpIEkQN21uUDxZZeI2ZBlk2ZuEznwMcYH6L5bdqTK5Q0h3NNFsdA3ITEk
 N07nGbEeDzrCwTHKMnm4Q9ZSt92katE_JEEn1IITsi1zsxL4.ifLx9phap_OH1FBy3Fz.vyz7_vB
 FF9OeR9yI6dSYI5kFZOPWZbRMZHB3evgqHYQswxSnAGEnFiiqP4GtXKK1MmH2fLh_48.KwXWNmhB
 OmJdNNgm9Xbc6pGCEUKi9cBwG47_YRARPEZHeXutmfVn3tSuSZb5pxhJxGyHl1RN.puOX2zRVoBg
 zwwEdtdh6P56xL_52NB8AgNPYxepjBklNyrZi.fUIWFeb3cVOBPcJ8.2dY0fw1hEWxhh389e1hkc
 .N_s6Uo5LcVxedLvbkiru_kvb3679IWHLZ9RRiyjudQUXxCNAPKaLywB664AVkKsmxpYToUc5vEf
 DOvCIgHMACBRsiiF2b0gZrH3dLsJ6zX8gilJ_DEcjMWjWwtnDiFlwkJ1bUOZUiGTOAF03v5kxt6y
 jQ6UPoH8x4e0Rw_H.Rlhu6LuZEh7NTRL9kcuyOOinPpH4gKKQInan6OkeyzKssRNPL6MlNELtmMF
 jvFXUKoHUsv21K7kLvATMLSP.BcLl_rJh4vAn2LvzXZ00aIzOVg9u_heArLhH4CnyCP4az.tfyya
 Kkq1NRJVex2vla3YMn3oEJUdEXNIO8gc2TpJH3DsW2y3xz0rW8qajhdjiYvsFy_LiBJh0M5P_ix2
 xFyFmUUghxaND0.CqZrttkar0fuOzSG8p4Q81SPTPrw.4dTSGtH9NtzIKO5OhNrqzcKyVscyUEt9
 Bzu6e81h7dIoEnTr.tpjB3wcjAiEDUJkGvCVZXr95..0rGGmU_2SkNsuJiFxTERFecF_qhlCZE.T
 hbGHp29asvZYdyHlyqlVt5uaLzAASkFroFqJH8uir.7WXpgwii1fH1ckYpDVuXRY0sg1USzWVdif
 1j0P0GnIN1wWQJitrfpXmxEMgDeY4gAkyNNv.VD2nMH9MMOmNN4iGtmQ.1BaCtd7gLwSUc6q6XBy
 53si.hv8tAiaI9I7sREzZDdCmnF.vxkfFJ.RADhXsQfj6qU3.GM44pUgZdAPaS63MS_CPKSYb_CP
 OC_58HePXy2ofH3Z5LXRgP7zFAgHDapp7nYivzgDe4rTPaj4A
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 083b1a3e-b95f-4ca0-acaf-a61f2683041d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.sg3.yahoo.com with HTTP; Mon, 19 May 2025 23:30:40 +0000
Received: by hermes--production-gq1-74d64bb7d7-r5xbr (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2c9ebfc0963bf7e403e75da8c471023a;
          Mon, 19 May 2025 23:20:29 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: cw00.choi@samsung.com,
	krzk@kernel.org,
	lee@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: maxim: Correct Samsung "Electronics" spelling in copyright headers
Date: Mon, 19 May 2025 16:20:23 -0700
Message-ID: <20250519232025.152769-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250519232025.152769-1-sumanth.gavini.ref@yahoo.com>

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

