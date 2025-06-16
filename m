Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618520CCFB;
	Mon, 16 Jun 2025 14:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085466; cv=fail; b=aJGRiPMNjn73azpIs+tnklU1rDdC563TbcXb7SPbBOaQpQzTOClngnYUZszKaMUkKxNicXrcfptLgId/CLKQ6yvcr5DshKPfj+RqflgK6xvm86oXrvm6ZoOG6O87BICgvvobbD++cfGOo72r4/K9qiLvmF7LdrR+teS1OWCB698=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085466; c=relaxed/simple;
	bh=fd9QnJEyKm7dVyuAo4g9NX+kVf1Fo7ymt7E7NBltu6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LkI8CrbbHScr19TrO4YyirGghN0xOmOYBSqaBm+zLhWmBnWh2lAN/vn550PxwGxR5+l61q9mOM5b1h3NqvaxZ/fNAzVG3nsb96bBKN9ZbPcDTbI3uoYaJgqLr/N9gC9sFj2y2qkGOMK9gemtd+sx4N5kC0aWSw4UwbJ7zLd/yyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=oovda5JZ; arc=fail smtp.client-ip=40.107.102.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="oovda5JZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKcEx0Z2BXci76KV6TpeLY9waSQCWWhvyL1MORW8eO2T0vAkBUCoyPRE/MZKNE6bpuPuucefU9sbD3eYWWsQro1u3bstS248ONqnyarpKP0iOH4nnOR1HQwgO3Xh/yk3BKWvDSmUsAdgVqIVIvPQSl7qT+8/JZ22nOu0OCPLoj4jY1GvqtPe3TPta8lMURM8mYU2b8hiGkDFXzx7Ny59h7qZTXYF91fvxjM9AqlzgGQP+Gx/golWmLsZHkxV2LZnlIACyaQa6gsr0ibvMZaVvxXVIooGoHaMwbwaviz6ZEm5I3tnsBKnaf5ySJytGj2RjE5+E5Zq+CbdArwz/S4CSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqmut60ml3P9Ixkpc4RDEtUcGi/IENx6pAuA83pen68=;
 b=JPuMU31oCefO8+8KsiV+Gvt+j81+G1y15nnNK34zqNixnRwxTEnzYUoxCXXwYwHCEK+rnPGw8e2ax6P+3i1mLPX+2W4huwyHNma9yvzEUrVV6MzctuBiN9uZ5P3mQandD+eShqPUwLhzjheGIxwhdBCMJozHQRV7aKXn1uH4i/EV7S0/h0qXx2z1d7386N/0favNezZOtTAyriN66G8XFHB18VlHkQJboDoH01kxCSSeDGPT6JD7X1OFMdGjQqjnIic7+4n4GJt/kwVPVHch3uGLdiv2u7q3t6yw9KPhAJ8bSv5jy79OaywDPWNX7j9cJUdbYVQxarkURXx3LHDs5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqmut60ml3P9Ixkpc4RDEtUcGi/IENx6pAuA83pen68=;
 b=oovda5JZ+M+a7hlp5B6tYkMqmcdvXj8WdsKP/GRaAlBCNMWnVm0q+2F63GFPHA4xjd/JgDoqr2FpSwhCmUQK3w/SCRuvTw0ZvqmZCbtpsJMzQhz2hzo+mZ/PVf1hDWfuOzeF8O48IR3FjRKctiuaryJDtAqsS5ktk4r+d2Dw8g/OpocUdI3hyAOGMRgIX7JtHivTLd8uHGUPvZKUXakcs3MGrnt46t+lkDHT29gEIV41FiAyHybsePVkDobGHQZG/p2LLhwaaTnCKBXQFhfjPt2qLPtcjEKTWGunv4fV9zpyyECGVa9LRv8RDXkEyFXQ1U3DVqxjJFIcM025KYK/oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ0PR03MB7128.namprd03.prod.outlook.com (2603:10b6:a03:4e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 14:51:03 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::c297:4c45:23cb:7f71%7]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 14:51:03 +0000
