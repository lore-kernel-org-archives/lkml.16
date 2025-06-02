Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F7E23D2AE;
	Mon,  2 Jun 2025 14:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748873590; cv=fail; b=XYZqJSrACjeJuY40dM8+oB7veLcqUvVCMDx+hM1LUNUkbUR0XZmyZplvT/vElnNIbKy+Ut6X1gKqtVTxORCFlyk1TNs0/5m4eTKFuutxUr1vSaufbdTiY9wCJZhf+6YMcKdrbEm8zADbE0EX79VnZPGZpwu8XFNBtTQCLsaYXVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748873590; c=relaxed/simple;
	bh=vyuethjiwjZHFmN33hbjzNmS3blbBcVmZYUcyy5qvrc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MUuTJW3b/pjtrR0sYTaXUmECDJTnEvTx5KV1zh2hsOAl8yAegrGpsmAN9aU9/LoVr6cFNZbkKccsGV5OhbQd0OlVf8Y/2sChk0qhHO07EOM1eUlhaxFa6c/eEKjwR4/laBR1BDSJ10ee/1drXC/WMvHkAXe5ezvoNfWY/wYPZFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lkaCZnWU; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lkaCZnWU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yV3EQtz1oZUC4bxGSaIIrkM6FwneiFF9Ag5EOV6UDtY0YzKO8UuNKJtg1u9Wyo02Im9xYqibsTzoa9MI/bH2DAmI5YIabHnH8RMmS9shVPMHus18i3z73qT+ij1H7yn0KWkV3IJcmh7JhVMKVKOxkJJFFgm9GeE0zkbU3ued+Kw0leCMRIK8sVE28uabgTMPQQu+aeDNUpYDnoufn7qHLcls9kJ5aFP/dkoTZA5VRTRgM0rrMzWfw5GcKlAc+lAHwoTKc81w5s1IimmsI7cUev+j/ePPJ2aZYQiCUm9N0uadxPSktOPFFSLCT9q+0H2usLQUDwGljwgCkWKNJyldJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBkRjcKH2Ghh5BK65aJN2fT7JGxothdqjzpHYhWvCjk=;
 b=UgGpEBf4qByVJDUI/+OrKgmlJLJLWk85mxGk6g7fSoU/nNL0KIVeAuAA9qKpLJArGlgb06aoHUT6KBOQlcV/nsxkKf6wKMRVzPGKiIsZ8MKb2LdLwubXXGeW+86dqHSejjdImO9V9fjoJvEDMT7lyt1zQi3t4yP/8G4XYMaVPC2/AbCEa68Ae8KwOOfwn0+HarLcU8dPkOVpWBJKAhDoez47HukJ2ocd1N7sU0T360mVyHJp2qBJnmO3MNDUqa5m4c9J28dYPbfnZQnRTwGQwuA7ylaceKSd7/BOM8jJq/iac/XFS0uE+SJS5OXVfGp/XNKMXDrUBVTt9e+zGU7j5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBkRjcKH2Ghh5BK65aJN2fT7JGxothdqjzpHYhWvCjk=;
 b=lkaCZnWUFKPaxUoj9U5F43GmzpOeftnDVpn6u8R+1iPpnVA9d6f6gmlg6kmccghEhlAo3O/7pV0rXRaoKabw+kE7gRYN00hbqksOyiByyVRLVd9p191f6vP8N3LQOg2yTQu1SXd1/3YQ6RVp7oZ4//+xoTOYsiMQp4LnUrte9vM4WDBzb/J8Pq2dt5e+9I+PV0YVu9gEDSnbSZUwb3mjaqAnSg308CBJ0f4FZo60ENzyhs5KHzvNAntGqV9CJDlrgyrCdX4uW7WPrTGEVtNcZ0SX71kseXhI+Fwor62P4JBHvemflOa43ePwKOq0Se7q1O7PADMpLkkni03Z0JXGpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9127.eurprd04.prod.outlook.com (2603:10a6:20b:44a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Mon, 2 Jun
 2025 14:12:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:12:59 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:MEMORY CONTROLLER DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: memory-controllers: convert arm,pl172.txt to yaml format
