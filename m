Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DDC1E5B62
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298820; cv=fail; b=hiYx66PaLbSF5pj+ZcqJ4Bpdscvdq9Z6nU6hyZeCByxeA+CELd7k6Gdks+HrjyoUj5VpncqaoFLlMtOUoNm8sNUj67MWSMvF3+xYxnRsU7rfTSZI6I7hsxFumumYpvgTcoyUaK+kzo1IrbghvE6bbbdQ1x91gmRs30hUaPAuSIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298820; c=relaxed/simple;
	bh=7iFZ9LahgCHH4uYYev0iEWBoyh/oSq5awVQkfgReXWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=G4QLkJ9Go3iXMuITTHKTeU4V1as6ykhWKNkGWkPesuO+IG6SVh9/AxDKUT+umFOlt3XMbY1G3RpT26U10x2SymXbxUE9z0KdM9I9zyPq5mN8t8NDyu+RfBhEEBftsQflXIaRQGVrrKTK6OKtMlKIhn4eud+o5wt3RfllBzlGxwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WRWY+Ntt; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WRWY+Ntt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzBVfCgfzJma9gSGDmQtunE6D/ip+gSnEsuwCEanKm6CP590Ac9wvNt9pQUNhmeSERxlU64JEuzZXTysHsP5iqx41CXh6jTkktanLR1dxvBwTYvjQxN9a9nT8pEu6RDc8hUnZdS1w/xe1a5GCPmDx2oo2BwKrraISigas4B2+S37oKblsAb5gj4Vpx2kyl9YrKPpC/J10W3YlctNe0WdewWDBGBQN23HRyqlv3mZ0lBapMMn4ZWn1RyKpIXzXjXaRInVf2MgnGPoMfTb0+pRMGGSmY9cGss/sTjRjnDaNYDTEZINOa4hnTVdwCe55x/ovkkCiMqIuiFND9sthQ1mrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMspwAhySf5vQd9ld4sjZl+uVHlX1G003Y+3gbZ1Ows=;
 b=ehPFe7X3DXIr2yKQTuTo+4FJNFGfCmGeGIizgsOILWBY7ER7XZtAV2LcrRfkKDbNNdxZ4WWEd/XDMPKD1ZF6RPrlVBYEu/tV57Q4z4IKYa8uQy13E+VazskVmHn5BajTSWoP/CnvoHrnKW3wKIe+FtFIPCf93IVpUUCIrlD0McaHdlIA02+nxgqhAjVZkf2kMfglBxOq97CYG+HcXdx82GfGsm7DS3qX1AVQndi5w54OFii3i0/MADc0fzuiT6QJVW2bgF00fN8ATzs0qnNohLyL4Je6pRC70w8kR8Lo3HdxSF4aLroPkJxAPUnFhnO/uOQM4i/WlB2995IYLiJTqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMspwAhySf5vQd9ld4sjZl+uVHlX1G003Y+3gbZ1Ows=;
 b=WRWY+NttbGac8TZQpME9Hk/zdpLjZT7Jsu4e+9R4rYMN/wriGwqkXAuOqS3XcZshi2o/L4sB4SkDOmz1+Qw4sYSM8B8PxC6/pIDHypGlGY7zNU3fEQlaM6xAhvtm+gCSBzlA/Ekm9fEkk4vfDRhc+/V7pe/emyf/Ym/h8yUa+mw=
