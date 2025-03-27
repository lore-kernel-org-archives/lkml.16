Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6561F09B1;
	Thu, 27 Mar 2025 22:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743114338; cv=fail; b=FcK1NS8R/dkH7Dn1Cj+1tzhBrbyAIFmOdeSiS36pGt5FubvmCa0ufLTTA1o1fqz9tPkMnKFbUmFZYKfQ9Zb1C95Gdgdy6YKqmbXE5dYFfFGbdBKtu4CwoDIFmUfm4XWlgYpo3mC0/6nVP/WWsC7rpYgDk7AcP7DRXCQMfE91HRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743114338; c=relaxed/simple;
	bh=pla3sgnXC8OjHv8paCNi6pGN01ilUKlWphMWWtWBO0A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q7hypS7y/zBf5WrrVelKQAcb9Zsnf/I9eOGPN8yoxovNIpC5gypQfp67mXfDp2LIaMkpzec6HRZr3vEts3/S/++zvRslE2NLvz9z03XQ81knWyeQMoopA5JGUbeoOylZmOUFyuzg4UzRj7GDHlnzEqFAzgZ5h4pQU1tIvU5zfzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Zrm1qvWj; arc=fail smtp.client-ip=40.107.243.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Zrm1qvWj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qF3AU93qfjbiqvANRcE1UImogibfIwtMDILib5dp6dROdbhOZ5YMEorddbFl6+G4czPy7NaIiwH/J5/lmquXbyrq8zx5RXylHzZBdYYidNDPFfDHp9PPWQ+WnJoxQ/3i3EAWvigNO/ArFuGKZgV9DzScr9tBh1FGaFCmfkgEQBjgV+IM8Sj59T5ulsciPDx553FNtUrV8AUwdI+ShYXpLmUrHYMIRc7o+6YgD4H34pjkVylZNMS/htYPSI+BnsYBr/1/slbWSw2c21gotHsyDFlf9u7e4g2urNNMXzS2xcKeUyKVsq3H9RrQCUbNdaG2lumV16lumhf9dQ6zte/PCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZSfm0SmVtVoPfQQu2A9Ayasv+PWLHKC8oUwsfSGq34=;
 b=kfbN+RjgnR2c7roTau7KpkF39PQ4OOSGRqIj9E09WSnVp2tZAug5aXQn4Qv7LnZYrWuMO6HXU8YGJXBPmewgjYwrxF45NCjD+/ummn5zYl4HRZKvLqBNS7DsEFH1va5ZZ1gNxBnf6ynJBo+aAxs+zQAtSpgS8NvqJoWcQk+eMaUj4kB+0HA+uuHxkCk9l7wAs01qJwvzxn3QlsoMxw6c96L4O8G2u2CvlSiF5jkJXCgj0nqRTvHeAIBicfbmz22nPIOUgt0uSFjgY4JR2HglVUo3x0tbbWx5R+pkp9QDfFFVSHK7ttDWHDqnYFpp4onmS+kMVFN9+/tI6/t0jq9RYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZSfm0SmVtVoPfQQu2A9Ayasv+PWLHKC8oUwsfSGq34=;
 b=Zrm1qvWjy450BPAwfbiLoE8RA9IkvMCHefHOZpQYpJwW7GIY76pnn9zJDdug+xy9wd8OJf7kKWr/veHSpeTgluJ4bGs8bHvlhQdkxhef+6zv+d18HSN2IWpw+sE1591jAln2Q5tO0NFpNim/VdKkQb0OQUmJgjRJXjAIzyoIlGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Thu, 27 Mar
 2025 22:25:31 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 22:25:31 +0000
