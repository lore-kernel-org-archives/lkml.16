Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F861A4F3C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750830651; cv=fail; b=HH8IpbU/2QsIVD5PAbdea2wGi0tRN+s2ncrtToCiGOXSBitVQLXSUcf2hGmxldPwq3AR691jQKQsZnV6Xa8fZ5lZs5jEX1Jfb6q91fqtiIRB5lQPwv2GADeoDnkzK1rByeZboMhH99ndGlPxvy6MlFuLYINce5kuqyQJxhEYiXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750830651; c=relaxed/simple;
	bh=YtSl9+5HptToG59uUHIKTUki2maxQbfW2rfrHIL1ZMQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eK7oHqnqtGddJzv59kpKSSu7dWZehRDWpBKzwu67xD1oq2JEAiskovZoWBZxRw06cH66Wi4x34ofBc0hwCMg28KzaHi2OEjHQORCBTXUq0v8GgvtMIv6nmxhBT29XMc/ZXMc3Fy5Xmt3KQg9hurj9PR+Ux6eKhZpm2IG1+FumOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u5s7P9wM; arc=fail smtp.client-ip=40.107.220.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u5s7P9wM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3jxdrepwFVvNqleaaldPXhkd0jMQeJ9cRTanf5yEYGxZDdkIR9VkrOPyouNYx50jM1Cd8BrIASJPaf2GiYDpU2XDffFB/YbtqBp+f1f4pVsmW693PcF5rXIZT6aBDFk+nuMwVipjlfdhEQc2VynKOoolue1yMz5dGHR9b+/xWyy4fb35zKdJgukCZkGLtZMq3VvRr71sOXK9z6/lPF3ZkYJBncdIYcw/s8U92G8/ckvvGG9tC1di2hCsHg6mEmMqRk3yPXZfQ4WXSXy8f+rJAxTl8vE8LI+B2qRadsVQ2UbRKiEEguLEYiGBmSWMs0B5cMzKVxB+YfpGbEPIfMM5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQ+AxIuVuFR4J2FW/Wev1MtpDnk5cL6OLN0gfho7d+A=;
 b=zEv5YIO9e5qwZJ7LcWnENxJqTqJhLp2vN9I1bdl1JtVaQlevQosJ9+8du1oJZ2Haw2AwcG2LIu/f4WPxJJLlMBuS19bl1yN+vpqd6tcVXV0OjVC7ivKzb6TYjn2Ljx4uYYi9BKe1CzoCIYKEQptX1xyX6qU/nnruMVzjUF04tqAo6DqhS3ePj9UGMg1qxwohOLtaWsMzOJj9J4L8HI/1/b/ctaIOrAHoyQFpX0ZZkJutorgt3ufIOxt2zfMGrw/0v5zy/hCyRhPh8HiPh5eycrNbRyP8uM0AAo7GO2kKEXIaDILB/ezGVBd1BQNnx9EP/tietQS3w/+SDFLy4akyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ+AxIuVuFR4J2FW/Wev1MtpDnk5cL6OLN0gfho7d+A=;
 b=u5s7P9wM4bfbk82FO7wowjY4jYEwrD0W/MmNw5aX0s0ODM1PeTzL6Va8Sv8BNV2WjN7xTDCzGfL3RweGN/Iy56sV3NpOAAz3xISRI9B5FEntFx8ipoGrsuGHb7VEfdfICkpQJ8DziTpXl//75a0JXeFwJj2lD919IXCu2MIkOgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DM4PR12MB6592.namprd12.prod.outlook.com (2603:10b6:8:8a::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Wed, 25 Jun 2025 05:50:46 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Wed, 25 Jun 2025
 05:50:46 +0000
Message-ID: <4e2afb04-7317-4689-95c0-dfa82311f256@amd.com>
Date: Wed, 25 Jun 2025 11:20:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] x86/smpboot: tidy sched-topology and drop useless
 SMT level
