Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855F31531C1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751430333; cv=fail; b=rL//RqjOUHwBVjgtwrtxV1W41lVhksDaUe8Y3NDdSjwXTQz4Pm89at/204ZBe2sGrtGAP/gM1m2GHTgx5wBjsuzbM+nLdFm6AUBKAuH76gy5Z5dwmAYDfQK1ZAb5T+P2ZDDfQqfQfQqwU9DPw/EtvAJzLtGKIXb9mYy2+HLBpBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751430333; c=relaxed/simple;
	bh=0orpo5qNhtokaNNa+C/c/tz+yRpyIdrT+r6KKhjp3Sw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UNzvuETKphvRK6bCPMvNA2MPqC4alBe/zNwTiqp4Bf1/l2YAZ0XyhrrOkwDwjCds4r6O0vRzj8B1jqaf9/yz/uqgQ0gv/J1ZmNhRtP6B5xPk8vNNncea9guQw0AZs21CK9Gr/xbz6GkNS8jLMLaM63vsbylrPlznmENP509ZkQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KzVvyhK5; arc=fail smtp.client-ip=40.107.244.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KzVvyhK5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFlNGafjiPvTlrya/se46Ug5Fu56okrIgamV570p8qxopGtIurgiXM6CFU6fGgoRTwRP/2wF2+jWXdoST72X7zyYYEYNOdYsumyuRZRUOfWf1QTvMcX0q3Sb26XsiTz2e6rutnhyiY8xO1S/hr+8SKDSdBwumqkHE0++/xMj7wk7U53p1fbDccr2q8E6Av4AlrwF/ffBw+Azr2p6rhRYqGQBc3UO6h2Am7voCesMNTr9ltD0wLXtMAFbczJZhPJX1B/fGNoSsKshFBXZFVsLNZuAizKE3I9jGUq5W6BLSgcom+RZBFbAuLTFGJ1jUNVSpNTKoFSj2iA2ebry9f1+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6qWSjRkIB2rlD5G2wqzKZ9V5+y9uDEvY6Us4f5DAn8=;
 b=Xyu5IXTyq3PA9I4GgPs69POtt3FTbD2a7sZNUMG2TU73anAix/dF0HtWJwtf2PRSB7263AYYGbsmS96ByEBmF8l3FMRnzn+/diUm9HRZwAkAGY+epKJUx5OvazKZlUc1WVH05t7CLpQ86yhl1GO3ZNewPRK5urjqwOh45NfpORA7oIMI/nj1B7h3PoMk0Xjme5TlzcCk/Zf5+nv+dvQavwG7QnT4Zg4wduBKbuTw7sQ50GovkakLo3dzyfrnC7pkuS/PcyCwvB5JK2kquxxrz7fAJ6Lugp4UUxxb85JdvGjX7jjDKw/P4uQferhX2tFjPqZf0FxPLkyLwii1DG76ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6qWSjRkIB2rlD5G2wqzKZ9V5+y9uDEvY6Us4f5DAn8=;
 b=KzVvyhK5VzRarxnfJfZL3/eA69u3rsuPBCQoqdKtZFUExIl1P/mQDVwgTPk+/BdkkmRb2kVQIKAc/0/WkrvbtL7ta8R7YG8gIUO6o5a9KL7p/mARl9tJRxzdYwnHTJRbJ4QTHrS/FuP/hAfz1mL7iC5UR90tZF0cgOqMuCoUNOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by DS0PR12MB7826.namprd12.prod.outlook.com (2603:10b6:8:148::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Wed, 2 Jul
 2025 04:25:29 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%4]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 04:25:28 +0000
Message-ID: <9eab6c1f-31e0-40c7-8737-499976c0526a@amd.com>
Date: Wed, 2 Jul 2025 09:55:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Defer throttle when task exits to user
To: Aaron Lu <ziqianlu@bytedance.com>,
 Valentin Schneider <vschneid@redhat.com>, Ben Segall <bsegall@google.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Chengming Zhou <chengming.zhou@linux.dev>, Josh Don <joshdon@google.com>,
 Ingo Molnar <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
 Chuyi Zhou <zhouchuyi@bytedance.com>, Jan Kiszka <jan.kiszka@siemens.com>,
 Florian Bezdeka <florian.bezdeka@siemens.com>
