Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AB22D023
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999949; cv=fail; b=l+fizeegJU0p7qNrg3Z5q0lZludBWjzswXxGRBwuN8cZ66qjgQNxx2uA7wpDNL0dzSXcpgZUZztiCHFwM/a+4Ssu891wKLvSCj6f9zcGT1ijvW//lvFXLFSdKDVA/On2wZwTECdq0DEIvmnaSdHXYy0JTx6l/L3jZYlq6IpSmv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999949; c=relaxed/simple;
	bh=rStmm9CYzBorDp8bisdMdwOg0l4V7JUvh95LU4BE12Q=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Noqu7Slilzlt3b3eYHAuGTjbFMSEZXJu1CNJ3IRh8hKy0A94gbPU5o4o4jU/2rOvW7ZDITi23VcweRBCHqbc1F8RvCJo4pj7khoAuwUzeTktEBasZjM5JnyJw8LNQsQ7aLMoUGgEV8EjrUroi9cb8Ym3xWHcx8QZavqZPNEeYoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LpVCj1ts; arc=fail smtp.client-ip=40.107.223.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LpVCj1ts"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHALNRRbIRTO+r8qnF/EyIb2y16VQ/dUHHcdKYH0XPGhqzjn6kv3pOIwEZeU9v31fUYtuWQXmymkLa2P99C2k5gOImFfu7rpXo9YrrdWPndiIcTlRZsYbNHxJl1/1D75Rxn953CpLhB464o6ASJk/UvrvzFSkAT7xLuLzAaAAH3ob3piiir6r3yymxj67tiizYWazTpvUwF6GO5vFiKqbH19ImpluUQ7YboyBODyTVwfJnCNF3OdfYA09FKuVK/7AoPwBh2+X+sc5LSyQGrbBahiYup4wSaTwh2GGFtcLO9E0j8l1vvrNU/+PGOlzoH9AJ+jO3LnRPZetrn8x4e5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXiXtj7c+r0z95YTbVMr56AAnrhN5qOKNL9W0l6CHSU=;
 b=BIMd4DfmhzdUfH2vGC2epvlvF/Wg6RXGYyltk+ClzYy14jxjtzl78m0W20Sf9uHEUnMjRg7j8aZHP3Ey2muyehn0A4raloIwBe9+lubmJ6IL6TOXnjp9f7jKnvSqa5RVABx8CoB1dSE6vcaSf1hf8PbhUTO91aye3rVEuJk/shFnQK9jd4wAnRlJTLDj9RvLRjXPVeTYwHpIbi1NKROs/pPZO3rmahLJMpXKcXDp8xx33ZIiseHGhZIcBC4teQcqiMYI0jDEqrwiKW0OijUiAbNpSDt6ltVpOLAFTmR7Xq9x+vhqr6gZrZwkcPuaGuAxmX/4q62+VJrtQg4DtWvy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXiXtj7c+r0z95YTbVMr56AAnrhN5qOKNL9W0l6CHSU=;
 b=LpVCj1tsYVbY3s+OPfA8gCW+9fN9MPLKoeGH4ZhXEeH9WrCoRmwzC1L3112Jy0fZtRXEDH1V2LBgYmPmHwOdmAyPd+KM/9Aot4pTEvLA+fpwPr/SdDj5A/HaeZe86qqOrPbL3E3587FXA2fRH7xQEm3CZs0vehKBrn/bJy/1rKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by DM6PR12MB4339.namprd12.prod.outlook.com (2603:10b6:5:2af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 07:59:05 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%7]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 07:58:58 +0000
