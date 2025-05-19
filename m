Received: from sonic301-21.consmr.mail.sg3.yahoo.com (sonic301-21.consmr.mail.sg3.yahoo.com [106.10.242.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEEB21CA12
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691715; cv=none; b=RjAkD4PtRBalgY6HB4v7S16DLdu4QvKEddf68o7WLjCC0ebIUjVMB+/82dMjVMGd9hx4/RMmYw6ha+1NjJa4uI4GhbM5dueXpKib/FVB8eO4VN4ytzehn1FaYtTeikuGGBbvSEiurzvTPIdw9ek/yRmx2Pn8EDWN+rkSs6Bnz5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691715; c=relaxed/simple;
	bh=VnWtcu9GjO13r3KTcKEA/bmkf7yWd8AYnyw3keeoBLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3Xsgf3DbbaEaiM8EzBAaqH6XMWWLgJD9IH49NShs5JLekaPmh8W7KVCJEH1AHGqW2APq6jdho6E6K6PCxEJhnBGnZ1YqVLL9NIw4WIkbJH0xIae0p03308QHI1ztS/COqpGhJb4Ogfpib3+Ycp+t0lifqN9xLIDgmHJf+XdL5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=ntGxqPwa; arc=none smtp.client-ip=106.10.242.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="ntGxqPwa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747691705; bh=CNXIfVzGs0mPuKs8M5Xro7DY8VpDsozEboIFHWbCTtc=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=ntGxqPwaWHvxlKAd74za+VXanccZMmSXwfiPhJ2gZVJXD0+fpDes6eGu015LkW9Lo41nn+BiCZljmy33wmk83m8/DOzCPEckZesjg1SRodNyL8rqHFwSKKcatyN+cv4y0PQqfhXiLOKkeehGHnKQ1eRcAgrxeWEuzlAnl/iaiPNVKUYqNjXCGJMXq9faAjoqe6hFvZUsp0sV8ZKBKfNyM1GKKEQ29sL0v9UMOiQxsa5NdyNXs4ooBMm7Y5Jte/Q5MqM6/92Hm3kQMVK72qQ/lQpBJSyRcnPWJ7igOV1cTDlhbAy3m9YAnpSJCdbbHL6KxeBbN3VBVOBqosNy1Lgldg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747691705; bh=b9uwRaDzi6ate8fj/BtEzYXMfI6oantlZ0nJWly2kaC=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=CiSrgudIy/9rIyeIL6+t7pcE2aSOnqxEx2tZJ+grcuKdfYJRP8m6iBgC+ygxVdsAwEIPEJ4gjOONK71we/h/iye0QLqC9zScBv4lyihsXWe8AMFRplTZUHk4oCKiYz/SUcaK7777HJ7wIxu05/XX1XoMh/xf4adqDu0r/MWkCNd/Ph5ryTaBANl3btht1i5eaS/biNIGyB21RuQmjKq+YzsKfu/FEpix7mh7sZMAPpRpIohqW/zo98lo8VaShzlV5HpNL9LLJ2TdBo5pi2bI5gcrdHWkrTv+lnXzMDrm3qEMrRY1d/X62wTDLeHCGXq6lxdASC6sHEwgf+II2EwDoQ==
X-YMail-OSG: HcNTSSYVM1nqJjfYiWwLqz1rIJwMZn6Dvwbcvd.eIdY1HWvOOhJUJPW976j7Q9s
 kv0e9.8V8bVxtBc4K1FzofRZhvzKbne39ihOAT9MlYWppVKICRiVKn19fAqdDIA34dW19zWamC9R
 gBS5sjOdjjX_dqEjTRJKXi1Q81hBgWqkycSrn2RMEfUaL59Q_ihY_Js2Adbx1O7HB7FiYMJ330ME
 osKYFtlJG9Yu9zLi71U.tfhZFBIXGFl_29THh8ihEmm.PNCuOMPsaaqsaMtD9RGNeZ9St5A0u6RS
 TFu2Wad2F6XN689XMM3caaEiO87.snGDTQx1_xVJSRQBMtf3JAT1D5260IzMn8alQwLDZCtVMGrm
 T.wzohoSoImgC_tJfzLO7gXGjiRgOi8BoKn.Ic_gg7Yro_xy0nhDlKUwP9LKtFs3MZd5eXpMaxCb
 SAXYAMcNTT5Lbx0zFkjThBx6UOFFiGUidKVOATxVxec.cNIJqDTFu.mgkSJZAlt4O5J9KtlYiwd7
 32HL5HYzdD501AVmWLSQyLA4WRQHz0T.voWxdiV4jANKTiXERLL5ysK.OyQhYnmYPlIhhyTL.T.o
 I0isNfpPwc3byqmBrl0vyP0odBE.cZX0ygDwGNOgPBfDscviaH8nLFB6q3lF9ZqqlzyS6nA32yNC
 .4tVGlthn3b7knrXscDoFphJ_iiy2STdWHAGGFM2Ldp73BjsFZvcuT9ewdnbO..2R98qDXiKSVc.
 JS7unzUu2shcl1Aew8NC.RqHVdrY94.aaTY57dD21uT0ZRGeV9IProItaoWV30dxragpoXVLdUvs
 GQbRR0ViskmNvAHiEAMbq0smr1tLfwTPzqX66CuNB9.xlwZmfy2oJzA.GAl7rJxQH3O.naoIkj9F
 iS1KhNMrwcoMCz921PCkvbQIn.dcXwuXYgI1qLvqj1wAWWiGo9IcjllqueNop_WucGohWLMvmKxQ
 2.kjvNiH2TTPaEaXJ6TARCyHvK_MBpXUOIHrE8CcojOyQj4ew.MCRuL_HJgtZjIkIMHqgnshAme_
 qR5mA7NlIz3eLPehy6VueGpDQdZ65MseTu2Y6b3PaL3awWu_ihLh1mNRMS4Y93N9C_ARpu.apLXs
 PkbmybSPm5Odr6yq3Ga67_Qcztl2KrGJZMue3iM63QOgKzKyrZMuBtQndpMqRK396CfuiTvCWuXN
 ZjQPK71LjJh5ekeg8.XI332CDnXaAs.0xYPu5_wV6sZi3VYmZ61LqPLQlnhxzFoegoqrLct4zclt
 W6E58oWW2MfgFljQE8yoSi5nrIGKzsGvOsuAM1PSoeU3iOqtGzeNpsIq36RN7gfmyf1B1hksRaEE
 Xtt.7Zd3iIuWS8y6ItHgdIn.6MfOS6HPD3NNB_E2oCpyIt.4ixuoQCt9NlendPU1DYgGc10x516b
 FR8Y57AvsfCKhk8868KkWaGdzcE7V_fE33zx5OdJ0e_ePY9AeAXCvtQPj_KNddyS_E8qJJYvMErB
 A3jMfeWfZZ2AQEWmd_MAqJF9mFlUy0bB4aEMwwx9mJM579hnr0M98ozbtKxJfbz5Vy.PguDJaw3I
 i1qUzyWtth7fiTEmhSWI9IrjB3I79ihINInpk74PTvwJ0m5zYF_Jt0grdV3YFWf9EGfCn_OTfVrJ
 7pA442bRX8mwnQBBfqM1I7QHs7OgmX9mm1k5SwY_RcltGjs6ccD0uieRLFiFdJ1VOYWUiAA0mI6l
 H5A3_lXY7RRoFAf3w3D8194CRFwW6eyags7NVRcW95iup.uyBnmUJuIGN5_bjy2WBrsaI.n9emUV
 kbJWnOBYW3N_3okyQOOFCVEQvV5PE5.H2Rpt1gX2DBHdNfhD64yR0h5n.wsqvZsW1G6G68Y2vbeT
 v3DfyNLCLcCjPloQJtzjxYmC5PD8xpwQw0NMqWb1vFcBjcsTuwnf.DOBijrxxlNqdlwYhU08zuuk
 Ni6j9BxWhQ12fZnuNLI72qqylgYIRCFLsEsrQ089uZq.aGNbrjrkqmPFvwsHlofbs4CKxRpC5.et
 7h9RbiD_G1Q54d0wW6p6PvwCeboYk12HmkkU1MpcSqAi8rC0LmgtTJ9wF9PvfogfTFxklYTdNw4z
 _0Q31NHfuDX41dGTx6sGe_tI6quNZF.d4TfT0hEPx9me7.F9tYUkmVeDoXAVGMxV3GXJLTk.lZXF
 623C9CDWokSA81Bzni.5zKFjnHW4Pw7nSWQwICkf_LVPcGGJ5IAaYFkzcE75WHZUTRlbF26IZNzp
 FarMoHnC9riVxbQLRZeQkWxEQDv3r8iyHVgYT.vC6pDjz_.pYunzEkTYbhpEPNZ.KdAoxq5QiYlc
 yihPO6cO._rl3L3TdAnt0Z4zgUC6jGYIliB1WlcwTuspJ
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: e9acd945-97ed-44ce-8a73-75c147043df2
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.sg3.yahoo.com with HTTP; Mon, 19 May 2025 21:55:05 +0000
Received: by hermes--production-gq1-74d64bb7d7-rstz2 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d5fa22a8ec8900100267a57050f58b0c;
          Mon, 19 May 2025 21:55:00 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: cw00.choi@samsung.com,
	krzk@kernel.org,
	myungjoo.ham@samsung.com
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] extcon: extcon-max77693: Correct Samsung "Electronics" spelling in copyright headers
Date: Mon, 19 May 2025 14:54:42 -0700
Message-ID: <20250519215452.138389-3-sumanth.gavini@yahoo.com>
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

Fix the misspelling in extcon-max77693 driver

Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
 drivers/extcon/extcon-max77693.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-max77693.c b/drivers/extcon/extcon-max77693.c
index 2c567e0b7b7f..ab49ee6b5b2b 100644
--- a/drivers/extcon/extcon-max77693.c
+++ b/drivers/extcon/extcon-max77693.c
@@ -2,7 +2,7 @@
 //
 // extcon-max77693.c - MAX77693 extcon driver to support MAX77693 MUIC
 //
-// Copyright (C) 2012 Samsung Electrnoics
+// Copyright (C) 2012 Samsung Electronics
 // Chanwoo Choi <cw00.choi@samsung.com>
 
 #include <linux/devm-helpers.h>
-- 
2.43.0

