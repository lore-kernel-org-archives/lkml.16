Received: from sonic306-20.consmr.mail.sg3.yahoo.com (sonic306-20.consmr.mail.sg3.yahoo.com [106.10.241.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15852147F0
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.241.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747506420; cv=none; b=POGo5Q25lPoLKuZKfAECzaKp4/MJTJrXhuJCE0bSJJmG+UWYkXlLGQ2bPVi/4V0M1mt/zvYvRSA3V+6VybcIOPZRejW6RFIRs48rt8sSRRgNABtMd4jNNnAEdU5NA6m2DXvloOylN86Ozkh9mRd1+hrgdLO2FIh0Pe49IH/NZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747506420; c=relaxed/simple;
	bh=EBqHy2tR5pNufrZGJpYLAcDwSIe7Er6lEEDQ1GY9Tkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=CsqpmBSdP/KsTfAKzFKON45GKxQ5Qte+jQclQfEM2rVo34iYKyF+DYIgIa9zt2t6lTBpCQ+/F64upxWw303u/7u/yj7n6+8HAQ63YbMtVzK7YdvjKFZLr0xD4NbEUYiWYStwE517wBhyVt9GmmzAII2RQlp+kUE7QiNMa8StPX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=ttwAqimS; arc=none smtp.client-ip=106.10.241.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="ttwAqimS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747506417; bh=3UHvXxXmIvOZrge3esMONCsNL2kDZZe74x0xb+Kshfw=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ttwAqimSywt7JQo8oQ4u1s2JiL+LokeLWZipRhOchBkejfeFnVP79JXPMt4XpWZN0GJ/ooqx73XA0pX9KFvfpJgZwqGynyCV+dh5TrAw7gS8Cf53h8B+/R7pQKZ5NEUp4oGo1QqTyVx9ztzAovMoamibKDDATgYLUTcDyhG9FYwvpluzF9Vfn/XfE9KXY/oUpwHAZqeKo7eZlY7EgP/xlK0DtuvfnQpKB8HVhf6Bbz9F4FCX+v23gOUEad/pRTOCPfBxAZD+MEv8tOjxg/crwsABh2q0aOyv4EijW08YuufCHsXeqlKH/Ht5bmWvOezP7luVUVcQGyegJsUkyDQQiw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747506417; bh=nHC23dcJAUQdInXpyTIIm6tBpfjsNQa2UNePCqjP+/t=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=ScvYzWVwVgKUbLhKFh8FzzSuVKTAKr1yIdNaDkEZWSg95n2qiREWxK6hY7V4WWY1nyU4G01fkTlWsNWfqdpwmUqvaS9GvgJ6PTNuqkHw/9irWAuXgUf8zKUo90VnHzR7m6HthDuxTySMbR83v+jA/fifElV04JGafIW+wzf5f7anXZGndnz2e96OEO8pylvrI5uoNRUabQ82DGLbPhWj/oILsBpqqrTV/E4fySFEaxjis3v2dU0Y0TLqM9DTcXEtcQVIJ5eHYUgjbf/PKLtkK86BGINDGB0MMwOP/VRZRadWHyyGYLEGZrN1lIFf2jHfkHNtfwtVZNemukEEVmJNJA==
X-YMail-OSG: OMoe9fcVM1lWRtfkB7dZ353UbqAZKH8M4RDoC0lg9_UcQe95_XBIm5y7B8CdhL.
 WXwfG0MvuLPTtZ9EEjOo8yU1eYswMkGbRZIBVpTh79Uu7X380DfTUoFJxTGhFnSPZ8q0S.n1nXzQ
 yRFEUZu6ucW7f9KtjET4IUwlmLJRY_fB.9RWdn3ZhnKeQKxRb4qZcscvaLyUymWBcWSvCymn0gUU
 6hDBcNgJgsRhZ43o2Vc666zMCQxDUvOe_hzFSkYLr1E8gHaDbojPJawoWhfD2pW0vrD__Z_Nh7mS
 jyF8ysS4hfTa5a.UROuDRNiHTvRvCdL3lH2U5wD3JE42lvISndHFOmq4hCTfFK2gYP3dBbRGjq2q
 e1rUmysjyo8ZO_qf3nrN5LlZH7N5WeqmWGE9zsqju9uA594OZRz0dpDypkDQ3dyu1gXoJRC0xTz6
 WhgQOG0SQuPYk5_mZOdzMGBSCNI.jGtCc2PRQOLisWOjBYg_eZCiTRi5XZXSu_d.iQfmtEu3JLbZ
 dMKT.CyGKl5H8JyTafWqFeUh_rHPAOs.a443HVKWq4rVA0h8DhFjjqgl5WPCIejX70ZLhkN3PWpr
 M2P.NFrLMOfAnOFP9pwRDF_6x7aR4LWSSjFhojcLPhpVMLb9od0Ddtnc1pKTkNFpXPCuwPyiE1Yu
 3FsIafPRnGI1rIsHZ9Md1YnJuYcJgTWsFIuCIYLa4u0rMG3jlROkGgL4EBAWl81H5jWMyskljCVm
 sauB0rildYCw_y9kDp4EV3hqdOawkg9V5hoI5SsIp3SHRz6FGut0MjFr7HE2ZjYFaTT5fBuuAwML
 kBksH6pY0WJMMVo4Uc.5eDvvLozD8H3SsVIzV3nwwz6caQ5qnyULjTb43ZtE8aTI5Iw318J1IejS
 EzkR1Hu7RvMDwchzUu_3XJ9r5HKz1701KnVzP6xalMne8WPfMvlHZMc6ssADCelgkdUDRbnNBFxf
 MyzUnUTUpGrlPRQsPFtCpRYLDnj_oNXmyVhHxJOS0e.UrOh4mwUgfS88USMUeTtntkdagOeqlEyh
 fA7g5KU2pfq6c7L5qnXkhiPDXFjMBPcgvOj4gvd93fuLt_NpcUF.EYwa6xu735USYHfFhIvE5WFS
 WhY5MzlN2V1qyxZ1YYlfahT2iQNrpF_leC5B2Cdoi9KtEKtLq8wNlPJklevLRNeuNwREhBwTKxiT
 8cEfbqU_AnBlkq9DGEIsgNO6tO19TvcrgYaAqtHCYPDzRdsLMJ2g_vHXW4XG0ymIKu3gCo9xSLJ8
 a2Pl1FUSgsqknxSSW7_5_PVWdkjGro0sAEHCDjF8HUgDQi.bkURuQrBO6shoU2HiR0mMw8.Mq4th
 u9rP0yxTxCFgXEfQOnmTYkyf1M_HgqN3ZVWSXgKtutNVdNt7b6JWlKA_EOSr8KByiucNz6qoGixc
 k4ggg2ZomwZ5dtrvBbPErBTUe7_JKyF_AbmirM6ui_FmQp75mAQ1LyLeP7Jc.4dymlKejFSn6Txn
 JjBTiFQDaENvZIS8DOeQ8lGwNV1ntazH5Jd2d83xOjCehCHODsDaqx7FPY4qsru5RDweKiFp5zvk
 IRNOld5P4OWV.GCYI_Yt5GGFBqZUED2mRszN02umn0vkl4IFLidWtWV7ZgmZ7NeOhuY5YBnm2dtU
 d7SZZr4UNyqCetApxk0JmU4u_6qleOy0GaE0hgkMJXa8RGCPm.ZK.AFNc9R2bSTJkps.ymflmLxy
 AkgviLHIIaheC4aYDmIOeBe.rD.Vq22oBIZFxLQmj2edygwHPZA5_BZxHUWmhN0PkAdUstrc4pgb
 PxHaZbllLB_JgToKI8IyIgRdUhA3_VDqHSOmth75ib7bm9v4cSj7DnjpbauVUdy2YUg3eg9qbGF.
 pCbgz0fqK_ecMeosLfKewyCaTo51lPccUcnmQQCHg6LkNrVQesF4WuT5LU0DHvUEh8njBeHqzepC
 QmrvOglvtQZkKDx8lZDBmJ3Ps12Qg7zj5cuwCj8A7m2NA1i9DH1Yr3I4La.VV3ebLgmeKBy_nMB8
 Y4okd5R2lO0OVBoXJrQB4LthVCusNXl00BRBm3EZp4Y19AaSQtCDFV05HSLm8KG3Oe7LaUieQYEa
 eoe32FxVZ3ILF2w1ELJwBJ99TeFVVTUTIgxBw9cEGWNAEnNaP1ENvq2TI.brgorMnkAcwIqd.DZu
 A_Ipqmaa8P15W50SRtvg_JrC.ipjHJTQPvjCCOOx.oLP3lBpe4nP_WWpJgAPAB6pxkmDec4FSWUs
 HmKrtkY8-
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 21cb2226-1882-44ce-a8b4-2a820bdef71b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.sg3.yahoo.com with HTTP; Sat, 17 May 2025 18:26:57 +0000
Received: by hermes--production-gq1-74d64bb7d7-tqd77 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3970cc1b0723ee96acf525c652fe9875;
          Sat, 17 May 2025 17:56:31 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: skhan@linuxfoundation.org,
	W_Armin@gmx.de
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: ABI: Fix "aassociated" to "associated"
Date: Sat, 17 May 2025 10:56:04 -0700
Message-ID: <20250517175626.1363502-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250517175626.1363502-1-sumanth.gavini.ref@yahoo.com>

Fix misspelling reported by codespell

Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
 Documentation/ABI/testing/sysfs-bus-wmi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-wmi b/Documentation/ABI/testing/sysfs-bus-wmi
index aadb35b82198..d71a219c610e 100644
--- a/Documentation/ABI/testing/sysfs-bus-wmi
+++ b/Documentation/ABI/testing/sysfs-bus-wmi
@@ -76,6 +76,6 @@ Date:		May 2017
 Contact:	Darren Hart (VMware) <dvhart@infradead.org>
 Description:
 		This file contains a boolean flags signaling the data block
-		aassociated with the given WMI device is writable. If the
+		associated with the given WMI device is writable. If the
 		given WMI device is not associated with a data block, then
 		this file will not exist.
-- 
2.43.0

