Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8339E23099C;
	Thu, 29 May 2025 15:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748532087; cv=fail; b=PZaxayrHLCV8Oe7LzZodQDtXYuw7JIFPU4Dz2O9I0Gz4sB74va0HaGHjiw9gbfoxmidOv4x3nraU5BW93NfUxqeWRtPgBP30pYuYvWvgK9OZz+/VndM+5iI/4SResDfKRkK0EB7VsDdLog6smYUbK2hPSawlQuyvrBoANi4p0NY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748532087; c=relaxed/simple;
	bh=zGy1CCPqts9lHqymbqyCu4sZwaDxOQnlESrL+mB87FU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nw3DiSrI6D+Hw6Jdb1ZXN8JbAmhRU7lm/gmGdQ+J3owBtR7CMsNhwgtZplkuBXeP4+yG+nEhfFlwH3Mp7HxY5mDjrdSVzoOyuooGshKziwbXs3AvFfJdkWkb69TNwzh2iCQiawhsiR8D4TUsLigXTQa1TVQtmOGjg2Rh00PITqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T2nnZrAa; arc=fail smtp.client-ip=40.107.243.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T2nnZrAa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iy+4Q7lxUjIIKDa66TiT6FsAOkjRUXFHlnWVfuLSTo6UkShaZtHgMU+JmuyNdMYs/Iu3f+EiIEWHzQN+G7m4FqB+y7y0yhAVABGrmrN3ie8yw3u5M7mKaICxi0/CH16MQzG7eqST8oNL3ncd+eLtjksLlMZ5XKQGp4kDYTQFEejcjD1QYdiBsljjw7qw6yi+wfh+aNyyOx/h/xcUordcPuMSWPP802e3D8N9NcXDJThgfF/aFQz9fzJvwaq9285YJs/0DjCgCyyABwjFLARHQGvqGMWimkMWtnWLeZ8EGn4zieB9V5Podttz68mtR8/fNO3S55V7vcoGm6HxGo68jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxSfgz0st26jQlfmV1efp+wsWKzdH4GYLcIAJDymwok=;
 b=WDZBfLdGlk+K6j+FJTLu8XAJgaLQFA4zNyWHheM4kKnNbGBGalUoKxwb/gmSJIk/V27xNSRf/uQw1jXoOK3a64vI2ZfqaUZKhEauuBRInQpHKoMjrJikR3CRUaP71pVnh3miq17fTH5zdVPRkKeznvuYvlIvoiWEIu32aGSI18Lb/b/ctvAJ2NtGV/P3VbPBxumLdywhfpLcJcov+s2lExg0OGxT+HaBLbNOjcuj2gyL0atN88nRBbzpQ7GyNAu8YDZukbWjD2+04654Nom7H+czULxqXYe8TOCEyTTu3GJio4GGO+dSqOaygDxaQpdt0xaQSvwrlzYKiRS6BlfzQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxSfgz0st26jQlfmV1efp+wsWKzdH4GYLcIAJDymwok=;
 b=T2nnZrAaq4aDkNdriMklEKir2HRn8uAMR8/cuBbehBw7YVtshBQUZWtHC5HHUpXypFssO7xkWRIjAthMhpHxcPfV/M/Tixm1glxi3r3Lng/hL+aIzVo9VaacUfSMyyCn3itp/YpewyM15QwZauiwa0OmJtvJbWwGoUUMO5IMVj0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 29 May
 2025 15:21:21 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 29 May 2025
 15:21:21 +0000
