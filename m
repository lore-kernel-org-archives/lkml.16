Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A023DE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750993503; cv=fail; b=IhmvHiHLr0w5ijG17aoCDaR1uSvu3thh/c875hB8Mky8/84vpXQ08UBNLLMSxhtnrHLVs0WOOblxz5XmID1XNx/iv6m7P7pxofvwE3Hlt4fv6wRKtCZHo9yKyBs0H51CTqfk8Ju9mbh5AvO3wZx74YekfJIIh2Y4EEwoebLVvTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750993503; c=relaxed/simple;
	bh=sD7itENzmoLgj8PVBQM64dJMYs4oGb397VFzcrJpwi8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZxexV6zDqTQerxk95ZL8Xb0WhPQ+kiETrMYaoFEytyeANnIXGOEj9kYMhfJ8Ev2wi7oOwLHDOSn/m5+EqaXh1yv0mRm6HqgSLPkCJJDeTV4u4sYDMN0MegF4tsCjjXgyGHmemwCeNppYzjdvDdR6+Eq+zTtFgU6XVYgoc+2R2C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UNQIPG5I; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UNQIPG5I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DerC7ouAh0GuD312J9EmcL/shejk7mxK9hYX20ovKk4oYRUvIB7qGETwkgaXZNUNjCdpfhua5gDhEbdcQNRXRjDX/OYr7mWlnt9eaInUldiv5+ipQEs3Okuy+27xCEP45Q62NdAbcck4+xSJaUguzzgWM9WVoADMPprs+tz8e4bYj12pCesdFjxIs4SNBCv0OF8ESG72GkfKs9XSgcXpKnkcsZUIj2oAePi3qDPowExgjeGm7DUk8mtEh5mLNIRyKo6QcKDbZXIv7wTl6XqiBn+jxaSqsuSupqAUCX4LGAVtLth/YFUzzNs6AQgKjqT9Z2XvetEzvixNHjdnhaq6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McUDJJVqxEbUjESuX/1pySbrPGf8HpHURdustSSIOmc=;
 b=O+40vsVrvwEaGDmKUausMy4AgEuajYY3FBJRmh0VUY/3IdrhF7cJh7HsMxuCUvxlQaHYoFocwvsWY5lmw/+sb6nc2EfJDeiWM9GR+OJYQD2ePa809UXo/302cVUuHTk4bJXOALxXfyMTqoby7/ZUfZ6qO5ECz4bbxbN9WaGpzw2XuzkFA9TC2qEals8yI058xLpOjTe/+xamL/ObQAt+olQ4kkfzF5DWTIKWxn98wSEZmg5azuxU1vaJFEBagvgaAfdYslDz4ieeQ3Aaj3ZXRmIV0rUp9lYHsfoPGoJLqICBx8KmzKUWleY5/UAbbL2fYrW9oUBwpHiBJKFwSsj2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McUDJJVqxEbUjESuX/1pySbrPGf8HpHURdustSSIOmc=;
 b=UNQIPG5I5hfTwjy3mY9AeAkhPzSSMvB/kmtz7pwuZl+FTqh5wAJF0CSDKHkmPF4sXk60CgOFhOZjBNo1l+CLJy5/aCBecrS62vsbRMUBTiPjEQLZIWaPFDvDgddieKHLID0p23jhZE1Eq1LW6Tz5JjHuWmA0Oc39DPhGdQheQO4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA0PR12MB8647.namprd12.prod.outlook.com (2603:10b6:208:480::8)
 by DS0PR12MB7608.namprd12.prod.outlook.com (2603:10b6:8:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Fri, 27 Jun
 2025 03:04:59 +0000
Received: from IA0PR12MB8647.namprd12.prod.outlook.com
 ([fe80::2eb5:3e47:6c55:1d9d]) by IA0PR12MB8647.namprd12.prod.outlook.com
 ([fe80::2eb5:3e47:6c55:1d9d%5]) with mapi id 15.20.8835.027; Fri, 27 Jun 2025
 03:04:58 +0000
Message-ID: <a8de5df6-665d-4c97-aff9-854ccc49adfc@amd.com>
Date: Fri, 27 Jun 2025 08:34:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/8] Single RunQueue Proxy Execution (v18)
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Qais Yousef
 <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Valentin Schneider <vschneid@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Zimuzo Ezeozue <zezeozue@google.com>, Mel Gorman <mgorman@suse.de>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Metin Kaya <Metin.Kaya@arm.com>, Xuewen Yan <xuewen.yan94@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Suleiman Souhlal <suleiman@google.com>, kuyo chang
 <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>, kernel-team@android.com
