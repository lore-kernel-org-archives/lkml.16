Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8CB7E0E4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750658820; cv=fail; b=vEjBNn8ypsCmHrhWdATz+A8eYH8ri+pPiDNMiQEhAOeBHDUzQ0MCEbs2My5+m1OaVNL6G/gEhKS/BL7zo/rZh51u87wl02guXj48AvPiAolVXo9RjahHSRHBNjnkvyNOIhvPe+2FsAc9b0bfUuktWqUhaLQQcZs6LsqmTlO0XIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750658820; c=relaxed/simple;
	bh=Wx8sZq7ovuX+ZMNSyGao4ZHHiDcVw/KBnaelcgMVjaI=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n3BEY2y+bbpF0CKpkhV7YSXuOWWXgWjjC/02YtzaFOO3W00jW2VC64rZVpJpHYMOT7ZlrwXxjiuGHwNXaUvJxeSvVOdG/HFr0NzLxJPT3Iz1ayL5rJ7sA3M1je56aIRGmtyoCDGUNUtq1xck1wuahvLw6pAJTp+zFrVJz55mazs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=aqaQB0Nn; arc=fail smtp.client-ip=40.107.223.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="aqaQB0Nn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gh9Io7f18vz4+aooX1EgLkFW6FdIxe/StKL/5ZVh23HyhSbTuY7sZsAZzI6eVD2AFLT9TcylIgoUUrySAw7z0oQXYzgK5VfinbUx4rRaG4gjR2cIhYslJYDyj5RBLQiZ5orHbetosge8z4vY9eMd07aeVL8Ph4L1IsoMFbkOdd99BMOWVImyEhgOO3S+dlQbf23rlHsLOiqONaB/KJdE6qkoXENR9G+ILAaAJRilIROYINlSEZ3KPF1DETya7Sl3hJ98qd0GYvEWyrOvnNeJ9R6mT/wvo6nGcPIwSmZgHkecOWJvFS4jUGxca6Xntdz4PrDIlUr1VSVmJpvUaGxKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScsJaFzjSwdOY0yiFeyR3E43JqDl8UIFZyZr9D0Ijhg=;
 b=Ndr9DtDLOlydXIWjJ0HjgJ/BuvJArMvsYjT0JMZmJt7wkDpkZj/3yQPd9uoQ05QDl31GCPszNW56jrwpqQzUsp1uesuZp+6947Z8Gudbo5SiDcF9FCBt+5j209rMVa0Rmp4ZPpa3QUkqsyJPP0me4684dLE3iLSqfPAOpphAY2JLJ1iM/TANHgD4jkYyWpoBbbYiAz5pEKz/LF7Bj00lJx/bODt2hwZlvcq3DSfpTajufqkpJMb/WOVDurOZJXSAiHlBhsvSgFTHEbn1wxfSQoBf5PeBYekhMmVPDCkbqg51na0ggKktgJlUUQwwA/NDEJBbkBOlPl2wk0RaPo1/Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScsJaFzjSwdOY0yiFeyR3E43JqDl8UIFZyZr9D0Ijhg=;
 b=aqaQB0Nnw3qI5jBFcv2WtC3xxtgD9IeiUgjIVvmaK2VCzp1IvoDiNhsC3fi1kxEW2zBNRoxY4U2rM2lOyuORcQL4Vjyw4JX0qN54SbULM7J8YNjSG1s6gVRyaNhFAWXFLA87fuU+79O76T2f3gRbSbSdlFdfTiSJ1v5wGHDAkHI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by MN0PR12MB6149.namprd12.prod.outlook.com (2603:10b6:208:3c7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 23 Jun
 2025 06:06:56 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8835.025; Mon, 23 Jun 2025
 06:06:55 +0000
Message-ID: <e80a524b-75ec-4cec-bc67-a9200b95cd4e@amd.com>
Date: Mon, 23 Jun 2025 11:36:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Leon Romanovsky <leon@kernel.org>, Steve Wahl <steve.wahl@hpe.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 linux-kernel@vger.kernel.org, Vishal Chourasia <vishalc@linux.ibm.com>,
 samir <samir@linux.ibm.com>, Naman Jain <namjain@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>, srivatsa@csail.mit.edu,
 Michael Kelley <mhklinux@outlook.com>, Russ Anderson <rja@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>
References: <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com> <20250611060607.GM10669@unreal>
 <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>
 <20250612074157.GO10669@unreal>
 <5a673979-e96c-4dc2-b84b-849c6c8084ae@amd.com>
 <223b16a5-8532-4f5b-b34a-c7a0448f2454@amd.com>
 <20250615064207.GA750234@unreal> <aFAnwZLdGn8zrrqG@swahl-home.5wahls.com>
 <20250617073442.GG750234@unreal>
 <dcc9a2de-95ee-466e-b6d4-64658e315781@amd.com>
Content-Language: en-US
In-Reply-To: <dcc9a2de-95ee-466e-b6d4-64658e315781@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::22) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|MN0PR12MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 899ff0d3-5294-48f9-3672-08ddb21c27b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXZZdW5xMzFIQ2krdTlBSjNrVmNFMjdjVVNBUUxHdldLSi9pMmZtWjhuamx2?=
 =?utf-8?B?OWNRS2RXMzBhYWtDTU1PWDBJZit5aEc2MVRDdTk5MWtaTllGSEtvUm1DNXVS?=
 =?utf-8?B?SklDalZnRzQyTlE3cWtLMTBudmljeUIvcExiWTdZdkxSM1RBN3FoWDhrVUJX?=
 =?utf-8?B?VkZ1c1pxaVQxUThjSUUxalYzcHZuZDRscXdyUmJBTHZiTy8yZkRubmdvbjB4?=
 =?utf-8?B?bHBPN1B5cC84M1VCYnhUd1JBNkNrdFN6YUZPN3RTYWZRajBFamV4OUFuOElt?=
 =?utf-8?B?SEhzSHY0d1AyR29ZbUhQQnRXZ2NCYXVGVXpEMitrYUNaWEltRDlzTVM5dDdW?=
 =?utf-8?B?TXUzanR2YVAva29oa0hVeW1KK1hYOFI4aXJGcXRKV3B0MVJJYmpRdmtEbVY1?=
 =?utf-8?B?MnBabjhMdnhVdTZGdmp1RytmcG1tL3RIbGlPSVhPQlRsWTN6SXUvOENlTjRI?=
 =?utf-8?B?SXpaamtsbmxrNHh6dGdJRGExR0M5aWJFeW01d25BWXo1YVBqdGRKSytYbTJC?=
 =?utf-8?B?TkVWWlJvNDIzb2dTTFJ5L1dqYVljYmxScC9MQUh0KzQ0WVNaTGNGVUZISFpK?=
 =?utf-8?B?MWZjdkIrbUZCc0pjbWdXaXlVQ0dETzVYUEpOVHI5b0NsNTY2MGtLeXg2L1Zr?=
 =?utf-8?B?NW1XVTB3SHcrd1R0dXpmNks3ZE9ZRVRGR3ltVERZcWozWU0vUTBnb2lHT3VK?=
 =?utf-8?B?ZnFRTlBIT3lpOWVuckswcXc1TmpuWUxpYWNOak5CWFk3OU5CcThJN1RQWGM0?=
 =?utf-8?B?NERLTXArNWNnMmJsR0Q2SGZoVE40UmhVSVJzY0hNNFoxbmhVUEptOVNSRTFP?=
 =?utf-8?B?VjZHZnllWGk4M3hmMmVKTCtON1BPZGFYRGRjWkQ2K1lkeldZYkZYU0ZFUStJ?=
 =?utf-8?B?V2VkR3FaZS92bTBVZTdteUJ3VE8zdHNadUdLZDdqTUsxQmdpWEZhakJsUlQy?=
 =?utf-8?B?MDBsbStQUlV3Rzh4SEFjYTlWV0o4ZjVGUjZFQUpINEJlSXorMUZjU0p2Q3F3?=
 =?utf-8?B?bmJCa3NTdldnYk1tWndDR211dm8yMXREZ2p3czhXTDRpenpLQVhlVWxCUjZ0?=
 =?utf-8?B?MkpaZU9KaktCMFlWMG1DQzNpMlpzZUcyNXpuM2o1bE8zdExuUERYYzlaQ2RJ?=
 =?utf-8?B?VFJ4RVoyRFhTNUd6Znp3ZXppZFlKUm9yWnRqNkRPRjdGaTZDUGg0dzYyYWpU?=
 =?utf-8?B?eTV4dDVORDNCb3pXMG9QNG11N0RGSzJLaXNtY01BZmRlT2hxK1FiS0JXc0E1?=
 =?utf-8?B?Z0FsbG1iTC91bG9ndUo4ZncwTEtQU2Q1ZVBndDc3bEdSdmM5TzA2OEdndjFq?=
 =?utf-8?B?dmpTV2FqaXIwK2tTM1BzcGdJOHYzWXBLYUlUMTBmNFBmOTRsM0dMOWJqWENR?=
 =?utf-8?B?bm9XWU5Fd2x3UlNWWnQ5RVhRc09Ra1lRMWZQYU1QMmVGbmpTRzN5eHJLN2Yy?=
 =?utf-8?B?a2dyUU5lWmFpVjJlYkI3UzUrOEdVUGNuejNMTVU2M2d0cVFtczVyZ3E3bHZ5?=
 =?utf-8?B?akcrODlxZEwxWEZMdEJQUXNaZzFXUE9aV3FnZ2VVRTlnQ0JlZkVjRHpuczM0?=
 =?utf-8?B?NE0rbm5nc2ExUERxeDEvSEVuTlJlOXpNUk5vbU9PdzNOTWlicE9WY1BtYWVM?=
 =?utf-8?B?cFUvWUpqTmdhK3ZTcEpTOEVXUjZBNGZtQnV3eGJhaCttYjMwVjd5cDlBUGlO?=
 =?utf-8?B?enhPMWg2WmxrWkZ2TjdacjY4b2h2K3RRU1BpM240ZjVtWnZhNXVSR0JUcW1H?=
 =?utf-8?B?UXY5bkd1MENBOVIyaXJnenhkU0hCY2dyMGdxa29zU01tWXlESlc1WlloS1RD?=
 =?utf-8?B?S1U5WmZUTkxjSXBRcDA4M0hKaHZnSytEVkZsWmVkY2RldFhHVUdsOUpoekdY?=
 =?utf-8?B?blUxZ0pxbjJGVzdJUjFydkpPbzJIM3NCZTZrcDdKRUpxbUI1R09XTXY1RXZ1?=
 =?utf-8?Q?IZ6H7iWZQF0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHUwdXo4YXByTFZJZUNYY05LTkpiOTVwOVNGaDVpSlU3YjJqRlZMRTdndjVO?=
 =?utf-8?B?TzFyemxFVks4aXNzVHRNRzM2NkxvbDJWeFhpQmxWRzVQdmowYTF3UlhzWHpU?=
 =?utf-8?B?RUoxNW84dGVsWTZoNzJuVG9DOHFWUkZ6VUtHL2sySGhDNVREZXlJbzYyQnJR?=
 =?utf-8?B?emUrM0RiRTNhR1YzcWwxUXVyS2lncENrK256bWtJWG9QUDRBSmZPRGhIR2VN?=
 =?utf-8?B?RU5DcnlTUjRaWElrcWI0TUlyLzBYenpIUXNMb281K0NhK1hnRTNpUTJWd0ZB?=
 =?utf-8?B?L29rS2R2UlNLWHF3ei9DQWxlYmwrRFB5NHM0OUFpMXdlaldrT2ZJalpNUjFM?=
 =?utf-8?B?eUtBNloxb3YxN0M1QlNlRm5HVmlBbHRUaUhYOFVyUTdVRUU5OWk3OCt1d21H?=
 =?utf-8?B?UXgyd0IyTURBTEswL3JNbVJ1dlVRK0JndUlxUHRBOE5yOXNhRCtXZ2pPNkhZ?=
 =?utf-8?B?SnRPU0g0UUtka29CQlEwUDNhYlZOZHNVaGp4NGNxa0NLNklsbVQvRmRsY2J1?=
 =?utf-8?B?MGJRK3B1MXlCUU85a0VkczllNEo0RVNsSk9zOWdicm5jT2djWWg1S3gySXBw?=
 =?utf-8?B?a29YQnlKYzE2RU9yeGtQaUlUMCtkaE1JY3FNMlBTeWUySE00K2x0RlRvQVh4?=
 =?utf-8?B?S3ExR3dPaWVVbkg2TlhvSytUc2NsUVZWdDZrVUFuNjhRQVd3dlFiT1lQK0Ex?=
 =?utf-8?B?NjlhU21vUmJ0UlNkbVVDaDFwMnlNQnh6QnN3OXZSZi9xMEFtZzlianpZQTJR?=
 =?utf-8?B?VE5YMUYzRHd6Zmk4SE1VSG9ESHEyYzE1VTJXNVUxNG43YlpIQkpOSUVkY24z?=
 =?utf-8?B?Y2U0V3lHTG93dlo0WU9lUnBneWpqcElTUEIxeVhYSGkyRG1GTFNoSm9vaFM2?=
 =?utf-8?B?bUk3YjBiNDdUaVFXeDUwSTRVY3NJRWlJMFp6MzBGQmxHSGg0K0tIV0FLdzhj?=
 =?utf-8?B?S3ZRemw5blFVMkVpOERxcTd4K05xQTNUZFY2dzB2VU1wTENJcUhLMkRyS2p4?=
 =?utf-8?B?a2lFK3pnV2RnaEt0K0ZXdzA5djN0QUlyTFlRQTlhWmh1WWUwMlRRTGw2SGk0?=
 =?utf-8?B?RWlLTTFrTlN6eTh5OHNlYTFVQ24xa1loOE5xbnNwdDRiZEpINWJWb2MrYjgx?=
 =?utf-8?B?a1dBME5LQ2dDOGdlYTkxOHhZd0RUSncva29xUVNydTdieFVPNURuYkd0Y1JU?=
 =?utf-8?B?VldnMklhb2REZHBva0QvRXczVHhaWG4yYnBFRnM2VnFmR1VDK2hsaGNtSGhP?=
 =?utf-8?B?R1lpL2Z2dnhXa0ZaWHo1LzJhWG1takRpVE9NNGttZ2FDOS94dCszdXZ0cUV5?=
 =?utf-8?B?QytZNjFua0pkMk5jY1Rhc1BrWkZWWW1OZ2l4OGdDTnlSME56VER1YWZ5QW13?=
 =?utf-8?B?VzU0VXJXT2tYZ0RqNWorVWdZdHpUZlgvdm85MzlyU25JU09hNmRFQy80MHNy?=
 =?utf-8?B?azF6c0FvakEwTEx2ME5RRTlFanFFaHNBM0RlZHB3Nm9hWWp1Q1NmOUJKeE16?=
 =?utf-8?B?YUtzUFJRRFEyMW5yRjZDNFhKcUV2eXJTMWRtL3AzNVJtNGtFYnMzWDdUYy9E?=
 =?utf-8?B?UFVIbHhsQ3hwZzlvT2FtQm9JcktWb01LQjFveDA0NDUwVlJWZGFwVGpZLzdK?=
 =?utf-8?B?Vnc3YXI1aVhnbXQyMllGOTFwczJ0anF3V0o5ZW9FVnVlVHBKeGVROFFqTXM0?=
 =?utf-8?B?RzkwRUdDSDRtU1NXTDV1SlBEeEl4bjF1SnRhaFhtU1JuSzI1Qlp4SGJWVlRY?=
 =?utf-8?B?ZjNKUHJlTU4zdm5wSVN0dEZJakkxKzJ5aG9xbmJvWSsvNjZOVVE4MGorZEtn?=
 =?utf-8?B?aFNsN1BvT3JBcnhGYUZGY2d6WUE2Z3NJUjBtTU95RlhTZUJsNjBXbTlTdWUr?=
 =?utf-8?B?WWJrQ2xtcy9NbEppV1pRZjRnb05JOEw3S3JQeUFRVCtxNjZqZzdpMW1CbGNR?=
 =?utf-8?B?Rm5kOGtkU3V0TjNGM3pTQU5UNWp1L1NXbk1GcGlmRUtEdHBnMDlaK0RpbE5O?=
 =?utf-8?B?eDEzY1hmd05JREdCWkQ5RDhIcWNsTnBUa3hTK0dtbnljdlI3QTVqSk1xNWxj?=
 =?utf-8?B?Rjh5WURuYTEvRVdweTE3YzlicGVLNmh5eTlLNk5Ta3FKd1J4RVQyQmVZTEJ2?=
 =?utf-8?Q?NtU9PKp81pl/RkYvs1qQrdd8y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899ff0d3-5294-48f9-3672-08ddb21c27b7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 06:06:55.7138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/VwZjh3bl2Lk2xAgmT5nP1ewJlbg1ugwEThcKAzBX7eUrgOwMal1vS90/CdhPf9y6vgl73WKBEdc1ADdBC0ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6149

