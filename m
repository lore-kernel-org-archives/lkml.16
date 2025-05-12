Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA62D258CFE;
	Mon, 12 May 2025 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038354; cv=fail; b=TkwOg+GX4ktiCTA19Pb7XHUyg55Cb3+wbYCqmXecezYXvZrK5a3i7ZCFewcJRLz1ThdNa4VXo6nJwi1aN3dzVnItYqnHlqDCHP6TpTbQgRILLkyhgMddyCuFVjG1D0+X7CfgMrFdeyKJBDNUMbBCq+iERKMrotxMDj2Ac+Qu2Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038354; c=relaxed/simple;
	bh=UGLSnFK+cA7dy9E6XgMaXiN/zTUAsJWS8c54Juh4YD8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dQY9jKdo9w8D6FBGead+o5BqGzDvmOZ3DwfuzwPcQfGjLCXDjkB/AzybgvZQftlZccZcnauvUtvgqgWkk5om//fNi7Qs10AHyC2FEltF/oDPjBFgLoNjzQpfauWSTEwwbmtxaYJGFvbZvtmpsyGW3oNKy/HoK15qEce5ZLSgKfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Oo7W78RP; arc=fail smtp.client-ip=40.107.21.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Oo7W78RP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fw9VVV/v7eakdOAoQsJ7ZRUUZ7+L17PIYm3iWDe+wIxBWApQItWqyKk1bpruNFstaF6bejZi7kAVYcNiHYKDnCnVJaJBgSElyVU3jEhGj8oPnRNEY6oPd0YDVrMFrmIGqVQtvAo8mE5K493aN6cYme95MVMmDVi+a7q3BhkTyU55Jczxq+LFnlu8ZA+CXjbVGDFwcaH3QqOkN0okypqQzGqjdr0rMntf+E379hRnvP+jvJ5o7hqd/ZbksEEz00OBW6kiPbDWYHBuzpAXHoRDg6FRwk1pG91YwJg8SEskSxc/ZIvH5nKsFfOYOYMjDm7aHY8X6wPA4sunh5jB4tDhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUZ8oav2PtYu4lJBVCpWYgeD6gSZs9Osaoa+CwoG3w4=;
 b=B/7Qq7WIRiDxev4t0Jz6dJqMtx3IPtUxWj2vVmHk4JitxZwHlH0tFgt1I+OYPNDahRHc52VnWchnfu+PXg3yD8p+L8m+A26gxH4Q/LCJJ3Rbzqed2hYkH9z0aU+SkfD72mJ1yXMNQZ1cR1omE660dZn/vfs487/+GEVxRgJqXknAM8wUOEa34y/adYm76vRdCiDMUPKObJYaZTLs1IP4e4ESVtRG0kfTdBrrMae67SSfCY3Q4q0fJb4x7cmfM59txdryBV2WyTpewLVQeTXJGootFD1QZoceza7sAbQmdf3MqUEP97mWI2lWYm4IW0zCZFv83/54PWN0SrRI6MJV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jUZ8oav2PtYu4lJBVCpWYgeD6gSZs9Osaoa+CwoG3w4=;
 b=Oo7W78RPxEPi9DWIqj2V2gRTeoQUY0876339GWuoTRI6wPX1E6BEjIbm1oSm1qdkbiEQTtI9B39LnH1eAlUnKal2NmRka8JGuAnMIY3afd2ax9dHuzu79yeL+bChEsYK/Mk9ZwZWSP3Phe1vZcQ/RhZhA0D3TdoSXaaW6G8fCvk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 08:25:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:25:46 +0000
Message-ID: <39ba37de-4487-4872-bcc8-eb734490ccf8@cherry.de>
Date: Mon, 12 May 2025 10:25:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: rockchip: Add Luckfox Omni3576
 Board support
