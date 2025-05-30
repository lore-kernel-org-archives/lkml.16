Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EDA10F1
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583426; cv=fail; b=KQos4/3u25QyAWxOjVYjy6s7ZtgXm/3N+NfxpmD6vulJKUeu12k2Yw9Ewq6Egd1itf6HehOZhHV7g25QlaP6Ooi7lgnG5Nbv9Qb6c77107PhVK0iaPLAbsF/S2BtmTrBtBEZeB36bflB8dghGTAoI5jwCTuq2D4K7t0wA0SnCVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583426; c=relaxed/simple;
	bh=EHfIONO0OiMo/mmewBnkO21VTy/jVJ8sZlvZ2N+V4g8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=K5bd/4AVuul6UZ8zYWNYSmc+sZn9UXSzvwzbAnm2DSEJtQ/hhjP2W5UHDQ5xm6CZYeApYrjFRzk9P7/+wusarslZJ/S3IcQOLbWUJ2iH+tuT7TJZzCUGO0pTpAl6giQsJ1E7nbsUbwZB8qnExkfeR9fMbpRQNnpMHk1xtiD7584=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ED5JiWaJ; arc=fail smtp.client-ip=40.107.94.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ED5JiWaJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmDgt03H73gQPHxWIZKkFU4zNu7/zsqMuj1rCPvYHxG67Nob+UFsC2qlXMqCYYHhp478I7paRQhhhOVqL4WRX2kE1hxh7C2VYH3OmC7OSP3moeKMJhLX4/mVQYCifEFYB1mKbJiaCyVRL7HHUu2svm5yRGBEyovVgrxOuWTlMqbTFEn48+tVhVAh97x6q1ptDf0xVStyfeSy8zz/RCJNogqEeuSJa+PZcp7ESpdln1iQ5z2PScZ24oFKPZVQBMBVADwOF1V+tjs773H4SuQBrT+0ZoRBJpZr0AH1edtiWRCh2qcdUICdhQNg/7QJieVWaSSWDtj+G/A64r1pdVZjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUse4PnbPPHzwVA4TdeHTQJCPhtT/S4Z6XJp6Ol8oEU=;
 b=o4dQB5nMm23rNOpiRwSn66S1WjKvLTIeGgG7xvjO1E2FQy9iRHFO+/73K1vgA/RbqhzXLtCsPlT33ayfCJ36DznanbXCPf7R2xQ6nM0MUj7+ymwvUJPw6xVLrkIKMXCe7hO1BpyjbpAocSxJT/kbUMNnFIgkdRIqXqdtZYBjaSiTySgcfoOk3Fi9gJZyx4du7c5O3sj130hqQZYHi7zaXtKLxt3aDiz+RkU3FrrwxetFk1rJlRIvOylayTWcMP30a+IVitEda7aOpogDPlGwWwd/Lg5K8imQ8B6/2Qou+ma2IJuuB8Qaf//Vd4WpzoljN+7HcFMlSiqL6bEjuc4GMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUse4PnbPPHzwVA4TdeHTQJCPhtT/S4Z6XJp6Ol8oEU=;
 b=ED5JiWaJoSfNfGCdemcU0FAk5eEO+VbPFMEkdNePPPS5GvP3dsZ8bISesrQIA6DMt/rA3Ta/jBcY3+1n4byJF0odqfIrzRp7M3wpy79dmUgQlDkJRuy9+Djo4tDqlj3SYwezrg5lU4Jy6bCINiGAUVgvczlHA5LPoko7ZGQRQ20=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by CYYPR12MB9013.namprd12.prod.outlook.com (2603:10b6:930:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 30 May
 2025 05:37:01 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8769.022; Fri, 30 May 2025
 05:37:01 +0000
Message-ID: <10df58c2-cb24-4be8-846f-3e708ff04dc9@amd.com>
Date: Fri, 30 May 2025 11:06:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] sched/fair: prepare throttle path for task based
 throttle
