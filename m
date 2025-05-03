Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8C8C2FD;
	Sat,  3 May 2025 00:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746233625; cv=fail; b=ecaqRMerVZucZFCKeTZhSHAN2cHfxAOuqMMUrIXmNYVnBAziUM8+KK8xcMsFonJJUxkAJHwmhTQ9rSd9pJduvhc2euEq1XfGRRDQDs2tw3sUMAIlfRZ6C//k1iQs2UyBm/m+QFUrC2kUdRJ/jnO+cRI9zkpCHtJQfMtvC/QLeV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746233625; c=relaxed/simple;
	bh=v2dMscpuLDpilJ0nof96jhXPLsADqjPo3/ftsmSWupU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DOFeQEoRBtlVWuTNg6ixfrfdXO79Msa29k5HRikW0xEVDFK5/Fh9NcbNuugGIsnB5DqyYnPxqNlE8tIAz5cddlor/QYNYXhMrWTX6ssnsKBQIygsmFnoI/G9QwfdvhhJcfG3OGLBSV0t62nVo7r5R0YB7jfLDXXV65lSVAZ8tHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KK44ro7x; arc=fail smtp.client-ip=40.107.244.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KK44ro7x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXQdC6LExaxFIhbONQXF/lEgYsedY4AoaAZaj2AddBqcM6D4zs/b1sSvdYFPPDHMIPODu63GnqXC3zxNUNJbHQ3bwDcnEEqEghJnggfjsW4PA9vCdhLXUT4uVM0mqr6b1uQq4sWc4TUC/N5vQScSUM/OpUupZuoK14+1NfEjE2gkzyuDGCjfFr6gstKg1AQ9S+46KmA6MiVmlsaDwsYE0H6FX9B1WTfHuMRhii78XKWXk/fs/kxtmqWXk/gpKzZgf9Eiaqvs9QzB1oKZ/31KI4LQA4nZS9Fq+6Ju7d1arWyv9ImrNEQA+z+sbtCl/jb1vHmcpYjszpnmQ8fzas+Slw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyssxKYvAhzDiF+jZi859i6L6EzqsPwMqFIgnzeuCqo=;
 b=M3WcFQT9Q6OOlLoVhYNX1M0D6ZxkZZBXSLz1rqJWOTg4nNqoK/cA0aFNC2gjWACAEcRSBzlw9+fpdWJDm0/EzZa1InNUN9NBasq243vz050eabI4SHMiABX9mMTDCw9LXpTRLIRhKJnt95O+vto5K+4JdUNcGrkZUjTdFrqj7GGDk9TKuXntqldTpbJKTnmFFsgldCBVHaxKracef17Ccd+f2b89jHFChBX8vRVaxK5GgH5zqpAq5yDKMkyEv2IbJ+p5LznSzc3iKOSyXz8TdV7oERHIsXQKQHpsFKjmWQVNLX5Da1LQzrQJswnvU3pliXvNJPkqHj7hxnIBKYDsmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyssxKYvAhzDiF+jZi859i6L6EzqsPwMqFIgnzeuCqo=;
 b=KK44ro7xvYsBSY7/2tl71z0k+GUX1tpgZMs8PEx8LqvX1JggOEw43CZc2P/57D4NWYXMhhM0LQqr8ax/bXxqlCsqgikBOy+oVNXpwP29A79O0CRiiQANqucz0/PgkTsEK4e81fqrcfrZDI1eNHs6eAxUujdeZWXLX1kAm6Mk/ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SN7PR12MB7909.namprd12.prod.outlook.com (2603:10b6:806:340::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sat, 3 May
 2025 00:53:39 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8699.019; Sat, 3 May 2025
 00:53:39 +0000
Message-ID: <3e0e9b68-2ebe-40f8-a840-1ad7cd3f56e0@amd.com>
Date: Fri, 2 May 2025 19:53:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, tony.luck@intel.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: corbet@lwn.net, x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, thomas.lendacky@amd.com,
 mario.limonciello@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 riel@surriel.com, xin3.li@intel.com, xin@zytor.com, sohil.mehta@intel.com,
 ak@linux.intel.com, ebiggers@google.com, andrew.cooper3@citrix.com,
 gautham.shenoy@amd.com, Xiaojian.Du@amd.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, james.morse@arm.com, fenghuay@nvidia.com,
 peternewman@google.com
References: <cover.1745275431.git.babu.moger@amd.com>
 <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:806:24::29) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SN7PR12MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: fa682c86-74d9-4632-addd-08dd89dcf128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODFuOVdKL0FOekNBYnhtVEdjVG5aNGdBR2lzTDhQS25OamNBeE5MVjQ5bkp2?=
 =?utf-8?B?dlZ1cnB1YytwckVCOVFEcU5SRHFUaE5NSEU5dmxkS0RpL081bGFwemI1M00r?=
 =?utf-8?B?MFRFeS85QnFJejN4UWx0bVl1eExzQjBJSlNjQ0pRV2NLU1NDb3NsZEYvRmhU?=
 =?utf-8?B?NzY5M2Fsc2gxZWNqVXBKTkNzMGxOcldmVXhPMVhkLy8yR24vQTB4bVpEOHJy?=
 =?utf-8?B?WWpreWhaY3lsZ2F1MXVEM24yRTJObVQ3YnpVb1pRK0ZMUGlQRnNaTDFpbEg0?=
 =?utf-8?B?bkJyejlkMWtBU2xoZy9lemlucUZVNWVxWlR4L1NIcjNwVzNJVXBWMm13dVlH?=
 =?utf-8?B?OWFYQzNtaGN4Q29UajJZU1o1eHlZY1VPYnY0cThDcDg4cmFNOUkrc09sVFZh?=
 =?utf-8?B?NVg3eWc3YVhCK2Q0blZ0TStWY1ZsYVVRbHdTc2crL3ZqeFd6MC9DbGpkbklL?=
 =?utf-8?B?ejEya0RrcHlLcWZqMU1xcVgwVEhSRkt3VVdEaThzRlpuSGRWODE2ZHNFYlhn?=
 =?utf-8?B?QWNsNWJLaktzMnBNTTN0eDVSZUlmNWJ3bklncFN6QUN4UjZmSjNEREVqaWlw?=
 =?utf-8?B?R0NWVVFjbkU3amZYcC9XUTZKT1RqVGZrbzBTRW1OTjhjUWZXUWQrVkJSMjNF?=
 =?utf-8?B?ZVpsd2VWSmF6RnpUbzVCZzkrZHlnTXNLOE5aQUNEQ3Bza0ZUd3pYeHJjd21O?=
 =?utf-8?B?dEJxcWxKcGVTUUVYM0tXdWl1clNwTnhFYzA4TVZvVjVJeGpJeThlK0VPT1Y0?=
 =?utf-8?B?RHZQQnVJUWxOSnZyYytTS0RQTjZZZGtId292dXpDaHNTUDM3OFFmR0txUHQr?=
 =?utf-8?B?YzVyVUFjTVBQT0VSNDVia1NrOUcvL0hCckV2QnJFUm9PZk1iV21VZGxJdXZ0?=
 =?utf-8?B?UTBrZ2Z3cjBjVXNRQTYxY0hZcVA5UkJIcUlNZHlGaU5nUTVjUnNnN1dCMnZ4?=
 =?utf-8?B?SFk5UGsvZnk0NEhxc0JiYlVlU2d0bHBtK3FLYUJGbEVIQmJLaVJxeTAwUFdY?=
 =?utf-8?B?aXBlemFXMEIwMGtsSU4rQUd5dW4wRVhaOUR3NCthOE9ac2JBMzF5MHZLMldz?=
 =?utf-8?B?T2V1NHBKNUhZM3Byb0RKK1pyU2wyUGxGanBoRjl1dkd5Z1FQcHFJZjNxRVdy?=
 =?utf-8?B?RXMxNXBYUXdUalFaTmNVODQzOEVvRmtNc0wvQVlRUURIWkNqWTJPTzgzQWVp?=
 =?utf-8?B?Wm9NMVhWTHJMMHpzcGZzNFJHOG8xTDdxaEg5YnJ0R0tIVmRpWkpMVEp2SzNh?=
 =?utf-8?B?Rk9uQXJIT2UwdGU0MnZrRm5pOGFsYjMrZm81SnJiMlBaeUxUQXdWTlhHRUFQ?=
 =?utf-8?B?VFp4RXhIeHR4dndja3hCNFlQL3JRWW1ydkNQTWZmM2hYb0xxMFl4d0lNUmJr?=
 =?utf-8?B?WEpWKy9OY3pVMzJncko5Y2NpdVhNVUZteWNWTitlQk5KTldFMVhXREwwUlM0?=
 =?utf-8?B?VTYwQXNWMjZ4SmRXOWJ6cGkyWmZuQUEyZnRJMUhMS3MzeE5IMUVUOVBBc0t4?=
 =?utf-8?B?K1ZjdWdCSzBON3ZkdHdMb1dSV3NwSndmU0ZBRVFwRmNaMEVKUFU0UUg4Szgr?=
 =?utf-8?B?Zi85Q0dxc1RrMlNuS0JxWEhpMVRmRVh1NmI1bDc4TDlMNC9nalNZdTk3VHNS?=
 =?utf-8?B?UDBhOGwySTBLS1NmVC9PUDA1dVdhV3JneWlrd0JTZjY1Zjlja2xDeDlHYjda?=
 =?utf-8?B?d1hJd0hnSDRXdHNTU0tQSmQxZm1RRENrQUFGcENOTzdpc0QwcTJ2TDA2b3pT?=
 =?utf-8?B?TE43bXRCMHprUjRRY0djdUpaTkxIeEdJU09tSWg4Yi95VTdRK1JpZGFpR0Iw?=
 =?utf-8?B?Z3YzKzBWaE9WYlpocDNPM0FjMUxsODZ2UHhteUxlRHFqWG1kaHdjT1g4V1F5?=
 =?utf-8?B?anNGRWsxUDgrSWxQcDd5NGJXSmIydUJod0R3MkRMbXIrS3lVVFZudzV2Y2o1?=
 =?utf-8?Q?D6seSgnUZM0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW9wQWhVL2xvTm5wMmQwMDNwdWpSa202dzcrQVJTVTVqakNJQlR5ZVNTSjJr?=
 =?utf-8?B?cFR2SEFlVmdqeW83cFpDK0VwNmFxeVNOYUZ4OXAzcHAzaXc1ZVN4TUQ3c2dp?=
 =?utf-8?B?a1NxNDh5QUR2TnhTZUxXQ3c3ZjlZZXpOOXY5bkJPblVLWVRaTkdxYkhldjRL?=
 =?utf-8?B?RVBoNVR1azZEZkdCaktNd1dRZmJQMDhONk9hdHVqa0RkVDB4ZkN2TWNJekxl?=
 =?utf-8?B?cSs2dDd0N1NJMnk1bVVHR2ZWNG9rNTg3YjNPS0tQM3dsRHFvSCtuODdtaFEz?=
 =?utf-8?B?d2RTTGhZM0NnbEZxT0xvWEhpTDk2WnVwVGFIMW5ZUS84TTZSdFVQS2dRMDdF?=
 =?utf-8?B?azBQOUk2anlWTmc0ZVExKzVZbTFFczRYRStONjBoOHNiZmQzN2w1N0sxcXBp?=
 =?utf-8?B?M0tZcU5UNERMNjMxc1RYY1pVRVpQUzJsdEJzcTBpczVubC8yYStYYkRoNFlH?=
 =?utf-8?B?R0ZzL3BrZTFMdS80YnltamtocW1GS0Y0V0kvMVo2TWRPb0l6WS92M2YzVVpM?=
 =?utf-8?B?anpJTVBPbjBFcWlFOXNrVi8vTkxEVXJFdkVGVGNtREFKczlKVXdJK3ZjSG1j?=
 =?utf-8?B?YnhGcFNXSCt2WEczOWRzSkZyTkdYM2d4N3M3WStTeW1rcE9aL1B6ZEpoRXNi?=
 =?utf-8?B?cithV2pkN0dKTDVqTllBNFhURUlqN1laUjlmOU9HNFR0R3dqVks0dkhhRER6?=
 =?utf-8?B?NFlkVStqbDhwVjlvSjBxTnRmbnN0TjZMZEJHL0RFWlc3Wi9QSVFwYzh2aDZp?=
 =?utf-8?B?Z1hvYlRsUkNWdzlkL1dTZ0xyZ3ZQZ2ZRM1QrMUxBZmFTUytoYXBFNktPM0Rp?=
 =?utf-8?B?MlA2blBqdjUxYjRZdnRXdXlYc2ZWNUt4MktCRWdmSmVIYlhLVVVPN2g5bUwy?=
 =?utf-8?B?eXkzZ3RLUS9YcHpmRDFkT3pxWTBneTBVOWF4MUlXcm1ralBxeEsyYnEzVThz?=
 =?utf-8?B?QzdOdTBnV21GdmIxbkJpS3BIQ2dpbDRXNEVEc1NsYWxhN3RRK3hvdXV2Yk5Z?=
 =?utf-8?B?L0hvK3lGZkJKUmJyTE44OFZ2ekk3SDRxY1ZMQm1vdnc4ZERMSjQ0eUtsY1RF?=
 =?utf-8?B?MCtoRDluL3JwVnJXV0JycTZiemRubWFCSXZhcFpEUjZQUlkwNG9TZTFkekVL?=
 =?utf-8?B?SFBCQlFFQ0pacWgzdzZIMTRkbkx0bExhSXMwWC8zUFdwZ3k1c1lEQ2xFcG1E?=
 =?utf-8?B?TWdidEtnS05zNFprZ0FPVkYwaDd5MHcxcHdFRWRSWFFORG5QbFc3VXZsZ3lK?=
 =?utf-8?B?OEV4OHEwL2lKNlc5bXU2Z2Z5S1d0R0UzN2xkQUpKV1hPc1QyeGtxN2IwSnY4?=
 =?utf-8?B?RUJIN0doMmcxQ09tY3JiSmVlNWhpVUw3QTBVWS9RMzFtc0ZoZUFMeDZ5RkhP?=
 =?utf-8?B?WHloOW95K1EzU1ovUmNqejNkRndjWXMwQWgrSXJ4MW9xdWRwd0g2UWRQaERD?=
 =?utf-8?B?RWRrMGhsbTcyM0JHNG5sQkN0UGhBeGRScE95RnZkeXlucklwQ3hCMVdPNG4x?=
 =?utf-8?B?NkU2czlyWFEwRVdvS3FZa3lDallDcXI3L0FhM2RSSUN1d3ZsUW1uY2pDZjJ1?=
 =?utf-8?B?YTZBSS9WYmFmMkpUendkSk1XQmlMdStlZkFhQmZJZEdES3N2OEp5RTFMWUhH?=
 =?utf-8?B?QnU1emswNUNYQ2QrTFIyS3p4bjdJZUtWano2YzJwVGxwT3FxaVA2elRlV1I4?=
 =?utf-8?B?MWdHK3Jpb0s2blFuWlk0VHdiU2I5c0N4TzR6TjdmU1JuMHM1Tmo4cjFBUWdh?=
 =?utf-8?B?ZW1lRWpWS0s4MVhhbUpudkdiVjM4c3BXallYUCsxdyt2eENmaEtENXBZK0ph?=
 =?utf-8?B?d3JZUkIrd1NrSlVvOUFubHorTHpGY3ZFNHF0SmpsQ1oyK0p6MTZFMTV5REZH?=
 =?utf-8?B?elBxNktmYTV4WHZlQytPek1VeU5NeFBTeDQ3Qmpnc3BhV1dCenR0d0ZpVGM2?=
 =?utf-8?B?T3JxdjJzTlpaUnMvNmNyeHV3MEJ1TWZTbDdvMmc2ZkJoc2JYVFFCSXN2VWN4?=
 =?utf-8?B?UklGbFRLSHpCMDVpOHp3dHRSbWJSeVJodXBzdDJuVUEzT0tDM256NlpScFUw?=
 =?utf-8?B?VU9MTk9NYmFvdzZscjNnMUFTRU9vSHBYWC9tWVc1bzNraUZLZkpkdUtTR0tT?=
 =?utf-8?Q?AJMs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa682c86-74d9-4632-addd-08dd89dcf128
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 00:53:39.1217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gHLntZ0BFAiBvfmxc9ihmdG7cwMeMIW9yspOhofwLLkfHb7hJqG+GXpyeOzky1/2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7909

