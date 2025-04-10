Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7141C5D62
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299477; cv=fail; b=oFitFzBu69YWPaRR0EG1pJC4P8DakeC2Z+pCinf1l/ymUfRN4o9687ZwF0wTa0CyL+NqOrap0uc758AXlMY79h5qNJRmxqvQKo3aMYczZjufNodXpakgD7AavUw9T1FD52KSOcyGiikDxHQZlx+N1S7PEOsmn9JLQ3NX9bNBgw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299477; c=relaxed/simple;
	bh=YgWv6VHAXtss8sXlLUO2N/+fl/y6gWAkwXdHdV1CQI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aJ21iG14Io+r/iIfJVHXrhu3RVy6unpbfHOAFIUhWm/odEpTAQDh9CnYpV6V6M8GPuXVj5UMmt1M3tig1+IJZz60frGjGrSyPWp3hJ/NqadgxBmUW7iRLxU1eAH6xJu3d4n2KuqRIRA7ciwijMKN5LHQKcSYciiS5U4y+NyX5J0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T/TUPPie; arc=fail smtp.client-ip=40.107.92.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T/TUPPie"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sjw7a61B/Eo3eFZkwSZzzaTutWXuIsNNyw1EHJWHBBMAspwtrriC3XVc44I3ljELOBFrEvODRYDlA+bmdXYfOKqXYT6w0K8mR1fuzt87rakH2WN8HdVzt2B+HA+//bumLkWqVNs52eOK7p0VRJMXqJ4kGjSVHdLmq7UgGC5eCv+eQfnU3gPWCLaSUejt62obOU17XBIYbs5Jip1ZK8Fg8RoT5mLxJYzK0uhGb29LUN7DdJrYp7rIO4ijJ3DEpFQf8TViOzbe3eOZCYGdp39FhIoRXFhCEd8Fav/VqF3AhlleAuNGqmTPIBVfUB2JNzwW5g8hK4SHD9Vd5q8l15KO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fFniaR8OO0wsk8IAzdzBg8vmW9fWibtMwWnGXqi0W0=;
 b=qFUZfPxewbI/GjxOhFHsCb845wVjnz8vdkl/xIWiP2rbLEmKw5YrIu5B8ggGuoiwHZsfHqfu0gGATFILhs7sqfhrbKrENn5YcTrQeQp89GgAroTrWQoAPt1/25kFBw67j3d856ISGD9DvpHJY2W7OMWIsK23GAovR7EQ1MqOMN8sbbYbu0PizxD7oh7zlw+p4fadAH5ivAPUrt8jdlP1UT4C7Sez87nGVX/fAprTAOEZX5O01zccJIQxAvSYFqxVxfMKrguMA8Xx/6TRPPWMaVc1MrrbfiXk8Eg3yy2d81EFpmMBu1jtdmeKToipVPWlm725xz/frUZZ3DNavFibvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fFniaR8OO0wsk8IAzdzBg8vmW9fWibtMwWnGXqi0W0=;
 b=T/TUPPieZL0LgnuWxnz3wV4bXgOenqN/GWx5IqdjuRYbBOJXmau/I0004oiRwv0AXWawh5gL45tXKg2h9gkpEHd2fmvvwNVmLg4MvC2CJ1ZdQkS/O7so//uL64fSIFhXcZfuGRBO/XDvqcYKL7o1lWtcDBw383lcYN3TAYWhR6w=
