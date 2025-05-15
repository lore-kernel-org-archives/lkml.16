Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3497C218ADE;
	Thu, 15 May 2025 15:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324612; cv=fail; b=nZDGckCzpc/eapQLf7N2cnjTl9DKP79HT8XQbKK5qgYWNe74OA4zAu52SIw9u9JtthO+S2E/rQ3WXTvzP4SpAXujzb9Py3gNyOhqfHeqbKoc9LZ7x8WWgy14Hahgx2apigplNdRSbO73kABiNrfpZoUCg8PkDlxCnTDhSPrR+WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324612; c=relaxed/simple;
	bh=6zjB39PCsLrbe6OcSMNbwVdu3sig+No86APK/vGSaxY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=T9df45yaagCvARtzs8L3ZLFK8PnxPVfG+/XUjIUf+6o2QjUpopqLUAGomF4cB/MdzOp+QJKphMa3KVMeEA864JvcWs2YCQPVkBdpSIdU+FRLp2l1JPDGaY5BNGTSezkCOI0lnG018Rt1Z+r0corLw1k+PrFeY85dAlEght3Npp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X5kqqoOa; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X5kqqoOa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/HlkYOMSKGwIkGSgfv/uXA7CcwFWGfu+jghBEDoVOPCJHmEno2GAVx1ZZpF2rI9A2pmyuzoeTPvhJUav/IW9xCZCKmkRmD374P65jFumZF4gGT3UzUBzCcJBVRVDxmEJydhSdwDZXLV4y+ynAj8KYVjonksRVqAUBskUBs14tStTbl7irq7aaZJ9z0by5fxG255bfwGNUf+SD9X93z/vm1PtJQNyUxRtqDQb6PRcX39L/EUv6YjUD9PQWy/s0BEYuCaq8m4ydHwbbhAoWCNCuYE8ebQCZPMSavRJ5AuyVOJpFQu0YAxvgf2lkstWhDDvBKIPMqQBR925Ao8jrZNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Iw7t9SxOra4oZcJfk9e0PZcfvmnLZLEGl8rtFMIHjo=;
 b=oT2jcdIs7jeBHCwUbupRv1NykvhOGDFwrCdtK5WyYhwFfpfmnKPCU7P/6Gb6gNBm+WZ4m1NAAFTo8EDIt0fjmRTOto+Xlk9Fd4WjGY/ilMLJUBztp0Yjk2iwVRKjqHxCAP8uslkbDDpt6G5Doq1tsM7Pb8lk8Sia05eax0FA1eOLpd73cWRaej1/1ECVL6fLJgafRnO6r3gPXhjuPwdHFYC+TeLBiZsNLWdx15LUeFfAmRY6xld9+auqDNy+hBPlmN/uI6Dq/arGoiIBVbgcdhDqUklFVJ8np1XMkrzTBeeAi1crYrBB84+giD+TsU2UO3EjHPcU3PCKcHQZYmZvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Iw7t9SxOra4oZcJfk9e0PZcfvmnLZLEGl8rtFMIHjo=;
 b=X5kqqoOaFHe/6oPxJGYK6n7z/nUidAPrmDi1t/2aZ41M+yH4s0BAy3YgqDoGosvIjqA7l4VXB076CSQWs0rzlSChdM0GTGcQgh+XJVOAACH8YQJIqISFSYpXvuDnpMKs5Oo0PDybVK5IrnVdt/MfrmZ8WmmaaxCik4s0VrHm4/5q3a/+KVamaeFwhA4rSvWsqJMdv3r8xNGkfx71vloR/AjWXOl8V8IcIYfYmmMtdYM3ekc0xL4/iSrqCTU8Ryzp0OnIK/GuIBdydPTrZbQNax69zIhjTqq9x3kpz+ivenXaV3YzQhIHJ9lXdl0djkfTRjmPxlAv/j/jspt8Sjdo/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 15:56:47 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:56:47 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	vladimir.oltean@nxp.com
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v3 0/6] mfd: simple-mfd-i2c: add QIXIS CPLD support
Date: Thu, 15 May 2025 18:56:22 +0300
Message-Id: <20250515155628.233007-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR05CA0019.eurprd05.prod.outlook.com (2603:10a6:205::32)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d01084c-ba45-400f-4483-08dd93c918b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gpzkI49AEBINiJxDJt3UZ7MlUKxTCts3rrIBwH/CZ3FLvXNssiTOwJC9jeny?=
 =?us-ascii?Q?CPgdy31L4UDPh6HpOGq8QBaH8kJ20jOjpKVVScqsh4hxWzys36cgXQB+CY0U?=
 =?us-ascii?Q?M6fNNe702jHBdxcMcqYkmTnt3cXMbfdjeOSq864Gsxc2UkZs/VYb8kBEZCgj?=
 =?us-ascii?Q?sNFgPeQfliGJD581nBGaOGFnUqgvQCHlu8hj4sXdHi0GMGV15kYmje+D6PaB?=
 =?us-ascii?Q?ohhJGAjAuT/RDGf9s2GQQcIH2bT+N+TclabmkzXm4LjMRKnth7HrRYcuIiF7?=
 =?us-ascii?Q?G0/PoRjYiq4dn82vd9ILKZ5QxvEmdYQoFCuAuHMxHoYHJvJou2HxTzBA6T/Y?=
 =?us-ascii?Q?o1tktGeMC7bp2dz+4JIjXcCaW3RL1qAjs5TbbQYTtNqA+IYbeK3ia7fWc1Qn?=
 =?us-ascii?Q?obdRxmrGH2zflmijmDN0K4JpzQq9adUXZHWmLNMJq1aNvnpTwSB68b+YOHe/?=
 =?us-ascii?Q?T3wj+io5pT8wIRHMNTyXE8xkTHAQXKv4i3CVt6vuPDZT5NGjVNtsyLbL45Gr?=
 =?us-ascii?Q?/KarUAtD+NI8ayDQlfS6j+dUcelTRv60mAzhXq/JDJbd89AF3vjBUMQrEFBo?=
 =?us-ascii?Q?Q6GNtZQR7etLeBsUfMOy7JM1y/nlaH6/a5FYSg1MoYxk2bY9gJbLrm0PrQ5w?=
 =?us-ascii?Q?5awk/T3udWyl0qfAozAxtWqYvLzhlkO6GBWkW2n16TBYoiVjGBwfMBFjQnur?=
 =?us-ascii?Q?accyZgadN5SyQWeA70cS4ohsQrxvuzywwkgQaOOFHqwXti0Szbm5/FbUkzx4?=
 =?us-ascii?Q?UNqV4pUvAR4ggj6Prv8gnln5UBYe48EdERXedEadaYrGWWld1cJhl8mrl/rw?=
 =?us-ascii?Q?s4vKU/7thJg5Cx2JhXHUixWV1fHDWzF1tamgB2tcRGBY6llSSY7VAtEJvZqt?=
 =?us-ascii?Q?izAga40QzdE/YrcQCW4R2/rmWNVd3Ergc3MyK7vPv1aA87DeyxMvPNgqHxH2?=
 =?us-ascii?Q?KDjihYlw35hUrw/14ptjFStM2e08HkmYazL1E7p9UgKg0idBI3q6DFa3VNzZ?=
 =?us-ascii?Q?TweTCfBPNH+M/KuFRWAuSiE3wCevCohxx1Kj1gwbHxGRmnwA9jKF6prwfGNT?=
 =?us-ascii?Q?fru8k9ZjZXNgWUVXPustxnqJW0FpQPBxvS4Wi4uzDanWLTRZMVyNO4w8mgRB?=
 =?us-ascii?Q?2PO2eYgt8912dDIANYocTOM7JpFUCS6HYqJAzjYiak3atdcSswaAcH2oRIYp?=
 =?us-ascii?Q?wTgksYOm6FYVpnKiSRwr6YC1NTl/1R6A8qKllGw5HVTYR49nazVUcgUVexoN?=
 =?us-ascii?Q?tqOhZ5VYQVFt5MmvQgYfrlbPkKDiN39o33+5RCL3bFr3M+6mENUjQIftWh7N?=
 =?us-ascii?Q?xJwWkZzmvi8WqMh++f6lpy+u7Pt/QEUbrcgAfOPZDiguaeotZ5XDgtJzt9kL?=
 =?us-ascii?Q?II9id5oexZsoWCPTM7KkukbGjS6q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?91M/hK7V7SvC4IsGwNOKsucrLmlnUSVBHWRUyoCaH3rKPU58YDxwy56CbQk7?=
 =?us-ascii?Q?9DE5dn13K+OBSEu0IWN3HZSnvBZIdyekPe4UaL7hneWcnVIO8Wm+198sfVrh?=
 =?us-ascii?Q?ElGXUvIQ+KfdPU6CvUmF+3QXmfs/pIMjBZteDLZga/ODtZWrpDiMs1/IiEH1?=
 =?us-ascii?Q?C8AicsUz+Cco8IUtr3oHjx3sfoaXVzgr6YVX6YNraN4zXJscoq8hiLbgc4e+?=
 =?us-ascii?Q?f/fgJbgTw6doEK6UFHb0PMSzW6XERdXN7z/8dsWC4H36RDpfY+zTDkiEo+eO?=
 =?us-ascii?Q?2ch7uV2dwezm7b+/+YjEMravgiD9Ofxx/eHOkw4982sAfX7NSLlP6lQd16nl?=
 =?us-ascii?Q?RsvEJcrS4uSRuX4V4/nEEpMtLrbcRQPDheEc72243n028N2usWypdsr2eEwz?=
 =?us-ascii?Q?mptiuemRTFxLbXBneM5dKnqw120I+xpM1PpdLDNbdkeSEgU4gKrmiRSqmVzD?=
 =?us-ascii?Q?+KfJQ+X1N+M10bh6ZTGwGzaDYamW/weZ9Gl/DBOcAZ2gRzFoDaY9r+VgxYqd?=
 =?us-ascii?Q?nrnctuchNmNCreQEB0UPOLNDxUF7nxAqeOVd/3RcWrPJflaMpUhV/rLbEorj?=
 =?us-ascii?Q?ijurLFpax60jyfh6oa7YMlooHuEdL4KR+OvckeKYjqI7jHD97H861S4Yamuc?=
 =?us-ascii?Q?eGRfXDJ7nJj2oq+dWlE1bVjFXAIA4uobCKvD3GVOwH00jrFMsv1o4H8TFFZU?=
 =?us-ascii?Q?OYP6DfMLg2gADXfv33tVoEV7YJUDpjXnmIc6Aw8iQvkXbzMlkPQ170xFiuko?=
 =?us-ascii?Q?Vd1DoAEDA9Q/UhPQx0t4MyJujqxTYG4/hVy9P6acoi9+9nqLCdwenlsVje2J?=
 =?us-ascii?Q?9lkivr9wyzw65P6Ji0T3cNL4cV5jbSuqJeBmPp1iqO2zMwi3cVI9Moc6Nnao?=
 =?us-ascii?Q?9sOMme7Qd58moU8fqD1ci8hzcIjs3LK6RO1Z2cFXtrQ2qyiqsxLLWATYqs0G?=
 =?us-ascii?Q?sj3TbXicChyNdelotLyBwyHsgrvNno2lasjpiQ/ehA1zQSeIG995mMF1wCth?=
 =?us-ascii?Q?FcfCfcf2/WnBxMJjtQUfPEsfQwkssRUhZ3gse7I6THY03TqF6Xf6AOlMdlbi?=
 =?us-ascii?Q?IOg/KVrvQX7Mhg/gSKekO5z3AANBOeYv6F8Y5WY2cw1usuS9W5PgNqLhNrW4?=
 =?us-ascii?Q?YEUx/L0xCOK8XoAbRx4Bo+chV1NHdCBAts47GrQe2VfjYcdm3BI/SibnG+Lb?=
 =?us-ascii?Q?47ADt0l0F46Vqwd/gL55On1rxMYBykWNPaHkCGZsgcktbxuDse9BtRvl2Fv9?=
 =?us-ascii?Q?viWUujguSTFYen+MCyOCe8/1V+QkL50XmUUUx5UAlN6IOLCH5qI2EeUXnKX8?=
 =?us-ascii?Q?gFQzyBqs8ORYuJTWO7fHGlcHFZeRi6VBJpQ7wNljsUS9QhKkLMfS8uYe/YZQ?=
 =?us-ascii?Q?1wpHU9i4B5CWGo+JFq0GalZ7Ed9NW+bQ7EG3z6FiWJQdGTJRHRHgKDHxXu0X?=
 =?us-ascii?Q?3mTjSxvIF+NWjwkrhTnLgKptppYJp9FHFAIeCRi910Kzz3hF+2ASsaokNwL7?=
 =?us-ascii?Q?XvnQQ9FLWa42luxvje5gdOq8OrwSI3sRjnl4WxvA3n1DS+uajAmnYEvEthwg?=
 =?us-ascii?Q?KWj6mm2M+6M0m+8FtbuGjTAlfosqVZ3Fu73qDKu9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d01084c-ba45-400f-4483-08dd93c918b3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:56:46.9816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+k43nvzveRn1uc3MOGL8QRzyKrCIe9KDbiZVVTHEdVQ6Z4tV2oaqOBg73F1npJKZd3WX3FhmQYEhQtcLsNShw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197

