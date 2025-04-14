Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B4E571
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744600401; cv=fail; b=HeD6EExHeuWW8mg8iwg3uCJiS4lN65SwBcebuoPxoep3Aaf3z3jg7N2+1l8sCTkvd3bGHOPnhZQYK+W//bqfEbt0Am2OD0wPDz8iDYZPQYmHCmtbLjIqvwvZlchmD2aL3FJyHtVDefyEFNzkrtNmd4qNLtGvBiyjLBpVCuqbneo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744600401; c=relaxed/simple;
	bh=IqWqTsywpp9yPlvx+PwoaBkuqjoyHieA0f8UfzCE+YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tHwSxKpsIhdaP8c3crJf8IueqLCWUyiZ27cAWqsxR+UZlnXtDIW0OvYLo+NnpIsh4a7WOVsAd7aYM44M3xoEAKtXiJAHa8R4lXp2a9rCBDs+wlZu5ID41gSmfsKOHyVcYwKtIZcaohRhsKzDYMMayrYtDkL+FLwMUQq3KqP+lOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kW83BjPL; arc=fail smtp.client-ip=40.107.92.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kW83BjPL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uGqZZKnD3Ra4N5yXYoYpTHsdAmlaq5gzQk7a3KtOMIlXv2pkMwuJyxql8iy5zFgnQqnjVejzexe8glbPkmobdLuS8pn1VAnnMdryv0NGk3S0ckcDVe1UgrRn2f2G/XzgiB7V9G0qtZICc46xuHpVizD+4ir81XRyuZriCB56tZ01lIpCgs4yYD+k7mtlGYXpYRGHO8pkb4JrpyH9/5xqFsJFyDqYVNfmRV8yekCtnthtAHvuArTdlFd76rfbTttt2L6cmCYDTJybluZe6SyiBZk9k31/wcZeuxXoqHt0SMNxx54u2vbBBMHxIn8/PRrtc2Tb+aUfXhiZqbkj+eJKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haryoVN7pJepGxCjqGp0I2LmVYeahDA/RE92nZJIHno=;
 b=GnaADy0WOktfSZoQyi2AW/6poMHtqXmwCRaqBxsBj68ax2Q/Rg6EYdJ6Wj73+V95UZ5QEV970ZbuuitJ7uQEE4Wwh934QtIseOn5wb0mDAP8BJ+SqrQQkGgKgdc+YCgGGTx6j1qaOjHQuKyyCidLI1eaywwURZL2bfBZrQ0QxSyfgTSEcAlqSPOMXjq2OcH/x07/Y6a46aQyql/HjFrjhlV+xLpqS6VUG/FmlEOcLk3i2NeumLAqpn+YlaVy5P4K7Q58/ibfvB4PoDdgZJKJ/5+lCbrmSTCUhQAhpEH0eFXu5P8KGOIzBOrnpRA3QFsAaPuGtH99zGL2MSPJD4wZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bytedance.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haryoVN7pJepGxCjqGp0I2LmVYeahDA/RE92nZJIHno=;
 b=kW83BjPLCb4NB2vtgNP+Rl4FjI+sZhPQqFL2//ysX1JU3f4i+kGfQCk5WxXTYRjitiXnLHiucB4h796HUwDM8xfTIM4KB9891JhdxtilHYnGBVJWpbIbFHPtdR0sCDDMJjk55z3rCZRTrjS1kH2JMd/aH8C4l8m0HmiueYYGuBs=
Received: from SA0PR11CA0120.namprd11.prod.outlook.com (2603:10b6:806:d1::35)
 by IA0PR12MB9009.namprd12.prod.outlook.com (2603:10b6:208:48f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Mon, 14 Apr
 2025 03:13:13 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::ac) by SA0PR11CA0120.outlook.office365.com
 (2603:10b6:806:d1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 03:13:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 03:13:12 +0000
Received: from [10.85.36.22] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 13 Apr
 2025 22:13:08 -0500
Message-ID: <30a82975-a6a0-435e-8574-b570386cd6f0@amd.com>
Date: Mon, 14 Apr 2025 08:43:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/5] sched/fair: Update overloaded mask in presence of
 pushable task