Received: from SJ0PR03CA0248.namprd03.prod.outlook.com (2603:10b6:a03:3a0::13)
 by SJ1PR12MB6049.namprd12.prod.outlook.com (2603:10b6:a03:48c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Thu, 10 Apr
 2025 15:26:54 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::a6) by SJ0PR03CA0248.outlook.office365.com
 (2603:10b6:a03:3a0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.24 via Frontend Transport; Thu,
 10 Apr 2025 15:26:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 15:26:53 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 10:26:50 -0500
Message-ID: <4b684302-8685-4840-b523-84f0525a8420@amd.com>
Date: Thu, 10 Apr 2025 20:56:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] sched/fair: Introduce overloaded_mask in
 sched_domain_shared
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, <linux-kernel@vger.kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-3-kprateek.nayak@amd.com>
 <20250410100309.GB30687@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250410100309.GB30687@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|SJ1PR12MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: 335ae213-c47a-467b-68bd-08dd78441fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXB5YjFXRk9qOCtQMjYrN2t2aWdkRjVickZadmlVTWI4WVNWMDFrc1ZneENJ?=
 =?utf-8?B?dTdDcnAzdjRMM253c1VuR2l3ZGR0eDhMblNBUzcxbkdWblZZNE81aTNyQjBu?=
 =?utf-8?B?MTZ6MzAxdnJSVFo2Qnpab0x0bndFRE53aDliRHVDSE9mYlpkb0Rmd2tDN1ox?=
 =?utf-8?B?MVBUNERrdzRYcDROVzJJR0M1djI4Z3RXR0tKT3FaTEtmVVZFSDZIc2xnRzFG?=
 =?utf-8?B?bTZnSXZybG9Dc1VnVTJCKzgwQ0Y3Uit2Kzhwblp3NHVvdE9ONmgrcjJZZ2Rw?=
 =?utf-8?B?dkxEVUtEYXBBdEVlSkVPV21zTFZvNUY0VlFkcUtmUkRlRk4zUHdNaXVMRGZC?=
 =?utf-8?B?TWhkU2lEd3FoOTYxL043ZzlkSEwrdXNOeTBjT3pMeFUxeDVxRXhydGdWODZQ?=
 =?utf-8?B?cmxDaVh6RVlRTVZIMGNhVnNCeVpNUDVET0Q3aXJsMGw3TXdMeGZ1YWRYcTRt?=
 =?utf-8?B?cDVIclBFbEVrTi82S3ltVlE5Z2RLajVTV01LNEwwOSs4WkpGSDBSdXhMUzMy?=
 =?utf-8?B?U1AwSHVBS0lDYWEwK01nVUFsSTNIZ3dYbERnQkhiLzNQM1NvMHdlaFlLZkN4?=
 =?utf-8?B?d1drenY0OENablNEU1lRdStUQzdXd0tBVkJyK1hQNllpVkxvTFU0WUVFUGpK?=
 =?utf-8?B?djBpbEFoUFhDV2lid0k1eVZvY0NFUDZmMUlBQ3djSmZLM0tHTm9ncEQ4MWZ0?=
 =?utf-8?B?czh0S1RYWnFTUHN6eEIxMkRhdFMwZU1LcWZiQmt1TXFob1BuMWw0MlN1ditm?=
 =?utf-8?B?eGtycTkxT0Rzd0ZNajdYN2FBNmhWSGJlNWd1bm1YUHQyVUowbmJZNGtTVU9W?=
 =?utf-8?B?YnNob2ZIYUdTeWllSVBGUTdCNmFLOUJsdFlnWXU5WSt3MmRqVFhYcHAyUVRn?=
 =?utf-8?B?WUpEd2MvMCtFamt1U1VwTUtnYmlWUDYxT09HbGVtMm5scC9ySTV2c0VJWHdZ?=
 =?utf-8?B?ekR4SDR0SjBxT0ozWjNEWEp5NzN0TXNLUklUTkQxcnpndDQrajV1aFc0blBv?=
 =?utf-8?B?cVNXNVhySkVJT3F0a1FSb3ZndnJzR2dpcGN1aXl0cjF2WGFPdStOZTA3c043?=
 =?utf-8?B?RitlVkt2KzY0dTdHOEI4eU9PK0Y4UjJqNzRVSzhvWkh5UHFyaGcybld5SDZV?=
 =?utf-8?B?UmprZ3Z1UHNwN1NqRTVQUDhyTE1xdmxIbWhZQ3pyaEtwdWJwb3JZbGt6Vkxq?=
 =?utf-8?B?eXphVG5tcDliSHJZeGpjOG1IempsREdqM1ZqUzBqMUdQTklvVVhweWhBSTRm?=
 =?utf-8?B?VU4wTk1udmt6MTlmdmJJMGJMck13Rk9tU3BUemViZUpHR0x4YTIrM3pYbTZv?=
 =?utf-8?B?Ui90SlNuR05IUHB5aURodmRQRCtyM2VWaHZKenBaT1ZkMEVrcnNZb2tsQVBl?=
 =?utf-8?B?SlQ0Y1RlOWdXbGlYNmM2ZjJsZjEvUTVJZmVNQnhjbWZLbjB3MjVubk4ybFY1?=
 =?utf-8?B?MFNIa1NzaThnZURnS2RNWUNPQ2ljTElJcTZlY3ZQT0hqZlllRDJQQTRGVmhF?=
 =?utf-8?B?bS9yYzFNNmRFOGttY28wcUR0dEw2S1dEdTlVQzkwdzV1UFduTFR3b0VkdnZF?=
 =?utf-8?B?bGNoSjBmMXV3Q21aTlpWbDF5Z0NYUzcrNy9QWi8rcUc4N0tYWnl5UWJVZTh4?=
 =?utf-8?B?WkkwNmo5Si9WRGpLZXcxRnExNkM4bmVSVDh3YXdVSEVyczlZYVgySHowSjZu?=
 =?utf-8?B?cUgyZEVmbTNtMzNhaTVrOUNTUkhhWmMxdjQzUWVHR1NuUk5qS0dYZlJzeWlt?=
 =?utf-8?B?aFVxVkhrTEROZldwaEt0aVlKT3pmSGhoaXNXZFRNSEZWUUl1MHI0K0ZxSGNO?=
 =?utf-8?B?L0JlaFFpT2FqdXlndjhMazMrNm1lYW1XM3k4YXcxN0dYV3dpL2N4Q0MrQjZY?=
 =?utf-8?B?R09GaFJNQ1lBT2lMb1hOQmZCMjJ3RXgwVTM1SjNjV1kwbkZNdWpMM1dWVDJY?=
 =?utf-8?B?V2tWYk9IdHY5dmpwWnJkdWJzampLS1hSVm5FaldpSEF5UkttMEhSWmRTVTlK?=
 =?utf-8?B?M1JqdisyTzBJRk5BZkFIdVJEVkVFcFdFV3hSNkNCa296VHVtT1h3RWhxdlZw?=
 =?utf-8?Q?stN+Eq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 15:26:53.8777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 335ae213-c47a-467b-68bd-08dd78441fa7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6049

Hello Peter,

On 4/10/2025 3:33 PM, Peter Zijlstra wrote:
> On Wed, Apr 09, 2025 at 11:15:36AM +0000, K Prateek Nayak wrote:
>> Introduce a new cpumask member "overloaded_mask" in sched_domain_shared.
>> This mask will be used to keep track of overloaded CPUs with pushable
>> tasks on them and will be later used by newidle balance to only scan
>> through the overloaded CPUs to pull a task to it.
> 
> 'to pull a task from it.' ?

Right! Sorry about that.

-- 
Thanks and Regards,
Prateek

