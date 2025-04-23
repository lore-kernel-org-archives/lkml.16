Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B0426D4F2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406642; cv=none; b=M1+Sf/M0kyYcBo1hQMhvJcidQMIqocuLGzw/tcwylUkOpVJkyg27UB7Lrz4TjAjl/uKq9A4ac5Pzc1d9SOz7oVeQX07hS5HxmwXTzySelLJPaInJYDBuLLLzpjiqi/xfJsCzV4YAe85myHZkO1L/1FT6p1UxSIttuF5KYO/nqvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406642; c=relaxed/simple;
	bh=Ib99OdMh0enkY6TPRZxjv/65h/XKNl3J75/X+8IrRls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A23ewwktUocn0BKHpaT1QBuPdQjgUW1owjQF2NB7ASDntf9OsL695R1PdwMIJnc5ERoZjf4DzCE0TH5PkrbjnIs4Qn8BaxUTV6sloh27iOfblwoCb4T+N25LsfyBLva9nbPusQRcsN2I+fd5NdN4MQ3cMjcBmL87Gznh3ijtUS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vj8p290g; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vj8p290g"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so25635265e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406639; x=1746011439; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VBoJ481uB7mn+QxWuP87Dth5SOxpKWB10cRWV+uYmEE=;
        b=vj8p290gM4bDQ28XEJ4TeU1wgwD5JJOHb7lV5ndwObTIodOWhLvYyfvOq/fR/NEW12
         kkVEw5SsgK9LpkPxXgoNBTQIP0Gr6TCR4VQDNEvwedvACAJwQBvL0gC005YP1wuFcbub
         Gtkz5J1WpYSVi/T4/ZJ2v4YJ0wa48Fq65HAJsInTpIeZ++aeRbj9O/azD6ZQOjz7T3So
         RjjUJmJckSNf+rJ3xpz/v67RSeD6PIY2tsVVDeE1Mv54lPdk23Qm8cBRtBAgvFdcPoIc
         MjHVO1VpJuMjyK5+NfeeQIrESVZtK4VKVHmfJzYtEuoacz44wU9Pq5LC2vr62zOV4e0a
         cqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406639; x=1746011439;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBoJ481uB7mn+QxWuP87Dth5SOxpKWB10cRWV+uYmEE=;
        b=RJHdK8YmUAYm6V8FuUiuFGfIOhoxJbgJzuxBVGjECoLKyex10Hj69/PuXrt1xIMHms
         eDZicHREhOgnjMUxjV4L4ABRsOBeSyE384k9sLe+WI/BV5zbIuTFVxLvsqZpaPbumbFV
         ejNlgpxTFX0FLdqamuFeNDZhzk3agSvSL7XOGGZc338NlNINUQaYaA1wx1/KQWcfVXYf
         cOXTIVPs3mYaDJBHkdlGiRg61o+M7p6uBTHwFnsfOczzaAJHiHMYCv+8du8T4W9VSaJn
         4/LG82vvEOYtD8bpPWdyNrzKi3xWBjuCDfQ8ZuQyzop60sQzDKjpVB8wn2El/Kr/xixL
         pntA==
X-Gm-Message-State: AOJu0Yz7y7uOPPHfwufdQrFSnOdVexP+O2dljy0c8EAePo1Y55SIKkh4
	8QGQ+IAnDSptV1tdom9djihsR0dBsPOlTT2LDu0KoZBFEwKYQjqm38mDq8IDSYrW3kpPCmk/HGr
	3x83/GByHP8Qou4xc/MFfi0Zq9gT4J4sDcxop7j1OvbbMPUkYU6Vfkthk/lEQHBiyy2GfudjOyD
	llrKAhL4oY1T7/9BaIlDmsa34oqfRHGQ==
X-Google-Smtp-Source: AGHT+IHS+TC/FCGjgyFsj2LnSFdg94JEZUpuejLGQ1OOh/hDt3tCkNGth3+vP/WHmrnlf3z74iwa07o7
X-Received: from wmqb12.prod.google.com ([2002:a05:600c:4e0c:b0:43d:55cd:66bb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:500d:b0:43c:eea9:f438
 with SMTP id 5b1f17b1804b1-4408a656ee6mr78207045e9.15.1745406639413; Wed, 23
 Apr 2025 04:10:39 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:51 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2683; i=ardb@kernel.org;
 h=from:subject; bh=Pd/u42EgAdRCuYeaihpEHLBTzgMWHgpQ2dl3Fj3QJe0=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPjVI8EP2/ezX0ZQv0TF8blrl8k2NESyrZM2O7K8j8zp
 9flPlrZUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZSOY3hv/vZ9xufrlz3Zms3
 7+HiUnPzVM8/DOssv5obBC2NaLv0J4+RYTPX9wsVzUetBXTDN3m7CKfy7Fav3i7hpa5Vv/HZxFQ 3NgA=
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-15-ardb+git@google.com>
Subject: [RFC PATCH PoC 02/11] x86/boot: Move early_setup_gdt() back into head64.c
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Move early_setup_gdt() out of the startup code that is callable from the
1:1 mapping - this is not needed, and instead, it is better to expose
the helper that does reside in __head directly. This reduces the amount
of code that needs special checks for 1:1 execution suitability.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/gdt_idt.c | 15 +--------------
 arch/x86/include/asm/setup.h    |  1 +
 arch/x86/kernel/head64.c        | 12 ++++++++++++
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/x86/boot/startup/gdt_idt.c b/arch/x86/boot/startup/gdt_idt.c
index 7e34d0b426b1..a3112a69b06a 100644
--- a/arch/x86/boot/startup/gdt_idt.c
+++ b/arch/x86/boot/startup/gdt_idt.c
@@ -24,7 +24,7 @@
 static gate_desc bringup_idt_table[NUM_EXCEPTION_VECTORS] __page_aligned_data;
 
 /* This may run while still in the direct mapping */
-static void __head startup_64_load_idt(void *vc_handler)
+void __head startup_64_load_idt(void *vc_handler)
 {
 	struct desc_ptr desc = {
 		.address = (unsigned long)rip_rel_ptr(bringup_idt_table),
@@ -43,19 +43,6 @@ static void __head startup_64_load_idt(void *vc_handler)
 	native_load_idt(&desc);
 }
 
-/* This is used when running on kernel addresses */
-void early_setup_idt(void)
-{
-	void *handler = NULL;
-
-	if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT)) {
-		setup_ghcb();
-		handler = vc_boot_ghcb;
-	}
-
-	startup_64_load_idt(handler);
-}
-
 /*
  * Setup boot CPU state needed before kernel switches to virtual addresses.
  */
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index ad9212df0ec0..6324f4c6c545 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -52,6 +52,7 @@ extern void reserve_standard_io_resources(void);
 extern void i386_reserve_resources(void);
 extern unsigned long __startup_64(unsigned long p2v_offset, struct boot_params *bp);
 extern void startup_64_setup_gdt_idt(void);
+extern void startup_64_load_idt(void *vc_handler);
 extern void early_setup_idt(void);
 extern void __init do_early_exception(struct pt_regs *regs, int trapnr);
 
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 6b68a206fa7f..29226f3ac064 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -303,3 +303,15 @@ void __init __noreturn x86_64_start_reservations(char *real_mode_data)
 
 	start_kernel();
 }
+
+void early_setup_idt(void)
+{
+	void *handler = NULL;
+
+	if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT)) {
+		setup_ghcb();
+		handler = vc_boot_ghcb;
+	}
+
+	startup_64_load_idt(handler);
+}
-- 
2.49.0.805.g082f7c87e0-goog

