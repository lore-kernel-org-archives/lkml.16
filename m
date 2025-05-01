Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C045121ABDA
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746138356; cv=fail; b=NY0tz5d5OzujDzg1w52sE30dHe6VR/iMcI/drtw4qiKqR2B9NonNE9THsxfmAKyFEOYx+ysJb3cLHTol84jy+p7LR1XITXg8HE1Pw3xzv9lBkLKtNtEi5OBI+/B+hlRi4XTN/8XoJaWbRKSNn1mPW39aS3qMyH0k8GoGJm67d5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746138356; c=relaxed/simple;
	bh=/rd4Psx2hbn5VzW9/nLaXrU/0+3YCtB2LmebUh/fzDU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vEUA1JFgmriD56IiwgOI2DbRSbfRFfv5yv5GOrXc2aX/muiXwZ/Rsz3MVw1oomhurYqPo9xiKJ1uZ7AWps1LFhzgxzSugyaV2Wnjw2ydqMeufM5+jfykr11F5aMdE9LlviG2Z7vDYmp39Z9UOiGYlginWpjdRA/Txj+fx4drW1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P6aGvxci; arc=fail smtp.client-ip=40.107.236.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P6aGvxci"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cr1HgRNcxu2hUNLbHURD7cvXEHBgE9L2/0D+RShi+RFzl+2OVF4DeIRA1LqlKb5X8lB7rJTyD0DuFiAUl8+JFaz023SAi/i9zEJ9l13CwSBQ6yi0hHcPVwn4o+mN8nX5IQL2QlO4z/563yt2xNW549MdjC3oRpTc0H9gjaoOr1bOon/DlivmXUnKY33gGEFPcUw9aMCYc9q8QaKIjI30GlOFPDt0xTQUQqnizfwHAxqlbxJwTwgCxdp3pecqaeJOuJPkC684fimJGlXloxf5kjcCiDixBEArFlP1nbom4F0U6NsHw346bTF4K5NMwX9vUk+8vUpRVulcGxo1i8wB4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rd4Psx2hbn5VzW9/nLaXrU/0+3YCtB2LmebUh/fzDU=;
 b=Tn9WcnwleX1xB42+M807Hij+A3aPckGE38iQQN4zZKQjV3uuDqvEXWFajw+KknNr6ytNskgFvCTXzvGAkFldLUo0SdZGW0/gIWJTsO0RM3JiVgnzf+pLhq56tmY+pEV78aFXDFKWVK09bSvc7UO57nj/q5PT714cT9dE8RvQ3+89U7thsO6i7z84Q++aMf/+Jc+xEeZlzrc62yEOrclto50XgEkZ0wJNlj4WBBRyEUJUAjXgUpR4zc9+M7YIzoO8HwjDBHLv+EgX/cLLr4y79nNbZ6Ew8djLa3lcOMPcuCfqF50TKQjDxTm9yeIm5yRKs9wtWZQi4CzcemZeRo5E0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rd4Psx2hbn5VzW9/nLaXrU/0+3YCtB2LmebUh/fzDU=;
 b=P6aGvxci/R3yT1rja6UBM1zLvWfvSX/KKPTUrOzy9/p8MfdP2VIqnxR4ZAy9sjHJe2uF4GoyPzlBn1oJqgfQllsgfHzJEUH+XBdGODILKdo6zwD+0M4+Xx1yWD65BbaOL/KXH2znT+oQw5e+GP8+MMSV+qd596k3dKClyXHdYZsehf4wKDoPeukndk8Ztsb/2MaLUZcc/2I1zwsEQktaq1kuQZNqRoyell6KiuyPzJqLMV5Jtrk6yY2eW+wemCbjTyEli2TT/8YfYG0uHOwLqEbxMNhS/J/LTaZC4ynmlHybu4+u/dOtpDRLnf2S8UIVOx5feE+vudIrpsTl+ZJu7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 CH2PR12MB9543.namprd12.prod.outlook.com (2603:10b6:610:27f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 22:25:51 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 22:25:49 +0000
Message-ID: <60a3cfe5-d025-4029-adc0-22a85eff6868@nvidia.com>
Date: Thu, 1 May 2025 15:25:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 25/27] fs/resctrl: Change internal.h's header guard
 macros
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
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-26-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250425173809.5529-26-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0113.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::31) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|CH2PR12MB9543:EE_
X-MS-Office365-Filtering-Correlation-Id: ac820c52-99db-4568-980b-08dd88ff1fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZU1lMitRTFVYOUMzd0dTTkM0VlFGV1hiTDdjQUZPc3VIeDMxWmZNMGY2cjVU?=
 =?utf-8?B?Q0RHMnVoWWVYU292bk9GeGo4OFRXMnVYbzZRYmhPQWpycElNbkQ4Rms1SUUv?=
 =?utf-8?B?dkk0T28xVjRua3pyTEZyY01iK2FZcmk4ZUoxbXp5bGs1SmR4U3RsUGFnd0dT?=
 =?utf-8?B?MmFiWkVQN2RrV0xudWlheGoyVlVBaFRCY0ZYSmNNVlVLeW5YM1lqZmpYZ0Ex?=
 =?utf-8?B?dXBodWcrMmc5d1ZXV1o1ZlkwNnVnYm1WM3Voc2JxVVNvMEd2eitZOXBRQ1Vh?=
 =?utf-8?B?VnJrbmQrN1orZ3N4MHJVdjhUbXZtYk1XYUY1TVNoSWdaeVBSYTRVUVlaQ2ZJ?=
 =?utf-8?B?OGNMV0RCV0hxeHpnTnVtMEtwNE5xWFI2NzJEd1E1VjJKdGlrR0s4c083UEtS?=
 =?utf-8?B?cFQvcm1rbmVCMEpMbGRTTnJMdTFQNitkYzRUOEpUdGFuQnRDcXpPaDBDWVR6?=
 =?utf-8?B?QTNVOHFvRHZ6S1ZvMWJzYW94R2d6SE1uMHlVUUZGRURwMHpqRGhydmY1dW5m?=
 =?utf-8?B?WDZpSG03d3dQSVlMeVIxdFhkMEYzMGlsTXZabiszYXQzQW5zTytDVG1YalQ4?=
 =?utf-8?B?ZUZXaXRkNmc4cERuek05VVZkNlhZTFgyc0hiRmY0N29LMEFCOEo4bnI0NzlJ?=
 =?utf-8?B?czlQM1loTy9teUp4bnFPSEVJd0h2RkVqbGNGTmpWVE9rQVZGWG1TdnV2aXVz?=
 =?utf-8?B?SG5kS28vQUdTWXlPdDRrOGdHcitUek1hQmltcWdVZXZhR3E3MUpENEZuMEht?=
 =?utf-8?B?K3BvelhoNUYycXYwZWoyOG9yNmladGo0eXpEKzdwMGtUbFhlWngvMzByQzVX?=
 =?utf-8?B?a0plQU1zblhVa1R4U1dydmNuYTVGVEs2WkZSWTJEUFg4MHVxUHg4R0N0RDVH?=
 =?utf-8?B?MUZXTlhkRGRNSS9TWmY0dEh3UndmWlgvbWh0aXJoZ3pHS3l2Ri9OSkh1Kzli?=
 =?utf-8?B?OWJLSDRTSWN0NVBDK0JhLzM3clVkNTJwNElKTFVoMDVlWk42WDVMSlQrUm5V?=
 =?utf-8?B?aXJBQlFtWUJSaHA2RDN6a2w1V1c3ZTArN01hSXYrK1Z2MkhZYzd0M1Q0T0Ja?=
 =?utf-8?B?T0s1dlVBWUJ5NnQvcVh3TUM1SFpuVkdXNWpVcUdTLzh3ejltRGpSN3VUenF2?=
 =?utf-8?B?WkZvaWMwTWZzSlBDaHNFRlg3MXRjT2xzZnEyNkRpazlodVZFMW8zdldwdmlD?=
 =?utf-8?B?UldNWGNESUNXV3J6WWlRNEIzVXBCNzJxMFRwK2NMdjI4T1lHVXIzejRFMXRH?=
 =?utf-8?B?c0pyb1NWVjBMMnRoczdVTGdPaGZ0R1Z4UlNscGg5cmN4YW4waEU2VGF3QUVL?=
 =?utf-8?B?bVhpWi9GRU90RVNkNDc1cEpQTEZacjlmMnFielk0S1hLbTVQOGFvdjZqMW9L?=
 =?utf-8?B?R3BFWUVobThpQXZ2aHY5UkxIL1p4b3FSRGJMWUdnd0pCaHNnTEhTQVlSK2pl?=
 =?utf-8?B?SXJENEN5RjlzWG5EMjNSYnhOQzQ4NU9kRU1ma01LazBBeU8yZFh3VkpUdk5D?=
 =?utf-8?B?TVFROTN4dys3anREOEJoV251aW02Myt4RVQxUnZ2cCs5WHo4bno2RjMxT3Jz?=
 =?utf-8?B?ZGdDWW9qM1NoQnprN081WmdQbkV2Yk82ZTdGSnJqbHJ3b0xMUUxsQ2Z5RE0z?=
 =?utf-8?B?RnNlbTFBYVVWZ2t3RlF1eEdPcUJLdWJJSE54eG9LWVB2a3pERS9uVGlDdFJ4?=
 =?utf-8?B?Mjl4c1ZzNysreWFUUE11ZHo0cjFJSVMwODZMN3NUSWZiY0wxcjh4Y1lGVU5S?=
 =?utf-8?B?SkJ4a3JXV1phcGh5QkloUG5mUWV5UlNLSU5RcVdXMVVmQmpsNlBFaGFXbzJZ?=
 =?utf-8?B?WkhXL25oMXNvY0k2cmtKZHYwdHZpZHJ6b0tiREJIcndscGdOT3pNalVQZVpp?=
 =?utf-8?B?L2JwVjJ2RmNwbk12TmpJTHM1MkI5MUZNTTFaQXRUZC9EWnNjT2xZaE93eThL?=
 =?utf-8?Q?W2g0RXVd8wI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTBRRU5KQmlMbDZ5dXNOVHlLby9aL0VmVXlSNmQ3OThodndLbHBaaHlra1RJ?=
 =?utf-8?B?T1pBWnZpckFPU2JpKzJxaFZBU0pTc0dJR1JTd0FXbWVXU08xOFVhZTFEaVVx?=
 =?utf-8?B?ZGVuaStQZ1hzZG5oOWw5VVIzSnFkWkV0am5KREpibEg5ZHBmVU52bTN5dlA2?=
 =?utf-8?B?RTY0YUl6cTY2MGhRV21UMWVOVnFJMjZLMEJhcDRhOVM1LzdQSVJWYkFtNGJB?=
 =?utf-8?B?ellvaHpsZUZCUXdpTFZqV0wvZ212dnpRemp0aFlmcTVkUlg4ODFlTjJLV2Yv?=
 =?utf-8?B?ZHdFY3hZcGFIUUJ1OGlHaG9vZlJxaWNaSStMbHVrQ1dLT2hCeEREYjh5UkQ5?=
 =?utf-8?B?MkNGc2l4ZzBSVkFVaExKM0hSbGlTSXhFa25BZkZHemkxeHFUNWptQW1yQkk0?=
 =?utf-8?B?ZEJsMmVCNElqWjhOdnJTLzNHNWNhM0M2YjVvT2p2Zmd3aVNTbG9hZUVFNHlK?=
 =?utf-8?B?SkYxUTRESmpyRk5wblpUdFBlSlRhQXllc2NpS2J5K2RodUZoSWNVYXJEWVNn?=
 =?utf-8?B?WHdtRHVpM25iMDVONEJwdm1TZjJ4UmltNGhUM1ZDL0c5eTdmUWcxM0p0S3k0?=
 =?utf-8?B?d1VIOG9ERlBYbWpnWS9Na01DNDVNU1oyYTVNQms0UnVOWUUrckpHWnFYL0Z1?=
 =?utf-8?B?c2pKbHovYWk4NWVjbENwblRTOWR1QjFZMmJRbHdhMUQybDBja3R4L2R2TjZt?=
 =?utf-8?B?MXJ3U2NUelBJV0w5djBTQ1FERkgrVERBK1gvWE1TU2Y5TCs4cndJbXl2UUxU?=
 =?utf-8?B?UVZxKzdqMFZ2QWM2WWtac1ZwM002dUNlb3NxUDc5eXVBZTFOT2RHMGtVR2kw?=
 =?utf-8?B?QkNuV0VIbmRJSjB1UUpqbitWdEhXUU5DaFZSZTNoZDVjajRxek5Vd2VId2VW?=
 =?utf-8?B?Y1RsV1lYblkvbmxJeEJ1V1g4MG1vQnd2WHpnN0FualBzQmpPVWxBM2VMWXQv?=
 =?utf-8?B?V1FIaVlNenptZTBGRk5iQURybGtGTnk5YzhpaHI0YWdYaGVPYTZwTU5UNDAv?=
 =?utf-8?B?TjRoUWFVOTJVVkFnV3dNRnRUekp1dkZpblpzaEtnM20xTE9ZVFZBazhRRFly?=
 =?utf-8?B?aXZ6dXVtb09ONE0vMUJSUHcrU0JONkh1bXdVWHFGc3Q1MmkzUmwyK05zNkhE?=
 =?utf-8?B?cE51QloxQjF3eTh3ZVF4eHNIdTU2Y0RYL1FLQkdJZ1RqWFIrK0dyY0RwQVNR?=
 =?utf-8?B?N3hqeWd2VDZrNWZhWVFFWlc4SFdzYUg5ZENiRU9ZVWpyUXhEa1Y2YmJYcjJp?=
 =?utf-8?B?R1NJcU82TVRSUWd5S1lmbDVTZ2hTcG4rK0NyOTY3cTZ6R05LY2c2U1l6bjds?=
 =?utf-8?B?VUhvbzlkbE8wMUJsakZ4bDJHVWN3eTkrQlF6emtNMnl1eG9UaWtFdzRQcm5i?=
 =?utf-8?B?VkdkK0UzSUlDZ3dZV1ZsR1F0N1RReVJuNkhxZU1HRmpBb3dtdzRqLzBBVG9G?=
 =?utf-8?B?b1Q2eEgvRCsxVllHb2g3UDY1dXBac2h4TWpDV0ZyZmgvK0dKOFpjNUpMaVAz?=
 =?utf-8?B?bkluV2ZCSHorTE1DTDhabExUL0hYSTR2VExrN2hsZU1SYU0xaEZWQ05LSGI3?=
 =?utf-8?B?WjYzaHRKdGpWcXZTbVNKdzZVVi9DYWtBQ0FOY0RQaXFxVm5Db0JrakxzVEw0?=
 =?utf-8?B?U3ZtSlI1MjI1cXZRYWZOUU9yUGFYOVFNd1doaDZIZEVUekQ3aVAwVlZIK0dv?=
 =?utf-8?B?cUFzd0pJajdSb25EV1g1bXdUdGl3TXRpSkxRbGFCUjk5WmxCSm9KYnRvdFJj?=
 =?utf-8?B?THArdGNucTI4NlRra3BlTUxjdytibDBvQ1NOa3l0dUswS2YvZzNhWEVlOUNG?=
 =?utf-8?B?azcwUXFubUgxbVZack9wWFoyMzYyT0ZzYmVpMDlPaGM3ZFcvVFV3bkYwSzZv?=
 =?utf-8?B?Ym5rOUcrRkJ1NXZSb1RJRGRNeXRKQkRxS0hrMnVEL2lMUFB5QzRFWmlXQVE2?=
 =?utf-8?B?R0k5RHhXOXV4Nk9XSmtzdmdDZG1tU24rVUgydll4azd1aGZkV0NuaGxvK3o5?=
 =?utf-8?B?T2kvUmJJdUo1aW9MVmZ2b2htS1psY1lLNVZ4ZktPLzN0MTNaMGI4ck5uaGg4?=
 =?utf-8?B?c29uSTYvS2c4aGlEWFJ4MHVuWmo2QkdmQUdoRTA3RUZPOU1JMGFLVEVqVmZM?=
 =?utf-8?Q?0O0Q1pfDBbLmVXJhTbVPzgYpV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac820c52-99db-4568-980b-08dd88ff1fb3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 22:25:48.9030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oqeyl0vWwDwQjx+TO4RwM6JJkn9TT0jI8iV9tkGcuO1I9RYjkH+f1kniMH1Hz9FCG+3552/yAHnCbnNMwvhr0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9543


On 4/25/25 10:38, James Morse wrote:
> The code in internal.h was moved by a script. The script didn't know to
> change the header guard macros. Do that.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

