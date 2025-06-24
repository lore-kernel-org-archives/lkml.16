Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FC325A62D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 21:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750802379; cv=fail; b=UrL6aB1m8FmjiTylLTSwQdJhTmWBEl86lRqRpqBSpoIEJQDyzm/nrJ1AjVYolUC8wSp0gqhZyC/K/ZQoiplm85+42XnEpvFy7cW8JgsNsekbGQwZ6vEM0+DNyw7zXt7phPDFgat5IGz8WhEJin1ADDoKig9OqCXbA9XfS9DgrNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750802379; c=relaxed/simple;
	bh=wQFWOSLAhLXtLp0V0isoqFHrxX+vLqlCTGgw+Nv3Mco=;
	h=Message-ID:Date:From:Subject:To:Content-Type:MIME-Version; b=YGXiwWVq5cFLZxzgxSh0evoK13FRfTDxuswXv/bmIlLU1dspEukW4LIyLvmrKJEqYWQMrjGDE41aTix4Dzobl52InVGqcflDks54HHdrUitKjMfZHBt6x1V5N+/MjZl2dcG29ZEscXbvB55MzyMXETfA3whyF3uNPpjQRrz19R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=LXo2dCwr; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="LXo2dCwr"
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OLRExt005531;
	Tue, 24 Jun 2025 14:59:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2021-q4; bh=jVuDgjN2iZJGlS3iXR
	7vS2Oa2oi6Ye5S9BlIa4T5fYc=; b=LXo2dCwrHTX96lcgpUb7kOzR0BBkKG3aWQ
	GevEJ1UCgEmj6+ae7cgxKgkYdr6TK4UmYHBSa4ukQS/uchMkdplqJ7DHP+EeMUvG
	bBtdbflahJ65Lpn0InMpUAoVgXC7rK+2mLT8wPlhBPOWyzBatHa2znlGZEwcyrVA
	Lhw9Zu9Hk9cnrtc/U/rHFV9trG5CnIouTQPYpNhXRQQtEo4Oyh91S+gWK/fnbKBD
	sum2CbzvpPCnRsDIQ22MP/v3xSnj4n1cmQTZmAXiMZf3xgl7KEQywXUMqM81tV3T
	Z/M5Iw14k9bOE/f72o6nAyhISp2pyK8b99oSydR1ksGSa5N0MpJA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47g02628cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 14:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UM/ADco8dGKMWZsifzCJrMVnt2jg2KBzK9hg19LTNkFy3bDRTpiWu1rnYu3LNLZ6sVWNCJVYxh6pK4/YWXgP7y/UyPW7YwUC8AlLJQ4wj+HmA5WEExM0pUpW36XqRaXkYU49wzu4sP5qC1/tkuow5lj8GzJfIZVIwXVu76AkJeeKFTvWrK4DVKBBxVzlqCDN0EDaCgegKGbcbX8mcVN4MhoO7aejwv9mY4Uqn2kTDQgtifAY6YzJoNvCqBlbZtKiAEVDYDCzNKqIua0lKeo/lTacEgAPTMk4sBw/eEuw7U4/lPvXZsXbrDvcMicOuo/xngVM2qUG88a09QTd87A8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVuDgjN2iZJGlS3iXR7vS2Oa2oi6Ye5S9BlIa4T5fYc=;
 b=rxwTfylDPVSyKfxQmBcEYMqK6iDFfBc8LgJ5tT/RoAqz/WkW7lfO7YjMHE4rfk6gHkpWS80iKc/pRouWOmBmjKGi7eiQUU5BJ4wkh0DvWxilp2/WO82TLxiTtt+brT8WBGDRbe7DUQGfoJjRS20835H8V+crRMbdxS+PaHHlFIpuqCTahcBIDAeoXi0y5UCTS2gvoSaWkhsVLnKVD7fiha4ZOgTHrCMc+Uvs87WLF5aL9GYnTEfWj/Qfir9Wrbz3yr+SjVNvhdH2+XZGYZhYkwTkbLMtEXlc+jC3GZApHt7BMW/xSVsSr8RqnIybv2aCwiZ2B4egCWyMEQF9ggWpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by DS0PR15MB5998.namprd15.prod.outlook.com (2603:10b6:8:168::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 21:59:30 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::dc6a:e429:9c9f:6e12]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::dc6a:e429:9c9f:6e12%7]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 21:59:30 +0000
