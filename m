Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0C71CA84;
	Mon, 12 May 2025 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747079327; cv=fail; b=Fjs0D8uQ9DryVofPZ80ObWC+d6CwAbkHNcAWsxbtiTH7Yhm6NZwB8zXpOiKXIlZhOg3j5zvbbNXnQo8skIMG4dT7z3NN6Bmnxx2LAgtMI3Sdg2KqOCOXT9xJk7m+jsG159bQMUXXBE/Gla0YxceAtWb2T7nFVp7NmhBhXwaz3wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747079327; c=relaxed/simple;
	bh=LB52cDEmWoRkfyNgYYTn0zi7+NLeOdVDeFytMtLQSAo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gv46VbNQwJg2DT/z3QtbIgSgPtmhNjdEFKcU8XMD4XKHFfhj2R2+cBTcV30g4hsFBXAgT40t9u8eXD/okfREmwca3HOLKXyzjGAQjTv7EmIeZ4ce+qcKhgInznscum3A1nZZuaTvQDtzJSbvDZL+BJSadYQWrWtKHvcgyP/grVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=GxbGko/h; arc=fail smtp.client-ip=40.107.21.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="GxbGko/h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NHfnCZSS69zeaUcEJNGU9NOdo7soUVchaj7CSCoO4ph+XdxlXSaHfHTIOM0JvN7hyANj6+jN7R3pZMELy8NzhBDfiGkjknBXyhaC6qlNwfaP6QheqdXOVvePZ0Wn9AKx0SqaUWj7w8C9nvaWP6Hu1IHC8Iayl+5UqBrgu+JtLU5R36UToIRSAQzhMEu17iyOKxzHyw2hMH+EMcRgaa4mW8TDhmL4q7u6gp+z84rHIuGuTZLXmsb/vf7e/taXr7ouReVnaIiKNP7Fw0FNGyqLCD4Fcca85d7ktMu7b3QmCOuHcmt8AKDef/iNEx1uihieH90MGyU7kPfnfKm0GjfkUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTjaBCpwLezl9uFBxmIQ2lC7exRFBtcRa0pQgJP5V68=;
 b=E7npSo2i/xUmN0fkA5Q7KLloIgu9oZn00XB5No+1juqQvLGdkv4eB68DMOn1KhbLc27MgTK4vsIWBNET9tAtXJJEVLIjSYdrVzQDHIxrLVz5FDnMyaQRS45df6Qpp9XHGczuHbEBUDiMgvuwN7acW0ewKO1LnQ4NqAGcOsbHBk/VGi1Ip+CsgkgInXHvZqVg/CsOOYt5ESjYJuZtDhuV6uogD71z7ekxMyifmEyhkONUGv1JYWnOTXHfE4p9C5DyrhoufsA01kpg8zVfiX3Zn2uDMpycM/rX2oR99HzxaeaPx5Ukd0mRtvkrA2VmPwRgNHEYSPKCsbKyskhIYnPmiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTjaBCpwLezl9uFBxmIQ2lC7exRFBtcRa0pQgJP5V68=;
 b=GxbGko/h1wBk82K7RMq0jMxX7uz+9lOvlI5NVN4AFxU+QZ0mszDO8dErIJ1qdIn+R5NSEs4n5k3+iFR0nOxKyfZKP/AJUMuPYYpAOcNo3i6XwbwfmQBkLnfNFNUUVJgkhSHTb+kME68x7yU93Qt/OW6DO822FkdpsRY0m2i+AWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA4PR04MB9637.eurprd04.prod.outlook.com (2603:10a6:102:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 19:48:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 19:48:39 +0000
Message-ID: <51b9884a-fcc5-4b95-9675-4e355398ddae@cherry.de>
Date: Mon, 12 May 2025 21:48:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: add px30-cobra base dtsi and
 board variants
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-5-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250508150955.1897702-5-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0138.eurprd07.prod.outlook.com
 (2603:10a6:802:16::25) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA4PR04MB9637:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8c916c-411c-4b33-fef2-08dd918dfd77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUNPWU1ONjFNZDB5NUdBRnVpQk9WbXdLV3V2MzMybDhmbU1VU1o2dHpnUzZX?=
 =?utf-8?B?VDZ6Wms3TncraVNwRmlKM01ZQTBqanoyZzJwT0YvZ2pQOFVMNyt6YjltYkZ6?=
 =?utf-8?B?eUs2S041SXkzU2VPNWRFWGxHNzd1QlQ3YWppbkNCT2FscjRJMGp1QmUwdExk?=
 =?utf-8?B?bEFjeDF3c0VRRW9XVFMrTTJGM3VBV1hXMm1NSkJXUEM2aTZhZ3U5RFlFcm9z?=
 =?utf-8?B?QlcySDExOTJ6N3pnU0owckpBZ211RFFWS3crREp5azU5SXoyelR1Q0lrWm1s?=
 =?utf-8?B?UVkxUjB0SVVKUjJxSFVsS3BPTVJtL2JFMkxVVXRBbGdsb21EU2tjVTJQSW1o?=
 =?utf-8?B?UFlYMmdQSS9GOStsMVJsVjlPK2hRT3VrU21FbVRxM243N0FxSncxZDg2cC9T?=
 =?utf-8?B?UHptdUN5YzFHVkZSeHp5MU1TK1llVlhGcFRqOW44SkMrY0U0UVZDNTgreDBX?=
 =?utf-8?B?dnVseS8wYXMyck02VUJ5ZGhjbmlmL0hORG1va3hVdHZNMDlqZFU2MWNlWmdR?=
 =?utf-8?B?eGlwTFFwUU82UWVCK08rektINU5lQW5XdkpOVE1QMWpTL1U2QzZhaWlRSHY2?=
 =?utf-8?B?NGVWTFM1b3oxSHlwQW9KSW5JcXpiTXpYc1RRQmVQWmFSNEVsdTZhbGJOS0U0?=
 =?utf-8?B?aVVMckMwc0ZZRHlnV3YvcGM4RjA0R2JUa2grYlZLK21yVjhhSFMrQ2pLWnFj?=
 =?utf-8?B?b2kzUGl1YU91UTJ4TFlteVRVSnVJUmUzT0lHWnRGOE1rcTYwMHRKZTZiU3Vi?=
 =?utf-8?B?dFFxbzkyczg1NE9ra1lMMVFNenVZR1cydm1LeC96RGN2a1BEaG9lOVdaRnVV?=
 =?utf-8?B?Q0pHbi9WN1p5WWM0QkplTUNFRkhPd2NjY1E0aFZmOE5OK0l2NGpNWDZ1YXo3?=
 =?utf-8?B?cWt6dEhQWUJMWVBTNUE0dFk2Z2JpS1lsc2QxaVpQaThBTXM5UFlHNmdTa1By?=
 =?utf-8?B?Tnhkb1FqQ0tSNjhuT1AvWHVWN1Nob1lIcFEyTHllYkx2QWxvbGJIbWk3ck44?=
 =?utf-8?B?Z1NML3BBRHJLN1czdnVpK0FnSTB6NDVla1pBUGh5aGoxWkNkZzU2UWFXZ1lS?=
 =?utf-8?B?dzJQWFd3WXR4NW1kNmtKWlBJRDF3QVpvSVNYL3dZNjIrVzRMYjhFa2NoMFBT?=
 =?utf-8?B?M3lwS0Y4NjlJM2FRdXNtajN4STdUeERMQ0VaTHlUc3UzNmdVTXp2NG9QbHZm?=
 =?utf-8?B?eWVYQ3J3cVphUEltK2Rod2dmS2hWSDZ3K1ZOZHVoYmc0Ni8yVFFoa21aeEN3?=
 =?utf-8?B?dm1RaWhtSEsxSVU5VTh3VGEyZHJnWXI5bWVNNXlFLyt3Qk4vaDVYYzZaQitL?=
 =?utf-8?B?SysxRnlqMHc5bVNUb1dKWjJnNndmVmd5OHBQSUExb0xXeVl5Vlh2cXF3bGxD?=
 =?utf-8?B?YTRLSkVxMDIxUDJIVk1rZ0xjaFpLN3pGa1NUazJ3M3JYYmY0Wi84UTNEOENl?=
 =?utf-8?B?ZElyRVpUSkhFV1hoUkhJeVhvTDdSbFAyU3UzWkNreTEvcUhsVVp4TlpLSHNT?=
 =?utf-8?B?YW1OTlp3bmNTOGZOMElOVHcxc1ZGZy9oM3FHVm01NlpNcUhXajk1bHQ4WW00?=
 =?utf-8?B?WGVrMjdZWkZwL1lXT1JRaHRqRE9nRFNzL1FoNVZYVjcyYnNqVHFwMnFEYng3?=
 =?utf-8?B?YkRQUTJ3L1puaG4wWW55TERPckVUQUxBTDVpclNZVVdqc1VEM2JKa05ZWmxs?=
 =?utf-8?B?aXZBbG5nV1cvNjFEN1RUMHFTRHdJa3drb1NpZy9pOWxZcXoySnNXNnM2SlNF?=
 =?utf-8?B?MURWdHRDNEVUbVNlbm53SW4vQ0llaWpPNHc5UjVOZ3lLeWFqSlJoTTJwTXJn?=
 =?utf-8?B?aElwNVlpOTliNitNVVRaemJUZ1JEWWo1aE04YWNlTXplRks3WVJHSUs3S3dH?=
 =?utf-8?B?aVliZ3VSdnc1MldZNHZFZm01TDBtQVh4SlFPVWh2OCtlMWFtbkhtU2VYcXR0?=
 =?utf-8?Q?2EYecBtPwUQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGlwYWxpbFU0MGRJMXN5T0RKVWs2bUVTUTUzV1lETnRqZDYwRks0bUl2TkVG?=
 =?utf-8?B?OU5DbjJlQVlHY0UrM1NsbFFwNWNpbmJHb1VPR2t4TVIvaTE3OWxKNS83RWlM?=
 =?utf-8?B?R0RjQXh0RUhicm9taUxQTEhIQVdScGVoVTI1WVJKOU1qNXREU21zNEhEMCsy?=
 =?utf-8?B?Mml6K1RHQ1pMQmhPbVpvVHNFQzRxR3dsYzVVWDcveDZ4K1g2UEE4Z3VxVTZC?=
 =?utf-8?B?YUdEWFZCc0VSdWlLVDRIOHpRMzRiWjBzb0UwNlBpK0lWRVhHVzRnK1hPR2dl?=
 =?utf-8?B?TDlQSmY2VC8rYnFNaUt1bjVOV3JJeXNLQXR1MWcrUzIwWG8xWm83UVJkNzBC?=
 =?utf-8?B?SWd6aytkRzQzNEZrVkFmeFFaSkJYN2R1R0NPeUVubXBLRTBGV1JXeDJyTGdo?=
 =?utf-8?B?bm5nUThuMlptbUlIL3M5QzR3UFB1Mm9ZZHVIa2pGYnVMZTFQd21URmg4ckN1?=
 =?utf-8?B?MlN5U1BQTUFXSUdMamtEM2w3djJxbXNLLzc4Y2VXMjAxMThxTHl2NUxnUXpD?=
 =?utf-8?B?aEJxTU5vbkhmUXhRYVArMkhHRUZxdmJhMWdkMlRLNy9sQlYydDZmVkZsM0FU?=
 =?utf-8?B?YTRkY1ZnMmVlSXpLUFc5SUpMOGNnVWptMTJnNUhYeDRtTVVVc1lDY2kvOTd4?=
 =?utf-8?B?ZkV1UnVodjh4OG5SekR3V3RPUDY5U3UvbU1EMDhoMlY2U0R2S2wzemhxUzVv?=
 =?utf-8?B?UW9iSk9rd0RObDlhcXVJTkVNMGhQc2FaSkEyd1R3S1VkYWEzZXhjRGRScUQr?=
 =?utf-8?B?ZGNQN08wWForQTI4NmRiR2tvaUE2WGRpbEZiZzVBY040cmFCaVcyN21MN1pS?=
 =?utf-8?B?b1VKRUhnQ1RqaUxQTnBSb29sbndoQzBwQVR5NXE0emphTEpwYVpZVzNXUHhN?=
 =?utf-8?B?TXNXRVlSVWxHeXVreDB2Sjk1eC9xbWE3YkYvWENwOElzSFJsbGJLekpRZnFB?=
 =?utf-8?B?N0k0cVNMc3UvTnRJd1lqOVp2ejBZdGVZY2NteEM1VkxuNnI4T2VIWFd3L3h1?=
 =?utf-8?B?dlp3bC83SUQwYWlTcXo1RHNjdWo4YUljaHgrQS8zeXg4VzNQeTZIaGdRUWRT?=
 =?utf-8?B?UXVZTDlCM3lheW4rUEdhbkdsc2JNKzl0eVc3cDhXTU0zNDhNeVFMR1FxZktw?=
 =?utf-8?B?TnhvN1VKenYrWlVNeGJVQkltL2JRU3QyTkF0TXJMa3ovZnpLcUpPb1hwREVx?=
 =?utf-8?B?VEkvQVpzUmJQSmxXSEkrc2VGR2lUYzJDOTBQRCtUQmlFaFFaN3NGeWZLY3Bo?=
 =?utf-8?B?MjNyZTJMd09lOTVqaHloNXdoR0doSnNVZXBXdHRjOUQzTEJ0Z3BtSE9SSVNs?=
 =?utf-8?B?S29uWmFXcXlwU1ozQ1FtRWM5YmtxNVUxaFpTR3M4cTlTdzloMmhOQ1ZYWFRw?=
 =?utf-8?B?OUN2OXpLMFNLWG9zaE5JOWNjQkZJNjErdFFDNmt5UU9zQ3ZsUk1UOEQxNDVL?=
 =?utf-8?B?RFg5NTlQU3lUMFJnenlNbkdDd3hGOFQ4Y1NML2R4anNrU1FBMSs1dkQxNmNx?=
 =?utf-8?B?bVp4OTFCSTRJcXhSVmRMT1ZLYVBYVzVjNHZyOGxEWGQraFVOcHBBeXpnb2Vr?=
 =?utf-8?B?cC9Rc0NYalBKZmFQMW8xNWp4Y2dyTWNzZmJETGszYSt1NXo4QmE3dnF2QVF3?=
 =?utf-8?B?WUtPbWRrMFBMNE5HdXR2dHkwSmZ2SmhxUklCRjRUcWtnMUVyNVdxNXoxckQw?=
 =?utf-8?B?NngxeXNkZjZ3dVFQTHUzUHNPUkwxcTkvVUUzcUs4VUd6anFUWUwzd29KK2Iy?=
 =?utf-8?B?SUUyaGpBQ2ZwOXkyK1ZUZm0yY2gwK1RTM1hIbzNkV2FvYjA5SUVMRUNtdmQ0?=
 =?utf-8?B?MlpVN0J0MTNsYkdHaUEzT1JuVzB3RnBHVU9oTjFKUGs2MHZMMTFXZmY3NnVB?=
 =?utf-8?B?RThReTQ5RXBVSWRTd2I5RitNVE9ydzIxTk1EbTdBc3VaeTNwZ1VvTk9wcC95?=
 =?utf-8?B?U29aVVZnRm1MM3hHQzB4elJlSnk1dElnVW1tdmFmOFBCN3BoRStEK2dxYzcv?=
 =?utf-8?B?MlgyWVJZamptY0tFUTRCMmZMcEVMdXBzNU1obHJneDFSMDNac0ZsSmtRNHUy?=
 =?utf-8?B?SDdxbjlXRklVUjIyb0p5TTVtQWVrdlNudUE5d2lkZ3JiSlYxZUFMSEpMYy9T?=
 =?utf-8?B?NXFsZUl4V2RhVTY5LzM5SDRFUVdYMU4zeTAvZ3dteG9NamNESWtRelQ3U05o?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8c916c-411c-4b33-fef2-08dd918dfd77
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 19:48:39.3400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkD1vlzjHtWjVYU7YmRkUFE0GIZVlEWWX9QWt+XrbhNzwkOKW5Js7ctVQnM3LUr4SD91jQTDT0nhoPfnVTaYoShGY8GhJWuBIKMfOYJbRts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9637

Hi Heiko,

On 5/8/25 5:09 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Cobra are Touchscreen devices built around the PX30 SoC using
> a variety of display options.
> 
> The devices feature an EMMC, network port, usb host + OTG ports and
> a 720x1280 display with a touchscreen.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   arch/arm64/boot/dts/rockchip/Makefile         |   4 +
>   .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
>   .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
>   .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
>   .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  58 ++
>   arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 570 ++++++++++++++++++
>   6 files changed, 749 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
>   create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
>   create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
>   create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
>   create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 3e8771ef69ba..8151e8bb1cd3 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -1,4 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-cobra-ltk050h3146w-a2.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-cobra-ltk050h3146w.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-cobra-ltk050h3148w.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-cobra-ltk500hd1829.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-evb.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-ctouch2.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += px30-engicam-px30-core-ctouch2-of10.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
> new file mode 100644
> index 000000000000..1d26164be7b8
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> + */
> +
> +/dts-v1/;
> +#include "px30-cobra.dtsi"
> +
> +/ {
> +	model = "Theobroma Systems Cobra with LTK050H3146W-A2 Display";
> +	compatible = "tsd,px30-cobra-ltk050h3146w-a2", "tsd,px30-cobra", "rockchip,px30";
> +};
> +
> +&dsi {
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "leadtek,ltk050h3146w-a2";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		iovcc-supply = <&vcc_1v8>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dsp_rst>;
> +		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
> +		vci-supply = <&vcc_2v8>;
> +
> +		port {
> +			mipi_in_panel: endpoint {
> +				remote-endpoint = <&mipi_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	mipi_out_panel: endpoint {
> +		remote-endpoint = <&mipi_in_panel>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
> new file mode 100644
> index 000000000000..82c6acdb4fae
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> + */
> +
> +/dts-v1/;
> +#include "px30-cobra.dtsi"
> +
> +/ {
> +	model = "Theobroma Systems Cobra with LTK050H3146W Display";
> +	compatible = "tsd,px30-cobra-ltk050h3146w", "tsd,px30-cobra", "rockchip,px30";
> +};
> +
> +&dsi {
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "leadtek,ltk050h3146w";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		iovcc-supply = <&vcc_1v8>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dsp_rst>;
> +		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
> +		vci-supply = <&vcc_2v8>;
> +
> +		port {
> +			mipi_in_panel: endpoint {
> +				remote-endpoint = <&mipi_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	mipi_out_panel: endpoint {
> +		remote-endpoint = <&mipi_in_panel>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
> new file mode 100644
> index 000000000000..94449132df38
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> + */
> +
> +/dts-v1/;
> +#include "px30-cobra.dtsi"
> +
> +/ {
> +	model = "Theobroma Systems Cobra with ltk050h3148w Display";
> +	compatible = "tsd,px30-cobra-ltk050h3148w", "tsd,px30-cobra", "rockchip,px30";
> +};
> +
> +&dsi {
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "leadtek,ltk050h3148w";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		iovcc-supply = <&vcc_1v8>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dsp_rst>;
> +		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
> +		vci-supply = <&vcc_2v8>;
> +
> +		port {
> +			mipi_in_panel: endpoint {
> +				remote-endpoint = <&mipi_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	mipi_out_panel: endpoint {
> +		remote-endpoint = <&mipi_in_panel>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
> new file mode 100644
> index 000000000000..418b4b4daaa3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> + */
> +
> +/dts-v1/;
> +#include "px30-cobra.dtsi"
> +
> +/ {
> +	model = "Theobroma Systems Cobra prototype with LTK500HD1829 Display";
> +	compatible = "tsd,px30-cobra-ltk500hd1829", "tsd,px30-cobra", "rockchip,px30";
> +
> +	aliases {
> +		mmc1 = &sdmmc;
> +	};
> +};
> +
> +&dsi {
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "leadtek,ltk500hd1829";
> +		reg = <0>;
> +		backlight = <&backlight>;
> +		iovcc-supply = <&vcc_1v8>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dsp_rst>;
> +		reset-gpios = <&gpio0 RK_PB2 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&vcc_2v8>;
> +
> +		port {
> +			mipi_in_panel: endpoint {
> +				remote-endpoint = <&mipi_out_panel>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	mipi_out_panel: endpoint {
> +		remote-endpoint = <&mipi_in_panel>;
> +	};
> +};
> +
> +&sdmmc {
> +	bus-width = <4>;
> +	broken-cd;
> +	cap-sd-highspeed;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vccio_sd>;
> +	vqmmc-supply = <&vccio_sd>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
> new file mode 100644
> index 000000000000..92066cbc1a70
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
> @@ -0,0 +1,570 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include "px30.dtsi"
> +
> +/ {
> +	aliases {
> +		mmc0 = &emmc;

ethernet0 = &gmac;

maybe?

> +	};
> +
> +	chosen {
> +		stdout-path = "serial5:115200n8";
> +	};
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		power-supply = <&vcc5v0_sys>;
> +		pwms = <&pwm0 0 25000 0>;
> +	};
> +
> +	beeper {
> +		compatible = "pwm-beeper";
> +		pwms = <&pwm1 0 1000 0>;
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible = "mmc-pwrseq-emmc";
> +		pinctrl-0 = <&emmc_reset>;
> +		pinctrl-names = "default";
> +		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_BLUE>;
> +			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;

Missing pinctrl here. (which we probably need in gpio-leds actually?)

Can you add a comment that is supposed to be LED14 on the PCB? I'll 
check in the next few days but it's possible it's not always placed so a 
comment stating that would be nice too :) Please remind me if I don't 
tell you in the next few days.

> +			label = "heartbeat";
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +
> +	pwm-leds {
> +		compatible = "pwm-leds";
> +
> +		ring_red: led-0 {
> +			color = <LED_COLOR_ID_RED>;
> +			default-state = "off";
> +			label = "ring_red";
> +			pwms = <&pwm5 0 1000000 0>;
> +			max-brightness = <255>;
> +		};
> +
> +		ring_green: led-1 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			default-state = "off";
> +			label = "ring_green";
> +			pwms = <&pwm6 0 1000000 0>;
> +			max-brightness = <255>;
> +		};
> +
> +		ring_blue: led-2 {
> +			color = <LED_COLOR_ID_BLUE>;
> +			default-state = "off";
> +			label = "ring_blue";
> +			pwms = <&pwm7 0 1000000 0>;
> +			max-brightness = <255>;
> +		};
> +	};
> +
> +	/* also named 5V_Q7 in schematics */
> +	vcc5v0_sys: regulator-vccsys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&display_subsystem {
> +	status = "okay";
> +};
> +
> +&dsi_dphy {
> +	status = "okay";
> +};
> +
> +&emmc {
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	/*
> +	 * For hs200 support, U-Boot would have to set the RK809 DCDC4
> +	 * rail to 1.8V from the default of 3.0V. It doesn't do that on
> +	 * devices out in the field, so disable hs200.
> +	 * mmc-hs200-1_8v;
> +	 */
> +	mmc-pwrseq = <&emmc_pwrseq>;
> +	non-removable;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vcc_emmc>;
> +	status = "okay";
> +};
> +
> +&gmac {
> +	clock_in_out = "output";
> +	phy-handle = <&dp83825>;
> +	phy-supply = <&vcc_3v3>;
> +	status = "okay";
> +};
> +
> +&gpu {
> +	mali-supply = <&vdd_log>;
> +	status = "okay";
> +};
> +
> +/* I2C0 = PMIC, STUSB4500, RTC */
> +&i2c0 {
> +	status = "okay";
> +
> +	rk809: pmic@20 {
> +		compatible = "rockchip,rk809";
> +		reg = <0x20>;
> +		#clock-cells = <0>;
> +		clock-output-names = "xin32k";
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;

Can you use RK_PA7 here instead of 7?

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int>;
> +		wakeup-source;
> +		rockchip,system-power-controller;
> +
> +		vcc1-supply = <&vcc5v0_sys>;
> +		vcc2-supply = <&vcc5v0_sys>;
> +		vcc3-supply = <&vcc5v0_sys>;
> +		vcc4-supply = <&vcc5v0_sys>;
> +		vcc5-supply = <&vcc_3v3>;
> +		vcc6-supply = <&vcc_3v3>;
> +		vcc7-supply = <&vcc_3v3>;
> +		vcc9-supply = <&vcc5v0_sys>;
> +
> +		regulators {
> +			vdd_log: DCDC_REG1 {
> +				regulator-name = "vdd_log";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <950000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <6001>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <950000>;
> +				};
> +			};
> +
> +			vdd_arm: DCDC_REG2 {
> +				regulator-name = "vdd_arm";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <950000>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-ramp-delay = <6001>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <950000>;
> +				};
> +			};
> +
> +			vcc_ddr: DCDC_REG3 {
> +				regulator-name = "vcc_ddr";
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_3v3: DCDC_REG5 {
> +				regulator-name = "vcc_3v3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_3v0_1v8: vcc_emmc: DCDC_REG4 {
> +				regulator-name = "vcc_3v0_1v8";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3000000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3000000>;
> +				};
> +			};
> +

Please have DCDC_REG4 before DCDC_REG5?

> +			vcc_1v8: LDO_REG2 {
> +				regulator-name = "vcc_1v8";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vcc_1v0: LDO_REG3 {
> +				regulator-name = "vcc_1v0";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1000000>;
> +				};
> +			};
> +
> +			vcc_2v8: LDO_REG4 {
> +				regulator-name = "vcc_2v8";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <2800000>;
> +				};
> +			};
> +
> +			/*
> +			 * vccio_sd also supplies the vmmc supply, so needs
> +			 * to stay single voltage.
> +			 */

Please check on your prototype's schematics but this is routed to VCCIO2 
IO domain only (which isn't used for anything), so I would say this is 
not a relevant comment anymore?

> +			vccio_sd: LDO_REG5 {
> +				regulator-name = "vccio_sd";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3000000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3000000>;
> +				};
> +			};
> +
> +			/* vcc_sdio also supplies the pull-up resistors for i2c1 */
> +			vcc_sdio: LDO_REG6 {
> +				regulator-name = "vcc_sdio";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3000000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_lcd: LDO_REG7 {
> +				regulator-name = "vcc_lcd";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <1000000>;
> +				};
> +			};
> +
> +			vcc_1v8_lcd: LDO_REG8 {
> +				regulator-name = "vcc_1v8_lcd";

Technically called 1v8_lcd, but can stay like this :)

> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vcca_1v8: LDO_REG9 {
> +				regulator-name = "vcca_1v8";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency = <100000>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	clock-frequency = <100000>;
> +	i2c-scl-falling-time-ns = <50>;
> +	i2c-scl-rising-time-ns = <300>;
> +	status = "okay";
> +
> +	touchscreen@14 {
> +		compatible = "goodix,gt911";
> +		reg = <0x14>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PA1 IRQ_TYPE_LEVEL_LOW>;
> +		irq-gpios = <&gpio0 RK_PA1 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tch_int &tch_rst>;
> +		reset-gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_HIGH>;
> +		touchscreen-inverted-x;
> +		AVDD28-supply = <&vcc_2v8>;
> +		VDDIO-supply = <&vcc_3v3>;

I couldn't find at a glance whether the alphanum order required for DTs 
is case sensitive? But considering we ignore # before properties when 
doing alphanum order, I guess it's case insensitive too?

> +	};
> +};
> +
> +/*
> + * Enable pull-ups to prevent floating pins when the touch
> + * panel is not connected.
> + */
> +&i2c2_xfer {
> +	rockchip,pins =
> +		<2 RK_PB7 2 &pcfg_pull_up>,
> +		<2 RK_PC0 2 &pcfg_pull_up>;
> +};
> +
> +&io_domains {
> +	vccio1-supply = <&vcc_sdio>;
> +	vccio2-supply = <&vccio_sd>;
> +	vccio3-supply = <&vcc_3v3>;
> +	vccio4-supply = <&vcc_3v3>;
> +	vccio5-supply = <&vcc_1v8>;
> +	vccio6-supply = <&vcc_emmc>;
> +	status = "okay";
> +};
> +
> +&mdio {
> +	dp83825: ethernet-phy@0 {> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&phy_rst>;
> +		reset-assert-us = <50000>;
> +		reset-deassert-us = <50000>;
> +		reset-gpios = <&gpio2 RK_PB6 GPIO_ACTIVE_LOW>;

Seems like we have an interrupt pin here as well with PWRDOWN pin? 
Though it seems it could also be used as a power down bit (driving low 
when entering low power mode). Not sure what's desired here for the 
product, so I guess we are fine. The datasheet says it's open-drain with 
an internal pull-up of 9.5kOhm and the default for GPIO2_B4 seems to be 
pull-down, but likely weaker than the 9.5kOhm otherwise Ethernet would 
simply not work :)

> +	};
> +};
> +
> +&pinctrl {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&cobra_pin_hog>;
> +
> +	hog {
> +		cobra_pin_hog: cobra_pin_hog {

No underscores in node names.

> +			rockchip,pins =
> +				/* STUSB4500 open drain outout POWER_OK2, needs pull-up */
> +				<3 RK_PB1 RK_FUNC_GPIO &pcfg_pull_up>,
> +				/* STUSB4500 open drain outout POWER_OK3, needs pull-up */
> +				<3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>,

Interesting... Those aren't routed on my schematics, will need to check 
earlier versions/variants.

> +				/* The default pull-down can keep the IC in reset. */
> +				<3 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>,
> +				/* USB-A 5V enable */
> +				<3 RK_PC0 RK_FUNC_GPIO &pcfg_output_high>,
> +				/* USB-A data enable */
> +				<3 RK_PD3 RK_FUNC_GPIO &pcfg_output_high>,
> +				/* USB_HUB1_RESET */
> +				<0 RK_PB4 RK_FUNC_GPIO &pcfg_output_high>,
> +				/* USB_HUB2_RESET */
> +				<0 RK_PA4 RK_FUNC_GPIO &pcfg_output_high>;

Uuuuuh it's GPIO0_A5 for me, can you triple check on your schematics?

Would be nice if you could order them all by gpio bank + number?

> +		};
> +	};
> +
> +	emmc {
> +		emmc_reset: emmc-reset {
> +			rockchip,pins =
> +				<1 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;

Will need to check the JEDEC standard, it's directly routed to the eMMC 
chip so maybe we need a PU/PD.

> +		};
> +	};
> +
> +	ethernet {
> +		phy_rst: phy-rst {
> +			rockchip,pins =
> +				<2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	panel {
> +		tch_int: tch-int {
> +			rockchip,pins =
> +				<0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		tch_rst: tch-rst {
> +			rockchip,pins =
> +				<0 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		dsp_rst: dsp-rst {
> +			rockchip,pins =
> +				<0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};

I know for the touch controller no PU/PD is required, but I'm not too 
sure about the display controller, and since it's directly routed... 
Maybe we should have something there? Need to check with HW department :)

> +	};
> +
> +	pmic {
> +		pmic_int: pmic-int {
> +			rockchip,pins =
> +				<0 RK_PA7 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +
> +		soc_slppin_pin: soc-slppin {
> +			rockchip,pins =
> +				<0 RK_PA4 RK_FUNC_GPIO &pcfg_output_low>;
> +		};
> +
> +		soc_slppin_slp: soc-slppin-slp {
> +			rockchip,pins =
> +				<0 RK_PA4 1 &pcfg_pull_none>;
> +		};
> +
> +		soc_slppin_rst: soc-slppin-rst {
> +			rockchip,pins =
> +				<0 RK_PA4 2 &pcfg_pull_none>;
> +		};

All soc_slppin* pinmux don't seem to be used, maybe remove them then?

Cheers,
Quentin