Date: Mon,  2 Jun 2025 10:12:45 -0400
Message-Id: <20250602141246.941448-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9127:EE_
X-MS-Office365-Filtering-Correlation-Id: bf124a95-a825-4046-1c93-08dda1df93ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PlolzWWshfOKEfBg7h6zKy9CcENetx3B0XORpRpu14HfW3yYSvaeHGomtOsu?=
 =?us-ascii?Q?ZkLjM9otz6sKdKxS/WzMTwtjiQup8tfKC8G/1sut+SpKYsLX5ewHhs+ipQff?=
 =?us-ascii?Q?N0Ks5YJmE+keslKk5H1MD4db/BihMTLeP/9mrqM9aedR+PgnPZ3EwPt6Pb42?=
 =?us-ascii?Q?J5m2KoTsiPPcRSLYfEBLIsA8BlhQx+y9AWafsvwcrkEPyB9LXmLUaahTVhZw?=
 =?us-ascii?Q?15v0Ep2DHFdZAIIyEwgwCgsnaENsZ+dF/EStrfIj9klnUP+RcFZO+UuID3Hz?=
 =?us-ascii?Q?bLDXJD2wiCkYlLRzVtauEe3npsPzPkkyzDNXaV+T67Yh1Wmo+v7bGeAKPjxg?=
 =?us-ascii?Q?iqTI91FXLWqWxOm+e+CFsMsYzKNYypfHjT6BD/Fg9F/m4FMU3c8XX2JpvGqb?=
 =?us-ascii?Q?qLmjWHkrYYQoPwhN8kNqrAmCVeXLU9K09jE4M10QsaG5J7j8Azlgp7mtAVcR?=
 =?us-ascii?Q?bye7sLSsAJV6PQmjhnBMZsEiMwTyeWSyt1h/OmF7lZA8e/MuJjgl2cmHMny9?=
 =?us-ascii?Q?n7Ek/KWWHsuH9hugu//j+UFJWhwmnDTbdu6RFvv8Nfw72JbNszRzK0Vof1/O?=
 =?us-ascii?Q?WgLUoRTHLKRbAKg3Ib3GjOyGzRYbCdY9OST4mDJ5+3E3IwNNp3+9bFlP7aFO?=
 =?us-ascii?Q?Dcjjt7GA2k6b56qbU1jzJuAZ7dg4FTIOtkjMPo5EuNLbK4QhsPaSOQTAfngQ?=
 =?us-ascii?Q?KKsX3AGg7F9lvUGzMjuYShtfYrOjDfPH5s8207lyqp/lFovsFGSGWM34JONw?=
 =?us-ascii?Q?KvTcPE6SACtSNb/Gh79WXLHDekQkwnG1URE1L2mnCFmuetk3N5HiWSSlpu3m?=
 =?us-ascii?Q?uB+bN/yUE8SB1P4GUyn0fVdN0tft3aXqIaY1/+H78FGzcgQMNKu21Khzj++a?=
 =?us-ascii?Q?uQm+pGgAyOYM//Fxrq2ILbRk+pexMbdrlH5JpuUf1Z6a6mcx33UN+JCj6Ki1?=
 =?us-ascii?Q?J5ttJ+WJA9bkls9g1JlZ0g21Zt4FTXCzSc8Y6PeZIW35OmaiY3OLtmm2SY/H?=
 =?us-ascii?Q?cLzQW9zHrWmx24lAHGxhVlknNOUz1TED0TsqCDtUpRwfijlT5lPCz3+rm0uO?=
 =?us-ascii?Q?uGv1MRLIzb27TAXUQls5xPEZnVbiX2L38m1KfXl1wR5GrVD4yB0KFGSs9Kem?=
 =?us-ascii?Q?SaFN7u3RBDcQMfIzjQ0d9XgqUKf2LhOTDwJ1G7RDus9GqlpRrqL1dZAUcmbS?=
 =?us-ascii?Q?oZEui7gfWEdyIfjFAcXTWZOofhBktE2UyDRZk5JGK2hGgRY4aOXETCuT0V9N?=
 =?us-ascii?Q?P1S2mL1jhAoT4cE4FcMVAcOinYNbqCTf2aKcOPXFHeV+SsB5ivCImcQ6vDwG?=
 =?us-ascii?Q?c/aw5K5CIC7OgwA7vVTMleLbPH5p0UKvSWDHOOIzVb4HKm6xa0WEmSe6Vwnq?=
 =?us-ascii?Q?6KENukeGPXdO529SzOObcG3XJGDgL5SR6SBGBoSua8mfVZeaioxzwdCDpfq9?=
 =?us-ascii?Q?c9DziZCsna0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u0vupeNAucPfAsYI7RIKqkQYstHHMH/qSFisWw+L4/8+V638no1p1pz4qAll?=
 =?us-ascii?Q?b0rJLhxag954Tc//ljvqbo5C9uffDHTusMqgTqLFTA1wGDVLbSQ7cAX32Y0C?=
 =?us-ascii?Q?6DFjHHonSkukr6qklNcsqQZRwUbkceAV5nuGK1ECGxbSS081wimVgMstZcQL?=
 =?us-ascii?Q?CMzO+wsNDNt+z9SKRnHdqd24ry+FR83dCPzPSBnHs8CoStwQ+qq078UOyAEI?=
 =?us-ascii?Q?u64leiqt+vdWwxKOEeSwWSnZOPh2K045PUiOgP3ZI0K+vd6HMpu0BPATIgFt?=
 =?us-ascii?Q?c1HwuNWf9SBqD2eVRHXXRPHUFnDx+8ZjobxJ5oNNvxlhEYzaw5OJ9BRm7Pqh?=
 =?us-ascii?Q?7P/Xd6Mi5WejlvX+TTmphFs8WyQ/pd63dB2sYVsYMXYPxSKhutbZRlqDGVWh?=
 =?us-ascii?Q?FxIR9o4cdbFIfkCvMsHFLCCLXmZYyzzCQPHP6Gn4YZBV8iVtDOhmLAj8glUB?=
 =?us-ascii?Q?/uCSiRP6JxatP2nIKv3lQUVWHI8QjiaTayn1aM2uqZl7U/+LlBwPat0TwmXh?=
 =?us-ascii?Q?mqV0wJvMZjf3n5KsOdE8ffAnUjR8sOVDMXunFp50OeQF0ozscWiJmUhA89f3?=
 =?us-ascii?Q?bPPy7UevOeXJ2wP/UEadWa7tIgqOz95B1gGboqTRAc9F63nm0tBofZcw9ZW2?=
 =?us-ascii?Q?+V6AUjesGTC3OiXuAGD2ba8uBkuy9//2gdVhhvJkSxRo0NrWYAG+ANtnf2Cb?=
 =?us-ascii?Q?EAu/tTbiA8b7nKnve0xB6qgxBtDvRURxlAyC7hFeUdmV6QIKCmc+2P0/ZKDB?=
 =?us-ascii?Q?rJSfGjmHAaxAEF9ZmCP7s0QK/X36E9OlamJt6E4f8lb0vhtkrwyHmG41XTBg?=
 =?us-ascii?Q?sD3atVNtq/5bxMY1IgwfeMblmXdlIWrLHjMB3HP5RxgQwnBt2vtMTKyD/PN5?=
 =?us-ascii?Q?Qw0062DDiFLWEwvl0qfjbwjJ28rXl14fWFphLovmxSU6RGyK5gBeLwuku+Ae?=
 =?us-ascii?Q?tBVDdb7exBq//pWvZRZlGjEuuO+2QC60N4PcInxoDF6/ifcxsvxihDj2Xfim?=
 =?us-ascii?Q?xxgC6HTS2N528uH24kQxuxPwNZ4uMxxoK2UUCAeESD11pS9ipezM7Vqufq7B?=
 =?us-ascii?Q?w6dm+dlk0fXriAcOJEXNqR0uEOoLTBfnlz4UN3dQ3v1i2DymnhU8PoI//pUo?=
 =?us-ascii?Q?PWzDg82824rgxu6WE+W4fXi1OGWfrpHI/jjVd0+RbdNlZMCgS/muRDAqbezi?=
 =?us-ascii?Q?c6/cW9GUxN5BUdDGWemaUYc1xNo+B1M6imkn8RHLTsEoI42nDxETmkPl05RC?=
 =?us-ascii?Q?MBzJVvO8sNV5oWA7T+qodmmo6tdsBM0AWBWMsPNMalcmvAoR6nIu6y0H7Sjn?=
 =?us-ascii?Q?qOK3xw7ugkiS3dsqIzBOqhSBx/yReCxooIAOLdAf2PTRNRQ/URTpGgkNNhb3?=
 =?us-ascii?Q?Ujfkn2fdtoQMXmfluxTd85eti1IJ7bq9nLn3DecUgz5MOk1vMRBGXsejvrqg?=
 =?us-ascii?Q?TX9C4EykCqYTvTHA348wPhrSnoqR/C/0EcjppShYUdW4Y7smGL+I89rMS9pt?=
 =?us-ascii?Q?IeTffmm0Mklc5vCBV19GeRHi4Dyjty7eb1+WcQHqoRPCIYEOsrBZUQnf0PNh?=
 =?us-ascii?Q?Huisfsi4aw2IcOA9MX7MVa8K9W6plPiM74c1O6Pv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf124a95-a825-4046-1c93-08dda1df93ce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:12:58.9459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnOXQBZMBZhWqHzy41gDhT22gOEhqYwnGjc7i4m+/viQUgfpbt0tR75jYxHT3rkb7LqYzYs6KMY9YmNE7QvqnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9127

