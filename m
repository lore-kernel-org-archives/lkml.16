Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2107.outbound.protection.outlook.com [40.107.243.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F828F1;
	Mon, 30 Jun 2025 03:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751252630; cv=fail; b=NKsX1hnDh9EG4GfHpwCD+o445VsTN1B9O2HbNmkVFqrz4eQB1HuWsagDQCD6VUJ4MKYgju1gRyf1BjbqjV8PYBggtqYe7mPjDhphlkW6YFqgMh/WM82WGjlrq6eOSjlWXw5JtqRpIjK1dw8+oCVpNf+5KTasLtdLws5ZsJv6dYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751252630; c=relaxed/simple;
	bh=ZTGZ0jfzv7VUbdMo0MsDs1aSWJxNugo2EaSFTpBMsZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IWQxHRDAjgi4mEcYBmTZ8Y0SbpbRuEueNiyDT2DExXPvuu8QTy/7Z4CNA4XcyheTkXM8i7IQ33EyGHfdOHCmaAetbFpEmHKYPgl6/5H9naBUtP0PKAMw0k3t/ejl3Or6/WwNI/gybqPo6Ewoe3BYWWBHtJW6OQJ90e2HfpktIAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=WAOKgty0; arc=fail smtp.client-ip=40.107.243.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="WAOKgty0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDxHif3GqP6JImLh38aOvB8PUqfYGLzqsXOURVgq9rSZa/l4HomN8gDYIZWV7Qkqj8wjMWK0OnWZup7eeC7YwVgCfujdx4Yq0VyV59UT3ZrMGbYlCldTthRPz25yYPeqvaGksNBXD/DQJmXtO1Qquiyci8FZYxn8aN8u/aj4kI6wsRSLvRPbpaynA5lI7Bf3nuM9/7dbuboTAMiYg6A+nZ8HL2tsSGuaAFYWvNgDF8cFRMl0mkq33EztnKaR/5z3iCCJURvjk8AbDVYZYMknrxPPutK//BmYmW1DdwbQvHiDdM7AQKlWMSAK+Dq6aJTZaTH1gnuFks+Lg3R1D95Maw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rl8rUhHmRFSg5ocU//+Q9pQPMUl7/usDwSblRogsAYA=;
 b=Ugwin32gAEi7U0MYt0B5wggGKbkBmqWcCQ6Boa4C50LD3n03Ga5qh03r+LHb395phdHkvWJHyZ9jtEx6yLcnZp/ORgj79YDiVY11LcrmclBp6LWBGJb+VyjE9WGya69BDwldKjLJbiRIY3+fTwvNloycY5G/d9cIzwK2zKB6t/akpMk00SGOsFxikEu2tqJIECDk8LvTF5Qk2c7UIc5bxGPpMzAiD/AhejRQJfX6LM57h7ci2mW0SUAbjCUqWlf+QyIYNhh972eGWwMChdJ+hGYfbv4q5VDYZaKNjWSd2DGh7ejt6M+Kpo1hVPeSr1t+VWwY4u7Eo1oWOQLeX9NzOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rl8rUhHmRFSg5ocU//+Q9pQPMUl7/usDwSblRogsAYA=;
 b=WAOKgty0MEGT/uDRgXN96XqJak4Tr6uCKyvxcuNzi/1+dRKU5jGkGaWQUJI/PK9eWEwSNBRiV3v5SPRmRswcb4sE5IwKbDnZHz/O8PvdOhMY5zEAQ7719kFYrmhLCUnCNPFUAvz+YsioHc+barv1Zn/YIh1fW4esWpd9ZcLqNHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 LV3PR01MB8511.prod.exchangelabs.com (2603:10b6:408:1a0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.28; Mon, 30 Jun 2025 03:03:45 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%6]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 03:03:45 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net
Cc: patches@amperecomputing.com,
	cl@linux.com,
	yang@os.amperecomputing.com,
	akpm@linux-foundation.org,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	Neeraj.Upadhyay@amd.com,
	bp@alien8.de,
	ardb@kernel.org,
	anshuman.khandual@arm.com,
	suzuki.poulose@arm.com,
	gshan@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH V5 1/2] arm64: refactor the rodata=xxx