Message-ID: <78798afb-8b11-4229-bd8a-6b441d967a57@amd.com>
Date: Wed, 30 Apr 2025 13:28:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] WARNING in move_to_new_folio
To: syzbot <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6811d179.050a0220.39e3a1.0cea.GAE@google.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <6811d179.050a0220.39e3a1.0cea.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::14) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|DM6PR12MB4339:EE_
X-MS-Office365-Filtering-Correlation-Id: ac5b033e-61e0-4dae-d58b-08dd87bcdcba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SGFsWVlJYitoM3dBK0U3OUpqTkxWdndGa0VzSzBrSDJWU2hnOG96ZXlIUndL?=
 =?utf-8?B?WENzZldrR1hRUUc4akxEVWxzb2VORUVpWTF4RTVSYVBrMkw1clhkY3l1Qzho?=
 =?utf-8?B?R0t1L2M1ZERoUGVFWXhubC9ONXp6ZExpdzZqalFTdWJMSEg3ZzN3R1dHRXBh?=
 =?utf-8?B?aHJveXEyelFIQzZRWGJJL1pEbWNtbld6T1R2T1NZYjllSTYyS0oweno3SXo5?=
 =?utf-8?B?WkhtbE5wekZ0UUF1VWpjbTg1djk4VW5xN2Q2T1NSTm5UbjdVZUVIZWN4L3lq?=
 =?utf-8?B?UkdlbXpOUGZzODAyMlgxY3RCWW5GTGpFeElrT2FQYU9NL1dmbFNaOVBJbXZ5?=
 =?utf-8?B?MzZiZ0hldFIyMlg1bHdBUUtseTlRMWJLdU9xeTExZmNUM012ZkRtTDdITW1F?=
 =?utf-8?B?SUpGd2hpUEJwS0lEazk2UUhxb001VXBuVUpIaFV1WVhSNUE3aW50SnQ3N29t?=
 =?utf-8?B?Z0ErTnpmMmI4ekpYaFY0ZW12SGM5RVR1QXJMUWxCS1huYXhMQTJyL0pRNFdD?=
 =?utf-8?B?RCtmbFVwNjZ3UnRVbjJYeHFId0NsRmowK21BNFcvNVNLNTJvSDZ6M3J6ZVJR?=
 =?utf-8?B?SU5lczI0OVdhQlZkN0RGczdMZ2Z4MTh0bWZlLzh0dlFnekhJTzBqR25HeEkr?=
 =?utf-8?B?Ky9OQzFXTkFDYUxZcGtWUUxoQVpxakc1Mk52NTBkMzFLTWo2VU93SlpucVho?=
 =?utf-8?B?dG94djBMN3hVOTRJWVZYZUVZRUVHdUlOOHI0cmQrTU1nZlBTUXpkY1g3SFFo?=
 =?utf-8?B?QW45UFJwNHNsckQzUlJkWmdTVnUyS09ycnRtN3Y5K1ZGN3lMVlRqVCtSVjBV?=
 =?utf-8?B?clRHSG1BZm5OT3V1UWt5My9PWkZTazdUcnMvVDNseXFxSU85bEFPNmJsVElp?=
 =?utf-8?B?Ui9jSHcreDNtbTR2YURWak44YXNzU1pkeFJObE9jdGlQSEh3WUFaaHR3WHJ2?=
 =?utf-8?B?QUpkNCtSUHdYK0k3VFU2eGYxUFE0V3V2RndNTlFVenJZMFhZR1RYcExQRkJ3?=
 =?utf-8?B?Q0drRzFjQkJZZU5NclFsdnJGTUFSdkJmZW5KMzJTKzlxcURjbGRzaGkyR1I0?=
 =?utf-8?B?QlBtM0Q0OHZmQmk1Z1ZLZFcxVXJlZTJoSEd6Q2ZBK2xaT29NZ2ZJaWk0b3hk?=
 =?utf-8?B?ZkdkQzc1KzZKb3pmNnNIb0hSbkxENWRPUW81ZmtZNS92eUJ3Z3QwWDdBVE9M?=
 =?utf-8?B?Wnhyei9hSlFGMFBYa090c3BkeDFOVzJTc1g1OFVSQWVFSCsrby93WWJaazBF?=
 =?utf-8?B?aC9YSUdtdUVIQmhpVVNiWG1EZHZ1a0RPOFpVVy8ySjliTjBDOUhGNXllMGZq?=
 =?utf-8?B?dGhYTk5tWTFWeG5CTWpzT3ZTZFFOdGNzWmdWLzF4WnVyc1Z6eEQxWnhEaUJT?=
 =?utf-8?B?TmNCRWl4MCtnd096TDF3UFpKMVF3MzY4YVF6TjJWK1g0ZVJiWERUTnlYWVl5?=
 =?utf-8?B?bW13VXlwSm9SYUU4UmNKaEdob3BhMUE5dUZwcmZWWmpWN1hKcEFmYUJRV1U2?=
 =?utf-8?B?TW9ZRVNHY2oyUkpJN1lrVGJqVGdjNGxUVmJsUDlITTU5bTNYNVBWY0lCZUVp?=
 =?utf-8?B?WDlkM0I4eWR3VGRTR00yMVFwb21JcExnMWk4OTlDcE93c2VXbE1ELy9lakxZ?=
 =?utf-8?B?aXJLcUI4Um9tQmlacnJsSTRqSTc0YVZEa1lUZEtML1ptR0hzZmUrMnA2TmM4?=
 =?utf-8?B?THV4NjRyS201N2VDYkRmVC9mRE1qaWU4QWtDUXkwRm8yRW5sTitmdnNPVU4x?=
 =?utf-8?B?M0lnbXNTOE43UitvR1FEelVmbG1WSm5DY21yOGNIak9PMkZrb3ZsS0dudVZq?=
 =?utf-8?B?Rm8xLzVpQjZMY0RBUUI5OFcwbWd3cWJ5dThEWTN1STR3UlUrUHhRbTJFNE10?=
 =?utf-8?Q?1Um2cc+pv1cUM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVhjTURiQllQWnVmRTlmMUM2YVI3cmYxTFpSbDVjcUE0VW5LNmZjZFhXOTMx?=
 =?utf-8?B?NzhMNG9PRHo1MjVMWG5aQ2h2VXBQYU9vTUN1STlnVkp5KzBaV00weGNmTDV0?=
 =?utf-8?B?akVRcTVaQjhuVGJuOUlYZ3FkZ0dTMHVtbWtCcjBaQmp0RWRMMGJ0cCs0THpx?=
 =?utf-8?B?M0NubEI4Z3VtK0puaE5kMjdyUWtZS1MyMkFRWEFheHhZVWUxd3BqaFFhRkFx?=
 =?utf-8?B?K2tORlhpRHc5RGtnT3FENEljSEgxYm1zZWRYSnVtUWNYNWFhVDVKb21EZWh4?=
 =?utf-8?B?UkQ2Z016VWxhNHFzZGFVR20rTnNYREVMdUpQbHIwM0tXVTRSNXFJclNQQzBO?=
 =?utf-8?B?eDQvN09FbURZTjJVRm9sWThUVkdIQjZuN1lVN00vL3dXbGxYSXVXcThiK04r?=
 =?utf-8?B?TmlHWmhJYXFOdGFkcTlEVFI3YzQ1bmdDR1NnYXJydW5yRXhVb0hhZ2NQeG1a?=
 =?utf-8?B?MWFaeEJKTDhMNVF0bDROU3phU2lJUkgrSk1tVHlQK0k4TDEvUFVmQnQ1RGFE?=
 =?utf-8?B?Q0tjNHJnc2FHKzN4ZWd4QXkrUndFUUowTDEzNFEyWVE1RW40d01mLzlLTlMv?=
 =?utf-8?B?b1RlYmxhMFZlYzFldmxQQjRPNGhlbkJRbHA2WHZwMlZUbFpyaXpjdjFVUXF6?=
 =?utf-8?B?MUp2eUZCZEtuaCs1RnY0TmlXNWtZMWxMSXdyY01ucnZVc3N4RmlCWkdWeTB6?=
 =?utf-8?B?MlhxendXa2hUblFGdnpBekJvS2YxTmFIb1lzM1lsSDZkbTBqS3FNcHZEQW1h?=
 =?utf-8?B?MGgzWEc3ajBYZnZURmdTOG1OTFVUTVpsd3pJcWRsRklidStuZEZxUmNDRjV5?=
 =?utf-8?B?aWFSOWMwYWlvdTBZUGpVblBZdkp1UFlNeDFNRFg2NjVNeUVCNE8ybzdkYS9o?=
 =?utf-8?B?SWxXLzRTbTlzY29EczJtaWJKbU5UWE1VOVVRZVVRTmVVaFN0ZGFic1VDMms1?=
 =?utf-8?B?TFpWcXNmU1VqS3BvYlFLelcyMW9BOUF3QUlLdWFNWExIQXN5TForeWVKbmUy?=
 =?utf-8?B?QjhFblRkdlFCTFRVRmZVWG5LdlN1aWtzK0kzZUo2UFFnRmllNm5CaFlOZzdl?=
 =?utf-8?B?WFVoZkh1enhXWTJISnJoR2dqbm5YcXpnVDNmVGhheEJRaUcwWFJOYXp4dU53?=
 =?utf-8?B?cFlmNWRoVHVUNXVEL21BRDFpcHd3dkV6bHpQMFJBUUZmTnduZUVuZVpIWVNx?=
 =?utf-8?B?OGZrdEpFQXZKRVRKUEJFR2RDcW1uQUhFeEwxRXBTNlFzZFd4RXlOTXlSQzRt?=
 =?utf-8?B?eDVlcEI4RE80M01BQlJraXNQSXBlV1U4VklLemkzZ1F2YnV4WTA0K0o3bldQ?=
 =?utf-8?B?K1Q0bENwQnlRWUhIMEdwY0ZBSmdNMHRLcDBabGtIOHdod2x2MnFQZjZUU21E?=
 =?utf-8?B?eGlZZExFby9XR2phdXZwWkhaMkpkK1Z5MnFhY0FWV1BlQ2xpQ3FPMFF3TUox?=
 =?utf-8?B?YnFnTkdXOHFHNVliekNmeVMrU3lsSjNFM3VJVWNlRWhVQkdyQ3M4dUN6WjdO?=
 =?utf-8?B?Z2RCZkhVZ1UvbFJFU1Z4blJrb2xjLzFSUVFGRFNjSm8zek16MEExUlNFbWxC?=
 =?utf-8?B?cEdYejdQY1BEeUg2NzRyZEMvQjBqRG8venZpODVOSi84V2grOFJDL1FNRFli?=
 =?utf-8?B?Z01GOTZWQTB1MXk2K3JaQlUvcXhENm9DYytVTmVaaS8xK2hQTWNPT0tzRnox?=
 =?utf-8?B?SG9MWERpOUtYU2ZhakRyODJCcTRnTWJRMzVHY3plS09EQXZWRFozRkVNbWZu?=
 =?utf-8?B?OUx1VkJmVTE3amtKQnJUSzVuYUxiZUcyemMwRW92V0ZQZWdjZzE3WGoxQnVa?=
 =?utf-8?B?cDIxNGdCT1JzT1BhTEdGLzhtUHFaR0tvMzBRNHJ0R1VtdnBrbkVaREhkVTIx?=
 =?utf-8?B?aytiU2VyS2xIa3pUTTNqenUvNWgvSGhVbERTdjI5K3pUY3VPelhiUEZMTkth?=
 =?utf-8?B?M2FFaENwTXYrMEs3MHRkYjNvMTBueHJadDBCcmprRHZuSTAxalUreVBReTJB?=
 =?utf-8?B?KzdKWUY4MUJJTy9oTlB4SmlzdEpMM3VpaUxTOUZpazh1bmVnWVJMNzRVd29O?=
 =?utf-8?B?VjBpRTFwSis3MDYyS3pqM0w0TE1teVBYWWpFZ3liR0k1dVZaZ2VEdUtveERr?=
 =?utf-8?Q?P2weE4E9MJSCjHeJPiBsC27TY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5b033e-61e0-4dae-d58b-08dd87bcdcba
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 07:58:58.5026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fu9xaohfZX8e4a/Hc4vu4E6W/DhXAzoSbW8Ws+oYp38Afa9ZzGQ3H8NK6EAu6fCIeeTgFQFF0RGfOSP10bo6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4339

