Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA513C3F6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745224541; cv=fail; b=YPCRKIkDYccJgX3pqQKGZq4nEmo5aGwSuwwOmtXpdUVgiBYHOHU7joSuse/FGUCUHr34O0VWbFr79yd5il7Scp6B4u9y1OHX2thykdOhgnFh/yJAM6r/q+cJkeGxfIeFPy2R4FqyIVKH/Tu1vCbo6VjEVuoBu86WZ6qXBz6U1MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745224541; c=relaxed/simple;
	bh=6zQdmkXm3HGL0hBD22dQkZAICvszFe2oNMP8CF0m1JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jW7SxRUWkV0kR3tLuuyaRGrWF4ZDu2W8B2YjdZdPV/ZRKQgaRL1WjGSqLPa0ZkQF9OZ9KFErhR/WA8s3XhDKYHLBeRWPjVFl059OuV0VKdnz64kIa3ggXgNPhP+fRSCO5h+rs1yP7Zwfbrn+Rh/YOGs4bvig57uSv2JotRQw/hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JsFvUUeU; arc=fail smtp.client-ip=40.107.223.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JsFvUUeU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIpwHzMiZBpY7t098NvLz0Tw52UkCWdEHFv7QgPb0V6glFEGqDpCNXxa5KFFfPRe4dBCVCmSoJvvZLiUGzI6G7VLB5v6gUoutS+vtrbdC6CSaAtuSZLi/paTqWljUjWcEc9mxJRwU0Aonud3Iioj+NVmN9tmR3lo2S7Oyi9jBh2kVchtEyb+ntFXQCK09u0EbPfj/ZgQL1pf7bV5LQFwCOAAa/TLqkLGi1u6H4a2+Ktemvbctk5lu5LaGfjfq3D1d2gBVkEHd9F4gqhqpqLTkJhB2MGBBNRUXEp7tLNDw8Vg/aNnu9hJGPH3yOEXWhP76Q/qYXxnaKHxU8TGZ0LXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScOXvBB5JwQz2z1Yyd5kBBETONyADbQapsyRv96+caE=;
 b=fmo5LUpyQQYinoeFVzTtQoTpKuKUw1m/yAceXsdCPpSLqpt147uLgIKktLAlYASHOx2Afu6k+HqrwQXYW0ZYR52ZBHPi9lQ8f5+kJFt0CI6Y214G71GihYHiUSat+v9KSbVB/LOEjlHumLF6bjnSwNyxB0RRo/ejJwjooyTE+aHCbliOSNwUjvLsxnfBCjaEHynPlixaO5x075JKTaRKu/Nm3NZDcxmigYzDfdscmBjOlphM3XA5ORlWCjctJNPj2H6/dGbCo8KuETG7veoq/zYq4u4DkaMvi5i1VL41THaxIGXsYAd/0F5bxdrqXkoWsQ3SAnsRy/hUQUSXt+ZVew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScOXvBB5JwQz2z1Yyd5kBBETONyADbQapsyRv96+caE=;
 b=JsFvUUeUDotdV7DOSEf3OBDIuSq/3t7vUjkIzD3AcctSIIWBvMMnhqa9lFltSR+olYnTgEBzy6JRJ700I2DDlyFEqw89aMtz8o9U0jQjulLqoxG60ssHj8eEOLAAgR3jfVr578JPN8h8ITZtbhyuDM7zcpocPFZqpfI5FXZg/AnQvOyUlEQpJXfNc1sJR5Km19Tp3At2ygtsp12vDa3kEHARriF5fCgC06thJG+YtwczINetekzNmKMYFL2Um2QCqN1nt7B1Kz4EorQ0USR+v5GXlWvVKii1z+LvFqPa4AeKkleO1GyT8PZWYYXp4RRvBwA7+cIVUbHcLyTrwvXmSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 08:35:36 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:35:36 +0000
Date: Mon, 21 Apr 2025 10:35:26 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Changwoo Min <changwoo@igalia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched_ext: Fix missing rq lock in
 scx_bpf_cpuperf_set()