Message-ID: <37ed5ccf-7419-4311-ab53-b47fc93febae@meta.com>
Date: Tue, 24 Jun 2025 17:59:21 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Chris Mason <clm@meta.com>
Subject: [ANNOUNCE] rsched -- process scheduler statistics
To: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:208:52f::12) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|DS0PR15MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: a0614421-adf0-470a-6782-08ddb36a6556
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0NiZXNiUFlSazlZbE5odWNpT3ExRHdYMGNNZ1pnazdZdjREaHByUFJac1Bq?=
 =?utf-8?B?bUNUZTlpTUNGVEgrUTFuN3k0SW5tMzdPY1RYQVpmTUhDVEJFS05tRFA3cm43?=
 =?utf-8?B?UWc3OERHK3BWbjJQM0ZHcmZvaUh2Y3ZKQkFRWW5iSTA0dVhNOFREcXpkQ3Rr?=
 =?utf-8?B?LzgxTlZmbFhMOG9QOTBNZ09IdmRDMGxGQWl3T0xtNzIzRi9XR0ZaendSRmx6?=
 =?utf-8?B?VDZBaVVJeUF3VE91c1A5Z3RTRlhPZng2cW1oNVkwa3F6dkpoZHpCSlpUV2Qx?=
 =?utf-8?B?MFpQQytKWTVaUnlXaHJyMElzOVYvZ0diZityS3lyb1ZrcjRXZGEyTXkrNkxl?=
 =?utf-8?B?ZGt5UFFnQnJZcTVTUkk0eVlva1FERG1ldmJCSERpeHNYZDJHVDBkRndIYjFX?=
 =?utf-8?B?YUZMZ2ZDTTFjWjZ5QTRnV2tURkRyaytXSWZEUVQ5SlA0L1VQWHNHa2NkSkw1?=
 =?utf-8?B?UnVMN0E2eFFJWXlINXEzdUpJUTRwd2dManVvWmIwZXVCTzE2Qm5NQzBpNkV4?=
 =?utf-8?B?SS9ib2toaE9qQlFtSHM0ZmhvWnNVTWZrSGhMbjFPblhwQVo1bTc1WUl2ajBX?=
 =?utf-8?B?QWh4SEgrSW9OUXdYZHhGYnd5YWQ3MVZmL0ltazdOY0NhVDFOREVLMGJjRUox?=
 =?utf-8?B?WnY2QkdzOW41c3ZzS3g2UnBudGhGM3RMZ0F2ckozWVZVZ1lDaGZCd3NOS1hq?=
 =?utf-8?B?SWJSYkJnR2dmeXRSQ2Rqdk44cmVsRUErRHZLTEhDNmNVb0pvR2FYMVJuZnpk?=
 =?utf-8?B?Rzd4eFo5dThvSHJtZFh0eTM3bzdxS1FmUHFYazEvYnpvUnlseVMwV250blhp?=
 =?utf-8?B?eHcydW5PVzBRcURhRVg5ZU52cTlxM1piRkZwOHF2NEgzWUE2WHQ2ajRmTWRD?=
 =?utf-8?B?S0RnUWQySW44NlB2ZGx5czFTZGRScStHQThvdkFTcWVlN3lESG9JQmJ4cVdL?=
 =?utf-8?B?RmFtQUxzc0lPZHYxVVpxL3pYRExaRm9Id0tjOXNrb0xyV0tYL1BNTnI5Njdu?=
 =?utf-8?B?NWJpaHFlREozY2lSc0ZtVkh5WnpvSkg0TDc1L3MwUkxwZzB2Qmt5anlyRmFj?=
 =?utf-8?B?djVFWExQT2dyK3dIZVFrNmdyUWNBZklJSHhENzRxcnc3aWVLbm9YTEZIMmV6?=
 =?utf-8?B?OWJadHBEM0ZHT1ZIblVrVTUrRGVqaEtVb1BHNjN1RVJRWDZqUGpHd1RXaTFE?=
 =?utf-8?B?dlJKQ2VUK0hodFBQQWZTem5WRkN5bUF3NERwZk5oN2pHc1orV0VJVnV3OUd4?=
 =?utf-8?B?S0hia09YaEZVSmZUNVNOZzdkaXBYSHBmZVQ1STVXTlRxa0JObmM5WHl2R3Bq?=
 =?utf-8?B?UU1lbU5RVENQTVpQdEF3aU5GWVNGeVpCeUQyeE05QnFrbkdxb1hHT0xjclI3?=
 =?utf-8?B?endYM2xHbWhjL1hyc2VVWXJqaWhJUHZGV051Q0piMWlWRmFuWEs1cXZXd3Qv?=
 =?utf-8?B?VEdkUXFOUyt0d1NVcXpXRVNWeUZlZ3g3SEhiRzZvZVZkNmxKTXVnZ0QyZlJV?=
 =?utf-8?B?VGZBcS9NcjRNUkgyOGhyZEU2TXhtRlFqMUZnMDZkd2FVY2JkVEpMeCtqZTJF?=
 =?utf-8?B?SFNOTnc0eTg3bDRoQjJvdjA3ZzBIa09KeHJwWi9KQ1YvTk1mTDBIVmJTL1Iv?=
 =?utf-8?B?UXlSUW41WloxY3R1dkZGd0FoV3VlOCsxT0R0WndUTTRUcmJuUmp5SnFURnJL?=
 =?utf-8?B?bGhNN05rU1pVUFVMY3FMMkhuSnZ2YXpVcTloQ09nSUhMSW1vaEV1L0lsQzJ4?=
 =?utf-8?B?UWdVWG9EZkxQL0dSd1NoRGFueUxjdmx6SGtwM1kwM0pJVUhsMUkxYm1wckxD?=
 =?utf-8?B?c1k4WHVOOUNBdmcyOVY0ZXJtd2xrTW50TTRrcmYzdHFBdm9tL0RzekpWZnUy?=
 =?utf-8?B?cTdhZDJXc1VVNUMvMUhPU1lxUm5PSHZMa1JadFFwY0FYUjd3eEhIN1YvOU1o?=
 =?utf-8?Q?HgG/BT33c34=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1psa3hIUGx6YzhKdXBLUEpWcTdBVnBKbFVyckZRQ2tmbHhieFRFMDN0c0lY?=
 =?utf-8?B?eWozb2dvVHFrQW9ZL2p4cGJDNm4rS1hwR1pRekJnZ3kxdkNkU0FGbzFrcElP?=
 =?utf-8?B?clYwZ3UyU01NTjBjNUtBbTVIdkZ6Wlhod1pFekNuZkkwdmtTTDQwUVJIVGRY?=
 =?utf-8?B?MnZzUWMySHJMTmlVdyt2bVJ0YlpZVWVaY0Y2VjU1WmhZNGV6QlpJaXp6eFNu?=
 =?utf-8?B?VjV0N3QwYnNLTm4zYWsvWnVsUXErMC9EM01VWUZLQnBZcUNuUGxUOW1RRnBF?=
 =?utf-8?B?bm5lS0dqM0xMT1Z2NGl4WW5QWlpRUDVhcGRIREhLSUF3RTVHb1lKTjZuSlp5?=
 =?utf-8?B?bSs4WWduNWNzMFdJY2Z0V0V6MW5hSEJOWi80UUZFZm16ODgyeDFYNWZTSGlK?=
 =?utf-8?B?OVdNbWh3dGcxNTFmM0E4S2pNeFRlTEpaaUZGNVNRUERYMGVaeXF4SzZVanFV?=
 =?utf-8?B?ZkxNQmk0U0RmN0s0M0tYVkpmd1JTeXFiWm13cXNkS3FpK1NEb0c4dXhVVmNr?=
 =?utf-8?B?amRNdnd0SUdYVFkvdTgzdDVsN2lvRkFyNHVxRk4yay9rdkFaa1MrOHA3cWhu?=
 =?utf-8?B?VTFxNEJuZVR2aHU2Y3hRTkplTzNCWHN6c3dvTFIwaUlzMzRIUnhDa21KN0dN?=
 =?utf-8?B?SXpRc09FdTQrcHNBQkptZFpPWmVEQXFSb28rUlZIbHAxVWsvd01yTTAwRDd2?=
 =?utf-8?B?RkYrVGV1UDVsMmgzdmVvalBGeEJrZ21lUVhVNmIvZmxzMEhreVVETmZKUDlO?=
 =?utf-8?B?SnlicFFTK0hCSEk3ZWZKRUhkWERaZFJIMDFTK2ZIaDdUekYrUmhPSDc4WG9o?=
 =?utf-8?B?QzJtTTJEM3JJdlVuYW1xQTQ3c2UwWGhpKzdxSDd0MGNuWjZvdFhGU1QweSth?=
 =?utf-8?B?MTRWdU5ib1B4aHN0alpjZ3NJTEE2ZVhIbWVGNEZlSks0Rlg3UDYrZmQ4c0Zy?=
 =?utf-8?B?UHp6eVlHK0YyQ1pKejRoMXJTaGRvSU5kcW5mSzQ4Nzl5MEV4b1N5bDNGMXNN?=
 =?utf-8?B?RTVaWS9VeEdsaTlidmE2LzVLd1BFNjJFVm9TQ2VFcjNFNmhqaDVpb2tKWFdl?=
 =?utf-8?B?RUtsR3NxdmFjV09iSFM2bDV1N2M0Z2R6NzZqYmVLN2l1aHNmdGUzbWlvRytt?=
 =?utf-8?B?Zmxyd1RFSjZzUjBlYmRoTmFJTlBXM3UxZ082dHRDZk1lQys5bytoSi9xUmZQ?=
 =?utf-8?B?Y3h6UDc1QkFSblgrRVgwRlRYczBHNERtREh3Wk8rT1JtNHpVMXczS0xKTFFw?=
 =?utf-8?B?Mk0yU2gxVTNSdzVVZ2YrYVMyeTZWYXFtbEpzeXdkdEdLQ0Jnam9EbEdhMDkr?=
 =?utf-8?B?bEJvZGJLTmZPd0xzSnlxWkdWSFdUb1hmaitTUXJSYVozRkIwSU9DejFWbWU3?=
 =?utf-8?B?ZGpBaGNGK213WFFOYlMwZXNPUkhNWG41SGRZNzR5RjUwcEIvc0pOU0RTbDBv?=
 =?utf-8?B?d280ZFVTdWVieWRiOFF6U00zMWpvZjVaemtWc1RRR0poMHUzYTRkZzUrNXll?=
 =?utf-8?B?TWd4aSsreXEzQzZVK0MxMXhuU2tTYVg4S1hJd1JENG5rS1IrZzhlUUppMGtz?=
 =?utf-8?B?MnRZb2RTMER6OGdoc2c1WVZLSkpudVR2bWVMdVpta2pxUHVla21lVXViS0tz?=
 =?utf-8?B?QzRqdGRrWnp2OTVFbUgxUHJWQ1hDdzNvY1FCYjl3dStMTnNzVDRNUDJaU05M?=
 =?utf-8?B?UXdRWFZJYTFjZVVWVEFQZUhBRFFEV3ppUE5oN2hTN3NaYzVBTEFQMUNlTHEy?=
 =?utf-8?B?R2xTM0ladnZMYjFhRGZHL0JmRkxESlBJWW9PaUg3M294WlA4RHR0YitOaDlr?=
 =?utf-8?B?RWQ2cEVIWlNYQk12RndYWHB6bTVpSXZweGZ0dlVWOVlyT25RUGdYK2doeU92?=
 =?utf-8?B?TDB0SDhEeGZYR3lQQ2Y4SURDUkpPRTJXaXg0T25RZUdBR2JnenI4ZlBLOElI?=
 =?utf-8?B?Y0NrdFB4cS9iNVVLNEliWHpvUllFS1hiS25IRWVaanFkWGlzT2hFYnlPdEJt?=
 =?utf-8?B?cHVqRjFhb2tnOGV0eDlsdTE0ZGJtMmlpdXJ6VE9uRHVIYTltUmQ1THFiNHNR?=
 =?utf-8?B?amIvNXJSdVl5dGFhOWFEc2R5aHVkaC9WQmgraE5RcEExSG1IVFUxZ0gxeW5o?=
 =?utf-8?Q?7T/M=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0614421-adf0-470a-6782-08ddb36a6556
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:59:30.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnNxBHphgDh3Rgx7L/loQEo4XEKTjOeXiDCtj4hSNlrw8ChyhmISN83wBD/WpyUm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR15MB5998
X-Proofpoint-ORIG-GUID: kaSFWQQUsO5XBVLlR3qwPRhqXB_9Wz_s
X-Authority-Analysis: v=2.4 cv=dqrbC0g4 c=1 sm=1 tr=0 ts=685b1fc4 cx=c_pps a=ERaBaXEorJduIVC9VRC5mA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=JvXNIU38G32i5fW7O6IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: kaSFWQQUsO5XBVLlR3qwPRhqXB_9Wz_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE3NSBTYWx0ZWRfX2EUG4OQLpJvA G9QTmlasQgfedgdOrmnHFK1fq+07ES+TXOME9MO+IgTrNLDiBmsDhEPpQRfi76Vt7mhcKPXXhYU MyN8MNIe9Ld9ZC6D4PLMdjqc763qH/ZzzjP6+D3h+V9zSUhO39hfOWZKvNpamRLiGj7Hrav26HE
 IQ/ngndqP9d8BchGmuA2SXpjMfFkDRXN+oxXoJjzk2JjMPn7EwQmHeFi41RQQDVH7737V8HMM2c YVGp+6gJw7+b/0lJ6C+EA5KvvEraj090m0tlnJe9jd6ZW+TYot8UXR7uL8+L8bP0uAEPCQc8zFO w5VdU8TvECnnzdvcIfnJm3VSlgSKg3hUBSE8fI5oEf3JKAT4ji3+CXdnddd33Bru8Eznr0Bks1m
 KX31v+r04dtTV5rTeIZ/G89n7a7N4T+cNg3ehpZEVBLHuXTPQdFyQ6m0ViARuO1+5fdX+5Cb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01