To: John Clark <inindev@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250509122637.26674-1-inindev@gmail.com>
 <20250509122637.26674-4-inindev@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250509122637.26674-4-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 664e3486-fca0-4605-9a35-08dd912e97dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDlVM2IrREcxWTZNUGI3c1FjaGhHcGxENlZBamdYVzVSMHhVOGgraU5LV3VN?=
 =?utf-8?B?VU9rQ2JRYzNKOGdHRFl2Y0VRcndmVHVYWmtZZ0NTeGFzMVZLRUY0OE5YWVVt?=
 =?utf-8?B?bis5djl0OG43WnBEMFZ1QjNFZC9QK2ZRbHZocXJOcGljbnZFamNUWWhBVHVM?=
 =?utf-8?B?NzdkT3hiNW9KNnNZT2g3Yy9hVzdGSzBON1hTNG9wZ1pEV2N4aWxvcElDTFRQ?=
 =?utf-8?B?QTNsdWlrcmczRHN3Um5DVUNLNVZNbmNhNzREang4UEcrUlFzMzg5MUd5c3V6?=
 =?utf-8?B?cnpTNVNsbEJZOHd5d1hlRXVWTnpFaG5FOGh3Vi9HbnBKekgrZnRWQnpPSy83?=
 =?utf-8?B?Q0hoeC92aUVBUVVGOFk3KzBHWjF3Q21wZFZ4aFZ4N2NhMEJZSUQxdU10S0o0?=
 =?utf-8?B?QTRtc0FvdGpUdHVmODdOcWJuWHdXbHErQ2hNNFl2QWlsWDNkVHdvNmNhSHFX?=
 =?utf-8?B?elpLMjlJaTQ1S1FrT1dHN01mSGFaNlJ2dEFmditxZzBZYVF0cGdQamlxRk4z?=
 =?utf-8?B?cWxzSUVPVnVXRU8raVJCcjMyU1pnSnBVNUU5eDJiNTVnYUJ4OThnV2dhNUF4?=
 =?utf-8?B?OVRZUlVEMHNoMkE2dHU5cFdPYXRBazBtWlpSR3hyNzg5bEhWTGpsUGRnbmky?=
 =?utf-8?B?T0JxTFpkOHIrd3Zjb1dkbHVWT0lVdnhGekFBT0hMVmNuZ1V3WVFxOGhMUE9V?=
 =?utf-8?B?cUorNU9UOGxwRGZ5MDZMK3FhZTAyemNqeTFUbUllUzBQYlMvWVBNdjVrOUNP?=
 =?utf-8?B?M3VyNkRiSW5ocGhMVW45bjlHWGxEWklxYkNuTUpMaXBsdUVVbWZDK3NXdU5n?=
 =?utf-8?B?THp2UUZic3VXc3F5V0Y3V0t4NGZsdEVBU2I4ZUdXZW5GQVhQZ0ZyYTV1cDJT?=
 =?utf-8?B?UVlWTnNOV3JyNlZCNDRGS0RpU05VRGR2dTdJaktwYWtpbktFYWZKNFJSRC84?=
 =?utf-8?B?TStGbVFicWZlY3VGK1ovZFdYVHlXYm5jS3poZUk5L28zaVo1NHcya1hkZmpM?=
 =?utf-8?B?eFZrYVdGbWJpNFFjUjJMUEQvR1FFUW5iSnFMRmlKZnR3OUJ4S2RmeE1OUTJ4?=
 =?utf-8?B?UTFVaTRBd3d4dCt4dmppaVZYQmNiREE0Y3dLQitYMlBWaUdtWmZzK0xpdzdz?=
 =?utf-8?B?K093SU9zbGl1VnE4MHNBNndvNWpZeVNxVE5jTzlkcFY0OEswemNteDRnd2Vw?=
 =?utf-8?B?NDl4dGVMSVRNaWFlemtick5mcWREOVhKa01TM2RxYzVsbW9IbTl0SnZnV0hR?=
 =?utf-8?B?WFF3TnN1SzBWTWJra0VHK2xjWjhOb1J5VFZESjg2YVVDbnVTYUdhVWF3WWNS?=
 =?utf-8?B?dmRyRkQ3OXRMOFM0dW9Kb1ZISWRVUnpFNFc3ejRuM0lvMmNSRlhPOG5SYm1a?=
 =?utf-8?B?bGhzdjU3M2xwMmFOY1pwQTJMMXpnL1JOMFN3VkU5N2FleEJnb0pkbFJhdlFx?=
 =?utf-8?B?d0c1RHVkazJUV3IrQnhtb1NyR29VcDlsZUx2SURqT2J3S3grNzArRE1IUndo?=
 =?utf-8?B?eC9nK1JBbTRtTTdad29Ec0lmcUVqVWhZYXovL2p1WkQvZzkzaWdiN1NLQy9H?=
 =?utf-8?B?ek93OHA0WUMyMlpPOHQ5bDZDb0VkSlNtNUNNT2UrV2p3aVpYOEpGR2hrdUNT?=
 =?utf-8?B?OVVaUG9Oc2h4MW40U1pQNFAyK0RJMkIzbzdUNTg4ejlCNkFBbEJCT0N2eWZw?=
 =?utf-8?B?MkpLZHNwOGQ5OUxRUVU1ODZ1RFZhNG04R3BPQktvdTNjOW5BTzJJWUw1Y0pO?=
 =?utf-8?B?RTVVaG8xQWNaWFRIc0Fkcjd1cXN4ajl1dDYvZUJDQUQzVmE5YlpHeWpOQWhv?=
 =?utf-8?Q?wOXEUXz2nxZ7ePW2PJhfOH/x8LdAeygeV23hA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmpzdGxoUVpFRFkwMkRBL0lhck9yNzBHSzY2amxDbkhyc0FUTnpqT3ZvL0hi?=
 =?utf-8?B?V01DY3ZSbEF2U3ZORFJ0dVVmUHhmK013eXVTRjM4Z2theUxZUERGb3VnUUw4?=
 =?utf-8?B?eTFJZEV6NEFVd0VlRm9SSVJVYytUemYwV20wWlVlbXlienNzaGZkK3pvVDJO?=
 =?utf-8?B?WUZXWU5wQjdEWXgyL0JkUHdENllyakZLZWtuYjQ3U0VGVzBkRUhvaWFZTUxZ?=
 =?utf-8?B?c0p6azk2anlRTWhVclE2eVoyRFltdXVsK0NEWXQ2SGRqTEdGbjJ2ZlJ2aEVH?=
 =?utf-8?B?YzQ2MkZzQ2FYMEhmYkZCMlI5WjhDRCttVlgwVm9uVTUrM3hMWnc0WnZBQ0NT?=
 =?utf-8?B?UGYxU0ZZdUZsc1RXYmV2RDM1a3d1Nlo5N3RLWnZpb2lVV3RVR2w1YWJhakND?=
 =?utf-8?B?U2F5M0w4QndMS0hQbDdDdlVKWXROVjdpOVBoY0MyeFZmUEgxRFlvSFQwN1ht?=
 =?utf-8?B?TnRpaEcrVzNETVRpRjl5ckQvWG51T0Y1WlRxVmlBV3BXS2FqZWRQOEVna2pR?=
 =?utf-8?B?bU82dCtkVndNM3krWWpnbDYvbFdSd3dUMGRpQ1BpdG1GQ1pFekdtaFF2NVNM?=
 =?utf-8?B?RjFTS2lmK04rdlV1MXRRZmhEa2lNU0pWbjFkYUNZaDROSHNYdktjendTRmVn?=
 =?utf-8?B?eUZLb281R2VNVk5GS3RBOW4vakorUEpPWjB4V2VOQ3NONFJhLzY0T2tYZlVh?=
 =?utf-8?B?ZXpqcG1QU3p5aGdhUkQyVXdhZFhaRUJ3YlpRYmJuRllOV1pFTEFtdlMvU3R1?=
 =?utf-8?B?dUYxaFdxQ3Q2dmtLWkRRKy9ud08wZGZxRDBaUVNuOXJQZjdQOTdvQ1Nqck9s?=
 =?utf-8?B?c2Zub2RQdzZVZk4xeWdwZlNZclVMcXhCZmJhNGtuZWtKYUVLS1lwcmRqa3U2?=
 =?utf-8?B?QXZNZTZuUytPRDVVS1dZSFhadkZFbS9ZU1c3M3Y5WlVTS0NWclZJdlhpNmU2?=
 =?utf-8?B?MGdoSXlwU1VuVGovbmczOTRxVVVqaEQycWtaVXFTRWVteXdJem5EUWRYRFp5?=
 =?utf-8?B?ckV0MDRaZnU4QnBvblN1cnRST2VXeU1UVytsamZtTzc1WHRROW00bGpiclpP?=
 =?utf-8?B?Yi9DZmZjSHZqVEpHRjBEaUs5Mk1GQ1NGVTA2V25KUnlreWhFM2J2bkpCdm94?=
 =?utf-8?B?dGZ2T0J6MTZIYVV0S2dlcld0MWR6L0NIMlpZQ0l4MVh3QUl1bGhGREJQdDlQ?=
 =?utf-8?B?M0IwM3dON3dTR1BJNVpkYTc3Yk40Q3RlNGxNSXIvT1lOMkpuNk5PdUlUSlBr?=
 =?utf-8?B?a2xhR25tVHNKYUh0ak5JZk5HT3NkN3l5MjkyS0I0dWFPUzBuYWl5aldQU0FD?=
 =?utf-8?B?ZVRhYVprbW41S0JLRWJaK09xN3g2MkZrT2kzbTB5RlJHYm90akY3QTE5QktW?=
 =?utf-8?B?NjNYdmcvcXJYWFlmZU1uaHBtT0hNVklCdVQvVkF2cDJVSGZyUjBLNU1wRG1t?=
 =?utf-8?B?Y2VsVnBMRHhqYkhxaUZlNnd4dlhUazZobE5EcEhsWmtlZ1BzNWxyWTFWK3Uw?=
 =?utf-8?B?Yy9qZ1dtVzE2THE0ZmphYzlNRHpjSWJIVmVlL01LNUFyUUkxMFUxblVISGIy?=
 =?utf-8?B?R3AxQkEvRFBEMjVUc1hyL3NtWWlnTVZnVmZjOXN6UFQ0amRyWWRxNEtoZ0Iy?=
 =?utf-8?B?VFFZVjRiWWlQT2k3SkxtOFpkK21jRTZ6cVUxcm9nZVZvb0g0djNRSnVRb0Q2?=
 =?utf-8?B?OVpvanZrWFdKNVFZSnFsVEc0MG9uc3VLdjBzaTRpVnhtd1J3QjM2cXd1bU5o?=
 =?utf-8?B?UXFIQUdYVG5QSG95NGRmRE9pVG5jK05kZjRPVlNONlNOTEM0NksrcU1tVnZ0?=
 =?utf-8?B?OUdvUnozUXFIOWRzWWF6blJyMUhuTjVHamg4TFpQUWc0SXN0Y1RSMkZ1UE5L?=
 =?utf-8?B?SnRLQ3phcGVxVUdENWhBMVBjTENnME4rZEtQb3d5UExtd0ZQNERBQ2NObXRi?=
 =?utf-8?B?OHZySlVnWkpFNmRFRHd3bVc0RlcxclFFTXR5SWgySzBmSmwxUkw2NjViUFkx?=
 =?utf-8?B?L1JZWCtqYWdNZ242bXBXK0J6MS92L3g1N0V0aGZBYmJCUC8ydmMvMlZUQWJ3?=
 =?utf-8?B?bDkwck5ZdzRaU254S3FKTzAxdlNpRlJKVU9uaHp1dHhvR1lsZmpXNldMODBj?=
 =?utf-8?B?dFdKVjBBWmoxUEFESTc5ekV3OE5vTkR6Z0xYZ2xOalVrZHU5cmNDUjd6VjBw?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 664e3486-fca0-4605-9a35-08dd912e97dc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:25:46.0150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3mbFR8WxaZ8pbijQdcBCTzaXxO7cf44etuaQDujwMxnwgM0YBtLonOgEPbRi+/uKaLteeqWzkSDoYlVNrcKA9YJHXRrEAw2FtqDjOD2Xus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278