References: <20250618081940.621-1-ziqianlu@bytedance.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250618081940.621-1-ziqianlu@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::23) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|DS0PR12MB7826:EE_
X-MS-Office365-Filtering-Correlation-Id: 870924de-3584-415e-0c2e-08ddb920792f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NlkyMU1MdXp3OFFkSFNITzJaU2NoMUwranYxaTlPTjlyREZoZlZBYm5mbkdm?=
 =?utf-8?B?MHA3S1AxaFdoaHJrbHArUEh5V2V0Q2ZnQ0pIUjJXaXE2WHRMR1dBOEdtRHpC?=
 =?utf-8?B?eEVEYzRpUXM1c0t5YjJSalFxOThnK3I1Z01malFuUEFOZnJHMFp2WUNyQVp6?=
 =?utf-8?B?RWpWMzRSUE4yUDhheXpnOVdhUUdDOW0rTFZOSEhSU0RIVm8wM0JhLzRBZTRK?=
 =?utf-8?B?VTFIckp0V1FuczJwRForM04wZUFuaHJTQlRkNXljWFBRRmxwbVNITXVtVjQr?=
 =?utf-8?B?d0p1a1g2M0dxK2t3QitnOTZ0b3VrWCsxM2QzcXQwQXI5MWEwWTNhYzBKODZr?=
 =?utf-8?B?djJNeXdWcndLaUdEclRQWWZRQkd6NmpDTW9OZ1JRVCtGNU5TdS9nUnAxTnhU?=
 =?utf-8?B?OWx6Sm9BckZoQXV1elMwSjA4TFZKdGRrMkFKZ2UxZCtxaFdtQ1ArbXJMK3Jv?=
 =?utf-8?B?VEZsQmVDdnF2SjY1R2R0Q0pXNHpZcHEwdTd3T3BLdG5raWU1NDM1Z3JtaHMz?=
 =?utf-8?B?MXhLUndUNTM2Z2tkUkRIL3d6NjA3Zk1YMThyY2NnOUpkV0dkTmRuVHNCdlBD?=
 =?utf-8?B?VEI0eml1VWtOOW5Rbm5CRFZ1Mk9QTnVKRndrRlg0dmZJUmNQZlQwN3FocEdi?=
 =?utf-8?B?aGxXRWhvbHJDZ056YnpUVEM1Q00vUHBwUTNiRFhiTlhXMmUyaEZYUkgxQnhm?=
 =?utf-8?B?T1hBYnp1dEtrQkVjWHk2bys0NS9ORUwzdVRKRHEwamFQVlpIT3d4ZWdZMEY4?=
 =?utf-8?B?T1ltUWp0WjEzWmYrUjNFa0JwUWxENHp1VDNwMzR4YWtzQkREbFJWampIZkly?=
 =?utf-8?B?NzlJWkVLL3MrZUNYeDkzdlV5NUYwRG52OWVWSVpsY0F2dThkN3c3T1M0ajlK?=
 =?utf-8?B?eFNZNG1XaExDRVRkUkhxTjVISUltQ2RsREwwaU9zUWxaU2RpYkJjSzhneFlx?=
 =?utf-8?B?cStrUDNHZmZFVWcwSE5zdEhxTlZ5TTcxbTNPNjU4SVQyeitxUkZDMHVIRldY?=
 =?utf-8?B?R2ZGNE1TZDRxLzFoSHFuVmh6VWE5TldLdWUwU0VGWmVHL3dGRGZTNk1vUVJ3?=
 =?utf-8?B?VndWS1FwZEkyV1Q0VFRvUGFjTXVubUFTYmNocS8vRjh4aU5HcHZHVXJWOFdm?=
 =?utf-8?B?VnJEcUowc0V0UUU1bDBRNVlteXgzdGRlZEg0NmxyMm1kdUNnazFFZ21uT1NI?=
 =?utf-8?B?NVRZWXd6ektZMWRGUTJpVVhxcHNZaXZBWjZlY3JGUFhOSFVtRFNvQmRicnRo?=
 =?utf-8?B?SUkxU1VDbmJ3ZmZSUGFpcithRWp0L0JzZXNwYXZVa2YvWGVBakcrZmtLMFZG?=
 =?utf-8?B?UE9OM0VJK2xIbGd3ellUdklacDBuRzZjOVd6RVJhWlNxbHNaWndBcHRXNG9D?=
 =?utf-8?B?MWZDSmJBYUw1N0V0dHA4U1RTZWpMZFlQMmVPd2h5cGkvRGtVZHFlcDNOTnQv?=
 =?utf-8?B?WFk3MExHN0ZiUjFHekRpdlZDY2J0b1pldGdETXA0UGF4dkNwdnVNdlZxOEZ5?=
 =?utf-8?B?TEdHZUVxYStLTERJamJpTXdjTkI4WThVM1d2UXNucUsyMVNDRy9BTjRLeE5N?=
 =?utf-8?B?UGd4ckdIT2ppeGV0WkhyOVh4cXF3SVRRUGtRT2t5M2kyeklncEMxVkNQbkhs?=
 =?utf-8?B?d3Fyb082dnhlNVhOTUNiZkxMVjR2MXVWWEM2ejZtWUdxK0wxUUI2MmVKOElV?=
 =?utf-8?B?cExtMW9FZXpNdW82a1VJbGF5cHZERVQzMmoyS1NqbU5VSmJQNmw3TyszNlZC?=
 =?utf-8?B?dHNBdzBzUnFlRkU3N09Wa2w5d2R0VzhCQkUzYUlHQzdLcUdmSjRtcU9CMHpX?=
 =?utf-8?B?RGJVck5STXRHTUNleFJTQ0hXSDI4Zkp4aFRxLzg0OEtOV1EzK1hvbjVYODlD?=
 =?utf-8?B?a0h4eUs0Nk1LMDlab1RVZWJ5ZnYrWHFCQUlNL1FLdG1OeHZMRkIrQlo2aExH?=
 =?utf-8?Q?Saw5wgYjS94=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzJ2Q25hMnFjNnFEaHlzaWhhUmdPMTdLUFAwMlFRYkFxd2dvTnBNc2k3SkZj?=
 =?utf-8?B?QW5RMUNPMGNrV0RGSnFHSnJadm1wdEVpcGFuYThtVSs1NlFvc090cnNEWnF3?=
 =?utf-8?B?NlN3Q3ZKUTJ5QlJnQjRzR1JPbEdxVnc1UVJwdGdDTlVPS1hsTmdZb3pLWlR3?=
 =?utf-8?B?VjF2aWZWc0NhT2pOd0ZJeTdrTEdwRDg1SUdVSU1GTHZNOHd0aDBnRExWSHJo?=
 =?utf-8?B?MWxnbFJOelJwTU5oTEdhOEtUWS9ncllOTjFYU29Lb0dzQURKMXBmSEhkVm1k?=
 =?utf-8?B?cjdsQWtzdTdtWGZSM2hhLzNjWW5tL2ZDUmI0VlZoYXBEK2Y2TjJuVUZkQW54?=
 =?utf-8?B?ZVBVMTFSMXZPblR1UW1VN1VxeEl0eUszdGdwMkIwbmtuU1BwMTJSbmh0a2dl?=
 =?utf-8?B?NlhrYmtaU2VMOXFUQzA2VjV1RG94UmoyQWlGU01DNGF2ekZLKzN0aWZzejkx?=
 =?utf-8?B?eGJLbmVSZWsrZXpKaXVBK2UvV1lzVTRjalIvWE1TM1JmRFVweWUxWm5nbkNY?=
 =?utf-8?B?bnNWSnZyQlFUaWRkcjVFdi9FTEZMMUg5V0wybXJJcWdpTy9IZkVuUzN6aDF2?=
 =?utf-8?B?TUxSNmN2Lyt1N2I3RzZqWW1wZ2NXMjArYUNxT1ZTclJlK1VOTE9pbXZmdEFS?=
 =?utf-8?B?YksweFlvd05kaEJMQXVFVUdDYlFWbDgrcGdOYUJ6SXVzT0lKSlhoZXdKUWdp?=
 =?utf-8?B?YjZORWVtMjk1Y3VSWEJnZ0FQWlpQTkZNNG5oVStraDR3bjJRaDArLzRydmRn?=
 =?utf-8?B?bithL3RZSmcvS2h3SWRxZm5pRkUydW9rSDMyQkFLQzJnMjBSRS9pN0I4c2Jz?=
 =?utf-8?B?cS9YNFZaVkFBemM1dUE4SWRXZXZxMWI2b2RzNVRKT3VRUTZURHE5OXlsYkdQ?=
 =?utf-8?B?UjJUais1aXViVmEwTUgvSWUvUHAzMStabHA1RDRLa1BjWEdrQnM2WUx0bGJQ?=
 =?utf-8?B?TWdDd2lqalZ0UUNRVTlZa2pqVFpnL2MrV0RHajlxZTMzaTUzMGIwc0h0K2xX?=
 =?utf-8?B?ZnNuWDFjdWx6bFM0ejByTHRhWkQ5aWZHY1VLWkNyaVdWQ3ZEaXFQQ0h5Umw4?=
 =?utf-8?B?NnNDOUxSd241NmdBVHZDRWVpbW9lKzc3ODQ0eHduT0IzZC9JakRxdHQrM3JT?=
 =?utf-8?B?S1FtLzNKVmVFdGtoK3phcmxhQzVjTWNPN2lYcUVDN0NTNHZ5UnNCbzU4OGhm?=
 =?utf-8?B?dE1Gb0xtTzRKYzc5RTgzUHdKRDNUNnA1b2xJM25TRmIvUUtUK3NmMUNza2ZN?=
 =?utf-8?B?N1lSQndBdm1XMElFK3J0YVc5QjBQVHFUZmVBZHR5NWI1a3Z5QVFPWUFwMXl1?=
 =?utf-8?B?amZPL1lBMWZtTFY2MHJRcXUwYUxnd3hqMXg3WW9HK1hsREJkUlhrVThHMUVE?=
 =?utf-8?B?S2pqSUtkdmFMa2p2L0tmNlk4cGpaRFFDbWlzQnZBVExVRDVVVU54NklHSEZP?=
 =?utf-8?B?alNPcGRPZndDVjBsSmU1aDZhSW0yMnY0WWZWOXg3bWs0STNybHU0L3FYRFV2?=
 =?utf-8?B?aVd3WDJuQzJzTWY2blpmei9senBNQ2tYcDZwWXZxekFzaGtSRThobkMvTlpN?=
 =?utf-8?B?ME5kT2RQU2cxUFFCNjEwRmRrM2xDVXNGa1VGU0hVR0kzZmJYQ3FOWFZWdGk3?=
 =?utf-8?B?dm1zcVNGdHdwQTl0T3hCRHVac2lHYXJjam4zUVplOGpqaWZhZjByN3RQTGE0?=
 =?utf-8?B?M2lmMGRCMUJndVBCdEwzNFl5NWRBTStaUnZpZ2RIY2VaSG5NcmVYUEVNZFdV?=
 =?utf-8?B?eG9lVFFySGpyOTFQYTM2Q0NYTnFyRklSNExwcm5XU2ZjNHpCRTNmbnF4dVY4?=
 =?utf-8?B?SjVlajBRUjZmektRN0k1L2Y1Z1JjODhCT3ZXUkRlcjNLM0Rrc0kwU1F4cVJm?=
 =?utf-8?B?aGVZdjNPRjl2QzFadUw5MXVwMUpyZ1NuNlhIZ3ByeW00R1J6dXVBSVhiVnFw?=
 =?utf-8?B?WlM1OXJsNlZZdEc2Z2x4UTJTSm1USzFKSmw1SmN0WUVWalhaNDZzSlJYTU1i?=
 =?utf-8?B?N05ISFNSdmQ2NWZiQWRKUURlL3M5T3ZoV01oT3BXbHl1cytwSXhWWUhlWkVo?=
 =?utf-8?B?amVMYUhUbWpNMmZIa3NBM3ljTHF0Qm12eVBIb2VVcFNPRnY3TmFtcytDTmJ0?=
 =?utf-8?Q?6AZQ86G0qYOR56hkI7/44olpD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870924de-3584-415e-0c2e-08ddb920792f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 04:25:28.4813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwWPNITeTgpaV6Nv/29u/UTa8gNy4sYog7116jFfly6iCOcroYQVMviBBFFGj/1Kx5Y2sD6+fx3ub9zZgBj2tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7826

