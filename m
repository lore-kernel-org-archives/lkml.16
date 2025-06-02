Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9957BAD51
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 04:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748839477; cv=fail; b=pHS+2Kz7KVhgxPWY9fuqd+0wrxf2LFQtsrwScD61CcaJeVgyNx/I45O3bcjaMy6kNwuqir4N38I1c55Oi9Vh4KbhHzsNSmQ8Aeog83tmxX9DzGUEUPEICCgBG6e9J3C7YtQQAO5sjwfYRst9dqT73qJpg+kyGcQuBbPAlXqke3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748839477; c=relaxed/simple;
	bh=CjLBGY3671PGeRG8kjL4jilihrbrIeA/KnFDNCCqCDE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L2pa1lEtjDV4D45EGOr2jYhWxwXEM1PHER2zn4CTfAOHfga+9l/Q3AuWgi4bLs/CmZJjg+5WCQ8ldtcVwdXEq0e+bdWgyjIMH1B78Zf4By+BgMsbmwHarYmWdXSmz2ehSelfKyjd82ub25tr22bWTp/iUOi85iSPdjFq9KssSdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vpd0dGLV; arc=fail smtp.client-ip=40.107.96.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vpd0dGLV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJihE83y4re5PawAcCy02E7L8tMr2YVBX+FjvGUWmT3WY/2yWeCdcEl3i7ocm9AHUUnx2sj5DSn1R3oAY4wTHj5yk+idw82la62zcBlouuRzj2Sy5YoOIbYgAi7MAgSSv70TmBpDprMR95qK6clMaDl5Y+G/eRMHzgh+sr85W9JbjvkMapykSrembtUBRbftxaHDsSpXvz9IjT4T9PMWogJr8rksvNLsTKCoNWI9L2nK2wzflhV/rgHzeGy7+t6qfskfaqdg5eas9+Q4JM7gOlZXXNZhXCT9BbCfRd1i5N+VnfeTdi674oCPNkmQRnNoqzrtKnQR8K7JfbISlu/nKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+RWYMcezDynkO/jkES6ZiaJzpXoxjEMK96Z3KSf+4g=;
 b=QI5ZpXdBc+022q1VTT50UuADoSo2TVnlpHgyA/0iKd3eY6WSSt3vRMhP4JZcb8QacqLBDq/7TuBvyB3QRnmRyYevsKDg0W8b1B7AafnlFRCavQu+KmUjb55Yco29DqLfYC2tP5SxIYgEGm0Em6yhpKyfcLqKkf04VV9AfGJIeaPyQe0Jd0JpUYjcyklMT6dAT9yndGt2fadyoWy2EVT/YQLB2OjgMivDhXdHWTJEOlDRz/a6TLDbC6eoEsrgSqlVIgXufRQz7o+iPGIMao9Ch2Z1EcleGWMuBsPOOjnHk767UgCfLI+sV7iUZNWgwnrMdSV+KGjXGKQda/5o1vfVxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+RWYMcezDynkO/jkES6ZiaJzpXoxjEMK96Z3KSf+4g=;
 b=vpd0dGLVUOGjWMbOXKh8qFaMXNc1NH5SeRty5gqu/9AUNmec1CKbr3gwJeHOFeDxsMMRc6kpC4oQgXTRNPMKYAN/7U0plT0GC1qwOurxN+F2NEcAGVW8B6g6XDPHu1+aYdn59wcg8bNpa9JeXi78OpB8RnzQCwXfQP+HBYC/7JQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DS0PR12MB7535.namprd12.prod.outlook.com (2603:10b6:8:13a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Mon, 2 Jun
 2025 04:44:31 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8792.033; Mon, 2 Jun 2025
 04:44:30 +0000
Message-ID: <2bb35bb3-cbe4-460f-a209-1fe4095e1dce@amd.com>
Date: Mon, 2 Jun 2025 10:14:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 0/5] sched: Try and address some recent-ish
 regressions
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
 juri.lelli@redhat.com, vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org, dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
 vschneid@redhat.com, clm@meta.com
