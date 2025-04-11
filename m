Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574BE221276
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369085; cv=none; b=CRUnPbi81gUNr6UL3jbSDqQUhA/+ZHdHFJLRp1jZwTKmP5yZ9+7XS0X8WN7AUN1H+/JW9MElyeSvSCSHoBO5AXq6tjIXcUQU+so7Ok/q1ErtTH17lG63aeD7C+mkeppwImjc03gVWt1zVowxX9WL2UCLemUBcwwWfSU/MB5WBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369085; c=relaxed/simple;
	bh=CpAXgl3qIPNhwV4nhGvgp5rf2RM5JobS3taHnWXNADM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhDDsQCZpv7+bs6Mv/031mcsHZp1aXtlQR1J+oQ503wyMo88qfbhoZPhNccDe1IjtMar1bf3ol0VhhAEpte9JzLm2ZXpC8eQ3GTY/nSWevEUP1uSmSz5nJTQ9tBmy7O4kb8XgrMfS8lY0N4tikPmVcckI0NQvf6+53eZappgvFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=RYpM6Lsu; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="RYpM6Lsu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744368973;
	bh=NmDXTK+4Kxgs42S2SDvzBSL3QLhh5lqVdK90DWHJpMQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=RYpM6LsuqePgXVcA+LH2p2kEZ0uEsa0wHKIaqd5yAV28DMMkiuQ1KWGFbJ9KQP8u9
	 kkHd72fFE4B1G8deJoCrjrB7mstVQx1e6wIVKnO/BLTcBTQIEpWkAI3ievUeftUfoB
	 rehMpoFf6/U4jLBVt3ZnPThsCQk8xbk8+NFobMBE=
X-QQ-mid: bizesmtp23t1744368955tc9900ee
X-QQ-Originating-IP: E+95eiCIMfMVh6UVqQOHgjo4HzQI0WCrSHwCW4L7S7I=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 18:55:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12124381483811632618
EX-QQ-RecipientCnt: 10
From: Chen Linxuan <chenlinxuan@uniontech.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Chen Linxuan <chenlinxuan@uniontech.com>
Cc: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/7] drm/i915/pxp: fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'
Date: Fri, 11 Apr 2025 18:54:52 +0800
Message-ID: <8921351F23CD8948+20250411105459.90782-4-chenlinxuan@uniontech.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411105459.90782-1-chenlinxuan@uniontech.com>
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: MrfJYRspGRl/M9u+zXwrSdqolYI2G6pNayzYh4cBk0asA9K6FhrvumbW
	My4xqrmw5ovzt0nCJO+y77goE8CHClyp4YZqASxCUnhsPm6Nt+Pkgm8VBqBFZLFwMtpI4g/
	r+1p5gnlVbFpkce3VWe7cjtHtoXfvax4gklB7J2c7s4+9QRnGaOAMaLuHCRBRVmrcC0GtUu
	gkxabekkAe2ow/ZADnh3KXnuTCBMFrVXCCnhfxxtJf1FB1o+tFMmirt6SoGfZroNP/Y72jL
	nc8+kMoZ2R1vo9HYBcu6nnvEeSUbbzlzBJ2h4eJKUyhFrPdvxxHfm21icuzywWGNeYWIuKt
	Ez3weXXjeweKri1fjOmtjbcYX+YiynkXuJmEZtOfOwkWvCRrauCWVlS9pK+FnRV1VbjwFLd
	m/kfzZr7veZG6hXGPM0xAaLab3xZemcjITDciwigvR+I2BcKP5tBbRFgOHzmdxJTLeIZ36y
	r2SCyHIz/SSaMSdC1Wu8ZlboZggQ8bx3jBKcEKnaA6VnvtWnVufQpjQkc1iSv4z9mHW8JTB
	BvITP2ChVHcXCLBH2XTPe5pGSTPtNpRkhwhapZTu1U2RXZCbgz+qBaWk5id05Ek0+k1nAJc
	Ismm304VfuQI/qLLIbLZrJ3qGTivAUidS0epYQ/EKylAiacBJA3X/6w+VmWzWwDyqR0GJzx
	VjnykOjGMugrpW9IZV45XIELOcfbOjH3DcpME5Ep1EA1MRYmzhd0enw8gCCNpMRrCoo3doL
	quQwBVw+O651+K8bBh3Uu4S9rBz9PaXkHmDDAJR/2TOuT5GUwAz//tTGiCVTkuazap/O06B
	a8rITqc2RWUneaDueIdF51wfHtzBzSLObh7bPFREwXCW90EdeTA6YS6V6ioqRCph41Yr9Ba
	CxDRnXC4SnQ7QMRtMDEoLe1169JcVZI0EBAECI3++1po6pqe403+a1pZ1LNqilFeOVqUcir
	Xm3SwvD6CwYhW9lk55EG7VYlbMxjJiY3+69vjChY0VWz40A==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

On x86_64 with gcc version 13.3.0, I compile kernel with:

  make defconfig
  ./scripts/kconfig/merge_config.sh .config <(
    echo CONFIG_COMPILE_TEST=y
  )
  make KCFLAGS="-fno-inline-functions -fno-inline-small-functions -fno-inline-functions-called-once"

Then I get a linker error:

  ld: vmlinux.o: in function `pxp_fw_dependencies_completed':
  kintel_pxp.c:(.text+0x95728f): undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'

Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
index 9aae779c4da3..4969d3de2bac 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
@@ -23,6 +23,7 @@ int intel_pxp_gsccs_init(struct intel_pxp *pxp);
 
 int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_session_id);
 void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
+bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
 
 #else
 static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
@@ -34,8 +35,11 @@ static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
 	return 0;
 }
 
-#endif
+static inline bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
+{
+	return false;
+}
 
-bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
+#endif
 
 #endif /*__INTEL_PXP_GSCCS_H__ */
-- 
2.48.1