Hello Aaron,

On 6/18/2025 1:49 PM, Aaron Lu wrote:
> v2:
> - Re-org the patchset to use a single patch to implement throttle
>    related changes, suggested by Chengming;
> - Use check_cfs_rq_runtime()'s return value in pick_task_fair() to
>    decide if throttle task work is needed instead of checking
>    throttled_hierarchy(), suggested by Peter;
> - Simplify throttle_count check in tg_throtthe_down() and
>    tg_unthrottle_up(), suggested by Peter;
> - Add enqueue_throttled_task() to speed up enqueuing a throttled task to
>    a throttled cfs_rq, suggested by Peter;
> - Address the missing of detach_task_cfs_rq() for throttled tasks that
>    get migrated to a new rq, pointed out by Chengming;
> - Remove cond_resched_tasks_rcu_qs() in throttle_cfs_rq_work() as
>    cond_resched*() is going away, pointed out by Peter.
> I hope I didn't miss any comments and suggestions for v1 and if I do,
> please kindly let me know, thanks!
> 
> Base: tip/sched/core commit dabe1be4e84c("sched/smp: Use the SMP version
> of double_rq_clock_clear_update()")

Sorry for the delay! I gave this a spin with my nested hierarchy stress
test with sched-messaging as well as with Jan's reproducer from [1] and
I didn't see anything unexpected.

A 2 vCPU VM running vanilla tip:sched/core (PREEMPT_RT) hangs within a
few seconds when the two tasks from Jan's reproducer are pinned to the
same CPU as the bandwidth timer.

I haven't seen any hangs / rcu-stalls with this series applied on top of
tip:sched/core. Feel free to include:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

[1] https://lore.kernel.org/all/7483d3ae-5846-4067-b9f7-390a614ba408@siemens.com/

-- 
Thanks and Regards,
Prateek

