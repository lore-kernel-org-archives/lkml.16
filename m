Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C34E2DFA58;
	Tue, 15 Apr 2025 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744741311; cv=fail; b=EIVTPgZLdf6Fmu3oBX65PrubO4R55lvoVaQ7SRwu+DJPRxnwJaA1adVCdRfKkIw8ROLlYjmGe0A088JfTaHRAo08fS1CTSQwCYKy1Pq4utdPNuBFAZY2piKvhiZE0IZ8evTslOptNjOkBBPTFQWpmU6jYLBadAGmEg5gKYcUDZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744741311; c=relaxed/simple;
	bh=stWi1NjSDFAu5k1W2g6lXUd3qQ2xtPpMZXlaNX6FIN8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E4ejkwl7iM4rYDQCf4KEANQx/htwHjkMnySQOsjMYIihwC78km06cWjpz1C0ErUSX74liP44O7kRsXhT/cWj8XydXpiPWfQVCXQSUVD8J6P22EevwParqcF9pxhCYjDPAN5Pep2U+memKli6dqGdTOMUAKe9+lwkQKf8UvcUUqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QTBaUtuh; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QTBaUtuh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwgSOJiXBKaCPUdOuL44bDeugYce2rLD6V6mJ4sJW8/LKaNWuEG+nuBXWuKPALRigW8qSkADb/9pyVbY82c7wUkbkWDJlKElX6vruKuWpCE9uoSAl0keXfgQ0trmdxdJ7QV/vUOSm+zX+09kvVkY/qlug2oBw0nq7AMaGu4Ya0zuxIBKFcsJA5Dz7YW7l4TKEGBTtB75Sgv3C70NA5z0v1x1qP9eKUFczXCQRyitFYm2PNWFsQ2zduCFBvJPNHTPkQLU6U4iY6evcTgbhuZJQv2a6i2W0F+EBUBiZ4FpaZ6dciNNc4ek4pVlPkyaBQkI1qLK9UZH2zT9w0wtxyriGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBajjfZ+fioY7s1n4ILwpYIOrrqu56hYJQDYIghGQ6w=;
 b=vAeAK+1mgBTSQhG0W8L1qNCFney5OmlD0MGNNxr/8ulQOeU+bUHxAxwby8ckZkZykl1Cdw+DoCva7RSngzgaAWX/rfjeRvC40T+wVOgsZ6c9tVgbjsjnSFLUSMh9WL1f7kzYw3/tvu5eon0td81ndg/JAndQPktyNTIZqJlYKG4aH07dEfnFdxjyuSD9WASETAy6h25R7KepcVTI5IQLu4kzW3BJrrku+RqZJtDDnJHott9pQ9k/rJe6f+FWeYLR12Rkh1RT1w4FVLF7aKys6Vhf2MKZQF1i2gN790RA+z9fRnwvLO38OVr8rLOy5vLIHJW3NgTzlH0oq3eNa91Eqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBajjfZ+fioY7s1n4ILwpYIOrrqu56hYJQDYIghGQ6w=;
 b=QTBaUtuhEqEt0TZtGowxrWYU56wgJWIAZ+zS12xFQvxZQYA5UD52jJ36sxuithLC87iZPSCx34mHRkjFkKNNXmcZd8hXlJmI2sCIK2Ds4mj+rJHfq7YM/9D1f96lCx7pN9FNmU0YyzU0nFCYMWn6aEN9B7ZZZtBzqy3FsAjBAGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 18:21:43 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8655.021; Tue, 15 Apr 2025
 18:21:43 +0000
