Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FC923FC42
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336022; cv=fail; b=qSSLpLJulAofEHA8cvlDILLZ5mpXtVzIW/ipnvrP0Xc82XAzKuX40MkwvEyKSE5ihUm/MTtHvQT1lHP7kEH7hlgr4/yWbyLhUX99JMOtBxNUFy941iIHO9jK29TVT5DUI3CL8cbU3UXTXvUAP2vUYE+vxMHVtN40AOQ/9wxAyZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336022; c=relaxed/simple;
	bh=x9zMB1hHTRZfd9haEhcuUTLSgwrbUt/W8n0qttXwMDA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EibkPWtUhDvGM7ZFLaaWjuT0kFFPm+WMO8EaEkWnA5zNwlGGs0DQxuWOgt/R8VhoMelqzsr7NNdhBjQwKCFsrbu2NzKaN6c4XwcPhC4FCFxvgqVHOGruSAX9l1oiVsulRoR4eEWY7Wy+EjA3bC9KuLcWVSrCyu097KQ9RN/YgUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=B7GsEq0u; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="B7GsEq0u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGjgNpyEhzWwjVQ31QKaTtzWpL7jTK0rihxvIgkVOLpcPVqu109BJdxNdewL61pngB/ZzSSrLJg9BxCDAG/rSY1LrK99ARhvtCeiZOaPo6s3USil88iPeHyEWwKjKgi5CC2ovE5J3la5joAfzTy7GerEs7pDquA7EyCr5jsLe5YcUWvSQ3vCnK+BlF5F1+XzlOJxLS9kH6YzQIIyurvVM8h/3HVZCNF57x5MeKCXXi5IEqdixA3YUUxCsfC15pqsPg2hVvPN8ohNevQ5E07HW7xBkoNfWwizm7maiNO/OmyGUcvCvp2LNyhmolfhsG3iHXTzCGgxbOG1MyRHpyLoGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBQFHbZc8xP5yUP+4vXqJHLuoSKT7ZPDqB/1+9k7Spg=;
 b=RI9fARrXESens1MfqgIiSqvX8Aam4EsptfLvs5B93DQ91PxZOjFpEbh8ukhs6l4AX0VawBZDasI166fv7b7+Y1qes2IrWs2/+bdVexryG5DEusRCzdPNV6zc0C5BmgXD4RgrDCpJs5dJNEDqHJxSq461kPu5LPxpdgCfwUTiJdsIeR9jhKebMGp6BGoT9OP86a9KchJz3FiZWBbzBKVPd7IWoRyTOVcyrmMNwG/GAY65zoF+mzmvpiCUlaEHbdEQyRpdahs24/fOlBT7532ayxXY2LfCuX5JaTgi/lbmfiTfYp3SVRq16OwXX/0iv7A/EaGIUdss0PcmbEW2I1u+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBQFHbZc8xP5yUP+4vXqJHLuoSKT7ZPDqB/1+9k7Spg=;
 b=B7GsEq0uYnXDlgJ9CE5mQ1Td3xObbKNOBsAXp3k4LR4RiZGgESJrO5EqFQCllchRxKlAQQsOitlJ0WLHCpiD9DODQzOb4dlOuAkFF3/3xJyrA7gNSrsd7D9xNX4JqBomELK2S8ZK1rPwo7WkowuEIdn+XBZv9R1lDC6LoO0QvlA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 27 May
 2025 08:53:39 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 08:53:36 +0000
Message-ID: <55c51f34-b41d-49b2-96a2-dcc5f425f966@amd.com>
Date: Tue, 27 May 2025 14:23:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 0/2] Batch migration for NUMA balancing
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com, willy@infradead.org,
 ziy@nvidia.com, dave@stgolabs.net, nifan.cxl@gmail.com,
 joshua.hahnjy@gmail.com, xuezhengchu@huawei.com, yiannis@zptcorp.com,
 akpm@linux-foundation.org, david@redhat.com
