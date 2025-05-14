Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021111.outbound.protection.outlook.com [52.101.62.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F8A28032A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747241710; cv=fail; b=um6JPFSFm2Oe4Zqk2zGV2QK5m8X/QfohWtImO2til2pg0x5f1u5GF4uhcrPu3U0PhozH28yfXpfUQdnM3IsTJcp5VyRuYXXnTnYdlWUIkoxMIhI75CmaS/Vm66Wn2KbosO2RvWnx76AcvmGgx9c4lb9yAcph185pVbASd5rVevw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747241710; c=relaxed/simple;
	bh=5aehokNkOkQ9K38dWg1uDg7p95wGKircNJt5MahTHnc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sRDI5/BVuiLH2UbKz9420HNV9AkH2i/h9HnEMfx+jwDeJD7yo/g3dmJTgpQVSPvv00hOtl5WfUNZo7hdi6Ml5t3Yqj1znpRlSlzukQnA5yjCB7AZxooYnbpzD6E/7Te+jr+EfrOux4Y7RfFDGtsh3klnLglimxaqk8rxtO4+3Pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=Y2WfBHK7; arc=fail smtp.client-ip=52.101.62.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="Y2WfBHK7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ad0D2BOpApAFeHrVIajwXrnVyIhwmqB9gh1ls8XnVIj+wOIWHbI2d7nC4fONYmEtYoXj3l8jkY0HxTDNRIaMRqH8MQa9HJadxvsGSpjgoN+RDLPEkMCh3K9gDF7yCs3IucXIBi/0luPILF2/Ct8LVYRAVhETyrpNgtmqbyhsRCyI937icY1UP5Imwni2a4bmEpG3LKj+WPxhciszZXt5fgBrAd8+v7vgcohHt0KdCmdo3qVh3co2GqwiC6LJPSHmJk8KaFvFqFMUpywfZkpIC7Xgz1P/GKWuLwUq4yCtPA+NCKYEAUMqGakpvxRSEUsOL/k2z/krTWxvJlL37cST4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kc1/LkEty1L1CYDnVg9iNHBj2zvxYHImUYNAunu/iik=;
 b=j/yuhwAIu3ubSJAlS8xBZJwddPhMFT/tOW9+6YhUkOVha2I9RRbxQg1WgcNsm8oF8Qtm13OsoOsEfrzWBxK+2hulOiZ2l4MaLM8xx9da3x39j4kCsFZqfwpcdp9HtTjGfzjJlBXoB0icg1snwkuXeHYbzI3vA6rn8q//HngUUyBMAT6EbDALyRVNzNOz2CsXB8k64PHRd0DivywWxkUhPfHFOOAIl8OxjYi4p+15BLvi1zpATCnwkMxvo9bSniyg9XY7fRerIDxe6RdCPoxMwtXDqHjxc1flQTlh4mhJllw1ZbGAnLNAGbLy2CJ9uT93U1EJQBC7QWloP2a25SuEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kc1/LkEty1L1CYDnVg9iNHBj2zvxYHImUYNAunu/iik=;
 b=Y2WfBHK7A923pOdVvum2eDyU3pN0SlJJtkYswojLSdi3kglBVrXpMryAYsSMh48g2vzjIkHtlApQ8OKM91BL8HImWl6X6tyGTmywB+J5m/8dJfd6Kd0vzbpzE26kr/Aqzm/YZsz/nSYw00I8zRad4i0LT2zIfDsH5qu2YB2y0Bo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CO6PR01MB7467.prod.exchangelabs.com (2603:10b6:303:142::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.30; Wed, 14 May 2025 16:54:42 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 16:54:41 +0000
Message-ID: <6bee5126-5ff6-480a-8a7c-fe5b20f085c7@os.amperecomputing.com>
Date: Wed, 14 May 2025 09:54:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: madvise: make MADV_NOHUGEPAGE a no-op if !THP
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, willy@infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250508-madvise-nohugepage-noop-without-thp-v1-1-e7ceffb197f3@kuka.com>
 <3ed9ff7f-d360-4bca-9805-b70cf51cb023@lucifer.local>
 <106c0d2c-7492-4a81-969c-de4f1798586c@kuka.com>
 <2766e825-4a45-47b9-8544-95a427123547@os.amperecomputing.com>
 <90bfbe27-ba24-4f18-9f94-fb58ecc03586@lucifer.local>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <90bfbe27-ba24-4f18-9f94-fb58ecc03586@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:5:333::30) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CO6PR01MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: efbef043-af5e-4a60-d2a0-08dd93080575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1JmOWpCVmNRZVR1Q2E2T3Z1SVFCb29MYVBFK0RZVndtSXFOSC9FL2czNkVD?=
 =?utf-8?B?VXJCZTlVRXlHRFprQ2V0dFVlVHhuVFprc2xnd0JhMVdtcitCZ3QxdUhvT0xh?=
 =?utf-8?B?V2V2TjJqOUJURkdYM3AyWUU5UGREYUNpei93Vno4SUFFZmtVVjdtdlE2NHk5?=
 =?utf-8?B?dytvVkhBSS9vdVRHSjdpRzRHWi9qQVNoNit3UmFZeWdEZmFvTDFTZHFMWTBX?=
 =?utf-8?B?ZTlQTnozd25ZTngrMWYyNGFTQnU2K3prMDZseTMxSDFybHA5U3ZnM1dXcmZL?=
 =?utf-8?B?N2xxSEtEYzM0M2lXM0RYck45QnBraHAvZWc0cDl4RUNNR0NycFR3dnFTbHFO?=
 =?utf-8?B?bGVEWmNWc1RweFREKzdDVDU1UkxIMlg2MXd3YThENXQwN2YzbFRycmpYQWlU?=
 =?utf-8?B?LzB0cnN3WGVoMVFXeE9JSDhZREdreEVWdmpnY2ppdC8xZnlBL3dOMmtPdjFK?=
 =?utf-8?B?T0lIdnJWdFdkbzFWdG0yU2ZrVjlxRFlNLzBPRzVZMWlPZklqa1AwU0xxYnpX?=
 =?utf-8?B?TzdpWXp1VUpDVGxvOWRxWWVMUFNJdUdZRGtxZWZlb2N6ZUpSd1NKYU9XYlR1?=
 =?utf-8?B?MVQyUWJ1NGFwYzZMSmJwRzAwd3NlZEZBak9YYjV5ejVTKzh0WDFXMHFkOXBC?=
 =?utf-8?B?Mkg3MWxvcHg4aS9LVkdEb1FMYW1RSE5XYmFSR2JDdHlJdUFDZ0JVM3NoY1B0?=
 =?utf-8?B?NmtkajltenlEQUFlb3ZlTUdHUHFzc2xWa0RyNEQwY2RDWFhxV0dBSXdxc1ly?=
 =?utf-8?B?NW5pQ3Zla3JjS3htbW1PWk5yYkNNdkdIZHVzdmpkZmlHOTRMRHcra0xaUnpv?=
 =?utf-8?B?RW9mVWw0TSsyTWtpTEViSFFnR3kzMXQ1TlhabUdEeVJBNlkyQ1FhVjlmTVNz?=
 =?utf-8?B?L0pCUUlpQnFtV09XK21DT2graVBaWUdXZVp5MHZYZENKeUpQTEFRUUJ3R2pU?=
 =?utf-8?B?TDJycHk5NVgzR2xRTStvRk42MWtlVk1KR3RtTDlaZnFpMXp1VktHajIzbElN?=
 =?utf-8?B?a3c3RFN1TDdFbGgwcmFDM3A5UGFYMnJ1YjZ3UUU5VjRUMFdYdnpScE9TUjdR?=
 =?utf-8?B?eXRSQzVkejJZZ0tWdHA0cnE5dmo1ZjMzOEFwdHlJcXM1VFhrZ1JOanpaN2h4?=
 =?utf-8?B?VGRYQzVKRmVUdGtrQTV4dXJCOXkvMzNHM1JleG9Cb1h1UFZrdGl2ZjZhWlZ0?=
 =?utf-8?B?bGplRnpMUFlORUUvaU5pQTZYSk0rbW5yQ1NQdjBEbnRnbm9nYVJ1ZmlQbGs5?=
 =?utf-8?B?K0dUeWVRVTEvVENHS3ArY3Z0SEM4Q0tLVE9Qc0F5emFzRWcyZ1lrY0JOREZh?=
 =?utf-8?B?MmFuY2JoUEc1Qi9OM0I0OVM5WnRMdnZGSnMyalRHYVNidDJWRjFvZFBCT0dJ?=
 =?utf-8?B?WXU0aFVzdWhJY1ZKcEhJbVRmZVZkTmxXV1k3bGdBZjhOT3dTL2J3WWNpSE9q?=
 =?utf-8?B?RGZjYUdVSW8xeWl1bHFIc1lydTNYUzZObi9KT2ZZUDJnWmJ0VTMzeTBCMi8x?=
 =?utf-8?B?K0RieVBJc0tLK1JWdDdiRGdhcVg4WXdKbENTc3BkNlJGL1QzcWI3TWJMOUk4?=
 =?utf-8?B?WVBtTGRlWVVoSm5KVHR4MWRPQU9YS0I0bm5NdzM4WllOWFlQUmxLRVhJM1Jl?=
 =?utf-8?B?cTdmTnkyQU5qTFNXajBYUjJOdjBjY3dUQnNpNHI5cjVPT1RreU9BaDE0ZWtE?=
 =?utf-8?B?RDZDeVVzWnBYYm5PdVlVZk02aEd2Y0RPNE1QamcxVDhqZXBsbWZwbDkrQUEr?=
 =?utf-8?B?c3ZhcjN5RzdVcEFJTUlCTEZCQnNmZTVCTHI2cjRkNlhpaG95cEpBYzFNZlBL?=
 =?utf-8?Q?v3gJLHT+4r2N9zArBUd05iYPtTt0aaF+p/0LY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1YwbTV0bE5ZUkN2TWpENHV3eUJJbnptNm9LWFVXSFI5MG8wR0J4czk1T2ty?=
 =?utf-8?B?aFVKOW5jVW1XQ2I1SzdxeFVacUxnbU1OMVVGaTNQaVkzdW5XS0gva0NkVVVr?=
 =?utf-8?B?Mm5DakRvdzk2VVZmcFF1Nm1UaytHdEhMaXZQRlI3bXJyNVltbWZPTDluM1J3?=
 =?utf-8?B?Y1ArN25ITXlUWjJXWElUZG1CM0s3Mlhrbmllbm9WUGlWdGgxNkZEQWdjc0ZM?=
 =?utf-8?B?RW9ieFVEL3F1TFJacWpiVFVyTTZ1KzFtNGxnZ3NZZWljcWFPUUNNVW9BZWJq?=
 =?utf-8?B?UWRDMUlCRm5xRm5uNE1GNnp1SC9aS0hXV2V4cFVRVTBZTEw0SllhVVNOS0xx?=
 =?utf-8?B?YTBtZTBiZDJWZEVUalF4WFBUekt6b2RTdEZhdHFSa1lBK2UzWHRrYTYyaTZk?=
 =?utf-8?B?aW9mY3RGaUZZVmNuRjFVYTh1V2gzd1RHdzhqbWNzckRKSVJoR0hVZS9KdEZY?=
 =?utf-8?B?Zy9FME5zT1huTXh2UGxuY0JBSFNWd2FiUEYweU5QZUlyeUIyVGkyeGI3dmVS?=
 =?utf-8?B?NUFtSkNzZlhMbklLZGpraW1jeDFtYStyUG1UNlRwcXVjSzRWMDZGWDhBTzll?=
 =?utf-8?B?enc1SnJuWW92QnlPL21FQkQ3SDVQekFCai8yM3FyekNzSko2NHc1V09BcFZD?=
 =?utf-8?B?MlVMYzlZZmN6QUhZWDRtNHJDb1dZRUNrNWFHd0VFam9JcGIzRzI1d01IcE9N?=
 =?utf-8?B?UCszVlFlL0VBZ3lXRjZKSUtOTTdMd3RzcXRrRWFpMjh0MEs3RjczZnhndVJ1?=
 =?utf-8?B?M01vWE1GQ1F5WVRNVm5qbjJSWW9tbU9qaklaYlBDUFJidWxhbzZrYVc0Tmlk?=
 =?utf-8?B?OHdXZTRMZXk2TTdxbzFjVmxuOFFtRzFia25vSDNnRmdQakFQNkdmQkV0RjFM?=
 =?utf-8?B?QlV0TTcxSUJMMW5LY0V2bXY3Z0ZWMmpXY28vcVRSOXFFWjFVNzlrd3c3S2NC?=
 =?utf-8?B?Y01rdDVRa3VFakxLb3gveldOZXJMbDkrWmRidTl5a2Z3d2VJSVVEa1ZLeXFE?=
 =?utf-8?B?U1lGaWJHdkJlZHVVa1lZdkJ1ajZOblprL1lXZ3l3Y2l1TE9URGIzWTNWdVpu?=
 =?utf-8?B?NU91Z3hGYjZUTFBNOVJWUFYrVExvbkY0K1NwUy9pR1pTVGUrb29wN0ZZQkJF?=
 =?utf-8?B?bUc4enFBSW5nNWcwWjZkZ3NkQzAydC9DM0dYa01OeVl6Nksvakk1RUVGcE9H?=
 =?utf-8?B?TTFPKzBwQ0pWZmRYRHZTbjBWOEgxK0dlVklKL3U1QTF5MXdlZmUrNzJ2b2VC?=
 =?utf-8?B?ck16UThxZVJFM0RSS0dnNUNSemdHcTd1aitIblp4Vkx6UG1nSGF4QUtMVXNK?=
 =?utf-8?B?UW5meUtXblhoNFZwVWVKQlh1elErWi9CSFJuKzJZNG1BVnIwUk8yT1FybzZv?=
 =?utf-8?B?SjB2bTZJa1haZEdMYXVaVGtsZXdMZnlESDJIbHlzNVhuNWlJbHhIbmxVbXdo?=
 =?utf-8?B?UHZZUFVUQmFnSTJ0d0dNblFGaUlQdDByYmdRTmxuTUJFMllZUmI5V0ZIMGgv?=
 =?utf-8?B?SjJRS0EvV1RJVWcxYS9yRTdCQmhIb1pQcGtKNzlDT3VNUHlJcjFXQ0pNZk90?=
 =?utf-8?B?Qk5maGg0SnJWRDd6YmVxVkJIZm96dTRvamNUSW5heDNzaVlCSXowUGZHeElF?=
 =?utf-8?B?VGlTb0phc29DVWhGams0bGFTc2F4dVArQTBCNXB2TWtrN3d1ZlJxMUhuNVhI?=
 =?utf-8?B?Mm5ucFB3ZkVWbG1FVjNHMmhUa25yNkZLZ2paRHRobk9obFBJZWRndGhMd0c1?=
 =?utf-8?B?OERKS2sxOXhMWGp2bzVtSVAxOHdlODBMT2FNSlJjWkJkMWVlTjBBRVdlWHdq?=
 =?utf-8?B?MEZiZW1VYkFoYkp4YWpBVEtJT0I2bzhGa2NBeWZSaFVCdlhia3FLTzZLSlRJ?=
 =?utf-8?B?ZXR3QmtkSzM5eFRmeWdCQ3VDU3Blem1qYm1NMzZrRlJTQ1ZDOXc2eUEzZTBE?=
 =?utf-8?B?Q1FQbkdPMDAzVFJuZ3luM2h3SzcyUUZwYTJkZWZBN1pZSGtLejFjalBld1pE?=
 =?utf-8?B?dnZSU05OdjI5YjRqU3loZ0ZJMFliK0l4MEJERW5KWjIyK1BIaFBwUEhsWDlZ?=
 =?utf-8?B?ZnlKYXBSVmxHMHJlMmhKdXg0aW1XTnkzZHgybHVsSzYrd3d0WUlKbWxmSGY0?=
 =?utf-8?B?dDRsNUdETTVkNmJ0bnJVMXdkWEJmQktyNHF1ajB3QmhWT2VmWjBhZS9VenVn?=
 =?utf-8?Q?2cTiKh+nLh13LxHsjNnNy4c=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efbef043-af5e-4a60-d2a0-08dd93080575
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 16:54:41.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXIqCSsOoXcyXr9wKCEwcikJ2/+5rcXJwoGE2Azf3zgCQrXA2c+BM7ehezs/p0iBFJmn32OfzA+wzrSwuvXpAW3sZmH2Au3UtZVrYq7cvUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR01MB7467



On 5/14/25 8:29 AM, Lorenzo Stoakes wrote:
> On Wed, May 14, 2025 at 08:25:05AM -0700, Yang Shi wrote:
>>
>> On 5/14/25 8:07 AM, Ignacio Moreno Gonzalez wrote:
>>> On 5/14/2025 3:52 PM, Lorenzo Stoakes wrote:
>>>
>>>> I have pinged s390 people on there, but I don't think this is going to make this
>>>> cycle given we will probably need to coordinate with them to fix up this enum
>>>> name (which seems the best solution to me!...)
>>> They answered that it would be ok for them to do a quick fix over the mm tree:
>>>
>>> https://lore.kernel.org/linux-mm/6f8f3780-902b-49d4-a766-ea2e1a8f85ea@linux.ibm.com/
>>>
>>>
>>>>> +#include <uapi/asm/mman.h>
>>>> Also this should be linux/mman.h I believe, sorry for not catching first time round...!
>>>>
>>> Including linux/mman.h leads to a compilation error:
>>>
>>> ../include/linux/huge_mm.h:601:23: error: ‘MADV_NOHUGEPAGE’
>>>
>>> Including uapi/linux/mman.h works, but I am not sure if that is correct.
>> Is this build on x86? I actually tried this on my arm64 build before I
>> suggested uapi/asm/mman.h. But I saw a lot of compilation errors, like:
>>
>> In file included from ./include/linux/memcontrol.h:22,
>>                   from ./include/linux/swap.h:9,
>>                   from ./include/linux/userfaultfd_k.h:18,
>>                   from ./include/linux/hugetlb.h:16,
>>                   from ./arch/arm64/include/asm/mman.h:10,
>>                   from ./include/uapi/linux/mman.h:5,
>>                   from ./include/linux/huge_mm.h:512,
>>                   from ./include/linux/mm.h:1238,
>>                   from ./include/linux/memblock.h:12,
>>                   from ./arch/arm64/include/asm/acpi.h:14,
>>                   from ./include/acpi/acpi_io.h:7,
>>                   from ./include/linux/acpi.h:39,
>>                   from ./include/acpi/apei.h:9,
>>                   from ./include/acpi/ghes.h:5,
>>                   from ./include/linux/arm_sdei.h:8,
>>                   from arch/arm64/kernel/asm-offsets.c:10:
>> ./include/linux/vmstat.h: In function ‘__zone_stat_mod_folio’:
>> ./include/linux/vmstat.h:414:31: error: implicit declaration of function
>> ‘folio_zone’; did you mean ‘folio_zonenum’?
>> [-Wimplicit-function-declaration]
>>    414 |         __mod_zone_page_state(folio_zone(folio), item, nr);
>>        |                               ^~~~~~~~~~
>>        |                               folio_zonenum
>> ./include/linux/vmstat.h:414:31: error: passing argument 1 of
>> ‘__mod_zone_page_state’ makes pointer from integer without a cast
>> [-Wint-conversion]
>>    414 |         __mod_zone_page_state(folio_zone(folio), item, nr);
>>        |                               ^~~~~~~~~~~~~~~~~
>>        |                               |
>>        |                               int
>> ./include/linux/vmstat.h:273:28: note: expected ‘struct zone *’ but argument
>> is of type ‘int’
>>    273 | void __mod_zone_page_state(struct zone *, enum zone_stat_item item,
>> long);
>>        |                            ^~~~~~~~~~~~~
>> ./include/linux/vmstat.h: In function ‘__zone_stat_add_folio’:
>> ./include/linux/vmstat.h:420:56: error: implicit declaration of function
>> ‘folio_nr_pages’; did you mean ‘folio_page’?
>> [-Wimplicit-function-declaration]
>>    420 |         __mod_zone_page_state(folio_zone(folio), item,
>> folio_nr_pages(folio));
>>        | ^~~~~~~~~~~~~~
>>
>>
>> The build used default Fedora kernel config with THP disabled and v6.15-rc6
>> kernel.
> Yeah I suspect this is because of circular dependencies as I mentioned in reply
> to Ignacio :) Sorry I missed you'd suggested it Yang, you were right to do so :)

No problem :)

>
> You can see mm.h -> huge_mm.h there so it does seem to be same thing.

Yeah, it caused some circular dependencies.

>
> C headers are a source of many sighs.
>
>>>

