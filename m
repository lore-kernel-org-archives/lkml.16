Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D587738DDB;
	Fri,  4 Jul 2025 13:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751634682; cv=fail; b=P0NbHLHd7F4vr9yS9QRcqcDcxmPds3G05DeVW3vNfJSykQLrWBomn+7Kiuz7STW+6GUkdj9ZSvT3J8v3HfW3rRusQ2+YDteZHEyhlnCkqldeHSi10tjElbf3czEa+1lvKrVi7IwFnn8q0SZZfm0aCB1O5PuxDGNI5rf3MvHwFWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751634682; c=relaxed/simple;
	bh=8E/YSHl9Vo3M4kye32DBLl1SVeKtqVauZksZoP9w9/E=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KsiRW0zxhhvuvhTDW2IETm9wLJ0W6si5QXFLNNrylwDfLKTXE2ohET2aQWYPwIz8slxj6rePg5Un3X9pOtI3g11OFgP5qYQS4j+gqa9csNEx4msBwpkDs94zRoYlXXTSu7AplipG/zE0BZtGgEWlicQkKnaki4QHJDmS1KuriYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nmCzChiB; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nmCzChiB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLRx36dTwU010gWFtB8mOOCUf3GFd5ndqnBW7R0a2//Oz7/QQnWqP3rY7UvgHknYweFzTBkPzjWHwAN3T0Rpxg9YXXyvMrhQI/bhSKwnQDmxqlbuGiaXbmcK0zDt7ieXXmNpY/ZbOqmBb3WDEkH1ZY67MrsQMsDLQwQUJfmGIFDHPH8qf6C9CI0YoNZkD+9WQCsXasOEjn2DId7EDPCsxm9fU78D/PKAs/hDGQ4dqWErBAC+AzjuRGNy3jX5+lJQlKc5BXfuoIr5uBEAVO8A3HnUbHVrugwYZyxHjZf4wZGgxfokgJwi4rNau4qIN5HtDNmvVaXFifRuAuSTQ8fMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2XY1GGeVjic60yRWPsyfi+u9+wCm4/unrLGFx/UiaA=;
 b=PZcPupjFsELu1ftS7oowm9vEV+trrIMUOqiw7X/axDRuc94WfgwTE3r2TxjM9Mk3s1ht/2qgyhSs7hRaKFMgjwCu6AC81ee3Dw+VcqBYbJCE9rC0BglI2mbBKdxw0vkKePrgVqXUbwXM7QbE8xW74GE7OWMQ2F8Or4qtNzoA9ZUeSiMCh8dPPBxbArkB+aTJzll2nEKECgjVnkeepEn/+chz+MMJ2qBscbWNRRvM+idCQWetY9GVTq+2KKGYF33o2+FQ9EB+RicvInG4r8YUhjEpUrxdr1IiAXpVmt1A1Ph3cG/qWdOcz5ACAHQMPo+8f+T0EMSYKBokkET4sSCmWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2XY1GGeVjic60yRWPsyfi+u9+wCm4/unrLGFx/UiaA=;
 b=nmCzChiBOa+6TulJb/VLfr+OhgEbGCazo52TGy7jgUUDJGmrjbo7YYQ3xHiv8uVFmlurSYAhOYAGGQGhM5BNw+Pc5VnaAbxBVStLvUqVU9R/OwhU2TB2D3Bq2OjPoCMmW9V4GBybLPG4wiVohXirbL9oMcUZ/Ds9bjlCmsfOPCWcV1asXzxhYeafmIOkFtJ/bASBAlXs4XRJjOFjZsJRdP+Y/AUeYGGGP/ZNvmJsXyCgRLIzBVAVJBLIGYomrTX0mR0ii5d1OPs3ZLyFNmihqV0iLEzXsTYpzCLaBBrHiT/7Y3UI0XzZm+5XrfebuNMrnOMicHiv+jjQWTvchh2FbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 13:11:15 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 13:11:15 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org (open list:ROCKCHIP SAI DRIVER),
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] ASoC: codec: rockchip_sai: Remove including of_gpio.h
Date: Fri,  4 Jul 2025 21:09:06 +0800
Message-Id: <20250704130906.1207134-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: a8da1d6f-4a86-418f-eb54-08ddbafc4172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|366016|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E9kfEp93dnt/U0l065Z8g6T+cgI9oGcPPaH8/x7Op/fByQP5tB4LG6AdxSUo?=
 =?us-ascii?Q?5ziA79amQH5hAUhrt2Gd/sYt5W0jgoFO5s6dLDLvG7empJOkhjSvuibGAkJc?=
 =?us-ascii?Q?jFZujubFFfyLVJFv5jCiABa4CcZ/qeylvFx4rczeQjtBh5wgHNuK7PQ+pHue?=
 =?us-ascii?Q?NzMOqel8RFAxBSK5fbWtjsgI2zem+vFQ7XNqFzl5rqlRCgGCzHT/Zi3dZv3r?=
 =?us-ascii?Q?lXZcMWvOVxwqZG0vqRFP7KokmPAuCfIrLsFGQiZAfeia20aiqULQCfX0AgJj?=
 =?us-ascii?Q?VLYJ0+8tDXn3JxAsZtuwT35ngTjSQlmNakkv32jiprCA3SG/6dXAFCd1587f?=
 =?us-ascii?Q?BOewjpz3dZs+5uio8KgJwtS8o484NVYIaqqPz1/1/zaDqjVyNtNabs/t1CXy?=
 =?us-ascii?Q?WzJHo7HCkIAftEp/5ZBd/nwFYrMOMVscatyOcJYrfIsn9SAaaYmnD7E7+gLZ?=
 =?us-ascii?Q?HhRKyI9nkN/0znaOqgPTDvcbLdsXErINZTnioYUOj7GFqGtw6zK7L5ECYP/I?=
 =?us-ascii?Q?psY/xAXU2clYCCjdj5j50i3s0cYEX9PmTDzrSZuL6aC1kSuYnYT+PstvOqhx?=
 =?us-ascii?Q?wEabnr8ui/v76IL7WI7QW6139zsxvjRQbaLhU0jW4mb6C9U5/VnzxBurYFiv?=
 =?us-ascii?Q?8/7Kl8FEaTeVU6ghvpdaxXdZhhcwiB52ejYgTtuPsUSsZjO5wxnH8amVHHGi?=
 =?us-ascii?Q?KOsG20IMWmOKmG5OUr8A9BqI/1LblXHiLdaRqzAN1YgJggV5NNwwL9agWxwH?=
 =?us-ascii?Q?+LRubYo9LgUsOWSZ1S87Pz4IG8k8eehgAkShN/EH+x09LX+XI98d7ajY+g0J?=
 =?us-ascii?Q?zkpu6dTWUW9msYlHjzPDWTZY1unn6ZPoKrt060GR+yJko5poMGzbdCNO6xdB?=
 =?us-ascii?Q?wOQEnguxy/BO0xzhEJryYSp+yQxDvAQsPAogE4ioynd7lsLTkQxVFq22Ulo7?=
 =?us-ascii?Q?Bp9mZuqhq3ak/wu559skKSfznhffpvXfkhl4+QmcDh3mtfv6K2H8jco9DqPh?=
 =?us-ascii?Q?//ArK5Y+/zdenMsha1Krz3piKaiz5H1X4+VLVM0mPBTW6K3/EYLY6HmLBQlw?=
 =?us-ascii?Q?o0mrUwOpfwQw4PW5xl5LD+hIBe9+kdQQ7MEKNKlkJzDhKTbcYl0lsAgVqBG3?=
 =?us-ascii?Q?V8TBRS1Vt/cN1GlGTmqFKS4pKg2iYoNxhGTHFqCp/BRB5iXuj3CZITKvmmqH?=
 =?us-ascii?Q?DdwjTeTz3atA8yJp+U0HohLGn0mEaA6nmLGqDQLqDmOKnYYsSs+MjW3Uus8/?=
 =?us-ascii?Q?8ii5i8GpNbCekNfNlsSIgrCuFiA47qY89ECHRUKNv/41DUMcwV1yj7FQCRPa?=
 =?us-ascii?Q?wZKflqdtZytkS7Vu/owPm09Ms0wVIjPGO6YUKM/qi3jIjR2QUO0vz87BBX7i?=
 =?us-ascii?Q?ZSgWgWe7wjQJv3nHibexJn5cTcY7d0uqPvgZDwKlUgnAHGpG8gthF8gio6J8?=
 =?us-ascii?Q?lkAqUhg/HWlMgJYgzwUCh3NnIocq1MiCV7gokdpZk4UklOBmWWLxCXZxb0Mz?=
 =?us-ascii?Q?RDnPs7UqWS5Cm10=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LLfUhFCpyJX3DibD7jj4KlTqiE1V7Ax0sjn2jhQaDH2mUKYxNrZuCfL482bt?=
 =?us-ascii?Q?EzaTetl+lMZdpnPKtxYL9pciigKgMHyB97HdVMzWNnHLA+YCkK7RfbitrUmp?=
 =?us-ascii?Q?aC6Zad01bAzLsoPH1NaiVEcKiNptJ8QNOUUHj29R7K+oQcEm6UoSg337OH9t?=
 =?us-ascii?Q?o0t0yK20gibZm6AwLfKqs85cpjQE4yDu4A3A4Psv4BSlY2CeUJON1FljHzUq?=
 =?us-ascii?Q?aU08Gk8XYtoyIsIHeOk6mRAROSH1Nl8QHolrQ0d/h1mzXRheiroX81hffcsa?=
 =?us-ascii?Q?tgGodBCvMiC4KkEgSTBDTAGvwUWQYNpMh5y1OBpvIaBvKHAPsXq7l2ePvWY6?=
 =?us-ascii?Q?7y4f0MUCxXsdvEpuwheRAvUPuVorp+gRm/u77Q7iDuQscXFlivnhEYjlrhqJ?=
 =?us-ascii?Q?4wQosHy7DE52sYiWY+T/RLEhWCs0399V2UKlVsHrrpA8Cp/n5qdn5ZHMaKN+?=
 =?us-ascii?Q?Ve8EO1nqPaMHYX3JU0OEVCSa/hdAuNLtM4F1uWqvu/qUtsxeUKl/DqYGik0e?=
 =?us-ascii?Q?qk95n6dNRPytbngwWYOm939zaB4oQrIVcCwcq8k4NLepzVK33aJqIgE//Szg?=
 =?us-ascii?Q?xeBuAC/d0icy8k+MFitM1Kay9PedDOwFPE8a0w8y4Bht73qmaqNOnjURKPfx?=
 =?us-ascii?Q?iIHPR01m8QeUamXfs0gb6X6v2iuavgDrXUJ5XasIUeLF/ZIykxZzKGtsHqqQ?=
 =?us-ascii?Q?qv4Sgc9Revq4vuGaM7UFLhga7647ed98WaIWfwMmG0aobzF5rL4lK5BDuVni?=
 =?us-ascii?Q?/NiV0wbLuX7nTQTM7nYFtlxtPoJd7pcWeeSomXC+uj1OC0XhJFHHxDVo+2UB?=
 =?us-ascii?Q?myBxYc5gHXgYezTtI1EwClFOcW6bCnw0Ce3PoKZruISfdzCjt3XBW2b4MGF9?=
 =?us-ascii?Q?A2rDpxLjM2WDOv67JT8kIvd1uGrSttbMdXdCaTLYj39vNz/zW67NXJqgG3bR?=
 =?us-ascii?Q?CZ+Cyp0MiWtgyOPfIB8MHae2/AcvFx06r8FK7rfAcZSHecghrrNAt478mSJl?=
 =?us-ascii?Q?UB5w3xuJcHEZWt9hzZ061yS6d+cesF0xUoyVR7kn4I5ErjXHOJTctUBeyKgh?=
 =?us-ascii?Q?QrUgjCx3eKqwB3IyAdgDy/gfzxAvSizm4JWVXwbJ8KORdczWMT7y9Zz7fhm9?=
 =?us-ascii?Q?N0AoC2Q7KBsQPTeUVudFs+oaRwzyQhnyGVOzZgccKwkpsyF6SirzPxQ4MSLB?=
 =?us-ascii?Q?paGZAWGlRyqOv6HR3+zNdkBoQNTM3FbdCTxYy8256Gqi5XQxm1lx7bHLjCIH?=
 =?us-ascii?Q?xmEtRsFEsgcAofo92K7i41vHKeqv/mQzC26TYC6K31VDayb1ZRp1JwdRzZWe?=
 =?us-ascii?Q?O8M3YcMaYgtUYg1/V8muL5hpJzKx6jA/sxfj9W04c5Tmjn09T7p5Jja68M8L?=
 =?us-ascii?Q?8DAkR4Wg+2DKfMRKUlOoNizbapdLfNurI+u0Kue8Rvbblc2W1GffzcnzPMAR?=
 =?us-ascii?Q?I4JW1qlQ7wFUwq9NPHYNt6DdVp4lTU8qST1tzvEH4UBFaEiyIDIrMtfyB5v3?=
 =?us-ascii?Q?g8cNCE486zax8rEC+UXPMCLEeno4nJr9JBOLw8k748fL3UtEAoWJJPkDWaPk?=
 =?us-ascii?Q?O4Txnv0UYjZ1bCK+HtVHn/ZgHms3Xp5xSIgvm0oK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8da1d6f-4a86-418f-eb54-08ddbafc4172
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 13:11:15.2505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FnUqHyZH1y0Spp9krjoHGfax8JZL8ql61Im2L4EpuFrTr60b7AAFkb2gz/Li3ZmvErF48sr12NeWr6aPWytBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

of_gpio.h is deprecated. And there is no user in this driver
using API in of_gpio.h, so remove it.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 sound/soc/rockchip/rockchip_sai.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 0b9f54102d69..6695349ee561 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/delay.h>
-#include <linux/of_gpio.h>
 #include <linux/of_device.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
-- 
2.37.1

