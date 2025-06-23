Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013029.outbound.protection.outlook.com [40.107.159.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A05427A904;
	Mon, 23 Jun 2025 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692358; cv=fail; b=qxI+QIaKgH/YeuyeT1qvuuMWAZIMq0qtgMM73AyBLRMio3nTmKF6ymd0rQ1xXIOLF+OFJaoz07gQ0YVlp6uwYFmNMzV9xd5jkpdsd2sYfIno1F9wyvkyWED7dcyZ8CU/Bl32u5wenQte6OSkDSBd5hmNSTsjsejrwlwgBDnAMwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692358; c=relaxed/simple;
	bh=lDsNoGkHimlc2WP2oAPbTn31Ea5LNvvZ5xKR8wMK7ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dWMw9YV7T8NweCXXoL7yHNFbKnD5M3wEeqp23YXSMgKPrsPBVMS44ohou0O0599Dy1nOPyI/8SCON1YIYJiDuuspp/+WyZPyhJu/ULaWAo41p7C2DJ/FfSrmd/dtR1eLUmU8AzcvXeyp5N9C5zLpVkTASL5Sl2Tx3TYOp7LA5RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q5nI06LP; arc=fail smtp.client-ip=40.107.159.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q5nI06LP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUuszVcfr+j8AlgKqg316Dmgad7D6+7HY+C6HdjEcIcZGY3FYNlIa67E5RqpxlTQbkjiN8cGNNjpljgAcl4fe5uUQVek5XaytTN/UHHjTQNKmK9uzFhe2QToG0xGrom4oZq40iXDKmELeuBGRbNXttQwXlpdVGWnCqnwvIWj/xKpQ8rgrNKNEvtR0ZO8Rj8vR++jI/ZEif/renhU9sKoK1PEuNVoiPilPOmu8XueoAqF7y+AHVBHZfCe29ebngIicFZM/2VczCxLu/15B6kst8CfLJY/WMaIBUwM/cZvFUs88tN5byTG5WgnH25mG0cLuGGv/YH+TLIH3zdsyLzlJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6Xmi1/zJXVncPJdkqg2eiLPlDyJDEjpWj9VQKCrfV4=;
 b=KtgN7rd1YTFlCB5Jm+5s6kuZ1U5gqjVieGK2eKea2Wt2tVrTnAkuqX4EJoNRTUrASzl3VfzPqzoDp+Ss1MGCzpiTWJQopZitqkpnLcIpTpsPLZZnxM4ga0j7WBAOrXVlzj5coCBNtQNJJW4NYV3rHC1ELGqcri6xxPZNHV64QcHLXPXgfj2Y09BwvInl9esIFtUlSny/tQgGOExcyphfzMlSzsCAJAhnSZjS2PdNv7pejiVXuanN+0qrTGCRP6NFQ1jY+jW0Pfxqo7LUNbFHhYM0x+W/RMzTKSflZewqIAP+GJYZv+sqn+qCP5FFODtcuJtl+JQezGWDR9JeOJj8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6Xmi1/zJXVncPJdkqg2eiLPlDyJDEjpWj9VQKCrfV4=;
 b=Q5nI06LPUHW2BhWATWnWyJU+u57GTnqKRxm1iFabk+WmAXeFdRMOMNmKCJ1Mu9PGnE0qGSSkWr6Z369vQpdBeCv0WmDcgpgQw1UbnAhDZmB4GUHiA8sL37OTF9rYzlKCE2UXrLIaD8myky5AK2zEeSFF+TVFh6nDacNgAcW8/p7MPFDcExQdarrDMSZX6L8ki8lqiKRLwWZqPjycW45fNuuHodmx8hKS2jA+bKGvBiGrebCdd89xBZ9XBnMOQmIUixhExqYn4q2kwA+ff1raj/4VtqqLj+f4Y+9oylyuwnodFYYweNrABFPB8qfCOWXm80Z0lWqCJ1xHsdFF50KlWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 15:25:53 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 15:25:53 +0000
Date: Mon, 23 Jun 2025 11:25:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes
Message-ID: <aFlx+Qvh9/Stx4vu@lizhi-Precision-Tower-5810>
References: <20250623075440.36660-1-ada@thorsis.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623075440.36660-1-ada@thorsis.com>
X-ClientProxiedBy: BYAPR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:74::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de480fa-3f99-4b68-a2a1-08ddb26a3e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K042dm92Um9CcWlyTHVVRnl0bUJhNVJNcUd6ZndObFhCd1BjbkNrQ1B5aFFh?=
 =?utf-8?B?bk1WRUVNUFEwbTRtSmZVOUl1czZyVGUvS0FKcVVoZjE2UFpZWU9sdG1XZFdE?=
 =?utf-8?B?MURlTDd5alQwMGNHVytMUUY3cFdrU0JQUm1rYkgvRHlLaDZHVXZwcld5S2Y5?=
 =?utf-8?B?TEUwUlhrdlkyVjdjNWNmWVp1RWRDZjRSUWRCTS9sTmRRL1VvTEtuQzd0dmpT?=
 =?utf-8?B?UzE1YXZQZTZmbGFxWDBhZkhlSk5MOTVFSUxTUmpUcHFrK3hYTGU1ZW5RRnFk?=
 =?utf-8?B?ZWI4eFYrN2RLQktwL3cyQkpvbi9BOEdQV2d6ZE11Z0xCS1hZbm95bi8rVERz?=
 =?utf-8?B?aFc5WFc3RjFLTHBHbm43REw0VFVOR1hZbGlYNmZJNlZOQW1HT2poRTdFcFR4?=
 =?utf-8?B?SW5aMUN1amJzanFoZVoyTTg4blMyLzJIRHRCZ2R6a2dPOXI3ZmJVaklsTG13?=
 =?utf-8?B?OFhsaXA5TDdKc1FnalJ3amxDVFJRY2pISmhQNjFPUjNHRTNTbzFGSnl3eUFm?=
 =?utf-8?B?cUVpUjRUQ0RtNHl0KzEvdHlUL1M4MGdYWjIySFY0OTE3WFZLYkhaeURvZ0FV?=
 =?utf-8?B?bXdSaFpGR2NndXRqMmFMbWFkamlBY2U0WmxWRUJ3Vmx2UFFnZlA1TjRzZ1BI?=
 =?utf-8?B?dDJmeEVhWHJJRXVKV2RYKzdCVFA3TDlsMkZld2RGaTZnbDNwN3JMSWdKUzlB?=
 =?utf-8?B?bEF2cUlrRUxJdXljamh6K1Q3ZTFiSDh4ZGN4OWJMS1dsRGxJM0JnVHFIOHlG?=
 =?utf-8?B?eVJYQU5XT1dyUGIxaVEvZXlyKzFXVlo2OVlEMFdPaGFZaHoyZU5BN04vLzhK?=
 =?utf-8?B?V0hrc1VlcHRvWUN5aTY2SWR0UGw2elcrcHhHWFBVZkluMy9YVk5DVTdtRy9U?=
 =?utf-8?B?S3RsblV0alBjb0daOFJ0YXhkSTZqS004YzRucGE2QTVGMXNjajJzaDdUMXBj?=
 =?utf-8?B?T3FOQzFXcWRqZkNKSktKS3N4bmxYdUg0M0J2aDdSVENWNDM4eEM0MEJlZlZ1?=
 =?utf-8?B?VmZsWDFMVVBnNEtYS0FKQ3NrK2VGQzQ2K04zWXhMOXp5Slh5TXlxUWNmMTJa?=
 =?utf-8?B?OHQ2S3pJNjM3UUxiUE9TbDZUbUU4VTlWYXFEK1lpcERRM2dvT3RVRWhQMGs0?=
 =?utf-8?B?NkY5M3YwS29QTHo2aVk0R3FEbituTVdYS1ZJZ0NjSHkxZVorUEFFTzM1TWln?=
 =?utf-8?B?cy9aZVZ6RnNJdmtYOTVsQ0w2b2I3UjYxbXk5RXcyQnMxU2p2K1U4c1FkYlNi?=
 =?utf-8?B?bDZwbEwrdk5qQW5DdndWeitaeU1nbmdVSTBWSHQyTiszdForcjhXVEtlTTFE?=
 =?utf-8?B?Slh6azhOVURBU3VYazRJOCtlc2djNFFmL1F6bUdnWFVjQVlqYzRCdGZmdjZn?=
 =?utf-8?B?SW1rM3cyTmxubHlrQzNyZ3VuVEFrbUVnUm9RVW9GNWJFa3ZoUExTRDdLdzhT?=
 =?utf-8?B?RVZtQ0JrVHB2dXVqcWV0UVhnU2lvQ3Z1QUtINWJzVHUvQVN6aFltRCtnYnA5?=
 =?utf-8?B?OFFHOHBFU0VJdVlQLys2ZFhNVGo3QUtnK0N1akk4OFROK21GN0ZUbi9kTkdE?=
 =?utf-8?B?U05kdzd4MmpuZ1cvNjUvektJRlRrRE9NdFBTS2ZoREgzWDFmUm5OQjlFbDZv?=
 =?utf-8?B?ZjhHRDdZVEZBWjlKZHMvZlo5R3JLQ1hTM1JFcHRPek55MDY3M1o0Z3llTjdS?=
 =?utf-8?B?MDdSWjhaTUQyRWpDWEdmU3ZxUGRkM25sQTAyRmFhTmlPNTVIaWVzTTNydlVs?=
 =?utf-8?B?dUpDaXRPdThjMmZLNXRBMWphMEk1V3RTZFA1MEgvYkZ5cUFacEZ4RGtkMGNT?=
 =?utf-8?B?T2tXa1B5UTR2RVd1QlVHRWs0UGhmUjNObEE1ZFpzU3lzdmswa3dwOGFSUmhH?=
 =?utf-8?B?a1ZPdlNCSHVDdDdDZUJlY3RXTVZFWFh3RzUwQ0xndzgyaGdXcXg1MThJVXpv?=
 =?utf-8?B?cUNTUnB3bTN5ZEpqc2R6elFMZnBNT0Ura282czZsZmZoVXdjanlZaUVPa0hE?=
 =?utf-8?Q?2VHihNbysWiHWgqkM4w7fLgfImqiuA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1B4MG5TemhBUlNuY0NETnFxY2swNTRXSGloeDZtM1E5dXJxcWphZmNKWTlB?=
 =?utf-8?B?UFZTaFJuRWJtL1VsT2xEa3VkNzNOTmRTOE9BenNzMnduOFBwQ0RxUW1YUmNB?=
 =?utf-8?B?cFNadUE1L2JmUWRsZWJMbWd6YWM4RllBUXpNRTM0RzA2TTg5a09kYkp5M1M3?=
 =?utf-8?B?MzRIQmRKS1FUTzdCTnZwcWtpUVhpcUNKYlNFM0xpa1FvTUMzM0xzUEd6U0Rt?=
 =?utf-8?B?Um84VVB6WXp4YkZMQ2J6TEpBekpGUUdGaHoxOVdybFoxSzFQVUtsa21Qb21G?=
 =?utf-8?B?WmRqRUJwQjdjd090SCtMSHhubnd4amVZMVNESjFCY0pHLzJBQk1QWnQvMVpT?=
 =?utf-8?B?TFVFcm1PZG5iT2FGRGdTSHNzbmVzUGdOOGVzbFMzL2ZoMzZubmQ3M0FTVXZk?=
 =?utf-8?B?dmJScmFwdld0YjE2dlo4M0lGcE9RMUM5T3RNdFFCV2R0YlE5RWxXQld3YWFp?=
 =?utf-8?B?bXpMdmxMKzNqMDdNbHVnNzhCQzV4bnI4b29GVTZRcUtrS3VzR05MMCtIaTVZ?=
 =?utf-8?B?N0dONzUxSnRrbTEzRCtpUDNKUXJQdmErQ2xoem1JSStzektxY0pydG5VSFRL?=
 =?utf-8?B?dGp2VWU0UW1BcXgrTHlYZUlFUGRoU2VoSUxpaGdlZ2h1bXM4aytTNXZGTU5I?=
 =?utf-8?B?NzNYa0lEa3AwTFJ4QmxXd25aSGJ4WmQvSEEyVEl0YzJWazVpdWFPN0M5MnVo?=
 =?utf-8?B?UFVTT1Y0MDFrZjkzbmN0UXloamZhaThnVlk1K0QwbElpbmxTam4wVnhsSUhJ?=
 =?utf-8?B?YlJ4L2g0ejZTdHVnUHQrNFFWZ0FpazZpQkNCYU1pR1k2K2E2ZGF2WHhhOVY5?=
 =?utf-8?B?NGx2ZUZrcHpkV3VLOUYxQlgwVG5XM3Bsay9ObGdaa09XVTc5TzQwYmtKYlpE?=
 =?utf-8?B?TlM1dzZUaCtGUGdnMEpsTmEvdXdxSGdRdVVhT29Jc2hpaHlyekZ3SDBhY1Zh?=
 =?utf-8?B?MXpnaGJyN21GVjhrSnhQNzJIaVBFMTdDR251RStWOG1NTEViTVJETmpQQVR2?=
 =?utf-8?B?K2k4cFFiampoUVhiYmJFS01QVGhpeUVVTUNBRG5yWWVaSWNIdUgrb3pUK3ls?=
 =?utf-8?B?M0ZwNm1rbDFzUEVqRXZ2b0M0KzRCK2ttWXhydWdUYnB6RVBHT2JidjN6UTBw?=
 =?utf-8?B?cVdIZ2tFZ2dtYWtpb0tSbk95VlZXUGNJcXZKaDVKY01LM2pua3FzQUpBZ1VJ?=
 =?utf-8?B?OEtWaXVKWXkyUXdDUzVrdTZOYTlKV3JOMllGd0JKU1JyZWlYRDgvQWxPNzFI?=
 =?utf-8?B?WXV5Vnd4SXBsUlhuT2RZMVFQRllOR3UxZkYzeTZXaGh2VWVJWGh3WUJLTUV5?=
 =?utf-8?B?S2ZFL1YwYlFybkZxby9zSEZDa3Q2ZTBodXlGYVc4Y1pOaTcxcE5mNVZuOXA2?=
 =?utf-8?B?RUtBRjl6QXM1SzF0WjgyMit0ckFwRFpMTmJmV3pxQmtqajFzR3paUS9NY1pQ?=
 =?utf-8?B?a3A0RU9kYnVid0FNQXJhQUtLQW1zeDVXbk1iR3dpZlFvUEY1QmFTVTBzckRV?=
 =?utf-8?B?amJmRXBKb3dtOXJXZ1NzNDdKaGh1V1lCWS9DWk5RZlR3SGJoMXc0UFNVQTM0?=
 =?utf-8?B?U3BtbisrSHpFUEJQeFlBbTJrekhwVzF5NVBDNjNQNGVqcEZzMzN1MW9ic1ll?=
 =?utf-8?B?STYwdHh4Zyt6MkVzeEwrNDNvUU11ZStMVTYyakI4OElzNmhOc1FvMndYdmVN?=
 =?utf-8?B?ZGVnRTV4Wmt3cmo5UjVnOStLaW9rU0YrQTRrV3pheEVsRFZHWnRVV3Z6UUk0?=
 =?utf-8?B?N2ZMUENkMFF5c2hPRUo5UUtSSHVzMHVONEEvUytSTmF6QUI4ZHRKZE9qY2ZX?=
 =?utf-8?B?aExXNGU3K0RnOVhYMjJQL2xSaU5tNWV4RWtzYTFpemVzT29lTXYxbnFUUzdY?=
 =?utf-8?B?NC92OU9hSXdMZDNkUHdLQzNnbW1RSk9Gd1R6Sk0rTTBSanpxWDRDNjc1akRN?=
 =?utf-8?B?eDFkNnhiZEtBTjQ3ZkVSK2xwY1Y4WTlmUFJFREVpcmpVTzkvS1p1QVQrNndV?=
 =?utf-8?B?ck9GUEdJTmwyWURYWHRQRi83bTF1cHQrVEJIT0JGbjc0RTJ2NnRrWlgxZXhs?=
 =?utf-8?B?cDE0WXVrU3hZRnhFQTkvRW50MHJxVktZc2lTcXJtUFM5WnVqSSs5dnRidzZF?=
 =?utf-8?Q?WJ7sTRQBHouJZpEe+96A7klRe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de480fa-3f99-4b68-a2a1-08ddb26a3e02
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:25:53.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TszwhX+sNKRYi4JM90qyH7ig1tL0mU8rLguG8ykPOTin29rfSeENlqDRsVXiHGMO0v9BqkuWkl77jqv+hfttsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640

On Mon, Jun 23, 2025 at 09:54:40AM +0200, Alexander Dahl wrote:
> The i.MX 8DualXLite/8SoloXLite has a different connectivity memory map
> than the generic i.MX8 has.  One conflicting resource is usb, where the
> imx8dxl has a second usb2 phy @5b110000, while the generic imx8 dtsi has
> one usb2 phy and one usb3 phy, and the usb3otg @5b110000.  When
> including both imx8dxl-ss-conn.dtsi and imx8-ss-conn.dtsi as done in
> imx8dxl.dtsi this leads to a duplicate unit-address warning.
>
> The usb3otg node was introduced after the initial imx8dxl support with
> commit a8bd7f155126 ("arm64: dts: imx8qxp: add cadence usb3 support")
> and since then leads to warnings like this (when built with W=2):
>
>       DTC     arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb
>     …/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)
>     …/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:52.23-81.4: Warning (unique_unit_address): /bus@5f000000/pcie@5f010000: duplicate unit-address (also used in node /bus@5f000000/pcie-ep@5f010000)

