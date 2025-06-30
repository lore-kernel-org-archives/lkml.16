Received: from sonic315-54.consmr.mail.gq1.yahoo.com (sonic315-54.consmr.mail.gq1.yahoo.com [98.137.65.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2952E28F514
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.65.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294568; cv=none; b=AWFxnRMptno1dZYzoL8/Br+umf3JyNes2uI1zE7I/JfTkHXiGNbrUVAr0FGxmaLeFbAzR9P2egCwZST7bzrLOhgIpxu6JKf+RfYoiMPNPd+SGq2EwmriygisbhBHdy0kzk0wSyZ2+Zq6u0ep0UwPb6v+eza/+/HyDfw3CVuOi+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294568; c=relaxed/simple;
	bh=0iQTgytDpXPifoTXnzLi7AzAuu4j8wWJg3k4W5clvV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=T4SQja2RkuBGjOvN1UJmrKcdSZBkNvaB7DktjmBLojpfTk3szFA/NVyTAmbNKx4gUlP9ZSn0vrFbtJ9ZazCMBojVxy4eTL+UAbFUdjaN1xd74N6gdVhzqRJCxEPQL8R+bhMOvnU/bhuil2cVjU8ZtuLi/cFnYoktKvBMkNmVdBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=JDritgBc; arc=none smtp.client-ip=98.137.65.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="JDritgBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1751294565; bh=1ReWLvjRkJ8pgsu7xZweYzjXrECUSPSYIVXB+9ZsJ3Y=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=JDritgBcRyAmegzrApj9ul90cWdv8/Q//rVibRu+vzEjkagSwrTOYEojyMlwxeZBgbz3Q7TSXRmrcW5/QGJefghOwuP1Ovk5VbpfVpjRf+rvmRQogm7BqCiSxZ2YJWNVFoIK3rjd3R75hTvscaEB25LY3+4grgCkc6dbqk7/3CXNcuyM4Ew1seMMaEw0Rl3UMRHizdq0TRSYDANnQAssVekCjxEeSknaAI5VdfhS6WP7Qr9ueiyvxrpwkb1AFH6ZauUEvVQHTCB6pvPi24VlRaHBWBVbNblFjOb2p9Ycz1jE6D+DhArbgK/SGF6rsKT/zAnENFBTvTZj40ZLRRMv0w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751294565; bh=Vsf5W+UUi4xMuoKFxR1E2TWeBDpRHdiLh3gyN4g975k=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=JI61cKjoZtayfF+0IvTlYXlcUygY2n891i4LBsythiSnyDJJGmLzAnpIISp8pvQ8piBOT3q8rc4ZmK9YBJoHiWdu/EdklvhIEVVWxBy08cRdlbMA92B+a67ajMQdV9InA4hO9weo940iQyFdfLowCYWEZKYcY9LEg6k9MuGIv5pIl2oGRpp80h2V/c8iv06qeMFKfdfBuymijskf9TcaErmJyfG0egBE7gayUxdxAN+GNbupSz73c+O77M2YZmyJ1l3MKXoeKgWHR0/O7SoVMmUItW8LVGvJeUr6IYA829V1bn9j1VYHcszhiCt42O+EefOcZU4TWM1VoHAGCa4XKg==
X-YMail-OSG: vLXKlo8VM1kC_GBokyhKql3g5D3n44H0KS7CEHuPNMPBB3rW7_8zIWoEnU8iKuq
 a2Vbpmdv2Byn1riR.rSw6iUBDGBz8JIu8Lpk8xgCHbIzcXTs18bALKOGtI8RE6VyultWkaxWNNoR
 tV85q2OTc5ClhyTc1IwjRIEPbHF9O.xr1OO3iHAeDQ9prglGwONd4UqWaJU4NPuOWOu1SQ__G7oI
 3Vw09En51co0zTwnmEw6JIeeAdr.vAZhGOSrhbS3SBgvzK1_k3vE3ncTZJRn70w0H_cdj7S9bSRh
 84vc6aLumd1OfhVQdkm1tPd5dNTu1LzYsoWfg8rCpj59VHz1eCZVHcVRWEL6cMq5wzmNBciUYIhb
 mNq9Ow..o2v2u81p.4oWVvAq3wqW7ukr1y9flI0nOH2QpijnmgppYsg_3kGHcKpCxxJvI2ZGVjl3
 Qa5MbAdflQRQuGQNxCUiAlmRDvNFU9lCPZITt0DuLgngedZNUJ7lm9727bMwD8dBm4XUqNDlcQdk
 6bNUmUcF9tXq2JJljggYcPAh.C8w7r8.gNEiOQIJNTx4gMlxxqn8V9CuZOPFh9qUwMJJwzv28qjc
 Ht3LP9zXi_LYfGmy6Wv5f5FuQXGE9rCAb58K.kVdoydwg0g.jENCi4OE_TXWFFirz7UIjDC5gMzs
 BVIGuG9YIHkAwuL8oHmckjG24Ic.enNWwbF1_4SzabS4K6W2ohH0MyqD_WA1.zSspRbmY17s1BrF
 IXJ9ApCwRkiL9Fy1IiD0jjF_ws_0MJSQGy9N2V6.kzMB4ty1b6VsYPwMCTgggah.jQ04aImQ4H8P
 PTNae_Hz_kO7kQ4nhbQZFT2MB.VOu1IoJjGxwNXPaMfWRahTiiJAWiK1t1Lsocc29tPY9ndT0g1B
 gE2T478K6W.CDDN9wV8D3tkpA4lw3sj_CERlyD33v_LtMjGINdEWYgPi.bvROiuLHZAYwUbdzq9w
 aU0yd7fhpAutJRMUvMpruRpoX_MRK1gIDX.3nu2Zhj4rdPX4BOXwgdBGtMkbQPnS2I.Y0aPGGdEQ
 cJBcrIoOaIvzFaQez5n8JgHNRiQXbso.BGAvsxHZs8gfIB6M_QZOpP7pc.YNW99YZeB5hZ2ItjVh
 AGDhsG_5P1FwJcW7aPF.wvq_Og5gYtG91kMILnW.eaoUe3OAJouDshYlXGfLl3ME5gf3uD9Lle4y
 Kl5q7I23WiJ11Loaf51yAUp9Diy7aocbQZeuAlAciaTt6p74m.yfvABeo814QrOkSYcMo4xcPn0f
 DVzq4.Kt0WT3sEWeXBeB6CxRcxUEGMjJME_qlnKqcWir5qmjKWTxPEUhJaI7ms8REh_6dZpOfqd7
 u6AbCgCVlOzCmPdp5EW5zrK0FJqJE.eg3jpwDZfnKBNrlGznp8I.idBBb3DpCQOyBl56MQwk4WdF
 8Pq7Cb5p3RvfEBfVydGjavsSKKk0KW7v0uFk2aHA5G6gb08N7teXyaXT6OwulUbWtss27UF1J_2i
 HTx8JNNrMpLdzoAa98MAvxxDUBSZ_Ru_yPERslfRjH7QTB5Sai8I1aESw2eZbSxg_Wk_K9yZd1rF
 F_m0QPehAyU3bV7iFrT4a8CJZDNQz64qVvkS2BA5DQaLL962.SisTenY0PUqptCFHvtNWEmy2f.9
 S7yODoLnNuUqIW95nYxU6bcYHgHScym9H3yIHsC5VmdE39w8bZl4_PgwSarDvbjgrFNtKCWFgckk
 Y6wT0jq5dQM9dv6xZV3yrvTlJAyBi.NF79bi3msDgkjmt750XBXJOMvw.M_0JNAU4xhK.DpBO4DY
 ZAGZe29__DGhvdQs.QexC.AwqOl75vvEiIQHdW5v5rRJ3rGIk04rKaebgtl.b7ha7rF_1e3I4lLZ
 GsPTm1BwEucICeJqRRYBAvKWpD1Aujm3qABtTJUVsH90i0cHwZz9YHSTW8G3pzJqbi.mhusvB7Xz
 C3oyh2s4NUrBr94BHgeHzXRjlhRJ4isLT8yrRYnrhPVlrs77i7W9SctOeES2gvl5In5AScLJqY1j
 UrN8GQml7QiVo2zhvWUbSHqjFaBBM2SVZzd7jFYH367vcOhc99RSib7a_ZfOQrUSRK4yGqNoAoWK
 gc94tTP7PVwA2M3wu3BtchnKX4JE2T2srL4ZKuNnaz1XU326.ezsFDwbFLZ08XdymbtdQnDnMyvN
 j.z_UOocrl7R_CsshTthFyXQieykh_M34eqcR4a_AO_1IT6Gs0x2RqM88yO2aEMXgFSPY6QW26rq
 sdE6XOgY8AeHJJH3D9MtGX3qoUmuBTBRmEys.oMK4.yH2IZj1qJflvlun53zBiXc-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 766bb39a-390c-4aee-9b1c-c2095b160f48
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.gq1.yahoo.com with HTTP; Mon, 30 Jun 2025 14:42:45 +0000
Received: by hermes--production-ir2-858bd4ff7b-vtq9f (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID e14431b72d654bdbc2a2f9f3f5f89e1e;
          Mon, 30 Jun 2025 14:32:34 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Ruben Wauters <rubenru09@aol.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] x86/cpu/intel: replace deprecated strcpy with strscpy
Date: Mon, 30 Jun 2025 15:29:30 +0100
Message-ID: <20250630143225.6059-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250630143225.6059-1-rubenru09.ref@aol.com>

strcpy is deprecated due to lack of bounds checking.
This patch replaces strcpy with strscpy, the recommended alternative for
null terminated strings, to follow best practices.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
This patch was reviewed by H. Peter Anvin and (by my understanding)
was deemed ok to apply. I have not added a Reviewed-by tag as H.
Peter Anvin did not do so.

The last time I resent this patch was during the merge window so it
understandably did not get applied or further reviewed.
I have resent it again as the merge window has now closed, hopefully
so it can be further reviewed and applied
---
 arch/x86/kernel/cpu/intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 584dd55bf739..b49bba30434d 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -607,7 +607,7 @@ static void init_intel(struct cpuinfo_x86 *c)
 		}
 
 		if (p)
-			strcpy(c->x86_model_id, p);
+			strscpy(c->x86_model_id, p);
 	}
 #endif
 
-- 
2.48.1

