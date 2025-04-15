Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2589329E062;
	Tue, 15 Apr 2025 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744731617; cv=none; b=HkQd7GEU6MpDpsTz7CjTb7V3BzaZBKo3aG51ELv83voRl2M2yuZZvJrRBcLwF6WjcyoxcLf7laq73L9U3zxN3BskYDHDQcTT8EGyvKBHYsh2m79WHeSt1tUPjgSfuDFnXugVmO3qY76vWbcuo/DsmGxySbODuVDrlZtpNoU+cTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744731617; c=relaxed/simple;
	bh=RIMQprOaMirEBmq4bYXyJwMPbqjDbfmXocX7YVUUhR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cbhOvs9OUUNNJKwb5DrsNfNjhH+arMTaW/dcxrPAbGJyJnAX/J9XToUuJ2oCyRRVaT79o1uLiYj8g+MHDYCTpunfxFN0vAKo6sJEzHmpIwHFXa7PgciaJG6BvQcnC8bEtHxilWRmcuH3kiLedsziCPKPikG+lJ3udGI8cNJhsHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=jbEOTKdB; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="jbEOTKdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744731593;
	bh=8Qch/x4RnWWISFX7nV0atXYll7WBRrT6V0RcYu2bHFI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jbEOTKdB9RQTtTD3piVPBuD/+XDC28HcRI64VDn0KNsbfV69TeMKpeA0FcG5C0juS
	 lkgx2ZbLzi05mKT7VznkE4dnNks197AwxOnOktxq7DIS/tPRZ/N6PiZTcRGQ3+Tumk
	 I5M7OypIyVJRLtPMBugXgzEQGCit85WfaE8UBi6g=
X-QQ-mid: zesmtpip4t1744731550tba7ca3b8
X-QQ-Originating-IP: DIdrXajWP1mMaGitCCLmZtEqYHzin5MEP0I+17gZ9tk=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Apr 2025 23:39:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7574434672748888084
EX-QQ-RecipientCnt: 20
From: WangYuli <wangyuli@uniontech.com>
To: corbet@lwn.net,
	chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: akpm@linux-foundation.org,
	jeffxu@chromium.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	kees@kernel.org,
	wangyuli@uniontech.com,
	hca@linux.ibm.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	xry111@xry111.site,
	tglx@linutronix.de,
	thomas.weissschuh@linutronix.de,
	Jason@zx2c4.com,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com
Subject: [PATCH v2] mseal sysmap: enable LoongArch
Date: Tue, 15 Apr 2025 23:39:03 +0800
Message-ID: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OHE6ytWwrzSc0hMbO10H3Xx6MW8ZeVXmNvphD48xNC7/Igpj0Qlme5Q7
	OIXT4EaHXGu7ogJu85azphhxJgI98J8F9VxdXi+42FkgL/q4PzI8K5EFQBp7Xf4/43HrBKW
	yGiySLAXCAkiivl1MGFoHHpquVdC0Ye7cb/rrpjXKWYsPHMPJSmUHkd59lFmpcLkT+62Mlp
	vu4O6g5MWfRE8AQ8tQSndG1IyWeygCUDcii7t/7yRU7dIqA1OZmVsdm/VQmo+LaEyD1H5zO
	fv9rl8XX1j2ScIy7FPi6JWJXojmh/Kvu7IVX25QI3v+5EibiuzbIZ20gauvTUzc5iVYTSCf
	4gszXx36q+OCCYTnqgPVu7WBisoYaf8fu7K9PDGELMmGXLjfJe3ukr7GizOQkpZ+potPM5f
	O5H4512TmiNqhYxSQqUptx6iH4FEjpf9kMAh/wYVRtADqjXUigOtVFsrGmllUz63BJ5zlBG
	htGV2Xq9+yAa6LwVl9x41kleUevrkqa/wvndq9pioCrmbTYq2Yd0cr6RhYvxbAjH9NCsmE5
	vlTEtWcLYlWQYSacwl59ct7MdZ2Uj14PdCYHbsDir+LuBjXpZPFxqD/fVa1AvZliUecCeHB
	LzSxZg6K6KkivMepmfOU0UAkdVTIhYQU5+kyYmNc07A3009Ts8UPwTkoA/i4Sz46edaHtiA
	e4YpEUcFyIhqeDkIt8+XOi0iGNnU+OX4zPUH8dzQNMrD34+p/nJX9fzqr53jO/RlKP80+M0
	N/fb9vTNF+zDbwHkx08+zp1++5r5DvopKotM17hna7ZAkFagzDEXJvWLDyyiKkvjrYlFBGi
	2dsmMGFOQ+neTqpk+S4KsMMIJaOU0x9HRF54Xt1nnWhl3Rw128wxQfA6mXA2GLaPCXosLDM
	sdewN3iTFsV25z5BAGYPsN+yiKCZHHaUJWNC+7x4dwH07dUXARFKzn/xY7nwBi4B0ugCKb+
	1rOQbQKYtg2tu7ot++FUnshZ7gTyA+KQ9RcG8GgC2bGug1GfnUevXQ65NWXRxMHwFd4XfTE
	Sn6CEy2uqD3I/b1w3iNcnvUdyjyS5h2cE8vpo2kTbwnDV0+Lw+apKPvTzoyvQRbzr/jp7uS
	A==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
covering the vdso.

Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96182@lucifer.local/
Tested-by: Yuli Wang <wangyuli@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
Changelog:
 *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
---
 .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
 Documentation/userspace-api/mseal.rst                         | 2 +-
 arch/loongarch/Kconfig                                        | 1 +
 arch/loongarch/kernel/vdso.c                                  | 4 +++-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
index c6cab9760d57..a3c24233eb9b 100644
--- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
+++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
@@ -12,7 +12,7 @@
     |       arm64: |  ok  |
     |        csky: |  N/A |
     |     hexagon: |  N/A |
-    |   loongarch: | TODO |
+    |   loongarch: |  ok  |
     |        m68k: |  N/A |
     |  microblaze: |  N/A |
     |        mips: | TODO |
diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
index 1dabfc29be0d..ef733f69003d 100644
--- a/Documentation/userspace-api/mseal.rst
+++ b/Documentation/userspace-api/mseal.rst
@@ -144,7 +144,7 @@ Use cases
   architecture.
 
   The following architectures currently support this feature: x86-64, arm64,
-  and s390.
+  loongarch and s390.
 
   WARNING: This feature breaks programs which rely on relocating
   or unmapping system mappings. Known broken software at the time
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 067c0b994648..54ed5b59a690 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -69,6 +69,7 @@ config LOONGARCH
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
+	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_SUPPORTS_RT
 	select ARCH_USE_BUILTIN_BSWAP
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 10cf1608c7b3..7b888d9085a0 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 
 	vdso_addr = data_addr + VVAR_SIZE;
 	vma = _install_special_mapping(mm, vdso_addr, info->size,
-				       VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
+				       VM_READ | VM_EXEC |
+				       VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC |
+				       VM_SEALED_SYSMAP,
 				       &info->code_mapping);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
-- 
2.49.0

