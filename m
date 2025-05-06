Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1627319CC0E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746557717; cv=fail; b=eZeTSSIpuMB3Y9UaFilVCUhtQgngGILR98ooXtuVHaxurgDPyhyoZnKjLpeOaI7nnEECZ8hb7e25JBu+jlv2DEHGbHa3DVNnYKkThmlWZWAQd4vnJ8EAyhpCbRYOJ860bCMWJtcsnmKs6jBx46QEFgUdMkPCtRI28S3Qypp4A2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746557717; c=relaxed/simple;
	bh=mWPTC8MEqWqWiJTYGJQgwoPjanFJ09E9SbtC0QcsUOM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ck6uX7chJb4aMPI6/BB6S8NZcp5zDM/NkdS1ewOqhHTtCJVnoydB872FPbG1hAC9u2TJbmtxwGE+8rsPRr2svNbFiv9f/WQ875EC3tkkRezVLBthBoS+X3rlzF6eTY+LMgBAj2aZYB2fYi4hHnhFEl3Y2QtQkBM8WCNdqehnV3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tS9y6Lnq; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tS9y6Lnq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hnt8NCHEqUIvSSjWYTfPEQBQ3Lo4XDTMOPko+151acjWKB/3H/abkky72gx8DuGbotBFvQ5duL4ahSLoNUkOOWveH6BUxF2A2uW3qty633NTIftGB/j6PBbpduYCxbejyoyjijiOAAot6979hP7cgMaM7HrpguZkcsipzwEx2CBxVK2Bus+xtCWf56Ae2yMkZ67BBIPqYsce2VFS4WN0zyKW+vRHUHIiLubeoWGcla4bs4O2FftE+lO2zOqRPuv4Ltif3BQl7/JPD+DAMV0dGVlYiGjE2UbRJf3KdVMncrPpMJllLZDSwCFixO9vXDQH/pC+Ie4Z4uzt/TSyfBoJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eR6T48a11hZlnSf9Vg+0rHZl2Ze7XtUgxwGgkIRPmug=;
 b=A7FIJJMyPSgBqb80GuMMHy3C5IO+MtoFHQdQjqh8TbFe1OVLb/NcwMXPxlhZGUnaowrenDhjQxr+wD91eHS+CGP9OStvi7bCnK6LSh+/VEDEz2OR9b2xUB3UeQpPEJHupROYpoF5kCsnIkh5S+c/DjR8mKsjOIVmslY+PvEs98Qm+tWa6NXt7T99HXc1wlgcqNEDu7x8ANBuM95uyQ08IGv631+R4G2dbwCMPO9xNkYcHTo8bYxJep3J/yzX6N1KsJW6JAOO1L2LUO9PKk17Ptu7ASlXqYNIwePOfNSRLNOGKlNkfBfT3fRdx3pm5td06QUa41QxNrQ2/bXDQL9DQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eR6T48a11hZlnSf9Vg+0rHZl2Ze7XtUgxwGgkIRPmug=;
 b=tS9y6LnqqTnaWQy5IXIONNG/db3FP4AcPC9RhosAHL4ZXiINgXYKeJQpi1AU7IEIp4+ojaaqZ79jHRb+UvgFREMelmjpXUGwIMHWOAfancRroJcXQeFfmN2IOA+cvs9QWjLu6V8OZ94vUwTCbWBKkkmQsMYYjzcV+Uztx7CJ8pA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by MW4PR12MB6828.namprd12.prod.outlook.com (2603:10b6:303:209::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 18:55:09 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%3]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 18:55:09 +0000
Message-ID: <fae08232-51ed-cc88-3de0-1cd9b014603b@amd.com>
Date: Tue, 6 May 2025 13:55:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/4] x86/sev: Rework SNP Guest Request
To: Alexey Kardashevskiy <aik@amd.com>, x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Nikunj A Dadhania <nikunj@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
 Brijesh Singh <brijesh.singh@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Liam Merwick <liam.merwick@oracle.com>