References: <20250520094538.086709102@infradead.org>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250520094538.086709102@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::9) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DS0PR12MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a78c389-69ad-4f75-8eb4-08dda190297a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHZEaGN2SXFGU3hYUWFKUnFWTHpjQ0Z6WHhwT21DdEVqekE4eXBOaG5uQlZE?=
 =?utf-8?B?cXNlWWlRWHBUcFdjODJGRExqN1hZZVFpNDAxV2VZYlhQeGNYVUpKS2pvbzFM?=
 =?utf-8?B?QmkyeU9teFNybUY4SVozc0M4d1Q5UGJKUWNXWjQ5SGtFdmszMGFsOE05TmZX?=
 =?utf-8?B?LzN6Y1NIcDZqWVF3MTZLcnFEUVpRUG9pYkFNUXlTd00yNnJob1BkaDBpUFlY?=
 =?utf-8?B?OTdMZW5NYUliTW1WNTF2MENoY1liUytYMzN4WHJUQ21IUHFOaE5abHlkVkdC?=
 =?utf-8?B?bFo2WTgvcEkzSnJDeXMwbmFIN1IyeS9DZVhoQ3M0dEhqenBIT2p3eVpCcWZy?=
 =?utf-8?B?TGp2ZnkvWmhlNGdCOXNwZVhSMzJKU2czajRzYVhWc2dRZEhQYWJWd1Q0RjZu?=
 =?utf-8?B?TjFHaUdvSlJ3VkdyRk1uOXRJYitHY016MHN6WlRUVW5RWGNjdlNyckxHOXBE?=
 =?utf-8?B?dm9sNlMxZms1YSsxUTU5Q0FqbmdqNlo5bitBR1lHdEFKRjRYRUJJTW1GTUhR?=
 =?utf-8?B?aCtZaDMxejQyWFhaOTBROGJmUm5wTStSc0FyQU5WMWlaeWU2M2JyZlozZWIw?=
 =?utf-8?B?TE5aN0tVMlpoQjIxSkNlR1YxWmxUKzF0amloZFhuZWNydDF1MlNwRTZqNHkx?=
 =?utf-8?B?ZkdNWGJzcnZ1S3ZXMFlzLzdwV0VCWlB6R3h6VDhFb0NEOUdsWC9wdm9VZW9h?=
 =?utf-8?B?SEdRbG42QXUyVFFNaG5kN3BHNU9FU2JZam92K0hPZ3Q3SVZkVmhBSTU4RUpF?=
 =?utf-8?B?aExxWWRyWE54VjFMZzNBS3VNd3RzaU1qbFRiMDA1RTZaaGlzQ3VabEtvaDdQ?=
 =?utf-8?B?Z2RJb29Dd1U3bEVmWk9PNURGMXdTelNRMVRNWVhINXdsbU03TFBSZGdDcjJC?=
 =?utf-8?B?dDM5ZkVpbVh1UGgwOUdJUTl1VzVrbVpSR1NSZ3NBbXhhR3ZiYThPczV5RjJp?=
 =?utf-8?B?NVdPV0NGenY3Q003RDBRR3hmc1N1bnBaSGNBK1NoZkNTckZPUlk1amllK3R1?=
 =?utf-8?B?eVAwdk5TOVUrcW10VElwVXVXbWFyOVltN1hnQldEQUo5bG4wUGdBSkFnMkxT?=
 =?utf-8?B?YlBCRVVYVEVWUWVvN2twNDRvQ0pFd3NGdWRhU2EwUzltWFc1NDY2WkFkR25u?=
 =?utf-8?B?R1RSRlVHeEJyVU9IUFY1NTEvek1QYW5TaVFGTXlidlRkT0ZoRGowY1lqV3F5?=
 =?utf-8?B?RURXOC91Q2U5YU16WCsxTEx2ZGZQT0lCczByNFFEOWI5V0Ixdi93NDRGa1B4?=
 =?utf-8?B?cHZvK0VyaXVZNU5NZVFSZ0NjMWtaQmx0c3hSMGNTa05qaUVzZ0xBSUVjdTVX?=
 =?utf-8?B?L2x6blNhVWZKUXg1OS9HVllUbW1FKzUvUWc5VjUvaHl0ak8yUWFnbUovNXI1?=
 =?utf-8?B?Nm54SGt1QTh4N1VlcmRIazBQZFRsZ2FtNk5LT3loaEw2OEh5WFNKeFoyOEM4?=
 =?utf-8?B?NzBtSjlmd0JQUnBSeEl1V2d3dXUyY0thMnNkNlhvT082OUhKNHIwaUhBZG42?=
 =?utf-8?B?SFlVRmROL1dIbExVU24yQm94UjNwMVpCbE8weTVBWndmdmNqTTcxWVdNVTBH?=
 =?utf-8?B?WTYzT0V1MEp1SVBqRzEzV3RKMkNDQkZpckpNWDlTN3BNRTFxcDV5eDdNSHZJ?=
 =?utf-8?B?VjY5L0hwYnFqZjJJaEJXRG5CMjV0VU5ETVRvb3hpZUNkendVN1hlRy9sNkFS?=
 =?utf-8?B?RWxxNUtkczNacEFUc2p6Q1p1bExVVlRUUEhOUWVGeWxRR1ZlVmM4aEROOGEy?=
 =?utf-8?B?VFl2UXNOUnlhYmRvUUgyU21MbklNdTZETElyelZwcE14dG8rMkZmNWtEWUhy?=
 =?utf-8?B?ZFJHcWt3WERNNkxXTVpHNDROOFJCaGpYL0tqS2ErMGRXd1ZaSFkwMTVBV0x1?=
 =?utf-8?B?RzZzR2I4cEpnNGlHVy9tN2g2L0dnKzRpVzR5NS94dUN2cUdhVW5VSHZ5NnhC?=
 =?utf-8?Q?KSTXLEH9bmU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjBzYmhxK29GbzZ1WUhOeEcrVUcxZ04zTVQ3Z0V6SVVGbUI4MlhzR3NUTjN6?=
 =?utf-8?B?TmRqTDdiU25FRkNxVWtxRzNITVkyZHltdEt3bFdyNUVPTmJBbkorZ3d3cXM3?=
 =?utf-8?B?Yy9HT1ZNd29uVlJ0TGxWSXpmak1lZktOeTljMWtweG5rN1JGbGVTQjVDOFdj?=
 =?utf-8?B?ZjEyNkJjUWtEeHdTdFJxUU1uTmxXN1FPZGpOZGpKM2VrRFFVVW9QZUh3S0FT?=
 =?utf-8?B?eCtFRjNiRy85U0c5YmNHc2NzSUg3OERwZHkrbDNocHhOSEY4bU9MaXJlU09W?=
 =?utf-8?B?eVJvZ2JGTmJTanFQa0c4eXMvWUxHZXF4a0hGWlVBcWRIS3BIRjQ3a054RXFN?=
 =?utf-8?B?eTd2ZlhqcytSRWhsaUxhNW82UXlremhtVGw4d3dFVUdUQnFZTWRlTEdSUUFK?=
 =?utf-8?B?SER3em9pOWVSWXJSK05xdVFrU3VEZjQrVUlTRTJmQ0wzRmc1b3RtZ1FPSGJp?=
 =?utf-8?B?NEJGTGU3VWNnL2FQZXF6OVdiNGxuWFlmUWJ2UWlhR3BKMFgybFNiemdxRmNB?=
 =?utf-8?B?ZGNoQ2xPaHhScVBXeXp5VmlvTzl5a2xtMmlFWit3dkpocTB5MGNiY2F0c1ZG?=
 =?utf-8?B?cEVjN0ZUWm54aEIydzVuVW1iVHZWd3IzTzFIeTQ4aFdwSTJ0R1BZMEVTU3JM?=
 =?utf-8?B?UXlFeGRaeE1uN1FCWGFMS280RG9KTE1SeWpsMHQ1bnhzL2QzbjNLQzdkUFEv?=
 =?utf-8?B?WlhWQXdCQ1MwZzBIUUpJcDZXZEZDejcyMW1aeTBEUWF1QldTNG5jT2xIa0I5?=
 =?utf-8?B?MDBxbTZWUjJYUFVVNWtpN01LTFpSU1B1K0s2dmYwempERy9HVUdMN0x4NUM1?=
 =?utf-8?B?aklrNW12eHpIZ0JwdGR4VkNGMDgramRkRU1GaUVPbFpZSERSN1RveXNjMVZE?=
 =?utf-8?B?anZJR0M0WXFoUDk4NU5CQVZiek4vWTVPdUdjOXVRYjhyL0FjV0VRN0ZLTVA2?=
 =?utf-8?B?bnRmd0dQdGFBdEU0Yk9TWHB6M2JtMjRYZHNNTnF6S0I2MzV1Q0dsUkh6dzRz?=
 =?utf-8?B?TlBjY1gwNm5PQkJLa0hjT3kzZlMzcVFsZkF1cDdWS0FZNXlWbzhaTTBHUnZK?=
 =?utf-8?B?Q1I0Z05QYkZ3SndHMzNiRlRvTzY4UUg4RkJpL1UvaVV2MTBjSTJqbktZanVL?=
 =?utf-8?B?MS9NeUlhMWd6Z0RJdHFXcUpxWnlOUVVuOHQ2eCs0cU93d2VZK1g5dDhXc01n?=
 =?utf-8?B?d2h1dUFEcjRGbTFIMTBSU3NwbCtRR3hiMk5IaVlTZUxhaFk3Ty9qd0tPQ0dY?=
 =?utf-8?B?TENpcW1ySVUzY3BocllUQytkbHVpejdzMU8yUjVwcVJWdEN2M3Zzd3l4MHBC?=
 =?utf-8?B?cnk3NGxMRnE1OTczbC9pTGJVNjJ4SEVTMWJ4TVdxeTdGRTNXSmhuRGxaSSs2?=
 =?utf-8?B?Y3NTQmxqNlZXVEtpejlQSUwrUHBxYkIyd3IyUFE5eGpFQTFuYnhSY3F2eFg1?=
 =?utf-8?B?cE5pS29xdVIyV2phZ3VCdXg3NjM5a1NmUkhtQ2VwQ2xJb2tQdk1CTkJVdE83?=
 =?utf-8?B?TmJoa1pKbEdUcW5ycXNCMy82OU1QeFgzUlNVMG9pZ3ZNbFRmMW92YU0wS2dE?=
 =?utf-8?B?elh4VVVacnQwMEFLMDB1bU9JRzY3T2t6OW5SVFJLLzVhKzQ0aDdsb1d5S2ly?=
 =?utf-8?B?QzU1cW0zQlFLeWszcDdNUVE5bGlZaVpKWXgrQlFraGY5V0JkRzZSRitnRHlq?=
 =?utf-8?B?Rkl0N1RhRWVocWpDRThpYkhQTFdUN0RYcGQ0bkVDQjFta1IzR2VuMmV1QklP?=
 =?utf-8?B?dFRPREF3WTlpTDM3Tk9wRDdrR0oxZWgxWm9rc01PblJRQUVFM0Rpc285eEFp?=
 =?utf-8?B?Z3N5c0tpS0xJdEw4eEZYY25ncy9UcE1UOW9PeXlMSjFMZmpzM0I5QXhOQlMy?=
 =?utf-8?B?REVhSXREQ2NnZmZzRnB0ZWNLMlR2ZVorb2pHUDBFaW9FS1VzVm9iUlhFaXh6?=
 =?utf-8?B?WkhBNFBPTDgyVFBIakpZek1tV3RudUVBd2VwTXJJanF6aXMydUx3ZWRTLy9r?=
 =?utf-8?B?TFdHUXdwOW1ZOHQxYWFVdlJqUURDd0dGYldka1dLblNHVEZxbC9oSWtjWmIv?=
 =?utf-8?B?RkxOYnFpdFBqZzV4RmI4WTFYMGZCeXhyUUNPT0p6TFAxSjdLdWROR2NUT3pk?=
 =?utf-8?Q?gCggSy8wGSHpT6HoPmJIwAnr8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a78c389-69ad-4f75-8eb4-08dda190297a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 04:44:30.5725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqmYuTw1/gXBpegU1/n8SBrM1ZlKENZxQMqDJYY0GY9hiD0hbbOCWykesedCtnGVkr20k2uPri+hos72vq/1jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7535

