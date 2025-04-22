Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB1A25335D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308641; cv=fail; b=R4eB/EB4IAzKNSVXvSnGsVtajpVG6j4lui/uat6253ensIbV+tPsA1FStDF5Z8zrchyRozCfJ+w35GCcP4CdvKsN05wH7YhURRNZDSmiHNAAeqJrBibUMNb92KDR2FliAtdu3sjLW4PLa+r2ZnQBpOuKzuYcRkVEfPde0TOkmnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308641; c=relaxed/simple;
	bh=Cp4RauAQ9dt12bF1ryHmfF9VE1KZ8tJYrhLKiTVMiFg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=XNy2Bt0aBmS5bCv1fwHfz8Pebn6h2rizTMDjKU4ylcPHOatWo3TXluzKlcl0paXwR67SjZmujL4UxcBG6nNQ63AMwarllPKGQi7Fx8raj9NNZ2hzPP05UUMFUhnRWh6yKAGI9hNC1yzOu680KG9ih8hVkFa6sxOqMAlwoTkiLI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Vb5win/C; arc=fail smtp.client-ip=40.107.237.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Vb5win/C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiVhDecB9lrFcTpVODRfRHkPy/ySAVyfKpWV8VSCrvgVKOgfQwPx7ShU9Fc3/HKMfzhA1txtiIhD4TmgzHcvNcPmmkBLook2RXFFKMB+BLxtYOnlX0lHJnr9TB2Te1wlaxfrkRvHeuZN9/L7Mkgz9jbMEaOBI+7RdbYf8ni5LkYSqKn4iIHL+gZoTQpRFt8ht2Fyh8CoSRg1Xw9ooYUOx2wSCB8RnnDlG+gG6rOGl67MTQAtvZrneGb4xEv92OXNhP0ubhiF+dJUFmi6dWS6XCD5YXBAxQKWq5NcKfhsOwMkqt2a3sz3/egEma15CvdHn9oZS4TbIb7aAV3pEg9LPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4+SrSf0J2gQXX7AQHvZzae50fynpQeqAbKC7V0e55I=;
 b=VD+ivr+u+jFu9es34BIwWNtmWOlHGz29v9IfHjZS3MhbDp0u7D7HOtI1WB3R3VyGZPghnDLjOhT1/4oh+aNqfKwEpFQN2PYf6kjnQZtzS90arR0Efrkxls/fza3zwwwZ4QSnTYelzC1kCH445mQkuBQakdOAIX5uucL3TC0DaDV/aU9Hn+94fGnL43iJqMFOoJFbLbjqxJCz6ct+X3giWrWcyMTitkIRD4PL4DzPscKPmwlv8k5SWFSzu8jlhX0zXvJQKaaEoZuHeF8NgJM4nqax3068S0+kxbVa0YNNjeAttUq31oMBdIqHu+oXOb96VFNMj8fzo3/Mf7GX8O2a7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4+SrSf0J2gQXX7AQHvZzae50fynpQeqAbKC7V0e55I=;
 b=Vb5win/Ck3K/GDF9GH/bFIgcifw2aeoT/gaVwiFIC60r7GDFl2YVkK82m4s2eKdkSwr3avpdk9qFr64IIa76D9Dg3QOyilKTqANLCdxYwbFobHjCUt4N4GLzd2BHQN1sZhOwhpPdHNzD7tkW7xVtJFVpMywQ3HFlBsrpXEbnkKk=
Received: from BN8PR15CA0018.namprd15.prod.outlook.com (2603:10b6:408:c0::31)
 by SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 07:57:14 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:c0:cafe::5e) by BN8PR15CA0018.outlook.office365.com
 (2603:10b6:408:c0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 22 Apr 2025 07:57:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Tue, 22 Apr 2025 07:57:13 +0000
Received: from [10.136.43.233] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 02:57:06 -0500
Message-ID: <b1057492-0956-4a41-a122-bfb7b06d7ebb@amd.com>
Date: Tue, 22 Apr 2025 13:27:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH] sched/core: Tweak wait_task_inactive() to force
 dequeue sched_delayed tasks
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
	<kernel-team@android.com>
References: <20250422044355.390780-1-jstultz@google.com>
 <70647a05-00f7-40aa-ae46-caae3c5c244a@amd.com>
