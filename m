Received: from sonic312-23.consmr.mail.gq1.yahoo.com (sonic312-23.consmr.mail.gq1.yahoo.com [98.137.69.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366352737E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.69.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370921; cv=none; b=L+bHeEWV99QfppLYW4sBeFHlVeu5FKDQbB2EmJnT8v375kCP6Ry4bQwgpJ0N99OewL+NwDKLvrmvMDkte9WKzUrSvvYHsmKunVkwwBSSWBilbGKsnsSuPz9NUPebsHuBrKTj9vv4RExtptlwWsU2LMEkyxSOexg9D3P3Oe6QzcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370921; c=relaxed/simple;
	bh=X5hh9ni/ndT4PbRk86wKuiKR0kizraRa1d46dT3fi+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=YeGUgdGqBkkgs/ZrqU1DB9663gyTXSXvDoT2uaj/9Jobb8UakBTP075H6c4i4Smf0/TNl2rSNtFhqbc8D9BkMXMO0GBmJAa03RRlbvtW46WM018b9EUwwe8OPAFgl5pMRe2W1o0iHHk+6p9k7uxklWAwq/KI4rwHEXiTKkgwTMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=ZFnZwAvK; arc=none smtp.client-ip=98.137.69.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="ZFnZwAvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1751370918; bh=aCdpH5QZRxMfssKfq9MICezlKlSbdc2MH2kmzXnJ2dI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ZFnZwAvKIIhqjJ52Zj/7iUUBcIEf/mHH1htbeW8P+sq30Q1ywStBOS7Ez9Oavf6VeXKm9sy2RetmTqoT4TqQ6Vf+EUIB1kvpteH4PSzoknb91ztTbrEKnqRzq6Lv0kLfExnA8DKhrJZP1POGIzBIqFSEeB6WBxPZlcaJ/tVNCPyEb4k1f/AQLo6UwiHrwaG7B9KzwZb22SGndvw4n02twG/d8foG5MWsT1Y6ocUkLB/UzfEgawJvwLXbE4LbfZchwc0WSmOYUtoHTQPXnEbLR/7LERHUneEiduZuC4YChEOLD0d7m49dF0rtQqFIFRo36DOLIMtAV3cGtMZKy2ATMQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751370918; bh=v8bG7XB8tKg7bwdZFw0VLugV2SIGSnEhgHXjkJlsy85=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=MJl1BeNV1xr9aHMg5Rb3uuUXoqO3yxIwT5AjGWID3Dy90da6U6I4XFPwFqYTHhsrA2AQbasI1oUUhe4DRaBgL2Fum2LzvFCNQqebx0ye0KTewsPjUKu6TcIahYyHtNIcJ3u1X8+o7dSKVncTAC55UdOHJzOvcqKjIEZRmirnOP1eqwOu3o8dmWmq2QFFUiuKaQVV89Ro8f9tP1meWwnJCUkmaXStq/H1pAE/I/KCzZOwGRCkQDPpIzkOIsCTUuKHlGhPUrOaIvbsrFauIPUkz9C0vL3AsAWCyXxf84sMAN6JDVW1vm/by4IQqfui6HA8Cx7pm3/8GZcu+od0L8gcGg==
X-YMail-OSG: KR.Ns.UVM1mSa7XqjYhWmVahUAEuePOIydPVTeSeF6rM0psOVTkYvrrESbxF1FP
 9HQR.wxRkItXnCUB.NGKigiB64yBDsnaXPeK0fEBJfZH2KS4wq54sTmoM37WNnJhhcbw8eA2spby
 UUONNfvy4RXbukpKTswmu49iiUgNySSkBCZrQb46hBJKtfqh7oE.fYCbio5i1VWJyD_tWlx2A6i3
 TwQvIk_ABJOw3lmFBUf1W7b0vm2o8jSOJu2yv3aYLs5kTAEzeYR0r2jEqF9YCePazQTI_dp0v90W
 kOOvFNadGFnix7SBw3xOvXzApQYjirSiHoV3d80OGSfMxxoqeLGiBArwskGQRRaXWcyTNi.8qUTA
 SVwB.M4gZ8su8n.UYPAEiU5ImZjwpv7XfNSqgvMPBMDiKlz6QcxOA6uWW7Su18bj5jaOZDL0vxcv
 H3DC41xDQjFpXV_6F1xiOlIXMaKUrvVIf8t1tc4MqdqDiPYQBfj_2gOXmjKb4E.cLU_2H.TjifV2
 5iviHPjGJyeUoJUp1EhgHTZUa6aTO9Ajwt9ni6DxdwXdLgR59.4PxvTxkaW23JfqECMSyk01N_Bd
 XqkMe7X7bE.3XcSiD10tGlf34V.7h8OleMBTdXMZlblmAd_SW6R.FK_Y0XthE603dLeXfvEzjINZ
 ikyOgdB07aYXzMBIGZb5Dodgf9Z0AkWnJKkYztQCffsBSTANX_IzYc4C0R7bxoMru58fsvR5N9_U
 hGpNbcz_Ns9NqbJ08Ju8CEIBZUvUgQJGi_TxMc4dBgZO15PByzxtr1NQAeIEnD0Je8pT.jqSsYIR
 qHVmt7K7ht4kBcCFs.K_74q.gMHhzn1a24jk2WRkJR1eTkN68.6RGPPKkgqHle11HJj9nTNTjPuC
 2IqMEG4z8ISsUtvD3gvWYrYt0lmqTwCgcHwHQhPrqNRjy5Q5hXc95eBf0FrDPPNsvEBO6X8gY1a.
 bOUafHhB.AI21zL3d1qOvPSMgZz0R0eqKLdUsuTbu0vLUrC3AlgM7gUJkwe2KxphE8fXwh_5vTbp
 5RS9eMcmP8q.647Ulv1SzUetS_AtX77zzaYsf5COhWcPx02B7QY9RcT8qWU_0R32N8zjTvx9W57v
 htewEbkSWsNBAGD0XgW.FuQM.9g9GnjnRPxW73aEO1MmReD5WQ4MCrDAozNXvI0tBKLCgVGEkXK_
 qu8PLycF7wcSUS1kDzn6nD5P49z23dEETV4LWznGdQXLD_jKHksFnQ7aEi_QPjq3T0QM9T0rOrnU
 4AuA3h_DGwz.rfPNnkScNYv_Do1DY6cdeT8BaJ5U6nipFBlIODa8QtCNXj8xoZ.SkTDJonUgxOMG
 dKuYqN0KgxYgvKx9MQgYgUysgHEXJ1zEOenMj4K9M5D48yokwnyTkHIwtXuWC37A.HxlRKcWCL.7
 alMoqZoS9yU7DXUdBMeFstaUAIv8DlAPK9KkZHjbZr_e6TO6au0WQlPKHGNg6Qc_JEpUk16qOIkV
 B8eM0UHfcaP0Z9XFYgtsci8pB9BTbgYSU9chuMYUgGQKkVhXjs2UFNZcH4luMecb42RSBAgJcOgY
 Vx_r0btRnZmia8QSZb8JNVJi_x_CiQdbmZpdtZdco4fJ2QYH4XlTezt8qQVLe1Xk9E2TRwt6wV2G
 3KyNWrKUNjoYo0r5Y1PFkoZSb6IWuc3osgD8Qr9MoPhljclDEbVhzOJx0VrhWeEwHHdmy2pu_Pe7
 dS8ntEbo8Rp7YxTXdgIbcpNSxFyBg8wQ90h53iPsvLhizlgtGDs4XDbTy1i04I4kLwdBWPSOIZq0
 d.BFIl5abwJcN4Zwunco.8G0VqfYkc_lnr39OaOPtYiOZ6QzI1SuVaED.qu3gDDCuqNGuM0A9q1y
 zT1vO9zfzQKyPiZ0dVee2EAUQx_n7Z9iUnQ0NtbKy3e8oFeNYsu2NfvyuHtfzFdUir4NpLnMUrjx
 8UOxaFWAZZ3BEBgmE_kR7WzOhnfJDhr4CVHuKBdc2XAEEd6_ybs6AxLOcZito3nIjS4FVqr4hzhB
 FKSW0fb6OF88ahYTQ7qiYCtXzp42PRq0qXIRSd3lmLyO1MfNx.CwVJKDVR66Efwh8MtMf0wselza
 qwZ3M_uvHrpc637r8GI5sxXoBtdmLaS_PQFTkdJxDoZzjKsyigvZ5SPU.pBNHhGLi1MKj8UZUK3_
 mc7BH.PYKUxxoqrky_57hWW5zAW394Vu7sE1nJnpr_nsP7nnJ6QZztiByPrQrl6pkIHN_LoZeq03
 irDHnFeptHzM3zdD0u7qb3lezkh.vtOijxCqL1xh4T7B4io7TO1fJ2ZANZkXnhQBu5VQU9Inlqz2
 L
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 25e66419-7370-4560-a4e8-3595986d5bb5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.gq1.yahoo.com with HTTP; Tue, 1 Jul 2025 11:55:18 +0000
Received: by hermes--production-ir2-858bd4ff7b-nknbf (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 557e0d14bcf47e6d0b13962042679d71;
          Tue, 01 Jul 2025 11:55:16 +0000 (UTC)
From: Ruben Wauters <rubenru09@aol.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ruben Wauters <rubenru09@aol.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] drm/i915: replace DRM_DEBUG_SELFTEST with DRM_KUNIT_TEST
Date: Tue,  1 Jul 2025 12:54:51 +0100
Message-ID: <20250701115511.5445-1-rubenru09@aol.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250701115511.5445-1-rubenru09.ref@aol.com>

DRM_DEBUG_SELFTEST was removed in commit fc8d29e298cf (drm: selftest:
convert drm_mm selftest to KUnit) and all functions under it were
converted to KUnit, under the DRM_KUNIT_TEST option

This conversion however did not occur in the Kconfig.debug file in the
i915 directory.

This patch replaces the select for DRM_DEBUG_SELFTEST, an option that no
longer exists, with the correct select, DRM_KUNIT_TEST.

Signed-off-by: Ruben Wauters <rubenru09@aol.com>
---
v2 changes:
- update commit message to contain more detail about the background of
  the change and why it is necessary
---
 drivers/gpu/drm/i915/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kconfig.debug
index 1852e0804942..b15b1cecb3aa 100644
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@ -50,7 +50,7 @@ config DRM_I915_DEBUG
 	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
 	select DRM_DEBUG_MM if DRM=y
 	select DRM_EXPORT_FOR_TESTS if m
-	select DRM_DEBUG_SELFTEST
+	select DRM_KUNIT_TEST
 	select DMABUF_SELFTESTS
 	select SW_SYNC # signaling validation framework (igt/syncobj*)
 	select DRM_I915_WERROR
-- 
2.48.1

