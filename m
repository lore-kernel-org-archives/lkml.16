Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2088.outbound.protection.outlook.com [40.107.247.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6010F4315E;
	Mon, 12 May 2025 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074622; cv=fail; b=rOoUTLNw8jSo72VOD3BhGI5EXj6SgzorOM+FtXnVHDmezW59GYD/CQie/6E54DIPZWfgfnfNMl0Mwp7aVzoqzBFL0ccXKXyq3+g2V0AjH4TRX4gwk7JMCEnrSZMyrctHwn2i6sxozY8Ns4ZhxrM1IFMgrtiWzihxLDC0z7LSDEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074622; c=relaxed/simple;
	bh=5/5z17QPnYRZuw64HJhkXYm9HQ/ofnGcALCskH4gips=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pqniWg1TKS7VHbiPaqvIPYxBENOoETLi1gb0LpSzqQQE7RPzZLVsMVqEqfv0JdLDi9bUwGqRB2exbzjc88EDIKuV24p6FRnEpnp3B3BdC4BbexQcjcRtyJRq+0e0I5DBO7hzt/aF78EY2ZjzSUogMTx+6wD6AvQ8/ebCiFrq+lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=D7ge26ne; arc=fail smtp.client-ip=40.107.247.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="D7ge26ne"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaWE+jyaJMftCrmpTfgoAzsGhQma+uDNjLqcKwoua7FYguH9/EHqCRNENxB+eFZsauXYTPoN8XxojLBWptdUFaisPP7H9VX1tejrtxtZVG3pyeLqJBmeC0/kjOGWNyKgv7rHDbLb3ah83vbPbrYclompwq/FbJi8iwsI6G5xQ9vZ4FIFJ1Aa8iT63HYPg+qx0ubDEOEK66/3dEZ0N3m4q3RN9Q+5DR1mljXezEMDzSXkiHwFrXL3AM7ecEKdBvzC4DB6qETZWocZUjGIV0xUIe+pBc6CIVMD7ulBJKTt1eRgzEncq84x7IB3RN9UAygUdZQRlLV7gTWiZuNKGXBZ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ43Mp6wQ3aSoMPaJBIsiNftQHIvZaND5UcfQwG8Rn0=;
 b=NbtXIROTp3foCuzqLup2LPkYEcFoRpNMZesQe6mZW3llhOkd5/Fw1WwB0kqBD85lmavv/zI15th/k/zcDA8KpTlsOkJHa6Ri13G6Y74clmsj+vRI41q/HPr9ovlQTQBGdsRAylrlwRAbSeGjiAlr8hPyJmpxcZDM90rQdhS7PYKYxJicPWPwMijA0JHqDi+mxoJQ/mTX6VPz3QeScGQ5kLvEuVK9qhRva4L6gjkMVZeDA469//MsSSaJgIfm8ABLbEg9Fz4Q3660SVvk6DorJiAw06mACisweRSVEx/COzyTXluvPecbGxYdJrkCQVVV9zXuC2iPZvcNsncGHks+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJ43Mp6wQ3aSoMPaJBIsiNftQHIvZaND5UcfQwG8Rn0=;
 b=D7ge26neaphH1IQDURriKq8cJ3i8RiZ2cgU1Rn6+veZI3mXxpOPrueH88B4Y1BriRksIk69wF0RBaFhhq1/eV4KUdejSyqgl75nv5Wm8nCslhxo3gc26CylXLXvEO4NJ5c5CK8hStgCI0jokt21MoEIBE4nYy++p4nC/K1pQnFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10545.eurprd04.prod.outlook.com (2603:10a6:800:270::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 18:30:15 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 18:30:14 +0000
Message-ID: <a23bbc22-6bfd-46e0-b114-fc14ee66e74a@cherry.de>
Date: Mon, 12 May 2025 20:30:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] arm64: dts: rockchip: move reset to dedicated eth-phy
 node on ringneck
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250508150955.1897702-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0131.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10545:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c64d0f8-3387-4e94-73f7-08dd918308e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1ZJNzROMXdJNUZhYnhXSnJYY3NXZlptR2drUWkwMlozaVlvY0lRcmkvYnhm?=
 =?utf-8?B?VEFVd2dTRkhtZURzaEY2V0wzajgrYjhvSFNZa3BySkRzdXBkcys0N01jU1pV?=
 =?utf-8?B?aTFXVExwWG5HOHFnUFBvNktXS294WGo1NEYwN0ZCVkdsTVZ2YW5VQzlSK3VF?=
 =?utf-8?B?VVpIRmRLUEEwemhadUVwNDd0WHk4VXd5ck5hNCtLbnZzS29yWDhIWFUzMDlD?=
 =?utf-8?B?a0Y3NHFKcnlDMHEvU1RWcmVwVFBYMHpsVVZEQU82L1ZLNXZqOUhqMldTVjYw?=
 =?utf-8?B?RkdDQ29yS1puSGV0NE1sMXNZR1RNUGY5K21hSDNDZlFsc09HZWFUenNMSkt4?=
 =?utf-8?B?RUV2MHo5WVEzM3dzTGpETVIrSUQ0anhOendCU2F5azM1RlZnUTkyNTlEQUt1?=
 =?utf-8?B?eVA3TmJzK0xPMGNtNzdLb3JaM3M2Vkd4cXJXL25vMXZXanUwY090U1VtUTF3?=
 =?utf-8?B?S0hxS21TVjU5dzh1Z1Z1T0dLT1d3dm91Y2JIY2hYVnQ4NkhpZDIzWmVSWWkz?=
 =?utf-8?B?cmFzbzUyeVhzZVJnRHd4VUNoVGtmTnpwRHpXZWRoNjhPdWxRU1JXOGJjTU1R?=
 =?utf-8?B?empiTFFpaTZJOWFkTitvbndLdkJMYU55SFArb1RTU1MyeHdQK2Fidkk4LzZQ?=
 =?utf-8?B?b1VGYVdJYWlzZkpwbmRoSUtxR3FsV3QxZWRBSGRsUHh0WXM4QXc1Tjg1V0Ry?=
 =?utf-8?B?bUE2cFJpOVFTcUpydFAvcTBqWkJORjhMUWFpbGVpdERoL05EMVNrYzVXdm1w?=
 =?utf-8?B?OUxKWUFPQy9DZ3p4VWI0ejJNUnYrcU1nV2tTcWZVTGk0Ry9xNWtHZGRtN1Rz?=
 =?utf-8?B?YXJaRm1SSm9CdVdFbEpTSWZqVXdlTnBLVCtDcklVRGVxVWs2OThpUGJyeDdY?=
 =?utf-8?B?a0pWQ3NEWE5rbVJTYlYydGszcXRQU21kUjczSnJJOHJYY3h0MkdnQ2JLL3NM?=
 =?utf-8?B?WDYrNFVrRnRRNVpWV2lWVGxhdTlhRXNHQmNPK2NXMzdtbm1NS2NpUGJGWThr?=
 =?utf-8?B?S3d2cVlWN09OWEdVQXgwQWVXMGx3RTJxVnB6b0VwWTZqN2Y2ZVNjamIyS05j?=
 =?utf-8?B?Q00wVU52SzA1Z3QxeHpWWFN3OVdFV1ZMcklYdmRqbWRUTWlTSnQ5WmR1eXVn?=
 =?utf-8?B?czJmZDhqaUZiTWRld054SnZvS3FrblE1QXMvNURDTG5SNUh5TzBJRUEreWxo?=
 =?utf-8?B?ZFNRS3pmMWtSVHFyWHlqNVovZ2lOVjFnV2JTclBzYjNoVDBCd096Z0xZN0RZ?=
 =?utf-8?B?VWthZ0U3aFZlZjdrZ1NIUGRseVBreS9RdXZUR2p0anpkS1VDV08rQklYV0lU?=
 =?utf-8?B?eEV2SzRSbHQ3MjFUME5KakdoUFRPYjdmTy9PYUVBZFdoSHZUN3J6VHBPbFlV?=
 =?utf-8?B?ODdDYThFcG11VytIeWdlNlM1WW14Q1RWZHYxaG9GV3ovWU95UllDcWNNVVBz?=
 =?utf-8?B?cnJHTHV2NDROaUFaUGVtUW40THJQQnVDQ3JqM3FsOHZGcmlYSC9pK2xxSkJp?=
 =?utf-8?B?SW5LSzJhd3p0NWJYL3hUMDlGMVhpZXdCSFpuSDhGZVlsVGc5T0xVdHRKVUh5?=
 =?utf-8?B?N2I0WXhFQ2lkTG5SbFBZUWFQYmdiNXBBRXRwbmpEbFFhZWtvOTVLWmhQM0I5?=
 =?utf-8?B?T0dRbkJoR1ZDU2NZSWpwU09NY09hQVdldFhwci81K0FRYzRhNEx0RWpIK2xG?=
 =?utf-8?B?R2pmMzYwbjhHY2VxZWdGSWdhQUxVbHBMQ0YralNTVEZoTENuSXhySVU2R3pq?=
 =?utf-8?B?cTBkWUk5ejQ0aU4wRmp1dWZUbDdlVEFCS3lPVjlCaVZEZG0wRXlDYTZzUzc4?=
 =?utf-8?B?R2E5ZUo4RkQvOWEyaWsweUNzNitwOG00TWJINmprdlFCOWcvTnVNZXpsTC80?=
 =?utf-8?B?MU9RckRRK3dBVDJqSXRKVVBCY0gySnB5N1RpV0pTK1dwUDFxU2hRdC95RHNa?=
 =?utf-8?Q?WVUhrsgpHfk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0FVei8zNzA3bWhrUmRqcGxiMlVBRlBNdGdqeGRCWW1YYnlieGlyUktkbjhq?=
 =?utf-8?B?OEtMTmFjclBYb3lLZFh6dVNaeEhGS083VlRvTS9qbzlqek1vZjVWc1hNUFU2?=
 =?utf-8?B?azYvaVBPUlg3SGc2aXNiTE83dzdWa2FhU1RwTm0xR3F3RWMvZHFUaDVhbW5x?=
 =?utf-8?B?SnpiWnUzNHV0OFpUUWZiMUVRK1dSTnluQlFGc1lSZzNRUUlzbzJhYlF6WG41?=
 =?utf-8?B?WUwwcXpvcmJuSCtwcEV5bk51bFRPZlhBSERTOFMwRTZVOUlIcUx1R0l3YXpJ?=
 =?utf-8?B?Slp1aFQ3eXRYcHN5TzJJNGoxZVJ2b0hpV1p1YTJHZkxVaGJFbUJJRy85ZWxC?=
 =?utf-8?B?bUFLWk9QRVo5TDhNa0xIUmtBRnVPUjhxcWZPNW9NR292a2xibm4xajYxWkRL?=
 =?utf-8?B?T1RNTzJMY2prUGcwRWpuNW1aZ2xLaUN2VVpyMmVZZkdmYUFkMjZRbkNsQzVM?=
 =?utf-8?B?UUptMlB3blBKd01oY3NIL21ibmFjRTZDcU5aZXJKRkYwNkVGN09NK1RaeUFD?=
 =?utf-8?B?OE1wKzJPa29MMXQwUHFyUEIrbnBVWFpxOXlvOC9NTExTWnhwbkxqL2trNURJ?=
 =?utf-8?B?RFo0aWRUUzN1M08vVS8xK29PK2VWSzNGbWI5R21LaENVNnpNWmdDOEdYeGF2?=
 =?utf-8?B?Z2MwTUJ3NG4rbXpETVNVaXRwY0UvZzV5ZmdYclloVHBBaysrYW1GeGdIQ1Qx?=
 =?utf-8?B?OUwxb04vUTdHTjFQZElkeWpTWEprTm16SE40MnB1ZFFJUmFURFVGSDlrejUv?=
 =?utf-8?B?NXA3MSt5S1FQMWZQa0Y1OGoraFJmYTNzeXJCTEFlRFY3WGJVZzdhS0UzU1ll?=
 =?utf-8?B?eTE1ZE8zaDErMHNUblZXVFlhUElndURERkxlSXRXSlgvTnZyRHRKMWdWMkJw?=
 =?utf-8?B?YWxuN28zaXFKV1FtcWhKZHBoSWFmZnY0SE0rMlR1NzhWYWZmRC9HZTBEUkl5?=
 =?utf-8?B?U0d5U01rTE9Na1RsZXBGZExIRFlVZ1lRcDBzNCtZZTA0TmFzMDM4Z2RNUEl4?=
 =?utf-8?B?ZlI2TXJlalZZWkI2SFNQQld3SHNDZThwNnI1aGgvbFUvN2YxNWN4NWlzYmFN?=
 =?utf-8?B?eEw0UmtBMkFHM2t0Q2Z1Qk8rTDBKcXNQUHJvWklwVnQ3Z3lLdlVOV2RuMVkz?=
 =?utf-8?B?Ujd1WXREaFVTdERIaEk3SGNKeWc4ZDZTWThKM05zdHovQUF2QjduL0FGRjlR?=
 =?utf-8?B?T3lWc3FGVktFblpqdGRWNzZoYjdwbjF5amdHa0hrbUFlK2JkSDZkMWN6QXJV?=
 =?utf-8?B?THRRUHlMTVpkeE1rUmdIbFZxL3YvRXU2UXVUUFU0d3hDZndNQkhacC9hUjZY?=
 =?utf-8?B?bFhBek00ZmNBVW1lZGorVHhDTHJNS01ISEVnUHRGQWdQYVFjYnEyWllTdEx1?=
 =?utf-8?B?WlA2RDJkS3ZWS1ZKY0tWVCtKZGJ1bFFIajl6T2x6TUN5Mm1LMCtsVGVrdXJX?=
 =?utf-8?B?TGdwK0hMR1ZWeHhSZkV5NVlaRjZ1cFVzMVZWdjltbnNSRU85aXlsZ1hldjdR?=
 =?utf-8?B?aUpSYXBMek8rSjAwVysxMGZlMGdhQzMyWjYxZmY5MEw5QUxhV3JNc1NkdEFu?=
 =?utf-8?B?ekcyWlBFMGsrbGZNNUR1MVNOSGY3bmxYbHNQSmdPWHBuRVBNME1WSXNFQXQy?=
 =?utf-8?B?dTVPbW5EL3R5ZHFyVU8xaTFIdWNMUEhQOWlhcnBkN09HbVlNSjdoRUpQejlR?=
 =?utf-8?B?dHVrSU02WUNQM1JKV29QUHhmblVadmxKWm5hRXhPYnM3MU96N2d6NmNadW5i?=
 =?utf-8?B?UWwyWlovUWdZNmQ5aDMxMHNwM2Z5STBVMzQ0MDlPYk03OU5rNlRkOHQxTVdQ?=
 =?utf-8?B?b3E0WmVTdkVndWFqOE1zYVJWcXU0MlpQNVF3eU0raXQyQzN4SkRDUFh6MzJE?=
 =?utf-8?B?aHFDaGZyK1pEM3ZmUkM0cXBaNk9Lak5MeVBaWS9pbWQ0MUhEeDF3K0N6Z3ha?=
 =?utf-8?B?RWRMQ0RtME9ZQ093YThSeUoyU0xjd1lHSWthQkV6LzR3UUJTNFdsMkkrYmd1?=
 =?utf-8?B?a2dyTmdGaDZqbWR6c2habTlIUERueVM1UnVlZEI2OFYrU1J2QU9CZWFrOVFz?=
 =?utf-8?B?anNIZlIvMmNuRW9JSUhxYno3dHUvL3BFOFlBck1iTHRCMWx6RkVDc2RCNVBH?=
 =?utf-8?B?ek05dkVBaC90ZjM2Mm9lenBYd2tqelZ0TjRmM3ViMFdIdldNYUk0ZVFmN0hY?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c64d0f8-3387-4e94-73f7-08dd918308e2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 18:30:14.7087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XwA/ImfWtnFdKh+xYi0wyZJfuQz5PDJJXzZ9xXN+Klkj4ROTBrPEJuce4H46m2hUdXopKwc98xkQJVCFA54hn+Mk4tz3Pr9duG6MYkgd2LQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10545

Hi Heiko,

On 5/8/25 5:09 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Using snps,reset-* properties to handle the ethernet-phy resets is
> deprecated and instead a real phy node should be used.
> 
> Move the Ringneck phy-reset properties to such a node
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

PHY is still detected after a cold reset and a reboot, iperf3 works in 
both scenario, therefore:
Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

We'll need to do some work in U-Boot to prepare for this change I 
believe, will try to figure things out ahead of merging the device tree 
in U-Boot :)