Hi John,

On 5/9/25 2:26 PM, John Clark wrote:
> Add device tree for the Luckfox Omni3576 Carrier Board with Core3576
> Module, powered by the Rockchip RK3576 SoC with four Cortex-A72 cores,
> four Cortex-A53 cores, and a Mali-G52 MC3 GPU. This initial
> implementation enables essential functionality for booting Linux and
> basic connectivity.
> 
> Supported and tested features:
>   - UART for serial console
>   - SD card for storage
>   - PCIe with NVMe SSD (detected, mounted, and fully functional)
>   - USB 2.0 host ports
>   - RK806 PMIC for power management
>   - RTC with timekeeping and wake-up
>   - GPIO-controlled LED with heartbeat trigger
>   - eMMC (enabled, not populated on tested board)
> 
> The device tree provides a foundation for further peripheral support, such
> as WiFi, MIPI-DSI, HDMI, and Ethernet, in future updates.
> 
> Tested on Linux 6.15-rc4
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> ---
>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>   .../dts/rockchip/rk3576-luckfox-core3576.dtsi | 683 ++++++++++++++++++
>   .../dts/rockchip/rk3576-luckfox-omni3576.dts  |  53 ++
>   3 files changed, 737 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 7948522cb225..22d74367b7e6 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -136,6 +136,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-armsom-sige5.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-evb1-v10.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-luckfox-omni3576.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-roc-pc.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> new file mode 100644
> index 000000000000..9f0fa4427348
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> @@ -0,0 +1,683 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
> + *