To: Aaron Lu <ziqianlu@bytedance.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <vschneid@redhat.com>, Ben Segall
 <bsegall@google.com>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>,
 linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250520104110.3673059-1-ziqianlu@bytedance.com>
 <20250520104110.3673059-3-ziqianlu@bytedance.com>
 <20250522110728.GH39944@noisy.programming.kicks-ass.net>
 <20250523073939.GA1038318@bytedance> <20250529115129.GA541982@bytedance>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250529115129.GA541982@bytedance>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::21) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|CYYPR12MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a182ae5-be31-4a25-e217-08dd9f3c0001
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXFieDlDSTd1T0FXN1ExM29BRmlQd1c5VGNJeGtwenhldWRUNWVVY1U3VWJq?=
 =?utf-8?B?YU9hTm5XdXpCaWxBeUlKUmxaKzhkL3JGRkRMRmpyZHNLek5WWFVwalhrNFdM?=
 =?utf-8?B?Y1pzU2g3dnBJTWNJNXp1cVh3MEI0VlNYbk13SkpreFZ6bGdIcm5WU1o2RnpY?=
 =?utf-8?B?VWxyL2FwSHVxeHNKVlhmdTFYbFVOdzRQVDBCemdFTlN2eHkvWENML0xZNSta?=
 =?utf-8?B?NHRMRlRsSEdwc3Z5Lys5cnlUYnI4VEJVYk51SlJaNkZHOXBIK2tDVTJFRUEw?=
 =?utf-8?B?QWxQYjBkKzFLTFhUMVpENk5mREVMS0VMOXl5UFBPM3E4bEdQVlQ2L05nS1JE?=
 =?utf-8?B?dVBtaFZhekRkMXp3U0NoYlJuMFVrSGlmMURpd0p2Q3JvK0Y5anFMUnIyR3BR?=
 =?utf-8?B?THBBL0RUaTRsWDBYbVF5M1dsTk80YVV2L2VXNEprV2kzOHJDblNtUU90THBD?=
 =?utf-8?B?ck05Wlo2VysvUmJPMTdCMytFdzBCYjJOTjRMV25mMURlRW41NGdIREtOTytr?=
 =?utf-8?B?aTcxK1lIN3NjbnR4NCtKTTVBSGl3REFoZGxTUFRoSmQ2b3dYQlpwcVdSeWgr?=
 =?utf-8?B?dWJ3Y3BaSHUxTTRGZ055SGxlVTBPNFMzRkNraXhtTTFON2RTMUhTb0NwZmUz?=
 =?utf-8?B?aTREaUJ3aitKTTNlRWwvT25LSTJhRkkzR3NFc1JWM0RDLzVMS21FY2VjU1dv?=
 =?utf-8?B?ZFNUbG1HdUdpVllVeVhsNVIzZlZML3FORHFqRGhJL0RoUVhLTG1zYXZwbGRt?=
 =?utf-8?B?MjcxbEh3NE1MeForNHN2Y2FJY3FLK3pHQnFXRUZCNHYwU2FsOEV0NWZOeFI0?=
 =?utf-8?B?OFdYSW9JQXEwTGt6ekVTWlhaRmR3S282VkhoNzlWM1lZZ1RRaHdNejZESUJ4?=
 =?utf-8?B?K3hQYlJkVUxLWnRqaVVJMld5NW5UN0JUUXV6V1h2S3ZvcUErd1dWcEYybWZW?=
 =?utf-8?B?ZGxRZnZUejh4T2c2KzhSUEVnbWZTQmoyUnJ2OUlrRkRPWlVLaGdyWHJtNWVK?=
 =?utf-8?B?U0p6V0I1SjNVenliKzVYU3ExUnNMU1F5WHNwZ0Q3YVQwNWd0d0QxVjJQc1hV?=
 =?utf-8?B?NWc5aGJCVkxxM3FRdXl6TEhrMkJyUHY0TW1MZ0xQelQ2L1FVRWFJclVwTVRH?=
 =?utf-8?B?R0YrVzZmS09JWHhRL1NuMlFrS3lNekREaU1hWkJBazRCUTNFMDRMZWduckw1?=
 =?utf-8?B?UXpDbWpvbjRJSWpncVl5TEFwR2REY3M2UUlpeXkxTDcvYkFobDVYWVZEL1RQ?=
 =?utf-8?B?VldqSkRwenRRZ3dLeFlwVDZkaldBZHFXTmI2UE5GMzQ3b0JiU3NwN0Mzc3Qx?=
 =?utf-8?B?eWlibFRJNFVXT0NPS090MGg4dnJmMUlPYTNsdmpkNE5Qcm1zcDVXUEhtVnFH?=
 =?utf-8?B?L01OYzR6QUhPWTYxbm9rT0d6U3JReUZSZndCTzN6VHVsWG5Kbi9FcWhBNitV?=
 =?utf-8?B?SHZJWHlnK2tRQ2lDNnRjVmVESXNZVFRJR2JuQnYybnpjaW84Ky9LZDUvYU9M?=
 =?utf-8?B?cjE1dEg2ZDcrVVVhNTdZS1k0RXR6MU1oT1h1bXhpNWZ3YUhrckhBS2pxZjRM?=
 =?utf-8?B?ZzBVRmtHdnUwSldoNnlRcVFPYk14dWRDZ2F6YkpGeU44UUt5R1dxdEhucGd3?=
 =?utf-8?B?cEhqeWhqdGJhNStNSVZFaGJGWXFNRFlsV1FSNjBPL0NCc0w0bCtKT0c4U0cx?=
 =?utf-8?B?d08zaHpYL3h0NVd5NHRjMVlkS0FFYTlpaU5ZZ1pQbUY4RkQwQW0yeXl1NFZv?=
 =?utf-8?B?ci9GT2hZODdXK0Z5bFpPdHNwWDhJb1FMcndpaE9wS3ZQdG1qcEs2U2VXQmpQ?=
 =?utf-8?B?UU9lcElJdHB6RjFIY0VOSDVhcnRwMjdwZGRTNDNFMmNYekdWR3QrVUFkWmtZ?=
 =?utf-8?B?SzNFV3E4Mjd0YmtpMUVXTk9hdStveUJ5bVUzVGhuSkt4WmZYVnhkMkJ2OXFh?=
 =?utf-8?Q?hDeGyo7J8Nc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L05yRnJIMnZFc0lwVHk0ekpPSGVGclpGdFAwcEFETVA3aEZVOWlGVDY3ZVY5?=
 =?utf-8?B?TkNoSmk4OEhYZCt0eGxDWUx4NHNRWnZaZnp2QTNEZS9Ibm5qakpSSnZtcDRj?=
 =?utf-8?B?OEcvdWQzZWw1UktrUkxDNHRMN2Q5VFRydXZPN1RidzJLcHhmNzNqN3pRR04w?=
 =?utf-8?B?RFExLzNEUUdqcXFreEhZQjBMUTBCNUdqKytYUks3V1lZZzJKbHZkWS8rblpk?=
 =?utf-8?B?NTQ4TUdLc1JtT3lxbmEyQ1lyNlpDNkxLWHdVVWpXMys1Q2lkOU8ybUZybStG?=
 =?utf-8?B?TXlHZEpacTJqd3RnU3RaWElrZkZ5dXgwK25lQUJCWDR5Qkp2dVdqZG9KWHRp?=
 =?utf-8?B?ME8wV2FERG1ObXVSTk13TVRSUXoyOTg3ekpodTB3cmcxSGl5REd0Nit2STJu?=
 =?utf-8?B?blpuZTN4dkR4aExhSDRxMk43a0prWm5GczVyNEhlRDVnQTZ0aDFMbGkwVlU2?=
 =?utf-8?B?WE1ib3NtOEErcTVEYkpOS25xdTlGMlZDUDNDN0IvVG42VkpNS21CNVp4Z25o?=
 =?utf-8?B?SEF0WVZLMjVrR05ITTRKVmh1b2FrNDR0Z2hjVTl6SlFJZUY3TlAvZ2ZMTlJG?=
 =?utf-8?B?bXdpQThuaDNMa3M2U0dqcUxXeEUrTnZRdUpmUVpRSCtnV1p0SUR2MFQvVmhi?=
 =?utf-8?B?eFRBaHFrU1N0azhpRlhRNUlKYjVEVGRqS1FkVWIxYWZtQWZPWnAxN3FsV0lr?=
 =?utf-8?B?RWNPcWFORmNHRWJTbGZVM0xyTTlHcFF5ZHU4S1dFR2gxRU1VM2hReUJUZDNm?=
 =?utf-8?B?a3MxeEZsQWl5cFdGd1RjNXZ2bmZuZmFGbDBzeFhnMURrLzZMSTV4U21HVENx?=
 =?utf-8?B?V1pPRG1NZ2hjZGkwWjF0NDFVYUtNTUtSWEVNZjN5ZVBnM3pwTHF2UmwzZUh5?=
 =?utf-8?B?RW0reW55UUtmM0FneU5keGljRzVFTmxmbFFtalNzWkpqaklycHNCOUlMamg0?=
 =?utf-8?B?bWlPZnFqOUxLQlBSS0FCWlRWQndSVUJydHZkeGVSajBEb3gyRkpSYkNqL3ZQ?=
 =?utf-8?B?aHY1WUF3RVN2WHVlaWJSaXM2UG41YnRtRE9DNmlyUTNYaVZGZjJmczBuUkhF?=
 =?utf-8?B?SnJScm9Hb3BPNXlmM1JkeitPT0F6amhFZGNDTXZCZXZmRWpzdkdPZFljcjNw?=
 =?utf-8?B?clFaQ2dMSjBTWFFKbUd1WUMwRnpoeDFKRStUZThxdk5tZ2p3VWw2cFIydy9T?=
 =?utf-8?B?TW10MjNkNlNybDFwZ1BVUDdHYWJWMndaQ1c1K0hIWXlUaEJlRWZYdVcxRXFW?=
 =?utf-8?B?MVFSbU1WU0YxT1BaOVhlNWxZblpON2t5YlBVcWRWUFRYMGdqVVo0cEZPVXVj?=
 =?utf-8?B?aC9tZ1lYYXJSdmF4dlZRUVpCcjZxQkQvYXZDQ1NlUHU2bGdWVmFYS3d3QXRY?=
 =?utf-8?B?S1hRc3pyQUd3THU4MFo2dFJNUDJ0c3AxSFpndSs1cjg1MnRCS3lNWTZDSXNi?=
 =?utf-8?B?Zk9pSFpBSmN3azN0R1VoVFRlMEs5QkZnNjZSNkJYNmxMcVV6QlBDclRoajFk?=
 =?utf-8?B?WUJuVjZUa3E0bVoxVmI5aGFDa0VZN015TCtpY0lVM2lQTHB2Mk5JdFc2SWxj?=
 =?utf-8?B?SzlGNk1ScWtjMUxDSEM0cU9YWXZaVWI3Q3FKWUNha2hFYmUwcG83VTVTUkRH?=
 =?utf-8?B?dzBjaDFKakxxU0VJMTd6ZjlSdVU5eUlob1hrS3VrUzZYVEJwVGE3MW5UemNQ?=
 =?utf-8?B?aGExUE8yK3NJLy9UTEZBcURjUzMxRXJRRjQzR2RGUHNCUm9jR1d1MExmbjZS?=
 =?utf-8?B?Z2liczdha2dsaFlnMFRjY28vb3RKMVBTNkpnZVZJSFlhSlZBelZBemp3MUZ3?=
 =?utf-8?B?RHBqMXRocmFFZGkxaS82RGFBMTA2RmhSZXRYVWVTRzRyeTUwYWs2LzUrczZ1?=
 =?utf-8?B?OHNJYm9aZCtnNVRhaDhVU0RUSUxDOVJldmE4MFR6TUxYYlg3RlFiT2w3MkRx?=
 =?utf-8?B?ZC84R2Z6TjdTNU9yVmhSaXNnUGo1ZGJMOTVVMTg0NkpUbGVyeDNCaGl1eVpo?=
 =?utf-8?B?bXRBTExoMEZGQzlvRVMvUUpxd0lQcDZuQkZ1bEZ0ZTBoY2hhcVpONGxVTWhS?=
 =?utf-8?B?bFExalRHTkZBaDBoQ2NuTk1MektwM2RkSmxuTHRveTBNMGpwbzZmUkh3L0hu?=
 =?utf-8?Q?uShovRYZr2HE416BsMSkPARvA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a182ae5-be31-4a25-e217-08dd9f3c0001
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 05:37:01.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QnOIid91BAKk2Pqdhd47Mp6Sh5H8VAekKX5tzg1eiUUYU23VX+wMxYbOdzCBsrKDw1MwlU3N/aoK0wGySoYQOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9013

Hello Aaron,

On 5/29/2025 5:21 PM, Aaron Lu wrote:
> A side note, now that check_cfs_rq_runtime() only marks cfs_rq's
> throttle status and returns a signal, it no longer does dequeuing
> stuffs, I suppose there is no need to call it in put_prev_entity()?

But perhaps it is needed to queue the bandwidth timer via
__assign_cfs_rq_runtime() if the cfs_rq had built up slack when the last
task was dequeued?

Otherwise, the throttle will only be noted at the time of pick and the
timer will only start then but check_cfs_rq_runtime() in
put_prev_entity() and check_enqueue_throttle() could have already
spotted a slack and queued the timer which can ensure bandwidth is
available sooner and reduce latency.

Let me know if I'm terribly mistaken :)

> Because that signal is now only useful in pick time and we always run
> check_cfs_rq_runtime() on every cfs_rq encountered during pick.> 
> Also, check_enqueue_throttle() doesn't look useful either because
> enqueued task will go through pick and we will add a throttle work to it
> if needed. I removed these stuffs and run some tests, didn't notice
> anything wrong yet but perhaps I missed something, comments?
> 
> Best regards,
> Aaron

-- 
Thanks and Regards,
Prateek

