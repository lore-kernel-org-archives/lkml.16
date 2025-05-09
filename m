Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867E02367B1
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808137; cv=fail; b=OtLCk0ywc1Q9rnm90EFEgV0ObLwnkK27Jm3Ook8DKklkdU7rv2Xekvcjr5E2iRku8kQxt//pzrozi4umRvqIWbMkJzXdI/ty8KXQG2jOQKRroueaCQU3M7nzTcRoTC/rFiC0nGj9DeEnp79It3rwkv+kG3UAlOPbp5MSUtr1Bis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808137; c=relaxed/simple;
	bh=jYcssKKBXnZTUIw5OqYH9PKS0jdygOWEc3YSudjHe2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JB2ghj+B/QT2UMHxgHcbbouB6QgTN/St+dmErJaNC4++rIWsTpdUbe9ihKuEVQ9cwzkztPMgEuYOogYx9NXfEd6lasf7ocV1/HAiFkjB88fikcuyzqv1YBQE4PIFOK24bvW+6kfv7+tYws9d2ter0eWk3pbGOf2YTSbnRYo1gH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LxHljjBM; arc=fail smtp.client-ip=40.107.92.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LxHljjBM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvgeMQkVA0JnOQr1C0B8AE2rmUtDDYW8JJS12n8tGyLm4jxGdQwvoPNFG0Kwx5wQDnBzcffWSZ+iH81y2uCFd2vjeKkye3zuiK9n5oIQujHeT1PY7zKyR+2RqWMFts8C+P3cTWg0hMvfD+KTZ2PXWDw1w2Zm4fOJyF4ZGJEW590XHB74w+TQCPWmFNT8J2BqPiz4EJvrvcnyy+RGHqdElOMcEcdvWUlgHdrqecWWcZY7SA16QC9lh816NqcgqqHI4j0pT/0ZWlpvcK+r7RZWlWPh42j7VAipkkblGActTrQ83wxNiJNm+5+rX4oryB0D8dwZN0Qhbw64aYjBwFocwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvD1aVn2SBy0hpGCh8CWS+D+NofeJTTE2OS4zMeoulc=;
 b=Txvj0ZNSlxDLZEI13ZKYnkK5oOn0aPzswpL5kezc8cRKccVDlDOY7tOZMemaLe602SySEmSF6o5VtLY2lqd/CC59+bOxWSzzL9wik7xMcyqsrTcQudh6qq76h3B14Ge2FZxMSS7QaSnwKzaPCztPE09yQ5i3AdrXxHFEP0EyPHFi/5TdWkyh/x1V5IdctAnftb+zLBXCd/5Cw6Ah4X0Nkb6tByCfhB9yfv3Jy5/o5TnOjjcNVnVdPOHXSWX8lymbLoMmiYE+5GxwjiRElSuU29hKcFz/TUZLbf/eWCk4/jYsB5vgYq7xiI+RvMWwiXB5dJvfUyKlbJZy3PM/14Wa+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvD1aVn2SBy0hpGCh8CWS+D+NofeJTTE2OS4zMeoulc=;
 b=LxHljjBMoJe0mKu+gxqZdoTuFNnrqCv2K1gHJG6oPiNnm3scFAY23hzP9T/gDELSLF1eIiux238HF5tuRsV5Htw8Ik/eBOKiJABI8+xK4DEEThCtXapL+SB5PZQ7uPpoOmsDxXYW0wSuX6Ru3NLeZFYTEXnAcrPS1x49QFandAU=
Received: from BL1PR13CA0111.namprd13.prod.outlook.com (2603:10b6:208:2b9::26)
 by MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 16:28:51 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::4b) by BL1PR13CA0111.outlook.office365.com
 (2603:10b6:208:2b9::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Fri,
 9 May 2025 16:28:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:50 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:49 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 01/20] Documentation/x86: Document new attack vector controls
