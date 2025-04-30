Received: from 7.mo584.mail-out.ovh.net (7.mo584.mail-out.ovh.net [178.33.253.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42821BF37
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.253.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053708; cv=none; b=fJelbT0SdNcdb1aCALSJKzY/DFaBJw8B7pRTffQrcPinF0yP9LMtZfcIjbPQpllrw7ZJh66Hr8rGR6b66a0+kMX9EYCsW9GQ8COPnOAZgBC+a5fi9IQ2HSBG+DQDq30/5Oy8m5ieJdQHtE25M1Wxoq238dSnB6W+a6h41eyxAT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053708; c=relaxed/simple;
	bh=hAX5/2RgCiZ7dm8HuqF2Gk36vMTUzfOwRjmXOB7iipI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OALcgvv1XPG7rf45YIMSc5+v6aaC9IkJpS4oSfsoyNiuNHxePMtJeBvfnZdhPS9X0OjXdAc0BjkjYI3IseU6OOVZTB/uUnG4jOo0XdkP0X4yFfZBRR24PjFOBITL5dg3hvhI9vWoHixFtlMdlKErQLBwtSNjUgsVoN/AhZoGzYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=TBVfq+Oh; arc=none smtp.client-ip=178.33.253.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="TBVfq+Oh"
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.140.5])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4Znshb2DQ7z1GPD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:45:19 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-bggcb (unknown [10.111.182.153])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 762311FD63;
	Wed, 30 Apr 2025 22:45:18 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.111])
	by ghost-submission-5b5ff79f4f-bggcb with ESMTPSA
	id rIBXDf6nEmij+wgAhAnCLA
	(envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 30 Apr 2025 22:45:18 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-111S0057806b8b7-35c0-4670-b495-38674cfdb939,
                    7FFE21389DDF989CCD6FB7268846A7FDE11993D7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: linux-kernel@vger.kernel.org
Cc: trenchboot-devel@googlegroups.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [RFC PATCH v2 6/9] x86: Prepare CPUs for post SKINIT launch
Date: Thu,  1 May 2025 01:44:48 +0300
Message-ID: <c9454ff74336571385920563f5c9cce0dfc7e553.1746037489.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
References: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12105394324229108987
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddrudduudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeegmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=O00A8RdNRWNaW2vNZPkGrsXiTUMw9V7ndOmhojSb+LI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1746053119; v=1;
 b=TBVfq+Ohq0rxNWJ5bjI9PDDnSjnSARFA4+vJVSlrIM+DKe+9y+77koDHrfgT0rFXNia14Ue+
 U/xjB8huUlEl70HI29Jnaph2gMqFR/Jn9OBep3yhybSBm0/VTDqNZv9GF73weSTX8NPpDqSQzi3
 VjHv3OmCtKJB8ohSXhwOSD9iG1vmaI1v5WCz5BmN/DJrmXS98yTKq0hCMGRuvj09kqtdgZIZbz4
 tR+seUCeOvfm/O0LoQ03FMHtMY0Vgp2aFbiJRZ6h6CFNWqm2ncYRTgEpRnkeJm9OhVHj4taSquX
 APzYkQPDJvXJZ7Beo/5nHGzu/7wxOvUV5GCCm1H5em+cg==

From: Ross Philipson <ross.philipson@oracle.com>

The SKINIT instruction disables the GIF and it must be re-enabled
on the BSP and APs as they are started. Since enabling GIF also
re-enables NMIs, it should be done after a valid IDT is loaded for
each CPU.

SKINIT also already performed #INIT on the APs and it should be
bypassed before issuing the startup IPIs.

Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 arch/x86/kernel/slaunch.c | 23 +++++++++++++++++++++++
 arch/x86/kernel/smpboot.c | 15 ++++++++++++++-
 arch/x86/kernel/traps.c   |  4 ++++
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/slaunch.c b/arch/x86/kernel/slaunch.c
index 3a031043d2f1..a1c8be7de8d3 100644
--- a/arch/x86/kernel/slaunch.c
+++ b/arch/x86/kernel/slaunch.c
@@ -17,6 +17,7 @@
 #include <asm/sections.h>
 #include <asm/tlbflush.h>
 #include <asm/e820/api.h>
+#include <asm/svm.h>
 #include <asm/setup.h>
 #include <asm/svm.h>
 #include <asm/realmode.h>
@@ -716,3 +717,25 @@ void slaunch_finalize(int do_sexit)
 	else if (boot_cpu_has(X86_FEATURE_SKINIT))
 		slaunch_finalize_skinit();
 }
+
+/*
+ * AMD specific SKINIT CPU setup and initialization.
+ */
+void slaunch_cpu_setup_skinit(void)
+{
+	u64 val;
+
+	if (!slaunch_is_skinit_launch())
+		return;
+
+	/*
+	 * We don't yet handle #SX. Disable INIT_REDIRECTION first, before
+	 * enabling GIF, so a pending INIT resets us, rather than causing a
+	 * panic due to an unknown exception.
+	 */
+	rdmsrl(MSR_VM_CR, val);
+	wrmsrl(MSR_VM_CR, val & ~(1 << SVM_VM_CR_INIT_REDIRECTION));
+
+	/* Enable Global Interrupts flag */
+	asm volatile ("stgi" ::: "memory");
+}
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 219523884fdc..322fa4f8c5df 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -251,6 +251,12 @@ static void notrace __noendbr start_secondary(void *unused)
 
 	cpu_init_exception_handling(false);
 
+	/*
+	 * If this is an AMD SKINIT secure launch, some extra work is done
+	 * to prepare to start the secondary CPUs.
+	 */
+	slaunch_cpu_setup_skinit();
+
 	/*
 	 * Load the microcode before reaching the AP alive synchronization
 	 * point below so it is not part of the full per CPU serialized
@@ -703,7 +709,14 @@ static int wakeup_secondary_cpu_via_init(u32 phys_apicid, unsigned long start_ei
 
 	preempt_disable();
 	maxlvt = lapic_get_maxlvt();
-	send_init_sequence(phys_apicid);
+
+	/*
+	 * If this is an SKINIT secure launch, #INIT is already done on the APs
+	 * by issuing the SKINIT instruction. For security reasons #INIT
+	 * should not be done again.
+	 */
+	if (!slaunch_is_skinit_launch())
+		send_init_sequence(phys_apicid);
 
 	mb();
 
diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index 9f88b8a78e50..0a4d218a426b 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -43,6 +43,7 @@
 #include <linux/atomic.h>
 #include <linux/iommu.h>
 #include <linux/ubsan.h>
+#include <linux/slaunch.h>
 
 #include <asm/stacktrace.h>
 #include <asm/processor.h>
@@ -1564,5 +1565,8 @@ void __init trap_init(void)
 	if (!cpu_feature_enabled(X86_FEATURE_FRED))
 		idt_setup_traps();
 
+	/* If SKINIT was done on the BSP, this is the spot to enable GIF */
+	slaunch_cpu_setup_skinit();
+
 	cpu_init();
 }
-- 
2.49.0

