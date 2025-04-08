Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2114.outbound.protection.outlook.com [40.107.117.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90101E8348;
	Tue,  8 Apr 2025 19:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138878; cv=fail; b=PaxnY4iWAN3fqsNeavBswsfq7mHr6PG5umzv5YakuS1tMTDd6mbE55/afos3K1z12bVXTcwTlepuBI55JJiOkOiumvbZYPKFRxL4ysmFCA/SibOZbUOP+IvqqgkX1EblFxzDppnngwB0cTlEyV+0ddBz7KE6YMrbtFSZrR7FbcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138878; c=relaxed/simple;
	bh=+b+XeG2LRTRz8pKxg0jny8vZIDUfDvC1zqtOfmWfom0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jwIKtQSsTftarraDBoi3Cy4kGiwmJxIKblEXBfD/UeMNKjIoYezI/nXjxTsPvapsOcPVWW/aMnxUafYoVAB00I+vHgNtPyCl88RY2Jk4mxeYrwGlCpMU8pECBVjeL0DdlzE1RlfmsLdQZV9DH5F4/FA6uawsDkTqhEE4c/hMjyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=IS1fu+ZG; arc=fail smtp.client-ip=40.107.117.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="IS1fu+ZG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLvCeaZ6Dtso5+cM0LumDnMMo1sIKRer3p70wdpYMKs9ukQ3FfydrTQ+E9LJOwOlJHtre0WNk4uPVgWq5TGAmI2oM+aV6+goW/thAn5CXifLdOOvCXMxtyKwIWgTdSkQgI9uC2tpLNyKRwdPeo4Px3v+9jrAPL+9ndx3gYtlWQvNyhzpK2nP2s3iSzZxiq2ic47F9cP5AR6R3HJORbAEpMHs172D60dlyPMAc8ptUGc+6QYl+Tgb68mdfNHX88yLQwz92KsrgCp31kgBtHuT8/8u4DknL5YGm2Pjiq85YnKP/sdAw49gFaJ3Rfz5np7YLYR3Vs95xfuc4IsQgUnSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs+msx6foQoBZiamI6ANJogkebDcLUHfpUX36Mzz20Q=;
 b=s2pOdjAnwg3kHi0Ue0XBSZTlDZ661SZ338oankZBT/8lGt2XMps4cmiCP8RSJb5Vze++OGuooNHNJTnv6wZbmlxn6Y93QUjmbVUfoZnby1YZWZDW3G9blKCp9YaHImK3wvYAFXe5oMSztVaTerIxkfaPDi42+IxpVR1xDBnAgcKhg4GWE9CFNMWokdikJwbFq4tdGo2EAuiv4c6bk/bxv7JO5Eiq7e4QrAyn0XfkEG8yMxuY4uV2evZAoljEig1YWfC4AeCajoLPMmNSkwGtzvuiDclHJReTVBlt+UXl676rmRgO+eKO+Em0I1rQ3+1hptMdZkQI3LdaWlkUTPv/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs+msx6foQoBZiamI6ANJogkebDcLUHfpUX36Mzz20Q=;
 b=IS1fu+ZGqymZeaJWVmJTTOZgRXINrLbQmf8uMaswKS+gPcmgoiW0rBSOQNRW2PYV/szUyLoQi162MhQOMdrPMtOlJoUneKotZTKeuIQFDWm+Nnssd4hfX3Ef4KBsfMJiUQbXX+SuSko4AKg8BNEVqI/KtMiT2T7AKZllYICqC8/y72dy5E13gx0ifPzvayxwrtDyCHi5re1kQFATHdHTNoPadKB3OK7Np2CtnviV9iRLhfX1DwLuVeNjvmQOq63jSHWsCESi30KkSi+vWajzTs2pm1zhBFd2C7mnO/6Wwd1VFqpvZlftPrapijgwEDZW/HovPK1fe9ap2iYbiUcwwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SEZPR06MB5478.apcprd06.prod.outlook.com (2603:1096:101:a1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Tue, 8 Apr
 2025 19:01:10 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 19:01:10 +0000
Message-ID: <b326ed0d-0917-4361-8093-abc9afc65533@portwell.com.tw>
Date: Wed, 9 Apr 2025 03:01:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, jay.chen@canonical.com
References: <3ec9d070-2d2a-45ff-af78-923ff1628c08@portwell.com.tw>
 <ae9e7c27-e5b0-b431-2811-c5d8d3549e43@linux.intel.com>
From: jesse huang <jesse.huang@portwell.com.tw>
In-Reply-To: <ae9e7c27-e5b0-b431-2811-c5d8d3549e43@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0048.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::19) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SEZPR06MB5478:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c82b368-f597-4062-9e18-08dd76cfb95f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3k0amQ0L2FIbXhiV1M3WktSbzdISVFrcXlHSzNQY2t6UVVwN2Q0TndkU3Rh?=
 =?utf-8?B?WkxCNExUY01RUjdGRU5lQnl2M0RzN01OcjVOeldaYnhNbmpzcTl5YzU4Vk5t?=
 =?utf-8?B?Qm9jWmdxUU1HcDBZY2RQR1BzY3pQWHhyS2MrbktkMThIVnZidFdSSzY2V1Jy?=
 =?utf-8?B?SVF4NnlHNTArSTBucWRPckJTU2x5MmxPUWtjL2ljRW94WVhVdUYwNU9rSEZa?=
 =?utf-8?B?S2VNMDRuV3pDUDZmdzQyVzRhdm9lRzFzR1RxQ1VDdmhUU1RNL1p5Z09nM1hn?=
 =?utf-8?B?REZWL2loZFdxQVpOSm41UWxBWXRYbDd5N2s4YnRGV1RWQkJiKzVTOHFWK0Qr?=
 =?utf-8?B?VXVSMVFLdjlyVjlTckg4UkZhVHp2K25vTlBsT1k3SW1sSWwzM3hwWWFqTWU5?=
 =?utf-8?B?WlQ2NS9CTzdPbk5DV1paVEh5cmNua25xbzFMVCtYWXlwZzNBWXJJQXA3dXlz?=
 =?utf-8?B?dG41STlQNi9YOWZJNVQ4ZDJlV0N6ajBRanJFYmhQMDlXcGRDRk5WSnFEb2tQ?=
 =?utf-8?B?SG92UC9RbFV2alhtaXp5TVpGZFN3bHFlUnJyQkJwbmhFenBVVXZwV0xSc2Uw?=
 =?utf-8?B?SWp3dmw0NkZFa0diR2t1VXU5aHI4UlZ4K1NxSk9HL0J5aU9OWTNKVGx2dnh4?=
 =?utf-8?B?UFduWXZnV0tiYlJrb3lZOEFVeC9ocnhvMDdBRU9sazQ0bXhkY0twUnVya1lx?=
 =?utf-8?B?L3VranlmMGNmakk3dXN2OHNrZFQ2RTJYQ3BqaGNlTWVmejBaOWlBVkhIN3Jp?=
 =?utf-8?B?bVdyak9sR21mQkREZjNHcUtpTmVrbDZXTEduOEhRNElFeDcrVVMxOGFXS3Bu?=
 =?utf-8?B?V0cwQ0hHVjlDeUwwYU9xNG81OVZzamdzRGZrdHhVcVA2UmZyKzkvc1ZBSTZS?=
 =?utf-8?B?OEpjNlBmY3B3UmRwOXYrRm8zSVU4V2M2LzUxbk93Vm53ZzFzMzdsSlE5Z29Z?=
 =?utf-8?B?QTcrS04vVUQzaEd5WTVxb21waFlMK1FWblVxWVZoNmpiMWwvN1NPRGFLaUdJ?=
 =?utf-8?B?WE1KUDhaWmVpQ2pUZ2N1TEREVE1WZ25oRUV0ZVFld0dzRStRYVRWY3lSUmFv?=
 =?utf-8?B?NFVyeEZjNVkzRUplN25NcjVNQUo5T1VXWHo4YkMwUmU2R0FxOTJnQngzd1Fn?=
 =?utf-8?B?ZHY0bUo2SURLMWpYRFhvM2E1V0txK0V5SWdlWElGYXRJZG94TEQxWDYwalMy?=
 =?utf-8?B?Sk9iQ0J4bHYzQysrT1NqN29nSE44WVU1UkNRMit5aWJzUGNMZytid0FDMHJo?=
 =?utf-8?B?QU5Bc1VKWXdEMm9lNGVNVUtUSWlaeEsyTTIvL0NaTzdWQUhheEFKc2VHa09P?=
 =?utf-8?B?U1grTW1wZCs2TkFUc0ovSTVWQVdRZ1A5OVFjRnFyYnJzc250RVhWU2hKMVVR?=
 =?utf-8?B?THJPNzBNQUFaTHZiTnRobThlQm1EMWNkcVpDU3o5bEZrZUR4R0tXMmp1K3hH?=
 =?utf-8?B?K05Rc1VqaEh2SnZPWk0vVnZkUUNtQlFHRkhIMHVJUWZuSW96SGpTQjIyc3RC?=
 =?utf-8?B?T3hwOXRDaGZ4S21OTXJ6NU9nSDdkdyszV0s2NFNYSnFraGxGaXVOT3c1ZmtD?=
 =?utf-8?B?eVJZRXM5NjVEMjVDNE5BWmR2eVU3cFlKRDFWbkoxVXVzTkxNcURDR0lRNzdx?=
 =?utf-8?B?UW13K01iSFlsZzhVZWJ2aDRRa0FIeEJtZ3grMFZ5a05LWVhqVjh5aDBDRUZM?=
 =?utf-8?B?TnJDL29rRk5BT1VPdXZhZGcyalBNQVAwcDZzWXp2N1VScWo2K1RDZk4ydkFl?=
 =?utf-8?B?LzRmc0NyMzhYNFNDN2w3ZFNKa1hIRklsT3VyVU4xdTFsSDNiU0w4RmdhTTl2?=
 =?utf-8?B?OTIyRGdkclhPMklWaE1WRnRESTZsVzFkNC9GR0pPZDduR29JYjZPS2RwZEhD?=
 =?utf-8?Q?Eyu6B7PBv+vhJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dE1uN0VyR3dxU3Y5Vm9vRFI2ZU1HTkttMHFqK1BWVVZ6UHlSRnBRRk44YnZR?=
 =?utf-8?B?cy9lNGQwaW9PbDVQc0RaT0R6NUx0c0RoWlRBRk5iS3kxVis4bzU5ZWQ2YnRP?=
 =?utf-8?B?dzA5SlVlb1NwYmsxNUtqS201aUJGdFNQN2M5bmczYTFCbW5TZVkwM3VMcHlG?=
 =?utf-8?B?cVBZOFFqQ2M0TUxrNjQ3SklQbTdWb01WOStPSEpoQ0dCdTc0bVY5NUJuODk1?=
 =?utf-8?B?am4rSXpPZHJtVjdIeEgwV2NMVXJBSHIvdXM4TEpyd1FNRTJ4K0h3WndPbC9M?=
 =?utf-8?B?YzNGd0hEWDJrTWRtblZNbENmQzQ3anBSWStDZ3IwVXJXaEsvS2pGUGxob3Ba?=
 =?utf-8?B?UjRmdEVINDFNWkZwTER4UnEyTys3SkZNQmhxV3JJL2I3cnpKZm1aYWhaVFJt?=
 =?utf-8?B?ay9SVU9oYW5lN3pSeEpPREsxOUY2ODdiSHY3bjR6QWYvcE9qUUIwTGtETWNX?=
 =?utf-8?B?cXVWaFhRTW9QbTQrdklSSXVTNGsyNEEyczJBcVMwbXVJcDd6S1R6WEU2OE40?=
 =?utf-8?B?RUJyeG1DbkNTMmI2Q2t0Z1dLSEdoMlErQllsT3NybSs2c0ptZkxtM0I4eHZ0?=
 =?utf-8?B?alRiNFJrbHdRN3FzNkhQSXVaV09uSkFDaEdEcm5VOGNFcnBnMUQvVzlqYlVm?=
 =?utf-8?B?UWRYbndMMXRYMlJ2YzVpWHRjeTZ6QzdLelliRUJSL0d2a2RTQ1EralgyemIx?=
 =?utf-8?B?S1VFOWR4SGtpSUE2YW5VeXdFVHh5YVoydytBZTlQREVCbU8xbW9qUGE1emh4?=
 =?utf-8?B?cmFVNlNOZmdIOE55TGtMTm1zRDNnN3dSSVAwcjVpdVE1VUpmNi9ZdWJPelVU?=
 =?utf-8?B?V3dFcDZNYWlPTm9lNXVyYUlvNWZKQm5wdU01VmJjSmdXWUliWTEvd2wyNUhS?=
 =?utf-8?B?SDIzdnNPbTJDRTZqdTJHTkNNaXNuaFpzYjVna2R2UG14N0w4QkxpTDBFYzMy?=
 =?utf-8?B?WDdyR2lIaDVWV3hRZmFGRGZKNW1pZXY2NEJhQTFhRmE0OFhza3YxOVJnR1g3?=
 =?utf-8?B?WHk3VkxpWTNWelB4SDN5di8xV3c0S2FJTWowR2kxRHV0ZnJWdVNwejI3ZTBT?=
 =?utf-8?B?anBxMFRWUWRxRnpCWm5sU0RtcTcyWjB4L2dORVk4enQyNkEyVWNPa3ZWcHJW?=
 =?utf-8?B?Qktmdmk4eXpuYnk5SWlISUNyTGZZV3ZmM0VqM3FVdTFjNG53QmhScFFoZlk1?=
 =?utf-8?B?eFJKQkk5YkpUczdNd01oa1g0cU1zY3ZMTmgwRlhta3pac0JWdTF5dHFNZnlz?=
 =?utf-8?B?aCtUVEZsYjFoWVlnVy94aWs2MERrSnVZVHdFeTNhMHpHNytNeHlqVGVlZzk2?=
 =?utf-8?B?SGtUNzNxUzVyRVhJT1hIQTcrdXJCQklHTVRFV1VvTnorTmVESDEvR1Z2S0t0?=
 =?utf-8?B?Vk5XL1hsMGcrNDI0b3dtRytCZWhUSml3dUx1akVjeVFVdXczVHY2L2NtOTl5?=
 =?utf-8?B?bXhVTElhdVlIWmg4Slh4T2pTNkJkR1oraml3RURGM1hxUVhUZzVSZXE5YTRn?=
 =?utf-8?B?NC8yVXdZUVlyc0J3WC9kczUwNGN3ZmRTMHRSVFZHT24zcDl2ZlZTdCsxdGhp?=
 =?utf-8?B?WVhSYUVtcWJtK1A5RGdKZ2JFeS9tdkxYaUM0MUxsL245Zi9USzJEVjBRcThN?=
 =?utf-8?B?RjBWOEpzQjdyYll0YnNpM004RHNZYzlNSzFwRTZ0czArUWVibFZpZnYwMjNt?=
 =?utf-8?B?Tys5TlRJbkt6R05tL1NIbEVJdjVnaElKNi83aFFoVUh3cnNZQzZET3pCRkU3?=
 =?utf-8?B?NWVJM2JLZmFDU2NZZFU4aUJ6TGtwbHVrVzB5RFE0dCt0Mmw2QWkwYXc4dUJJ?=
 =?utf-8?B?dVdaOGhHbmNMdTV0dVg5OTJlTTVvSTZKc1Y5VDM3ZEV4OTJqbFdVdXdiY2U4?=
 =?utf-8?B?azF6eG1qWXN3VUlYQ2xad0hKMHhPK1c4dy9iSzljeFlHbG5scURjR09DTDNN?=
 =?utf-8?B?bERvZkVsalVtaWwzMUVzSHU2OEFwSFc0S3RGdnp0dU5pdHh4cGYzNm5LajhU?=
 =?utf-8?B?NldRRDVwbjBab2U1T1R2Q1dzREM1OTRNUDFMOHJpNTNMWmR5bGNEWVZ2d0tu?=
 =?utf-8?B?aWxqRUhNUFhEMGlyRUJrT0xxY2ZoUjlhQVBpK0VQK3Y4U1djeVBQVkNBZ0JY?=
 =?utf-8?B?cEYyT0Y0NDJEZWVqS28xY2djZUM2N1l5cnM1V1dmSGU1RDBjaUw1UWU1Q3dY?=
 =?utf-8?B?MHc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c82b368-f597-4062-9e18-08dd76cfb95f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 19:01:10.1425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jk4Jj9b/ZGI9ERm9B8TcMx/SFp/TJdjvjX7ak56SPUqto+rKfTDvdshLrbaqBQLn5EoZCbzevi6xENqW7pWhKe+5euv3FUTW/E4P7jzNya0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5478

On Thu, 3 Apr 2025, Ilpo Järvinen wrote:
> On Thu, 3 Apr 2025, Yen-Chi Huang wrote:
> 
> Please add watchdog drivers people/lists from MAINTAINERS file into the 
> next submission.

Will add GPIO and watchdog driver maintainers/lists in PATCH v2.

>> +static u8 pwec_read(u8 address)
>> +{
>> +	return inb(PORTWELL_EC_IOSPACE + address);
> 
> IIRC, CONFIG_HAS_IOPORT is these days required for iob/outb() so you 
> should add depends on HAS_IOPORT into Kconfig.

Fixed by adding `depends on HAS_IOPORT` to Kconfig in PATCH v2.

>> +static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>> +{
>> +	return (pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset))
>> +			? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
> 
> Please move ? to the preceeding line
> 
> I'd add a local variable for the read result to make this more readable.
Fixed by rewriting this using a local variable and `if...else` in PATCH v2.

>> +static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
>> +{
>> +	/* Changing direction causes issues on some boards, so it's disabled for now. */
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
>> +{
>> +	/* Changing direction causes issues on some boards, so it's disabled for now. */
> 
> Perhaps just one comment above both functions would suffice. The functions 
> are right after another so it seems overkill to have the same comment for 
> both.

Fixed by combining the comments into one above both functions in PATCH v2.

>> +static int pwec_wdt_start(struct watchdog_device *wdd)
>> +{
>> +	int retry = 10;
>> +	u8 timeout;
>> +
>> +	do {
>> +		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout);
>> +		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, 0x01); // WDTCFG[1:0]=01
> 
> Please use named defines and FIELD_PREP() instead of comments.

Fixed by defining `PORTWELL_WDT_CONFIG_ENABLE` and `PORTWELL_WDT_CONFIG_DISABLE`,  
and replacing the hardcoded value with named constants in PATCH v2.  
>> +	do {
>> +		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout);
>> +		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, 0x01); // WDTCFG[1:0]=01
>> +		timeout = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
>> +		retry--;
>> +	} while (timeout != wdd->timeout && retry > 0);
>> +	return (retry > 0) ? 0 : -EIO;
> 
> Duplicated code.

Fixed by reusing `pwec_wdt_trigger()` from `pwec_wdt_start()` to eliminate duplication in PATCH v2.

>> +static int __init pwec_init(void)
>> +{
>> +	int result;
>> +
>> +	result = pwec_firmware_vendor_check();
> 
> So this goes immediately to poke some io ports? On any x86 machine?
> The cases should be narrowed down first with dmi matching.

Will add `dmi_check_system()` to limit EC access to supported platforms in PATCH v2.

The following style and formatting issues were also pointed out and have been fixed:
- Removed extra blank line in the file header comment block
- Sorted header includes
- Fixed missing blank lines before section headers (3 instances)
- Fixed 4 spacing issues around '+' operators
- Removed 7 `pr_info()` calls from success paths

Appreciate your detailed review. it was very helpful.

Best Regards,
Yen-Chi Huang
