Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DE725E44E;
	Mon, 10 Feb 2025 18:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213703; cv=fail; b=rKMNY4foTo54qKNdpBxeme9IWiSF601q1D7jL9E4ANFRtGNwIdPvWb50s7+awyfi0mNN7flSCZ74BeIZjZXvO57E6Smbgu8yc9CGmS0DjbFCissJEfZDF0Yq2mkNB/4rd4iB8hzNFFHR6pyOgrLxUNRlzrT/bE4LYBpwwn4aMIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213703; c=relaxed/simple;
	bh=ek6YE96e47zHMGmkgRo4qscojT7aUDZnZCZH1GshHxs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e/1J4+Mduod6v0JsecBCurrCv7kqZcAKOvrR2PLv5gYHQYyC6z2BZP/N258W0IjH/NgrMGm4hA8p2kG3NJq/+/6JO+jR9H/K63g79nXoKQPgPkAwvIPECi4MDm0ntvZO5jbpOUSFIowpGV3JPJ+WV6NawJaL0Vjs+i0o0R9IGb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iQymd9Lw; arc=fail smtp.client-ip=40.107.237.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iQymd9Lw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyCixBBiK9aL+BAQpI/BjlYpk70Fq3sVMhIQ/LekeoGKXg3ZoxObh8QzokFTRqcpOM2SipukUOur9WDW7AEoQYRD8+iWbhnQuspo7Cn1r0D/4xG8ItlUSSjb9mLKmQxhNWSf3IOsSFfOkVPQD70hbesOHq/5u+DdPz5zB1WAY+CPZrYGI4Gl+bDgMbC672qDErpj8YNvdtdKpjiPP5g7rytWsdBmK2UjYTEQHIgalhLwj8unAQh4CM2oswi/4EVUoHWivQdfNGSKdAexHzJ514n8rxmjXiRZTHL4m8jZJ6SPy4nzv+lyCA5gkaN4ytnZz0xHMJiGUA8Up4RFv8i3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=281urXyOent4uIWQ4zPuHfLGfkB82E9VQ6oR1EhuVuA=;
 b=MSx0Uf4eb5BAPqsnDF14DbXhJYqJy4rT71MGsQhwwvkDjWZi13C3t8iXcyVr65Wk5kdC0O0o97nuVmF/ZIAxQ0HX91ZRZSjg4NKCIvjVZEyX87pROlyFINFy/vazGRPJ2d+wzXtSWchan3YDqUIIrrFxPgGh59Ts6lrjbJDR+2VTQigiYMrMQKy4WvntLAwmlioM5ouRUMYq1XQgYkBH8obxzIzG6PN7bcpSrFlWgsamFOUjgxw5wUMMH97Q7kNllqygKmmD8gKrSyv2Cfl9pUo9fsGfDhV50Hm99pz7/kSY6Xlj0C5ga7pSnBHfr/XSfu7H54ETcVU/VVHw+WQieQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=281urXyOent4uIWQ4zPuHfLGfkB82E9VQ6oR1EhuVuA=;
 b=iQymd9Lw2lVxycBiSJvGqYKxVy54bF7aS0gy4T1RnGfA58Itj3iBYzhePWRhTuwARcwsk/e+FGn8qiAP+OqXEpWyCcFZWTZUhoULFtV/Zq3Slwb0IMkD3csOzZcDtTL1EUu1eiRFRSmbFoAvr0d5Ax6tX0/4J5oR4O9a4+iCFG0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SJ2PR12MB7866.namprd12.prod.outlook.com (2603:10b6:a03:4cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Mon, 10 Feb
 2025 18:54:57 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 18:54:57 +0000
Message-ID: <31c04287-c81f-47e9-86a1-50099cc2bbf7@amd.com>
Date: Mon, 10 Feb 2025 12:54:53 -0600
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v11 19/23] x86/resctrl: Introduce the interface to switch
 between monitor modes
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, tony.luck@intel.com, peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <cee46a0ddace8ea05ca5371a93dfc53c71016c77.1737577229.git.babu.moger@amd.com>
 <b60b4f72-6245-46db-a126-428fb13b6310@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <b60b4f72-6245-46db-a126-428fb13b6310@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0071.namprd16.prod.outlook.com
 (2603:10b6:805:ca::48) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SJ2PR12MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a1e6a6-6fe4-45a4-39c5-08dd4a0469e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGhkRmtlekM2eGtSbnJqdlNHL0FvcnhXMUxndnNsa256c2RhZ3FoQlRkdFJV?=
 =?utf-8?B?ZFplSkhvTWpJUWpTN1RRUVFxbWp1N2k2OTNNcVFnS25pYW56UFdiU3hySllL?=
 =?utf-8?B?Q3JkeEdkNlY1cS9NbEZHOWNCeEF6NmE4TW5kdDVDSWphVXpIczdJd21WY3Bq?=
 =?utf-8?B?WFQ0NFl2R2JuNWhKNDExMVNCNG5WOHF0MnFZYUpNN00yMVQ2dXBPUFdVNUFs?=
 =?utf-8?B?ZGdFNlNrS2hGdm1UVWZWckhJL2Fwa3cxZWVBaGRxdmphOGV4ekxaUjVoQThh?=
 =?utf-8?B?di9WUEQ1K2ZaU00yL1lFWmtKS3RUcjk3K2JoZTl0dUNHcUY3SytNSFYyaHNL?=
 =?utf-8?B?M0RXbFI1RUZQNExzc004Qm1vQ1I1Z2hWOGZzb1ZjazE4dWk2bkhZL2hzNEo1?=
 =?utf-8?B?NmZQNXY1KzNvQ0NyN0ViYTlnNVRIWEg5ckRtSWsvSDVBMnF0RnN3YWpxQjdO?=
 =?utf-8?B?TS90NHduZ0QybTg4dCtUK3FWa3BXdElZWDZ4b0lhQU83ZklmNWY2clIycTJt?=
 =?utf-8?B?MGNrZmlJRGxmQ2NmeUxxOTduaXlka2M3UWJVZmsraUVQMEF2UGhnNXl4RDk5?=
 =?utf-8?B?eTgreDVMaE82TEZzSC9kWEp1dWlKRzNQakt3Y3Y2TUQ3aEpKOUhBaWYyTFFw?=
 =?utf-8?B?cGorUGRqSnpZZmVDYXNPMHBveHFvWTFNQXNEN1BOYkh6WjJzaUpJcXJmZm5Q?=
 =?utf-8?B?SWZqUklDMjR3UlFNREV1QUZ5VG5lNEdPWVBsYndpVEwwQ2RMRGdLNWhkOGRH?=
 =?utf-8?B?YTRINUFyd25RZlZkOFV5Vjc3VEZxc0U5elRiY09HSlB2cDBxWFBlZXJnazJV?=
 =?utf-8?B?N1BrWUNrelJTY3BCS2J2LzErQ1p1b2g3ck1HcC9kQzVmOWM1cmRDRFZMN0JS?=
 =?utf-8?B?Nll1ZDBJUWxkbHVreVo5NUZqOGw4dWpVUGFkajRnQWJzRkxGQ2NVV3dDUzJ6?=
 =?utf-8?B?Y25QQkFJRGNoVVdXNmQ0SGpGOUhnMjREbVBGeU54bzEzWnpQd2hqdi92SG0v?=
 =?utf-8?B?RXYvanUyQ0sxcnZiczBNTit3Vm1JNkc3aGtkdndrZndHQUZOWmUwZzRtOGRX?=
 =?utf-8?B?bnVOelBBTFhOOHp3MHFnTGZMV2pKL05KeTZYWnhRQ2xyc25pamVpOVR3S2Jx?=
 =?utf-8?B?RlVlbCtFWDlkYmcwaDFNSmk3VGY5K2lmOW1WRXBmWUUzbWUzNDFOQ1RFZGZQ?=
 =?utf-8?B?aFV2Lys3UVBVRTBFcWZTT2lCdXV1Z1J4ZnpKaCtHTmtTd3ZkL1lRNFRsUUlk?=
 =?utf-8?B?NGhpemk2T0pSVmJxSGp0OWUxOEZyZk5iMDVrL3grOEVmMUd1Q2t0c3VEbVYw?=
 =?utf-8?B?L3hZRFAwUE41Uk00eEFtMUFoZ2RNOHFFY3Jndm1Eb1NOMmRJb0ZDYWd1Z2xO?=
 =?utf-8?B?dmdUZ0gyNWdCbEF1dUxwTFpIQ2dHekRpeFlFWDNOU0tIWEY1UFFSSTFvNHcz?=
 =?utf-8?B?TFhDSHhxNjZmcWhXZ3FTNVpBTmFIaGgyNkZDczF3TlB2TkxsU1ZNbFNwVHhD?=
 =?utf-8?B?RkNlNk9JUWZBQ1BvdFgxVjQzNkN1SGtXelFuRkVkNHJaaVE4eUVmSUhTdk1X?=
 =?utf-8?B?M1N6N252ZUloUUdKWTh0Rkp0bE9oeU5UampaODcwUjJtV3pRM09EeFRrWS9U?=
 =?utf-8?B?NTRiL3JwelNmQmE2ZktjbGFqRmh4eVVkdlRWT1N5M0Yzem9kQ2JicWszSTBz?=
 =?utf-8?B?VHlrcmdhajUzOWI0dGFidkhJSmxhWDJRWUpMNjRXa0lxTU1jREZxWnphWENP?=
 =?utf-8?B?SDNCVE10VzFiNFZWa3BNRHJoUXAzdkM5bERJUEN6MnQ2S2YxTmlGUmg4OE5m?=
 =?utf-8?B?cFFMNmNQalhQc29JVGJSbFZyaGhNMDVCVjgyaERtUzlhQ2NOdDZnamE2Ukgx?=
 =?utf-8?Q?wpmIUwo+fgyR3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDhhemFrc2JzZEx0d1FzR1V5djFkMHh1WDFPcnJoYXFMcXhkTGhoV2hzeHlI?=
 =?utf-8?B?NlJzUmlDM1hQZ1FyU3NoNk42U1F1d3BIenNkNUxGVGozWjBFa0kwejlZNEEw?=
 =?utf-8?B?dUJpU3E2a1RkRjZLRnJWMHp3V0hMQ2hzZW9paVRoL1BFU2t3VjJZNUFudmt0?=
 =?utf-8?B?bWNjRXhmMGp3cnNiUzJtMlRBWWZOcThVZFdVZzlqV2k5Q2RzWTY0djQ4RGhN?=
 =?utf-8?B?d09zTHRGYkxVajBMc0c3QWp5QTBXc3lFVktRT0M3M2xubG1kZlJTL3lIcFBB?=
 =?utf-8?B?ckE3ZkFBZ2huOUFXL0VVNFJmSG9Wb2l0bWpKNE8xTVpsUnRyd3hBT3J6ZE1Q?=
 =?utf-8?B?QjVxY25NVFBvK1NJWW02K2hSVWpCbmVmdGNPUjRwRTV1L21VYU9uMlNnY0lq?=
 =?utf-8?B?QStYYVhON1pOOHdiMitEMVRPdjVGYXUyM01lbFU5ajk0cEhjUFlBTzlseHI3?=
 =?utf-8?B?WVZ0MUQxUHpreUhpbGpDQXRLZzNBckFkLzNMY3F2dEpFd1JhVUhLNU1BeHhr?=
 =?utf-8?B?dHFwUlBNWE5OQ05WdTFWS3V4a1VFbmk1ZW9rdmJXL3pOUGdvdnVFSTdJMHhG?=
 =?utf-8?B?Z0JlMjM0WlVnV1E3ZmRjMWY4anBlLzErOUZ5WUdsdVVHb2lyRHE2QlJvSndv?=
 =?utf-8?B?QitmRjIyK0d5b1pUUzJpUHdUYVEwcFdZREc2SzRkaVJnNWRXTDNZZWIzUllT?=
 =?utf-8?B?MHl0cHJ5eGpmbjJRdVV2WVZ1Wm9Yd3pnTHM5T0UyS0g5c2RndFJ2TzRqQkJL?=
 =?utf-8?B?MWtyUlpXY2RmQWJpZVowdldWR293ck9UWm5jZDdrbm9XbHhPcjQzbEttRDZV?=
 =?utf-8?B?ZGNad2FCTFc3OXVBL2ZFR0xSQS9acUJucjk3U2taM09ua0JkaGRQMkk3SDVT?=
 =?utf-8?B?QlVuL0NqZzdFdXlwUHBTeXN1K1VuTnliVXZXL0xXdlpRMExMem5xNnhUQXdW?=
 =?utf-8?B?T1l0amE4aGpGbklmRm9sZ0k4NTFpd0ZQVlB4WXFYVHNUeW54OGxNNXNXVmxm?=
 =?utf-8?B?MEZDRlJmOXRKNFY1VVdjZVJ4MzF2Ukd5dytub1NWRC96TlRtZm9HelpFdE1R?=
 =?utf-8?B?MTlUMWR6dG1mSzBmTCsvYlZvc1V5cExOenJ2VnJEL3doUnplL0xBa3V2OHZK?=
 =?utf-8?B?b1lrZ0NVcG4vL1Zwd3dqOHhnNmo3cDNnb0RVamp0MnhwZ0doMTJ4RytsSFZi?=
 =?utf-8?B?Z2NoUnZxQUlOUENFODBHMk43eUloSjZqd1pqQ016OCtPcFlBaHdGb1JjSlN5?=
 =?utf-8?B?aXhMaXBFOE9PZS9hUXM0RDZpaFFEYWdzalM1eWtuSzhHR1Fwd1NhM3VNTTUv?=
 =?utf-8?B?WVc4VHhsRmF1cm9WQnBubm9UZ0NHMFJOUmhwYzJGMHZsQVRmWkkrZFhlK2dK?=
 =?utf-8?B?UFIrK1oxQnVuOTNXNTVKZmdmZ1NzQ3JVMThBT256YThuTFBod0o1NVl1SnNH?=
 =?utf-8?B?bFF1dTUwWGlLZDg1c1dQNzJuMHhZTGZERzV5ZEdhQXpnVmthbEx5Z1JOUlRp?=
 =?utf-8?B?MmlFNVplcW9mZ3l3ODhlMjRBRFhoQy9SaVRmVklGOUFUQ3RidUhrbEMyS2JC?=
 =?utf-8?B?WkhpdnRCMjI0alB5TFBZZE5mOWVpYThFelVycUlaZjJ2SVFMcDFTM3JCNkhH?=
 =?utf-8?B?VlJ4WjRNaGRJc2h3ZTNPbkVsWHhqZENkYTRJS01zUUNySjEwdzhtNk4vbGsy?=
 =?utf-8?B?WWhPQm5wdC9wMGpaOGhRY2Fiajh3ZzdjTU1ISkJ5OEw0SGVkT1VyNGJUUnVl?=
 =?utf-8?B?anZkNUk1cmk2VFVMVndHdXNWVHJBZUVuMW9HWk1MWDJ5SWd0aTR0QWJTSU1w?=
 =?utf-8?B?NnlPbVZXWjZhdURZTDh4OVlGSTJRRFFVbXRJUkR3UnlyY2lEajlTVzZjQllL?=
 =?utf-8?B?OVlkbk0xWWFqaWYxcjN1M2V4eC9sUElEZ0Y2dlorZGZkSjlieHVVU2FBTnVy?=
 =?utf-8?B?VEVyTUlDa1FhWmk4cmpHUmVtcGZnckVYbEZZYXRIK29EY2gyMXhFMUJuVi9V?=
 =?utf-8?B?N0VQTVg3SXFSSnFnbjFjZGE5QkNIc3dxR1pOcWZCd3p6N1pOT1hwbHlQOGFw?=
 =?utf-8?B?OE16UzNhZVV3M0gzdFJhVFFlOVVYandyWkxONk4ycGhleER5b003WHNnaTQ5?=
 =?utf-8?Q?6Gdk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a1e6a6-6fe4-45a4-39c5-08dd4a0469e8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 18:54:57.5834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJo9eL09zxnmITF1IoWbyPpcIbwXJLV4PmiGgZ77NL9KB7EdmBSEBwfyrsL0UvmC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7866