Some nitpicks below.

> ---
>   .../boot/dts/rockchip/px30-ringneck.dtsi      | 22 ++++++++++++++++---
>   1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
> index 142244d52706..ab232e5c7ad6 100644
> --- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
> @@ -83,9 +83,7 @@ &emmc {
>   
>   /* On-module TI DP83825I PHY but no connector, enable in carrierboard */
>   &gmac {
> -	snps,reset-gpio = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> -	snps,reset-active-low;
> -	snps,reset-delays-us = <0 50000 50000>;
> +	phy-handle = <&dp83825>;
>   	phy-supply = <&vcc_3v3>;
>   	clock_in_out = "output";
>   };
> @@ -344,6 +342,18 @@ &io_domains {
>   	status = "okay";
>   };
>   
> +&mdio {
> +	dp83825: ethernet-phy@0 {

Not sure we would ever need a label? We don't expose the MDIO bus on the 
Q7 connector, so it's either the internal PHY for Ethernet or no 
Ethernet (or USB Ethernet or whatnot), so if you want to disable 
Ethernet you only need to NOT have &gmac { status= "okay";} in the final 
DTS?

> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&phy_rst>;
> +		reset-assert-us = <50000>;
> +		reset-deassert-us = <50000>;
> +		reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
>   &pinctrl {
>   	emmc {
>   		emmc_reset: emmc-reset {
> @@ -351,6 +361,12 @@ emmc_reset: emmc-reset {
>   		};
>   	};
>   
> +	ethernet {
> +		phy_rst: phy-rst {

Maybe have eth somewhere in the name, there are many PHYs from different 
controllers available :)

Thanks!
Quentin
