Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A813C1F;
	Sat,  3 May 2025 00:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746231231; cv=fail; b=aIzGwNqskQLWVy03moCLT2wDaju509VmI6+M1wj2GgRuOAbf17+ugiu8HIwi4RMwSFzck+aFaP68535AgL8p/qq85yKaU5okMVWhNOfOYKtgFUmROyf/3Vnjqyf0qzUPkV6swdfUtj2OdPucBIxzmpux4uatqI+4MOtzMC4Z1yQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746231231; c=relaxed/simple;
	bh=0J8Q4QhupwCj751FCDFkY2VO+o6MfXc8ZnW0F8F8z3I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jpgdnwxncRyZC/l9g/vRc8p44Eknu7xntv9FEcwgmYZTvgabJobtGzCwr4H2VQPEWPFDrRPBJQZapn6oDC58lPHfGL11CdYI2Qhq+UozTdS+8hG+9R0gU8oGiW+xov4rTY5YwsA34erCxgl5KUJGOx4keSFZWKuE/LkpMWrQij0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tNKA8lp4; arc=fail smtp.client-ip=40.107.220.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tNKA8lp4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTlxN2qc5g7oOVx+OX7qx7VSFFW/G4tG+OYwPMt/CzdPLPBrXTV4mH0/Zp6ZEaDDOLyIBiC7OqdZimB14i4KPq0ZbhGRGMokDR9mZNUkHgDCRTtRx0FKdnyh4OJFIFoXoleO13KHf1ieO5qs90c17yothGm/y4nTLoaFHjJk2/W7G534bTlhJEaYR67CCM3QEE8ZZabJlwstBdmcx3IOSTPANaHBptSc8NYE4bOhEPl1p2u8WyYmzVpgtP1grUSOs0zRBc76jTb2D3nuxTRamrW2H0v8hIEFCX4DGJeiUsEnnXw7M1Ro7UxDVNlpGQotiNznN60l/Z9GhQLFgDqbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Larz2GMLXjf+4pjdqjdTlLULuMNQ9AlmvJXtNOax8Ns=;
 b=IO0+FF3isUBDgzXvXQ0tf58BmHd+yBSute6EKiJy329zSsD6aalbPaDCFNNp4zf8SI70JeK5Y9WoNmowshO1okBqfw2o/u6BP7Wy/2wgJBBdZ3I/bl3LY3k6HPQl90La98k6FIfJtzosoNAm/tEdGyWFTgOqSYyhPuZShUknU6rasBnBEoPCUG3xVeUgiGN09pLib5MfU6x+Ari1/CeXeY8Ua1WOng7LmxQoWc1OBI5StTjweAqp4HXGjyx665VYBRh9b/tcQaPmAJJvcAS8BTkcYGBoEeEZDBUPvRjp24XtvhcVdMTGRuA8C5UFu/Tg5ktJNhsCrgJlwAaT3McH8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Larz2GMLXjf+4pjdqjdTlLULuMNQ9AlmvJXtNOax8Ns=;
 b=tNKA8lp4UpfX5WP8/QUl32UbPqReP3ehNn44TGpFaRp/f9XXfnwVep4CfryMiZooMJE5gBuARvVZHE3GYzBw9GwHTV4BnN/Z+Ay+cZyF+E2Y2fH+B400XU06K7hmCqSlCeW9reamnSprF8Hvjj+sOR0aatDa7D8MkiBhJmoLS24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CH3PR12MB9284.namprd12.prod.outlook.com (2603:10b6:610:1c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 00:13:47 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8678.028; Sat, 3 May 2025
 00:13:47 +0000
Message-ID: <9d064273-a627-4d28-901c-caed6837f9cc@amd.com>
Date: Fri, 2 May 2025 20:13:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: Armin Wolf <W_Armin@gmx.de>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, mario.limonciello@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250502184736.2507703-1-pratap.nirujogi@amd.com>
 <f2909e89-fcc1-467d-a2a5-ea8942b755c4@gmx.de>
 <dc625df0-7053-42c9-b79a-0cfaffc9392c@amd.com>
 <d9b24a50-f92b-4653-98c7-28ed5c5dad46@gmx.de>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <d9b24a50-f92b-4653-98c7-28ed5c5dad46@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::20) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|CH3PR12MB9284:EE_