Message-ID: <aAYDTp-c3SV_Lnsz@gpd3>
References: <20250420193106.42533-1-arighi@nvidia.com>
 <20250420193106.42533-3-arighi@nvidia.com>
 <32e5c7cb-5b41-4e02-81d4-5bbed981ab03@igalia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32e5c7cb-5b41-4e02-81d4-5bbed981ab03@igalia.com>
X-ClientProxiedBy: ZR0P278CA0150.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::14) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ade8cb2-7f07-4406-0733-08dd80af7cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFJ5aCtiaFhpN1NNQTVSRDY3TGN1SDUzY2l4aUE2VWNoM1psVGgydVFIcGxw?=
 =?utf-8?B?bzcwbDlJa2RHWXJkOXJWLyt1eVljcndPai9tajBoQStxNTR1bERmc1N4R2E2?=
 =?utf-8?B?RUovZ1hkM1AyS1M2Yml3NEJwS1pzOWQ3L0pBZGNzM044WnVHc2hEOWplZGdG?=
 =?utf-8?B?UG9kYk9vNXVpMVI1S1dpNkJPT1FZTTNqd2tJd3JrN1FqdFV2cWRVK2tDY0pK?=
 =?utf-8?B?L25KaFB5c1djOFhTaStlcUdEYXJMQmMvMXA4NUljU1lWNkZvUGdlQjNhZ1Fq?=
 =?utf-8?B?MGFVVVFVVVNTc2NwaUdlTmoveXlpTkdkdGYzTVhuZjI4enZQZ0tXZGh3MmFG?=
 =?utf-8?B?czM4SjNwVTZnZWlrdndMRU1rSUcrUU42MjFmYUxqUlh6YkkxQXVzTUJaRGlX?=
 =?utf-8?B?NWswcFA2cjVLQkgvSzJobExacDBSSVB6VXA0LzlSMHVhMW0xNWhjUDBnOURw?=
 =?utf-8?B?WlBhcXRqZXB2S2F1MkRUQW02SUY4eW1EU3NEcXg5d1lIQklEcC9FWDBCckx1?=
 =?utf-8?B?UUZzdFRlNkZ0Q2ZDY0R5Wk9VRk1saGVCMEgxZEpGVS8rVk9wbUxOWno1TmhL?=
 =?utf-8?B?VGZFVVpldURXR3I3eklLYXg5Wmc3WWtHWFdreDJJNlpqRkhaQWZuVzZrYmZX?=
 =?utf-8?B?d3ZuaEVacis2R21VdExvVlBsd2xOakM5SEpuTGp0M3BvUEFyanBWdEZaZkRZ?=
 =?utf-8?B?V01WdERyNnFUV2ViM050bXo1S3Q5RUpjcEsyanlNVjlacFhXVHdMUUhONytT?=
 =?utf-8?B?eFJheE9JditNbkhlTU5QaW5mU3ptUWxLd2JFdFpvNWdqMXFmNmNKbENFWUhZ?=
 =?utf-8?B?alJuZGk2NEZ6VUV4eVdNTjdCYWlrUFZ4bVZ6QWJNSXRVeU9Kb2x3em9paHJw?=
 =?utf-8?B?UmxjWHhlUlR3TEk4bFQ0S3IzaDBKZDc0aXZWcFhMT3FQczNHdFkvZFlYakJy?=
 =?utf-8?B?UXhRT1VSc1VRYzhJSXAvZkdrZ1k4TS8vTjlVbGtyQVBEeGZYbDB2OTBKNnhE?=
 =?utf-8?B?VjhxWHFMNDY2ZUwyVnd4Uy9CY0pocFkvcXg1TnZDT2lNbXEvQjhYSHNBODZM?=
 =?utf-8?B?UnE5ZTRnUDltb1ZDTlR5Z2N6UHp4ZVRWa21DdlZHTWg3bGRjRVJnZEZmbGtx?=
 =?utf-8?B?Nm1ZVnBvTnpHTUp4UlNqejVJaTJaWS9WcERLVFdWUXJjZE11MVhGb3owakhF?=
 =?utf-8?B?MkE1SmcvblMzV1JSRU9EQlZITlVTcHphbTJYSHovU1l0VXZkaENGSnhYaWdr?=
 =?utf-8?B?NmJYSGcyODl3aHRoOXNPWEtFZUFRSEZpc3RJV1FOQTd6ZjJHUVpXVDV5aUFi?=
 =?utf-8?B?Nys5anFnVk5EQ3BUYk1KMlNrTEttaE1kZ243ZERwYWFSSmNVK2J5dk1Pa3pv?=
 =?utf-8?B?RXRCL1VoYkRQSExHck40R1c1akFlOUozN1U2eDFiU3QxdUkwYVVic1ZFSWl3?=
 =?utf-8?B?OTczODFHbDNNa2lZcDVDMk1RS2hDRVl5bHA1V2o1b1JQWjZaL3RtdDJIU2Vx?=
 =?utf-8?B?KzhPKzFhek1iV3FXajZ0YkVickhJak53b3hsckZRRFdvNWhIRXVpU2Vnbnlq?=
 =?utf-8?B?MitNU0J6SVhqWE5uUnQwamg3VHIwR0VIMmdtUWFqTTd1QTN0UVdwUkljZW5F?=
 =?utf-8?B?K08rOW1kVUdUS0ZpOWpzZG1lMzl3MlFEd0lmQXRBRkxyZFRJMHY2OHhwZ0lj?=
 =?utf-8?B?cU9vTHN1ZG5melpJRUdDRjl5MmtVNFQ3c0pHNjliaHlKMWpqRFpST2U3U205?=
 =?utf-8?B?OFJTVzJFK2IxWDZ1aExyRFJnMStOZ2Roa0RVempGUXYwRExtLzY1NEVtRllJ?=
 =?utf-8?B?ZVAydlZQcjMvY2ZtRUxqUGNZOTdxdEFkMHdXbFV4OUFXazZrSHRZOThxc1hT?=
 =?utf-8?B?blZMOXpCVnNxUnMrNTlCYmlRR3ZBTG50SnhydmxQZkE0TEkvUlhISmg4R3ZK?=
 =?utf-8?Q?rJxNod6B6NI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTRKaGZVQUNHSXFBOG1YVWF3am1MZi9SMHc1ektiYWNzbVZxS2pDb1NHem9I?=
 =?utf-8?B?T3d0YzFBejNXeUQ4UENhVmd1RlNvQWw5YlV2UE40R0xCNkdQS09LbFlCeFE5?=
 =?utf-8?B?TkU4UjZDVUxOQUFqekFQTFJJUHVTOGwxRmEvQlZzSmdBYTFmMkU1bHYyL2pz?=
 =?utf-8?B?OGRBdmxjc3NRbHVnd2NuM1diV1VuN3JZb0hHZHpKWVB4VkpibHhZOXgrSVhx?=
 =?utf-8?B?ZlU2QTZmQldWS2U4blg2NVdLY0ppZjk3THd6VkNReE53K2s0WnZuKzYzTWRD?=
 =?utf-8?B?L3hZZDd1VDVGdFNhL09xZTJVUGVvcmt4NStYRTRvdHk1d3NHR1FMUnVGekky?=
 =?utf-8?B?Z2NhcklkTW16Y05OcE1YUkE0Q2dVdHB2dXVJRlJSNEtzdWowVjVtT2JISlZr?=
 =?utf-8?B?OFlKWHRhMlQ2VGYxTU5GT2JadDZWTXlveWZUdE81L0hDcWZtUm5HbWRWTjhx?=
 =?utf-8?B?VGwvUDJ4UzF2bkt6N25qUFFmMFRMZjNKcGpEQm5kSEkxS29veWJjb0NZWmov?=
 =?utf-8?B?V1RxT1ozWmhxYXR5T2hUb1NnaUZJZzYyOFp1YUYwSUZkU1VaTnZyd1pnZktm?=
 =?utf-8?B?VEdTSkNvMU5ibjl6dzJpMTF0VTZ3b0JSR1B1QUtGbWVPeXBMQWhQcjJ2NEZq?=
 =?utf-8?B?empwaVBYbDkwaG1MOHd1eHBNRGVmMkFhTVdoZUx2dkZVVHdIQ1JMZWhDUWFJ?=
 =?utf-8?B?a05QaXlVeXZDL3p5aFB5bkQwdHFzeXo0SVRWaXpURW1Ea3JQZ3hnbWNFKzVE?=
 =?utf-8?B?MmFRaGgvcEhzNjN0SG51UGEyYlpoMERnVVNEbW9QTGhJT2k0aHNxNzdybDk0?=
 =?utf-8?B?V09iY0xwK0lNZHpVUDZDdEdDeGJIVTBIYk0rMVoyU2NsVUVESXBYUHZzRGQz?=
 =?utf-8?B?SjBtSGNyMGZGOURPb09SeXFkY2NRVDZyVjVOMTh0aWFPTUNDNjJVUUp0enk3?=
 =?utf-8?B?QnZBeTFjYkZ3b2k0azlnc0ZjZVNSK2E2bTJqR1c5VndqUjltSXBpMDYxQTNC?=
 =?utf-8?B?eHVhbWRxcm9IeExoZHZ0bDdpMC9PZmxBUUg2WHhOaFpzQkdLa0FrS0VBTVNs?=
 =?utf-8?B?Nm9YNGc5WEtBYUZoc3loYityY3VteDN5Uk1WcVQrbVY4QURZVVAxem9XMW1z?=
 =?utf-8?B?VnRrM3NVUURwa2NkMDE4M0FNbVNBWEYxMHpXcHZ5RGREbmQ3b3VNTzU0bGFr?=
 =?utf-8?B?NTAzL212QWJJNUlRNkRzNmFUZ2ZQaTR3S3RNeWUxL1phajZFbTRjSzBaVzZy?=
 =?utf-8?B?R3ZVNzZDcWUyN28rRXlIWThwa0xBcjBvNktMQW5kK3FwZFdtQjl3VFJDVVlI?=
 =?utf-8?B?NVRLRUtKMm1MY1lHaENpSUtPUTNLQVdRcUEwejdYYWNMalFWVmpyNmRjeG0w?=
 =?utf-8?B?dGZtVlNmc0hqMG05TGU2S3duNFM0dkVGTHVuQTN5Wml1NDhjdUZROVFJczhV?=
 =?utf-8?B?cUVHSHFpb2pLWm52YlR5aHhPTGU4VG5oVkQ2UXlQRW5oSGlTb0ZBMnJQZEZP?=
 =?utf-8?B?UmkwaEp1Tm82RjhDbFpVdk5wbWZDYXZFR1VGMk5QSDR2N1pUMHF1ek5Pdzdm?=
 =?utf-8?B?djVuM1lVZVgyMjNIWW5GMGdZbjczeC9NS1gxNXp6SGcrZ05vS09aUUpaNGxx?=
 =?utf-8?B?WmJKVTVaaUNCaXlCdDZzTVhueTJkZXVGeDlsYkRFYjBEaWRrMDFTU1NQSXdS?=
 =?utf-8?B?UlhldTlaVHY3MkMxZEhtOEhQTFZqbEhRem5zbnBScXpvcjZmaWp5R1VqRE8w?=
 =?utf-8?B?WCtYOXA2WlJ0cVlsVllRNm1zOEd0ZHZkOFB0Z0NuVkNFYVRUcnhBcmFOc2tR?=
 =?utf-8?B?Tmt2b29EUURQWnFMY0lVOGQvc2FIWGFFeUpkS3A2YWpaZndoQkRrNXNlcG1W?=
 =?utf-8?B?SVF2OERUcHFydm5ZK04wSlgyOTl1R2F0cDRjWWhrN0hEeElUVWVzRmp0UGU4?=
 =?utf-8?B?ZlJocENkNTUyK3ZrNXZVZ0FBVU5aTHUzclpSVnhzS3ZZMUVOMTBUdEdvVVBZ?=
 =?utf-8?B?SnBmL215NjdFY2ZpdEIrczNFZk1jYU1wYzlzMEtmSFZxMXR4Y0xuVkdGWi85?=
 =?utf-8?B?cE50SXN5c1V2ZjJad0IraDBQRmZjUFdUYUJaTGZqQ3djSGRaZ2owS2tnSXlp?=
 =?utf-8?Q?lhXhQ3JeSC8UIvpXEabVCMyHn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ade8cb2-7f07-4406-0733-08dd80af7cda
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:35:35.9804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: az0U1PtKiqRBGUMbR0N2ij59pUXkPNWQPS26xqIuv7Xh92U3oSbpEBdDWMq9GB5X0szMt9i/Wv+kG/nbb5h1Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196

