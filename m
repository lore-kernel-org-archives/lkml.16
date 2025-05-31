Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2125.outbound.protection.outlook.com [40.107.223.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27909151985
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 02:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748659594; cv=fail; b=s4uhdfWmRbYnC2mFuU6Rz0JK81mwFVYnXstPayGhLC6yc3eG7w1b05UPQHs1s4yNGiE9/RaPsxpRknw5ggdIdulGJFi7Ua32OXDl0GoCxArJZr/Cm77qAp7mx1QaWXoK1V4C6nAOBtt3IycmdSrx3AhNfemjlovOzmuSl+RJuiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748659594; c=relaxed/simple;
	bh=/a+woRAUa/adTLeD95LlY3jIcFpAfpjKgBdw28QCASM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JrhEfQJpkiKBHwEoD6PPYyHOrejMlJSKB29pXgokLPhZ3Igjv9cu4o68xs0LKdfLj/EgG0cyA+fFfOkHXm/sbSqCTkEEcFMJYisRypwWM09sa58P/yjaoe9cyxQtwM1EH4PpY8gH69Q3rWsqjUOva93z9dPlJVzmQegYakDvlSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=BaUjgI8y; arc=fail smtp.client-ip=40.107.223.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="BaUjgI8y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yU3SSl9nAp55XUU8t7m/CuNOtrn+h1O+zc6rllRi4jGJLlp5P9wmAXmpuRU4Zk+EsQb05LedgyM0CAruTMzzu7T5bPOsjMVw7wx/EbmLHc653OizVpSOWSdjE6oRpATCMLV2F96LPDcgkMaxJqfpnf5gqkXr6oAfkL6P/LQ9+pEAfy0c7A4XxH2u74Hp9nljwMU85UynskEFu+z2uWQThc9qT8Ae7J9c6F5jhYppK7QPvV5Ga6uRi/2chH3V6PB3nPpYc/mhroveMJMnhwhK0QPzMloJGdi2YboaOczmszlQ17Pwrl4CkcDlA0lAU12lczkq4nv8CIjZs8NFhattVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hdaU4qAj7KfXSEvI3ZktRssDqTg9Rc3Fto0Nrb6oW4=;
 b=jfwCkvw/srPFc+0aeE0D6eHIFlsd+pBlHgA7rd+WMAVKR7u1obGdC/vjSwhWoQ0NSPuKc0GfGAGDMmV4hQ2wYPImryNHxqx236AqPmvgzOQFIErxsw4vkIeP+/Ju/JSl6NDIxpT4xC6TtycgsqLxO9mZfyioIJTqsPvikKEQLmsPU1QK56mD24wKru5GF12f+Tzf8P4T12TNDMmEMUNeHJKKxwUG/CwKoykDjOB+uUHCprRp0ATQK3Y8y4Lab4n7eNN5KMEOu2cdiWNDLwKcyWoolk5NXxLUXU3RtPN7XQo3fROPyyHODowVY9jtggzg41amE+z3tc3Yl/ebKbQ8+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hdaU4qAj7KfXSEvI3ZktRssDqTg9Rc3Fto0Nrb6oW4=;
 b=BaUjgI8yOU8u8bS0Bv1z2h8UywNHBzFPmWfIRHIfnX07wnNh+MZh3WJf7q1C7bSVilgZOVzJlGoXCgjuwcP1fFt0og1vEB0c033qXG0xoX68k8CUvQxJBS/pqKaz7FPzl0EyyEFwRe8rndTPzMaapeBojwp+uXjGoUFv0bxiEFo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7551.prod.exchangelabs.com (2603:10b6:408:17d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Sat, 31 May 2025 02:46:24 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Sat, 31 May 2025
 02:46:24 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	Miko.Lenczewski@arm.com,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: mm: split linear mapping if BBML2 is not supported on secondary CPUs
Date: Fri, 30 May 2025 19:41:54 -0700
Message-ID: <20250531024545.1101304-5-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531024545.1101304-1-yang@os.amperecomputing.com>
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR22CA0079.namprd22.prod.outlook.com
 (2603:10b6:930:80::26) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV2PR01MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d347729-a9e7-4bb8-6471-08dd9fed5523
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?85oMLblO6J0Q1pNV7Z3MDlB+6ygpFhAm68XwLa2j5H0l0uha5V9qSi1z3ihi?=
 =?us-ascii?Q?Dfg5/wDPSIFLk59E7xK8wXAwGb4RJ4NwgHG110pdWo2m+c3eKiFqAkiYdaE0?=
 =?us-ascii?Q?6DMaGLeN3OfR/DIyzyirocn+6qLmnQdSn0LNlGVzka3db/w+jAmx7LWSwXPJ?=
 =?us-ascii?Q?j/1e4NB2hrsLq8a9rhXVb4Ym3cEhRiRUDL2vIJaDoph6OIeIZC6Q8vfbl6AD?=
 =?us-ascii?Q?jOm4d4oM7LLnnMeOOY4wTzoU4VfpCK+IjzwpnnxAl0rFoZWYYZbyBwdfoO+D?=
 =?us-ascii?Q?FFQvAp6rCnrO1FKmRP+p4nEb68XDua8Ic9X/IqokQo+ghYGRGmkLeRBRG0YC?=
 =?us-ascii?Q?MV+CjujZgXnvHo3FT4nrUL/7SVdyzlqRwhqWp6SVFOpe9Glge0AmGE7xSk8/?=
 =?us-ascii?Q?KjptOoP0WqZbDzTIV3vUdMxqI7Okfnr6PwsJu2hPb4slRPVS9RVzU+XtDdMV?=
 =?us-ascii?Q?BI9RNE2DvZlchTRpwd5zIxqspnGBw4kX8/B51YAfm/ShT1TOauusDPPg3EZV?=
 =?us-ascii?Q?x7DGUf4PFJVR6E+QT4EbW713Jc0M+VEqgDdX03m6y//SfGUj3ylI/IKcLAHa?=
 =?us-ascii?Q?ZUh/235TL/ZW7jvmk6G/TpbKl6BKNicm21kQrrZ66K3iohCV/dC+5caUeeAe?=
 =?us-ascii?Q?LlbRGmWgeFI7IO3t8CFfYnkE1SCDArC5lE16cXpMYzXisLdFQEPz9VDo7bYN?=
 =?us-ascii?Q?mdWeiFg7S2wUyWXERcKIQei/GSiCcwRSUSiymzp8oZemddSEmDeB7D9KqDGW?=
 =?us-ascii?Q?TlIbQolqbAjZRUKCnib/b6s1HEpk0pRoBvXT+PmCq9fKCUgOScU0OnioJuBr?=
 =?us-ascii?Q?m/xUHJl26L3CIpm35/sU5hh20HNI4Ocix4kKacFy0d4Gs4JbgWd6aTshhSWG?=
 =?us-ascii?Q?bCbyOnizpnXOpborg2GsSEFdyk3AXNHBvuPOjzQQMJPPcHmIhySkPZD2xxzB?=
 =?us-ascii?Q?3Af/eX4kbyUiZbqGQv2CkDSVpGWnDVuoihVofux17jnhV0XHyCpd60xQn1od?=
 =?us-ascii?Q?RLhWx15Z6G/KBE8Oqh6TzR8UQN5fQlajEAZ9E0sA88vukf1/0vyJCJcgWv32?=
 =?us-ascii?Q?wxYwn5BYKlKBoj4iBaZBew3hKYwdmeV3nunAm6oJvVQGZBkZWU6IOvLNQHFS?=
 =?us-ascii?Q?Uw9/pRG061KQRdqF4aoJ8Xd1BkoZFXK1VAVYQhlYNnvBRPZ5aXMtscxVljt7?=
 =?us-ascii?Q?SSXEy6XkaEFCS/37tqgJ6efmjrZ9anEsybvaS8wk7amzs6CIq5aZlYVj0JKs?=
 =?us-ascii?Q?jRPmprcmcmrjKel4GMxy8r9HTTskLsGUIrhUSPs6Q9wNCKBdJ0hDy9XX/cex?=
 =?us-ascii?Q?rWhIdAT+5QmbWvPnl3Qmyk4L+8QzYskhkEZD3IzM5x2sRxwB8DuYpRSnDkey?=
 =?us-ascii?Q?ZMr5uNw+CS8t2AHs/QldbVXGK1Z1riY8orZfW7UFVamEInwbz+i9Bez4V6RR?=
 =?us-ascii?Q?2eDggmMc6tfLWVnx1xOXCVXn+F9qQxGlnb0FGlbudaL0wl5Tj2rl9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Ds1ETskWE6WB1jhKlHTboyL0muCWEZG143C27w2XPWY4WMPcFZgjRQDyN3a?=
 =?us-ascii?Q?siyPKV77iK420kq3i9HS+zFdZKmpQVQFmL/FkRkOZNLuEhxqVt//tkb0HpiI?=
 =?us-ascii?Q?kgJkVC84gpL6W7TXQ6pj2JuWWaDfLEadsXIwgIy4+F1ZzJL12vTubfYGQ3h9?=
 =?us-ascii?Q?uWrP8xy05bBkL7zV0D1Ox/n2pI7nqPQCK/AB022IlYfEwuXHzliJWlQOdP38?=
 =?us-ascii?Q?vALxRN5jGr5Wb3E7jVx1iwXl+u8nwC41H+qhk52/8/L/QAR0uGKCMCZYsZtO?=
 =?us-ascii?Q?4d2NQGV4k69RdKNMyn0CQ6J15LuXurZJCg9reaGz0I8L5vE25j1cyWLr4I0k?=
 =?us-ascii?Q?kchr4ISHTJgTBT9i9oREgj8TdaM4poUqXDk2STx4TBAv1Cb/c3K3D7JNuz3j?=
 =?us-ascii?Q?O1M38MZTFDmpd+jhTqzxLSExCr4vmJk3pkeus0K+GeYfczuvTzKBnNB62WwP?=
 =?us-ascii?Q?3XlWZGjGUMfEMc2iSoExLHUM6uBWZhnjN1lSm3mtX0j5Ume82CCCu1NTnVmW?=
 =?us-ascii?Q?+tB3R3S6CpERHCqBkqVAQL+7YyPwLmKguMlMrPo+CTHhkcU+jzAl6hFOTerr?=
 =?us-ascii?Q?KuehVLPnk6v2VjiL419LtDdWShbHxEaHWCNcD7bYbDRJd6cs4QytzPB8mH1y?=
 =?us-ascii?Q?mKxamwplPmfaNveaRp1XLoiEjqxQLB5zS/5Ih9N34qFYzjNMMu/Ymr0yv2IF?=
 =?us-ascii?Q?c0pzQ4aBOGPCvtRLSZO2NS7zexk6h/ESSSsgnO0I0J1ERor456uAqannYm1s?=
 =?us-ascii?Q?h2Tu+EpN7BBs8GaNDLL9cTxDUO5KXDMpQvF+7O7FsPRaZ4ZW4bjo9xLtWyQv?=
 =?us-ascii?Q?FDteSb44I9YR36Yc7XvYQWsj5DaLoouD96ANYl8nQQKYPpU8RFBAocYa9zN0?=
 =?us-ascii?Q?6YuZMus63VMoT45acwUtaXud8pbuXF+vmZ6NKIoP4AvnRJcQCbVI2jktWDV1?=
 =?us-ascii?Q?nTfhoGzYlQ8SndQWHu02UnXGzhY0DsagPYdry2i8izQUltFLQzsDAKU3pzFW?=
 =?us-ascii?Q?bQUChUvyBM8belIR3Fd1BGSUWjtaSp+Jp6MUv1fVgEBfPQ+R4oz0JxUBrBko?=
 =?us-ascii?Q?9+oFfSKj40YMtVZuAmIS/h7xTXyzQOUV1NEChIVV1JZy+umKGBu3cS+Ak/Lw?=
 =?us-ascii?Q?m/Q+1xR6flSMctWx9K9QSW1uOb12ccUxLK5y+0ZyfNLxbU9HiNGPXiTs2cUu?=
 =?us-ascii?Q?VCje49zFohCYF0db0fpvlaBCBMaqpDhQiqSBDPolcOt+f6E6DZR+QF+IjUHb?=
 =?us-ascii?Q?JnvdNCIq+0MKyEqKD5VxB/J35cV4mrXvUe1rEHOngEuAgc9WA4B+bmIP3mZ1?=
 =?us-ascii?Q?Mons76ShxYAqCO1H/gdqRDyPsx2nVAm6Cb++tjEzhKCzNK6JpyN1S3rr8ivH?=
 =?us-ascii?Q?fBJ1aE3biw9D0X9k187dlDsErmbYOY1X/7N3NF377z1hK9VNjf0Op8ziMlyY?=
 =?us-ascii?Q?2lKiTEnd6heDeUFMLHFP0D3T5QL5JGwSSH62as5SQdi1vh7g7fYZ1DntKVZO?=
 =?us-ascii?Q?8o1wqUSnw9ZIvpJJh56Rso6Dm82gN25K5+fWOCa71tNnAlFFqPE26SWivFct?=
 =?us-ascii?Q?VKCvp9guFsSJJMYEXLymQiHgD65MqYrpIEumA5J+PjwcIAtMcZXLroTTAzTm?=
 =?us-ascii?Q?NU5yLiW5YTc8XCxLKe5uMMk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d347729-a9e7-4bb8-6471-08dd9fed5523
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 02:46:24.2000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+Gy52ZumMt24AdoXMwzU5oqf6JvNnI59w73sNe4gS3CceQKn1RMfbzTmII7/Q/UPYmyA9TZvFZm7XDCg9rN+bV4vvPabSzjlvJTiZp64Xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7551

The kernel linear mapping is painted in very early stage of system boot.
The cpufeature has not been finalized yet at this point.  So the linear
mapping is determined by the capability of boot CPU.  If the boot CPU
supports BBML2, large block mapping will be used for linear mapping.

But the secondary CPUs may not support BBML2, so repaint the linear mapping
if large block mapping is used and the secondary CPUs don't support BBML2
once cpufeature is finalized on all CPUs.

If the boot CPU doesn't support BBML2 or the secondary CPUs have the
same BBML2 capability with the boot CPU, repainting the linear mapping
is not needed.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/include/asm/mmu.h   |   3 +
 arch/arm64/kernel/cpufeature.c |  16 +++++
 arch/arm64/mm/mmu.c            | 108 ++++++++++++++++++++++++++++++++-
 arch/arm64/mm/proc.S           |  41 +++++++++++++
 4 files changed, 166 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 2693d63bf837..ad38135d1aa1 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -56,6 +56,8 @@ typedef struct {
  */
 #define ASID(mm)	(atomic64_read(&(mm)->context.id) & 0xffff)
 
+extern bool block_mapping;
+
 static inline bool arm64_kernel_unmapped_at_el0(void)
 {
 	return alternative_has_cap_unlikely(ARM64_UNMAP_KERNEL_AT_EL0);
@@ -72,6 +74,7 @@ extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
 extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
 extern void mark_linear_text_alias_ro(void);
 extern int split_linear_mapping(unsigned long start, unsigned long end);
+extern int __repaint_linear_mappings(void *__unused);
 
 /*
  * This check is triggered during the early boot before the cpufeature
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 5fc2a4a804de..5151c101fbaf 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -85,6 +85,7 @@
 #include <asm/insn.h>
 #include <asm/kvm_host.h>
 #include <asm/mmu_context.h>
+#include <asm/mmu.h>
 #include <asm/mte.h>
 #include <asm/hypervisor.h>
 #include <asm/processor.h>
@@ -2005,6 +2006,20 @@ static int __init __kpti_install_ng_mappings(void *__unused)
 	return 0;
 }
 
+static void __init repaint_linear_mappings(void)
+{
+	if (!block_mapping)
+		return;
+
+	if (!rodata_full)
+		return;
+
+	if (system_supports_bbml2_noabort())
+		return;
+
+	stop_machine(__repaint_linear_mappings, NULL, cpu_online_mask);
+}
+
 static void __init kpti_install_ng_mappings(void)
 {
 	/* Check whether KPTI is going to be used */
@@ -3868,6 +3883,7 @@ void __init setup_system_features(void)
 {
 	setup_system_capabilities();
 
+	repaint_linear_mappings();
 	kpti_install_ng_mappings();
 
 	sve_setup();
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 4c5d3aa35d62..3922af89abbb 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -209,6 +209,8 @@ static void split_pmd(pmd_t pmd, phys_addr_t pte_phys, int flags)
 	/* It must be naturally aligned if PMD is leaf */
 	if ((flags & NO_CONT_MAPPINGS) == 0)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
+	else
+		prot = __pgprot(pgprot_val(prot) & ~PTE_CONT);
 
 	for (int i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
 		__set_pte_nosync(ptep, pfn_pte(pfn, prot));
@@ -230,6 +232,8 @@ static void split_pud(pud_t pud, phys_addr_t pmd_phys, int flags)
 	/* It must be naturally aligned if PUD is leaf */
 	if ((flags & NO_CONT_MAPPINGS) == 0)
 		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
+	else
+		prot = __pgprot(pgprot_val(prot) & ~PTE_CONT);
 
 	for (int i = 0; i < PTRS_PER_PMD; i++, pmdp++) {
 		__set_pmd_nosync(pmdp, pfn_pmd(pfn, prot));
@@ -833,6 +837,86 @@ void __init mark_linear_text_alias_ro(void)
 			    PAGE_KERNEL_RO);
 }
 
+static phys_addr_t repaint_pgtable_alloc(int shift)
+{
+	void *ptr;
+
+	ptr = (void *)__get_free_page(GFP_ATOMIC);
+	if (!ptr)
+		return -1;
+
+	return __pa(ptr);
+}
+
+extern u32 repaint_done;
+
+int __init __repaint_linear_mappings(void *__unused)
+{
+	typedef void (repaint_wait_fn)(void);
+	extern repaint_wait_fn bbml2_wait_for_repainting;
+	repaint_wait_fn *wait_fn;
+
+	phys_addr_t kernel_start = __pa_symbol(_stext);
+	phys_addr_t kernel_end = __pa_symbol(__init_begin);
+	phys_addr_t start, end;
+	unsigned long vstart, vend;
+	u64 i;
+	int ret;
+	int flags = NO_EXEC_MAPPINGS | NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS |
+		    SPLIT_MAPPINGS;
+	int cpu = smp_processor_id();
+
+	wait_fn = (void *)__pa_symbol(bbml2_wait_for_repainting);
+
+	/*
+	 * Repainting just can be run on CPU 0 because we just can be sure
+	 * CPU 0 supports BBML2.
+	 */
+	if (!cpu) {
+		/*
+		 * Wait for all secondary CPUs get prepared for repainting
+		 * the linear mapping.
+		 */
+wait_for_secondary:
+		if (READ_ONCE(repaint_done) != num_online_cpus())
+			goto wait_for_secondary;
+
+		memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
+		/* Split the whole linear mapping */
+		for_each_mem_range(i, &start, &end) {
+			if (start >= end)
+				return -EINVAL;
+
+			vstart = __phys_to_virt(start);
+			vend = __phys_to_virt(end);
+			ret = __create_pgd_mapping_locked(init_mm.pgd, start,
+					vstart, (end - start), __pgprot(0),
+					repaint_pgtable_alloc, flags);
+			if (ret)
+				panic("Failed to split linear mappings\n");
+
+			flush_tlb_kernel_range(vstart, vend);
+		}
+		memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
+
+		WRITE_ONCE(repaint_done, 0);
+	} else {
+		/*
+		 * The secondary CPUs can't run in the same address space
+		 * with CPU 0 because accessing the linear mapping address
+		 * when CPU 0 is repainting it is not safe.
+		 *
+		 * Let the secondary CPUs run busy loop in idmap address
+		 * space when repainting is ongoing.
+		 */
+		cpu_install_idmap();
+		wait_fn();
+		cpu_uninstall_idmap();
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_KFENCE
 
 bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
@@ -887,6 +971,8 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
 
 #endif /* CONFIG_KFENCE */
 
+bool block_mapping;
+
 static inline bool force_pte_mapping(void)
 {
 	/*
@@ -915,6 +1001,8 @@ static void __init map_mem(pgd_t *pgdp)
 	int flags = NO_EXEC_MAPPINGS;
 	u64 i;
 
+	block_mapping = true;
+
 	/*
 	 * Setting hierarchical PXNTable attributes on table entries covering
 	 * the linear region is only possible if it is guaranteed that no table
@@ -930,8 +1018,10 @@ static void __init map_mem(pgd_t *pgdp)
 
 	early_kfence_pool = arm64_kfence_alloc_pool();
 
-	if (force_pte_mapping())
+	if (force_pte_mapping()) {
+		block_mapping = false;
 		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
+	}
 
 	/*
 	 * Take care not to create a writable alias for the
@@ -1063,7 +1153,8 @@ void __pi_map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
 		    int level, pte_t *tbl, bool may_use_cont, u64 va_offset);
 
 static u8 idmap_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init,
-	  kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init;
+	  kpti_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init,
+	  bbml2_ptes[IDMAP_LEVELS - 1][PAGE_SIZE] __aligned(PAGE_SIZE) __ro_after_init;
 
 static void __init create_idmap(void)
 {
@@ -1088,6 +1179,19 @@ static void __init create_idmap(void)
 			       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
 			       __phys_to_virt(ptep) - ptep);
 	}
+
+	/*
+	 * Setup idmap mapping for repaint_done flag.  It will be used if
+	 * repainting the linear mapping is needed later.
+	 */
+	if (block_mapping) {
+		u64 pa = __pa_symbol(&repaint_done);
+		ptep = __pa_symbol(bbml2_ptes);
+
+		__pi_map_range(&ptep, pa, pa + sizeof(u32), pa, PAGE_KERNEL,
+			       IDMAP_ROOT_LEVEL, (pte_t *)idmap_pg_dir, false,
+			       __phys_to_virt(ptep) - ptep);
+	}
 }
 
 void __init paging_init(void)
diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index fb30c8804f87..c40e6126c093 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -440,6 +440,47 @@ SYM_FUNC_END(idmap_kpti_install_ng_mappings)
 	.popsection
 #endif
 
+/*
+ * Wait for repainting is done. Run on secondary CPUs
+ * only.
+ */
+	.pushsection	".data", "aw", %progbits
+SYM_DATA(repaint_done, .long 1)
+	.popsection
+
+	.pushsection ".idmap.text", "a"
+SYM_TYPED_FUNC_START(bbml2_wait_for_repainting)
+	swapper_ttb	.req	x0
+	flag_ptr	.req	x1
+
+	mrs	swapper_ttb, ttbr1_el1
+	adr_l	flag_ptr, repaint_done
+
+	/* Uninstall swapper before surgery begins */
+	__idmap_cpu_set_reserved_ttbr1 x16, x17
+
+	/* Increment the flag to let the boot CPU we're ready */
+1:	ldxr	w16, [flag_ptr]
+	add	w16, w16, #1
+	stxr	w17, w16, [flag_ptr]
+	cbnz	w17, 1b
+
+	/* Wait for the boot CPU to finish repainting */
+	sevl
+1:	wfe
+	ldxr	w16, [flag_ptr]
+	cbnz	w16, 1b
+
+	/* All done, act like nothing happened */
+	msr	ttbr1_el1, swapper_ttb
+	isb
+	ret
+
+	.unreq	swapper_ttb
+	.unreq	flag_ptr
+SYM_FUNC_END(bbml2_wait_for_repainting)
+	.popsection
+
 /*
  *	__cpu_setup
  *
-- 
2.48.1

