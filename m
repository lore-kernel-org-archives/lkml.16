Received: from sonic313-19.consmr.mail.sg3.yahoo.com (sonic313-19.consmr.mail.sg3.yahoo.com [106.10.240.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF7335979
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 11:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747479822; cv=none; b=F2BSWmmQ0iJ4rJgj+C0oqNPUgP7lTrSM6mTajxnB6n3/zncD6+2l8zPKUmjl4WaON1DzXshMkXTRQ3TSFSu5n7LMuJ713txwWmOb6wiww0I8mOUcOkNOToXK6ApOv2ueUomUOvLKJWbm1BW/0AfpQaylB4diXOGP8Vtv1XJ6tw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747479822; c=relaxed/simple;
	bh=rce7HPXCH2saGMac2I5RNkWHgVxbHEhr7FalToJyRyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=fqIE8jfBP2r0/78NsRAElgM7vWFW3h3Vyr5qMjZPoVG/1PJNq6f3FU9FGrro+tnFHQtA0Y863Mj0jKf1KZ0RAd+mCu27Rc0WWwYsW5pkoHdDemC+fjVf86ZSGzesgWnbjS6egsyAJ4J03nxovMlOL41kWzt06jFU82C9sy9FkME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=e/XoVPtW; arc=none smtp.client-ip=106.10.240.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="e/XoVPtW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747479818; bh=wg8geG2m8SbWXRemQp3jMfbriLurXIiGycV6L8lE9VY=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=e/XoVPtWxx/D2WR3aiBk28rRYz/F6Ep+I0E5qnOx1IB3mhmzFF60V1DCUt4RcUZiN7VPPfjH49ysMru6mCwK3xfqdC7ecRj4m6czwf79N+JTPh+llOPOVehVn1B9l7L2kWg1n8NpRxudCn5ppDgrBTZI8bPUTSgdNT0jQVB7wxYo9J00aUHq7XhlAEW8kVuFgXScuMbkQ8iyYiDArYsAgdQEieEG2LPtr31PQFzv27vMiwHU3a0gYaOWzm2IIQW7ww6wj8lhdI00rfYSf+zzB/sMHG9+OKAkKqeHgyBOV0/6xEb7VuGdxf7GiUly8treQRbAUI4fcqWYxDVHX7UnHQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747479818; bh=bRijDp5haifJC8h26o1946d+9c+Kl+A1M04dSm0nNP+=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=SVPspa/Tkef+RXjlCaFvE/5AdcraLMEZFIvbadiazOodmjr5wPG32TTbn2167VG/pq9z8J1KQRRtFMXQNASHV3+0/mqAD+9I9YLJ7Cc8zuRFHvdVwvwVNijfwQ1TTKe0NM5TDQ1yQkCtTQdKfaS3ZFHw3T0ASxiXxFSrTMpC69PdTA1hR4q3RpZIsjVbpb2NL3V3PMMBgCe4p3tyQ1dV2Uegu5vTEU6AA8skaf0r1Gtu0CCgK8uzvPh4vTBCpt2WwqKvTYyBdlydQb2McI9mtDHh7INoOptc8GVnYqUVc0wBHundNObhLHUF2wn1v43SG79j0KMfpMHeblNxajzPyg==
X-YMail-OSG: xghW5qEVM1lFzP6ss1sZDPFJJxs39jAUhuE_7fhf6e4PyWfEmpI4hbLJugVcI22
 3CFHxMynSRet3if4fJ7V24CjtV.ZebNbymNQQkAB0ncxZwWHP18zDq6IQTtdD1BE3P8s2.KGzofQ
 agR1qdoupYAIbq_p_GeUcVYnS0HsTFsWLYZ0q2S0Phuu2ZLaJkD4cGK.0NJHzKOCPC6aGPRK0Dfq
 S3Ujw35VBFpUbozcIZ37DBnHvD.IumqzuEQAvICVfYnWxIGAqhO_Xgl0rBwTFJsAFV37.K75fNn0
 2fqIOJtqPo0.zZXjn2G0K84F2i_SYjP1MxtSzB4leup8G6Os_6ToQUSEMRzYBo758S6xOFybVtip
 _vwUnP376GGCQz38of.zqjRy4eDV6LZ8JlfO8SM1M9aPnvwTx3O5O7kvaE7ZXwIDflolXQXKXJnN
 rw06AJ1UkeQyqJ83h5keAMA41Cu3GQ_MiCWfM6vZkB4Q3_1UdOOiVsgEmeGuG0PqduaWVjnCLVqb
 FQwgySoB0caYVH_O.SODKRF1ovHxyNwA4Vu_W5ZuhDksc1LMjhfSb8SN_Ptnqywu5XLbQaXSH8MR
 wBghzECZqULll11H1QEkzGYnTX6g4p6fZBUnjJ6FmXoSfNrDEeykQuXY4THs_a6Mvdk34QeJXgeb
 UHJApFWagCmFofC_k7zEfkqd_UuuHrmvmmfCpWLnfneZiogz1DTevMJlzAOe7VICbmRf6H7KRhfV
 f5LFB9LeTRtQf1wYQjxNaXvXLjgtJ5iXqXw41ANz4e4TBQ4cdZncYir8iO72brdiz5X3vVFQPryB
 cZ9uBndhO747i2tUQyACNUGycJOvNXTFWLrsJRYBlPadu6nhf_Tubsp2t3g6rqRtsPtRKfMKPZq2
 p9mGYwHCHqpye224hp3OoGIHF9gyLp7IIoGUtnMcL8eJs5g00Ebt5qGUBtsQSezLBUpj8g3Yldyo
 oPZwnBHjcTOMI3F7gJnVdKN4a33iQ159juuhUmfEm3mKyv9WIu5bdHaa5Wy7Nn5nj4WWVMaB5UPy
 RrWjFBwWyHGMACiu9CMjk0fRGlXOpl9mCTcCTG4Zqlzw_hauunlf0va2ZQ2cUgAllxW87KPANl40
 drNiaMhSf2UeVJZh7_ztRoLf7c3sBHYcK3hXpWAKUHMdldR4kP4zvqnrrS5Ifxgc8Dhpbt3B01.Z
 xNmHWYcoYLV_BlPqQKkWDRsbtvCTsFkGN0i.N89Nek0tjBiJAPw21JmnpZCfZI01Kwg5m_8dMa1v
 HWJN0LetLEuHR.fWcrDKG_0umOKu6_IUShJ1KsPT9G00MIRe9VDSQPhy8eo1f_3zjpF7VFv2Wew3
 SvifSJhuBX8XUn0yHsK69ptRXvaeowFv3.2TKSQ3Pec_vC999r8ocjM1kKEj0i.I3jxfn_dSSy_R
 2Rvyf36ASU6LVsIyBRDwKEQhP68dnI0gg.V30IG7MjSTFQQa_X7oNRyjMNjNIZV.oeo.MlXVwhh_
 9TKnN.MRpC14PD5KBSPYAZaIYTvMUH8i0cSf03_2gP6HBllY48JcVW4FbRRIu464rk476s.XeVP7
 dbQwMGJIQlbdgAHFSntqOaNaJvafbvaKPUWVad5qdgny7PjIP0OpN4WKtas4_zueBImwyV.bed.E
 TjVhiXqFwyPBRRco60Ga4VGZ88Ql_yEyuHmrL5amCeBmZpRnPYYGenzFIhVZiZ6haLxqzkxuKDhG
 TD0PE2D7V_SLo0CHQ4JVDanevAjIJArXJfXcpdDnT9Vku3oYeVysK8JQpbfXvMRPxuFvvBpE8FoO
 QeXqpWd5tuZAkQCGKdsOo_vNT4JrnbK_.JOLlnzEgiGBFF.1v8sdXRtknEdTpRNdVJAMo88lkosW
 OqRbtD.QIEn7T0_v_59kr1WY1u.pdqYK_6o9jW6i01ci_Mb8in0502bU6kQTqU2m0_GfLlmBD_8E
 FPKH2evI1B30Qisj1BQOoZ.8UKOKOvxBhFHbstJqTlP_E1v.Kyc2ZxalxFL427pdb7ortU64dmmL
 SZYpM5nExx3eM4NKyLFTlYsp6YYB6tgJqOCWxy7SNmD_5SWdcrRYdUu0bQCRqTl8D88bZQpoPdVB
 u5Oy8Ja_OUDDnkc2D_icrY0MMteNXe10P3CfhVqtGGgZqfqpjPwIsVlg.QIG.lffGPzslp1IdpJn
 i7cy2FgEw1xm237MykOt8kSrh_gRAmdbo5OO_uIh6rgc86hC81L5gHmmcaH9l5qAHzT2rfS50sZc
 OVeGYnv1f
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: d776e6dc-67a4-4d99-bf0e-1da4381a0dfb
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.sg3.yahoo.com with HTTP; Sat, 17 May 2025 11:03:38 +0000
Received: by hermes--production-gq1-74d64bb7d7-45lk9 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1a49d233de39f525523380602272be97;
          Sat, 17 May 2025 11:03:36 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: skhan@linuxfoundation.org,
	dave.jiang@intel.com,
	ira.weiny@intel.com,
	Jonathan.Cameron@huawei.com,
	dave@stgolabs.net,
	ming.li@zohomail.com,
	sumanth.gavini@yahoo.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] docs: ABI: Fix "firwmare" to "firmware"
Date: Sat, 17 May 2025 04:03:16 -0700
Message-ID: <20250517110332.1289718-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250517110332.1289718-1-sumanth.gavini.ref@yahoo.com>

Fix misspelling reported by codespell

Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
 Documentation/ABI/testing/sysfs-bus-cxl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-cxl b/Documentation/ABI/testing/sysfs-bus-cxl
index 99bb3faf7a0e..d0d58b74f382 100644
--- a/Documentation/ABI/testing/sysfs-bus-cxl
+++ b/Documentation/ABI/testing/sysfs-bus-cxl
@@ -242,7 +242,7 @@ Description:
 		decoding a Host Physical Address range. Note that this number
 		may be elevated without any regionX objects active or even
 		enumerated, as this may be due to decoders established by
-		platform firwmare or a previous kernel (kexec).
+		platform firmware or a previous kernel (kexec).
 
 
 What:		/sys/bus/cxl/devices/decoderX.Y
-- 
2.43.0