Received: from SA9PR13CA0038.namprd13.prod.outlook.com (2603:10b6:806:22::13)
 by DM4PR12MB5722.namprd12.prod.outlook.com (2603:10b6:8:5d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 15:37:50 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:22:cafe::7c) by SA9PR13CA0038.outlook.office365.com
 (2603:10b6:806:22::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.8 via Frontend Transport; Thu,
 10 Apr 2025 15:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 15:37:49 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 10:37:46 -0500
Message-ID: <96d7c406-95dc-43a2-9daf-819b78979c75@amd.com>
Date: Thu, 10 Apr 2025 21:07:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] sched/fair: Proactive idle balance using push
 mechanism
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-6-kprateek.nayak@amd.com>
 <20250410102945.GD30687@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250410102945.GD30687@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|DM4PR12MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 93501ddb-976a-4db2-877f-08dd7845a691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1c0OXcrYS9Zek1pRE9iNjJOMkhDcjhmR0dQbEZTNk0xNEo2cGJHQ21vT3I2?=
 =?utf-8?B?SXo0aStackhTcGU4K1ZJUElBZGNhbkh4ZnQveVM1M0xGVXpPNUZCZmhZbzhv?=
 =?utf-8?B?YXRUUm1NQ0FoQ3NvZXhDL2MycFpqSGp2eUdpZ0l0NTViSTg2SVRjSkw2WHpE?=
 =?utf-8?B?bW1TdWdoRGpidUlUQXRQUGo2azZwak5yRjJhcUg3NFlWVUs1eXNZQXB3RkZS?=
 =?utf-8?B?UjNUdnBtdFRIRzJRQ0xrRFB4NTA0bWRyWTFBcUZ0Um9COHE0ZXlwNGpLZXl1?=
 =?utf-8?B?WHpidHJiZXhNd3NObHRRVGZyNVg3QUZUcXJsL1pMeWcrdlBOL1ZQdDdhZ2lF?=
 =?utf-8?B?WVpQUTk1T3QxaTdzMENBeG9WejFjWVhnTmtJWVBRMmpnK0xvS0hjcDQyRm1r?=
 =?utf-8?B?OFlRRXJlTjhFWS9wSS9Fc0lGN1ZEbG9LRlFTYldRUlJ1alkxS2p5ak9TS1d3?=
 =?utf-8?B?c3dXekdOZFRrOTlDU1NBcnlDKzVEWEczckx1d245bGE3MGZUK04wS2F0N1JF?=
 =?utf-8?B?bFk4YVhHODRnYjJmMHFRYVlYcnhZaTFHdkVVTVVVQTVOSUdobEFsSjM4dFZk?=
 =?utf-8?B?bE1YRHI4cG0yd1k4N3dNaVhYcG9Fd1BLODZWRVo5YlVIUDBjakNMVjBxYnN1?=
 =?utf-8?B?ZWs2anFMOG9mcGF4MllzNDhwbmtSSVRRdkRzSVJITWZ2ZUpQTkxUcTRoN3Ur?=
 =?utf-8?B?SVRDRlFpUGVHMzZIeEhDdC9GZVVDQjE5am9YWTFqNytzZHFMVmF6MzNzS2Ew?=
 =?utf-8?B?eDRwcU9YRks2TElUZWxRUWZ5bDVZVHg1S2tpblZ1b01MeU9Xc1EvVnZEZXJI?=
 =?utf-8?B?QW9YQUxLSE8vYWtaSVFSUUxnSyt1bEo0a1ZiZjBabGhhaHdhOEVvcDEwN1o5?=
 =?utf-8?B?MGhONlZ1L09yMmRLY3FkT2U1a2w5cDEvTCszU2U5MzcrMXkwcll2TWVZdWx6?=
 =?utf-8?B?dFpsRCs3MDRPdkRIZG9MQ3RnYS8xWWtoMU9vSlpIdW1Fb1JQYjZsaklYQVB4?=
 =?utf-8?B?TGpCSTFwUmdSMU9pUkY2YUtrNW5obHlIRllOd3FzMVJ3aDdrWVVtOHlZOWNK?=
 =?utf-8?B?SXo5eDJQQjNwQlFtSjlzSTE3a0IwSHFVU3ZkdDE3ck5CdHk1VCtaY2JuRytZ?=
 =?utf-8?B?M1BiSG94SjFsb0VOa0NYK0pxczRtT29Wd21vUWNJU21ZaW00K1hGM241eEt0?=
 =?utf-8?B?eHZRTXBkTnZIZGZ1anl3UUVib1NuV3Mxa1VLaWIzSnVPNnkyTkJiV21VSFFG?=
 =?utf-8?B?alREd0NDY2FCN21ZQUV5SjJQQ1RReWJrR2crVVdlbDlaRVVSOHl0NVpvbi9S?=
 =?utf-8?B?S2JSWk9PZ0g3V3pJYjFDeXEwNW5PV0hDS1FkK3labEFHNFAvN3pneVlzeThl?=
 =?utf-8?B?RXhFdUY3dEEzQ1BoUkZQUzdJRzB0MTVoZXhndDB2by93WFNLMTYxS2pvczQr?=
 =?utf-8?B?T1FIUU9ydEEyZzh2VmNGYm9iY1QyY3liVEtIZE5lT3AzVjZTVytVdTU2UkRT?=
 =?utf-8?B?OEtFbnJOcjdGU09nZFFDUHNmVjdpK1grM1ZpY1d0bVIybEs5eW43STh0QXhz?=
 =?utf-8?B?dlJEL3dQOUpVNnVXS3ZoUDZGaW42bGhZemFiM1ZkQUZtbDNjamkwZ3dmRWVt?=
 =?utf-8?B?MFZzOW03VWJHUGFGSW9vUGtQaDhac0Z1M3dMRjhVdjlwNjlvbnYzQWtPczdz?=
 =?utf-8?B?am1zaHFYMGVvUThpZUt5ZTFwc2Y1MCtzcTcxbFQzYUF5K2pMeGVFTjQ2bDN1?=
 =?utf-8?B?U09VTmpyM0hPajE0ZHJrWjZQblFBZXpsOTVlREUxZ2N2eXNGdmZjbkRWWEhZ?=
 =?utf-8?B?RkRHTnc2WFpaZXdhS1A5MDhDbk81T3h1b3N1SWJKa0dqaWxRK0I1TU9tdmZT?=
 =?utf-8?B?a3N3WE93UkZ6TitOWWRSSUZicTBZU2Qwb2tQak9mY2ZHRVpvNThIbUlIZUxG?=
 =?utf-8?B?MmZNZ0pSeTVxd2ZnL0ZyOVp0cndKeUozUkgxcmZhTGk2KzlvMTZ6bmJvOFla?=
 =?utf-8?Q?MRrR5L3SQvxtlpRHbKdEhRyxpfxxPY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:37:49.8485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93501ddb-976a-4db2-877f-08dd7845a691
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5722