References: <20250625203110.2299275-1-jstultz@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250625203110.2299275-1-jstultz@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::11) To IA0PR12MB8647.namprd12.prod.outlook.com
 (2603:10b6:208:480::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8647:EE_|DS0PR12MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a91318e-0313-4454-8c08-08ddb5276679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2pldFRqUTh0SVVDSEFRNFlNdTVEUUtqK0Q4bUFHNG9NNEo5VXBwdnQ4MzBW?=
 =?utf-8?B?OWwwbENQKzV0YUlIcDVRTWZlZmwvUldjdDZCcm9pUGRYaFNjVkNCb2VIS2Zs?=
 =?utf-8?B?SGU2cHQxVEM1SDgraVVFUkdEYlZyM3AzS3N6a0xjVWFoemhDVWVTZnFqWnVD?=
 =?utf-8?B?WjhMdzh6eG1IaU9IcWo5M3FoUHR3TVU2dmk0ZVUycGZWa1pCdEdFZ2dNMDUw?=
 =?utf-8?B?NG1ZeGlZVitGOXZQSGlUMzlvM2kwbkJCUmlpNGRhditNTlVmUFV0MndrMGo1?=
 =?utf-8?B?Ui8wcFN4Yk10NEgyZlprSnJib2QyMGxSNGxLUjVZZTBkY3R2VGQ5b3lPZjZN?=
 =?utf-8?B?Sis0SzdCeDI5eWNSY0JIQWQwUEdkQzNWS2VvUUxWVVBreFlYcFc5dmpTbDBZ?=
 =?utf-8?B?Yk8wVGYzRmhGSStRRzRCd0E5TFpkMWp0VjJlQ1l0NjhMQzJwNnFKQnM5NndK?=
 =?utf-8?B?Q0pDWVJ0bGF4eTJhSWV3dHlQYVVjaGFlc0RkbmFlTkJMODhzNEZhNlBwV2Y4?=
 =?utf-8?B?Uk1BeEEyK2N5UFp2QVFmU2wwVEtoVk93TVpLVmZOc2FWb1NKaDBUMlJuT2V0?=
 =?utf-8?B?SS80K1BFb0puUXJpT1hSSnVzN2F6c1hjb3lCbUVOSjVBZC80WjA4N1BsOWRW?=
 =?utf-8?B?SFZRT0R1QU0rVGh2Q1lxNXM5QmJEVCtpWG52dW1rYjMrc3pTTUExOGRYQzNv?=
 =?utf-8?B?MDhRRzMyRnByR0hUbXkwbzlGRGtGZnZCSXRoQU1OeUdrbUdHejE4U3dmNVMx?=
 =?utf-8?B?TnNrZFRreWZhUWpwdXNUMi9JM1lwWWtrMTJxRjY0OGlOWGpoUWdVYVVBN2s5?=
 =?utf-8?B?MmtnMkNQMllZbU01dEh3YzNlOHUwUmZkWDZNbUxQWnJvZmV4ODZEeU9STVdk?=
 =?utf-8?B?eUxQV0pZSDZYY0wwNnlHRTRJRmV4bThRV3Jsa0k2bDd5SkhLQlNxWnhybVo0?=
 =?utf-8?B?cU13VE5RbngyU25Pc2dFMFg1QkRwTUNhUml1WGVnZElWektKbUloNjFLYzU3?=
 =?utf-8?B?ejE2N3ExcHFHcmtBRVVEK2VOOUl1WWk0YmcwY1k4ZVhvbU9Qckp1QWQ5UmxK?=
 =?utf-8?B?anBKOVJ6R3djakxlblRDbDNybUNmTHFCRXg1NEFTMnJBSkFjL3NwWGtrNFZU?=
 =?utf-8?B?OHlKSytxWU0xWitOYVpYTlliN3ZmUEV3NVFqTWtJTHZTcFhFd3BOVW5XN2pL?=
 =?utf-8?B?OHNQRXZsSlpOQ1N6dGFLRGFROXZZbFAzaGhsOCtMMTQwOWI4amlBOWxOZXVv?=
 =?utf-8?B?V3kxampsZU1tNEV4ZytNSENEYW40c1pVcHdva1ExKy9NbXhDK1h5aVQvUzMr?=
 =?utf-8?B?a3dHN3ZSeG4yM2VBYUtKWVpCZldRNnpJdGJwYXpGK3NSVkFTbDdzY3lCbHlK?=
 =?utf-8?B?eUk5YkFTQ1ZTdkltSDZxZHJTYktUczJkZGdsbTRkMXlrSXdYQStDTWQ0OGNN?=
 =?utf-8?B?azF4N0JGR0JqWlFadytEVTIwMEVjemIwOTNrMXorZ3lvM3U2cmZIbFJYRks5?=
 =?utf-8?B?VVpjWUZmYkEwYVNZZVRhUGJKYjNNcVRHOUpacVp0c0ZxdVVIRmRaSzJNNGdh?=
 =?utf-8?B?eFZpd0xScFgwOEx3T3JaZHhHblRhejFSOEdvaldJWE13ZkJGRmVIVVV6Q2xz?=
 =?utf-8?B?NW50a28xWVFnU2pCdmg0aEI4TDdFMDZYZXRRbHdpRzhEUDZQUnFhRTMrOGh5?=
 =?utf-8?B?d2lPZUNIeEpmNUd0ODFMZFJ0dDRWVkhlMWJrNXFyRzgvVXRNejQ5cS9vMlBu?=
 =?utf-8?B?QUt1SjBEemY0NTZ5Umw4amZuK3hYOUpWRzUraytrby9YU0RhVTRDSEowcWRh?=
 =?utf-8?B?OFB5dlRXV1dmdlVjeHdsOVB3b214MHdmVXgxcEFmbUdsMS9SaVJTR0dZRnJy?=
 =?utf-8?B?elp4eU1SLzkrUy9vcjhwd3BwbmI5TGh0bEEwMUMwYUVvK1FhazR4SjA3YzVq?=
 =?utf-8?Q?C6wayJQoaTU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8647.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0huNmwzSFlmVDk1WjZGZllHalJ6bG92aGZ5VGliNVYrZ0RrS01pdUpvNHBh?=
 =?utf-8?B?OGZXR2kwQnpLQThyalB5L2gwaUxGdHRkUThWZmRnUytMQjdkV256MUREVXIx?=
 =?utf-8?B?dFljUkNlUHlEejhjTW45b3RUeERnWUVkRzI0ZW5BdGMyQjNGcGYwMitGOFBR?=
 =?utf-8?B?NzIrbkRMNWpzODB3bTJvQzJ5TGkvanpKRy9vckI2SVZ2Mzl1ZTAxMWE4amdM?=
 =?utf-8?B?Qm0yNHYrMkhDbGp0c3pRdGluL3RESzd3amZtSERLUUh2YU52OGhrZ3p6MTNB?=
 =?utf-8?B?Nm5UVGN6M2oxWGhjVkJRdFc2UTY2TE5Fdmd2NmRpNFhmR3I2UGxwWnk3SHhj?=
 =?utf-8?B?N2tGL3FZTXJET0NjMWpyNTkybWwwMXI0SXJpSWVvZlo3VW5uUnhLZkxOQlNw?=
 =?utf-8?B?YXRWczJEc29CRkRZbS84TC84S3pETXc2WnFFelNEWDFEU09hYmIwUzNDdVFh?=
 =?utf-8?B?Y3dTamFzdTIxSjlKMVR3SmM0RWJLYzdLTmlVVFJ6TEtYcWJJaVcrY1AyZlZi?=
 =?utf-8?B?bnZobElYLzR6cVRSUFdDUk9rVk1HQUN1L2xTNG16NEM4Z1g2ZWtqbTAwVG16?=
 =?utf-8?B?RzZwaERTRkxkMTYzUEJJb0ZWZXQrNjRrN0RmTDZXTTRwRWdVdkVxRkxXS0dZ?=
 =?utf-8?B?U201YVBHVkswVHJCK0cxZGVETjdNRUtKZU16UVh2aWt2ZHJRR2xuNmtjZmlt?=
 =?utf-8?B?d3RHUUJIUDVQSFJpOWhSYWlQNU9NakJsMitnT0NaYTcwbFF6STdzWElJaUpX?=
 =?utf-8?B?aXJncXRXdUQyT0lHdElaMFlUMEF2VUIzMVBpR21Ma0tNSjBuckJoQS9RL0Na?=
 =?utf-8?B?WHBoUHRuZEdwTmF6TG0rc3dYWU9vakpGNnI5ZXcxRTBTRlFhcTVkdU1rbTlW?=
 =?utf-8?B?bzJXdGd1ZVNkVnR0TFhVWE5wODFZNW9ndlRLSmJSWHlsS2pBWXl2cTV5RmRz?=
 =?utf-8?B?STh1TXhqYXhnV1luV3lGSGhOL2FuK0IyK1lQeThXUDBDZzhIdEF4VERVaTBE?=
 =?utf-8?B?clIrSFFLbGtMK21mRjcyemE5eUpWYzA5djFjVDZvTDZNTjJDL3VMSHc2L2RH?=
 =?utf-8?B?cW5vcDMrczlwZUJpSnRqOENPSTh1UXcvUTFXdkdwZ29mMGpZeVo4WHM2RWxO?=
 =?utf-8?B?WlB4dHRkWjNNbCtmcktpcHJiRXB3QS81VGtvSUVmaGhWUU9mb2RodWhJNVRh?=
 =?utf-8?B?MHN4KzJMQ21CVjA1d3VybUNIQ2dCSURYakJxM0IrVG5vOFBNR0pPQ204YXFJ?=
 =?utf-8?B?Y1VNa0p5Zk9ReVIvYnJpVmJnRVNCTGd0ZFhSWVdCaGhMTUVPUU56N3I2elNE?=
 =?utf-8?B?YkUrdStRSEFOVWdXOVh2dytkK2xTTFJCQ1BRNm1EOUNZTmpvUnJieUJxQ2Rk?=
 =?utf-8?B?TEVIOFE3MXVzN2pOQ0RBMG4waEcybzFTak5JbGJ5TUVMRkpSWk5TVlVVVUY5?=
 =?utf-8?B?VFA5WWZLVU5YUmFPc01kS1pINlNScFN0V0JjcXkvSUR5aVg4Q1czcmNOUi9n?=
 =?utf-8?B?d200S09hSWxEVXE2Rkk0S0NRb0o0TlE2d3VrSW1BcFhMZzNISEs5SS9KZG1u?=
 =?utf-8?B?ODFma01ydGE2OXlGNHJ3bkRuNUhDL05HbS9OSHllMk5ZeHlncHF1aVF2aUJw?=
 =?utf-8?B?U3U5Q1lySUh5VDdTOE9rQTRvSU51OUx2SExnVTFZVjY2amc5K2NCVVdtM3VK?=
 =?utf-8?B?TGZDTEFmMmVoQi9tR1htZXQzUlhaVXhtKzZaZXpZUTdaY3d2V1Q2YVZPTkw4?=
 =?utf-8?B?OENobE9lTG5wbGkrQWl5UDRrRGZBV1NUV2s1OUovY0tUOERvVktjenlSUjRp?=
 =?utf-8?B?NHlacXV6aDJEVnlZWDdTbnhKU0lkNGduVFhqMjBYTDUwM0x3T0p3dGtKaXVI?=
 =?utf-8?B?aEh2bXJiOGRycVlhUnZDTVN1dzJlZ2ptZyticXo0WFp4Ly9CRVhobjkrblhh?=
 =?utf-8?B?VkxIQ08xdHVqVjhrT0FNaVkvbmlqUHM0c21jY0RMQlh1ZHc5YWVJY3hFWEps?=
 =?utf-8?B?ejNDei9nRXFnYzZSdUE0UGN0SFdScXVEaHRTRHBQYzlVQ1NzbkZrZXNTcGFW?=
 =?utf-8?B?cVcrdjZQd2F1YXMwY0MvTWNmNzFxTXFjQ0pCbjJtQ2Nhek5pR0RYcEhBRTdi?=
 =?utf-8?Q?1jQihh4SOa9owrZGcJzC+r6mt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a91318e-0313-4454-8c08-08ddb5276679
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8647.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 03:04:58.7937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AYOvDqL1VUB/YntrVLD95cw1QOvGlEXXKayPKZ0VmQTo3/QYVA/KznNYOkX9N+86vGAczRqJcKl73EyZq7gjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7608

Hello John,

On 6/26/2025 2:00 AM, John Stultz wrote:
> Hey All,
> 
> After not getting much response from the v17 series (and
> resending it), I was going to continue to just iterate resending
> the v17 single runqueue focused series. However, Suleiman had a
> very good suggestion for improving the larger patch series and a
> few of the tweaks for those changes trickled back into the set
> I’m submitting here.
> 
> Unfortunately those later changes also uncovered some stability
> problems with the full proxy-exec patch series, which took a
> painfully long time (stress testing taking 30-60 hours to trip
> the problem) to resolve. However, after finally sorting those
> issues out it has been running well, so I can now send out the
> next revision (v18) of the set.
> 
> So here is v18 of the Proxy Execution series, a generalized form
> of priority inheritance.

Sorry for the lack of response on the previous version but here
are the test results for v18.

tl;dr I don't see anything major. Few regressions I see are for
data points with lot of deviation so I think  they can be safely
ignored.

Full results are below:

o Machine details

- 3rd Generation EPYC System
- 2 sockets each with 64C/128T
- NPS1 (Each socket is a NUMA node)
- C2 Disabled (POLL and C1(MWAIT) remained enabled)

o Kernel details

tip:	    tip:sched/urgentat commit 914873bc7df9 ("Merge tag
             'x86-build-2025-05-25' of
             git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip")

proxy_exec: tip + this series as is with CONFIG_SCHED_PROXY_EXEC=y

o Benchmark results

     ==================================================================
     Test          : hackbench
     Units         : Normalized time in seconds
     Interpretation: Lower is better
     Statistic     : AMean
     ==================================================================
     Case:           tip[pct imp](CV)      proxy_exec[pct imp](CV)
      1-groups     1.00 [ -0.00](13.74)     1.03 [ -3.20]( 8.80)
      2-groups     1.00 [ -0.00]( 9.58)     1.04 [ -4.45]( 6.58)
      4-groups     1.00 [ -0.00]( 2.10)     1.02 [ -2.17]( 1.85)
      8-groups     1.00 [ -0.00]( 1.51)     0.99 [  1.42]( 1.47)
     16-groups     1.00 [ -0.00]( 1.10)     1.00 [  0.42]( 1.23)
     
     
     ==================================================================
     Test          : tbench
     Units         : Normalized throughput
     Interpretation: Higher is better
     Statistic     : AMean
     ==================================================================
     Clients:    tip[pct imp](CV)      proxy_exec[pct imp](CV)
         1     1.00 [  0.00]( 0.82)     1.02 [  1.78]( 1.06)
         2     1.00 [  0.00]( 1.13)     1.03 [  3.30]( 1.05)
         4     1.00 [  0.00]( 1.12)     1.02 [  1.86]( 1.05)
         8     1.00 [  0.00]( 0.93)     1.02 [  1.74]( 0.72)
        16     1.00 [  0.00]( 0.38)     1.02 [  2.28]( 1.35)
        32     1.00 [  0.00]( 0.66)     1.01 [  1.44]( 0.85)
        64     1.00 [  0.00]( 1.18)     1.02 [  1.98]( 1.28)
       128     1.00 [  0.00]( 1.12)     1.00 [  0.31]( 0.89)
       256     1.00 [  0.00]( 0.42)     1.00 [ -0.49]( 0.91)
       512     1.00 [  0.00]( 0.14)     1.01 [  0.94]( 0.33)
      1024     1.00 [  0.00]( 0.26)     1.01 [  0.95]( 0.24)
     
     
     ==================================================================
     Test          : stream-10
     Units         : Normalized Bandwidth, MB/s
     Interpretation: Higher is better
     Statistic     : HMean
     ==================================================================
     Test:       tip[pct imp](CV)      proxy_exec[pct imp](CV)
      Copy     1.00 [  0.00]( 8.37)     0.98 [ -2.35]( 8.36)
     Scale     1.00 [  0.00]( 2.85)     0.93 [ -7.21]( 7.24)
       Add     1.00 [  0.00]( 3.39)     0.93 [ -7.50]( 6.56)
     Triad     1.00 [  0.00]( 6.39)     1.04 [  4.18]( 7.77)
     
     
     ==================================================================
     Test          : stream-100
     Units         : Normalized Bandwidth, MB/s
     Interpretation: Higher is better
     Statistic     : HMean
     ==================================================================
     Test:       tip[pct imp](CV)      proxy_exec[pct imp](CV)
      Copy     1.00 [  0.00]( 3.91)     1.02 [  2.00]( 2.92)
     Scale     1.00 [  0.00]( 4.34)     0.99 [ -0.58]( 3.88)
       Add     1.00 [  0.00]( 4.14)     1.02 [  1.96]( 1.71)
     Triad     1.00 [  0.00]( 1.00)     0.99 [ -0.50]( 2.43)
     
     
     ==================================================================
     Test          : netperf
     Units         : Normalized Througput
     Interpretation: Higher is better
     Statistic     : AMean
     ==================================================================
     Clients:         tip[pct imp](CV)      proxy_exec[pct imp](CV)
      1-clients     1.00 [  0.00]( 0.41)     1.02 [  2.40]( 0.32)
      2-clients     1.00 [  0.00]( 0.58)     1.02 [  2.21]( 0.30)
      4-clients     1.00 [  0.00]( 0.35)     1.02 [  2.20]( 0.63)
      8-clients     1.00 [  0.00]( 0.48)     1.02 [  1.98]( 0.50)
     16-clients     1.00 [  0.00]( 0.66)     1.02 [  2.19]( 0.49)
     32-clients     1.00 [  0.00]( 1.15)     1.02 [  2.17]( 0.75)
     64-clients     1.00 [  0.00]( 1.38)     1.01 [  1.43]( 1.39)
     128-clients    1.00 [  0.00]( 0.87)     1.01 [  0.60]( 1.09)
     256-clients    1.00 [  0.00]( 5.36)     1.01 [  0.54]( 4.29)
     512-clients    1.00 [  0.00](54.39)     0.99 [ -0.61](52.23)
     
     
     ==================================================================
     Test          : schbench
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)      proxy_exec[pct imp](CV)
       1     1.00 [ -0.00]( 8.54)     0.76 [ 23.91](23.47)
       2     1.00 [ -0.00]( 1.15)     0.90 [ 10.00]( 8.11)
       4     1.00 [ -0.00](13.46)     1.10 [-10.42](10.94)
       8     1.00 [ -0.00]( 7.14)     0.89 [ 10.53]( 3.92)
      16     1.00 [ -0.00]( 3.49)     1.00 [ -0.00]( 8.93)
      32     1.00 [ -0.00]( 1.06)     0.96 [  4.26](10.99)
      64     1.00 [ -0.00]( 5.48)     1.08 [ -8.14]( 4.03)
     128     1.00 [ -0.00](10.45)     1.09 [ -8.64](13.37)
     256     1.00 [ -0.00](31.14)     1.12 [-11.66](16.77)
     512     1.00 [ -0.00]( 1.52)     0.98 [  2.02]( 1.50)
     
     
     ==================================================================
     Test          : new-schbench-requests-per-second
     Units         : Normalized Requests per second
     Interpretation: Higher is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)      proxy_exec[pct imp](CV)
       1     1.00 [  0.00]( 1.07)     1.00 [ -0.29]( 0.53)
       2     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.15)
       4     1.00 [  0.00]( 0.00)     1.00 [ -0.29]( 0.30)
       8     1.00 [  0.00]( 0.15)     1.00 [  0.00]( 0.00)
      16     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.00)
      32     1.00 [  0.00]( 3.41)     1.03 [  3.50]( 0.27)
      64     1.00 [  0.00]( 1.05)     1.00 [ -0.38]( 4.45)
     128     1.00 [  0.00]( 0.00)     1.00 [  0.00]( 0.19)
     256     1.00 [  0.00]( 0.72)     0.99 [ -0.61]( 0.63)
     512     1.00 [  0.00]( 0.57)     1.00 [ -0.24]( 0.33)
     
     
     ==================================================================
     Test          : new-schbench-wakeup-latency
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)      proxy_exec[pct imp](CV)
       1     1.00 [ -0.00]( 9.11)     0.81 [ 18.75](10.25)
       2     1.00 [ -0.00]( 0.00)     0.86 [ 14.29](11.08)
       4     1.00 [ -0.00]( 3.78)     1.29 [-28.57](17.25)
       8     1.00 [ -0.00]( 0.00)     1.17 [-16.67]( 3.60)
      16     1.00 [ -0.00]( 7.56)     1.00 [ -0.00]( 6.88)
      32     1.00 [ -0.00](15.11)     0.80 [ 20.00]( 0.00)
      64     1.00 [ -0.00]( 9.63)     0.95 [  5.00]( 7.32)
     128     1.00 [ -0.00]( 4.86)     0.96 [  3.52]( 8.69)
     256     1.00 [ -0.00]( 2.34)     0.95 [  4.70]( 2.78)
     512     1.00 [ -0.00]( 0.40)     0.99 [  0.77]( 0.20)
     
     
     ==================================================================
     Test          : new-schbench-request-latency
     Units         : Normalized 99th percentile latency in us
     Interpretation: Lower is better
     Statistic     : Median
     ==================================================================
     #workers: tip[pct imp](CV)      proxy_exec[pct imp](CV)
       1     1.00 [ -0.00]( 2.73)     1.02 [ -1.82]( 3.15)
       2     1.00 [ -0.00]( 0.87)     1.02 [ -2.16]( 1.90)
       4     1.00 [ -0.00]( 1.21)     1.04 [ -3.77]( 2.76)
       8     1.00 [ -0.00]( 0.27)     1.01 [ -1.31]( 2.01)
      16     1.00 [ -0.00]( 4.04)     1.00 [  0.27]( 0.77)
      32     1.00 [ -0.00]( 7.35)     0.89 [ 11.07]( 1.68)
      64     1.00 [ -0.00]( 3.54)     1.02 [ -1.55]( 1.47)
     128     1.00 [ -0.00]( 0.37)     1.00 [  0.41]( 0.11)
     256     1.00 [ -0.00]( 9.57)     0.91 [  8.84]( 3.64)
     512     1.00 [ -0.00]( 1.82)     1.02 [ -1.93]( 1.21)


     ==================================================================
     Test          : Various longer running benchmarks
     Units         : %diff in throughput reported
     Interpretation: Higher is better
     Statistic     : Median
     ==================================================================
     Benchmarks:                  %diff
     ycsb-cassandra               0.82%
     ycsb-mongodb                -0.45%
     deathstarbench-1x            2.44%
     deathstarbench-2x            1.88%
     deathstarbench-3x            0.09%
     deathstarbench-6x            1.94%
     hammerdb+mysql 16VU          3.65%
     hammerdb+mysql 64VU         -0.59%


> 
> As I’m trying to submit this work in smallish digestible pieces,
> in this series, I’m only submitting for review the logic that
> allows us to do the proxying if the lock owner is on the same
> runqueue as the blocked waiter: Introducing the
> CONFIG_SCHED_PROXY_EXEC option and boot-argument, reworking the
> task_struct::blocked_on pointer and wrapper functions, the
> initial sketch of the find_proxy_task() logic, some fixes for
> using split contexts, and finally same-runqueue proxying.
> 
> As I mentioned above, for the series I’m submitting here, it has
> only barely changed from v17. With the main difference being
> slightly different order of checks for cases where we don’t
> actually do anything yet (more on why below), and use of
> READ_ONCE for the on_rq reads to avoid the compiler fusing
> loads, which I was bitten by with the full series.

For this series (Single RunQueue Proxy), feel free to include:

Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

I'll go and test the full series next and reply with the
results on this same thread sometime next week. Meanwhile I'll
try to queue a longer locktorture run over the weekend. I'll
let you know if I see anything out of the ordinary on my setup.

-- 
Thanks and Regards,
Prateek

