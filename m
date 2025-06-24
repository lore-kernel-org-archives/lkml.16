Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D738F6F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750739496; cv=fail; b=rNHfZdUkY1gTFiluIy1qH0soUfIKnwHt5D/InUwy6FLtXrpGTthuadHzUrcuVux3h6KR5GaESB2O5MMzpPmMUe2LGBU0ocWi0fq+Rm29P10zvbLWFcDHHV4hbXCSTSlItIvcjtDePLOCopJdI20LLgFAS/eH+liZWAa2jOjuoV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750739496; c=relaxed/simple;
	bh=Pxp5nXhZ7gdLiX8kRm1pNGuRlmtrNhDmEbr1g+mh1dk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NvEVqSD3lFds0gQ07JkMNf+90/qI2JaQ3iumeX6XuwWHUmlHgbQFJHmAVt32wlAbeuHJv+1RA07CJ5kQ71iaHTslLmR6CSOeFnvoUOX8y6oZJrZYzQO1B8agIIeVEjxFeqZfnrzVtnirDqZdLqzhf6QhnYppWb+/z3Yz1M3BsDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LZ1dpAUK; arc=fail smtp.client-ip=40.107.237.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LZ1dpAUK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WBXDewS1oWXtPLvdFG5f2ql5YK7vfzFKzTQ0mWgg2+DqU7rGEUnW3LJvtHvw0ReS1w1Z7vH7etRjZbHeiTekcJtGWTGk5+RsoQAsugC3hWaxrMUoLnGbLgp/oECIzFjCm1onkq+tI3n6KWzCfeMGFTp7jjSnnlvvRpLrsZFxsFEEjMMUYL6MudFRqhDHruhtBla0y1ktL+iFBcIWey3QeP2uaiofBzepS3BfeabupNhbD9T5GpIEfnCQf3rYX59seU2GrZjuduMJHZ/BgGOAmAojvyWgyhysUNopH3ygrDN+yPEW/37+CYlcbFwnFGG+x1tsK2QRIWgN9J4lYq+VdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xvi2/6aH2FVsYmT4OOqRI+ZX0nJQUbcIPACezxiyWKw=;
 b=lZXnOc/awHzbBkaJ37ptUiOcOu5msl3QpfQj5wu9OPupCjetrowm989KPaI1tDdpDIHqmyi6RvvN/EqnaqIP5A2i0nolgJWtV4mG5SPYmtbIlXG5sto1tjmYiywfqt9QGXu6vQ3QFbDEd2vrl8CVPIjtSbWbepuxxaxfVm33ntEjHbXuAZO7PZcmmjWiBIuiBkYjM5UpSs5geG1XT/r8Xy2IytR9AMCGozVjTKzQzxywhpyLBUYSB4zCFec2CpJdA57AMhqMLbTfcgd/W6FpI3dQCu2TfkCfEteXh6f1MlrL78E/uED94MC9R/n6UXR+cffWR+9GUpojsnnpipwHUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xvi2/6aH2FVsYmT4OOqRI+ZX0nJQUbcIPACezxiyWKw=;
 b=LZ1dpAUKqNUfyPtNsHCXfqlHh5ayAWNqJA5WkfvKODakQt5fNmeAtfK80tGEiJVw7eQquvM/yBGJwTkSfmaDe0gBLe8Vj7BgctUjZ/v7dLc1IXw/XQo9Juh7+NrClZjbdBXa0pjQHylmAON1DZUgNrMqSWM0rCU+VJREz8SWE2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by IA0PR12MB8861.namprd12.prod.outlook.com (2603:10b6:208:487::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 04:31:30 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Tue, 24 Jun 2025
 04:31:30 +0000
Message-ID: <d99ce13a-3b27-46c8-9d65-99cf979f537f@amd.com>
Date: Tue, 24 Jun 2025 10:01:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] sched/fair: Fix memory leak in
 alloc_fair_sched_group()
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
References: <20250623061909.13480-1-zhangzihuan@kylinos.cn>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250623061909.13480-1-zhangzihuan@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0118.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::7) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|IA0PR12MB8861:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abea738-5bfd-41b7-b193-08ddb2d7fd7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkVDNnNjV21PSW5ZRWROK0dueWxVTkVUOEN2Z2lXS1FmV0k4ZVpMVzA2cy9U?=
 =?utf-8?B?Y2lKQ21neEtCeE4wMUZxWGV1UnZPaTZoQUloSU1FTGNhL2tSaFZXWjcvd1FC?=
 =?utf-8?B?T2oyd0puSEhVcCtHSE5YZWxFZ1ZIbVBSMUVzdmplVWp5Q3NBdFl3VHBqSStP?=
 =?utf-8?B?c3BpZGlRcHkzU1Vta1dhU3lac1RQQnpteXZNWlVseWJ6aVRXT3cvcDdVbWhS?=
 =?utf-8?B?MnJWOTQ4Um15UzArakJhZFJFTW9XMWJGWmc1ZjF5cDVjbDJVZE9jdXVvN3lL?=
 =?utf-8?B?d24zK3BpaXZkbWxXa0xVUzJCTWRCRWNxWEVvTjhGbk5GOXpRUlZnVFZtTTE3?=
 =?utf-8?B?UVYydlVsQUdzNTFaRk9BMW44Y1FSSUN6RkZDblh2MnZUWVdlZ1F3WStOOTJX?=
 =?utf-8?B?NXZLV0N4N2lWQVN1UHZ3Q0wyM1JoMCtzaDZqV1I3NFlCVFFqK1hXVldRc3Nh?=
 =?utf-8?B?dW9melgyakFteW5ELzhrcytNS2Nwa1R2UStCRDJQTGNodzFtaTdUTmVuS1J2?=
 =?utf-8?B?MFpMYUo0aHBmQ28rZzQzbjJQVW9SaTd3ZkZuT3Z0ZTlmL01LZXlsbGF0ZFE5?=
 =?utf-8?B?c3k5NHJKdTNzd01YUkRXQUYwU3h5MnFMNVhnVWttMEdiSkNjeGFGaXJVTUdY?=
 =?utf-8?B?OFlQdDFtS051eklBVmVsWmJyMlFVYTl1U0J2MmJlN1ZIdjVlVnF2dnFYVUln?=
 =?utf-8?B?aFl0NVpqRG1HQUJkeENJQkJRc1BPcWF1UlVob1RKZjUxSWtuZm5LbnFLNmw4?=
 =?utf-8?B?RVhtamwzZkpNTUlabHo1dm12WFlTY3VEYkNUdkVBSzdpd2VLRE5xZmFKTnFj?=
 =?utf-8?B?TlZlTzhaRWZmQXJxVFcwWXB4WjEyZ0xnMkhoZFFNdUZQamFVbUkwYXhXbTNP?=
 =?utf-8?B?bkdTK2lJTUhYWk9Fa0lTckJNQ1BDRGNZTmk2d1JLcktyand5M1JMSlEzb0g2?=
 =?utf-8?B?Si9lR1NYTGRyT0xHK0YvN1RWZGZ1RFVEbjJIQkFVYVV6L3hoYjBabTFxRSsv?=
 =?utf-8?B?SWVQemtETmZyMnNIZ25mbXpKbEVOdE9YK2ZuUzRYcmtpa1Y5N0ppOVZDeWZm?=
 =?utf-8?B?YUxDL0ZXajgyRGM0SG44S3UvOXR5YnBXMWdhbzROM2M2blNZMTVZRXpqK3Q0?=
 =?utf-8?B?eXpSS2g1c21tdFNidzFOZnRGQ3lKZS80WkNzQTBuYzFhUXJjeHNpc3lDbmRJ?=
 =?utf-8?B?SWE4d282NjU2eVFqeGUveWlST3JXcHhoMGQ3RTBucXhSbmVhY2NvNTdvdUph?=
 =?utf-8?B?UjNJaEdZNWNwV0tTWVVqMWg2M3QxTHpvUDlwMWNDYlY1Q2JZOWRXekN4T1Zr?=
 =?utf-8?B?Z0ZyRDFWVnVYZG1tNllkcGtLNkVybitZWm4ySFRXbTgwWFVqaUNxV0puRm4v?=
 =?utf-8?B?QjM3MW1LeWloWkNFd3Mvd09sb2VmYVg2N2ZUNmpPbWFjMGRVbzRjSGlkdjFV?=
 =?utf-8?B?VUZVbFRiS2FBaVpUVm11MTVLYks2ZzRHb293TTFNQ2F0eCtwN2k3anV1VUVv?=
 =?utf-8?B?VGlEdVF5ZzZrc05xS0oxRGxxTlltOXBxMXdFdHhDeVNKNGpjRnlVRjYzZzgr?=
 =?utf-8?B?WkJmajV0TWI4cmhicmlSWk9mb3A3SkZFUllrUUc0THN3cEFpUndvR3Y5T0h3?=
 =?utf-8?B?V1NDZTNGTFR3MWQyS09MSEkrUWZLcTNzUDd5NVpwK1V0SXdRYUVVODluSFhp?=
 =?utf-8?B?di94amdndFBaUDlMc0h6eUp5eTBmTUpMZmhKaThObmVsT2JzeDVtOHNjcitY?=
 =?utf-8?B?ZVZYcWJDQ3YwRkZ2UHR5SDVUaStrNElkOTR3Vzc3NExGVmF1SlpjYXQ5QitF?=
 =?utf-8?B?RERzTXhwaFlGQmJsVDhVUkJIYWNLVUpBK1B1TUYxcERUc1dRbFMyNEszVlNP?=
 =?utf-8?B?SVNKVE0vcUZscG5JSlFSemsyVWFoaVpFV3dBbmphNithY3AvbnpRUzB6V1Ft?=
 =?utf-8?Q?mMdgpmiyqOQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bU0xMWZ0TXNOSE0yS1ZITkdJei9xZE9saHJ5OEgwR0prbDFPREhzM25jazVM?=
 =?utf-8?B?MUgvU1RSTlJJZDVTMmZJTmtGY1N5WE41MWxkMEo1d09oa2lMb0hoZCt0VHA2?=
 =?utf-8?B?NDY3ZmdkMVcraC8yYzVuWmhLVXhNZnBkMHR2VzVPQ0F6bVpvcnFLN0p3VEI4?=
 =?utf-8?B?OEZlOCt1VE5pRk03Vm9POHBORzV0bUkvT0dXKys3QU1oRW5xaHdIalZKN1Qr?=
 =?utf-8?B?N2hHS0ZacmpvY2dJRm1raXE0VXJxRTN0ejBlZjJZQ01heXpabkgwYjVFYjdv?=
 =?utf-8?B?cFUrWUpISFVBMGpqQi9aL3ZUOHFMZTR2Y1pOMjB5NjFTakU2NG1hdEFNVU5Q?=
 =?utf-8?B?QXFBdXVkQzFPNDZmQlB4eUtVL0VnU09nRVVHYWRrR3VnQU5YSzBnbm1hdHRa?=
 =?utf-8?B?K3Yxa3plZEZmRkl4UERMcHZOQVU3ZE1QM0pqQnhvRGhldWlYU0ZRZlVEb2hl?=
 =?utf-8?B?TDhUdVdnRkRWYVRRZFRoMVl5V25SMEV0TWxXdmJkaW9UTk04dTJFQmhyOFp2?=
 =?utf-8?B?SnY2RndmRWZ4MS9yQ0xpZDQ1SVhOSWRBb0xkaGJGZXBWdTR1aVRQaTkzZGpl?=
 =?utf-8?B?R1p4VWpKQXVPYVQ1Und1L0hCeUxVdGJFdzNNNnFxb2xsbUpPNVFMR0dQRWls?=
 =?utf-8?B?ZURKby9IUTFLVkRQSmVrMXhDaVllVGo4VzRYQVVyQ2poVk5tYzBsRmdEbm5p?=
 =?utf-8?B?WTE5RkFRWkNuVENiUzUraklVY3BWREF2L1BOcTBSTXVyZzlreFJLRHJEcXRm?=
 =?utf-8?B?TUZJaVlFREFyNW5HVmVpUTR2YVhaTE51Rlc1dXU2SlN0eERZWGd3MjI4b0JV?=
 =?utf-8?B?NFNEVzBud2I4OGVYbXBiL3J6UG12dllLK0QxRXRQZXI1dnJUWE5UNWNDNlJN?=
 =?utf-8?B?M1Q2VFhQdzNwditRbGpqb3N5azlZYjNibjIxeURpSndhYzU4cmJ5TUV3KzFm?=
 =?utf-8?B?QjJtOE5pQ1BOWUtTWGF6OERSUXZ1TXNrSzgxeVBzUTVSZWJBSXB5cnVUcEwx?=
 =?utf-8?B?aXQ5RHluQVZ4eVhva2NYdlcyQW43QVViRmcwUmMwUVB3ZmlDYnhQdjJyaXQ0?=
 =?utf-8?B?MXNYdmpIcDFHbFU5YlEwMXNBMnRKZUtpSkpNUlFpZEVJUjhkNXVtVE9YeXU5?=
 =?utf-8?B?UlVrMHZublREY1MrT2toSkRNdGcyTzVMZ29NTVptWmwvZDdDaEZyUFVpWnpK?=
 =?utf-8?B?YjN4MjVvK0JMZFYxUFgwaXVaV2dDcWxNUUZZMm5hQ0R6R0xVVys1OTMzYjJH?=
 =?utf-8?B?QVNPcUQ1RkdYQ0FHeEo2eFVqMXhIQzA1dTN6K1pPWktuQjBra3dGMjVST213?=
 =?utf-8?B?emQ2QXFVaGdobmpsSk9UcDQ4QzE5UytkaVU3TWU1dXFYNDBXYkUzeGNVZTZL?=
 =?utf-8?B?TjFvWjZBMDdTQ1M4MnY0TDIrVjExZmpjSENWT0lsQ0lVMmpwWXY5cm5jRWVs?=
 =?utf-8?B?RloyQlQrT21uNTRmTXVkRmk2TmZRVDNHaDk2Y0gzS0h6eUp3aVNjdkJKdHNY?=
 =?utf-8?B?V0l0VlZuRTZxd0dXWUp5dEFIclNIQXdVNmJOd0pvcTlrYXNxcWtWNUJTYzNp?=
 =?utf-8?B?dDd1YURIUGJGdVRSWWdxZnpJcjZhcVc1NWMyeEljaUI1T1g0bk9PMDJEc3h5?=
 =?utf-8?B?Vi9wUTZLY1R3QWdhRk9aVlo1R0tpaXNGQzZaQkt1YXNxTkcwalg0L3V2T2Q5?=
 =?utf-8?B?NVlmZFowQTZYODJEazVZZkluVXVzMVlPN2JNaFRaR0NzcTFsUVhnaUtldFlE?=
 =?utf-8?B?bEJYZXlHdmRodXhLQkRVN1NweVo4QmMrOVBMMnJWb0ZsOTlLOWl4T0h5RWlW?=
 =?utf-8?B?eklHRnFPRDY2aWlXSnh4WVdpa0ZQQlhUWUJPVVA1NkpLcy9RU1BmbHozNXls?=
 =?utf-8?B?aHFiUXlnaS9iemUyNHB5ODZsYUdJMkxmUFJzYTIzQktoN1BldUJkOEFZS0N0?=
 =?utf-8?B?SWxnaDNVNUF2RVphM0M1M2JsbGJkTlI4QlBlOVI0d1haTUcvcXBkaXh4NDN2?=
 =?utf-8?B?dDBxR2NDQUZ2Q3M2VzdUcnJpRW9YeGhUNE44UUdiMGo3aGl4WFBWVFRVeEFL?=
 =?utf-8?B?OHJSWHAyR2hBd1FEZExLRXhsL1JNRlNoS29wRU5NaEwrMjJSeGlXQnJSd1Rn?=
 =?utf-8?Q?uniOfNSLukb2y231XsGct8oMf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abea738-5bfd-41b7-b193-08ddb2d7fd7a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 04:31:29.9808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WhVTTVEkj75N8XT7vJCTgaDRCYa9rMUym6mpbTT0Y3B0AI4EcOnihfYocAyBAzf70FmO4W9oQAnwChUQFd6mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8861