To: Aaron Lu <ziqianlu@bytedance.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>, "Dietmar
 Eggemann" <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, "Gautham R. Shenoy"
	<gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-4-kprateek.nayak@amd.com>
 <20250414022859.GA3326447@bytedance>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250414022859.GA3326447@bytedance>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|IA0PR12MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: dfe2a04b-4f82-44c4-e718-08dd7b024a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0E4L3FxcTB1MThyVldPazRxVTJUdWRFMVljZEN3bWNIY0xZVDBHNkEzTEdI?=
 =?utf-8?B?cFNxUk91TmlxUlZUNXlUT1BTT3hLTnJzblZJakNYRVNFdWRUdGs2bUloTXUy?=
 =?utf-8?B?R3Zxc3N5WnE4Q0NibDFNOHFubmE2TWxqcCs0QWRXTTZqU2FwMUpqeExaczdZ?=
 =?utf-8?B?R1NTWVpYTlh5UjdlTk84a3V3REJGei9mdHZiWDJSZHV1SC94UTF0TEdtdWlt?=
 =?utf-8?B?WGVsdUZuYTBUeVp3Y0VZN3YvYk9NWUdZWFlBanUwSUdHUDBQSU0wcDFYaUdy?=
 =?utf-8?B?S0h6U3liYXRxaDdUMUNJUmpFZ2puUVJCRS9DWEYrSERJNGsxYTBPZnZubTZh?=
 =?utf-8?B?UWNtaldzWUNNSWp6aXlNc2NuS3I5OGdhYngwQ01HcGNrbUVITHhhOFlOL0pz?=
 =?utf-8?B?MWJDaUpSVjgvRFZEZ1hDeE5HdFhoWjBsQTd5KzRuYU9PUy9KMWVYcUNmVnZE?=
 =?utf-8?B?RXlUUHJiWFNuNXBVWjJENHlJSFZ6ZVM0ZjJQV3JZZ05IS0pXZkdYNXFtNzg4?=
 =?utf-8?B?V3lSYkkxcHViajQwY25BZ0h1cDdTc3l3QUFFbWdZa3d0SWNxLzY5UWxNOHln?=
 =?utf-8?B?bXpyTVZ3cUs0ZUJJYjliVHhhemptZFNGd21OQ1RxS3BWVGluUmtFWmU4djRj?=
 =?utf-8?B?YkNvSVdlKzdlSFo5VG10VVdBSmVqaHVmdDhabHdhdjlyOEtiN09CY2FRem9S?=
 =?utf-8?B?dDZabG9va2RzWHZWdk1xUzV1dlowQVMrd3RCYVh5THJDN3JjcXZxb3pGOFpE?=
 =?utf-8?B?QWhmY214ZC9uTjFpZVhPOWMrcDFSd2w5Zi9DczM1SU1Gb3V3OU5weWJpSWxs?=
 =?utf-8?B?OEpHOFdwVWpBY2g5UnRMMEpGSEp0RmNoY3hvREtxOE5IeWY3Y2JUNkhrVFlS?=
 =?utf-8?B?QVVUQ0luU1ZrWjZ1UjhUL2ppMlNmN1E0KzlZdDV3aHNYYm5vWkxpK3JqWDBv?=
 =?utf-8?B?NnQrbDloQkRBaGNnTkJsejJ6V2NXZ0xMbUpNRXAzOHdHZDQ5dWROS0VPei9L?=
 =?utf-8?B?VmF5YkhFYUF0c3liajM2WUNZbWs1ZHJTTUh0NUV0bGVOS29hVHJaYnh4UDFD?=
 =?utf-8?B?QzNQbk5jeVVza1ZUcThiQS8reUtmcmRwSlZjQ1hZQ3A0KzNLd2JNekNHeVJ4?=
 =?utf-8?B?ZjdYWmQyNFlxOVkrSGp4TEFZRzMxdmtkV21seWdId3ExNWZ6ODhBb3R5YWdT?=
 =?utf-8?B?RlZkbmhESXArT1QrQjdtMkdSU25QV04rSm5heGpob1E4ZDI1UFM3c0VIOE1H?=
 =?utf-8?B?V0ZycWZlUEZ5L1FDVzZoNWpJZzZoWnNtbk1yVVFiU3V2bmxGc2pRU2xiRnJB?=
 =?utf-8?B?ZDFtWG1reDlwcW1PTDluelZqdHE1VzMvblkwYXh2WG1ZUVFhZkp0cXNmdUsw?=
 =?utf-8?B?YXpVNEJ5YmQ5dWZMbzI0SkZNQ0pVa1JHRjI1TU9qWDB4eWJpbVFGQnYrdDFs?=
 =?utf-8?B?M1F1MitIUVNCUFRFUHgyYUFJcXVlN2FiNTBmM3c4Smp6L1FBaVlQSTVzd0ww?=
 =?utf-8?B?NFFiVGtsUVN6VTBhZW9FMGQ4Zjgwb1BuLzQ5dEYzY2tmTmZscWlHR2U1MzRw?=
 =?utf-8?B?MWtpbzBCVThGUmpsY3NvRHlUTjIySHAvS1BCMHZuZTNscytGQVVPcGJvZENO?=
 =?utf-8?B?cC9oQ1MvdlU4NDFiaml6Ym1JVUQ4L29BdjhaR084ZmhVZWZiek1wRTRZZkg1?=
 =?utf-8?B?OWpzZEozQWp6OStNdzQ3aW9TMzlBSWd5TmNVa3JvajhpYkYxdE95bTRhUFB1?=
 =?utf-8?B?OWpmY2tBQm1CUnBQeGFITDNRd0RLaVkrancwOGxOM2JzbDl3aEF2SVV4VzJ1?=
 =?utf-8?B?c05pdTlFdm5uMmpDejhlRmZ0UTAzWHpzb3RnVGtaMmUwWFNxb1Fpa1FzZzM2?=
 =?utf-8?B?Y0pVVmNUdHdFUFRXYnpra3RiVmluR2o1S2Jzemh4Zm5KckxUQmlHYUVvUkc4?=
 =?utf-8?B?eERZZWhqeHJIUzJVUk94dUZTVFpFWlFpejJqZm1Ra085SXBQYkg1RVRkNDBs?=
 =?utf-8?B?VGdrekJtVW8wRm1lb21xUlQrdDdHYVRkZEFqbU5lM0hpMTJXTjF0SWlweHJu?=
 =?utf-8?Q?hCJ6s3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:13:12.2926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfe2a04b-4f82-44c4-e718-08dd7b024a54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9009

