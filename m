Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF362356A7;
	Tue,  8 Apr 2025 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744134455; cv=none; b=OqXtWYI7vYcXrUA0ZF+/l43of2XeBbMIHOZADmLblUScpiVyIaEgmxL5JgwRPTyDbjUED2HTEnUopDqpsIqQhtAb0t0e1uQasI/IqG9zKU1DkKTqSNn1htzwoKGEWljzFWrenr2daZPDHfAFmtWQISIdSGHKNjn7VvM0jAesLZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744134455; c=relaxed/simple;
	bh=BWm5NjBgp6rpkmB3NqVUxeHZEuJARJjr/NLFM8DMhKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pG7hWQHS1jPf3IEAjAWpO0n4pfA5qBuOOgHzJD2yejw9L5i6murSLam0UiIMKC2vWH18mFA029mE58aN4GSl1EcO0JkSZ+WRdaJf7Ez+wR4IQxaEGzdwgWpn2xxZ+sGKKpTPMGBSnM83U7v+0HlrLLfVYjKIinXw6sfrlv5yFNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnJrA5fU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnJrA5fU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8DAC4CEE9;
	Tue,  8 Apr 2025 17:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744134454;
	bh=BWm5NjBgp6rpkmB3NqVUxeHZEuJARJjr/NLFM8DMhKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AnJrA5fU+bd9JOfAc40z74CvA091mk5uL4RaSSxzTGTXc2ifbnGGCyGp3P2zgui6I
	 pDUxJhAHqBSZ7PlKK9pLmyMI1LVXC5OyHAM3mI4LwQj9jrt8OcA649iDcbsOlUd7vl
	 9img1tilDPfdAm7uuMwGMwJkNh00vvf5337OBIEZnS+FYenB5EpuUqRmTZkEFGdfJ2
	 mmz1n6wdKtQRX7l27di4IhsWLsJQJ6QfeCgK2WGr6iGx08HhVXs+5n6j5G9m2TIHfA
	 xJ2SrexYTqaImExGqnoLnZfYGEqsQ4WOhuUbNX4IdzIbGfYYwE2h4nIUzyDiBdV7b2
	 Poqfz9NFaY87Q==
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
Subject: [PATCH v2 2/2] x86/CPU/AMD: Print the reason for the last reset
Date: Tue,  8 Apr 2025 12:47:26 -0500
Message-ID: <20250408174726.3999817-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408174726.3999817-1-superm1@kernel.org>
References: <20250408174726.3999817-1-superm1@kernel.org>
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
v2:
 * Add string for each reason, but still include value in case multiple
   values are set.
---
 .../admin-guide/amd/amd-reboot-reason.csv     | 21 ++++++
 Documentation/admin-guide/amd/debugging.rst   | 22 ++++++
 arch/x86/kernel/cpu/amd.c                     | 69 +++++++++++++++++++
 3 files changed, 112 insertions(+)
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
index 79569f72b8ee5..af7615ac8f898 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1231,3 +1231,72 @@ void amd_check_microcode(void)
 	if (cpu_feature_enabled(X86_FEATURE_ZEN2))
 		on_each_cpu(zenbleed_check_cpu, NULL, 1);
 }
+
+static inline char *get_s5_reset_reason(u32 value)
+{
+	if (value & BIT(0))
+		return "trip of thermal pin BP_THERMTRIP_L";
+	if (value & BIT(1))
+		return "power button";
+	if (value & BIT(2))
+		return "shutdown pin";
+	if (value & BIT(4))
+		return "remote ASF power off command";
+	if (value & BIT(9))
+		return "internal CPU thermal trip";
+	if (value & BIT(16))
+		return "user reset via BP_SYS_RST_L pin";
+	if (value & BIT(17))
+		return "PCI reset";
+	if (value & BIT(18) ||
+	    value & BIT(19) ||
+	    value & BIT(20))
+		return "CF9 reset";
+	if (value & BIT(21))
+		return "power state of acpi state transition";
+	if (value & BIT(22))
+		return "keyboard reset pin KB_RST_L";
+	if (value & BIT(23))
+		return "internal CPU shutdown";
+	if (value & BIT(24))
+		return "failed boot timer";
+	if (value & BIT(25))
+		return "watchdog timer";
+	if (value & BIT(26))
+		return "remote ASF reset command";
+	if (value & BIT(27))
+		return "data fabric sync flood event due to uncorrected error";
+	if (value & BIT(29))
+		return "MP1 watchdog timer timeout";
+	if (value & BIT(30))
+		return "parity error";
+	if (value & BIT(31))
+		return "software sync flood event";
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
+	pr_info("System was reset due to %s (0x%08x)\n",
+		get_s5_reset_reason(value), value);
+
+	return 0;
+}
+late_initcall(print_s5_reset_status_mmio);
-- 
2.43.0