Date: Mon, 30 Jun 2025 11:02:27 +0800
Message-Id: <20250630030228.4221-2-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250630030228.4221-1-shijie@os.amperecomputing.com>
References: <20250630030228.4221-1-shijie@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0009.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::8)
 To PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|LV3PR01MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: ba751848-b050-483d-8850-08ddb782ba54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lUAu/97FZxDX+2CvLZJKiGoZ0KQFErGzAvDvHKOW6WeNp+NqxNwYBg27+iu+?=
 =?us-ascii?Q?0S0G4FiloEx0v1QlGmHxM3nTaDdjm1BzQT6u+a9+IHJdvuMi1B83rgvVR0eI?=
 =?us-ascii?Q?yjf9uiBA0xiNZKAhoCAIvaAj+ncU9gBtGFinWkLD4HdrubDalbM5di9fJX3t?=
 =?us-ascii?Q?VA15rKuGA2ohKnjgHgL1zofP1wdtSiJVnNLIYUojzgBkD634pa/1bSczQyX5?=
 =?us-ascii?Q?tYO65aMFsBn3Jk3NQdQ74Vp9Z5XbUpGayJb5FNX74urMizCX0+lUvjCxDdxM?=
 =?us-ascii?Q?PZZ+2RFL0nmzctMC4HtdLPseBcTsp/s8Y3DQsQH/ybRsZxtd4cwVzCUxy2VE?=
 =?us-ascii?Q?7thCxyOPksekki9OUasvlxGiOelj+2707V/QBQvq3p7edP4v4S0ktFwZYbSU?=
 =?us-ascii?Q?tSOTaf3b9O3gLGZqSSp0JIvtIK9NeUQfabXPau1p8Oj7632dRoZTFrxu5uzS?=
 =?us-ascii?Q?uqm9OspNGpaAUbht7KO86uSk5/dChwl9BJOhAAeGM0kILXWpQoHWpgmkdTGN?=
 =?us-ascii?Q?Wt/BmaLGieHE8nzJfM99np7qfY38IfzgEtqmWMV4+m2TcCzq/ezg/SiT97fk?=
 =?us-ascii?Q?0FrdGKIxTdC2/XI81ghyxTGqDvMIlY21iJEJR1vAuuztVATJ6CrU/ir+QlN8?=
 =?us-ascii?Q?WHEjO25P9YWKU0kcggv5pHsVDjKt3R+w+XtAEseNfBrIQGSmt5y65F7B5k/e?=
 =?us-ascii?Q?5jPz2mUHewwaAgYTksF/WAvvhLA5m5yCt4c4qxlWZZD7rmhJvCIGbPFKA9/b?=
 =?us-ascii?Q?UAkQvMowMT6Sx2ZUg3+eokgdP1rYwK+BA22gEEOzRk7Ut5t8rFrJ1PHyFBBM?=
 =?us-ascii?Q?hQNToOSc2xxkisnU1qmn9OK/lD8n0SQh9iCWUnTrtlssOCZK3CEKmmMTOdc7?=
 =?us-ascii?Q?rgBAc+kmWKd32jvnvk3P6r1mSfmxQzmsQKDgBpjE5ZdYMSJSkcnM1SaYUV2S?=
 =?us-ascii?Q?Nt9Ns8QQPun5HUH399GLjWtlAaUOAe8qTxKlPuJskN3fGiqFRSn8kAxmKXZ1?=
 =?us-ascii?Q?EqBTI/GIaLWJtdEEIMKoBlS6lbWIXOoA10FrQ1srElkMwNAY1k91xY7eISrW?=
 =?us-ascii?Q?0tgiBwdfX7N/UlCrH70X0c+kK/5j7+/+55twGZY13C0YX5d6hroxLkVQJKBm?=
 =?us-ascii?Q?4e+91MEYnD/KtUsYz8UdmlUytM5w8rvnIpBAlbfOxgLsa4bu/CtQ6j08+6h/?=
 =?us-ascii?Q?iHR4FlH/WHCgSuAFgW3dOrdcTAL7IMSxYvgM/Jfz7z+9Z0i5uNLn64noI4cf?=
 =?us-ascii?Q?5+REDv310irq+/sC/GjpG8W8aovEZzhwnP/PogNlBuJe84j6n34+fdGNh5oD?=
 =?us-ascii?Q?GAb49+KckX92ThAyW4LQrrJvfFsTopZAxhTfZPdBVL0/FE6CvUDmIYKVzacd?=
 =?us-ascii?Q?Y4cNm1A3QzwJTFKqIublwTN3B1CZ2AR6ExvHBB+/Ipmm82/jOVEC04clcc+i?=
 =?us-ascii?Q?sIjMqQq2NJIClkewdB5uAMfoEb0mdYmVe+uSklDdUUM6MFcsBzqoJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RXg3DVTfk2UPrViEXCuczHee4PhRFeiEvdY4QG7csL3yy6aDnd2sX/T9qC0a?=
 =?us-ascii?Q?VZe3+sh2Bc5MC4fFdtxJqkauJ3b0ubInH8LATbpM0lQ3shccyGAdaARYE5kx?=
 =?us-ascii?Q?7DcdaVE0lBTB6Upt74pd///G/fr6ddel4+cPxQnLTn3FLPmDF7hJNE75zlVA?=
 =?us-ascii?Q?T+y5u2BMDekV4ykL0NYZmkI1xz+1Dg51MBTeoyzDDHQezR3rsQ1Spc5KC6Gg?=
 =?us-ascii?Q?iloFA9j56qf9DKTQCd0EFzG5BOIBY/h+x5OUyjd/9+8JSnCw7ToDqmodw/EQ?=
 =?us-ascii?Q?RIQH1xZigDNVGXdPgA9HwBkV3+mHzCKnkASLH1pLMeBREnOZSPodzUaQ+MdR?=
 =?us-ascii?Q?aflq3ygnfhP2M1BmIKbKOUdIoGxDbU6UO8vF0RMJCMeKIsCR+bh/BNWhIGdH?=
 =?us-ascii?Q?iHWAZgCUZMf8Gc2BL4u3s2l90WJebE3s2amWtj0R6ek+zLxxFJ+bygtCemIF?=
 =?us-ascii?Q?28cmgghapnfXkA1lL/rymIh9fhZApWNnrglCQrlgbJYe7n38bWQIUdZSupsu?=
 =?us-ascii?Q?H7Bs6SyH6S/52pNcyLzooWR36CDsuiiaGmQiV6LCYLMwHOjCrtWxZ3+b+a8j?=
 =?us-ascii?Q?taZVThEJ7WM9OBcmhTLhcPI/2Wh5h21E9Nelf/XJ9S85Nl4G3WOiyvqNjE7h?=
 =?us-ascii?Q?ttc2rAsViEIfb9yhOXml+NELS4vKgCwkiXmR7SI+n25mZN8AukDBXkIj3OIw?=
 =?us-ascii?Q?slXWc+PDdlwlhtBtPjJqKuOWI4XUs9P07Qww3N/gb0VafVqt8nEe6Oulg2w4?=
 =?us-ascii?Q?hsWwz09sugWhlVNrSePrG072zwr1u2RfP0uGDrkFxaStE5wNNfvroGDGWXmz?=
 =?us-ascii?Q?LFyu0Q6fEG1iz0ROuCUkpLCoxQCOM+qEilTdyFAGgV9nJWzMbLmpONHFN2m7?=
 =?us-ascii?Q?agEYkX2h7G4paT925UhP0bI3Z7KqEXc1NSvIr34Vp1s+mrPn9EyrlvQf4X46?=
 =?us-ascii?Q?UAMyganqUtzcfZEPEIJhZgVew+5ApGc/HyqzTOY5QZMgyvyfDDlfyZhQ1hy4?=
 =?us-ascii?Q?vziJGTGpNVEOw08T4dofe6JDCAle0rriTErowscX3yyIIpfAYjjnsXRX8w9g?=
 =?us-ascii?Q?pVdUs01kLSpkHaHJbH5p+R9exEJWdr/eSbuohJB8gVPINFYdtKj1LOC3Xlr9?=
 =?us-ascii?Q?kOWFBYxtdQyeKkmgtjgfB7ZxBZcme7611pCLPizAzNRl8Db627aoczG7ahJT?=
 =?us-ascii?Q?/DDS9feJU1WDlXl/mI2y2or5x0mE/tBL/FXRMucODcTLRjyXHTTmGwga5+Mt?=
 =?us-ascii?Q?DEblpplkjSCV2aayDkmhoXrdNUcx+acr0VLhWM0Ym3D10fPaX25a8TrzEsLL?=
 =?us-ascii?Q?EYOZUF5Xs04b/R8RSUOktVCj8yNPYP3qJAimQX3UydJjCfll7emtfC0tPIGd?=
 =?us-ascii?Q?66Aa/NutOHat2qPLCMMDrNysdbDPfH5/886KnHN2QPHkM0pv3J/EAtEPVt64?=
 =?us-ascii?Q?RzCld0M1n4LSNBmwLaQrqf/DhEXxMSUtEBXX9foZjGI5yZss8qTwiBI/ErpF?=
 =?us-ascii?Q?GuGkJUwarbfhBJLS/NWFrysvWFpcISiMXHxFzo0s+OFVAwdMP2aZcZ0gI0kR?=
 =?us-ascii?Q?VwdRqCrv1e3YScMnBK3V76aY7FTCBAMjGsxxVb1g8TmoneyEw3aCF8LmKPOH?=
 =?us-ascii?Q?sGaXBpwFm30GSHHwCh9sd4E=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba751848-b050-483d-8850-08ddb782ba54
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 03:03:45.8028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHAnohTUMPM9o84Juo4DNtTWdME4BTtErV+LTS1Cngk2n+I7Pu027hhM5546LpZkSTz70Ypgie9G5gyZDhPsPPqdYkTDb2PwrI74aC7S2/T+HxExKexnjD9wz+xcSByJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR01MB8511

