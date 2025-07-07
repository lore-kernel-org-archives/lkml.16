Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013000.outbound.protection.outlook.com [40.107.159.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C591C860F;
	Mon,  7 Jul 2025 02:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855239; cv=fail; b=SBgF0naSvuPFF0u3czSAJVOSOFZVnypcaCsMnIMIjsfvGDexK+Tq1fYE7chYJtlO+ImBSmVk68L+3xjUMn3Yf71CCOt3gZ4EDuCiuzhqhJTpbIbHcFj0QPS9OOQNB+bX/x2nsCXCrcv4SWFXkn02wZLV0Qtt5eF/jZF6IlSLfqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855239; c=relaxed/simple;
	bh=ryRqDYpu4mzXMunKCwROW2kN1ImrjbReJwhvcGLzPLA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LV2T5svoe1ji6Fo50IrOPdjiouyCaoOUo7dV/9xdY15rGjY06gV53bUidsbTVTpCdC8plEnaOfpWkofOAFumrvLvqH2RdpCAiH57uz42Ic2lGnuZudpY9a5Ysf7reeDej5jPFx4svB7T8jFvytRPYLRPN3gXOiDugFlWtJoXlEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=inhvi51s; arc=fail smtp.client-ip=40.107.159.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="inhvi51s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEAt5C0QLqwf4wuC0Ffcl4qkjxE+UdFVnGjaZl/xnUPbSdrjMLki/gpObOh2fy2gSUFbxBpujGXBji8+JM0rrat/ZmjHeASH+E977eLTD3s6WzL5PFCpN81grppcB3ObZM7HM4nljCDP3LnUUUisLcWGBpr5xh7/+P3NVtQzK0lSRIphuk1i0Eq7KxqsHLoAjJ4JoU7WRrx9zjO+RMy5SEAyp3RuUdle72oXrN9AQGmY3yFiHFHpzX0z4jS4++RDoG1eTqzqKBJCGSYhQzwCWvR7FRkdl9Ec1DwWYQDV55pYtKa0WSyywE9+0evn5cbjGCYVDQCUDp8bNxfUGRx9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHEP7UHyJYEJHgEo2CeL4az7jNChOqxReo4u4UwLIc8=;
 b=w7xDgqAI+v9rd5ZrCXrHhQhGFI59fBY5GlJEpQ938kqGJddFz9GzVdR7i0p+NWuP3q7tLSdBc6sqGxFV7ZP4hw8cmZDbOMBVsSbI0PrmeQCid2/naOfNIj/xkCFVocC5IpGh/8uyzhDMxNJKVNdoIbCf8G0PFOe14y51tDjN4VLL2+mkyBqHA5j3qtZ2JwFpT9bXAaok1mz5fg+q4szIPiqJwaGxYE1JqUmXhwGe5cbaa7k0B91CMgWph9kidzPRBVcyHwutWKNNoD+pvDLz7STOC0sd6N7ejbJxkm61hqvnxdYI3+lLWvGoXIy2myRKdRGi6vL4faVw4hpCHwIIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHEP7UHyJYEJHgEo2CeL4az7jNChOqxReo4u4UwLIc8=;
 b=inhvi51sLcbw0Z/5LYZrdgiZXFkZ8uElHXhw20KDNFkDfjDUBp48MW1p36ZFq1Aa6IpjXstmkQxF4vfcybdmRWyhGB9HYDh4GQLkSYZ9LiwC9YO7JILDczObwxxm5tjin0vJo2A+6ZDzgNujsfpI2c67sdqhafcFzVgqbzPBFf71XpQugKQf/FjKoyv5FhF9ZSFvCJTx6t7eH+uQ9eWXrAivE0qfB4D51wjHAzfivU7MDmOgEnhaWUxyiVgNglCaoypzX9yOfU7jUv25MyQdY6q75zQUw+Hv7Ijgfycs6SzyVjjB+PSsnF8XgQkRxTJgMC+N5VLJ6fN2yeulkRZjiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:27:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%7]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 02:27:11 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Mon, 07 Jul 2025 10:24:42 +0800
