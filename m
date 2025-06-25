Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52A526A1CF;
	Wed, 25 Jun 2025 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864499; cv=fail; b=RMrw7FXJSMOwQ0menGgRyZWJFP5sqC3Qmt/+jBPqRFjCttbwdqKBP0TKfTpyHL7NW53ikMsXYi4vPG5wFHtkw4AauAIPR9LD0+3OW47qOoNtm36uwWaywCBqKwFydI/TKVP5y7z3y1YesrvmP7EMy9EFwiq3gkjsoGH3tB91UsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864499; c=relaxed/simple;
	bh=HiblJLqrOIdSVNkiUm1NS9RgzqOII9BR8AAW3UkYaHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rgfch/XAF2Yw6dvBWhEHE7gzhM139nLb7jwaTUwgRMJvKb8O8kyJPfqRpA44AHX1q9gbXqTaFUMECX9iUJW69t1d6DoWvLHLc1pREGg22PqeP+JXMjVWyLBNKkgrX+057I1NLjSsyyddSnVA/JG/5/myXPw7wdpbbklhTa6bwbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=k19fJ7Bl; arc=fail smtp.client-ip=40.107.93.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="k19fJ7Bl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQdlmIAvKNmn7UASa4DvnRaBd41tNWy8PzQaUzZvnzyeQe0WTuTLksy1SZn/a6zRCWuXWoPUzErlFUck3gubgIchaEt6g42fSjRnewX1lG1GmqMmiz2hcqbfwudGjDcMFj22i3popx6rkbVsjSB4MieD2OdtxD9GyvhppfKqKPSoGl48hZHplnfJxe1doYsu4vHupcrZElAqiz5oMC3Abl8K7ivJWFxlA7t/XXsWBlTMXRIfdg/mq4woKB5S0/2IsmAuwPcT+/OkyFkwuznK/kBb21qRrpDmgwGKSU6tWUrs4jRf3BkjOwSLJlqw1FAcnSZRIHqaBa0HW7P1YYIXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t41KmohNHrm3FIltMkEj2sowDlAjvbT/1IffcPcCBtY=;
 b=Uu+/3ompaajxp9crTuAr3cz8o7EuXsRzDLo4PRRO9j1J2u4j4q8FHPzdLwdGymyWc42hZ7IA5j2voryQK1m2T93P8wLJeYi220VSkJlQI3BzhuWRNnK7zfgvuPoWS3fEKssQcIGtuZYZf8kZ34MFHXCAA9knxKwboxragaxKTkrOW6GYdwv/cD+njQ4V+fLmlcCi5RFT7c6uxQ7azSnwFNCAUYWk9SEJZGVHqrwb1WoVqfkQf8e0mxwiIDEhJu0oAIyTa4Obcn+n/RRU3Eh4fPM4D8UreFH0MIPifPHpHXDktpIVYxllF+XR0BLxfPFZzWN6QsGZMPfDgwa9ecawHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t41KmohNHrm3FIltMkEj2sowDlAjvbT/1IffcPcCBtY=;
 b=k19fJ7BlrDQFEl/s+L91Li6H7iB0nOlMJNtp/+3jUZxHzhYIf3Y3FanmygJAEOrfqHMgUfERkyOoS7Lx/Ukb4V6wuYTCDwEOd8+JePpFmN86w7a7ActZrD3lV48OP0pUY27kHDAqUeBb9x29yxsWbTJyO+P4EMwZlXhuYThma+tqmfBSSJF8fOuY64ALAfcK9cxsCBvywAU+68BZq1ThLkhN21Og9ZBJN1Suwi1yR8TIvkRAjc60o+HuJ6v+Q4i/jH6A4rv8ompOPEUn0fGaolh9mvH6V4opWI91e/Agwr9BIogRCO2dQ58N4Ddgwo0DzKAQgyhTcABkX5mnK3PIqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BYAPR03MB3461.namprd03.prod.outlook.com (2603:10b6:a02:b4::23)
 by PH7PR03MB7048.namprd03.prod.outlook.com (2603:10b6:510:2b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 15:14:53 +0000
Received: from BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c]) by BYAPR03MB3461.namprd03.prod.outlook.com
 ([fe80::706b:dd15:bc81:313c%6]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 15:14:53 +0000
From: Matthew Gerlach <matthew.gerlach@altera.com>
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [PATCH] arm64: dts: altera: socfpga_stratix10: update internal oscillators
Date: Wed, 25 Jun 2025 08:14:42 -0700
Message-ID: <20250625151442.42191-1-matthew.gerlach@altera.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:40::23) To BYAPR03MB3461.namprd03.prod.outlook.com
 (2603:10b6:a02:b4::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3461:EE_|PH7PR03MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: 24005973-0c46-4e0d-1046-08ddb3fb091b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mr6ZT+4JFOwWOE6B82/hwmrytyTN5AZgMqrPgH2ub2/hrYkGjRIdIt+mSTRU?=
 =?us-ascii?Q?ZEpto2oI3pgpRrCtv9fzJYlXVj4Nxc3TPBnyQsELV4NNYsFVTZ50x9LQ13ik?=
 =?us-ascii?Q?S+vZgr/+fNZhN3hwzHW3AXei2xSo823QIQNrgW17VljiQHPXPR7ZRQNf2xes?=
 =?us-ascii?Q?bzk9eryEi1AUQXcppCiK8V/5zrjqwJXHpiYRqduUzqh2uTb5MaS55lTe4mOe?=
 =?us-ascii?Q?7sHKaCbvReKUxakNxf+TE0fF9Wsle7asDK5T/cTMkFoHIyZHSaeMCMRaIy06?=
 =?us-ascii?Q?UyNfTMdUDTdjd6pDY1nFbetSByp5mWtC2c25t0RQPdIngqz9cwrvK5qrxovx?=
 =?us-ascii?Q?TnmjSw4lMmrKofSguLwG73hhN41MZ0/WeikPnhjptq641b3aeDh3f7uKGRcN?=
 =?us-ascii?Q?igzUtKY5UKEf2yjlZUUL+o9WZOIiUG8GcvtfB9Ec8YktTx1bOisqZFI2EAie?=
 =?us-ascii?Q?UMW8crMkcM2ASfozfDYnusxuysJNgXD/4eCnDwcdnv7rAFJPusnvEGIafmGE?=
 =?us-ascii?Q?VNUpD6IQHAftxZVigUjhCtLlpb9D8WXK7adUFrcZNM3w+9Pv+hORODIMFPa7?=
 =?us-ascii?Q?XKocHUGqgFvl+tZjlsFm2WX93KdSNLcwQhJJnscblxzaB26x8UJIjynWDbdt?=
 =?us-ascii?Q?jIc/MsFF8Ku5aycJHzL7NUaMnBpikLTF+Xr8Wbc07ly9xJhivo7q39f6f67W?=
 =?us-ascii?Q?xoyAE8Td1N5KaX6MhURInw76LYQsWEVeO4lh+uPjQdVOFO4uw93ZsbLEeAKL?=
 =?us-ascii?Q?Tunib9lv21bUr+QvuN5N9YOwooiFO6KzBb1AXYTYXj/sFHT3p9yK7+lxxRgN?=
 =?us-ascii?Q?N3dLtmrZSNCAmAKrXt/aUQXAXjkME3VJbj6dkbCXV2Mm1S2b/TF9FgKD4ba3?=
 =?us-ascii?Q?avRIMOcVa0F+q9RhYJ3xIZ/wtFidGU1zCp1q7SeK/3wfTjP/mF6nlCajpZ3b?=
 =?us-ascii?Q?afGcvFeTDShcHmF34SLUC2BrK7tOxFz17ptqeFwqxlVf7+UiYyh31TjJPOfE?=
 =?us-ascii?Q?2WSB8lxhwRsjS8YbH3ueZOS50xTEPOQK+6S68nA8rN+GZPNFTBkdyNgQiWiM?=
 =?us-ascii?Q?5LD3aSI9PtzDUVgs9zybQGBTg/PwgKCs+mP5K41wXQ9796Tw1wNjCiEFriM1?=
 =?us-ascii?Q?xLCNaPBd95n6SZqXDRqrvL51r7hhyPZ9oxAYna4RRemf8uM6nxBw+Jm9X+A6?=
 =?us-ascii?Q?/060IvBs5RRP9cA0X/1WfzFrqfjIPW30YicKRn1ylBIz3kjKFREJfQCVkg4i?=
 =?us-ascii?Q?BJaP3GOounewxb2LaThHC6cPU6OaZQMlgxtZp1rke1+ZjquSEsHBVcJNsCOI?=
 =?us-ascii?Q?nvnVgMtj0DK1uo6N4QxrfVh3fMc+h1h1QUGFjBAPVjiGJR+mTGs4avjM46mG?=
 =?us-ascii?Q?rGNfuHw3rlc4XJIlbUeUMit28ku+u+wNUT9EYXWJt41anKDqnud0UhuP1EVC?=
 =?us-ascii?Q?RyY//BG4mPs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3461.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sa3VHY7zdroxJ3slGt0dpkI60nNkFtvx9p5zFoLWAWFy4gI48Kv+mAn44GR8?=
 =?us-ascii?Q?XONhZVJdO0EQ3AKsabLe/etbYb1pWZXEluEVwa+PfK2l5K35/21wk2XSe3zb?=
 =?us-ascii?Q?N3oSBEfsrdukQ/F47gSuLdoys19poBuDAyv+/Lwi9KkaMyVjaH57SBTopv08?=
 =?us-ascii?Q?eAivfcHJu/TfsSYpoOJxyIb8l9BEieVpC1UzHgne6W8rByB855AgcShn7pUV?=
 =?us-ascii?Q?ArtuEu3ckT7x6fq7ZAxnZNsj/XCP6VnYLD9GkN2Z9c1hi1fHab3oVBDvRBJc?=
 =?us-ascii?Q?gKvEMiGUatOnfXQR/q13VSKHjvE/JSaHegpmum0bIPgjud33SC5+QmlRxfY9?=
 =?us-ascii?Q?M5ET09LnvdFUPDGQ/Y37E2sb8lcCQTDkMjXhgCOeOgxUQQaGBlbcwoS59hjR?=
 =?us-ascii?Q?XDoUeOytkiLQfBeo7F3w4qN1q76148sWzKzchtSP1Tgm/k54HMhCspBcg8Zy?=
 =?us-ascii?Q?lJCgmhAVmWf1sOoX3iyoT2I6BFZS0Up4rFxuhnjV2YelCIe82d/SI832BeP3?=
 =?us-ascii?Q?fHSHpy1lKj+RCikSriBnd/CvstQlJt/cvkyKzN78FZJinZPK43jhD3ivfETb?=
 =?us-ascii?Q?3+CGTBHkofeOFPKk4qeaZ4UcLOpTsZRAL10D8GF5Amu0oRQhzISEqXryT9TT?=
 =?us-ascii?Q?e3s5pA80cLFwNkEP89RGzXakAHoqgCxEWKx02T25vYz4zCCcl47ikTFnjT2h?=
 =?us-ascii?Q?gZIeVnNqYDKv2/n9pK9CKIi6mQdY+Q14oqtD/PgvIvc5xYN07gl5AO5+WzUQ?=
 =?us-ascii?Q?WP4JEujCB6GYCddPbKetCyXOwP5zhsEJNL99Y+Dlw7KM/stbbmqoBJJdlFTD?=
 =?us-ascii?Q?I3BNzOBNbfWFzbbNdZzuit/aQ+7kD4CaQsfExDxNqTgvaoMtaXRFJv6+eWPm?=
 =?us-ascii?Q?/ONW59Emqj75RYJjnO24xp9w8FCsiyrplZuKyhp+b2TvmOpFrnttnacgEdEo?=
 =?us-ascii?Q?ldmey8KIEEsoGi/W3hO701bMsYx4IWn7A9gfmfcXe5bXTionIr85SBvdUlOs?=
 =?us-ascii?Q?R9ztTBAnNNF77lHUEoZAi5mEdvVyjx/hHDn8Om8izNvEpDh8/DT4uhZ7/ciT?=
 =?us-ascii?Q?MgEH2uKh7/8I8d85bWl6gH1dn1zn9m4KCBSIjPiRToUHtgTx6d0hEK+IEcjX?=
 =?us-ascii?Q?Owy939KOvVCLcbhoVgqXDHfGn5BS5VOs9F6o77SX3OUwYmqw8pB3XWYuh5Q9?=
 =?us-ascii?Q?ewjn6ibISgZAaIoAlAots5+ll64k0NVvGBtkfYjdqO7cXCEqr/WSaPmZzgcG?=
 =?us-ascii?Q?70iLcmcSy2fnZiKRRZIbn7aWFBf3vhDBbbswParRN6P0hhMcVKePZMnA73VV?=
 =?us-ascii?Q?j9vV7NQAnmZ29GrLpfmm95CJcYmhByo9w3+dp2lpOzLnz8yqaLBiXTOeWt3Q?=
 =?us-ascii?Q?EAaXuTJjQuSIpnKCSVCNrSYdVhTRHAxkbf+M3crdLLtg2hpnEheT3OqDoUHX?=
 =?us-ascii?Q?y9r9lR532lhXBivMbL0hwcTuWyV8pDsVbtlEHpLs55a+7f3WywiWqZ+fwCxF?=
 =?us-ascii?Q?DoGCGvFlB84Bq73nEsvp0+dof6iWwWFPflGJLdHtsKktt0Sdie7OMZDGnJYu?=
 =?us-ascii?Q?nqGP/VcudSO1mz0+SCUz/8QKXd/EJ8LYKaD7o9gFINSzV0K1SSmvnjeOE5W3?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24005973-0c46-4e0d-1046-08ddb3fb091b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3461.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:14:53.2598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07SpfoEJtRVfRNOpKwQ83krsxMYH6cCDJNXBoj6NBdyDeVhdKDPvagQpzdszOGzI09J1YGUmmpxXWHe0sD8+2pZti2/X7eC9PdbI0F4Zyxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7048

Add the clock-frequency property to the cb_intosc_ls_clk and
cb_intosc_hs_div2_clk device tree nodes.

The f2s_free_clk is implemented by custom logic in the FPGA; so it
should be disabled in the dtsi by default and enabled by a
dts for a specific FPGA design on a specific board.

Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 0def0b0daaf7..ad611f9e431a 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -130,16 +130,19 @@ clocks {
 		cb_intosc_hs_div2_clk: cb-intosc-hs-div2-clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
+			clock-frequency = <150000000>;
 		};
 
 		cb_intosc_ls_clk: cb-intosc-ls-clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
+			clock-frequency = <300000000>;
 		};
 
 		f2s_free_clk: f2s-free-clk {
 			#clock-cells = <0>;
 			compatible = "fixed-clock";
+			status = "disabled";
 		};
 
 		osc1: osc1 {
-- 
2.35.3

