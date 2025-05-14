Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F48F1F4285;
	Wed, 14 May 2025 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215438; cv=fail; b=rf2D1yb6WU9tugVIml4Ery1sBkVU1uyOoTfplBySnxbrDFvKEVainSggUd2+I1IHOq1QDQ7t+s89xSCnYUs7J8+jTanrNpTkiUSbohREbAgns35LYrFRxnNZtAYOl0dMkJgtuoaKyha9vhQuTmOU/KMAiD6D48XWJUfCHVAxRzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215438; c=relaxed/simple;
	bh=0nz4XTLEIjNQ6t3Q/b8WeBCtag35WbLOhOR4cve/4Qg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=psvcTUK7kOkru4vOH6ZRkmshwm1RE+mNFkqRA5w1TPdwm4tLIIADjALje7hbBr4ZTNmut/U0xhOMAUPNerdoRFnMmdGss+QfPX8PG2eJP6x/jY76vLcs83pJxF/PMwsm98R/HZfANb4WVrk83CI4LRu4KQOSYF8IP7uqZCj6z1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=QYpu823V; arc=fail smtp.client-ip=52.101.72.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="QYpu823V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPYluKebvRf9yzugHiyvVXhmGBosLM9H6D/kzlCd0Z9/tB/4gAf4pFuCxYQ9+fc/3OIwYLej4ZPlYnzhlp2wB95xFamq1mwZ0P/l4zUBaU23GRJNkMNnDyy2CNX+FAAkInWf63KYutqrJaJEgaHUkh+HDk6UHE6oQ2lWgpndi6sMzQr5eKAiHZJYhpSqsVBA0263fssGtn26YN404CrODMshH7sAodtA/uEc7Jb0UrSFHPHk9BfNa/S21whqwduHptwtqWp7ZBHxaj4JqPPox3tXnukFOBbJc6Ju9Ldm1o3JXPMNJGyV1iuGCutzrcXT7PzeZlJFM2zQm0821eZbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gONIbD6TQWb8jCrfc2aVJkgXHfm3q6iJXqHPCyR2fGU=;
 b=dTI7IxcxCEMNdCHlfPXBsY2y+2GcSUOW3UAMgqEENASlvncfO4Q515j3067tRlSXwNx/nYVObQfTun6V0q/4LV+64fioidblq8PiyOdTEQhWBFryKjR6ml69y9izR5Vwa1OHPj3uegcEt1kY7vgfDJlQKprlFeS2Uy/8U9ZC+dzAD7dylDFj7y57+qBlv4rIGUCeXPAhiXYwUxY8YBcrLqoMtLvB3ZPWpoWPHbEQmpqiN6eL/0dG8NH6XQR/l5ZhbS96X8mtt5arz/bxB6AWMDPAnUfbN0qJL7eku36U/cgrA9vY0+N2l/v9U+OVJgACaILlFm75MsP5L/YFWNdgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gONIbD6TQWb8jCrfc2aVJkgXHfm3q6iJXqHPCyR2fGU=;
 b=QYpu823VZtf4Zqw4dYugN8AlAjwR1g935cgcxUfUDqU2qNPcgCuVcDPKDKqUGhGKJmue/fF2IOBMAjcjS3QiJV4zZVKumuMS62ojP+BfMb68hrAi/kb8csk4WekDJNN2DFah2Ka+A9qDLCUfSntiAKo09MVO8uCtIIsrdATwWq8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8615.eurprd04.prod.outlook.com (2603:10a6:10:2da::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 14 May
 2025 09:37:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 09:37:12 +0000
Message-ID: <c8538d66-a39a-490d-bfbc-95abda3871ef@cherry.de>
Date: Wed, 14 May 2025 11:37:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: rockchip: add px30-pp1516 base dtsi
 and board variants
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250513150234.2331221-1-heiko@sntech.de>
 <20250513150234.2331221-7-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250513150234.2331221-7-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0234.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: a94a34d1-b8be-4728-be46-08dd92cae7da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1Zlb2VFTUpnTzIzenZEMnMwc0tWWWx1ZnFjalluNUVzaUFjMExpMnN6b1lO?=
 =?utf-8?B?T0xQa01xN1gzN3ZuUTFIdEc2MTNrMkxUdDJLLzNsR0Q0eGlWbEIyTG1aQ3hM?=
 =?utf-8?B?S1MrZElJSzFMcTVCNlpMNGRjRmFQU1dUZkRoOWJ2YmQrUWRTWUJ5cXlrVHZ5?=
 =?utf-8?B?b01JaCtOWWJZNWJaQ1VaR1poaWVoM2ZWN2hxelNOTGJtT1BVelpGdi9oMUJk?=
 =?utf-8?B?OUhmV3VuWXlKOEZjL1dGc1orbnEycjFvSGFDVkZpQ0p5dlBVM3M2cE1CRXNp?=
 =?utf-8?B?OWM2M0x2YWQ0QVpFYkZxbFl3NmpJeGErcHRXS3RoazZidjFsa29ZQlhtK21L?=
 =?utf-8?B?V3JITm9mWUtmYWxocjMyS09rVldjRmI5dWVoOGRHK1MxVHFEQkJ0bUJkR1J4?=
 =?utf-8?B?V1FPZ2R5VmkwbVljbEdESElPWHZPWUQ0QWhlcGt2R2dadUtyN0pMSFQzSnU2?=
 =?utf-8?B?YWp4R0pQWkt3Y1I0bWQ5RVlDZE5OUjV1d2lwS2pVWjZQcnRiYXRRNTlVOHB4?=
 =?utf-8?B?SzlSVkt3dytSTmtxb2ZuUTQ4NC9JdGZOZXU4RTQ5T0pRbVlER1NFd2dMRFU0?=
 =?utf-8?B?OEQ2M3VaNFVXam9sTmNUZHZJSngxRzNEbFdtWXRHajdzbTNmbEtpcmMweUly?=
 =?utf-8?B?U0VtM212MFhodHN4aTF4MTBwbm1RZkJrdDJhbHRDTnAwSG4wOFVDS0c1NnZl?=
 =?utf-8?B?N2srL1R4V2kzVHRIR2JwcXNQME94c29tZ3p1WjVnNy96TFpjajdwR3FsNXdy?=
 =?utf-8?B?RDF3RXBlV2NoejFEN3k5Q1NOS2xXbGVLdjRmM1BZUFpJamFWQjhTWDB3UW5x?=
 =?utf-8?B?dElxUFNuMmQ0OWYvMUlzZXNmcnVwRVlWWk42T0o2TlhybkRremE0MXZETlZu?=
 =?utf-8?B?Ums1cWhJQXpLc2NkOWFpcHB4TENSeGx5ZWE4bmFXME1qcGFXUWlqbnQ0M0Z1?=
 =?utf-8?B?NGpNT2NJbTNVNUlnRk1tbGQ2S3ZXaXZpRzd2Tk42MnkrSVpJWUVUYy84Rjdx?=
 =?utf-8?B?YThJZFBBMEdFRTRaV1czblVzdHY2UG9ra1NHdVNtajZVbGcrLzNyVE1sNXJ0?=
 =?utf-8?B?VjQyZ3lTVEd1Uld6S01nSzIwMnNrMURvQ3ZmZ05DWXJrYkQzekF6NGxIaExl?=
 =?utf-8?B?TXI4MUZRMUdxNnA2KzFlSHlaT3NYcWNsSUNBc1gvU0lCKzdXb0tiekxsditj?=
 =?utf-8?B?UjVOeVJEZHdlaCtRZGp4RVFia3UyNjVkbkNhLzk5c3p6L1V6RTk0QUxUSkQv?=
 =?utf-8?B?My96dTIxcjM0REdnaDhRZ0pzWTdLUVBkc1YzQjM3WlZnWkVjd1BqUFU0aWlj?=
 =?utf-8?B?RHpNaDBVeXlCQUw3YVk5bEh4b1ZPNjdMeFJGNUI0YitPRUl4Z29iUjdhaGQ3?=
 =?utf-8?B?Y1RpRkNGektkZTdNZnpKcUJaQ01zb2k4RVY4b0QvY2Q4MnZmVFBZQm9FdkJ3?=
 =?utf-8?B?dUhMd1JWZjNrdTNHZk1ZVGJaNzVhamFDUnhSbjYzZ21HT20wSjdWNmRQNkYr?=
 =?utf-8?B?bU1DamlQMUdySVNWNkViOGJFMCtQK3Z4Vkg1MkluN3VPUC9pRktDVkorb0VX?=
 =?utf-8?B?MzBLb0VITHpFd1RPWXk5TVl6Ky8xd3hNRlJ0cGdYTURzdC81OEhTcVMrU2lj?=
 =?utf-8?B?RU9oQ3hUVDZnVUpVT1hTdUt1SmJqbU5VdktyeTZwY2xqVFlyVGxncTQvdW9m?=
 =?utf-8?B?bFoyamNScDN2QXlvcXZwQW0zM1FoRHlnelEvelRhcSsxcDl4UnJMc1BtWVNk?=
 =?utf-8?B?elZWbHJZMU5pV1V5OTV3UUZKVjlqdDZieHRwWHp5RVloQmFsUmsrdWZXK0ZF?=
 =?utf-8?B?T3B0Skc5dW90Umo2eDZRbkZmdTlmdU5RdnY2cS81RWRzenFnLzNPdVk5cEZ2?=
 =?utf-8?B?VUoxOTd4ZVZZeHBlZWZ4NStMQ0s1YS96M1V1aGVEb2VVUkJNTTdHSHNpMU0x?=
 =?utf-8?Q?iAQJjo1kyuc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlNRSndzdnA3MW04YTBrUUFUQS9OV2tkUGZjdmF6S3dHZmlOaG5Hb3FqbmVN?=
 =?utf-8?B?QVN0RHdMVytsdDNnZVp6YVpiM0M1N2VqVi9Cck1wUUtPZzd0cFdTQzI2UWhk?=
 =?utf-8?B?QU5oc3hJSzE2WWNxcmcyOHFnOWU4ME9aNHg2Z1pST1dmNW5rUHczZGs5NkJS?=
 =?utf-8?B?MG1uc2k1bmhSNjN2UjFrUWZNMCtObEthQlJPYjZsbUNqZlhCbGFybGwwSUxv?=
 =?utf-8?B?VkFpTVhNaytXSzlTR2plcTVxcDNPRmMxczh1LytRSWIyVm9lQXhCRHpNRyto?=
 =?utf-8?B?SWZNSGIwUUErQnB6N2NVTFpXdS9vd0RqRjRCZVpKRFJ0RG15RWJmVCtSamNo?=
 =?utf-8?B?OFE5aXVKQ1B4WE1SVDY4S2N1NVA3Z0dabXB4cUpWK1hkQW1ZcXU2RjFVNnEx?=
 =?utf-8?B?UWlpQXRQaENTb0JmK1dhdmNoanhoL3dPL2xpLzlJYk5NSGV5NFlYN1BYSTJI?=
 =?utf-8?B?cFd4dnA5TkNhVGt0QXBQdTAzblgwSTdiMmg4R0V0a1U5R3RpNkxOcTd5bWVn?=
 =?utf-8?B?T2t1emxndksrYXBzY2plSWkvL1p1VkkwbE5rbkhmTW1jTkRPRlhwakp0UDJF?=
 =?utf-8?B?ZkRJOHFNdDE3ejJ2S242QW9YaFlQaUdFV3VYdDdIcytNZjJFRFJlVmJNV0pl?=
 =?utf-8?B?WUc2N3pqM1p2bjNodHhrVGtIdWZHUytWMDNuZ0l6ZUVlOVJtaE1SREtYVkx0?=
 =?utf-8?B?NlVPdm8vd3ZtTGJkWlJYSUhpUG9NYjNIT3VPQTdoKzA3b3c2YU9ubkx0dkV5?=
 =?utf-8?B?ZEVlcFZ5cWhxTGhJaDY4Y0h3TlJ0WCtlWWdmeHdLWDNDUUV0NW85RFVWT2Vz?=
 =?utf-8?B?R2FoeHpIWS90dDl5TnJMVmxVY1p3RVdDeEphcWxVcjJtOVFiMVdEWVd5a1FJ?=
 =?utf-8?B?a0oraW5scWVLYSs3RVNPdTc2cWk5a3F4NTl5OFgyQ3FydVgzMWI2MmpuZ1RR?=
 =?utf-8?B?NW1Ednkzem1kMi9SOGp5YVRVVnh3Q3ZYekNYQWZiczZqNzIyLzI1Q2pjVWto?=
 =?utf-8?B?K1VLaG1kYWRSQkFkb093ZnZPN0o0alNHaG9jNmxzNjViQWFWaWY1V2hXdEtX?=
 =?utf-8?B?b3F3VEp4K1ZtVVU1cHV4VnI4bWlkL3E2R1htMnNGRWZ5djRtc0RJSTZEVXdS?=
 =?utf-8?B?ZXJHZ21oSURsNGlVTjU4VnJLb25iUXM2emN0bWkvb3IzU0Y0dlVDNSsrZTdq?=
 =?utf-8?B?alJyZWViaEtnUnBDRHB6VTZSa0t3TUgrd1ZEYjRucFpoZFVqMXR5cHBQSUgv?=
 =?utf-8?B?Q1piYWJRL0xTRnQ1Z1lZZUFEblpJb3ZaTUE1eUJTejZqM1dXUXZzVWovTk52?=
 =?utf-8?B?K3RZMWhzWDNmaVMxWUhwcVNYWXh2NFk0RWRtM1NUTC9oY3orZnQ5Wmc0L1Yz?=
 =?utf-8?B?QlhZZ3pLdXVhS0R6L3RXMWtXcXB2VVJ0QXhVR1lqSXI2TTUxaDMzRlhoVkR1?=
 =?utf-8?B?bERXdWRlQzZuUzM1aHBTQVl2VTJkak1iaE5ZdzVhcTVXZ3lBcDdIYXVreTZq?=
 =?utf-8?B?WFAxVFFSRVFjSDB2anREZFJONVJ1aVRKeXY2V1dlRmZPVjZwYmprMFhpa2dL?=
 =?utf-8?B?djZGcE9wRjUvZ0phcWsya2tYL0VhTkdNeUdzS0FEYTAxYlBsbzdmZ0pKakE2?=
 =?utf-8?B?dTh0UWhVZFRCOWU5dXF2NUVKQ1M4WnFMV3lqWXJpcytHaUhXR0h6NXJhT3lB?=
 =?utf-8?B?YnlGaDVRNmQ2WjJKV29mdHc0U01yMGFLcldmdDZyeXZ3RlR4WmU2TnduaE5y?=
 =?utf-8?B?VFg0dXVpZWpuZDk1Mmp4RVNDd0h6RlgyQ0owVU1uMWVyWjRxUkhFcktQZ0xB?=
 =?utf-8?B?YlRGWjgwRitqcUNrTDI4OHNIRUxORU0rTnRSNll2aE80TzY3U2xMNDFhd1Rm?=
 =?utf-8?B?Z3lyZkk1Tkt4NzZjVjljOFg4dWNVR2EzSnQzVU8vL05nQUlsWHkvbGwvUW0x?=
 =?utf-8?B?VXJSaUY4T1hENVlKenV4b3BiYlVMVkt4YnlzM0llSXE4bXZocEdjclk5cmRv?=
 =?utf-8?B?KzNoNjk5WUlDME03LzZnQjlnb0JqanF3QUxkdWxsdEN6dHEwM2xHZmNLVFps?=
 =?utf-8?B?SU56VXM4WkFpZGVpTEFXQk5WcUZEa3pYcnpoQ0FNL05wMDNDRlRoYnRzSzRo?=
 =?utf-8?B?UStaYUYyRnJIL2NLMkowdmN0cGF0ZXpmMVBiSXBzd1JjK25VbCt1NjNhTUZ3?=
 =?utf-8?B?a1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a94a34d1-b8be-4728-be46-08dd92cae7da
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 09:37:12.8846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLcZGz/3uAQ4RDQBH6OHu5CEx0WvNYcEArLZkA/OGQ3Ix4ly3cGEYPufZrg6Aabykojxa5ATy4giIW3aBWS9kozGU/r33EwzuUb0koZVJ3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8615

Hi Heiko,

On 5/13/25 5:02 PM, Heiko Stuebner wrote:

[...]

> +	rk809: pmic@20 {
> +		compatible = "rockchip,rk809";
> +		reg = <0x20>;
> +		#clock-cells = <0>;
> +		clock-output-names = "xin32k";
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int>;
> +		wakeup-source;
> +		system-power-controller;
> +

Please order alphabetically here.

[...]

> +&pinctrl {
> +	camera {
> +		accel_int: accel-int {
> +			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +

The accelerometer is not in the camera module like some of our other 
products, but on the PCBA directly, so I would put it in a different 
section in the pinctrl node.

Can you have it this way too:

rockchip,pins =
         <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;

so it is consistent with the other ones?

[...]

> +	panel {
> +		dsp_rst: dsp-rst {
> +			rockchip,pins =
> +				<0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;

Same remark as for Cobra, I assume we want a pull down here, to keep in 
reset until the driver probe drives the pin to orchestrate the reset?

With all the above changed:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