Subject: [PATCH v3 6/6] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-imx95-blk-ctl-7-1-v3-6-c1b676ec13be@nxp.com>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <frank.li@nxp.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751855088; l=1916;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ryRqDYpu4mzXMunKCwROW2kN1ImrjbReJwhvcGLzPLA=;
 b=JHl1uuP04x9XWyPecRmA3jyPJHQrP5GKGZIxkZTAwRisCCayJ+0K8kPYmtFQsdyhJPEayJJzM
 1rnVd+kddL/CsHbGjXRYmo0d5ZLQmNYoo8jYCKvO/ZrphOJhlthkMcE
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9150:EE_
X-MS-Office365-Filtering-Correlation-Id: 6477d534-6f71-47ce-a97a-08ddbcfdc71c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWFGNld1TUdtd05KRUxxNUU5Um1SdlY5Mm9pcVRpU2FHb0diY1l1VFh4QkxI?=
 =?utf-8?B?dy8xODJxVmQ0dVhjV0ZYbHJSWW9RQVpyY2FxSGdZOU1SYVBudm8zMTZuUUQ3?=
 =?utf-8?B?TWlPUU9wL21YODlTRC9vbDJZMHJoaEFBUUl5bDhjc0toS0ZKaHR6Y09xOXNQ?=
 =?utf-8?B?ckp1RVE2bkIwbzFaR2J5KzgveWFtM3dWZ1l1NDNtdjY2NXRjcnZYTDI2T2k0?=
 =?utf-8?B?eTFheG5laEVRd1R1NXJ0Mi9nOTJIOStKclN0eUdLMndwc1NUZlR4MDkxVzk5?=
 =?utf-8?B?NHVCZTc2cG8vSnV6OW1LeUpFZ3gwMmQxVXF1eFNWbHFwQ3QrazV4cXNqOVl6?=
 =?utf-8?B?WE9keG1zalRQM1ozTmxtWGxSSms1VjIwZVVHemhDcWhRRUYyTnlPS1E3cXBm?=
 =?utf-8?B?b0FVK1ZDRUhZcy82N2hoWWVqNDU0WW5mNTIzbEV5cHo0ZEJSVmc4akJaMmlk?=
 =?utf-8?B?OXZheks2TWRrVCs0bXRaZmk4RGVxY0svYlpiWUZCTGg3NTNrUVdtSW0rUVZ1?=
 =?utf-8?B?bWtmTzlCRnI1clNnS1lyYnIwMUp6WmVsODdISXRUdDJGcDVZK2R3aGR0K0Z3?=
 =?utf-8?B?dDU4aktQb3Q5dzhacG41L3MxT05mVjFFZXhhL2c4eHRydWFaRE1JbHlxK2tQ?=
 =?utf-8?B?Z0V2UFR6RkttSXE2WEQ4anhIK0pmRFJVMzJtZVpXOS9aSk5ZNVdoTFVscWtN?=
 =?utf-8?B?UjJvemFScG4xeUNZTGNCKzB1NjRlTGt2QUo1MTNIazRRMmI1Y21tY2FiWDM2?=
 =?utf-8?B?N0tobnJDbEdtQWFlb3RyRTJ5UVA0N0FGdzBheWZrZVFpZHRscFVpejVTWUJY?=
 =?utf-8?B?T3lMODFaQ1haSUsrdEQ0cUNxZ2Y5VG9lMjZaTlpqblpPaDdRR3lPTW9Lay8z?=
 =?utf-8?B?MTJ6TWRYSk9XMFE0SmsxT0ZGSEkvZkNDTmlwTmg4SlhCV25kTWpuV1dHSS9K?=
 =?utf-8?B?VTBwNXk1ODJWTDR6SWVtUnJXSmhaMlJXcS9ydGJsYUZzb2IwUHNUeVNjMTRO?=
 =?utf-8?B?M1VWbmQzdXpEVWdIM0Rjd1F5M0xISnRHTVBaUWtkSDhCOTVMUll4WW1ndHVH?=
 =?utf-8?B?U0hDWnpOZnlaenVuaEcweUg1dkVPNENGWnRTNEI0KzVIU1NCdi9oMVVIVW1o?=
 =?utf-8?B?dHhHSTBrbVdzK2lsbUVCZU0xRUQwY2ZDSXpVZGpuTEJYSnd4eFFROG52MzhG?=
 =?utf-8?B?T1JhWHQwSkNzY0JvSzNGV09nWUNhRHJBRFQrYkdUd1lwdTM5QWFoWE9BZkNP?=
 =?utf-8?B?bjN1NFc1Q1hYOC9uVzJjZngvcklBbzhiV2RWakJvWmphQVRkQTdJdzExRGR4?=
 =?utf-8?B?aDc3eFZHb0NsUmZ3eTV2SVhzUkU1d2dEekcwbWkrK1JlZWNQNXFXaG9UOWkr?=
 =?utf-8?B?K3hPWWdKZDN4ekxldXBWZUYvNysrODBTNHJ4RVBab1ZoNlRPTmZEcUE3cUlk?=
 =?utf-8?B?TjA3RDNuOWNTaFRsNW5YcGc3LzRtNHBHMEpKT3pzdnY4NnRINTB1cnM0V2Nr?=
 =?utf-8?B?b0lObkJpV2ZJNGlsSFNuaVkrdzZkQVNBZ1ZJdWx4YXVaNm9xZXAwQjAwQ0JV?=
 =?utf-8?B?eHBRMm1YN3FsUzNzQzRFaWxRdncva1AvaTFaZGphVmlHU21ybUlsUUc5VFdy?=
 =?utf-8?B?WUFGeGIyVkxwKzY2V3dxNmdxdFo4TUlRc1Nvdy9KZExPYm5yaGN6ZTkyTUVZ?=
 =?utf-8?B?ekIwUlVWRDRoU1ArMGYxbE5HOExWWDF3Q3VYOE9IK2dNTG0yWTRic1prSFhZ?=
 =?utf-8?B?UTdKYXBkTnl1WTVTYXA3Z3p2RDMyR1o4V2lGejVhbWdLVDQ0b0FRSlZyejda?=
 =?utf-8?B?WTA2bjM1NFF2dzhpWU5kSGlFNlVOeVlwVWEwcWpwMjc4RXdrd3dJbU1iTmFP?=
 =?utf-8?B?U0R5cmFua21kcXJianFUVHA2TEdrRmNHQm9obEtCMVZWdlhmU0k1ZFJNNnBl?=
 =?utf-8?B?eTU2V3dxeWh6MXg2RU9wWi9jMUNRT1V0OVA4VjJ0dUI0QkdoZVFCVE9KS1lF?=
 =?utf-8?Q?CUcS9bwbkJltYK1J05dYDwqdteuF2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDhaaXMyZkViYzJ2NWFrbXNLRzVOT05Ma2p4ZitZVFE5bkFWQ2JPSmJ0R0Ur?=
 =?utf-8?B?LzRtRU12RkVTZXdxNGVnbHRiYTFsNFVVV1FnSW42anBYRFVXWFZ0SkYwYjRq?=
 =?utf-8?B?bFhnYXQ4cjNCRGRmSzMxeDMxcWN6WnJHTWt4K1B5UmI0cDQxbEp4ditwdmpP?=
 =?utf-8?B?d2VBd1diRW9LNDRYMnFvaDU3RFBSeUNHU01RSTV4cXF1ZW5TWjVjSHdKam9U?=
 =?utf-8?B?SmRVUVB5SDhGM0pvZTNIODRSS21VRTA3dWxxeTlUcklLcGNJSmxHZDJZSGFw?=
 =?utf-8?B?Y1VBTkh0bkVPU0JCb1VFT0FDWmNxSHVkalBuZlVmRHcvWEtQK0VxS3dBbElt?=
 =?utf-8?B?VHVTTkNnTndneUppSnFQMVAvaHFJV2k4ZGhpaTRzNEpzeVJLbmxGTDVGelJI?=
 =?utf-8?B?NytpZTZwMWdINWsvL1IrRnlJcjNWRmt6WUt1ZDFNL053YTh1MTNBbURObkN1?=
 =?utf-8?B?cGd1RTRCMnBqeEJPV3hlUVNzOEJZVXVHQ3pxTjdMSDdub2pRT0V1SU5mWVR2?=
 =?utf-8?B?UWJPNGZnM2IvNlFvVkNIdy9RSUNxaWJDbEZqQTIxYS8xWXNZQzJJRFEwKzBw?=
 =?utf-8?B?OVBmb1ZUMnhRS2I1Zkt5ZUNlMkVQM2p4Mm14QVpQRkhjVlVzUWlTODdmMXUx?=
 =?utf-8?B?STFiSTVXdUtQMzlwNE1IWllYakpkeVd6RGRCYVl0RTByd2w5T2dnSlhxWnhi?=
 =?utf-8?B?VGFwTEhURGtzVGZTUllUa00rSTk1RnBSS0dYUXNhSTBlcEU4VmlUd2pVNUUr?=
 =?utf-8?B?RXdJMkNZck9uNHZXWWhqemJiVnlHbmtVTVdlMUxXb1l4a3NFZDVtU2l2RVlL?=
 =?utf-8?B?TjkvOUx5b0lQV0NTNC8wMFJPVzk1Q1pFd2VFNkg4SXV4M016QVhKL2hsOG45?=
 =?utf-8?B?SFJZVFNxRmZqODBZVU5wL0VBUEVHZU5sOHhRdUp6b1BXQlZ5ZkRoSjR4S0lp?=
 =?utf-8?B?SVNzOUpuL2hndDk3QjJmTVZSMURyNURTRGxvMnFRbnduTmhRVWJZeUZsV3Jq?=
 =?utf-8?B?cE9Oc0Q3YWhmUm1aN2E1Z2szalRlNTJpRjJuSGgvcmpSck5LWWJHazU2Zk1P?=
 =?utf-8?B?bXBvV251eUtuV2E0cTBwMlpnQ1h6RmN5K1l5UlhEZzk2bm5DQ0hjYVBJQ0R0?=
 =?utf-8?B?VzVrWlFneFRDbEU3eVVKUENLZVprakNVeW16Tnd1cEZjdWlDaGE4Y0hrb2Uz?=
 =?utf-8?B?UzVLc2kvY1Z5QkZXVGU3RG5ucXJVcU9hSW1IWElCbGJ4UDF5UkErRG1MVXQv?=
 =?utf-8?B?N2pQVkp4TzJBbnBqQnVodmxuRmQwa2syNHFUZTJZelg1SzhlbUZrQzlhTHpC?=
 =?utf-8?B?MUtUZ0tFU1d5b0EyTS96dzVSc3BzZ1ZHWjdXYjdMYXJoR1ZVdFdxQ0d5Y3ZX?=
 =?utf-8?B?M2J2OGtFUnFVcE0yOVNwd3Y4TStaVFI3eXVCK25aR09hM21LSHhNMS9zYmtu?=
 =?utf-8?B?YzgxTlJBTEs0eU5raVFWNVVGdWFjN2NqYWJ6M0xXeFN2UzdnWlF1OUpJN2ox?=
 =?utf-8?B?UzNPUWx0K2wzZ1R3QU5zQXJsNzh1cUF2ZXVRUlRRVk16Tk5SbDFhbGl1OEgr?=
 =?utf-8?B?OW9MN2ZNdktuTFFVbTFpZkZWMnJzdHV0K3lzRzBRdGJ6Tk05d3A3bXFPSzRo?=
 =?utf-8?B?eTBzYTVPV1h3RTJsRzNtSlN4by9TTEQrK1krWlNYTEJGcW1aeFpmL2hvVHRi?=
 =?utf-8?B?RWZCU0J3azZ5eHNLZWE0bnJmT1J6ZUVqcUdQVDJ1b05rMUdyQUVWeVdvS0Mr?=
 =?utf-8?B?MTlkeXhKVmNBZ3JGbTl6eUt0UE5Ga1VHdzR1bXhvRjhJQzRNdmg5eE9FaFNS?=
 =?utf-8?B?bC9QVWUyRnExUFR3emExQnd1SmFiOVVhY3VaUmtzaGdsV2hZSm5Rb0NaSWh4?=
 =?utf-8?B?R2pJYjBKTGt6VDlUa2U0RFBsOS9tUTAzWHNQbXVhSC8zYXlyNDFMcnk5MzdY?=
 =?utf-8?B?b2tKdWw1NnZqRkZ3Qk42UjhRMFNhVlBzSHdHbmx3cW8vdWROK3BCV0QwMGwx?=
 =?utf-8?B?L0w5N3VjWUhXZDUxbXdCbGFpZEh4aXpKbHZDc2k2RDQ3Q2UwVEdRMm1EUFVi?=
 =?utf-8?B?ZWV4UEpBZ0FyelF6STRMbUdiZFhZR3NNNml5OHhHSERZa3haNmxkbURMdDAr?=
 =?utf-8?Q?Lla6X5dl98+kK4cUEa7ApA3OQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6477d534-6f71-47ce-a97a-08ddbcfdc71c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:27:11.0735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjTxDtMNnpOnPyLzNdEdMqqiW2IUIG4mkbmd461xd+zbFBRZQNWmBEMLH8Ia8CAZ8VMDODT8cNaL15a5hm6CeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150