To: Li Chen <me@linux.beauty>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Sohil Mehta <sohil.mehta@intel.com>,
 Brian Gerst <brgerst@gmail.com>,
 Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20250625034552.42365-1-me@linux.beauty>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250625034552.42365-1-me@linux.beauty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::20) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DM4PR12MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: b991b94f-0a20-46f7-e0fb-08ddb3ac3af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajNVVGtBN1JDd0JWVU50RzFuQXR4QnFFUHNCYXcxZ1RObEd6NzhOdGtFYWxN?=
 =?utf-8?B?SlByRmkyTVZObmxoZy9LS3pVek9wT3VITXhXQThxZGk2dDFOS3RhU3h1V1Bs?=
 =?utf-8?B?N3ErV2JZSC9hTUJCYTdVdEI0cmw1eWJLNE9rc3doenQwTFdPZGFELzQ0b2Fh?=
 =?utf-8?B?U3hUUnBhVktWQittdE5sMnBQU1dQbmFkdUYvNTlYUG1zUkdSUGJjVnMvSzZm?=
 =?utf-8?B?MHpzbnArME5qNkdLZ2x5SDIzU0xMMHpBNiszZXZoREQyMWdPTFdSeEwxb09u?=
 =?utf-8?B?QStva3pNL0g1SFhyNlY3TlJhZkl5VkdKaVNEeU00L0ZFWW1salRUa0Rvbi91?=
 =?utf-8?B?QW1oTVVHR3Z1ZlJRbkY3OXJzbk1zY0U4elJSSlZHSUlFMWh6QzFzMUhLVGZY?=
 =?utf-8?B?aEx1UXc4KzdxelhJdEZNQ1lDdEVzRStybVpBKy9uTGpaTkpMSHU5M1lTWVE3?=
 =?utf-8?B?SjRHUGxMVW5NK2lKY0ttSUlHQVVvaG1GUnBCa3FHY0NibkV6am9zTExJY1lx?=
 =?utf-8?B?QUt1ck9qS3Y1THptTVdENlBJZ3JzaXhZSHhwcGtrN0lycC9jaU1PaGUrRU8w?=
 =?utf-8?B?SlFFTEJEaWd6MTZaUEdnR0l3d0RRV3o5bllLQTFjNmhPRXorNTR3TFVIOGNm?=
 =?utf-8?B?QU5kRUJ6SDRaQUYxMldmT3UvQ0RtOURPenBMa2RJK3pvLzdlYk5MYXZvR2tP?=
 =?utf-8?B?My83eUdmbzY2YlZ6elppbnVVOWovOTR4SDFuWUVQeFNuVEFCV1VsMit6M1kx?=
 =?utf-8?B?L3hmSHlGYzVBYnVXV29PekVRQVdGUEZpYkt3eEpnRkhKNjVId3ZJMzR1WW5o?=
 =?utf-8?B?Q09ydytZOFZUYUYxN3pwa09NSkg0UVVNYWhySi9Bekg0TytJaytwOWFjRFRk?=
 =?utf-8?B?ZDE4cW05Nzd2dEU4NERVS3ArM0tHb0xSZ0xkbU1SZ0xnSVlPazRsM1ZEeFNw?=
 =?utf-8?B?NkZjUmRkVGx5d3J5Y1B5YjYrU1dwNTYvTXZmTURacHZENVhGeit3c3RSTWxr?=
 =?utf-8?B?K283RlJLSTg1bzhGd0llZXdMb1ViUUxGZGZJZytkV1FKdnBBYi9zKzloeEVp?=
 =?utf-8?B?bXFvbzlqa25odk9vYzZ1QnBVczBKQTQrNWxWM21Yc2RHNER4REZ2QkNPbzZD?=
 =?utf-8?B?U084VmQwT1pBaFE5ODlLYTZWcFZqRkRaa0cydVpqcXhkUm0rMXVUY3AzV2s5?=
 =?utf-8?B?S0VHaFN4NHFkL2ZTQkgzc2VaL0FJMmR5SmpnRWF4L2RtM3hGZnJWSUhqWmZv?=
 =?utf-8?B?bjc5Mi9CMTBOSnpoaFNDTy9aYXBEZmNvd0ovRVlyN2ZqODlXSVF4cjZad2Ji?=
 =?utf-8?B?ZnlWMkR1SHMxaWVzUjgreDVFSDNoRGVJNUlUaXJDVElHS3BDb1Uzd0ZzdkJB?=
 =?utf-8?B?WHA3akY5dmpqOFdwbjJjTm9ISVkvL0VuQjFSVFdQbUJEWGJjanBSb0JqbldY?=
 =?utf-8?B?ZlVSRFhSYW43RGM0N1A5VnBlNU5Jc2tQcUQ0UkZZK3VqWmtLbkdIaUR6a2lM?=
 =?utf-8?B?OE5XaUVieDdrTnRHR2lwblYzSjNkTFYwYnZuaGh4MHBEN3gyUlRGMkNXTUZh?=
 =?utf-8?B?Qzdud0taSElxMzVLRnJ1ajB2alk5UitvVlNLRG52aStmaXFKWjBoMHhWS2RL?=
 =?utf-8?B?UkNMVGhZMEl0RjRaaTlmNThCeWZOMVNMaWsrVzN3UkFHK2lJZmpGbm9RM3Rj?=
 =?utf-8?B?NGRpbURmd25EbUZUR0M0WFlZOFFQODNLTVNVQ2hqL2M4c1lXa2UrVW9SbFVS?=
 =?utf-8?B?K0hJNys4cG43L3BGQkwxL2NvN3VHeXM5TTB2dC9wZ3VhMG1YSVJ0NWcvblZ0?=
 =?utf-8?B?QWozNWx1VGxzdGZSMDRzRVFvZVEzTE02TUQ2ZTVrSDVyUzRRbXhBQWp2ZTRY?=
 =?utf-8?B?eEFEMGNxN2pUYi90cUlDQ0QxQlN3akJYeU92RWh3aE1mUW9iblJndk9Menhi?=
 =?utf-8?B?a3ZpTzJ6M0c1SHRZV3BWR0tiU2lqZVZBYk1RcnB4OVkvY0RxK20xRXlMQ00z?=
 =?utf-8?B?bEttOUtQREZ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eStFWlVYTUpUUjRuSHBOdDMvWFB6MG5GNXByUnVDcmhUT0RaY3hjTU9ZYjM5?=
 =?utf-8?B?dmdybzhNam5IWDBhTWNNK2tjV1poN2RvdFhFZFVnUjYzKzRDSU1JUEZIK3JQ?=
 =?utf-8?B?c2VHNCswZXdueW4xdGUrSGNPcTN6MS96bEVQUWVDWG5QbXI3Y1dMWHdPQmhm?=
 =?utf-8?B?Uk9yRkVoNGFXT2pXNXQyZGJRR2JVUjVLd204ZTlGVG51dkNxUlFxcFM3N1JG?=
 =?utf-8?B?ZXdtdzFtdGdUaVdkUUtIbFVvYnFoeVJDQm1TYTd5MHNQVWRMWE5STy9zZWw0?=
 =?utf-8?B?MTQvTTBvejMrT25iL0FjT05vRGJnTW8yNmdaZ2F2S01sSmZJeS83VVdDT2xj?=
 =?utf-8?B?d1JFVEV0N1dINnFPVTZaYnRZZUtsMmJyTWwzNFNKc25XQVQ0YnVmcWpHYklW?=
 =?utf-8?B?RldOL29wQTdydEt5bUhLUzZjc1YzRGhnNFlXVHNWVnNzRHV1Wm5RTFlUTlky?=
 =?utf-8?B?VnZLaHpzL3hCVDFrUVpEaXhwZEZkTHJueFhraEVWVVBURTJIZGduQVBFMzBU?=
 =?utf-8?B?cVZsd2h5bU0yL3FTYk1xS1Q0c3ZvcDBGVnVyK2psbFp6RXVJL2JvVXJldnNu?=
 =?utf-8?B?M0oycnJUVGtBZHB5WFRQMHpROENqZGFzL21kQmZnTzMwTjBmUlE4WnVJREl3?=
 =?utf-8?B?N3NtVFYvR3o4OEs3RE5aWFRwM0p4b1Y3Qm4wYW1IVDFkLytyU2ZKaEFUME52?=
 =?utf-8?B?UkQwN3hrQ0ZhUjRCNkJ6aHRzK1RrZStBUzJoZDV0anAyRUZ5QmplNi82SG9o?=
 =?utf-8?B?ck9uK0NoNE1ZYTZ2aDJmNEwrM3graHB6U1RnNi94Q1ZRSmltTmJSVU1oUlJD?=
 =?utf-8?B?NFl1RVVlcGlMNjJOSnczRHFFd2hPNm9RSG5BK3Z6R0d4RWpDTEpWUkYxdmtY?=
 =?utf-8?B?R1BlQWI0cEloV0s5NHFoTmc5eTkrVm5wWnhEZjV5NEIxcmZlRE5tQWpKdmlB?=
 =?utf-8?B?b3ZmRlcxU1JhQ0ZOcjk5R3c3blFORUhJamhmTHpVVWNwNmI5Q05vTElxbFl5?=
 =?utf-8?B?aThUWVlqUTdFQ1pTWjZnQjVwOHVIcjFwamFuWnRhY1JlTi9FSEJOTXYwS3pW?=
 =?utf-8?B?YlIva0VBTlZLeWs1emNqRlRYbFBiY01KWW0wekFUaGk5OFE0NjloSnN2QUd2?=
 =?utf-8?B?UjM2d2p3MklEOU1JWEY5TGN2dlJpVXgra2ZWWk40RFBrTmh6UFhaVXhraGpj?=
 =?utf-8?B?TDE5bVNMUWRNa0p0aXpIV1NVUm5FcjcyVWJZMVd3TDhSc21KTm1HTXI2djRx?=
 =?utf-8?B?endKbnoxWnJBUStleUVueVZST2ZzSi80SEF6SEVmRjkxa3Y5bSthdGhSRWtP?=
 =?utf-8?B?ZHowMHJ1SVRtNTUydHpHMzZyczdWSzRnTTBXZlRKS0VmY0tvMU9EVHdQeVgz?=
 =?utf-8?B?MzlGU0lnMjFzbFhKMjR4NWFDUzY2bWJ3WWQzTjBBWVlvYWp4NmRkckt2Zmhj?=
 =?utf-8?B?emx1aEJnODM1S0tCOGJ2UkhvV3NsMnNtV1ZiMk9NVHk5Mi9ML3U5c29LcjlD?=
 =?utf-8?B?SWhnVjBDOTNxTnJLSUR4THpMZ0V1TlVaMy9MNis3Z2RqdWMzbEdhMXFsY2xU?=
 =?utf-8?B?V2QvaWhYQUcxazU3akEwNG1uUGNNVFF6dkMxa3dOU3hCaTB0WGpEdEd6bVhG?=
 =?utf-8?B?SlJhajhzdXFaMkJ6dzY3ckFBMDNaVGZMRlAzbW55MGlqamJ3cGV0ZmRMQjlV?=
 =?utf-8?B?N2JFbkE0Tk1ZVGs0R3c3TldhcFV6KzZOTmpYTTVIaXdDYnMva0xIb0Jsd1Ra?=
 =?utf-8?B?LzV3cGVsRHVBOUswbTYyc3NPNnV0RTJqN0lTZ25PcFVpc0NtVkJrTWVHUSsr?=
 =?utf-8?B?NzF1T1haNnZ6cVF6UnFSY25hU0laalNCZnN1Y2RZNC95QUVPUGVMUFJWODR2?=
 =?utf-8?B?amw3U3d4aTA0RmFpVHJNMTliQktTZG5Mb2pQWm0weEdlUk1MRFh2T3VFWVJI?=
 =?utf-8?B?anMxeXhxQWRTUENTQkVqYkRkazVZcDJNcmwyMjJ6Q2Q2emp0azcwVmoxR0sx?=
 =?utf-8?B?TWI4ejl0RENQdzM0dk9UMDRZTUlvSXlubElzRkNCMXgwQjUvMXBXWUZvOTBx?=
 =?utf-8?B?NEk4YUFSQ1lGcDN3dHpMNUV1Sk9kbmFBc0pTaTZQMExTYVdNL203MktsNXVu?=
 =?utf-8?Q?sTJgwB/LmDmQHCanUEkQtUULy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b991b94f-0a20-46f7-e0fb-08ddb3ac3af8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 05:50:46.5471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8BdIrODR/6s/HcHQ3r7ib9/w2Mv0cWeK7GUEF21bedwWUUbH0KlFl12EuDrHv3GyWuCOvdhJv044dHCVe6fvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6592

