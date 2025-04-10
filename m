Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E2D1E9B14
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744304086; cv=none; b=M8EhMLLrX7RlBH/gq4pr9XWBM6dLlLIbzgWs7hpNqZj03D1x8+5n+EyAMXJ/uvZnGtY16jTGxh92uhnboRKDJO2Q/YwJxq1lxpNH+gayDjP4X2w8L+9TmdOa+MAQaLt/DIciwFhkkt7kFf03cy6nRi/Mu3M8VtQ6flCT8W0jXx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744304086; c=relaxed/simple;
	bh=Ee6x5tc8BzBexUHOmLSNGiIjzP71Y2j5XgfxbUgo0Io=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mqPpBqW5p2fFkeioi0sYpkXtyxhMQvFsvniIgaT0N+PzAC6E0UbSHuCpUzi6d0RbX7TwcAAvHIqD1BGnE+9Lu43VnjEz7MLUqAuMS02eJpRUJ3ibvyU0AVg8pNSzaw+0oJPMXkkgTCzYRHhNSkLHLSvVC89pbho3n+dXEah7Vmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzFPWhbM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzFPWhbM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190F4C4CEDD;
	Thu, 10 Apr 2025 16:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744304085;
	bh=Ee6x5tc8BzBexUHOmLSNGiIjzP71Y2j5XgfxbUgo0Io=;
	h=From:To:Cc:Subject:Date:From;
	b=KzFPWhbMdxds5zk5+2/de3vEtvRyrhvD9DMdf9Hx2DOBbmRqVxqEtjp5yzxiEMHjv
	 GZhspzhBh7WN0mXZWCZnllLsvFivH6u7oqhiJA8INb6fwqiIaJyr43jrP9s9a7b9mE
	 ZnOwNsHlxIRbgobgdaukMjfeeLzkOdoOzI1ji0AYc2OsK0Vr7OK6O8ckXAK7V2Ntvc
	 0yeAKPlRjRv1866eEpkXlvH8Kplep9YXF/vzawNBHD6wAsUZxNF62xTirQkKJz0wOn
	 sr/SdQTj9VaolhwymTDojiBwciKM5Gzdgxdl725sflcTNvaGfZ0dgJKHZXBVeG2HUo
	 a0fDfKBJxhzYg==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH] x86/cpufeatures: Clean up formatting
Date: Thu, 10 Apr 2025 18:54:34 +0200
Message-ID: <20250410165434.20648-1-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

It is a special file with special formatting so remove one whitespace
damage and format newer defines like the rest.

No functional changes.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/include/asm/cpufeatures.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 6c2c152d8a67..6ff634304fb1 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -477,10 +477,10 @@
 #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control available */
 #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control enabled */
 #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch history at vmexit using SW loop */
-#define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
-#define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
-#define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
-#define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
+#define X86_FEATURE_AMD_FAST_CPPC	(21*32+ 5) /* Fast CPPC */
+#define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32+ 6) /* Heterogeneous Core Topology */
+#define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32+ 7) /* Workload Classification */
+#define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
 
 /*
  * BUG word(s)
@@ -527,10 +527,10 @@
 #define X86_BUG_TDX_PW_MCE		X86_BUG(31) /* "tdx_pw_mce" CPU may incur #MC if non-TD software does partial write to TDX private memory */
 
 /* BUG word 2 */
-#define X86_BUG_SRSO			X86_BUG(1*32 + 0) /* "srso" AMD SRSO bug */
-#define X86_BUG_DIV0			X86_BUG(1*32 + 1) /* "div0" AMD DIV0 speculation bug */
-#define X86_BUG_RFDS			X86_BUG(1*32 + 2) /* "rfds" CPU is vulnerable to Register File Data Sampling */
-#define X86_BUG_BHI			X86_BUG(1*32 + 3) /* "bhi" CPU is affected by Branch History Injection */
-#define X86_BUG_IBPB_NO_RET	   	X86_BUG(1*32 + 4) /* "ibpb_no_ret" IBPB omits return target predictions */
-#define X86_BUG_SPECTRE_V2_USER		X86_BUG(1*32 + 5) /* "spectre_v2_user" CPU is affected by Spectre variant 2 attack between user processes */
+#define X86_BUG_SRSO			X86_BUG( 1*32+ 0) /* "srso" AMD SRSO bug */
+#define X86_BUG_DIV0			X86_BUG( 1*32+ 1) /* "div0" AMD DIV0 speculation bug */
+#define X86_BUG_RFDS			X86_BUG( 1*32+ 2) /* "rfds" CPU is vulnerable to Register File Data Sampling */
+#define X86_BUG_BHI			X86_BUG( 1*32+ 3) /* "bhi" CPU is affected by Branch History Injection */
+#define X86_BUG_IBPB_NO_RET		X86_BUG( 1*32+ 4) /* "ibpb_no_ret" IBPB omits return target predictions */
+#define X86_BUG_SPECTRE_V2_USER		X86_BUG( 1*32+ 5) /* "spectre_v2_user" CPU is affected by Spectre variant 2 attack between user processes */
 #endif /* _ASM_X86_CPUFEATURES_H */
-- 
2.43.0

