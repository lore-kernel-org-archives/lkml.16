Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1F025F7B2
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507923; cv=none; b=JHKgc8Q0lC1XR8a+kjfMjZaZ5KSgH1LeceBOsXhozKl+XoMNP+1MnDil89eey48BRBSKzAUByGT4HWlDw05fQCijS67ZlZuK7Efgl8SAGOFbb4To7KlEdUZFjchdcSHnnzek1cPREV7kEEHKvmU5CgVqbnGYDj5xEVIJ5/53IaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507923; c=relaxed/simple;
	bh=GpEGeTV1r1aDpK870WX4UaM4zuF16ORvLYoLbu6lGNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EiEGywUiwSYDOaZeCoziglhsag115WmuFloJJgirJ2MlkJq7rNmDfdnl5HizNN3Fd8Z1Xjflw1zlZsqscOWIlS3E/Tb79bVhqmuH1B34Kan0Pc9PynnGH8h3lEKnMx6nKuUjKX5ZLDEqDpqEJ5xGY6RJKEgp7TYqXaiXe7Xfmx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PWQmktXM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cSSIh//k; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PWQmktXM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cSSIh//k"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YM/jsNaePf5YoD/I9jYr5CGS+JXAp1yKUBU1SIayZgc=;
	b=PWQmktXMxXfBokmy4WJSmP08E8fR4hRUmOsR7HEq5wWZ+1Isw0kPJJgHKa6EykaA0TO7Lw
	LqHYzinvWxIKDh6msYJK/1YszIUVRY+w/lUCoDbTTpbuVO/qWLy4hL8au6mjoOnaKfz523
	KX9Vi4LK4RxWY7WzHzva/3rtoF1Kly/dVfSrrfxcKeFa7KpmzYnbLL7qmSwS8Cj6xMxCmx
	EsLUIt426beYxDjUBTWcJ03PrK/7PE7UldEvKMocOZBA2xvF03F/GKl3xivXlNbM8tCSyM
	1VUbNjIdvL/D8RP/uZrsbtZkFZMV3HpEJDBqmye7iXKWZ5FmC6RRxS/7CnIElg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YM/jsNaePf5YoD/I9jYr5CGS+JXAp1yKUBU1SIayZgc=;
	b=cSSIh//kzKVr2S66XzPgVVVShbUj8m28jGHa9PHg91it5vqJE7YAWHVhxmyEbqlFrjy8qz
	FYZr3+b41+wAzxDA==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 11/26] x86/lib: Add CPUID(0x1) CPU family and model calculation
Date: Tue,  6 May 2025 07:04:22 +0200
Message-ID: <20250506050437.10264-12-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The x86 library code provides x86_family() and x86_model().  They take
raw CPUID(0x1) EAX register output, extract the necessary bitfields with
bitwise operations, then calculate out the CPU family and model.

In follow-up commits, the x86 code will use scanned CPUID access, along
with its auto-generated <cpuid/leaves.h> CPUID leaf data structures and
their detailed C99 bitfields.

Introduce CPU family and model calculation functions to x86/lib that take
the auto-generated 'struct leaf_0x1_0' data type.  Refactor the pure CPU
family and model calculation logic into internal static functions so that
no logic is duplicated.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpu.h |  6 ++++++
 arch/x86/lib/cpu.c         | 41 ++++++++++++++++++++++----------------
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/cpu.h b/arch/x86/include/asm/cpu.h
index ad235dda1ded..b5685377f583 100644
--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -7,7 +7,9 @@
 #include <linux/topology.h>
 #include <linux/nodemask.h>
 #include <linux/percpu.h>
+
 #include <asm/ibt.h>
+#include <asm/cpuid/leaves.h>
 
 #ifndef CONFIG_SMP
 #define cpu_physical_id(cpu)			boot_cpu_physical_apicid
@@ -25,6 +27,10 @@ int mwait_usable(const struct cpuinfo_x86 *);
 unsigned int x86_family(unsigned int sig);
 unsigned int x86_model(unsigned int sig);
 unsigned int x86_stepping(unsigned int sig);
+
+unsigned int cpuid_family(const struct leaf_0x1_0 *l);
+unsigned int cpuid_model(const struct leaf_0x1_0 *l);
+
 #ifdef CONFIG_X86_BUS_LOCK_DETECT
 extern void __init sld_setup(struct cpuinfo_x86 *c);
 extern bool handle_user_split_lock(struct pt_regs *regs, long error_code);
diff --git a/arch/x86/lib/cpu.c b/arch/x86/lib/cpu.c
index 7ad68917a51e..1a6aaa76305a 100644
--- a/arch/x86/lib/cpu.c
+++ b/arch/x86/lib/cpu.c
@@ -1,36 +1,43 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/types.h>
 #include <linux/export.h>
+
 #include <asm/cpu.h>
+#include <asm/cpuid/leaves.h>
 
-unsigned int x86_family(unsigned int sig)
+static unsigned int __x86_family(unsigned int base_fam, unsigned int ext_fam)
 {
-	unsigned int x86;
-
-	x86 = (sig >> 8) & 0xf;
+	return (base_fam == 0xf) ? base_fam + ext_fam : base_fam;
+}
 
-	if (x86 == 0xf)
-		x86 += (sig >> 20) & 0xff;
+static unsigned int
+__x86_model(unsigned int family, unsigned int base_model, unsigned int ext_model)
+{
+	return (family >= 0x6) ? base_model | ext_model << 4 : base_model;
+}
 
-	return x86;
+unsigned int x86_family(unsigned int sig)
+{
+	return __x86_family((sig >> 8) & 0xf, (sig >> 20) & 0xff);
 }
 EXPORT_SYMBOL_GPL(x86_family);
 
-unsigned int x86_model(unsigned int sig)
+unsigned int cpuid_family(const struct leaf_0x1_0 *l)
 {
-	unsigned int fam, model;
-
-	fam = x86_family(sig);
-
-	model = (sig >> 4) & 0xf;
-
-	if (fam >= 0x6)
-		model += ((sig >> 16) & 0xf) << 4;
+	return __x86_family(l->base_family_id, l->ext_family);
+}
 
-	return model;
+unsigned int x86_model(unsigned int sig)
+{
+	return __x86_model(x86_family(sig), (sig >> 4) & 0xf, (sig >> 16) & 0xf);
 }
 EXPORT_SYMBOL_GPL(x86_model);
 
+unsigned int cpuid_model(const struct leaf_0x1_0 *l)
+{
+	return __x86_model(cpuid_family(l), l->base_model, l->ext_model);
+}
+
 unsigned int x86_stepping(unsigned int sig)
 {
 	return sig & 0xf;
-- 
2.49.0