Add nodes for LVDS/DISPLAY CSR.

Add clock-ldb-pll-div7 node which is used for clock source of DISPLAY CSR.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943.dtsi | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 45b8da758e87771c0775eb799ce2da3aac37c060..657c81b6016f21270a1b13d636af72c14ab4f8ef 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -3,6 +3,8 @@
  * Copyright 2025 NXP
  */
 
+#include <dt-bindings/clock/nxp,imx94-clock.h>
+
 #include "imx94.dtsi"
 
 / {
@@ -145,4 +147,36 @@ l3_cache: l3-cache {
 			cache-unified;
 		};
 	};
+
+	clock-ldb-pll-div7 {
+		compatible = "fixed-factor-clock";
+		#clock-cells = <0>;
+		clocks = <&scmi_clk IMX94_CLK_LDBPLL>;
+		clock-div = <7>;
+		clock-mult = <1>;
+		clock-output-names = "ldb_pll_div7";
+	};
+
+	soc {
+		dispmix_csr: syscon@4b010000 {
+			compatible = "nxp,imx94-display-csr", "syscon";
+			reg = <0x0 0x4b010000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
+			#clock-cells = <1>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+			assigned-clocks = <&scmi_clk IMX94_CLK_DISPAXI>,
+					  <&scmi_clk IMX94_CLK_DISPAPB>;
+			assigned-clock-parents = <&scmi_clk IMX94_CLK_SYSPLL1_PFD1>,
+						 <&scmi_clk IMX94_CLK_SYSPLL1_PFD1_DIV2>;
+			assigned-clock-rates = <400000000>,  <133333333>;
+		};
+
+		lvds_csr: syscon@4b0c0000 {
+			compatible = "nxp,imx94-lvds-csr", "syscon";
+			reg = <0x0 0x4b0c0000 0x0 0x10000>;
+			clocks = <&scmi_clk IMX94_CLK_DISPAPB>;
+			#clock-cells = <1>;
+			power-domains = <&scmi_devpd IMX94_PD_DISPLAY>;
+		};
+	};
 };

-- 
2.37.1

