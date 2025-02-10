Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2040.outbound.protection.outlook.com [40.107.249.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3395B199FBA;
	Mon, 10 Feb 2025 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172243; cv=fail; b=RDQcQ57PQdqJbZDs7sn47XLgbWbuEQWkzf0twSZDuASZhFIZPnpX4MP133E0ND+iEWjnIX8fadr2xbDbXZb6UHd0h7AzTN/IrFBTUWKhnxvMP297eOPoHm7x7Shgx7LXitYkvZYTzCs2nIdc0UA5CFyLgLT5aaQiLmV6xFEDjkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172243; c=relaxed/simple;
	bh=bsJoJfR4PmuWl+I6owRMJR9D2Fw5tTC38N0yW1Lv0r0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qnPhwOjCEUmP4fpAc/kpebI62zWxWBHKNK9ZDCsD5GdKLlB5NYC8TXaPah0xOYlox3XVoytUtK8K6qZhyaLGr4/IQ8CqJECqWA9l+j756i1YHeRolGFeIepEENvsoJjtRHVEJyXni1UB81Dqp4yng2CKfnalIvQyKKmvkUhCZDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TR3YUZFB; arc=fail smtp.client-ip=40.107.249.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TR3YUZFB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpqTrYpBOMKdI25NNgpAVTyY9LMUOoDwgZdPvXS4ABM8d5Vq7PBatikd8/xLR6PaxaVX5wSfriPnOhLduvLge8M25NVxRTPd3K6HZJR177p7vg0QL0ogGFDR1nzDVQ9/LtdDTZliMlbj6gDZST+/FiCDpFBH6BHFqtKNGEhswpZkuASWkC/ohO+2NyycKEyKAwFa7SyVzJWCgCKQwHUx+t6fBf6gVieQOV5opmj4B/MnsDs5NI9RNDLp+9ZXZ63wUrzCyXP6+B77V7jCZ3npH/h1zf/wyh6uAschNCV0HKIKpRLSPueeqJ6nNCAKdZVt/8F8Uy09MYEFABYQoEKPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AamKZ7i19qVplInhAd6ZmhO9orfoxbENW2f1kmZns9c=;
 b=AdaIH5PJvRyYzEwmb4R25mQu5RZ92k+jRuu6tE6r76Gp70FFTTsiR9WpqKS7wqDQDbnwZe5Nc8ilb54oCKLkuNfwt5rWKumxP0n1MGWJVpKePyIDXR1hUfOsft+n2/pxswTozLsnRhcVpM4DlZitJoHClH59gWWQSA66O6kAaAz5zqhImNjxud3IxwI0EhQURxqbghBE0IGHBWgKFKppsKD6yLPF7R/gbYEhJe18OavSEcGhCNxXCz5hn+9hx/dB/mvI43AGvYaPTKwH26qJj0iFcqHHfrqHmmOs8yzxsu7Yl2iPu3DTdKso9iSd0DFitZ1YzENwAiyuEpRmI2lSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AamKZ7i19qVplInhAd6ZmhO9orfoxbENW2f1kmZns9c=;
 b=TR3YUZFBYZd+YP16gDJtRO7AuC2Wfd1IM8g9oHCjz4i4Y3at1zS8iyC00h8fh3xlMhcunHzXVBiV4rkqkq0ZkR8eXbD5yXhMIuyXS6HYdzzvR0oCvp5ep1pkMQAvVmQFPskJjDFWjeD6xb9cIHMn7FO/3nIwg5/qhjNaj3xt3axztKPx/s5kkoD5t+Pz4Nx/qu+RDMmOG7oyZgM5t+y6iG91/XC0WoNu7jK+jg0EcpLykuYgR1MabXfgMFR4Oluk2mVSKtfAcAcKBqg/D2Ijqxf17PPouDGIQayEwqikePbRFA62ezvbDACIDwGIzxdOhrYUoXzsLTkJKg7Meaj5CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by DB9PR04MB9648.eurprd04.prod.outlook.com (2603:10a6:10:30c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 07:23:57 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%2]) with mapi id 15.20.8398.021; Mon, 10 Feb 2025
 07:23:57 +0000
