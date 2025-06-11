Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02FE22D4C4
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749625028; cv=fail; b=cl/qF32ReGkYLUOvrpaibwlcHUUekYunvBYLovPMqdbWqn3ER7iobVoTYbQKnGPTnXbhWxQuFTKhzNM+pjlF3FFKdZefLStkEZ2yYXOhKQndreHjBZlTsjWxLem/Qx1kQ4tR/ARTYbnbFAhOrWUq4wiDCYcFYjkSzQZv2tNiCa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749625028; c=relaxed/simple;
	bh=fPkPtvgWiXgQmn+e57+yr5gc4ri2PXRu917F4RtmFls=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dsCoTN+3GazoK8DlR5gDeMeNTQBdEo5DtejKFLISStdvQpPz/EHiYYMnpwp+IePt5uygYcLWZhhUnU7NlvILOrpzT1aAe8Z9EaN6uo+U31fcKIylkfb/Vs/OwGSjcY16QdlFpnAB9Mfv+KB7Mj/N6Mx1sX/fsZ8NC7FgaQNxSB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=G6tdvh4p; arc=fail smtp.client-ip=40.107.244.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="G6tdvh4p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBOOT+XzGILHlNo40tVieg+rqmLuaLcdrOAgwdsaTEA58rovINTn6nUqy89dCHWR4PQyr88JPgvb3ORWqCDGRDRhDeEecVTe+/wSKHlNZrGvKvIpSGQYnMcJ/wjjvQBZwpV2aD2ZV3o63cfxUzLl8Fcrb35f+1OmnfVIGlfjv7cYIR1jqq9RpOFFEFd9x7Vab/CuTVq0OHHEvivFM++Bv29vEKlkXMpiuajmXkTiSkhzCjH7dKfgtFuAL1F9zaDEtFyDdA30YD+ZyLmR/q55r+w8jst1Q5sLE1AnPSnysz8iCn4LyE54nqXXls9dAOGMP0MgfLiZ7kD1+3KE0dhaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxW8htlsgQqNhEBah0Zzoxxvn444M+Z013bI9AI6aHk=;
 b=tVfLYiuLi5/rqsInZLQkKI+E0AfBJzN0awNvdvq7TAMLKUQsC+EYFZUsRwNHOG6PxK3n24uPGv4+fc8fb3Pll5JoVN5iB3AsIl29mNGqv+Qud2lyly/kfZa6I0UFQ9uU2Uv/B7A+gUsov4I1TTa1ZR2fcRr9RTI4NM3G7v95XC5MyXBYRiZ/Dmi71ol1qgqc/H3NGoy4L4bUBzqJFBf6ZWQlckI5xv9XBIjt4HUeeo4X5VQevmsV6OgJB0ZrvPAQUFkx8v/mC0hwgCD8mngGju93jEmCvbQSV7aLqjqmyOAU3lRoDNfi+LTAldJA1VNY+IYJPHbQJ3kusDt+ScBUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxW8htlsgQqNhEBah0Zzoxxvn444M+Z013bI9AI6aHk=;
 b=G6tdvh4pk1J6sDjJPbLmbFKj5NOFurIImS/i2uhh6+PHZhxRCRAuSggMvybEeXMu8Oc2jF0ikclkZcX4XmMvZoL1wLYoOO1f72bdhfAyE15ok7coLTBDai7WpclslJxF7dr4pEn23AwSipxBvd7Sn4NUSPVpuS6Av37bklYs7qA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 by CY8PR12MB8361.namprd12.prod.outlook.com (2603:10b6:930:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 11 Jun
 2025 06:57:03 +0000
Received: from CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42]) by CH3PR12MB8658.namprd12.prod.outlook.com
 ([fe80::d5cc:cc84:5e00:2f42%7]) with mapi id 15.20.8792.040; Wed, 11 Jun 2025
 06:57:03 +0000