From: adrianhoyin.ng@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com,
	Kah Jing Lee <kah.jing.lee@intel.com>,
	Matthew Gerlach <matthew.gerlach@altrera.com>
Subject: [RESEND PATCH 2/2] arm64: dts: socfpga: agilex5: Add L2 and L3 cache
Date: Mon, 16 Jun 2025 22:50:06 +0800
Message-ID: <20250616145006.1081013-3-adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <20250616145006.1081013-1-adrianhoyin.ng@altera.com>
References: <20250616145006.1081013-1-adrianhoyin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ0PR03MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 45cdb5ae-86d4-423c-5ed4-08ddace53765
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DvvTHQ91ICXrR1U+LSAQyBKBllc3WSP6Vy00OobdXWRI0iPOLDBl/opnTYiP?=
 =?us-ascii?Q?EC5xNRoujBhJ1LX+9MEonQ8E9QQosY9fZV4yxCyDBBspkk43m4FhUFn342LH?=
 =?us-ascii?Q?wA6hatg5jJIPBeNton4cEwsWLih9iFGmK36jWedYsHUU/hQ/O5LvwNVJEdSy?=
 =?us-ascii?Q?hIANCDUHNaJkxL3DkxiEoHV44+fKZOF6aqEqY2GF+zzmKrwVSj4VIdGYMiJp?=
 =?us-ascii?Q?BAezXGItX4p2XEGBDIrndxcTdU70x3OfDHkhuQVwAA9HOCX1Xr7BINekL1rN?=
 =?us-ascii?Q?7oXVFAewZM9bf85Pr+9Fym5vX5xocxI8aXb1jaRSKpTcoGCGFaz8TVeq8Dpo?=
 =?us-ascii?Q?T8Y9oueu87HD75dcHiGc9YcRcGwBOYFg7TWDyf7vRDP1buTQOxX+N5Zd9IZ4?=
 =?us-ascii?Q?6UIM8l7ta933GJ/mv+YD4Ian+JLM5n1aybRz1JrOvrHW1n/CPOXzMtZ3oxqX?=
 =?us-ascii?Q?naztLFqZS7LlPJeziXk8Zqqb00NothfdFmvp11iV4pAQRBHFlWEwC83XAFxW?=
 =?us-ascii?Q?bD30aUfQ51319Oj+tk2kE49HWiQhoW892RGw6/eM1sDp8qmZ0K47d4YmxL5C?=
 =?us-ascii?Q?ag4iUR4mra4ANmKmLI2awDYjaCtIY2rkeeHmRr+lW5P7FkAAFqXjR+WvRFV1?=
 =?us-ascii?Q?GJ/ipA+xn+XoRxw30lD2fsvqtWvT1JXfHn0DzQFXW4bFRvIMS1v4jYbZZydI?=
 =?us-ascii?Q?Az6qowSXSZqLOCrOtAYWneUr5T+8oijwywK4USR9TdtfrOCZ9y/k5WUAsDNN?=
 =?us-ascii?Q?lAeEtKbdBoQrR8MEcVp6EWF/AYmej34tZzYj8f4RF6KmDr/4P22Uko5E3tnD?=
 =?us-ascii?Q?rLuXNkldG0ce4ySShoCRSaXJhVVBX61Uvpp+SfXc6qTyH5A6DLxJZ8vKFVmg?=
 =?us-ascii?Q?5XshSS5WvLXgxZuiZon7XbqcZbQr0Q0IK0CpPVwa+YNqHVrLrw4VRrER28EP?=
 =?us-ascii?Q?T//1lMYyvaHl4JV+NookCBtRRr4nzZn5RYX80zT+nHRWy+XzTnIOmf5PhE/+?=
 =?us-ascii?Q?8YS/gD0Ls8WNAqPTRwOmrJvxvEi2EOUyZgf0DWHir+QxQPohjsiC/e5BO4L9?=
 =?us-ascii?Q?nJKbLDHsGn7tZJb+Ys8nEGRb9YKXMdu0db1EO2tS8LiCClPmZEg2RElri6bg?=
 =?us-ascii?Q?HgcwSZ88cz/dnRbmIUxmnSeBcEhLn8TbtFCUzxFVV0Bj2sHPvjJJJDqowxSP?=
 =?us-ascii?Q?Ml+LSBh0Ruw8qUbAIzg9mZJgtatYisEtDdZVnTGJAVvcCz5bpydFJ7WGPPZ6?=
 =?us-ascii?Q?yR5dtfP5wIicCnzR49Ffm6RY+auiPPBCfynbLA2fYoOiXoIGtQpD5XRDBs5m?=
 =?us-ascii?Q?GR3W5bzV46oeVTErY5p/7o6yloFRLrTCc/aBDNSMrwQxGp2JdFyNpJrCdKI+?=
 =?us-ascii?Q?lXk4HiYoftam+bp38Dr7u7hEUl53s306R8ferBavZt6yUUtC3CRJn6eXXHXI?=
 =?us-ascii?Q?0SYgJjF3ERo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hul1Oh5Ykh3gm7BmogQlXwEXBLJ9hCVWoQjdtavgMw7amVB9ESqvbfxGrDQK?=
 =?us-ascii?Q?mV+KZbKJ2BqOYh5tnr3V8tbR5O61aWlvYuF+wGSaBrR77Ndi6sY8lu9pX7B3?=
 =?us-ascii?Q?U1nSWqC/bKpZj6m4GX7CAKuHc8Tl5jwgLoEy2ddIqSNQiKBKmx24f37oOy7O?=
 =?us-ascii?Q?TGYBXdpmLYtkjYYvadh3ZsvG8ZnczF8QjQR98+821mugZ7zE+fvO4Ji/MASG?=
 =?us-ascii?Q?FJiIJU8XIhkPQ9o8vCEiY5B02dMhiyzbjlxybewENSs1Gnm3vrj9T2ywbHSP?=
 =?us-ascii?Q?m4klsxPQn/7PF0byR885zOUpJT1/sw1/TSp+3cQqa1ee1kFXKpFutbBYGj2v?=
 =?us-ascii?Q?HpwmwvQ/bO8jQUmGrsXgoorAS1sm9hh7ZD9c0F2wWc2FaqxSIvlqblUEqA1e?=
 =?us-ascii?Q?PR7dOuH7PO+cnMhxXLgCFMmsJTIu7wBXrEtBUZeJaIA9vKk4PWFGBxz9f/iY?=
 =?us-ascii?Q?NRSiRBREuC7SpMmRzFHl9imiKmsrXEolXSJn2JgWQYWW/BSiIGOQVNK42BlY?=
 =?us-ascii?Q?2hhoHWfZel7IB68KFkp+WSM9JJ23H2HWbLzyGLwcbY8mshGxc7kvJBbGDPBh?=
 =?us-ascii?Q?a8Bz+x1jqG2lT4Ltvl4CKq3EpYoiFKdHAf612j+vzR5SflSg2j5lOvJHGlXx?=
 =?us-ascii?Q?V8IWciTj7ctbLcC2BodoXLdIlOdI0pkVEuBRVbJ0e0t4rzmbtOoKEJN6OD+w?=
 =?us-ascii?Q?uRZpnKgEjq98E2Bcq1VTBWhsvjh1cSvkoCBf3PLQkdhH+SjuDa2TzPXsniX9?=
 =?us-ascii?Q?jqHqer7QS9L6tso5CIo4Xnkn7JsYCDMIVnCX+xFertqF9qV7wFwGx5/phehK?=
 =?us-ascii?Q?N4/As6Bus7CtN1FZq3Y50H06Vs+JLyIYmi986A/wrRM4Op4e58JgnSnZEnNa?=
 =?us-ascii?Q?t6yJnWLSCRVPDZPeFDkT6ldI2Pa0bYVSAQHQPdkZ7YPatbHkK2L2eeOOaIUk?=
 =?us-ascii?Q?rdaOxIbPZrAms+NzBJGcs6GnTXJEGoSpmTjdvb4pAm/bHhO06ZbNdAqmJu7u?=
 =?us-ascii?Q?E0Ikoc58tL30orwyjpTNhjiOy9RZBAowpPJkqWWG4M1EUpn5cqGzby7QkbOV?=
 =?us-ascii?Q?aqCc0+XLTBPlUHFEOFKQ/Fgxg8SQrE2GGhF9dY9e4PsTvwsm2+SFyKXiD21M?=
 =?us-ascii?Q?pBom9J+Sh2V+l0cFayJwLZfm5Ic3kH02rBbtu23cL5Dn3JAotHOuDY/msXjt?=
 =?us-ascii?Q?I4GSTcUU/dIJGlINdgI4IeuZ+SrVOJ5oefVbsRuQFwvKKlhuoUNQZFdz05Up?=
 =?us-ascii?Q?Ugy3WaytCKmTw5I0hKIIeQRXDJxHkxKTcSBuwufZE2dd3/BzqzBkwQCXf40q?=
 =?us-ascii?Q?G/PGito3lVpp17mzOHRgSADI0aOCwtDi/pCzJswVg0DhbEunK00Rmv37jvRL?=
 =?us-ascii?Q?F1b/xt0VjAPWyq7K9EDP1KvatPojLP8drAecRnL4liq9dBJ+OSSeUq6I6VMH?=
 =?us-ascii?Q?xhhZ38jWasK4jOR1vu9AkRxx06+lGEKKHZ2/TZu/tZPgm+pXa6L2lu33PUrN?=
 =?us-ascii?Q?O8HvR5X7KjQOFBXJOt5yDXL1egxJ7e+iJYrVoaEPrSQHdwCQH4jKrhicIoei?=
 =?us-ascii?Q?12KNw4kGGROA5g/238aJang/rwMQXdUkY8ml/pIdcihPIgDqaNHCXXiOdFzG?=
 =?us-ascii?Q?Vw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cdb5ae-86d4-423c-5ed4-08ddace53765
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:51:03.5918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJn8j2T0FAIavXYepkp3FD7hfkTm9xl4TdfgtI0iqU0dD5KKGGxyby6oct+SaIQ6X5ZEhCwoQTpZ1lIsbUXalDqqOGlIbZj/DflpbtuivIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7128

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