Hi everyone,

I've been wanting to write up a tool to give a broad overview of process
scheduler metrics, and I used our recent regression hunt as an excuse
to work something up.

https://github.com/masoncl/rsched

rsched is meant to sit next to the running workload, kind of like vmstat or
top.  The goal is just being able to quickly decide if I should blame the
scheduler, and maybe give some ideas about which part to blame.  It doesn't
provide the full details like systing or wprof, both of which are much better
for in-depth analysis.

rsched is written in rust and uses BPF to watch a few scheduler tracepoints,
as well as some performance counters.  I'm obviously still learning rust, so
don't be shy with the pull requests if you see chances to improve the code.

Any suggestions on how to make the output more correct, compact and/or usable
are always welcome.  To give you an idea of the details, I'll give the
full output from a fast and slow schbench run.  The README.md in github has
command line options etc.

Command line:

rsched -m -i 10 --schedstat -c schbench -C

This filters for just schbench procs, and turns on the CPU perf counters

v6.15-rc2 (the slow run)

Starting rsched - Runqueue scheduling delay tracker
Options active:
  - Command pattern: schbench
  - Not collapsing by command name
  - Runtime limit: 12 seconds
Press Ctrl-C to stop...

Sched_waking tracepoints disabled for better performance
CPU performance counters enabled
=== Per-Process Scheduling Delays (microseconds) ===

