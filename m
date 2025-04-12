Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182871885A1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 05:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744434745; cv=fail; b=JCz1aTvgbqHtcKmR4H85r6TSuMNS4DkFLd4xdAj3+B+iicMl0+U2gsxYfmpkWw3xVrB5Oue1J7/y4bLLbqij3ngJNoucM8TL3tSDrMuhKZ8xBKDGTeuxq3CLLVw8JdBoqL07ciBat5YKkcLM+tzrVWT+k52gEHkw0bUYff6VJ+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744434745; c=relaxed/simple;
	bh=lp7a3pH7bKUPyXsphfgML3/Hl3zMn5c7hAcJSsRq6QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kXjoukVSHOWeAjHP+d3Em8jMDdeyg5MmaV9IwqEXc8Yg/M5wywlIf28yg8pGwCDsHuAx5qZKTAiljiNBby4jJWDoa4slakiw3Ral/D2AdlnF5HKRKFu1z1z6gzStluVfoPVa4777oirxaYDG6i8arkZ+lRe9KJDfMLB7MCU39HI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zLE/eK/M; arc=fail smtp.client-ip=40.107.223.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zLE/eK/M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScvaHPVEudxlVE6d/UWV+bDGI0ok7ACtpiBX21XbUqfnl+LAo1kq4I1Mi+bbmCv6O0yM2qJSkoDjm1Oz/AAup+OVav8ZeWtFY7lAySaEK2LFlvMxQSkoOUR7qaHp9dOmLFZz3+2ReWE0mRyIrW9h/V/gTZCnsefgp3f9iojBoYqhCFSeWd7K1PVWp1TuG9qhPExTD9zTYvpxyqz9kFiuECymHVE0VvWAbpEA9zqbxii6dkxPeoMdii3fLWaUKX/1NXxZGAfpzBqB4ujOlNy1NRR35i2gal99xUt6bENgw0YBgV4kNsD2+DvsiLsQUIjnCgpUOoW4bUnrxGM5fGK5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+kQxLmNJQcMEtPrwrYSstlpzsmDTmxzA+Y61Cc3KMc=;
 b=B/MhO7CjjDnx0KAzzkSxd3+MLdIQlW0d+elF9SSB7r/0CZc4CAixrjvDP18D2Jndu4oYgjJlP36Olbb9159XffwxrXFMo3YW9CIsOa96Xe+IuO7Z6irho3vr4J+jrhy70pNLdwHQELriYteIw9LlSCddxQeIyOcmDOY6ltBFHOyU3fVZnUS2SOP57YoLM++bQq842Jws+2aQiEdijkOnCS0bdmsJvak8j/T3H8OddIckPu+RjaaSGtLH4/+isXdFMrXUHZP6oTLPWwen4ouEdzxFJNtXasbDGoIEB0VJWUGhun+8wDgI3mFz9RZAx9xv6AowPLcRyHOU47WuLQegSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+kQxLmNJQcMEtPrwrYSstlpzsmDTmxzA+Y61Cc3KMc=;
 b=zLE/eK/Me8bZFyeYd6ApjV8WMa8SOPehw2u7ZP12rfC5XCVrRKLxee5YR8894zaGzxH6z3YddrGetfvt2EpAI3BaKa71dyzpLof8sccF/KRlEwo8WlCZhbMUxwmx37hIbNAGDI53PFty8p3wm3PQKlmQ12SFrBSGYs9fZcaRg9w=