On 6/23/2025 11:49 AM, Zihuan Zhang wrote:
> alloc_fair_sched_group() allocates per-CPU cfs_rq[] and se[] arrays
> for a task group. However, if either allocation fails, or a per-CPU
> allocation fails during the loop, the function may leak memory.

alloc_fair_sched_group() is only called by sched_create_group()
which does a sched_free_group() on failure that calls
free_fair_sched_group(). I don't see the memory leak in this scenario.
What am I missing?

> This patch fixes the memory leak by:
> - Using sizeof(*ptr) instead of sizeof(ptr) for correctness.
> - Using the existing free_fair_sched_group() function to clean up
> Note: Calling free_fair_sched_group() unconditionally in the failure
> path is safe, as kfree(NULL) is a no-op in the kernel. This avoids
> duplicating cleanup logic and improves robustness.
> 
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>   kernel/sched/fair.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7a14da5396fb..920174245517 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13372,12 +13372,12 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>   	struct cfs_rq *cfs_rq;>   	int i;
>   
> -	tg->cfs_rq = kcalloc(nr_cpu_ids, sizeof(cfs_rq), GFP_KERNEL);
> +	tg->cfs_rq = kcalloc(nr_cpu_ids, sizeof(*tg->cfs_rq), GFP_KERNEL);
>   	if (!tg->cfs_rq)
>   		goto err;
> -	tg->se = kcalloc(nr_cpu_ids, sizeof(se), GFP_KERNEL);
> +	tg->se = kcalloc(nr_cpu_ids, sizeof(*tg->se), GFP_KERNEL);
>   	if (!tg->se)
> -		goto err;
> +		goto err_free_rq;
>   
>   	tg->shares = NICE_0_LOAD;
>   
> @@ -13387,7 +13387,7 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>   		cfs_rq = kzalloc_node(sizeof(struct cfs_rq),
>   				      GFP_KERNEL, cpu_to_node(i));
>   		if (!cfs_rq)
> -			goto err;
> +			goto err_free_rq;
>   
>   		se = kzalloc_node(sizeof(struct sched_entity_stats),
>   				  GFP_KERNEL, cpu_to_node(i));
> @@ -13402,7 +13402,7 @@ int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
>   	return 1;
>   
>   err_free_rq:
> -	kfree(cfs_rq);

This will actually introducing a memory leak. If allocation of "se"
fails, the "cfs_rq" won't be linked to "tg" and needs to be freed here.

> +	free_fair_sched_group(tg);

free_fair_sched_group() doesn't NULL out the "tg->cfs_rq" and "tg->se"
after freeing them which now introduces double-free via
free_fair_sched_group() on failure in alloc_fair_sched_group().

>   err:
>   	return 0;
>   }

-- 
Thanks and Regards,
Prateek