Very Low (<10μs) (1028 entries):
  PID      COMMAND         p50        p90        p99        COUNT       
  35886    schbench-worker 5          9          9          35133       
  35372    schbench-worker 5          9          9          35816       
  35183    schbench-worker 5          9          9          35491       
  35835    schbench-worker 5          9          9          35486       
  35943    schbench-worker 5          9          9          41423       
  35784    schbench-worker 5          9          9          36232       
  35572    schbench-worker 5          9          9          35537       
  35552    schbench-worker 5          9          9          41604       
  35308    schbench-worker 5          9          9          36427       
  35401    schbench-worker 5          9          9          32346       
  ... and 1018 more

Low (10-100μs) (1 entries):
  PID      COMMAND      p50        p90        p99        COUNT       
  35025    schbench-msg 9          47         110        171         


=== Per-Process Time Slice Statistics (microseconds) ===

Time slice statistics grouped by preemption rate:

  PID      COMMAND         INVOL_COUNT  VOLUNTARY(p50/p90)   PREEMPTED(p50/p90)   PREEMPT%    
  35027    schbench-msg    101          -                    95889/123483         100.0       %
  35028    schbench-msg    100          -                    96579/124173         100.0       %
  35026    schbench-msg    99           -                    96579/124173         100.0       %
  35025    schbench-msg    170          -                    50365/112503         100.0       %
  35942    schbench-worker 4            5/9                  15/17                0.0         %
  35937    schbench-worker 3            5/9                  10/15                0.0         %
  35661    schbench-worker 3            5/9                  13/16                0.0         %
  35251    schbench-worker 3            5/9                  10/20                0.0         %
  35345    schbench-worker 3            5/9                  13/16                0.0         %
  35656    schbench-worker 3            5/9                  13/16                0.0         %
  ... and 1019 more


