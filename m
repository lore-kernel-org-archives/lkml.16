Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA515244693;
	Thu,  3 Jul 2025 03:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514162; cv=fail; b=oDV9RFvw8by3xAxhasSMH1dSWpIVIkp4vcQXCf9qgAmIfkXGCw8cvn1IRUlbtcXddYPPbjl26c2LIhN5Dt7uH4dCDxAN3cruuoFZnL64Psd3yOljLDZLiWeGF2hEuy9iRkF83mdpGBcLeXb6lp7pH/D0mgAm8FyShTmCtaYwBTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514162; c=relaxed/simple;
	bh=LE/8uLUbCgHsiAEwEfWoDdCUrWD9voT+WMSzTcOavZ0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pY8QCngw7mvJP5Td2yEcIvtxwFbeLy5BbH0cdnXSjx5K1W/vWoskyaMYJ8Fp7p9hsx0d5A+zboT0DyJUetXyvyDE7j75mY6FCLROkvTehJbT4B1MoRCwZM1D+vPg8+94cPgaTEpfo8I/jVrPoQ7Dd776KITRbRwxeNFqNVLGojQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SEPuENwF; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SEPuENwF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTRC1lCkb0u0lbN3beXTuMqZZrC5T2bVgGVw/ADrVb2RSwN7GabNZcJd7Ux8HimcMi6QbUZb7b8yA0qT0GQo8z0tk1o0pEpmL0RLSqtzI1oDoeK5hvbr+lN8aIJ0QndU54oyvJOIQ4mPEk13KcUx65g5rUFJbR/CrBqpOkbUmq6jib+n5WrA3XlMiXkOlRfwKkTUJ52lOrigjoQJe6Il7bnuO/bhTY7fYgyOsDxRECknbHfdPKfKedskYvwl5JwTiy1T5rGv9nt6f+Lip1L9R15gOFukHb+xTaJYIssC9hN/LpmyO6oavWsbXpKebBLbNAqNqpETrh1Okgqbl7EEGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxF3NyG1FOMtgJUfrY0lB3u6ZpHqOkyabScTXtsY8sU=;
 b=NoqKXHSq/yk+IdHjY/MTNAiBwI48GO8/60leTpD7rDDXhIcb58+63+7GMw0/X5rEQMe4tDOv88wcGh2RM+IkpIrUjQimjJwFFM3I6gToqgmTZGrLue0tFjegjKheoBXa3eCn2Xu/eflxf5F0OnLa06927Lad0HTvooWd0dUC4Us5q8KuxTPUrnj2WLXeVYw2yQgwUJR9jii2Iak0omcdGkAKo0nylxYB2uUQxffxvp43jJ+/HsUDpLljOP0Dj6osGnTot2dWeYRvXEWxIxQO19c17ZN5Lb2VvIasrWm/U8Jo6ry2MrR29Fjh16xzKIJg2z2+Qb23rmZY+kstUeoXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxF3NyG1FOMtgJUfrY0lB3u6ZpHqOkyabScTXtsY8sU=;
 b=SEPuENwFhLdHEViA8ofoUzeaYuhdxpryGI9jl44kv+1TUVitVWuB5/AomUB4xQMLZfGNVX9FsfT0EhnLktQoAXK9jBOr4TAkycJ0M0NjwZ1OsQL/+RfB4hLhx1cmJGaFBebEnuxCnTcrPqdsMS9KDd4vmB5s1L9473jDf+bWdLAZsnFJTUR35MdDNNYI42npU787QI9nh2yLaFcYXXS/Dhq0UmB2/hM/GEM0EkWdu+QD4rl/jr/u11/ylvHhXQEnLNGZ3Ui/x/kK93JnPWw2+CDvTgsjiY0IlC9rWb8A57aomS0ALCI4VCPDIAVufLVKD3itTE5IG5RI73pjXIhvUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU6PR04MB11206.eurprd04.prod.outlook.com (2603:10a6:10:5c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 3 Jul
 2025 03:42:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 03:42:38 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Thu, 03 Jul 2025 11:40:22 +0800
Subject: [PATCH v2 3/5] clk: imx95-blk-ctl: Rename lvds and displaymix csr
 blk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-imx95-blk-ctl-7-1-v2-3-b378ad796330@nxp.com>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
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
 Peng Fan <peng.fan@nxp.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751514039; l=3865;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=LlEZ8/XfDA6g9UWhESmmzzxI0gf+e36dIyWKbtZffwE=;
 b=b1dvwfqJ9H27BmdYNzCwk/xbgaNrPqys4H7RHMy0DKazSl6aeYtEYT4eYy1enxEcfH5ppYB+f
 0/23mHcimCMAnyygFiczIpWZp1kbWgmuul9BGG7gLjRyDobNWEDWOnL
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::31) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU6PR04MB11206:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bb7231-4afe-4a90-43d5-08ddb9e3a7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmdiY1ZpQThlb1NBcUtLS2hyRCtPQll3N3R6cDhFU3dsSXBjVXFmTnIzSE9O?=
 =?utf-8?B?bWM0azYzaHhPK1JGRHFvU1dDYmhBMFI2MmpycTRiY1ltQ21sUnNyeE9nRmxh?=
 =?utf-8?B?YWd5OHdoaDVJekJYNFprYVBkRitGTHg1bExNTis5Z2lySzY3a2Ruc0J0OVZr?=
 =?utf-8?B?VnplalpaSmdmclVPa255K0dpOHZiZUs0Z2hkVktlems0Z3VpaTBvWGF6dVNG?=
 =?utf-8?B?bmMwVE1rK0dxdlRyaWloSHhZczZ5UTM5NTI4MjF0T3lBSzFXU0NOcE5jWWNr?=
 =?utf-8?B?U3o5V1Q1MC9VZmZiNkh2R0plTkZ5S1ZsVEY5M3F2Tnovak9aQVBJeUh0Zmdw?=
 =?utf-8?B?VWRhV3pmN3JUaEtHKzkrVi95NUtLM0NIekdBekc2MFRzN2hqOHl0UzE3ZitV?=
 =?utf-8?B?TGsyK2gzZzkycXdXN0k4eUZReFNNaDdJQk5OU0hoaSt4YTRUNWo5OGZ1ZHY0?=
 =?utf-8?B?MG1Kc3NKemF2eEhXL1JETGI3MXNRaTNBY21VL0NWR2tnQ3dqZjlMS3kwUzVI?=
 =?utf-8?B?T2FlYkhDdWtLV2Z2YmFJWE00L2VqcW9rNHBRUnVCNU0vaXlEMkU0bFVMcEZP?=
 =?utf-8?B?TzhKUS9JOWQrdk9CTkYrRTFvdWlzdWFkeUVzK2lvZzNOK25UM1AxeklvWHpx?=
 =?utf-8?B?T0FxT2VOa3oyandhS0ZFNjBIdXdQNUNjMmxSS3I5SURIUE1WR0h6c21RcHVi?=
 =?utf-8?B?V1BUbExYbzdETThIMVBqcHhUU09CUkowYVZ5WDZHd2EvNmZZZVFTN3NHNUlt?=
 =?utf-8?B?b1pRR1lpaTBVeDh1cEs0MU5qQjlEWDBON0ZrWldsZjNXTHk4UjE2bitwaGFt?=
 =?utf-8?B?S1BRWFJJVm9pSTFPWnpBZS91dGM5NWt3aklMZ2xObGRDMW5BTWhyV1JsTUZE?=
 =?utf-8?B?dDYyNlc5RENJRnpuNFBMVTRNTUJsbGVtdnJtcDJIc2dBdFBnMVo1aFFEWGNS?=
 =?utf-8?B?ZWY5bm9CeHRHZkY1MkhjYWt0eFFBdXFxU0E1RG1nK25oRndsRTBHeUFyK3Zr?=
 =?utf-8?B?blhjMGUzY1ByZ2kweXA3aW9oRnFaeGROOEZHdjZUeU5KRlZqeVd0U2VzTHlS?=
 =?utf-8?B?dnNPSDdyNmtPUUNHOUk1RVFmVmNKNnN0SDQwTGFYSTZCL0N3a1haNlhRMm9F?=
 =?utf-8?B?d1ZoVnNWL0xhWUx1WmVEdXhGMVdlbnJTbGNYOGd0YlRJanQvQ25VTkx3bVB1?=
 =?utf-8?B?YURxSmp1NlRmZVRleVdmeTZEUkVtYmxVd0s2KzZvbXliNm5GRE52RXdjdFBR?=
 =?utf-8?B?ekJxUzVac3lpVDdKL2FDbW9ibWgxZStQWnI2Z3UvTThHYkxydmRyclJxd1ds?=
 =?utf-8?B?OGVDZStRNHVDdU5leFp3a3AyQ0F6dGdnZW05dTdqM3N5NTdVQ0R0QnA0MG5X?=
 =?utf-8?B?MSs1TnZnVVhwVU1rU3pkQm0wVU8wZml3VDZNdXFUQkZObnFGOGxTRXk3cVlQ?=
 =?utf-8?B?SHlCT05YQU9wZ0ZsRGwzM0ZYeVVleWRYOU5ldERKRkdhUlpOanZTYkRGakZN?=
 =?utf-8?B?Z0dtUFJuZDlVQXBoOHpMcHM4Zjd0Rlgwb0MvNTdrMjNxVWdPWG1yY3BxNXZm?=
 =?utf-8?B?MEgycEhhTUkrb2JQckR4QUpnOHdnb0ZJK0hVczJUeklnU2szSzhCR2JIdTNL?=
 =?utf-8?B?a3hUS3dZMTNDbXJYRHVQZUNWaDZ4UGVlZ2Z5ZThzMjhGWFVMQTJqQXJqUGtI?=
 =?utf-8?B?NE9YWU5TT0xYZDdDeGlIRmFXbDJVMEcrNVZoS0gwdXdZT21Kc0I4aXBCQzJ4?=
 =?utf-8?B?WVRLczBKclIrUzhrV3NockE2dkVZOUNsU0FMVDlqN0xKSTZ5NFFFQzJBci8v?=
 =?utf-8?B?U1JRM0F0Y091VlY5SFFsSWVVcFBxK2hnMzA3N21HVjVVZmNXU1pPMWVDcFpx?=
 =?utf-8?B?amd6TTZySWx6bEdRQXhXb0VnVHVUb2s0ZDFjL3RmNVNqZ1pCZ2Ryb1QweWMr?=
 =?utf-8?B?d0lCNElxVnIxWEFOeWpWQVh3eHNpU0pDQnlsOUZEb0pVR0VHdm9UVXV4Tk1o?=
 =?utf-8?Q?sRJxCZn2v3qhT15nSL46pfAPltEN98=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3lPZnowa0lBa25CY3p3anpzYnpabkVqVzByNWlxTmkvRUNQK1Z4K3V1SzhP?=
 =?utf-8?B?cDl2Z2xHOElIcDdlYTYvN0JuTjNLUE9hZjc2OWd1OVROYm9lczhRbzMzRnp5?=
 =?utf-8?B?Uk91Q3VsMmpjS2xrR1JndjdwWk1DQjVMUWMwamE0WkhJeFNnSTFPZFlWMXRi?=
 =?utf-8?B?TjMvbXB1aVE2SWduRFpUeGFYcXlKTU5PR2RqK2N3NnRGUzNxOEREeEZoVkdW?=
 =?utf-8?B?N2xGckxBT1Q0anFYd2hERk5vUVowVWtINExmcC84Z0srbGdwcjJtNnhtWjBn?=
 =?utf-8?B?UWZZQ1NZY2RKbG9wdUpScHBHZzhiRkUyNTBha2FmOUIwa0JBeTBzRERmN3VJ?=
 =?utf-8?B?SEdOeVJEajhPTDZIWUJiakRqeUNDaFA1M2UwZzh5UzF4MG9nckhmaHJWcm1o?=
 =?utf-8?B?cnVhR1YzNXVyeTd2WWN4VTE4NytWSnpGS21oeTY3NFVzSGRINzhRN1d6ZmFC?=
 =?utf-8?B?cTFHWHhsUGRZUXFrbWtxcGVKWVUyQlhCeDBma1I5eXJNNUV4djkya0RzTTRW?=
 =?utf-8?B?WDZ0cmFiM1g4Nng5Ky9wM1gwUDBhQXNobFRwZ1YvZ0xTK1VnWlM2ajI3Rmcr?=
 =?utf-8?B?TXV0cEp1TzlOT3lPRjUzeit2dUN4cDZUYldCNnI1Vk5NcXM2WFRzY1dPZjhR?=
 =?utf-8?B?UTVaNjlObmx6YTJhYUlzMzdtbC9nYTRIMjcyNlcvbnluS0RQMWVJVGRjTzBr?=
 =?utf-8?B?eXc5cWQwQi9scElpMW5iRVhlaXJCKzB6V3MwVHNjWFhuN1l1N1Zra2JMTml4?=
 =?utf-8?B?Q291SFdKSGVDUG5aOGpSaG1FOWFnL1ZVZTZIZjBQZTd1WVJBSlRHeGVqWlNU?=
 =?utf-8?B?aWoxTnZSUmJncWpBMktjWDU1RVcxejZUT0ozNlRyTlBmQTl6ei9saGZYVHc2?=
 =?utf-8?B?eW12Vm1wR2ZxaDZVczhJa2I3SHFSbVl5S0R1SU9sSXpZK2F6bTFmL1ZlZ3JY?=
 =?utf-8?B?bEJUR3BjVkJiSC9ZQ2xUajBDUjE2N29qUXVObGwzRkFyeitnZlVWZ29EQnFn?=
 =?utf-8?B?eC80cytyRmNlMjNTemNSOVJzb0U4RW54YklDWXQybG5zRHRtNDZsaHUxSlhH?=
 =?utf-8?B?R2UrK3hoVnl0cDAvSFRMSmEzdVV2ZVVYaXVROWgvak5BME9XeUtyYXZWM1hn?=
 =?utf-8?B?RVZJdW5rejJ1bkh2OUdRaTY0NE9ualB6MVl4NE5Od1VVZGVZeGJ5d0N4SytQ?=
 =?utf-8?B?cjVQUGZYdXVlaVNDNm9jUlJEUHBqQ3JPUndzQTN2aExnV29GRTlubEZQMG1X?=
 =?utf-8?B?cWd6TVhHQ0NTOCtCSHd3Y0VaelBERTFQT01kUWNDejQyQy8vcHpiWkMzSnVJ?=
 =?utf-8?B?WTcvU2h6ZThlcFA2WmNVb2RIN3hLekpFbFo1SlZKUG1Na05Eam9tRENiZHdW?=
 =?utf-8?B?OEVibEtwSUppZW92OVRiTUt1Njl6TG5ZK3lMaTVmUEdUaEQ5YVBuMzJKS0ZJ?=
 =?utf-8?B?M0RoQ0dHM3hMVmEyTkZSSHdRTDRlOURNNDFzT3ZqbzNVUlkzNVRCaGErMVh3?=
 =?utf-8?B?a2ZHTllVQTZHSGRRekdWdmJKODZDcDVIY3dXaWRBb25ibXpIdGQ1MWN3UnZj?=
 =?utf-8?B?OUU5OGhlRndob3laN1hpWlByejFRQUhBWWNvSm0rdVkvaUNhSHNqZTArREIz?=
 =?utf-8?B?Yy9RR1h2NHdsM3FJTHpxYkFUdFVnWUVWNXVYaEJCZ0I4NnkxVHFVVGczdy9J?=
 =?utf-8?B?dUxCN0dhTTdsdjlEblBsM0x5MlJWUlcyMXo2L2Z2ZGpRVzJycVFNc3FNT1hV?=
 =?utf-8?B?Y1Z5ZVY5WlRYYnZDaTdkeHpvaFp2WlF1cjhTU1FQK3lKSkpCN2licFlBamkz?=
 =?utf-8?B?UitrcDM1Uk0xbGR1NHN4VXR2ZTllZEN0clFJSklGa3NjR3BabDBNYTFNUzVi?=
 =?utf-8?B?OGZZR0tmWnNta1NlRXU4Z0IrRW1qY2d0VmZwUUkzQS84M0VQMFpYbnZLN1pG?=
 =?utf-8?B?d0VVUDBjajJ2dlhaMitXbzMzT2ZTRWdIbnBPaVlhRENydTV3ZXUzWkRHTDYx?=
 =?utf-8?B?RHVEYVh3N3BabUFuZDlIQkU0aHlJME5EU3BsUUsxNk9OTDNPUzVlNTZiTVJh?=
 =?utf-8?B?Q1FEN0hKS1pGRWNKVjV5b0wxektGSk8rN1Y4MzB6TEp3c2ZIdlBGbWwvbytl?=
 =?utf-8?Q?6llNd26EfP5pMea55D14MEGjv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bb7231-4afe-4a90-43d5-08ddb9e3a7da
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:42:38.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEQyO+P8FTGom6coqDT1tuHyI5+2IWNsJ82miHzZ+jXXy85ZIoKjF7kPgjwbTP3BklDVCx5C0neu4zu00HBafg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11206