Received: from SA0PR11CA0096.namprd11.prod.outlook.com (2603:10b6:806:d1::11)
 by MW5PR12MB5598.namprd12.prod.outlook.com (2603:10b6:303:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Sat, 12 Apr
 2025 05:12:18 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:d1:cafe::d8) by SA0PR11CA0096.outlook.office365.com
 (2603:10b6:806:d1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Sat,
 12 Apr 2025 05:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Sat, 12 Apr 2025 05:12:17 +0000
Received: from [10.252.90.31] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 12 Apr
 2025 00:12:13 -0500
Message-ID: <77f5e50c-ba52-42de-8668-e15660ba9eb3@amd.com>
Date: Sat, 12 Apr 2025 10:42:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] sched/isolation: Introduce isolated task work
To: Oleg Nesterov <oleg@redhat.com>, Frederic Weisbecker <frederic@kernel.org>
CC: LKML <linux-kernel@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>, Marcelo Tosatti
	<mtosatti@redhat.com>, Michal Hocko <mhocko@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Valentin
 Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
	<linux-mm@kvack.org>
References: <20250410152327.24504-1-frederic@kernel.org>
 <20250410152327.24504-6-frederic@kernel.org>
 <20250411102555.GA5322@redhat.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250411102555.GA5322@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|MW5PR12MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0e2777-abd3-4e18-c109-08dd79809867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1JZcURXUUJMZGU2MGM4OGhmWE5vV3hOTXdRMHNTMnJjd0pLYzBGNWV1MGQr?=
 =?utf-8?B?bXFkZ0x0NDRrb09DNkdvNHFPcm1kSERGZ3lTSEpkaFMvQzEyUGVzUTBqNDlI?=
 =?utf-8?B?eDUwSEVobUVRb0h0VnRNS2xWRjlHWkhqU2JEblpBaXlsSVh2TmZWRDBNa2lO?=
 =?utf-8?B?NXFXMHp2bFJuUk9qZ3V0ZWhxN0syOHRIQjdMOVlyNjgrYkNVeDdNTVZXMVpO?=
 =?utf-8?B?UDFRUytuU1hNS3drZ3ROdmRYOG5MZGs2cFRNK1J0L2k4eWVuMlBPbjhFdll1?=
 =?utf-8?B?MHdWWlkxSnBJT0czZ3QrRHd5SDVnV2tRM0U2Z0MvUDVMeXdzZHpqbmJHWWRv?=
 =?utf-8?B?VUlTQkY3ak05eDhBMzB1czNqekVZb2cyZi9UWW13aUR2c09tamE3WVp5VU8v?=
 =?utf-8?B?eHVUQjNHZXZCQjEyblZFaGJydk1EcVNYV2cwVzB6MFQ5MDdJbFhXTWk2VW5F?=
 =?utf-8?B?S0svQ24xK3RoQ0ErTGxnN1N2a2Zkd3ZtbzBhdFA5SmtJVVhJd3JIWC9kMEVF?=
 =?utf-8?B?SmxVbWt1cTZiWk5odHlEWlJZRXM0dGVVSnljK1pQQm5BM2FqQ1RZR2JXUGdY?=
 =?utf-8?B?VnJ3OEIvZXQ2UXB6SXVBbG43NHBQK25PN2NiM0syOHdocURRQmhzMWo3S29R?=
 =?utf-8?B?Q1N4RW44Um5lOHdvRUVXSlduUFFCTDV5ZW1VQzJobjdoNFlwd2QyQUtxbHBw?=
 =?utf-8?B?bnkvdE9BU2VFR0RmMjA3QnVUaFFveTBSVVVDVStuRHBZVElrZS9hV2RYSGhK?=
 =?utf-8?B?SWFPWnhEOVhsRWFKSTdLSG9yTjg4REpJWUJTMXVINXZneW5sa2QxM0NEaCs1?=
 =?utf-8?B?UHpYT1R0ay9jSUc1NW5ORmJjYkFHSFQ5Uzg5L003OHVNSTV3SktCRWcvYkpn?=
 =?utf-8?B?eEJxR1ROdWFMR05Bb1c1ekkxdzVZOWZXWDJ0WFoyWm9xV0xoTW84VmtITWZp?=
 =?utf-8?B?eVZCK2hqV2JySWdwaktXTjFLNjRIMUZnMXM3ZzFFSk5QZFQ4bUdKTWJTVkxM?=
 =?utf-8?B?TVFaaGcvcnBUTnJWbmlQbVFyR1p1KzMwSC82TDBxYkV0MFJJNWg1NElDM3R2?=
 =?utf-8?B?RFdWY3FWWExueVhCeURrTjlDRkl3aGhSL05DclR3R0hKNzdzN3c2ODZBU2R2?=
 =?utf-8?B?RklmT0RSVVJOQXgrWS95NDNJWjAwZ0wyWnFISVBRb2x0R1dBOEh2OTFXeHlj?=
 =?utf-8?B?NzRmbFpPKzdQZFJ0SGYvaWx0Y2s2T2RCY1R0UUplQUt0NTVIczg2dzBPMGNK?=
 =?utf-8?B?ZW50cy9PSGFqWDF0YUEvYm5DckxySExtc2JUMjFMdW0vbXNvZUxsLzZBUWd0?=
 =?utf-8?B?R2c1M00wRkRKWW9LY3F2K3VVRHZGZ2FFUmpMRnNXSGMyeVJkdUVZcll2ZkJC?=
 =?utf-8?B?VzlWdW1rWEc3VWZNWGVvMU0zNlBteEZVRjZLc25KanBpb0YrRWtTWTViTkda?=
 =?utf-8?B?MWhvNEVJYjdJcHZ2bEt6VnpnQmpHQTdJemhXYjFFa2hISnZSb1dUNW12cGYw?=
 =?utf-8?B?RmxkNWR6VnZTYW1VR20yZDBjYzIyRGxKZllkNEp3L3NOMmc1SmI4enFCVHht?=
 =?utf-8?B?aldBY2E4azNPUlZnenlzUHBubkFvOWMzUUxsZDhHWGZ0WmxENEY4aW0vR1BE?=
 =?utf-8?B?VGNpVnJkTE1RNnhBT3RCZ3NvNDFOd2ZOVVlkNk80Nk45bWh4NjV1aHJpMWtY?=
 =?utf-8?B?RTdOdzhBZDVyY0laaW1tNldxeEFncnlZZmVpN1ZNTmxDR0dsanlDa1Mrb1NS?=
 =?utf-8?B?VTFuMzl6MW9TK0piWk5wNXd2VmtPeDZvbHp0YlRZY2hZUDVaa1BDdE9hVWN4?=
 =?utf-8?B?dktYSFZXOTJacWl3SGFrWHkvNHNsQmovNkdXcVhaaFhMd0NLdFJtTHVJMXU5?=
 =?utf-8?B?dGRuRWRCMER1SGVoREFUQytNMi9zZGxjUEVLbm5sVm1QUisvVkphbzJtWHBU?=
 =?utf-8?B?RVFFRmx0b3pzUUlmUnNYK0lyMWdGV3o5TnhtekFHUFlzUHhaSUJ0TWdmV2NT?=
 =?utf-8?B?SUs4dlFoYldGZ1ZWdUVLZklLMXJxemZMNWNCRHkwb0RWTjFwVUFCeGcycUFu?=
 =?utf-8?Q?8/b7+t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 05:12:17.5408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0e2777-abd3-4e18-c109-08dd79809867
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5598

On 4/11/2025 3:55 PM, Oleg Nesterov wrote:
> 
>> +	local_irq_save(flags);
>> +	if (task_work_queued(&current->nohz_full_work)) {
>> +		ret = 0;
>> +		goto out;
>> +	}
>> +
>> +	ret = task_work_add(current, &current->nohz_full_work, TWA_RESUME);
>> +out:
>> +	local_irq_restore(flags);
>> +	return ret;
> 
> Hmm, why not
> 
> 	local_irq_save(flags);
> 	if (task_work_queued(...))
> 		ret = 0;
> 	else
> 		ret = task_work_add(...);
> 
> ?

Or use guard() sand save on flags and ret:

	guard(irqsave)();

	if (task_work_queued(...))
		return 0;

	return task_work_add(...);

-- 
Thanks and Regards,
Prateek

> 
> Oleg.
> 
> 

