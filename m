Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2100.outbound.protection.outlook.com [40.107.236.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A4E38B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748390465; cv=fail; b=iEZg/YV/ONDi5AQ2pUem5o+ieJ2EGWS8sV288mmmytAWwZLn2LXWNwl9R3QQedGfnUthsLRYiBSgoR9DPQIbNhXAmWGL0TJNU3zzWIpm8NDotDbWthUCZYfkD0v20UFUfNm0QtPh3evN5kKRFYHhrYN37eqenGgbfzMyjlozRHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748390465; c=relaxed/simple;
	bh=/3g0S6Gn41Kj+hmv00s8PYBXQnxqNd7hJpOFYTq4NYk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nji6Z3teHzzS/aPUeDLIAetfOPqS0MuDUwgaNeGgVQDMvgLFkMUF1MTbadIY5w16Sl9BIUpaomatul7w5ypJyioGXDs3l2FL1b7kOAORVszS2WkLmy4ic/3SANSSoUWLnIxqQEqExf8GdeEN28ZqmbcyzG634+NEDCg68Mg3FF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=hYFlqOIl; arc=fail smtp.client-ip=40.107.236.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="hYFlqOIl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCqgZULDvoBMMAdICISJiCq42hp+wqp/uDrMXh1sXps4t+14qrejxgNY+T6jg8/XGSZ5eZjccudseXlBRxfH1WJY4cJlasQIfeLnjyjnyuIfHdc6C4dKe/nBGdHcuoaQ430l1mjBnhPs9DQ6YUrhp3JiW3eKacYw+Cx3fzpW5DGKW96BMbHyGTjoF7oqeE7dhu4rqCBXat4zfhl0KBoVG/hsi1MVsHZFgi33zdP3j4KN7OZdVRpukFhb1nbAsP+jerX88mVkhZ0NtOSTmSMiNqYjXYylN6noJO07OzhhpvXwkFmez1tR+pkic2UnE3z4Hmt6sM92hJJkwuIjT4cVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrXUh/Pk+xL28dkEGzlcLrDqbEmR/deO+HrIFRalYQY=;
 b=FasUtrAVRiYrErmuNijxufCr5Whqs06iQUm1Y5pKRemJjEny5YOZhlRf+Of7plgkk7WeIlqFht3NRIoZjVwWU6LEncrXBHKmNkzib6FQKr35Sp/HV/KNEsS4fdVLTNwab4fT9EtzLSXBZ1d6tQJchFrLZ5Io+ipryiHYrihdUNqEt2T39hOAOdpc3drtBOqV+oG74sBmQ2FkkvQyS3jUf4y0ugjO4gtkyizPAG2OyGAoMaB7+GXmnP6PeKxOasVoF5rr7H8UsJmqOBxvEMW03GJswjCjsXGNluC0QncPCqRhcyk7MhxA1UmPC1wv2KDJGfto2LPkMsljtZIx0wxxUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrXUh/Pk+xL28dkEGzlcLrDqbEmR/deO+HrIFRalYQY=;
 b=hYFlqOIl+b79WfNa3Vv4hILuKMrzDjjT10MQM35awq+e623rM7Me2nQX3Rx3+EnMyCPvTqtfxFJFHcwu1fcjBABdgSv3DTdpd1x8qSYEn5C75jDtyIrKsQ3om/lv9D1oCZqhn8GOcUdLgP4sEhCeQL/rgekzNX9sXliKHuOZO54=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB6761.prod.exchangelabs.com (2603:10b6:510:76::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.29; Wed, 28 May 2025 00:00:59 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 00:00:59 +0000
Message-ID: <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
Date: Tue, 27 May 2025 17:00:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
From: Yang Shi <yang@os.amperecomputing.com>
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <3750d3f8-17c6-4bb8-8107-215d442e4ec3@os.amperecomputing.com>
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
Content-Language: en-US
In-Reply-To: <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR15CA0097.namprd15.prod.outlook.com
 (2603:10b6:930:7::19) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 73065386-8906-4ffe-45a4-08dd9d7aba04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzR1NzBxSDMxdmFGN3BaekV4WTMrdnQ0d0o5SWZ3ZU1nK2xUbEZhYU13bytV?=
 =?utf-8?B?N1FxZTY0ckRCclVtSUJFc05oMHgxOGpBZjc5alA1TG1WUzRZOStyckh0d0Y2?=
 =?utf-8?B?dWVESER5Rjg4eXoxUnVpNjR0RWE1UzFpZmNtOG9vRzlQcWJTZTJ5Q3EwUG9j?=
 =?utf-8?B?QkFSZW9RdDdxUVdBVy9LOUhoaVB3SE02WTVMQkZpMlR4UXA4cmYxT1ZKVXpv?=
 =?utf-8?B?MmNBd1RXbm96R2h3R0FXTlNBZGFGdyt2Wlo5Um4rYlNoMkJzVUJySVRHazZk?=
 =?utf-8?B?VktRa05PYVdxYzdlQit5MWU5TE9sclA2MG15eGxYcjJCb1p4SVd5UDIyOEto?=
 =?utf-8?B?R0tZS0lTUVlxM1NOUFdjL0dWdUYxVXdJZjhrWTB3cWRiZzRHR3Fkclh4eVJH?=
 =?utf-8?B?YkZpNm5vTVZoVmJrMU9CbGVUaFh6TXNBVko3YXA5a0pBVDRGL21IWlc1c2p1?=
 =?utf-8?B?eXZLU0Q0TnREVGtFUGdteVJ6RG5xQUMwMURkanMvSG96MU55cmxwUUM3cnVT?=
 =?utf-8?B?aGp4ZCszZU5IODcxT3IxQWxWVWsvNHV0MTk5Ly9acndCak9ha04xcUdETTlq?=
 =?utf-8?B?WDgxMmI2S1o1V08zci9oQzh3WHUybVI1ZGl5L1NPWGU3Zmt2My92YlVVT1l0?=
 =?utf-8?B?ZFd0b1RFOHRBQVlQMWNnazQ0WlpLaEpWYTZyS1h0UWQyUnlXQjY0Nk53dnlN?=
 =?utf-8?B?SkdjaGtJdkpQN1NnS0pWbFdvTzB1VWFLS0ZMRExuZURwWjQweXRPMXl4WFFV?=
 =?utf-8?B?SkcwaVRYZDlCWWNJOXJ6Y29nZmQwcldXQkI5NmtsS0FFZ2RzakdHaVliM0xs?=
 =?utf-8?B?dTZmcDRCY1Y0cWxMOFg4WFBHWHE2Z1UycW5TWXdNdURxcnhXWmRxckJzYkEz?=
 =?utf-8?B?N1c5NjdTTGpHSW9Ud0FXUDJud2hpQytFK2l1OXhvRzBnSm5ySGpoZFNhM0Mw?=
 =?utf-8?B?aUxZUm9jcmFBclNKeUtycWl5by9RSmpMR2RrVFJPYnBidVFScmpUK09FdFJk?=
 =?utf-8?B?VXRmeVR3UmhXOWhtU2FwcWpUR2NUTGUveVUwbWRsNmh6VEQ0RmFUNENzTUNX?=
 =?utf-8?B?RzJ5Ry92blFETFlyR2tmMktTWDRucXNCVHFYR1VwNDBOa0JvMDFkU1hlU3Jw?=
 =?utf-8?B?THFxNlNRNElvOXZzUGFLM3dSWG9UaEVjUE1wd0tDa2tTWUhaU3NMenpKZHVE?=
 =?utf-8?B?QjBPN2JRcTVMWndUaXVKVldiVWhZRnlHM0gyMWErdFBSS3JINndUaDl4U3la?=
 =?utf-8?B?VmQyckUyUGNwbVdTQ0wxY0tZaTBrbGVIM3VmMEJUbTAvZGpqYTg1T0ZsY0Nr?=
 =?utf-8?B?RHhQcGUzN2oxRTBGTkZBeDN6cWd3UTBiSnMwZHRLdDBPNHc0cmlORUJSelhO?=
 =?utf-8?B?RUVsSTFkUVJKWGQyclZMenY4K0FkRHJ6ZEFQWEQvNnpZU0FRcDdxVGtrTzNn?=
 =?utf-8?B?MU1PdGlEVmMyS2gzMjRtTklFL29WeDBUZURNdVBKZWlPNVhvc0J3WXFpUi93?=
 =?utf-8?B?UU5MdEF3a1JGNnNqMmt5SWxuMmNEa3g5WVRsRXpKLy9iVHM5b04zTzZYelZj?=
 =?utf-8?B?eEtsTlhyVXd2amVQSXMySzJ2Y0VsWFd4WnZFWEdkN0xqODY4SXpHYTFJU0k2?=
 =?utf-8?B?V3RwQlk1N3VuQkhadEFiZFVYb3BKN3QzWWxDTEhzS0VUSkpweWJnQ2hDMWNl?=
 =?utf-8?B?cEZiVGxnc2RNYk02cE9lQjlCRWhuWVQ4d1Q4cGV6NVlaaXZuY29FMkJOQlBB?=
 =?utf-8?B?bVA5Q2Z4YWM2bkR1OHBNM1NvS1VaUEdjbFZycitmSDZsaFB1aS9tRzNNQnVC?=
 =?utf-8?Q?ApbjS7/bEuraMLi523JO8ZLtn6QUhYyyp7Avc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVlnaVdFTjVwTmxrRkExQTBtZ1lTcHRrQjhYaGc1L1dBallpWk90ZzZZRUdI?=
 =?utf-8?B?NWJuSlZzU2tTcDk1SzFOeW1odjZwQU82RUxyZWpsSmd4akM2NllVZXI0WXdp?=
 =?utf-8?B?d0RGSVRUQkYxUWUvY0pndUU5cmgwOVFPYW0xeHNOQi9RalVzaFJ1TlBuejNa?=
 =?utf-8?B?SkozUlA5MTVMaEo5ZWRNQlBWWEpKUFdFcGg0L3BhOXpnRTlFdkdOWUNIOEw5?=
 =?utf-8?B?dm1wZzFHYXVDK2hUVFpkSi9ZdXhkTkc0TW9pb2J5TW1CZHV1dTZzMlQ0SEZq?=
 =?utf-8?B?T3pPcjBXcm5HN0owcWN3RlVZQ01WRnFKZnlmemovczdqdi9lNk5tRkpxN01P?=
 =?utf-8?B?UUF2SzBUbXhscHpBeXpmWXJSdFIwL0tTZjhtWjZMYzUraDV4eFVjb1M2S2hD?=
 =?utf-8?B?Ym1VYlJ5WE5GUnVqN1EraTdxTTg1MU5ZWnBYRzJLaGFzdmt1ZnBWTTJEd0xj?=
 =?utf-8?B?UVFVK0wyTENudk1aTVZjcjZEN05LcW5xditlcm1uSnBmWGp6eUt2cFRUUExU?=
 =?utf-8?B?OXFRMGdydGtRVHhTdTAvK3g3aERGRnVJVFpLQ0JHQ21Fa05kVDd2Mk5MT2hH?=
 =?utf-8?B?ek80WXpDRHBQVTdCSmk1UDRkbS9UOE14NHhaOWpIY3NaRnBqMndDSTgvcnpB?=
 =?utf-8?B?cFdZU01PdTYrQzdVbXdJOTFqYTRWNms0ZzZGakVvMGdvc0pNK0FwUWNRY3c5?=
 =?utf-8?B?dDQxZnlIQ0JOWnd6U1BLa3FIZ1JHWXhjODZRaXVYd0hFMmt0TnhHVTZKYmI1?=
 =?utf-8?B?RkVWS0FJMDMzem45OVF6alE4Qng4NWEwdUNiQ0YydUJFREJVb2cxNmVxb2FB?=
 =?utf-8?B?aUwzbVl3QnZqcGh4bXBOZFFkWlFHUWQ0NWNzaGcrOTBra2NuTEx2Wm8zaTds?=
 =?utf-8?B?WWM4N1dlcTd2ZzA0bHBKZktBdGNwQUhEZmMwVjZCVTNCQjRpYTg0dlNMVEQx?=
 =?utf-8?B?MlV2a2lhamRDczF3a1BaWU8xTnZYWHFBbmxYVGRSWXpMRG1sSHhTYkdqVUxV?=
 =?utf-8?B?Zjl0WXIzRkN5WHRvNkNPcjc3M2dpOHZNTWJESGNQdnNWUWlSdnJheUc4N2hW?=
 =?utf-8?B?ZGtaa3JaN05uZnZNb2cyMHlCaWpuVk9pbXJ2UFRMZXlRTlBsRFRCYlA2TmpU?=
 =?utf-8?B?NERVUUl5Z2tEdHBEVjI4Wm10L2xWOTN1cnBVU0IxWjR4YkxwbVlEODhzbzZs?=
 =?utf-8?B?Yko4M2E5ZlNJVVdiUjBISzlueEQ2NXRTY1RtZXFrTGJxbllXVkZ2aUJuSmNE?=
 =?utf-8?B?MlQ0ajNRWWpVTnI0N2MwV0FwSjZrS0hyVnlGOUdmbWZPVC94WkFBL1V5ODhX?=
 =?utf-8?B?NlBsNHBWYlJvZnFTNnN5bGJSNGZiWG55djU4akVET3N4QnJzRllzcm1EaFZP?=
 =?utf-8?B?ZzdmS3dWVGY1d3Bxd2ZUMTdNY29WWlpsVlhPVlduTnZ0bGpaaDU4clprSjJa?=
 =?utf-8?B?OXRzTjFWQ2JxNXhhVHBXRXNtTExtMWJqcVBpWEVtdlE4RmwwSWhTOEMzellI?=
 =?utf-8?B?ZFNMeGJUaVI3Q2ZSS1RSL1I4YVRTdVJaVEpGMXFCOVQ2N1lwQndNNmdWRmVO?=
 =?utf-8?B?ZGZXWU5NYU9jUCs4K1l0TnJUdGoyRm1aNUVTYUt2NWdGSkZFMndsT2hLUUhy?=
 =?utf-8?B?RGFabnl2dzJjeDFHTmJtc3A2OGNsWGZERVVtck1TVW9Bc3pUQi91Vkoxdzhn?=
 =?utf-8?B?NlUwMVcvZm95NHdxblAyMmJFNXZkU3BlQTduRU1IeXd4eE9FMlBOMlRBbHpa?=
 =?utf-8?B?c0U5cFJsb3phdktyVEgyeTNtamFhbXY0VkVlOXY3RkpVa2tHSkRhbzY0UVJT?=
 =?utf-8?B?ZTA3dzNUaVdyUlBpV0J3eGhEM2ZnT3JtSjBPbE9EZmNOS2hCckd2UWtYNGNq?=
 =?utf-8?B?ZGVJTHRvWnZmelhORHJvdFRxRitTUGJpY3RqMmt2alRTaVh6d0J3bHNsWkZI?=
 =?utf-8?B?UjVKUzlkODhiblBFRFIwVnNXZ0VFYkFQaVRsMGtTMFU5ZzlBYUdYbFBxTU9w?=
 =?utf-8?B?aDRYVmVSOG5GVHVDSU4zSHViWG1QcXV4RlZwSXZXVzBPVXRUd3VpRXpRRS9w?=
 =?utf-8?B?eldVaVRuZWRWQU1PbjFITFlpaHNEcHBKUk94QWlvem9KN2h3SE1WR3hLanlh?=
 =?utf-8?B?ajBrMnBodUNuUHhlcGlRQm1Dd2wzaFVYeG5CUk1hTmpUM2dOV1lmVGhTa2Fv?=
 =?utf-8?Q?DXLmcd/ffMvGdn9E0boVEbQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73065386-8906-4ffe-45a4-08dd9d7aba04
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 00:00:59.0763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H8+JObnV7uwes1XwzKnnuX0tdhozu2tapO7DcN1gKDRloNQcBdDb9Y1/C+bFeCbrNNzXxUZKhBOH+uRXQyfsZf7hXejVFor+jyV8iw3dYpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6761

Hi Ryan,

I got a new spin ready in my local tree on top of v6.15-rc4. I noticed 
there were some more comments on Miko's BBML2 patch, it looks like a new 
spin is needed. But AFAICT there should be no significant change to how 
I advertise AmpereOne BBML2 in my patches. We will keep using MIDR list 
to check whether BBML2 is advertised or not and the erratum seems still 
be needed to fix up AA64MMFR2 BBML2 bits for AmpereOne IIUC.

You also mentioned Dev was working on patches to have 
__change_memory_common() apply permission change on a contiguous range 
instead of on page basis (the status quo). But I have not seen the 
patches on mailing list yet. However I don't think this will result in 
any significant change to my patches either, particularly the split 
primitive and linear map repainting.

So I plan to post v4 patches to the mailing list. We can focus on 
reviewing the split primitive and linear map repainting. Does it sound 
good to you?

Thanks,
Yang


On 5/7/25 2:16 PM, Yang Shi wrote:
>
>
> On 5/7/25 12:58 AM, Ryan Roberts wrote:
>> On 05/05/2025 22:39, Yang Shi wrote:
>>>
>>> On 5/2/25 4:51 AM, Ryan Roberts wrote:
>>>> On 14/04/2025 22:24, Yang Shi wrote:
>>>>> On 4/14/25 6:03 AM, Ryan Roberts wrote:
>>>>>> On 10/04/2025 23:00, Yang Shi wrote:
>>>>>>> Hi Ryan,
>>>>>>>
>>>>>>> I know you may have a lot of things to follow up after LSF/MM. 
>>>>>>> Just gently
>>>>>>> ping,
>>>>>>> hopefully we can resume the review soon.
>>>>>> Hi, I'm out on holiday at the moment, returning on the 22nd 
>>>>>> April. But I'm very
>>>>>> keen to move this series forward so will come back to you next 
>>>>>> week. (although
>>>>>> TBH, I thought I was waiting for you to respond to me... :-| )
>>>>>>
>>>>>> FWIW, having thought about it a bit more, I think some of the 
>>>>>> suggestions I
>>>>>> previously made may not have been quite right, but I'll elaborate 
>>>>>> next week.
>>>>>> I'm
>>>>>> keen to build a pgtable splitting primitive here that we can 
>>>>>> reuse with vmalloc
>>>>>> as well to enable huge mappings by default with vmalloc too.
>>>>> Sounds good. I think the patches can support splitting vmalloc 
>>>>> page table too.
>>>>> Anyway we can discuss more after you are back. Enjoy your holiday.
>>>> Hi Yang,
>>>>
>>>> Sorry I've taken so long to get back to you. Here's what I'm 
>>>> currently thinking:
>>>> I'd eventually like to get to the point where the linear map and 
>>>> most vmalloc
>>>> memory is mapped using the largest possible mapping granularity 
>>>> (i.e. block
>>>> mappings at PUD/PMD, and contiguous mappings at PMD/PTE level).
>>>>
>>>> vmalloc has history with trying to do huge mappings by default; it 
>>>> ended up
>>>> having to be turned into an opt-in feature (instead of the original 
>>>> opt-out
>>>> approach) because there were problems with some parts of the kernel 
>>>> expecting
>>>> page mappings. I think we might be able to overcome those issues on 
>>>> arm64 with
>>>> BBML2.
>>>>
>>>> arm64 can already support vmalloc PUD and PMD block mappings, and I 
>>>> have a
>>>> series (that should make v6.16) that enables contiguous PTE 
>>>> mappings in vmalloc
>>>> too. But these are currently limited to when VM_ALLOW_HUGE is 
>>>> specified. To be
>>>> able to use that by default, we need to be able to change 
>>>> permissions on
>>>> sub-regions of an allocation, which is where BBML2 and your series 
>>>> come in.
>>>> (there may be other things we need to solve as well; TBD).
>>>>
>>>> I think the key thing we need is a function that can take a 
>>>> page-aligned kernel
>>>> VA, will walk to the leaf entry for that VA and if the VA is in the 
>>>> middle of
>>>> the leaf entry, it will split it so that the VA is now on a 
>>>> boundary. This will
>>>> work for PUD/PMD block entries and contiguous-PMD/contiguous-PTE 
>>>> entries. The
>>>> function can assume BBML2 is present. And it will return 0 on 
>>>> success, -EINVAL
>>>> if the VA is not mapped or -ENOMEM if it couldn't allocate a 
>>>> pgtable to perform
>>>> the split.
>>> OK, the v3 patches already handled page table allocation failure 
>>> with returning
>>> -ENOMEM and BUG_ON if it is not mapped because kernel assumes linear 
>>> mapping
>>> should be always present. It is easy to return -EINVAL instead of 
>>> BUG_ON.
>>> However I'm wondering what usecases you are thinking about? 
>>> Splitting vmalloc
>>> area may run into unmapped VA?
>> I don't think BUG_ON is the right behaviour; crashing the kernel 
>> should be
>> discouraged. I think even for vmalloc under correct conditions we 
>> shouldn't see
>> any unmapped VA. But vmalloc does handle it gracefully today; see (e.g.)
>> vunmap_pmd_range() which skips the pmd if its none.
>>
>>>> Then we can use that primitive on the start and end address of any 
>>>> range for
>>>> which we need exact mapping boundaries (e.g. when changing 
>>>> permissions on part
>>>> of linear map or vmalloc allocation, when freeing part of a vmalloc 
>>>> allocation,
>>>> etc). This way we only split enough to ensure the boundaries are 
>>>> precise, and
>>>> keep larger mappings inside the range.
>>> Yeah, makes sense to me.
>>>
>>>> Next we need to reimplement __change_memory_common() to not use
>>>> apply_to_page_range(), because that assumes page mappings only. Dev 
>>>> Jain has
>>>> been working on a series that converts this to use 
>>>> walk_page_range_novma() so
>>>> that we can change permissions on the block/contig entries too. 
>>>> That's not
>>>> posted publicly yet, but it's not huge so I'll ask if he is 
>>>> comfortable with
>>>> posting an RFC early next week.
>>> OK, so the new __change_memory_common() will change the permission 
>>> of page
>>> table, right?
>> It will change permissions of all the leaf entries in the range of 
>> VAs it is
>> passed. Currently it assumes that all the leaf entries are PTEs. But 
>> we will
>> generalize to support all the other types of leaf entries too.,
>>
>>> If I remember correctly, you suggested change permissions in
>>> __create_pgd_mapping_locked() for v3. So I can disregard it?
>> Yes I did. I think this made sense (in my head at least) because in 
>> the context
>> of the linear map, all the PFNs are contiguous so it kind-of makes 
>> sense to
>> reuse that infrastructure. But it doesn't generalize to vmalloc 
>> because vmalloc
>> PFNs are not contiguous. So for that reason, I think it's preferable 
>> to have an
>> independent capability.
>
> OK, sounds good to me.
>
>>
>>> The current code assumes the address range passed in by 
>>> change_memory_common()
>>> is *NOT* physically contiguous so __change_memory_common() handles 
>>> page table
>>> permission on page basis. I'm supposed Dev's patches will handle 
>>> this then my
>>> patch can safely assume the linear mapping address range for 
>>> splitting is
>>> physically contiguous too otherwise I can't keep large mappings 
>>> inside the
>>> range. Splitting vmalloc area doesn't need to worry about this.
>> I'm not sure I fully understand the point you're making here...
>>
>> Dev's series aims to use walk_page_range_novma() similar to riscv's
>> implementation so that it can walk a VA range and update the 
>> permissions on each
>> leaf entry it visits, regadless of which level the leaf entry is at. 
>> This
>> doesn't make any assumption of the physical contiguity of 
>> neighbouring leaf
>> entries in the page table.
>>
>> So if we are changing permissions on the linear map, we have a range 
>> of VAs to
>> walk and convert all the leaf entries, regardless of their size. The 
>> same goes
>> for vmalloc... But for vmalloc, we will also want to change the 
>> underlying
>> permissions in the linear map, so we will have to figure out the 
>> contiguous
>> pieces of the linear map and call __change_memory_common() for each; 
>> there is
>> definitely some detail to work out there!
>
> Yes, this is my point. When changing underlying linear map permission 
> for vmalloc, the linear map address may be not contiguous. This is why 
> change_memory_common() calls __change_memory_common() on page basis.
>
> But how Dev's patch work should have no impact on how I implement the 
> split primitive by thinking it further. It should be the caller's 
> responsibility to make sure __create_pgd_mapping_locked() is called 
> for contiguous linear map address range.
>
>>
>>>> You'll still need to repaint the whole linear map with page 
>>>> mappings for the
>>>> case !BBML2 case, but I'm hoping __create_pgd_mapping_locked() 
>>>> (potentially with
>>>> minor modifications?) can do that repainting on the live mappings; 
>>>> similar to
>>>> how you are doing it in v3.
>>> Yes, when repainting I need to split the page table all the way down 
>>> to PTE
>>> level. A simple flag should be good enough to tell 
>>> __create_pgd_mapping_locked()
>>> do the right thing off the top of my head.
>> Perhaps it may be sufficient to reuse the NO_BLOCK_MAPPINGS and 
>> NO_CONT_MAPPINGS
>> flags? For example, if you are find a leaf mapping and 
>> NO_BLOCK_MAPPINGS is set,
>> then you need to split it?
>
> Yeah, sounds feasible. Anyway I will figure it out.
>
>>
>>>> Miko's BBML2 series should hopefully get imminently queued for v6.16.
>>> Great! Anyway my series is based on his advertising BBML2 patch.
>>>
>>>> So in summary, what I'm asking for your large block mapping the 
>>>> linear map
>>>> series is:
>>>>     - Paint linear map using blocks/contig if boot CPU supports BBML2
>>>>     - Repaint linear map using page mappings if secondary CPUs 
>>>> don't support BBML2
>>> OK, I just need to add some simple tweak to split down to PTE level 
>>> to v3.
>>>
>>>>     - Integrate Dev's __change_memory_common() series
>>> OK, I think I have to do my patches on top of it. Because Dev's 
>>> patch need
>>> guarantee the linear mapping address range is physically contiguous.
>>>
>>>>     - Create primitive to ensure mapping entry boundary at a given 
>>>> page-aligned VA
>>>>     - Use primitive when changing permissions on linear map region
>>> Sure.
>>>
>>>> This will be mergable on its own, but will also provide a great 
>>>> starting base
>>>> for adding huge-vmalloc-by-default.
>>>>
>>>> What do you think?
>>> Definitely makes sense to me.
>>>
>>> If I remember correctly, we still have some unsolved 
>>> comments/questions for v3
>>> in my replies on March 17, particularly:
>>> https://lore.kernel.org/linux-arm-kernel/2b715836-b566-4a9e-
>>> b344-9401fa4c0feb@os.amperecomputing.com/
>> Ahh sorry about that. I'll take a look now...
>
> No problem.
>
> Thanks,
> Yang
>
>>
>> Thanks,
>> Ryan
>>
>>> Thanks,
>>> Yang
>>>
>>>> Thanks,
>>>> Ryan
>>>>
>>>>
>>>>> Thanks,
>>>>> Yang
>>>>>
>>>>>> Thanks,
>>>>>> Ryan
>>>>>>
>>>>>>> Thanks,
>>>>>>> Yang
>>>>>>>
>>>>>>>
>>>>>>> On 3/13/25 10:40 AM, Yang Shi wrote:
>>>>>>>> On 3/13/25 10:36 AM, Ryan Roberts wrote:
>>>>>>>>> On 13/03/2025 17:28, Yang Shi wrote:
>>>>>>>>>> Hi Ryan,
>>>>>>>>>>
>>>>>>>>>> I saw Miko posted a new spin of his patches. There are some 
>>>>>>>>>> slight changes
>>>>>>>>>> that
>>>>>>>>>> have impact to my patches (basically check the new boot 
>>>>>>>>>> parameter). Do you
>>>>>>>>>> prefer I rebase my patches on top of his new spin right now 
>>>>>>>>>> then restart
>>>>>>>>>> review
>>>>>>>>>> from the new spin or review the current patches then solve 
>>>>>>>>>> the new review
>>>>>>>>>> comments and rebase to Miko's new spin together?
>>>>>>>>> Hi Yang,
>>>>>>>>>
>>>>>>>>> Sorry I haven't got to reviewing this version yet, it's in my 
>>>>>>>>> queue!
>>>>>>>>>
>>>>>>>>> I'm happy to review against v3 as it is. I'm familiar with 
>>>>>>>>> Miko's series
>>>>>>>>> and am
>>>>>>>>> not too bothered about the integration with that; I think it's 
>>>>>>>>> pretty
>>>>>>>>> straight
>>>>>>>>> forward. I'm more interested in how you are handling the 
>>>>>>>>> splitting, which I
>>>>>>>>> think is the bulk of the effort.
>>>>>>>> Yeah, sure, thank you.
>>>>>>>>
>>>>>>>>> I'm hoping to get to this next week before heading out to 
>>>>>>>>> LSF/MM the
>>>>>>>>> following
>>>>>>>>> week (might I see you there?)
>>>>>>>> Unfortunately I can't make it this year. Have a fun!
>>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Yang
>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Ryan
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Yang
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 3/4/25 2:19 PM, Yang Shi wrote:
>>>>>>>>>>> Changelog
>>>>>>>>>>> =========
>>>>>>>>>>> v3:
>>>>>>>>>>>        * Rebased to v6.14-rc4.
>>>>>>>>>>>        * Based on Miko's BBML2 cpufeature patch 
>>>>>>>>>>> (https://lore.kernel.org/
>>>>>>>>>>> linux-
>>>>>>>>>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>>>>>>>>>          Also included in this series in order to have the 
>>>>>>>>>>> complete
>>>>>>>>>>> patchset.
>>>>>>>>>>>        * Enhanced __create_pgd_mapping() to handle split as 
>>>>>>>>>>> well per Ryan.
>>>>>>>>>>>        * Supported CONT mappings per Ryan.
>>>>>>>>>>>        * Supported asymmetric system by splitting kernel 
>>>>>>>>>>> linear mapping if
>>>>>>>>>>> such
>>>>>>>>>>>          system is detected per Ryan. I don't have such 
>>>>>>>>>>> system to test,
>>>>>>>>>>> so the
>>>>>>>>>>>          testing is done by hacking kernel to call linear 
>>>>>>>>>>> mapping
>>>>>>>>>>> repainting
>>>>>>>>>>>          unconditionally. The linear mapping doesn't have 
>>>>>>>>>>> any block and
>>>>>>>>>>> cont
>>>>>>>>>>>          mappings after booting.
>>>>>>>>>>>
>>>>>>>>>>> RFC v2:
>>>>>>>>>>>        * Used allowlist to advertise BBM lv2 on the CPUs 
>>>>>>>>>>> which can
>>>>>>>>>>> handle TLB
>>>>>>>>>>>          conflict gracefully per Will Deacon
>>>>>>>>>>>        * Rebased onto v6.13-rc5
>>>>>>>>>>>        * 
>>>>>>>>>>> https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1- 
>>>>>>>>>>>
>>>>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>>>>
>>>>>>>>>>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>>>>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>>>>
>>>>>>>>>>> Description
>>>>>>>>>>> ===========
>>>>>>>>>>> When rodata=full kernel linear mapping is mapped by PTE due 
>>>>>>>>>>> to arm's
>>>>>>>>>>> break-before-make rule.
>>>>>>>>>>>
>>>>>>>>>>> A number of performance issues arise when the kernel linear 
>>>>>>>>>>> map is using
>>>>>>>>>>> PTE entries due to arm's break-before-make rule:
>>>>>>>>>>>        - performance degradation
>>>>>>>>>>>        - more TLB pressure
>>>>>>>>>>>        - memory waste for kernel page table
>>>>>>>>>>>
>>>>>>>>>>> These issues can be avoided by specifying rodata=on the 
>>>>>>>>>>> kernel command
>>>>>>>>>>> line but this disables the alias checks on page table 
>>>>>>>>>>> permissions and
>>>>>>>>>>> therefore compromises security somewhat.
>>>>>>>>>>>
>>>>>>>>>>> With FEAT_BBM level 2 support it is no longer necessary to 
>>>>>>>>>>> invalidate the
>>>>>>>>>>> page table entry when changing page sizes. This allows the 
>>>>>>>>>>> kernel to
>>>>>>>>>>> split large mappings after boot is complete.
>>>>>>>>>>>
>>>>>>>>>>> This patch adds support for splitting large mappings when 
>>>>>>>>>>> FEAT_BBM level 2
>>>>>>>>>>> is available and rodata=full is used. This functionality 
>>>>>>>>>>> will be used
>>>>>>>>>>> when modifying page permissions for individual page frames.
>>>>>>>>>>>
>>>>>>>>>>> Without FEAT_BBM level 2 we will keep the kernel linear map 
>>>>>>>>>>> using PTEs
>>>>>>>>>>> only.
>>>>>>>>>>>
>>>>>>>>>>> If the system is asymmetric, the kernel linear mapping may 
>>>>>>>>>>> be repainted
>>>>>>>>>>> once
>>>>>>>>>>> the BBML2 capability is finalized on all CPUs.  See patch #6 
>>>>>>>>>>> for more
>>>>>>>>>>> details.
>>>>>>>>>>>
>>>>>>>>>>> We saw significant performance increases in some benchmarks 
>>>>>>>>>>> with
>>>>>>>>>>> rodata=full without compromising the security features of 
>>>>>>>>>>> the kernel.
>>>>>>>>>>>
>>>>>>>>>>> Testing
>>>>>>>>>>> =======
>>>>>>>>>>> The test was done on AmpereOne machine (192 cores, 1P) with 
>>>>>>>>>>> 256GB
>>>>>>>>>>> memory and
>>>>>>>>>>> 4K page size + 48 bit VA.
>>>>>>>>>>>
>>>>>>>>>>> Function test (4K/16K/64K page size)
>>>>>>>>>>>        - Kernel boot.  Kernel needs change kernel linear 
>>>>>>>>>>> mapping
>>>>>>>>>>> permission at
>>>>>>>>>>>          boot stage, if the patch didn't work, kernel 
>>>>>>>>>>> typically didn't
>>>>>>>>>>> boot.
>>>>>>>>>>>        - Module stress from stress-ng. Kernel module load 
>>>>>>>>>>> change permission
>>>>>>>>>>> for
>>>>>>>>>>>          linear mapping.
>>>>>>>>>>>        - A test kernel module which allocates 80% of total 
>>>>>>>>>>> memory via
>>>>>>>>>>> vmalloc(),
>>>>>>>>>>>          then change the vmalloc area permission to RO, this 
>>>>>>>>>>> also change
>>>>>>>>>>> linear
>>>>>>>>>>>          mapping permission to RO, then change it back 
>>>>>>>>>>> before vfree(). Then
>>>>>>>>>>> launch
>>>>>>>>>>>          a VM which consumes almost all physical memory.
>>>>>>>>>>>        - VM with the patchset applied in guest kernel too.
>>>>>>>>>>>        - Kernel build in VM with guest kernel which has this 
>>>>>>>>>>> series
>>>>>>>>>>> applied.
>>>>>>>>>>>        - rodata=on. Make sure other rodata mode is not broken.
>>>>>>>>>>>        - Boot on the machine which doesn't support BBML2.
>>>>>>>>>>>
>>>>>>>>>>> Performance
>>>>>>>>>>> ===========
>>>>>>>>>>> Memory consumption
>>>>>>>>>>> Before:
>>>>>>>>>>> MemTotal:       258988984 kB
>>>>>>>>>>> MemFree:        254821700 kB
>>>>>>>>>>>
>>>>>>>>>>> After:
>>>>>>>>>>> MemTotal:       259505132 kB
>>>>>>>>>>> MemFree:        255410264 kB
>>>>>>>>>>>
>>>>>>>>>>> Around 500MB more memory are free to use.  The larger the 
>>>>>>>>>>> machine, the
>>>>>>>>>>> more memory saved.
>>>>>>>>>>>
>>>>>>>>>>> Performance benchmarking
>>>>>>>>>>> * Memcached
>>>>>>>>>>> We saw performance degradation when running Memcached 
>>>>>>>>>>> benchmark with
>>>>>>>>>>> rodata=full vs rodata=on.  Our profiling pointed to kernel 
>>>>>>>>>>> TLB pressure.
>>>>>>>>>>> With this patchset we saw ops/sec is increased by around 
>>>>>>>>>>> 3.5%, P99
>>>>>>>>>>> latency is reduced by around 9.6%.
>>>>>>>>>>> The gain mainly came from reduced kernel TLB misses.  The 
>>>>>>>>>>> kernel TLB
>>>>>>>>>>> MPKI is reduced by 28.5%.
>>>>>>>>>>>
>>>>>>>>>>> The benchmark data is now on par with rodata=on too.
>>>>>>>>>>>
>>>>>>>>>>> * Disk encryption (dm-crypt) benchmark
>>>>>>>>>>> Ran fio benchmark with the below command on a 128G ramdisk 
>>>>>>>>>>> (ext4) with
>>>>>>>>>>> disk
>>>>>>>>>>> encryption (by dm-crypt).
>>>>>>>>>>> fio --directory=/data --random_generator=lfsr --norandommap --
>>>>>>>>>>> randrepeat 1 \
>>>>>>>>>>>          --status-interval=999 --rw=write --bs=4k --loops=1 --
>>>>>>>>>>> ioengine=sync \
>>>>>>>>>>>          --iodepth=1 --numjobs=1 --fsync_on_close=1 
>>>>>>>>>>> --group_reporting --
>>>>>>>>>>> thread \
>>>>>>>>>>>          --name=iops-test-job --eta-newline=1 --size 100G
>>>>>>>>>>>
>>>>>>>>>>> The IOPS is increased by 90% - 150% (the variance is high, 
>>>>>>>>>>> but the worst
>>>>>>>>>>> number of good case is around 90% more than the best number 
>>>>>>>>>>> of bad case).
>>>>>>>>>>> The bandwidth is increased and the avg clat is reduced 
>>>>>>>>>>> proportionally.
>>>>>>>>>>>
>>>>>>>>>>> * Sequential file read
>>>>>>>>>>> Read 100G file sequentially on XFS (xfs_io read with page cache
>>>>>>>>>>> populated).
>>>>>>>>>>> The bandwidth is increased by 150%.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Mikołaj Lenczewski (1):
>>>>>>>>>>>            arm64: Add BBM Level 2 cpu feature
>>>>>>>>>>>
>>>>>>>>>>> Yang Shi (5):
>>>>>>>>>>>            arm64: cpufeature: add AmpereOne to BBML2 allow list
>>>>>>>>>>>            arm64: mm: make __create_pgd_mapping() and 
>>>>>>>>>>> helpers non-void
>>>>>>>>>>>            arm64: mm: support large block mapping when 
>>>>>>>>>>> rodata=full
>>>>>>>>>>>            arm64: mm: support split CONT mappings
>>>>>>>>>>>            arm64: mm: split linear mapping if BBML2 is not 
>>>>>>>>>>> supported on
>>>>>>>>>>> secondary
>>>>>>>>>>> CPUs
>>>>>>>>>>>
>>>>>>>>>>>       arch/arm64/Kconfig                  | 11 +++++
>>>>>>>>>>>       arch/arm64/include/asm/cpucaps.h    | 2 +
>>>>>>>>>>>       arch/arm64/include/asm/cpufeature.h | 15 ++++++
>>>>>>>>>>>       arch/arm64/include/asm/mmu.h        | 4 ++
>>>>>>>>>>>       arch/arm64/include/asm/pgtable.h    | 12 ++++-
>>>>>>>>>>>       arch/arm64/kernel/cpufeature.c      | 95 
>>>>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>>>> ++++++
>>>>>>>>>>> +++++++
>>>>>>>>>>>       arch/arm64/mm/mmu.c                 | 397 
>>>>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>>>> ++++++
>>>>>>>>>>> ++++
>>>>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
>>>>>>>>>>>
>>>>>>>>>>> +++++
>>>>>>>>>>> ++++++++++++++++++++++-------------------
>>>>>>>>>>>       arch/arm64/mm/pageattr.c            | 37 ++++++++++++---
>>>>>>>>>>>       arch/arm64/tools/cpucaps            | 1 +
>>>>>>>>>>>       9 files changed, 518 insertions(+), 56 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>>
>