On 6/17/2025 2:52 PM, K Prateek Nayak wrote:
>>   [    0.435961] smp: Bringing up secondary CPUs ...
>>   [    0.437573] smpboot: x86: Booting SMP configuration:
>>   [    0.438611] .... node  #0, CPUs:        #1
>>   [    0.440449] .... node  #1, CPUs:    #2  #3
>>   [    0.442906] .... node  #2, CPUs:    #4  #5
>>   [    0.445298] .... node  #3, CPUs:    #6  #7
>>   [    0.447715] .... node  #4, CPUs:    #8  #9
>>   [    0.481482] smp: Brought up 5 nodes, 10 CPUs
>>   [    0.483160] smpboot: Total of 10 processors activated (45892.16 BogoMIPS)
>>   [    0.486872] tl(SMT) CPU(0) ID(0) CPU_TL_SPAN(0) ID_TL_SPAN(0)
>>   [    0.488029] tl(SMT) CPU(1) ID(1) CPU_TL_SPAN(1) ID_TL_SPAN(1)
>>   [    0.489151] tl(SMT) CPU(2) ID(2) CPU_TL_SPAN(2) ID_TL_SPAN(2)
>>   [    0.489761] tl(SMT) CPU(3) ID(3) CPU_TL_SPAN(3) ID_TL_SPAN(3)
>>   [    0.490876] tl(SMT) CPU(4) ID(4) CPU_TL_SPAN(4) ID_TL_SPAN(4)
>>   [    0.491996] tl(SMT) CPU(5) ID(5) CPU_TL_SPAN(5) ID_TL_SPAN(5)
>>   [    0.493115] tl(SMT) CPU(6) ID(6) CPU_TL_SPAN(6) ID_TL_SPAN(6)
>>   [    0.493754] tl(SMT) CPU(7) ID(7) CPU_TL_SPAN(7) ID_TL_SPAN(7)
>>   [    0.494875] tl(SMT) CPU(8) ID(8) CPU_TL_SPAN(8) ID_TL_SPAN(8)
>>   [    0.496008] tl(SMT) CPU(9) ID(9) CPU_TL_SPAN(9) ID_TL_SPAN(9)
>>   [    0.497129] tl(PKG) CPU(0) ID(0) CPU_TL_SPAN(0-1) ID_TL_SPAN(0-1)
>>   [    0.497763] tl(PKG) CPU(1) ID(0) CPU_TL_SPAN(0-1) ID_TL_SPAN(0-1)
>>   [    0.498954] tl(PKG) CPU(2) ID(2) CPU_TL_SPAN(2-3) ID_TL_SPAN(2-3)
>>   [    0.500167] tl(PKG) CPU(3) ID(2) CPU_TL_SPAN(2-3) ID_TL_SPAN(2-3)
>>   [    0.501371] tl(PKG) CPU(4) ID(4) CPU_TL_SPAN(4-5) ID_TL_SPAN(4-5)
>>   [    0.501792] tl(PKG) CPU(5) ID(4) CPU_TL_SPAN(4-5) ID_TL_SPAN(4-5)
>>   [    0.503001] tl(PKG) CPU(6) ID(6) CPU_TL_SPAN(6-7) ID_TL_SPAN(6-7)
>>   [    0.504202] tl(PKG) CPU(7) ID(6) CPU_TL_SPAN(6-7) ID_TL_SPAN(6-7)
>>   [    0.505419] tl(PKG) CPU(8) ID(8) CPU_TL_SPAN(8-9) ID_TL_SPAN(8-9)
>>   [    0.506637] tl(PKG) CPU(9) ID(8) CPU_TL_SPAN(8-9) ID_TL_SPAN(8-9)
>>   [    0.507843] tl(NODE) CPU(0) ID(0) CPU_TL_SPAN(0-1,8-9) ID_TL_SPAN(0-1,8-9)
>>   [    0.509199] tl(NODE) CPU(1) ID(0) CPU_TL_SPAN(0-1,8-9) ID_TL_SPAN(0-1,8-9)
>>   [    0.509792] tl(NODE) CPU(2) ID(2) CPU_TL_SPAN(2-3,8-9) ID_TL_SPAN(2-3,8-9)
> 
> Looking at this, NODE should be a SD_OVERLAP domain here since the spans
> across the nodes overlap. The following solves the warning for me:

So turns out the mask resolved for NODE is all wrong!

> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 8e06b1d22e91..759f7b8e24e6 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -2010,6 +2010,7 @@ void sched_init_numa(int offline_node)
>        */
>       tl[i++] = (struct sched_domain_topology_level){
>           .mask = sd_numa_mask,
> +        .flags = SDTL_OVERLAP,
>           .numa_level = 0,
>           SD_INIT_NAME(NODE)
>       };
> -- 

And this solution is wrong too! Leon, could you please try the below diff
and let me know if it solves the issue in your case:

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index a2a38e1b6f18..e106035d78d8 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2426,6 +2426,14 @@ static bool topology_span_sane(const struct cpumask *cpu_map)
  		cpumask_clear(covered);
  		cpumask_clear(id_seen);
  
+#ifdef CONFIG_NUMA
+		/*
+		 * Reset sched_domains_curr_level since tl->mask(cpu)
+		 * below can resolve to sd_numa_mask() for NODE.
+		 */
+		sched_domains_curr_level = tl->numa_level;
+#endif
+
  		/*
  		 * Non-NUMA levels cannot partially overlap - they must be either
  		 * completely equal or completely disjoint. Otherwise we can end up
---

We can reset "sched_domains_curr_level" to 0 before the loop and that
should work too since all numa levels >= 1 have SDTL_OVERLAP set but
this is just to err on the side of caution.

Previously, topology_span_sane() used the sched_domain_span() which
didn't depend on "sched_domains_curr_level" to resolve the tl->mask()
but since the rework uses tl directly now, this is needed.

-- 
Thanks and Regards,
Prateek

