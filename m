Received: from sonic301-20.consmr.mail.sg3.yahoo.com (sonic301-20.consmr.mail.sg3.yahoo.com [106.10.242.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367CC2135B8
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747559296; cv=none; b=ncXNpDLZ4IRZtmIXcIm9AcM4ZX0WTfcu/kQhJQz2Xpg++4snzn5VDm5emXt3aTe1DQ1urZdUIvRYWE7eiWaKb9Xj71EyJ9OdUtImQu0woaIXOr/ZEle+Rbc8g9aKDvbxcAuLj3mL0pv/F6WOSNKtMx7wnRANn+nEb92kSKeAuzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747559296; c=relaxed/simple;
	bh=ZrnAq0IuNgUpeEiPhB3wQpdZsL7zL3sWVc2GoRNIiiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdSIdexrYeQOmEbpBNfJF1/QkFKuiWW1kMijOI8A05T3ZX5wPQ1WPhQYkbGT9WKYImjQqDFKp/WRRcXnKUZIXBMjeDky31Un+ZlbUg41xFjiYgeUEHUUDaHMOkfqtw41n4pib+HeR6gA9HO9ZE5cHnIRHVAJreLVuxjEQCMI1aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=ecZq5Cd+; arc=none smtp.client-ip=106.10.242.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="ecZq5Cd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747559292; bh=dMhdvCMDHfOzaQHLfNHzAlqFXumuXI3KNrHscno3n5A=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=ecZq5Cd+yStcq0OvHjupY8kPfvKeQdjoT9Sn9Ts6yskkX74MU2caMWY86rJnRbIGsxvOX65To4XD6ltn8rvscc8qy8oMsqvYShIjnLNkmSNXcn1+hfzL+5+nPiJwlg7blvKIMdBh9FwwybbECB+6F38CxBdEPaxBbP5S++hqYi1fadTmJ8LnMNHvaEGvzR+/e1Z5Ay53icqxchJ4oMCNkQJO38CCttHCgOzr2r8csrnLmK41IEAYvIxlrFQ/iekki6JEXxMMfYcqMOz4Wad/j4mFm2JZzBjrpQruby6T9S+NT2bwIPqGTHX+PBc3vB31x0LH+detFWy5mEMR37nprw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747559292; bh=zpc5Sv0SOKYSfNphopH0hFFEdtXXwec3geirCnlLtUp=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=hB5R9Vq1X4vt+95ZPn0nctqWRePIgGGeynDB/9jLn9DCtpGfqfZyNi5Wu/zf0sxYciIwTHwZLlkecAovlMCJBWg6i6VKUtZzcRAaigC6ttGFpLo1vGtYmSOjOV8Em0O4x+wjgu0bZRru0wWq+kKXle2+/TPfl2mX/S7pjR9zKMbT7yydllbqnobtEglQw08mzVLNqJTKEN4k0HglFWx8TqY/YMCgiar1D+30fAjtEfBtm2q2zd9JLpV3Cn4Mn4LGfJ6vUs8WhERy4i+VxNkCP1HfLWFTCC3scqIN7n7dfg0Ypx+ylqvH14A5Mhcc53ibSSmU/B8TDs3E8TeIDOKLDw==
X-YMail-OSG: DJs0rjoVM1mlwnEjgXdwnyCEeqX2WHaSl7hABjh9SKVR5TVsxoMHJavQE9JvnWO
 RgB4ofQsNz2bTIXTtTQrbdkidI61hWXJhW.TtXW06IDrKtPXRyjR3uLNwiQdOZ_jgPevtqCcHzV5
 u7x82l7YI100J4rJDqS1RF1_KksxyHqTaS9YI_NzrcdHaldnTvBJxLylZdSfeECQ_GXKpS1W7mbG
 Z4nv2n.fKVvaUgC3d0A5en.EeQ.CUGTq2SoA4qRWnw.ijBNBqhm7W9NBnwHNQTolghaRtVVu2fBM
 2plTQv6Wzom.vyIa5RQtKqEAufOsMS8XQoXKGcvihpewsCMnlegvzgfHsrAM7Pgf5uAw1_0.xaHC
 1btPk.qvAHyOu7XoIkJpHZd8ZprDXz5787lOERKXhS1fmewGliFLv1UkR7Z.Vau_XFI0JyA2yeDv
 zPwmOcQBhP3Odw3EuoNnKh6604gdEy4H1iYMkkaggdqQ3RLsOGUh00PP85lbZHmutHh4SlEmBAoz
 xdMBagOYtE5s7n0kRfFbJNxHlYz4XQy1DtGwwzJA6b4t4IiekRjd7rPlJwkW4UfUlrDeizFIx_Ne
 fVjLopsTI2cQWRbDt.uRug9rQmMjRl8mCaaaYR7cb.WJua1S8hrvxcy8ue44e6vLVlU9m.5V87qy
 tMslmur2b8c8vbj9lQKqMDi5IjRLfIEqwqKG_fIXYzcvA9cl5Zu7FVI4fR8PFdpQJ4ZNuBeNtGW7
 QLic3kAfB_GIhAoalSp5T6pyjYfr3lLF3nUFlakX3LQ3Ln4WILmyEPWr9PGhvOKmSZ.EHYH3O6em
 aBasPPMIy6G42ZEHX6puPdZtaxkZJ34WPaxcF3lSLd9TQZjxIq5ksEFK6nHVT4grDDtDfz3uI1dS
 KGfZ3Ff8f.whwmg8Nwa6TwwXiBrA9E4R6vX4AhyCnGCrSEP8xSkQ1UPMQ8We4sP27SPBLXsfXtP8
 JAV27dPQRZIR3uVCC_8OSoKKYXMlJkBTBHg2BVT1yMvogaB.WU246sn4nXS2nXl6ciU9JEWDpLbB
 YifrzGHkPHsGj4PqA4dqZ51zTmNKB7kq49IjJjRVzdSJsGXevebpQ1zpgF1FdkFWBq54uCIBxdVc
 KKWGQj_sEKBTkhdGI3AguQdeg0ydB8oL78dWHIpcVrbsP0jbONXAQuOwR3huGnSRZRHdDyctzly0
 yhRwu6oqSb1mXlzmN4A5HpJM6_WRxqXm3TjPxe0m8lqb6P1WoTgr2bMA88nsAwX5NloSXOFDH9Qd
 NIT8M6uIadw2TBG34kwrOAS9qb1bPur9v5752pUVSqx34UPi.nO4EH21MQd2976A8iQiCpsFTmzH
 6YA1tzsROlfKnRJAZzJ2i54SWmV1ODU80YlzpdT.ZsnU4dkmINhVqqfxy75IdtqkFginYFqRbioR
 XlV1jmPwDRhm9zDRNZk9A5sBfXHmhkLYgoUlm2Pv_LR_OKAdyta8RBaHJQQYiBO6Gmqg2J41YpT3
 WyCgzJtFdIzjzdnGxap9x5NRFlLMhDRzOB1pAL_F5pfuFNoLjAg4gQKy3bxMBXnd94UJyO520L9Z
 EJr2nIG2nZm8AkhtsXbxJgNnsUGHbZprA2PMG4A7Q92pOAIkkWZQP4x.EvjXEIkMDLDVzDIcU7Pg
 Bxb6qmaJfl6HGv3n9O8VwFLArIM7kv94fSTLP3kINFdNpMPKnt8xaIlU.dshF4ti5Uzem2g.o5j0
 JwxfMPEgZF8v2Dc9tO8l511IwlKEiTlBt7aE__cmj2hZtA1H88ptqmNibNlKB1IrBWIqxzF29Q0I
 NHKN7s2JD7UAa_UXyuaPODXBorvgABqFzB8F2VL8KZ1Xl2ssI4_FMMI7yr_rlA5dblTdSjWwRdTe
 yAPt8WT75tQ18ueyKrrIY148fBonlLP9YFfGhQuW8fEmsN0F7C8EYOWqxsKN.EC3HxmWt0iEohw1
 BPm753C8ZRDN3Vt_6w1CeAofkCBA4ivYpCPGa85Vnym_Eolf_IAs9Wb0Ow0rHmbZnGsJa8Q7vbgu
 91w9OWRbzed2jhjHLOErz58Hm1qgyoJ0pQ777_oKSHKxMTUuVWxrR2LflyQznYZxd29gHZ9fFru_
 bU0p3n_sSeQyYWunkeu9kfwbzLZzRKCT_SzCBResIt49fmGgGX1sVkqsTpgGt.ol_AOFxQIcwCRx
 UWgmpHiYCrbv0r047tq_rgMVETs9V3uL7K3Ed7eict2xaqvtVRbfyPNmTMVFofGAkpbndc4hEjDv
 5_d_4cQ--
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 4a97d7e2-22e2-43c9-9597-b403cb407b8f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.sg3.yahoo.com with HTTP; Sun, 18 May 2025 09:08:12 +0000
Received: by hermes--production-gq1-74d64bb7d7-k2g2q (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c07c4a4ea2b90ef9265870a2a8be7fd4;
          Sun, 18 May 2025 08:58:01 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] regulator: max8952: Correct Samsung "Electronics" spelling in copyright headers
Date: Sun, 18 May 2025 01:57:32 -0700
Message-ID: <20250518085734.88890-7-sumanth.gavini@yahoo.com>
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

