Received: from sonic309-20.consmr.mail.sg3.yahoo.com (sonic309-20.consmr.mail.sg3.yahoo.com [106.10.244.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107541F12FC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747696459; cv=none; b=GoWkcZKJH4hJULbUtbw+WRlocd5U07HKhzfUJamSpFR85Bea8FqoA7dNnEvqixe6Jw64TRB/88YaTBK4Ek72gpXgy51TFUqr2daQGup2nmpkfNxeBfzVPWOvWSDhXQEU/RNfaNK+iiR2psfwbwX4IX0WLeqehw1qFFNcHyEyMYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747696459; c=relaxed/simple;
	bh=VnWtcu9GjO13r3KTcKEA/bmkf7yWd8AYnyw3keeoBLI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=u1HZY+BVHrAiQKAHB3U7TrOp1Pckau5tyKkXIjndP7VlqwdCd0SCyBgD20XNBJtQMEGhJ3TxRZBLE+u8FOTD4QtusDPbuTgFjxh2OWwLbUUjVm8Re02Ex2DYQoTWAP742ort6STA/nUO8j0KwNLjod9X8VVUiWP4puXr7edoUNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=RlUq3l8u; arc=none smtp.client-ip=106.10.244.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="RlUq3l8u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747696453; bh=CNXIfVzGs0mPuKs8M5Xro7DY8VpDsozEboIFHWbCTtc=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=RlUq3l8u3LFbZbTXCeiZ7RbBw633Zexmb3gddIxCNhxDXASC6Y1LTsnSkboAxA5sAiKoKtIPDYyZhZFmVb8jYF5Fza6boEoUxUz9C2KnqpQ8UFZC3BNfiZt4/oZ7HVo7dxxyGuYp7Mv524I0LkmIc5lG3Zi49VPvZC2yW3otk+Iw2XFiYcxEjxGlI+/wwzf38SX8P64oOO46N9/FBa61c5CEP1lS0uArgU5AOxnklQSlYZcUUNqWH7//vV10+6gu8M4t49jZO1TiZmw04BFAd88RNwFaN1LbHqQiwClMDaLwmZvFI0tFSwU2Z1TzEChtTi9n1lF3w9h9h2Kvg9SyqQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747696453; bh=c+GUGUFB4HFsztkJdQG4mswK/+z3pwwqauGHmGzlw7n=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=c16hGbiCtkDLLZcEAvl8qU5zV0W1ryJo8cjIlmZZ6tYkN/+O/T68wRTNh4yEd99vbC20qcEjUXzeX+TMT/aC6e/sTPAsMbFkXHwa8G/Fo7llOzi47L+eSJsdJXvPaJUTGhWYFEbms4IkrMnIcj0pUzbcP+d0+2jmsj0AVjGGB0EWc+lY+J9zC1F/HEl8wpCztc3p8e7P+BGUZTkzW+B15Avo0wshVanTBIA5brpM/mAyFQuiAqfLji9cvfOpwYrokwaSBMVerGoyXGM/ws8t/YJez62rQ5Po5K2z1cBnw73aIoqwnwgNVQuW92BTdnZnkzo9/WFve5/4Z8Hw1NwTVQ==
X-YMail-OSG: GApzyssVM1kScYqEh5SodcuSoYYEJG2lu7Khq6OehrLfOlfSK.ZUgCIMmA9rcOA
 Nqz..lEsGy6c2e8TUuoUDsltLUBFwxRZ5Rl2dI9wJiw7Xsd6QKuHLx8xU9coV4qHqF0DyDw7iyVL
 HlHLQu6F42tc1ljtFgcurOgD8bhE5bjG3R9ySUciZye3f9_AotUffqdpgLk6NitjHRbOjctwHAVY
 km8XqGsfE2D8YUAyV_dQNsoVlNC1qxtrM5gVbARwZz4lw7z4Xq8C5UydDJcQAx9JTlc6VdZipCnb
 3y.n3RF13piXHl2vpKWmqLRVXN1JQD_8klKNK.DlCtNq8.ZmjGiLDD6PxRmeb6xpEvMoNe1hGpzR
 sI3AdKYRbAi11q4XBreb_MMCLRmOUieXfbtG6Hg77JCrQuS3Tn.tJx0yQ9aL0W8EixM26GsbcItO
 iWUhi.FZ7zYTfW_bXgCEvqsMvfJKe5.8AsKgbMN0V2Cr4QGHTA2YTt7XuzvKtw6PxAWq2MW2Sz1z
 4YwKGOkqS6e36aDjzOJqNrwX_cduBuhJ4RZVDOOzSVSzWfVdI.XywW30jzoKCfODlr23C69211vC
 By.civexOkq_YQlyiFFN3UHhgcfrwPt8zM6wx.rPX_u56w6AYWW60b90S9oNQFuYqHgYJiSBSt4_
 7VnD8ufMmfB66F2ZBLO_4P91_F_LLECrsFBwsOmw7_qu6PkGNRCpX1ZXe_5MwLyFaATAmPnqrCZc
 f_02ulrYfbd.notH4jzwcMbWzj2dfAF2QXpVBAL0sYonQsBJY7DSCmeRZbUAdktkXBd4wdy2K1tz
 xZVYI3gFoMIUmMeSsbGX.2Yv9Wp5Z1krG1QuJE8V_.arRDbkNCMc5DMOzuO5pJbf9iLA4RbfA19x
 CiBbi6gRa4qeV.02OsOTMg_wbNTH5MwRjdTD_4pxo5gcTWaa0GVUC3n8ByE8o.rbbMGwjF.xiMKw
 uCGarCQBdhiG5.AoUZqH7t0VBthtEe4TfhoCfj3ZOhXsDw44aWjfAHd.Gg71VLbISe44s6dqBkaH
 p9BOBD96B0SCv.myeY07rdcPTG2T1N0Iamyid5yv_HvwITw8DzZwCYtEw7GemMceqEW76hW58n4O
 itv28cMsG0CbS69w2NBIcqJf36pqo2_bf5SFuPzohAKyD.WL6RIfT0Ov9XEkDDQffifiPLd0XBvU
 jZRh5AyLT3vVf55igBNbLl0PwoXClkPPtkDEVmMCce9n7e2U3bmvqcwCxPg33WF6YKPyShmWzXQ_
 uRS70Hzdbe.JAI.KWE0eXfaj0YsqoAsVvqCkWVszfvUL26EbY_s1yNa4UoCz8ccJAEukrOlJDsu5
 Xh5tX0a8WHYlfMIVYlj_UgNeuX1SZJWJfVc7eREdgJJOTkYVXzUAecAE_PauKT09vCQbEnLOffQK
 UDkUvnUYpL4RuSwMgETqGl.qjZKvCjvlYj1Vrq5FWsFwYb4j3hwKtRhBTA_v_ng7wBHjMWMpvqNb
 vtbxyAkDDafG6TVczsNPRq3IPKENYnDwXn49sG8GL24Blz0sGnHFjaBr.J7vDCPWoJWSiR0WeSJv
 S4P6cLUbQrqXdOztA6srLRp6N2SR5PjcMkDcnuhBu4xuIQ3e7u0vjfPQN7BWllB1SKncoAarQ6c4
 3bPwKH14bgSNpH9k3zNlBnrG5r3pRmnXGrtt6ZYTNIczaPcUMgItATEyi0MJEt_d71NoF9B8lOIJ
 umB7X8JPTEgUZnV1cBEyDH4nlTd1ScQZ.bCgToNtejHNnCjAYj_VdGZSkrDtchU_z3PbO4rSDaFO
 enwRUJ7g7HtuwBFageIJ2wG7Uiu6HdSqO7aSbjfBFkZZ1Ve9e7YLQpJnV5YKtKvkAy_VpQgVk6ll
 1JSylvQ4aOK0KZujnrOEcwwl9tqNVH9VrQY7dmssBj7_izEIVhI2n7e0QRVwR5.ckurWgXxfvSVv
 HvEhn_DJKosWKJ61YXpPZSceXgsf_4rJVfxsBvC_DxSAQJQiyku40eETZP3AJFxD1Qk0IFtldOlq
 m2M.FqJthHspiiZ_wRjXf9gTjyua5WQeo51SOzu9PxAp8qr8q0Y3IZvlPuyxr9YMQA8secPyrjuj
 PS740KjWQ_GoGnBoPw8T94fxfztys8Vpn2niLslvLUA0YMhMtMEggfxZxR.ymRBcB2VhcUCGzuLz
 JvOrjEBnGzP6q9UZATTeBgpWKnKOQE.MDdKVeTHDKAckVmER3BPlW.iI.DeqWGmx9A.JKyF71PnK
 Hedc3nwE14IDy1v64nfpSW8tMcLPq13v8xaJoYLxdjKYIuAQ3f7bLCkgnkMglvx_h8GfWGEvaLYw
 H6Y9EfPPN.1aRmntur0km5H8gYhMjZNMPuf0dUATwhAuwdA--
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 07ed2e88-1035-4919-bef8-e41dc64d9758
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.sg3.yahoo.com with HTTP; Mon, 19 May 2025 23:14:13 +0000
Received: by hermes--production-gq1-74d64bb7d7-grhph (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID b573d095a9aa3ebb2361bf0c4e1ba721;
          Mon, 19 May 2025 23:14:09 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: cw00.choi@samsung.com,
	krzk@kernel.org,
	myungjoo.ham@samsung.com
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] extcon: extcon-max77693: Correct Samsung "Electronics" spelling in copyright headers
Date: Mon, 19 May 2025 16:14:05 -0700
Message-ID: <20250519231406.151511-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250519231406.151511-1-sumanth.gavini.ref@yahoo.com>

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

