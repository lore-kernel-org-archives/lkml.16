Received: from sonic301-20.consmr.mail.sg3.yahoo.com (sonic301-20.consmr.mail.sg3.yahoo.com [106.10.242.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B9E1C84B8
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 08:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747558691; cv=none; b=ccvRC2ea8SwubocgU9a2AqYIXdaMYoQ7TmMa8lx2FK6xsA2VsUlpUqJUd+xX6HP3CVzJQ1uNwpTCTpxUAbWKBUwYcZ2JfaxPTYuEU5PxjS+r32MOOvNF2jC23/+rH39DqDNn9lSqhhuOnJrEyhWW/oNB+mx4V8+C9rp5F+ONQ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747558691; c=relaxed/simple;
	bh=THAtlnyI5A7YlyKRFN50A38aLlv6NVAghYLtTAbg3/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9LJfgOSTWDdD+IixDGIX9mLKUAZK2Rcdj2YI0O1un1eTUvvV6GNW+nwcOeKlujPSBHXYq3pYKIxfdLpdN3nNWRASJtpwu4JvuzfLjC8jix6yZfg1lugz61uuhlM0GVdx9U+IXbjcDfxS/ASvvFLrZ9O52LZYenQv3Z961WcnNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=rIdXT42Q; arc=none smtp.client-ip=106.10.242.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="rIdXT42Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747558682; bh=ZeQ0tYAb36XtgJwft/Rwwi12MnfE/T+5p3dQ6k29hBg=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=rIdXT42QFsvaAWdeOtO2FxZ2gBFaTaWNn/DwZYzcZMGz0MAiAP0CQfkASI1qH7hyJDRskvBcjUDuSQYWbD+Uu9rLCrIdty1TFL58Emw6vnqqu4pACc493FCJyMH1+8i/af9N/IQQ2OhRNThKwq6MJ0zo0GO4uzNOgysNi6W02KKmx+4vLFaPwSBkYtO73OcQFk+EqooXrFlHAJNMk2PBxmFf2SwuCei1lA7KKzwzBUEkIQbJBarao/kis5ArdYFhKNNMHuMmwKMAIPVFOe/GEAwEgeLXS1E1TO+ls2bkV18YpH7xopBEuCbBWezWzv8vAW704vQWpEvXltpd2BexCw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747558682; bh=qS3JRBkqDZwwEUepfApnDbsJz2lBP0n5JNoqeDMwugr=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=awwZVXUJAE8ykdc1NjihnOjBXFPXQiGsRT0EyqX5QJdJQomyyJ0ctaDtFCj1r1Bskh4fm3e3HLOzZnRYm9AfXfdkkVLP5UtUxWj1VErzhXSyFcu8ghZd/k3q9D4U1FI3/JF4z7KXKepLmzevAmQj5a5w0cYd92gEa0k3YturWsAPsesxYMIjs6KZKU7vyu9phMgpMEIt67OtoHm4pRMVnWsVC/IRkceQwHQwRpMSY0sc7ZA/My4tEPW95Axh2bcXA1U2IVGQBPlaR3UZspuYBO/UAm9ptAr9PKX3GhAZpf1jTIGxRLSJAYeqwgQTbxQLCvu1MP9VlW9G0B5/Jy5v0Q==
X-YMail-OSG: a6LkBfIVM1k7f6BC5grDxqVhnfp652EOL02dvVFB_8xAX6gMmWA4hjosuqoyszg
 eyZUJpFTYc15qZ3juckxP69UhhOM0p_xgfso8ZehtTeYaP61u8Df.oWZnBvpmGDgRw9vb6biZdX_
 RWsJDXzz_GbkbNgD6xCznd6VOd68IjdsVtMnahvoOTNKVfCpGrgtZ6XboOLKUX9LCrmRTgCBrJZB
 2dMAh.v.ge5wOjauJ2MaWqZx4yGnQmtyviBczh9I1WCOstR6LFq3BZEoX_Fj7xOUhQ3F.c3DWRWM
 wgeY_9eTcL0XsKE9AQ_zDzu2fLugZyFpSYOb7nDLpXCjHs_YcthXtWgTn3MXKKWEfTh743B18NqK
 J6C.ksvbHMz.BlstKJY_J40hLmiib0Hy_fKNoz746Q6QDyNYe8Kv2Fh9G4pVb6QscptQ7iqzsR6S
 Dhlbgk05ysAjO0x4.pZzfp8PG93kvZ4CyC.oNHD5qboI8vx8mgk.qgatsfDWtOjUEy5fhD8kKydK
 NGpuDsZnVHCPtWSkt12TsI41bQncXEc6Rw.Ir5aWI49ulauvAuc50HJ5RRxVg6gPaA.8NaC46DhQ
 ooR9Yu_js69ha7RDTvuu_5Wldu7LUOWCkGfBloDahiDkOQTnLnxj84kNo6Y7xt8tZone37xXYmQ9
 eELgDRjdV5TXGVVBq7rLCdPU72pw7GDkAuiRab2ruhZhZsrU54lFGjwf_zQ_BvoHnD3zGLJOZf8v
 7aF26Z_bYoZMaZjvDBnEa2nEpEq3I64LGmKeqI9vAw4JJTOvhapDX3afwYMH7Yg6mDWAP3_ic2AZ
 ZjMIB2GlmIcHpWHwvDdp_5VJCe0YukeMRti9NpXFmBL_ppk4.9neLjTnko2Dxh84KcSRIwutcpkC
 mfAhO3oflZKpXM96LUnBtgQDwm.tVXYN_NtfWLsIXh1XIg4PB_0WvNbS_lVwxkH2zyExXBZPORV7
 dg0BSskOf8mfMdci.X77h2s9539ePWriq1Ph4ZtOTrvle9pU8q.eSxk.yVsfPz.JxLAYNjTb7tJY
 .C95AEo3e65W_SDpUD4iK8B3oSlwiJ9tRqtSfi6HaDzwvVYocOlAz.DQ3_kr.ABHjOXUx5h93ERW
 HoW17Zcpg5siv2L.T4LLIjY9TEJKsfdRRsK0JXVvMhE2o7oQrjoNgiEeYL5ANKrHAHZXmcIU8HLY
 .cj58VGdtYKQNaRDxflMug7IFu2H_my5fBfyUYw27Q3.bmO382pxu7NvDv_nT7F6HJPZs_1.kcpD
 Rqpt.rI7fqr02ZxRnbvp.hoY_st8Mb6NH_j2Ugvr8Ka3fGkzCaMuFB7FiD3bHPvYynr9kP.RpWxs
 QNnMYhbl1vjAnDVBiucFZAdZ_7iAfDeZeM83epRdk1bL7QSMtlpRriDA91j7cauCZStvh2BpanOo
 15FKKx6q3d5M.MO.2ecNZyeGJdboMUjqDVDwJGh1Z76V0YlFyIm3xCPKKMtjGqXm72vnftFuociT
 FQ8n2L7aEeA2iHGc8CY5Bk0247zcBy.EgJGRI.vfPw2px4xfqcnnKkfJSwf2WOBzQp1.WMlwRgJf
 w1EKaH2YExQev5FF2IECKyLXDqsSPACR.MWiX3ht83smDyuKbPyj1Xy9mzoiI.JPCkwO1gD1JcDK
 _PK3qWovXl7ZP8II33uSLW1h.xCBlBUV.EjmgaH2VRGgH1GSwjasQNQOud4RdydrekOd9vCH.smE
 0Kr0paUPg59_7.K1xt1bVStwbsi1VRboRaPZ.cLeRLGPbuLvymdemXvTfls5iu1zaAQzNgl79ltr
 HCqWcc47yPCJZ06CZw2Jxoqk8KJoL3kUOqHni5ZmzjwbX0O0.h__7we0Qj2zIePrP7dDt_YSDdYl
 WxVfqQKZ9qrgKk8S2_ODHsufl8hn83oXCei5X8NPSOIScAN_1i0QRrK_AHekxD4gzlFkeQUHkjsr
 haJygVjc016jeXewy47P3uYgDw4B.JrzlKQGqVF5Nr43eAZu.DZAmHifMMSCkB0gHzbgDgJeoZY3
 kdAzPk4WaK5HlmmTopLNqg7NGGfL2pJ0HGZ2yN_M31joe1R_vx61G5d2rmQpIXTlpwflnkJVi7x_
 66FkrRCl60XtttCfmgCxp4FHEqj.1jeuOU9aGrDIkOKU50uvxepXkQ0uS_3oIuJw_qYAJ7VrLGWN
 eAfa8OwU7A7w1gnf.43ZIRLiMECRtQbJPXwtu21OxQqpcXuFYoJ38lpKJQObpaa4465WOslfK
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: 481cf639-0e28-402f-ac90-a9ad728b25a7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.sg3.yahoo.com with HTTP; Sun, 18 May 2025 08:58:02 +0000
Received: by hermes--production-gq1-74d64bb7d7-k2g2q (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c07c4a4ea2b90ef9265870a2a8be7fd4;
          Sun, 18 May 2025 08:57:59 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: lee@kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] mfd: maxim: Correct Samsung "Electronics" spelling in headers
Date: Sun, 18 May 2025 01:57:31 -0700
Message-ID: <20250518085734.88890-6-sumanth.gavini@yahoo.com>
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

Fix the misspelling of 'Electronics' in MFD driver copyright headers.

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

