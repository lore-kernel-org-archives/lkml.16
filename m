Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC145979;
	Thu, 24 Apr 2025 00:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455327; cv=fail; b=iwfd4bhtr8h4Kue76VYB4CZNBdPHNZszX6oqfs1mYfCdD5+fR3GkJJ78qC1ms6SwpfFoXxvnIA/EhZjKbpsKhfrE30JFhZKF+7WM3QprZ6+WmbpQj78XOe50BxunBZRtMYgyh+/m0uBID0r8NNnCEh4Lhtti6fqWXKRf86hO3MI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455327; c=relaxed/simple;
	bh=LQHWNubdjFqURG5uIjF+Ty/tmvjzSkCblk7hE0aS55c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MokD0zCCT3hcIiN9VeiRQuRxXRC0XObuQ0fe9y9N4SaOZ7II/ht0MZ7SsrnZsWse8aTAUzZu2VAEcZ76W5OMcpKY3qQK1NLJ9v5o5yrcAeJVRX3JoX6BVzlBi5RrPJKXlFl7KLFLiN3J/JrG20fiOXstTS/tgub1N472XUxEJcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GU/qjnmQ; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GU/qjnmQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jp5xLWlWeA4IzN1Lue5Sj6aE+UDKAua+5+qUKycs5gzZSi9x34I57QAuqEDEpciQu/5Dlljr38mAqCcuAEf77l9B57Ca2NyvI4/hQmHzZ53mWJDaNFdlYPy7yuFSZThq1H80xovuZIXWzThCSJd3av4/eGd+zrHLRDYizW6rAi42g8DwKuX5jHeLjkeQpIDIPFgd2apKqWipE6gCmkN68dYBAzYKAgD+yjNYGAdHbWPF1auIzyAoFdFsr17NDBiO39rRDOEiOZqRlb/jANFBD/vnHEoNBLUqtWf6xwCzF7wto4V1kjKMhaAnou54pRCCYSu2EYNLKpdfcm49cWUvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhiVyIfXxlDQ9B6SjloiXdIny0ApfkNg9TzCT76TPY4=;
 b=uP233Ml0uDwbBpRSCxu/kq6q0XOL5+Rq7S7ZTs6PbGItSphNERL0AFIggIAUm4M5ZX5GSMKR117z1yRHmswpLktFVpfNl4qKtH2cp8iSZUvlFPUpsfKDu0pjf8nHjy/tb3eWNPWc03vvsr9TbecJbzIWyVHsVO6LjsfP7XWVAy1dU3g0XI5A+0Ll8D6zVfNkTTLpHg40E+Ij6QvACU/1L6eBcqUYaW5N9pY+NzlaEWIGuTih8R6C0G/bo6t1y6j6IbgVA5pBiTCuGtwST5e6pEcybTwJAGBGOnnZZkpeNGiL9ugmlhhgQaDYiCX+p3m2ZYh6wqX4W6hi9fQa8aACSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhiVyIfXxlDQ9B6SjloiXdIny0ApfkNg9TzCT76TPY4=;
 b=GU/qjnmQfqqkiQJEauyy0UuZrqx0WdfGWy0cmXKMiuSSsyTyS2MLBkrBWod2QW9ugjQH2gfWgiykUOjGtVGnbBMELU650vOgmoQaINY4yVlI5ofYfGnY5RcVBGZyeAL77uTgt2O++EN5s9BIWtHl0BJ4Yl4kn4AAkwQSZZ22l6TpMTtnXP7jbITJuUpXyJTNV+Ze1guOvnfAdNdeY1yoffa2NfanU+P6mQ4flNYlytUmw2WlkU6SVyAYifEz5EFga2wApRV7dtM/wmZ6URYIJH07zi8R8UxrgUUFuvvNg7pphqIIfsyq0Kzzyo1wMRMNbN83f4h58T+E/hz591DI6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 00:42:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 00:42:03 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 23 Apr 2025 20:41:28 -0400
Subject: [PATCH v2 6/8] arm64: dts: imx8mm-evk: add pcie0-ep node and apply
 pcie0-ep overlay file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-imx8_pcie_ep_dts-v2-6-43c982d83a8f@nxp.com>
