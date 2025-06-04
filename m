Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E284B1A7262;
	Wed,  4 Jun 2025 19:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749064662; cv=fail; b=i92oG8zxbYPT9D4A3nqpGGSojeddq6fl79TzQ4QwKn1RS6jqpqyj5ssnZR1UqwZeHayNeq1I88IuiZt3OxwLBAdvF/uumxactw9IakgAJLzDVmn/uhOn0gumA2cuRldTf48BbOeo3rLjY3o3q3ghNEPWqKSg3CtscTsEYhHamaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749064662; c=relaxed/simple;
	bh=80z5cTv9wRxUDYZSjff1E5095M1XvgzjlRQShobc1sY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GUiisKJkskx1Jeux9pnjnKf4HwcNkBbZ7ExbD0rvin0iVpuJ1VWTMXEH6TaLtPGBDsbYjrn1VC26X3wxuznWETjGTWjAUCbgUzX749Qc5udhiBadf15RLm5YW16nqwMR9gA5ZooGwD+8fO5ArFyAba4qOm7jTvJ3ZlZJpJRDTTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ey6DhIS2; arc=fail smtp.client-ip=52.101.65.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ey6DhIS2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B15IoKGjpVydVyGr2Th5X0FlanhLPmVTk1DzDcBIDZfS0+eUs5FYo+rn5bE9twyux8RZr28fRFkwVNixYKeKGA6VgE/UjL9DcZHqLjyKXuWGrMN8b6GoBDXstRNUo5FjWHSSiegjaRbqyegLqZQPLtFDoR0DKPmJVtMYFSvKgyRKXspm+/YwG78zK15hncO247ZixfdFXUoE5ij7VtfqjWQecVV54/4T1dfr6jLax4qGpQYmf0LUE3SW61wlP5GpTyQS4K+eLw5vZLasWYVbiGvhrsCcSkY32xpDhzfD7bH2eSn6j3ReasKK30vpUc6YlhCe80R8LDu4q5ZYYcBYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uy16r52HWkWTbZwkFEmYUgykHKHL3Z8qobbtpQBINk=;
 b=KVEimugmZbsA/LxIdb01/AhwwdX6LHFKPv9Y2ukNiaz07+Xg+Ba8f9elDBOGk+FmRHKOkeAc74rQYXyiLf/Oq7eX5zd+a7MxbK5QiJcarGrygnyxVoHaBx97DvtnjNKck3BMNQsWKKYJZIP2c8ctYPfpsZYPAmDrRFkOctlkd3nZdTrLV89ekzHHTauCL6s5wRL0AtmPPk6xcyNfmm5BflpPdUE9T5Cs/sH35YGowaLC1hj/FUEH1u/QL6Z4B0J6b4J7Xysud5qpPQahGLtXcYNJ79hf9QCaxXKN/TItw56jpzhufRVf6hkgudfHi4RacBuD/V7z89WT1ZqLWDIhvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uy16r52HWkWTbZwkFEmYUgykHKHL3Z8qobbtpQBINk=;
 b=Ey6DhIS22/ppAhfJ74Z+MoeOiRLjMk6QV5e44zQZeTRrkKYmQgvbtzdEAEwQsxOn7kQB8/GipaJgJt8PuQT+uECllT2T5LeuMZ4mrjDv+r/dCyT6SWqfnnwWWJkCzzyDQETbvSaLmHjm7Wij/IinRJ2FG94emF0u8NMJm/ZHetEV6RTZSmwoSHmvqFZxiRrhrILKkIOheMw60z4JwgmDAEHRdA/T1qKDu8WaN5koQmlS+l6F/SFtGAyhccCA2JGXA9AifPWz5HYssSvM0dVYLLm6e0gLX5ipxraYRMDzD8bOJ4GOqelIjSnijcVq42LvMjFnNsY3PdcUTGQxxx/nRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Wed, 4 Jun
 2025 19:17:38 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 19:17:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Noah Wang <noahwang.wang@outlook.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] dt-bindings: trivial-devices: Add compatible string synaptics,synaptics_i2c
