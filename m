Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D32904;
	Tue, 15 Apr 2025 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744739036; cv=fail; b=fHa+w41f0S1exmHdhNLiRn0nzz3Bv6tjtLIZMzQiPuqyzkIFGqDrhQ8XjRtnqC1zsBdizGT5V2ixgr28ur1HeWwozSnEo/0EcA0+AWKlIeEdoYkLNwJvEVhUKTBD8xEkoyA6CbsnK70x206/46J/fjOrb0AjA0ZRuBw0AcrgxB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744739036; c=relaxed/simple;
	bh=1QQGpyWTPCoHLnuM0M0FuO8eGHBoGiglmm94E04NwK0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PsFCcXrPc6f5UyOqRsqzzVurKAEl+KFmRwe3ULoXd8ex1/qHST0EtNtjfu8wDIRImUp0xGGtcLwaxblpAvSDEXsuX9n984ECvWWum65jzATwUefBZ26Sb8ZgIIGe5ieKftWXmsxJgU87pni5DdW5jJysV0tFUUdcDTOt7KaeV88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G6A03Yw9; arc=fail smtp.client-ip=40.107.236.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G6A03Yw9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0+L74e9kyJQKOHXRBEP9vpRKu8Al2Y3HQG6sI75rL0Fk8aS7ESps200AhU3iFSOGhQqkO5imBeo/QVJIsaxwhorXwkDWk4Pzzpxzo5FqjtvS2/SmiIW44Tm62XT3USqZVZFQkoFB7hKJ2Y0I9AVwQc7s+R7e1FSB7tl9gijLQrZ9fmtUyWZMvYhAbqoxdrDEHsKkEmZcBJ2Q3fGpa/pl0MvH8jOyGDSq4dSCcHV7RKICyd1dLORdhnV8TNaEoH8IXsenRxgYjK4UvHn76iCz9cugOBl4PsqGeJrqSMnmGmiclkZHoBM9OGij1qSn2cK14E6tCz3Y5fhFvZ0aDyVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V31HURNzg/76zAp+3oTJrn2E7wXCP4yjxnExdx7I8Uc=;
 b=uj6b8sgKCko5iPcftu3O59M4voPMjX56mgWCqCxwRpLsM/mqI22ndwfIADTwfhI9OIbl0JYo5xvnLoO48LxTs+c3z0AF0ZBPYQ7DXnrb/MfF+WdfiZa3Kxcoo7COqxdzJX69PgeBEMqk34vEpm2Ik2QfCArFmzqiMcjTrlOoinYMa7W5ISWERMhV0XY4O/rVA0BpC1j9BJBuSQcB4gD+ad5+qBrhXO9b07htejKId5VtW/MPF8fys9uWie56igGJ+qynwKOCO+h4NbGRcC5ZHCIPuduywiKSwHNygeW2NuAvAZGaDc/B6EBDbWCRC2s88G/Mcm5WdXu5fcrB9hF7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V31HURNzg/76zAp+3oTJrn2E7wXCP4yjxnExdx7I8Uc=;
 b=G6A03Yw9mcY7eoqTcg5laXl2y9PtL2VXna5eMWhJuMfRlovQvJ6dzkDcFJSaYID2RScX6UN6BNXSl2bG7oDSbThZiNvFJuZlV+7ownJcOMqfhWAlVvJYRkCwm5pEr/HjU+inkSAF/aecsNF/8K31ToATU0RjGujpdUBGoNM2jQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by IA0PR12MB8328.namprd12.prod.outlook.com (2603:10b6:208:3dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 17:43:49 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8655.021; Tue, 15 Apr 2025
 17:43:49 +0000
Message-ID: <9eca90b4-af50-4f10-91c7-ea76c4a05906@amd.com>
Date: Tue, 15 Apr 2025 13:43:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: Add AMD ISP platform config for OV05C10
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de,
 mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, benjamin.chan@amd.com, bin.du@amd.com,
 gjorgji.rosikopulos@amd.com, king.li@amd.com, dantony@amd.com
References: <20250408203330.801792-1-pratap.nirujogi@amd.com>
 <128ded89-f8e2-6306-47eb-2275b3f33a6c@linux.intel.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <128ded89-f8e2-6306-47eb-2275b3f33a6c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::18) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|IA0PR12MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: b31284c4-66e8-4576-7fe4-08dd7c451445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXNRSDRxY0l5UnlBUVZVdVFudk9ReFBFZUZWS2pQNEJvOE5OTTZHdm5UQytt?=
 =?utf-8?B?RnMveEhWRFhlNEk5NG8zSGEvb3F4c3Irb2lZS29WQ0N0NloxQ0kybHZhYzM2?=
 =?utf-8?B?S1RPSlNyMUZoTzRTbXVHbEtwbk9XTU9Jd211UVNoVGg4dHZZcnJZYUI2aGIr?=
 =?utf-8?B?TVAyeExFeFF3UVdDV25hcDJvQjZCZnZpdDg2SzlKMXJhOTNOZnRGWW5kN3Js?=
 =?utf-8?B?YVRvWnVMTElVU2NmT1ZqSk5rbHY2Z25Yc1pBbXZYV2JlNDNWaUlkZzlFS09i?=
 =?utf-8?B?U1RYekdoMVJHQzhHMHVBeWlXWlJRazh1MEg2UmNFYTNjam1nMmlwaUQ3bS9J?=
 =?utf-8?B?cFcxUWswZUNEcGp0UFlUV3hDeVNDMTZFNFlsdjhIR0Qwcm5PdTFZSCtZNzF0?=
 =?utf-8?B?MlBEVmx6UmFlTEhVSnpMaExPZVdVK2hlTHFabzBRTWJmc0NyZG1jL29UUUtE?=
 =?utf-8?B?Q1hpbFRFVTZWSjFsZUUzSksyRnR6bi9FNUV5Ti84N2tWd25yaklJN09OdTY0?=
 =?utf-8?B?K05qdWlzbFpmSVNYNm5melN5ZUdQK3p4LzArRlFjTlpDUStoMUxFQW4vdFNI?=
 =?utf-8?B?eHJCcHIzYXplL2R1MmRHd3JYWkx5dHZyazBmdHExM0xrTDZEa01uU1plcUtQ?=
 =?utf-8?B?YTRGMHZGOEY3U04wYWxCOElkOW5IUjd3RWsxT0FzeFk5NkM4THc5MHVvOEFt?=
 =?utf-8?B?QVVYSWxmdXBxNGxYN2NLdTFZL3Jadk52blh6dG5VMERtOHdjRHZEenJBTkxK?=
 =?utf-8?B?SngyM0pQWW5ILzBUVnZYa3FCUE52V1N6ZU9jdmc4Q3FiNDU4Sm5qUnJGSFNs?=
 =?utf-8?B?ckRyRWJQdUZsZkQ3ZS9yK2Q2MlJvUkJTYnJRZ1NFOGx3MGM2bUNUS2w5LzlH?=
 =?utf-8?B?QVlVS3FUcDdkcnBTdTNkS04zOG9vanRINHBaN1o1a2lPUlpjazRsWkk5NHc3?=
 =?utf-8?B?cjlZUXdYa3ZYRDA5TU9ibGs1VFZGQjZNUnpmYUU4Rlhab2dGVkQxNEhHSGlY?=
 =?utf-8?B?eTk0MGRPWWpHR3FmWUVoQ3JFRnlIYktXTDlLUnJUMmtmeTBJRExYY2ZlS3BI?=
 =?utf-8?B?RzBzYkdjVk0xYkVNaW9WNGxOUHdrWWRBOEpTakJqTGlZMmlhdmgvWWpLeTJ4?=
 =?utf-8?B?RWZsczdIRWlZTHphRGtIRUJiS1dZckg3Y0J2REk0NGd5U2FnNXJqQ3pGVUZw?=
 =?utf-8?B?UEZid3lHOEx4MHBNVERrWFNTQTg5ZjdHNDBRTnFoY01tYmV5ZlNFek82YkRh?=
 =?utf-8?B?SXIveDZ1R0ZCTWp6SG1NUERVcGdmQk93czMwZnFYYzg4RFBxQ1oxWjAxWkIx?=
 =?utf-8?B?NE5zSHlXdXQ1a0hBaHdVZTl5TCt6SXpqYkFUSE04R0lNL1hqMVlPSTlQRDA4?=
 =?utf-8?B?VDU0SE9mSU9BdVYvSHNBNUNmQnVFRnFiK2hib3lvS0Y3dThKdWFxajcrV0VX?=
 =?utf-8?B?N2VuRzZiN3RtcUFFV05venlXeWxUb2ZJOVB1K3ppdGxCMDVGcE9PTmhiNUlp?=
 =?utf-8?B?bmtjSjllMnNmUGF2YnUrWFFodm5EUWZGYzVqOGxROVZFZEs0RHVkNW1BcDVZ?=
 =?utf-8?B?NjZ1bmNlYmFhWGlZWWwySWFid3lnNmp0S0tPZ1BHS1VkRFpTTDF6MnZUTzNY?=
 =?utf-8?B?ZS9oYURVM1pGRjcxMnhqdDRxMDNiRjdTR1hLZEJRSEsra0Rmb0trOGhVZ1Ny?=
 =?utf-8?B?enZmZHdXbStycGVmWlJWSWNubVRhdGpKSVFGYjl4U0lCaGtNTDZCRUFYN3Zj?=
 =?utf-8?B?dGxRbTJuOHZhQzN1UFNjWE9XeVRwa0pSOVd3R3J3ajM1SUtZSHVBUzJIUGlN?=
 =?utf-8?B?VmlaUjJnUlRBS284OTFQRm9xTmlLallqTVRXTnIxNW1ieXczc1kvWXgwS3NC?=
 =?utf-8?B?dGNPMm5WVG5wRHc0YzE4bGZKd1RBd0U4d1AvZXVaR1ozdHlReHE1TE1iRGJY?=
 =?utf-8?Q?SktjumcoWQk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEQ2MHU3QUltZVRZQ1hGMVI3MjZPVk4ydjZXek5JRDhTWnJvNFZIb3E3U2Vh?=
 =?utf-8?B?UEw2NE9tVnBLRW9yaWpveGVsTUoxclI2Q2xRR3NpS1dJcTR3RUR1WUk1a3Nh?=
 =?utf-8?B?WVlFN0tTbnloTW52TmZBd2NzMWx1M1MyMHBHS3NiWnA5VkhzVkN0RDFjSWdr?=
 =?utf-8?B?RzVhTXFqM2JHSzFIeGozY1RBeFhJd2kwR3ZHU2lXWitaaWFZTDBRb3p4eXJT?=
 =?utf-8?B?dlUyaTE2YXhscnZ1TnlqMEFuNlYvYkZaOTIyTVdQSXdWWjYrRUh6NElickR0?=
 =?utf-8?B?NmNIVjhxZWpTTCtaQkJaaGVST3BaYko4dVJoZmxRRjNJbWxpcjhvZUZMcWVZ?=
 =?utf-8?B?clJWQWpjZVV4TGRZUFJaWmZLR3o2bjFEVTNuN1BHTEgybEZLc0NsQy9aWGF5?=
 =?utf-8?B?b2FjMklyUjhMSzZDeFpZOVYzS1JzaTkzR05qcEh3b3RNZ3I0N3Y4QzVZdE1E?=
 =?utf-8?B?Y0VpU1kycmFTQ2FORGdCa28vbXNnRG9vcDRrSmR2MUlwaGJETHltQ2NBZXRH?=
 =?utf-8?B?TTJiTlZwZFdvUSt4Z3ZxUTdJbnJRRm9NMmpNQ1hxNHIvamVXa2toTkNnODhx?=
 =?utf-8?B?NnIyelhzVHFQWFVlSlRsYlN2ZkhIb1ZSYUdXaUxSVHRVeGIzRzJCS3BZL3lt?=
 =?utf-8?B?SFpNVHlqSVdFeC92VVZTemZPVHhTNktzM2ljOEtRZ1dMSDhCRmpKaFgrbjd5?=
 =?utf-8?B?WFdwZmc0ZDZoeVpHenh3bXRFU2dRd2dHUmtER2dVL0dUOENIbkZmckZaVGh1?=
 =?utf-8?B?c1JhMzVuTzZXTFdMT1krcHMwcTF0RGFRRGZDNVVSUko4eEdhRXJrN0dFSUp0?=
 =?utf-8?B?ZExZWHQ3dVBlaUxjWG5CQnptSkQ4RjNkQjArWXc3RDBxQXh3bGUrUmJWemNO?=
 =?utf-8?B?NlQ1ODRvVDZLUEtQQjJFTk5yOTdmYmp0TmdXTjk1R0t3VnRlY2hnTytBcVJu?=
 =?utf-8?B?YkxrazBzdnJnNTE2WWttbGhuTlVmb2dGRlVmbUV5UWtMQkRTZlhpTVpibGFW?=
 =?utf-8?B?NEhMMEUrR3IyalU4NDBIMUUyUmZ5Z2xwM2NpMHZtRkUwUzNZWFZyZENoMWxp?=
 =?utf-8?B?aGNUMkowLzdvRWhDRmxWOU9qYUU3b2JvRjZONTRJM0F6NmZHQXBIQUYrVjZ3?=
 =?utf-8?B?MXBlbkVyZGIvb0pPbmFxeW9yYXZXaGpIdGdKdnV1NENERXE0TFI4T2hPOXhs?=
 =?utf-8?B?NXlrdkVVV1lLYTRPVEI4eXhmR1ZxbDBHanowaXVReVZtMHFESXB2NENEZ29G?=
 =?utf-8?B?K2hGQ1poN3dSWU12UVVhRlZwaWRLYzliNnBJR0laaDNkS0YyRWZZL3hRNG1U?=
 =?utf-8?B?OXIzcU5OekUweDRoaTJUWE43UnhGYXhTTTJpb2NIWGtKN2Rwb2ZvYndzWjJq?=
 =?utf-8?B?SzErZS9nQlArRG1BSTNBUDFFS0J2NjQ5NHpwZkhBb3FkdU54cWZwL0lwWHF2?=
 =?utf-8?B?ajMvWEVscG8wdnVFRzVHMFhmNXFJd2dLR3JiVUpmQzJzSkU5NU9MY1RqOEJ3?=
 =?utf-8?B?M3RIZUpjWDNxdUFRLzBGNlRaOG9kMzZoYUV5M3VxQmFqcU1hVkVOMThDZXRC?=
 =?utf-8?B?Y3RiUlBjT3FYRTB0SXdxaTZYMDB2V2xaSDRuZmd1aGFGL0pxT0ZNZlQ1Zy9u?=
 =?utf-8?B?WVV6NkprbzUwM3BTUGZybklWd0dkaEptYjZhZlpvYU12UWN2SHlONGFMYStD?=
 =?utf-8?B?V0lNZit0R2JBbzl2WURVeGN3NUlMUkJSeVZkWmZ4Q1UxblhPL0pMMi9wd0NX?=
 =?utf-8?B?MlVoV01JeDNHcW1WTnhNTWdYakduZkt6MEhIV3RjbmNIR0ZWTkpkckRtclF4?=
 =?utf-8?B?RmI2ME90UHNFYUVKUk9tME1uRWxkKzFlYzU5M0NGaFY2dW1IdlpGdmt4VUdo?=
 =?utf-8?B?aEV2U0ZKZ01kWXdtbHhBRUJjKzNmMmJrZ25CVWVxalNLdGlSVjJYVmhTakhD?=
 =?utf-8?B?QkhBSU9WeWtpbjM3cUdQTC84QjlPdDJTVFlMVVhlby9MZWRJT0tjOVpPSE9p?=
 =?utf-8?B?dGFXQ1VCbGdLMHNSTEMvYVhaaHFIclhrL0E4MStnKy84UGlQMUVlM01aaDV5?=
 =?utf-8?B?cTNLMnVkNmpFYnVORVQwS3hkMm5wcGxHeXVFNUxKays1ZTczdzU0dm51MmNi?=
 =?utf-8?Q?XzVUIkqnqA8ZX8aLUIqzeuskH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31284c4-66e8-4576-7fe4-08dd7c451445
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 17:43:49.3361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0X01aLO79QQjYKnwG8emO72snCfABpKbC/YJSaNi6U0hyEZKREwNm07Pu68CJ6s2fYVhhK4KxxOe8YT6LcX8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8328

