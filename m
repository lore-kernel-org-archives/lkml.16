Received: from sonic307-4.consmr.mail.sg3.yahoo.com (sonic307-4.consmr.mail.sg3.yahoo.com [106.10.241.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2529024A06E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.241.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749680134; cv=none; b=E1A7t+d6DdKiq4KypGIRWPf07bAdo0fKDH6Ssy07R/ihu9B1mKIC3aquj/jxEdCRPCsW4zOP9W5+dxM14pGHD1VB+r3MzAaq4DKu02BzmC3UHZMifTPvVF3+YP3TRfQOkPpbXuMOkEXlSJJ8krNLddz/JQM3FiWnPycfJHbPOxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749680134; c=relaxed/simple;
	bh=/0Vdo2n4vBWv00iFSktmhK52XeKrbW6rz6XK2gUH1Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OccR6cASx8+k564qVapf1fjEXZQkEMCiFiNRJ2O2wzBuiJJVrOGThpcGx8OWl802KoQmkhqZzeKhXjkKDmgzqM5ZH4/Gnx1OgNlpu5dQXRJwPXK7M0Yp33QxYdZirziQB6gQJnBtJXWFJGmTxQ35EhinfvkLVDrpXi/yFxGBQIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Riee2BbW; arc=none smtp.client-ip=106.10.241.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Riee2BbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749680131; bh=Rn5w/P+M1tuc2960ReqD3yHmxZwhUR9NzbcqGhHPW7M=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=Riee2BbWYU88sdouwcgo3FSFNQzx8/AXn60d3WRUe6AThtVZxcihM/L6j7VjardPW6kPrjfFcTkJWwfGyLBkG+o5cxMTjpGkWEz1ru/ammcr4sWkW3zZ4//yeds90v/yctl/aALBscH2CGz+3jumBPwJVyGrsbZagiULY445MWsJ/Ohy4LQg3CA8dSljEKteV/i24VErpWvFNxegD1YTKe55FVcJr9rDS2g3CpINNyz6nR5TT5b7v/Q5llMVuBXeZx/b2D1MfEBka9WEvGS0MVx47kjxLyAnR6KOWVLmELW6L/pb9CKXiGEhGz2X3zWSqsphsQoEIGR0GTngf7suyA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749680131; bh=GTJ2tCSICHqtJpc2B4sx31IAsKSfnDkkMnALKhDeV0H=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=qw+sQpoNccd9Rl3hkhaK0tRk+t7MfWDXMC4+3Y/OovCVBInH3Hussr18nvmcd7JZjNBOA1b2vv8Ei8w7vKN9LJn4pIHH9h6Bl9Odrwq0rY+UgPZ5bvlkxImc/IQmfhK4Bz9Zl9Mr32bnpiEY2BQmWw+5qbJGqlJbmHU5c/yjZ96CGkA4a7c8DOq+cyEaYk+yJ3FBjFoO5U/xuRGju78ROQ+J5P9Ohx3wRQgMZHHa8PYxOdfcoO901HFRy0jrueX4CxARPdXNF2zcgDspuMXggp5gEa2eC0elW6q11IFEgTT3gkedeml/drbbBUIM86OD5RZqyPxk6kfBhJRGJobkcQ==
X-YMail-OSG: a.2tuGwVM1kfTLH6cec8WQUaPjVAFMdGc_qj0obGbzt8ygiI76p6JNr6G_t7TNU
 xGuN5cd9OoP7wXqGpGsp9X9ZpLcBbjDfzYqVBz_QHh9IE.29GFtDVbvjEnCdmMCkK6Z_LV1M9lY7
 Cm1dWqolJibkZSHRbGeqWxPJNL.6m2zdGykka4rcqAlejOlA3IPABXmixc_Ea0BIMYUgWINPBok7
 Fcm_ugku.30z8XXilYtUqN4J7cDq0dTBPS8QomNEfi5GupqZmQmQJGxUin2BD5RKQYKo7G3hsd7g
 IAldcfyTWeNTQWAorNfklhHBAx8jASU7j0.JmmJyUd35cpiJNjx06DnLBVtPCrnx.xfz5b2GnaYO
 VOAhw955azmutM.vZJmUA99CUDIE_Oa6FdFGgcuRviNQH4wx.HBZCXAHV7QUNArgzC4NEV6vbvT6
 upOpgG_iT4.g8VhnAsXpyEDAcM8Ml3ua0qlSyifZRJCEheSYAoB2V8f8LLpoO9iVxOzwJNd6i3WN
 oqQNq6Cm9C.7x8bSseYohwx4FEx6tf0ZPEr2G3Hra.QHeMpxBzDKa1VsskgsDjW9oPY46y3dysxq
 TQWRzYC_mh3PX._ac7a3LqI2bn1zsI.0uuHC9ZupasHF_PGCcROdrcfXGqvgvDapl_7z9J7Jka0h
 30YCshIZCE2_88vQ4cri5LLBnKE8FB3S6ck0vlmk0NlFqB3mdGFdyLrUrZFJaHH_llf91s3MiI6h
 i1BpwNaZXpZvHJ2pI8wncO_cSHcSloQFeYSO2JD3Vp6OGZGtMWFA._mMxMUOLNlTN3Cv7bkNpvmI
 GdolRtY0kBO723j.995iZpv7h4FTmlTYL8.I5MlI8zs_RoToFlxG4cr_zvfqZze6plhPHOpiOY90
 Lv_gaJgvKj7IxBir8kSh5hcSweRV8V5Niq8Y1x08.Yp7C1D0YUTMNhDKFHxKmQbEFM1d6emeNRm6
 d51o2rlSNmd0afFhiFzq8nQH62blgpT2gYU.I7IRvxW3npQLWPrI6NmKwuJbBwx.bzAQAIureylV
 ptwFv1ziUygDfS001u4EU9UiqCp6rqCYRB4epJ4hPm0.DXBksKGhvsGj9vcv76lJo_.HjwXswVON
 lTYM6tXkDvK0PEnLH1OjFcUOAjMav6hMN1eMp25y_C89inUF2WNAIOLz7EBG87IzWBtp8CHqMiiF
 UriGno6HFimBoQ5VTnX9PtJhFoiNVD8TY.NJeAF73WxRoEgSDW8_PJCvhvi8jw.eg.e0629Zj1Yq
 4OJt7g8tmVqytzi0kc1tN9gstyWPI3Z8MNTIqI6seWCu66AWgmSnwk42YOzs.ryZ5FFhhlVc9WTc
 6BUHY3jALbge7ezobBp60qb1oZS2CnBDYHAsyA_UgWd5LHf7L2gGU_875oFZRm8qDLKhKJ_4qsQ4
 bVvnM0Etzinzlqjixt2YjHfrNPNJjb68gFoIpyrI6Bp71pra9P9afraiYnkR5mjuwF9chVErmN7y
 uGDV7nQ6U.bZmbqurg1Dtwh9jBswdrDx7Kua0IFGqUGYKmAA2OezdA.8whW5TaD85SI058LICV.A
 6tloNepag8tY4m9VAvOCm9QP08JSYGacFwlvbXbyxdvdz18vNF6zAcMV.kYaoCDPyZeCQHO0Dvbb
 mK1R0dyhDGsBd7Wpqt0mC1.T1RqAWfnK05ulpVi3j6u8hB5PFuMMrWbIA73p8lczP5sdkC.oXueI
 kYZeHAYiVsPAPUkWRJscLs3sdUhm2nj_EfV5hrPSsjLZqwVjMXvRVZb1UJAj6S10U4VTBIniv76c
 7xC5VUtYn0wfHKq8P1T5sPa6BDFjoJ_YHgFJrY5Xn4dFuIphUmF00ZcexwuxJ.uLK4EwE3PQ22Q0
 VUM2Lm7n8Sr75gmSkrpFw5yKA7Tyi2go4dysvxqvqFLaN7tywT5v9zub3OXfFrxL4SvL5ixv0kBW
 Ss5guBVKB8w_wxHsrJRA6Hhzky1Z7_LMlcHHEg2NRw33jPxt2O3vrQwV7mR7epJwfXAI..d80x8c
 CqPoh06oKAcpiLQvpcBwambQJGiSN3SNGVGsBrJmlvtTai2OFbc720uadlZC.u2qwOWPiWKTOBBX
 WQgE.DZb_.KMDL0vOKRduPadta6G9QAIuj1ImOqFrmJZsOdJCRfE_L.CiwZR9z91TZKklo3LI_Vn
 WqEanhCjtAZwkRGAN1mV0ACe6bVodKf97_FU4DydmxTI8rodceS.A.30HsqG79WmQTW6EP4l0Xho
 jBR0ry4.R9tv2_VjeSgwIGDNZJq_lr3Yziv_mhHn15vZiLUoo_fxgSVU9h176mEgnoQUIjB4IPxk
 0aEP80XEW8CLsfoRTCFwjnn48kji2yUvip.MZ_oQvz9pcIoxWNdU-
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: d3e8ac7e-f1a1-4672-bbca-d7271f1c36cb
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.sg3.yahoo.com with HTTP; Wed, 11 Jun 2025 22:15:31 +0000
Received: by hermes--production-ne1-9495dc4d7-psbrp (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2ed6d631eec321540bbe8aaca754edee;
          Wed, 11 Jun 2025 21:53:10 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: sumanth.gavini@yahoo.com
Cc: arjan@linux.intel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux@dominikbrodowski.net,
	rjw@rjwysocki.net,
	skhan@linuxfoundation.org,
	stern@rowland.harvard.edu
Subject: [PATCH v2] docs: ABI: Fix "diasble" to "disable"
Date: Wed, 11 Jun 2025 16:53:06 -0500
Message-ID: <20250611215306.2989590-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523220238.455718-1-sumanth.gavini@yahoo.com>
References: <20250523220238.455718-1-sumanth.gavini@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Shuah,

Just following up on my patch submitted on 2025-05-23 22:02  with subject "[[PATCH v2] docs: ABI: Fix "diasble" to "disable"]".

Original message: https://lore.kernel.org/all/20250523220238.455718-1-sumanth.gavini@yahoo.com/

Would you have any feedback on this change? I'd be happy to address any comments or concerns.

Thank you for your time and consideration.

Best regards,
Sumanth Gavini