=== Per-Process Sleep Duration Statistics (microseconds) ===
(Time spent sleeping between sched_switch and sched_wakeup)

Medium (100μs-1ms) (1024 entries):
  PID      COMMAND         p50        p90        p99        COUNT       
  35173    schbench-worker 599        939        1015       26744       
  35910    schbench-worker 566        932        1014       29204       
  35148    schbench-worker 562        931        1014       28601       
  35782    schbench-worker 556        930        1014       29246       
  35985    schbench-worker 549        929        1014       28182       
  35877    schbench-worker 553        929        1014       29455       
  35524    schbench-worker 548        928        1014       29650       
  36010    schbench-worker 523        923        1013       30265       
  35343    schbench-worker 508        920        1013       31055       
  35118    schbench-worker 509        920        1013       30997       
  ... and 1014 more

Very High (>10ms) (1 entries):
  PID      COMMAND  p50        p90        p99        COUNT       
  35024    schbench 757304     990321     990321     9           


=== Per-Process Runqueue Depth Statistics (nr_running at wakeup) ===

Processes by runqueue depth at wakeup:

  PID      COMMAND         p50        p90        p99        COUNT       
  35886    schbench-worker 1          1          1          70704       
  35372    schbench-worker 1          1          1          72022       
  35183    schbench-worker 1          1          1          71410       
  35835    schbench-worker 1          1          1          71392       
  35943    schbench-worker 1          1          1          83351       
  35784    schbench-worker 1          1          1          72810       
  35572    schbench-worker 1          1          1          71386       
  35552    schbench-worker 1          1          1          83733       
  35308    schbench-worker 1          1          1          73241       
  35401    schbench-worker 1          1          1          65033       
  ... and 1019 more