X-MS-Office365-Filtering-Correlation-Id: 844a274b-2ec5-4d0e-f9f7-08dd89d75fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3BXdmJVU2lGdVJYakZ0a1JtcTdQV0hOYXo0bnRjYXNtMkszeGJMSVZGWHZV?=
 =?utf-8?B?T1JoQjRoL3V6UnFIVy9KSk00d2ozU2c3eHcwTUNicEZ1ckFEbHFzNGNYbkFW?=
 =?utf-8?B?akZnR3BYQU1GT3laL3p3cGxTcVJhYzhnY3B2NXhHUUxpTjMyVFk4eDYySkF6?=
 =?utf-8?B?TkMwNlpmTDQ5Q0ZLWHFTeVM5d01FV3lZTnBrQ0ZlVmtCeFJUR0I5Tm8yejFI?=
 =?utf-8?B?YjFYMGxnUnJ3SU5GZVJ0K3czOGMzSW1iTkcwa1h3MWVHSmV5UWsvQnk3V1oz?=
 =?utf-8?B?LzI0d1U2WEIrRi9JdFNjOXg4MXRpVjNHZ0ordytUMnRGMjNqb0g3OFFIVmZJ?=
 =?utf-8?B?L0xUZkdvaUlPZzI1a2NzZ3IrdXhJaGFQUHhyZTZZNW13UXBHL25JYlE4c2xE?=
 =?utf-8?B?ZGdBS0RGVm9Ua1JpQUprQmFiTjFtN3FXeWdvQzRjYjZKNTZ4V0g0d2wrTTJu?=
 =?utf-8?B?b0E3ZmZxbDJQTGxyWXdUSGtvVHhuSTJSVjZiREVzZDltM3lwKzFDejk2RHJh?=
 =?utf-8?B?QlBRMUV2MHBsUFlDaFRmK2JzVFQySG4wOUtHUDYrUVFESXBMSXNBRzR2SDlw?=
 =?utf-8?B?VEtBVUs0bnJjcE1vcUJtVWphaWFjVDJxUzRKR0VhWTFhcFpiMUs3cFRTa0RN?=
 =?utf-8?B?enB6ZmZJMlR0Zm1uaFRac01NeHk0OVp4ZHN5YjZrTXlUOWppT1RxY2lrdzZr?=
 =?utf-8?B?a3dXei9LbVhuWVpXUzdBTXpsRWpVU0g0K01peGg2T2hRRHVrRVpjQldwZldT?=
 =?utf-8?B?Mndsd20vZnlUcytNcUlKRUt3Z1lxSmpoQUFvK1lDWkx3aUFQQit1RDFxWFhp?=
 =?utf-8?B?OG9ldE1selVONXc4dmREREpzSytKUU5yZ29Vek5ETXliQ3lOeFU3N1ZVVWc0?=
 =?utf-8?B?TWZpZHU3N1FTMkFjV1YwdG5rUzF6VVFPbE9CQm9hSFhScGQwM3BCWGhaakRp?=
 =?utf-8?B?QkxMVG1BcWlQNWEzcWxTSXhtS3hBaklGdTdBWlJZakNjcE81L1dpSllLWVZ4?=
 =?utf-8?B?OG5YZzBQdFM4SlpTbXRPZmQ3U1U2cVlYWGQ4QWxXbHdFbWNUYkFwaTNiSm5M?=
 =?utf-8?B?ekdEMEhGV1RFaEJGY3JJUHlGZ3ZCZHFoRis1eE42UEgvZVhCL0ZrQ2NWQXJs?=
 =?utf-8?B?YThYNC9UMmFETEtVb0N4TC9QOEdUQzBjMThnQUxyRzRHQ0lVcTZDTzdnMk5D?=
 =?utf-8?B?OFQxRjQrRUhPM2xWQ0RFM1VYSmdDTjE0a0RrenZySHIyaUJQSEtCN2VjV1hm?=
 =?utf-8?B?ZXV6K2U4ak9abnd0WHBhUWN2RllleEhTbFBlcGhzc05TMWk1c1hjYThhdXA5?=
 =?utf-8?B?Ykh1NXVjYnM4NVVPWFpaMFA2WUJtYlVlQkJoVzkxdyt3WUx6QXUrT2MzdnFS?=
 =?utf-8?B?NFlzOEI4eUJSVFlqWVNjdENtWU52Z0dZSUg2dVc4Sk0vMFRnQ2ZBQ2JuUVVM?=
 =?utf-8?B?NjA2SlRzVDNSamZHZXh5WHVQMmhrVUN5TTJWR3R2NTVnY3BORUxPV2hxL0hV?=
 =?utf-8?B?SXdqY1luSkE5TW5RSnhrTEdjVHdwY0M3a2FNK0VNL28wN3RKZjcveFE4Z1d4?=
 =?utf-8?B?c1ljMFZIS1pscVFERVFxUDV0WlBVeWZIRi9ub2VJK09QT21UaEc0QlhXRFpS?=
 =?utf-8?B?cThySFI2Q0p4YUNXSDBBcmE4M00zeVNJYUhRYmJON0tlS245ZVBTcFFMNEVE?=
 =?utf-8?B?WHp2SUUzS0IxQ0I3KzRuWkRqSmxKUjNTRkpUS3N0aGg1Z0toc0hQMTVmQXlV?=
 =?utf-8?B?WklMd0grTkdaRHJOMUZpWUZRbVFwZUJrZm8zUnJnY2U4K0JGd0g3RmZyMUht?=
 =?utf-8?B?bHhPcmdPYmtaS0xxbDlLYUVSdzlpNkRIN2RDbUxCa0s5NXdCaWdPQXNEODJr?=
 =?utf-8?B?aGZvb0tEQytBM285Wit3SEdYZ1J3OE82aWFhUjZiMVlnVzdsZ05GdjJhVC9T?=
 =?utf-8?Q?8GEPlHdz1M0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzVLV1R5ME1lQUp0VUR1em1Bc3Y4R2MySS8wUW1kQ3JzUjg2aUE4UWs4ejJk?=
 =?utf-8?B?UXlRVGNKQlZNS1JVK1cwZHZOOE5jQ0ZpbENKOVN3TksrWUd2T2UyZTAxaTJs?=
 =?utf-8?B?UWt6bFBQc2Fmbk5UUENWKzdQYUhzb3o4bWkwNmkyOTkxSytPTHAxRENzZ1dy?=
 =?utf-8?B?YWRlUzdkT29rRS9aM2lsUkN6ZzM2TllZOUlYVmNBL09hU01rSURpRXh5ZTdH?=
 =?utf-8?B?YTh4THFrZXZ2OElEdHd1U1hHaUFNRDhYSnRJUjVHcEVXYTUxcDczVTRhV1Er?=
 =?utf-8?B?VGJpMS9QQUgwdzhLamtXU0M2R3NEY0dkaHBRVEczUjQ1dnNrMmxpSlJiZDNM?=
 =?utf-8?B?RWVxZDZJeTlmVVIvcTdpS0EwclRrUDFqeXZid2NHVTh0MUJRM3orRVNDRjNu?=
 =?utf-8?B?dHNPSDJoWlI1S05VMUNka3l2eS9QK21VMGxGTVdxUXR5ZGxOQzlzM2kyeEw4?=
 =?utf-8?B?U2JFcXkzVUpSSkFkQzA2SG82c3ZNSDZNTk5vSkxsUFpWSE1LODJETCtOb01z?=
 =?utf-8?B?NHdud0ZFSHNacGpxVUhHY2N6NTB2MGhyOUgvVy9FbjlNRmlhTUk0UnNJMENL?=
 =?utf-8?B?OWdIR0ZmZEdxQS9HZ3N2WXVDVHp6UXZkZStZeGJBb1lMeWI5Y1loTmc3aEtT?=
 =?utf-8?B?NFcvb1ZlaDBpQm53elFnOThwN2VVeFNTVjlRTUpwd3ZZOVhvZEw5ZVRkY3ZQ?=
 =?utf-8?B?aEl0TzcrQUorbGUxUXRlWGx6dDZYUnZEUTdHbWFiZmlzQ21YRlQwaUptMUN3?=
 =?utf-8?B?UGNRTWk1aUpoekNDN2xJUm5EZUFTZXR4QVFmTUpaaEJ0VFVSdVhPWDR0Rzdz?=
 =?utf-8?B?RC95cC9KdzVDeGJmUTdKS2pHNVlOcnlSVFQzN2lZdWZoa2FOSlluVjRYN0ht?=
 =?utf-8?B?UVBDUmZneFlPcDE3dVg3NUs5dzArR0NlNnFyL05TY01HMXY4ZTZ4dWNsRkpP?=
 =?utf-8?B?Y0kzcVI0cmRCUUplaExrZVJlWDBpSWFsTnMvUnB5Q2JoWXptUGRvZUFwQ3N2?=
 =?utf-8?B?amo3S1pWTlppTjlhWFVCd1J1TUsrTDJGRERROEZIb2ovb1dvcjlyYS9sOGVy?=
 =?utf-8?B?MnZpQ2J6aDlGRURzS1lDbjBtVkhYbXdUZEM4dUNVUFF2Yk5NTWJjbTlJQ3Nk?=
 =?utf-8?B?aUxxcmk2RG1CbXE5RTloNnBaUmQrekdwTUJJZlBPcWtNTzE2SWNTS2FSMlIz?=
 =?utf-8?B?RFZwR01DM3pCQUtzWTJVVWw0K2s1ZEpoZmlCWG1wbHdmUzZnSDRMeE5BTlhu?=
 =?utf-8?B?b0dKT2lJMkZHNTM5UHdhdFlLWnIzWHdmU0NFVDR5T2ZDclo5SzNGN0pkOHZT?=
 =?utf-8?B?bUVSVTR6Q0JLYkNjOCtXUk5qNUZEclVVZWpwRnczMDc4YzZEQmluMmsxbE03?=
 =?utf-8?B?cWtCTXBERkw3YU5ndHoxMUNtNThmUnVjK3hBOWtoN3JBVnNwSmFvNEZSWDZR?=
 =?utf-8?B?ckFWRUFzeGNGQlpGanRXdk9XeEtuNTdXeWxUUzJjYklmblZ5WU1iNjdNYThy?=
 =?utf-8?B?T3VtUjRXYTFGMFZqS3N6VEVuUE1tSzhCb0RoWWlaVE8yL0UxdnU4SkprVkti?=
 =?utf-8?B?OGpDRUpITktTTFJMQXNLOUp4aGdNS2piaWVXWmRwMVRhQ0NhTTc1TWNQS21U?=
 =?utf-8?B?Qmdzd0lnbnRpTS9vRWJKTGQ5SFhNeW1LZmJQMUhDUzU1NUp2TmJHLzRpd25D?=
 =?utf-8?B?aHd5UWZ6cExLeHNpTEJsOXM2aFBjempyQUZiMUpEOTI1RDVtZ2NTMEZySXUr?=
 =?utf-8?B?QXRGRHV2YmxhMTJvbnR1TExmaDQxaGRUcXBSNlJQckE1dTZJUVY5R0hacEpi?=
 =?utf-8?B?SHRQY0wwb1djeWNmMGlQcE4xS05PZHk5L3d4UUVERk0vWktteml0Y1VHcE16?=
 =?utf-8?B?WVE2SnRkR084dE9FRDZ3VlhSWnVEOHZMMklyWTEzVFZKT3Y2dWJ4U3VVSjRr?=
 =?utf-8?B?UC8zU3VNc0NCb2JqZEhKNlNpaDJqQSt1OGpDTWViSHI0emtXUE5hdEFzZ1l0?=
 =?utf-8?B?dGZFUEhOSFh2cHR0cE9Mb0xDK2lZamwyYndERm9uUDFlTUpSSWIrNWpxbHo1?=
 =?utf-8?B?RGcyUWR1Y1hyTUFVKzZlZlZrcUI4MUQ5VDlrTklrQmNFV1VmZXkyc0lKc096?=
 =?utf-8?Q?3dPOLrrSDeDsMIe0O0ldC2vS1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844a274b-2ec5-4d0e-f9f7-08dd89d75fb0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 00:13:47.5146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyVud56/ZVOaGI6Unuu1sebIxqZ/EYoyu03Codzy4+yICNPaJ4NpIk3a2eOcC/iOUVfij+Kz+tQGpwyG1f9VMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9284