Hi Changwoo,

On Mon, Apr 21, 2025 at 04:44:02PM +0900, Changwoo Min wrote:
> Hi Andrea,
> 
> The patchset looks good to me. Thanks!
> I have one comment, that don't need to be addressed in this patch set,
> below:
> 
> Acked-by: Changwoo Min <changwoo@igalia.com>
> 
> On 4/21/25 04:30, Andrea Righi wrote:
> > scx_bpf_cpuperf_set() can be used to set a performance target level on
> > any CPU. However, it doesn't correctly acquire the corresponding rq
> > lock, which may lead to unsafe behavior and trigger the following
> > warning, due to the lockdep_assert_rq_held() check:
> > 
> > [   51.713737] WARNING: CPU: 3 PID: 3899 at kernel/sched/sched.h:1512 scx_bpf_cpuperf_set+0x1a0/0x1e0
> > ...
> > [   51.713836] Call trace:
> > [   51.713837]  scx_bpf_cpuperf_set+0x1a0/0x1e0 (P)
> > [   51.713839]  bpf_prog_62d35beb9301601f_bpfland_init+0x168/0x440
> > [   51.713841]  bpf__sched_ext_ops_init+0x54/0x8c
> > [   51.713843]  scx_ops_enable.constprop.0+0x2c0/0x10f0
> > [   51.713845]  bpf_scx_reg+0x18/0x30
> > [   51.713847]  bpf_struct_ops_link_create+0x154/0x1b0
> > [   51.713849]  __sys_bpf+0x1934/0x22a0
> > 
> > Fix by properly acquiring the rq lock when possible or raising an error
> > if we try to operate on a CPU that is not the one currently locked.
> > 
> > Fixes: d86adb4fc0655 ("sched_ext: Add cpuperf support")
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >   kernel/sched/ext.c | 27 +++++++++++++++++++++++----
> >   1 file changed, 23 insertions(+), 4 deletions(-)
> > 
> > diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
> > index 51dad94f1952d..6b6681b14488e 100644
> > --- a/kernel/sched/ext.c
> > +++ b/kernel/sched/ext.c
> > @@ -7088,13 +7088,32 @@ __bpf_kfunc void scx_bpf_cpuperf_set(s32 cpu, u32 perf)
> >   	}
> >   	if (ops_cpu_valid(cpu, NULL)) {
> > -		struct rq *rq = cpu_rq(cpu);
> > +		struct rq *rq = cpu_rq(cpu), *locked_rq = scx_locked_rq();
> > +		struct rq_flags rf;
> > +
> > +		/*
> > +		 * When called with an rq lock held, restrict the operation
> > +		 * to the corresponding CPU to prevent ABBA deadlocks.
> > +		 */
> > +		if (locked_rq && rq != locked_rq) {
> > +			scx_error("Invalid target CPU %d", cpu);
> > +			return;
> > +		}
> 
> 
> Considering almost all chext_ext ops hold an rq lock, the actual ops
> where scx_bpf_cpuperf_set() for a remote CPU is possible will be very
> limited. When there are more use cases for remote CPU kfuncs calls, I
> think we need to come up with some mechanism, for example, extending
> schedule_deferred() to cover more actions.

I agree, in this particular case, I think it's perfectly reasonable to
simply ops error when targeting a remote CPU, I don’t see any valid use
case for changing the cpufreq target of a remote CPU while we're holding a
rq lock.

We do have some users of scx_bpf_cpuperf_set() that invoke it without
holding any rq lock, for example, scx_rusty/wd40 and scx_bpfland can
set the cpuperf target from ops.init(), but this scenario is already
covered by this patchset.

In general, we may have APIs in the future that may need to modify
properties of a remote rq/cpu. In such cases, extending schedule_deferred()
sounds like the right path forward to me as well.

Thanks,
-Andrea
