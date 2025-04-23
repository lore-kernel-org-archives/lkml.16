Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2067.outbound.protection.outlook.com [40.107.102.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934AC1F4634;
	Wed, 23 Apr 2025 19:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435589; cv=fail; b=LjXh8NzOKCh6rMvJ2v1DC7UZJQQoAMbtics4ElF9XPOVP7t0AsWkw2kFcIezip75h5WcMFWIs+kL2l4C0OD37oPJIrfnAphqEo4xhjooJYY7b0cAXaeWhawzeeQfCexi2r1FFefrmtKMFn6y3OvuwYxvVaqgktBUdAmRQXKqZDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435589; c=relaxed/simple;
	bh=5NvsqqcHcK4w+dPZhWAPd6qg4n6x3EoeGlnOVuTNI0k=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D/1ZxahweWJRx+BNXJi2J87sCdon+3LUi+nAgyY5B+KfHgpDAxoHYyo+jvX8T//hyl2HG2xH6yVF8f5DJK4BFk/Xn2BsbLKF0T2NhnEFzEgi7lV2Nbyc7iiBliJx3r1es8MlhC6hivc4N6t9aQZkfCcaF7vWEg7tLTlHucDiSmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uWmkgM8i; arc=fail smtp.client-ip=40.107.102.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uWmkgM8i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZW+Eq6a29U8IVRizlDgz668rn8V8lYtzPVTYZXKVZLOPls+iHxKBleD0+7qrIzOEF/QHtxVfeunidReViJaJEU0r+0KtJ36GdAKIKPvJv2hAkjyYVQ9r9Q7KPqnvAHL1+JcZ/OtekEp3O2tgLGCoQ3fDpN+KltZkaTS73kj0vPNSTjw7kdI/bEEsoIJe8AF6ZcV8qDVZqYgK7XXy2GRsnSF7NC84rYdR1NEM9WgveBzrzFlFOHEjHSOHjTIgYygmwbhi0VBrB04sW92eMAkX14CaoZFsemeyrDtap0bCPI6aeSB1g85buPcJX2v2O9pXXuJHNxFPg7CUHLkXX7B3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgB8dfIfgN96nBWLl+W9lvgOdSnanOCvxy1DQ7F4Ik8=;
 b=mm8UxF2/qW3MyAGYlx/fJXUjwdfukGXyCRSWEkA4A1P8YVM0xnuwtcLPQQaaopvB4jfTIgSjduHHneFgdkCi9vGigAbojh1IWHOZDiOPSV1yqx97C0epKqTtapTVXrt+EzgwsbD85N4sLl3JxEplBS4GlX3PvIlSU3uYTxFkr5glfX9W+6Bq2jR6ryxSRZMc788AxGxXHVztyDak0Pk5xIfy5BT5XEog1InOF8Q2iIYJgFHp3+UYiXDrjG+MMIZw1mHzeV3c0FJ941QOTmLI45bRAyZST85hlS9hxW6EBfYx7d3dPt+uxtAd+jnUEznUuG5G+GPetc3dySVwxwW1/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgB8dfIfgN96nBWLl+W9lvgOdSnanOCvxy1DQ7F4Ik8=;
 b=uWmkgM8iWI4oeR7EwhtJWmW56DKRZoNscGtob6UvzL5BL8TsFT7gu0cN/cHLbjEF4ERVDzGj3xbRBfIsQayL0amajQKiFb9qS231Gkq6ddlk9l523L1zIMtoNXSXNrn9R037T4Xd3LjxJ+W27PioN3mkUjsoZALM1vW0iouKvsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 19:13:03 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 19:13:03 +0000
Message-ID: <1b850037-8361-4c18-a32d-3ca50b69866e@amd.com>
Date: Wed, 23 Apr 2025 14:12:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Resume from suspend broken in 6.15-rc due to ACP
 changes.
From: Mario Limonciello <mario.limonciello@amd.com>
To: Mark Brown <broonie@kernel.org>, Jacek Luczak <difrost.kernel@gmail.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org,
 venkataprasad.potturu@amd.com, LKML <linux-kernel@vger.kernel.org>
References: <CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cnqPTgV_Z8w@mail.gmail.com>
 <99dce57f-8947-4c7a-abeb-2e27afdd0d65@sirena.org.uk>
 <c0c9205d-d1e3-4952-a13e-6d23656880e3@amd.com>
Content-Language: en-US
In-Reply-To: <c0c9205d-d1e3-4952-a13e-6d23656880e3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4266:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd60627-8f2b-4606-810f-08dd829adeb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3Z4c3F6STV6d05KZEJQVDN0QjBiSGwxQlk0b1NCcGQrTDRQL3VOaTB5Ymtl?=
 =?utf-8?B?RlRveGtMT2l4L1FISStpWFZlaUFRZ3ZEZTdYeEQ0ZUZlYW83WmJFZ0ZFUTZP?=
 =?utf-8?B?QUJvblpDY1RDcFVPNlBnVGp6K1lOMElUOGlLbmRQejlOZjJZYncrTERsUUI5?=
 =?utf-8?B?aHoybkU4Y1ZtblhVRHdiYldKZmJmWHlac1dmM09NNjNIL0lHTnhGR3VhTVVz?=
 =?utf-8?B?WFphT1A3S1gzVi9XK0l3ckdXVlRRcHpQUHNBR1pIeDBuOFpKNXZwTWQrVVY3?=
 =?utf-8?B?KytCK3pIVGVSak5Ja1NMQVlsM3VlMlN4LzgvenArZTlNdjhxVndCdnpCdU9y?=
 =?utf-8?B?Y0NuWTF4WGRhTytVbkFmdUI4MlBzN2tvYWxReWtJdE1SRGFOWUw4YXpqWFZu?=
 =?utf-8?B?UUlFaDcrSDJtNERKLzhNR2Y2c0wxUmpNMnl2QjFRMmxyWHU4NUlHUk1rZmZY?=
 =?utf-8?B?V1VDMHNOTGVTSzdyaWZ4ZjVQNnlaazNZS0w4aXRXMG12akhDdHdpSEtlM1No?=
 =?utf-8?B?cnhEQkNuQkl6ZTJIczlwdE1SMW9XK3IrV2J4ZTJteUc4WkVRQ3UvV2grazM1?=
 =?utf-8?B?SnRwUGt6eVhnTHFUNkZsVitRMWIxTi9TUWQySjRRTUY3L1g2eW9Ncm9KU2xH?=
 =?utf-8?B?TWs3TFY2UUc0MFJJOFpMYnYyTTRpajl6bVNoZ1ArSDdtSm51Zm9UZ2NaTXVJ?=
 =?utf-8?B?alJGTEtwc0VpaVF1Tkc3c2xkYmZtTCtuOG1EeTNVNnp3OFVKOVJHOGNXV0ZH?=
 =?utf-8?B?UHhPcTMvQVU4aXBoNEtESVozOWY1K0xYbzFqSUhRWHBRT2lXeWNEenhjM1ZH?=
 =?utf-8?B?ZTFiWTM2WjlEN1ZvRE9PczZVWllYVW0yUXp4ZVVnOGI0TzhnK0tXSnR2b1Zo?=
 =?utf-8?B?OWQ2M1JUalNZVGtiR3FvaGg0dzdMVnZPR3hFRG5GU09DRUlJcFI2VXZmaGNQ?=
 =?utf-8?B?a2RxTnNyeW94N2NHR0dFVEl5aDYrbWhselhpNUptQks2ZnAvbWVkbjFIdURT?=
 =?utf-8?B?RkxmbUxMenhHOWtNck45aEdnbktVUVJlQUltL013Z0dQQnBjMzJZajlkcFJK?=
 =?utf-8?B?MlhQalgzc1NhMzNCeG5tQ1RJYWlXVTVwNFZhS05lMitEWGhFV21EdEJucC84?=
 =?utf-8?B?ckR5ZGJ6VUZ2Nk5MZUoyQ0ROKzJSZEZxcEs4NzZiMHFHakVwUWtKN3JGT240?=
 =?utf-8?B?K2JkNXhWWXV5OGRIcjRrdFRBeWZzOWYrOGVGR2lsRUNadFBmQnR1M1NsbTZN?=
 =?utf-8?B?L0xvTDdndDk3QXZWK3pTUGU5K3BsQ0JEMFFzbmJMSVVjczBZcHdJbENCckht?=
 =?utf-8?B?NW1ZZW9DUFdHVk44dzBweW5PaGhDMEJJYVBqYmZtSWZCbWZJMlVQenkwUDBv?=
 =?utf-8?B?aUN6ZzhpUTExS3pQM3pmdjhlelVnRFRNa1JIQnFuVWZlN0NBOWtGbVdkb1NM?=
 =?utf-8?B?TmVEOEowaUtnMWpCTWJZUkpHT3l3REpFOEdMZTJRL1pGUmhEOUNYTmFrNVhW?=
 =?utf-8?B?TDI1azExbE84V1c3dGhtaFhPbC82YmtSRnB0VmxZcmQyc1hmQ0dVMWZvaVhT?=
 =?utf-8?B?VTNNNUkrTVovcDhHNWVKeSttbzR5TjlNNW9GbG11RjRWcGpmeVBqMm9lcE53?=
 =?utf-8?B?V2xKTTRvR21MT1JTSEVNVTN2VTNaRTRFMGxSeHVyQzBJUTFaa3lCVFpDZDd5?=
 =?utf-8?B?eGJQRm8rU2dXWGNHYWRJWklRazBMck9PMXYzUHRjOE81R1hMZ1FCTlpCU0Iz?=
 =?utf-8?B?TlpHK0JqUS9OSTNiVEhocVVpd1BQZUZEUHcxdE1DbkJMNjdOM2Q3UUdybnBV?=
 =?utf-8?Q?WgUDunE84TfZZ5EfqLiROzcBqnt1hngwsWYrk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ak1FTUhWQldYUW1CZDQ3bXBVUFpNZ2t5a1VTK0NWcS9jUFJRL2I3NXBEYmlX?=
 =?utf-8?B?bDZGMzVyZmVjVmdyN21teE01RFdRYXJvdmhxUkNRTm9pMmR3THZBRnh2Tndo?=
 =?utf-8?B?eTRUSlZ3dWpjM1p3UnFQV2tLNWdxOGpxTWpEUERxMXNzdTVtYXZxenJyWExr?=
 =?utf-8?B?U1FheEExdFUvQkpiTDgyVHFoOVQ1VWZLNEFBZ2thTDI1VUUwd3dIMnI5b1lY?=
 =?utf-8?B?aEVOaHE3VlQxSlNzUkg4eVRGMDJuaTdmTDBzTUljM0J0ZXBYUkpDaGFFUkJr?=
 =?utf-8?B?KzBKZzRkM3laNUJNam8vYmhkOFJKWkFNZlZoNnZrRVRhb2s0WXBqZmdKQ1FF?=
 =?utf-8?B?SXZFTzFiczhwc3VtN0ZYQnlhOW9sY3hjb3N1eVdraVliRE55K0ZWZFo5VEdI?=
 =?utf-8?B?VGJwQ25IZW1CTmhLaHhIcWJKWWhmbTlLQmZvT0lYL09RL1JaeUlIbkNYczlj?=
 =?utf-8?B?TU1CWUlmR0w3VTV6UkYvbVI0WFVWcFFjbktjYXdDQzNqTmN0QkZNbkRBc29y?=
 =?utf-8?B?TmFRbW1EQis3YVh0cjFWdG1naDlmZ251RStLT21yam8wbnY0YTBVd0pRNita?=
 =?utf-8?B?akRMaWxoTVBVcnBBRTlxZHBiQXF1aVh1b1NFNytnRkRicjA2em51MXZ3bU13?=
 =?utf-8?B?bmNMQTlxVXRnaUFYWDEySDlrQzNvVjEyOHNYQ0lrRFhGZEgzQitQaTE0TkNl?=
 =?utf-8?B?eHRieXhkUFdVWjFuL3E5dEJhMlNwd3l3aWpITExETlZKOGlNWmxsajY0ZzJY?=
 =?utf-8?B?dnkydmVTaWo4NXk3UFp0TmlZcE1qQmVCTGJ0MnZSbDdxSzJ1b1orVjR2TGlD?=
 =?utf-8?B?SGlyWTVtaWpQNEtjYkdsZ1pTcDZCYm1XNUVBajlTU2ZHaGlVcElpTWJ4RkRt?=
 =?utf-8?B?My81cElvTUUxZU9LdGpBQVdrTnVXZnArR1h4eStpU2ZqWlRBc3JvSlhTNndt?=
 =?utf-8?B?SytrZXR1Ri9RUTRTazZNUFRCd3NBSEZrWExsVW9LVDkxM3dxaGlGUC9kZkpw?=
 =?utf-8?B?WVNHbUZBb2ZNandVZkEvUm02bmQyb2pyeGVzTStDbDJERVJVMjUwWHdYN1VY?=
 =?utf-8?B?Mm1mNVJsc3RXMUlrUUdINFZkcy83SXNtcFNSOXo0NnlLNTVYRVVlZWpYNWdV?=
 =?utf-8?B?VnFxK1JYTmVRMlkxUFNjTFRHcXBVWmdhajhWOXdiaTRHRXNQMlRpb2pPUjR0?=
 =?utf-8?B?TUNFa1F5ZnphMFo3Tyt1ekZ3WE9UMG5UWW9vTDEvclQ2MUxlS3pyNHFJeUxB?=
 =?utf-8?B?L0w0SkdERGlXN2hsbXdaWDJOb0FaaVVHMFRsT1hvTmRmYW1NUUdMZHBsK1ZN?=
 =?utf-8?B?NnJSOStORkpTVmh5M0twVDZlRXFHaWhHUDBDMGNBb3VMWS8vSjN2RmlTK01E?=
 =?utf-8?B?L2hRNW1BZTNmOFRoekxncHBMTUhYLzZGWEpqU3F5eUs5eU5TbEx6Z2EveWRH?=
 =?utf-8?B?UEo5ejlzRzBKZC8zWTdESnF3UE1CcE8zZXJQQWVDSDVycmNDQlF6cHFqVkd5?=
 =?utf-8?B?MG5tR000dlJheFVsWlV3REZETEx4NWZ2aHdEdTV3ODdGUVRjTFR5dlJFQ2sr?=
 =?utf-8?B?SzA2QmdVVm1JdWh6YXl4T2p1SWtSSkZTT1VtVFY4R0NxR3l3dlA1dDlDNzh1?=
 =?utf-8?B?Y2hlaTRFeEQxakZvby95L3dYUXJOQUZJU09YVDVNWS9tYlBYNytGSUlwd3Fy?=
 =?utf-8?B?MElUZ2NvdGFzeGl4cEl0MGxTMnpkYkprWktqeVZ6NjE5UjZsT0NTbHljNGZx?=
 =?utf-8?B?cllqd2NpeGkyTXJsZzZpdXZwTy9wNnk5NHk2V3FQUWJhTU5RSnk0L05PeGlS?=
 =?utf-8?B?cUJDZ1k2bzhKUDZVcmpNdmpMV0ZNR282RHQreC84Ui9FSTVrellEeWwxR2FM?=
 =?utf-8?B?VmhSbjh1aUQ0eTQ1NGNYNGpwVWMzTEtRY0pPei9zcWxueS9PVktqeWEzN2Vx?=
 =?utf-8?B?VjBNa083UjV6RmJhVVFKbnhtVGZiMmR6bGdjZGR4TmN5L210S3JsT0t2OG41?=
 =?utf-8?B?cmRGZ0xBSzZmT0piRVRPU2FOdkx4bFF2c0ovcklWZWhJQnlYY1cyQWU2YlFS?=
 =?utf-8?B?UEliTFJpTm51aFplenNqQ01GNXVvUEhZVU9Mc09kM1Bod0owWXBOVE9NcDNS?=
 =?utf-8?Q?4hvDgkEaW9KEaUT3BACd3iTEr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd60627-8f2b-4606-810f-08dd829adeb7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 19:13:03.2262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0i1x3mZitMR/LCNWaAFmPp/tqwzRpMJVJBXFcL7JMg8/41CHiTECAhtg89oQ2vt7MWmQ/xQ0XmsGxZCfDWWRkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266

On 4/23/2025 10:18 AM, Mario Limonciello wrote:
> On 4/23/2025 10:06 AM, Mark Brown wrote:
>> On Wed, Apr 16, 2025 at 01:20:33PM +0200, Jacek Luczak wrote:
>>> Hi,
>>>
>>> On my ASUS Vivobook S16 (and on similar ASUS HW - see [1]) on resume
>>> from suspend system dies (no logs available) soon after GPU completes
>>> resume - I can see the login screen, only power cycle left.
>>
>> Are there any updates on this from the AMD side?  As things stand my
>> inclination is to revert the bulk of the changes to the driver from the
>> past merge window, I don't really know anything about this hardware
>> specifically and "dies without logs" is obviously giving few hints.
>> None of the skipped commits looks immediately suspect, there's doubtless
>> some unintended change in there.
> 
> This is the first I'm hearing of it; I expect we can dig in and find a 
> solution so we don't need to revert that whole series.
> 
> Let me add Vijendar to check if this jumps out to him what went wrong.
> 
> * Can we please see the full dmesg up to the failure?
> * journalctl -k -b-1 can fetch everything from the last boot up until 
> the freeze.
> * Any crash in /var/lib/systemd/pstore by chance?
> 
>>
>> Adding Mario and leaving the context for his benefit.
> 
> To double check - can you blacklist the ACP driver and suspend/resume 
> and everything is OK?
> 
> If possible can you please capture a report with https:// 
> web.git.kernel.org/pub/scm/linux/kernel/git/superm1/amd-debug-tools.git/ 
> tree/amd_s2idle.py both in the case of ACP driver blacklisted and not 
> blacklisted?  I would like to compare.
> 
> Also; can you put all these artifacts I'm asking for into somewhere non 
> ephemeral like a kernel bugzilla?  You can loop me and Vijendar into it.

FYI - We managed to track an S16 down and can reproduce the issue.
It's a NULL pointer deref happening on the resume path.

<1>[   74.046372] BUG: kernel NULL pointer dereference, address: 
0000000000000010
<1>[   74.046375] #PF: supervisor read access in kernel mode
<1>[   74.046377] #PF: error_code(0x0000) - not-present page
<6>[   74.046380] PGD 0 P4D 0
<4>[   74.046384] Oops: Oops: 0000 [#1] SMP NOPTI
<4>[   74.046389] CPU: 4 UID: 0 PID: 2563 Comm: rtcwake Not tainted 
6.15.0-061500rc3-generic #202504202138 PREEMPT(voluntary)
Oops#1 Part4
<4>[   74.046394] Hardware name: ASUSTeK COMPUTER INC. ASUS Vivobook S 
16 M5606KA_M5606KA/M5606KA, BIOS M5606KA.304 01/24/2025
<4>[   74.046396] RIP: 0010:acp70_pcm_resume+0x4f/0xe0 [snd_acp70]
<4>[   74.046405] Code: 48 89 45 d0 e8 c2 da 98 fc 49 8b 5d 50 49 39 de 
75 18 eb 7b 48 89 da 4c 89 ee 4c 89 ff e8 29 cc f6 ff 48 8b 1b 4c 39 f3 
74 65 <4c> 8b 7b 10 4d 85 ff 74 ef 49 8b 97 c0 00 00 00 48 85 d2 74 e3 8b
<4>[   74.046407] RSP: 0018:ffffd12644d13880 EFLAGS: 00010286
<4>[   74.046410] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 
0000000000000000
<4>[   74.046412] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
0000000000000000
<4>[   74.046413] RBP: ffffd12644d138b0 R08: 0000000000000000 R09: 
0000000000000000
<4>[   74.046415] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffffffffbd774fd0
<4>[   74.046416] R13: ffff8a9f13051e00 R14: ffff8a9f13051e50 R15: 
0000000000000010
<4>[   74.046418] FS:  0000799af9db9740(0000) GS:ffff8aa486e9d000(0000) 
knlGS:0000000000000000
<4>[   74.046420] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[   74.046421] CR2: 0000000000000010 CR3: 000000016dfaa000 CR4: 
0000000000f50ef0
<4>[   74.046423] PKRU: 55555554
<4>[   74.046425] Call Trace:
<4>[   74.046427]  <TASK>
<4>[   74.046432]  ? __pfx_platform_pm_resume+0x10/0x10
<4>[   74.046439]  platform_pm_resume+0x28/0x60
<4>[   74.046443]  dpm_run_callback+0x63/0x160
<4>[   74.046447]  device_resume+0x15c/0x260
<4>[   74.046450]  dpm_resume+0x15d/0x230
<4>[   74.046453]  dpm_resume_end+0x11/0x30
<4>[   74.046456]  suspend_devices_and_enter+0x1ea/0x2c0
<4>[   74.046460]  enter_state+0x223/0x560
Oops#1 Part3
<4>[   74.046463]  pm_suspend+0x4e/0x80

We'll need some more time to dig into it, but I wanted to share the 
trace in case it makes it jump out to anyone what's going on.

Just looking at git blame from that function is this perhaps 
8fd0e127d8da856e34391399df40b33af2b307e0?

> 
>>
>>> I've managed to bisect this as close as possible to following commits:
>>> - [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: Refactor
>>> acp70 platform resource structure
>>> - [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: Remove 
>>> white line
>>> - [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move
>>> spin_lock and list initialization to acp-pci driver
>>> - [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove
>>> redundant acp_dev_data structure
>>> - [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add new
>>> interrupt handle callbacks in acp_common_hw_ops
>>>
>>> Attached lspci and bisection log.
>>>
>>> Regards,
>>> -jacek
>>>
>>> [1] https://bbs.archlinux.org/viewtopic.php?id=304816
>>
>>> git bisect start
>>> # status: waiting for both good and bad commits
>>> # good: [ed92bc5264c4357d4fca292c769ea9967cd3d3b6] ASoC: codecs: 
>>> wm0010: Fix error handling path in wm0010_spi_probe()
>>> git bisect good ed92bc5264c4357d4fca292c769ea9967cd3d3b6
>>> # status: waiting for bad commit, 1 good commit known
>>> # bad: [47c4f9b1722fd883c9745d7877cb212e41dd2715] Tidy up ASoC 
>>> control get and put handlers
>>> git bisect bad 47c4f9b1722fd883c9745d7877cb212e41dd2715
>>> # good: [74da545ec6a8b41de96b4c350bb59dfe45c0d822] ASoC: codec: 
>>> madera: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
>>> git bisect good 74da545ec6a8b41de96b4c350bb59dfe45c0d822
>>> # bad: [a935b3f981809272d2649ad9c27a751685137846] ASoC: SOF: ipc4- 
>>> topology: Allocate ref_params on stack
>>> git bisect bad a935b3f981809272d2649ad9c27a751685137846
>>> # good: [24056de9976dfc33801d2574c1672d91f840277a] ASoC: codecs: 
>>> Update device_id tables for Realtek
>>> git bisect good 24056de9976dfc33801d2574c1672d91f840277a
>>> # good: [a1462fb8b5dd1018e3477a6861822d75c6a59449] ASoC: Intel: 
>>> boards: updates for 6.15
>>> git bisect good a1462fb8b5dd1018e3477a6861822d75c6a59449
>>> # skip: [8a7e7a03e3c53cd9abbbf233899cc2e05b2c6ec0] ASoC: SOF: Intel: 
>>> Add support for ACE3+ mic privacy
>>> git bisect skip 8a7e7a03e3c53cd9abbbf233899cc2e05b2c6ec0
>>> # skip: [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: 
>>> Add new interrupt handle callbacks in acp_common_hw_ops
>>> git bisect skip aaf7a668bb3814f084f9f6f673567f6aa316632f
>>> # good: [c6141ba0110f98266106699aca071fed025c3d64] ASoC: Merge up fixes
>>> git bisect good c6141ba0110f98266106699aca071fed025c3d64
>>> # skip: [ad5a0970f86d82e39ebd06d45a1f7aa48a1316f8] ASoC: cs35l41: 
>>> check the return value from spi_setup()
>>> git bisect skip ad5a0970f86d82e39ebd06d45a1f7aa48a1316f8
>>> # good: [269b844239149a9bbaba66518db99ebb06554a15] ASoC: dapm: Fix 
>>> changes to DECLARE_ADAU17X1_DSP_MUX_CTRL
>>> git bisect good 269b844239149a9bbaba66518db99ebb06554a15
>>> # skip: [89be3c15a58b2ccf31e969223c8ac93ca8932d81] ASoC: qcom: 
>>> sm8250: explicitly set format in sm8250_be_hw_params_fixup()
>>> git bisect skip 89be3c15a58b2ccf31e969223c8ac93ca8932d81
>>> # bad: [02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3] ASoC: amd: acp: Fix 
>>> for enabling DMIC on acp platforms via _DSD entry
>>> git bisect bad 02e1cf7a352a3ba5f768849f2b4fcaaaa19f89e3
>>> # good: [7a2ff0510c51462c0a979f5006d375a2b23d46e9] ASoC: soc-pcm: 
>>> reuse dpcm_state_string()
>>> git bisect good 7a2ff0510c51462c0a979f5006d375a2b23d46e9
>>> # good: [a8fed0bddf8fa239fc71dc5c035d2e078c597369] ASoC: dt-bindings: 
>>> add regulator support to dmic codec
>>> git bisect good a8fed0bddf8fa239fc71dc5c035d2e078c597369
>>> # bad: [ee7ab0fd540877fceb3d51f87016e6531d86406f] ASoC: amd: acp: 
>>> Refactor rembrant platform resource structure
>>> git bisect bad ee7ab0fd540877fceb3d51f87016e6531d86406f
>>> # good: [0d2d276f53ea3ba1686619cde503d9748f58a834] ASoC: SOF: Intel: 
>>> lnl/ptl: Only set dsp_ops which differs from MTL
>>> git bisect good 0d2d276f53ea3ba1686619cde503d9748f58a834
>>> # good: [8aeb7d2c3fc315e629d252cd601598a5af74bbb0] ASoC: SOF: Intel: 
>>> Create ptl.c as placeholder for Panther Lake features
>>> git bisect good 8aeb7d2c3fc315e629d252cd601598a5af74bbb0
>>> # skip: [ac5b4a24f16f2f56b5cc5092969930b867274edc] ASoC: Intel: soc- 
>>> acpi-intel-ptl-match: Add cs42l43 support
>>> git bisect skip ac5b4a24f16f2f56b5cc5092969930b867274edc
>>> # skip: [8ae746fe51041484e52eba99bed15a444c7d4372] ASoC: amd: acp: 
>>> Implement acp_common_hw_ops support for acp platforms
>>> git bisect skip 8ae746fe51041484e52eba99bed15a444c7d4372
>>> # good: [0978e8207b61ac6d51280e5d28ccfff75d653363] ASoC: SOF: Intel: 
>>> hda-mlink: Add support for mic privacy in VS SHIM registers
>>> git bisect good 0978e8207b61ac6d51280e5d28ccfff75d653363
>>> # good: [4a43c3241ec3465a501825ecaf051e5a1d85a60b] ASoC: SOF: Intel: 
>>> ptl: Add support for mic privacy
>>> git bisect good 4a43c3241ec3465a501825ecaf051e5a1d85a60b
>>> # skip: [1ec3f1dc215d4b3d3679ecdc4a549d4e82b3a609] ASoC: dmic: add 
>>> regulator support
>>> git bisect skip 1ec3f1dc215d4b3d3679ecdc4a549d4e82b3a609
>>> # good: [e2cda461765692757cd5c3b1fc80bd260ffe1394] ASoC: amd: acp: 
>>> Refactor dmic-codec platform device creation
>>> git bisect good e2cda461765692757cd5c3b1fc80bd260ffe1394
>>> # skip: [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: 
>>> Move spin_lock and list initialization to acp-pci driver
>>> git bisect skip a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90
>>> # bad: [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: 
>>> Refactor acp70 platform resource structure
>>> git bisect bad f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0
>>> # good: [6e60db74b69c29b528c8d10d86108f78f2995dcb] ASoC: amd: acp: 
>>> Refactor acp machine select
>>> git bisect good 6e60db74b69c29b528c8d10d86108f78f2995dcb
>>> # skip: [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: 
>>> Remove redundant acp_dev_data structure
>>> git bisect skip e3933683b25e2cc94485da4909e3338e1a177b39
>>> # skip: [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: 
>>> Remove white line
>>> git bisect skip c8b5f251f0e53edab220ac4edf444120815fed3c
>>> # only skipped commits left to test
>>> # possible first bad commit: 
>>> [f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0] ASoC: amd: acp: Refactor 
>>> acp70 platform resource structure
>>> # possible first bad commit: 
>>> [c8b5f251f0e53edab220ac4edf444120815fed3c] ASoC: amd: acp: Remove 
>>> white line
>>> # possible first bad commit: 
>>> [a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90] ASoC: amd: acp: Move 
>>> spin_lock and list initialization to acp-pci driver
>>> # possible first bad commit: 
>>> [e3933683b25e2cc94485da4909e3338e1a177b39] ASoC: amd: acp: Remove 
>>> redundant acp_dev_data structure
>>> # possible first bad commit: 
>>> [aaf7a668bb3814f084f9f6f673567f6aa316632f] ASoC: amd: acp: Add new 
>>> interrupt handle callbacks in acp_common_hw_ops
>>
>>> 00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo Root Complex [1022:1507]
>>> 00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Strix/Strix 
>>> Halo IOMMU [1022:1508]
>>> 00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo Dummy Host Bridge [1022:1509]
>>> 00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo PCIe USB4 Bridge [1022:150a]
>>> 00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo Dummy Host Bridge [1022:1509]
>>> 00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo GPP Bridge [1022:150b]
>>> 00:02.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo GPP Bridge [1022:150b]
>>> 00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo Dummy Host Bridge [1022:1509]
>>> 00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo Dummy Host Bridge [1022:1509]
>>> 00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>>> 00:08.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>>> 00:08.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Strix/ 
>>> Strix Halo Internal GPP Bridge to Bus [C:A] [1022:150c]
>>> 00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus 
>>> Controller [1022:790b] (rev 71)
>>> 00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC 
>>> Bridge [1022:790e] (rev 51)
>>> 00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>> Data Fabric; Function 0 [1022:16f8]
>>> 00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>> Data Fabric; Function 1 [1022:16f9]
>>> 00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>> Data Fabric; Function 2 [1022:16fa]
>>> 00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>> Data Fabric; Function 3 [1022:16fb]
>>> 00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>> Data Fabric; Function 4 [1022:16fc]
>>> 00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>> Data Fabric; Function 5 [1022:16fd]
>>> 00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>> Data Fabric; Function 6 [1022:16fe]
>>> 00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Strix 
>>> Data Fabric; Function 7 [1022:16ff]
>>> 61:00.0 Non-Volatile memory controller [0108]: Micron Technology Inc 
>>> 2400 NVMe SSD (DRAM-less) [1344:5413] (rev 03)
>>> 62:00.0 Network controller [0280]: MEDIATEK Corp. MT7922 802.11ax PCI 
>>> Express Wireless Network Adapter [14c3:0616]
>>> 63:00.0 Display controller [0380]: Advanced Micro Devices, Inc. [AMD/ 
>>> ATI] Strix [Radeon 880M / 890M] [1002:150e] (rev c1)
>>> 63:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] 
>>> Rembrandt Radeon High Definition Audio Controller [1002:1640]
>>> 63:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. 
>>> [AMD] Strix/Krackan/Strix Halo CCP/ASP [1022:17e0]
>>> 63:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>> Device [1022:151e]
>>> 63:00.5 Multimedia controller [0480]: Advanced Micro Devices, Inc. 
>>> [AMD] ACP/ACP3X/ACP6x Audio Coprocessor [1022:15e2] (rev 70)
>>> 63:00.6 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] 
>>> Family 17h/19h/1ah HD Audio Controller [1022:15e3]
>>> 64:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, 
>>> Inc. [AMD] Strix/Strix Halo PCIe Dummy Function [1022:150d]
>>> 64:00.1 Signal processing controller [1180]: Advanced Micro Devices, 
>>> Inc. [AMD] Strix/Krackan/Strix Halo Neural Processing Unit 
>>> [1022:17f0] (rev 10)
>>> 65:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>> Device [1022:151f]
>>> 65:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>> Device [1022:151a]
>>> 65:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>> Device [1022:151b]
>>> 65:00.5 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 
>>> Device [1022:151c]
> 