References: <20250505141238.4179623-1-aik@amd.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20250505141238.4179623-1-aik@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:806:127::11) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|MW4PR12MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c671b12-124b-46bc-91c1-08dd8ccf85f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bVlodmcvRThSamU1dU1FQ1FKd3pWcW9LYm1WZDBzZ2NNNUNodlJYM3Nlb2NO?=
 =?utf-8?B?Yi8wYSswZk9HQXRUallNYmdyK0Nmcy9FMGVLM3JyYmRPeTFlMDZXN2h5Szh2?=
 =?utf-8?B?bWRadncwK1VVLzFSVFd2bUhoY29oSktzTEo0dDRBSnBEOG5jUHpzUmkvVm00?=
 =?utf-8?B?WFRTRldtOERDWmY4RmlPK2ZnOHR3SmZmMTJpUzhkSk04Z0RwQ05CWmxkNitU?=
 =?utf-8?B?OHJNK3BwS0JJcldvZEo0ZlB2a1J1OFA3R0Vqekg4Y0V1UjhZNGptSTJiL1N1?=
 =?utf-8?B?L2dwa2pvR0lnSXhuQk5VWmhjeU8zVWlTL01uTytOTXdBQU1kcWVwWEVkdHFP?=
 =?utf-8?B?T3hoQzNKT3p1amY3UkxQZDRScGxBTDdKM21IOFVCMjBITmtTYXZITU14ZUJI?=
 =?utf-8?B?dGpVVzZSU1ltaXJjeW05L3lNeEtWQ2tTMjNrdVZIUjkzKytSaE1EMERXcUFG?=
 =?utf-8?B?WWFoSnZxQ3ZKRHJRUXVHTGFqRGVZQWFnVWJnb1VZQ0xFRUFBcXlURHJtcDFX?=
 =?utf-8?B?N1JmZFZudEJTczJnUXZrMWlHdjlYb1pPS21MOGlJRHlEQVVZdU1FRWkyT0tt?=
 =?utf-8?B?ZTZvZGhiQzJGWmdUd3F3QmZtUHUrckUxSW4zUDhLVDJOdkJHenZwZjhhSDZD?=
 =?utf-8?B?QnFMb2dHZHQvQ3hoWjVjQmZzbDJUK2xXUzNwYUFKN0svYVpnZ0h5TzhTWGRG?=
 =?utf-8?B?TzZqR29XWUxjYmRNbWIrcHRva05GK1pUejEvMXRmcVYrS0wzNngwRktaUHhk?=
 =?utf-8?B?TEgvOWVJOUNhL2s4TEVNMWtTUFFIUm14STBsb0Yrb21vZklyMUsyTitLbi80?=
 =?utf-8?B?bnZHTWZMS0JlRzJHVEVVVElydm5ITXlHZzFJbk1YcWY0TXlpUWhiOGZqNElT?=
 =?utf-8?B?alR6VUdJd0gvdkEycnBpVXIxUkF0ZzB2TjhvWXpCazU2bGFSekdNNmZOVVdB?=
 =?utf-8?B?TUwvZlZBaTMvUng2R0E4ZkFhYm4rNGxXWm14UlN3STVhNFVkbHc5QXFRWEE2?=
 =?utf-8?B?bWdnK1JQWGVFdCtXZUtreG9LNm0wRmVjRWEwNG9DRk1EdTVtd0FMYXJ4cndR?=
 =?utf-8?B?d1FBb0U0S2dBVkpzNFNUb1p1YVY2OVIwN3pIcnBNRGhoU2tJSzB6T2ZHVHNa?=
 =?utf-8?B?VmtyL3lrcWpWSG9XTjdCd2kyWTJ5Q1p5TzY4LzVIQkhaNWhlL1NXWlJSaVNj?=
 =?utf-8?B?TjUxeTExKzE3MUdKa2k0b2hRMEdZaEo3SENvMUtqR3p5RWZxWVJpU0crMFJh?=
 =?utf-8?B?OTh5Y0RJVE1zdElDNUZIT0w4aVZCZ0dacFl6NHhBWmVaVkZTVUVSOXpPNk5B?=
 =?utf-8?B?RkQ4SkpJSkN4U1REak0zK0JGOG0vbzZxNUd5eU9uQWllZXNaMEE3ekYwenph?=
 =?utf-8?B?ZW4zN015QktHN1FZL2tWcUNlb000bzdUYko3aHloTmkzUkFsVHdGTVB0dEUz?=
 =?utf-8?B?YUdTSjRLUElPLzhLNWNkRC9mTVNFejlIWlZCaGxvRHBFcWQ0NEIwbnMwOWo3?=
 =?utf-8?B?V3ROODdFcFd6aVhJbzRDWWhuZjFnOTZuQ3MvbGpuUUZhVmVvYk1MbkdBNzgx?=
 =?utf-8?B?NXpnd1BuY1E4NnJ2cFhwTndSS1F6Q3F2S29CRWJWMk5jY2x1aDlxOGZkRVJT?=
 =?utf-8?B?WHhYZlJkR0xQMUJuamRITXJXazFvNWM1cEVkaXFydko1clVUelZ1Vyt4WWdw?=
 =?utf-8?B?a2x5TGd2eG9NcWc0cFNzYVVFL2hjalZPYmxwbUhmTHJLRVdlTDFIZENaUzhU?=
 =?utf-8?B?OUllRG1OMmwxTWtxQWZiWGM3eHVabW55Nk55c1Q3Y1NaclRkYkMvSEo4ZUpa?=
 =?utf-8?B?aFJQZGh2WFJadTAyK0lZSVJsZEN5YzRrdzBYT1NJc1NvQURDTHcxanY3dnhK?=
 =?utf-8?B?WDg4cGcvRjExemo0dnRUemwvTUk2YkpudWRlS0gvSk9CdFJWcUlVZXByVVJJ?=
 =?utf-8?Q?bns7VizkTAM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmF2QVIrYVFVTnZjK1ErZTEwcWx1YUxndVlOVFJXMzZtRjg2WWZPcEIzK0xJ?=
 =?utf-8?B?RHBIbkVVbE85NFVSK05MQmo1QlFRWHhYQ2xHQm1IS1Y0YXBLVlBRekdWSHgv?=
 =?utf-8?B?a3BpZFcxSFRBNDB4SFA5aGVlM1N2eTFhUHdIaEdCdkVHY1BhUWIwVlk0ck45?=
 =?utf-8?B?eTI4Y3RxVVVmRFJqTHY0RUN2bENnMVpZakkvbVhHSEdpN0Q0b1dvWFJPdkJT?=
 =?utf-8?B?L1ZJTnVNelRVSjVSZWc3aUV2Y0wzbm5uNHRXeFpGMmUxa3lkWGNjRnFVeFRi?=
 =?utf-8?B?RDlJTTEzQ2lNYWc5OExFdzhFNzgxYTVUYWJORU9MOTJWNjI5RVRxTWRuV3d1?=
 =?utf-8?B?eHZtTnZWRm5ERktUc1IxcGZmaDFmSldNMjJoNnJwaXFjMjdpTjFaZldOUllj?=
 =?utf-8?B?akFyeDBpQ2JnSzk3Z3VXdEEvTVpHTmhPeGRXMk9sZ1NTZEZidk02RkRBaWJu?=
 =?utf-8?B?WU9BakJVeDkvVnhWbDBJSDJ4dmQ3djZqTVB5ZjR2V0NyZjdFZDhBa29ldE9D?=
 =?utf-8?B?QTRPR0wwRHlWQXBSSVdVR1NhYVg5NDdjUGhadnVXNVlWbXlIaHBKc0JGUHhq?=
 =?utf-8?B?ZFNURStNSWp2a3ZqTE05NHBUejVzaFM0dXpQMi9tRE5WU0NPdUFER21ESkQx?=
 =?utf-8?B?QThiSnVON1VnL2lILzNUYTMyRkdEZXJha0kvMG91MkFjUUtYREFYVUN6SFcv?=
 =?utf-8?B?d25WM0VLaFhHVHprbzQrYVZKWXVRaEM3ZXBhZ0xySEMrTW5JVW15UUh3Um02?=
 =?utf-8?B?NHV3Y1lPWDJLY0tHeDV6MCs2enp3Sk1CcFRuQUFrRkFLbEJ2aTE5M2lXWjVn?=
 =?utf-8?B?RlE5K1ZidEFQTmdhVmFPV09IVGV6b3A4VEM1ZTVxTHRNdjlVeTk1bHlrb1Zx?=
 =?utf-8?B?d096Z3VhS1lwZy9tWllBTFVRMVVzemN1LzFsSXNqYi9kdkxWdDUwREh0d2VU?=
 =?utf-8?B?bWdGcitHZGhLZWd3TE80a1BEMFV6SVN6endXUlBxb29sM3hCeHlFTWRjUWZ5?=
 =?utf-8?B?akp4SHA4MlROOGJaRE1NcVg0L2lwL1YzTURVcnlwcldoc0YvTm52Y1dXRm5j?=
 =?utf-8?B?MDQ2MThuMGlkUHMzQ3hqd0plZWxzWFMxbW9tT3NjSDRiQWgwMEVqMzJUU2Q2?=
 =?utf-8?B?TGNVTXdRbjNQT0UwbWtwYWZ6cUEzays1VEh0bHVlYXVOeEF1d2pYRWhvQWZU?=
 =?utf-8?B?dTRzWUFuZVFYUWpyZ1ptUU1zZDV5K2RPYWhubzRjUEg1aVJhN09YenNGdWJk?=
 =?utf-8?B?NVNwU0NFLzVFYXVsWVhadjg3Si8yeXJ4UkRRK1VYTDFMWUt5Q25kTDZ2bnUx?=
 =?utf-8?B?SVhCM3ZxRjcraFo1VUpNbE1LOUVYZmtxdldQUVJubncrZTVneUROZCsyeDN3?=
 =?utf-8?B?cWl5M3RoTlBUaXpzN1V5U0dSTDZkeDREUzdJckNMZHE1VXJLaThLc1hERVda?=
 =?utf-8?B?UGZsZnNzeXcreU0zcHNoRit2OVFzWkp6eUJFZWU5MTdxQU1ZNjBKWnR1enR1?=
 =?utf-8?B?bFhDcGYxZVFDQmhYK1RnTld3eE9wTHpLUHVieEFJVHRFeWFsMjMvV3o5Z0dn?=
 =?utf-8?B?cXhkbHRuQWJ6OVlaTUs4dE1FQWhjZjhSeExmSDBmbzVtb00wOGlJLzJNQ285?=
 =?utf-8?B?cnlRVzFMb3ZSazVTaUFtMjRoSTkvY1UzVm1PbGtCTmtiRkZmMVJJc0hlS2RE?=
 =?utf-8?B?N2NoT21OeHBnS3V5b3pxcm1pWTQ0OVdJR3FVRU11M1ZaQW9XVEEwbmRhNUN2?=
 =?utf-8?B?YXdjallWcDU3WHZ3L2w2clZMeXUzRlFkeFVGaGRySkgxWjIvdEdZUFVnUEcx?=
 =?utf-8?B?OUp0R2pYcmIvOVJWSzBhVWxzTEp6L3pKUGlad1UwRGZ1OThGRlN5MVZkREF3?=
 =?utf-8?B?RHdNNFFhZlhCcDBTMEJnRmJpMStEVzludjdYTzVSc1lKY0JsakJlbkMyekxt?=
 =?utf-8?B?S3pKbjM5T1RsZ1QwK2FtVVNWQ0YvRUhsbEwxVXAzQWdINU9iZXlUN2VwMTRu?=
 =?utf-8?B?aUdHSjNGUHV6dDh2czZNaFp0cko1N2xJMUNnQ0MyUlVobXNUM3d2UTZ6ZEhj?=
 =?utf-8?B?L012eUNrMHRuaUJqSW82UHFsZUV1N3hDdFZMTGZJRHN1TG9xQ3lTNzNvUE1t?=
 =?utf-8?Q?7lcCqaRu5u9eY+dGet5/x1WIu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c671b12-124b-46bc-91c1-08dd8ccf85f8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 18:55:09.1890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uwc3Uo+CvS8k6EkXiZLRsQPM9t+LuIurQP09FgwQOhxSVdC3lRR7/Q5v9YSSLtpFrR9J8fyFJNDMfr3tQSonag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6828

On 5/5/25 09:12, Alexey Kardashevskiy wrote:
> Started as a part of the fix for
> ae596615d93d ("virt: sev-guest: Reduce the scope of SNP command mutex")
> 
> these are the remainder of followup fixes/improvements as
> the SNP Guest Request code evolved enough to make it a bit hard to
> follow.
> 
> 
> This is based on sha1
> 6c201ee95a30 Ingo Molnar "Merge branch into tip/master: 'x86/sgx'".
> 
> Please comment. Thanks.
> 
> 
> 
> Alexey Kardashevskiy (4):
>   virt: sev-guest: Contain snp_guest_request_ioctl in sev-guest
>   x86/sev: Allocate request in TSC_INFO_REQ on stack
>   x86/sev: Document requirement for linear mapping of Guest Request
>     buffers
>   x86/sev: Drop unnecessary parameter in snp_issue_guest_request
> 
>  arch/x86/include/asm/sev.h              | 10 ++-
>  arch/x86/coco/sev/core.c                | 73 +++++++++-----------
>  drivers/virt/coco/sev-guest/sev-guest.c |  9 ++-
>  3 files changed, 44 insertions(+), 48 deletions(-)

For the series:

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

> 
