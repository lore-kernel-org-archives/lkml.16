Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AE8320F;
	Sun,  2 Feb 2025 00:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738457411; cv=fail; b=OkCWeNANw0bG8/e1+0h2Co0RHDG8CKx0xnh8/LSBRPF3LCzAfvLBTRGD9zrXlAj0Jmdi3MsQh3GyfFlOAPTa8N0hVESk/rmHQm8UdLK/X7TTGprNulbrDj12reoLWhQuJfoXVOI4oq538DOnbaLkGex+68YdPpLD+Si6wzMGzvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738457411; c=relaxed/simple;
	bh=8X86CX6Me1qV8MJPStkVQYA3fugF+rjAuWrO5f94pOE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Jtp3mo/UEhx0GDfCsC7DbS+ZcrfWtoZXN0urYiOf3Iy64FzI1bg2FiSy7L1174Di7fK9yYG8ixeftlnk1ZE5nkamzEENPOpQYm1wKur6JsSBZd8v/uTU3iZGbylmBjgzzu98pkupiIbNvLTSTEaCpTR7wtUdljIyB8nf827/DZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gmTlhrZ9; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gmTlhrZ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDv7yKKt+QxR38+cHukeViZPAakHh6n1+UhdocCHR3Ck/+J4y4rsoMuNMYkInwoWZ86DFW0V1vSnIjWQIMkS8pU1vGfO+axTyGoygveROIsx6Yj/Cs0Xe6epu2R7HkAL+EML0XyQCiVJseHSZDqbgsiGDa+1KjMju7lNEUEXMT+s/sMK93xEuYOAtIlcgBKyw1hcfQaYBfjw/Gtl6qMgKhWljKjUyTQ+nYcRUnv0ZmyKxAC+5vkEGrJTt6a1eKTq4TXjkqplsAbZSpUOvJ4VxdQ9OGmkkinZQU6tcbCb8CdEYnAnd+lXbJOtYcW/GWr/Ets7nMpUp4V3lkb77+WzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgEy3hHMggT6P9d/K173FLchiWhr15UEACwLSvoyIgc=;
 b=IjfhQQenKHlgUj/OP9LK4Loqayw8Rn1emgLZY837jInZs1XwIpVDvBLw7neP0XzcM4C6hVPq9VLgl5mi112K5mvhgz+OqIUyRgk3BQnAPI7D4dzwu52PcKE4SroCm3pX1CsTgyHgULX3fGhcmQAtNvUWg3ooue51VsRuVtycJ9RAHNKM12Qmxpanos3OWwhCy7Ld8A+np4BqpFvEVOiSmmnzHngI+OB+8kr8K3CjZuqFpY+hp1OIvrqkqQzA0pozy5E44L2/nQpZ7gY0tuB60v2ADO+JN7TKOeLgq3zGJHvITPV43bHu2hwfCvosqoMSPr24/6ceogiL7/qmGwKMLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgEy3hHMggT6P9d/K173FLchiWhr15UEACwLSvoyIgc=;
 b=gmTlhrZ953F/zKhz3DeyJw4U0iLN3H9c0nL+Obhjve0TlNEp7QIUkKglKzd44rZINlAP5Yx9SNyNCxjIdfTCIVhBFtqCH/IKtXKiXaoqajAlLd6mPWc+M6pOD5nSn1Ph5quAh/wRYbt/E39zyLZcn4nGryiY6nRZWo+H4epuDDIPXGC053q5AnrMWqxbAi9IjdQjNlfLwX9FjtHLTQWes4la04/7lUw568CTSDwuiKFvffTz9tE+9WEtOYeG6JS0Rlg0sQZjW4LL4nCIMDZ943s6RBeMEIydUualcfepOIcbWoZtTdrkbdKHqah9p/sKs6xxKT+gjwb9d+LR0KtWSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB9932.eurprd04.prod.outlook.com (2603:10a6:800:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Sun, 2 Feb
 2025 00:50:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8398.021; Sun, 2 Feb 2025
 00:50:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v7 0/2] Make i.MX9 OCOTP work as accessing controller
