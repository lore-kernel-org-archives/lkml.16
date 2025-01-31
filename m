Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2081.outbound.protection.outlook.com [40.107.241.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761BB1AAC4;
	Fri, 31 Jan 2025 16:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339353; cv=fail; b=gSf7HamgiAiCjy7/OMsPKpxk08ToyzwCTuruS1+by9UqGPlitExhOVmpgRmTp8LqHlFspGesQA14vv6xuToepOCmT2PbgZbavFuDS/fTwtouQZSHoPQURSfkbrTenkNplvb9d8QckNyuVe4YvxTVbck8B+WL9/pLK+h7kiVXL/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339353; c=relaxed/simple;
	bh=srAYjQp2hVmkyKHJfKKFeLElUb1vfVpFyRv2iIYpfNI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U0fe8QswcdQOCHc/GXhhmMZL2cIbGAEMHzPx5O3nnoC+nH7ogocCSZZbKSARzYMFqnVjK9Np+gtTNadKC3PLC+GzK/rpPWHfbIlEEkOZLmAN3pt7Pl6qB57UHAb6+aTSDkt0yBAqeIh3iLxV/edJycmPQiZyn4sahJTkFxjxrzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=MTWs+Y/x; arc=fail smtp.client-ip=40.107.241.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="MTWs+Y/x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvHYhzfQffyIFJ8Ol82Fddg3OsZfiO5u/nREoNdThBM/or+MrhaR2bgorX0+lXQjCzxE8quJMFtON5PeqF3cV1HGEQtEeKZv1nGO+h9RVwtOvVveGQg//2jhpqUJyMoykCIDLDQ3BbTD+1IhlV5RGnqwo9TOGwTl92ROdO1ZztgMrBAIxvbDJJgigauAiNISO+MJFZEEVpHAao9EaOsGLfKav6GDZQn+urqhX3in/YihLMZB3bgZG3ObTPEUv68dl9ahAFOmHSVM6ZX3T0An/YCiDpIXoJvFn2uaTeWU3C3sozPDHtwFID3x0GO1lfKeNm6QkmaXGCut9rvxtcaKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73bDCSMDShfGI4fqn1G07bxp+d4a8Cz5WaXPwsVIZu4=;
 b=MYoHltWf6WKyiP1sAFvpU9KLk49VStEbL37AwNCTiE+2joeE3uVfz/0SESOZL8wkMRTjo+vrI/sCq+KrxCDw2TD+nJJu3SMcsZQSefkqSOLDrQnirdw9lSZcyAwCg1LNNe39QJZZJO+QI3bSN99SXZyfeGHirRJnmvKOJHN6pgZV31IGrjLm/mtMh/FVfnQrZvgCRY0zyn1TGTMTPBwg+MLtsBael3AcGe19NF97CErrQbkwg20kRan/f8VtCiUomImEk86iwNEsyqbrG6Lx/q/bQQWJaNb/n8TRJCr0dcUK7w2jJSIZTZqu1X6Klg+3430b2NavG3Cv9sugtLHvlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73bDCSMDShfGI4fqn1G07bxp+d4a8Cz5WaXPwsVIZu4=;
 b=MTWs+Y/xflZKlDi+UO/MAvReHNAQuPTMf8kGVojiiaEiOpb6/yb/YJ3vdKJ9zGKfB/h58BOR7DTZABPqfSSHML6vECBWG1FQP5f7Ki23q0lpdaybh+yVS8YTO4cOZUurqeIuqzmjbuZIy1mxBCQcWJTon0sq8ZX+NEycOFJOQVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB9000.eurprd04.prod.outlook.com (2603:10a6:10:2e3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 16:02:26 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 16:02:26 +0000
Message-ID: <63cda072-3671-42c9-9650-7a3ece39dec6@cherry.de>
Date: Fri, 31 Jan 2025 17:02:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] MIPI DSI phy for rk3588
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org, kishon@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sebastian.reichel@collabora.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dse@thaumatec.com
References: <20241203164934.1500616-1-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241203164934.1500616-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0193.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB9000:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd460c6-2754-43d1-4237-08dd4210a7c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2Ywd0ZqOFZaMW9uYzc5SGlOWllkSDN3K2xIRHJjdnRBdk1USGMyK3dXdFgy?=
 =?utf-8?B?YjlWbGhTendjb0lUTncxMFNHVlBvRlZJM2ZtQzE4OHo2UHFSdWFMR0Qwck8z?=
 =?utf-8?B?NzFkK1prTTA2SVFRYTZVM293MllnTzJOZzdZQjdTMnpJRDhPcXh2TWIxa3g4?=
 =?utf-8?B?aEdzbHNTYkdzQXRGcGZZdndHd2N2WUFLbTBhTU5NOEoyQy8wa0NMTTBHbWlM?=
 =?utf-8?B?cEN1bU1laEZwSEYrRGhUd0VXK1VISmE2NFVCbm1XbFpLdmsrd0sxWjlFY1pM?=
 =?utf-8?B?L09FQldHdzRzclFTQStiU0ZiMXV5WkJwaisvd3Z0ckcxdy9ucWpKS0l1eEpH?=
 =?utf-8?B?WStjZDhRdEluV2R1QUloRUo4VkFvUDMrN0IxcXVnS0ZvSTNSeUdZcXhIb0lE?=
 =?utf-8?B?dGFtZXhuT2huVW9RQUtyS3RBV2dnWWljeTduOU1tSDVLaHh2bkE1OEZHVkh5?=
 =?utf-8?B?aFFEWFpJRjhLN1Bpa1ZnelJRTE1rSHJrZHpQdlErVmxQTHdYVWZscU8xTU5E?=
 =?utf-8?B?TUtwQ3FsTGlDT2IwdVNJOVloQmtZSUZUYWE5ZVJxa2pOd3RySGZjaXA2bVJm?=
 =?utf-8?B?MjA5NDcreGJVMVEyYXU0aGljdlhDN1VaajdXSUthSFNHSXNaQnA0TFFIeC9M?=
 =?utf-8?B?Qjk1SDJ6aG1BczZWQStUN2VhMnIxUFpGeGl1czdiS20yOCtvS0VoV1JxNk5G?=
 =?utf-8?B?d01oRWJ2NnhINkpoQXM1WDF4VjBqenNjNlliQTdkSEdUYjFHTGhIdWpFeEx4?=
 =?utf-8?B?TU9FTnI3dldVQmVsWFZ0M2NFemFnREZWVU0yWkxsNTM5UEpzVkJnYTlZelYr?=
 =?utf-8?B?ZW4rc2grZlpNTE9kWmgzSjVWeHg3bTJjQ3pyU3RQWHowL3dzenZmdTcxRVYr?=
 =?utf-8?B?UFI1MFFWdytmdnpPOGN0R3E0ZnhsbU8wcmlYQkFqYjlzQkFmOWFtMU5nejQr?=
 =?utf-8?B?aVl3WTdKNklMelZiM3dtd3RJYVR6dGJONUpSZjR3ZUZNQ3k3WUx2Ym5sUU1U?=
 =?utf-8?B?bm9Hd1czakZVVEpvTTJSTEZUWGZ5QzBhMWpIb2R6dEtvSzM5TFBlaEgycGFs?=
 =?utf-8?B?YWFreUhVcU1tcHFXYjZRUUpESzJvMHVPUHEvODYzcnVMRDFFYTZPdUJSa3V2?=
 =?utf-8?B?aVh6bTVqZ3lhOTg2eS9RNW5WZHVBRHorRXViUE9ZQndBTm5xejhJcTg4NWh4?=
 =?utf-8?B?dFJ2QW5yWFEzTGJUZW41dUZVVVlDV1Rtano3eXpFRkFDcS9EWWoveDJWVXpx?=
 =?utf-8?B?b1BhTjBKOGxOWUswWENQd0s1R0pENkFEbVdyeXFhdVJnMkdiUnVodzZuRTUr?=
 =?utf-8?B?MWJDWVZvbnhVQVVFdUNxV2x2WXJFYWVLTEJwTTBGeStSZkVJaU53bVdUY3Zw?=
 =?utf-8?B?SURSM2VIQnFwWlRsY1lxVHUvekZmZ1lnQlYyeEo5Y0l4eDhrOTAxeDdGQmtx?=
 =?utf-8?B?SlBGL2JIWHhMZy9OckVFM1lYejBUMlkzUDIySUpmdkdnekRJbjJUMXdoUW5t?=
 =?utf-8?B?OTFJTU54OXdnbmNvY3ZnV1VjZzl1aTBiRVFXREx6RjhNNzZCV1k3SDF5d25v?=
 =?utf-8?B?VzlLZHVCdWVqckpqSzRxcUxoVWZPZk5aMXR0eDR2SW5Bd2RGRGlic0gxN1Vz?=
 =?utf-8?B?VXFmemFsbERhb1U1QXNiS1JKSW9kZXNMcVZlYUNKWGEvWjJFQmtXNzRYY2dv?=
 =?utf-8?B?RS9acnJCMHBLQVVqYS9FdEloaHRMWlVoWkhod04vYkt3YTdHZFFqSDA3S3BF?=
 =?utf-8?B?c2xGYW5ncC9SWmZBbzN1NGZKUFVSTWJ5K3RlL05hWGo1OWlHK09YNlQ1Qk9T?=
 =?utf-8?B?TER3WWdJOVZMSlVURlZWSGJyMFpsQVNrU1ZPcnEralM1VnBsRG1GYVBldWpj?=
 =?utf-8?Q?Sf4nqIPxYqx7l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STd2YTBCMEUzcnk3Rit3VWdCY1VXQ0NJSysrNXlWZmtYckFRTkEwSEIrWk95?=
 =?utf-8?B?K05qR1paVElWZUVGNUgzV1VOVVRneWovRWE4d1dYT3VFVjlEMjBOcUQ3SFRu?=
 =?utf-8?B?d01sMnBCUElFdGhsbi9KVTBuMnlyd3A0dTRlMTNtQVZ1U0E1K1FpMEhBcFpP?=
 =?utf-8?B?a3pDVnFsQ3pOWGpPRVp5Vmh2U3Z5N25aSU14NTUxd29GS0dYUkJWZUxPZ0tV?=
 =?utf-8?B?TTEwSTkzZVdTcllYUzZNMXZJL1cwdVBCQTJrWmlramprWG14LzQ3enlhTGxn?=
 =?utf-8?B?d21yNjE4Zjd4OFVHVURXVk1Hdyt4QWx5TDY3QjE4QnJPT05RdVFJSk85dVBs?=
 =?utf-8?B?VXNSRjJLS2FWa1VERE8vRzAvak5UcDNJYWF5N3ROeUtqYWVacldVMzRyWnFL?=
 =?utf-8?B?eG9YRHVKb1VpNVlRbEFWWDBsK21TTHM4YllrZll5Sm9qQ0lpMUc3WUE2Smpl?=
 =?utf-8?B?RFN5VktWZWptNHA0ZVhwZUZ3QzBCeGtJZUZHejVjL3dQV0NKRWRlUUVGSkln?=
 =?utf-8?B?aEZNQ0cvakN2b2hlOUtrbmhIcG5XNlFqQ0VNdktoeW9KaUFxUVZBRDQyUkxG?=
 =?utf-8?B?MEpTRm5hN1NMa1pITE9OSWIwMFhmVStZbWxNOE9qV2F2OEVhVlhkTENoeFdj?=
 =?utf-8?B?S1lVcUlTem9yM1l0ajlpd1lLbmR2c2ZPTFU2am4vRDZ3b2FCamRKQTVSNFJM?=
 =?utf-8?B?cGkrR1NrNHhTSk1wdXdrVDl5TFYvd21aUGRDQkVXS3lXUjBDZkE5UHRzT1lB?=
 =?utf-8?B?SW80RFJXaE5QZkp5M0dEYStybjhuZDVwVUpwU1ZjVGVXL1pKWUg5UEhBMXhB?=
 =?utf-8?B?L1VUVlZFWEdoVm1oVWpLRzB1Ly9YYVdOTGZQU3M0SEJBaklrSFNRdkZRZ3FZ?=
 =?utf-8?B?S3BPYXJyVDduVEtqTFZrSXppNTdUUC9peDhWZnlHYWpEdUJQWWMvSW5hbEhl?=
 =?utf-8?B?NGdDTnhpOVV3RWMwbjZpaVJDQ2NjSUlFVGxhWHVTeEdnN216KzgraUMyZ1I3?=
 =?utf-8?B?Vk9sN3Z4aGhwU0xkdGxhY0IxZzk4REkvUDNVd2x1MllZeG41dVQrNDZjZjNp?=
 =?utf-8?B?YUtlVEIramJuQU5nTGN3TzdhbW1vVlk4dmVFdjIrREVpWSs4b2dwSEh3OUpj?=
 =?utf-8?B?NUFIVHEyckFET3BIajZ5dHNaVkJEM1hpaVBSMmNXTmoyNFdJL0Z2K1FlWXJj?=
 =?utf-8?B?VTNNdEJmeDZDNDhHWnpUa2ZpK2RJV09XSmVXQXV6dEJLdFQzdWhZOVpvOGRI?=
 =?utf-8?B?RG1aRG1GR3kzbDJhbk5HYzBtdnp3KzMyR1UwdlYvaTBBMVg5MDMySVI0ajJv?=
 =?utf-8?B?R2QzcDNlM0l4S0hpeWc0cGd0RHM5TmR1VVc4Y01QdUlxYUd0a2FRYWxZaytL?=
 =?utf-8?B?UmU2blVyMGsvczE0eXllRjlWVjczaGViRzVlOFgwWHcySkttOE0zUEZ5K0Fm?=
 =?utf-8?B?Sys5bkUvRlRwcUVHdWgxUHdGb2N3SUVNSVR3a1pObHdGa2xsMmhzR0o1Vm45?=
 =?utf-8?B?K2tWODVLUHFGaXFoSXZnZ0hFRHZyNzhyLzJJTmw3WEJOaXJvdVBlQTNPUm1q?=
 =?utf-8?B?eHpPaWxZMitwREU1aFRONTNQTFhSWGtYNGVPbk5haDNkWGZzbkVDcmhPSUUy?=
 =?utf-8?B?aWhjdGVxbXl4bXJNOGNZNUVsQWZXeTNwb294aDExT2p1SWZvQk5FdWdRRzFl?=
 =?utf-8?B?VjVGWjhLTzRXWDhBQ0ZaQ3B0S0pUV1NKYzA2aWpiOEhZMmdRTVBQc1dmamZK?=
 =?utf-8?B?a29zcFZ5dHc0SGEzb0FJZkxuYldBaHZla3ZiYnVZeWJ3WVdwNkcwaTJRZTk3?=
 =?utf-8?B?RHYyYldJRktTU3ROcGM2Z2VlbkFDY2VYNk9GM0J2ZlVXMnBQRmJ4OWxSbE1y?=
 =?utf-8?B?SEJmY3diNHE5cHN5YUwvdUR6UGhRQ2ZYaUNvbW5xK3o2bDdCenNJc21UNjd2?=
 =?utf-8?B?K3Q4WlZHZVBTcFZzY29nT1RxK09oYlR6MW9HNzB3L0hJaURndGxESkpCdGE4?=
 =?utf-8?B?RVhvOVFDaC9NQVJEclFLeUQ0dEdmaDR1L0NGMFhIYVIyTVFvMTJhcVNuUFVQ?=
 =?utf-8?B?SjlsU2RNQXM5Y0lodDF1RDNhMEVmZFdpaUU4SFRZUE9ERjlUY3ZMdElKbUR3?=
 =?utf-8?B?TGVDYjlDWW1BSU5rZW1FOUtlTjB0aWYwL1FWWWI5Z2Q0L2tTd2xzMVVObjZL?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd460c6-2754-43d1-4237-08dd4210a7c2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:02:25.9828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPlidtXf0wgNlsHpgRpIGfUlE+jKlUfd94rQFHD7spzA/elD1s2Z0QwA9voxpC9bxItjEnC7IZl2LXYC2mj6m5tSSdXNkElW/4hEdPD6NlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9000

Hi Heiko,

On 12/3/24 5:49 PM, Heiko Stuebner wrote:
> This adds the phy driver need for DSI output on rk3588.
> 
> The phy itself is used for both DSI output and CSI input, though the
> CSI part for the whole chain needs a lot more work, so is left out for
> now and only the DSI part implemented.
> 
> This allows the rk3588 with its current VOP support to drive a DSI display
> using the DSI2 controller driver I'll submit in a next step.
> 
> Only generic phy interfaces are used, so the DSI part is pretty straight
> forward.
> 

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger with 
Haikou Video Demo

I assume this is the same setup you tested this series with, but 
confirmation doesn't hurt.

Tested with 
https://lore.kernel.org/linux-rockchip/20241127143719.660658-4-heiko@sntech.de/ 
applied on top.

Thanks!
Quentin
