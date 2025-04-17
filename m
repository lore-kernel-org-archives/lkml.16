Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E59D23643A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744888261; cv=fail; b=GsvI3hz20qw/gsZLMhcgAa0gVPhB/MraCl+oYkRgWBQ1crm3kgfUV8qIEHXCgadECDrGuRF8hz95TdjoQULXzCFeC70vz/ioYOfN7vMshRLLS1c0CyM5kfwMWUIiUIFATsr/zqgF/0oM3UY4FSuoIxI2Q2woCOVAOM0cfhyWW4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744888261; c=relaxed/simple;
	bh=7rZfFkpcBd8Iv+b4jbuXWY+7Bt7Wj9N+V4VNxaeFvv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tUM6u23QVLQhlAAwZrIN/Wj3VjhAzQRcZaOhHM33n/ssPVEwUe4RXBgVYIB9kWQ2Q5GVCpZIVGPpIJ2aoc22yOYjO4z+YDm3lFXs19Wmzkb0wedcytBrDVBaEtIhcCaJXnVf9erbLPPQZEMVWJ23NMPxzlNzy4BmjU0JN/F4DO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oHpnPVRk; arc=fail smtp.client-ip=40.107.237.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oHpnPVRk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfwXlQXCJYoSmwg9qVdUpwEhCIXiWI3v6zGibWLzZyJE/aOTo99GOzVgF96/EzWHvux3lxdfT3Yf8wQzgeHbj4apSWmjp7qUklk8mcc2Tc8x0/mVYzP2pyD6eBdOQsuT3a8tKkQmJw4IqK6HVIFj8vPoWZ7pmLsH9eeHzijIBjN6nRHtj3ozJDppxExLiOhERTyp2ntDiiAKhXfGuARw42kviL9pi1Qc8pP6cXyLMmGSCF52kMhjRgyR6xB5NCDL3uCqoMDeEEtw3TCZA+F6uIOHGK18YwGXg3mcM0VyKz2GlqmLXLHd/BRAxw22X52kqgAzhIFW/Q7uSFWn398UuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQKXt6QcEKBUL+okgbyJKoRICZt3J6VoRLYOvuOsEDQ=;
 b=s3J3AKH4ZfOWqpk+nlpG2XdSsj8/lpW9QHL38hPuvLLKllzaKCdqwjRMgFy4CEYpWZPMJ3OljWgBEXvJovfVVe9dnsEBUNGmYkjXsL7CxAWCQ/gVkoYHnliHLrOJYBPEBrllEu9NXgs6DsJ0wSOgfx/VPEkxiakYfmbt6JXMntUr97wgun6G+Y4IT14o9ZfwW2/Ux2QEU9vKNdrN1eNCHLOrSwMwCAaESoTgcO69zl9qMDW4RMlddRWlvoA5CgjCcTBdnBWJdfSO3MBLn4/W5LEMSHhs5Faw2KZZnVgeQkLhqxqsf7WvPGyVZOR3M9egZa2gxvsR340Uejc7NTvaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQKXt6QcEKBUL+okgbyJKoRICZt3J6VoRLYOvuOsEDQ=;
 b=oHpnPVRkQ3RGaSEv8QomJph6r0A6uLa5QQyHebGxEq/7acAKundlg+Qgw3Hvxg8Uk64WMvoEnXwo5ND79tAQ46Xku9PGOf3d59H0Ib+Abaut3Xk7jP4b4qWNt6N2eSg8ataUnj/kP5Kk79sVF6CDgneUdmepIclJ11Mx3yu95k8=
