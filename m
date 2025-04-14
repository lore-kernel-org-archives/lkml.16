Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11C2DF42
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620616; cv=none; b=NVRaOauRzS91Sw/ZmaTGCj2BPtsohDjmtOaCauQwhGR8I++ojhx1xnw7e45wCTVsqqdc6AuRDBRUPhYLpJ8UD9mYbe0Q4yxVAjN2I3uYmNeB5g4042esc/TWGQD7B6fYNKA4qvF3+AOf83Ykul1q9z1euNI3KCe/S113YeQCFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620616; c=relaxed/simple;
	bh=AOkbPHtX8IFfKVeAHn39ClWma+HMT8hyNfwCAeAz3FY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oWnvAaVumEGM6jTmyCyUuA77upxx+NeT+qNBPFxTjnnaqciXks0hQfHaElP5HvQyl9TIyCclM1RIpO5cWMnalOLYWdkHoCfagSnHBaiCX8MxxBNVSZXD60UwOJIF1fUuPlKC5EPo/ouKED0lk7E3mz9dCigz7/8CkFVYVvzRees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1dc6:8b60:8242:85de])
	by xavier.telenet-ops.be with cmsmtp
	id cwq42E0084wS71s01wq4mu; Mon, 14 Apr 2025 10:50:04 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u4FVx-00000000YBx-0zUR;
	Mon, 14 Apr 2025 10:50:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u4EB8-0000000AoSL-3emS;
	Mon, 14 Apr 2025 09:24:26 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: Update defconfigs for v6.15-rc1
Date: Mon, 14 Apr 2025 09:24:25 +0200
Message-ID: <e7d9ff0ef58efaa3e0adcb7207e6b44d948caa25.1744615371.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Drop CONFIG_PRIME_NUMBERS=m (auto-modular since commit
    313b38a6ecb46db4 ("lib/prime_numbers: convert self-test to KUnit")),
  - Drop CONFIG_TEST_PRINTF=m (Replaced by auto-modular
    CONFIG_PRINTF_KUNIT_TEST in commit 7a79e7daa84e2302 ("printf:
    convert self-test to KUnit")),
  - Drop CONFIG_TEST_SCANF=m (Replaced by auto-modular
    CONFIG_SCANF_KUNIT_TEST in commit 97c1f302f2bc318e ("scanf: convert
    self-test to KUnit")),
  - Drop CONFIG_TEST_BLACKHOLE_DEV=m (replaced by auto-modular
    CONFIG_BLACKHOLE_DEV_KUNIT_TEST in commit b341f6fd45abb188
    ("blackhole_dev: convert self-test to KUnit")).

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v6.16.

 arch/m68k/configs/amiga_defconfig    | 4 ----
 arch/m68k/configs/apollo_defconfig   | 4 ----
 arch/m68k/configs/atari_defconfig    | 4 ----
 arch/m68k/configs/bvme6000_defconfig | 4 ----
 arch/m68k/configs/hp300_defconfig    | 4 ----
 arch/m68k/configs/mac_defconfig      | 4 ----
 arch/m68k/configs/multi_defconfig    | 4 ----
 arch/m68k/configs/mvme147_defconfig  | 4 ----
 arch/m68k/configs/mvme16x_defconfig  | 4 ----
 arch/m68k/configs/q40_defconfig      | 4 ----
 arch/m68k/configs/sun3_defconfig     | 4 ----
 arch/m68k/configs/sun3x_defconfig    | 4 ----
 12 files changed, 48 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index 31ecb8b7b9f1e734..44c8182ebdaa368f 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -602,7 +602,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -621,8 +620,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -632,7 +629,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index 1f57514624d515d3..730e7bc98cacd3b0 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -559,7 +559,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -578,8 +577,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -589,7 +586,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index c38d2819aebe9954..efee64ffcc072e99 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -590,7 +590,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -609,8 +608,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -620,7 +617,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index f0e673cb17eb7c67..20b2b16f6921f26d 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -551,7 +551,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -570,8 +569,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -581,7 +578,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index e8ca5a50b86dad62..46a20a7f3582899c 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -561,7 +561,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -580,8 +579,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -591,7 +588,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index b3a270441bb17755..6de38f254ef7b3d2 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -578,7 +578,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -597,8 +596,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -608,7 +605,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index d215dba006ced779..5141a4660748009f 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -665,7 +665,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -684,8 +683,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -695,7 +692,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index a888ed93ff829033..8c8b3b4bfa7fc794 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -551,7 +551,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -570,8 +569,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -581,7 +578,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index b481782375f689ea..2897ecb29fbf71ed 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -552,7 +552,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -571,8 +570,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -582,7 +579,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index 6eba743d8eb5c94e..a612cfc21cd8b5d7 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -568,7 +568,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -587,8 +586,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -598,7 +595,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index 9bdbb418ffa88c63..dd262ee392f5fdcb 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -549,7 +549,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -567,8 +566,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -578,7 +575,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index e1cf20fa534319e6..a4fe34bc23527fd4 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -549,7 +549,6 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 # CONFIG_CRYPTO_HW is not set
-CONFIG_PRIME_NUMBERS=m
 CONFIG_XZ_DEC_TEST=m
 CONFIG_GLOB_SELFTEST=m
 # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
@@ -568,8 +567,6 @@ CONFIG_ATOMIC64_SELFTEST=m
 CONFIG_ASYNC_RAID6_TEST=m
 CONFIG_TEST_HEXDUMP=m
 CONFIG_TEST_KSTRTOX=m
-CONFIG_TEST_PRINTF=m
-CONFIG_TEST_SCANF=m
 CONFIG_TEST_BITMAP=m
 CONFIG_TEST_UUID=m
 CONFIG_TEST_XARRAY=m
@@ -579,7 +576,6 @@ CONFIG_TEST_IDA=m
 CONFIG_TEST_BITOPS=m
 CONFIG_TEST_VMALLOC=m
 CONFIG_TEST_BPF=m
-CONFIG_TEST_BLACKHOLE_DEV=m
 CONFIG_FIND_BIT_BENCHMARK=m
 CONFIG_TEST_FIRMWARE=m
 CONFIG_TEST_SYSCTL=m
-- 
2.43.0

