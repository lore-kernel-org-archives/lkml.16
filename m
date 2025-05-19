Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012044.outbound.protection.outlook.com [40.107.75.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA771DE4C4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747625057; cv=fail; b=CWr8AnOy4lJpWlJKouupqx9giyrSXEZTzhoK0AQC0VaMD2fsmVJDkO3dfyuZnnPY1AsaYysOykAqs3mmECQIKgXvzW5ZIPXRmVw0BMcGulp1WWI5n0YuZ050trxI+6S9pSyQkFys+qgHgEKWlikXu0CO6vZnUb4ybFd7hjcL+yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747625057; c=relaxed/simple;
	bh=mYxRkesP2ywETKdEhdOiiSgMds5jdJxjNQdO06CLDmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=opsZ4E86K8aRm5VOnQrhvn7G2WPjbM5QWvMWQrhp8W7cxEGpnl98rAtN/Ilr2wAeMYquoZYCTnOyrT8xsSY28S6VCxD2h9LxMO2SdJFQP7TRFxIQ29IFuZS54+Nu3l+J5zuOf9W5hTLAca4jgbc0vpdQFL0/DGh5uRj2TcicfNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com; spf=pass smtp.mailfrom=oppo.com; dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b=g6Vtl8hX; arc=fail smtp.client-ip=40.107.75.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oppo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b="g6Vtl8hX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2tWW+/EId8QoSFXMdcOfVAhG7Ild3OW6wBGiE3dxjvp3YI8Ywy5gsh8EOq3wf3vNHcVPKMm323B0SdHkd+8AezjrBxYiRhYM58VKcRCZZA58QHX1bSSO077844z+pfQM1/uxRUWYceFeVlfLTUNzdOeNzdDE5rfJ4sW3EBwMbj3AyL2mF9emxARbtcgASDltJ8cVUyeUz9nNOSjr90l9q3KDwZjuc0nq9aTjHibTbfm4LmChR7qD/EN+G/aZGjALDsM0+4GLKmapKI5Mqv2OhKUkzLVS+J23ECekANFW4BW7XWJrb02jkzqMsbHp682TF4yufBahiy7of3S/aFYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAH1lFxiR0aM+gpFNODhHLwHu0jZmhI1u5DO2mbEYiQ=;
 b=Fu6gl+6QC8IhL5/U3y2WhlSPMOiYCRUQKRwQ+R9hiya+Z4Bm72nU/6T9ydj8LzcGNWUHi+55VhXf4z8/OtjuUCXTjeKM8wRsOBBXHqw4OkmfANbrJOCtszS+iyGRCbA0qslmIZRZTQM60EANHIKsA5SzRT53iIHygbrtUvyK+ianN54/oWToOesllvR0bQBXCMS4B6UqE16Pwu/9sTqcpDdE8VevN8L9qmDG5mD3VU3zOxoTTrjvv6lza56SITEQh4a6UWiqtBjHMXyYzICJPXVGaLZhbkRzbMIfnAjVV3hzaIFjWot8pUfwf9/PABSjE2TiaqaF4xTTj6LnlI4N0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=google.com smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAH1lFxiR0aM+gpFNODhHLwHu0jZmhI1u5DO2mbEYiQ=;
 b=g6Vtl8hXyPx9ZgdsTZ8h1t1JMWIgTxFe6l///WNeBXXNZ090tUdfBrVvem4ZGBHAmYHwXKoj2/wxIH2YRyDB0NBP0jpM8Le31DX1U2A1IbT516XKlicH3h6wmjMp93OkcODZzUS2yYBRypVzpilCFTBZQtQNHPzPWMyJZI5CQEU=
Received: from TYCPR01CA0128.jpnprd01.prod.outlook.com (2603:1096:400:26d::20)
 by SEYPR02MB7735.apcprd02.prod.outlook.com (2603:1096:101:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 03:24:07 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:400:26d:cafe::ff) by TYCPR01CA0128.outlook.office365.com
 (2603:1096:400:26d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Mon,
 19 May 2025 03:24:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Mon, 19 May 2025 03:24:06 +0000
Received: from [127.0.0.1] (172.16.40.118) by mailappw31.adc.com
 (172.16.56.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 11:24:05 +0800
Message-ID: <056afddf-a933-493f-96ce-d801c5348059@oppo.com>
Date: Mon, 19 May 2025 11:24:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6.6] maple_tree: Fix MA_STATE_PREALLOC flag in
 mas_preallocate()
To: Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
	<Liam.Howlett@oracle.com>, <maple-tree@lists.infradead.org>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Zhaoyang Huang
	<zhaoyang.huang@unisoc.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"zhangpeng . 00 @ bytedance . com" <zhangpeng.00@bytedance.com>, Steve Kang
	<Steve.Kang@unisoc.com>, Matthew Wilcox <willy@infradead.org>, Sidhartha
 Kumar <sidhartha.kumar@oracle.com>
References: <20250429014754.1479118-1-Liam.Howlett@oracle.com>
 <z2hyuganxadlf7guskolgd6epu75jutipt7uwg5sqwew6a7lyv@6fbcue5r745x>
 <CAJuCfpFXuyg+otnr2uHauGi1-UD2sxxS26ONQNBwuUUisOssQQ@mail.gmail.com>
Content-Language: en-US
From: Hailong Liu <hailong.liu@oppo.com>
In-Reply-To: <CAJuCfpFXuyg+otnr2uHauGi1-UD2sxxS26ONQNBwuUUisOssQQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw31.adc.com
 (172.16.56.198)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|SEYPR02MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1a518e-f85b-4742-cb94-08dd96849d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|1800799024|36860700013|921020|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGVtM0VXVTRBaDVJekR4WHZUQmFZT1N3WXQ0c3I5Z2FHckFtSWVoekpxWGtJ?=
 =?utf-8?B?L2RqTXVIRStWaTB3ODd5TSs2U2JDVTJ4RmhwZlVqcjErd254Z3dGUHhxUTV2?=
 =?utf-8?B?SENYVktlbm5jZSs3b0oyT0NTTDRVUU9rQzNIWHNseldaN1ZrQi9zSVhFZytN?=
 =?utf-8?B?aUUyVFNrWXplV0RFaC9QM3R2aC9sMXBNaHN2S0ZtanBKZG9CcHp6UWE3NEw0?=
 =?utf-8?B?T2h0c2l1QVFpSkFrdVBIaXYvei9MWUtmN1JkWCtvWGJNQmdoVlRSaUw3ZWw0?=
 =?utf-8?B?YlRmYXU5NUNXeGRLd0paZjZ5WGRjbDlrVTNRblVBYWU0REVsSDdtbC80WUN3?=
 =?utf-8?B?cU5ZUDZQQ0tuN0hlVTZBNGxjdm1PdytvbUttTkdYa3hZMmY1VVp0MW1icm1O?=
 =?utf-8?B?a3pKMVFYZytEM3hTZ2JPa1BVWFU4dHM2ODZ5T205c1krS2pLMU1GUFJXTXFF?=
 =?utf-8?B?ZlIza2h5S1NudnBUTTNRb3hlMW81b2dqejF1OE8wdDhTV0dFOEY2aVhxTFdC?=
 =?utf-8?B?VjVBc2xmcHFaSExUa0hLUEpra09FYVdWTWxMMzhpalhGbzAybVg1WjF0Z21M?=
 =?utf-8?B?MUlCRjd3UzE1clBQb0hHSmVTMHk4MHltR0VIdWRObk5pSG44WHhzWCtJWlZE?=
 =?utf-8?B?aXByUEE2T2d6NHQzaVV2OEE5Q2VjYXZQbGRZTTdtblVHd09sbnFPVGpLdXBQ?=
 =?utf-8?B?dW42RGNxUTJNeU04c0ZpVHVLRS8ycVlmVnk2SkhrbUlXdEJabU1CRE96Tk5C?=
 =?utf-8?B?TU81VzJIS3JJMEp3YThnQS85VEpqSnc2Tm1PMFhYVFpaY2FWOEQvYWhFV1FT?=
 =?utf-8?B?SFBJMTl6RjhTQVpXc3A3czgyTk9pVE5oMmJXbGdUdlVrUU8vTUpqazFJeDZo?=
 =?utf-8?B?aWdTdVRCREl1MW5jTUc0RjlmcG52ayszNWFyUC82dE9wUGlVMUhIcXhOenJH?=
 =?utf-8?B?T2hMVjZGS1d1aHJYM25Bd3ppOGtmcm4yam9oZHpjcnZCallFUWFzSmQzeTFp?=
 =?utf-8?B?bks3SkRzL2tleXRwQncwMnFVOUhFN0M3WkdEcEd6dmgwRzBpRTJUZFFOSDRY?=
 =?utf-8?B?Wi9pVkowZlhRUHNoUkRTMkVLWmdQN3ZLK1NKV0RWUm14VnB1aGxJSm1ZZ3Mx?=
 =?utf-8?B?cUdYd2V6eXBDQ3VNdzBUMnFjTUlZd3llMFdoRU1qR0dBVG5DYW12VGF5MUt3?=
 =?utf-8?B?bStuc3hkY2ZsS2JLU3JndUU5ckdTRkt1UVJ2QnBmclRpV1ZFNUN5RFBjSUtr?=
 =?utf-8?B?TTM0NEJOK244d1YxdWErY3FFSk92d2xJaS83MjU5bkhvZkErVDZvODExc0ZS?=
 =?utf-8?B?emhqWG5lTHJrYVo2TGRSeXVaSWhvTXBnemRsRXQrT0ZjZWh1b1UyN1FWRXhm?=
 =?utf-8?B?VGlQWk5vcWd5SDl3dndlM2VqbmhMSFB2YlUvaWk3K3VKMlVtc29mYUhYcmxN?=
 =?utf-8?B?NDFqMVBUR0YzT0pnYW9EZHZaaEx3YTlwVHVhTkZCQy9hdkMzY0RpRFRZU3VL?=
 =?utf-8?B?Y1ZsRXoxNFMrK1Z3a1RpdEsrRzUrN3VMcmFkU0h5R3dnN1gxMnNNQ0Nwd1lS?=
 =?utf-8?B?U2lNTEszeCt2SEVjTndIWDNqdHJ0K1RhL2V6TVFOelQzN1NQMWI3QzYzbVNw?=
 =?utf-8?B?NTNmQk81cU0vWmFwVlR5cDBtZ0ZNZTRlaVZiSnh6cC9PZWQ4bktNeGlHY05O?=
 =?utf-8?B?UVo5OUF3bVhxTTY2WjBvSEJQZHhRMHZWVjJiK2NBdFR2VjljR3F5VjBxRTM5?=
 =?utf-8?B?YUJWbm1BZHZlTlRrcUl4dFVULzBIUHVEYVowRGJGSTYzckJDZG9WZmdRMkVk?=
 =?utf-8?B?aVJFbktjRlBFTEJzZEVEVjMxbFEvYlVqQnZoSEFiVm5aelNBaS9YRkFZNlBO?=
 =?utf-8?B?dnFuN3BGanJiNDRPYjhEZ1ZiMisyV3YyQzBPV3orR1NmR1FFTThJZDM5eHly?=
 =?utf-8?B?dFFpVExld1dKTzkzUEVRM05UV0tMS1RWZnJvcytmZFRtSGYwbE1ZT0l1U1BM?=
 =?utf-8?B?TG5ybnRqQUppU2RLaWZtcS8rS1g0ZUdjbnVPRi94Y0NvVlFlMHM1Vm5Ua3By?=
 =?utf-8?B?WlZGT21tM1FlZFRmY1FCZ3RleUdhNHY5RHE4QT09?=
X-Forefront-Antispam-Report:
	CIP:58.252.5.68;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.oppo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700013)(921020)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 03:24:06.9896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1a518e-f85b-4742-cb94-08dd96849d15
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6;Ip=[58.252.5.68];Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7735



On 5/9/2025 11:27 PM, Suren Baghdasaryan wrote:
> On Wed, May 7, 2025 at 8:50 AM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
>>
>> * Liam R. Howlett <Liam.Howlett@oracle.com> [250428 21:48]:
>>> Temporarily clear the preallocation flag when explicitly requesting
>>> allocations.  Pre-existing allocations are already counted against the
>>> request through mas_node_count_gfp(), but the allocations will not
>>> happen if the MA_STATE_PREALLOC flag is set.  This flag is meant to
>>> avoid re-allocating in bulk allocation mode, and to detect issues with
>>> preallocation calculations.
>>>
>>> The MA_STATE_PREALLOC flag should also always be set on zero allocations
>>> so that detection of underflow allocations will print a WARN_ON() during
>>> consumption.
>>>
>>> User visible effect of this flaw is a WARN_ON() followed by a null
>>> pointer dereference when subsequent requests for larger number of nodes
>>> is ignored, such as the vma merge retry in mmap_region() caused by
>>> drivers altering the vma flags.
>>>
>>> Reported-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
>>> Reported-by: Hailong Liu <hailong.liu@oppo.com>
>>> Fixes: 54a611b605901 ("Maple Tree: add new data structure")
>>> Link: https://lore.kernel.org/all/1652f7eb-a51b-4fee-8058-c73af63bacd1@oppo.com/
>>> Link: https://lore.kernel.org/all/20250428184058.1416274-1-Liam.Howlett@oracle.com/
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: Suren Baghdasaryan <surenb@google.com>
>>> Cc: Hailong Liu <hailong.liu@oppo.com>
>>> Cc: zhangpeng.00@bytedance.com <zhangpeng.00@bytedance.com>
>>> Cc: Steve Kang <Steve.Kang@unisoc.com>
>>> Cc: Matthew Wilcox <willy@infradead.org>
>>> Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>
>>> Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
>>
>> ...
>>
>> I have a version of this for mm-new and I'd like to send it out.  Once
>> this is upstream, it will be backported to the stable kernels with
>> something that looks a lot like what I sent out here.
>>
>> Did this fix the issue in the longer running tests?
> 
> - everyone else
> 
> Hi Liam,
> I think the delay is due to the holidays in China. I requested an
> update from the partners but they will probably provide it next week.
Sorry for late reply. We applied this patch and verified it fix the issue.

Feel free to add

Tested-by: Hailong Liu <hailong.liu@oppo.com>

Thanks,
Hailong.

> Thanks,
> Suren.
> 
>>
>> Thanks,
>> Liam

