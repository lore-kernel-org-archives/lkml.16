Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95513D8B2;
	Thu, 22 May 2025 19:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943980; cv=fail; b=MIvT17JLaeZgWapb4H5nQ6yz4WNi1lICAhVFf4nz0x4No6pJfu7falPwRqRZdm+1dYpOMVlTiW1NNhALH8TbRaheaBbu8edBrIIWJ+lKrm69POSMFHDz0kf22U5lSyaQzkeT9C0RJL092k6QYH3xPRETX6rcBbjfJg49tLra0yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943980; c=relaxed/simple;
	bh=mePASSbYb3TJxPKJVKIdzwKF4rHJaJK5+KHXtceTos0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ua65RvjxqJ84nuf2g4eUCxx6F2I++vEi+Ysx3pQAlWWQQ97KnpNTu0aOfqkMTAzMXUSD1kJoZysNKB3CNNS+6bh0NaJCxq0+BDgheq4jUKrXiMg/O6RLSIju2wFbX0sGs/ZDYAmREaHaPvC0JzawB/c9/l0R8f3kID1XB0eJUOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5ngdeJEY; arc=fail smtp.client-ip=40.107.243.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5ngdeJEY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfUdu5kiTvnAT7zFtSHDr59CTp8nseI9mPvZUkf8YQyK/4YBKnyaInDV53P0w7wF9B0WnULd2LES1xIqDBVxFBjFTLgba6Xz/W9X495WAaUoJ30EclelAdBB0JrJIKnPlDpO+F5KPGrO2asOwVksi803CRHfKM9G7IuMvQwNH/beQGld8MvFYeGQyZfPr7wWY0DyQzk+onu+OgMqJ9iUQ8qzMpFkNQ2H4NMwhdomsGKN/j80OarhYQIHJa7UFZs8PutG89uPEBc4/w52mtU2fhgToLRix6Wyam0dUsiO3w//RaTbKy1+99Q2IAvfFzXyF7TlqW0XEVibXsYCKZwbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SUIbIDHXRZh8PlW+wS3g/AocwCDZF0C6VTF4RWmcr4=;
 b=spoasfeRBJDGI0FBu7sAj6LHj4tUPXXx1eF+lwc/pcYZX02dvbe/uy6AC2Ps6h1QOCTzvGxcuXQgV8PNdh9rzU5PNAxh9uufhwgJtyduG8x+o1keD5megdJ7Bpo0bubkl2++fcDXagmlOw02FGGOrk10KoSyzDewikfpNVVmbg69Vg7qDvy1RkvDG5//Q1K8WdWmMNf/W28fbtQQeWDtgYo0eFJKwSFgll+GAO2qRzVPP8dIskj/3MJZ/WX6ukFH++Ei830gP60bTkkvLAZIPQFL0FDlovKsnr7f6RljVdtaHj1To5uA0FlifpPHQrxEszF6gKAvVKitlymDMRg9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SUIbIDHXRZh8PlW+wS3g/AocwCDZF0C6VTF4RWmcr4=;
 b=5ngdeJEYsqwdjpzpOXMLm2XhzYoMVoey5Gpg1n8Oils3zGTKAKF7t+/AMqK0WVVI83mxpjEty4opsJrKUDdzNHPNEg/VwISjzJ0i/+vzehgyn1M9da2ETFMepZjrfevxQA5tYA70x3qzPHuCN1U4t+F0Zsc9s3jQLpysus4h0H4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 19:59:35 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 19:59:35 +0000
Message-ID: <fe8aa1e6-58e0-4a66-a369-7d4a86f13d1c@amd.com>
Date: Thu, 22 May 2025 14:59:30 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v5 0/8] x86/resctrl: Support L3 Smart Data Cache Injection
 Allocation Enforcement (SDCIAE)
