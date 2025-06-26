Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DAD2F2708
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949753; cv=fail; b=dhpnAEmr2A908e8qr/UjHar0m9dTK3qAtIf4t9PMbGCs4xtMWBZke4fBble5IeSSKc6Fr9nItTIYZcIyOfpdAPL/cw62BKmj6SPimTGUWZmbtzezDNboxlkwQiGA3JbE96tA41JaLiuT4/4FOatla7D1lQiLVvZCXTsD5O+iWj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949753; c=relaxed/simple;
	bh=FxSGf+IFlIWe3DLkwMeCrpftn2yF+PlQOb4VVW9jx3s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kNas2nPL8jzs4WQ6hR2UAeh+1ajXglFEex7B0ye09iOPLfLmlW4DHC7/zsgMFtwFB+nkUzurNkFb6HKCuO6jzqmq/PSAPVzAV5M9a1CBOZXQM/ykOUNkNn77rTLOn04ai7SoL4RxyEQIgJUoWBetLFekRQiYwmqWymerlmvXbvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=KXxatx8l; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="KXxatx8l"
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QEqNs1032643;
	Thu, 26 Jun 2025 07:55:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2025-q2;
	 bh=s+FncZwKnaUoi2GAPLG2sMqMF274QYlTszjSg35oVKk=; b=KXxatx8lkwBo
	9+udg1UiQ159mUVO8c4PkhM9zynH4ZgBi82zcf6hhBkH3U23yQI/g6c/I0S5UUuS
	4eF/BDvbizeuGtizeJBDQcmKiqtnSmQTDFgdKiirsQk3fLmH5QjOO846peebxqCK
	EK+vrQrcfoXLj1H7eqiCwbe2KkijhpMBFNsckvqdOQLO0hnKRjWyCy+D81LFyRjl
	RR6y8Cwl1XJWEpbN9mnxSnFqdModuq+DKSkbjBiBYwek7XYzeXA8teFeoIHxfM7m
	ztlpq7VrtBjeugTfs2Vf4dtlqQ80mM7HRb6RPtXucQ9N3/o4kL72sm7yTElWSAhe
	/HmtuWtuZA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47h17kaquv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 07:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/yFyM0r5DVcfBsJJnCo3rO9CjW8gcG7BxAEmgHf6BJn4YnfI4jrfA6uWprAxseUEIKuzNEG7UiGY1FfDr/vdPTEtO/gs/nlE4Hl5klM23FgTKcKxACa5Z2zihnPPBaoADKMY+2Jtp7gyhLdTgrwe5/adGt5qMwRxJAfRbstZp1Z4j35cbJ31cmwqwgYlq/mtN2ZlOnZth99zZx1qxHYNlFZD/UMSR1zlMgS947Dwe9Wvwk/h3O6XDm+wdXBkJln+xE5SoK/bKIMPnuR5M+yPFvlQgtUEdPw3EWIoUQynYvqNHbTIXW2zTmfuYGXVZOiNAhWxUVOZTgaJQb6xqKyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+FncZwKnaUoi2GAPLG2sMqMF274QYlTszjSg35oVKk=;
 b=TyyS8Yq6AtCAaUP3jWhAYKKFAakHKa1Q80UHSE7ey+T24bB4Hf/ba+ERBSAPMIhlQLUTgllpZGS2Da/Qv6Ny1GOsTx6gbnfOwLxCS0+ivyZQdoBU+KqIpmCQe6sZPlsO2uv+voems4m62ssHlMOU1e9k0Ds6hTmSflqTF/RsB6GXIoqimJAZ+UCWcKR+kI3KodGr+VyFvhNUODIQu1Ke26IlaHDrIDknMrS2CXP33rNrC5l/MazQE4wLwhLDkX9QFcrnH5NruHqumj7KRXeQfSsmG/wYnL6u4lck1iaKbd8U677dFwWoO9tLo1IdW3dJ9MWDUHYmaG05XpjQo1CgJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by CO6PR15MB4228.namprd15.prod.outlook.com (2603:10b6:5:349::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Thu, 26 Jun
 2025 14:55:30 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::2fde:34d6:643e:c01b]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::2fde:34d6:643e:c01b%5]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 14:55:29 +0000
