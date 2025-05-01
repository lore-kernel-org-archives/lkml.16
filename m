Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17016262FE0;
	Thu,  1 May 2025 21:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135720; cv=none; b=BKePd4tHHXYmTwYEB3mo9H/Cv6GySu1xd2g4dSZFW9h/E4JoW2bRO1qQ3oX8+smoZdO7sivaIchgbuO8wtQkqtd+xvWKq9W4jh2s0eyoWWlYKERpzV+Zw1mhqIgxhPsS2/0jZg8U3OnRHATAR8sr3EN0jUhnZQpJFBirLMJytPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135720; c=relaxed/simple;
	bh=eXtg+nlLZ5QQgTmyAO/7UOrtplNXnw9zciPmPYfJNGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/yvL0NKeMCvzjt62VyRGCmaKRvWuGK28M73/FNzjQ7iydkDmGJixskn1aAg8z9Lz07xM3Ccby0Q1Ze9LpYeFwX0RZqaTO08VsuFRor7Cc/KNLJ+TOaQiz1mu3xIqu/1RkQI8dDzojzvaEGmYgvftDJ5EnLO3arUUwz/k57KFCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT3hvlaE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT3hvlaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AD8C4CEE3;
	Thu,  1 May 2025 21:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746135719;
	bh=eXtg+nlLZ5QQgTmyAO/7UOrtplNXnw9zciPmPYfJNGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IT3hvlaEW1C2T6qrFAIz4OqRQisUOvw44sbkjvO6HfJS9b8gcSoQo7GcQT7A81roZ
	 1nqepx5yNtJztOA3MuGWrpwWxd1xNopiO86qkv3rZRssBLwaY6/NZDbfYwf1oHhxQH
	 8u1vSLEd8SNI1YbLbI0ErWa4oP7bAJFNU76Vb2c+BDr7cmcuwEZWtYNgUkD2zYY20C
	 RcQzzGPencRwvHix/1JgrKXWz2wUFMgu+DlvJtAWeZMBTRbt5OLeEcdNfnuO5m9qm1
	 SkpGIGKwUFKcPvRGL9h33VpmybCxIqErd/qd93cjRzJtuk0q8EoiQRBZHYYIZTO5YZ
	 tPciEla1NT3nQ==
From: Mario Limonciello <superm1@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 2/2] x86/CPU/AMD: Print the reason for the last reset
Date: Thu,  1 May 2025 16:41:47 -0500
Message-ID: <20250501214147.2488164-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250501214147.2488164-1-superm1@kernel.org>
References: <20250501214147.2488164-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yazen Ghannam <yazen.ghannam@amd.com>

The following register contains bits that indicate the cause for the
previous reset.

        PMx000000C0 (FCH::PM::S5_RESET_STATUS)

This is useful for debug. The reasons for reset are broken into 6 high
level categories. Decode it by category and print during boot.

Specifics within a category are split off into debugging documentation.

The register is accessed indirectly through a "PM" port in the FCH. Use
MMIO access in order to avoid restrictions with legacy port access.

Use a late_initcall() to ensure that MMIO has been set up before trying
to access the register.

This register was introduced with AMD Family 17h, so avoid access on
older families. There is no CPUID feature bit for this register.

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v6:
 * Use Boris' suggestion to not print unknown message and not rely
   upon find_next_bit
v4:
 * Use loop that can output multiple reasons
 * Drop "Unknown" condition and have dedicated message
v3:
 * Align strings in the CSV and code.
 * Switch to an array of strings
 * Switch to looking up bit of first value
 * Re-order message to have number first (makes grepping easier)
 * Add x86/amd prefix to message
v2:
 * Add string for each reason, but still include value in case multiple
   values are set.
---
 Documentation/arch/x86/amd-debugging.rst | 41 ++++++++++++++++++
 arch/x86/include/asm/amd/fch.h           |  1 +
 arch/x86/kernel/cpu/amd.c                | 53 ++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
index 9bfc852606c51..d557312a35bee 100644
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -319,3 +319,44 @@ messages.  To help with this, a tool has been created at
 `amd-debug-tools <https://git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools.git/about/>`_
 to help parse the messages.
 
