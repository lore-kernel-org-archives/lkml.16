Received: from sonic312-20.consmr.mail.sg3.yahoo.com (sonic312-20.consmr.mail.sg3.yahoo.com [106.10.244.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC9E21D3D2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691717; cv=none; b=jFN6xPS9b0zV57HImH9oUAJTsht0nNI9Z/aGYlwrk74eW8SNv152SZGw3K2SGvJklovdPndIhXx+NP5XuxRq5eni0yMoqc/roeAdHuwGZj4VK86cciuFEEJXALW9m1jGQoFS2/4+49u423l00tr8S35tm+BwWpnvJ8zzmFBM/KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691717; c=relaxed/simple;
	bh=THAtlnyI5A7YlyKRFN50A38aLlv6NVAghYLtTAbg3/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKfvbjbfAfLUJh+QMO2QGd5Sip3EL4Dl4UY090xT5LatealLjp4jMHSjubGSznSHx/HpUMneg3Vgq8au7lchZM26Q7GZ26HB85yPus2B2KdvQRB6g1NttbZV6WAKzwlXlmXpIa6wThbRpUdosALi7coZ3qcgMtm+h/W0eNy1K1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=aKnbVFFs; arc=none smtp.client-ip=106.10.244.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="aKnbVFFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747691708; bh=ZeQ0tYAb36XtgJwft/Rwwi12MnfE/T+5p3dQ6k29hBg=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=aKnbVFFsJ2Bw75OeGWUr5yAfznq3srVztijlvBxTdWWUw+zzfV+ZZEXb1FAAc1Cu9BUxXcTvgbW5ZE3Px9DOvxTyPKzxhCz3k8UiOT1EpVpAbvOW41e1CnTLxh5H/4Mnpn6qKrMvB41ZdGFMTdjVNGIJFe35jlq6uJbwefjhVAdgiDIU64BLTnZ7Lzw1x4NI825FTLdEASNK6uN3IpjijUEgP6BeajmtDeBGsWOJm9IHrgxWnEcyRrjbjboRW+2gp+NNFSqVDfQ0qOStA3ZbXegwDbwiAb3aEWufhXzvdwhRdq7EiEgG8dPNSiNLVsyt8CeYymKsfqHc5cULimH0kg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747691708; bh=dAPpGbBirQX3q1HkteLp7p4pYk4lPh67U6YdCPL2RLh=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=TfFMevvWUvn1wfGTt5lXsI9E+QxeHRUAb2EIzTcM/GW4MS8ms7G4Wyw654kJDE6c3ZIVAv1bkeuARNHI/rARhkej6q6O2ClBJ4Y/pY7CCZiLkNbHz8AK2At6e1SyMYJd1WoKZegEkcA5s/Ug2Ou9aqrJIUuzqs7CjAhOB6mR8s1FSdCnciDvGTUK7+DpnbzLU0kewXIOSgskkX+F4Ees/1G0iUHgW/sB2gJ7Dylo406xQve9kgBXF7PKecRWB9KooRBWiOSkBXWqFSitRn88WEma+KECwILTqtSOmAZrFDfdUfwuI/QXdgfz0Q2EK87o3tWme2juSUWuewVrXFRrAQ==
X-YMail-OSG: e3qNgscVM1m4ir0rAm2jVMLS0NgT37wlITC0c.Gt4PzejGaixdEDIrzkBgNMZCy
 orPwkn9Kb_88guWUMoDfq4ycX6vgdyOvjL5FY9n3GyyHI2KpyB2VhZg_2KEgn_30W38sIGMFg6cA
 3cEv6FN5T6ZfHvxyXfF2d1GZ32WhqSE1qiZ0YVWuDRDmEoPadqnnUovW5GHkkbBw1xtXMj1eM.ZD
 Edk_S_E_hioKkC_PdETeaHNAqMaHQzSo06w4EKQAIbBosUqXdUETcE7bF8sz1A5BV9ukI.HpR7Mb
 IOlKEKtKgy0jbwj24FOz1Dh0kwtH31ty7_iIp0JYzWwK7xu_h_IxQi_wUVT0r6Gcf1giv13p5v0D
 Z1HToH3KqbkBU9rBFY99CdOHtZXZX.r_LgCSDZn0l2AI3TF0vu3L_O3JW9Zqhp3Aq9v0oRpLweI6
 lOxbxFpWD_5T3Q9mcMqi3xHIQ3b44EK89OsmQ93PJu2beYnBftISHKvURMjG5hVORzX95w64qkCr
 1wBsRGxFMslDl_QmRCFTKhhPGqfRVPE67r0GcdZ7db5G1CU6Js_Bw6qd1SDNJ4wSQQCWzrd1DlzT
 R40hW_G8.qgw_10LCQA01u1XN20_QPzW8hjaIXPpLqVygq5LezIzAuHe2h0so884Mc9w_p3X4Ped
 CoofvujaA5wf9u7D362fL4O9r1.RW0o5a58s.6WdHgg1QlOwSs76hrRZ3ixTKUkEMtpwZZNNVaGS
 5jMXAwK28.vIM8l1WdnLVTxIGSZUiqpZ8TkfFfBYIf5A4Bhe3aU8KXB5MztvHoI9aOSelrFhj_V7
 CwFBO6xLUFC9ovCpI58KAzXORDfdGxbhFquJOhAONKzkqc8JpfJS9CXWvC3Y42_40rPjU2KgyrWh
 .Q98aIiYFj2QXK287Bztplp_cTlWNcgvfChOVI5We_AtEuRf__b.rvrpPpJrt.b3auv8Ks.b0zKM
 MRkZbcIb7ORgF_qyDGO0WZbsCK9UL00HpehvhGStWRFRZhfqKL0UTGWT3ZFQEixNTNeWQfY1XUwM
 zoudtMqagtGDm5c9NaMOse9pKikJz94F2gnlr.9X0.h9ZVRFy5QFKEYzJbL47yWXD0fgScoBg8TZ
 22RzgD78uZ9WP0PBV.rD0u2WnG36IW85EpUQV79Ib23RDbacSo1PC1dLUDGK2htwAIFXDnPTbP2w
 2BJuMluD3mUnhdPMEnBIMKP2mZC1NqTZWjWlVJn571aDe2RN_CDLk_qW80qPPxY4jwA6931jGP.c
 6AsXNuK.X1tfqO8oHEJvbU5WLIqSlG_bs02SFjrB3j488XNgvL4wWukyhMn9gaBRA.1eUqLU3SQC
 ga0cOpENhOJbfUaC6YAkS6UPv2k7NBKF8ERRJWZ_6pGii34WCf50H9vzNEzvjolbE2q87hjfzynr
 6Dx_hnmNlNE01rzYreevBQSPCA2nTSq5DYzhG8pm1Z5_uEVXXbqW8Zo_1xQclsvRSVlZ4u5UmAyj
 .WZ2AEZKWzk6MHbti6Ypwo57E0.6l1WI6Sh51MmIxXlcPcAfOQIAgU4kN.FzvLLeOTAd4pZffapW
 cwCYv3WNYHZDZI8H8fauFlPXM51BUaZYe3S.IfoffE.YZePNnpDxiBgAUxK9bboh1TQ6AS05LsC2
 _.qz_cr5WN9_EEE7hFUdlac2g75j24SVONYuAjFrkyVHWxBoNoQBfeMXf_bbmRe1lkZafwHwU9v1
 NLLAPBO823CVYxS2ayTqbSxUIugGqJJlq5Skgo3yh.tAFc0lial0HFNpJycH2K_frgE6xscEYwJp
 2svlrBlZj1Yj7Rphit7MbxjT81ZIClq1fgDLW5Z72Y2mphuah2DslX.7nfM4a5Ej.ePfDIX60teX
 cpAdPwAhhQlvdWJcMrBTqVi1Mkg518ZVYyzwWP7lGKR9MlvwKaHq4lwaCXeIXz4qeEKu8kh7Wnyo
 O1LtW0Spet3c4HDAL3B8OTXY3pVQ9FTrIRP4vXumaG6NLJtG_lmTT_duXnSRkchGzUFs6YV2xH.y
 xw9Me41rabCdh6hhHWtk8i1bOCHWvFMws5nRvEKuXVUhxFaEW0hqMWu5NnL4VxSxJ36wm1wsFLUN
 ZfWSsyOgZdTOS2hIt3jeHoP3hsa_mdHWaLKLZlXAK5c0T6tXLvpX1j6kaqEydpyfh_znZf9cK8lL
 a7aw.HgA1KROJXGrcuk.STvDb4isAAFGWzG23CC2wcr6MIRQnJfgiw79_S4ak6f8zGrOyvGhbpCp
 ixU8wgL5Srs3g7YaHogfUkuuvRt.iy3ghVcbJvcLf3wqEV54thfgdDd8SjLDPZHHW023HcV6MdLT
 tW52B6k7JMzLkq19mLIJwOiY5jCGGAa4SSEs-
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: cd8fdef2-87bd-46e9-9c45-f9c7a25add93
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.sg3.yahoo.com with HTTP; Mon, 19 May 2025 21:55:08 +0000
Received: by hermes--production-gq1-74d64bb7d7-rstz2 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d5fa22a8ec8900100267a57050f58b0c;
          Mon, 19 May 2025 21:55:04 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: lee@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] mfd: maxim: Correct Samsung "Electronics" spelling in headers
Date: Mon, 19 May 2025 14:54:44 -0700
Message-ID: <20250519215452.138389-5-sumanth.gavini@yahoo.com>
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
 include/linux/mfd/max8997-private.h | 2 +-
 include/linux/mfd/max8998-private.h | 2 +-
 include/linux/mfd/max8998.h         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mfd/max8997-private.h b/include/linux/mfd/max8997-private.h
index f70eea0f2264..261c0aae7d00 100644
--- a/include/linux/mfd/max8997-private.h
+++ b/include/linux/mfd/max8997-private.h
@@ -2,7 +2,7 @@
 /*
  * max8997-private.h - Voltage regulator driver for the Maxim 8997
  *
- *  Copyright (C) 2010 Samsung Electrnoics
+ *  Copyright (C) 2010 Samsung Electronics
  *  MyungJoo Ham <myungjoo.ham@samsung.com>
  */
 
diff --git a/include/linux/mfd/max8998-private.h b/include/linux/mfd/max8998-private.h
index 6deb5f577602..d77dc18db6eb 100644
--- a/include/linux/mfd/max8998-private.h
+++ b/include/linux/mfd/max8998-private.h
@@ -2,7 +2,7 @@
 /*
  * max8998-private.h - Voltage regulator driver for the Maxim 8998
  *
- *  Copyright (C) 2009-2010 Samsung Electrnoics
+ *  Copyright (C) 2009-2010 Samsung Electronics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *  Marek Szyprowski <m.szyprowski@samsung.com>
  */
diff --git a/include/linux/mfd/max8998.h b/include/linux/mfd/max8998.h
index a054e55c8646..5473f1983e31 100644
--- a/include/linux/mfd/max8998.h
+++ b/include/linux/mfd/max8998.h
@@ -2,7 +2,7 @@
 /*
  * max8998.h - Voltage regulator driver for the Maxim 8998
  *
- *  Copyright (C) 2009-2010 Samsung Electrnoics
+ *  Copyright (C) 2009-2010 Samsung Electronics
  *  Kyungmin Park <kyungmin.park@samsung.com>
  *  Marek Szyprowski <m.szyprowski@samsung.com>
  */
-- 
2.43.0