Message-ID: <55a6ad1e-0ee5-477c-9779-e63e27df4e6e@amd.com>
Date: Tue, 15 Apr 2025 14:21:41 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250408203330.801792-1-pratap.nirujogi@amd.com>
 <128ded89-f8e2-6306-47eb-2275b3f33a6c@linux.intel.com>
 <9eca90b4-af50-4f10-91c7-ea76c4a05906@amd.com>
 <4954843f-6e5c-a025-257e-08cc620d34af@linux.intel.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <4954843f-6e5c-a025-257e-08cc620d34af@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0175.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::9) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: a652b0f0-7d3a-4adc-41e2-08dd7c4a5f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUY2blN6ZEVGRExWZFNMWUZkY0haRjczUVFmTStWTGc5Z3ZsRDIyKzNhWEpK?=
 =?utf-8?B?Q1E3enhzdVZzT0g0dlRUTEpPeTNZdjhJS2pwa3lSREkxTHBmeFZwd3h6Ymwy?=
 =?utf-8?B?cGhZcmFxNVhVQVJLODVmamI4b0Nsc3N2cmYrSU5ZdjAza01MVkR6SWdDVTMy?=
 =?utf-8?B?QUpDNzVIZm8rRjRNRjJEV3g2Q3pZQkRwdWxhMXpNNlBxbEM4ZTdSNEdabkRK?=
 =?utf-8?B?bU5pNTBraWpZNlVYYzVQa0NXRUZCKy9nTUdDc2ZuQllCZUgwZTdLNERBOHRk?=
 =?utf-8?B?RzRtbmdWUzVGUTZqQURYdkhJV1RGL3AzVk5wZDBhYnRZblhFT3N0L2xmNVZj?=
 =?utf-8?B?RjlWTTJuaWpORXRJc3pEME82TDk0KzNoay9mZmkzUHphaGN1L2dzdmJ4cnpW?=
 =?utf-8?B?amFhSk95VUlmL2M4bXBZOHp4dVNnNU9VTXVMVHVqUElUcmN2aVlaaENKVUls?=
 =?utf-8?B?c1IwaUJBRkJEbTllekZwd2I3MFJCNVRRblBib0NEUlhhYTJXa1Z2MlY0bURj?=
 =?utf-8?B?Q3VVYnRjZVBab0lpSHFxS2RUN2dRQzhTaDY0RHJieU1hdGdNYm4xWW93QmhI?=
 =?utf-8?B?R0ppMVNtdHI2NkZOQUJRQlJJcWNDRTVSNHZJYk1TeW15dkFZY09aOG5uaUkv?=
 =?utf-8?B?S1NxMkN6KzI4SzZodzFDZFB6blJSSWdsY2VYOC9FNTZrWlZUNm5vbE52N2Fl?=
 =?utf-8?B?TlJGREFPeFJoM0FqSHd0ZE5kMWV4dFh0ZUpaT2J1NDdBUWFhNUtoSm1MTlRH?=
 =?utf-8?B?S2xMMlUzUUMxMXl5ck13TWlsL2NGRDJaSlR3ZnNHQzgxeWlvNVJJL24wV0xL?=
 =?utf-8?B?S0FKUllEOW5Rdk9zU1BkcUJucmdnSk5tMXJvQ3FiYU84VjdGeUpuWTl4WG9L?=
 =?utf-8?B?OUpjNUw1QU5RU3V0Um5kM0lJYmgzZXhzMUkrRXVNSUJ4cllzblZCV250LzFB?=
 =?utf-8?B?bS9BMEFSSy81ajhza1liUzZXRHJxS1NwbVNkU3owRmEvbTU2ZDlTUXhaQXVH?=
 =?utf-8?B?ZGF0aGVTWjBBNzFyYnF4MEhSRkdUWkxpMllIZFoxRXUyeEM3eFBoemRNL2M5?=
 =?utf-8?B?UXkwa3crUUZ2bUJLdkhOSG9ZT1ZxQmU1bFhnZFkxU0FxNnQ0Q3hkRVdWKytE?=
 =?utf-8?B?RFdRY3AzSERwVkhDbFZSK0JIU1JtVmJXZ090QXRkTU96NVArV3pQOUYwWHkr?=
 =?utf-8?B?b0ZDdlVyMG5lWFF0dHNaZ1o1SnVGVWZic0w0dUVUaUhUWGhadkttNFBtSDdw?=
 =?utf-8?B?VHlNa21vTHpwRnMwSW1vZ2RGd3lFSlhxSlFmVm10R3piNmZRY2JmNGdMcDN0?=
 =?utf-8?B?Q0VLa2JoMXhGRXhKVHpIQkI5ODZybU00SGRIYkJYVUVaSUVSRmhCMVN0S09p?=
 =?utf-8?B?NmdsUGxTcTVQWDg4SU9DN0lkR1V5OXlaQnJsUm1mR2hVYVdVVVp6VENWNE9K?=
 =?utf-8?B?RXhCV1E3T3dJRlR1SzFKV0RDTmxKRjdnemp4Zk5XbWQzMTExeDNFNzFzdnBO?=
 =?utf-8?B?QjhMRzlYaEhYSk5rYmt2UFd5WTBiMWNCVmJ5YkxJMXFTWkN2Y3A5MkJ1MDhO?=
 =?utf-8?B?elFkWmtVNjNxVE5mU0NYb1VPRjhJUzNiV0lCdTVGWHJiMGRWaktGb3p0ZFoz?=
 =?utf-8?B?QVFDakJOekxaVGdQTDRNa0Flb3JlSllycktFT0xGWVdLV1ArTEZNZ21BRFVM?=
 =?utf-8?B?S3VrY0ZiekFjUm82SHRFck1CcUlIbklLRDBhd3J6RGE2MjlzYVBYRVpncVVk?=
 =?utf-8?B?N3RKSjhjejJVWjNVWm1nWXJLZFpDWFFkUkljOU1WQlVhbGIzSVJreDRmamdl?=
 =?utf-8?B?SjljQmhlOEQzb2pLbFBrcFJCZkk0MWdEdW5qZXYxdHFzQXFaZFdBZWRDRjlT?=
 =?utf-8?B?elpha3VtYy9pSHd3MTd0K3U5WjNBUnRYUkJJK0cvSGVIc1lzZXdyN1BmeXVy?=
 =?utf-8?Q?2RQMxwRhABc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlJDM3FpTmJwZnBFTXRUTU5GSXlUbUNLMWtOTWFXZDBXRWhQK1YxZFhKSkt6?=
 =?utf-8?B?U2NwNnYwZ0ZUbXdWTVAvVjhIMlRYL2JYZ3l4WHJXS2U2R1JKdGM1NlVCZ21E?=
 =?utf-8?B?SzJqd3NzVngxVHYzSUYvZlREUHZUc2xCUURBYlNaQ01acCt6OC8zSTlCcS83?=
 =?utf-8?B?UjdJNExlVGsvbFRvaTlRMFROOGFKb3hQemhoM0FSUkZtVnVRaEhPMm5ldlpH?=
 =?utf-8?B?SlpPL2RGZDZsT1A3WGNkUFh6aEdCVEx2amxtTTB6ZlFmYi83TFR5RVJZMWRv?=
 =?utf-8?B?bTRQWVV6ZVhoRDRGSWV5Z0FXMWZsd0ZUdGlVNmNYTUlzRkxKK1lDbjgxMFBD?=
 =?utf-8?B?RWR6d0dxVVp2UDJFZSs3ZjBwVmlqTVl5RXVPeEtKZURReGJXaitYMEpwc2c1?=
 =?utf-8?B?U2h0UFNxTUs5dW9IMitTaVJhNGNGeGRRQW9jeEh1QWwxTVdhbEFMWWN6Nnh6?=
 =?utf-8?B?Mys2Vm43RWo3ZlZBUzgzZDk5ZnZEL3lVK2F0Qk5wSVR0c0dRa2R5UWZoTnJQ?=
 =?utf-8?B?bmpGV2xSY01wWi9JWFpNSGNXQ2lDRm5Yck5RaVdpdHRUMXRDQXZTZzhOY2xP?=
 =?utf-8?B?dkZLMzU1VUtRb2VFWE91bFlVUjc2RG9hTCtMTENOYWY1NVREbHZaWFo2cjJH?=
 =?utf-8?B?VDNBdkxqeU5sbU8yM3dJb25JZmhFRDg3YTMvVmxNT0NYa1k4SGNPRFF0UCsv?=
 =?utf-8?B?Q01OT0ZnUHZUOG1OVkJBdkwxbStWYzcxY25neUVzYS84Ri9QS2N4S1YyWXRY?=
 =?utf-8?B?MXpWYUV1eTM1ekFKcHNsVE95dG5kRDZNb2VLUzhHOTJKT3ZzZ2xwc1VlVkdN?=
 =?utf-8?B?dEZWYmtqYlpkb0VVVlZMWkY4WkV2Nzl2d3dyRU9VQlFGazY4c1JUYnVQcFY4?=
 =?utf-8?B?d2h5ckFSODhpN3g5bko4MFBUajkrT3Jzdno3cEtRU2h3NUJHNHR3dWJjRzdQ?=
 =?utf-8?B?d1pORHY1WnlDeFRtQmlyWEk4alpmc1krMnlPYmhZSHZ4RDZPMVA4NWtRa3M5?=
 =?utf-8?B?YlllcHczVUwzbGRnczNwRUp3WGdGVzBoNEhYV1J4QzYxR09sL0Fwa241Ymw1?=
 =?utf-8?B?c1d2c3JRU2RvZ2dnYWp0VjdsdTJMMFhTMlR2Umhta0lrRkQ1dk9IeE1YQ01S?=
 =?utf-8?B?OHNWd2VzM3ZzWGFnWkRJTHZwY3paK0JYQnVZc2VuWDF5dEJrQkxJd2g1aEx1?=
 =?utf-8?B?MTluQk5FMmhRaFg3SmFpdFpIR01PZ0ZNRHBQUEhGVE1QY3VXcUhIZFNFeE4v?=
 =?utf-8?B?MVhlRmJMNkkyaGM3dVgrZERqZjMwc3dFSnhvZVMvQURndi8zLzNveklzS1dX?=
 =?utf-8?B?OU1HcVRkWG5aUmVNN1dhVWNUYnVoVkpvOXJ5VHNXL1VZRDl5WVRoVTVTTk90?=
 =?utf-8?B?WjA1dURTZGN1OFNTbGc4UGRMY3lmTitCU2pFZHFPYXcvS3FGZ1QvSWROdFFS?=
 =?utf-8?B?MllVcjI3aDUxMDROS085UGdpTGNJdmVkY2ttaTFiZ0E4cUFadlpTTW4zQURw?=
 =?utf-8?B?RjYrTU1LNSt5Y3AzRFBWcmdybzVPVDh1UjA4aDVlaHoydkRCcnlPaVppY0FL?=
 =?utf-8?B?aSs4WkhOZjUzZE1td29iVHdhSzNjVXZ4aHo5cDErQzNGT3Zoa1hZM09qOWhR?=
 =?utf-8?B?REdJbGs1SVZia1NaQ3ZpSXF0WVNLTW9pM3RFSnpLN2pWb1BUNmxUOWtBVnFF?=
 =?utf-8?B?anRYNmFLazVKTGJMaVNHckxFcHBiM2ZHcHBzVnNlQVNTS2JLa3Rtdm5ScHZF?=
 =?utf-8?B?MkJuZzBtN1FwaTRKTGRPWFJJdDZqbUZFcFZ3Z0o2dDQ4Y0grY1JBWUo5NUxj?=
 =?utf-8?B?OHd4U2JEZXk1Z0dnUVIybXJyK0JNQmlXeGgzUThmL0lTa1l0T1Y5ZFcwVW5n?=
 =?utf-8?B?T1Y0aUpUUXdBMVprWCt2YTRWMkZXTFdmN3ViWU15MWRuZW13ajFsZC95ZGc0?=
 =?utf-8?B?UEkvcnNXdE8rWC8wRE4yS3FFdmVuVlZBNmNYUlVVNXQvWWV6VnhPVktoUG92?=
 =?utf-8?B?M0ZxQ1ppdVNoMkZHL0ZncFBLMFlTSGdwblJQWXE3MjNuWk9ZZ0dHcmUvbEND?=
 =?utf-8?B?RUJORnFkRU1ZcElXUmttOGpBbG42SDdWaS80NUpucmVSVDBSVXhwaGNTMFNJ?=
 =?utf-8?Q?pMydpA635gN9GlGk1armu34NR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a652b0f0-7d3a-4adc-41e2-08dd7c4a5f90
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 18:21:43.1699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZ2M5UXEA0ltFLzNAtzMbP3LBDtOKEwPbREfe1adAKMqmtKJ2jc2uq/m7Vpf2Fs0sp2BwH+TcrbjGgbB/s38sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972