Hi Ilpo,

Thanks for the review feedback.

Thanks,
Pratap

On 4/15/2025 11:42 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Tue, 8 Apr 2025, Pratap Nirujogi wrote:
> 
>> ISP device specific configuration is not available in ACPI. Add
>> swnode graph to configure the missing device properties for the
>> OV05C10 camera device supported on amdisp platform.
>>
>> Add support to create i2c-client dynamically when amdisp i2c
>> adapter is available.
>>
>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>> Changes v4 -> v5:
>>
>> * Avoid global variables and make driver reentrant following the
>> state container design pattern.
>>
>> * Fix coding error referencing i2c_dev variable of amdisp_platform
>> in instantiate_isp_i2c_client().
>>
>> * Remove i2c_put_adapter(). Not required as i2c_get_adapter() is not called.
>>
>> * Use i2c_board_info->swnode instead of fwnode to fix refcount imbalance
>> warnings when module is removed.
>>
>> * Address review comments.
>>
>>   drivers/platform/x86/amd/Kconfig    |  11 ++
>>   drivers/platform/x86/amd/Makefile   |   1 +
>>   drivers/platform/x86/amd/amd_isp4.c | 295 ++++++++++++++++++++++++++++
>>   3 files changed, 307 insertions(+)
>>   create mode 100644 drivers/platform/x86/amd/amd_isp4.c
>>
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>> index c3e086ea64fc..ec755b5fc93c 100644
>> --- a/drivers/platform/x86/amd/Kconfig
>> +++ b/drivers/platform/x86/amd/Kconfig
>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>
>>          This mechanism will only be activated on platforms that advertise a
>>          need for it.
>> +
>> +config AMD_ISP_PLATFORM
>> +     tristate "AMD ISP4 platform driver"
>> +     depends on I2C && X86_64 && ACPI && AMD_ISP4
>> +     help
>> +       Platform driver for AMD platforms containing image signal processor
>> +       gen 4. Provides camera sensor module board information to allow
>> +       sensor and V4L drivers to work properly.
>> +
>> +       This driver can also be built as a module.  If so, the module
>> +       will be called amd_isp4.
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>> index c6c40bdcbded..b0e284b5d497 100644
>> --- a/drivers/platform/x86/amd/Makefile
>> +++ b/drivers/platform/x86/amd/Makefile
>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>   obj-$(CONFIG_AMD_HSMP)               += hsmp/
>>   obj-$(CONFIG_AMD_PMF)                += pmf/
>>   obj-$(CONFIG_AMD_WBRF)               += wbrf.o
>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp4.o
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
>> new file mode 100644
>> index 000000000000..ad181ab96423
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -0,0 +1,295 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * AMD ISP platform driver for sensor i2-client instantiation
>> + *
>> + * Copyright 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device/bus.h>
>> +#include <linux/dmi.h>
>> +#include <linux/gpio/machine.h>
>> +#include <linux/init.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/property.h>
>> +#include <linux/units.h>
>> +
>> +#define AMDISP_OV05C10_I2C_ADDR              0x10
>> +#define AMDISP_OV05C10_PLAT_NAME     "amdisp_ov05c10_platform"
>> +#define AMDISP_OV05C10_HID           "OMNI5C10"
>> +#define AMDISP_OV05C10_REMOTE_EP_NAME        "ov05c10_isp_4_1_1"
>> +#define AMD_ISP_PLAT_DRV_NAME                "amd-isp4"
>> +
>> +/*
>> + * AMD ISP platform definition to configure the device properties
>> + * missing in the ACPI table.
>> + */
>> +struct amdisp_platform {
>> +     const char *name;
>> +     u8 i2c_addr;
>> +     u8 max_num_swnodes;
>> +     struct i2c_board_info board_info;
>> +     struct notifier_block i2c_nb;
>> +     struct i2c_client *i2c_dev;
>> +     struct software_node **swnodes;
> 
> Can't this too be const struct so you can avoid a few casts below?
> 
Thanks. I will make it a const and remove the unnecessary casts in V6.

>> +};
>> +
>> +/* Top-level OV05C10 camera node property table */
>> +static const struct property_entry ov05c10_camera_props[] = {
>> +     PROPERTY_ENTRY_U32("clock-frequency", 24 * HZ_PER_MHZ),
>> +     { }
>> +};
>> +
>> +/* Root AMD ISP OV05C10 camera node definition */
>> +static const struct software_node camera_node = {
>> +     .name = AMDISP_OV05C10_HID,
>> +     .properties = ov05c10_camera_props,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Ports node definition. No properties defined for
>> + * ports node for OV05C10.
>> + */
>> +static const struct software_node ports = {
>> +     .name = "ports",
>> +     .parent = &camera_node,
>> +};
>> +
>> +/*
>> + * AMD ISP OV05C10 Port node definition. No properties defined for
>> + * port node for OV05C10.
>> + */
>> +static const struct software_node port_node = {
>> +     .name = "port@",
>> +     .parent = &ports,
>> +};
>> +
>> +/*
>> + * Remote endpoint AMD ISP node definition. No properties defined for
>> + * remote endpoint node for OV05C10.
>> + */
>> +static const struct software_node remote_ep_isp_node = {
>> +     .name = AMDISP_OV05C10_REMOTE_EP_NAME,
>> +};
>> +
>> +/*
>> + * Remote endpoint reference for isp node included in the
>> + * OV05C10 endpoint.
>> + */
>> +static const struct software_node_ref_args ov05c10_refs[] = {
>> +     SOFTWARE_NODE_REFERENCE(&remote_ep_isp_node),
>> +};
>> +
>> +/* OV05C supports one single link frequency */
>> +static const u64 ov05c10_link_freqs[] = {
>> +     925 * HZ_PER_MHZ,
>> +};
>> +
>> +/* OV05C supports only 2-lane configuration */
>> +static const u32 ov05c10_data_lanes[] = {
>> +     1,
>> +     2,
>> +};
>> +
>> +/* OV05C10 endpoint node properties table */
>> +static const struct property_entry ov05c10_endpoint_props[] = {
>> +     PROPERTY_ENTRY_U32("bus-type", 4),
>> +     PROPERTY_ENTRY_U32_ARRAY_LEN("data-lanes", ov05c10_data_lanes,
>> +                                  ARRAY_SIZE(ov05c10_data_lanes)),
>> +     PROPERTY_ENTRY_U64_ARRAY_LEN("link-frequencies", ov05c10_link_freqs,
>> +                                  ARRAY_SIZE(ov05c10_link_freqs)),
>> +     PROPERTY_ENTRY_REF_ARRAY("remote-endpoint", ov05c10_refs),
>> +     { }
>> +};
>> +
>> +/* AMD ISP endpoint node definition */
>> +static const struct software_node endpoint_node = {
>> +     .name = "endpoint",
>> +     .parent = &port_node,
>> +     .properties = ov05c10_endpoint_props,
>> +};
>> +
>> +/*
>> + * AMD ISP swnode graph uses 5 nodes and also its relationship is
>> + * fixed to align with the structure that v4l2 expects for successful
>> + * endpoint fwnode parsing.
>> + *
>> + * It is only the node property_entries that will vary for each platform
>> + * supporting different sensor modules.
>> + */
>> +#define NUM_SW_NODES 5
>> +
>> +static const struct software_node *ov05c10_nodes[NUM_SW_NODES + 1] = {
>> +     &camera_node,
>> +     &ports,
>> +     &port_node,
>> +     &endpoint_node,
>> +     &remote_ep_isp_node,
>> +     NULL
>> +};
>> +
>> +/* OV05C10 specific AMD ISP platform configuration */
>> +static const struct amdisp_platform amdisp_ov05c10_platform_config = {
>> +     .name = AMDISP_OV05C10_PLAT_NAME,
>> +     .board_info = {
>> +             .dev_name = "ov05c10",
>> +             I2C_BOARD_INFO("ov05c10", AMDISP_OV05C10_I2C_ADDR),
>> +     },
>> +     .i2c_addr = AMDISP_OV05C10_I2C_ADDR,
>> +     .max_num_swnodes = NUM_SW_NODES,
>> +     .swnodes = (struct software_node **)ov05c10_nodes,
>> +};
>> +
>> +static const struct acpi_device_id amdisp_sensor_ids[] = {
>> +     { AMDISP_OV05C10_HID },
>> +     { }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>> +
>> +static bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>> +{
>> +     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>> +}
>> +
>> +static void instantiate_isp_i2c_client(struct amdisp_platform *ov05c10, struct i2c_adapter *adap)
>> +{
>> +     struct i2c_board_info *info = &ov05c10->board_info;
>> +     struct i2c_client *i2c_dev;
>> +
>> +     if (ov05c10->i2c_dev)
>> +             return;
>> +
>> +     if (!info->addr) {
>> +             dev_err(&adap->dev, "invalid i2c_addr 0x%x detected\n",
>> +                     ov05c10->i2c_addr);
> 
> Put on a single line, you've longer lines already than what this is.
> 
sure, will fix this in V6.

>> +             return;
>> +     }
>> +
>> +     i2c_dev = i2c_new_client_device(adap, info);
>> +     if (IS_ERR(i2c_dev)) {
>> +             dev_err(&adap->dev, "error %pe registering isp i2c_client\n",
>> +                     i2c_dev);
> 
> Ditto.
> 
sure, will fix this in V6.

>> +             return;
>> +     }
>> +     ov05c10->i2c_dev = i2c_dev;
>> +}
>> +
>> +static int isp_i2c_bus_notify(struct notifier_block *nb,
>> +                           unsigned long action, void *data)
>> +{
>> +     struct amdisp_platform *ov05c10 = container_of(nb, struct amdisp_platform, i2c_nb);
>> +     struct device *dev = data;
>> +     struct i2c_client *client;
>> +     struct i2c_adapter *adap;
>> +
>> +     switch (action) {
>> +     case BUS_NOTIFY_ADD_DEVICE:
>> +             adap = i2c_verify_adapter(dev);
>> +             if (!adap)
>> +                     break;
>> +             if (is_isp_i2c_adapter(adap))
>> +                     instantiate_isp_i2c_client(ov05c10, adap);
>> +             break;
>> +     case BUS_NOTIFY_REMOVED_DEVICE:
>> +             client = i2c_verify_client(dev);
>> +             if (!client)
>> +                     break;
>> +             if (ov05c10->i2c_dev == client) {
>> +                     dev_dbg(&client->adapter->dev, "amdisp i2c_client removed\n");
>> +                     ov05c10->i2c_dev = NULL;
>> +             }
>> +             break;
>> +     default:
>> +             break;
>> +     }
>> +
>> +     return NOTIFY_DONE;
>> +}
>> +
>> +static struct amdisp_platform *prepare_amdisp_platform(const struct amdisp_platform *src)
>> +{
>> +     struct amdisp_platform *isp_ov05c10;
>> +     const struct software_node **sw_nodes;
>> +     const struct software_node *sw_node;
>> +     struct i2c_board_info *info;
>> +     int ret;
>> +
>> +     isp_ov05c10 = kmemdup(src, sizeof(*isp_ov05c10), GFP_KERNEL);
>> +     if (!isp_ov05c10)
>> +             return ERR_PTR(-ENOMEM);
>> +
>> +     info = &isp_ov05c10->board_info;
>> +
>> +     sw_nodes = (const struct software_node **)src->swnodes;
>> +     ret = software_node_register_node_group(sw_nodes);
>> +     if (ret)
>> +             goto error_unregister_sw_node;
>> +
>> +     sw_node = (const struct software_node *)src->swnodes[0];
>> +     info->swnode = sw_node;
>> +
>> +     return isp_ov05c10;
>> +
>> +error_unregister_sw_node:
>> +     software_node_unregister_node_group(sw_nodes);
> 
> If register failed, why you are calling unregister for it??
> 
This is not intended, thanks for catching this, will fix it in V6.


>> +     kfree(isp_ov05c10);
>> +     return ERR_PTR(ret);
>> +}
>> +
>> +static int amd_isp_probe(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10;
>> +     int ret;
>> +
>> +     ov05c10 = prepare_amdisp_platform(&amdisp_ov05c10_platform_config);
>> +     if (IS_ERR(ov05c10))
>> +             return dev_err_probe(&pdev->dev, PTR_ERR(ov05c10),
>> +                                  "failed to prepare amdisp platform fw node\n");
> 
> fwnode
> 
> Please also capitalize properly as this is user visible message, AMD ISP ?
> 
sure, I will capitalize the words and fix the spacing as suggested in V6.

>> +
>> +     ov05c10->i2c_nb.notifier_call = isp_i2c_bus_notify;
>> +
>> +     ret = bus_register_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     if (ret)
>> +             goto error_free_platform;
>> +
>> +     platform_set_drvdata(pdev, ov05c10);
>> +     return ret;
> 
> return 0
> 
>> +
>> +error_free_platform:
>> +     kfree(ov05c10);
>> +     return ret;
>> +}
>> +
>> +static void amd_isp_remove(struct platform_device *pdev)
>> +{
>> +     struct amdisp_platform *ov05c10 = platform_get_drvdata(pdev);
>> +
>> +     if (IS_ERR_OR_NULL(ov05c10))
> 
> How can this happen??
> 
I agree this can never happen in the current driver. The only 
possibility that it can happen is when platform_set_drvdata() is missed 
in the probe().

>> +             return;
>> +
>> +     bus_unregister_notifier(&i2c_bus_type, &ov05c10->i2c_nb);
>> +     i2c_unregister_device(ov05c10->i2c_dev);
>> +     software_node_unregister_node_group((const struct software_node **)
> 
> Unnecessary cast?
> 
agreed, will remove this in V6.
>> +                                         ov05c10->swnodes);
>> +     kfree(ov05c10);
>> +}
>> +
>> +static struct platform_driver amd_isp_platform_driver = {
>> +     .driver = {
>> +             .name                   = AMD_ISP_PLAT_DRV_NAME,
>> +             .acpi_match_table       = amdisp_sensor_ids,
>> +     },
>> +     .probe  = amd_isp_probe,
>> +     .remove = amd_isp_remove,
>> +};
>> +
>> +module_platform_driver(amd_isp_platform_driver);
>> +
>> +MODULE_AUTHOR("Benjamin Chan <benjamin.chan@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_DESCRIPTION("AMD ISP4 Platform Driver");
>> +MODULE_LICENSE("GPL");
>>
> 
> --
>   i.
> 