Hello Peter,

On 5/20/2025 3:15 PM, Peter Zijlstra wrote:
> As can be seen, the SPR is much easier to please than the SKL for whatever
> reason. I'm thinking we can make TTWU_QUEUE_DELAYED default on, but I suspect
> TTWU_QUEUE_DEFAULT might be a harder sell -- we'd need to run more than this
> one benchmark.

I haven't tried toggling any of the newly added SCHED_FEAT() yet.
Following are the numbers for the out of the box variant:

tl;dr Minor improvements across the board; no noticeable regressions
except for a few schbench datapoints but they also have a high
run-to-run variance so we should be good.

o Machine details

- 3rd Generation EPYC System
- 2 sockets each with 64C/128T
- NPS1 (Each socket is a NUMA node)
- C2 Disabled (POLL and C1(MWAIT) remained enabled)

o Kernel details

tip:	  tip:sched/core at commit 914873bc7df9 ("Merge tag
           'x86-build-2025-05-25' of
           git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")

ttwu_opt: tip + this series as is

o Benchmark results

     ==================================================================
     Test          : hackbench
     Units         : Normalized time in seconds
     Interpretation: Lower is better
     Statistic     : AMean
     ==================================================================
     Case:           tip[pct imp](CV)       ttwu_opt[pct imp](CV)
      1-groups     1.00 [ -0.00](13.74)     0.92 [  7.68]( 6.04)
      2-groups     1.00 [ -0.00]( 9.58)     1.04 [ -3.56]( 4.96)
      4-groups     1.00 [ -0.00]( 2.10)     1.01 [ -1.30]( 2.27)
      8-groups     1.00 [ -0.00]( 1.51)     0.99 [  1.26]( 1.70)
     16-groups     1.00 [ -0.00]( 1.10)     0.97 [  3.01]( 1.62)


     ==================================================================
     Test          : tbench
     Units         : Normalized throughput
     Interpretation: Higher is better
     Statistic     : AMean
     ==================================================================
     Clients:    tip[pct imp](CV)       ttwu_opt[pct imp](CV)
         1     1.00 [  0.00]( 0.82)     1.04 [  4.33]( 1.84)
         2     1.00 [  0.00]( 1.13)     1.06 [  5.52]( 1.04)
         4     1.00 [  0.00]( 1.12)     1.05 [  5.41]( 0.53)
         8     1.00 [  0.00]( 0.93)     1.06 [  5.72]( 0.47)
        16     1.00 [  0.00]( 0.38)     1.07 [  6.99]( 0.50)
        32     1.00 [  0.00]( 0.66)     1.05 [  4.68]( 1.79)
        64     1.00 [  0.00]( 1.18)     1.06 [  5.53]( 0.37)
       128     1.00 [  0.00]( 1.12)     1.06 [  5.52]( 0.13)
       256     1.00 [  0.00]( 0.42)     0.99 [ -0.83]( 1.01)
       512     1.00 [  0.00]( 0.14)     1.01 [  1.06]( 0.13)
      1024     1.00 [  0.00]( 0.26)     1.02 [  1.82]( 0.41)


     ==================================================================
     Test          : stream-10
     Units         : Normalized Bandwidth, MB/s
     Interpretation: Higher is better
     Statistic     : HMean
     ==================================================================
     Test:       tip[pct imp](CV)       ttwu_opt[pct imp](CV)
      Copy     1.00 [  0.00]( 8.37)     0.97 [ -2.79]( 9.17)
     Scale     1.00 [  0.00]( 2.85)     1.00 [  0.12]( 2.91)
       Add     1.00 [  0.00]( 3.39)     0.98 [ -2.36]( 4.85)
     Triad     1.00 [  0.00]( 6.39)     1.01 [  1.45]( 8.42)


     ==================================================================
     Test          : stream-100
     Units         : Normalized Bandwidth, MB/s
     Interpretation: Higher is better
     Statistic     : HMean
     ==================================================================
     Test:       tip[pct imp](CV)       ttwu_opt[pct imp](CV)
      Copy     1.00 [  0.00]( 3.91)     0.98 [ -1.84]( 2.07)
     Scale     1.00 [  0.00]( 4.34)     0.96 [ -3.80]( 6.38)
       Add     1.00 [  0.00]( 4.14)     0.97 [ -3.04]( 6.31)
     Triad     1.00 [  0.00]( 1.00)     0.98 [ -2.36]( 2.60)


     ==================================================================
     Test          : netperf
     Units         : Normalized Througput
     Interpretation: Higher is better
     Statistic     : AMean
     ==================================================================
     Clients:         tip[pct imp](CV)       ttwu_opt[pct imp](CV)
      1-clients     1.00 [  0.00]( 0.41)     1.06 [  5.63]( 1.17)
      2-clients     1.00 [  0.00]( 0.58)     1.06 [  6.25]( 0.85)
      4-clients     1.00 [  0.00]( 0.35)     1.06 [  5.59]( 0.49)
      8-clients     1.00 [  0.00]( 0.48)     1.06 [  5.76]( 0.81)
     16-clients     1.00 [  0.00]( 0.66)     1.06 [  5.95]( 0.69)
     32-clients     1.00 [  0.00]( 1.15)     1.06 [  5.84]( 1.34)
     64-clients     1.00 [  0.00]( 1.38)     1.05 [  5.20]( 1.50)
     128-clients    1.00 [  0.00]( 0.87)     1.04 [  4.39]( 1.03)
     256-clients    1.00 [  0.00]( 5.36)     1.00 [  0.10]( 3.48)
     512-clients    1.00 [  0.00](54.39)     0.98 [ -1.93](52.45)


     ==================================================================
     Test          : schbench
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)       ttwu_opt[pct imp](CV)
       1     1.00 [ -0.00]( 8.54)     0.89 [ 10.87](35.39)
       2     1.00 [ -0.00]( 1.15)     0.88 [ 12.00]( 4.55)
       4     1.00 [ -0.00](13.46)     0.96 [  4.17](10.60)
       8     1.00 [ -0.00]( 7.14)     0.84 [ 15.79]( 8.44)
      16     1.00 [ -0.00]( 3.49)     1.08 [ -8.47]( 4.69)
      32     1.00 [ -0.00]( 1.06)     1.10 [ -9.57]( 2.91)
      64     1.00 [ -0.00]( 5.48)     1.25 [-25.00]( 5.36)
     128     1.00 [ -0.00](10.45)     1.18 [-17.99](12.54)
     256     1.00 [ -0.00](31.14)     1.28 [-27.79](17.66)
     512     1.00 [ -0.00]( 1.52)     1.01 [ -0.51]( 2.78)


     ==================================================================
     Test          : new-schbench-requests-per-second
     Units         : Normalized Requests per second
     Interpretation: Higher is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)       ttwu_opt[pct imp](CV)
       1     1.00 [  0.00]( 1.07)     1.00 [  0.29]( 0.00)
       2     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.15)
       4     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.15)
       8     1.00 [  0.00]( 0.15)     1.00 [  0.00]( 0.15)
      16     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)
      32     1.00 [  0.00]( 3.41)     0.99 [ -0.95]( 2.06)
      64     1.00 [  0.00]( 1.05)     0.92 [ -7.58]( 9.01)
     128     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)
     256     1.00 [  0.00]( 0.72)     1.00 [ -0.31]( 0.42)
     512     1.00 [  0.00]( 0.57)     1.00 [  0.00]( 0.45)


     ==================================================================
     Test          : new-schbench-wakeup-latency
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)       ttwu_opt[pct imp](CV)
       1     1.00 [ -0.00]( 9.11)     0.75 [ 25.00](11.08)
       2     1.00 [ -0.00]( 0.00)     1.00 [ -0.00]( 3.78)
       4     1.00 [ -0.00]( 3.78)     0.93 [  7.14]( 3.87)
       8     1.00 [ -0.00]( 0.00)     1.08 [ -8.33](12.91)
      16     1.00 [ -0.00]( 7.56)     0.92 [  7.69](11.71)
      32     1.00 [ -0.00](15.11)     1.07 [ -6.67]( 3.30)
      64     1.00 [ -0.00]( 9.63)     1.00 [ -0.00]( 8.15)
     128     1.00 [ -0.00]( 4.86)     0.89 [ 11.06]( 7.83)
     256     1.00 [ -0.00]( 2.34)     1.00 [  0.20]( 0.10)
     512     1.00 [ -0.00]( 0.40)     1.00 [  0.38]( 0.20)


     ==================================================================
     Test          : new-schbench-request-latency
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)       ttwu_opt[pct imp](CV)
       1     1.00 [ -0.00]( 2.73)     0.98 [  2.08]( 1.04)
       2     1.00 [ -0.00]( 0.87)     1.05 [ -5.40]( 3.10)
       4     1.00 [ -0.00]( 1.21)     0.99 [  0.54]( 1.27)
       8     1.00 [ -0.00]( 0.27)     0.99 [  0.79]( 2.14)
      16     1.00 [ -0.00]( 4.04)     1.01 [ -0.53]( 0.55)
      32     1.00 [ -0.00]( 7.35)     1.10 [ -9.97](21.10)
      64     1.00 [ -0.00]( 3.54)     1.03 [ -2.89]( 1.55)
     128     1.00 [ -0.00]( 0.37)     0.99 [  0.62]( 0.00)
     256     1.00 [ -0.00]( 9.57)     0.92 [  8.36]( 2.22)
     512     1.00 [ -0.00]( 1.82)     1.01 [ -1.23]( 0.94)


     ==================================================================
     Test          : Various longer running benchmarks
     Units         : %diff in throughput reported
     Interpretation: Higher is better
     Statistic     : Median
     ==================================================================
     Benchmarks:                 %diff
     ycsb-cassandra              -0.05%
     ycsb-mongodb                -0.80%

     deathstarbench-1x            2.44%
     deathstarbench-2x            5.47%
     deathstarbench-3x            0.36%
     deathstarbench-6x            1.14%

     hammerdb+mysql 16VU          1.08%
     hammerdb+mysql 64VU         -0.43%

> 
> Anyway, the patches are stable (finally!, I hope, knock on wood) but in a
> somewhat rough state. At the very least the last patch is missing ttwu_stat(),
> still need to figure out how to account it ;-)
> 

Since TTWU_QUEUE_DELAYED is off by defaults, feel free to include:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

if you are planning on retaining the current defaults for the
SCHED_FEATs. I'll get back with numbers for TTWU_QUEUE_DELAYED and
TTWU_QUEUE_DEFAULT soon.

-- 
Thanks and Regards,
Prateek