Message-ID: <be1f6d4e-6310-4345-a1b5-090fde96b7fe@amd.com>
Date: Thu, 29 May 2025 10:21:16 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 12/27] x86/resctrl: Introduce event configuration
 modes
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <95b7f4e9d72773e8fda327fc80b429646efc3a8a.1747349530.git.babu.moger@amd.com>
 <3c25896f-72bf-4462-980b-0835aa445078@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <3c25896f-72bf-4462-980b-0835aa445078@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::11) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4974e4-3539-492d-6c24-08dd9ec47736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnRqQlI1M1N4OWpXZ1hVSVFPcmkyYmRnMmxTaEJqVGtWZTJrSnB0N25GWUtn?=
 =?utf-8?B?a2lqRG56eU9kKzVWQjdoVUNMYVJXOXphS2JqQW5jbTBJejVPemF3dFRycGx4?=
 =?utf-8?B?QWdXRmJES3N6UmdoN1dZRFAwWWdoZUlSMFJZWUx0QlhuQ1FSLy9KQUFMUFY4?=
 =?utf-8?B?dGVDWno3NDdFaHhZZnduNjZmUFozaWo2OFFSOW5sQkdlZmozWmRDK0tSczJv?=
 =?utf-8?B?K2ZtV3psZkw0aUNHVElWTEVtZkZ2cDE4eGpCUG5OeGZUMEJDVXdFdkpTeGdH?=
 =?utf-8?B?UWFPMml4QWJjc0pHVmpzMzhhNDJEV2hpaXZOZnc5TkdCRzZDbFhKbFpITDZH?=
 =?utf-8?B?MG5uaXJuSXBTYS9tVkwxcHRKcExySjJiQy9zNUdqcXVVc2FnRHhRdnoxL0d2?=
 =?utf-8?B?SFBIVGVYbExJSGtjWGY3Q1JaWUsxRExTZmVEQy8ydm1FUnFNa2lFR0lSZTVl?=
 =?utf-8?B?eFNEMCtVSmkxVmRpdkdFeTNYQ3NTZkYvc2l0YjRSeGdWby9PT0V6ekI5SXZP?=
 =?utf-8?B?ZEZmYytnUFFPSS9oVERFVWliMDRQcllDQzB3dG5aWGFIZkJOd1czbWFjekpv?=
 =?utf-8?B?aXdSaFBFc2VFajc4QjFrQnhGbUlSbEhEbXpBZzJabmtURGY4OXEyOGNBV3NM?=
 =?utf-8?B?SW1xY2podjlRMFhVRzhMT2ZJVUdTaGo4Uzc5OHlMOW8xN1BSM2FsTVpWM1JK?=
 =?utf-8?B?aldDMzJjNkdOVks3eTRjVjBuNEdFRW5ZQUFueVFrR0RzWnpudXZSZ1pmbWZU?=
 =?utf-8?B?U3Z3Z2JldTlkekM2UWU4ZEFsQWtzb3Bva29mWHFNQUVVYlZPRjJpaXZ4dkFX?=
 =?utf-8?B?THlaRE53ZDBUK1Q3TVI1QWFld0g0MnJELzBMd1JIV291b2s2dlBMb1JoeVZj?=
 =?utf-8?B?Q1lILzl1MitTNU9nU2RvUVc3SUFZZTVVaTRrckxzVC9OSzd0Y1Z0NTUvOHVy?=
 =?utf-8?B?c2wrdDdTRjRHT2k2NmNWOFo1SWtOY0h3S3hQa0VYUGtzU0ROaC9Db2Y3S1F4?=
 =?utf-8?B?U1psaFdSdUJFL1FrS0prSkhQL1diUEdBYXNGbVZrQmsvcHdnWmtkK3I4aHZN?=
 =?utf-8?B?cHV5K0xwR0ZFRU55Z2k4OVJnN21meGFtOW8rSEJ4bjVrS3lDdVdkcmtpQ3VL?=
 =?utf-8?B?bVpvb2xrTUkwb0ZlL3VTWEoxMVdhaTc4V3FnMDRvVm0xZGlEKzJpRkRQZ01r?=
 =?utf-8?B?REFGSE82YkN4cVl1dTZGS3M5Q0d3ZEorV2ZZdkQvOWREcEJrRGxCYUFQaEk2?=
 =?utf-8?B?Qng3aFVOV2hpS1RiaVBxZWNSM0htUStlc1hxQW5wV05EMFE4WjhvOHNUeEdo?=
 =?utf-8?B?bndxZ0xVS2lzSElQTjRqYzdKaExWOVdrdUpnU253bVl5UTgyY1RWcHVRb3Mz?=
 =?utf-8?B?UmR2OEliNDI1a3JWK0VkaTNtbC9GaTdEWnFDOEY3aUNTbkdpaEhDdHNDSFRi?=
 =?utf-8?B?aTFDMmlYaUlrNHhPV3E2dDhxQkczRTNEVlhuTWlUSnJQanF3YzUvajBMMTZp?=
 =?utf-8?B?Rlp3SzAvYlUya0FTVFZGb00vTzRWd2NyQVlScndMVVcwZjFqVUdCUkFHc0lU?=
 =?utf-8?B?NFd2OWZtd0tVcTRnQnB0U0pqR09tY1Q0VHRFMVc1ZUtZOHRPQnJLL0t0NXl5?=
 =?utf-8?B?SFV0KzJTVktWZnNpaEVJdi9qV0R3Nkk5Q2kwRzQrY3J0OFFmZXFaby8ydjJE?=
 =?utf-8?B?cjRhd1BmOXZSUk5zMFFXNVZ4aSt5akh3UG5oZEN2ZlFpQ0pRSEc2UHlqZHBn?=
 =?utf-8?B?OU9oUDhxRGhBZzA2L0NWUWU1bkZoVSt5TXdTbVFESGhtTkFER0NFRlhHYXYz?=
 =?utf-8?B?VVJXemljWWJpenpaa1dxQjVCaFNqbjNseDR6UWxLM1VWMGprWStEZHdUOWVX?=
 =?utf-8?B?dE12Q2pzVnhTOXd4eVplczh2TnNScGJYNGdjc2o0Rnk4S0VsSG91VUM1Uklp?=
 =?utf-8?Q?ARdNcPGmNw0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjZwRC9NQ2dVRGUxMmIzam9SbFIvMWFKR3NwcGNubFVJeTN6ZFBSYWhwU1k1?=
 =?utf-8?B?K3BacldjOWIrQTlmVzBXYTNXWjRIRDdXN2ZHdjFjblJmMmJCN0NOUWt4T3N4?=
 =?utf-8?B?STNES2JRN01UT0d0bVB0ZFdwd0lpVVRaeDRjV0VMVjdKVHJEQXlIcVpLazVl?=
 =?utf-8?B?UVJXMjlRRlVRTXlycDFQdWFpc0N3NjI3NUU4MHU1OUhDMHhybW5acUdxRVQv?=
 =?utf-8?B?U3QyczJ4Rm5NcjkyR2xIK2Q1UWtMYmVCN1NFNTdyZmpkUlloWnl3cDVDc1Ro?=
 =?utf-8?B?ZzNnVitCc2NLVkt4T0JheURrY1FEc0dxcXhjVnZrUWg1emxZQlU4cXJrdmFj?=
 =?utf-8?B?YXdTN1l6eTlUcWxzSDUyeUErQUh1bnpuT3QvQ09JRmVwWGpmUGQvTTJmMTNL?=
 =?utf-8?B?aXRmYzAvV0VxY2pQdmREcERET0dkS1lKSFJpUTE4VzltRHRQTGtUSndZQjdh?=
 =?utf-8?B?aTdvWFY0TlZyY2JLWUQ2VGI5QlI2M0pZWFFISjc5NXh2OTFJMm1VTk1RVngw?=
 =?utf-8?B?Z3RDcHFSNUJpR3VjeG9rUUYrdEp6T2lDWGhkYmxtWkUrQ0VoZUVvbzZpMGk3?=
 =?utf-8?B?NEFtcTdkL3NteUxtR1FCMFkzZlQ0c0JSVHRVK2FYZkxmUDFQelBkSTRzSUc0?=
 =?utf-8?B?ZUpVb2hhSjBlVlNIZUc3V1ZoTWxuRWd2dGgvbjZKd1ZvREUvUk9wM3l6RW92?=
 =?utf-8?B?TlNHN3pFSTVZRTRTb2xYVnN6RzVNOFJUeGl6eFJXUkRKU0lLZkxEU1RjV2hW?=
 =?utf-8?B?QUpvQzhES0hkYUhZSTI4R0xGdmx1L1djZCtjRmowSFVLR0dpQlpnRmZSRVNM?=
 =?utf-8?B?MGtRMXZ4ZjdYOEQ3QUcrVXFiblZib0lDelJ4VkFmcE5rZWVqR1FGRGtkYVJN?=
 =?utf-8?B?dDdrV0Z0UHBqNmtDYk9LWWxiYVoraVZXZlZYL3o3Y1czSFJuUHZvWjhDRS9l?=
 =?utf-8?B?WDRIWCs3aEtGSWpVWC82bFYvZXpGL0o5VE5RbWs0QjBQSktmcWRzcjFOU3pL?=
 =?utf-8?B?emNqK3BMdVNNYUl6NUgxSTB0R2hsdVdaQm1nVkpob0g4djh1VGcvMGYvVW5Y?=
 =?utf-8?B?UDN6UUJVRGFlbnhZVGhqYWNWRUdIQmNCSWRNV2pxbVRjVXlkNnY3eGtmZk1M?=
 =?utf-8?B?TGd5U3dWSHdsbXJZUWxZZHhEQStreUxoVzNnNFVoeUFmU3dYTjZjczdUMzh5?=
 =?utf-8?B?bTZYRnlBS01nbzdpMTZGRkJWQVpWTG9tN2I2NEN5RCtNakcreWtKVlYxMDRa?=
 =?utf-8?B?UHdFcE01UVV4cWk5cUtXVWp0SlJSWUxRUWppb3lNQ3dIbjZUVTdFSTZ2L0xt?=
 =?utf-8?B?d2JlUE55VEY3Wkx5OEMycmJKWERSMFZWRCtuc0ZRYW5JQTNHa0Y0OFYyYmk0?=
 =?utf-8?B?Y1d1TUtKdGEvczByM09zMUkvMFpSMERxbUZkeVNmZWxUbGpneUM1RmF4bjJv?=
 =?utf-8?B?bWZqUmhHaGRjRmZtSzdVWUxBVTc5TTl6bEdOK2FMa1NvaGZRNHJNeDhiVmd5?=
 =?utf-8?B?OUtndzBCODEvK0NuZ1U4ZER1S3lJSklkeStFM0phcDF5MGZjN3Z0eWNMMUxZ?=
 =?utf-8?B?b1NlTkRiQjJUWWltSm40VzlycDI3VkM1OTRabnk3R1VyUlVGRWlRcytNWVNF?=
 =?utf-8?B?SVppMjRFUTd1a0VPN0RUb3dDKzR1US9rT0JRcUpXMzFqSmJuekJDRFJhUnJw?=
 =?utf-8?B?WnRQdUd5SzVnTnlzWnlqMlVBNlF6cDdqLzJrcDF6NmNFZ3hmNTlwaHI5MjNK?=
 =?utf-8?B?aERvcW9kTGJROTRmMzlwU1RxL0x5OUNnL0I4NmI2dTBXdkIyZG5Mcnd3czRy?=
 =?utf-8?B?U2FyRE9ZUVNVSFdYbHhpeUh3Q0MyZkJ5ODhMdm01S1B4SWY4djBnQ0NqaWp2?=
 =?utf-8?B?TXlmbTZ0QmVXcnJGTlVPWUpySWwrTEJrai9CajVrYllOZWJlSmNYLzRvTENW?=
 =?utf-8?B?d3pvcHpDWTk2L1plU3ZuTDhDa25kMEc2Q0tFbEdqOS9sdXdUcEs0K0lmNjFP?=
 =?utf-8?B?Q3hTM0tLSlluNklMNmNoVGtuWjNINEdRTzhrMVNMRnNrRGdTbE1GdFF4Nmsx?=
 =?utf-8?B?dVdod0hmNkNERmxHMW5LSEt5OXNhNHRwYVpGUFI1bVphNFpmNWFtQURBSVh6?=
 =?utf-8?Q?2mhI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4974e4-3539-492d-6c24-08dd9ec47736
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 15:21:21.0823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZdINJxcmW+JE2Kob2EVZVVYAFkjiDH2W0ejUdjU4g7RQcjOJ94dBZa5AhdueZUg5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7172