Hi Reinette,

Thanks for quick turnaround.

On 5/2/2025 4:20 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/21/25 3:43 PM, Babu Moger wrote:
>> # Linux Implementation
>>
>> Feature adds following interface files when the resctrl "io_alloc" feature is
>> supported on L3 resource:
>>
>> /sys/fs/resctrl/info/L3/io_alloc: Report the feature status. Enable/disable the
>> 				  feature by writing to the interface.
>>
>> /sys/fs/resctrl/info/L3/io_alloc_cbm:  List the Capacity Bit Masks (CBMs) available
>> 				       for I/O devices when io_alloc feature is enabled.
>> 				       Configure the CBM by writing to the interface.
>>
>> # Examples:
>>
>> a. Check if io_alloc feature is available
>> 	#mount -t resctrl resctrl /sys/fs/resctrl/
>>
>> 	# cat /sys/fs/resctrl/info/L3/io_alloc
>> 	disabled
>>
>> b. Enable the io_alloc feature.
>>
>> 	# echo 1 > /sys/fs/resctrl/info/L3/io_alloc
>> 	# cat /sys/fs/resctrl/info/L3/io_alloc
>> 	enabled
>>
>> c. Check the CBM values for the io_alloc feature.
>>
>> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>> 	L3:0=ffff;1=ffff
>>
>> d. Change the CBM value for the domain 1:
>> 	# echo L3:1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm
>>
>> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>> 	L3:0=ffff;1=00ff
>>
>> d. Disable io_alloc feature and exit.
>>
>> 	# echo 0 > /sys/fs/resctrl/info/L3/io_alloc
>> 	# cat /sys/fs/resctrl/info/L3/io_alloc
>> 	disabled
>>
>> 	#umount /sys/fs/resctrl/
>>
> 
>>From what I can tell the interface when CDP is enabled will look
> as follows:
> 
>   	# mount -o cdp -t resctrl resctrl /sys/fs/resctrl/
>   	# cat /sys/fs/resctrl/info/L3CODE/io_alloc
>   	disabled
>   	# cat /sys/fs/resctrl/info/L3DATA/io_alloc
>   	not supported
>   
> "io_alloc" can thus be enabled for L3CODE but not for L3DATA.
> This is unexpected considering the feature is called
> "L3 Smart *Data* Cache Injection Allocation Enforcement".
> 
> I understand that the interface evolved into this because the
> "code" allocation of CDP uses the CLOSID required by SDCIAE but I think
> leaking implementation details like this to the user interface can
> cause confusion.
> 
> Since there is no distinction between code and data in these
> IO allocations, what do you think of connecting the io_alloc and
> io_alloc_cbm files within L3CODE and L3DATA so that the user can
> read/write from either with a read showing the same data and
> user able to write to either? For example,
> 
>   	# mount -o cdp -t resctrl resctrl /sys/fs/resctrl/
>   	# cat /sys/fs/resctrl/info/L3CODE/io_alloc
>   	disabled
>   	# cat /sys/fs/resctrl/info/L3DATA/io_alloc
>   	disabled
> 	# echo 1 > /sys/fs/resctrl/info/L3CODE/io_alloc
>   	# cat /sys/fs/resctrl/info/L3CODE/io_alloc
>   	enabled
>   	# cat /sys/fs/resctrl/info/L3DATA/io_alloc
>   	enabled
>   	# cat /sys/fs/resctrl/info/L3DATA/io_alloc_cbm
>   	0=ffff;1=ffff
>   	# cat /sys/fs/resctrl/info/L3CODE/io_alloc_cbm
>   	0=ffff;1=ffff
>   	# echo 1=FF > /sys/fs/resctrl/info/L3DATA/io_alloc_cbm
>   	# cat /sys/fs/resctrl/info/L3DATA/io_alloc_cbm
>   	0=ffff;1=00ff
>   	# cat /sys/fs/resctrl/info/L3CODE/io_alloc_cbm
>   	0=ffff;1=00ff

