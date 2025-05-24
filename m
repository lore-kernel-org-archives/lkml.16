Received: from mail.mixaill.net (mail.mixaill.net [144.76.234.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B554A143748
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.76.234.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748098929; cv=none; b=UhoU3DIu3LE/nyxAMYNFwkGapapaw06GFSnFtKyoWWmlzGqId9lGHRsmvFi8Atwr2AAAUllVwzdHzj9pr1b6A58kIyK7iYhIgbDYWdPvPE/JPqh6W4fkX+BqlU2h2hSS51AGspQ78d7E/SMUiS0MMr/quG2+rlQ8f98+0siK7Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748098929; c=relaxed/simple;
	bh=NNv+EXFIzxTrtcLp3+aZuZ0bMbaekAyoddMeWPXN8U4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOovhzrKMO3y3owWNJUaRF4gSxCFGf3PpaqH3ga608Cgqq2GisROdx4T9gvrAjeycFd6MqrMXaPiCOs0AhgoXnnl8q5LG5Ytz5bjGnO7TsxnFbaGlMyZjGRwt0M6OAJQNIQSBzqVK0QbR9WOSHg+AdEcihiDB8Xm5fVy8hQDLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net; spf=pass smtp.mailfrom=mixaill.net; dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b=ckd/biK6; arc=none smtp.client-ip=144.76.234.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mixaill.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mixaill.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mixaill.net header.i=@mixaill.net header.b="ckd/biK6"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D41C3C0E6;
	Sat, 24 May 2025 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mixaill.net; s=dkim;
	t=1748098449; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=7NH8ryW0ZzZ3WLvIkVaP8T3bWJ7q/jL0EKkZ2GHY3Y8=;
	b=ckd/biK6fQxf6+Bw6OzMDLj6EinNccKv/bLLm3rAXaRk02UjdwLu7cduyXkoKOGE9xAb9s
	Hov1cR6ijDRY6lav0bNQpWIdRYDfBKjEWIsWj73t8mUe4wxS91GlE4bsqYBnpU41bDDYO4
	F1vN/6fWtUqRmaqwzrrJHQHRQLantDCNFGUlb10WYgpC2b16u2nJ5ASPZHfxCGR9DIy7gK
	O4ijAkdRIioDkUMN5teXaSkKdxl0ev/vhtXnsa7w8VDXuo4VWVRgvSTFuPHaOagCx6KiUn
	XIz6h9vPXZg6zAEkhSPjVPZ6F1tJaYrjLrq+W3uUF+fJe9Hh7gSAy41qj5qzbw==
From: Mikhail Paulyshka <me@mixaill.net>
To: Borislav Petkov <bp@alien8.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Paulyshka <me@mixaill.net>
Subject: [PATCH v2 1/1] x86/rdrand: disable RDSEED on AMD Cyan Skillfish
Date: Sat, 24 May 2025 17:53:19 +0300
Message-ID: <20250524145319.209075-1-me@mixaill.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

AMD Cyan Skillfish (Family 17h, Model 47h, Stepping 0h) has an
error that causes RDSEED to always return 0xffffffff, while RDRAND
works correctly.

This patch masks the RDSEED cap for this CPU so that both
/proc/cpuinfo and direct CPUID read report RDSEED as unavailable.


v2:
  * Limit changes to AMD Cyan Skillfish
  * Replace the runtime RDSEED sanity check with a simple
    family/model/stepping match

Signed-off-by: Mikhail Paulyshka <me@mixaill.net>
---
 arch/x86/include/asm/msr-index.h       | 1 +
 arch/x86/kernel/cpu/rdrand.c           | 9 +++++++++
 tools/arch/x86/include/asm/msr-index.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index e7d2f460fcc6..2333f4e7bc2f 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -624,6 +624,7 @@
 #define MSR_AMD64_OSVW_STATUS		0xc0010141
 #define MSR_AMD_PPIN_CTL		0xc00102f0
 #define MSR_AMD_PPIN			0xc00102f1
+#define MSR_AMD64_CPUID_FN_7		0xc0011002
 #define MSR_AMD64_CPUID_FN_1		0xc0011004
 #define MSR_AMD64_LS_CFG		0xc0011020
 #define MSR_AMD64_DC_CFG		0xc0011022
diff --git a/arch/x86/kernel/cpu/rdrand.c b/arch/x86/kernel/cpu/rdrand.c
index eeac00d20926..c474d0a5c317 100644
--- a/arch/x86/kernel/cpu/rdrand.c
+++ b/arch/x86/kernel/cpu/rdrand.c
@@ -11,6 +11,7 @@
 #include <asm/processor.h>
 #include <asm/archrandom.h>
 #include <asm/sections.h>
+#include <asm/msr.h>
 
 /*
  * RDRAND has Built-In-Self-Test (BIST) that runs on every invocation.
@@ -47,4 +48,12 @@ void x86_init_rdrand(struct cpuinfo_x86 *c)
 		clear_cpu_cap(c, X86_FEATURE_RDSEED);
 		pr_emerg("RDRAND is not reliable on this platform; disabling.\n");
 	}
+
+	/* disable RDSEED on AMD Cyan Skillfish because of hw bug */
+	if (c->x86_vendor == X86_VENDOR_AMD && c->x86 == 0x17 &&
+	    c->x86_model == 0x47 && c->x86_stepping == 0x0) {
+		clear_cpu_cap(c, X86_FEATURE_RDSEED);
+		msr_clear_bit(MSR_AMD64_CPUID_FN_7, 18);
+		pr_emerg("RDSEED is not reliable on this platform; disabling.\n");
+	}
 }
diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/asm/msr-index.h
index e6134ef2263d..8b48a54b627a 100644
--- a/tools/arch/x86/include/asm/msr-index.h
+++ b/tools/arch/x86/include/asm/msr-index.h
@@ -616,6 +616,7 @@
 #define MSR_AMD64_OSVW_STATUS		0xc0010141
 #define MSR_AMD_PPIN_CTL		0xc00102f0
 #define MSR_AMD_PPIN			0xc00102f1
+#define MSR_AMD64_CPUID_FN_7		0xc0011002
 #define MSR_AMD64_CPUID_FN_1		0xc0011004
 #define MSR_AMD64_LS_CFG		0xc0011020
 #define MSR_AMD64_DC_CFG		0xc0011022
-- 
2.49.0

