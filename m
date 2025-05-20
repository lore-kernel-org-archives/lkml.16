Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E6253F07
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747703058; cv=none; b=kCS2bTtZFxnZVYM6Cpf1yF6y1a6FDSvJbf3U3AsJBPv4t80DthBYrbdS92aF8yl+lrkUW0nGj7KXyCnUZ0ZY7OaPLzRR0VZoOAjkPa+4KTSHC5r9GOVpYRl1RVNYfWkZtuJyBpkS4B+e36QwsBaf+uL/mPmrMx0jdJIXaSJafOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747703058; c=relaxed/simple;
	bh=8Rv2NThq3GpIF740ywbYkJK48AvMiLVuweYORk9NC8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Odrpzjb/RHU429Scq158oz35lZyFLw0Qlarwlo7PIdJ0d8YF5W0OxhlG+mPe49l46Hj2G+xEe4yE3HEPhlCg32El/qbYTevOrJK1Q4eK+ZZYcAFTfb33f6yNYVY645U2tpxbPLyCHNqGTt5+niYB0NHaGarQO0AoYC7PMfivK8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1uHBOd-000000000aB-0G7W;
	Mon, 19 May 2025 21:03:55 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	nadav.amit@gmail.com,
	Rik van Riel <riel@fb.com>,
	Yu-cheng Yu <yu-cheng.yu@intel.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC v2 6/9] x86/apic: Introduce Remote Action Request Operations
Date: Mon, 19 May 2025 21:02:31 -0400
Message-ID: <20250520010350.1740223-7-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520010350.1740223-1-riel@surriel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

From: Rik van Riel <riel@fb.com>

RAR TLB flushing is started by sending a command to the APIC.
This patch adds Remote Action Request commands.

[riel: move some things around to acount for 6 years of changes]

Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/include/asm/apicdef.h     |  1 +
 arch/x86/include/asm/irq_vectors.h |  5 +++++
 arch/x86/include/asm/smp.h         | 15 +++++++++++++++
 arch/x86/kernel/apic/ipi.c         | 23 +++++++++++++++++++----
 arch/x86/kernel/apic/local.h       |  3 +++
 arch/x86/kernel/smp.c              |  3 +++
 6 files changed, 46 insertions(+), 4 deletions(-)

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
index 47051871b436..c417b0015304 100644
--- a/arch/x86/include/asm/irq_vectors.h
+++ b/arch/x86/include/asm/irq_vectors.h
@@ -103,6 +103,11 @@
  */
 #define POSTED_MSI_NOTIFICATION_VECTOR	0xeb
 
+/*
+ * RAR (remote action request) TLB flush
+ */
+#define RAR_VECTOR			0xe0
+
 #define NR_VECTORS			 256
 
 #ifdef CONFIG_X86_LOCAL_APIC
diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 0c1c68039d6f..1ab9f5fcac8a 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -40,6 +40,9 @@ struct smp_ops {
 
 	void (*send_call_func_ipi)(const struct cpumask *mask);
 	void (*send_call_func_single_ipi)(int cpu);
+
+	void (*send_rar_ipi)(const struct cpumask *mask);
+	void (*send_rar_single_ipi)(int cpu);
 };
 
 /* Globals due to paravirt */
@@ -100,6 +103,16 @@ static inline void arch_send_call_function_ipi_mask(const struct cpumask *mask)
 	smp_ops.send_call_func_ipi(mask);
 }
 
+static inline void arch_send_rar_single_ipi(int cpu)
+{
+	smp_ops.send_rar_single_ipi(cpu);
+}
+
+static inline void arch_send_rar_ipi_mask(const struct cpumask *mask)
+{
+	smp_ops.send_rar_ipi(mask);
+}
+
 void cpu_disable_common(void);
 void native_smp_prepare_boot_cpu(void);
 void smp_prepare_cpus_common(void);
@@ -120,6 +133,8 @@ void __noreturn mwait_play_dead(unsigned int eax_hint);
 void native_smp_send_reschedule(int cpu);
 void native_send_call_func_ipi(const struct cpumask *mask);
 void native_send_call_func_single_ipi(int cpu);
+void native_send_rar_ipi(const struct cpumask *mask);
+void native_send_rar_single_ipi(int cpu);
 
 asmlinkage __visible void smp_reboot_interrupt(void);
 __visible void smp_reschedule_interrupt(struct pt_regs *regs);
diff --git a/arch/x86/kernel/apic/ipi.c b/arch/x86/kernel/apic/ipi.c
index 98a57cb4aa86..e5e9fc08f86c 100644
--- a/arch/x86/kernel/apic/ipi.c
+++ b/arch/x86/kernel/apic/ipi.c
@@ -79,7 +79,7 @@ void native_send_call_func_single_ipi(int cpu)
 	__apic_send_IPI(cpu, CALL_FUNCTION_SINGLE_VECTOR);
 }
 
-void native_send_call_func_ipi(const struct cpumask *mask)
+static void do_native_send_ipi(const struct cpumask *mask, int vector)
 {
 	if (static_branch_likely(&apic_use_ipi_shorthand)) {
 		unsigned int cpu = smp_processor_id();
@@ -88,14 +88,19 @@ void native_send_call_func_ipi(const struct cpumask *mask)
 			goto sendmask;
 
 		if (cpumask_test_cpu(cpu, mask))
-			__apic_send_IPI_all(CALL_FUNCTION_VECTOR);
+			__apic_send_IPI_all(vector);
 		else if (num_online_cpus() > 1)
-			__apic_send_IPI_allbutself(CALL_FUNCTION_VECTOR);
+			__apic_send_IPI_allbutself(vector);
 		return;
 	}
 
 sendmask:
-	__apic_send_IPI_mask(mask, CALL_FUNCTION_VECTOR);
+	__apic_send_IPI_mask(mask, vector);
+}
+
+void native_send_call_func_ipi(const struct cpumask *mask)
+{
+	do_native_send_ipi(mask, CALL_FUNCTION_VECTOR);
 }
 
 void apic_send_nmi_to_offline_cpu(unsigned int cpu)
@@ -106,6 +111,16 @@ void apic_send_nmi_to_offline_cpu(unsigned int cpu)
 		return;
 	apic->send_IPI(cpu, NMI_VECTOR);
 }
+
+void native_send_rar_single_ipi(int cpu)
+{
+	apic->send_IPI_mask(cpumask_of(cpu), RAR_VECTOR);
+}
+
+void native_send_rar_ipi(const struct cpumask *mask)
+{
+	do_native_send_ipi(mask, RAR_VECTOR);
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
diff --git a/arch/x86/kernel/smp.c b/arch/x86/kernel/smp.c
index 18266cc3d98c..2c51ed6aaf03 100644
--- a/arch/x86/kernel/smp.c
+++ b/arch/x86/kernel/smp.c
@@ -297,5 +297,8 @@ struct smp_ops smp_ops = {
 
 	.send_call_func_ipi	= native_send_call_func_ipi,
 	.send_call_func_single_ipi = native_send_call_func_single_ipi,
+
+	.send_rar_ipi		= native_send_rar_ipi,
+	.send_rar_single_ipi	= native_send_rar_single_ipi,
 };
 EXPORT_SYMBOL_GPL(smp_ops);
-- 
2.49.0

