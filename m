Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E386347
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141364; cv=none; b=ThAs0OK+N1Icl1DNSHB+Et4zai82iG3qo8AQZ9dYEhDHkA47jVHzLSkDiL+YneBdTs1o76VRW07Fqn0kErEbYg6LpkDBZrb9/cLlmHIaVTjJR6p3D3mSvR74ebb77B5kMzwKl+ZwXJ34Z/EzbAuGcL67EjOf9h98ZIFfqes0958=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141364; c=relaxed/simple;
	bh=AVRJK0AlV6BUg2dwNbgEDGLzCQWZMvMX1uvwF2M+3PM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lndBs8R8bfGUBqSE8xhWILreKAt1+4pSmo9JzxJ6635VXAYyd8KTi5DxAmEaNySjra/J1W+HLR/OFi8t3G+35LlJaJgEVZrpCmry68/z5ISke7LCeyPxQWzSkgwdRY0Dr2eAKc8R3f8MCzrOneXydjO3yIpWk3gR9Bo87f+cjLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=aQhn2z3j; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="aQhn2z3j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NH09DhKK9d23nNs3oive8Tg5lMzhCAly3h7vRT7M3aU=; b=aQhn2z3jZRv6gpJ1/1kOuOTGXG
	5OlsxcGu/i4YSYtkp8T8IS5RaT0cP7aaVphD83qgeFDBjIsIiaoFF5No5Kf0NUtHnYzaH0PIsLYZ2
	Ixv3eMrZ8mhhBb0wxTZoOO//tTJhZrFCIZffA7ACjlzxiAAsiQlzZAl3o53BG8iPnxGA5Ri2xOJR7
	GPGVa81+922AM1mCj/uAtw1/AR4OqqR90JcK9pXME4nl/dcgozR4gqk3Y6GRM+GqFBChzyUvALJaR
	H4KQglB5uZLLMQ1LVpI4gd7En0z4a5IwQe9MEFn393GKniLbbf52NIzrozLLxCkv0tdNFWb9qd/YL
	kQKJcWcw==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNDZC-000000002qg-3SCE;
	Thu, 05 Jun 2025 12:35:46 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v3 4/7] x86/apic: Introduce Remote Action Request Operations
Date: Thu,  5 Jun 2025 12:35:13 -0400
Message-ID: <20250605163544.3852565-5-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605163544.3852565-1-riel@surriel.com>
References: <20250605163544.3852565-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yu-cheng Yu <yu-cheng.yu@intel.com>

RAR TLB flushing is started by sending a command to the APIC.
This patch adds Remote Action Request commands.

Because RAR_VECTOR is hardcoded at 0xe0, POSTED_MSI_NOTIFICATION_VECTOR
has to be lowered to 0xdf, reducing the number of available vectors by
13.

[riel: refactor after 6 years of changes, lower POSTED_MSI_NOTIFICATION_VECTOR]

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/include/asm/apicdef.h     | 1 +
 arch/x86/include/asm/irq_vectors.h | 7 ++++++-
 arch/x86/include/asm/smp.h         | 1 +
 arch/x86/kernel/apic/ipi.c         | 5 +++++
 arch/x86/kernel/apic/local.h       | 3 +++
 5 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/apicdef.h b/arch/x86/include/asm/apicdef.h
index 094106b6a538..b152d45af91a 100644
--- a/arch/x86/include/asm/apicdef.h
+++ b/arch/x86/include/asm/apicdef.h
@@ -92,6 +92,7 @@
 #define		APIC_DM_LOWEST		0x00100
 #define		APIC_DM_SMI		0x00200
 #define		APIC_DM_REMRD		0x00300
+#define		APIC_DM_RAR		0x00300
 #define		APIC_DM_NMI		0x00400
 #define		APIC_DM_INIT		0x00500
 #define		APIC_DM_STARTUP		0x00600
diff --git a/arch/x86/include/asm/irq_vectors.h b/arch/x86/include/asm/irq_vectors.h
index 47051871b436..52a0cf56562a 100644
--- a/arch/x86/include/asm/irq_vectors.h
+++ b/arch/x86/include/asm/irq_vectors.h
@@ -97,11 +97,16 @@
 
 #define LOCAL_TIMER_VECTOR		0xec
 
+/*
+ * RAR (remote action request) TLB flush
+ */
+#define RAR_VECTOR			0xe0
+
 /*
  * Posted interrupt notification vector for all device MSIs delivered to
  * the host kernel.
  */
-#define POSTED_MSI_NOTIFICATION_VECTOR	0xeb
+#define POSTED_MSI_NOTIFICATION_VECTOR	0xdf
 
 #define NR_VECTORS			 256
 
diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 0c1c68039d6f..0e5ad0dc987a 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -120,6 +120,7 @@ void __noreturn mwait_play_dead(unsigned int eax_hint);
 void native_smp_send_reschedule(int cpu);
 void native_send_call_func_ipi(const struct cpumask *mask);
 void native_send_call_func_single_ipi(int cpu);
+void native_send_rar_ipi(const struct cpumask *mask);
 
 asmlinkage __visible void smp_reboot_interrupt(void);
 __visible void smp_reschedule_interrupt(struct pt_regs *regs);
diff --git a/arch/x86/kernel/apic/ipi.c b/arch/x86/kernel/apic/ipi.c
index 98a57cb4aa86..9983c42619ef 100644
--- a/arch/x86/kernel/apic/ipi.c
+++ b/arch/x86/kernel/apic/ipi.c
@@ -106,6 +106,11 @@ void apic_send_nmi_to_offline_cpu(unsigned int cpu)
 		return;
 	apic->send_IPI(cpu, NMI_VECTOR);
 }
+
+void native_send_rar_ipi(const struct cpumask *mask)
+{
+	__apic_send_IPI_mask(mask, RAR_VECTOR);
+}
 #endif /* CONFIG_SMP */
 
 static inline int __prepare_ICR2(unsigned int mask)
diff --git a/arch/x86/kernel/apic/local.h b/arch/x86/kernel/apic/local.h
index bdcf609eb283..833669174267 100644
--- a/arch/x86/kernel/apic/local.h
+++ b/arch/x86/kernel/apic/local.h
@@ -38,6 +38,9 @@ static inline unsigned int __prepare_ICR(unsigned int shortcut, int vector,
 	case NMI_VECTOR:
 		icr |= APIC_DM_NMI;
 		break;
+	case RAR_VECTOR:
+		icr |= APIC_DM_RAR;
+		break;
 	}
 	return icr;
 }
-- 
2.49.0