Date: Sun, 02 Feb 2025 08:49:11 +0800
Message-Id: <20250202-imx-ocotp-v7-0-5622ba16451d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfBnmcC/23PTWrDMBAF4KsErasyM/rvqvcoWUiy1GgRy9jBu
 ATfPUqgIJcu3zDfY+bOljSXtLCP053NaS1LqWML5u3E4sWP34mXoWVGQBIJiZfrxmust4nHkLI
 AiRKyYm1/mlMu26vr69zypSy3Ov+8qld8Tv9rWZEDR2dDAJ+t9vA5btN7rFf27Fipd6Z31JzI3
 usYcpYYjk70zvVONBeIhEFwFgwenewcid7J5rICGVESaPnnTvXrFCDY3qnmvB4cJLQpJHd0unO
 EvdPNGT34IJsUQ/ffvu8PodBjIbgBAAA=
X-Change-ID: 20241212-imx-ocotp-cbef304140f5
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738457363; l=3425;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=8X86CX6Me1qV8MJPStkVQYA3fugF+rjAuWrO5f94pOE=;
 b=W++fKUsWLmt/MiFMIaBiftrsE398o8m4zA6VkqGcXvbXUimIhYV0irBmdR1uCtjIyipSJTsdR
 gQRrjGme+r7D67v67pFOM/CqEWRpCJjf40tdRd/rimy0HBerGetSAcy
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB9932:EE_
X-MS-Office365-Filtering-Correlation-Id: a00953e1-783e-4488-5e9b-08dd432385dc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXF4eG1mRGsxQTF1c1JsL213SnBGd2w5dExxQ3AzbTQ1TndzRDlWV1JHTlpD?=
 =?utf-8?B?MWhqWnhJdnVnNHhvanpSLzNDWTFrVDdLYXA4RHc1ZXlpcXpGRDlYZ2VmT28z?=
 =?utf-8?B?UVJhYVlBL1pudlFDK2hrdFloM3lBNWV2QUp6YnJjeFpmVE5US1k3RFJrai9y?=
 =?utf-8?B?WDVJQ1dzWTFER0VMdWRFeVNMdFU5OUtEUWlhUEpOWnF0RGFSMjArL2NJb1Nr?=
 =?utf-8?B?WG12QUtmUWNDdTZXYjhaYzVjR0dmYjFsUVptd3Q5SHNzblRDN0VwWDZNdmJ1?=
 =?utf-8?B?YU5hM0xoVHY5ZVVYMFRGRzd4emNiWkJRYUt3ODh3OWZUakFtUnlWTFZ5d1pX?=
 =?utf-8?B?bHBvTlRQbVBJOHVvMGJVeWlrUWQxRkQ0SXE5bStsN3p6RmZKcjFoNmlvZ3Vw?=
 =?utf-8?B?RytsZlhmMEFLNkZRTGU2QlBrVlBLTEw2aldnRExxcUFRU0FtemJZT1JYWk1h?=
 =?utf-8?B?NlVsSk9IRDllc3pTU1daUE9WaE93a3B4VUJFV0c3VEpoMGVyUHJBbFI2NUl1?=
 =?utf-8?B?bWhBTHNvQ3ExN0t5RklMMnRrejdUeGxnLzVYUThyQ0Jia1FNSHIyMmNOSS9K?=
 =?utf-8?B?SWRPYld0dHVjL2lkc1JvMnkxNlU2VEhHcEhBbGJrcHR4UnBoZU4rTy9JVWpi?=
 =?utf-8?B?NGR0WjNORmt6L0UyUWVBTDN0NkJDY1BHN2pvM1RuZGd3eCtTdGo5ajBtTDYv?=
 =?utf-8?B?b1ZHU3lBSUQySm5IVzVlVnhLMTY0RG16MEhUQ2c5SWVvV2RocVBUU0kwd2Qx?=
 =?utf-8?B?aW11NUQyVUJ4UFQybzBoQXh1eTNmSHRKZlU5MHpJOU5KQis5b3dEVEx4b0Vr?=
 =?utf-8?B?cEJ3U2JIWExCM0pETXZtVDFZZnFvUnoyTzI1dnhTa3Fpc0p0S203QkVGcVFL?=
 =?utf-8?B?dithUkU5dHZVZjlRcEZsVDd3OUhXekVpV3ZhVHZiUXMyeTJOcHM3UUJpTWox?=
 =?utf-8?B?UEhPY3o1Q2svODk4Y2tWUmtFTEx0N0wzVUlnbmZWbkR3RndEK09hY094aDJj?=
 =?utf-8?B?TWFyZTljQWcyMnpMLzNuRnRGQnZDMzRiRlZ0U0twM2FTUHFGK3hzS3l1RVhn?=
 =?utf-8?B?NDNoT0tEZm0zQVgzQVhtT05kcDlkTmNEVFZ2VEJxL0o0ajQyczJIWEdoMkhv?=
 =?utf-8?B?OVV1SGYvU2N1NFpiM3NCOXZyQldTdm1iOWxCbFdVanJZNXB6TlZEbUprQWxh?=
 =?utf-8?B?RmpVTW9NYTh0OXpOWXcvWFcxYy9BY1c4TTBOblJ0SGM2akV2N1hBaEk2TUM1?=
 =?utf-8?B?UFNESG5panRYeW52SXNHQkwzY2JwYW5qaElzSG83TVU5NU5HZ2o1ZkhZeHR2?=
 =?utf-8?B?M05WK3FjYkZUSHVSSDF3bTBwYVBvMzZ6T2Y5dkxoSk4rOHFjU3FiRGlBKzJr?=
 =?utf-8?B?eENFclZCVVhqUUNaSFkvaG8zTDA1MW1YcmJnRGswdmRRZ2p2N0RNcEF2ckpR?=
 =?utf-8?B?N2w1bzQ5eEE0MHowdW84dFpabHpUeDVwMkZRMy9CZWtxZlFVMUt5YmREL2Yr?=
 =?utf-8?B?VWRMb09NUUh6dHZTaDZjREJOVXNmSVdEOXNSRjVRKzVDVkgvc1FTL0EveWFU?=
 =?utf-8?B?am1DYmRQUXM5dmVVTlozbFU1VlpENkQ0dUxxV01FalBMZ2lCaXVhb2ltMFdr?=
 =?utf-8?B?Q0M4ZHhpMDZ0NE80cmZIOVZMNmF6eEJwcTZLWGZRbEVPRm5iL3RqTTREdkZr?=
 =?utf-8?B?ZXRKNmdKVHBJc3RHeDJaR3hIWjJvYXo0eUlUTFZCTnZqUlNoNUN5OHI1L29X?=
 =?utf-8?B?am5yRURvamI0aWdIeS9kYUFlUjdRWWhhcTRuQjA4TFl3ejFpR0lWUWtBbGNa?=
 =?utf-8?B?R3cvdWFCa1Z1M05PaGdoaVVydVRhTEZ0UDFUcFFadjUxUk1hUWpPdkFMa1lD?=
 =?utf-8?B?VExTTmNaell6cmhyMDRxUTF0WE1RTm5uejUrSTNhS3oxZ0JIWkZxWmJGczM3?=
 =?utf-8?B?Zi9SUWhxajhCMlJtb2dUd1NHdy84d053YjltanpnTlVCVXdOdFl0dHo3NmZZ?=
 =?utf-8?B?MWMzeXYxdlBBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aE5UVEpncGFXUmgvVklzTHRoVWFWN2hTTWtPNFY2eFBGRE1FZ21oRkpoQWxM?=
 =?utf-8?B?elk2b2FKRUt1N1ZMUFZXQU9SZ3BZdTFyQ2dGdE12WE1JN21JTTFhRmhtQ3JU?=
 =?utf-8?B?bS9Cb3RBUktTUlF3ODdYM3NYdkdrN2N0NWRnZkJsZkdNMDJabG1vUWFXSTc2?=
 =?utf-8?B?NGljZ3ZJQ1dmeTFyQlJRUVduZ1NvRXZWZHBZcFliVEUyOGxFc0d5Z2xYMHU1?=
 =?utf-8?B?b1ljbVJRaFZyMFJoRlAyelIyRHpWZ1pHNW5vd01oVEU2cHByMDRLS29QT1U5?=
 =?utf-8?B?SFhiK1hXT0lRdUdjNDlyTUcrYXpZQzF0VFRsYWphSGZhT0NnTXg5dWlQZkh6?=
 =?utf-8?B?ZzNxTVBDL1Urd2xHQ096dkV2YUYrYTkvWVpNVXdCOE9VSHNjeTZ5NkJvQ0NS?=
 =?utf-8?B?K29PWEJwNmhvVVAxK3M4c29Bdk5NV2xvMmhPTnVxNXcwT3g1Mm1KUWNGT1FN?=
 =?utf-8?B?N3lqWVZMelkySEVyc3JaUE5EUlRUNGcvd3JQc0VUNHV0M2RVNHBmZ1NzKzR1?=
 =?utf-8?B?Uzl6QjRDZFBqQ0tDRndvRllhd3hVbHFQU1Y2MGRxK0poaWdTNmoyYWVhQVhi?=
 =?utf-8?B?bVBBcjNGOUh4aTY2QnRHdStGYmxoMmpaL2thMUVFeFJEWjhRSDZ5UXBiVkVy?=
 =?utf-8?B?eDArcHhIZXBpMkhLVUZ4WWJERk0rRm42NzJPZVZ6MCttVXBhQ2NYWm5zMGM0?=
 =?utf-8?B?c0Zwcnlwd0lLZXFXakkyM0w3YTF4bUtJWVdITE8yUDRSTDJja2FoQ3h0dERC?=
 =?utf-8?B?dXpGbEF5aFczRUxkVVorNzBsMGlDcWYzNjY1aUlXRkFZOGVObmJnQ3NBaHRn?=
 =?utf-8?B?RlRHUHVDYVE2aEpvaUtjWHhnKzNVTTVBeWczV0xnb2RMWlpwc0hFYTdNSUJ1?=
 =?utf-8?B?N0NReWJYME84QWdJYkdVblVJY0lrOTFxSTcxeFhmb3BNV0JUU3grTGJIYTN0?=
 =?utf-8?B?UVNmY3k5NmkrUENvUlRsVk9wOE9mSEJwa2RrbjBoc3FpSmVUNi9QR0hsNlQw?=
 =?utf-8?B?Z3ptWUo0YkU3WERERFlpZmJyR05RT000b2ZlQ240aHo1V2dRMk9EQW1MMWt5?=
 =?utf-8?B?RXl5TU9vRWRUbVBOTThiSDQ2L09sVGw3R0YyaWs1aUJEZld3Z202bDZKNUhM?=
 =?utf-8?B?U2NWdHJVbzlSU1dPK01laGtjUFJyS2tnOTdKQWtiQmNCMThRcTF6NWprVFds?=
 =?utf-8?B?OHhuVGUwSGxheFo3LytQM0RXMXhidnluRHFyQW9mVEdXa1ppdEgwOWZubjk4?=
 =?utf-8?B?SW9kQzFPVk5Yci9iUTFIbCtzcHBib2hqVHVJelBaNHlROTd3bC84a3NzTVBF?=
 =?utf-8?B?aE43aWhwWU84NzY4TXRQL3dZUXJwRXVtUkJPT29XbmdEQmpvMCtDaXU4UGdN?=
 =?utf-8?B?alpJVUcwYVJKTi9CZldjY3R1UVhiSm5OM0s5QVFCWHplOXk0a1Izblo2dWJr?=
 =?utf-8?B?ZG1JT1U2d3BWaDJ5SFhZWHZGTE4rNmkxaXlJc3pFMkgrZFR6enJXckhoYm1Q?=
 =?utf-8?B?MytWYzlEVXBYT3htdFpHNWx3MEc3Yy9ZdWNRNGRtTEtEYkErUVdxdU5yUzl1?=
 =?utf-8?B?b1F1aG9lYnhFV0l5amplU1l5TGFScnR5VmNwcFVuYy9qbEI0OVNJQnA5TjFv?=
 =?utf-8?B?SGNkU2dSTm8xdi9vc3FtcmVNYXNMYS9EMlhianFmN3lCWVZtbm4rMW5Lb2hJ?=
 =?utf-8?B?WXJHdDlUaElSU2ZnUjhMNm04cGZBWHAvODl5NUIrYjVudjd6NEFxbW5qQThz?=
 =?utf-8?B?SUE2MjFIWVBlTkszTGxUakE0c2VHdlNaWTJBb3N0Z1BWVlA1MlZleHREOGFI?=
 =?utf-8?B?Z1hSWk8zSWR1RFpteCtRWUZEdk4wK21pQzl2TlNmLzNQMGlBRSs2bWRCbVRq?=
 =?utf-8?B?bHd2S2tzdldJdFlYSW02NTFqbGRTRkp2MHAxaFR5STVWZ0pWd0FVdksyM2gv?=
 =?utf-8?B?WnBKbHRkd0tzU281em5MSStYOHZoL28zdXdMVTFKczhhblhxbm9BN2tXK05r?=
 =?utf-8?B?Z0poMFdPL0ZEdWRiYUh3dnMzL2hNeURwVGJVb1IvaFZFQ2hkM0ZNU0NrbnBz?=
 =?utf-8?B?WDJnRXZjeFZ2SjNDWDFiODgwQmcyMmUwNEZlZmh2ODQxQ3NPNHpLTmMyMXdj?=
 =?utf-8?Q?zZ8UC6eCyQ50rAWjAio02+dhh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a00953e1-783e-4488-5e9b-08dd432385dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2025 00:50:00.7945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYhx9ZEe0GgZTLB3yffNTCV+bxGNXhcavY4JLyvKVxbFak3CFHIepGqFjpaISEXi+o7grQfH/H4yXSG7fFqVZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9932