The MDIO mux on the LX2160AQDS, LX2162AQDS and LS1028AQDS boards never
worked in mainline. The DT files were submitted initially as-is, and
there is a downstream driver for the QIXIS CPLD device:
https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c

Since the HW works with the already existing
driver/mfd/similar-mfd-i2c.c driver, extend the list of compatible
strings to also cover these 3 new boards, instead of trying to upstream
a duplicate driver.

This patch set also adapts the DT nodes for each of the affected boards
so that we match on the new compatible strings. Since we want the QIXIS
CPLD to have child nodes with "reg" and the current format lacks that,
change the compatible string so that we make it clear that by using the
simple-mfd-i2c driver we expect dt nodes children with the reg property.

Since the QDS (QorIQ Development System) boards are not made to deploy
any production software on them, but rather made to be used exclusively
by engineers to test/prototype SoC features, breaking compatibility with
device trees is not an issue.

The last patch describes the two on-board RGMII PHYs found on the
LX2160AQDS boards which make use of the MDIO bus found behind the CPLD
driven MDIO mux.

Changes in v3:
- 1/6: reworded the commit message, updated the regex to only accept
  children with bus addressing, removed unnecessary '|'

Changes in v2:
- 1/6: renamed the compatible strings so that it does not mention the i2c
  part, which is redundant
- 1/6: remove the description from the reg property
- 1/6: reordered the properties when mentioned in the required section
- 1/6: updated the example so that it actually reflects the expected DT
- 2/6: use the new compatible strings
- 3,4,5/6: updated the commit message to explain better the context
- 3,4,5/6: used the new compatible string

Ioana Ciornei (5):
  dt-bindings: mfd: add bindings for QIXIS CPLD
  mfd: simple-mfd-i2c: add compatible string for Layerscape QIXIS CPLD
  arm64: dts: lx2160a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver
  arm64: dts: lx2162a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver
  arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs

Vladimir Oltean (1):
  arm64: dts: ls1028a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver

 .../mfd/fsl,ls1028a-qds-qixis-cpld.yaml       | 65 +++++++++++++++++++
 .../boot/dts/freescale/fsl-ls1028a-qds.dts    |  9 +--
 .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 28 +++++++-
 .../boot/dts/freescale/fsl-lx2162a-qds.dts    |  8 ++-
 drivers/mfd/simple-mfd-i2c.c                  |  3 +
 5 files changed, 103 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,ls1028a-qds-qixis-cpld.yaml

-- 
2.25.1