Is that truly the approrpiate copyright holder?

> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include "rk3576.dtsi"
> +
> +/ {
> +	model = "Luckfox Core3576 Module";
> +	compatible = "luckfox,core3576","rockchip,rk3576";
> +
> +	chosen {
> +		stdout-path = "serial0:1500000n8";
> +	};
> +
> +	hdmi-con {
> +		compatible = "hdmi-connector";
> +		hdmi-pwr-supply = <&vcc_5v0_hdmi>;
> +		type = "a";
> +
> +		port {
> +			hdmi_con_in: endpoint {
> +				remote-endpoint = <&hdmi_out_con>;
> +			};
> +		};
> +	};
> +
> +	vcc_5v0_dcin: regulator-vcc-5v0-dcin {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vcc_5v0_dcin";
> +	};
> +

This is not ordered according to the kernel spec, c.f. 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-nodes

> +	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		regulator-name = "vcc_1v1_nldo_s3";
> +		vin-supply = <&vcc_5v0_sys>;
> +	};
> +
> +	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <2000000>;
> +		regulator-max-microvolt = <2000000>;
> +		regulator-name = "vcc_2v0_pldo_s3";
> +		vin-supply = <&vcc_5v0_sys>;
> +	};
> +
> +	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pcie_pwr_en>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-name = "vcc_3v3_pcie";
> +		startup-delay-us = <1000>;
> +		vin-supply = <&vcc_5v0_sys>;
> +	};
> +
> +	vcc_3v3_rtc_s5: regulator-vcc-3v3-rtc-s5 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-name = "vcc_3v3_rtc_s5";
> +		vin-supply = <&vcc_5v0_sys>;
> +	};
> +
> +	vbus_5v0_typec: regulator-vbus-5v0-typec {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_otg0_pwr_en>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vbus5v0_typec";
> +		vin-supply = <&vcc_5v0_device>;
> +	};
> +