On 4/10/2025 3:59 PM, Peter Zijlstra wrote:

[..snip..]

>>   /*
>>    * See if the non running fair tasks on this rq can be sent on other CPUs
>>    * that fits better with their profile.
>>    */
>>   static bool push_fair_task(struct rq *rq)
>>   {
>> +	struct cpumask *cpus = this_cpu_cpumask_var_ptr(load_balance_mask);
>> +	struct task_struct *p = pick_next_pushable_fair_task(rq);
>> +	int cpu, this_cpu = cpu_of(rq);
>> +
>> +	if (!p)
>> +		return false;
>> +
>> +	if (!cpumask_and(cpus, nohz.idle_cpus_mask, housekeeping_cpumask(HK_TYPE_KERNEL_NOISE)))
>> +		goto requeue;
> 
> So I think the main goal here should be to get rid of the whole single
> nohz balancing thing.
> 
> This global state/mask has been shown to be a problem over and over again.
> 
> Ideally we keep a nohz idle mask per LLC (right next to the overload
> mask you introduced earlier), along with a bit in the sched_domain tree
> upwards of that to indicate a particular llc/ node / distance-group has
> nohz idle.
> 
> Then if the topmost domain has the bit set it means there are nohz cpus
> to be found, and we can (slowly) iterate the domain tree up from
> overloaded LLC to push tasks around.

I'll to through fair.c to understand all the usecases of
"nohz.idle_cpus_mask" and then start with this bit for v2 to see if that
blows up in some way. I'll be back shortly.

> 
> Anyway, yes, you gotta start somewhere :-)

Thanks a ton for the initial review. I'll go analyze more to see what
bits are making benchmarks go sad.

-- 
Thanks and Regards,
Prateek