Hello Li,

On 6/25/2025 9:15 AM, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> This two–patch series cleans up sched-domain topology handling and
> eliminates hundreds of pointless attach/destroy cycles for large
> machines when SMT is not available.
> 
> Patch 1 (from Thomas, unchanged) gets rid of the #ifdef maze in
> build_sched_topology() by statically initialising the topology array.
> 
> Patch 2 (mine) is a follow-up that simply memmoves the array when
> cpu_smt_num_threads <= 1, so the SMT level never gets created and
> immediately torn down again.
> 
> Tested on Qemu.

I think there is a simpler approach to Patch 2 but other than that
I gave this series a spin during my review with different topology
on QEMU and didn't find any surprises. I tested with and without
the "threads" parameter to "-smp" and also with "nosmt" kernel
cmdline and everything seemed to be in order. Feel free to add:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

> 
> changelog:
> v2: fix wording issue as suggested by Thomas [1]
> v3: remove pointless memset and adjust PKG index accordingly, as
>      suggested by Thomas [2], and refine some other wording issues.
> 
> [1]: https://lore.kernel.org/all/87msa2r018.ffs@tglx/
> [2]: https://lore.kernel.org/all/875xglntx1.ffs@tglx/
> 
> Li Chen (1):
>    x86/smpboot: avoid SMT domain attach/destroy if SMT is not enabled
> 
> Thomas Gleixner (1):
>    x86/smpboot: Decrapify build_sched_topology()
> 
>   arch/x86/kernel/smpboot.c | 59 +++++++++++++++++++++------------------
>   1 file changed, 32 insertions(+), 27 deletions(-)
> 

-- 
Thanks and Regards,
Prateek

