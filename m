Received: from sonic301-22.consmr.mail.gq1.yahoo.com (sonic301-22.consmr.mail.gq1.yahoo.com [98.137.64.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7F01DEFEC
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 19:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.64.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744917218; cv=none; b=OfWuCUihra2p4ErC3yMvO9y4a1HiM/ALM3Zo4ns0lbln0Ni+2YRMrlR9bkrr2CshkdwHBUF09mgYxbgIf14rDNM1QLjhPSZzS10ktxtxT6hxDyioE1HsbUFdS1pXhc9b01//22y8U/U5Li0ULgOgUnYOAwSCjv2aULbR0CoHE0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744917218; c=relaxed/simple;
	bh=xsG94a3CVpgEo0wqWkIm6AJqrfZQy7ImCt21WbqsL2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=sD7clpgekMk93rlwLy7pObvvgIs8kFjCYJaViZi4AWze8gye+JYIFFeJ+zkCVsvLdqwJUig+JxM+lFFMyxdMZzNnxpOTzT5UYHYdeQwdUfsi/6f34vjPh2FGE7HNPcCEUHKg3LSQ9TYdReJzUosYgpju1o1y3mfPst8gbIDnyMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=hSk0pK0r; arc=none smtp.client-ip=98.137.64.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="hSk0pK0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1744917216; bh=rPlrtz6zs5q9DINCcihvTUByo9aixRe8ODi9PYS2j5o=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=hSk0pK0r2wfMWx+6AKMq7pNz+kLLT0gVuW4VahECafzI9SWIrtICP4/Oeh3Mbqvrg46hlzNwTOLnTcEbdID2ccnKFdJb8yNOIpCdMQAHH75mNHE12rCfPesCe1H26y3bhVF4ZxJKwRo1jhoXRPqcFy/EgLCl1dMko0zECj2zvXrlyqyD81RsdQFfjzSvIeDlf0SA0DUI+CYVgRnjRPM8881tYsA/GWDfahbYDe73YlLwCiqpXH8uTfVd0kjZjdjLn1HoumMzI57AOYZysg73wBvecs5omvMHA66uxZRC1paJ3kSZOHDXBnbZENoPoqXqiZwMDg0F7iJD98pchWe+ZA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1744917216; bh=lbvEmotK0xRaWkPIGjJ5+rujZ4aEcj7zNXY97gM6Xl1=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Npt0e7m/zC8NoPaOCToqUT0RPBK1gBlUdxHolE+5qWcC4JkBJaOVJfwQ+fYB4UW+zC1M6eFUJqeGpeC1FWaOTZm/rmX6FyKQWw6oo+fNsegXiMzlc+zd0lqQvXxj5vzpvyhuAstqCRWRR2ANtQSsEbv0O//QT/de69UTmWeaVVj6a3oUKGneOfGDbmEGqF2NEAPk17MLM2Hii8aaT9FCP2/6CJz3bWfNp9C12PVrHmyi74bAMh3ypNfRcvpI1ev4IljMA+7kfvo/00CfUQ1UrXsoXv62DmUxadsPHpF6nE1xiCnhnAof0PGw1R1zh/VcpAjpj5TBOh7V74t3cGXehQ==
X-YMail-OSG: QngtbiQVM1kDgWIYI78bovrukFjaWf.sp6N.yg8DMNai5PO7l7mGTOSbDXge0Kf
 Y.308aTcXcRKw8ST22RwkdcleWrfRiQZj9L5LkD_xtwfmO7s14b8zLB.yzaOEfOxGuFWdA8pB0ql
 F0xcUCXmAZqoUc5M1sZlDdC28yrESaIKEcPfeg7p2ecAoYW3FNwxkyZZnb6WSl33Sl.2tSqTjlys
 mgfKafxFrU7dZh2UNXg8ElZCKYISBKx8AaSYgcwLDWSPZRugH1jh.qffyKdaTpReGW.t9fZx3JdK
 neUPogv5U96BpfYrKV.0bChaAnhERMxET1qx4hVH.IOaLjre0DYjDY47OBQOSvXAxfIuSbzZShkI
 isFEj5GjuOsfJ9jLskbBgcswd0LVlSBgMGHcVM4282P.7sCOKUADMlqUtxES9KoV3cFqsohhBQFX
 Cw55mUo0.YjlCRH6FESZU_8jYIHOQUWQZNhk_Z.nR1VcoRh2z1Zaj2Ksy_PvqOWItDk9H607BtWd
 JbJRbdsxzb1vsZ8.MBS5gkOFmIAy2fY2lnMaj.xwh0QssiSCPpq1Cu8zxIDs6BNdRSrvf9FVxDJ7
 .Ul1lIyq.ZLvDttUHaRG1kb_D.tE6cujvm4QFUGUdrJ5yIjwMybwINaE7NlnrJIchzTlisZhWciQ
 uE2GVxf_HRaqqNFDC6IqsLUje.rsEalGqIpNt1236SDAbIpkBLTP_U422txXIOkbAFuz7lvH1nMC
 7zI6JjOoRXCU9gs2BqntjRSHFDbzYT7oM40_KXcqzC.TCzi75jB2k67DG6nBWBv.G8q643dHwt3c
 ott9YxAdqrDWqpwimptDnoiFl0yz8fEgGhzapKV.JU0qKKu3S8oDWZ1kBlPaaRF7b5lG9r.2QTVh
 b0uDCt77w5grQ40IY7D0WE1m5pgTZV4MMh_85sFydYy12w6qv.UqoFjmavJqcAWLfnQr8gmDfuRX
 4lPjZwTzHma7yTYW7QRwnmQ9LBd2NLZGr9PKqBjsEEVLUYJNERvj1obnrbjgT59eCz1WIQHOpsHB
 .w.OVhqpv9hAq6iCcb_L6ent3XNOxyuFZA6ml2_p7anIzjyfRTmr_QjlfRtR0tVK1Vp2lk.OfX5X
 f8uFB7ki36TNwXZl7h8A3kutwE2JwRfqdG3twloTfS_DcuMWHKFQveoJkcRl9q7yM3Lk4OVrxCM4
 x0qukTrUveBpvQCZd7LWuIp8eJG2.NGFAFuo2PsSrjd8eA6ZfpxInOVea1ezAV7lm20hcHm.DUK4
 4YwfU1WTl0DArkdveIKRt7Ux59bE1igqknRiePgT8OXQSObnqCvW2riu3cX47NrXkoQwch.zwGWP
 ld0yulk2q7vleWmmsKyTvSxe8H5NRy6r.L7zXcZlOaLrZfbZjfpikkAOFSok8PyuJHK6PTU6YaI4
 jYlKYycU91bKRY_hMB3B6pi3tKhPiYom4EqJ7aFVxaUpQQS3XZAAAXKcFolpklRg6fQfcQXv_HJl
 6pN0LM0AsI0ZG6_6f8cJjxbXTDcAdlwwX7Hw_h3yrEtlkXrijuGSvMDu_ETyi7aD2uX3uUE7wSq1
 2CjhQYd3WixVADXU0T.6OLCa0HqPZs2xLCHXuHJQ.PI7bL8sQqUDu8pOla1EuQrc4Br4NF6zMvZy
 uts1wBsfPL1ttKXFNyXdXV42.dZACeq1Std3pHW7ctDYUhMNxEmDNkAT3Cv38xr9lXtFpvFZbOy_
 dl3HelL.raN2EZW6ydxEdyEjcQUKT1.KUmQkhG.HcvZNeTcoUL.worHAfWeWEmIEr9I7kU9i7inC
 4uW2xiSJ46yqx0bcr0uEAs81Vkej3ye52amd5.cNxqenyr.FWSxX.CXmM66fvaDTNUaMnhHCfMME
 C0A_5zLAuzRriq28gqOYFerafzGGL0Ju5CtKPU3RL0m4GiNSpr3gptPME7z65g4QWEoD_0LflHRC
 .HbIALEaSBdQv3censXIZwJwPfnT4K_VnJT_A_1UZyxZIsYtvV.OxpXiMiIVsyY1G.5u9c_6UC.x
 Ib7HdTPMMFtFkddiuAqInUz2VCnz0D5VbqplN2UOiSFWdJ4TQjUxWwWLGblSi2S00cvKBI5UMl6x
 CBkZ1ad440EPrY5I_q3jzn1sxlu5isH5v72FCn9MVg_piAGK344VIYmrh1cqV1DeaSplXF2GJSXf
 BcYZUo.44nhOmCezZlq521VXGSLsjXIYn1ZfiLr27pOZ0JA9YDxZaOWUrpozhDgzj1aUgIAlR4iZ
 NY2AkjdkoIanyUQ1HD3xiblZWJJ.k4rlF9Y1N.eVr1wz8UojPq2sBE67q5nf93dM0JEJTCgZ4bvy
 GOHUJoibI_BdizY6q
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 0dc75867-1b56-429f-b2cb-686d59c06d36
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.gq1.yahoo.com with HTTP; Thu, 17 Apr 2025 19:13:36 +0000
Received: by hermes--production-ir2-858bd4ff7b-9r9sx (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6040ee699aaf3d3f072b53831b62751d;
          Thu, 17 Apr 2025 19:03:24 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Cc: Ruben Wauters <rubenru09@aol.com>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] staging: sm750fb: cleanup ddk750_sii164
Date: Thu, 17 Apr 2025 20:02:48 +0100
Message-ID: <20250417190302.13811-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250417190302.13811-1-rubenru09.ref@aol.com>

This patch series fixes errors shown by checkpatch.pl in
ddk750_sii164.c and .h

The changes are mostly camelCase to snake_case changes,
however include a variable rename to a clearer name
and removal of the USE_HW_I2C check.

This patch series is created from spliting an earlier
patch into smaller, more logical changes.

The patches will need to be applied in order.

I have included details of the latter within the patch
description itself.

It is also worth noting that I do not have the hardware in
question, so I am unable to test whether any functional
changes would be better served one way or another.

Thank you

Ruben

Ruben Wauters (8):
  staging: sm250fb: remove USE_HW_I2C check
  staging: sm750fb: rename gDviCtrlChipName
  staging: sm750fb: rename vendorID to vendor_id
  staging: sm750fb: rename sii164_init_chip params
  staging: sm750fb: rename sii164_set_power's param
  staging: sm750fb: rename sii164SelectHotPlugDetectionMode
  staging: sm750fb: rename detectReg to detect_reg
  staging: sm750fb: rename hotPlugValue to hot_plug_value

 drivers/staging/sm750fb/ddk750_sii164.c | 119 +++++++++++-------------
 drivers/staging/sm750fb/ddk750_sii164.h |  22 ++---
 2 files changed, 63 insertions(+), 78 deletions(-)

-- 
2.45.2

