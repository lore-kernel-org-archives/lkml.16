Received: from sonic303-20.consmr.mail.sg3.yahoo.com (sonic303-20.consmr.mail.sg3.yahoo.com [106.10.242.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B522068B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 02:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747706915; cv=none; b=AK1ikKXfYwNERkFdMsTw2d6R7upFwwIU6uzwuaFq8LPoH7wrAvHCMH8OSP9JsL3Mk+YNHbqO1aBuKNdqG0iSVzOKWiGCZ26cARvIqMBJBtUaijQksgi9d1b7m5hWZdHRWfmbSQEvFkehhAq2Gxog5GNoLSMHTIuc1Uhq6KnGOUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747706915; c=relaxed/simple;
	bh=1iWtjrV3wikHLRB1MV5zuWZU2Faym+VcModD470sBj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=KJx2q0qL6nqaeVT40SkS/rLZtE4VhjNLV+sJkiV+bjd2Zf9y8aY0MjzKxwcNqIoS1ZUObG8P4vTERzRhCPJ3BTqiU5cl/8SoAWpvAOfEUgwhS2q0vrpyMEAU8rUJC4VZhll7y4+R4A2el2k01NOiK9hDCz9Auo/7NZ7NKe7xQLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=R7dkqaA7; arc=none smtp.client-ip=106.10.242.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="R7dkqaA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747706906; bh=n/bjoE0ErYCzfxYoDNcluZH+O2TJVSU1Zgw9Qfkw7iQ=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=R7dkqaA7o8gPaJgWmGCHNIZSpOZXtM3nTag+QgVIgFcB3IPmv9+ZnrqBBky9FXYabE4LsjZgBBdPO/eZ5Xy0MFim/n/lFy2PvYMJI71o/pwJHto3i0k65LvSfmEmeR5Y+kwsDUeWp8O6+YgkcCY4ImBEQIUbKAazfQFokia17+gKniRa4kw6v80eq9O8aWxsVBo6fZ0Qa42egPTFC4OdJpU7gdKhFKVl12OFSSKMNgvJBPG3gQitoI7M4S7PsS5ueAlL7hvSPwky3Nq1GqS/nzg1bjwuv4ysRFLDQ7LqwRmIcCxixxNXahDDjdtpButwhr+Efm7Op8PjuE2I7w7b5A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747706906; bh=BQvEYuB4GS6VH91WTgeGjq0sugG9ESREl3wc8XHjL2X=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=MZaWkNe/K1oD486X4sGB75PVvHRCRF8LTW9ZnbdC8bNiEEQAbdY1YNXvtfme8EseGxtpkgOAcptKDTznNh7buBMXi6lh5UpIPVfXKiZhjnavD5YM6eDcIGoz7PRl4PdBN2wEf28QoJxlzWlbvBgigcHZBJj2XE+TVFEZHG0CauP+ieNF06LHjy14DEhoJUEAZ27Kjg09Imrt6qtRGiouTw/5v49vAShzsdOpcJTZJJVziP4YUiswicqrG75n3UWW2wQPvRAkvD83oVcX+X181z+VjmVkH4Qtx4fN98C3PUSXqUaZa516d2NKOo3+QhMerG0ubsDaB0LRsoJQNQxmPQ==
X-YMail-OSG: urVpbhcVM1nbyOIpFQqyAETj2z4XIe9MLxcevDHsMHkGOemWGCcRsepmkpm0m58
 2aHsvCBCI3G75mkWdLyBcQXkcQLf9s_horyd7CynbvggcavHshc3mHFBb.4YVuT4.Uz6yz3Ute0d
 gL3uLzVXbyAUHKddU1x9T0cndCKmGRzfbj9SkS8DXSA7UZkJSxsYcJw_0CcWDyCFcZe.2XaWtt4H
 WybvAI7mw6Ko4ZrL7GBasln6_dw29ny1_2PtnPsotmDlJIpoanpI1OYk5FPbt06l985mtCgvi9G9
 j2Q8lnKwQ99KvYWK3jrz0woF5iEZIfuCsszMLjvByBamfj7g2soGWsNKEqAePRnTL0yeZCZt6t8u
 D.nssRFc4Q0Ip0nCQ688Gvy1CT3yD4mnWr7EGnKl4wFZZ_zA2xFrbUqpFj9Rsqei1BHDMDREzdy7
 QOufGbqoHo00L1iC146AorXk0jJVOXJkYJi5nao9jErZSgI969nHaaolWf7SRc6wS9CHORIeenhd
 kfDsK9mKsjvWceCXEmuydFZYCLZ9II2drfOnD4IIyx2CQMcZEgjNOC.I8tsGeodIY3yOYrH2O4ic
 JLoEa9JfPg0zzch4Ijzl3djzvs3t5aSE_VgXhsNt2tFS.x50NElExbOm3u9mVOJB7RunRQIbVA8C
 fbcSn5BiE6OVefmEmpN9OkpCwl1hNhVCL2nkqrsfAo.9DVJPNYviEFJ_Qpdv6IWoUUSLJRHAHs3A
 V2WzdTnmnRDKm3xmU89nrcENDrtKeRjDBr18TI9jYe8BKu8NyXUiIgYHlDZwWH8TitZWzM3Ofa8v
 mUCA3iG6_GEPs3GCwbabvzbS89Wtp2ayR0MMKzeGBWoYTZGztp69xo.rjh_a2qtn4.i1qVo7Y_yl
 9DuajTf5O6LazKFumHKRXMQlUKehIcTFUAlg2Hp77acKkvLt1PzkPAXzOO.NHXJtKcFps00s3jdg
 ogMMfAhOYX88R2risUVWwXtE5i1nRIjB5sRrmYsCvXGp0JQxtBffFkEEtLKMBpLBpKHKUTg96i.B
 VK.cYDI.6F44EvDcXdNTwqYF0HMc4uVEf6UB.qNlmtkKdTgN2AAvbC5PwY_8iK6GgW31eR_kr0Wp
 3qCAWXmsmuDSwuiWyCYLcI.tC4RQV0PHzzj5tEU660HpOlbeFC9QdUKFUo1sc9XMqudJB8VRlar8
 zKsA0eXn49D8beCBtZmSiVT7YXWzEzFvy9rPm7tE09GQgpzFhNHsDdPRK2OwGqoS1HkQT2v1gNdS
 s3.jaMSH0XyaOqkn6mp37YYeq6X11oLJv.1LFYpo3Q9n7Lq6PXsR6wPSL_LT2wDtcuyFgQ6KeVjC
 viFD2n_mCvyQpncjph5wc9AAZ4fk6Oge60eQQNU8TwSaXeGRsQnQ6CtNHZgA2vxCy5777StquxuH
 ckl2wS1Td2woQCQdmeDt5IqG7l8q2EEdWgTLW3kngJgIBVGxx4KT_uN0oTf_5vRxoM3uIJN1dlme
 z9AsXAjYMmKOs0MnieJtEfrjlGJBVaobOlpSsi0daeFpd.LOPfPDgR7l_uhsG.iIxDZfhRXaChb_
 FLT27szg_iCfWWPNBiqMXY8L7LBHzpRJ3F0cWvyNIoP4a3pAnWA3U5lXgW0HrR8eM8imuzTtKKKv
 qM_Ws8pf.Tlm4Fcf_6Vpsqtey_R0BBzUnSMJZyhLZ.oAF8Zo92zNkRJ.q38jxSXXhgTg56Yu2rVg
 nVJqeXvxNS7X9not024SpYB3xFGNFtNZgSzV5n2JEhIrsB7pmgdGAhMUZ0K0W6sYLFLxHh_GTb69
 vbTaF13hRv85U2tm0I8s4QFDmk7ahrGO_Pr2.QLAXDBtLcM2GFfQGM7Z.UriEmbestB.GaT8iNfB
 ff_46ffTqDLmkQ0YZLo_ZYJ5G_lhyR5EFdBUBxPLZdJEOlm00Z9FQLa8mrr9aqDssCAicdpB6aqv
 _Og4H_vXBDVmYWKskWyxc2qJ8rzbpdglya9ml269DdLl4coB9qpKg7Ch2CDug1UEanrRZ1YRXJyF
 GdU68GanUFySJ7Wmwc.QekepuWo_dQx_vr8ByI4hfbGS64w4ECGDdgqRkOO2qC2RN.V3sHHtg.K6
 KVPou_SeIXSrjlqxWlRaxqx7Mkn75QIrBj.I3HpLSF042aZwP85hwbn6onG7diHUZZSDkMgDBGPh
 97Mulgb0wHsicwqo6v2vSU6JRQGoRw0MZvkLQpAOqT8JWlBSFrOr2NAir4CsVWtUrSrnASZDRqMd
 B5RhnGKJeAgfLavP2s0BR1HKW_C3g8wc6LF1b_c9eBZg6plmG0xhDUhfHz3CgyLdziS5GVrkNhtF
 Cfpownsm6eYh04hfM1FOLovw61UZIY4ru0YJk
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: c8463b81-49ad-40d2-b5b7-9f5aef9852d8
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.sg3.yahoo.com with HTTP; Tue, 20 May 2025 02:08:26 +0000
Received: by hermes--production-gq1-74d64bb7d7-r4nbl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 23ded0c7d2d74c2bb069fa158b0cd568;
          Tue, 20 May 2025 02:08:22 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: lee@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: maxim: Correct Samsung "Electronics" spelling in headers
Date: Mon, 19 May 2025 19:08:05 -0700
Message-ID: <20250520020808.159586-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250520020808.159586-1-sumanth.gavini.ref@yahoo.com>

Fix the misspelling of 'Electronics' in MFD driver headers.

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