Date: Fri, 9 May 2025 11:28:20 -0500
Message-ID: <20250509162839.3057217-2-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509162839.3057217-1-david.kaplan@amd.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|MW3PR12MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: be62daf6-b6dc-4d08-1dcc-08dd8f1694f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yD2FYX3b5J2SmRLAA+IT2KdQExE8UvGzC6NXUbIl6Bxw1GZaJBI1p9YWWYMp?=
 =?us-ascii?Q?mprol5NsZbpq8fhyRvIrDVw9fvZR8Hxbr4YWniFxQSPjI239BIkCx2LVd8kV?=
 =?us-ascii?Q?jSlKJahVRlcdKXiilka2S4rmDXzW0yJSRsD8cd9iHVxaeVhYtKP+Z4HWv+Tu?=
 =?us-ascii?Q?MR4J4745GGLeCaj+ehvo0iz8FWZsHpSgp3KgrJlXYKH75S85uGXbcsSsJQbE?=
 =?us-ascii?Q?9OaJpzyDWKBqrMY9G6O2ZkA+1zo26Pzv6M+PYp2QJOj/yrL3DCeDqe+RPVvl?=
 =?us-ascii?Q?rDDtTdzTdSBOn1DMlFkf4D8U7gZM2TNv0xjnjn9JaS9829c1bVp7wSvbMgjN?=
 =?us-ascii?Q?x2bh+Z1UZ60e4p/W0R3nxX3PnlcX86Jwm6IvZ0Xl77tNWuBlflRpSYUsuasK?=
 =?us-ascii?Q?sbp0vUz6amrT7DyMMR1oYwX61bdvIeTdWtf8imXOvvc/2rmTiVAArbc/5bj/?=
 =?us-ascii?Q?RbXtPAlRY+vH1KObtVKKhddnN9dxSPLcFXL9S3A4pdL/WH+NQbBJLsKgeOpy?=
 =?us-ascii?Q?Dz8KhLg11iYzEvblOjTA5toFL35kFP6eX2st/gvG01mFdTU6DZZSqGj4cG0G?=
 =?us-ascii?Q?BkNxZkwa4Wz3oL5i3+nPiNTf/lqNaDaA9qVVYrNr4hac0DRF8p9XxpgGrj76?=
 =?us-ascii?Q?EpWHwEY9f1pD3Zb+JX8+CYaMkiPDJe3aiaKxsDDYWQwejlGRvDcG1N0c6uNE?=
 =?us-ascii?Q?efRj5wnHG7e3Y56lLxytB6eheg7CdLQSosdC1XdNiGMYwm13DYhR1D/N+YC6?=
 =?us-ascii?Q?qw9IsxWDPv7cgDTu9j8LwK13uBFBAyEAhD0vUf47dwB26lEmV9zFn8B8E78t?=
 =?us-ascii?Q?qrtTVV8AaTn+D/RIfdV3+HknXLHdYmoOo3CtsTlPBMYQ/WUiLZ/wGe9cKMjT?=
 =?us-ascii?Q?IFPJ5M/B26jLyQDm2SQMG6+sMOr7LiR70IPZmPesAhw4FMsDvi0rrMYA6vEI?=
 =?us-ascii?Q?27qqg1sfjEhH9zaelfYCzFfqJmUmCjFsKANxWIWgE/lVgZfAxgPwEJO+PD+U?=
 =?us-ascii?Q?2TSLhFcY9R2dEwOkYnDBarRrPnXE6dzhnneDexZRhptvTv+yoDBANDmshDts?=
 =?us-ascii?Q?6hLZHljrbnNn+sX6MdLQuKJ4RrETJcKggWfHx0wTbhMXz/cetfuIMCnsexSp?=
 =?us-ascii?Q?roWETcFxvu44xs7ZE7Dtu7ojwGwt+qBXq/3v/MTh6RMd6mxf3gM6NioD90fK?=
 =?us-ascii?Q?fcx8S6iUt52mTrXzkVPfyThvN5XGxutCTd6Ewx0/kD/0dqO9yWdi1WTeaeVn?=
 =?us-ascii?Q?cq76n7t6e/f8i/w9fGsGADD9U55IEC+9GOkrg1u7f8Zeww8h+Q5/E55cUnsE?=
 =?us-ascii?Q?xpf8Dpu75dUGpFyjNpbWgt1Cw0aIRpKZQWm3t4EjWw4jN4RcBVt7NtO/vx54?=
 =?us-ascii?Q?RdLd1i0LqXQTeSbfeMfq87GdERiBFZ/AmY7YLHYDXaKqGQacA1sQhzIWAvir?=
 =?us-ascii?Q?TJ38Y1smk4nHxfOi/SwWhxGfyD0plG4GBZnI6yCNj6nJ5YTWYJVkY9XvAdHM?=
 =?us-ascii?Q?XNx6EkX6kyHasRNDtO7p2VcBpKxACIf5nCF9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:50.7309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be62daf6-b6dc-4d08-1dcc-08dd8f1694f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4475