References: <20250521080238.209678-1-bharata@amd.com>
 <87sekrbvyr.fsf@DESKTOP-5N7EMDA>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <87sekrbvyr.fsf@DESKTOP-5N7EMDA>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0007.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::16) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: e72f83b2-5220-41a5-8618-08dd9cfbf732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGxRSk0vSDZpS2hTWW1tc2ttdCtTUkVvVjg2NFMrRUdPYlRDUUdGeHBTTWFU?=
 =?utf-8?B?YXc5VHJObTlCTGhCTTdnQ1pJRlpBOEpNNGZPNU80ZVM0RitoODlmTTczNU9M?=
 =?utf-8?B?Q0tGcTB6Y21ROTBWSlNWS1VtblFvNXVDMDQrZWtoQ2VmbGo5Q0NDbWZ3TytB?=
 =?utf-8?B?VmlzNmREc1lKUnlhSVoyTFdQeUNaWFhPOHhtWGlhdjBtS2JQaVlrVFpCdlBP?=
 =?utf-8?B?QlJPd0NHbVZJc0lDWGsxcnNsa0VET2xLTjhLam51RDNETFJDaW1ESy9MV2s3?=
 =?utf-8?B?T0d5dG1yYS9USzhiVk4yY1pTcmJmVkwrQ3RIbnhKUDVZcVNlMDh1aDJURkF0?=
 =?utf-8?B?eG9ZMDc5SUlxY2g1cC9tdmcrQjduRWxURHYzR1duV3VRVmhMSmk2U1JKREdX?=
 =?utf-8?B?Y0E3MmFIWW9zZWNUa2dIbnlsNlh5M0tJeThMc1ZuK1BlYTlhUk9IUSt1bFZv?=
 =?utf-8?B?aE5tMDduSGpJN2E3YTNMQTkyYlFrOGpwV2tndkJOTVU2dUFNSzZFTUZ1Rm56?=
 =?utf-8?B?dHV0VGF5WVE5UnlTOTQ2Q0w2MTZwREphMFBtMm9IbkNyMmNwTDFoeHUzcDVx?=
 =?utf-8?B?SndDOEJaOWFuN3Y1ZzVvQVhUYVo3aG1Jd0h6ZEwwZzFweVZRcUFCWksvM2h6?=
 =?utf-8?B?bU9OdERQQjZWSTlwdHM5TW9RNllCTzFlZnp6eWVmUVorN1RlOW9DREc2WHNW?=
 =?utf-8?B?RENndmpLcHQ0VnoyZnlLN0xqdElpZWppRXlEbnJSTDhjTTV2anlYRTNZMHh4?=
 =?utf-8?B?SjFvLzl5QnF4UUdhdk8wejhXaTJ4eDJHQi9MUXc5aWFKY0dPSW83SUZtUDY0?=
 =?utf-8?B?eVlpZWt2aDdIY0JVRkFRYUtlRUZRQm5XYXdCYnQ0WlBJTFN2WkptaFhScGlx?=
 =?utf-8?B?bXMzRUdFd1hBeG5ScFh4WEUxVWpFVXdleGt3dzAvc1NseElzK3VmeVR3UmY3?=
 =?utf-8?B?T0pFZ21rdnRkVXBqTDROK3JJVXFOOE9BSlNTZFh6YVVPYjZqTUpDaTZHSlh2?=
 =?utf-8?B?MW4xRllKeFZDdDlBenYvWXVaYTFnYlRJbkVtWTVsZmpKSFJFTHpSRG1wWGxw?=
 =?utf-8?B?UEJQK0svMGNiZ0xXd2xNMVJISmhEQjNJOWVOaXlReE9XUFc5Ky9tM0IrQjdj?=
 =?utf-8?B?K0NJR3NqbktTUUhWRXk1SmVhaVFmRmtTMFpVMTlGT2hvZnU3Z2dCWnlzemR6?=
 =?utf-8?B?NmRsdVpZbGpOSWRYQ0pKQnNHQURYY0R5OHI1SFMrSFZSdHNON0JEL2pMMWVn?=
 =?utf-8?B?NnRpb3ZvNit3VXczUE5PeGFsYUZHeDY5L0RtdzdNMURVWExVaEhiMUwvR3FS?=
 =?utf-8?B?NnNkTU9YdUtGQWE4TWI4U1EvWitqT09VQ3hBNjc2UHhIdEFFdTRUYjRsQ1lO?=
 =?utf-8?B?Z2t6YkRWd2dJYndZKzI0RjNHVGUvdStrMVM3MlZvZlVtU3dPRFN0L0prRVUv?=
 =?utf-8?B?cGdpcGxRMHVveU9qSUpldEdCOTZPSU9JdWE3U2lid3Z2QmRkRE5KRUsreG80?=
 =?utf-8?B?K1Fzek5HYWZvWHc2VmJ4eVNXRFhEOFNuKzN4bFZKRzFRTDlzc1JzT1ZhMmQr?=
 =?utf-8?B?YmgzaUpoRWFJaW1jaUhuNTN4dkREai9DY2l5dDFJTGJNa1VuaDJoTk5wM09R?=
 =?utf-8?B?eWFCaVI5R3czYkx5aDlQTmJRcmVzaElpeHdPSzJ4Z0tzN1VNa0txNjdURkIw?=
 =?utf-8?B?UmhmakFwdDlNRVl0M2ExNFRncVpreDljVmhHeTc5TW4rTFVuVi8yT0IvQUV6?=
 =?utf-8?B?SUxhZXBmOEZaUTBpQzNXaDhyUnM5QitSQkhYMEh1M1FSQmpxTjlHbW5DNkhC?=
 =?utf-8?B?alZPc3FwM2NpYmNhUHNtTmRmY0ZCRmMrYTZhNzVDZWFWSUwwbytDenJWWU1I?=
 =?utf-8?B?TXlNWFI4MWNwZGt0SGxOQ1Zuem9xekhjUGlGWWVEUzlrZjUySTJKYjBicTVK?=
 =?utf-8?Q?Rvj3yHHV6HA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUJRUEhhaUdjUEdtSElHR3FXV0hjSjkzT1N5RFhVcXlDNnFsYjBRZEVCQzdR?=
 =?utf-8?B?WXRYMUhtdUhxdWt2TDFFSm9kSktDN0Y3OGdDaS92cTFpanVRZk1mNkRwVUJa?=
 =?utf-8?B?VGsyem5ualpVY1MxV3JhQmNyM1B0STZxeFZ3bzdRM01MV2p4REYyRkp1QXlm?=
 =?utf-8?B?UlJ3bDNEdG5GM1ViMUR6dHNuWmVmOVFMZVB5YkdIU21tWllyU0tvTUhnMkNK?=
 =?utf-8?B?YVhsa1ZWRW1Tdm5HeE5UQnljTDRjMW02Wi9nOGVoRHJTUC93ZFhzMGxsdnZv?=
 =?utf-8?B?NGh0dnJiZ2hkSzNpKy85QUFVeStnYlVDNkY2bjArcWVMQUxHaEt1SnFObkNQ?=
 =?utf-8?B?ZHM1dVNleDY4NjNhQ0RZdEZoVzJLbVE0OGFWaHAxZzJWM3Y1YVJwc0U1OTNX?=
 =?utf-8?B?SnIwOWVTT2MvMWhzaVg5cFp1bUt4dVdlN0dWakI0V05tMVZsdU1MTmpFWEdn?=
 =?utf-8?B?eGd0RjEyNWxyMzN6MnB1M2FzaFh2VGJKVldMWTVkSTRydUpOTkR3bFVDVThP?=
 =?utf-8?B?d1JsekRKMzJsb3NibkgrRVp0ZmhCTWlOZ1BldzZYaU1wR2hHb25lNWhEaHdT?=
 =?utf-8?B?N1BkazB0RkxvMEZveG5BWU5ud0Rzd3VJVmJ2dGNlMnVwNit4M3pnRkh1YnNH?=
 =?utf-8?B?d1BvdzUrVUlrZFRFWUt5bUlKWGJyZll4eE9YOUpnNFJuWjUzTDB0aW5RQm96?=
 =?utf-8?B?NWNtRTMvOUNObHVWbjYxUmpIMm1qSWg5SjdhV2Jmc2JQTGtVVkxwRU40aVVx?=
 =?utf-8?B?ZVIzdFZLNVBmOE1wdlVEdlhJWE83bzAybE96S0FXQ1REY296MGxrN2RLbDM0?=
 =?utf-8?B?dExhd0hwbVp3OG5TOGc0WWlVb05UMXQwdlhZM2IzcXpwMjlEWFF1UUY2L3Fw?=
 =?utf-8?B?STJET3hJWWZodk1hditQZUxqVlZOdFNuanVmdlhnSXk4c2tWY2c4UndLRDN5?=
 =?utf-8?B?OEpnSHphUXdSQ1JBcG5SUVJvOTBuQkZNdkJraWk1RE9YL05FdmQ4S1ZLUmM5?=
 =?utf-8?B?bFNnRnlmVWthclk2bGpKZVV2c3pTSGVhN1lKQ1RSNVZsekc2UXNYdkM5dVpD?=
 =?utf-8?B?ZmxmMFNpWG1JSTIrdHRQbHdnZzJJcHVIeWZjTGVpZWtwMnI2RFV3WWwrdk1l?=
 =?utf-8?B?elM5RDljZm5NdlRoaFo2VkpkWE1Cd3A5NTVkUlk3WVdzWnRzMWxsbUVPUmQ5?=
 =?utf-8?B?SVVNYW5aeVdaTHVoTlovUkZzTDVIemh3UEx4RmJhQjlBM1NGK0tjNDRSK3pU?=
 =?utf-8?B?dktKRUlXVEJLdS9Ma283eTNtMFBWdkExa1BlK2NiYjhhdUZOOGRaZXU0bG9K?=
 =?utf-8?B?ekJQNlFQaDZody9KaGJJTzhzS2dtYzl4bzREVE1XTVc0TXFKU1VRKzRLOFJJ?=
 =?utf-8?B?b1AvUTZZRTBlQjVmdVhHODRTbGlNTk1hOWVVc1ZNZzFxMnFBd2U0cXNzTjVv?=
 =?utf-8?B?ZzhWZWlFUGlYWUJQWWZIbGVIRjI1NUROYkRrdDU4N0EwUmY2eWx1NUZCZmxn?=
 =?utf-8?B?NE0xdXJMcDVrTGJORW9QbC9SUlVnZVJwcEFSR1ZSTStFZXNRNGVsS0U1YkJj?=
 =?utf-8?B?am5hSS9aK2gyTzdDMDZ3ck5WOWFIdXZ2MXp1ajVYTlI1azBpMjdweVZ4Szkr?=
 =?utf-8?B?eHkvM0dBZG51WUhONmM3dkU1UmxxMTA1eWdqM2R3RUdMTEp5ekZ0KzFkSGRr?=
 =?utf-8?B?dUY0bGI4RkFiS25wK013YUZwZlBKQlBOVDV0VEF4SlZiRTZBMVErcHBuVTR4?=
 =?utf-8?B?Ti9DeEQ5VXBmVENpSm5kVzhaMUFRZUhGUGlqTks4VXZSQy9mT0VLWkdlMGxT?=
 =?utf-8?B?bVRxbDNoWGRqcFZvTkNXdzVyL012ckFPUWFxemRWUWM0dE5xWmNXZkNYNEZo?=
 =?utf-8?B?c3lJd1BCd2lWOGhzejN2K0FmcjZYbUNvMm1FMXBEYWVFNHR5V0dyWWV0cnNu?=
 =?utf-8?B?ODhIdm1ZdnBSYVQrSnFqcWJmYnFlS0QycGtnb0FCeTdpbTR3bnkvbUl6K2oy?=
 =?utf-8?B?WTlIWHc4bTA2a3JWQ3RqbEtQQTE4UnJMSWE0cUVEYTNHS3lsWUg0NU1uRjVX?=
 =?utf-8?B?NHR3RmhBYThFRzM0eVd0c0RlcGhFbEFTSGZlWEdkcG92ZlhPSTVNb25JNjdy?=
 =?utf-8?Q?ctN06hUwnWRvqnU09zMQxSpNJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72f83b2-5220-41a5-8618-08dd9cfbf732
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:53:36.7415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JS4NbeEZv9GxQAOOU5C7Q0BAlLXr4ZXBT9xzuvmKJhnex4OJWQ2gLmAyoKi593tlzgmJuuyEWhuIoM7GAXQoeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956