Hi Reinette,

On 5/22/25 17:05, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
>> MBM events can be configured using either BMEC (Bandwidth Monitoring Event
>> Configuration) or the mbm_cntr_assign mode.
>>
>> Introduce a data structure to represent the various event configuration
>> modes and their corresponding values.
>>
>> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> 
> I cannot recall suggesting this.
> 
> (/me digs)
> 
> Are you perhaps referring to https://lore.kernel.org/lkml/d2966a26-4483-4808-a538-bb20973dd2a1@intel.com/

Yes.
> 
> This is not referring to new modes but the existing mbm_cntr_assign modes.
> resctrl knows which "mbm_cntr_assign" mode is active and it can use that
> to determine whether BMEC can be exposed to user space or not. There is
> already enough information in resctrl to know whether BMEC files should be
> exposed or not.
> 
> I think this work self makes clear that these modes are useless since
> patch #25 that determines whether to hide BMEC files doesn't even
> use it.

Sure. I will remove change related to mbm_mode.

> 
> 
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v13: New patch to handle different event configuration types with
>>      mbm_cntr_assign mode.
>> ---
>>  fs/resctrl/internal.h         |  6 ++++--
>>  fs/resctrl/monitor.c          |  4 ++--
>>  fs/resctrl/rdtgroup.c         |  2 +-
>>  include/linux/resctrl_types.h | 11 +++++++++++
>>  4 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 9a8cf6f11151..0fae374559ba 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -55,13 +55,15 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
>>   * struct mon_evt - Entry in the event list of a resource
>>   * @evtid:		event id
>>   * @name:		name of the event
>> - * @configurable:	true if the event is configurable
>> + * @mbm_mode:		monitoring mode (BMEC or mbm_cntr_assign)
>> + * @evt_cfg:		event configuration value decoding reads, writes.
>>   * @list:		entry in &rdt_resource->evt_list
>>   */
>>  struct mon_evt {
>>  	enum resctrl_event_id	evtid;
>>  	char			*name;
>> -	bool			configurable;
>> +	enum resctrl_mbm_mode	mbm_mode;
>> +	u32			evt_cfg;
> 
> This very important yet totally unrelated member sneaked in without
> any mention.

Yes. We only need evt_cfg. I will just add it as separate patch.

> 
>>  	struct list_head	list;
>>  };
>>  
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 2548aee0151c..8e403587a02f 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -903,12 +903,12 @@ int resctrl_mon_resource_init(void)
>>  	l3_mon_evt_init(r);
>>  
>>  	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_TOTAL_EVENT_ID)) {
>> -		mbm_total_event.configurable = true;
>> +		mbm_total_event.mbm_mode = MBM_MODE_BMEC;
>>  		resctrl_file_fflags_init("mbm_total_bytes_config",
>>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>>  	}
>>  	if (resctrl_arch_is_evt_configurable(QOS_L3_MBM_LOCAL_EVENT_ID)) {
>> -		mbm_local_event.configurable = true;
>> +		mbm_local_event.mbm_mode = MBM_MODE_BMEC;
>>  		resctrl_file_fflags_init("mbm_local_bytes_config",
>>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>>  	}
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 752750e3e443..f192b2736a77 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1152,7 +1152,7 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
>>  
>>  	list_for_each_entry(mevt, &r->mon.evt_list, list) {
>>  		seq_printf(seq, "%s\n", mevt->name);
>> -		if (mevt->configurable)
>> +		if (mevt->mbm_mode == MBM_MODE_BMEC)
> 
> This can instead be a call to a utility that returns whether BMEC should be
> visible based on resctrl_mon::mbm_cntr_assignable and rdt_hw_resource::mbm_cntr_assign_enabled
> (via resctrl_arch_mbm_cntr_assign_enabled() of course).

Sure. Will do.

> 
>>  			seq_printf(seq, "%s_config\n", mevt->name);
>>  	}
>>  
>> diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
>> index a25fb9c4070d..26cd1fec72db 100644
>> --- a/include/linux/resctrl_types.h
>> +++ b/include/linux/resctrl_types.h
>> @@ -47,4 +47,15 @@ enum resctrl_event_id {
>>  	QOS_NUM_EVENTS,
>>  };
>>  
>> +/*
>> + * Event configuration mode.
>> + * Events can be configured either in BMEC (Bandwidth Monitoring Event
>> + * Configuration) mode or mbm_cntr_assign mode.
>> + */
>> +enum resctrl_mbm_mode {
>> +	MBM_MODE_NONE,
>> +	MBM_MODE_BMEC,
>> +	MBM_MODE_ASSIGN,
>> +};
>> +
>>  #endif /* __LINUX_RESCTRL_TYPES_H */
> 
> Reinette
> 

-- 
Thanks
Babu Moger