=== System-wide Schedstat Metrics (deltas) ===
alb_count                              0 | lb_hot_gained_idle                     0 | lb_nobusyg_idle                   636568 
alb_failed                             0 | lb_hot_gained_newly_idle               0 | lb_nobusyg_newly_idle            3922226 
alb_pushed                             0 | lb_hot_gained_not_idle                 0 | lb_nobusyg_not_idle                  650 
lb_balance_idle                   676344 | lb_imbalance_load_idle                 0 | lb_nobusyq_idle                      171 
lb_balance_newly_idle            3944496 | lb_imbalance_load_newly_idle           0 | lb_nobusyq_newly_idle              14806 
lb_balance_not_idle                  698 | lb_imbalance_load_not_idle             0 | lb_nobusyq_not_idle                    0 
lb_count_idle                     678855 | lb_imbalance_misfit_idle               0 | sbe_balanced                           0 
lb_count_newly_idle              4845653 | lb_imbalance_misfit_newly_idle         0 | sbe_cnt                                0 
lb_count_not_idle                    698 | lb_imbalance_misfit_not_idle           0 | sbe_pushed                             0 
lb_failed_idle                      2399 | lb_imbalance_task_idle              2890 | sbf_balanced                           0 
lb_failed_newly_idle              896235 | lb_imbalance_task_newly_idle     2113470 | sbf_cnt                                0 
lb_failed_not_idle                     0 | lb_imbalance_task_not_idle             0 | sbf_pushed                             0 
lb_gained_idle                       112 | lb_imbalance_util_idle                 0 | ttwu_move_affine                   10159 
lb_gained_newly_idle                4926 | lb_imbalance_util_newly_idle           0 | ttwu_move_balance                      0 
lb_gained_not_idle                     0 | lb_imbalance_util_not_idle             0 | ttwu_wake_remote                37738806 

=== CPU Field Totals (deltas) ===
yld_count                 5685 | sched_count                  0 | sched_goidle          75529957 
ttwu_count            37721164 | ttwu_local            37785024 | rq_cpu_time              46219 
rq_run_delay usec          287 | rq_pcount            673321838 | 


=== Per-CPU Scheduling Delays (microseconds) ===

Very Low (<10μs): CPUs 1-251
  Aggregate: p50=5      p90=9      p99=9      count=37575995

Low (10-100μs): CPUs 0
  Aggregate: p50=6      p90=30     p99=95     count=350


=== Per-CPU Idle Duration (microseconds) ===

Very Short (<100μs): CPUs 4-15,130-141
  Aggregate: p50=16     p90=50     p99=102    count=9636083

Short (100μs-1ms): CPUs 16-129,142-251
  Aggregate: p50=50     p90=175    p99=396    count=28157410


=== CPU Performance Metrics ===
Global: User 5301.3M cycles/sec (IPC: 0.23), Kernel 23514.0M cycles/sec (IPC: 1.20)

CPU Performance by Usage Group (cycles are per timeslice):

Medium (100M-1G cycles p99) (4 entries):
  PID      COMMAND      USER CYC(p50/p99)    KERN CYC(p50/p99)    U-IPC    K-IPC   
  35026    schbench-msg 24.8M/33.4M          191.3M/266.9M        0.10     0.51    
  35027    schbench-msg 24.7M/33.4M          188.8M/265.3M        0.08     0.44    
  35028    schbench-msg 24.7M/33.4M          188.8M/265.3M        0.08     0.43    
  35025    schbench-msg 17.5M/33.2M          91.5M/263.2M         0.09     0.45    

Very Low (<10M cycles p99) (1025 entries):
  PID      COMMAND         USER CYC(p50/p99)    KERN CYC(p50/p99)    U-IPC    K-IPC   
  35563    schbench-worker 1.1K/2.0K            6.4K/82.5K           0.43     1.23    
  35024    schbench        49.2K/65.5K          12.3K/16.4K          2.21     3.85    
  36040    schbench-worker 965/2.0K             6.2K/76.5K           0.45     1.31    
  35069    schbench-worker 1.4K/3.2K            6.3K/65.5K           0.33     1.32    
  35515    schbench-worker 1.3K/2.8K            6.0K/62.3K           0.39     1.42    
  35783    schbench-worker 1.6K/4.0K            6.4K/60.2K           0.23     1.33    
  36035    schbench-worker 1.8K/4.0K            6.4K/60.0K           0.22     1.40    
  35483    schbench-worker 1.8K/4.0K            6.4K/59.9K           0.22     1.41    
  35435    schbench-worker 2.3K/4.1K            6.4K/59.7K           0.22     1.38    
  35353    schbench-worker 1.6K/3.4K            6.4K/60.3K           0.27     1.39    
  ... and 1015 more