+Random reboot issues
+====================
+When a random reboot occurs, the high-level reason for the reboot is stored
+in a register that will persist onto the next boot.
+
+There are 6 classes of reasons for the reboot:
+ * Software induced
+ * Power state transition
+ * Pin induced
+ * Hardware induced
+ * Remote reset
+ * Internal CPU event
+
+.. csv-table::
+   :header: "Bit", "Type", "Reason"
+   :align: left
+
+   "0",  "Pin",      "thermal pin BP_THERMTRIP_L was tripped"
+   "1",  "Pin",      "power button was pressed for 4 seconds"
+   "2",  "Pin",      "shutdown pin was shorted"
+   "4",  "Remote",   "remote ASF power off command was received"
+   "9",  "Internal", "internal CPU thermal limit was tripped"
+   "16", "Pin",      "system reset pin BP_SYS_RST_L was tripped"
+   "17", "Software", "software issued PCI reset"
+   "18", "Software", "software wrote 0x4 to reset control register 0xCF9"
+   "19", "Software", "software wrote 0x6 to reset control register 0xCF9"
+   "20", "Software", "software wrote 0xE to reset control register 0xCF9"
+   "21", "Sleep",    "ACPI power state transition occurred"
+   "22", "Pin",      "keyboard reset pin KB_RST_L was asserted"
+   "23", "Internal", "internal CPU shutdown event occurred"
+   "24", "Hardware", "system failed to boot before failed boot timer expired"
+   "25", "Hardware", "hardware watchdog timer expired"
+   "26", "Remote",   "remote ASF reset command was received"
+   "27", "Internal", "an uncorrected error caused a data fabric sync flood event"
+   "29", "Internal", "FCH and MP1 failed warm reset handshake"
+   "30", "Internal", "a parity error occurred"
+   "31", "Internal", "a software sync flood event occurred"
+
+This information is read by the kernel at bootup and is saved into the
+kernel ring buffer. When a random reboot occurs this message can be helpful
+to determine the next component to debug such an issue.
diff --git a/arch/x86/include/asm/amd/fch.h b/arch/x86/include/asm/amd/fch.h
index 9b32e8a03193e..4a6e1e3b685a4 100644
--- a/arch/x86/include/asm/amd/fch.h
+++ b/arch/x86/include/asm/amd/fch.h
@@ -9,5 +9,6 @@
 #define FCH_PM_DECODEEN			0x00
 #define FCH_PM_DECODEEN_SMBUS0SEL	GENMASK(20, 19)
 #define FCH_PM_SCRATCH			0x80
+#define FCH_PM_S5_RESET_STATUS		0xC0
 
 #endif
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 2b36379ff675d..9a8c590456d07 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -9,6 +9,7 @@
 #include <linux/sched/clock.h>
 #include <linux/random.h>
 #include <linux/topology.h>
+#include <asm/amd/fch.h>
 #include <asm/processor.h>
 #include <asm/apic.h>
 #include <asm/cacheinfo.h>
@@ -1237,3 +1238,55 @@ void amd_check_microcode(void)
 	if (cpu_feature_enabled(X86_FEATURE_ZEN2))
 		on_each_cpu(zenbleed_check_cpu, NULL, 1);
 }
+
+static const char * const s5_reset_reason_txt[] = {
+	[0] = "thermal pin BP_THERMTRIP_L was tripped",
+	[1] = "power button was pressed for 4 seconds",
+	[2] = "shutdown pin was shorted",
+	[4] = "remote ASF power off command was received",
+	[9] = "internal CPU thermal limit was tripped",
+	[16] = "system reset pin BP_SYS_RST_L was tripped",
+	[17] = "software issued PCI reset",
+	[18] = "software wrote 0x4 to reset control register 0xCF9",
+	[19] = "software wrote 0x6 to reset control register 0xCF9",
+	[20] = "software wrote 0xE to reset control register 0xCF9",
+	[21] = "ACPI power state transition occurred",
+	[22] = "keyboard reset pin KB_RST_L was asserted",
+	[23] = "internal CPU shutdown event occurred",
+	[24] = "system failed to boot before failed boot timer expired",
+	[25] = "hardware watchdog timer expired",
+	[26] = "remote ASF reset command was received",
+	[27] = "an uncorrected error caused a data fabric sync flood event",
+	[29] = "FCH and MP1 failed warm reset handshake",
+	[30] = "a parity error occurred",
+	[31] = "a software sync flood event occurred",
+};
+
+static __init int print_s5_reset_status_mmio(void)
+{
+	unsigned long value;
+	void __iomem *addr;
+	int i;
+
+	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
+		return 0;
+
+	addr = ioremap(FCH_PM_BASE + FCH_PM_S5_RESET_STATUS, sizeof(value));
+	if (!addr)
+		return 0;
+
+	value = ioread32(addr);
+	iounmap(addr);
+
+	for (i = 0; i <= ARRAY_SIZE(s5_reset_reason_txt); i++) {
+		if (!(value & BIT(i)))
+			continue;
+
+		if (s5_reset_reason_txt[i])
+			pr_info("x86/amd: Previous system reset reason [0x%08lx]: %s\n",
+				value, s5_reset_reason_txt[i]);
+	}
+
+	return 0;
+}
+late_initcall(print_s5_reset_status_mmio);
-- 
2.43.0