Hi Reinette,

On 2/6/25 12:05, Reinette Chatre wrote:
> Hi Babu,
> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> Resctrl subsystem can support two monitoring modes, 'mbm_cntr_assign' or
>> 'default'. In mbm_cntr_assign, monitoring event can only accumulate data
>> while it is backed by a hardware counter. In 'default' mode, resctrl
>> assumes there is a hardware counter for each event within every CTRL_MON
>> and MON group.
>>
>> Introduce interface to switch between mbm_cntr_assign and default modes.
>>
>> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> [mbm_cntr_assign]
>> default
>>
>> To enable the "mbm_cntr_assign" mode:
>> $ echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>
>> To enable the default monitoring mode:
>> $ echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>
>> MBM event counters are automatically reset as part of changing the mode.
>> Clear both architectural and non-architectural event states to prevent
>> overflow conditions during the next event read.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> 
>> ---
>>  Documentation/arch/x86/resctrl.rst     | 25 ++++++++++++-
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 50 +++++++++++++++++++++++++-
>>  2 files changed, 73 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 072b15550ff7..5d18c4c8bc48 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -259,7 +259,10 @@ with the following files:
>>  
>>  "mbm_assign_mode":
>>  	Reports the list of monitoring modes supported. The enclosed brackets
>> -	indicate which mode is enabled.
>> +	indicate which mode is enabled. The MBM events (mbm_total_bytes and/or
>> +	mbm_local_bytes) associated with counters may reset when "mbm_assign_mode"
>> +	is changed.
>> +
>>  	::
>>  
>>  	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> @@ -275,6 +278,16 @@ with the following files:
>>  	available is described in the "num_mbm_cntrs" file. Changing the mode
>>  	may cause all counters on a resource to reset.
>>  
>> +	Moving to mbm_cntr_assign mode require users to assign the counters to
>> +	the events. Otherwise, the MBM event counters will return "Unassigned"
>> +	when read.
> 
> Again ... please be consistent in using single or double quotes for information
> returned from file.

