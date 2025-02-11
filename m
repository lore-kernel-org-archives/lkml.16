Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C489256C67
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291816; cv=none; b=I3hKnqdXIPWVU9tMbs7yixxlvaepUs3SgZI9GEZXoSAyCADsRKoLD3SLNQYubDq6mjF6LmJMSeYp6K1H+5qEs/iEfPrH/URMddgh2SIkUOpK/sKjjDf//zxtfusFpXDrHQ10t7UCjcXRU9+tjDEWchvqzuUAIpT4xDF/RKsnvOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291816; c=relaxed/simple;
	bh=ED3ny5115pDBmmp0qaqzGXjvXu2hgnTP/uhYI604o+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cuOriFglNDMfQCGNi+/YotpLuvnbK5cY+nRWiPJeRXa/nwL7GbpVQdgpFKPiY90+sOSa6Oee1tSLfd8UfPnkU0xg+AcaKsQQ1zsOqWXN32SR3YLNpXJzaX5o9WML7OeG4+D566KhsS+xT5ZNp3Wu9OhgFiU4neRGL9IDMcY/tJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmovjLpj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmovjLpj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA45C4CEE5;
	Tue, 11 Feb 2025 16:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291816;
	bh=ED3ny5115pDBmmp0qaqzGXjvXu2hgnTP/uhYI604o+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rmovjLpjq0dVciSd4DxaCN2mAlz5YZRnHU1cUi5tEkYCz6dbxgx2iiDuFlq7o3Tca
	 3a3THFsTUTAFvJ3wbU2UfyltCr+ZcMgbDdVSwFqYGv59uFPikY+Jq0rHoXqyK5d389
	 4vUX6i+vAmybeYq//RiG4vJGjbuZ91kT7yomwbCLGaWpFgmK1XBjSKQcaPsKEbmIKY
	 Tf/QxrA2WeZJjg5qvHgdk1mfZrExjDoSWeNU8uu9hfaZ5XQhr9ah3dw04UZkCLy9DY
	 BesiMr+ak0TqWE4DGii/KsYy/Dtbh37pHj/3vTwUQy4jeeC4aNu8VLn3z0Kp30VlsH
	 gIHfnGM2gFtQg==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH 3/5] x86/microcode/AMD: Merge early_apply_microcode() into its single callsite
Date: Tue, 11 Feb 2025 17:36:46 +0100
Message-ID: <20250211163648.30531-4-bp@kernel.org>
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

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/cpu/microcode/amd.c | 60 +++++++++++++----------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index f831c0602994..90f93b3ca9db 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -512,39 +512,6 @@ static bool __apply_microcode_amd(struct microcode_amd *mc, unsigned int psize)
 	return true;
 }
 
-/*
- * Early load occurs before we can vmalloc(). So we look for the microcode
- * patch container file in initrd, traverse equivalent cpu table, look for a
- * matching microcode patch, and update, all in initrd memory in place.
- * When vmalloc() is available for use later -- on 64-bit during first AP load,
- * and on 32-bit during save_microcode_in_initrd() -- we can call
- * load_microcode_amd() to save equivalent cpu table and microcode patches in
- * kernel heap memory.
- *
- * Returns true if container found (sets @desc), false otherwise.
- */
-static bool early_apply_microcode(u32 old_rev, void *ucode, size_t size)
-{
-	struct cont_desc desc = { 0 };
-	struct microcode_amd *mc;
-
-	scan_containers(ucode, size, &desc);
-
-	mc = desc.mc;
-	if (!mc)
-		return false;
-
-	/*
-	 * Allow application of the same revision to pick up SMT-specific
-	 * changes even if the revision of the other SMT thread is already
-	 * up-to-date.
-	 */
-	if (old_rev > mc->hdr.patch_id)
-		return false;
-
-	return __apply_microcode_amd(mc, desc.psize);
-}
-
 static bool get_builtin_microcode(struct cpio_data *cp)
 {
 	char fw_name[36] = "amd-ucode/microcode_amd.bin";
@@ -582,8 +549,19 @@ static bool __init find_blobs_in_containers(struct cpio_data *ret)
 	return found;
 }
 
+/*
+ * Early load occurs before we can vmalloc(). So we look for the microcode
+ * patch container file in initrd, traverse equivalent cpu table, look for a
+ * matching microcode patch, and update, all in initrd memory in place.
+ * When vmalloc() is available for use later -- on 64-bit during first AP load,
+ * and on 32-bit during save_microcode_in_initrd() -- we can call
+ * load_microcode_amd() to save equivalent cpu table and microcode patches in
+ * kernel heap memory.
+ */
 void __init load_ucode_amd_bsp(struct early_load_data *ed, unsigned int cpuid_1_eax)
 {
+	struct cont_desc desc = { };
+	struct microcode_amd *mc;
 	struct cpio_data cp = { };
 	u32 dummy;
 
@@ -597,7 +575,21 @@ void __init load_ucode_amd_bsp(struct early_load_data *ed, unsigned int cpuid_1_
 	if (!find_blobs_in_containers(&cp))
 		return;
 
-	if (early_apply_microcode(ed->old_rev, cp.data, cp.size))
+	scan_containers(cp.data, cp.size, &desc);
+
+	mc = desc.mc;
+	if (!mc)
+		return;
+
+	/*
+	 * Allow application of the same revision to pick up SMT-specific
+	 * changes even if the revision of the other SMT thread is already
+	 * up-to-date.
+	 */
+	if (ed->old_rev > mc->hdr.patch_id)
+		return;
+
+	if (__apply_microcode_amd(mc, desc.psize))
 		native_rdmsr(MSR_AMD64_PATCH_LEVEL, ed->new_rev, dummy);
 }
 
-- 
2.43.0

