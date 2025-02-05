Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6EB1993B2;
	Wed,  5 Feb 2025 16:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771699; cv=none; b=JWCV4If8zG4vo6IHw42GyuqbQDmGhlE+x68DBBaDGGwvaDx7HnsLqICxdZMK6dQzTgcfG3Sp0+GLDJrm0wladPl3ezdQ6O0J9szlSRRd4HhPWft+ujjswRccXaZZlE7uE+OUHgSiFXkt7I8I+ohsXm8hyPxisv0kiqQdEXGYYkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771699; c=relaxed/simple;
	bh=5QR3iPATmuktdgNOBba8w7ssdWLJhWF/6VGlhDvPsj0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kyoKmRiUxGRCBOr/Xyp5VY/1JTeY3E+BW4XtJCbI7LdKjzQ3UadWO0pe/9cejumc+kN7JtlxWu3dNbDTswDMpZAnWfKCMdlG3NY52vtw2THBG0LANrUal1QoGmaaYvPwQfpHhpya6gDcjrQVhyKYIRD27YhDAERPcOttb/c/M8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLvIaPvw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLvIaPvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D1AC4CED6;
	Wed,  5 Feb 2025 16:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771697;
	bh=5QR3iPATmuktdgNOBba8w7ssdWLJhWF/6VGlhDvPsj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aLvIaPvweNguBRtxG2PVkZ93J3+oygkCNsj/duA3DBRj/3r2ajL31uQLqfZQHuP+b
	 YYyzZTL9SBDDtm4zOphBLeg7YAz8V5GPFcNrKbKyRwZsoNnCNbDTgQBqu3YawlyA7+
	 0ddiBpKLAUtLgIcQM77dRn3qbH8FScv49+C+M0+Pg/0K5kkXKZrgcmFx2Wv0QKpJ+Y
	 2NjkMJwizwQfwQ/wg3IP2Ys1rVUjw7XHdF8+QhuwtHP+HLto0YyKutdKTfcanQwo0X
	 jXh/D7gnUDnUZmqCHH182HqQyowp4eMAznElUf7PAUaJANnM4iwTerkGQ5Mgn2fGoD
	 wKBNWd/d8QUMg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] RISC-V: add vector extension validation checks
Date: Wed,  5 Feb 2025 16:05:07 +0000
Message-ID: <20250205-defensive-lent-04936dac6bdd@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205-cobbler-unpadded-5580c1f5d946@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5885; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Xll3sNeiVHrSCgmDC5jcXvVZqlI6Wuid0Q1Ycn1USfY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmLe6wf/TdRP7vNJMmXT6dC2U9Ca9K/CUGtD/9uEZ0fU qG9t8mpo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPp5mNkmN8l8++9kVgNW5+x xXQV4fj9/jWyK+cs17qz79YXs//f1jH8d/znt+z6nQdVOvK7p/nw71p3pGb2X92ijwf6os6wRK0 x4gUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Using Clement's new validation callbacks, support checking that
dependencies have been satisfied for the vector extensions. From the
kernel's perfective, it's not required to differentiate between the
conditions for all the various vector subsets - it's the firmware's job
to not report impossible combinations. Instead, the kernel only has to
check that the correct config options are enabled and to enforce its
requirement of the d extension being present for FPU support.

Since vector will now be disabled proactively, there's no need to clear
the bit in elf_hwcap in riscv_fill_hwcap() any longer.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/cpufeature.h |  3 ++
 arch/riscv/kernel/cpufeature.c      | 57 +++++++++++++++++++----------
 2 files changed, 40 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 569140d6e639..5d9427ccbc7a 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -56,6 +56,9 @@ void __init riscv_user_isa_enable(void);
 #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
 	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
 			    ARRAY_SIZE(_bundled_exts), NULL)
+#define __RISCV_ISA_EXT_BUNDLE_VALIDATE(_name, _bundled_exts, _validate) \
+	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
+			    ARRAY_SIZE(_bundled_exts), _validate)
 
 /* Used to declare extensions that are a superset of other extensions (Zvbb for instance) */
 #define __RISCV_ISA_EXT_SUPERSET(_name, _id, _sub_exts) \
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c6ba750536c3..40a24b08d905 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -109,6 +109,35 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_vector_x_validate(const struct riscv_isa_ext_data *data,
+				       const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_data *data,
+					   const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
+		return -EINVAL;
+
+	if (!IS_ENABLED(CONFIG_FPU))
+		return -EINVAL;
+
+	/*
+	 * The kernel doesn't support systems that don't implement both of
+	 * F and D, so if any of the vector extensions that do floating point
+	 * are to be usable, both floating point extensions need to be usable.
+	 */
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
 				 const unsigned long *isa_bitmap)
 {
@@ -326,12 +355,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
-	__RISCV_ISA_EXT_SUPERSET(v, RISCV_ISA_EXT_v, riscv_v_exts),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
-	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts,
-					  riscv_ext_zicbom_validate),
-	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
-					  riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
@@ -372,11 +399,11 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
 	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
 	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
-	__RISCV_ISA_EXT_SUPERSET(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts),
-	__RISCV_ISA_EXT_DATA(zve32x, RISCV_ISA_EXT_ZVE32X),
-	__RISCV_ISA_EXT_SUPERSET(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts),
-	__RISCV_ISA_EXT_SUPERSET(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts),
-	__RISCV_ISA_EXT_SUPERSET(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts, riscv_ext_vector_float_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zve32x, RISCV_ISA_EXT_ZVE32X, riscv_ext_vector_x_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts, riscv_ext_vector_float_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64f, RISCV_ISA_EXT_ZVE64F, riscv_zve64f_exts, riscv_ext_vector_float_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts, riscv_ext_vector_x_validate),
 	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
 	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
@@ -960,16 +987,6 @@ void __init riscv_fill_hwcap(void)
 		riscv_v_setup_vsize();
 	}
 
-	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
-		/*
-		 * ISA string in device tree might have 'v' flag, but
-		 * CONFIG_RISCV_ISA_V is disabled in kernel.
-		 * Clear V flag in elf_hwcap if CONFIG_RISCV_ISA_V is disabled.
-		 */
-		if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
-			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
-	}
-
 	memset(print_str, 0, sizeof(print_str));
 	for (i = 0, j = 0; i < NUM_ALPHA_EXTS; i++)
 		if (riscv_isa[0] & BIT_MASK(i))
-- 
2.45.2

