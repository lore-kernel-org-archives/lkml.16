Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C92223DEB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499259; cv=fail; b=tckzQ0spcZMlWCiXmAOioMc4k8Flvcjd7MYWnS6rk0ME5PoxgGxjf1S519rIneebQRzWclwqXgzqsDAsPM8dlNCHWHB1y1oyvwHghpfHZD1U5Q878XqpC14b1DWNJSIGfzZFOAWLAUeAmaUuQmHVdP7rje+GdSI1GlTw0mkNq3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499259; c=relaxed/simple;
	bh=N/fLlbMOlnymzttPE/cC/aKqsB4ro0K+xpIr1RdgxI8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CDaYehjOfGuycUvNWf25ylNHw9e++QeXfRxp7oBrA202YNJcsXYyd3FVoXl4XU3sKrMhg5SaWnuE2J6a5I/lb4cwhunqtEJIQzkLIMSv5FIUSHOzAG7OygUfjL8U/hNPDXxhcHFDKZqyvwR8ll8Hf6LCnHRh+3y8qn7cc1tlFKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vKeWTHR1; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vKeWTHR1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcgDxtRDcoqvlAYLzGyaIsc0JFGsirIFG4DYuwX3ANYwDwOdyjiJ1PNCs1J2368X1XV9zsWYDovVrb9D560uPhUopSTViSMLUJFBYCj2iXjHTpicUnxhK/tCMyHk6CG2qX0qfy+vr/bnjAttS6ia2ogjfO8WWvsxJePls/f/Ykia3erWb+fOa8t0YzRoxyTt5zhKjwK5DmhUWur4okzvbRy7ZfuxbJeqnxENP8rpRYOhvgZ6rJ2rWcuh05BY2h10bxqgIBdaXVX3drI2kS6GMv0PYYUBTTcHnp9SbMyDoLVcEf6457AXLI/UtpvMK4XrKvohZD7HwPzBTNF8A8Gq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFBqEk4rAI6HLoIvzpRUEflnH7Xvf4rkazPXM9R64lI=;
 b=JXF8wBPCw6VSH8wZ4lhI34sLh64WVst3iNk9w/Dj4a7S9GbzAgpdqMS6ohCY35BZzi+9eNXUnz6Z9m9YS2IqU15WtNyWKZiyss0FtxPkCBaKPQES3R/42/ufIdDCJrZzttsmigTdi6nqNMVUXE/stm3GWJHdI4ww5IJ1kKt1HCGEQdHgI1gglsL0uqk3zEDYP069JHe7yMshYl8DSrkQ0e3UxLmwgwdRbTMYyR6VbE9tPXPdwrlaB79ojSoFGCAhYGSR+RsPTf/Kn5jKhddiK4VeM6D2/eVJeFn5XgdcMSsr79enC2l1v8ioA5/JEQ6ggpJB54Pn6xPovRUn8tXJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFBqEk4rAI6HLoIvzpRUEflnH7Xvf4rkazPXM9R64lI=;
 b=vKeWTHR14juJi6KGNA1Hfi1GvyYUdJsvZ5WdRl8OP9aN5T2f0NlI+xAgRZQ7c+f8er5sFiCym8GmcPOjxRVeS7AHt7rCVR18PkwHK5XWCNiR9hn9D1WEcFXCe2Y46j9Z8HxUtITHdA2Wv6nf06jJneqFPfhgFH4l8hPzFcm6aFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by MN0PR12MB6055.namprd12.prod.outlook.com (2603:10b6:208:3cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 12:54:14 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 12:54:14 +0000
Message-ID: <c759d3c3-eeba-4790-9c34-7e9671e94311@amd.com>
Date: Thu, 24 Apr 2025 18:24:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: AMD GPU driver load hitting BUG_ON in sync_global_pgds_l5()
To: Dave Hansen <dave.hansen@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, luto@kernel.org,
 peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, nikunj@amd.com,
 Balbir Singh <balbirs@nvidia.com>, kees@kernel.org, alexander.deucher@amd.com
References: <bae920c0-a0ff-4d85-a37a-6b8518c0ac41@amd.com>
 <19353ca2-11f3-4718-b602-d898ff05ba87@intel.com>
 <83cf7fc7-23e0-46f5-916b-5341a0ab9599@amd.com>
 <2cba2ae9-e29d-4eab-a77a-678be0b09a58@intel.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <2cba2ae9-e29d-4eab-a77a-678be0b09a58@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::13) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|MN0PR12MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: 5792cc52-ef0a-4f45-491c-08dd832f1dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wi9sMGoyN01ZblFlbnl1MEgyc25FeWpwUTZsSm1ldlI3OThYd1NHVEYvaWpZ?=
 =?utf-8?B?UkYzT3hpVjgySWpGS0Nna0dLVUdob3RSbWF2VEtCTFdQZFNXN2pnSS9XcWtD?=
 =?utf-8?B?N0lpbk9XM2NweWE4blFtYzljMmdtSVp4VUc1TjJKcGdPYlZ0UFpqb0Ryck53?=
 =?utf-8?B?ZVVEZXR2eWU3TG53SVczYStyeWk4VndpWHg0eGYyWlFsZTcwQi9iK25zNzlo?=
 =?utf-8?B?dnNjVVVqazNNSUdIUVRyMHFUaUpPVnVaNmxrOXlJc2tjZjQxcndCbStmQzF5?=
 =?utf-8?B?U3ovemptdXg1di9Wc1VhOERzNERNZm9OcjNwbDBYWFIvdnVDYTBrYnpES2VI?=
 =?utf-8?B?SmYyalNOWFg3azFKNGhPaEQxeFA4cVV4T2VXVDdIaEJhVVZ5bUdTNEx5MkNK?=
 =?utf-8?B?Q1JJVXZVYWhVcW1oMDZyTUk4cEtEcG1Sa2c5K1o1UTA2ZFR2MkN6T3ZuZnd4?=
 =?utf-8?B?L3hxWGpnZFczR1FSUk92ZVZ1cGV1SXpWYjhnMzVRYTh3NTBJU2o1RXhkMDJ2?=
 =?utf-8?B?cGpBblNNZHRncG5pZVQvLzBXbWVBVjdwQWFCcjRZYnRkUStqaTcrSHhmTWZB?=
 =?utf-8?B?UDhMU0IvZU81NWU4aGJtcGk3VFVFaUI1TFQrcDhyczB5R3I3dGxuK1ExVyta?=
 =?utf-8?B?WkIySUxxZ0krTldEL0dDcVk4NzVCQk41KzB1SklDUlUvMjFINkJiR0xTZjd1?=
 =?utf-8?B?eGlUR1FId1o4L2lIcnhyNG5KbDNGSEJFeEU5WXFiNjZnd3JVSmZCaVZWQWlo?=
 =?utf-8?B?Ymc3OEM0MXorcE9uNVJ6b2thcHp3cC9GUVFLbHJWSEZub3BTekJxZndjd1lI?=
 =?utf-8?B?Mi9rbTNlZTlvQjFLd1J4Y0MzRDJmQkpDZmhVTkttbngreDlFei9CWWQ3Zmox?=
 =?utf-8?B?M01VWVNBeFdBNEk3dSs0NGVIeDZCRElIWE5ZSXFCcFZDdnEyYTVIMng0MU4w?=
 =?utf-8?B?V1hMcjFDRnVnMWl4YWFORDdjWExDWmZ5QkdIWERMRlhHbzE2ZUJibFRSOUd3?=
 =?utf-8?B?MXVNQS9mL3M3ZEtBQkduRmxIYzJwL3ZCQ25XVFkzUyt2OVEyam5XaSt0RkpI?=
 =?utf-8?B?bHN5Z2g5dmhwc1BHVnpZNCt3dGhJMEV4YmpWcjA2QldSWDNYQTBjN2JXK1NS?=
 =?utf-8?B?Q2V1aGdhSnBabW4yS2RpZlJvL1RXWXM3WHpZais1dmlTeWVWSEg0QkZNdFVo?=
 =?utf-8?B?U0ZURG1OaVRMOUtRN0J0bWo5RS82OHlJNTJFRmJrSDdPc2thZ1dKTkZEaEJU?=
 =?utf-8?B?bFlmcE1QQzVzakltWkRvWFA4Q3FoVU9IUTU0SlpUMm1Rb0pIMEZpcjB1Q3RK?=
 =?utf-8?B?S0R3bGpYaUxObVV1QlFOaW1EWWhUMElDazlIK2J1dmY5UFU3Y2tLTWtDUnBo?=
 =?utf-8?B?UUFDTmZyMmdvYkNWZ0ZleFZCSFdSNDl2Y295M3R2V2VWSjMySjVnenBsNXBw?=
 =?utf-8?B?TG13RDBVS04rd2dsbTFhazRhWHRSWXlRNFhjeHlBYWI5bVQ4ZU1lR2pqT3Rm?=
 =?utf-8?B?WVZGYUFObVVVMWFuOHh5Rjl3ekZTREtIeTA5bXNPZmFRYmhibkNuVHF2VExp?=
 =?utf-8?B?WlE3WjZ3QW92NkxhdnhCcGJLZ2xFSmxUN1BQVUpDRHJkTGMrYitUSlhFVmR1?=
 =?utf-8?B?UjlRNGxkUjNvWEt2OWVzdkFiYTVZTWt1dmFaNzNaSzRQTHdhY3dyd2ovS3Qy?=
 =?utf-8?B?OXpIMnJ0aWw2QU5lSmk0dWlrQVVMWmtMQnZjZkljOGtwQ0ZDZmd1cHFHejdj?=
 =?utf-8?B?eVRSUmQ0V3BQdzNPRFVDbUZQclJTYWtuRmt3MzRWRi8ra3NVVXNzcVdJME9o?=
 =?utf-8?B?Sk5nbTRmcFNIb3JobTREcnYwQk13TEkrTmpGajlwS2NWa2c1NEtBbkRLZjd0?=
 =?utf-8?B?UVJwQlZNR0NQa0NzNWJmQXFxQVdENHJycUNONTh2SEsvYzRJdG5lNnMvcDhu?=
 =?utf-8?Q?/dy9oFkZbLo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnNSak12QkFyamxxY3ZSeDRxZS9EK3ovUjlFaEhDRmhOM0RURzIyVGxEblk3?=
 =?utf-8?B?ZzdncEQrajlzNzVrWVQxNG52ZGNOcnVuaWZDS1d5SjR2aFZtQjJnQ0hpNEpt?=
 =?utf-8?B?cU41MVJUVlVyNjdxUWgyc1IyZzZEVFdJMWNpTi9sSkhjMWNvNHdzMkpzcjNP?=
 =?utf-8?B?cmg0WmE3RlMxbCtyQWE2ZnBRWmFNakhic1VnSjNuOWpTNWZpMmtlK2N5VmdR?=
 =?utf-8?B?cGdSbHliZEl6bEErbG5hZHVjbzE0enpSeWVXNk9mV2xKZElZcjdCZmZKWkZH?=
 =?utf-8?B?YVYrV3VtNUYyYkF6TW5USkZjS01vcTJpM1VGZExQUXN2R0RleGhPNG95bThr?=
 =?utf-8?B?MWtqY21iWDUraldsNkpmdmF5bWdWSzJKNXdORXl6VEp3Q1FnYnU4bmZTYXIz?=
 =?utf-8?B?TUQzZUQ3cThXd3JiZk5wR0R5cCtnUi9oa2Q4MDNXc203eSs3d2d5dUkybjE3?=
 =?utf-8?B?VDF4WmJjeTd2dkozSTUwa1VOWlA0L3h0TXVTTldFbmxXVkJ1V3B3VUk3K0pK?=
 =?utf-8?B?MWQ5L0ljR3MzY0tUblVMVmVIdW92SERmWHR2NjRtcmNQTjRqKzlGeXFxODBH?=
 =?utf-8?B?VFZuM0dJcFkvdTNwRHVqQWpYTVNGdDd0czI1RlhkcjJ0cGVicXZWVTV3bCtC?=
 =?utf-8?B?YzcxMDZSRlhVcDBSNVBUZGI4WTUwVS9uSTJHTktlY1RzWG54T2psaWVza0pD?=
 =?utf-8?B?b2tKb2NicUxCSW5JQW9WRmZmT09XMzQ4eHNSbVd4Nys2clg1SkU5YkJ5bnZa?=
 =?utf-8?B?U3VQeEJReXJSVTNCZnQxbDgvMzRKVUhHaVJGMko1MkI1ampVdFpnN2lyWWRn?=
 =?utf-8?B?MlAvZnI3WUF4ZDB2ZHo0WHdhWEo4RFBCTDVYRUdCSjloaDMvRG4yS0o0WDQr?=
 =?utf-8?B?blc2Ujc5dUpydk5rbVhXMXRYYzg0RnZ2czBqWnhseDgwQnFXa1NJa3JXQjB5?=
 =?utf-8?B?VnlpSGRSeUdJN3JFbCtvMWFtVG5GYTl6TzhkaEtEN045YXdFZVZFdlRPeXJj?=
 =?utf-8?B?UWZJTGJ5ZFB2bDk4N01iZm9yUkoreERwWnJwc1BJenJOUXlXZnN3eEhCcmk4?=
 =?utf-8?B?QnJ1enp4OStBSTZoMVZ1amJicDA4bGZVMFk5VkwwVEJsZzA5TTlVYTlINUFR?=
 =?utf-8?B?b3lJQnNMZmhqd2JzMVhyc3h0RlpYRy8zV01XWGNaNTBjUlpMajFsYW9oQk5P?=
 =?utf-8?B?anBoTU1xK3huWDEvTWZzL1p4dWVmbmVyWUhNODlCeEdjeStEbmNjOCtyMndV?=
 =?utf-8?B?VWV6eUtlNzNuZlpaVk5HZ2xDanA3cGhTa25Temx6U1lhSzVKWGhOOG9rUzM4?=
 =?utf-8?B?aS9NOVVLK0VQZlEwWkZ0MDk1OThjY1ptN1d2R3pCY05pQVpKdWpxQ3czYnNo?=
 =?utf-8?B?Q2M5TTdTLzRXZ3hGeXdqL3VoMFE1cXJZYTZRUzNyUEdQS2hKZ01JRmp3cVVR?=
 =?utf-8?B?Q2xxdTk5MUdCUnY1NGlvNHhHYU55eVNPVWpmaHNuc0p4NnJabWVLR1lBMUN3?=
 =?utf-8?B?b0xGNXJYMjJPbVFPTXJoWmVDam5WbzU0My8yVm4xS01VOEFYVzY1a1llNm9M?=
 =?utf-8?B?b1ZtNWNJY0RBdkxuS2ViL1YycDAyOUtHMEVMNk1QS29ieER2T2cyNExIYWlx?=
 =?utf-8?B?NEZJUnlUaDIyNTRXdlpqVThsSXF5QTBNTmo4V3hIelp6VGthaVc3NWdQTEhs?=
 =?utf-8?B?S3BONzVja1hzdkNvZExlak9zMi8wbzRkR2c4RGxhcHJHU3ZTeWtodWs1MlNJ?=
 =?utf-8?B?bHdIRHRYK1hGb0k3alFMN0tCZDdLeDJFV25XYkVubllvUFVadGhVV0IzK0lB?=
 =?utf-8?B?Vmt6Y29pazRlMEFuSlBQb0tvVjV6VUlKVmgzVkZtQThBZDRZb1ZkYW0yd240?=
 =?utf-8?B?WXdNa2JiaEdYSFhyVk03WTVEZytuZUdPaGRBSFRjcjFYVXFQTDhnYXFjcFFu?=
 =?utf-8?B?SnZDZGhVQWUyYnNKay9GWlVCbXc2OFVpS2ZqYVdwaFRSMzJXOG8vWXVFejdp?=
 =?utf-8?B?Y3FOWmlwQWJGT25xL2NOdmJoTVZxQ2JrdGxVVGRQTUVJWGlqWDZLem85L1dB?=
 =?utf-8?B?ZllsOGlGR1l0cGJzTmR4S1grcWwyS0dsRGhiUmNXbmVmdXM4elZWNUFpWWZn?=
 =?utf-8?Q?LSclLNAwVLDbhKkPN2dOq+HfL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5792cc52-ef0a-4f45-491c-08dd832f1dcf
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 12:54:14.6725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7maSgWFoyiC2kYMVCBFklSWOcid8TNthDdLbJWP15xpcbY+b0+QDYTl3lwRdVBDhQUM6jNyN/bPuHiTldV5xWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6055



On 23-Apr-25 9:31 PM, Dave Hansen wrote:
> On 4/23/25 02:30, Bharata B Rao wrote:
>> On 22-Apr-25 8:43 PM, Dave Hansen wrote:
>>> On 4/21/25 23:34, Bharata B Rao wrote:
>>>> At the outset, it appears that the selection of vmemmap_base doesn't
>>>> seem to consider if there is going to be enough room of accommodating
>>>> future hot plugged pages.
>>>
>>> Is this future hotplug area in the memory map at boot?
>>
>> The KVM guest isn't using any -m maxmem option if that's what you are
>> hinting at.
> 
> How could vmemmap_base consider future hotplug areas if it isn't told
> where they will be?

This is device private memory which means only struct pages need to be 
mapped. What's the way by which kernel will know about the future growth 
in the number of struct pages to accommodate the incoming device private 
memory?

In any case, how can kaslr put vmemmap_base completely out of the range 
earmarked for it in mm.rst?

Regards,
Bharata.