References: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
In-Reply-To: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745455301; l=1928;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LQHWNubdjFqURG5uIjF+Ty/tmvjzSkCblk7hE0aS55c=;
 b=pH2jQOf35aD282RwWjRKPA3SXHOflURq0BS5RsV5wxEZ0TfvlbuZUjfxjnLHsxF22Ja/FLF4I
 SNbwqf8EcllBRnZfhZcSWSEih/4EXy5qWjv3FhnGL2XgoY0fEPZXPMK
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2c2789-9ac4-4f71-5757-08dd82c8d500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXJvSkdOTmxTcDU3ajN3WFg0c3JLcUF4WWNkWFAybk1rcXJpV0szRU5OeTI4?=
 =?utf-8?B?V3BSclBHWTZtdlNocWtQSk5hYVFRcmZFYjVUcHBKK0xTQzlERDkvNjR3cDZ3?=
 =?utf-8?B?cVVWZnR6MGk2NnVUMHhZKzhOaXU2K2RQaEczQ05ES2ZHWU1IbTVCWnFWRmNu?=
 =?utf-8?B?c0NObFJWM0x0ek5JekdzQVluUHoxZzF0S2FLNXRmQ1gvcnFEbEpUUm9GNVZj?=
 =?utf-8?B?d21WLzVWcTFJWkI1Uk1iMXVJWDJNanhGZDBPcDIwSVFIZGFZOW5oWXJBaDJy?=
 =?utf-8?B?bFlidGlXNHI3bnpEK2ZJSFNQYUpoRVdOR0hzN0ozTk0rVktMUDB6bXZwMjJq?=
 =?utf-8?B?V3dxNHpLWWdBR2l2VU84dFU0L3BwUWhka0FqSGE2aUFFa3BmSDNIYWdPL1FW?=
 =?utf-8?B?U0tFRjkwNDg3dkpuWGdsSGlmbS9LSzlnWnNwSFRBL1VCM0M4bCtzOU5wVzB5?=
 =?utf-8?B?Mm5LalRZMU0zUjFZS3FPaDdTUlY2eEEvK0g0dnFrSXBQVTlPOFNlZzdTSDI3?=
 =?utf-8?B?Q0p2cy9ERlNlSVo1WUdoV0RpVFpRZkxZZUdtZ3RNT3JlalRLL0Foa2ZGVzdz?=
 =?utf-8?B?QnhPSnlVc1FlVVBkbncyYW9xMm1nM1JYVlRUa2tjR2pYbkRGR0RCR2V2cFBl?=
 =?utf-8?B?aTkyalI4Z1N3OTdIbUxmakJsMFdIQTJkWmR4QityOEwvSTBGYllIdnUyd3Np?=
 =?utf-8?B?eUQxWU02anVTcjVTN0NaR3NBdzhRTXM2NWNEMFd6ZmhZU2E2OVo5VUNEVS9v?=
 =?utf-8?B?aHBEbGVOakd3Nk03Uk5PVWJjY3orampXc2NvdVQ5Q2RBNlpWWlZ6T3V1S3k2?=
 =?utf-8?B?dTZISkNWd2ExSlljQVlnWWlsckl5ZWo3eTVTM0hyY3VTVXZKM0xxOHJmS0xS?=
 =?utf-8?B?NGNUQy91dlcyY1RLUlRtNGpwQWRaTXBhSkFhdS9kUjBqa1dXdFozWkJYZll3?=
 =?utf-8?B?aVMrT1YwZUs0NzQwYkZ0bllNTzdzM0lwQlJXUnFuS3pmVmpodWtTencrSkdm?=
 =?utf-8?B?bmJFUWNrd1RaMEpFSEtsRitUL2paejltUU1sMGEwcjFSZzlEVU1MTDVaZnky?=
 =?utf-8?B?N2NOZ3lKVTQyZk5hcFF4TWUzRkFYK1RZWHlETE5CMHMzc3NQYTMzV2ZkSnEx?=
 =?utf-8?B?akJ6Z2pwNXFScWRPSS9LQStwWGYzQmZTak1vc2VjNTJSQmJMQll3MTRHc2Fo?=
 =?utf-8?B?TlhFaUl2UU9VZ3BIcFhUNEIxRVFhT0tTREUwd3VjL1RvUDhTUmV5RWNPTzBl?=
 =?utf-8?B?dG5zT21IT20wcDQybXBMc1kxOUc2cXFpekcwSUhES0prRHlWajNWckVkVVB6?=
 =?utf-8?B?b0FiSGpwU0srZE9QUDhlTi9CUEQ2VEE2NUpXNFBOTUQ1STR0RENudmRZNUlB?=
 =?utf-8?B?U3djMGlQUDE5N2xROFlLaHN3Qm92aDBXdXlPdzJ3ejRIS3o2UDhiZ29DY3o5?=
 =?utf-8?B?OCtkMnNoclFhOGFKbUJPRWt1Q3FDY05hYk5QdXlzTUgzQm43KzhpMDdMekNl?=
 =?utf-8?B?SS85ZjJjWmZidFlsOXVXM0RBekxZYnlLSnAremhiNVcrcFNIb1ExV3RHTElm?=
 =?utf-8?B?YXpqT2g1NnZLQWNmSU0zQ0JJcFBoa3E3NFVsckNRYzhUUW05MUtCejVTWFNz?=
 =?utf-8?B?dmoxa3Q0bmtqd3cvR0l5MFZnS3FRVURaUHNRdlg2ZEx5cXhKMS90SnM0Y01x?=
 =?utf-8?B?UWtSb0NvQnR3STlBS3N6QzcrUzdXS2RiaUJkNXRSUWZSUWxVaWRidTN3Y1U0?=
 =?utf-8?B?UFpDNmlXMW5MU2hwRGRYeVdYbi92SUc4WklyZVhMS2lFZHFkV1dRWGZac3pD?=
 =?utf-8?B?YjRvdmlJc3RSWXhIbHVobDBTV0tEOUhDQ0taWjZlQ0hYT1AvWlFUd2JZSFRu?=
 =?utf-8?B?T0EzQXhTakxvUjlBUHVwTms5UDlzekFLWTR0T2tHSWxiYnBGYjNuUzBDUkM4?=
 =?utf-8?B?QXYvSXpVb1BLNjRxa1VsV3NIdHdSR245VTNscUphTVlOVUVCaWVNMVM3ZVoy?=
 =?utf-8?B?ODhsOWtNR3FRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzNTV0xzZHVBdXJ0UmgrUVM4ck0rUmI5VHRrck5nRldMeW5IZ3NVNHRnTlU4?=
 =?utf-8?B?T1pLMjRUWWNpdmdyQmZ2MTQ0SGNmMDM3dmVHaU93eUFETHRVUDRRbXBQS2Jr?=
 =?utf-8?B?dnlxajZTanIvSUl2L1lGNzRUK3lsTDdZNjhBcFB1YjFCdUFNaEQ1cWwzS2tj?=
 =?utf-8?B?OHBvZW5XYnNpQzZYTElZamVKTWpKSEN6TjVyb3BsSDRkWmUyTDlFVWpCdmRE?=
 =?utf-8?B?ZjAwUlp2QVdZQXJpY3BJNkgwZi9mamR1dlRGb09KZ2o5U05TZGVXMU94dlAz?=
 =?utf-8?B?OGlpbXhtc2FvbVBTZFJHSHlwRERXaElFVndzelZaUEx2aXJsb3EwWmlkTEhH?=
 =?utf-8?B?WlJlNFlIQlRvbmpiWmcvazVodnNpU0NTazhaN1hDWmtGSHowNy9YTStHTk8y?=
 =?utf-8?B?bmlEVUpvSGhpeWVabTJvWnRTVjRSaG9wQnpQQk82bk5jaWtITzY2aEdoSUZW?=
 =?utf-8?B?QkV1d2VoaXlQelRxd2p5U0FUYlBwcERlOFZGZCttdE8yWmhSN0YvcHRCQ3hG?=
 =?utf-8?B?OUZod2FWMnlDekwwLy9MOUJnTERSQ3FPdUZRUmxtRHg1YXU3d1ZCRThIaXVp?=
 =?utf-8?B?SjVkR0x2UENBUnduVExJdHNyZDlnNFg2eGFlRExIYzhYTjlVQVBLelBaNWI1?=
 =?utf-8?B?M1dBK0JJZ2xZMGU1eTd0TmkxNTRiL3BabXg2TUd0S3NvQUg0dzBPbDlWNUV2?=
 =?utf-8?B?alllTW1zRUg2U1ZORmxSMnJKVzN5L1k3VEFxbmV3V1dQb2tudld3UkFHTENi?=
 =?utf-8?B?cG5xS3hxL3E2SWhJQWdzVE93dWlsMUxYVm9LK1ZvZ0Q3aXR0VkVIeGNMaHpN?=
 =?utf-8?B?WGxkZEM2dko3ZGZ0bk9tYVg0QmhWUFdCUVhvUmRIZ1VXNVF3U2pCWWxMUkJF?=
 =?utf-8?B?cjVXOGV5NDdRK0RVQUtoK1hCN2JwZGNmSXJRNHpHbFZQWjJZOVRuR0F4cjd4?=
 =?utf-8?B?bkRUNHJyNVJtUGREYXZXWEFkUithWitLd0JBT044ZVZ5MXM5VGxCeitWU0Ux?=
 =?utf-8?B?d1U0RmsxNFBtdjNsQnJiR2xRZ1VXQjV5eFVDdXhjTHVJSm1Cc0UvVXU3NVVZ?=
 =?utf-8?B?a29xNjVPczFYU1NLOGQzOFN5RFFEclR6bXVidmJZN0wxaW9Td2tkZnVJREdS?=
 =?utf-8?B?ZXBzZGFaS2dRV2FCWDJiT3pSeGh2M1g1Z1lGQks5M0FhbHF3Z2IyWW1UVzkz?=
 =?utf-8?B?S09UWWNHdmpJQW9JQkhXUmFpdEg1czBMOS9lcUdKMkFwYXpIN1JleWNOb1V2?=
 =?utf-8?B?NW0rd1R6TXd0UXlKa2t3cUorVERWQW4xMlNWSzcrekQrayt4RzNPU2dUcU54?=
 =?utf-8?B?cFlGeENKUlo5dWtSNEVxczlsSFIwRHd0SUNaVDhHQ1J4b3M1MFZPZjdpMFU0?=
 =?utf-8?B?eU5mdUJEVm1sY2lxWjdINEROd3B1eXNMdXZDQnlodnV6QWV3d2dkNHh5SGlR?=
 =?utf-8?B?UjlmWmtrckxGeHM1UXB3Zk9kZUVhWlA3cGQ5M3pIMU5LQVRWd0R6clVLVGRH?=
 =?utf-8?B?NUlONG5GMkd0ZWIvbWI2a1VxSWRwczk3OFh0Z1IzeHNya3MySUVsRFVFOWxl?=
 =?utf-8?B?cS9wWTlNK0FhSzYrN08yWDBiTjZBeHpvQlN5VDhEeEpoZjJZb2Foa1p3ZFVy?=
 =?utf-8?B?WWU3QXpWRUx2MHZVZU5FWHZiRTEySFhUNEJwS1U1VTlHTkp4dUJRSUY4NUk0?=
 =?utf-8?B?VURzV1BWMXNiSjVXVzkxRGZFSUhDdWN1UXhibm9VSGJubklkQ0pvZ3hCdkxJ?=
 =?utf-8?B?dzd3SjRiTzFBeE1NRWRlTGYraEY2WmxNUG5yR3N6WTFId0x2RUNsTEJlSzBU?=
 =?utf-8?B?K05nNEhoTk1nV1YxcmMyTkZKYm5tSE1zSEx5dllFSDUrUnlFNCtsSGgwYjFY?=
 =?utf-8?B?cnVodkJ1WThpS2FNT0FFbS9hVit5RjVQLzhqU05pQm1qL09xWVZVMEwxaGcy?=
 =?utf-8?B?djZzVmk2dHFXektMd2FoQi9YbXF3U1B5RzRldnRCbENDQ01wbzl2YWFFMCt1?=
 =?utf-8?B?V2dKeEtYUDNZNnFhaEdBN2pMdDdZN2s5Z3ZzVHpqcHc1aHRWWHpGY0tSUksv?=
 =?utf-8?B?QlBzTkFCWlExU0lPMlhsekM1c0xzYURCZGdsdWgxeExQeXV1SElKenhRTTVj?=
 =?utf-8?Q?VL9A=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2c2789-9ac4-4f71-5757-08dd82c8d500
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 00:42:03.7121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzPR3/CRWEuKsBL8JNSsOtw3who82JHn1/PlqMC4S3SzFKeiTg/rZVCf2GCP8JRVi0ZzWjkU4p+gwWy/K5CKQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

Add pcie0-ep node information and apply pcie0-ep overlay file.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  5 +++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index aa7fd9dfd39dc..44f3f56c1a3b2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -116,6 +116,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-emcon-avari.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-emtop-baseboard.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evkb.dtb
+
+imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
+imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 5f8336217bb88..622caaa78eaf1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -544,6 +544,19 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie0>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "disabled";
+};
+
 &sai2 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";

-- 
2.34.1