Date: Wed,  4 Jun 2025 15:17:18 -0400
Message-Id: <20250604191720.1158975-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: d362b08a-d5fa-40f7-eef2-08dda39c7806
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?SiEczB2Yj9sekyOW+3jZ4n7gM5uhVuxcmX+x4OaMUtMnalrW1M5XXzbEOcmv?=
 =?us-ascii?Q?dbDkmB9LYMm9wks0nGKciea7ppM0TE6JHSuK0hU/21PLuuoNvQjJ2OAVZv95?=
 =?us-ascii?Q?gXnS8Y83rQl2XnVSjHpeNPosWAyjORO3ismvg54eccVv1BhliuD1bxo0ayUb?=
 =?us-ascii?Q?oDKncCkM4UlcUBc8deWyp9x8nbuKsENb2zQHdhQXOWHTRFHUJDjFOmXHM5Nx?=
 =?us-ascii?Q?54KAhsal1uv1BGp1125MeKVbwvByUReuif4WOyudfFo6hZsX2R3I6YGWjT3l?=
 =?us-ascii?Q?0lt3Pdne6BYXPFR+bX1hhUC40/WvMiKMfCRCamZ0rgWjL+c1BXK3UebBW7dt?=
 =?us-ascii?Q?EAtORFbwjbn2SRZ3WgEJyCkhoYL0TNJ62N5zWCmjc9xd7XFw4tfOwEo8ee5M?=
 =?us-ascii?Q?Wv+r9X3dowp76/7+1qh8ufINsYHVbYsehZ5XlMk7RcjXjOz1kBcMy7296fJO?=
 =?us-ascii?Q?TLzYfMvSioLrm6HaeBnDibniJBpTvFHccY1HIAG2PK5FduHLy7swsP+W5qs4?=
 =?us-ascii?Q?VSg0F6hTvXX2LDYsMGj4DeQEASPFUXqspZipIrjSFAJc2qV9A/eEMpEkMQf0?=
 =?us-ascii?Q?VkpF0VYQVMPiN7CdgQ9HzcxaprZoCw3Gs/A4/0t9NyFC8iGbf5jfzk5Juh0f?=
 =?us-ascii?Q?DV8WL1qr7HdvnVXLzEUgiooQurgFhX1NcOlBJnTx5ZD6sKOEqOJcF7oVcgBH?=
 =?us-ascii?Q?T+JvF1akVMJN1nXEdmuLpFeKk5lp/LulX34RBgYwfZ3ilEJ9lZe5CgqFXUPD?=
 =?us-ascii?Q?UYlr0n/zqac/gxB+t+oVYRDfLzb7gHdI+JLLHNX9Ugss0Y+x4Iq8M1G18fVz?=
 =?us-ascii?Q?QZwa01cd4qjHvTJU4RYIzsES/Qbw8ihSYZc5A6ALwzljArM/sdAUe7gUk7t4?=
 =?us-ascii?Q?uGgYQnF2qnrUgjZM8pDD3vEpkhXWUJzwb241/uC/AcWppKi2VPr2U4fwKrJg?=
 =?us-ascii?Q?NxX7fUhsBAilSrLOcvCpYesXeSlt0whJv/pJ3k9U2NiqEfp+7nIxRvfNzJBQ?=
 =?us-ascii?Q?So2wsKl2CTz5AWrtTN97Q68SoQuEL5E6+07elVP3boLhNUx3me5688oEfczW?=
 =?us-ascii?Q?CWIvSqeMswQd2CAzVXu6iD+zQOlFlxGrHtyA+UAB5zK+KGqLC8ZiAd1gFs41?=
 =?us-ascii?Q?8okuWC+QjEL+udYsKb39rW7FSiUBv8/QhVMP9CrISXCHxTs4gAW6YxFKWC9M?=
 =?us-ascii?Q?M3iHYhl6V3KG7cnyuGIfRPWxmjg7Wl1OX1uV4YBUGC0APorYbVmmdP+b8isp?=
 =?us-ascii?Q?SwsTthFEyl0pTP1CmmXr64FJC+nShH5hfHD+G2w4vDlXKOu7iOOT1dh93Pxu?=
 =?us-ascii?Q?0qZIoZYe8vOrsv2KYoDRbdZEsnM/IOmSZ9WjDOags9Le86JjncLeiDK8yxwS?=
 =?us-ascii?Q?M2obynSsUOq7Zc9m8YUeE9Vs0PKWNBd27mQ5+W2/oULTjEqxqd5OFrP4Jk9Y?=
 =?us-ascii?Q?Uun9TNaPXPX5hOEuDdmiAldvWGvEAEocE6wwutKOKo84Hiet+itkyxyxpos1?=
 =?us-ascii?Q?Keql+DfddWd8VAY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?xny6EjW3XjoFegxJpTRQaM+Xqih87IoBhpiNrVL/B2Xav8Zlg4bp6dndCWKm?=
 =?us-ascii?Q?HwICzGBD359aKnkiazuHHgO6ZYn2gXITefpfKvWeN/t43O89Apy2c1rNxqf4?=
 =?us-ascii?Q?3kIlTOYVOBMOJkP7zDhbsZoBu4Ysgf2ufpQphoqMuJX+DPXVRbZTlINLW0q+?=
 =?us-ascii?Q?kl2KIw+pFGygkaF6ANcodiYhx7Bg8hq5O5EmO0PJj/1BOnPyUMziYP1ourwv?=
 =?us-ascii?Q?Gb/gHqwk7Y2aBJKE5sComta2wcuGe7cs4iwWUsGUICq+9iXxl/+x7RtZ0Wrb?=
 =?us-ascii?Q?qNJuQPSAKHO/IXj4pRM/azBwjVMDDDyVXuTsWDYfGxDU0PVyoj6pl7wWsDsH?=
 =?us-ascii?Q?UCTiMuomQGt+UGfzgG5rdodxKNHaoSSmTklLvH/+AHjl6+TJBR/OUdV3DW5/?=
 =?us-ascii?Q?YF43vNeQw2iNt65CTvkGIAglcNmQWE1MoY7WfA2vnC5u2c/NYWiWAd7mmLz6?=
 =?us-ascii?Q?r9gMsJOgTkNkuIwxMHWgvP04HNJfAIrqAcSg2nmZuR89AxujY11Ar2oADAg7?=
 =?us-ascii?Q?W2GhnVUcvD7Hqh+NZicIfiXiI8llCA2d+aVO3QqCBYmhRdKVPD7KAlQGjdqH?=
 =?us-ascii?Q?TEjDk2hnp+WaBrQbug0Pwk5zv9/xBfgbXLxej9HP9+ThA6Mrd3+Hm2rkU638?=
 =?us-ascii?Q?z2SiX1QbH5zKgKvSYTw7YykEzH1asty0+8uKPSum4VT7yN8/o1qFy2540Ax0?=
 =?us-ascii?Q?Xb2Cv46M740QaauvYqMOb3fVuOS3fbL+qbSRN+tyKymS2Wa6xSUT31ncPf7c?=
 =?us-ascii?Q?soHAUNZ4dQ0+mkIksS6+SG8hUQ0SxNlud0TYncMOgkYlZwGtTaKDWT5zSxpw?=
 =?us-ascii?Q?kK4aLfZ1lDgr3RfCZR3M6FD1WfCdZi/1rnPG8ecYjpyCjgJvsHfzUReivZ/q?=
 =?us-ascii?Q?MRsj37obD0J801mafLzJxo64+FVtD+bmJ+4MMbeqf4Xk8ukijSk/KAjgJFUB?=
 =?us-ascii?Q?YPN8W9lFQdtqkJd15l7jHOlwkAWSA2YcbhpdcXSZE06yunp1lbIbhnAK20Zh?=
 =?us-ascii?Q?qIxrM/mwhbL21keGTxIJsEbhMCReWAdHjP1luQB9uIwVtGa2Ru/wfCX1g0bm?=
 =?us-ascii?Q?kPHjg8Fto+CwjVyrNxYY+ccPcRWHSZV31b/ueC5o2pL73QdrAZDdvpnOEQbP?=
 =?us-ascii?Q?oMGV+ONWqBu60afdcLkV0asgONsEQawW1ciYlhhyVzbwkT4Y1xyJZEvjGxmo?=
 =?us-ascii?Q?OQyy8wMCdWQsAgYrMc7ud1j7ztHGKn0neJb8kNdbU/8mkkhAOgZBX+EXcnt9?=
 =?us-ascii?Q?Ik3iTgdS0CoxqgP2qqE2Qav3eEP5aUq4j4VBV5GIsA9W5l9QEZ3njw09fOhe?=
 =?us-ascii?Q?AoO4THpraRJYBVUpTJ4cxA+iUkFh0GAvgG0mIscSEuujUPajqOT0N9PBe2VF?=
 =?us-ascii?Q?b1ThJz8XwiB/+10tnutSUn97MmVZigZ4zm+a8odEOMZvaeNJbit3JaFSneVa?=
 =?us-ascii?Q?YVukMALcz1lnddXBqtLKE+ZlAyT1YZl13BJOswg/4UKdg6kUOlYKGzqfaVAI?=
 =?us-ascii?Q?o5FnqO6C78TBB21Ur2JekXLsa7RDU9qASNWxMivc4d0+t8Cqs21AFgJc/M40?=
 =?us-ascii?Q?L/FZmfTvQtfzWM5VObuu1Cxn11U8CacfoqkOyZqh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d362b08a-d5fa-40f7-eef2-08dda39c7806
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 19:17:38.2398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IkzQbE8sFmvNFUYbOnHcRXK/p4dZOX0KdSRljuOUHVAmOfbQhn+c7rVLn3KLBGvNgqP0VBDLWtcLZAWfZBPp1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595

Add compatible string synaptics,synaptics_i2c for synaptics touch pad. It
match existed driver drivers/input/mouse/synaptics_i2c.c.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- fix order in vendor-prefixes
change in v2
- update vendor-prefixes
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 38bc1937ff3c9..dbec1300bb7ed 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -362,6 +362,8 @@ properties:
           - sparkfun,qwiic-joystick
             # Sierra Wireless mangOH Green SPI IoT interface
           - swir,mangoh-iotport-spi
+            # Synaptics I2C touchpad
+          - synaptics,synaptics_i2c
             # Ambient Light Sensor with SMBUS/Two Wire Serial Interface
           - taos,tsl2550
             # Temperature and humidity sensor with i2c interface
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c..865c61499af49 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1491,6 +1491,9 @@ patternProperties:
     description: Sierra Wireless
   "^syna,.*":
     description: Synaptics Inc.
+  "^synaptics,.*":
+    description: Synaptics Inc.
+    deprecated: true
   "^synology,.*":
     description: Synology, Inc.
   "^synopsys,.*":
-- 
2.34.1