Received: from DM6PR02CA0160.namprd02.prod.outlook.com (2603:10b6:5:332::27)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Thu, 17 Apr
 2025 11:10:56 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:332:cafe::bb) by DM6PR02CA0160.outlook.office365.com
 (2603:10b6:5:332::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Thu,
 17 Apr 2025 11:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 11:10:56 +0000
Received: from [10.136.45.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 06:10:53 -0500
Message-ID: <d6cae7a6-8772-4523-a039-b8e2205f89f9@amd.com>
Date: Thu, 17 Apr 2025 16:40:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Skip useless sched_balance_running acquisition if
 load balance is not due
To: Shrikanth Hegde <sshegde@linux.ibm.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: "Chen, Yu C" <yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Doug
 Nelson <doug.nelson@intel.com>, Mohini Narkhede <mohini.narkhede@intel.com>,
	<linux-kernel@vger.kernel.org>
References: <20250416035823.1846307-1-tim.c.chen@linux.intel.com>
 <fbe29b49-92af-4b8c-b7c8-3c15405e5f15@linux.ibm.com>
 <667f2076-fbcd-4da7-8e4b-a8190a673355@intel.com>
 <5e191de4-f580-462d-8f93-707addafb9a2@linux.ibm.com>
 <517b6aac-7fbb-4c28-a0c4-086797f5c2eb@linux.ibm.com>
 <CAKfTPtBF353mFXrqdm9_QbfhDJKsvOpjvER+p+X61XEeAd=URA@mail.gmail.com>
 <6fe46df2-2c80-4e2f-89a4-43f79e554f65@linux.ibm.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <6fe46df2-2c80-4e2f-89a4-43f79e554f65@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|BL1PR12MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fac82e0-a218-486b-5174-08dd7da086c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmpkOWpxdGNiMmZLRXlKc0pQNDNDa0swdGNoTVFLMThtOW00VlYzVTFXZTJp?=
 =?utf-8?B?aFpGSHcybkhmUGVRc2FqRHUzN2p5VDNBNVVxNDcwOGhLaGdCRTFESmVOM3Nl?=
 =?utf-8?B?RXRuQml6RnR4WDJmWnQ2eVlZcmxRZ1pMRk9VL0pMb29OcUtDdFg5RWZmVllQ?=
 =?utf-8?B?S1ZIdzIxQVVSVGw5RlZsTzBDYmd6MUlwa3oyb0Uzc280OHR1S2JPVzQ4cHZZ?=
 =?utf-8?B?K3E2dGp3eE9SaWRTMEhkTGtjOEdleHpNUzVpZ1BmMktBRjNuRXNFWUdMRTMy?=
 =?utf-8?B?UFFFOUF4bWMveHlMMG56Z2dEb2ZaaEd5c0NhRVRFL29kd2FGdE5ERVNYME9o?=
 =?utf-8?B?RFova3NkNi9QWnRmOFJmbytMQXJra1dwcW56enh0NFE1Mm9Od0ZwRjJPbFF4?=
 =?utf-8?B?Q21WU29TY2RVTGdZN3pyWnBMYlllU2JScXZnRTlTYmFlSFNtN3Azbyt1SVVY?=
 =?utf-8?B?Q0JEZ1QzNHFKNDlFcjU0dWhOTzFuSENNTXI3dnV3OFdSUmR6RmtlbjV3cU1G?=
 =?utf-8?B?dUxadmNxRStkc0F1MUNxY251b0NLYTVLR0tmenFqU3RlY0g3OVl2T0Nldndr?=
 =?utf-8?B?M09QcXlhMDBGNFd5QlpRMUVrQk5QR1RhM3VxNE5tYnROSUp4SXhMWWk5LzBq?=
 =?utf-8?B?ayt5TUxRVkxMNFdjT3RzS2hlSU1RNFBBbUFJSzAzUUR2d2lZeFY2KzZuYkU4?=
 =?utf-8?B?enVVUCs2dE5RQTdndTU4S1hYUGtWRmhmczVSUWY3cEZ3TUR5MFRBRnFkdzJ0?=
 =?utf-8?B?Tk1jTnNKM0ZZeEM0SXZvS2hTeWtMOGg3VUZvVlI2ZllLamxIcmhtbUxUNGRL?=
 =?utf-8?B?Y3RLektEWlk0RThvejRkR1dYeEh2SVBGTHExRVB4R0NKZExGZFc0TEowY1VD?=
 =?utf-8?B?MGY4VG1GTmdwd0FOTk84M2Nia1VIeEplb21HZHExZTNYU2Jsa3Q5M1kwL25B?=
 =?utf-8?B?UWowWTdIaFNBaGs0WCtUUm5xeUNzUWxaRTFTNWpvL0JiVmZ0cnhzZ2xCWXB5?=
 =?utf-8?B?M3kvUE9uYXE3Z293d3NqVHRXMyt1Y3dtVUhtcGdkMmZCVFc4ZzFOcUlKNG9Z?=
 =?utf-8?B?SWJIOXo0ektsUEU1TCt1QlJkMHBCbmx1S2Z3b1dScGJHdklYc09Uc3BtWC9a?=
 =?utf-8?B?MDkvUnBpdUFraFc2cEI5STh5bTJpWENRUnFISG9kOERzTjFnVzZxSHRBdllv?=
 =?utf-8?B?YWRIVmpZcXBZcWJqV3Y4L0J3WlNuZThSWjVaZk51T0c2YzMxNXZ3bGE5Q3Yy?=
 =?utf-8?B?c0ZVamJiRy8xVUpFWVRqdVVxTXBibGN2YlZtWlhwV3VxTVlhOFpSL1ZlT3dh?=
 =?utf-8?B?WElTbis2MWJ2ZmlCSi9lOVJWQU5yT1N5WVRNZVFpS0dWek14U0lOcEp3eXRG?=
 =?utf-8?B?U2M4YkM2dE80dHRzdGtyZG9vZXdKUUdxMy93U3BLODBuYlV0dlBOREhyemdV?=
 =?utf-8?B?djVQdFJpaUNnUjZCN2N5VCtmN2Nuempwem4zZjlmVTFYTVZVSDRoNFp0ZnJG?=
 =?utf-8?B?akRvNG1tSzI0djRCcStkaDZZV29mMnpCWHk3TzlqWEw1ZTFVTlJBWFpiOGJp?=
 =?utf-8?B?RkFyRVBJaFZrNGx3RVJ4d2x1ejFpTWxVcElnWHMwYVdWYW0vWGd3UFJIOWVm?=
 =?utf-8?B?V3JyVlgvUjZ1K3llWlpESEloeWhaSVZ0dExqblFoTVl5bUlkZVpJNFN1c3FE?=
 =?utf-8?B?UGJPQStpTFIzYXgxak1sOVltWmV2WkNQaHdNYnV0cEFpd1FibXdsbFlhWVhm?=
 =?utf-8?B?YjhacnllbVlTMS9zMWdNVE5KSXVUbE5XS0NFTmpVeFFvL09jS1VsMFAvNTIy?=
 =?utf-8?B?RVVqTkkvTmwxZWR0TWZFNEt6Z3BwVy9hRTNMc25nNWtjb1dMVUhOUVZvTVNU?=
 =?utf-8?B?NENiQW1tL1diakFEN1hodmpWTE40QkJ6MTAyZmZZUlc3aHpvdGFYaFZnQWJo?=
 =?utf-8?B?WGdTazBBRzd1NWN5cjRlNTk3MmpxZmptTWo2S29NNFhSK05EcnJ0eWM2eE5W?=
 =?utf-8?B?K2NybFNuVndSWkNnS3QzV2JTSnV5V29URGFOZjN4UUVZbENOd2J6ZFdaWmp0?=
 =?utf-8?Q?Cv2Oon?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:10:56.5277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fac82e0-a218-486b-5174-08dd7da086c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779

Hello Shrikanth,

On 4/16/2025 7:44 PM, Shrikanth Hegde wrote:
> Slightly different topic: It(kernel parameter) also resets SHCED_BALANCE_WAKE. But is it being used?
> I couldn't find out how it is used.

So the usage is very convoluted. SHCED_BALANCE_WAKE is same as WF_TTWU.
kernel/sched/sched.h makes sure of it, with some static asserts. In
select_task_rq_fair(), the for_each_domain() loop has:

	if (tmp->flags & sd_flag)
		sd = tmp;

where sd_flag is (wake_flags & 0xF)

This boils down to (sd->flags & SD_BALANCE_FORK) for fork (WF_FORK) and
(sd->flags & SHCED_BALANCE_WAKE) for wakeup (WF_TTWU). There is more
convoluted interaction with arch specific "node_reclaim_distance" that
can clear SD_BALANCE_FORK, SD_BALANCE_EXEC, and SD_WAKE_AFFINE if a
node is deemed very far to explore balance on wakeup / fork.

Probably some of these flags can be merged now that things have
evolved but it requires a bit of auditing before jumping in.

-- 
Thanks and Regards,
Prateek