Previously there was discussion on using "feature-controller" or
adding a specific node to group the fuse information for U-Boot to
parse and update node. But rejected by DT maintainer(Rob).

Since the STM32 engineers added access controller concept and landed
the support in Linux Kernel, reuse the concept for i.MX.

i.MX OCOTP eFuse has some bits to indicate a specific periphral or
function is avaiable for current chip, for example i.MX93 has variants
that not have NPU. So introduce '#access-controller-cells' for OCOTP,
and add "#access-controllers = <&ocotp [gate_index]>" for periphrals
that needs accessing control checking.

In OCOTP driver, the nodes under "/" will be iterated, and checked
if property "#access-controllers" exsits. If not allow access, detach
the node.

In the end, cpu nodes should still be handled by bootloader.
And I may also update i.MX8M to use same method to support variants
if this patchset is good.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v7:
- Rebased to next-20250131
- Typo fix in patch 1
- Return error when '!root'
- Link to v6: https://lore.kernel.org/r/20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com

Changes in v6:
- Rebased to next-2025-1-20
- Update Kconfig per Alexander
- Link to v5: https://lore.kernel.org/r/20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com

Changes in v5:
- Rebased to next-20250107, but seems Srinivas's for-fixes patches not
included, so I picked the for-fixes patches and rebase the patchset.
- make gates pointer and using ARRAY_SIZE
- Use of_parse_phandle_by_args
- Read fuse when needed, not cache them in the very beginning
- Use %pOF for node name
- Check controller node name in imx_ele_ocotp_grant_access
- Use dev_info when detach node
- Use priv as function parameter to replace pdev.
- Link to v4: https://lore.kernel.org/r/20241223-imx-ocotp-v4-0-f504c1420640@nxp.com