To: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, thomas.lendacky@amd.com, seanjc@google.com,
 mario.limonciello@amd.com, perry.yuan@amd.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, nikunj@amd.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, andrew.cooper3@citrix.com, ebiggers@google.com,
 xin@zytor.com, sohil.mehta@intel.com, Xiaojian.Du@amd.com,
 gautham.shenoy@amd.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1747943499.git.babu.moger@amd.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <cover.1747943499.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0041.namprd04.prod.outlook.com
 (2603:10b6:806:120::16) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN6PR12MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: edb5784b-c6c3-4a29-88c9-08dd996b2d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1pBM1c3OW1kWW5ZblkrT0N1a2E0T1hiZWRVclFtUWJDNCt2NUdEOVhWaE9u?=
 =?utf-8?B?V0JBc29Bc2JyM2ZTdFNmTjlGdm9OVGpxMllha0VLQkZhV3ZUTkVDYXdEMDhP?=
 =?utf-8?B?ZGpFMXhpcDgwaHN3cDYvNXZlTXhWVlR3dkdxeEhFdy9jL1pZNm9RblR3QVBE?=
 =?utf-8?B?WXJmVHArUGxsT25TUDJMTnk1UVNML1d2ZlhvdEdvd3djT1BRSlFxMzR0RXJ5?=
 =?utf-8?B?USswMGNFczN4QS9GWEtPVXdsekgxWHkwUms5cHV1TGhnZ2hlSTE0aUVGSUNz?=
 =?utf-8?B?NERoOEcvTTRjalBJTzhiUVdFbVVCZ2ZBUW0yVit5ZkhtUlQ4UVA3MmdxdVNV?=
 =?utf-8?B?N0QxL3B0MmJUU2Q1YlQvTHJsYit4dkprT29OUGd1cGRHNmZoNytGaFhZNGtQ?=
 =?utf-8?B?UEtBWkZ0VGhTbEd6blE4Q3pGVzR2RlBLUUVmNTZJNURkaC9uMzR3cFVZcGFI?=
 =?utf-8?B?ekJzRkk4RjIwTXhkNGhsMVZCR3dMODZFQU9OTzR4QVIrR0l1aFBudUFRelBv?=
 =?utf-8?B?Skd1bkJjdFIzdUFORFZqVzZ4bmFVUm5RUGNWY2gzSjZiMnBIdnNtZDFmUGx1?=
 =?utf-8?B?SDBwMldEMkowblJmcnB6MWRTbjFBUVcvWklFQm93OHdRUHJRZ0FLa0N2Z1BV?=
 =?utf-8?B?R2Qyc29uOW1ZZUVGaVBnbGtqSitqbEgrMlQ1RWZzNm00NjlXcGxPWFRGWHJO?=
 =?utf-8?B?ZitEbGpVV2lBNlBBRW5ON1NHVXBaUHZmalo0MDRKVGsvU1FRYVJsRzRXNmFi?=
 =?utf-8?B?ZEpCdHZldUIrR2p2UTZ1YVJYLy9vdW9nWW9ONVpmVWdWa2NmcEJNdVJ0ZWNX?=
 =?utf-8?B?UWxDejVjUTh2VW9QNVhkNzI1bDFDaFlPcnZwSTdyVTgrYXl6a3VUSUZZRWxl?=
 =?utf-8?B?cHZzZFBPajZLbEcvZ1pGcUNVYThUbXJ0NG1UK0J4MzErdjM1WTZmTDhkQ0lJ?=
 =?utf-8?B?OWJXUkZINVl1bzF3YjFBQkdBeGVrSlcxSWo5SVluMEdXeC9QQkcvTnk0empq?=
 =?utf-8?B?cGlHZWNDa3BFdTNmMjV4MlhkeGx0UjNGSnlIeXFpaE5oY0F6NEpYQ0hlNExQ?=
 =?utf-8?B?dXFxZHhScHdkM1JrUmJTSkh4KytSQTY1NWZMN25OUUVTL3QvUzdGbUdGbjBP?=
 =?utf-8?B?bWp0RzJDbnVVVlJYVU5jZGNzcVRjZEF6R3VQeC9iUnNpbkhQU0QzTnZOdGhW?=
 =?utf-8?B?dUNvOTdnNVAvVkpsblY4RlIySHFDRHNXUVBQY2dvWEJWR1ZwazMrYStiUEdZ?=
 =?utf-8?B?NUdobFkrZkJpM0Jwd01sWXl6eHpoM1VPNlQ3SkVkNERHYzJCdW11NUJQaVhY?=
 =?utf-8?B?ZmtuV09KWm0rQzhUMHh6anNBYnJJWTFGUVRlUU0zMjNEeWJ1K3kxeVVuVVZq?=
 =?utf-8?B?VEdjQzdtZHZJRXZick03L1pTLzNnUHhHc1cxNmhCb2Zmdjd3RzlpT0NGL2hN?=
 =?utf-8?B?eHZEOGZ5MmxwUkROQlNrNjZyYjk0Q0xNRTNFNFpCQ1Z1K05xdjRtUlUraVo4?=
 =?utf-8?B?Yk5CLzVZU3gya0VTOHVkaGw2S1h5VVA3dDhMMmlRSW1weEw5cEJISTZLK1Rl?=
 =?utf-8?B?R0FWaWhSaERjRm9JZUZ0dmdIRGJNVFA0N3ZWOThNUmdERkJsZ0wrN0JncjRY?=
 =?utf-8?B?MmR3c1JDd1FYVXFpOGpPemxEQUkxaENtN0Iyd3N1d0Q5eldzaklDZTF4NU0y?=
 =?utf-8?B?Z3Z3di9odyszSlAvT040d0pnbmJha1Q1Z0M4bGN1aVRxcFNVUEFsUjQyYmRn?=
 =?utf-8?B?VGE5RXdZOGhQSVdIR01pR3BCREFkRG9YV3NiRXFhblNsb2k1eDlVT2d2Mmhk?=
 =?utf-8?B?T1phcERhSzZFMHNWTS9QVmxUNUQvaXB5WjVKbEl6ekFOaE5YMHlGMk5PV3lP?=
 =?utf-8?Q?GLbS2cQ4sfHud?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEM4NXFReURpejlIaVZCV1REVXFSREdoQ2hSbzA1RGZGWm9EeGFNSmhKRGs5?=
 =?utf-8?B?U0pxOGxRejFaVWduZXpxeG9wb2tJUUcxMUdXVlUxUUE3NERHQkI5SDlRRUtV?=
 =?utf-8?B?cFVNYnRTbjV0aG4zVFdRenRObVRlS284M3hmMEIzTWd1THl6VTdlV3ZORVlP?=
 =?utf-8?B?VXBFYnhKeW9FeHZlZHRiVmpQanB3eXN4ME96M3hob1RveFBQVE1LZlFFS0RI?=
 =?utf-8?B?a2RqWVpScW1IcXBvYkVOdDVoTTVTbGQwaStobVFGYWppd3FnSG9ObUtYWmpm?=
 =?utf-8?B?elQxWndCSGxGUFBSQzZLd0tmaER6R3EvbkFJMnYyUi94L0QydFg1RE1VRnBH?=
 =?utf-8?B?SGwza29rakVHRUI1WHNYbFNVa0EzbEhUc3RqaDFWQS9QMDl4ZWllbmdaMlZk?=
 =?utf-8?B?QzIzS0tuYlZIdlllMDBDNzFBWWdqMTdtQm9FMEh2ZlRTaEIrVm9jdzZDdkJo?=
 =?utf-8?B?K1Uya0lVYTd4Mm05VmFTRlIxemFMMWxiSEFQbzJ6QzM2WkdFT1V5bWcwSTlh?=
 =?utf-8?B?cXJUWlNQS2Jib0JvTGIyNlplMDZMTWNWVjZxYm0xQWt1VExIbGtjTEZHaFd1?=
 =?utf-8?B?ZmpFOGdTQ2t3TWpjeTA5SnNOYWgzY2xHMytsZ0huWGFhSk1JQ2MvdzU4dFlm?=
 =?utf-8?B?aUhGWEsvSHRuYldOQjhaWWVGMERFUmx1L0pLbldzU2hTMGdGRS9sUGVKVmJU?=
 =?utf-8?B?VUhyVWFTekRLT1hBSk9kZDlLNUJWSHdSckMzVFdVbE1XWXFLRG5rNlNteUhi?=
 =?utf-8?B?bnlaR00yMFBRL2R4M2xOQkJPZFFVODZ6d1NRelpyamUvUmw4STNadVMxSzZl?=
 =?utf-8?B?Q2FKWjFPckJBM0pzVXUzYlhzOFo4NFpzTDltUitHNE9FbG1FMEZiRDNrS0gx?=
 =?utf-8?B?ZGJTZklQSTd3dzhuanNqd2xNcHgwaWsxb1ZESTB5KzBCcVhmODF6K2RMZ2xM?=
 =?utf-8?B?Rm5kV2puWS9SMWplSUd5Qy9EaGF3SjNTN21yMTdaTk0vamJicDJmN3EwcHN4?=
 =?utf-8?B?Z1ZzZ3kzYW81V3JDVWpsNGFWbjNvSFRpK0hoZUdpREYya1J6N2owVnR1dmZi?=
 =?utf-8?B?ZUZCWXBsQXVMUUtRUDhINlF2Tit4ODFsY0pUb1RlaW9FMkY1YVdjSzI4VEtY?=
 =?utf-8?B?cmFGZlpCWlZUWWF4YUc4RTJ3RzlXN3JsejhhYWd1SlBvajFPSURrNDNSeDgw?=
 =?utf-8?B?aTVBSVBtQVMwQjZPc2NCd293aDhic0ROVG0zUjdNNVZvLzBzWGZJZ0l0Z0Er?=
 =?utf-8?B?dXJwZ0tEYXhvYW03dHoyaEs1aE4yS0dnWEx6d0R4WWtTRWovbTlGTjVxZkJw?=
 =?utf-8?B?MTJqZ3N3MHdWVWJpZ2FqMHZFS0FVOUIwbEhsNk1yZDkzWWtDOHNoZlYvcWZv?=
 =?utf-8?B?b1FINUI0NVA0elVzVVB2L29nZk1aSk8wMWtWSXhUaHAwdVNBM1Q2OU96a1Bs?=
 =?utf-8?B?RG43Mm43Wi82VnYxNXFrUXpUa2pCd0FkNUh6TUdpTFhEdkNqcUozd0cvWXJD?=
 =?utf-8?B?WFJORDViWkxjTW1UVGhBelJyY1RHVVZ3Q3g0bjdiOW9paGU2d0htSThzSytC?=
 =?utf-8?B?NGd3aEYvNFU3T3h2NzFCQnZhSmNkbVFSaDRvVU9FSnVoNTVVeFNsSzBDQnNx?=
 =?utf-8?B?dnZocUlBSzJVMHkyekxCc3ZtN2tMM3pjWXNiQS9UQVErR25oSldEZkYvSjNK?=
 =?utf-8?B?QXkvNmIxd0hzSW9QajBaSlV2WXFvQVFtVSs5ZWhMRDlpSDVuQytOODh2MzVh?=
 =?utf-8?B?c21qVjhCOXJBYTVibTR4OXVOR2xBMncwcDJKc3orMUJNdDRhR0hSMGtrc1dW?=
 =?utf-8?B?cE40SnIwWDdJMUpBRXBlMmp1ZmYydFVrMWp1RjZweFdZUURvWTRKQmNNVVJO?=
 =?utf-8?B?aXFQR2RzdDJ1bFF5NXZEMUxGZ2RvZjdKT0c3UmVNRWJjeXduQVU5Tys1OXU0?=
 =?utf-8?B?TlYzeS9WdmZxYkxtOG5wSmd2enZsN0V3dlpPWjFtYUJRSkowWHpRK3lWNkxH?=
 =?utf-8?B?NExxMUlUeEExZW5HYWFDbWwzczB6TzhtM0J4blI0OUVzQXlzMjMrTVZmdlhG?=
 =?utf-8?B?TytWRExZbVZjYVR2UXB2ZVArbWh6N0dnam9INUpXczdvUDZWTmFIZEhubVR1?=
 =?utf-8?Q?klj0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb5784b-c6c3-4a29-88c9-08dd996b2d09
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:59:35.4879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+LqYcbu4i7ybXNs/uBGuMSWGUiJVIP/fdnzxo66u+8CwZlSSbKP/TNollpDTYQe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8568

