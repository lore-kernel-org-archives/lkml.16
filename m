Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BDE256C71
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291818; cv=none; b=XdTQatGfq+Ms2x2ydg0VgovdjRWZvpcPVRg+PsDjkYSLqGa26plUfm5NXmDRrq0YS9LHd2TiuvA+DLN1djAFkD8X1TSKehgNzV4mQUeho8u1rowAUoRpqvAAt+Pu41b5eOVGhHA5ldAy0j4dcns+V7hfgtvrpRLyYt9F5dIDldk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291818; c=relaxed/simple;
	bh=Y1yKoTh0XMDwtZO99R2TCsDZif5YDD+FLnLgTiIlcF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHTaPud3bvE0s+THjZS2bK+ejVTpLAX46gmL99YmUW2wEfQ2MDk4rYKowqYzzijDFr+MtgS0c4HYZEo6ql7Tmh+F1o2OUA8cfx00D8SKev+kDnZuSWbP+LRC5VL06yIgmIjqZWcG+66bed1zAVlLMHHvrn/ba0ZxvKQa8fAGmXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r0WJgrgJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r0WJgrgJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB721C4CEE8;
	Tue, 11 Feb 2025 16:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291817;
	bh=Y1yKoTh0XMDwtZO99R2TCsDZif5YDD+FLnLgTiIlcF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r0WJgrgJ/TqfI4M+27tK2G4Y8nDGoZY03a6SxPj/VJ/E1O9Wat+fMuh+rHIapPjoP
	 aprZ0o0d5p/27tamrk3iz9IjZHdKLGfALI5eQL0GtGIBeGGnwfSBTNeCNBA9Tn5vtG
	 9T9SoMwtamHLIJeLPPE8P1ddaOFfmxuhhbhbEjwlOOe6RZ7Lb2Z8RkFG45zAUv3E2/
	 +RWU5uXaYGJd7E4992IQErxc70/lJdB8LMn+gmecQuxNelDCSOj7R7ekre2Wa3JWMd
	 eHkSGwm4UZ+ws2Q/qu5Sf7+Erk+ZFjG6o2u9WdxDhRR4S40hSBzE4z9IkkROCJVNvw
	 0ush1eDpuVHGw==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH 4/5] x86/microcode/AMD: Get rid of the _load_microcode_amd() forward declaration
Date: Tue, 11 Feb 2025 17:36:47 +0100
Message-ID: <20250211163648.30531-5-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211163648.30531-1-bp@kernel.org>
References: <20250211163648.30531-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Simply move save_microcode_in_initrd() down.

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/cpu/microcode/amd.c | 54 ++++++++++++++---------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index 90f93b3ca9db..adfea4d0d129 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -593,34 +593,6 @@ void __init load_ucode_amd_bsp(struct early_load_data *ed, unsigned int cpuid_1_
 		native_rdmsr(MSR_AMD64_PATCH_LEVEL, ed->new_rev, dummy);
 }
 
-static enum ucode_state _load_microcode_amd(u8 family, const u8 *data, size_t size);
-
-static int __init save_microcode_in_initrd(void)
-{
-	unsigned int cpuid_1_eax = native_cpuid_eax(1);
-	struct cpuinfo_x86 *c = &boot_cpu_data;
-	struct cont_desc desc = { 0 };
-	enum ucode_state ret;
-	struct cpio_data cp;
-
-	if (dis_ucode_ldr || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
-		return 0;
-
-	if (!find_blobs_in_containers(&cp))
-		return -EINVAL;
-
-	scan_containers(cp.data, cp.size, &desc);
-	if (!desc.mc)
-		return -EINVAL;
-
-	ret = _load_microcode_amd(x86_family(cpuid_1_eax), desc.data, desc.size);
-	if (ret > UCODE_UPDATED)
-		return -EINVAL;
-
-	return 0;
-}
-early_initcall(save_microcode_in_initrd);
-
 static inline bool patch_cpus_equivalent(struct ucode_patch *p,
 					 struct ucode_patch *n,
 					 bool ignore_stepping)
@@ -1004,6 +976,32 @@ static enum ucode_state load_microcode_amd(u8 family, const u8 *data, size_t siz
 	return ret;
 }
 
+static int __init save_microcode_in_initrd(void)
+{
+	unsigned int cpuid_1_eax = native_cpuid_eax(1);
+	struct cpuinfo_x86 *c = &boot_cpu_data;
+	struct cont_desc desc = { 0 };
+	enum ucode_state ret;
+	struct cpio_data cp;
+
+	if (dis_ucode_ldr || c->x86_vendor != X86_VENDOR_AMD || c->x86 < 0x10)
+		return 0;
+
+	if (!find_blobs_in_containers(&cp))
+		return -EINVAL;
+
+	scan_containers(cp.data, cp.size, &desc);
+	if (!desc.mc)
+		return -EINVAL;
+
+	ret = _load_microcode_amd(x86_family(cpuid_1_eax), desc.data, desc.size);
+	if (ret > UCODE_UPDATED)
+		return -EINVAL;
+
+	return 0;
+}
+early_initcall(save_microcode_in_initrd);
+
 /*
  * AMD microcode firmware naming convention, up to family 15h they are in
  * the legacy file:
-- 
2.43.0