On 4/15/2025 1:49 PM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, 15 Apr 2025, Nirujogi, Pratap wrote:
> 
>> Hi Ilpo,
>>
>> Thanks for the review feedback.
>>
>> Thanks,
>> Pratap
>>
>> On 4/15/2025 11:42 AM, Ilpo Järvinen wrote:
>>> Caution: This message originated from an External Source. Use proper caution
>>> when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Tue, 8 Apr 2025, Pratap Nirujogi wrote:
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
>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>>> Changes v4 -> v5:
>>>>
>>>> * Avoid global variables and make driver reentrant following the
>>>> state container design pattern.
>>>>
>>>> * Fix coding error referencing i2c_dev variable of amdisp_platform
>>>> in instantiate_isp_i2c_client().
>>>>
>>>> * Remove i2c_put_adapter(). Not required as i2c_get_adapter() is not
>>>> called.
>>>>
>>>> * Use i2c_board_info->swnode instead of fwnode to fix refcount imbalance
>>>> warnings when module is removed.
>>>>
>>>> * Address review comments.
>>>>
>>>>    drivers/platform/x86/amd/Kconfig    |  11 ++
>>>>    drivers/platform/x86/amd/Makefile   |   1 +
>>>>    drivers/platform/x86/amd/amd_isp4.c | 295 ++++++++++++++++++++++++++++
>>>>    3 files changed, 307 insertions(+)
>>>>    create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>>>
>>>> diff --git a/drivers/platform/x86/amd/Kconfig
>>>> b/drivers/platform/x86/amd/Kconfig
>>>> index c3e086ea64fc..ec755b5fc93c 100644
>>>> --- a/drivers/platform/x86/amd/Kconfig
>>>> +++ b/drivers/platform/x86/amd/Kconfig
>>>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>>>
>>>>           This mechanism will only be activated on platforms that advertise
>>>> a
>>>>           need for it.
>>>> +
>>>> +config AMD_ISP_PLATFORM
>>>> +     tristate "AMD ISP4 platform driver"
>>>> +     depends on I2C && X86_64 && ACPI && AMD_ISP4
>>>> +     help
>>>> +       Platform driver for AMD platforms containing image signal
>>>> processor
>>>> +       gen 4. Provides camera sensor module board information to allow
>>>> +       sensor and V4L drivers to work properly.
>>>> +
>>>> +       This driver can also be built as a module.  If so, the module
>>>> +       will be called amd_isp4.
>>>> diff --git a/drivers/platform/x86/amd/Makefile
>>>> b/drivers/platform/x86/amd/Makefile
>>>> index c6c40bdcbded..b0e284b5d497 100644
>>>> --- a/drivers/platform/x86/amd/Makefile
>>>> +++ b/drivers/platform/x86/amd/Makefile
>>>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>>>    obj-$(CONFIG_AMD_HSMP)               += hsmp/
>>>>    obj-$(CONFIG_AMD_PMF)                += pmf/
>>>>    obj-$(CONFIG_AMD_WBRF)               += wbrf.o
>>>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>>>> diff --git a/drivers/platform/x86/amd/amd_isp4.c
>>>> b/drivers/platform/x86/amd/amd_isp4.c
>>>> new file mode 100644
>>>> index 000000000000..ad181ab96423
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>>>> @@ -0,0 +1,295 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * AMD ISP platform driver for sensor i2-client instantiation
>>>> + *
>>>> + * Copyright 2025 Advanced Micro Devices, Inc.
>>>> + */
>>>> +
>>>> +#include <linux/acpi.h>
>>>> +#include <linux/device/bus.h>
>>>> +#include <linux/dmi.h>
>>>> +#include <linux/gpio/machine.h>
>>>> +#include <linux/init.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/mod_devicetable.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/property.h>
>>>> +#include <linux/units.h>
>>>> +
>>>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>>>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>>>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>>>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>>>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>>>> +
>>>> +/*
>>>> + * AMD ISP platform definition to configure the device properties
>>>> + * missing in the ACPI table.
>>>> + */
>>>> +struct amdisp_platform {
>>>> +     const char *name;
>>>> +     u8 i2c_addr;
>>>> +     u8 max_num_swnodes;
>>>> +     struct i2c_board_info board_info;
>>>> +     struct notifier_block i2c_nb;
>>>> +     struct i2c_client *i2c_dev;
>>>> +     struct software_node **swnodes;
>>>
>>> Can't this too be const struct so you can avoid a few casts below?
>>>
>> Thanks. I will make it a const and remove the unnecessary casts in V6.
>>
>>>> +};
>>>> +
>>>> +/* Top-level OV05C10 camera node property table */
>>>> +static const struct property_entry ov05c10_camera_props[] = {
>>>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>>>> +     { }
>>>> +};
>>>> +
>>>> +/* Root AMD ISP OV05C10 camera node definition */
>>>> +static const struct software_node camera_node = {
>>>> +     .name = AMDISP_OV05C10_HID,
>>>> +     .properties = ov05c10_camera_props,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>>>> + * ports node for OV05C10.
>>>> + */
>>>> +static const struct software_node ports = {
>>>> +     .name = "ports",
>>>> +     .parent = &camera_node,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>>>> + * port node for OV05C10.
>>>> + */
>>>> +static const struct software_node port_node = {
>>>> +     .name = "port@",
>>>> +     .parent = &ports,
>>>> +};
>>>> +
>>>> +/*
>>>> + * Remote endpoint AMD ISP node definition. No properties defined for
>>>> + * remote endpoint node for OV05C10.
>>>> + */
>>>> +static const struct software_node remote_ep_isp_node = {
>>>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>>>> +};
>>>> +
>>>> +/*
>>>> + * Remote endpoint reference for isp node included in the
>>>> + * OV05C10 endpoint.
>>>> + */
>>>> +static const struct software_node_ref_args ov05c10_refs[] = {
>>>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>>>> +};
>>>> +
>>>> +/* OV05C supports one single link frequency */
>>>> +static const u64 ov05c10_link_freqs[] = {
>>>> +     925 * HZ_PER_MHZ,
>>>> +};
>>>> +
>>>> +/* OV05C supports only 2-lane configuration */
>>>> +static const u32 ov05c10_data_lanes[] = {
>>>> +     1,
>>>> +     2,
>>>> +};
>>>> +
>>>> +/* OV05C10 endpoint node properties table */
>>>> +static const struct property_entry ov05c10_endpoint_props[] = {
>>>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>>>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>>>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>>>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
>>>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>>>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>>>> +     { }
>>>> +};
>>>> +
>>>> +/* AMD ISP endpoint node definition */
>>>> +static const struct software_node endpoint_node = {
>>>> +     .name = "endpoint",
>>>> +     .parent = &port_node,
>>>> +     .properties = ov05c10_endpoint_props,
>>>> +};
>>>> +
>>>> +/*
>>>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>>>> + * fixed to align with the structure that v4l2 expects for successful
>>>> + * endpoint fwnode parsing.
>>>> + *
>>>> + * It is only the node property_entries that will vary for each platform
>>>> + * supporting different sensor modules.
>>>> + */
>>>> +#define NUM_SW_NODES 5
>>>> +
>>>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>>>> +     &camera_node,
>>>> +     &ports,
>>>> +     &port_node,
>>>> +     &endpoint_node,
>>>> +     &remote_ep_isp_node,
>>>> +     NULL
>>>> +};
>>>> +
>>>> +/* OV05C10 specific AMD ISP platform configuration */
>>>> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
>>>> +     .name = AMDISP_OV05C10_PLAT_NAME,
>>>> +     .board_info = {
>>>> +             .dev_name = "ov05c10",
>>>> +             I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>>>> +     },
>>>> +     .i2c_addr = AMDISP_OV05C10_I2C_ADDR,
>>>> +     .max_num_swnodes = NUM_SW_NODES,
>>>> +     .swnodes = (struct software_node **)ov05c10_nodes,
>>>> +};
>>>> +
>>>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>>>> +     { AMDISP_OV05C10_HID },
>>>> +     { }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>>>> +
>>>> +static bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>>>> +{
>>>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>>>> +}
>>>> +
>>>> +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10,
>>>> struct i2c_adapter *adap)
>>>> +{
>>>> +     struct i2c_board_info *info = &ov05c10->board_info;
>>>> +     struct i2c_client *i2c_dev;
>>>> +
>>>> +     if (ov05c10->i2c_dev)
>>>> +             return;
>>>> +
>>>> +     if (!info->addr) {
>>>> +             dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
>>>> +                     ov05c10->i2c_addr);
>>>
>>> Put on a single line, you've longer lines already than what this is.
>>>
>> sure, will fix this in V6.
>>
>>>> +             return;
>>>> +     }
>>>> +
>>>> +     i2c_dev = i2c_new_client_device(adap, info);
>>>> +     if (IS_ERR(i2c_dev)) {
>>>> +             dev_err(&adap->dev, "error %pe registering isp
>>>> i2c_client\n",
>>>> +                     i2c_dev);
>>>
>>> Ditto.
>>>
>> sure, will fix this in V6.
>>
>>>> +             return;
>>>> +     }
>>>> +     ov05c10->i2c_dev = i2c_dev;
>>>> +}
>>>> +
>>>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>>>> +                           unsigned long action, void *data)
>>>> +{
>>>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct
>>>> amdisp_platform, i2c_nb);
>>>> +     struct device *dev = data;
>>>> +     struct i2c_client *client;
>>>> +     struct i2c_adapter *adap;
>>>> +
>>>> +     switch (action) {
>>>> +     case BUS_NOTIFY_ADD_DEVICE:
>>>> +             adap = i2c_verify_adapter(dev);
>>>> +             if (!adap)
>>>> +                     break;
>>>> +             if (is_isp_i2c_adapter(adap))
>>>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>>>> +             break;
>>>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>>>> +             client = i2c_verify_client(dev);
>>>> +             if (!client)
>>>> +                     break;
>>>> +             if (ov05c10->i2c_dev == client) {
>>>> +                     dev_dbg(&client->adapter->dev, "amdisp i2c_client
>>>> removed\n");
>>>> +                     ov05c10->i2c_dev = NULL;
>>>> +             }
>>>> +             break;
>>>> +     default:
>>>> +             break;
>>>> +     }
>>>> +
>>>> +     return NOTIFY_DONE;
>>>> +}
>>>> +
>>>> +static struct amdisp_platform *prepare_amdisp_platform(const struct
>>>> amdisp_platform *src)
>>>> +{
>>>> +     struct amdisp_platform *isp_ov05c10;
>>>> +     const struct software_node **sw_nodes;
>>>> +     const struct software_node *sw_node;
>>>> +     struct i2c_board_info *info;
>>>> +     int ret;
>>>> +
>>>> +     isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
>>>> +     if (!isp_ov05c10)
>>>> +             return ERR_PTR(-ENOMEM);
>>>> +
>>>> +     info = &isp_ov05c10->board_info;
>>>> +
>>>> +     sw_nodes = (const struct software_node **)src->swnodes;
>>>> +     ret = software_node_register_node_group(sw_nodes);
>>>> +     if (ret)
>>>> +             goto error_unregister_sw_node;
>>>> +
>>>> +     sw_node = (const struct software_node *)src->swnodes[0];
>>>> +     info->swnode = sw_node;
>>>> +
>>>> +     return isp_ov05c10;
>>>> +
>>>> +error_unregister_sw_node:
>>>> +     software_node_unregister_node_group(sw_nodes);
>>>
>>> If register failed, why you are calling unregister for it??
>>>
>> This is not intended, thanks for catching this, will fix it in V6.
>>
>>
>>>> +     kfree(isp_ov05c10);
>>>> +     return ERR_PTR(ret);
>>>> +}
>>>> +
>>>> +static int amd_isp_probe(struct platform_device *pdev)
>>>> +{
>>>> +     struct amdisp_platform *ov05c10;
>>>> +     int ret;
>>>> +
>>>> +     ov05c10 = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
>>>> +     if (IS_ERR(ov05c10))
>>>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>>>> +                                  "failed to prepare amdisp platform fw
>>>> node\n");
>>>
>>> fwnode
>>>
>>> Please also capitalize properly as this is user visible message, AMD ISP ?
>>>
>> sure, I will capitalize the words and fix the spacing as suggested in V6.
>>
>>>> +
>>>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>>>> +
>>>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>>>> +     if (ret)
>>>> +             goto error_free_platform;
>>>> +
>>>> +     platform_set_drvdata(pdev, ov05c10);
>>>> +     return ret;
>>>
>>> return 0
>>>
>>>> +
>>>> +error_free_platform:
>>>> +     kfree(ov05c10);
>>>> +     return ret;
>>>> +}
>>>> +
>>>> +static void amd_isp_remove(struct platform_device *pdev)
>>>> +{
>>>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>>>> +
>>>> +     if (IS_ERR_OR_NULL(ov05c10))
>>>
>>> How can this happen??
>>>
>> I agree this can never happen in the current driver. The only possibility that
>> it can happen is when platform_set_drvdata() is missed in the probe().
> 
> Just remove the unnecessary check then.
> 
ok sure, will remove this check in V6.

> --
>   i.