Hi Armin,

On 5/2/2025 6:31 PM, Armin Wolf wrote:
> Caution: This message originated from an External Source. Use proper 
> caution when opening attachments, clicking links, or responding.
> 
> 
>> Hi Armin,
>>
>> On 5/2/2025 5:14 PM, Armin Wolf wrote:
>>> Caution: This message originated from an External Source. Use proper
>>> caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> Am 02.05.25 um 20:46 schrieb Pratap Nirujogi:
>>>
>>>> ISP device specific configuration is not available in ACPI. Add
>>>> swnode graph to configure the missing device properties for the
>>>> OV05C10 camera device supported on amdisp platform.
>>>>
>>>> Add support to create i2c-client dynamically when amdisp i2c
>>>> adapter is available.
>>>>
>>>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>>>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>>>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>>> Changes v8 -> v9:
>>>>
>>>> * Add mutex protection in instantiate_isp_i2c_client()
>>>>
>>>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>>>   drivers/platform/x86/amd/Makefile   |   1 +
>>>>   drivers/platform/x86/amd/amd_isp4.c | 283
>>>> ++++++++++++++++++++++++++++
>>>>   3 files changed, 295 insertions(+)
>>>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>>>
>>>> diff --git a/drivers/platform/x86/amd/Kconfig
>>>> b/drivers/platform/x86/ amd/Kconfig
>>>> index c3e086ea64fc..152a68a470e8 100644
>>>> --- a/drivers/platform/x86/amd/Kconfig
>>>> +++ b/drivers/platform/x86/amd/Kconfig
>>>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>>>
>>>>         This mechanism will only be activated on platforms that
>>>> advertise a
>>>>         need for it.
>>>> +
>>>> +config AMD_ISP_PLATFORM
>>>> +     tristate "AMD ISP4 platform driver"
>>>> +     depends on I2C && X86_64 && ACPI
>>>> +     help
>>>> +       Platform driver for AMD platforms containing image signal
>>>> processor
>>>> +       gen 4. Provides camera sensor module board information to allow
>>>> +       sensor and V4L drivers to work properly.
>>>> +
>>>> +       This driver can also be built as a module.  If so, the module
>>>> +       will be called amd_isp4.
>>>> diff --git a/drivers/platform/x86/amd/Makefile
>>>> b/drivers/platform/x86/ amd/Makefile
>>>> index c6c40bdcbded..b0e284b5d497 100644
>>>> --- a/drivers/platform/x86/amd/Makefile
>>>> +++ b/drivers/platform/x86/amd/Makefile
>>>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>>>   obj-$(CONFIG_AMD_HSMP)              += hsmp/
>>>>   obj-$(CONFIG_AMD_PMF)               += pmf/
>>>>   obj-$(CONFIG_AMD_WBRF)              += wbrf.o
>>>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>>>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/
>>>> x86/amd/amd_isp4.c
>>>> new file mode 100644
>>>> index 000000000000..312a92f60dcc
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>>>> @@ -0,0 +1,283 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * AMD ISP platform driver for sensor i2-client instantiation
>>>> + *
>>>> + * Copyright 2025 Advanced Micro Devices, Inc.
>>>> + */
>>>> +
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/property.h>
>>>> +#include <linux/units.h>
>>>> +
>>>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>>>> +#define AMDISP_OV05C10_PLAT_NAME "amdisp_ov05c10_platform"
>>>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>>>> +#define AMDISP_OV05C10_REMOTE_EP_NAME "ov05c10_isp_4_1_1"
>>>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>>>> +
>>>> +/*
>>>> + * AMD ISP platform definition to configure the device properties
>>>> + * missing in the ACPI table.
>>>> + */
>>>> +struct amdisp_platform {
>>>> +     struct i2c_board_info board_info;
>>>> +     struct notifier_block i2c_nb;
>>>> +     struct i2c_client *i2c_dev;
>>>> +     struct mutex lock; /* protects i2c client creation */
>>>> +};
>>>> +
>>>> +/* Top-level OV05C10 camera node property table */
>>>> +static const struct property_entry ov05c10_camera_props[] = {
>>>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>>>> +     { }
>>>> +};
>>>> +
>>>> +/* Root AMD ISP OV05C10 camera node definition */
>>>> +static const struct software_node camera_node = {
>>>> +     .name = AMDISP_OV05C10_HID,
>>>> +     .properties = ov05c10_camera_props,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>>>> + * ports node for OV05C10.
>>>> + */
>>>> +static const struct software_node ports = {
>>>> +     .name = "ports",
>>>> +     .parent = &camera_node,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>>>> + * port node for OV05C10.
>>>> + */
>>>> +static const struct software_node port_node = {
>>>> +     .name = "port@",
>>>> +     .parent = &ports,
>>>> +};
>>>> +
>>>> +/*
>>>> + * Remote endpoint AMD ISP node definition. No properties defined for
>>>> + * remote endpoint node for OV05C10.
>>>> + */
>>>> +static const struct software_node remote_ep_isp_node = {
>>>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>>>> +};
>>>> +
>>>> +/*
>>>> + * Remote endpoint reference for isp node included in the
>>>> + * OV05C10 endpoint.
>>>> + */
>>>> +static const struct software_node_ref_args ov05c10_refs[] = {
>>>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>>>> +};
>>>> +
>>>> +/* OV05C supports one single link frequency */
>>>> +static const u64 ov05c10_link_freqs[] = {
>>>> +     925 * HZ_PER_MHZ,
>>>> +};
>>>> +
>>>> +/* OV05C supports only 2-lane configuration */
>>>> +static const u32 ov05c10_data_lanes[] = {
>>>> +     1,
>>>> +     2,
>>>> +};
>>>> +
>>>> +/* OV05C10 endpoint node properties table */
>>>> +static const struct property_entry ov05c10_endpoint_props[] = {
>>>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>>>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>>>> + ARRAY_SIZE(ov05c10_data_lanes)),
>>>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies",
>>>> ov05c10_link_freqs,
>>>> + ARRAY_SIZE(ov05c10_link_freqs)),
>>>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>>>> +     { }
>>>> +};
>>>> +
>>>> +/* AMD ISP endpoint node definition */
>>>> +static const struct software_node endpoint_node = {
>>>> +     .name = "endpoint",
>>>> +     .parent = &port_node,
>>>> +     .properties = ov05c10_endpoint_props,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>>>> + * fixed to align with the structure that v4l2 expects for successful
>>>> + * endpoint fwnode parsing.
>>>> + *
>>>> + * It is only the node property_entries that will vary for each
>>>> platform
>>>> + * supporting different sensor modules.
>>>> + */
>>>> +#define NUM_SW_NODES 5
>>>> +
>>>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>>>> +     &camera_node,
>>>> +     &ports,
>>>> +     &port_node,
>>>> +     &endpoint_node,
>>>> +     &remote_ep_isp_node,
>>>> +     NULL
>>>> +};
>>>> +
>>>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>>>> +     { AMDISP_OV05C10_HID },
>>>> +     { }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>>>> +
>>>> +static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>>>> +{
>>>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>>>> +}
>>>> +
>>>> +static void instantiate_isp_i2c_client(struct amdisp_platform
>>>> *ov05c10, struct i2c_adapter *adap)
>>>> +{
>>>> +     struct i2c_board_info *info = &ov05c10->board_info;
>>>> +     struct i2c_client *i2c_dev;
>>>> +
>>>> +     if (ov05c10->i2c_dev)
>>>> +             return;
>>>> +
>>>> +     if (!info->addr) {
>>>> +             dev_err(&adap->dev, "invalid i2c_addr 0x%x
>>>> detected\n", info->addr);
>>>
>>> I just noticed: could it be that info->addr is static? In this case
>>> this check would be pointless.
>>>
>> I agree this check is not important. I will remove it.
>>
>> Instead of moving i2c_board_info variable outside 'struct
>> amdisp_platform' to make it static, I think the existing definition is
>> still valid to use. Its because 'struct amdisp_platform' variable is
>> passed to notifier_call and i2c_for_each_dev() only after it is
>> initialized with valid params in prepare_amdisp_platform().
>>
>> Should I keep the 'struct amdisp_platform' definition as it is and
>> only remove the check? Please let me know your opinion.
> 
> Please just remove this check.
> 
thanks for confirming, will remove this and submit v10 addressig the 
comments shortly.

Thanks,
Pratap

> Thanks,
> Armin Wolf
> 
>>
>>
>>>> +             return;
>>>> +     }
>>>> +
>>>> +     guard(mutex)(&ov05c10->lock);
>>>
>>> You need to guard the check of ov05c10->i2c_dev too since another
>>> thread might already have assigned i2c_dev
>>> after you checked it. In this case you would leak the first value
>>> assigned to i2c_dev.
>>>
>>> Please move the guard above the check.
>>>
>> thanks, will move guard above ov05c10->i2c_dev check.
>>
>>>> +
>>>> +     i2c_dev = i2c_new_client_device(adap, info);
>>>> +     if (IS_ERR(i2c_dev)) {
>>>> +             dev_err(&adap->dev, "error %pe registering isp
>>>> i2c_client\n", i2c_dev);
>>>> +             return;
>>>> +     }
>>>> +     ov05c10->i2c_dev = i2c_dev;
>>>> +}
>>>> +
>>>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>>>> +                           unsigned long action, void *data)
>>>> +{
>>>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct
>>>> amdisp_platform, i2c_nb);
>>>> +     struct device *dev = data;
>>>> +     struct i2c_client *client;
>>>> +     struct i2c_adapter *adap;
>>>> +
>>>> +     switch (action) {
>>>> +     case BUS_NOTIFY_ADD_DEVICE:
>>>> +             adap = i2c_verify_adapter(dev);
>>>> +             if (!adap)
>>>> +                     break;
>>>> +             if (is_isp_i2c_adapter(adap))
>>>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>>>> +             break;
>>>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>>>> +             client = i2c_verify_client(dev);
>>>> +             if (!client)
>>>> +                     break;
>>>> +             if (ov05c10->i2c_dev == client) {
>>>> +                     dev_dbg(&client->adapter->dev, "amdisp
>>>> i2c_client removed\n");
>>>> +                     ov05c10->i2c_dev = NULL;
>>>
>>> You need to guard that too, including the check.
>>>
>> thanks, will place guard before ov05c10->i2c_dev usage.
>>
>>>> +             }
>>>> +             break;
>>>> +     default:
>>>> +             break;
>>>> +     }
>>>> +
>>>> +     return NOTIFY_DONE;
>>>> +}
>>>> +
>>>> +static struct amdisp_platform *prepare_amdisp_platform(struct
>>>> device *dev)
>>>> +{
>>>> +     struct amdisp_platform *isp_ov05c10;
>>>> +     int ret;
>>>> +
>>>> +     isp_ov05c10 = devm_kzalloc(dev, sizeof(*isp_ov05c10),
>>>> GFP_KERNEL);
>>>> +     if (!isp_ov05c10)
>>>> +             return ERR_PTR(-ENOMEM);
>>>> +
>>>> +     mutex_init(&isp_ov05c10->lock);
>>>
>>> Please use devm_mutex_init().
>>>
>> thanks, will switch to devm_mutex_init() and remove the mutex_destroy
>> calls.
>>
>> Thanks,
>> Pratap
>>
>>> Thanks,
>>> Armin Wolf
>>>
>>>> + isp_ov05c10->board_info.dev_name = "ov05c10";
>>>> +     strscpy(isp_ov05c10->board_info.type, "ov05c10", I2C_NAME_SIZE);
>>>> +     isp_ov05c10->board_info.addr = AMDISP_OV05C10_I2C_ADDR;
>>>> +
>>>> +     ret = software_node_register_node_group(ov05c10_nodes);
>>>> +     if (ret) {
>>>> +             mutex_destroy(&isp_ov05c10->lock);
>>>> +             return ERR_PTR(ret);
>>>> +     }
>>>> +
>>>> +     isp_ov05c10->board_info.swnode = ov05c10_nodes[0];
>>>> +
>>>> +     return isp_ov05c10;
>>>> +}
>>>> +
>>>> +static int try_to_instantiate_i2c_client(struct device *dev, void
>>>> *data)
>>>> +{
>>>> +     struct amdisp_platform *ov05c10 = (struct amdisp_platform *)data;
>>>> +     struct i2c_adapter *adap = i2c_verify_adapter(dev);
>>>> +
>>>> +     if (!ov05c10 || !adap)
>>>> +             return 0;
>>>> +     if (!adap->owner)
>>>> +             return 0;
>>>> +
>>>> +     if (is_isp_i2c_adapter(adap))
>>>> +             instantiate_isp_i2c_client(ov05c10, adap);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int amd_isp_probe(struct platform_device *pdev)
>>>> +{
>>>> +     struct amdisp_platform *ov05c10;
>>>> +     int ret;
>>>> +
>>>> +     ov05c10 = prepare_amdisp_platform(&pdev->dev);
>>>> +     if (IS_ERR(ov05c10))
>>>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>>>> +                                  "failed to prepare AMD ISP
>>>> platform fwnode\n");
>>>> +
>>>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>>>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>>>> +     if (ret)
>>>> +             goto error_unregister_sw_node;
>>>> +
>>>> +     /* check if adapter is already registered and create i2c
>>>> client instance */
>>>> +     i2c_for_each_dev((void *)ov05c10, try_to_instantiate_i2c_client);
>>>> +
>>>> +     platform_set_drvdata(pdev, ov05c10);
>>>> +     return 0;
>>>> +
>>>> +error_unregister_sw_node:
>>>> +     software_node_unregister_node_group(ov05c10_nodes);
>>>> +     mutex_destroy(&ov05c10->lock);
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static void amd_isp_remove(struct platform_device *pdev)
>>>> +{
>>>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>>>> +
>>>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>>>> +     i2c_unregister_device(ov05c10->i2c_dev);
>>>> +     software_node_unregister_node_group(ov05c10_nodes);
>>>> +     mutex_destroy(&ov05c10->lock);
>>>> +}
>>>> +
>>>> +static struct platform_driver amd_isp_platform_driver = {
>>>> +     .driver = {
>>>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>>>> +             .acpi_match_table       = amdisp_sensor_ids,
>>>> +     },
>>>> +     .probe  = amd_isp_probe,
>>>> +     .remove = amd_isp_remove,
>>>> +};
>>>> +
>>>> +module_platform_driver(amd_isp_platform_driver);
>>>> +
>>>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>>>> +MODULE_LICENSE("GPL");
>>

