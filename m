Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2114.outbound.protection.outlook.com [40.107.93.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E51226CF8;
	Thu,  3 Jul 2025 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535813; cv=fail; b=XwXZyuYSjWrDZNIKlnED/nu3s+q66CU1zWGTN8HMCGCy0C/yYFMoR0rh/GDglWcm0WGiqWxLUYnxFh6e1iiM4VCy/Mz9Gxs98ey9bOUIOHBOwKYu9faWa/LtOviPfJCAXxTchmCAqeEU7U9ppYwlhBPkoPbc4WCT1JKggYrt14c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535813; c=relaxed/simple;
	bh=nRaFEFXowyzrZbyy5SPR7c/UCiZXn8NvijVUZFQV5b0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X8Hu81WKFTIuidKODGDxPu7VDrN37YxoX6nq6MHq5wdMw3PKz9i1exacvBFV8VDoCUvbsChknWBihO8P4TnSBqq2JKLLWsmFxoDUfG3CXnQwdperbiKJvRTW7nGrZoKWI6rDj74QHKo6Fwv2WE+U0uAWonKGv+jUat77viKRy2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=RlLz9r4Y; arc=fail smtp.client-ip=40.107.93.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="RlLz9r4Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5Kg/7vR1MtbqbMNah1sBIVohHWxWCsN2IzXvtx1PNHxuNF/39Ck/kltd8C/EFB/T0H9ItsTrAsT/Of5M6TIsfvVnZuS5K5FBZ9oKX0y1PFVqE+oK6TCAO3LzDgiCxZnFa/f9J0daaL+LP+R1EgWXP6REMBTErFmRi8EVOMNlueYUqRvQYvxzwrtBbsWj8PyAFoz6vT0U6vw23fAWuWRMxB2mnZJpicBYuD3DTLjaqndJKW9p4rnZ2hlMq+lYwg4+z98Bmc955QXH/yAFvJXmzEbgcJKEyH9AJbakqs70EcIl2GHwmU+7yu9VrvXnYaZl2NTKoKkbveBc0oOIZrRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJV6nRdsGQ5leWL2cJdciVHtQLehGJ05oTWzhVN9kMQ=;
 b=Dlg69UKQbanCrP1I7jtbf2Fl8KRcCGo/Ti8SXARRiS1mHHd5UieCLhtVIteU7SQDXSCAO/h69kneF5HjWmwJ6V5d9p8r4ud5P8nOrU8wiae0MMFLxLJMQ4htcatqtstP4N4TjtmudSjbwBFRp90rc6Hg8EHGeVIg3+JUM/LL6OVnAmKoePRSxd7ZjbIiEUiLi61AZFSu0nltvN2vkxyUYRvsIufbc3C7erHmLAyJqux84/rBOUtDZpjWqDfxYosbOyStI+qrC2Iv0G61obo/BkUJA1YFocXJz4XuPKLNLnchAGXhf8HgwUS2J0e5Bm764WJVCnliWTwrCRVs6InRMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJV6nRdsGQ5leWL2cJdciVHtQLehGJ05oTWzhVN9kMQ=;
 b=RlLz9r4YcCCVAg9MvNoJ37lzenaIm2B16yGQOtsYcWhSK4kjNezi5Fm5mwC+CdmObC7yME35wiPR/OV9gXjMIShWuWsf2rix25w0+ntV3G1BIeFI/x6mGtdu6Z3wwW0pljGud4jnMWP7UZCdOePktec+LvFG285bhsE5VVFceqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 SJ0PR01MB6399.prod.exchangelabs.com (2603:10b6:a03:298::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Thu, 3 Jul 2025 09:43:27 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 09:43:27 +0000
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
	rdunlap@infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>,
	Christoph Lameter <cl@gentwo.org>
Subject: [PATCH V6 1/2] arm64: refactor the rodata=xxx
Date: Thu,  3 Jul 2025 17:42:11 +0800
Message-Id: <20250703094212.20294-2-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250703094212.20294-1-shijie@os.amperecomputing.com>
References: <20250703094212.20294-1-shijie@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|SJ0PR01MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d20a4f6-87c8-4cc2-3d40-08ddba160fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YZsx2m9f3bdmmoRDzMA76oavLem0S4Ixb+oDQXg0sJh8Nm/K5UZF/Gz16csA?=
 =?us-ascii?Q?bMNQZrFjtLL3L3G+bpuWeAVDHSpb5AVq3clq1oCdvZVqId/tKV+TjZZamDpw?=
 =?us-ascii?Q?ns8dbsF1478WvG1Cq5M2DTxGKzll+jgjb7uhrZSPVBJZWNkh/p8GvOCNXJWR?=
 =?us-ascii?Q?19b6nMgcs4zrB/H+zCNrsv33SVBdtgaUMRsskKKqDM05pbb9iiPRikwBk5tL?=
 =?us-ascii?Q?dzq4CpqBECrPrbrPWfB6PCyRalQJ8r2wH/4e39Z/VIHHuaPCfc5qnCQ/5jOT?=
 =?us-ascii?Q?dddB9k1Ep/z7S3dYgtedT/i3odY9EMSQZqOAWxqYTi7xRNfpUMAblodwvgKT?=
 =?us-ascii?Q?alpkUrZwedjOouxpwRW3JJdy3nbeT1XxgsunOCxI3Y1ZJz6qWIPs94qeT/bH?=
 =?us-ascii?Q?mXxvTbPYTXGLvs2jDhQturdkTQOl7gWHVCgPv5PJ58Ce7BuU9FPqYNVty/Lg?=
 =?us-ascii?Q?1a9TJX7hVRBPis5uzzM5cdzYdPjKvKDNMSnmERtnPejXz4JKidVOSqKuqMIU?=
 =?us-ascii?Q?2652m9+c+PHQhYTVATNIWSJdjhVrU80HebyFSwt9hvp+YIVJf+hyMnAVdzs5?=
 =?us-ascii?Q?cmL3Fjt4J17lZzuY/C0CvyCdRHmiG1tTIznlS49f1HQk+Kqyy8lEFOPEHyvz?=
 =?us-ascii?Q?Z6PAw53lSiogoDx1kem8GAWv6onaisStJOTABnuqOKVMm6fVWa8epUg/lQwb?=
 =?us-ascii?Q?3ax8jMkzN0zhSgkKzpbp1snPusDXsTgVp3N0HL77ivvfybxZtkbcdK3XukUo?=
 =?us-ascii?Q?5o5Oa3F49NXw8IOcGPNc9kctqjYKWRFdAEFc8lIfUoyE/e6Gt+85CDESkMAy?=
 =?us-ascii?Q?UdXyMn/OE8XEtGD5iEkgST2hwrCV44oR+FLrE2RQBDZZ2Mq7MVd3rCPZDbBz?=
 =?us-ascii?Q?qNu11ZYyjyDDaHPeV7BPFVtJqmiHNB1S93pbk0XqKZ2vpR4LJmvWS0veIqqK?=
 =?us-ascii?Q?kIWfR5uhC4oGZDArhymZQJ4xOq1xexO8xBkB9N0cTNcC1ZiXmzE5+3l7gCy+?=
 =?us-ascii?Q?SP6JcBSnDXSeqcmZegYtlURLgoDLgixPqKUoG1R0HIFqN+sjrT0YBjDqoH4R?=
 =?us-ascii?Q?68kdaB4d51CJ+W2bZwV9BzmJL8c4QtN8CXHq1sDsRpIWzWz/KlchJGQZwBmU?=
 =?us-ascii?Q?7ivV682sY8k23bwfP20+WADT5uwYflGiI64LMVF6onQ45ssB4WbP09+I7f83?=
 =?us-ascii?Q?g0bflgpCmwbk3bVNyX8pvgaw7utuq2o2HtHg1v6npi8QPEeR1sUReAzegxz/?=
 =?us-ascii?Q?OOYvZgz0SboNRb6y9Aerimrd20+3Y69AikF8QJm8byY8mNaSuE5CBVjzHxFe?=
 =?us-ascii?Q?5iVCb9yMFVw2B6DTPgtHTmcTqzh8fmQDNQQIBahpI19lPUjod+j/O6pHkwDM?=
 =?us-ascii?Q?1LvVZatUKbRHrwERtlzRsPvN0f8CR9auKFHVLxQO5H+WUm3tbcp6vL8Pf0cE?=
 =?us-ascii?Q?Zm2QmKRLo+ac7fW2nnH1YFJp4p5tfRO+PjoHTurBQK/JkLoW0X+QHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?751i3amr5iYFjrV9Bebgf6YIzqnJw2Wh7G16D7oM5kAWvOP477Ne28dhYJO7?=
 =?us-ascii?Q?MPw90cSKrxF6N59swCvX3XU+F1sOiNcRGq91sCiBL4DbiqjN9cQ3IPEG5NKz?=
 =?us-ascii?Q?QF3CYvpoh70GvAqsuH7gcHm8F73s506cnq/Oe6Qpqr+VmkBfTJ6FVQJlGT9p?=
 =?us-ascii?Q?uePBppWMrI7w4YwvA7SYUsqE0gTpXljqiaVuFvPiO8mWRQ7MewiqL6/QOZyg?=
 =?us-ascii?Q?8jsKLQTFVPZn1EqC5Ja0l24oC3azIgSKlOreCi68raQo9Z3OM6ABacCH09Qe?=
 =?us-ascii?Q?TJPQaRUOA2lneDYQMk0pPCGaM3p/G/YQqYW8RxznaEY9Hcx7qBwExQb2XUPU?=
 =?us-ascii?Q?MCUcIcdbjxOLa4HtRK4JdruOPSiv5Md1Z8ELCr4qmEg6ma5zIwuTfHvsddY6?=
 =?us-ascii?Q?gqdXyVsIA0Z94ZdlGveog0XA2pYysMSqOS8iWUxF3mnhKUQIy4eR0lg57n40?=
 =?us-ascii?Q?z90EVArFN64lavkJ0ZEi4747TjwGL+HOJLRzEyxmaneJyX1tJBKe3ZG9SBIg?=
 =?us-ascii?Q?i6sGvyTcK8uo7fT3PIUtbp1jGLkFsDh2nwv167dTQh1/FUIeLQObkLLjjz0B?=
 =?us-ascii?Q?rsBj0+n6CNPGscwNStqjkyvCWWlc2aT4807VUJM20DJAg/Ix5JndmJyWhvaU?=
 =?us-ascii?Q?36kBadS/IKecaZRNR2g5D0JN5N6IO8TctiEJo30tWOzNn3a8InoCL8dtyAbW?=
 =?us-ascii?Q?/FbXu/TB7Zx2oc6vtm25sOy91qio13HUkFbKVSuPXGrT8GbkJdgcuYjcqc37?=
 =?us-ascii?Q?iTpTDIMNE8eCeDpSuPDRu8LG4WVvCSWhIOf2E3j1IlRiZVOt2PiIGR+y7RCQ?=
 =?us-ascii?Q?n9cHLoFf5IZU+MdzYU02x3MS+cw4GL2V9t5KXpfoOycj/VqEKSgC3r/a/LbE?=
 =?us-ascii?Q?HbgvZOdqzjdNO25PajmnB72lMNv9AbCG8Gl83NleuU24iDiQetQCzKXiJ+TA?=
 =?us-ascii?Q?Snvch0gKWg5DLovGg9v0IJFj5VWlEwWm8JacWdGxJqA08E1zowMaOW3A/9mv?=
 =?us-ascii?Q?F2BRRE3YNBEhAYGNIaWw/Sh6/Ea9gz+B61mA+vh8l4URHvuAnyHfiyvmlNFJ?=
 =?us-ascii?Q?XMNutRdVsYlfZtdW8GAm5/JQ1TOIx0C9B87G5JLpgOgVd7FfqFjwtLUEy0oF?=
 =?us-ascii?Q?IsVZefsw25SBC/k/1fueUGJqK/I8WEtSudMCTss5pOQHXE2ngE2zVuNt5kFP?=
 =?us-ascii?Q?M1eRvIJUE10zXlMm1q3j7QeUmchaIBJYSW+bxDsQsJrubzODM7MqYO9nn5hm?=
 =?us-ascii?Q?XDGFpLSOamvPn1YJatqpFyNkpixelaCEqYLu7ywBv6mU/DHJfjknVXUsOtC6?=
 =?us-ascii?Q?Ck3aMxExuu2IjLlF/bTVmbZIUDaCAIa5+fw/YfVByRJXatVpasIVfcpT3SGI?=
 =?us-ascii?Q?HzAK2uZVImG02Q26eSA5tmtbUv5F7A9AVB/RdBv99XDFI+EfNfu6Qk1IjYhM?=
 =?us-ascii?Q?qNWZ/tDsq8B2T5SymaCHkS9mtdMeRFwRV3f0d+o0sn810q45NPssow0163/I?=
 =?us-ascii?Q?e29KQNC3mXrBjGy00LvfS51UqyX6Szht1AAZvRIgy8vJdd/2mrbtlvDgmJoZ?=
 =?us-ascii?Q?lSzA0dgJqXDpgswKtEqXPZnWXctVYU2WrPzQSvGt4UEUZfu1FwACnjAVJH1G?=
 =?us-ascii?Q?eGrF1hRG3bYb9jYzbeC9nuE=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d20a4f6-87c8-4cc2-3d40-08ddba160fd6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:43:27.6045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDhqIBYLFD/w4LWX/TBgvKzyGwlHvZOAa5Pq4bbeKXr4l6d8DAaKS9qool8RIP9Ug4fmWl+/KUovqOk0Ud+SHhpZg1xc7yfqOsVF/8tIAWPfryHFzuWBL2+k8tbKA3fp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6399

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

Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>
Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
---
 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/arm64/include/asm/setup.h                | 28 +++++++++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index ee0735c6b8e2..3590bdc8d9a5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6354,7 +6354,7 @@
 	rodata=		[KNL,EARLY]
 		on	Mark read-only kernel memory as read-only (default).
 		off	Leave read-only kernel memory writable for debugging.
-		full	Mark read-only kernel memory and aliases as read-only
+		noalias	Use more block mappings, may have better performance.
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

