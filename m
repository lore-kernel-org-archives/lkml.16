Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3254A86338;
	Mon,  7 Jul 2025 02:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855087; cv=fail; b=VNiacPyWoB9cADkyVd3llmkXkXBRLG+gXfayXzQtD9Ow0YuspKeeIsvNqyjiFOBP4qDvUv4Mwr17QA5/tq88RtBhkK+nu1mH1WgDW+kBGo9WDw9nmW6AAdhoi80rvnUz1+e/2EnSlXep2onHy2YyWjo4r07vpl9s17URxC3Rubw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855087; c=relaxed/simple;
	bh=rRUCqrK+nEXRtTVK3ijz8+a68O++NEoFY57C76CdfCI=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=idD3tUzsi4qnnqX7P83IaUAPhj9qqhNlCG3fPT5BNQtPZQQI+VCogh9SGO7CfJYQ+mbSJmLF6mR0Wx/0uPFH2sd/upHMORWgH6GJtTKuoQU6b4EWlInlKCGVGLkwx9MearpCdseYPEYDPr4e5HSOHCtpk6hiVJzuTDZ6L7i8KPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q09AIrQ3; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q09AIrQ3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnIeDBOt/gWlAzO3m5NKmuajjpFst3Je9PFfgfdUKQ/M1gnns8pPshSRhwBaToFfR/mqGRn3JW1cVvG1jmYrLC4EMk51VD0vL5QRsztvaeDV1t1Jp7ooTP0XSSgJLwSuAy5aqeM+93LzJdelIpN5WZ80DAnn/kNM6Uw85Cc0tsrj62TEiovu50ycuTDhKJVdQy9U6NT5VSguEuGN56colt2XaUTzr8Rcjdw0c9o/cfsu4+SjD1UY4a7/dY/4WcbnMp6W3xs6iEw3A/GUJ+U7CtZuNBC347nhppGGVlt9cv3cx/EelAL9hyt0K1lZLml65YMLvDIOu+L/MqWs8pPIFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQpGeKI3qO33G8/XShevyGrblDkAzNXDy9fpA3x+ymM=;
 b=c3hY6jdzgWbHUlJ2voIKzoGJQPjRy0iAk6mlJr/4CnGccBXjSGk6OZ9wroZyoGRn+BxVLT1xuYxfU1Hrzadm/wuNcz0vzpQgaAezVVDmh63R8HZON5zFGwY3Bc7Ib633KEgys8ZUI9mmqDPbzkuA/nKciyTzquD3QM0FDjUl1nhW1h6J1CRs+35MeXn4zTm6DBoIJSpWM9a766GdO9SODSKOXS341CctGj/90tRAJV7FmqaXyEpMmRV2o5Lx6patz5yhVmsz+oTJ3pQq+sVYXgSAdInoMUlj/S2QGd52J+i1xLnqZa4axSUsfriNRwXPLZ3+OQK3s9qYjdF92pL4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQpGeKI3qO33G8/XShevyGrblDkAzNXDy9fpA3x+ymM=;
 b=Q09AIrQ3NJWqdQBSbcVF/aBSFzMwhqapIso32BHtWCuaFzuMmr+wGiEZwiHRMW/aD3QVLfcKqIM66dkUj9IYwAkvY1j1DF1kLkxq/N30TYiYBl6YoZs2h4GWZBBAqSCzrl2FhlBKpjh4SFo8wwh5jrZZ5bhRQL6DDDGnltWLuXL9mqrlwq7HLjMQMSR59+23cgW3iC4ifS8n1CGIveY3KICGtcs06SUcPBRZuoagH4txLj/Jt9/oUdqBvbPTV5qBN5f+bXD36jrJ8rDL7n+JvTGh4oIR32h+zFlPm9aq3gojskZbY+5ZpZFxea/8jyGGTpx1VClCxzVToeYXk3wTcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB9194.eurprd04.prod.outlook.com (2603:10a6:10:2f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 02:24:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 02:24:41 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 07 Jul 2025 10:26:00 +0800
Subject: [PATCH] dt-bindings: firmware: imx: Add SCU controlled display
 pixel link nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-imx-scu-dc-pixel-link-v1-1-25b85d636c2a@nxp.com>
X-B4-Tracking: v=1; b=H4sIADcwa2gC/xWMQQ5AMBAAvyJ7tklJ2uIr4sBabFDShkgaf1fHy
 WQmQmAvHKDJIni+JcjhEhR5BrT0bmaUMTGUqtTKKouyPxjowpHwlIc33MStaFRFxhZDTZohtaf
 nKdn/23bv+wE7MrefZwAAAA==
X-Change-ID: 20250707-imx-scu-dc-pixel-link-608c671b9c5e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 15efbd8a-79c6-4462-4e55-08ddbcfd6cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlF4c0w3c0ZXOGMwaEtvUnFCK2x3ZFhKb0ZFZlB3STlTbkdMMU5ieGZFUTFa?=
 =?utf-8?B?dTBWejloSzYyUm9WVzBZaDhWbndvQWVEalpqTVJNZzZiUDYwWHhyY3lxb1o2?=
 =?utf-8?B?QUtUMGJqVUl1RlllTWZENXNpekU2VEgwZldGZ3FyRXhVbkdIWFZCWGZWTktZ?=
 =?utf-8?B?VHI0Z0hybmUybzR4a05ENGc1cVZhSlFoTlU3ZkVzanduYmtmTXIvMU9kanJX?=
 =?utf-8?B?ZkxvMUUrdk15VE1xb0JuVUZWcWM0M2gxUmNJMDNJYjZvckhVMHZZVTFLajVN?=
 =?utf-8?B?RHNxbHQ0RzFXNTdvaVBFSWJwYzcyRHhUaGtJdGVUMDU1VTRiNTdiNFMzaHBM?=
 =?utf-8?B?V3pUandqMzdabjRwM1VEamZGTkUrRHVlaVRLVVhKdnptN3gxSURILytGOUxZ?=
 =?utf-8?B?dmRnR2hJUU9hSGEwRTlwVTdhaTA0YTVMWkNsbTA4a0orSHh5ZDZDcVUrOGRs?=
 =?utf-8?B?emZMK29kaUMvRlFYYmVPZm9SVmgvVFRLUnBOMUNCSDZUMlpBOFJSMkRPNDM2?=
 =?utf-8?B?b2NrbHQ4czkvcW9OZGZERjhwYitqaytnSWpsYWtMbFpiU2gzRTBWQnV3eTQz?=
 =?utf-8?B?VzRFdW9pNFVlcTk3MWZvMHhVYXhKRWlTMWFxa3FkaDhhZDIwbjk0VDRzdTlV?=
 =?utf-8?B?RU1kL01RTEg3dytqc0VERWp6SlFTQndFTW1sMU5vY2JONXQyNHV3a2JzWk9x?=
 =?utf-8?B?QlR5MzFyMXNNQmZqRzhoU2ViRG9UUGNibXB4Q0pxUlNOaXQ1TjFPUVNKaHpz?=
 =?utf-8?B?c3NxbUFvTXVZdUhaK0U0N0JKT3dwMml2YWNqVWg4Zy8wM2tYUnlEUmxTSmIr?=
 =?utf-8?B?QlFjOHVaN3NaSENBZkdLVkFXc1Jpb1FHM1RXako3RkFVcnhtMGdhNkhDRVpm?=
 =?utf-8?B?dEVpVTRCUFJENlptN014QUNFeVFyQTJDd3VOTXd2aU5HejBKNlN1VmdVcU9s?=
 =?utf-8?B?Sm90T2xMYTB2WXB4ZTEvZVdUd0I0UUF4M0UvR3QyeXZQNnJxYnU3TFlNYkJY?=
 =?utf-8?B?VmxiZjJQQ3Y2Q0s4cVJkbXRhamFmU05ZTlNnUVR4K1Fvb2d1a2RncE90Z3Zx?=
 =?utf-8?B?bk9kbmVJWTB2UFNnUHovWEYwcUR2dGl5TmduT2tEb3RTNGw1dlNCd09MNWt3?=
 =?utf-8?B?L2xwYzMrVzM4bjhaWUhDeFpxS1RmN2NtMytNMlB5UEQ3UmlMdnBQQWpPNXNq?=
 =?utf-8?B?VHBTNEhSVFowcHFNaHBqNjdmWW90V2J4ZVg2TXNhTFFhK1VleCtUNWJMN2xC?=
 =?utf-8?B?dm1FbmY5WXFETFd1QnlHUVVFUjNmTXllWXlIOWdzeFFzZWd6aHNrOGFjc2Zx?=
 =?utf-8?B?Zm9OZHhsSlh2SThzcEpFZDUraGVxVU9FNGpNa0dmbWR1c3NMTWM0K2pHVkZv?=
 =?utf-8?B?WDdKbWxRbVZyMHAwcVV0ZTBFWjJIdTh3eUJITks5SUpFaEVGM3lsTkM3cFFN?=
 =?utf-8?B?MTh2SmJxSVhPOFdkSkNzZGJra29hMzBpWUJMZkZQV0FMYkpZOWpsSWFZaExP?=
 =?utf-8?B?ek5mTVhpdlZROTB4SFFyN2pTVko5NWtmRXltdFo3T3VHMCtlZWVQSnhaQTdj?=
 =?utf-8?B?NG9RenpLRHFHNXhKZG1jbFVBUnlNWW5IZVNBQnRwUEFLbkdGT3MwWldZNVh0?=
 =?utf-8?B?UG1LSkJyWWlXR1Y2OUtMZmJBZkYyOElBblFBLzJRbkhWamF6dnArbERwOHhZ?=
 =?utf-8?B?ZEY1dkk5WEJDTjhDMGxFWFRnOVBrQnNQSDRnWnpWZ2VKMVNRamlvdmM1dk9i?=
 =?utf-8?B?NmtuTm8vZWVjSGZYbThPeFFUMVErd08yajgrK2FZSjJURmVaS1ZweVIxV0hH?=
 =?utf-8?B?VlJNaitlMXlyaFArVlgrSnY3UWdWRncvN2lleWpMdU9OODNJMmdVSW5ERk9R?=
 =?utf-8?B?dCtBZStYT1VyRGhpckVZcjVGcDI5SytldGUyR1E3czcyYlRLZndEMWlZN3hP?=
 =?utf-8?B?YkpDRnllbTdmbUg2anAzR2hmczh3Wit5VGcvOWlIQWJZUjduRXphSk14alUz?=
 =?utf-8?B?WjNvc2g1U3dnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTE5cXVDMUpUaWR0bk04YUhuQVF3NG1DTVlwdG05eW9nTzNEeWd4UXRQTXNk?=
 =?utf-8?B?Z3dhL2QzZ3c5Q0ExTFZxUFpmRW9SYUx4Z2lJckNLYncyOHM1WmFmcGhvRTRE?=
 =?utf-8?B?UnRFNkpac2lsRDhta2Y2RnprS2Z3OTJzZlljWXNUNi8zc0crRVF1bVJLV2VO?=
 =?utf-8?B?OFB4enM0YmhDSU83NmFvRDQ5b2tFMGxWT2lVZGxsWDJlam9VZU5GR1h0V3N2?=
 =?utf-8?B?QTNIVVRwdHZrVDNodHQyWk9XQk9uT1dOcjlBcTJNaWVLVFg5TEFJM1VVaXAw?=
 =?utf-8?B?YXZWaTd0eHhLRXJGZFZ5OHF0VWc1eG9jWlpwbmFIdHdmbkxvdDN2NHMvaFFa?=
 =?utf-8?B?ck1BYkJhVG9CT1RoSWpITnYwZE1GY2xwVU5wcXZJTUdYZzdBN2o2VkFOZFBs?=
 =?utf-8?B?T1hwc05IMFc1RERjRnpEOGthbmNUcTF3blNKSmZpUFArTWxRcWNvWUxIVGpu?=
 =?utf-8?B?ZkR2VXAyWk9JMW9nZGs4MzdJZnlReVRGblNsSVE5UUg1SWNVdE9sajgrM2F1?=
 =?utf-8?B?Sm82dm9kWTJ6RFFHSUNLRk5hbmZIK3cwdnJvTFhTdkd2N1pHTGNOUXBac1hJ?=
 =?utf-8?B?dlZxdVpoaElZSG8zNTRtQlhKM0N3QitIczJ5UHU5UnNYVWNieXk2UjhxNmdP?=
 =?utf-8?B?SU5sdWhyRkIxS3YxUEcrNVpsYUMrcTI4QkJDTnNrK3crS0phZDhzYjI3anJO?=
 =?utf-8?B?K2xmZ2htdTYwSkRzZ2NJZFZNeXFQa0RBcFQ4dkFQTzh5V3pwSEhITFMzVUd3?=
 =?utf-8?B?YXYzUlFOak9jVmpnZ0VDVmNIcFQrdmJEZlJadGYrcDcybW9mNm1IUkw4dFVl?=
 =?utf-8?B?YmkxZDlKdWY4VWxNT3pRbGpTOXpJNEdZaE1FSnZsWTVRS3U4UVNWY0NpRDkx?=
 =?utf-8?B?SDZpUVVxalZJSWdsYzFFdUtXbmtlaTNsN1h2UzVweHhOQTg0WHYrcnRCTkpk?=
 =?utf-8?B?MVFTWGJoYTFEU3YwN1BWMXZoTWdIZ050MWcwQ0lVcTV1TFdXVHhRWkNmNnh2?=
 =?utf-8?B?YUJMOFg5QkpONWo2L09RUmp5Ymd5UmJCajQ5eUFSWmlwTG9Ham1GZm5OTWFn?=
 =?utf-8?B?aG9DR1NnSXVzTDRaT1FtNUF6UzhPa3ZPR05UaTdUcHhsRXRPREFIbTRLbFpq?=
 =?utf-8?B?NC9iUmZkclRuTzZENWlKVmJ6aWg0TUdaRHVRejBqOUtkK1dDTVkvQi96eStk?=
 =?utf-8?B?Z3YvaFVxWm85Z3dwL3YzVEJCK0VncmR0c1U0aTk0VU8yS3RFNE5TSlZ3WG9G?=
 =?utf-8?B?b05XRndaSm14clhkazlOL3ZnMGo4cGZIVE9LcDJNdWZMenBxOEE2bENsN3pt?=
 =?utf-8?B?ZkJ1amdpOFAyc1hWd01YaTlGeXBTQjFrcmx0N3B5b0l3V3BvQjB5T252T3po?=
 =?utf-8?B?QXU0MjNHbXBoVHFzYndpT01rT29mWG1ob3R4ZzBTdzJNeTdzdXhvR0xzOXVp?=
 =?utf-8?B?aXNVU3REWUtjMzdNakx3ZkVwcFpEYnJ3YWkzc01DM2Q5RWs0QkpyQ29LUXJD?=
 =?utf-8?B?aGVtOWl3Z3VBY1ZDbng3Ymt4MjlVbGlua3lvek1qdjMvMFIrdmt6YnJFQkNs?=
 =?utf-8?B?azlOaDYvWXNlVmtJYlNYTFpXZHpPdjZCN1lPNlV0S2VZejN6L2RUU0dNMDlq?=
 =?utf-8?B?VDZaOUFobUovaVA4Q2pRRUlVSENLNDVUaG1uVWRWT2hUbzZ4a0FPMzdtUEVk?=
 =?utf-8?B?Mk5teTJvc05hNU50L2ZDMzVTME16QldVQzM0bERHNVY0OHlWbHpNRWRqWStG?=
 =?utf-8?B?YzE2elpwMzlHY3QvWFNyRnJhZ2ZFOTU5OVZxNHM0bjBxNysrb3Q0M1FDM05I?=
 =?utf-8?B?Ymg5SXFZbktJT01ES29QbGNYaVhJdWtmb0lvcERQMFRJcExCZkF5d3Z6RGli?=
 =?utf-8?B?WUlmNERZZGhPcWo3V3JuZi94VjEzZS83Z2FOZnA3U3cxbE9RZUN6d0hwNWVC?=
 =?utf-8?B?Vm0yaDFRN2VuVkpNMkFyTlk4Wk02cTB1c3FEWEd3elUvSUNkQ3U1dkUrZ2Qw?=
 =?utf-8?B?Q2NFdTJCbW9WcDJRRk40WWU4citKeHpSbjljVG1aOElOUkpvZ0VqdU4vNGRF?=
 =?utf-8?B?ODdmOEg1MW5iKzVuekc4S1l5cXhGQTZ2VEM0RWt0bW9ZOVdUbUY1amVERnRm?=
 =?utf-8?Q?olKCGvtYzlbZ+aHAkuVLSN64C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15efbd8a-79c6-4462-4e55-08ddbcfd6cfe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:24:41.1238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCSToVpyDmgw2txUei2RA08gB1FEPINqsw6CHywnuNqFXsgwnutAjCJ0CHv8v/eutfWGDgLcHylTSC8cinR6EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9194

Document SCU controlled i.MX8qm/qxp display pixel link child nodes.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,scu.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index f9ba18f06369215691c69cdc1538b53dfd369f37..e3b9e7e2d04087ead8c62c213bbbe5ab16bbce71 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -30,6 +30,26 @@ properties:
       Clock controller node that provides the clocks controlled by the SCU
     $ref: /schemas/clock/fsl,scu-clk.yaml
 
+  dc0-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc0-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem0 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link0:
+    description:
+      Display pixel link0 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
+  dc1-pixel-link1:
+    description:
+      Display pixel link1 in display controller subsystem1 controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
   gpio:
     description:
       Control the GPIO PINs on SCU domain over the firmware APIs

---
base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
change-id: 20250707-imx-scu-dc-pixel-link-608c671b9c5e

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