As per admin guide documentation, "rodata=on" should be the default on
platforms. Documentation/admin-guide/kernel-parameters.txt describes
these options as

   rodata=         [KNL,EARLY]
           on      Mark read-only kernel memory as read-only (default).
           off     Leave read-only kernel memory writable for debugging.
           full    Mark read-only kernel memory and aliases as read-only
                   [arm64]

But on arm64 platform, "rodata=full" is the default instead. This patch
implements the following changes.

 - Make "rodata=on" behaviour same as the original "rodata=full"
 - Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
 - Drop the original "rodata=full"
 - Add comment for arch_parse_debug_rodata()
 - Update kernel-parameters.txt as required

After this patch, the "rodata=on" will be the default on arm64 platform
as well.

Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/arm64/include/asm/setup.h                | 28 +++++++++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ee0735c6b8e2..e0cd6dac26d3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6354,7 +6354,7 @@
 	rodata=		[KNL,EARLY]
 		on	Mark read-only kernel memory as read-only (default).
 		off	Leave read-only kernel memory writable for debugging.
-		full	Mark read-only kernel memory and aliases as read-only
+		noalias	Use more block mappings,may have better performance.
 		        [arm64]
 
 	rockchip.usb_uart
diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
index ba269a7a3201..6b994d0881d1 100644
--- a/arch/arm64/include/asm/setup.h
+++ b/arch/arm64/include/asm/setup.h
@@ -13,6 +13,30 @@
 extern phys_addr_t __fdt_pointer __initdata;
 extern u64 __cacheline_aligned boot_args[4];
 