Please disregard this series. Need to resend this series. Had some issues
with my git-send and while testing sent the series by mistake.

On 5/22/25 14:51, Babu Moger wrote:
> 
> This series adds the support for L3 Smart Data Cache Injection Allocation
> Enforcement (SDCIAE) to resctrl infrastructure. It is refered to as "io_alloc"
> in resctrl subsystem.
> 
> Upcoming AMD hardware implements Smart Data Cache Injection (SDCI).
> Smart Data Cache Injection (SDCI) is a mechanism that enables direct
> insertion of data from I/O devices into the L3 cache. By directly caching
> data from I/O devices rather than first storing the I/O data in DRAM, SDCI
> reduces demands on DRAM bandwidth and reduces latency to the processor
> consuming the I/O data.
> 
> The SDCIAE (SDCI Allocation Enforcement) PQE feature allows system software
> to control the portion of the L3 cache used for SDCI devices.
> 
> When enabled, SDCIAE forces all SDCI lines to be placed into the L3 cache
> partitions identified by the highest-supported L3_MASK_n register, where n
> is the maximum supported CLOSID.
> 
> The feature details are documented in the APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
> Injection Allocation Enforcement (SDCIAE)
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> 
> The feature requires linux support of TPH (TLP Processing Hints).
> The support is available in linux kernel after the commit
> 48d0fd2b903e3 ("PCI/TPH: Add TPH documentation")
> 
> The patches are based on top of commit
> 54d14f25664bbb (tip/x86/cache) ("MAINTAINERS: Add reviewers for fs/resctrl")
> 
> # Linux Implementation
> 
> Feature adds following interface files when the resctrl "io_alloc" feature is
> supported on L3 resource:
> 
> /sys/fs/resctrl/info/L3/io_alloc: Report the feature status. Enable/disable the
> 				  feature by writing to the interface.
> 
> /sys/fs/resctrl/info/L3/io_alloc_cbm:  List the Capacity Bit Masks (CBMs) available
> 				       for I/O devices when io_alloc feature is enabled.
> 				       Configure the CBM by writing to the interface.
> 
> When CDP is enabled, these files will be created both in L3CODE and L3DATA.
> 
> # Examples:
> 
> a. Check if io_alloc feature is available
> 	#mount -t resctrl resctrl /sys/fs/resctrl/
> 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc
> 	disabled
> 
> b. Enable the io_alloc feature. 
> 
> 	# echo 1 > /sys/fs/resctrl/info/L3/io_alloc 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc
> 	enabled
> 
> c. Check the CBM values for the io_alloc feature.
> 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
> 	L3:0=ffff;1=ffff
> 
> d. Change the CBM value for the domain 1:
> 	# echo L3:1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm
> 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
> 	L3:0=ffff;1=00ff
> 
> d. Disable io_alloc feature and exit.
> 
> 	# echo 0 > /sys/fs/resctrl/info/L3/io_alloc 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc
> 	disabled
> 
> 	#umount /sys/fs/resctrl/
> 
> ---
> v5: 
>     Patches are created on top of recent resctrl FS/ARCH code restructure.
>     The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.
>     Resolved the conflict due to the merge.
> 
>     Updated bit_usage to reflect the io_alloc CBM as discussed in the thread:
>     https://lore.kernel.org/lkml/3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com/
>     Modified rdt_bit_usage_show() to read io_alloc_cbm in hw_shareable, ensuring
>     that bit_usage accurately represents the CBMs.
> 
>     Moved prototypes of resctrl_arch_io_alloc_enable() and
>     resctrl_arch_get_io_alloc_enabled() to include/linux/resctrl.h.
> 
>     Used rdt_kn_name to get the rdtgroup name instead of accesssing it directly
>     while printing group name used by the io_alloc_closid.
> 
>     Updated show_doms() to print the resource if only it is valid. Pass NULL while
>     printing io_alloc CBM.
> 
>     Changed the code to access io_alloc CBMs via either L3CODE or L3DATA resources.
> 
> v4: The "io_alloc" interface will report "enabled/disabled/not supported"
>     instead of 0 or 1..
> 
>     Updated resctrl_io_alloc_closid_get() to verify the max closid availability
>     using closids_supported().
> 
>     Updated the documentation for "shareable_bits" and "bit_usage".
> 
>     NOTE: io_alloc is about specific CLOS. rdt_bit_usage_show() is not designed
>     handle bit_usage for specific CLOS. Its about overall system. So, we cannot
>     really tell the user which CLOS is shared across both hardware and software.
>     This is something we need to discuss.
> 
>     Introduced io_alloc_init() to initialize fflags.
> 
>     Printed the group name when io_alloc enablement fails to help user.
>     
>     Added rdtgroup_mutex before rdt_last_cmd_puts() in resctrl_io_alloc_cbm_show().
>     Returned -ENODEV when resource type is CDP_DATA.
> 
>     Kept the resource name while printing the CBM (L3:0=ffff) that way we dont have
>     to change show_doms() just for this feature and it is consistant across all the
>     schemata display.
> 
>     Added new patch to call parse_cbm() directly to avoid code duplication.
> 
>     Checked all the series(v1-v3) again to verify if I missed any comment.
> 
> v3: Rewrote commit log for the last 3 patches. Changed the text to bit
>     more generic than the AMD specific feature. Added AMD feature
>     specifics in the end.
> 
>     Renamed the rdt_get_sdciae_alloc_cfg() to rdt_set_io_alloc_capable().
>     Renamed the _resctrl_io_alloc_enable() to _resctrl_sdciae_enable()
>     as it is arch specific.
> 
>     Changed the return to void in _resctrl_sdciae_enable() instead of int.
>  
>     The number of CLOSIDs is determined based on the minimum supported
>     across all resources (in closid_init). It needs to match the max
>     supported on the resource. Added the check to verify if MAX CLOSID
>     availability on the system.
> 
>     Added CDP check to make sure io_alloc is configured in CDP_CODE.
>     Highest CLOSID corresponds to CDP_CODE. 
> 
>     Added resctrl_io_alloc_closid_free() to free the io_alloc CLOSID.
> 
>     Added errors in few cases when CLOSID allocation fails.
>     Fixes splat reported when info/L3/bit_usage is accesed when io_alloc is enabled.
>     https://lore.kernel.org/lkml/SJ1PR11MB60837B532254E7B23BC27E84FC052@SJ1PR11MB6083.namprd11.prod.outlook.com/
> 
> v2: Added dependancy on X86_FEATURE_CAT_L3
>     Removed the "" in CPU feature definition.
> 
>     Changed sdciae_capable to io_alloc_capable to make it as generic feature.
>     Moved io_alloc_capable field in struct resctrl_cache.
> 
>     Changed the name of few arch functions similar to ABMC series.
>     resctrl_arch_get_io_alloc_enabled()
>     resctrl_arch_io_alloc_enable()
> 
>     Renamed the feature to "io_alloc".
>     Added generic texts for the feature in commit log and resctrl.rst doc.
>     Added resctrl_io_alloc_init_cat() to initialize io_alloc to default values
>     when enabled.
>     Fixed io_alloc interface to show only on L3 resource.
>     Added the locks while processing io_alloc CBMs.
> 
> Previous versions:
> v4: https://lore.kernel.org/lkml/cover.1745275431.git.babu.moger@amd.com/
> v3: https://lore.kernel.org/lkml/cover.1738272037.git.babu.moger@amd.com/
> v2: https://lore.kernel.org/lkml/cover.1734556832.git.babu.moger@amd.com/
> v1: https://lore.kernel.org/lkml/cover.1723824984.git.babu.moger@amd.com/
> 
> 
> Babu Moger (8):
>   x86/cpufeatures: Add support for L3 Smart Data Cache Injection
>     Allocation Enforcement
>   x86/resctrl: Add SDCIAE feature in the command line options
>   x86/resctrl: Detect io_alloc feature
>   x86/resctrl: Implement "io_alloc" enable/disable handlers
>   x86/resctrl: Add user interface to enable/disable io_alloc feature
>   x86/resctrl: Introduce interface to display io_alloc CBMs
>   x86/resctrl: Modify rdt_parse_data to pass mode and CLOSID
>   x86/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks
> 
>  .../admin-guide/kernel-parameters.txt         |   2 +-
>  Documentation/filesystems/resctrl.rst         |  57 +++
>  arch/x86/include/asm/cpufeatures.h            |   1 +
>  arch/x86/include/asm/msr-index.h              |   1 +
>  arch/x86/kernel/cpu/cpuid-deps.c              |   1 +
>  arch/x86/kernel/cpu/resctrl/core.c            |   9 +
>  arch/x86/kernel/cpu/resctrl/internal.h        |   5 +
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c        |  37 ++
>  arch/x86/kernel/cpu/scattered.c               |   1 +
>  fs/resctrl/ctrlmondata.c                      |  41 +-
>  fs/resctrl/internal.h                         |  10 +
>  fs/resctrl/rdtgroup.c                         | 350 +++++++++++++++++-
>  include/linux/resctrl.h                       |  18 +
>  13 files changed, 510 insertions(+), 23 deletions(-)
> 

-- 
Thanks
Babu Moger