Remove pcie part, which is not related this patch.

>       also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:41.23-50.4
>       also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts:645.8-653.3
>
> After the change that usb related warning is gone:
>
>       DTC     arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb
>     …/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:52.23-81.4: Warning (unique_unit_address): /bus@5f000000/pcie@5f010000: duplicate unit-address (also used in node /bus@5f000000/pcie-ep@5f010000)
>       also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:41.23-50.4
>       also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts:645.8-653.3

Needn't show this log again. Just said

Delete usb3.0 related nodes at dxl to fix above warning.

Frank


>
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
>
> Notes:
>     v2:
>     - reworded commit message (build on mainline with W=2)
>     - rebased on v6.16-rc3
>
>     v1:
>     - Link: https://lore.kernel.org/linux-devicetree/20250610060756.8212-1-ada@thorsis.com/
>
>  arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> index 9b114bed084b..a66ba6d0a8c0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi
> @@ -5,6 +5,8 @@
>
>  /delete-node/ &enet1_lpcg;
>  /delete-node/ &fec2;
> +/delete-node/ &usbotg3;
> +/delete-node/ &usb3_phy;
>
>  / {
>  	conn_enet0_root_clk: clock-conn-enet0-root {
>
> base-commit: 86731a2a651e58953fc949573895f2fa6d456841
> --
> 2.39.5
>
