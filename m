Received: from sonic311-22.consmr.mail.sg3.yahoo.com (sonic311-22.consmr.mail.sg3.yahoo.com [106.10.244.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB137160
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747708174; cv=none; b=AlgQ2U49q3bjo0CtH92vvjNLgH9W5zqxYUdqrjdFbWySV7Wdk5NqUjEoM22mCpRDCoiIQO0Ose9s1AYTT08RVU4EEkhCRBOyCEETRc91Kx5QpbprZi3gSvwMgCaffnwxnWhKsIgFYno1wXwJBgntZ+xfC0ySUgrzpr76U3c07a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747708174; c=relaxed/simple;
	bh=ZrnAq0IuNgUpeEiPhB3wQpdZsL7zL3sWVc2GoRNIiiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=Br8o6R5sYCVEhYVGWzkMVzdKAmRQB0UrHP9B0Cvj0cOyWSH2pT7SOHOcTpeZrXMc0KtVd5wYfMSAMCs4wNS+xK5lxmwNzbmB3dT6mpg+sqhyKnuOZyZkI2UtYhaOpkQEI/3FT6w+d9GuPA38f2ujzoEoGlDqYP6qRp1Oqd3981U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=MbBN47Ju; arc=none smtp.client-ip=106.10.244.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="MbBN47Ju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747708165; bh=dMhdvCMDHfOzaQHLfNHzAlqFXumuXI3KNrHscno3n5A=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=MbBN47Ju3PQTho3Y+szJWk+kBNSqOW9Db/BEPIsES34BU1qBtWm0WPXtCeeXj3vJnP+UmTHUae18g+XpUdf5Qlu8no+iOqhGHKJRCwvnW2CTu9sQYuW/T2C9ktrapy5ZhT3V4S8q////ncAS3xLEagAfvEW6dsBwd3vOQd0M4+pX3P5Wf99/2TD30QStaiIvtCzFzZcKOGG//LmiZswX6KxhHrRH+ie72L8cfsqBF3eaf7MqCOjmQanFHNKEWiwAQlYTJrheLeRd0bnNKhl+ht/TV+sp5D/p/FMq0apNZTIIRB+rhvM3EjRpI4ktQwZYu0FMpNWpOjYiPWMCevTqmw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747708165; bh=tyskrGpds4aenF9KAOE0r1akmL1FGG3JFNT59a919GH=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=E/r3FLUGku6RN1PlAsHPgQHZLZLw0A8l+nfoRKZz6xS3JXC05lyKAGyPvkd2FyPsyAJaR/if0psHeQ7oPr33I7+ax3vKAvmBQzVlh/TjMdR9GlzEE1lJEufUNdb8olZXUcXVVk3Ixb30FT1BUXtl3IjPHJx5QZMkR+q8Iu9s/Ke8bWNQwIh0e/58/hMIqcfnNMXTKu2ty9Zc9UinhV1xHhJWgQQN5tKJLODgvfc9zjRe5GHbDIQhWSg/KbCoBe6dTu6iriA7pHOFZbK+uK5Dbo2P9VZYV7N70vkXKH9qNYfqqx2amscB/GuwCdtTGek5L0y85wWJomsAvRLFfFOcqQ==
X-YMail-OSG: ctBhk54VM1l95g47RH7NymbbDYogTKxxIwSq8UVbxj9QOpPW12wokiGbQ00QAxh
 tGJhs0TeJWLUCMSJGOdlHFcTd6.sO4W98HkhH71uZBAcdx_ISgdwN6hn4JBYZuLx2UpGgHIktHyE
 U4DMItDKzLPjiEGOXrJaWhUmxJrwy6_TcwgtrzoCnoSqZC2CUjloTVkJrRamqphRX2uxSvz.vAG.
 DI1MNkIV..y8P2dueKBi1pa7EqWwVu7UCZtVOWyi0pl1TBvH_ddQxxs66dww104mds.roXfMV3AI
 nrAvs7MITnTttwdKy1S4h4jDr0d7fiGacusUhAOb.N0pZiOObnVUayaTAU4a1JcXYSipSiQfVMGN
 MDaM5mefUU83dvIvBOb18RGWTAThnn_Pq0mEl8071tI1c2OR.suDAZXi.TBscHwitVhUVBvEO3mu
 QCUa2_wHNqV1vaCboURe3di.UKN51o2l6DrSDU.V8h_IRbH7jWMjxflaOBAS7QlzDEcUCaUQ9T8Y
 T1dSy796TmOIQ4vk6oH8eLVZfwY3DYs4OjBSosbfunMI1Ma7FxTPUw5w1A3IFCBibbOJVlzf7a2N
 WEs1_O8M.Sz6eH4OnyiCH56if2VrRJCsrA6O1Y0rpxR3kyRIslLAc9mdGy6JQ0Y4z75zV_ttH0DX
 DtazBY93GaA5QCrhp1IRwuGO2XsIuFbnWAcRPYwHsS8gV2_A1i9uzq3x.TlZfQ9pSRPuy9bi3gR3
 eNhCumxqDm_W3JPzAU8GvBXBl1lRDskv4i9LRH6v7XqHX74OiCigBcN88zTbRrvsbiU58MxXlwYt
 KM3xaZpQfxVTp9pn2bpqXrvpR2MKEuZh3TWHh.mrozlu1BjT6V5v2uQ3epFmVm5rnS.v7liVH17M
 p2Lb1BB9ees.TSZ57.42OFq9tqBtCVWs1rqDALSmF0mclTebpHM35zoG7gw1aa2I4hynCADj4E0F
 JbaQVTaoBksXi0dtYFu8DWCbMkaZoxsirClnBTMBl5O7YpWORTv9ZdOVvITM7Bk6nlw3fSsAHOM9
 anjFCnDY8Zl_a2GeM4dDRxhDiXk79oerqvNtaNUS_gup49wo51HsQLwsCXlxjkqBB3C39AW5FdQC
 jEtUdiOXWfil43AHqdjS0ExelaR7tSB.4vTnFgdDqHbVthc4heDFrq.cfk.xAFWgpY_UodPmEJQe
 b0kxn1Ts7vaTapeddjHhgjw8QlI5Y.wjRctXCQHYY.ChgdxTKpAcyAfClM0lxiqB8UbZ77JyStxy
 KELf0XrBuCkF7cdbtzlrvci6xZHlT6NrVgkA4cckYJnL0WaaknEWyZBNgNMklN48T6RK0UmV3jr3
 4NCElmDf8mqp38LLxjjItCUofz0QGNAxObNprAskCiNbTj27uOVXSvF6EMVPtXrER6qevJh842aL
 mEu.BSkNXAzwmctHvvBa3q14rUZlKrQW9iLX0mOO8Ul_n7z6YmyBMKwWN_XmsartUyR88.BaZ3aN
 Qwf3qSZ_o5KxDDz.3wyMaeW4Z1hDfv3M8ODW82YEdvveNuVRIpXmLozGOuxrbxWBx.raF1Tmxw0A
 2ELxuo.HLjZjb6w858dC4bKH1oQBbpjN2BdV5KZZ4KsNsVn21Y1m5VcVv0gjek0dKmyRjEk5.Hv_
 pHAmicqjfoc7TXWWctQyPGAjH1bs2M8ysa6OMnvQX4tM9NJCY1Da7tv9_IADWqWFe7SnXE8r6J3G
 gLdJ.tjwNyExzVXgfyWy8oqu1FqmMIB0APcEq7HmIuG9uMiVlFUvUq_GI9X5uZnvcl4xILZjfp_3
 T0pnjZkQ7tQ_gdAbwwV9WY8Toh5.FmjNjnsaVK7Qkrz1Bm_g5acCGqhiO59Mv4hFJbFB2f.FsiA4
 MXernSktZcAP1.CI9cShfdeOgEuUx4Q.9Jj1Rlqf6gz5FzPKoajbZQjdqpIz6SdZ.DXy8pzkAOx0
 EwOP2WdajflpmBpLWcwFrXf1ih8YWmHT8ttH93bAIUaz.Flv.t5QSzyNo1uJ_3pfMwL3gK5mYSRW
 YHJwbzlbqUSjQQgdZT.68p.bDbbDxDyt3MDOhKazdVs72Esg_6xF7GH72yUqo85wGrK9jNdnnGVf
 oPZ.mc3DXuH4EfGh.4urAX5m5noj6t3rXzG.1r4pgRYmP4B.LlJFKJvGOlCpoYLIOH6dO4vugPGO
 JJwlYQygrpAT2Jdivvx3YkBPCMdP8KTatqaE6yQjK8SwJhCEDSwykURNFnLIxbjUvZmdQ7VfWZdq
 MEN4BknuCXG_.dHi_lDlJlTrPijDsgpkbBZnrNQtmFOxUgFCmyjAFzVClH3fcTC.3DH8E5uO1wIf
 kBnyqLeDewifQH6ndtSKKXkBoPWjiKhOCNT17stTUgQ--
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 934109f5-ed5d-45db-a919-865090521a6a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.sg3.yahoo.com with HTTP; Tue, 20 May 2025 02:29:25 +0000
Received: by hermes--production-gq1-74d64bb7d7-s6s6l (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c55adf946ccac4d66aa5f3a67630743c;
          Tue, 20 May 2025 02:29:21 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: max8952: Correct Samsung "Electronics" spelling in copyright headers
Date: Mon, 19 May 2025 19:29:16 -0700
Message-ID: <20250520022918.162189-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250520022918.162189-1-sumanth.gavini.ref@yahoo.com>

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