Message-ID: <e6a90ebf-8f6b-4553-b462-5c824d8e3d08@amd.com>
Date: Thu, 27 Mar 2025 18:25:28 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: amd: Add ISP platform info
To: Hans de Goede <hdegoede@redhat.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>, ilpo.jarvinen@linux.intel.com,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, dominic.antony@amd.com
References: <20250228170238.3484860-1-pratap.nirujogi@amd.com>
 <cd25d131-bead-4a38-98dc-1011c2843286@redhat.com>
 <3d57b624-7753-4a4d-9051-0a55cbdff1ec@amd.com>
 <9b8c9eb7-c8d5-4c12-9ce5-c4b4df3b4223@redhat.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <9b8c9eb7-c8d5-4c12-9ce5-c4b4df3b4223@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0160.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::15) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8f6200-7eee-4636-8a86-08dd6d7e48c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TndTMU9ZMzYrWDcrK25LMW5JRXdBNXE5MzRTeWRXY2RKd3FXd3g4RHBWUjlB?=
 =?utf-8?B?V3loUy9SZnZ6bkpYWERHZkVqU1hxQ1hFYjQyZXNycDNySFpmVEJWNUJSU05p?=
 =?utf-8?B?REwzVlRodkJDVmhlYmdMeE9lUVpBYTBlQmY0WHlCd3k3UzE5TjFkZWJ0Q0Vt?=
 =?utf-8?B?amRicHB4eG9mQ2UyZ20zejRHdDZFbmc0cy9CWTN1cXoxRVZ5T24ySFozTmFR?=
 =?utf-8?B?Nk5pYjFGdjVpdXJkZDBPR0IvenUxNzREWUtncXRFYUdPVThZYlhLLzdLcUti?=
 =?utf-8?B?OC83M0x1RDhITTgzZnFRQkJrUnd3T2FNMk14YnVDT01GV1FYK1B4eEZUMFhu?=
 =?utf-8?B?MnFwaHArb29vWEZHeHdQOVpyVE94NSsvRDJaMUxuUHFwaUoweHB6RnJ0Yzh1?=
 =?utf-8?B?azhycnJpc1RELzZVcUhscTMvQUUvMllSczRBczJldHVrc1Bzb25hanlmTzc4?=
 =?utf-8?B?Vjk1ZkpPMlo2Mm5hVVhJREpYL2k0aFNvYXVuMDYwaUoxV1NNdG84clFFNXRv?=
 =?utf-8?B?bWpQeG5JVEVHR1ZMSElqUXJIS1pQbXM2NlZLNGpHa2hQdXdybE1jdVZTMDFS?=
 =?utf-8?B?OG5uZHZ1Qm1nQ29PWVdFdXV0NytxeW5wUWxmcU85UHBPbzhMaUsxMjVnNjdJ?=
 =?utf-8?B?Z3h1RUxOVmh2TjZsbDhqUThCTzhCSVduSFNhckRMcmQ0M2RxVkE1alc0VUNB?=
 =?utf-8?B?OTBBZEdHaGFsTlFhMUZ5TE1yWjFFZWpUUjBNZjJ6bjJ1VU5IUzBJNEhRYklF?=
 =?utf-8?B?TFNpNHd0cERNVW5TaUpEczcrd3JqY2VvL1lpUHhQZjBhZWpiajlWWm9HK0dC?=
 =?utf-8?B?QnF6cGhiQkkrbzdRc3JtOFZVMHhrSmhDZGZ6cE9XbWY5QXZ3WU5RelUwUEgy?=
 =?utf-8?B?aVpKc0ZuMWRocFdFeGlFKzlYVHRuUVR1bWs5UFJEampFckJvZ0lYNUxjbFpO?=
 =?utf-8?B?UmtlR2JDYjY4ZDZycHU4YTF4bEtIbHlXOGowVmxOQWtvbkRNeGd3OVdUaUdV?=
 =?utf-8?B?QWtVamF5VG1TODdOUXJXaGM2Z0pjVXZHSm1aVVJseHAxUnlMYlIwVkpCNGZS?=
 =?utf-8?B?WFZIbWtISVRZTUg1Nm1aVnJjS2Y5ZTdYejBCMGlQRER5SDNKZkxGcGU4Y1dp?=
 =?utf-8?B?dlY0SmZZbTdBT3Q5blNEUlFOeU0wV1VRTVhtS1BIc1d1aTdGZlQ1YlUvakNt?=
 =?utf-8?B?N3F3Q2NJdTNWR2ViQUxRUlVMaXloY1FZYk10V2R0NGNyNlBqMnZHY0NuVlVP?=
 =?utf-8?B?bWdITGFHb25WUStXK25vb1BGQU5WVFJIK3BhQlVjZVhOaVpIeWYwNncwOXhU?=
 =?utf-8?B?L3N5MFBONEVFVTQ5aXZuTUcrOG5zeERVN1lIWXR2Ui9mbmxzcVBzS09zUkZZ?=
 =?utf-8?B?dnpXNFRqbjFJSVkxVEluUzJ5bzdGWGlFS05TazUxQ0NpaHBlWEV1R3NhRSti?=
 =?utf-8?B?TjBPcWhHdmIreHZkTW1VVmlHTTlyWVF2OVpFMG9jRk9DVHZDWTJ2cHYwTFJw?=
 =?utf-8?B?Q3lhWHV1YnZmbTVBajhjRUl1dXZ4V0hFZ1NZbDVxaUI5UjlTQ2RMa0l4TDJB?=
 =?utf-8?B?Nm1BYkhmV2dhV2JrQmNNaCt0T2psa3J1eEt0ZXl3eHpyUU1XZzFUcGlGNGhl?=
 =?utf-8?B?RWVxekNDVmY4MTl2Nk56bUJMVWhnR0t6WXZqYzdvZ3l1eDBSTGkzTUJERWZP?=
 =?utf-8?B?NE5RTWJGclI0ajh1ZHBBN3Q5WTFIYWJwaytIYmRMM050OGVIWHVjWU1kbGhy?=
 =?utf-8?B?cmd1NkxkMHhMSnhVMThHY3BhaDhNVmpCRm9rSUFkbTZFRGtDQUU2dlJZTDlY?=
 =?utf-8?B?cTlWMmRDNGF1YWk0d2grdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkliWjBOTCt5ekdDakVqeGhOdTFlMVF2YTFveXoxcjRHVE9uU2RDVTE1S1R5?=
 =?utf-8?B?bVlZc3B3N3dOdGtkMlB4ejNKZUIxUTRWQVFxUWNqc2ZPVzJWZ3ZGZ2srclpG?=
 =?utf-8?B?c0RTdXI0RWIyTHpCMXQ3d01scjFCK0VCcmxMN2tPeGZrTXlkUU5BaUhIRHU5?=
 =?utf-8?B?MWZxT29YMVRrWTA5WGh3aXo2RStidndsUjBzbXFZQ0x5OHE4dHRFTXRSS21Z?=
 =?utf-8?B?eTZxVlFnWDJNOWMreXRWdlBnem0zK1VyNUZxMU5sQ1VyK0t2bVh5OTVBdzEx?=
 =?utf-8?B?ZnA5OFhiNHh6WllRSHZ5TWFqRXRkemVoS2RwSzkrUWFrQnFlLy9UblNiQ0V4?=
 =?utf-8?B?SkRua0UyblpvQWsvSTJ4TjZDSTFrcktSNmZxRGI2Z0pJeFlyeFY5V3VHUWlG?=
 =?utf-8?B?c3NPMTJGMnowTVFtNmdnQnArb2laVWhiTmt1bVU2K0hWVGloQVIxQkp4endV?=
 =?utf-8?B?WTFSTFJpbm8zTUhpYkdicm1HTVFtOWU3Y2R6VTFvLzFWS0NPSVFGMUR5V2V1?=
 =?utf-8?B?S3BnMU1CVU51Vk43SGFTNzJWOHp3Z01jMWVpZXJ0TlpoelpzMFd4MmxVcGsr?=
 =?utf-8?B?Y1p4anpTSDl1RGoxWFNEK0piQUZVWFdzNmlGM1BoMUs2Z3Z2TmpvR21aVVFU?=
 =?utf-8?B?WXNJam5UQjFZd3BIRXJHcStKSzlUZFlReXFzQmxVWTJVNjZjVEZjcVZHZ0Qz?=
 =?utf-8?B?NTAxWGpsSE0yWlIyL0Z3ZGlVVWs0N3RJSVJqaVM2TGFmeFR6dVdVR3NpZWo4?=
 =?utf-8?B?U2xLb2c0THNuTk9EcHY4N3NDbEd3ZmJIc0pmN2U2ekhQOGtMdEFYV1ZrY2tZ?=
 =?utf-8?B?MGhSYTA1UmpyZlJ1TXZDNzFBbFRwRkhkUlhlWmVmSWtkaUE2RkhuelNHUDAw?=
 =?utf-8?B?VGxCU1hRV0oyd3lqUlFtRDhvNWdxYUY1RlpHUjh3cnVia3lZZVQzOG11LzQw?=
 =?utf-8?B?OW05OGVta3h0ejF1TzFDRWxESEdWTWYrQkFpU3N2ZjM2cWJCKzZDZVRPYWp0?=
 =?utf-8?B?RzNmZVhiNTRjUGtOY1VDb1lxZmQ5TUpaam9NQ3BIWTQyRlE3b0pNN21BTUhw?=
 =?utf-8?B?cXVsd29jMVhlYUpJdVhGOVNibFdtVHRIWFdFMkZmSFlKYmlIZm9tUGhWWTJu?=
 =?utf-8?B?MlhINGFmZ3N4Z1lOTnQ1dWpKa1pZMCtZOWtjbEhzbmFKM09VM1hyMCs4amN4?=
 =?utf-8?B?TGpVOFZ4Uis0WTZjc1MzZDZKcXlqRzl3TCt3dEh4bkFGbXJiMjJXUjlSVndT?=
 =?utf-8?B?S2hzL1JvWjBWRnFLVWlWRkhJdFErQ1FYTDZPVHYxN28xYWlmbFVYbGozREZ1?=
 =?utf-8?B?RXFpRlZSQWpwNmYwRVBHOVhjL0V2a2ZGV3FiZ1RwOEc0TFJVdE8wTElmMysx?=
 =?utf-8?B?L3E0UmFpRHJzMGwxbjJGMitsREROQ1pUUmZLOE0vdTR6c1NtNjVHRVc5cTI1?=
 =?utf-8?B?YXhMdStyMVR4a2x0eXg3RHlwZm4yTDgzUUFsRW4wRmJzaG9MMEhXN1VIeitV?=
 =?utf-8?B?dUpwWDBpNFBCVDBTcmpkZUFDZ3VvMWdZb1pkdnVsbk9sd2pYUzkxOHBvVmhU?=
 =?utf-8?B?TTZqVWNvdTN5UFBSNEZEM0hETFFmbDdkeVEyS0ZtbmRiSDlFN3BobmZWaTVY?=
 =?utf-8?B?Uy9PU1dHNVZHL2UrU2JXbyt2dnFwcVpkaGFhUDRwb1pqZEJUdDJKNGtIb1p4?=
 =?utf-8?B?RHJwYUUzVEY2OHZEL0E5TldvWEtVVllCdWhWUlNzL0VwNGVBYTdxZWtHc1ZV?=
 =?utf-8?B?UXpsaVNFU25RQXBRM1dkcUYxeHFMdXJkcVp6TTQwWUFBdSt6bk1XV2hoRk85?=
 =?utf-8?B?Q0daMHlONGNTNU5ST1V3TW4yeGJtOEJmQzJZRkl4aEZ6U1B6UWpML1pNdkNQ?=
 =?utf-8?B?L1FVSWpkVjRJcWxSOVZnc1hmQi94Q1dHbWhSSFE1V1pjWnFJZkVzR2d3QUpl?=
 =?utf-8?B?c3hCM1VlY2xKRTlHQ29Hd0JuSFExMTdxMkVNVGJpVW1oQmY4eXgwSW5NT1Jr?=
 =?utf-8?B?bmJxNi9SUENMOFQ5VHcxN3JxVnJhUkI1V1VQNVJPaVd1M1RYbEJzb0FCQzJk?=
 =?utf-8?B?Zng4amplVjlrS0tUTmswVXdWQklrVHZ1OHF2MnFiKzlFeU1nQjhvQlIxWHkz?=
 =?utf-8?Q?FgKz2vP6zBxRre+7gYgP5daEM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8f6200-7eee-4636-8a86-08dd6d7e48c8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 22:25:31.4242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bD/GjBtTnD+OBua20GwNXm/oepGyDx6EyOf5TYkzUi4VMcgXx66PzyaG0HeVwUcGto8JrOmmCHQ9p9NBJaUKHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034