Convert arm,pl172.txt to yaml format.
Additional changes:
- add mpmc,read-enable-delay property.
- allow gpio@addr and sram@addr as child node to match existed dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/memory-controllers/arm,pl172.txt | 127 ----------
 .../memory-controllers/arm,pl172.yaml         | 222 ++++++++++++++++++
 2 files changed, 222 insertions(+), 127 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl172.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt b/Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt
deleted file mode 100644
index 22b77ee02f583..0000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/arm,pl172.txt
+++ /dev/null
@@ -1,127 +0,0 @@
-* Device tree bindings for ARM PL172/PL175/PL176 MultiPort Memory Controller
-
-Required properties:
-
-- compatible:		Must be "arm,primecell" and exactly one from
-			"arm,pl172", "arm,pl175" or "arm,pl176".
-
-- reg:			Must contains offset/length value for controller.
-
-- #address-cells:	Must be 2. The partition number has to be encoded in the
-			first address cell and it may accept values 0..N-1
-			(N - total number of partitions). The second cell is the
-			offset into the partition.
-
-- #size-cells:		Must be set to 1.
-
-- ranges:		Must contain one or more chip select memory regions.
-
-- clocks:		Must contain references to controller clocks.
-
-- clock-names:		Must contain "mpmcclk" and "apb_pclk".
-
-- clock-ranges:		Empty property indicating that child nodes can inherit
-			named clocks. Required only if clock tree data present
-			in device tree.
-			See clock-bindings.txt
-
-Child chip-select (cs) nodes contain the memory devices nodes connected to
-such as NOR (e.g. cfi-flash) and NAND.
-
-Required child cs node properties:
-
-- #address-cells:	Must be 2.
-
-- #size-cells:		Must be 1.
-
-- ranges:		Empty property indicating that child nodes can inherit
-			memory layout.
-
-- clock-ranges:		Empty property indicating that child nodes can inherit
-			named clocks. Required only if clock tree data present
-			in device tree.
-
-- mpmc,cs:		Chip select number. Indicates to the pl0172 driver
-			which chipselect is used for accessing the memory.
-
-- mpmc,memory-width:	Width of the chip select memory. Must be equal to
-			either 8, 16 or 32.
-
-Optional child cs node config properties:
-
-- mpmc,async-page-mode:	Enable asynchronous page mode.
-
-- mpmc,cs-active-high:	Set chip select polarity to active high.
-
-- mpmc,byte-lane-low:	Set byte lane state to low.
-
-- mpmc,extended-wait:	Enable extended wait.
-
-- mpmc,buffer-enable:	Enable write buffer, option is not supported by
-			PL175 and PL176 controllers.
-
-- mpmc,write-protect:	Enable write protect.
-
-Optional child cs node timing properties:
-
-- mpmc,write-enable-delay:	Delay from chip select assertion to write
-				enable (WE signal) in nano seconds.
-
-- mpmc,output-enable-delay:	Delay from chip select assertion to output
-				enable (OE signal) in nano seconds.
-
-- mpmc,write-access-delay:	Delay from chip select assertion to write
-				access in nano seconds.
-
-- mpmc,read-access-delay:	Delay from chip select assertion to read
-				access in nano seconds.
-
-- mpmc,page-mode-read-delay:	Delay for asynchronous page mode sequential
-				accesses in nano seconds.
-
-- mpmc,turn-round-delay:	Delay between access to memory banks in nano
-				seconds.
-
-If any of the above timing parameters are absent, current parameter value will
-be taken from the corresponding HW reg.
-
-Example for pl172 with nor flash on chip select 0 shown below.
-
-emc: memory-controller@40005000 {
-	compatible = "arm,pl172", "arm,primecell";
-	reg = <0x40005000 0x1000>;
-	clocks = <&ccu1 CLK_CPU_EMCDIV>, <&ccu1 CLK_CPU_EMC>;
-	clock-names = "mpmcclk", "apb_pclk";
-	#address-cells = <2>;
-	#size-cells = <1>;
-	ranges = <0 0 0x1c000000 0x1000000
-		  1 0 0x1d000000 0x1000000
-		  2 0 0x1e000000 0x1000000
-		  3 0 0x1f000000 0x1000000>;
-
-	cs0 {
-		#address-cells = <2>;
-		#size-cells = <1>;
-		ranges;
-
-		mpmc,cs = <0>;
-		mpmc,memory-width = <16>;
-		mpmc,byte-lane-low;
-		mpmc,write-enable-delay = <0>;
-		mpmc,output-enable-delay = <0>;
-		mpmc,read-enable-delay = <70>;
-		mpmc,page-mode-read-delay = <70>;
-
-		flash@0,0 {
-			compatible = "sst,sst39vf320", "cfi-flash";
-			reg = <0 0 0x400000>;
-			bank-width = <2>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			partition@0 {
-				label = "data";
-				reg = <0 0x400000>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl172.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl172.yaml
new file mode 100644
index 0000000000000..c1b702669bd9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl172.yaml
@@ -0,0 +1,222 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/arm,pl172.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM PL172/PL175/PL176 MultiPort Memory Controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+# We need a select here so we don't match all nodes with 'arm,primecell'
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - arm,pl172
+          - arm,pl175
+          - arm,pl176
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - arm,pl172
+          - arm,pl175
+          - arm,pl176
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 1
+
+  ranges: true
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: mpmcclk
+      - const: apb_pclk
+
+  clock-ranges: true
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  "^cs[0-9]$":
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^flash@[0-9],[0-9a-f]+$":
+        type: object
+        $ref: /schemas/mtd/mtd-physmap.yaml#
+        unevaluatedProperties: false
+
+      "^(gpio|sram)@[0-9],[0-9a-f]+$":
+        type: object
+        additionalProperties: true
+
+    properties:
+      '#address-cells':
+        const: 2
+
+      '#size-cells':
+        const: 1
+
+      ranges: true
+
+      clocks:
+        maxItems: 2
+
+      clock-ranges: true
+
+      mpmc,cs:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Chip select number. Indicates to the pl0172 driver
+          which chipselect is used for accessing the memory.
+
+      mpmc,memory-width:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [8, 16, 32]
+        description:
+          Width of the chip select memory. Must be equal to either 8, 16 or 32.
+
+      mpmc,async-page-mode:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Enable asynchronous page mode.
+
+      mpmc,cs-active-high:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Set chip select polarity to active high.
+
+      mpmc,byte-lane-low:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Set byte lane state to low.
+
+      mpmc,extended-wait:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Enable extended wait.
+
+      mpmc,buffer-enable:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Enable write buffer, option is not supported by
+          PL175 and PL176 controllers.
+
+      mpmc,write-protect:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Enable write protect.
+
+      mpmc,read-enable-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Delay from chip select assertion to read
+          enable (RE signal) in nano seconds.
+
+      mpmc,write-enable-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Delay from chip select assertion to write
+          enable (WE signal) in nano seconds.
+
+      mpmc,output-enable-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Delay from chip select assertion to output
+          enable (OE signal) in nano seconds.
+
+      mpmc,write-access-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Delay from chip select assertion to write
+          access in nano seconds.
+
+      mpmc,read-access-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Delay from chip select assertion to read
+          access in nano seconds.
+
+      mpmc,page-mode-read-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Delay for asynchronous page mode sequential
+          accesses in nano seconds.
+
+      mpmc,turn-round-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Delay between access to memory banks in nano
+          seconds.
+
+required:
+  - compatible
+  - reg
+  - '#address-cells'
+  - '#size-cells'
+  - ranges
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc18xx-ccu.h>
+
+    memory-controller@40005000 {
+        compatible = "arm,pl172", "arm,primecell";
+        reg = <0x40005000 0x1000>;
+        clocks = <&ccu1 CLK_CPU_EMCDIV>, <&ccu1 CLK_CPU_EMC>;
+        clock-names = "mpmcclk", "apb_pclk";
+        #address-cells = <2>;
+        #size-cells = <1>;
+        ranges = <0 0 0x1c000000 0x1000000
+                  1 0 0x1d000000 0x1000000
+                  2 0 0x1e000000 0x1000000
+                  3 0 0x1f000000 0x1000000>;
+
+        cs0 {
+            #address-cells = <2>;
+            #size-cells = <1>;
+            ranges;
+
+            mpmc,cs = <0>;
+            mpmc,memory-width = <16>;
+            mpmc,byte-lane-low;
+            mpmc,write-enable-delay = <0>;
+            mpmc,output-enable-delay = <0>;
+            mpmc,read-enable-delay = <70>;
+            mpmc,page-mode-read-delay = <70>;
+
+            flash@0,0 {
+                compatible = "sst,sst39vf320", "cfi-flash";
+                reg = <0 0 0x400000>;
+                bank-width = <2>;
+                #address-cells = <1>;
+                #size-cells = <1>;
+                partition@0 {
+                    label = "data";
+                    reg = <0 0x400000>;
+                };
+            };
+        };
+    };
-- 
2.34.1

