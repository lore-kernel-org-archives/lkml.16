Received: from sonic303-22.consmr.mail.sg3.yahoo.com (sonic303-22.consmr.mail.sg3.yahoo.com [106.10.242.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A470F21C19F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691713; cv=none; b=eVdkGBjgQ/YR4HtKcqJLCsIAKOVo0VFqp/6TE1bm759EXnHO7Y7k1Co5T9cK9HTiOqcolG/DSoyzkCCFsvre/nzrMuuZUQnoJgIoBvgfd8GG4CSf3zrHqgBiXxqtUiKZ9ncuD0uJjp9pjpB4UapzO8Eo+2Z8xAnx33UTJFF+4nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691713; c=relaxed/simple;
	bh=VlAtTkui2OE/Rj3vmwWMNBwi/G2Hq8iTTDWWq8Dwb2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1a7p1g7TbJVTt9QlxiYInQzKObUFoxMzQgzrolAiwsjebUmZOn1wxmSdW85wM0o8FsgOyDJxsGt3a6HBlUYFVa56LCGfxugbmHwgnlwHBv9u0crKOXE91nGYLmZRH5G0l2BlF4qwsmeSEHsDmR6mg6kBpAhbeL1t7IZddDKUmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=o6ru5tmV; arc=none smtp.client-ip=106.10.242.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="o6ru5tmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747691704; bh=ooiFODwM/51nuWtn5tsBmkyc2AA1PeL5txGvUP6Gu3o=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=o6ru5tmVDtn0h4vntacN2GOvrcsGnRQiuf/1pJ8IfNpbRJonMdqSXzIhsB+ijrJYcezLZrbu4uFqwn9FMLXThCYNvezNfngoCrgf+DmatXTWXYtoI3W491O3cj3Xtp/CGA073MuU4kue8G4FucQU9Jx6IkpPlB5oPWOey2CyxZ/ae/8tZanec7xUUYO+UIaMbAldshI/xuJOi1h5D+AtBF/K2250rD9cSkKrqH/Ec2iFj8xZQFJO6QG8S40tiwoXLd2b+GOIXThfHGtFDLiQLVvTwmvLAw0E7O6DZndQViyfIVGokcWqI6tnfnJoKsk5QW2LLqraDtejAXfoEj9ktQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747691704; bh=OBQBK1Q/99V6aZZi7s7ZQ5DB3zd8X5A2rJm1P6cwFtp=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=gT8oH1Biga9w/nHUL2jXBFByeYTk/OqL72wlLvbgDf6L+D8PvsYh7zjWU9+Ony5wMi+RkNoj2bFAS/2epsKHUlvKwwnzmZ5WqBHfLEC2vVtvmN0bg8HCdLEBvV5J1VCJwv6lp0BPzICErJrBUWh8bNVVHj8/jws9AEalDH/zdMme9TlkdpkK/F+98pna1qevPArq/vJ8P2EJjwhFHfB3GPZz1vRjo61F0DZ26jsMkzvpOLzU9xNULrHWP6J9E4d3oDgAr/V/MazPYbAFFJ/FiNuuiTpStQqDuSeWWdXiRMf+7rNcqMjr8tkJt27fbhLekKuEkNXtZ720lEBAMxIBzg==
X-YMail-OSG: xpybelAVM1n1igeB8MFDXGgfvTLZXdrn7MRELj_k2M_Th0fCrOB3t7UXoE54Fev
 DAE3GJ3Ay2q_s_nDiABysk6NLm.z4l22SgC.8DFwVPO.RF8ff8TVHXX8syIUbzV9.nvJ58.kM8WY
 aepsQ4zzdkghOf7lRM_2r1Fkhm6RrQOJcz22sDL04N_MABgRFVGa4Gnf0CZ2jPMTHJkIlwQ88.bo
 8JmSjhjC0VsSHc7Qp05kD05fjP8RglsGFqTHij1exyO5Let2ww5_VKf3h9PSiF23uh_QynJjzn.Q
 Vq.NVOsC48t0uYPvZRlt3hhTvn1asxYezbrNT9ATPy9ztpTDf8fMtbjg543hudhi.ycFPyDGK.nb
 qOSpgFEEn9KAhLjoHCLz1Y3qopvPLLZGzD.4l9ta4cnaytuwWsjhEC8NCVhYuC44jttpsaF5W3s7
 cFVpABriNxNId.G_vYGxA8dka4Mmka66sBxovLWYhPWP5hT6IoigN_K5rbFrQTm3i8hjZ3ibJHla
 rSA.jwpL1lpCZk7NfK8qevO_FmmJPxGeCGrffIdPEfrtVR2uEGFYDrDuZJMwq5JtTZMVsV6_rJrv
 UlM__pOwgoEQjkuL0TBgAleKTzAsa2mBqsviFofjb5_RihqkYC8uwZD4iW0shITw_NdISYOa_5fj
 9Py_uKqgiZk6LT_UluL3844d59pETmHDVlYHmQwntfe9ukYZh6DDchziQq6Z.qEtvgwInraS7hLW
 u2r6OCdMpNpK39EXJXQ0h3wd1H3cu.FBjyCahHDcMlTm3qW2.2LCBOKRczGbDKj2GHH7p_SFJwjt
 9M0dwomlrVpKGLW.5EA4SijRbF8XMrQZeBjvfvH9Pd46.8PzxjHAJm8_CjIoKTBTTyHCcbUiESLV
 YG_MGAQc4VpifLOoatQ8bBADatlu8rud6LAbACAPnr7KGw17HhejnRAVsdOxdBbM2Buk822QvXUe
 expqLa1PeAQds01Szqqq1HShXZ7v98Ur5AkcITCqxriSYiJGQN3PYbrDab.QHoNG3E7NvVhjRe3k
 Y4YdP1cE8hmnDmSXRZaiehq5Ae6tZGPQT_8uL7SV2rDBn7ZBn4i0qfPzalE2Y51kR21lrpZ.pz6_
 OwQ_btnF4Xh.e0p.ZFjbPS7shA_U.nek2FeyAI0smIZ9smo3ca3TuJSQWXdYi0Fs9Tl.0b_FXZBB
 KzfPR_ZxUjOq6ynF48LsCz2DrNGpjUuqAA6VIh9moWFHwDs.ORaA3mdc6SMwEOMl0mSXZbohJgLU
 e9VapyWMd5ZkjV6inPy86ls8MU3FYsWSG2feF3LJvvCghqk5MscY34UksBfCxM1QAuJjaAH9.KMy
 3rjN0JtbXw1X.lEYFf9Gy6wjTukULx4m4dmlIalbe1LszwnWiTErwfyExp8IT3vtI3vHeJGpK0fY
 NAEyYzTg0Pk7S1B_tJhZQ0hyTaKw2RB5BfGC.natrTtpMzRl7NJabSVXkYyRx9bj33e.i3mm5tXQ
 ACiacOBTysvnIKQB1OZU1z0iU8_SNdU8kBGYmJVFMSbBMpJb3m42A2GJ7xqj074IyARC5Na8diqW
 .p229u7jcTRjzn3rbLJhicUx_mlFSZISzg..SOdASB5_csqvhliQpN57_UX3ApeAmePR1ivauqPT
 G4tYJL_TL0aLHo221htSpVtnWCbaF8KXovqrhJo.5deeEIW6_lHjWbxoW.yJSKILjmUSTQVe600D
 oU0YvbC65rKTY72fRkEM1CbSJ1narlcYA.PB0XjsRSjwJkNvPAZbaEp4GY1nqM4bmdR2s9SdjiNd
 BopxpdS3w4azm0lxLV80v_51JB2ngIsLBxyaASCet5ihgQJP8thF9.M22wrpyaC0XSqJvPEImIyr
 Sg6TSJ7pYAikfVB6Qx80b2aKVDayyDu_G88GnsfHtY.XbCnS5cl5GiyeeG8LN3j2DKjntUvS6hee
 AnJnz3zo1qB.DHVPpo0Tst4Lq0qfuf4AWfB5krOs5HYCnMMXOpd_vSzY8anQsBa1.tqGl3NULRrp
 b68.8UZkr83SwCuTU8CqvMtCfcBwqtlInhcSpM36tyT1htlXChhUYhvBmc.69QuYEpe7fokOXYEQ
 Tq_IOOJysCIov9srgKK_ZlyZS7EOYcNJBmVHYoqUVSIyYWpGDf050mRa7MIjs0SG37Nkn6NAn7ku
 IkZVNjfMCmF54mc2eQ1EtMymDML6bQ0FZmLyEnPhxF2zHj14luLxMoSeYSmy2mzbCUpScAyBrLEc
 Lu5lZuQp9TxdByecpdp8Hrwl7aY4nmyFcNSopRdj8EX021T82Ubh2sgrSFwC1k2ojMy9ZloOJvOB
 lUs_Ard4nBY_eAt4oKsLTVxRRfxrlRGHPX.Zpcp5eFEOvVA--
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 2c753556-03ef-4979-a145-0a7275fc660b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.sg3.yahoo.com with HTTP; Mon, 19 May 2025 21:55:04 +0000
Received: by hermes--production-gq1-74d64bb7d7-rstz2 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d5fa22a8ec8900100267a57050f58b0c;
          Mon, 19 May 2025 21:55:02 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: cw00.choi@samsung.com,
	krzk@kernel.org,
	lee@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] mfd: maxim: Correct Samsung "Electronics" spelling in copyright headers
Date: Mon, 19 May 2025 14:54:43 -0700
Message-ID: <20250519215452.138389-4-sumanth.gavini@yahoo.com>
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