-----------------------------------------------------------------------------------

v6.16-rc2 + a fix (the fast run)

The big change you can see here is the p99 of kernel cycles is
dramatically lower.  Also, the schedstats for new idle balance
are much lower.

Starting rsched - Runqueue scheduling delay tracker
Options active:
  - Command pattern: schbench
  - Not collapsing by command name
  - Runtime limit: 12 seconds
Press Ctrl-C to stop...

Sched_waking tracepoints disabled for better performance
CPU performance counters enabled
=== Per-Process Scheduling Delays (microseconds) ===

Very Low (<10μs) (1028 entries):
  PID      COMMAND         p50        p90        p99        COUNT       
  3968481  schbench-worker 5          9          9          45999       
  3968652  schbench-worker 5          9          9          45966       
  3969197  schbench-worker 5          9          9          43535       
  3968362  schbench-worker 5          9          9          39690       
  3968832  schbench-worker 5          9          9          47972       
  3968660  schbench-worker 5          9          9          48020       
  3968393  schbench-worker 5          9          9          48051       
  3968468  schbench-worker 5          9          9          48038       
  3968967  schbench-worker 5          9          9          40810       
  3968635  schbench-worker 5          9          9          45979       
  ... and 1018 more

Low (10-100μs) (1 entries):
  PID      COMMAND      p50        p90        p99        COUNT       
  3968289  schbench-msg 5          18         100        120         


=== Per-Process Time Slice Statistics (microseconds) ===

Time slice statistics grouped by preemption rate:

  PID      COMMAND         INVOL_COUNT  VOLUNTARY(p50/p90)   PREEMPTED(p50/p90)   PREEMPT%    
  3968292  schbench-msg    100          -                    96938/124245         100.0       %
  3968290  schbench-msg    100          -                    96212/124100         100.0       %
  3968291  schbench-msg    99           -                    96938/124245         100.0       %
  3968289  schbench-msg    119          -                    86388/122135         100.0       %
  3968426  schbench-worker 5            5/9                  4/8                  0.0         %
  3968902  schbench-worker 4            5/9                  6/10                 0.0         %
  3969157  schbench-worker 3            5/9                  20/25                0.0         %
  3969252  schbench-worker 3            5/9                  10/15                0.0         %
  3968776  schbench-worker 3            5/9                  10/15                0.0         %
  3968710  schbench-worker 3            5/9                  10/15                0.0         %
  ... and 1019 more


=== Per-Process Sleep Duration Statistics (microseconds) ===
(Time spent sleeping between sched_switch and sched_wakeup)

Medium (100μs-1ms) (1024 entries):
  PID      COMMAND         p50        p90        p99        COUNT       
  3968983  schbench-worker 438        487        714        31072       
  3968845  schbench-worker 421        486        708        32322       
  3968858  schbench-worker 421        482        633        34969       
  3969133  schbench-worker 414        480        600        36085       
  3968351  schbench-worker 314        479        577        36622       
  3968372  schbench-worker 414        475        511        37911       
  3968853  schbench-worker 398        475        511        38285       
  3968778  schbench-worker 329        471        510        39345       
  3969079  schbench-worker 313        470        507        38772       
  3969157  schbench-worker 387        469        508        39111       
  ... and 1014 more

Very High (>10ms) (1 entries):
  PID      COMMAND  p50        p90        p99        COUNT       
  3968288  schbench 757304     990321     990321     9           


=== Per-Process Runqueue Depth Statistics (nr_running at wakeup) ===

Processes by runqueue depth at wakeup:

  PID      COMMAND         p50        p90        p99        COUNT       
  3968288  schbench        1          2          3          20          
  3968481  schbench-worker 1          1          2          92460       
  3968652  schbench-worker 1          1          1          92512       
  3969197  schbench-worker 1          1          2          87580       
  3968362  schbench-worker 1          1          1          79681       
  3968832  schbench-worker 1          1          1          96353       
  3968660  schbench-worker 1          1          2          96443       
  3968393  schbench-worker 1          1          1          96642       
  3968468  schbench-worker 1          1          2          96595       
  3968967  schbench-worker 1          1          1          81998       
  ... and 1019 more