Hello Aaron,

On 4/14/2025 7:58 AM, Aaron Lu wrote:
> Hi Prateek,
> 
> On Wed, Apr 09, 2025 at 11:15:37AM +0000, K Prateek Nayak wrote:
>> In presence of pushable tasks on the CPU, set it on the newly introduced
>> "overloaded+mask" in sched_domain_shared struct. This will be used by
>> the newidle balance to limit the scanning to these overloaded CPUs since
>> they contain tasks that could be run on the newly idle target.
>>
>> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
>> ---
>>   kernel/sched/fair.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 98d3ed2078cd..834fcdd15cac 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -8559,6 +8559,24 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>>   	return target;
>>   }
>>   
>> +static inline void update_overloaded_mask(int cpu, bool contains_pushable)
>> +{
>> +	struct sched_domain_shared *sd_share = rcu_dereference(per_cpu(sd_llc_shared, cpu));
> 
> I got a suspicious RCU usage warning for this line while testing your
> series. Since rq lock is held here, rcu_dereference() should not be
> necessary.

Thank you for reporting this. I'll make sure to run with LOCKDEP next
time around. Note: The performance aspect is still quite bad with this
series an the intent for the RFC was to vet the idea and to understand
if I got the basic implementation details right.

> 
>> +	cpumask_var_t overloaded_mask;
>> +
>> +	if (!sd_share)
>> +		return;
>> +
>> +	overloaded_mask = sd_share->overloaded_mask;
>> +	if (!overloaded_mask)
>> +		return;
>> +
>> +	if (contains_pushable)
>> +		cpumask_set_cpu(cpu, overloaded_mask);
>> +	else
>> +		cpumask_clear_cpu(cpu, overloaded_mask);
>> +}

-- 
Thanks and Regards,
Prateek