Message-ID: <f5fad97d-f880-49a4-9595-ca3f5b41d9bb@amd.com>
Date: Wed, 11 Jun 2025 12:26:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] sched/topology: improve topology_span_sane speed
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
References: <20250304160844.75373-1-steve.wahl@hpe.com>
 <20250304160844.75373-2-steve.wahl@hpe.com> <20250610110701.GA256154@unreal>
 <a5da2e4d-c042-4d01-bfc3-f50ca674247b@amd.com>
 <20250610123618.GB10669@unreal>
 <4110e533-6cab-4845-bd11-11279ebc9150@app.fastmail.com>
 <aEiKCqoaEWnZvlCI@swahl-home.5wahls.com> <20250611060607.GM10669@unreal>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250611060607.GM10669@unreal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::33) To CH3PR12MB8658.namprd12.prod.outlook.com
 (2603:10b6:610:175::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8658:EE_|CY8PR12MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c777a5d-ddd7-4a4e-4135-08dda8b52b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UFdMZFpqelVXQ0JHcXI5TWVaclZTYVVPSktmQmo1anR1L3VxMDgvbjIwMEs0?=
 =?utf-8?B?djcwUmgvU0p1TGNtSG5KUDQ2U0xPQjNDRWxtMkJ4ZEx3aWhJVXkrWCtUc1R3?=
 =?utf-8?B?bHBlemhUdzdGUFAxbGEwdlFhNTZFTzAySDBTdGY1ajV4dVVvb3R1cmg4cU5S?=
 =?utf-8?B?UGJVckQ5VFovTVptUExxQVRINENGZVowd0pwdVUzQlZTWm5Rek04M2RxUjZN?=
 =?utf-8?B?aFJoTDdEek9GUGZTZ21jakt0My9ER1JFQmtvRXhkVzZJQ1luamQxaFBmUlFa?=
 =?utf-8?B?WVQ5cytyckxGLzlteHRrZ2J2ZlBqbTZ3UTQzd0ZYTGtOMjVtQ1RURXAyRHdD?=
 =?utf-8?B?ejlURmQ2UHNRb2J2cEVqcGVSRWFvTEV6M09Mc3U2OHFwZTQ5a2toSDFnWVBp?=
 =?utf-8?B?Nk9CMEEvLzk3Rno5MjNubnVNUGx4WnptQW9Hd0xZdW95amZTcTVJd3BTWmtJ?=
 =?utf-8?B?a2huOUpSOGdqVm1LUWJmRm01V3FQSFgvL3BaTnROajJGalovaEFWSGd4a085?=
 =?utf-8?B?VjhYcnJ5SXdIc3hlNmFyMnFsZDB5UHZ3ZzVBSjBRNW5STDVmUjh4eVhqR05x?=
 =?utf-8?B?alBwcGFpcUhJMW1uUlFMU3IxOUdNRm1NbDBYMFdIeTBIZVR0KzRrSWFYcU11?=
 =?utf-8?B?TFEvN0t3VVdoSEtBV0Z4MjBDR0VqN2lWaEVMVzcyQ3BlUnJ3YTVmTGlwKzJB?=
 =?utf-8?B?Y1JsQVREaWtBcXJGU2h4dmFxbTM1RTVBcHA2RmZ3a1BJOU5OdUxiTzhUWFRS?=
 =?utf-8?B?OEY5YW9rM2E3V3h1cmF2YU9xVDZpdW9PZkVjSGNBR3hEeTB1SUh5dmViTVZl?=
 =?utf-8?B?WVBnSFdqdW4xSWQ0S2xlZXhpdGVJSDFiRVc4WkR4Q0xOdlZ2c2Y5d1RpV2Jr?=
 =?utf-8?B?OFpUYXRMSlRZUlREOTFMME5KTkl1ZG05UmJqOUFCbFYxaDcwbHBVelhOTzBQ?=
 =?utf-8?B?QldsWE9HbGlLUGlUTUFRSGVMUDFTTkJvRDI4QUVRK0doMzAyaWhPSlR6RXF5?=
 =?utf-8?B?T3JWdTZkMkdJLzR6Qk44eDJmZ09BVFVYcE5kb3l3NWtmTUNtZXl5RHZFa3dU?=
 =?utf-8?B?MjNFd0FpaFBpekIvendaQncvdUxTY3FoNGtCcTBwamY2Y2FreFFqQUtyU2RX?=
 =?utf-8?B?MzBLbE15em0xazRrREFna1JaUTN2Z2lZTEcvbnFqQlo0UEpXbHByakFGbE51?=
 =?utf-8?B?MXR3UjloYlVlUFhRK1ZpY1k0Uk1XYkxCTUNJQWFZbkhYeE8rbUpVQnBodmFQ?=
 =?utf-8?B?c3JvTWVoS3JQZXVzSHFudCsrZzlRRm1qVnZWc3Ywd0p0cUtRV1pybnJWeWlK?=
 =?utf-8?B?RWwxZUtYakV1cCtZZUYwcmpyaWRJTHFjRjJHRkJxTFhodEVIcXRFWG85bStR?=
 =?utf-8?B?Yjc0eGVUV0czR2NlYXRqK1o0dlF1ait2VU1zVklYYWNXYjV2c2ZRbk5yV3Ux?=
 =?utf-8?B?d2RLWWNXckxxaXhkZTVKOFdsQjY2MnVqRDJNTTF0SXdEQzFKZW5TZVkyNVky?=
 =?utf-8?B?M1J5NlJUQWVCaUhvUkxRSzcvOGZVVC9kTExrL1lnemFoK2ZTOUl1eEl4Sng1?=
 =?utf-8?B?SEMzT0VtNTlNcmNZU1FYU0VGVTB2bmVsa2FSeElXSmtRTnpwQzFYa09xRE9m?=
 =?utf-8?B?Zk1MdWFyRXJQU3dHRnU3WVhoUVBBdkZlalNYN1FpcTQ2TUlXNVN2bE9TVDZY?=
 =?utf-8?B?UktCaGhUUXkvQ0NFNE1SUU9QWEJ6MnZ0OGVuOTcvUU1QbUdUUmZTVlNNRzJk?=
 =?utf-8?B?SzNyWVRGZ0JtVlhLMGlVTTNWR2tEZWR4VVlBYitabm56SVY1WWc3SkV2bFlh?=
 =?utf-8?B?NURmemdBdmFOQ2YvT1lZOE9PZ0szM1pXNUxBMzVJSUJSL0NmeHZHM2xzTkJz?=
 =?utf-8?B?L2pCWThLZ2t3b3lOdENyS3hqdCsrMVhuKytLSzhncjVrMjFZYzRNZU1jK25t?=
 =?utf-8?Q?nEVN5vLjF40=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8658.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFl4VmtreXJ3eVh5L0N2RGxGQkJDYm5TSUFuQ3l5cm1JUWNjekljdjlzNlJO?=
 =?utf-8?B?TWhMZVFyamRyVjhydTB3SGpDVi9qaWNGVTIwdWk4RDhXUHJ5WmI2Y2dLNjZD?=
 =?utf-8?B?TElVb25WUU16UnBkeXpKeDBIQ1BINWNYdmtXcE8rNy83VjZJNEJlYnA5V0c5?=
 =?utf-8?B?bmsydHdvSForZWxyQzdrZklSbEVsQUFPYkdSSDc2ZThSQjZicVhqNFZWd1Fy?=
 =?utf-8?B?ektNQUNIS256WTlFNDhWNTNPcmJ6R2FQSVZiYlRkWHM0Y0VoeUtDYWNldy9O?=
 =?utf-8?B?Z2tXanRnREFFWnpXeDUyYzdYMVRYRnhuMTBad04xQXc5cVJQKy9CUFdudDlK?=
 =?utf-8?B?K2lISkZJSzNkMTdZY3VpUG85ckR5WGFQa0hqL3NaTUFlTGVhRGtoNlhSc04z?=
 =?utf-8?B?dnZpaWhlM0xWZzFRQVl2UU5JWllOelNkZjZsUDMxZU16NkpwQm45QVJHRHc5?=
 =?utf-8?B?SDBYbGJGN0J2WkdaSWVVekpmVXZxdDVtVFVhalRHQ3FZTGNQNEZVazlCWlFi?=
 =?utf-8?B?NlF2WTc2MHhnNTdsd1ZXc1lmSER4eG9IZTk1RG9PVm4waXFEZjA5c0hOckJC?=
 =?utf-8?B?QUxxbWhTTmpEZk9kZFFhaTM2ckl0K0tYUENKazZJdW51MjJmK1QvdEI4a3Iz?=
 =?utf-8?B?cWV5Zkg5MWszUTBlZFhkYlFVbHVLc202dGNLb3dMVkZzOG9TazNEeFY3amRp?=
 =?utf-8?B?TFQxUllVejEyTkFsR0R3Vm9CWGphQkFpdG4wakl1czVNZWpCMldzYVJkU1Qy?=
 =?utf-8?B?eXluakNNU0c4Y3VPQTBsblhhY1VxMUx0dWpqaThKc1hSMVkwV1ZNaGV1YTZD?=
 =?utf-8?B?T1dOU05qYUNFaUpTWmNNb0pxcVp3a3NYVmR3U2lPUnVWTWM3Vm1lMVQwdy9S?=
 =?utf-8?B?V3hvK2l0bThFTTlIUHpVNWt1YVJhL0p3eVpGSzg3Rk1UQ2YxN04yQTl2RCt4?=
 =?utf-8?B?OHo0UmV5M3lYUHd2VlI3bXc2WDRiMlBqNWdoU285N1JLMi93Nm1lNkhEcENk?=
 =?utf-8?B?T0pjMUw3Szh0MWhuSExFOVpmaXFEUnp2K2s4T1krTVNJVEdmZnA5eEFrWklF?=
 =?utf-8?B?azhPN0dzTFlTMDQxOGZzbVZHSFk3ZlBrY3NQemIzeFo1T255SC81TldwbjFI?=
 =?utf-8?B?Mk9Id2ppV1RCTklsT2Z2SjBZREhmQmxmc2FmMWxBdFRreWsrN0liWW1Hc0o5?=
 =?utf-8?B?bHR3c3h5cTZ4NE9MSEJKY2tnb2RvRzFrRVpkSFhSajRHYTJTVzlBSFRYQTda?=
 =?utf-8?B?SG5lR2QySmp6a3ZpMjZ1R0FhMFZSM1BLVTZxeXlyV2doY2tFN08vZkp6Q1N2?=
 =?utf-8?B?QjNobi9IOWYxYXF4bDlIUWlKVi9IYkRQWkU2WDV0dnRZQ2RMQXkxSkxpSDlX?=
 =?utf-8?B?aW5LTml6aDJLRUszNnNnQ2xVN2NrTHZaTEdJRzdwZU1xYWlJSXZvZ0N2cFk3?=
 =?utf-8?B?aHR2bTVWRXpxZEFncXBzRlRkTjBaeVJjV0VMWjMwS2wyeFBMYUhLSmFOZU5y?=
 =?utf-8?B?U05EQ3lhRmFlck9TQ1VYanZRR0kvRHlzOGxLR2E4bUxCV1YwZlg4RlduQ29y?=
 =?utf-8?B?bHdSVmt3cW5IRVJWaThkV2VIL1ZnZkZMNHJPZ3A5SktMZE5FbUdFVHdsL3Rw?=
 =?utf-8?B?REx5dVlJYmhJMkExZWN5QVFLakkxUmlBZWhWVzd0WXNUSHVWVW5pSjk5R3Bj?=
 =?utf-8?B?RnVQN2VBckNoTjAyeXRvSHRyZmcyYmJ5ZEpDeGw3MjVlTVVhVkNBcUp2NWJh?=
 =?utf-8?B?TitPUHdMUWpLaGR3K2NxQWtrZkE5emVPU3JQVUJ3bzk4MGsvSWlUc2xlSFU0?=
 =?utf-8?B?R2ZISW55MGxubXo1Vkk0bFdUQVhUSjRINXRhaUwwdHBsK1dnbVVXM3BFSGVQ?=
 =?utf-8?B?dzVFWUNneU8veEhXcERCTDdwSUN5eDVJNkxQMXE4L2FwUUVmOHRHODVnMVRJ?=
 =?utf-8?B?N3I0ZVd5MTh1alFxaFR6ZUdnM09Ga21zQk9lU2h6TU43NWRISlRGUDAxWlZ3?=
 =?utf-8?B?ODVVUm56SXVVamtHUXVnbEc4Ukc2WjFGSGxDVVVGSzlRS25kakliV0dNRkcz?=
 =?utf-8?B?ZDVQNXg2cUxpVUJoTzA1RzhxSjlUb01yTjZQRUJmUjZ1a3JuNG5HWWlhQmRS?=
 =?utf-8?Q?dB2JGVpFpsxNd7jjbCanvNBKC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c777a5d-ddd7-4a4e-4135-08dda8b52b9f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8658.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 06:57:03.4957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSM6vujuQ1lxoYn8sZEkNCPWS7gKA6SIoxoKEwHaLVwAGLvUlIWsf2wWZrDzhUs0yv/SjakNgfx758OKvtF6LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8361

Hello Leon,

On 6/11/2025 11:36 AM, Leon Romanovsky wrote:
>> I don't think that's the full dmesg output, maybe a console capture
>> with reduced levels?  I'm not finding the output of sched_domain_debug() and
>> sched_domain_debug_one() here.
> It is not reduced, but standard debug level log, where KERN_DEBUG prints
> aren't printed.
> 
> I don't know why sched_verbose is implemented how it is implemented,
> but all these KERN_DEBUG prints in sched_domain_debug_one() are not controlled
> through sched_verbose.

Sorry for this oversight! Would it be possible to get the logs with
"ignore_loglevel" added to the kernel cmdline? Please and thank you.

Even the qemu cmdline for the guest can help! We can try reproducing
it at our end then. Thank you for all the help.

-- 
Thanks and Regards,
Prateek