=== System-wide Schedstat Metrics (deltas) ===
alb_count                              2 | lb_hot_gained_idle                     3 | lb_nobusyg_idle                   594665 
alb_failed                             0 | lb_hot_gained_newly_idle               5 | lb_nobusyg_newly_idle              27247 
alb_pushed                             2 | lb_hot_gained_not_idle                 0 | lb_nobusyg_not_idle                  573 
lb_balance_idle                   618752 | lb_imbalance_load_idle                 0 | lb_nobusyq_idle                      338 
lb_balance_newly_idle              27389 | lb_imbalance_load_newly_idle           0 | lb_nobusyq_newly_idle                 62 
lb_balance_not_idle                  611 | lb_imbalance_load_not_idle             0 | lb_nobusyq_not_idle                    0 
lb_count_idle                     620785 | lb_imbalance_misfit_idle               0 | sbe_balanced                           0 
lb_count_newly_idle                41461 | lb_imbalance_misfit_newly_idle         0 | sbe_cnt                                0 
lb_count_not_idle                    611 | lb_imbalance_misfit_not_idle           0 | sbe_pushed                             0 
lb_failed_idle                      1611 | lb_imbalance_task_idle              2710 | sbf_balanced                           0 
lb_failed_newly_idle               12835 | lb_imbalance_task_newly_idle       79009 | sbf_cnt                                0 
lb_failed_not_idle                     0 | lb_imbalance_task_not_idle             0 | sbf_pushed                             0 
lb_gained_idle                       429 | lb_imbalance_util_idle                 0 | ttwu_move_affine                   19124 
lb_gained_newly_idle                1270 | lb_imbalance_util_newly_idle           0 | ttwu_move_balance                      0 
lb_gained_not_idle                     0 | lb_imbalance_util_not_idle             0 | ttwu_wake_remote                46817555 

=== CPU Field Totals (deltas) ===
yld_count                 3565 | sched_count                  0 | sched_goidle          93280935 
ttwu_count            46387216 | ttwu_local            46865150 | rq_cpu_time              47597 
rq_run_delay usec           80 | rq_pcount           2681345616 | 


=== Per-CPU Scheduling Delays (microseconds) ===

Very Low (<10μs): CPUs 0-251
  Aggregate: p50=5      p90=9      p99=9      count=46639878


=== Per-CPU Idle Duration (microseconds) ===

Very Short (<100μs): CPUs 4-15,126-141
  Aggregate: p50=6      p90=16     p99=39     count=26621635

Short (100μs-1ms): CPUs 16-125,142-251
  Aggregate: p50=73     p90=263    p99=431    count=19862521


=== CPU Performance Metrics ===
Global: User 5636.6M cycles/sec (IPC: 0.27), Kernel 23515.6M cycles/sec (IPC: 1.40)

CPU Performance by Usage Group (cycles are per timeslice):

Medium (100M-1G cycles p99) (4 entries):
  PID      COMMAND      USER CYC(p50/p99)    KERN CYC(p50/p99)    U-IPC    K-IPC   
  3968291  schbench-msg 24.9M/33.4M          190.4M/266.9M        0.13     0.73    
  3968290  schbench-msg 24.8M/33.4M          189.5M/266.9M        0.12     0.70    
  3968292  schbench-msg 24.7M/33.2M          188.8M/265.3M        0.13     0.74    
  3968289  schbench-msg 22.7M/33.2M          161.1M/264.9M        0.12     0.66    

Very Low (<10M cycles p99) (1025 entries):
  PID      COMMAND         USER CYC(p50/p99)    KERN CYC(p50/p99)    U-IPC    K-IPC   
  3968288  schbench        39.3K/65.5K          13.7K/32.8K          4.13     4.15    
  3968914  schbench-worker 1.6K/3.9K            6.2K/14.9K           0.23     1.47    
  3968997  schbench-worker 1.7K/4.0K            6.2K/14.6K           0.22     1.45    
  3969198  schbench-worker 1.7K/4.0K            6.2K/14.6K           0.22     1.44    
  3968393  schbench-worker 2.0K/4.1K            6.2K/14.5K           0.24     1.49    
  3968372  schbench-worker 1.6K/3.4K            6.3K/15.2K           0.27     1.46    
  3968805  schbench-worker 1.5K/3.9K            6.2K/14.5K           0.25     1.50    
  3969261  schbench-worker 1.6K/4.0K            6.1K/14.3K           0.30     1.55    
  3968881  schbench-worker 1.8K/4.0K            6.2K/14.2K           0.26     1.51    
  3968511  schbench-worker 1.5K/4.0K            6.1K/14.1K           0.31     1.54    
  ... and 1015 more