ok. Will change it to 'Unassigned'.

> 
>> +
>> +	The mode is beneficial for AMD platforms that support more CTRL_MON
>> +	and MON groups than available hardware counters. By default, this
>> +	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
>> +	Monitoring Counters) capability, ensuring counters remain assigned even
>> +	when the corresponding RMID is not actively used by any processor.
>> +
>>  	"default":
>>  
>>  	In default mode, resctrl assumes there is a hardware counter for each
>> @@ -283,6 +296,16 @@ with the following files:
>>  	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
>>  	there is no counter associated with that event.
>>  
>> +	* To enable "mbm_cntr_assign" mode:
>> +	  ::
>> +
>> +	    # echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +
>> +	* To enable default monitoring mode:
>> +	  ::
>> +
>> +	    # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +
> 
> Please be consistent in the documentation.
> 
> To enable "mbm_cntr_assign" mode:
> To enable "default" mode:
> or
> To enable "mbm_cntr_assign" monitoring mode:
> To enable "default" monitoring mode:

This sounds (monitoring mode) better.

> or 
> ...?
> 
> 
> 
>>  "num_mbm_cntrs":
>>  	The number of monitoring counters available for assignment when the
>>  	system supports mbm_cntr_assign mode.
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index f61f0cd032ef..6922173c4f8f 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -928,6 +928,53 @@ static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
>>  	return ret;
>>  }
>>  
>> +static ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of,
>> +					     char *buf, size_t nbytes, loff_t off)
>> +{
>> +	struct rdt_resource *r = of->kn->parent->priv;
>> +	int ret = 0;
>> +	bool enable;
>> +
>> +	/* Valid input requires a trailing newline */
>> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
>> +		return -EINVAL;
>> +
>> +	buf[nbytes - 1] = '\0';
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	if (!strcmp(buf, "default")) {
>> +		enable = 0;
>> +	} else if (!strcmp(buf, "mbm_cntr_assign")) {
>> +		if (r->mon.mbm_cntr_assignable) {
>> +			enable = 1;
>> +		} else {
>> +			ret = -EINVAL;
>> +			rdt_last_cmd_puts("mbm_cntr_assign mode is not supported\n");
>> +			goto write_exit;
>> +		}
>> +	} else {
>> +		ret = -EINVAL;
>> +		rdt_last_cmd_puts("Unsupported assign mode\n");
>> +		goto write_exit;
>> +	}
>> +
>> +	if (enable != resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +		ret = resctrl_arch_mbm_cntr_assign_set(r, enable);
>> +		if (!ret)
>> +			mbm_cntr_reset(r);
> 
> The following APIs interact with the MBM assignable counters:
> 
> mbm_cntr_alloc()
> mbm_cntr_get()
> mbm_cntr_free()
> 
> mbm_cntr_reset() appears to be related but does significantly more
> than interact with the MBM assignable counters and that creates a
> confusing API.
> 
> How about introducing mbm_cntr_free_all() that _only_ releases all
> MBM assignable counters and match with mbm_cntr_free() that releases
> a single MBM assignable counter? mbm_cntr_free_all() lives with the
> other functions operating on MBM assignable counters, thus not
> hiding its functionality in other parts of resctrl.
> 
> This series open codes reset of non-architectural state in two places,
> within mbm_cntr_reset() and within mbm_config_write_domain(). That
> can be turned into a new helper that only resets architectural state,
> for example resctrl_reset_rmid_all() to match existing
> resctrl_arch_reset_rmid_all().
> 
> resctrl_arch_mbm_cntr_assign_set() can also reset any architectural
> state leaving mbm_cntr_free_all() and resctrl_reset_rmid_all() to be called
> here and from within mbm_config_write_domain().
> 
> What do you think?

Sounds like a good code separation. It should be fine.
Will let you know if there are any issues.

> 
>> +	}
>> +
>> +write_exit:
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret ?: nbytes;
>> +}
>> +
>>  #ifdef CONFIG_PROC_CPU_RESCTRL
>>  
>>  /*
>> @@ -1945,9 +1992,10 @@ static struct rftype res_common_files[] = {
>>  	},
>>  	{
>>  		.name		= "mbm_assign_mode",
>> -		.mode		= 0444,
>> +		.mode		= 0644,
>>  		.kf_ops		= &rdtgroup_kf_single_ops,
>>  		.seq_show	= resctrl_mbm_assign_mode_show,
>> +		.write		= resctrl_mbm_assign_mode_write,
>>  		.fflags		= RFTYPE_MON_INFO,
>>  	},
>>  	{
> 
> Reinette
> 

-- 
Thanks
Babu Moger