From: Sandor Yu <Sandor.yu@nxp.com>

Rename i.MX95 lvds and displaymix csr blk drvdata in order to add
support for i.MX943.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 86bdcd21753102b7d160288e7b69bf73da5a5706..828ee0a81ff62c6e4f61eef350b9073f19f5351f 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -156,7 +156,7 @@ static const struct imx95_blk_ctl_dev_data camblk_dev_data = {
 	.clk_reg_offset = 0,
 };
 
-static const struct imx95_blk_ctl_clk_dev_data lvds_clk_dev_data[] = {
+static const struct imx95_blk_ctl_clk_dev_data imx95_lvds_clk_dev_data[] = {
 	[IMX95_CLK_DISPMIX_LVDS_PHY_DIV] = {
 		.name = "ldb_phy_div",
 		.parent_names = (const char *[]){ "ldbpll", },
@@ -213,21 +213,21 @@ static const struct imx95_blk_ctl_clk_dev_data lvds_clk_dev_data[] = {
 	},
 };
 
-static const struct imx95_blk_ctl_dev_data lvds_csr_dev_data = {
-	.num_clks = ARRAY_SIZE(lvds_clk_dev_data),
-	.clk_dev_data = lvds_clk_dev_data,
+static const struct imx95_blk_ctl_dev_data imx95_lvds_csr_dev_data = {
+	.num_clks = ARRAY_SIZE(imx95_lvds_clk_dev_data),
+	.clk_dev_data = imx95_lvds_clk_dev_data,
 	.clk_reg_offset = 0,
 };
 
-static const char * const disp_engine_parents[] = {
+static const char * const imx95_disp_engine_parents[] = {
 	"videopll1", "dsi_pll", "ldb_pll_div7"
 };
 
-static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
+static const struct imx95_blk_ctl_clk_dev_data imx95_dispmix_csr_clk_dev_data[] = {
 	[IMX95_CLK_DISPMIX_ENG0_SEL] = {
 		.name = "disp_engine0_sel",
-		.parent_names = disp_engine_parents,
-		.num_parents = ARRAY_SIZE(disp_engine_parents),
+		.parent_names = imx95_disp_engine_parents,
+		.num_parents = ARRAY_SIZE(imx95_disp_engine_parents),
 		.reg = 0,
 		.bit_idx = 0,
 		.bit_width = 2,
@@ -236,8 +236,8 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
 	},
 	[IMX95_CLK_DISPMIX_ENG1_SEL] = {
 		.name = "disp_engine1_sel",
-		.parent_names = disp_engine_parents,
-		.num_parents = ARRAY_SIZE(disp_engine_parents),
+		.parent_names = imx95_disp_engine_parents,
+		.num_parents = ARRAY_SIZE(imx95_disp_engine_parents),
 		.reg = 0,
 		.bit_idx = 2,
 		.bit_width = 2,
@@ -246,9 +246,9 @@ static const struct imx95_blk_ctl_clk_dev_data dispmix_csr_clk_dev_data[] = {
 	}
 };
 
-static const struct imx95_blk_ctl_dev_data dispmix_csr_dev_data = {
-	.num_clks = ARRAY_SIZE(dispmix_csr_clk_dev_data),
-	.clk_dev_data = dispmix_csr_clk_dev_data,
+static const struct imx95_blk_ctl_dev_data imx95_dispmix_csr_dev_data = {
+	.num_clks = ARRAY_SIZE(imx95_dispmix_csr_clk_dev_data),
+	.clk_dev_data = imx95_dispmix_csr_clk_dev_data,
 	.clk_reg_offset = 0,
 };
 
@@ -469,8 +469,8 @@ static const struct dev_pm_ops imx95_bc_pm_ops = {
 static const struct of_device_id imx95_bc_of_match[] = {
 	{ .compatible = "nxp,imx95-camera-csr", .data = &camblk_dev_data },
 	{ .compatible = "nxp,imx95-display-master-csr", },
-	{ .compatible = "nxp,imx95-lvds-csr", .data = &lvds_csr_dev_data },
-	{ .compatible = "nxp,imx95-display-csr", .data = &dispmix_csr_dev_data },
+	{ .compatible = "nxp,imx95-lvds-csr", .data = &imx95_lvds_csr_dev_data },
+	{ .compatible = "nxp,imx95-display-csr", .data = &imx95_dispmix_csr_dev_data },
 	{ .compatible = "nxp,imx95-hsio-blk-ctl", .data = &hsio_blk_ctl_dev_data },
 	{ .compatible = "nxp,imx95-vpu-csr", .data = &vpublk_dev_data },
 	{ .compatible = "nxp,imx95-netcmix-blk-ctrl", .data = &netcmix_dev_data},

-- 
2.37.1