Content-Language: en-US
In-Reply-To: <70647a05-00f7-40aa-ae46-caae3c5c244a@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|SJ1PR12MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 3143b0b8-1eda-476b-252b-08dd81734afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTVMWWN3ZFJGMm1SNGVtQk5KT0FLcm8wL3FrYmV0cFBCckpVNlBTMjRVZjdL?=
 =?utf-8?B?UnErMktMbXl1OE4xNTdBRDliZmJGaHRWcGo0dmhzQTl5MVVxYVBlZGxlak5x?=
 =?utf-8?B?Q0VPcXdCMWxWaThDZTdhS054VVkvYksvdVdNUlltY1phR3ltdVdKYkZFQU9D?=
 =?utf-8?B?bUtpNk5SNHhzK0tVZG52YjVTTEw4Z3dyUHdKVmxRem1VeUhvQitOd09jVSs0?=
 =?utf-8?B?RFdTTW1FRnUzV2FZN0FJSHZzb21QZFAwOE55VVB5VHFqNjVYV1lrRGtvZUdW?=
 =?utf-8?B?MmpLUGZFNnNsUVZETGxvSGZ0Zi9pM0g1Z0hNQjJxM2wyNTU2dlI2OGR5MWhs?=
 =?utf-8?B?TldzazB5ZmhWdzZrUDcwY21Wb3FsNTdqL0srbFljempMWklOUEQ3bDYrQVNs?=
 =?utf-8?B?a29YOE1wcFhucnNGOFU3Mks3M2NtMUFqYk1lQ3JzZXloMXk1ODhPWUxDbWRV?=
 =?utf-8?B?WVk5eEE2V2JKK0plSHl0dVl0Y1hLdjM4RjdrSnpoQkdyLzBkdzY0OVZyOHNr?=
 =?utf-8?B?R0FrbHVrcGxhbTRHdGtrVVlaTVhxb0NMSnJrcFBGbVBCT2luMUNrYy9mUzQ5?=
 =?utf-8?B?YTFzTElwT3VMZnNvVElHN1RoUDk5OHM3L2lkVTZkTGcrYTZaclNXOVdEekpY?=
 =?utf-8?B?MW85RlFJSEFKZFJaNS9pUEFmVmc2UzhCOEllUVZTeE1tSTVyZC8vbUVCV3dR?=
 =?utf-8?B?ZzVLeDU1ckdDdlZON0c5MjExak1BOUV3WTdtVU5CamViUjRJVXNRR0ZFRHRt?=
 =?utf-8?B?MHNEMjhSczZ4bVpqVkZaSGxkZmphcXBqc2FkUnJBQmJtYWNOaURyMUlVakpZ?=
 =?utf-8?B?QVowZGwyY25WMDI4SGgvb0loQ2pGdERVS3BrMEkvWTRVV3ZGVG8vLzBXNHl4?=
 =?utf-8?B?TnlYcUJwUGJiOWRnY2JEWVd0clZBWWlKRnN0RkRmQmVmRFJuQkRvcFJuNjll?=
 =?utf-8?B?NVVqSm8yTEkxM3RzMVkxMUJubGE1WGhuQkdraHdqK1BKekhyTzBBTys1SlZR?=
 =?utf-8?B?UDVJOEhrK1Zzdlc5OE9WYnFUK0lBakRxb0kyc2lMSm9wR2QrQnhJZHJLT3VV?=
 =?utf-8?B?SStvNGFjMVY1Rk9JcTFLcm54bTIyREJpTDFRNG1IQy8weWw5VFhPYlFNUWda?=
 =?utf-8?B?Q09rWEV6RnExcDM4TTVkVXZyUllLeTk2ays4TUtENkpWQW96TUNFWXJrODhv?=
 =?utf-8?B?OWljTDQyWDJjTVNGYUdOcVk5ejFqQ1ZPQWRuWithTHNFTEVSZWNWbEdDeEVp?=
 =?utf-8?B?Wml3blUvcWRpMVJZeDVyMUlhVHZlaGVQVW9pVkRWZ0NoR2xxN3BMeW5XRHpr?=
 =?utf-8?B?Nm10OVJiNnRVUjUzT3JKb0RNSlNWYUJFcy9DWnltTkNFcGsxQ2V5M3Y4UExG?=
 =?utf-8?B?eGRseUdONGVvWE51MlJRT3drTGI3S3dzczljNW5QaTdERmszTjloOGFQcGRt?=
 =?utf-8?B?eHA5RWVHQ0pNRHpNbDI4RTVaYnBiZC96aWVoclFsakxUb0tJSEx5R2JHWEow?=
 =?utf-8?B?bGoyWWRYYXNOQ2UxYlVVV3dQTGdCTE9HU3dSc0FTeC9XVTIxc1lZZjhHT2hB?=
 =?utf-8?B?UCt0SmgvNnUvR3ZRL1hCUXVOVHowcDlyVUsrNk1QWmlQbEhuTnQ0SUJRTmxk?=
 =?utf-8?B?aWl0bDl6MkRqLzRqTWttVEYxR2dKQnlPV0pSQUJGVk16QzExV1lzbFRZSlYz?=
 =?utf-8?B?ODVFT283M0ViVEltanlEbzdUTjJDWU11YVRrUXNyMVJ4anpjb3ZZZXZUQTBC?=
 =?utf-8?B?eWtld0o3ZUo2bTMyRXNqdnVTWUFrWDRDK0Q1VFAvbnp2MFg2VVQ0M0IzMStQ?=
 =?utf-8?B?K0ZvUkJsUFJJZEMxMWhSWXg0NFQzNFY2WFAySW5teUszNE5Nb01LWjF0YWUz?=
 =?utf-8?B?YzhLQk5QQXM5d3RISHlqYlJ5dUs5YzRZbzhFNVdRWTJuTzdlUHN2Tjc4aVdW?=
 =?utf-8?B?TVY5SWc2RERZOE1oTTNCbDFZSWdmc1ZWV3R1OXFhNTN4em9mcmZsNzVKR3ZZ?=
 =?utf-8?B?Rml4T01vNHVLVXJwbDEyYTJxVXBNd2VrWk02Sm5hQXpiU2tsUVg4cGMxU21L?=
 =?utf-8?Q?W49ERM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:57:13.5452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3143b0b8-1eda-476b-252b-08dd81734afe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6339

On 4/22/2025 12:13 PM, K Prateek Nayak wrote:
> 
> I think an "update_rq_clock(rq)" is required here before dequeue but other
> than that ...

I clearly need more sleep! Please ignore this bit.

-- 
Thanks and Regards,
Prateek

> 

