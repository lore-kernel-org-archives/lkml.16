Received: from sonic313-19.consmr.mail.sg3.yahoo.com (sonic313-19.consmr.mail.sg3.yahoo.com [106.10.240.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC22D20C46A
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747559290; cv=none; b=fyiNHHfghr/SaasQNsLbZWPCfsJhd+b7gO8fFrZ062++eQEXhb3nfLRK9qEn6K7G9b1BGv29eSCl37zZN5k6XkI+mdnxjxcTEkwucJRr7vwLf+pC/qIbavtDIm3sfKS/zDgpZL/v5VHxtrR0jJ/YxMA7Yblgg7vla24QSV/DqhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747559290; c=relaxed/simple;
	bh=VnWtcu9GjO13r3KTcKEA/bmkf7yWd8AYnyw3keeoBLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bgKOrbGvyMB3FKJF3GeaXGg8XL3A91q+j4vcCGo1JZC2/uBh0u16Mm90yiOX141biFR0pnnHkA6h+5Z/NrPJqvx6zx5EiuVlrfbh/7PfuUYMJzXI9fbDGkjHbMnUiGl+98BPO4rlAPBiGgJiwYfFXph0nA2GcDmz7Zx90HKmxw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=SsoKqWPC; arc=none smtp.client-ip=106.10.240.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="SsoKqWPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747559286; bh=CNXIfVzGs0mPuKs8M5Xro7DY8VpDsozEboIFHWbCTtc=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=SsoKqWPCEMOUmkKccaNn/H4Zhw3qTElGw12g9ev6jDQtmu9DUcwjIJqG9xlD/HbMf/AwJo6mfzJIa8U+LgPHc74zsOghrLJJpkJ0oGn4422f3yyBLpiF0B28ZRqqjT1UoBSzh5hXdrBYQ+bU4xomHULPiVsSwWrjUPVtDK8uP7+y3FxHeYyC76adNx37qT4hqUwc9PX76Cu87mBx8FkUQ3CFwQEDBy7eqg4O9UySNKRXdzm8bfj45hTAkxvW6SA54SW7SKeL+D4C+St7ViwwD+d1IbwkdHcCU8CH/5VVd2QNTL96IbhhYseKR95AOLd3nm0vKRe69n+vSFeMZW3iog==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747559286; bh=Xou8f5mSTjPAAZM0ikmPN1FSjdEfVdbmMGZuCVA2lWL=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Bov76WIVx0p5Q2aHpkt0NLzxm8L4wME3okuyd08Ind9frfyJQrV+Y/rgdoO/dV8aa1O2ctJjCVgWAb6jZwqCb9etm1rQqo2Yufyv881CGd5v+QUOxtpdCCikUy/f7uRFzsw0r6CeOLA/I+FEQXY4zzwGZh6PA7vq9f867vj4vsHms11ZePe7kZy6UVW+gNvTGBSfCxrkZDD9eZBm0M/abVFvJtHzt2bGnB2L3DDWxIr3wIr5o36eLc7mTGYyWYTi1w+0JzzB6Z1s9ODgzUoj1ebeXJfdpcjX9JMpGijzNuNuc1RaW9qnbifc/ypQSD/1xXz+iDJTOx3zdhH0nRd4Sg==
X-YMail-OSG: M78jHtoVM1nWYNJD1COvobOVRlrxWfO6Y53luHhMzCWiAroheNffu8BADEZQr6i
 hfvMF8ntpDadENupE1HE7cBlGStBquy1ryATOoOzvVfFB2nVhyYEIvXVH9pT0f718_Rox6Cflwax
 2mzlUvZj5eXgSY6RLMKmmm9Nr1J4z06Y2k7UlBu1_Ny9u_OjZcA.7Z8605bMKnjOXSFWzQGhBIEB
 4yHKwhU_fD2M.TsobjTCjFdxsdXNRNCyrMavcS5VBoU_9_ivHDBYqS80LxOmLad6cDxkg3mT.ZPr
 w9Dis5L5wWzIulPDeUsPWKTRCTlFHKdwsaX9lH4nfv7VazsTFcJqTB_bzGTdusQd878G4oHZf3HC
 HXlRPnXt9zkTIGIMnM8V28BRlKoeu20YmPbmd645lScsoTkXBqaFgWZW9ovcPhNQm1Uy0gbAm8kQ
 GrmrKDN3hd3XLUzXVKfxXS.BmxdecsALpu3SsfGzSaEOpgEbUU_PcoeEy9XdV9EeeFh7ptWrTzGf
 lfLGjd4CTaFYHaKlrj5mS_H0TC3rMoIyeHAgNh_9t27wT8uir8WbrE080GLUHwvULtI2tGcTjXf_
 ReBomW0AdoDba6i8VoZ0QS7mdFeGKd36gZlnJPkfetCNUhzLt9PhyaT8j6JfrLi5ukDwBCYRTp3F
 HEIqgITNfSwT8EmIyfo6SHnTEUMQef0yu7YrZRg5CMw7Vh5dYOFx6fRsME4OhiX1L7T9HImAuscI
 4Z3Hdq8VuZThnT0xqG3KgCa5qlRcPzP6v6qVYyALTM8J4dV_HkL3TOKzLYUiEfjBXGJtZJB1Okzj
 oDQ1FdPNuonQM8Rwfcw9CyrYnK7HH91mF5cqDEjJc7tiN.2Ejx.a7ed1OzyievS.wYWL0hEL_y5X
 WeQKeTpJUbZOUTAqsv3DtQYGhMuKR4wHDWn8mXAS5gDEHJC8DcJAgLBfjtB6VnGkKrdPWZ65BWc5
 BBfdREoYM6JmoRArscB2iKxaFRGs3v1Q3eo1K6PwSPu3JWgIaki9.nstPvGDKhLosMqGsL6HuH37
 Yg51i.m9jb8TA031mNi2ZmOtvQi7OnDWf8fU60dOCWjkFCN1Za3KIhX3tg1LYfNvJkAPRA6NSsNk
 jgRuNBQiVeLZ_N1vxSEp5jdoZBUIBiE3FtiY7MYdPUYRiyHQS2I56p.6n4Ka.lBKSTYnXuR5Tibp
 5WOHqnLLg2MIq_GHrLGdqrQNpaWZUrb.mrM81etWX.TYAlOtJeIiDiDT889cvWGaSJKXiK67TRMC
 QyqKe0d66Q4msN8f_TJmvJsz9bR9TgsPkE_RvSt6D3Zr7rZTLYfim5y6qYqyfv73rT0RDvhUSGmk
 tarJW3RahnVnkPnAdZ5laQzk5mPu.ttdSDSitqlHFymokiRPPKysAW14hiMx0eGpxGJnn9IC0QdE
 LC.J8iyDBJM.ZtrybpvVFwixalzM9Z30fxXw4hY26A4.MZu9txTQosPkCH9gLf5JHCaLsPVscUjD
 coD1v5G5wkTFHj1UzgKBA4rEAfnnI.HM0mPLudjn4jyOQ9TJyzjfgLTtfabsFNjDwP5DaAxoyTeZ
 aC14nfBRoWjuK5iMnXnY8bp78M8o5c8pYEw_JKkoL6GbTYpx04rQH14.JyYIABFNuWX8_86bMtjq
 SDl6HsFkLufz30dgyAY7pP2U3s6IUrFTlRLcnRPlMxnhKDUcM1eiMYU9Uhul4inu8lSUS4EHjG1C
 ZQZgCRmnnq6CA8zgW0smbsGF.RoVQCskjBwm2uWDqshFwx48L4mVFj8t8kA.j72xhioS8HleNcs7
 OFjKZQNgVVuI7Rj4iNXEqNEDWeB3QZaF4DtkTxCIx8Q2YiTGD0t5QZbmOkrCfyUrkkjh.hWxFCHi
 Zj.BaXyxggrBA0V4lzXtt1EA2fU1b8pPw6eGrsL4NJfZ9yWOA9S6Esv_dupJ9vBksv0oCt4BpKiE
 ljkCNshUDk73x5eCVaBjXa_Q7JVW3g.w.E2AVeDL.Fl6ph7oB_An.gZQOxu1PYjB5YggkP30KT7o
 hvJdbUC6_Mv6eJlSjiH1a5l4lNzjIJpheW4obdSVmuyPufGg0t6AcsG9yMcJqFAJ8cAXdjBCA4tS
 m7BBpYWARKg7Vw9WT2MBMJ2XtCal6Rct86xSy_dJlynOmHXzTGP5lnQnHIFCG1p9IJk9UtRYQ0IN
 8FiW4b8yaphMHrYGEsEcuA0kKKyS4Hil9PX4J74YpjcdqUUVO.SVIexAZMykpAbFasNEzVjzS7N7
 QQuFgzw--
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: da318189-323b-41b6-9e92-698ecad819f5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.sg3.yahoo.com with HTTP; Sun, 18 May 2025 09:08:06 +0000
Received: by hermes--production-gq1-74d64bb7d7-k2g2q (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c07c4a4ea2b90ef9265870a2a8be7fd4;
          Sun, 18 May 2025 08:57:53 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: cw00.choi@samsung.com,
	krzk@kernel.org,
	myungjoo.ham@samsung.com
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] extcon: extcon-max77693: Correct Samsung "Electronics" spelling in copyright headers
Date: Sun, 18 May 2025 01:57:29 -0700
Message-ID: <20250518085734.88890-4-sumanth.gavini@yahoo.com>
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

