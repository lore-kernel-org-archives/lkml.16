Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D6C217657;
	Wed, 28 May 2025 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431128; cv=fail; b=LQg/5bvtuwd9paRH3CvW2U60n9mwo4fts4YZI6h8bAKNk7wO/UkmK7lclkj67AXiSFEvvU6G4fym6iq5jHpu57bEotMFbS+33MdtQzbj1LbJ7USqr0nQJLaIDMXpaz+tVXKUfl3vpqG6QmSeu/Zr5sk48w8DxXKDQDiFwsWZHgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431128; c=relaxed/simple;
	bh=y1GhG285KhmTiHD8Pc3WnyuagbFIOpXxGLwUaExs1Xo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tfTjq8SHFmAmJDGgqmTKtHafaQPS16t8Ca2HUxoBMYvyQ64hJWneuB9xYHfc2iQdKQ90GANngkKsU3jSDMKvk1i8SZwQ3s+qm7u7zm7VmjDlLURU4oaFy3VJHphEzsxRYBXP7rLPu1SS+mN6Q2OxjpNjbhjftLRWvEbJCaQVT0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SA2fYO007286;
	Wed, 28 May 2025 04:18:30 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46udmm3p7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 04:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xwgh/2JcSFqJuD30CnSYBPtAc1+LaqqglOn+219Ncu6Tg4rJgvemnsE7D1QiLNvZ1+YOOxqLZSM6pKpXr0B8zZfW+Hs+7MoXAnDkqyCBjvKKAm4iumHAFuT8xY27nJpjUqxxbNcFdi7O6nbysAppoMLQBBy4IgRNlfo7CnXBuUUjWaRUzqDYkxsID2Ed5hhcNoMtFsCYVgDEkxYemVfcrZwoVgf0ApPX15BizCt4RTSEEIkw5Ujk88paNMmvEkzRft1kIZQcDjXU8xbCOUVl3D6juPQovwO89bVPx7emY5nLGPKaT12+NRoSaY66mKtDzFfCXWixG0EEtn4iZIKBAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KAf8zktYntgepl6ZBlME+EV6398DKqbulC53FzwITI=;
 b=WRIcBJnd2REnQtqIMNPOJIzuYqp/lbbauT/4cuMV4dnL1ge3axTUif2I07Jv1gMVl/oPGDXHakfSDZQAIG8q6ndlS789zEbNeBeXuavqP6KricUOueteFwf47KZayL6lLN1UQpyiW5EWA3Vb7KSdmVmRhH+17Ft4Xv3U1UckOPCZ533gTa5q7wq4kLr4tlEox6b123/+t1/mi6Ihhxwl9YtVzaCSv+Cie2DSDfDXMhWsCXq9Y27bSNw+ZH4JDVBXI5iSEPXN88oysYQn2Xmwqd27KmjoMXzpubbA1/KxPIuqkC8xETpXuouClfsYK8WOzPWNdvx8FSxOZ7JzxO6Fog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by IA1PR11MB6170.namprd11.prod.outlook.com (2603:10b6:208:3ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 28 May
 2025 11:18:26 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 11:18:25 +0000
From: Meng Li <Meng.Li@windriver.com>
To: shawnguo@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        Frank.Li@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, meng.li@windriver.com
Subject: [PATCH] arch: arm64: dts: add big-endian property back into watchdog node
Date: Wed, 28 May 2025 19:17:51 +0800
Message-Id: <20250528111751.3505224-1-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0238.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::34) To CH3PR11MB8773.namprd11.prod.outlook.com
 (2603:10b6:610:1cb::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8773:EE_|IA1PR11MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4f7c00-b75f-4e3e-8d8e-08dd9dd95cf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S47lYpgWtaROEkoi5VQ2qK6z5YOA4F5OKQYhNi1lAkTUfYK/uNOH0rA1f8Bi?=
 =?us-ascii?Q?LQARBOTBGBC3A5uOri6YIL5cj8wYy12PUbrmRYCzBccjC8dhir+Ge7aEFK6k?=
 =?us-ascii?Q?Pbixcskdg8SOEnvo/z71WkDlav95pNOnoujQiT5sPlyxycNiUuQymajnrKjm?=
 =?us-ascii?Q?sfsHtYNBustmpjmHhIBKX4FDg+0lJV9cFcnVnrO2mEf644zW+A3eoGZFsihg?=
 =?us-ascii?Q?oWvnVWo+oIwBHzncSfnfCgRXD7K5Es+awEpEgOVdjPSn1Nn973k0BIy1ZNfm?=
 =?us-ascii?Q?dMM9/0EZlxxm8W5taKAQMxARksiMfLIVMic3sWZzqKle2PYQrQNFjLQwfeNo?=
 =?us-ascii?Q?R1D86fIPfBekzcqPFilfvT3hAxcHGVn+fbTb7KghbNp35mSyeYGLyiier+WN?=
 =?us-ascii?Q?J/iuvMAE3xp2GWUiJRS7uk0H+P4AgpIe5dbb9Cv2/tPfmAZBMiTqzapTiMB6?=
 =?us-ascii?Q?G9w2wtgWqmAhNceO2yPxVif5TuNd4GDyiCk1Sx/qHLymw244VIM7aggmYB0l?=
 =?us-ascii?Q?F0p9CtLZY69Ka6Ad5VwiRmdrwTC3PV2FKsvenb0KneIKRi4YAFP7paSMQWAE?=
 =?us-ascii?Q?8A3sWK80y8padSjM4GuHmVaKUcrGk0r2xoo1kbUh6Q4JZ8qo0RZUoWOvMURt?=
 =?us-ascii?Q?Ked7lPMDT/qszDuSoDG3YNaXaE4YFXe3/fyMEgQuVzCCI3nPlinuNGS7z6pk?=
 =?us-ascii?Q?16XkR4jdbvliYPqexfjBYnISgMmxpgVshgKyOW/c2jUv0izbgSJpLPEveoti?=
 =?us-ascii?Q?KfGbJyA4QExTtpdHyqjOfTzTgN8h5NYoe4kQCv9kVvATNOD8UDTcaI89zx/l?=
 =?us-ascii?Q?ZqhXXo3Ijr9mhgW4c7m3msLIDutSaiEav3bvddKQMIvdWM1H4p3ub3GY4gUr?=
 =?us-ascii?Q?kL9Vc31R8n/iKN2o3Hu7zyDnn6MRNWxCpJJ3XLQ9VHwqG9r4y2868qc2VFtJ?=
 =?us-ascii?Q?hnNInEB16HcZPQNqGGZsxH4Vl4FMz50Q36LnpHiwdTIfC45ASoyn8xxSpcVG?=
 =?us-ascii?Q?BuAkdy4hPQybB+nO/cMruUSlj7BAZj1H8KpMvyMzFhSRPcQg66ZQzGkj8HTv?=
 =?us-ascii?Q?WqLU3wEYaIOkhUKGQLnLtCkB4FuCiGX652sQ+OCZdw/xPyL3GNhhDOOTFTA7?=
 =?us-ascii?Q?Q4oUv854dUCPElLqXnAFGgT/ZPGSWGSfO7kWTfKfLja3dQ3fFAOf6rMbI/Fr?=
 =?us-ascii?Q?0rM8WvHtXadLQBFM6+FYdGJbLJZSESRtfDoi8dxOVS/BZiJ8c6NGBOzX+EWu?=
 =?us-ascii?Q?aNQCE03Uo+G7HdYkAI7pxTY6oRMIrjXQNbzEJ60f5D6b7SuEPef2+UMQ45R+?=
 =?us-ascii?Q?rh24PyRhyA4Ru5huC6fwbcBMafNI/2GNQ6H6nVt4oF2MgnraCSlnYTrWQRsP?=
 =?us-ascii?Q?uniEU1uHLa9OLzBukUeb/jmaBdz2hXPaB5PIkPZboGhARvOAMZ3hPxshGB1G?=
 =?us-ascii?Q?Ir5Re9dMqKzcfeiG9871IhNctYtRoMvCnmDXOZKJ8U1UIQj07cvWIyqZcduc?=
 =?us-ascii?Q?SFFuFwpNU+O0MLQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AWydo+DRGY+BM1OAPnuDuHhZBSJLMM4Cx78MX14eZ6hWxjqAMLWl5QiAyZ+4?=
 =?us-ascii?Q?GUEX3FK4Lyi9jXr4sSD7bQARQpG/W9GXgJIj8Dd+ql7ijADLjSZFpZGRUvj0?=
 =?us-ascii?Q?qTx0filjpea2Z/2qRaTZG8SIRgvNNSTHDws6CxcLZJXbZzev+fP1QB2qF40X?=
 =?us-ascii?Q?gWt8qY+YAv8SF6lC2BeSTMZda3LJFbHaQ6ogpMLclHcNFL++gvo2RCMPjvy6?=
 =?us-ascii?Q?XZhcI2Or8op4XJbpBW6OftUDNmkZSTEiunoDHrhwscQRPXjSnbPAaYpAooP3?=
 =?us-ascii?Q?U5hCKePgSKAJJCMCtRf4DOibEbX4njiphDQ3RclR7gZLYG1+t6WKdmMfD4r5?=
 =?us-ascii?Q?2yAZbUehJ+UGUpbspXBxlxlquMBADmUxpMlCtkCq+iOt4r+FZRbK9u1NV2kw?=
 =?us-ascii?Q?YE6c89uBx5GVS8v/DRUg8wI7XJVmm4uPoIOR/guwAY7ZNmIxwfW21sH+WCks?=
 =?us-ascii?Q?lDsNRWMhp/QszB9HJOxxmX3XFbTBghkos6SKHF3kuXgqH8ssBZvA9pQEOzRM?=
 =?us-ascii?Q?+yucliPdnXPaxZZtIMmxchlWVfNxtuNuJJZi6zOFmRKgcQ4Lz7P8405hw4fn?=
 =?us-ascii?Q?NalIPs0uhCv5pTW+fGmh0qWgrD42y3wENLER2uXkE9/2zTceSwRDTLv7olTF?=
 =?us-ascii?Q?YIP082yZ5+rLmnkrSLG9HW323TezK3OabFvbq37+Xl2cmr8QNnGGK5JzbmVh?=
 =?us-ascii?Q?j9N3kUzb75Ru1IRqT4wgDFvTouDW5kPk33pD3/DHIyAI94kioWCiCqQl9Sgk?=
 =?us-ascii?Q?wYnahynE3QmPCd+DhW77SAkpBJPMeHQs3N7MWHSaeiwkm+yqz4th7ZJUxl45?=
 =?us-ascii?Q?oEc6iDxhN8zovwHexmkt9MjZ6WJ9QzzGrxG0OLAbGHDnH44g9nP7TQkvi1+g?=
 =?us-ascii?Q?O1JEDu+Xc3xZe3r386ovd8Xa4vWmNQkas3uX2rqdm22+vQ261BYlrga/tsug?=
 =?us-ascii?Q?H6JClaf8Xl218N82wGr+6RPtfdUNMHhhPkyqoFgbXESb+u7sTRBZQ2O8n8ve?=
 =?us-ascii?Q?DZd2T6Lv6OPlNPec0TqQ4uS/lAjSSScOSWc/FxrAtoFf9f3oeQ5jgD+6Q+Ig?=
 =?us-ascii?Q?ejl+SX51lKYUhzBiB1zconPd5dnBsotfJ5TrykD0WbVKvBqa6K2O2MCVIaA/?=
 =?us-ascii?Q?0324tJDppEx7A/jv4siO5QyNnQmW2q+vIpW2YqFVoswn7AttAFU3r7BQ+Lfg?=
 =?us-ascii?Q?D9JGia6U7m/BuUiGD/cs7yGM0XgFD7PbgvOxW3vc0cxMjYphF1KuczuEN1sO?=
 =?us-ascii?Q?hH8285ictMcQ/V+j23b4FfR0kCGILn6Qp+GJjefrxXwVjEuVu1ZVcxHPw5NV?=
 =?us-ascii?Q?xq7k1BDZ5PAUGAAAgmnMZ8oKO6eWo6/RlqG6NmAulJzSLlD1LZNfkQUxH1bo?=
 =?us-ascii?Q?lcabMmwtqpChCjWa5/A2vklUOFkfi9bAXJbivOhReWhlORYFfO6i9B56WFHd?=
 =?us-ascii?Q?SBYdM4FjDBA+ritHF2S0l7sCb9Y8HuyNzivyMqZdfwgZmTZIJjOwi4Q1WAns?=
 =?us-ascii?Q?eVbkZF7R3qkX12asWCCtQQA6KWSFPrWwsGCD2bLlRNgmGYwhUoTOv03ryZks?=
 =?us-ascii?Q?lVPY4dF68Vzzp5zV08j6pA6s80Yy7iTRKvzMl+E0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4f7c00-b75f-4e3e-8d8e-08dd9dd95cf9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 11:18:25.6356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+OsysrgMNFgLKnBLHFviZNJ6f/B0F+9VC9UO3Ctgr/vv9Arl0wmF3pnxY9e1KHrPDawbkWlr3arQJz+vjB1iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6170
X-Authority-Analysis: v=2.4 cv=WpErMcfv c=1 sm=1 tr=0 ts=6836f106 cx=c_pps a=YRgUXLKpRSw5ivdzyhLaqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=0RPOJI5F6hdgO72ru6IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5OSBTYWx0ZWRfX2aSUGddMF9iJ jFyOepTmtxeEw6yG3fm/EyP//8rYSF1KZkb0DONCKcq0uZcbiRDswpNiqkOMHsITsS5I4camAPJ p9oM+koilqZWxXMDLeo00wJwWmTEN0DqRkCE8m+LPT9h+cM3ZLPIRe8tUvLReEkdaw31yEU0PvB
 Q1evgVA8ecNfT2MGEPx/nopmmWbDX9hQUxpi61y2s9CKlpSyNb3UllU8+B1/h7yYsQfJE/9ir43 MiH1it27/9+HLCYh/qPryseQrDk2mhOG4+p113FL7nW14kDaO3/0VdsiIM/13lbtIy10NS3VgWV Uw/1e8AZlScn8rSN4dKHs7oOt16Ewarlr5kH3HnyKSK+hofcx0Eg5gsSb2p33A4sosvDXa7rI1w
 UGDifxzcBdCQWe6T1BbIlBrG8leQZ835OK2hsF47iusKN2+lcqVM2FlrfDvO/Win4iynEcYP
X-Proofpoint-ORIG-GUID: qWPEL2-eBN6llFP9oBaBKg19aK5f5b2x
X-Proofpoint-GUID: qWPEL2-eBN6llFP9oBaBKg19aK5f5b2x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=834 clxscore=1011
 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505280099

When verifying watchdog feature on NXP ls1046ardb board,
it doesn't work. Because the big-endian is deleted by accident,
add it back.

Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for mmc nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 4d75bff0d548..e15ec2e1cb04 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -753,6 +753,7 @@ wdog0: watchdog@2ad0000 {
 			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
+			big-endian;
 		};
 
 		edma0: dma-controller@2c00000 {
-- 
2.34.1