Message-ID: <dbbff170-db0a-4955-a024-978bb8dc3016@meta.com>
Date: Thu, 26 Jun 2025 10:55:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when newidle
 balance fails
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Chris Mason <clm@fb.com>,
        linux-kernel@vger.kernel.org
References: <20250624204942.715206-1-clm@fb.com>
 <20250626070057.GE1613200@noisy.programming.kicks-ass.net>
 <872c057e-5e2f-4cbf-943a-072b6015fee9@meta.com>
 <CAKfTPtBE0_77+J-A7vWRKsHCCmuX1jWTbPYWGVPg1MYq_rv8Og@mail.gmail.com>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <CAKfTPtBE0_77+J-A7vWRKsHCCmuX1jWTbPYWGVPg1MYq_rv8Og@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: IA4P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::16) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|CO6PR15MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: c0536e45-4b30-4cf0-2c4f-08ddb4c17e55
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWE2YVErTFpEaDQ1VkZkRGpNaHVlVmJIVGJmRk9BcWdDMk8xQWo1b0dBOXB2?=
 =?utf-8?B?c3B1ZnFSaXYwdHplVHZ4NlBMSGZaZ3JHMDBTdzBnWmM0ak9XTkhWQlQ4YjRZ?=
 =?utf-8?B?Q0V6Y0JkR1BVZnRkWm1UVG1EZmdVZ0JpelZUWUs1MitrV05OQXFTajY4U003?=
 =?utf-8?B?ZkVRd3VMWXFXaFp3aCthdHRjWW9SZmMrS3JBY25CRUlxYnJMQ25TQjJDbzhK?=
 =?utf-8?B?T2FmZVVpblpCekdqVGJ1azF6RmFmVzhSUm9vZnE4S1VsaUxZYzVwdmRxZm9O?=
 =?utf-8?B?Mmp4S2dSVDRLOVRwMVp6bmR0dEg0emsvdUNvdnhoTExuNEUzZnhaTXFDMG1E?=
 =?utf-8?B?WjU0NFM5dW82SUpSTkNjbW85K2xrWDFoT0hzS2NlbllJOFltdkNuWlRRUlcv?=
 =?utf-8?B?cmNYK0lVR0ZPYWNyelhNVEZ3bm5JelhIb09CanYzalhJRmFZUnhvbWdrcUdE?=
 =?utf-8?B?MEZ0ODNrSzRLZmVkemRONWcrZEM5K2Nady9mSGNocmhIMUlleGpCUVZtQkNn?=
 =?utf-8?B?Q3hYWDN0RFJRd3B6cFZieTc3T0E1cFU4MVBScEJjaTkvdUFCM2ZFSnJGaE9W?=
 =?utf-8?B?Njc5OUdmNDQ5QVphcjBTaTB0VUNxemIwRHJrNU5sR1B6Tno4clFrNGtxbVBN?=
 =?utf-8?B?N3FUdVlSSkw5c1RhL2dmUlJjdC9KdUpzVmlvcnoxTVpaZmJCUzhJUjJuVTVV?=
 =?utf-8?B?aHNLV2hGcnA1QTNjNlVaSW9HdkdhVFhSV3FFa3E0ZUorRTdYSTFEY25lVjdz?=
 =?utf-8?B?enpVOUkwaUpGZVFWQXNSeU5ZZHhiRU1PdTNyZjJlZHo5QzBGNzBBb2E3NDdn?=
 =?utf-8?B?ZVgraHZmdDY4bmFwNEJPZTIrMktTZVFJMThjeUU4MnAvTUF5ZkJxWEZ5bkVH?=
 =?utf-8?B?ZmxBYkpoR3dwSjluQ0hDeWF0a0VuWmwwYjhzWm9HVkVydmVJN0pzMDl1a2dp?=
 =?utf-8?B?SThYQ1R1cFA3aGdMQTNpK3hkejFEbXJqNGY1Tm4xNUc1ZVNGMTZmOHhEbndD?=
 =?utf-8?B?d1VBK3Q0ZHExZUcvNThyZGZVbUM0Q2t4WEl5WGEyTENLWm5lL0RweVpDMDRH?=
 =?utf-8?B?eU1BRm9JUjFKZGhHcTlCRWNnZDhKQUF3aDlZUy93WkgvSTBPUGFqTEk1bU84?=
 =?utf-8?B?S3VtMGltMHpZYTVjNjIxWDBvdjBYRlUreW5EUXNVaStoVTdQVW1ibDNOM2VL?=
 =?utf-8?B?dHEvWUhWUzRuZzk3Zm9XcnZQeHpaZlQ4SUJJRlNtMG1JMC9Rc2Z0ci8zYVRV?=
 =?utf-8?B?Q1JpcnR5RGxkSGtIN1RYcTRlM2ZMcmhhUXRtbWtzWmNkeWlkMm9BMm1uZnRh?=
 =?utf-8?B?bzNOVmFiTEZlMFYxbU53Vko2UGh1eEZHUzlha2NKVjZSWG13UFoyaVczL09P?=
 =?utf-8?B?TDZEc3dBZ3lOMGlWcnlzSm0zQ0NobnBaWGZqTnN2cUNMcjJJU0tCSEZpZ1FX?=
 =?utf-8?B?Wnk4eFhDelROSmZoS0VnR1ZTbEhuZ3B6RTBRVkVSYTUxVURwSEs3dU8vVEtZ?=
 =?utf-8?B?WjVTYlprT2lnbGhQNlFCQWRMQ0RSbGdjSVB5SWV1dUxRMzRNSkZYYUxjc1Ns?=
 =?utf-8?B?OEJyWHUvVVpwS1JNTWtpekJDdjBmTm00TzVKUFFsWEF6Z3U1c3JGUngyWFln?=
 =?utf-8?B?NFhlTTNxeUFUQmttOXBsR1FvMjJ5VmE0NUtSMG5ERjltS1lGYU0wM2E5WE5k?=
 =?utf-8?B?WGhDMUVZb25iS2JuTXdNZU53ckJCOXJ5M2pmVTlRb1REbFlmdXJoUU1vS0Vj?=
 =?utf-8?B?MDVyOS8vbGZuMjJBM3ZqR0hYT3pQdjJRYzJrMDNoYnVxSjZLRDc1cUFYck81?=
 =?utf-8?B?VjNJd2lTaVgzOU50QitFREIvN2RRSTJEUDIvQkRMWlF1bXVZRm1BTlBOcWxZ?=
 =?utf-8?B?MCs3NUd6clFQL1Z4S3hwTkd0eXRGZWZrcVNBSmYwV2t6dEswZDZzb3NZV0Jo?=
 =?utf-8?Q?wHaFxRxides=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXA5SDFZZlRiYTg3d29CL01yNWNwRWhwcWcvM0xqZmovbktreVJhS3ZFWkh2?=
 =?utf-8?B?K0pRNWVaU255UHdJSm52WTJKYU9WcS8zVmFheUlHMGp1cnVkZUs0SzZpZyt3?=
 =?utf-8?B?ZWxHZjNtTGNsSGs5b2UyVTRldG9VL3dyNi81anBrU0daRDdTK3hldysyRDZX?=
 =?utf-8?B?akNyeXB0aEdhV1E0Y01RbUEzWmNaV2FybXRiZ0M1RUVkZ2ZMbjhXaW5CaEht?=
 =?utf-8?B?WFpaOXE0N1hocjY3SkdCVW9GM25vampaTTY2MCs4eFhtVUJVNHVlZHJNUDFo?=
 =?utf-8?B?WHpsYk9RM2ZyR0l3bmlGRUlVWCtkcW1zYUlkakJCQlFiZEE4OCsxb3hUUU90?=
 =?utf-8?B?aE1ZcVBvWjRSZTJvaWZ4aGROd3BtQllEOHU3WUdOMzBYeWZiQTJoaDFubGtm?=
 =?utf-8?B?aEREWCtld0RTZFlUeXNRMnNmOGxjRGluRTcwaFY1WVU2QkJSRTVlbXQrbzI0?=
 =?utf-8?B?TFpKb2d0RXc0ZFZHd1lQUFZxa1RYWVVwQzZYbE5IeTBUY0c1eVZ3YkNUZll6?=
 =?utf-8?B?ZDArVCtoWmNYNkNVcUJKOHRwbCtwWFU5NE5IbVV6dzVYTHd4T1hYUzViUjNo?=
 =?utf-8?B?Nm96aFhYMlJmUTRLcDY2Mk9ZM2VIZlNCc0NDMnR2ZUtnemlIY0FzUUpZVFFG?=
 =?utf-8?B?NEZoRmZxWG1qZXV1VUxaWkNzeTJETjhVUmUwRnJTd2xPajQwSmJZZ3RXUVUy?=
 =?utf-8?B?SThhTTNUVmtDNHNYVmI1WnVDSWZPUzVwNlFrZ2tOWk5ZbDZaSlUzeDFkdE8z?=
 =?utf-8?B?cVJDWU92czVoRjdOMERMWFhMTEhWb2UrU0VnbFhhSXNyVFBQZllsZlllNjVw?=
 =?utf-8?B?NGdybUE1WTJSU0txNXlvSGVhcWFLTml2dEZnWkliNGhGckEyd05wY0VlT2o3?=
 =?utf-8?B?QjlpQnZ3N1pHM2NMZitxVUdnM3QvaGphM0hDeE4rY1o5dER0Q1hUSkJmZVBw?=
 =?utf-8?B?ZmhMYkhIRGpRQnpNZmt2TWJpUnFFRnA3dDViRXgvaFd6bXZOTFNteGYvbjF1?=
 =?utf-8?B?SDkzQVQxNUU0bDlUS2E3bHBWK1JKN0dYQTBpSldzbzB3L0dNL2Z2WjRWejFr?=
 =?utf-8?B?ZUxVZVdteG1SYmM1WGtrVjFpVEFNMXBFU1lVRDJONFpheGdLdmZSeEY4MFMw?=
 =?utf-8?B?Vis5Q2JXMkIxMHhvcEhnVUsxVGVzc0ttQmVIblhPR1Fjc0Z6SDFSenhJSlhr?=
 =?utf-8?B?SVB2SmdSdlNGNGVhSmR6dkZVWnlLck1qVGZtMldpSVo3dThBZ3FiY2tDd3lh?=
 =?utf-8?B?Tk1TVm5hb015SDNxL2JqNE01VHp6SXkxWFpObEp6VXoxb2pDeVk5RmlBYXBa?=
 =?utf-8?B?ODhvRmVHWXp5SVlUNWh3eTYzelZDQWpESHY3RWYyY0FrWkxOUWlQUEdoZVNh?=
 =?utf-8?B?YVF6clVmRTV5eUhaMWVMVm8vQzJNNDVFRXl5cXBTdWVtY3FKOUxUZkc1OXBL?=
 =?utf-8?B?aTVjejJlbVJHbHhUcjVDelpiMnpQUEtpWGYvSmdpc2p5OFNTM3Y1NjJEN3J3?=
 =?utf-8?B?SUJHMXI1UXpORUJTRWlLL1dBUXU4QnpYcEphazhxQ2pMU1dPN3VaTnE3L0pD?=
 =?utf-8?B?Y3U3ekFGRlNsdW5VSVFtMHQ3UklxVDBvQW85SFdlRHBCaTYvNVM2Q3RQNVhv?=
 =?utf-8?B?dHNJOUhpNmRYSkpjNE5aT3EzaUVweFZOeXpUMVIxUVZBM3R3UUdjZFNncWZa?=
 =?utf-8?B?SE1UODhQVHRuMm5saXVUMW1SK1hnNjE2WjVCWXZiZmZRMHJjcmQrdzdYVkdt?=
 =?utf-8?B?U01lV3d6VEVBS0YyS0hieGR5Nk5TM2VTWTlSWVVmZytOcWE1TTMyeE0zMGhH?=
 =?utf-8?B?cG9hMUZXeURSeGtLVGZVcTNiRlVhODRvTkhEZUs3QkZQcXpFSXd5cE13TjJV?=
 =?utf-8?B?dWN4N2FkRFhoL001Y0EraDUzN0syT1IzOCtVZDdJc0tnQ25FQ2lhME9UUUtD?=
 =?utf-8?B?VXZxd2FwZGdQYURUTUR2elJKMnNyNjRLZnVkejIxUFV0SDBXV1JSNEV3Qlps?=
 =?utf-8?B?QmUrZElqYk54TkxuR1JldHlUYXdlNEFPdDc2Smk4N2NDVmYxeEVKejhpbHFJ?=
 =?utf-8?B?WlVsRzVDN0xaTzBqTFduS3NrYzJEVEhYWVE5cEgrUEVCaXI4elh4ZEs3VGJm?=
 =?utf-8?B?SDYzQzAzSGMwTUlSQWxVZXdDZWQ4TzQvYWs4MVVUV3IrVS9HNlU5MlM3RzJL?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0536e45-4b30-4cf0-2c4f-08ddb4c17e55
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 14:55:29.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvjWDq/tWugA6uRjjacDxfTFva4n0OMvClBZWuO9MU08rp47h1dRP6+IWXVVTrse
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR15MB4228
X-Proofpoint-GUID: se-rn2dgnFR-TXE81JxGRSYFayoxObrq
X-Proofpoint-ORIG-GUID: se-rn2dgnFR-TXE81JxGRSYFayoxObrq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyNiBTYWx0ZWRfXx7ZkdlRAgyuJ VFJCxy6QfenseIX4J7ffUY8zTNyy93wQ5qL7M6xfMKUgUXeNxS7xxQ5EMoDaW0UYKJ0IlthRfIw AAdEwmPezjCycs/NZsIOC1oDzkxN3AVd8qce14pM+B8uOxnXPmwH2cEXP/bkW/xHKFnR5RdtlLL
 gMznNiLXA3wOqP4DTf7PZ6i1NuusjNPaB2G+dJMKROepKBdQ+LF0fUk8exnG6YNGdOdb97oj+Ps scrM2inQaLT+y8HlKb29pX2vcZoV0YtETq9nkfl1Hl8Grb4Py9Z+9bY/A/v9TW1pHPk1RhT3c+e DR3bfHZcE2jhIOP88sKlcnl04Gw0ARAUxJdtrdklUPQWy4Y7tRu2Junr0ArStK+pptG8TYFIvzv
 +T1Guek0l1qrH9CjWGKhoGvJgreNgMnbmK7UOhEqmTZzFqIP63LdUbGYsom/qh0uF75F2B/8
X-Authority-Analysis: v=2.4 cv=ZPbXmW7b c=1 sm=1 tr=0 ts=685d5f6c cx=c_pps a=1BULgVhDqgdbiDwJYrIIJw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VabnemYjAAAA:8 a=cZ6L9vgj7jJLjBU2eKoA:9 a=QEXdDO2ut3YA:10 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01

On 6/26/25 10:26 AM, Vincent Guittot wrote:
> On Thu, 26 Jun 2025 at 12:58, Chris Mason <clm@meta.com> wrote:

>> Got it, I'll play with that.  Vincent, was there a benchmark I can use
>> to see if I've regressed the case you were focused on?
> 
> It's not a public benchmark but I had some unitary tests with tasks
> waiting on a busy CPU while other CPUs become idle for a "long" time
> (but still less than 500us in average). This is even more true with
> frequency scaling which will minimize the idle duration by decreasing
> the frequency

Ok, I don't think I'll be able to reliably recreate that on my own, can
I ask you to rerun against the v2 I sent out?

-chris