Add L2 and L3 cache to fix the cacheinfo warning "unable to detect cache hierarchy".

Signed-off-by: Kah Jing Lee <kah.jing.lee@intel.com>
Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altrera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 06920de87a41..a66c92578803 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -37,6 +37,7 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			device_type = "cpu";
 			enable-method = "psci";
+			next-level-cache = <&L2>;
 		};
 
 		cpu1: cpu@1 {
@@ -44,6 +45,7 @@ cpu1: cpu@1 {
 			reg = <0x100>;
 			device_type = "cpu";
 			enable-method = "psci";
+			next-level-cache = <&L2>;
 		};
 
 		cpu2: cpu@2 {
@@ -51,6 +53,7 @@ cpu2: cpu@2 {
 			reg = <0x200>;
 			device_type = "cpu";
 			enable-method = "psci";
+			next-level-cache = <&L2>;
 		};
 
 		cpu3: cpu@3 {
@@ -58,7 +61,22 @@ cpu3: cpu@3 {
 			reg = <0x300>;
 			device_type = "cpu";
 			enable-method = "psci";
+			next-level-cache = <&L2>;
 		};
+
+		L2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			next-level-cache = <&L3>;
+			cache-unified;
+		};
+
+		L3: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-unified;
+		};
+
 	};
 
 	psci {
-- 
2.49.GIT