Changes in v4:
- Add missing of_node_put(provider)
- Typo fix in commit log
- Link to v3: https://lore.kernel.org/r/20241219-imx-ocotp-v3-0-b22371098071@nxp.com

Changes in v3:
- Add A-b for patch 1
- Use scoped API when iterate nodes and address build warning in patch 2
- I am also thinking that to drop patch 2 to let
 bootloader to iterate the nodes that have access-controllers property and
 update the nodes before booting the kernel. Then just need patch 1 for
 the binding updates. Anyway, comments are welcomed.
- Link to v2: https://lore.kernel.org/r/20241217-imx-ocotp-v2-0-3faa6cbff41b@nxp.com

Changes in v2:
- Add R-b for patch 1
- Use '/' root node instead of '/soc' or '/soc@0' for patch 2
- Link to v1: https://lore.kernel.org/r/20241212-imx-ocotp-v1-0-198bb0af86a0@nxp.com

---
Peng Fan (2):
      dt-bindings: nvmem: imx-ocotp: Introduce #access-controller-cells
      nvmem: imx-ocotp-ele: Support accessing controller for i.MX9

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |   5 +
 drivers/nvmem/Kconfig                              |   3 +
 drivers/nvmem/imx-ocotp-ele.c                      | 173 ++++++++++++++++++++-
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        |  24 +++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        |  43 +++++
 5 files changed, 247 insertions(+), 1 deletion(-)
---
base-commit: efc1ed8e768ea7a94386bb73a9d809af7d4522ba
change-id: 20241212-imx-ocotp-cbef304140f5

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

