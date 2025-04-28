Received: from sonic311-21.consmr.mail.sg3.yahoo.com (sonic311-21.consmr.mail.sg3.yahoo.com [106.10.244.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564A727A12B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.244.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745856535; cv=none; b=KBCtCKM2mMXN2Ka7M5CbN+0b67BQdB9g5OndecobAvpt9lteYjWMO7JQZSIHHeRrXzybFD6GL+uiNLAl7LJ0gzHC1vJgy+wX09pe1xvDTHtxUleYmP8NxEKgGYRssQPZCJWmEPwB1uAEXaFfOmu8wZnn9pP5fnOi3tWhBrLCBMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745856535; c=relaxed/simple;
	bh=B6uyN/GXc2eQI6i3BD6f5Z2pfT4bTJrXRzoEund/6uE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLu2HzwfmPD7dQkoRErEUdcDxdNqR40R10TZkmn0MnP2VyWVjV0LNTh4s0hjp4LjW3VsAG/FQjh5BwqsjEyQ7uycBgGZfiFJZDsyEWe3mEbEZ9Dbh9K8LqnZXfobW7qufHZv5kq2YMNZR2MlSCciqBDIHC8HEF4BveteAJnvOcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=prEXNT1y; arc=none smtp.client-ip=106.10.244.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="prEXNT1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745856531; bh=VLcOt41PrL1t3Y+w2c4iRwS3H4eA69ks/2yDegArszY=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=prEXNT1ykNXrHzuQVGkcjaGsQv1+qTEphx53/ibjQ9XmlCE9ijblq1jXnhyPCeBjplKjN+utjyDL4+b5FEwawDoWzSoFVpj372zyIceAgFS/nTDdCFzRE/3tmPUCpwUMFCE5MG/KkW4eGhAYCbVS78DLrS46YMlquPW8wvYbTLrFdGmh7TAL/netxQ2XrdmMrWpG1hKh9pUWumPxjGajDxddOLUj1bhLeaeJbKRpClyQjAfSrSF48jeyErcTp3T5JpHlEJSx64/5cybZyJ4p7CY2GZEzomtR7Yxw3L8+RCRL7Vb1Ns2mBw8GLmls+QR6QAM01ufxUxHoSycSmbZraw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745856531; bh=JSASTLT6G2Ln4xa2I4GI30CjpTfFSqfT0SjATlRRvWO=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=csimAA/uZRUFzltMmiHWVjZOYieVEqEpSLZkpX2VIBNYp/HY6KGuVLOt01+hQoGJyL11Gn9M8K7UnLOXaGL2J8LmdDFYHlBEeI3frLILf3pk976gdSF7sCdqMadfsoK18PcvqrtcYpmrFJLIwyX0hT6lRDnjbf6BSv+zlbAsosBU0NmBP+NcK5yBx2c9+IwP6j0LLeMf+lOjlHLG44K/pP2XqpOjYFcw3uXHKNXe1i1DhGtA8bPUw4FPBCbiiFGKKdeh9wI4BWHw2RlI7A3mSiKe8hukDK0IHr0/FJoo4wMLJbDKaWCEwSaEascUr0w02sHA4aWzkfjAy3ugHz68nQ==
X-YMail-OSG: rPr3dOgVM1lzZp_coWwp3tcrJGdx4SUaaB618vcSGgFN6tg_Vv4bf1_uXEkVSXQ
 DNX2TUzHUIYlVYOa.m9YqDCHVPh6P81c.uIdtoPl2sVt_1FYQSVk2EaVoxC.wlzOlgF_3Y8qRb.R
 dnZuPAZJjWeofE0orP3RFV_vfydYhb3q8PbOJx5lMsInOWjnmlx1kT8oe3I9pUPnVOJo7e0BfTfS
 7SPzfL9flurJ1Jg4EY4I9GZ0.FrIXgezSIxWpmb_PWbXxNhh9yGGfyRMaU8rdRGlrkJJ1RYYUL3Y
 dQMU2WQdxdr.y9Z_0NG.yUrcithXFzfawoYFm_lE9RDqJrhjOjQEKVDqcirrnTss_9W5UZy0c19u
 7C_hl5zz6UwsRehIKMxxmzbtgMxkHlFN86yB21QjMl9PG4qdA5325tVO.glOISYuPgDl4e.s87tl
 2R_HDiLycF2PaiOFzswbY88q2iHgSkQTJGqbqEK_Ivk_owUxgrK.cdd3MMS6d62nHRwVBi8PCS73
 xlha0LipEOcnHRNf7uOrVKluWKfT3PmfWRc1FmVXVof8BMH4M_G8HeU3t4Nq1SkyfVq8KDE85n2a
 KHi_PyHIOB_Xw.f739CFj5r65M1WvZc98qjGL985FnqkRvC71gx0y1cuo2_0UwBihxPRSgS1HuaA
 yQqLlKowQ_8Sxwb5qiiXOoSVQ6jP41FScTW9IQ5Dn_A05mPCyyTILHRc9wx57priVPRT5xmeVEL5
 lyVoSBULG9bwfLi91.UlTUoZ9YeZXO8t5C9uxR1XMT0KMifnVLO9LrU6wpGycvJGcTs1a1TGywug
 u.zUKN3gsZ2SAZc4gdWfhEojLC_7avlVMYuwXefkG1PBlUqZTxnFk6IgDr1_Au90Z9YobFS43CXI
 m7peKM8BhIAkXCoMHHk_F2aJVbVFrpv4wo8BGdraCCuiQPL1dbruSIN01Cg7EmqVy43glFPd0z0S
 NKEOsAfwAWm0m4OUmdjVFnJI.CsyEdSyTMEarsKcysDdr1rqyxnn7K2gl3R4SGU3MDr6hpBTnAXq
 ZbjFzr1izBJyHZUaj3fEokeepSLDan_IBfJQP1lG7ZKXapzNRQkt2ULync5pO_HP5E6nTPXwiLkL
 efCVzBYDKT7krl7yo4JJoS858eMPFZnOBlHc7oHMnLUIvKB9vKSUaE2z3IlNI06lOj50wXBtuEJH
 KIYZRfVybzqfc1VS3f7AmEX0G.lY_Y7D4nYCCnvamdcasikrAiguE0M6HJldysFokmcBGLaHKm.w
 sc52SwA8nt_aTqy2sJo1jHwoVQHzHayCgX2.glB2elT31xvrrm4p3FBHNBsHeSPt5IYzJw6_cOr1
 k7GzaWhpebE2h9sxrdrYvOIPCcnIG1ZnCoD0n0eGBgS5LiV2eoLXvmAukXVi3n0dHhX4CW6yxjaL
 ivdnJReJwdnu4Dx88GUtwKeyoIxWbHlnGmo0DAedsDmPEvs2Cf1XIy4YPPHJ_KSHnKPmMi7ZB1rb
 fWMQ79Pxl2mF65lc7ay5rlf5zD1QAqj2Pq3DttEqk.m_xm15BxqI5fTUeFkKkKn0cKiYX4newHHD
 L1_C_wikGt3kXoKfFQVJUv_7CWGWrCl4XFJSpZ9Ghcv37IXwNGrc25nOO94bVY1no.LWFzzDNGPG
 TvKWbQESFBZpEMpZJWL9O3IXPQISvWYU3rYGPvVUTqkq1e7T55JRvowwx4m0SflELJXQcARUhyua
 IWSmSToGEb2qREoWWlDoTDD5MyaJTC5om4U7sLBhUUn_PwIwPHEy.60RUzpyPOsuTMezUeAN4aBp
 xewXZpMKwRL2h1tWF8Ki3gQ_MfUZ2jdCDCWGIxh4mVfxw6jVIyy0AmFD00zotPGjnxIiRermV4pH
 WMRy3VmqA2oMmXOz9TsBQN4KxjeYh_qMKpQIsxIph7sTNPKxuKzAFTj2gAQcFJFfCicO1LwALa2p
 YSg.J0YtJxjhyfS1W64gBTIGUjQ1j4j73w4tlWs7gePIIcyaKbgR1umvVPv4gcMyTubl5Sn6B5rL
 Dl2g8oHzTFdYQM2hSBfNN_LyFcevxekl8iCzscbp9E.MkZ51v9L6yOK6yzuJTN3Ggre7tNRHTYsO
 bLcZjRYlTWdcZueK3GF2FAuS2F3UFsuRY89iwk8YRPcJ8I4DxEvkzo3ZpAteE11u.csO.2x4HEUO
 PeAD_5sll6hDUpv3yHh8G8zUknqgGWmGnjc.0Dp1yxQl686MCB7TAdM0iiO.xT05qdKVV34fL2pD
 jhr1fEFdD43YtWF5vs37nbUOP2fWdomD4XMVWqXA3YafAhXIfDFyxTueHXrg-
X-Sonic-MF: <sridhar.arra@yahoo.com>
X-Sonic-ID: 3e50eaa4-aed4-4bc8-8fee-61ed46524e8f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.sg3.yahoo.com with HTTP; Mon, 28 Apr 2025 16:08:51 +0000
Received: by hermes--production-sg3-cdfd77c9c-5kclf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 69441e8edc2b0b466e94cefa32871180;
          Mon, 28 Apr 2025 16:08:47 +0000 (UTC)
From: Sridhar Arra <sridhar.arra@yahoo.com>
To: vireshk@kernel.org
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sridhar Arra <sridhar.arra@yahoo.com>
Subject: [PATCH v2 2/2] [PATCH V2 2/2] staging: greybus: fix indentation in fw_mgmt_ioctl()
Date: Mon, 28 Apr 2025 21:38:37 +0530
Message-ID: <20250428160837.664000-2-sridhar.arra@yahoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250428160837.664000-1-sridhar.arra@yahoo.com>
References: <20250428160837.664000-1-sridhar.arra@yahoo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects indentation to comply with checkpatch guidelines.

Signed-off-by: Sridhar Arra <sridhar.arra@yahoo.com>
---
 drivers/staging/greybus/fw-management.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 56725b711a17..413a4d4f4e40 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -461,7 +461,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
-				intf_load.load_method, intf_load.firmware_tag);
+							  intf_load.load_method,
+							  intf_load.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.43.0

