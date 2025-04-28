Received: from sonic302-20.consmr.mail.sg3.yahoo.com (sonic302-20.consmr.mail.sg3.yahoo.com [106.10.242.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614942309A3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856529; cv=none; b=k9xTtrQ+/G0b6lJNV8lvsSgSVwd5GuLVNY3Af96HbkiNsunPmdycSSFiP9xoiEySMi6P2QsG71yM4CVDHDcjmBBchx9TBK9WI2hobEjojYe9ybvec/FneOsW7mwjcUVag3WIfkqAAAhd7eVjYomhNmAFgO0uGmG+M4GHDHqVaAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856529; c=relaxed/simple;
	bh=I9foCKWETfXWYCJb4oOX+HZlTKjK2x1qGG3FujqX3Mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=ihnRAvoe6cqKvYNoqlYUDNUUDqRp3406kgNu3T4myJ6xncqk15L8AtWAPZ+evLpgO9wctVKVV6IPpvO8YDKzSLKyn/I2MSl3DlzUYz7seVjBHx4R+RNo3MLpbvhZfRzlrR9ZQNoyzX91+/JXFAeTMKsZBVnPFekH2jQ1WWMZ/sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=JR+7UL5K; arc=none smtp.client-ip=106.10.242.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="JR+7UL5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745856525; bh=Vb51osqO2N4ZeMQqMLkdO5lVMxCfZ5uGjSVnUXHYYmI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=JR+7UL5KeIdqacEdB6P95m0rFAYK2EiiP7DNlZ2oJgdYYAo4RibxNU5T1j4To5mtjwpEboNTOICDTNdNVlGG67Vq6zgRQq650rVhikDY3avYdn0+V1AGLhYqkng1qewOjcDUELIbnF/W2iucVvG/M+yDTc8Smgm340GK0isUJLWLRHRw3xU8CQLCVY++aV1LExOMXb8J7h4veCPkWFgr+8EMfqhWQWffRdNSbejYt0rrX0PVJ0Q5DQjGgZ8cxHif7Lgxc5n2Sjr1K87FLUYfTxSfT7mqGjxQpEHBIv+NPi76P2HDfAINCPdca18RLKbW2cgE2jaFy+pCm1LRE+M8NA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745856525; bh=vjBnw+hd3yz3pBgomctXPY3B6O6g4TSWn+rJ3wcGfwp=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=uM+Kj1BtTQRiqQtn8PQ6nyeAccStZUMoYiwns0g8rWfkf9ry+FHZEILro7Dn6OKTwMdtGtRAaP7EYACJ0iRRPPJjDYuBNjF93xbtK5CH3509YZUccFhqmWXwAA0yFqbgDYg/Fx91iV5kZK7vF99UcjjfgBXeu+IXJy/lkRTyh+8mV18dAHjxnc47hTCDe0qDwl2RFWRrHV1nfQKb5TwB1R1Ei+f1BdRrPuCqKL7Ut4vphr5Xp1IYnfyzRMjlKDibA4UusOYT+rrK7vB2IhJq+zh/Sqq/HG88wMoLGFwb4p4MRIPVSCR0BQoF7oTCu7osF3bZznCIFxk1eGwdodEpRA==
X-YMail-OSG: xAFgn5cVM1kyuX2ZN7MH_rx2SrZhwHCrmLMNwoBLl489oRD5HFsYxlRQtKxrgcY
 MfMCa8GEPv4vgUGQpHnyYlpBfswL1dUFNEGvq_a4Ps8kaPXtGu2s0o4kmRA_OJUhwZCvEXclFW6n
 ttveBhX7P2xjJ7ZHdLG7w31UgY3GY3JPpqJAjoPqkF9Rh7pYOlsLXILz4oLn3Tu55b9jp.uqrulc
 B4zaykw.KtzZLLviY5CPbsAjEPcTCcTrWoURJ7J6yWKnpYh8G7KH6qbzPfXjld5XYCpYKesuoxff
 qn6mN7h8vLvgkLdE8YNMoNl6WLIDnjqeLwEP0h2dk4IZJLZBHPkLkp.XxdB8eF5_fq5Kaw6Qtqj8
 Tu5m12a0ughjGrjse5JcPBAs1A7hrtgSxafPWAwsULKiHAsyzRcxRGvsnWTATg8B2thoWTYIVEXh
 2KP4XRjcTTwZVfQykNaFDE_cO00mw.62kZSxTI3ReKWOYIaXluFMOI6Wq0mKN641NVVkYwk2.Jm_
 TGh8D6z.1MlL1.fIHTHQJtzl2syL8y_Y4XxRA0f3bnu5ksD9awPMFUXoevxl.gOUrpcmgn0tR3vb
 .mI8.8XaDNri1_MPB9Dr91N_OUFikP9c7oFcJ5mdHhF4Z10P5ueRVYr7JI3TKWDxv7p5fnMAkVCn
 X3pC01gACA4j6scCIg4ruguEG6Wc8zJJPv7zytktAAa4pZyOlvVxj8wx09s1GZavnUUM6hLEzeFw
 Yn875ntDhrsg4UJLpMTeIfjS11FdKLYU2DvSBS7HttB1gxwfVAcsXZFOnJD58h7LvUdUXehEflS4
 EgU7pIdqCcBZ3ipBKgAwbxZMaMkRDNs1LTe0W847xRkDQ9fd7pj1ahXUGMt.BlJgs4cmWnoJSc55
 dEUUgQ53V_1aUbl0dJj3BFeDk.1T1ClDX8HWQwOLH2anPMuSSzhVsQtW5oIFWeWs54rGIX2ZfG3o
 z5y.gIMyUSLfQwCiv.AwXELwUO7eO8VkPaPIbRBn7G1NhLen_DipO4bx6FSI4W6rdIFiTmdL6ohH
 MkkpfT80YebbKimCNttkMOEny.LIvTY_xb_n9sfgREhWmCgmDTjEzreGQ3mGftY1rZ1z6kW6R1pA
 mgAy62vLqLQ0eZmu5xtJNu6vKOujtYmaUkQCju2lKsWQyOitzJEAtWIvB.hz6zzHgUyyJwyFjGbQ
 0_QLsWpd04jloJMXitrTfU.7MWXm5alQvgc.KnkVNY2l6_nAwUbP0petbAjxfT.1MulLXcWS0D2K
 l1.F70HiHq8S7voOUXKxHg2nygd0Bpfj_17ZJO8ZorsxuUHlsW9T_N3xxcUENklXPHy2eIQaIXFq
 GmGzXBLgGqzF0Vrxy6EXhpQ8Sipbms42_HqqKwdas5YqynKG5V6tWjt_9Pm2XRzL6h9l1QHq9kXv
 bayLrB_KGzc5Wsmtt4McG7ZY07rn38rENOKc97tB_RSGfKlG6HouDYauwaq2Nju15ffjF.1YjPTK
 sA4qHx9r5jgwsTl1fEMTzx19_bgoGHHQOEQupA2V6qR3YFqHO1G.BXWLR3xM9xx0wMFnwPtA6AcU
 zfvWCmc_51lExFjGH9zwT33ASHMusitoRlP1dEFklP6COJ3JwNgV2c1Md6i9UmxLYHDGE2YW8SDV
 NlsHrNJSJAm9tUkz1I9Yz2dHNk.aZIS3k5lWml98KMH6Ly_uPXVJiEhUbLNSxDq8SSsJ3API0AMm
 LCCrKn9gT9iojOrFaFDJL2qgXTwkko7ZGgxJpcV48z0Vrdn9owZwEnfefDhQPdGVWHxh3EUbV5XJ
 h4DbeBiYXBWCPe3Zh4YdncCNUt18pAHENGIX1Bn2i6QT1DReqIIhBMv9IdAcmnxhF9csDsqC.crj
 Un.hOHXCZPd77fPM6FL7NOunxHqOu4sKpS.nasHkZ1sX0I6ZgWXuM5t8b_0zGXSh63_A6ucesGSN
 AbZVR3KASmmZG7LwzO18vUfj2GHQJRn_gDtk0SRBovshXtkUN88blz0q7.mASR9RUFQxkWEFdgRQ
 vpnWZJi8FH2fn8kpxtc.WD4.7T_8kFD2JbN0WPoeAnLZAoLpmytkWH4_ch8K.wzCba5i0mzLFwl_
 b1uJng7LZchVNHJMRYp4JY6sCkpvYj9Edq0WB.KPGpmFYNs72S1Saa3.kv05nDh8Sok8VUWtKDHe
 HRo8zSinubZOtW6sPz1K3woYXHw2pCCdFxSkBhnLVBklrfxyCSGqLYUlG1ep6jpiHNmRJmH6.Fwq
 iPR2JwUaCBT8VAn7joG_FQ15oZ8.Vr_VUf_2MteDsM1li0RpdiIsqAM8-
X-Sonic-MF: <sridhar.arra@yahoo.com>
X-Sonic-ID: 7c4fb0c6-647f-4c0f-a156-47eeeae74205
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.sg3.yahoo.com with HTTP; Mon, 28 Apr 2025 16:08:45 +0000
Received: by hermes--production-sg3-cdfd77c9c-5kclf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 69441e8edc2b0b466e94cefa32871180;
          Mon, 28 Apr 2025 16:08:41 +0000 (UTC)
From: Sridhar Arra <sridhar.arra@yahoo.com>
To: vireshk@kernel.org
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sridhar Arra <sridhar.arra@yahoo.com>
Subject: [PATCH v2 1/2] [PATCH v2 1/2] staging: greybus: fw-management: Add detailed mutex comment
Date: Mon, 28 Apr 2025 21:38:36 +0530
Message-ID: <20250428160837.664000-1-sridhar.arra@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250428160837.664000-1-sridhar.arra.ref@yahoo.com>

Added a detailed comment explaining the role of the mutex
in serializing firmware management ioctl() operations.
The mutex prevents concurrent access to firmware operations
and protects the 'disabled' state flag during disconnection.

Signed-off-by: Sridhar Arra <sridhar.arra@yahoo.com>
---
 drivers/staging/greybus/fw-management.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index a47385175582..56725b711a17 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -28,6 +28,19 @@ struct fw_mgmt {
 
 	/* Common id-map for interface and backend firmware requests */
 	struct ida		id_map;
+	/*
+	 * Mutex to serialize firmware management ioctl() operations and
+	 * protect against concurrent access.
+	 *
+	 * Ensures that user-space cannot perform multiple firmware
+	 * operations in parallel (e.g., updating interface firmware)
+	 * for the same Interface, avoiding race conditions and reducing
+	 * code complexity.
+	 *
+	 * Also protects the 'disabled' state flag, preventing new
+	 * operations from starting when the firmware management
+	 * connection is being disconnected.
+	 */
 	struct mutex		mutex;
 	struct completion	completion;
 	struct cdev		cdev;
-- 
2.43.0

