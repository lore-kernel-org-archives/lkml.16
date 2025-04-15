Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A937C4315C;
	Tue, 15 Apr 2025 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725143; cv=none; b=s5ladFQZHDFPOlxbKh/5ZSZs2E1vNTZOpgGySuYteyNwhbGp4vOmrGzPChMtrdcX40KqqfQ3NwadjwjHMdtyZlGNo6BaFH73CLG8HhitdpB6/0lRa+Dnd06XpF/cZHzOIcN8K1cgadjXy7SgX/b+4V1/NqFhajtbyqzd466FmFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725143; c=relaxed/simple;
	bh=SYP5aUx854LZI3QqpRFhskAvPk/sjt33YUGhDwyPD5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zk5oKsY5ZWbIaP7rFQ7sOXDWHteveWgWcwOavr0exme3mkBShRjLQFAbIW6DnJQLGK2VZW3BifEbfhlRQX5PAojE6FR8jX64sbb06UQfhSIepNqv0J/lsT09zb7B7uPjtPgaMz1UGQi6hwD2aNN9UIIeyYmSRs7/ewk+bO1KRCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=B9PM2vdU; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="B9PM2vdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744725124;
	bh=Ixi9pWKBiDS6VBaREd11yEf72/je33uvlluDQogeMxo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=B9PM2vdUmuR/bxGkikTEJBimk53M+mGGfQtJ4GarF64T+C59b2uVfMTV+s7HpyuMx
	 jCuB+dn8eZS75htEIvVlrUwZZFNpXNIvQ5I3JXNhSkZCd2NBYReZPTccCiIHbP9HiE
	 7MvPZtJ94GCJb4y99s0PKDNDElPAiypIuOI/oeV4=
X-QQ-mid: zesmtpip3t1744724985t838566ab
X-QQ-Originating-IP: IvxrBklCfHMUcYXSFD7ASed4Rg4FD9KV6HpuJrAKVqQ=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Apr 2025 21:49:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17750832799163754876
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
Subject: [PATCH] mseal sysmap: enable LoongArch
Date: Tue, 15 Apr 2025 21:49:33 +0800
Message-ID: <433B5132A1535C98+20250415134933.531084-1-wangyuli@uniontech.com>
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
X-QQ-XMAILINFO: NV9lVvsB36Op1yEGLqX6VyH6IMMjPPSHflDax0yHqTYUExZlnvTyKMTF
	RUFh4YGevHLcNupZVHEoRUisMQLbAifW7/nXLxnyeyVwYIshagyEn7LrVi84guxdutPZfSh
	ULrPELeI4WI+uhXnCLSKVsqNfWyNSfd6n3orRR8ekhVxsHmZ0wHFK8WuuuBW8evqmO5TJwe
	32NwMRr1WITwdkEoE5oa6sWKBA+9Mu3sgOYe5/eIz61Nb/dOP/4QA56IMpG0ag9ST0rJY/q
	0mF0gpnGE+9X36w4l0hah1rT62FkHOLyQE5RJngepX92WCbYyWcArgTRPYkpoJDfiQ8fcCn
	MI+kqPNc7ukDXuNe4572FMBT7+l6tUqCzaapbHEE8CWcuRjhAY/ang3MkiOVA1yDdxd6lIy
	s8S1wPvC6d8DF10wl+claEj9tVJbOzY6dgFiMegMyyGLrzkFKlFpjG0GrZYMSR2na7CSYJg
	wD+XXYwP8RIrr/HexDD1PAhXIxPHkVDQP1MEXVXTyBYpBfP5yKBT98eNaEr3yQcSeSFnfeA
	ZHEGwvjKMcScOIoDP6iXbG0BmQ4yW7gHnGta7jBp5d1RHw2Pp9ipVj2HhgBBgghTN21H6c+
	A9fp1HG3rhEW3PTP4rqxHbR8ALFaIp65EeyZA8FXsexnhIfAd4ObLGRnKkYX/O9gLWru/We
	8UtjAJ/zDyJFrFjVtraZo+VKuFPVJw2Znmi3JFGhATier5hHfEBLigKtKtqgDajIXB8e2fx
	vDOourSPMK5mvu8pnVsdUUR/Rm3uez/zTaC+oBc9S42jj/cPpYR5JClxRe243fG7c7rJ0Ic
	LNUq780H0hpV2zwE252ojLnPJetASkt1UMlKnY50dlEXkQGP8Z8iQg5QeRdGJqblzPuleYZ
	j2jdcYn1A1GkfTANUMogjfM51i4OJgG7M2AiV50Fa6+Y5IQODnLt0Y+iWq4bfr2dVkE5it4
	NtatJYhKl6wkIZYG0sd7KDBGP0FI2lZ1R77B76B+uJPUDKNVvv+qCb5pedOFXv2mW3EHyEV
	CXSLUewQcaE4Ahu4yMiBEMTlaeMw5k9iMrkAEHNg==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
covering the vdso.

Tested-by: Yuli Wang <wangyuli@uniontech.com>
Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
---
 Documentation/userspace-api/mseal.rst | 2 +-
 arch/loongarch/Kconfig                | 1 +
 arch/loongarch/kernel/vdso.c          | 4 +++-
 3 files changed, 5 insertions(+), 2 deletions(-)

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