Document the 5 new attack vector command line options, how they
interact with existing vulnerability controls, and recommendations on when
they can be disabled.

Note that while mitigating against untrusted userspace requires both
user-to-kernel and user-to-user protection, these are kept separate.  The
kernel can control what code executes inside of it and that may affect the
risk associated with vulnerabilities especially if new kernel mitigations
are implemented.  The same isn't typically true of userspace.

In other words, the risk associated with user-to-user or guest-to-guest
attacks is unlikely to change over time.  While the risk associated with
user-to-kernel or guest-to-host attacks may change.  Therefore, these
controls are separated.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 .../hw-vuln/attack_vector_controls.rst        | 236 ++++++++++++++++++
 Documentation/admin-guide/hw-vuln/index.rst   |   1 +
 .../admin-guide/kernel-parameters.txt         |   4 +
 3 files changed, 241 insertions(+)
 create mode 100644 Documentation/admin-guide/hw-vuln/attack_vector_controls.rst

diff --git a/Documentation/admin-guide/hw-vuln/attack_vector_controls.rst b/Documentation/admin-guide/hw-vuln/attack_vector_controls.rst
new file mode 100644
index 000000000000..d4ab8b3fe52e
--- /dev/null
+++ b/Documentation/admin-guide/hw-vuln/attack_vector_controls.rst
@@ -0,0 +1,236 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Attack Vector Controls
+======================
+
+Attack vector controls provide a simple method to configure only the mitigations
+for CPU vulnerabilities which are relevant given the intended use of a system.
+Administrators are encouraged to consider which attack vectors are relevant and
+disable all others in order to recoup system performance.
+
+When new relevant CPU vulnerabilities are found, they will be added to these
+attack vector controls so administrators will likely not need to reconfigure
+their command line parameters as mitigations will continue to be correctly
+applied based on the chosen attack vector controls.
+
+Attack Vectors
+--------------
+
+There are 5 sets of attack-vector mitigations currently supported by the kernel:
+
+#. :ref:`user_kernel`
+#. :ref:`user_user`
+#. :ref:`guest_host`
+#. :ref:`guest_guest`
+#. :ref:`smt`
+
+To control the enabled attack vectors, see :ref:`cmdline`.
+
+.. _user_kernel:
+
+User-to-Kernel
+^^^^^^^^^^^^^^
+
+The user-to-kernel attack vector involves a malicious userspace program
+attempting to leak kernel data into userspace by exploiting a CPU vulnerability.
+The kernel data involved might be limited to certain kernel memory, or include
+all memory in the system, depending on the vulnerability exploited.
+
+If no untrusted userspace applications are being run, such as with single-user
+systems, consider disabling user-to-kernel mitigations.
+
+Note that the CPU vulnerabilities mitigated by Linux have generally not been
+shown to be exploitable from browser-based sandboxes.  User-to-kernel
+mitigations are therefore mostly relevant if unknown userspace applications may
+be run by untrusted users.
+
+*user-to-kernel mitigations are enabled by default*
+
+.. _user_user:
+
+User-to-User
+^^^^^^^^^^^^
+
+The user-to-user attack vector involves a malicious userspace program attempting
+to influence the behavior of another unsuspecting userspace program in order to
+exfiltrate data.  The vulnerability of a userspace program is based on the
+program itself and the interfaces it provides.
+
+If no untrusted userspace applications are being run, consider disabling
+user-to-user mitigations.
+
+Note that because the Linux kernel contains a mapping of all physical memory,
+preventing a malicious userspace program from leaking data from another
+userspace program requires mitigating user-to-kernel attacks as well for
+complete protection.
+
+*user-to-user mitigations are enabled by default*
+
+.. _guest_host:
+
+Guest-to-Host
+^^^^^^^^^^^^^
+
+The guest-to-host attack vector involves a malicious VM attempting to leak
+hypervisor data into the VM.  The data involved may be limited, or may
+potentially include all memory in the system, depending on the vulnerability
+exploited.
+
+If no untrusted VMs are being run, consider disabling guest-to-host mitigations.
+
+*guest-to-host mitigations are enabled by default if KVM support is present*
+
+.. _guest_guest:
+
+Guest-to-Guest
+^^^^^^^^^^^^^^
+
+The guest-to-guest attack vector involves a malicious VM attempting to influence
+the behavior of another unsuspecting VM in order to exfiltrate data.  The
+vulnerability of a VM is based on the code inside the VM itself and the
+interfaces it provides.
+
+If no untrusted VMs, or only a single VM is being run, consider disabling
+guest-to-guest mitigations.
+
+Similar to the user-to-user attack vector, preventing a malicious VM from
+leaking data from another VM requires mitigating guest-to-host attacks as well
+due to the Linux kernel phys map.
+
+*guest-to-guest mitigations are enabled by default if KVM support is present*
+
+.. _smt:
+
+Cross-Thread
+^^^^^^^^^^^^
+
+The cross-thread attack vector involves a malicious userspace program or
+malicious VM either observing or attempting to influence the behavior of code
+running on the SMT sibling thread in order to exfiltrate data.
+
+Many cross-thread attacks can only be mitigated if SMT is disabled, which will
+result in reduced CPU core count and reduced performance.
+
+If cross-thread mitigations are fully enabled ('auto,nosmt'), all mitigations
+for cross-thread attacks will be enabled.  SMT may be disabled depending on
+which vulnerabilities are present in the CPU.
+
+If cross-thread mitigations are partially enabled ('auto'), mitigations for
+cross-thread attacks will be enabled but SMT will not be disabled.
+
+If cross-thread mitigations are disabled, no mitigations for cross-thread
+attacks will be enabled.
+
+Cross-thread mitigation may not be required if core-scheduling or similar
+techniques are used to prevent untrusted workloads from running on SMT siblings.
+
+*cross-thread mitigations default to partially enabled*
+
+.. _cmdline:
+
+Command Line Controls
+---------------------
+
+Attack vectors are controlled through the mitigations= command line option.  The
+value provided begins with a global option and then may optionally include one
+or more options to disable various attack vectors.
+
+Format:
+	| ``mitigations=[global]``
+	| ``mitigations=[global];[attack vectors]``
+
+Global options:
+
+============ =============================================================
+Option       Description
+============ =============================================================
+'off'        All attack vectors disabled.
+'auto'       All attack vectors enabled, partial cross-thread mitigations.
+'auto,nosmt' All attack vectors enabled, full cross-thread mitigations.
+============ =============================================================
+
+Attack vector options:
+
+================= =======================================
+Option            Description
+================= =======================================
+'no_user_kernel'  Disables user-to-kernel mitigations.
+'no_user_user'    Disables user-to-user mitigations.
+'no_guest_host'   Disables guest-to-host mitigations.
+'no_guest_guest'  Disables guest-to-guest mitigations
+'no_cross_thread' Disables all cross-thread mitigations.
+================= =======================================
+
+Multiple attack vector options may be specified in a comma-separated list.  If
+the global option is not specified, it defaults to 'auto'.  The global option
+'off' is equivalent to disabling all attack vectors.
+
+Examples:
+	| ``mitigations=auto;no_user_kernel``
+
+	Enable all attack vectors except user-to-kernel.  Partial cross-thread
+	mitigations.
+
+	| ``mitigations=auto,nosmt;no_guest_host,no_guest_guest``
+
+	Enable all attack vectors and cross-thread mitigations except for
+	guest-to-host and guest-to-guest mitigations.
+
+	| ``mitigations=;no_cross_thread``
+
+	Enable all attack vectors but not cross-thread mitigations.
+
+Interactions with command-line options
+--------------------------------------
+
+Vulnerability-specific controls (e.g. "retbleed=off") take precedence over all
+attack vector controls.  Mitigations for individual vulnerabilities may be
+turned on or off via their command-line options regardless of the attack vector
+controls.
+
+Summary of attack-vector mitigations
+------------------------------------
+
+When a vulnerability is mitigated due to an attack-vector control, the default
+mitigation option for that particular vulnerability is used.  To use a different
+mitigation, please use the vulnerability-specific command line option.
+
+The table below summarizes which vulnerabilities are mitigated when different
+attack vectors are enabled and assuming the CPU is vulnerable.
+
+=============== ============== ============ ============= ============== ============ ========
+Vulnerability   User-to-Kernel User-to-User Guest-to-Host Guest-to-Guest Cross-Thread Notes
+=============== ============== ============ ============= ============== ============ ========
+BHI                   X                           X
+GDS                   X              X            X              X            *       (Note 1)
+L1TF                  X                           X                           *       (Note 2)
+MDS                   X              X            X              X            *       (Note 2)
+MMIO                  X              X            X              X            *       (Note 2)
+Meltdown              X
+Retbleed              X                           X                           *       (Note 3)
+RFDS                  X              X            X              X
+Spectre_v1            X
+Spectre_v2            X                           X
+Spectre_v2_user                      X                           X            *       (Note 1)
+SRBDS                 X              X            X              X
+SRSO                  X                           X
+SSB                                                                                   (Note 4)
+TAA                   X              X            X              X            *       (Note 2)
+=============== ============== ============ ============= ============== ============ ========
+
+Notes:
+   1 --  Can be mitigated without disabling SMT.
+
+   2 --  Disables SMT if cross-thread mitigations are fully enabled  and the CPU
+   is vulnerable
+
+   3 --  Disables SMT if cross-thread mitigations are fully enabled, the CPU is
+   vulnerable, and STIBP is not supported
+
+   4 --  Speculative store bypass is always enabled by default (no kernel
+   mitigation applied) unless overridden with spec_store_bypass_disable option
+
+When an attack-vector is disabled, all mitigations for the vulnerabilities
+listed in the above table are disabled, unless mitigation is required for a
+different enabled attack-vector or a mitigation is explicitly selected via a
+vulnerability-specific command line option.
diff --git a/Documentation/admin-guide/hw-vuln/index.rst b/Documentation/admin-guide/hw-vuln/index.rst
index cf1511145927..11a3d0240c66 100644
--- a/Documentation/admin-guide/hw-vuln/index.rst
+++ b/Documentation/admin-guide/hw-vuln/index.rst
@@ -9,6 +9,7 @@ are configurable at compile, boot or run time.
 .. toctree::
    :maxdepth: 1
 
+   attack_vector_controls
    spectre
    l1tf
    mds
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4568572205ee..f02993bc5b02 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3737,6 +3737,10 @@
 					       mmio_stale_data=full,nosmt [X86]
 					       retbleed=auto,nosmt [X86]
 
+			[X86] After one of the above options, additionally
+			supports attack-vector based controls as documented in
+			Documentation/admin-guide/hw-vuln/attack_vector_controls.rst
+
 	mminit_loglevel=
 			[KNL,EARLY] When CONFIG_DEBUG_MEMORY_INIT is set, this
 			parameter allows control of the logging verbosity for
-- 
2.34.1

