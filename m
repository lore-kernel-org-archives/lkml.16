Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE12F28;
	Mon,  7 Apr 2025 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043140; cv=none; b=PB5WmUGvG4KzxBeVzv5Fzd4ctKdTJ8SI07msbhhLDkLzv9mx5jX2XJ9G/cdLeOx9sUPJnN84A5HDi/KcU4rERUv2ELP/Ulc/zr6+qKRUsVG7YcsTsfuLEeBp5gdPKIxaeMw7JPFO1wsPbMP0m4Omu4HYeovhfG7llY+r1aRHtJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043140; c=relaxed/simple;
	bh=+94DxqlitMbLGB+wlBBsY6tpDWszgaemr9JBqu5sx9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zh1K23Gd+J7WKvXMwGlAV55NqYbWXmCKkosadLGPQzx8kgKWThCx4Kjpd1QWSu4PVG+kLOz/h5sj5HNLnO+q6sJD6pzzNR6DfHj+GHfk7vyBDk+VcY+vZLq209Q9m+9PoC2XC9AnXpFuMunDQ1I8EBI3INgA5yPtywg7WG4G9AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaTx24va; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaTx24va"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F24C4CEEA;
	Mon,  7 Apr 2025 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744043140;
	bh=+94DxqlitMbLGB+wlBBsY6tpDWszgaemr9JBqu5sx9o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QaTx24vau/y+2epVhQFbs+0pPGYp7fzQLmHDCI4y3eS71ZWAMos3FS3SrOezyovB3
	 9aUdecMvGLbNsRNdflLkKrYUVCKpLDWbqDpei/rRVCNIR0iF3dg3/WFLK/vsi1fLdk
	 IQ6Wyh9ke+Swtiv4SKvbIN3aJQ+YwJXUpxyCgH9HyDogmXCZtuEuVrzZTG6AGQmsE/
	 80LdPgX4ZKK7fRUvCzwcBju8Qk5DLRfWoFUQaRrNTkhRr/iSwj0yICTMDXNFqSZj4I
	 yfAhQfQD1zuiOT9N3Q0NUu4p9gueqwaI2bHIudE5FVqDqhfia4oLXTRPIoGEsLz7OU
	 EVGf77dC9VonA==
From: Mario Limonciello <superm1@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H . Peter Anvin" <hpa@zytor.com>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 2/2] x86/CPU/AMD: Print the reason for the last reset
Date: Mon,  7 Apr 2025 11:25:25 -0500
Message-ID: <20250407162525.1357673-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407162525.1357673-1-superm1@kernel.org>
References: <20250407162525.1357673-1-superm1@kernel.org>
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
 .../admin-guide/amd/amd-reboot-reason.csv     | 21 ++++++++
 Documentation/admin-guide/amd/debugging.rst   | 22 ++++++++
 arch/x86/kernel/cpu/amd.c                     | 50 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 Documentation/admin-guide/amd/amd-reboot-reason.csv

diff --git a/Documentation/admin-guide/amd/amd-reboot-reason.csv b/Documentation/admin-guide/amd/amd-reboot-reason.csv
new file mode 100644
index 0000000000000..c31c7a0464c38
--- /dev/null
+++ b/Documentation/admin-guide/amd/amd-reboot-reason.csv
@@ -0,0 +1,21 @@
+Bit, Type, Reason
+0, Pin, Thermal trip (BP_THERMTRIP_L)
+1, Pin, Power button
+2, Pin, SHUTDOWN# pin
+4, Remote, Remote ASF power off command
+9, Internal, Thermal trip (internal)
+16, Pin, User reset (BP_SYS_RST_L)
+17, Software, PCI reset (PMIO 0xC4)
+18, Software, CF9 reset (0x04)
+19, Software, CF9 reset (0x06)
+20, Software, CF9 reset (0x0E)
+21, Sleep, Power state or ACPI state transition
+22, Pin, Keyboard reset (KB_RST_L)
+23, Internal, Internal CPU shutdown
+24, Hardware, Failed boot timer
+25, Hardware, Watchdog timer
+26, Remote, Remote ASF reset command
+27, Internal, Data fabric sync flood event due to uncorrected error
+29, Internal, MP1 Watchdog timer timeout
+30, Internal, Parity error
+31, Internal, SW sync flood event
\ No newline at end of file
diff --git a/Documentation/admin-guide/amd/debugging.rst b/Documentation/admin-guide/amd/debugging.rst
index 5a721ab4fe013..2a966f0ead26a 100644
--- a/Documentation/admin-guide/amd/debugging.rst
+++ b/Documentation/admin-guide/amd/debugging.rst
@@ -268,3 +268,25 @@ EPP Policy
 The ``energy_performance_preference`` sysfs file can be used to set a bias
 of efficiency or performance for a CPU.  This has a direct relationship on
 the battery life when more heavily biased towards performance.
+
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
+   :header-rows: 1
+   :widths: 1, 1, 1
+   :file: ./amd-reboot-reason.csv
+
+This information is read by the kernel at bootup and is saved into the
+kernel ring buffer. When a random reboot occurs this message can be helpful
+to determine the next component to debug such an issue.
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 79569f72b8ee5..bb187c46a6a71 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1231,3 +1231,53 @@ void amd_check_microcode(void)
 	if (cpu_feature_enabled(X86_FEATURE_ZEN2))
 		on_each_cpu(zenbleed_check_cpu, NULL, 1);
 }
+
+#define PIN_RESET	(BIT(0) | BIT(1) | BIT(2) | BIT(16) | BIT(22))
+#define REMOTE_RESET	(BIT(4) | BIT(26))
+#define INTERNAL_RESET	(BIT(9) | BIT(23) | BIT(27) | BIT(29) | BIT(30) | BIT(31))
+#define SW_RESET	(BIT(17) | BIT(18) | BIT(19) | BIT(20))
+#define HW_RESET	(BIT(24) | BIT(25))
+#define SLEEP_RESET	(BIT(21))
+
+static inline char *get_s5_reset_reason(u32 value)
+{
+	if (value & SW_RESET)
+		return "software";
+	if (value & SLEEP_RESET)
+		return "power state transition";
+	if (value & PIN_RESET)
+		return "pin state change";
+	if (value & HW_RESET)
+		return "hardware";
+	if (value & REMOTE_RESET)
+		return "remote power event";
+	if (value & INTERNAL_RESET)
+		return "internal CPU error";
+	return "unknown reason";
+}
+
+static __init int print_s5_reset_status_mmio(void)
+{
+	void __iomem *addr;
+	u32 value;
+
+	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
+		return 0;
+
+	/*
+	 * FCH::PM::S5_RESET_STATUS
+	 * PM Base = 0xFED80300
+	 * S5_RESET_STATUS offset = 0xC0
+	 */
+	addr = ioremap(0xFED803C0, sizeof(value));
+	if (!addr)
+		return 0;
+	value = ioread32(addr);
+	iounmap(addr);
+
+	pr_info("System reset was due to %s (0x%08x)\n",
+		get_s5_reset_reason(value), value);
+
+	return 0;
+}
+late_initcall(print_s5_reset_status_mmio);
-- 
2.43.0