This is not properly ordered.

> +	vcc_5v0_device: regulator-vcc-5v0-device {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vcc_5v0_device";
> +		vin-supply = <&vcc_5v0_dcin>;
> +	};
> +
> +	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hdmi_con_en>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vcc_5v0_hdmi";
> +		vin-supply = <&vcc_5v0_sys>;
> +	};
> +
> +	vcc_5v0_host: regulator-vcc-5v0-host {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_host_pwr_en>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vcc_5v0_host";
> +		vin-supply = <&vcc_5v0_device>;
> +	};
> +
> +	vcc_5v0_sys: regulator-vcc-5v0-sys {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-name = "vcc_5v0_sys";
> +		vin-supply = <&vcc_5v0_dcin>;
> +	};
> +};
> +
> +&combphy0_ps {
> +	status = "okay";
> +};
> +
> +&combphy1_psu {
> +	status = "okay";
> +};
> +
> +&cpu_l0 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l1 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l2 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_l3 {
> +	cpu-supply = <&vdd_cpu_lit_s0>;
> +};
> +
> +&cpu_b0 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b1 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b2 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +
> +&cpu_b3 {
> +	cpu-supply = <&vdd_cpu_big_s0>;
> +};
> +

Alphabetically, b comes before l, so please reorder the cpu_lX and 
cpu_bY nodes. c.f. 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-nodes

[...]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts
> new file mode 100644
> index 000000000000..3361b9e9a01c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts
> @@ -0,0 +1,53 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
> + *

Is this the correct copyright holder?

> + */
> +
> +/dts-v1/;
> +
> +#include "rk3576-luckfox-core3576.dtsi"
> +
> +/ {
> +	model = "Luckfox Omni3576 Carrier Board";
> +	compatible = "luckfox,omni3576", "luckfox,core3576", "rockchip,rk3576";
> +
> +	aliases {
> +		mmc0 = &sdhci;
> +		mmc1 = &sdmmc;
> +	};

I would have assumed this is the kind of information you want to store 
in the SoM DTSI instead?

> +
> +	leds: leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&led_green_pin>;
> +
> +		green_led: green-led {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	leds {
> +		led_green_pin: led-green-pin {
> +			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency = <200000000>;

As far as I could tell, this is already the max frequency in rk3576.dtsi 
so no need to define it once again?

> +	no-sdio;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3_s3>;
> +	vqmmc-supply = <&vccio_sd_s0>;

If some of those are well-defined and "forced" by the HW design and pins 
exposed on the connectors of the module, you could move them to the SoM 
DTSI instead, to avoid having to specify them for each motherboard using 
the sdmmc controller?

Cheers,
Quentin