On 26-May-25 2:16 PM, Huang, Ying wrote:
> Hi, Bharata,
> 
> Bharata B Rao <bharata@amd.com> writes:
> 
>> Hi,
>>
>> This is an attempt to convert the NUMA balancing to do batched
>> migration instead of migrating one folio at a time. The basic
>> idea is to collect (from hint fault handler) the folios to be
>> migrated in a list and batch-migrate them from task_work context.
>> More details about the specifics are present in patch 2/2.
>>
>> During LSFMM[1] and subsequent discussions in MM alignment calls[2],
>> it was suggested that separate migration threads to handle migration
>> or promotion request may be desirable. Existing NUMA balancing, hot
>> page promotion and other future promotion techniques could off-load
>> migration part to these threads.
> 
> What is the expected benefit of the change?

Initially it is about cleanliness and separation of migration into its 
own thread/sub-system.

> 
> For code reuse, we can use migrate_misplaced_folio() or
> migrate_misplaced_folio_batch() in various promotion path.

That's what I have done in this patchset at least. We thought we could 
go full length and off-load migration to its own thread.

> 
> For workload latency influence, per my understanding, PTE scanning is
> much more serious than migration.  Why not start from that?

Raghu's PTE A bit scanning is one effort towards that (Removing PTE 
scanning from task context.

Regards,
Bharata.