From: florin.leotescu@oss.nxp.com
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com
Cc: Florin Leotescu <florin.leotescu@nxp.com>
Subject: [PATCH 0/2] emc2305 driver updates
Date: Mon, 10 Feb 2025 09:31:56 +0200
Message-Id: <20250210073158.336522-1-florin.leotescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR08CA0029.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::42) To DU7PR04MB11163.eurprd04.prod.outlook.com
 (2603:10a6:10:5b3::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PR04MB11163:EE_|DB9PR04MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 16975b5e-aed2-4c57-8633-08dd49a3e1ac
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?94c0DY6hnerlqhNrwoRopxhY/S62CjoX7TsWnjiyu89ef5HUJ8kDX4hBnE?=
 =?iso-8859-1?Q?7rkJ06jH1m0tg5VJjoRmK0W9cNwdxQUPK2SY8jWoSe/FkmJm2/135XoBCz?=
 =?iso-8859-1?Q?YlUbC8MZt4nYr/dW/xjuGIW+blG0J3ibiWO+o0oDZJBX3phhpybm71Cvvb?=
 =?iso-8859-1?Q?CuZDUmvy+hyAXcbub8cPsyHJYaxEVCDQzp4/ZkARsTDw4wVCxVoBAdOjVD?=
 =?iso-8859-1?Q?NOtYP3x/gO2cTUOtXYcUrIOWstPkVD3Nag68ZaOdbuHcO89m9bVcQSC+dj?=
 =?iso-8859-1?Q?cPdwfbxUOEG/2ptDoLLrD/N+utHeyrS85XlTermiPVeDUPwz7oJS9Ii78p?=
 =?iso-8859-1?Q?IcL4tpLJKiimHiGaZIQxGumvsS4ABo8toSZOUK2wnv5AaCZ3cGXgIl3yRt?=
 =?iso-8859-1?Q?xBprdCpBztJ68qS6mIpM57oimSPWEtfU7TxuKKcZ+l33BkhWS4s5RYriZa?=
 =?iso-8859-1?Q?nTdMka2dvJx7tD+GTrS1ZP4PhZjUT8qQERATdipW363cQQPWLd917JqFNv?=
 =?iso-8859-1?Q?Lgxf4MXJXwp1nYtH0qSx1PooWIV6u88hQMAncqKbPr+DOAqrw779YOlArd?=
 =?iso-8859-1?Q?r1vVNyhawriok7jlhiZAKaAbLgg0hMcjdiFzlxfIBx6JkJRuVim4fqX/6U?=
 =?iso-8859-1?Q?owGqFJ7cYbzVfNoitiXmrUunSw1zWy+1xsenKWlCn8mtfFsAL2ua1nrBmk?=
 =?iso-8859-1?Q?Wx4lz5M3xxKwDN8Vq0TG7PANt97xMbKJ02oM2xlAvDRkRVqqOJSNIsCTy6?=
 =?iso-8859-1?Q?xAy+scmbQXVAw6F4vmKdXjUendJP2GUbXIeJCVcNRmnX13WuoU4zXcCpyN?=
 =?iso-8859-1?Q?CJcH7eDO1fNt7H2AlycbYUtVGeDDznm5cWNiboOuCf0ZXFue+fECNjnX65?=
 =?iso-8859-1?Q?TC9GCmOdT6/6rQsA6U0Uha4nz3ZUCisFnQej0KtPa1OCUHOfpkOW4MJIhS?=
 =?iso-8859-1?Q?4Jr90rMGfZdC5ziHiYtX6XmoKuQHKBXXSOTyXrlHU2q53409BohYZFA3Az?=
 =?iso-8859-1?Q?D+PEOqzupzhtioM9iE11U0LZE6oKjpTB3a3+6X7PcKTCEG4PJWaw77hVej?=
 =?iso-8859-1?Q?z2QwNM5KYQ8aFujQ0kEs/xJl407/1Co4D+G1XjHyfSSufFwljGbjDqW44U?=
 =?iso-8859-1?Q?AtyT1CpHLsVpkXxVTdhmetrgwfZhMlyNWPAChpmcTZO8ULJjxgkXjohXDg?=
 =?iso-8859-1?Q?DyQ4oiCOMzs/MMppreb7hhOUUq/GptQLYVsWvRNitIFGlJeI/ZllcSNi3Y?=
 =?iso-8859-1?Q?cupBxYy7ZdT1rXr8I0o80BUoL0AIm9pbbgx/UK/A7wGH/Cll+V7Q+MlNNS?=
 =?iso-8859-1?Q?47lxMTwNSUOmr2Zhbw5Vfqtr0hqmPqgUKES6Koprtozbthl7HG+KPEC2iC?=
 =?iso-8859-1?Q?ejuY3QdZUxJ9yufxcbP5825JljFZDeBl7Me2IEDebCKURw8q/yqvZusE/A?=
 =?iso-8859-1?Q?ASus8eiy45aZwck6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?R5HRQP7USZWkPl1U7nQE9BwVDRyyeqVpRTndqkiQeY2WCDchZNI/yTX3Bd?=
 =?iso-8859-1?Q?bQHJVTe7pQWaN8Zu1cfw4AKci5PUXbYglCX98J0rVBC9pM6FEqx7PEv84g?=
 =?iso-8859-1?Q?ELPsLkJ02rQFRqnVggK21Cb026AS4qaaWIrWmODQG25V/G5Jb69PePNwwZ?=
 =?iso-8859-1?Q?XdyB5goIHFT/XYoYluNDpgC6ga87S519vKsOGrNgybUYYIWakSByw1vs41?=
 =?iso-8859-1?Q?5KemMLJHQVySPmy8We67nnW5eZrYoS2BCox9T1VxM4PQD0JujA/ln2W6Kr?=
 =?iso-8859-1?Q?n3VioSn/TQWg329rl3rEvfsYzrUt5hNK5eljX9iL2uSaym+8mhQESzpuXk?=
 =?iso-8859-1?Q?9AilVl2soJIWY2Ms7wD5CcgInB1jiSvi/BIblIbcOUILRqSfao+KwCtlMV?=
 =?iso-8859-1?Q?CCYzjHr/bINZxvuuJFWYIDHG07nIbCuRm4vbHIwvGW4qs96R2iX72IJz47?=
 =?iso-8859-1?Q?+tluPKe+OGfOJGcN7huogKa09mDZu5EWVgRnJG4TEK5j0H+oIdplRPJJp9?=
 =?iso-8859-1?Q?POa1q8E39Nvv44C1jtMtXeCKdPuN5cD1T1wawbj8/csacIojzfWLSOOBVY?=
 =?iso-8859-1?Q?V0ukwFXbxFOVPI2RgMbE5D3PXZIv4LrSg1Mpm2lAi3PvO0TcVvDVGJO12u?=
 =?iso-8859-1?Q?wZS/YPZlBapmwU3NvrDgUQnLUJ8YVAMsWwuWdkAHSpPxSccAtuuoYpmwtu?=
 =?iso-8859-1?Q?51sWrXOuEdlg/e/BkPkQdXr39p3vlgdIfRvELCobS+3LzLNBSIM0mf1yAt?=
 =?iso-8859-1?Q?yqC195VacUY3k7W3cqQUlhP2GBNR0yJ0LjhIY6b9HE1oAOgzjxpV9EQN0h?=
 =?iso-8859-1?Q?XBV/SQ3QakEWXBFiuuBQBw+RITActtV9YSU0YOHhki/hattNlDgBuSNSYL?=
 =?iso-8859-1?Q?Fum5rFCejBe09v7ZheQhdFwAwSV6dURcVnKICyevwb5sDBcfh2CPQC5stf?=
 =?iso-8859-1?Q?hjMHCHJLHb9VxMOYbbRTYGu18w9bUPw/+9iydmLN/bWNOLr4sD61CPBaCg?=
 =?iso-8859-1?Q?cifU+oPtbA0YYR1oQHeZimhQbP+yrOgIw9HoWwYJ9NxXTdHbxnPx9P5KW5?=
 =?iso-8859-1?Q?qMyTzPjg5hsw0Wwek//FZ1bNeEbM7Yil1Z5sc9mWYzSUmL8ZTvI9CMAhHI?=
 =?iso-8859-1?Q?PYcehckZW0jeMaBEuMI5zsLf0xEAC5HrEKt3y+Kww+VFjfuvCn7E9r9TQn?=
 =?iso-8859-1?Q?AfD2bTrlp/CiwOmOK5jFeB7V9XjxqP2Ao/DukZOYJIf9YJs4ouWGtnCXQk?=
 =?iso-8859-1?Q?cI+hkhng3jN3EEqVDybKUpbmS5n1AVTr8LOyHXS+xL4HAREWxZCVz6jH28?=
 =?iso-8859-1?Q?/B7Fqd3mSv914HjfT9M9OJnCT9yWOEQgR2GMY/zTPsjtZ9dhNRMosETguF?=
 =?iso-8859-1?Q?7q0njF1Xcxsb/Z/bfWrQ96WfP1wEQtrKfMYPjk+uxQs/rntqV1Hz8OhNMp?=
 =?iso-8859-1?Q?3RBPfQToKPi159OdpPJZxyFEZ5uvrLW6pSUYFBC7kh/bD4ghR6sAVh/wI9?=
 =?iso-8859-1?Q?3w6ZPCtX0/fdEc/uoZd9ypAP1eVwGtCwP4gu9j4fqdFDJG2BYDdnMwg3Jt?=
 =?iso-8859-1?Q?fZEa0fSLMHWjMNiWB1maCeENY6RXrnTNNpjbBm8bOMe2c+t4gSZD2C5VTW?=
 =?iso-8859-1?Q?kMgcwwf96E4M5b/vQbKQ41Yvlvo7f8cqsCieDDQ1YCJkLsqbZ2anhp4A?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16975b5e-aed2-4c57-8633-08dd49a3e1ac
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 07:23:57.2436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5Cp0JAqOKGbwYwFX48TcJ4b1ov5bImIs2kqsNCbMW2TQUswRBxP4KsVSHNijrhJ2VaiDUQ4zBIJPEb++4jXWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9648

From: Florin Leotescu <florin.leotescu@nxp.com>

Hello,

This patch series enhance the emc2305 driver by introducing device tree support
for configuring PWM output config (open drain / push pull) and PWM polarity config (default/inverted).
Also updates the thermal management, to be configured based on device tree definition.

The primary motivation behind these changes is to simplify the process of configuring PWM settings for emc2305 driver.

By offering the possibility of changing the driver settings directly from device tree,
the driver becomes more flexible and easier to configure on different platforms.

I have tested these patches in a local environment by checking changes in pwm output mode and pwm polarity.

Florin Leotescu (2):
  hwmon: emc2305: Update cooling device registration to include device
    node
  hwmon: emc2305: Add device tree support for polarity and pwm output

 drivers/hwmon/emc2305.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

-- 
2.34.1

Best regards,
Florin Leotescu

