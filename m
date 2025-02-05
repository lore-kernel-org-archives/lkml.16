Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114581DC19F;
	Wed,  5 Feb 2025 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771703; cv=none; b=Cxu8gBx+xu7JfN1NnQywQTokhQnEudOBTcvo1pa7zXk0q+fg6RFenN7025vHsiN+plEtEwKZxXObzS8TM2gHZy5b27iioztnaXXq+x1JMfIINbIVIr46IGvb7QE4z75VwuF/QAzak/gFjb+fWqnsylxCnoFyjt0ODDXyRqeuLPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771703; c=relaxed/simple;
	bh=OpUsCuGAiwhWFhUg4CwPzoYyxVGCg38PNLAFcvasv7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWsRt2bITb26TQTouq/lF1Z25SmUKzjTYmC2ahsDAB3FogcBEk1eQlBkJaydkd+oHfOXusYh6AwT0/fkTd2A3PhOvBPaSqOIZFTNqiJxGFDzs4I+Gz94kgcHrRgau8lkt//GRb9p1jpXhR25TTnlgOKshrw9g8awaUW52vtKkc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDRsHNiC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDRsHNiC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B65C4CEE2;
	Wed,  5 Feb 2025 16:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771702;
	bh=OpUsCuGAiwhWFhUg4CwPzoYyxVGCg38PNLAFcvasv7E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BDRsHNiCJoZiVN8vwgR3TrhOJz4DqmtW3dWw4/MRM1ScVYLyQKjfPH9u3N8y6RGlG
	 pvj8AaBL3tnzV9A0M1r8UdXCOt1Coc7Kn5uksI/Cd1C0KAGjlx0CiYcMou+wTbRRLu
	 +vpeNM51Vle7b/+V5FO7adR+/YNr10TeivCEVn49Id4iWEWux1UwKTu6a26FU4lA6p
	 XA5Za+62i8BLBWOPyU6XE8CB7xnel5Z/gvuah1qp7qvutoEreCxLc1oQA+NUNMTqZ1
	 TH5RzD61Lnl33/N1sv2oT4sOG5W7f7Bl+7lThubaox5qLJwJVFX1IrCqEAKKjltgNr
	 XvGqdCl/qThoQ==
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
Subject: [PATCH v3 3/6] RISC-V: add f & d extension validation checks
Date: Wed,  5 Feb 2025 16:05:09 +0000
Message-ID: <20250205-stifle-remake-4e497e96fd66@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205-cobbler-unpadded-5580c1f5d946@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2478; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=e5M7hBrbniSsnE0QrYa2OQIBkQoeZwSnzZ40MTiuFZQ=; b=kA0DAAgWeLQxh6CCYtIByyZiAGejjDyjl+eX1rBJbBES97QQk5NiPvQsNKTteY0c1eWQ28q6K Ih1BAAWCAAdFiEEYduOhBqv/ES4Q4zteLQxh6CCYtIFAmejjDwACgkQeLQxh6CCYtK9vAEAxN8h myRDv/UodgzN2EOsJGsn3+Gil3P8JlhN9YrM8EAA/3ikXzZK0qHHLekERtXLzMqq4M6Blg1zQRE VVJE0RvkM
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Using Clement's new validation callbacks, support checking that
dependencies have been satisfied for the floating point extensions.

The check for "d" might be slightly confusingly shorter than that of "f",
despite "d" depending on "f". This is because the requirement that a
hart supporting double precision must also support single precision,
should be validated by dt-bindings etc, not the kernel but lack of
support for single precision only is a limitation of the kernel.

Since vector will now be disabled proactively, there's no need to clear
the bit in elf_hwcap in riscv_fill_hwcap() any longer.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1c148ecea612..ad4fbaa4ff0d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -109,6 +109,29 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
+				const unsigned long *isa_bitmap)
+{
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)) {
+		pr_warn_once("This kernel does not support systems with F but not D\n");
+		return -EINVAL;
+	}
+
+	if (!IS_ENABLED(CONFIG_FPU))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_ext_d_validate(const struct riscv_isa_ext_data *data,
+				const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_FPU))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int riscv_ext_vector_x_validate(const struct riscv_isa_ext_data *data,
 				       const unsigned long *isa_bitmap)
 {
@@ -368,8 +391,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
 	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
 	__RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
-	__RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
-	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
+	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_f, riscv_ext_f_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
-- 
2.45.2

