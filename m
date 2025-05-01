Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D125C21ABDA
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746138447; cv=fail; b=plOBgiUzUlBB0ysVvH/aiVS95gbiS6Zcb8Y0OEg3Un9Yj7JGBsiEtrpiqWUTCELHl+I/XGnY81a3p9qTqvTFA2Y/v5jC4E5FSZHKKR1dWF/1bHnemNVzJd33PmRNpZldb6kXFjknl/TUe6Y1XSgBn68UkzP9ncb76Iwco9t+l0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746138447; c=relaxed/simple;
	bh=DOvmBh+mC2h8HLe4C3FpXXHyQcr8W6b1VlM8igTWpSY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AqJ6MicJKTDU9jncaYvUmhFnsHG6m1ofhPNwtzDmsl207xB4WThYSSBXBiJnug3nAXujpFfFcc0RfCn0c2jvMpjU5mNZ9gbn3Cb1nl/eTX1bYPialZTv45ARSGQKWkyjr9dk9y6j4MxYjn8v3gQqYRWp9L7Oj7H4xxmMz4y3+KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qrpkZTPd; arc=fail smtp.client-ip=40.107.236.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qrpkZTPd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wa2sos9PYQrwD8vtbmMpVq4Z7tMQdxoNkS0LbsCNYNc2POmXy2wfBAapGcs/OX3WjGQmby8CidKD6kCilKyjBGI3Ywc70NrRPeagJB+hamwm9Dblr4ahIklkedLGoGYdgiiXTEzCgTJbu7elctk6M/6ktoanymwWYgmsYsCSSwwFTUUZ6uGQdP34h4QRWENDFqBjELhkK8nwqgXc90nAFXc3pUBlTpqX8r/RcoiZX4v0tKLcLBMPbnXpDNpyo5fik3zUnsSwBzdWxplZA8T/kFh/DtdZio2QkzhgZ6UQxBrTqziSHAZI1ed8Q7MHDEPWwDm+21v/6f3DiFLIyEEhTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOvmBh+mC2h8HLe4C3FpXXHyQcr8W6b1VlM8igTWpSY=;
 b=gQIcOTpjbpoO7WrZduBsnEw5/3SuKGaFpKCXAA6YfVR2HYIKhd1L7kjnjeX05Fqs4ncmcGAGMYKDchROtG5EsTcu+/T8t7TNFVcjR/hG89yJb5AO89Fekm9PdjaUPVruHPMND3RUm4MyUBjcA5Q5cf8ePXJ/NI5d9omQn5sqjwMzl3iGjvkw8mJRsmSnO0KBL23b/tVBkz41XIQFu7wJOHrBeZVDyWronN8zShHEsu8Ox3bKm08UTFIsBIXMBIcBvO+4ng3VTK4nu27oJCyomO+u2ZmnivxFhrNWJJmEVwkX1/T+h9Oa2pST8Pu2HW8b72iABNG3JEkT+RDo6e1AHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOvmBh+mC2h8HLe4C3FpXXHyQcr8W6b1VlM8igTWpSY=;
 b=qrpkZTPdRzgJ5vMv5t4mJ0MPGFWHVGSy8+x3ae9dSKWrWmuryL4zJD7k5I0qD0L6xc/18XhsFfJwjULsOp11k1JPR3HrWBgWPNGQofThfbkF3Mj0dTW6e/5V+PRLyauvxrt7Ra0GpFTiWgNoFiWlYNXZB1ItoCoIH8cOUMU9qu/UJ37c2ISTP+NJdmg21hz5SO6qgSHIhqOKwVI/EegvJVd5yzE3IQ1aXNJKJsKPAj560BdBE+WooivpRu9X1XA5tZFRA53eJkcUbZcekhkHQnRa+jgD/VB44eav8w7x/8L81Go0rtytysm679jdoJONVln2EX+KhU0HkdksHhUKyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CH2PR12MB9543.namprd12.prod.outlook.com (2603:10b6:610:27f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 22:27:23 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 22:27:23 +0000
Message-ID: <d56cab00-f354-4ae4-9a26-fa11f8c1d7da@nvidia.com>
Date: Thu, 1 May 2025 15:27:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 24/27] fs/resctrl: Remove unnecessary includes
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-25-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250425173809.5529-25-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0106.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::7) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CH2PR12MB9543:EE_
X-MS-Office365-Filtering-Correlation-Id: f14dd39e-0b03-4759-d8e9-08dd88ff57be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWN6eE0zTm15SlBKWUUyT25tSEloU2RuRnVHd29Db3kydVV6YjEzbVI4Qzk3?=
 =?utf-8?B?UzZYQXRGUm5pWkZTN0REbyt5QnJLY05JbEpPUDBaWmFZcDZkMFJwSHByd2U1?=
 =?utf-8?B?Y2VRWUNTNllwNGQ4UFNuMm1QSmJjS2srOGtIZ0hhTFhTYlRWKzU3bzVQd3BH?=
 =?utf-8?B?Q0hmUmJaeTlGRVRsRnRTZzd1ZDRSUlZwY1pocjF5aFFXRGRmT1owQW5ZNUE3?=
 =?utf-8?B?T2ZLRHhjUHRoZERXR0R4U3hWY3VzUGl1K3FjL0JEYjdVLzVHcCtyKzNMMTBx?=
 =?utf-8?B?cERJR1Ewa3N1b0NoWnoxd2pFSGp2K3EyaDdwdmhZSmxBWjhIekxQOFRyQ2da?=
 =?utf-8?B?UzdHNktTUFVvU2FJaGZHeDFaYlBWbGZnZVdxYU9YbXpKQmJYWmRQc08yZzBh?=
 =?utf-8?B?YmJteUJXVDBJTEh6c1ZZWW9Kb1VWU0gyZWZVOEwydjR4eXZlRzRpRHZWaEc4?=
 =?utf-8?B?TlBYWnhLSHRBTEVyYnpQa1RyaVRNNWJocVFGaXl5NHpHb2gxMXNxZ01xSlFH?=
 =?utf-8?B?eDF4cE4xVVhmS1dvSmpBNGlzalJqYnplUWpZblRHSlUvZmtTK0E5eU5sdlFH?=
 =?utf-8?B?b0FUT2tYV1BERXdacmZlZDNJVncvR2FyYjVlOC9RSHNFcmQ2S2pnZFFxQTZt?=
 =?utf-8?B?NXV4ZVJsakZuZE15Z3NiOThDRUFha2g0ZDN2bXpUeVdPQ1UyM29KaWFjVmJk?=
 =?utf-8?B?NU90QVRuQ1dwOURzaWdacXdOYTYzSFh6cHZqcTEvSDdTQVNwRGtUTkNPU0lN?=
 =?utf-8?B?Y0dzRDV3NURkeVp6Y08xL216WFZhN1h3SEtUMDFUQXRuckxZT3d3S0d2M0ty?=
 =?utf-8?B?dkE4VnhiUmpUOWZpcGJWdFZQUFQ4OWw4NEcxN0dlUlJiSzRZb3RxRHY2SHZx?=
 =?utf-8?B?SW5HU0M5d1lQeXZaa0ZJVG84VnVSRUVNa2huaFpralVqcWltRmhLZms2UXNr?=
 =?utf-8?B?TW1ERHFVTXQrOEgrNVUwUU1uS25iNS80aVVERTljYXQ1ZUZnOXJjVlFveVY1?=
 =?utf-8?B?Y3NpSGtBWmVTQjIwUk1xWU55dVZzcFA1WWIvdi9mdGNhY2NwOTFXK3gyQ081?=
 =?utf-8?B?Y1Q0OGlDa3crZTltWkhpV0RmZjhrZmhDQ3VRZkhJYWphb0RRaFJxQWhlT1ll?=
 =?utf-8?B?VW11OXdKVUhhdFJvZ0tZU0hyZ1dnUUdrMjVYQk95OXYvTHV4M21tL0VPYTNw?=
 =?utf-8?B?RWplSGJGSHRWbjVpc2xLbExHRFcxb2lLcXVwU3JsMlY1bVU5dGEzSkZWWm9F?=
 =?utf-8?B?cEhJR1licFFrUVJVSFZSVDlPM0huTVFVNEhBSGdtWEJCTy9LbTh6K3FOd1kw?=
 =?utf-8?B?TGR0dzBLa082cmFmMDhLd0tYZXRMWUJrMUdyWWN4Umlyb3VtRXF1emsyRFFV?=
 =?utf-8?B?clNhUnZBT2l4bWtqN211aFlSaWY2dmJnYjhxbTdDUzFxa05YMVRSQWdpdGNt?=
 =?utf-8?B?T3NBR0FyVlpOMUt4U0ViTExERzBndEgrV3JwaXc3RG1TRDBJakNQbVp0NkJh?=
 =?utf-8?B?eGxVMmhoZ04wYkY4bkZyVmVUQ0wwMUVreDlyR3FPMUdrOGxuZkJXT0FQZGRQ?=
 =?utf-8?B?Z3VaWHVnS1lPRVAyZzk5cXY2S0djQk1hK21UbmZrVzlhemdNVEd1QVJoekF6?=
 =?utf-8?B?YStXQkFleHA4UExZelBkTVpyREsxa3k1NHdZUFBGS2puVW55VWZGb0FsTWl6?=
 =?utf-8?B?Q0ZCSW9vRFBrOXM2aXgrd1RlZmoxVzlYQlZDa1JFaWxBczUxc0t3OVJSSmcr?=
 =?utf-8?B?TG1oRjFzKzZxQmtVRGNieGtCOGU2YkhlSlZka1NtNXhyTEZyemF6aFNEaVll?=
 =?utf-8?B?MmY5MnpudDEyclhVZmlEaENhcTR4cUhsUGVURjhtRHFiRUVQSnBlNE5oTHM2?=
 =?utf-8?B?SnZrNUNEdXg2emtmTW5mdEJUdWo2Uis5bWp3Y3lhWU9EUGNtcFZnQlA4NEl4?=
 =?utf-8?Q?+MZQk1jkQBk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlBLbkt4YmJ0OGxma1l5elVoRkVtQzZOSkttOHU3TDJYMU9HaHpZMElDS1Fv?=
 =?utf-8?B?MEJVSDNhWUcrcTZTZkFNU1lvZzM4clA3UjMzckFMM1Bsc1ZVUEJ3MUpYVDY3?=
 =?utf-8?B?eUc5U0FNd3ZmRzBvZCtscHF3cnYrdUJnY3paSEZOZ2l0ZkxCTzV4RkVjZFpC?=
 =?utf-8?B?d3VydzJOS2NwajJFeWRENjhTeGJ1N3U2UHR4NGU3UVdxVXk2Vi9tR2ZSVnE2?=
 =?utf-8?B?ODJ6WFJvK1QrN29jdUxrR3hpTDZSeFlmM1gxN0t0SExaNlpvTE9KbTlRUmRN?=
 =?utf-8?B?dWFsdjZjUnFndFd2QWkrVXd0dExwTWNmbzEzaDlwaEcyQ05wVzRCM08wSkor?=
 =?utf-8?B?VGU3d2dVbEVCTEtHeHJ0ZnZsRlpCNnJqcjFwU2JhNW01bnpDNkh5RzZBYXdn?=
 =?utf-8?B?RWZpNkNTakVyRDQzc3RNRDZhVDkvNnhjbkwyRC90QjdUcm9vZnZGZ0VsYVN5?=
 =?utf-8?B?bEZKa1pVZy96WkpVVk12NUtVS21tNDg5QVVpTEpJbmdFYjRxWnZvTXlhS0w1?=
 =?utf-8?B?bEQ2WlVPODMxdVZaNDQ5VXRYWkRKaGpGbGwwVVdxMHIwMWpQQk9tYjliVmw5?=
 =?utf-8?B?bzVDQVpneXVwNlRuNjFweWptVTA3TCttUnl2TitBbnBSN09SZ0JHbU9qWU1q?=
 =?utf-8?B?U0Q2Wi9qQnl1aGtlSzN6TE00MTFMaklpVkxXWnY3dWVyYU0xK3pralRGNXZw?=
 =?utf-8?B?c0R1N1dZRGFQZDZtZzN0WmJVZDk2R0lGeDEvTG1iTUw3d3NPVTNTQ0ZESUNa?=
 =?utf-8?B?ZVRJQnp1R3hZUGFTL2FRSjJNbmlYTTJVYm1uMjRHNkZEKysxZWs2ejlSZjU0?=
 =?utf-8?B?Smk0UFJYSTMxTnhoeFZXK2lCd0dGWElXNys1cUxGRjdCejRrOUMxZzl1QmxZ?=
 =?utf-8?B?OCsyS3ZMOWtwNmJSbTdTc2V5TGQweXVtL2JIY2xnRXRXc2g4eitkcmpkTGJG?=
 =?utf-8?B?RkhtYlRQYmpYRHFENkdpRE1GQ2lTVE9CbjViSVlLeHpTeWhpRGp6b01WTWZC?=
 =?utf-8?B?TWVFMnJnaE9vZ0xuNkRZeUZaNndKVnZFc2RHTVVXU0V3T2xiTElBL05sdVBh?=
 =?utf-8?B?OTdGMnU4M3ExQTV5b2dRUTNnc0tuYmlPUkRjb1FpWmRDcE5LNmV4UVJwUkw3?=
 =?utf-8?B?eVlhOHc2RjFpT2FUR005aStXNEhvVFh4VW9JRHRLYVlpcFZadEM4Tkg0NlFN?=
 =?utf-8?B?OW9wUGdKejBzTllORkVRYTVWRms2Tm13UEZ0S2NMYUZITFFkdm1mQ1JHbS82?=
 =?utf-8?B?TE9nWmRGdUQzNGQ0cXlmZVJZR0JCZ3hjbWR6WHA1eERBb0hNc1lnZ2UzNXFB?=
 =?utf-8?B?Y3hld1gyQURzTW1GU1lKRFM5dlJ1T1EvZVVaL2xOZThrcmg5cmxqKzR2Z3R6?=
 =?utf-8?B?R1VOc0JXY1F6UFUwNndRaGJkdmdBYVh2cytYbnAva216aS9OSUJXK1NSb1gw?=
 =?utf-8?B?dGI2VlExMjJub1U0YzB6eVdoUW1FbW04dkpKQmRGTmJRTlpJRERoVkw5SVVS?=
 =?utf-8?B?TnNHR2ZvWXc1djJkcmJ6TGhqdUg5U1BhTFJrb09lcjRvSjA2T0ZMazZaazFW?=
 =?utf-8?B?ekMzRzh4Y3BDbER2eEg0dkVCa3AwTUs0eHZxdnVXU2ZWVTBtL3krRFVNd016?=
 =?utf-8?B?RVpOVnR5U1RzZHJiZEE1NUVoT1cvblFBaWM3VG41d011S25oQ09nUjBkYUMw?=
 =?utf-8?B?SG1CeXhoYTJwTVpMa0VsRGFZS3pDdzg4dVFkSEs1Ymh5V1FxRXFkSUlrWGxw?=
 =?utf-8?B?L0RxMUozRDMvWDN0QUw5TVBQcktoMnkvWVIvcjJHaWo0S05oUzIxWUZHWTNQ?=
 =?utf-8?B?Q0dwaXpiVzM5NDYyMXZ4ODBOaEcxenBXcGo5b2dRWUVrRHFNS0ZKS1RBRGha?=
 =?utf-8?B?VVFHWFdoQTFneDRWMkJLaVdUUlg2N3ltZy9Xa0ZQM1laMWR0Q0dCbWFwdWFv?=
 =?utf-8?B?VkVGNTRQU25WR3dlaElKOVFqZjNBdmZ0TTU0dnRFZHh0MVZsZ0p4TDdKQzky?=
 =?utf-8?B?WE9LaXJlbHcyZ3E0cDhRckk4WEI0UHFaQTJXbEpVOXZtV0RoVllsY1BOK0pQ?=
 =?utf-8?B?VE0vS2kySnlOWEdvbVlpQ0hJL281M0plOGxBeUtJNmxYQkhKV1FScllpcU8y?=
 =?utf-8?Q?2W8UiZ1QLw14Op+j8xOQea56l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14dd39e-0b03-4759-d8e9-08dd88ff57be
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 22:27:22.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRywkPrPTsDf40nrHw5RVoljbvyW/WOn2K/TBfJnxUISYptwJA1AjI1xUdfC35TUQgedUqgYgNRJ36yIX9ei2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9543


On 4/25/25 10:38, James Morse wrote:
> When splitting and moving the resctrl code to live in fs/resctrl and
> arch/x86, some code was duplicated. This was done to keep the parser
> in the script that does the moving simple. This results in unnecessary
> includes in the arch and filesystem code.
>
> Remove them.
>
> Signed-off-by: James Morse <james.morse@arm.com>
>
Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