Hi Hans,

Sorry I took sometime to submit the updated patch. I have reimplemented 
the driver using your inputs and references shared. Can you please 
review the latest v3 patch and help with your feedback.

Thanks,
Pratap

On 3/5/2025 10:26 AM, Hans de Goede wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
> On 4-Mar-25 12:14 AM, Nirujogi, Pratap wrote:
>> Hi Hans,
>>
>> Thanks for your review. Please see the inline comments and let us know your insights.
>>
>> Thanks,
>> Pratap
>>
>>
>> On 3/3/2025 8:41 AM, Hans de Goede wrote:
>>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> Hi Pratap,
>>>
>>> Thank you for your patch.
>>>
>>> On 28-Feb-25 18:02, Pratap Nirujogi wrote:
>>>> Add ov05c i2c boardinfo and GPIO pin info for AMD ISP platform.
>>>>
>>>> Details of the resources added:
>>>>
>>>> - Added i2c bus number for AMD ISP platform is 99.
>>>> - Added GPIO 85 to allow ISP driver to enable and disable ISP access.
>>>> - Added GPIO 0 to allow sensor driver to enable and disable sensor module.
>>>>
>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>>>    drivers/platform/x86/amd/Kconfig   | 11 +++++
>>>>    drivers/platform/x86/amd/Makefile  |  1 +
>>>>    drivers/platform/x86/amd/amd_isp.c | 72 ++++++++++++++++++++++++++++++
>>>>    3 files changed, 84 insertions(+)
>>>>    create mode 100644 drivers/platform/x86/amd/amd_isp.c
>>>>
>>>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
>>>> index c3e086ea64fc..4b373edd750d 100644
>>>> --- a/drivers/platform/x86/amd/Kconfig
>>>> +++ b/drivers/platform/x86/amd/Kconfig
>>>> @@ -32,3 +32,14 @@ config AMD_WBRF
>>>>
>>>>           This mechanism will only be activated on platforms that advertise a
>>>>           need for it.
>>>> +
>>>> +config AMD_ISP_PLATFORM
>>>> +     bool "AMD platform with ISP4 that supports Camera sensor device"
>>>> +     depends on I2C && X86_64 && AMD_ISP4
>>>> +     help
>>>> +       For AMD platform that support Image signal processor generation 4, it
>>>> +       is necessary to add platform specific camera sensor module board info
>>>> +       which includes the sensor driver device id and the i2c address.
>>>> +
>>>> +       If you have a AMD platform that support ISP4 and with a sensor
>>>> +       connected to it, say Y here
>>>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
>>>> index 56f62fc9c97b..0d89e2d4f7e6 100644
>>>> --- a/drivers/platform/x86/amd/Makefile
>>>> +++ b/drivers/platform/x86/amd/Makefile
>>>> @@ -10,3 +10,4 @@ obj-$(CONFIG_AMD_PMC)               += pmc/
>>>>    obj-$(CONFIG_AMD_HSMP)               += hsmp/
>>>>    obj-$(CONFIG_AMD_PMF)                += pmf/
>>>>    obj-$(CONFIG_AMD_WBRF)               += wbrf.o
>>>> +obj-$(CONFIG_AMD_ISP_PLATFORM)       += amd_isp.o
>>>> diff --git a/drivers/platform/x86/amd/amd_isp.c b/drivers/platform/x86/amd/amd_isp.c
>>>> new file mode 100644
>>>> index 000000000000..751f209e9509
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/amd/amd_isp.c
>>>> @@ -0,0 +1,72 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright 2025 Advanced Micro Devices, Inc.
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>>> + * copy of this software and associated documentation files (the "Software"),
>>>> + * to deal in the Software without restriction, including without limitation
>>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>>> + * and/or sell copies of the Software, and to permit persons to whom the
>>>> + * Software is furnished to do so, subject to the following conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>> + */
>>>> +
>>>> +#include <linux/init.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/kernel.h>
>>>> +#include <linux/gpio/machine.h>
>>>> +
>>>> +#define AMDISP_I2C_BUS               99
>>>
>>> I'm not a fan of using static i2c-bus numbers for this. static bus numbers are
>>> something of the past and we typically do not use these on x86 anymore.
>>>
>>> Using this static number + i2c_register_board_info() also requires this code
>>> to be builtin rather then modular which is also undesirable.
>>>
>>> For a more dynamic way of manually adding i2c-devices see:
>>>
>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/dell/dell-lis3lv02d.c
>>>
>>> But a better question here is why instantiate the sensor i2c device
>>> manually at all.
>>>
>>> ACPI has a standardized way to describe I2C-clients which tyically
>>> is used for all I2C devices on ACPI platforms like I2C touchscreens /
>>> touchpads / audio-codecs / accelerometers / etc.
>>> I don't see why the camera sensor on AMD platforms is so special that
>>> it could not be described in ACPI using an ACPI child-device of the
>>> i2c-controller with a ACPI resource (_CRS entry) of the I2cSerialBusV2()
>>> type.
>>>
>>> Likewise the sensor enable GPIO should also be described in the ACPI
>>> table as a Gpio type resource in the same _CRS table.
>>>
>>
>> We have to take this approach because ISP is a child to GFX PCI device in AMD HW architectures, and since it is not an independent device, its device specific configuration (gpio pin ids, i2c-bus number etc.) is not registered in ACPI.
> 
> The ISP still could and really should be an ACPI child device of
> the GFX PCI device in this case with its own _CRS for for example
> the enable ISP GPIO.
> 
>>> Can you run acpidump -o acpidump.txt on a laptop with this camera
>>> sensor and send me the acpidupm.txt offlist ? Please run this
>>> on a production hardware laptop model using production firmware.
>>>
>>
>> Please refer the attached acpidump.txt
> 
> Thanks.
> 
> So looking at this there are ACPI devices for the sensors, which
> unfortunately lack a _CRS with an I2CSerialBusV2 resource pointing
> to the ISP childdevice as bus-controller. So that i2c-client
> instantiating would be instant.
> 
> +Cc Mario
> 
> Mario any chance that for the next (or the next-next) generation of
> AMD devices we can get the ACPI tables fixed to properly describe
> the sensors as having an I2cSerialBusV2 resource, just like how e.g.
> I2C touchpads / touchscreens have this ?  I suspect this will benefit
> Windows too. Likewise any enable GPIOs for the sensor really also
> should be proper ACPi Gpio resources in the ACPI device describing
> the sensor.
> 
> Ok, back to the current generation devices. So there is an ACPI
> device for the sensor there. This should lead to a:
> /dev/bus/platform/devices/OMNI5C10:00 device getting created
> (please check this).
> 
> So this driver for adding the sensor GPIO lookup + creating
> the i2c_client should be rewritten to be a platform_driver
> binding to that device and it should be a module rather then
> being builtin using module_platform_driver():
> 
> - Binding using a struct acpi_device_id table to match the ACPI HID of
>    OMNI5C10 + using MODULE_DEVICE_TABLE(acpi, table_name) for auto module
>    loading.
>    The driver_data of the acpi_device_id should point to i2c_board_info to
>    use for that HID to future proof the driver for adding support for other
>    sensor models
> 
> - Loading as module means this can be loaded after the i2c adapter driver,
>    so instead of registering board-info it should use the mechanism used
>    in drivers/platform/x86/dell/dell-lis3lv02d.c combined with a unique
>    adapter name, then the module load ordering does not matter and it is
>    also unnecessary to have a magic fixed i2c bus-number of 99
> 
> - probe() should copy the const i2c_board_info info from
>    acpi_device_id.driver_data and then set the fwnode so that the sensor
>    driver can e.g. get to the _PLD info to determine sensor location
>    (e.g. front vs back)
> 
> - The GPIO sensor lookup for the ISP enable should be registered by
>    the ISP driver itself. Also this seems to be something which might be
>    board specific so maybe this needs DMI matching?
> 
> I'm looking forward to see a new version implementing the above approach
> which would be a big improvement IMHO.

Thanks very much for the guidance. As suggested, I have taken care of:

- Used ACPI driver approach to probe the device when ACPI HID of 
OMNI5C10 is found. The AMD platform specific configuration including i2c 
board info, i2c address, swnodes, swnode properties etc. are initialized 
in "struct amdisp_platform amdisp_ov05c10_platform_config" are used to 
create fwnode handle for the swnode graph. This fwnode handle is 
initialized to "i2c_board_info->fwnode" to access the device properties 
in sensor driver.

- Used the reference implementation to create i2c-client dynamically 
when amdisp i2c adapter is available.

- Moved GPIO sensor lookup into ISP driver init.

> 
> Regards,
> 
> Hans
> 
> 