I agree. There is no right or wrong here. It can be done this way like 
you mentioned above. But I am not sure if will clear the confusion.

We have already added the text in user doc (also spec says the same).

"On AMD systems, the io_alloc feature is supported by the L3 Smart
Data Cache Injection Allocation Enforcement (SDCIAE). The CLOSID for
io_alloc is determined by the highest CLOSID supported by the resource.
When CDP is enabled, io_alloc routes I/O traffic using the highest
CLOSID allocated for the instruction cache (L3CODE).

Dont you think this text might clear the confusion? We can add examples 
also if that makes it even more clear.

>   
> (Note in above I removed the resource name from io_alloc_cbm to match
> what was discussed during previous version:
> https://lore.kernel.org/lkml/251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com/ )
> What do you think?

Yes. I remember. "Kept the resource name while printing the CBM for 
io_alloc, so we dont have to change show_doms() just for this feature 
and it is consistant across all the schemata display.

I added the note in here.
https://lore.kernel.org/lkml/784fbc61e02e9a834473c3476ee196ef6a44e338.1745275431.git.babu.moger@amd.com/

I will change it if you feel strongly about it. We will have to change 
show_doms() to handle this.

> 
>   
>> ---
>> v4: The "io_alloc" interface will report "enabled/disabled/not supported"
>>      instead of 0 or 1..
>>
>>      Updated resctrl_io_alloc_closid_get() to verify the max closid availability
>>      using closids_supported().
>>
>>      Updated the documentation for "shareable_bits" and "bit_usage".
>>
>>      NOTE: io_alloc is about specific CLOS. rdt_bit_usage_show() is not designed
>>      handle bit_usage for specific CLOS. Its about overall system. So, we cannot
>>      really tell the user which CLOS is shared across both hardware and software.
> 
> "bit_usage" is not about CLOS but how the resource is used. Per the doc:
> 
> "bit_usage":
> 		Annotated capacity bitmasks showing how all
> 		instances of the resource are used.
> 
> The key here is the CBM, not CLOS. For each bit in the *CBM* "bit_usage" shows
> how that portion of the cache is used with the legend documented in
> Documentation/arch/x86/resctrl.rst.
> 
> Consider a system with the following allocations:
> # cat /sys/fs/resctrl/schemata
> L3:0=0ff0

This is CLOS 0.

> # cat /sys/fs/resctrl/info/L3/io_alloc_cbm
> 0=ff00

This is CLOS 15.

> 
> Then "bit_usage" will look like:
> 
> # cat /sys/fs/resctrl/info/L3/bit_usage
> 0=HHHHXXXXSSSS0000

It is confusing here. To make it clear we may have to print all the 
CLOSes in each domain.

# cat /sys/fs/resctrl/info/L3/bit_usage
DOM0=CLOS0:SSSSSSSSSSSSSSSS;... ;CLOS15=HHHHXXXXSSSS0000;
DOM1=CLOS0:SSSSSSSSSSSSSSSS;... ;CLOS15=HHHHXXXXSSSS0000

> 
> "bit_usage" shows how the cache is being used. It shows that the portion of cache represented
> by first four bits of CBM is unused, portion of cache represented by bits 4 to 7 of CBM is
> only used by software, portion of cache represented by bits 8 to 11 of CBM is shared between
> software and hardware, portion of cache represented by bits 12 to 15 is only used by hardware.
> 
>>      This is something we need to discuss.
> 
> Looking at implementation in patch #5 the "io_alloc_cbm" bits of CBM are presented
> as software bits, since "io_alloc_cbm" represents IO from devices it should be "hardware" bits
> (hw_shareable), no?
> 
Yes. It is. But logic is bit different there.

It loops thru all the CLOSes on the domain. So, it will print again like 
this below.

#cat bit_usage
0=HHHHXXXXSSSS0000

It tells the user that all the CLOSes in domain 0 has this sharing 
propery which is not correct.

To make it clear we really need to print every CLOS here. What do you think?

Thanks
Babu