Hi,

I think the issue is due to e7021e2fe0 as described below:
https://lore.kernel.org/all/SJ1PR11MB6129E62E3B372932C6B7477FB9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com/

Trying again after reverting this patch:

#syz test: https://github.com/shivankgarg98/linux.git 5d98b45ab

On 4/30/2025 1:00 PM, syzbot wrote:
> Hello,
> 
> syzbot tried to test the proposed patch but the build/boot failed:
> 
> ed.
> [    1.681174][    T0] 	Tracing variant of Tasks RCU enabled.
> [    1.681902][    T0] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
> [    1.683059][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
> [    1.684680][    T0] Running RCU synchronous self tests
> [    1.685620][    T0] RCU Tasks: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=2.
> [    1.686925][    T0] RCU Tasks Trace: Setting shift to 1 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=2.
> [    1.823163][    T0] NR_IRQS: 4352, nr_irqs: 440, preallocated irqs: 16
> [    1.825139][    T0] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    1.826579][    T0] kfence: initialized - using 2097152 bytes for 255 objects at 0xffff88823be00000-0xffff88823c000000
> [    1.829232][    T0] Console: colour VGA+ 80x25
> [    1.829978][    T0] printk: legacy console [ttyS0] enabled
> [    1.829978][    T0] printk: legacy console [ttyS0] enabled
> [    1.831736][    T0] printk: legacy bootconsole [earlyser0] disabled
> [    1.831736][    T0] printk: legacy bootconsole [earlyser0] disabled
> [    1.833514][    T0] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
> [    1.834681][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    1.835518][    T0] ... MAX_LOCK_DEPTH:          48
> [    1.836336][    T0] ... MAX_LOCKDEP_KEYS:        8192
> [    1.837124][    T0] ... CLASSHASH_SIZE:          4096
> [    1.838035][    T0] ... MAX_LOCKDEP_ENTRIES:     1048576
> [    1.838801][    T0] ... MAX_LOCKDEP_CHAINS:      1048576
> [    1.839561][    T0] ... CHAINHASH_SIZE:          524288
> [    1.840423][    T0]  memory used by lock dependency info: 106625 kB
> [    1.841405][    T0]  memory used for stack traces: 8320 kB
> [    1.842304][    T0]  per task-struct memory footprint: 1920 bytes
> [    1.843565][    T0] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
> [    1.845316][    T0] ACPI: Core revision 20241212
> [    1.846971][    T0] APIC: Switch to symmetric I/O mode setup
> [    1.848285][    T0] x2apic enabled
> [    1.852223][    T0] APIC: Switched APIC routing to: physical x2apic
> [    1.859089][    T0] ..TIMER: vector=0x30 apic1=0 pin1=0 apic2=-1 pin2=-1
> [    1.860641][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1fb6f3811e0, max_idle_ns: 440795202126 ns
> [    1.862247][    T0] Calibrating delay loop (skipped) preset value.. 4400.40 BogoMIPS (lpj=22002040)
> [    1.864112][    T0] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
> [    1.865179][    T0] Last level dTLB entries: 4KB 64, 2MB 32, 4MB 32, 1GB 4
> [    1.866500][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> [    1.872389][    T0] Spectre V2 : Spectre BHI mitigation: SW BHB clearing on syscall and VM exit
> [    1.874070][    T0] Spectre V2 : Mitigation: IBRS
> [    1.875161][    T0] Spectre V2 : Spectre v2 / SpectreRSB: Filling RSB on context switch and VMEXIT
> [    1.876856][    T0] RETBleed: Mitigation: IBRS
> [    1.878026][    T0] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> [    1.879710][    T0] Spectre V2 : User space: Mitigation: STIBP via prctl
> [    1.882307][    T0] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
> [    1.883734][    T0] MDS: Mitigation: Clear CPU buffers
> [    1.884454][    T0] TAA: Mitigation: Clear CPU buffers
> [    1.885363][    T0] MMIO Stale Data: Vulnerable: Clear CPU buffers attempted, no microcode
> [    1.886952][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> [    1.888547][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    1.889823][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    1.890929][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    1.892240][    T0] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
> [    2.193671][    T0] Freeing SMP alternatives memory: 132K
> [    2.194604][    T0] pid_max: default: 32768 minimum: 301
> [    2.196277][    T0] LSM: initializing lsm=lockdown,capability,landlock,yama,safesetid,tomoyo,apparmor,bpf,ima,evm
> [    2.198299][    T0] landlock: Up and running.
> [    2.198925][    T0] Yama: becoming mindful.
> [    2.199858][    T0] TOMOYO Linux initialized
> [    2.201374][    T0] AppArmor: AppArmor initialized
> [    2.203589][    T0] LSM support for eBPF active
> [    2.210200][    T0] Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, vmalloc hugepage)
> [    2.214840][    T0] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, vmalloc hugepage)
> [    2.216675][    T0] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, vmalloc)
> [    2.218347][    T0] Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, vmalloc)
> [    2.224475][    T0] Running RCU synchronous self tests
> [    2.225441][    T0] Running RCU synchronous self tests
> [    2.347377][    T1] smpboot: CPU0: Intel(R) Xeon(R) CPU @ 2.20GHz (family: 0x6, model: 0x4f, stepping: 0x0)
> [    2.351817][    T9] ------------[ cut here ]------------
> [    2.352232][    T9] WARNING: CPU: 0 PID: 9 at arch/x86/mm/tlb.c:919 switch_mm_irqs_off+0x640/0x7c0
> [    2.352232][    T9] Modules linked in:
> [    2.352232][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.15.0-rc4-next-20250428-syzkaller-dirty #0 PREEMPT(full) 
> [    2.352232][    T9] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
> [    2.352232][    T9] Workqueue: events once_deferred
> [    2.352232][    T9] RIP: 0010:switch_mm_irqs_off+0x640/0x7c0
> [    2.352232][    T9] Code: 84 f4 fa ff ff 90 0f 0b 90 e9 eb fa ff ff 90 0f 0b 90 e9 84 fe ff ff 90 0f 0b 90 e9 18 fc ff ff 90 0f 0b 90 e9 cb fb ff ff 90 <0f> 0b 90 e9 df fb ff ff 89 c8 90 0f 0b 90 e9 3f fd ff ff 90 0f 0b
> [    2.352232][    T9] RSP: 0000:ffffc900000e7720 EFLAGS: 00010056
> [    2.352232][    T9] RAX: 0000000000000001 RBX: ffff88801a070940 RCX: ffffffff8173b01d
> [    2.352232][    T9] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88801a070940
> [    2.352232][    T9] RBP: ffffc900000e77f0 R08: ffff88801a070947 R09: 1ffff1100340e128
> [    2.352232][    T9] R10: dffffc0000000000 R11: ffffed100340e129 R12: 1ffff110037d70ab
> [    2.352232][    T9] R13: ffffffff8e0467c0 R14: ffff88801beb8000 R15: 0000000000000000
> [    2.352232][    T9] FS:  0000000000000000(0000) GS:ffff8881260a1000(0000) knlGS:0000000000000000
> [    2.352232][    T9] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    2.352232][    T9] CR2: ffff88823ffff000 CR3: 000000001a078000 CR4: 00000000003506f0
> [    2.352232][    T9] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [    2.352232][    T9] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [    2.352232][    T9] Call Trace:
> [    2.352232][    T9]  <TASK>
> [    2.352232][    T9]  ? __pfx_switch_mm_irqs_off+0x10/0x10
> [    2.352232][    T9]  ? __text_poke+0x5a4/0x980
> [    2.352232][    T9]  ? kasan_check_range+0x29a/0x2b0
> [    2.352232][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
> [    2.352232][    T9]  unuse_temporary_mm+0x9d/0x100
> [    2.352232][    T9]  __text_poke+0x634/0x980
> [    2.352232][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
> [    2.352232][    T9]  ? __pfx_text_poke_memcpy+0x10/0x10
> [    2.352232][    T9]  ? __pfx___text_poke+0x10/0x10
> [    2.352232][    T9]  ? rcu_is_watching+0x15/0xb0
> [    2.352232][    T9]  ? trace_contention_end+0x39/0x120
> [    2.352232][    T9]  smp_text_poke_batch_finish+0x38c/0x1100
> [    2.352232][    T9]  ? __pfx___mutex_lock+0x10/0x10
> [    2.352232][    T9]  ? __pfx_smp_text_poke_batch_finish+0x10/0x10
> [    2.352232][    T9]  ? arch_jump_label_transform_queue+0x97/0x110
> [    2.352232][    T9]  ? __jump_label_update+0x37e/0x3a0
> [    2.352232][    T9]  arch_jump_label_transform_apply+0x1c/0x30
> [    2.352232][    T9]  static_key_disable_cpuslocked+0xc5/0x1b0
> [    2.352232][    T9]  static_key_disable+0x1a/0x20
> [    2.352232][    T9]  once_deferred+0x6f/0xb0
> [    2.352232][    T9]  ? process_scheduled_works+0x9ef/0x17b0
> [    2.352232][    T9]  process_scheduled_works+0xade/0x17b0
> [    2.352232][    T9]  ? __pfx_process_scheduled_works+0x10/0x10
> [    2.352232][    T9]  worker_thread+0x8a0/0xda0
> [    2.352232][    T9]  kthread+0x70e/0x8a0
> [    2.352232][    T9]  ? __pfx_worker_thread+0x10/0x10
> [    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.352232][    T9]  ? _raw_spin_unlock_irq+0x23/0x50
> [    2.352232][    T9]  ? lockdep_hardirqs_on+0x9c/0x150
> [    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.352232][    T9]  ret_from_fork+0x4b/0x80
> [    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.352232][    T9]  ret_from_fork_asm+0x1a/0x30
> [    2.352232][    T9]  </TASK>
> [    2.352232][    T9] Kernel panic - not syncing: kernel: panic_on_warn set ...
> [    2.352232][    T9] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted 6.15.0-rc4-next-20250428-syzkaller-dirty #0 PREEMPT(full) 
> [    2.352232][    T9] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/19/2025
> [    2.352232][    T9] Workqueue: events once_deferred
> [    2.352232][    T9] Call Trace:
> [    2.352232][    T9]  <TASK>
> [    2.352232][    T9]  dump_stack_lvl+0x99/0x250
> [    2.352232][    T9]  ? __asan_memcpy+0x40/0x70
> [    2.352232][    T9]  ? __pfx_dump_stack_lvl+0x10/0x10
> [    2.352232][    T9]  ? __pfx__printk+0x10/0x10
> [    2.352232][    T9]  panic+0x2db/0x790
> [    2.352232][    T9]  ? __pfx_panic+0x10/0x10
> [    2.352232][    T9]  ? show_trace_log_lvl+0x4fb/0x550
> [    2.352232][    T9]  ? ret_from_fork_asm+0x1a/0x30
> [    2.352232][    T9]  __warn+0x31b/0x4b0
> [    2.352232][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
> [    2.352232][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
> [    2.352232][    T9]  report_bug+0x2be/0x4f0
> [    2.352232][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
> [    2.352232][    T9]  ? switch_mm_irqs_off+0x640/0x7c0
> [    2.352232][    T9]  ? switch_mm_irqs_off+0x642/0x7c0
> [    2.352232][    T9]  handle_bug+0x84/0x160
> [    2.352232][    T9]  exc_invalid_op+0x1a/0x50
> [    2.352232][    T9]  asm_exc_invalid_op+0x1a/0x20
> [    2.352232][    T9] RIP: 0010:switch_mm_irqs_off+0x640/0x7c0
> [    2.352232][    T9] Code: 84 f4 fa ff ff 90 0f 0b 90 e9 eb fa ff ff 90 0f 0b 90 e9 84 fe ff ff 90 0f 0b 90 e9 18 fc ff ff 90 0f 0b 90 e9 cb fb ff ff 90 <0f> 0b 90 e9 df fb ff ff 89 c8 90 0f 0b 90 e9 3f fd ff ff 90 0f 0b
> [    2.352232][    T9] RSP: 0000:ffffc900000e7720 EFLAGS: 00010056
> [    2.352232][    T9] RAX: 0000000000000001 RBX: ffff88801a070940 RCX: ffffffff8173b01d
> [    2.352232][    T9] RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffff88801a070940
> [    2.352232][    T9] RBP: ffffc900000e77f0 R08: ffff88801a070947 R09: 1ffff1100340e128
> [    2.352232][    T9] R10: dffffc0000000000 R11: ffffed100340e129 R12: 1ffff110037d70ab
> [    2.352232][    T9] R13: ffffffff8e0467c0 R14: ffff88801beb8000 R15: 0000000000000000
> [    2.352232][    T9]  ? switch_mm_irqs_off+0x21d/0x7c0
> [    2.352232][    T9]  ? __pfx_switch_mm_irqs_off+0x10/0x10
> [    2.352232][    T9]  ? __text_poke+0x5a4/0x980
> [    2.352232][    T9]  ? kasan_check_range+0x29a/0x2b0
> [    2.352232][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
> [    2.352232][    T9]  unuse_temporary_mm+0x9d/0x100
> [    2.352232][    T9]  __text_poke+0x634/0x980
> [    2.352232][    T9]  ? serial8250_isa_init_ports+0x63/0xf0
> [    2.352232][    T9]  ? __pfx_text_poke_memcpy+0x10/0x10
> [    2.352232][    T9]  ? __pfx___text_poke+0x10/0x10
> [    2.352232][    T9]  ? rcu_is_watching+0x15/0xb0
> [    2.352232][    T9]  ? trace_contention_end+0x39/0x120
> [    2.352232][    T9]  smp_text_poke_batch_finish+0x38c/0x1100
> [    2.352232][    T9]  ? __pfx___mutex_lock+0x10/0x10
> [    2.352232][    T9]  ? __pfx_smp_text_poke_batch_finish+0x10/0x10
> [    2.352232][    T9]  ? arch_jump_label_transform_queue+0x97/0x110
> [    2.352232][    T9]  ? __jump_label_update+0x37e/0x3a0
> [    2.352232][    T9]  arch_jump_label_transform_apply+0x1c/0x30
> [    2.352232][    T9]  static_key_disable_cpuslocked+0xc5/0x1b0
> [    2.352232][    T9]  static_key_disable+0x1a/0x20
> [    2.352232][    T9]  once_deferred+0x6f/0xb0
> [    2.352232][    T9]  ? process_scheduled_works+0x9ef/0x17b0
> [    2.352232][    T9]  process_scheduled_works+0xade/0x17b0
> [    2.352232][    T9]  ? __pfx_process_scheduled_works+0x10/0x10
> [    2.352232][    T9]  worker_thread+0x8a0/0xda0
> [    2.352232][    T9]  kthread+0x70e/0x8a0
> [    2.352232][    T9]  ? __pfx_worker_thread+0x10/0x10
> [    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.352232][    T9]  ? _raw_spin_unlock_irq+0x23/0x50
> [    2.352232][    T9]  ? lockdep_hardirqs_on+0x9c/0x150
> [    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.352232][    T9]  ret_from_fork+0x4b/0x80
> [    2.352232][    T9]  ? __pfx_kthread+0x10/0x10
> [    2.352232][    T9]  ret_from_fork_asm+0x1a/0x30
> [    2.352232][    T9]  </TASK>
> [    2.352232][    T9] Rebooting in 86400 seconds..
> 
> 
> syzkaller build log:
> go env (err=<nil>)
> GO111MODULE='auto'
> GOARCH='amd64'
> GOBIN=''
> GOCACHE='/syzkaller/.cache/go-build'
> GOENV='/syzkaller/.config/go/env'
> GOEXE=''
> GOEXPERIMENT=''
> GOFLAGS=''
> GOHOSTARCH='amd64'
> GOHOSTOS='linux'
> GOINSECURE=''
> GOMODCACHE='/syzkaller/jobs-2/linux/gopath/pkg/mod'
> GONOPROXY=''
> GONOSUMDB=''
> GOOS='linux'
> GOPATH='/syzkaller/jobs-2/linux/gopath'
> GOPRIVATE=''
> GOPROXY='https://proxy.golang.org,direct'
> GOROOT='/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.1-go1.23.7.linux-amd64'
> GOSUMDB='sum.golang.org'
> GOTMPDIR=''
> GOTOOLCHAIN='auto'
> GOTOOLDIR='/syzkaller/jobs-2/linux/gopath/pkg/mod/golang.org/toolchain@v0.0.1-go1.23.7.linux-amd64/pkg/tool/linux_amd64'
> GOVCS=''
> GOVERSION='go1.23.7'
> GODEBUG=''
> GOTELEMETRY='local'
> GOTELEMETRYDIR='/syzkaller/.config/go/telemetry'
> GCCGO='gccgo'
> GOAMD64='v1'
> AR='ar'
> CC='gcc'
> CXX='g++'
> CGO_ENABLED='1'
> GOMOD='/syzkaller/jobs-2/linux/gopath/src/github.com/google/syzkaller/go.mod'
> GOWORK=''
> CGO_CFLAGS='-O2 -g'
> CGO_CPPFLAGS=''
> CGO_CXXFLAGS='-O2 -g'
> CGO_FFLAGS='-O2 -g'
> CGO_LDFLAGS='-O2 -g'
> PKG_CONFIG='pkg-config'
> GOGCCFLAGS='-fPIC -m64 -pthread -Wl,--no-gc-sections -fmessage-length=0 -ffile-prefix-map=/tmp/go-build1284445660=/tmp/go-build -gno-record-gcc-switches'
> 
> git status (err=<nil>)
> HEAD detached at 0bd6db4180
> nothing to commit, working tree clean
> 
> 
> tput: No value for $TERM and no -T specified
> tput: No value for $TERM and no -T specified
> Makefile:31: run command via tools/syz-env for best compatibility, see:
> Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-env
> go list -f '{{.Stale}}' ./sys/syz-sysgen | grep -q false || go install ./sys/syz-sysgen
> make .descriptions
> tput: No value for $TERM and no -T specified
> tput: No value for $TERM and no -T specified
> Makefile:31: run command via tools/syz-env for best compatibility, see:
> Makefile:32: https://github.com/google/syzkaller/blob/master/docs/contributing.md#using-syz-env
> bin/syz-sysgen
> touch .descriptions
> GOOS=linux GOARCH=amd64 go build "-ldflags=-s -w -X github.com/google/syzkaller/prog.GitRevision=0bd6db418098e2d98a2edf948b41410d3d9f9e70 -X 'github.com/google/syzkaller/prog.gitRevisionDate=20250411-130225'" -o ./bin/linux_amd64/syz-execprog github.com/google/syzkaller/tools/syz-execprog
> mkdir -p ./bin/linux_amd64
> g++ -o ./bin/linux_amd64/syz-executor executor/executor.cc \
> 	-m64 -O2 -pthread -Wall -Werror -Wparentheses -Wunused-const-variable -Wframe-larger-than=16384 -Wno-stringop-overflow -Wno-array-bounds -Wno-format-overflow -Wno-unused-but-set-variable -Wno-unused-command-line-argument -static-pie -std=c++17 -I. -Iexecutor/_include   -DGOOS_linux=1 -DGOARCH_amd64=1 \
> 	-DHOSTGOOS_linux=1 -DGIT_REVISION=\"0bd6db418098e2d98a2edf948b41410d3d9f9e70\"
> /usr/bin/ld: /tmp/ccP81Mp7.o: in function `Connection::Connect(char const*, char const*)':
> executor.cc:(.text._ZN10Connection7ConnectEPKcS1_[_ZN10Connection7ConnectEPKcS1_]+0x104): warning: Using 'gethostbyname' in statically linked applications requires at runtime the shared libraries from the glibc version used for linking
> 
> 
> Error text is too large and was truncated, full error text is at:
> https://syzkaller.appspot.com/x/error.txt?x=11a9f368580000
> 
> 
> Tested on:
> 
> commit:         33035b66 Add linux-next specific files for 20250428
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5748169cc3be99bc
> dashboard link: https://syzkaller.appspot.com/bug?extid=8bb6fd945af4e0ad9299
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=1292d774580000
> 

