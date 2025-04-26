Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4FA926
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745676980; cv=none; b=NADrOy+F2OEbXyP2OQegEu4Vj378QHvKkGpurPbtPGSe+iqakMg36HgoO01ln7U4dLEfVUcn4J5oJxbwPGqfl5+E7aqa5c/44YjP7HN0GUShzRI+1qWXA5pKPJCFVciJo6i+5XHDNCKMH7OVehf0JXfemH22wtoZf/dllMRCFDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745676980; c=relaxed/simple;
	bh=N1YWiN0vUP+4GgolL3DpxN1tliOksTTr9DRMbL1qvM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZZK9ZNWmJDZYGlE5eHsoIglyn8PiY4YmVbTu03fvLkaLPb1SzEpGMRgE2Bi52bekXXy/XTlM5pwomjFgnf8qDhBAEl8KdDvAFzQzAeaco8kXizUWlNd22ajfIY/rUsr4wS8vtRcv+7gfI0X1sia6v0YjOlwf3NziVcfwtN1KYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMz1trMC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMz1trMC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38E3C4CEE2;
	Sat, 26 Apr 2025 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745676977;
	bh=N1YWiN0vUP+4GgolL3DpxN1tliOksTTr9DRMbL1qvM0=;
	h=From:To:Cc:Subject:Date:From;
	b=FMz1trMCj79iKTZy3+andh8lEk3lSz0Bxpuibpsq0nEw3s33ZWizckYBinIheg2Ox
	 Nex9FKhCEHcK8wtdOhb2g2oVekKixg+kUzID5KijKYihOoWehrnw5sZanGhr7CqbDo
	 g7/Lgdi35rt5lkHy2FGR1XVq+B8BN7+b9jbaw/O5+Lrm2p+wSb0J/rQmVmWAer4jIH
	 ehgAAiOFqPWq0N6EPH+gkfhtxbcyJPYqqFswgJulVzEWioYqSgOEOd+9L88ZK3WxFi
	 V3HCx6cKHu+6SaFjUwzhyR0FYVlygkudoEnOjJHRoHg0Y14LfreEOB1Kn5vCiMHgR3
	 bUBZFZMlHTlKA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeff Xu <jeffxu@chromium.org>
Subject: [PATCH] riscv: enable mseal sysmap for RV64
Date: Sat, 26 Apr 2025 21:59:54 +0800
Message-ID: <20250426135954.5614-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS for RV64, covering the
vdso, vvar.

Passed sysmap_is_sealed and mseal_test self tests.
Passed booting a buildroot rootfs image and a cli debian rootfs image.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>
---
 arch/riscv/Kconfig       | 1 +
 arch/riscv/kernel/vdso.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..3cb0b05eef62 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -70,6 +70,7 @@ config RISCV
 	# LLD >= 14: https://github.com/llvm/llvm-project/issues/50505
 	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000
 	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
+	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if 64BIT && MMU
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
 	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU
 	select ARCH_SUPPORTS_RT
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index cc2895d1fbc2..3a8e038b10a2 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -136,7 +136,7 @@ static int __setup_additional_pages(struct mm_struct *mm,
 
 	ret =
 	   _install_special_mapping(mm, vdso_base, vdso_text_len,
-		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
+		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC | VM_SEALED_SYSMAP),
 		vdso_info->cm);
 
 	if (IS_ERR(ret))
-- 
2.47.2