+/*
+ * rodata=on (default)
+ *
+ *    This applies read-only attributes to VM areas and to the linear
+ *    alias of the backing pages as well. This prevents code or read-
+ *    only data from being modified (inadvertently or intentionally),
+ *    via another mapping for the same memory page.
+ *
+ *    But this might cause linear map region to be mapped down to base
+ *    pages, which may adversely affect performance in some cases.
+ *
+ * rodata=off
+ *
+ *    This provides more block mappings and contiguous hints for linear
+ *    map region which would minimize TLB footprint. This also leaves
+ *    read-only kernel memory writable for debugging.
+ *
+ * rodata=noalias
+ *
+ *    This provides more block mappings and contiguous hints for linear
+ *    map region which would minimize TLB footprint. This leaves the linear
+ *    alias of read-only mappings in the vmalloc space writeable, making
+ *    them susceptible to inadvertent modification by software.
+ */
 static inline bool arch_parse_debug_rodata(char *arg)
 {
 	extern bool rodata_enabled;
@@ -21,7 +45,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
 	if (!arg)
 		return false;
 
-	if (!strcmp(arg, "full")) {
+	if (!strcmp(arg, "on")) {
 		rodata_enabled = rodata_full = true;
 		return true;
 	}
@@ -31,7 +55,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
 		return true;
 	}
 
-	if (!strcmp(arg, "on")) {
+	if (!strcmp(arg, "noalias")) {
 		rodata_enabled = true;
 		rodata_full = false;
 		return true;
-- 
2.40.1

