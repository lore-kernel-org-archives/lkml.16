Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B3E226863
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747264384; cv=fail; b=NSG5F6HZ/M0ywAyP/kEulFFUpvn/Byk2QjJ7ITfYskK2DHvMJcGMT0QFLru1AYNRRkXxCU+ck82O3KElaa6VWB6rQhfjtJQwUUS7+ePEo+F3ftrziuuAP5llmyzZuXhOOKMqzezja380nqIUVCjq4eexP3m0KaPAlqscRAhEdbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747264384; c=relaxed/simple;
	bh=cvwqxGO94E20lSMAbT6DY4KO+MPVSKIbYW4av4S/LBI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uAQIABYlQ3I6V8n9YT646ccD2SeJWaLoFrD2P2d+6PK9a52dkyfNbK/HMeCuVMZNzPCPnBXT9Yr+FERKCbi47fhlR+UlLfuAyr2xWACMjlRyV78UGG8K8Ql7opIUpVXYN9xDb8fV3Df4Z/EvDPnlr2FitMp6q537kioNz8aVuHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VgwefCsg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=phIdVVAF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VgwefCsg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="phIdVVAF"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJJgLN020596;
	Wed, 14 May 2025 23:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cvwqxGO94E20lSMAbT6DY4KO+MPVSKIbYW4av4S/LBI=; b=
	VgwefCsgpz4bZ8FZbtCbVitIUjlOAwkJGvF3UsxsZUIeBS/WTeKSGrqOUDUUnuZp
	M2/R3MTJaILdKCdJRD3tHuWvSethfR0uAA1y08ggfHmPGGqyzLzIeGcBqrZQcJVz
	AEikzCiLe55d3BTU+6s45cG3yGJtjb6VQnpBIoTMil8emRao7TU4Q0c2vwHVg/VU
	XtQuGRKLNTTLFcT2qbbwGfvDARxUY6sZb/Fcb5ZUZp88hm214Qi0J+121BwH/KDD
	SsIyz7UbpIHK/cazdvDVhgUJrQyUeMAzTat59tnqP1nSUuiS7x3XFUjMWoqohvxK
	rsXXOaQ1z6dSZRTq+/M16w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbccu0e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 23:12:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54ELwCOA004559;
	Wed, 14 May 2025 23:12:31 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010006.outbound.protection.outlook.com [40.93.6.6])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mshjtx09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 May 2025 23:12:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4Y440ztoeDSrY6xmPSBN4Bfx/Fr3HC8Sj/XinVmxYMttLuf9MOHfEB8at2EqgvNy/kmGPKVe8Bf+ZsgOiOOGKX5iXa20drjEw/es/Wgeh2qipcch26h4nL8zvQxjiPiK1UDqvy/UnJkteltDp5tdMgxZOfYwkYTVnxPCCRLYUbOOlyYvQVqMyUXFgeskLpgOq1awSSS/p8OnEVY2IqV9nQxZmBDkdIwGQ55YpkMEF+euAhqVQ55aPu/4Ec/h/V//PeGKQaexTyMBxK1nMe4roFRZ2vjm3bq+B0XOO1080hdaBOafc4ixtaGsxWSUH75Je//qOCyG35ygeYqTswQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvwqxGO94E20lSMAbT6DY4KO+MPVSKIbYW4av4S/LBI=;
 b=d0tuiOGn/CCLNzN629p2iWVv1ffchncDRacow1yjRbfTnwZWoShdUWN4KAQonuJ7klp4q7rqp8aznjUjcZXwzzBhFiu/vEyVg1AmuvRPg6YfcHWpHu8Ke6cjIwr5ChOXxRWO/IXSR8jm3GZ3lkCY+EOhnp5QspLQfroA1awGUfiKkExqdJy79ffGOSudgeydlbnCUzLdC3oxTETLQ9PXMdF1ZnSGyF5Yg//ox3PMfCgmt691v6jXX9j7OQdJnyXvQQaiYh7Iz9SZxGdAMOlybRtGNuhan/gNfZsPYZ6Lc8i3KubGW0U6VIFbkKUAXRgls7BUl0ljUOw+vZJzxGBs1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvwqxGO94E20lSMAbT6DY4KO+MPVSKIbYW4av4S/LBI=;
 b=phIdVVAFysUW90bFrW305ldWavmEoRYCanwLI/dKAhUvpGNjaoFWHfKzrQ+LgkUFJLVwJlGRo/+nVSFvkDi24fDO1uROTZ6QiTEso35YRTnoauBR+nWC3S0Kr4YSgfVEAsmG33yQJLVtO3KrvrFoBR8oRzBZSOr9JmDMTA5vu3I=
Received: from IA1PR10MB7309.namprd10.prod.outlook.com (2603:10b6:208:3fe::13)
 by SN7PR10MB6405.namprd10.prod.outlook.com (2603:10b6:806:26b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 23:12:26 +0000
Received: from IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a]) by IA1PR10MB7309.namprd10.prod.outlook.com
 ([fe80::818c:4ed2:2a1a:757a%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 23:12:26 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>
CC: "peterz@infradead.org" <peterz@infradead.org>,
        "rostedt@goodmis.org"
	<rostedt@goodmis.org>,
        "mathieu.desnoyers@efficios.com"
	<mathieu.desnoyers@efficios.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "kprateek.nayak@amd.com"
	<kprateek.nayak@amd.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V4 1/6] Sched: Scheduler time slice extension
Thread-Topic: [PATCH V4 1/6] Sched: Scheduler time slice extension
Thread-Index: AQHbxL84jkkUMQXqRUSZrCYUHipYTLPSwcGA
Date: Wed, 14 May 2025 23:12:26 +0000
Message-ID: <E2C65493-D9C0-42E5-A8C5-091FE2394216@oracle.com>
References: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
 <20250513214554.4160454-2-prakash.sangappa@oracle.com>
 <ddc80d60-0cea-4e07-a4ef-fb21d5f5a0fa@linux.ibm.com>
In-Reply-To: <ddc80d60-0cea-4e07-a4ef-fb21d5f5a0fa@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR10MB7309:EE_|SN7PR10MB6405:EE_
x-ms-office365-filtering-correlation-id: 6d0fcdd5-9eed-452b-61d9-08dd933ccabe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OTZIdThVeXVsa0s4SXp3WUsyS1Z5ZG4xREhmQkFZNXROZVlhK0czS29ta0R0?=
 =?utf-8?B?S09nckxqSThQQ29QWWhUTDVsZklYQjU1bjArRk9NN1lxYm0yemt3V3N5YVNo?=
 =?utf-8?B?QWkwRTF1U3J0MzdZTldxaWprOFBNb3orS1NRQ2RVeEVEUGh5NllXa0dBVUZI?=
 =?utf-8?B?NmtrMUpxSmpsN3I0cVN3NVpQRTJKWEhRMzRINkViNFZodTVJQ1hPQmFiZmdi?=
 =?utf-8?B?L0RFc3NsdzFZSG16Q25UZGI1QUI1VHhsSi91a3p5WlF1eHZXQTYzTm16RElN?=
 =?utf-8?B?NlhIdFpEMzQ0QXJORlMvajFYWXlObnlZdkdsM1BIcmpTbTQ0eXNNZHBTZ0lo?=
 =?utf-8?B?KzRQMWt2MURWbVdIZ0pVZGoreS9YNGFGQ0tXTVFlSFp5b3M3NDcwUlNzMHRN?=
 =?utf-8?B?UytCMDJvV3FoL0ZEWHJVSjY4Y01kTW8xa29aY05pV1VKSEt2blF0cnRra2Jv?=
 =?utf-8?B?OHZlQ2hTUkZtSzg4cFVvUUJkYjgvZzJ2M1ZoTWlRT3VHWGNod24rajFnbkJT?=
 =?utf-8?B?OTdSUFRRbTNDZUllS2FLTnhod2MwYTZ0WlVtZjNtQXlkRDcrY0xYbmI1SCtk?=
 =?utf-8?B?SmZNK1dvSTdZZzJlSldGbVo0TW5hU3FlT1VjbDBtNlpNZm40K3NFWmJiM0RX?=
 =?utf-8?B?Ym16Rko0U3MxalZYUW9oYTZiak4wOCtDTEpKM0diZVZ5K1pmK2dyUlJXa0FG?=
 =?utf-8?B?ODBDdUhqUnNyYW5VWTkvbzRpRVFQM2xnZ2RVREZqNnkvVUtiTTRqcTJYMjN6?=
 =?utf-8?B?SmpneklXQS92aU1BTmZpWjcrSFdTNXBCNFlPNUg5NHhUa2M5Nm5aQzV4bnZE?=
 =?utf-8?B?RlpsVWVQa3JtZXl4T3FJc09JYVFlU3BpL2ZNdHpHY2xsd0FVNVRLUkJVdVpM?=
 =?utf-8?B?bkN3MGJ4RzZNeVBMTGdJbCtBYlhPd3hCZHAwYW83S1paRk10TVVaNThqOUhv?=
 =?utf-8?B?Zk5NOHBlWlBSR1NSeUZLYk1oWng2ZW1lL3Jidk9TaEw2cUxLQ0EyZGdoU1I3?=
 =?utf-8?B?V1E2VitjRGtibG5oeWd6VG5RN1lJazQybnJTYTI1UEw1c0orYkd2Z0ZMM0o3?=
 =?utf-8?B?WjlzTEZFNG1icnRra0p3ZEdndXBTSS95VENBS1JjVTdBemw0Tmp6QmJTSFRH?=
 =?utf-8?B?SXVDRDRPbVQxTjJxMHNuOUlaSEl3WWlZdEs4a0YvRmJuMW80NytoM2xDSDAy?=
 =?utf-8?B?R2ozaVBQbWZINzdLZE9qQnFrbzFqeEN2NVBVRytES3h4MlY4WXRielZ0eEtY?=
 =?utf-8?B?UHZFV3BtWVVxRXozM2NtV3gxZzVkdzlGZGNWbzlKMHA3dlRlaHhtWHc4TUt3?=
 =?utf-8?B?SGdLVEFSL3U3c2hoVXVMTHZwSEY5UHpLRGhvV0UrSzloVU8xbXUyMU0wOEEw?=
 =?utf-8?B?bHcySnhpdXNCN0s4Qnh1d0NTWURhTklSYlR6MDZoZVF3OWNsdXdlKzNTTlA4?=
 =?utf-8?B?NW45K3FNRk5UN3J3a09oT2VkN0svZlE3NTI2UTlPWkVqdjI4a29nU1dhYkhu?=
 =?utf-8?B?U1F3enNwaDZFVFQvU0hzOG5qVmpMVHhvLzZibS8vaDQxZ0ZrQUpDSlBLaWgw?=
 =?utf-8?B?a1h5dmY0RHVPckdYY3ZiZmRBZFhmWWRHRENYTXFocnY0Nm01MEdDZW4zQXlk?=
 =?utf-8?B?bXB1WG5KWVJhN1FZWXNQMGIrNHNJTGtITWtHbm5lZDdjSUNlUXZYTG9DbXEw?=
 =?utf-8?B?cDdXZFhUQlBYNlp3VVowQWRQTmpVYWRoU0lZWHZ1aVhhcU9hTmFzZ0xjYlkz?=
 =?utf-8?B?ZXpBWExCVUV1RkVzRnNzbGZDNG9WOFdnN2ZZaDRJM1pHeVhjTmY0dC9WVjVT?=
 =?utf-8?B?OUZlQmdwQkFoU2E4UFR6blh2eXZhOUQ3RWM5MHArT0dENjhNWXcxaTFCYmZV?=
 =?utf-8?B?dzEzaERCOFM1dVRYeCtEM1NvMG43c2FiL3VwbkJhdHdTRk5pQUtHNFhiTm1G?=
 =?utf-8?B?RjhxbFNhRlREZ1ZlNnYvSGZwalBGQjRnUmk5RzB1V0ZFUzZwZFNMTHpLbTRa?=
 =?utf-8?Q?Lr+UiK6WrmmIHQXXwPfewnGO4LJak0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7309.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ky9zUnZ3TkVxOWE4ZzAyTUlDSzhQZUw3RWJIbHk5SnFzTWVHeDkyaWk2cUV0?=
 =?utf-8?B?ZUlFRW9IT2g1QW90Qk9ZdFhQZkt0NnEzWkMwSG9ZNnNSc05FN1BTby9EUFlZ?=
 =?utf-8?B?czhrRWZnK1l6QXdITFBkUGdPeFhQc1k5Q2RHYTZqbXB1UW1VMTlaSTNJNWdz?=
 =?utf-8?B?dm1RZWVVMTRGTUNrTk1CQVdQSWVnZWZNOGUzdURMNnlla0FxKzVXUUpaNGh4?=
 =?utf-8?B?UXBzZVVNUjNYcHJtcE9VdlpLZmU3SFR2dkJxbExqalRKTktLd2wrTmhiaE1r?=
 =?utf-8?B?bk43N3JLMmZmOXkzcXYxc042Y2RsZzU2dVVMcHVxOWs2NHc3VDUwK1B0TGYz?=
 =?utf-8?B?UnAvekNreUhsRmVKZU4rZkdXdWxJd0ZBL2hwbTZTMDN6a3VnMWxhdlNsTWxz?=
 =?utf-8?B?bmQ2REF0MWFPOStJeXhCdWtYejV3cDUzb3BRWlJZei9NcWJuWTZpa0VvemI3?=
 =?utf-8?B?dHM5d0Vhd1JSSHJpNi9WYmVQeVJ4OWk1U1FraG44WSt0eTZ1a3ZLUUNXZ25E?=
 =?utf-8?B?Ty8rYlVZNk9HQXhEeGVoeEtIdnpLalZHQmRHSWZrSC8wbHpoQzJKRGorcHk4?=
 =?utf-8?B?T3loODhxUE9ZeUEvaTNGeWp1V2JRbVF6end2YXFPbzBGRzBtM0l1Ti9NcDZz?=
 =?utf-8?B?M0xZVkdwcStMK2wwbWZZcGZzaVRuaXpBRmJKNWNBZndSSkdRU2F0cS9FNUpI?=
 =?utf-8?B?bFpiVHNvbzFGOHZ4MzBtTjF4SU12WEVwNDU5NjJpTytXSUZMakxEeFFOSXYx?=
 =?utf-8?B?MzJTNnR5R1UrZHgrL284amJyMitHTldNcWxVZ2lScm9LZ3J2WHhJY01tWlBu?=
 =?utf-8?B?ZCszRmNHakxzUEVlcEtTenpVZnhNdnBsU0EwQWptRVJwQzFtTnF5dDgzVFpr?=
 =?utf-8?B?dDFjNEpRT3J2c25GcjkzT1JWRzVWdXRtbXlvb1JJTWF5TUN6NEZyQlVxTkcz?=
 =?utf-8?B?V05jVCsvUWg4cVdndUZydWlJMTc3ak9adzJVSkZhRjdEaUxxdlRRWGhjc0xI?=
 =?utf-8?B?WEp4b1V0NUVEUGtxU0JXWFVjZjJyVmt2ZUVCVXM0ZTByT2FqZFhQTzdRbFJh?=
 =?utf-8?B?TmV0MXVYM2ZTa3VtbnY3Z1FUbE10VEhjSDcwOHJXZUR4anZkaE10eDlxZGhm?=
 =?utf-8?B?bWV5cnhpOGlmNGR2a1NKcXMvUjhoNW82Qm1QTlpsYjk0bWlHTk1JczVKVjZw?=
 =?utf-8?B?OG1jR1ZnZEE1eHJsVCtUNFpYMGlPVytkaCtYOXZXUFhPVmNmcnhYK1JVc3hJ?=
 =?utf-8?B?TjViL0VFRmFsYU00enR1Z0lYbFFhL0U5cEFUTUx0R1pqcEQ2S0ZkUy96ai9C?=
 =?utf-8?B?QkJEOERLcTJVVUZmUkpPKytnTXB1b2d4Vkh0K01WMk5GaEliME1qbEZCTVV6?=
 =?utf-8?B?cStpS0RORmRheGpTME9WQXJqaEM3UjlNMEhkcUpmVzdGakpDY0I4UjVoNWJK?=
 =?utf-8?B?WkxrRjl5L1hlMlJFMzZqMlE4Z1hMU3grNXFBNDN6cjM3WFN2VHpzUlRqazJ2?=
 =?utf-8?B?aFg3eHBDSFVpSHVvYVpJb0lSajYzckx6eGFqUldZZzU0NXlteEVrcDlBeWVi?=
 =?utf-8?B?RlRSWmIyS2JoaFdGekM3K0NDSmMvanpnb1B2NjNJaUxVNkZJNGc1cTNkNEtj?=
 =?utf-8?B?a1FZQlZ3K2tjR1JFS1EvK1piL0hzQ1VvbGUrd1Rnd0VKaGl6WW1WRU9MS0s0?=
 =?utf-8?B?bnZiaWo4aFpDKzFsMVNKLzBXd2hEdGZRcDg5REJObnRISmZqeFhTdE8xdmpX?=
 =?utf-8?B?ZDg1Q2dNN1RKTzB2cUg0VVNOZlU4Smtkdk9QbGZSaGZWODB5Y1lBUjZHUWFr?=
 =?utf-8?B?NlMyQndGUXRRb2FrbDNvREQ0YWNGZ2M1QWJCNWY4bnArVEJrdzVncU9SVU9W?=
 =?utf-8?B?VUJPbVNaU1gxRlgyY1dJWEluaWxJcFZwUy9nK1cyWDhIdEJXUXl4cWZRT0xR?=
 =?utf-8?B?RlV6OXU1WkJ3dERleEJMQXhYdjkrRUpMcW1jdjBLODFHNGtsTG9iZURCaDFE?=
 =?utf-8?B?Z1UvWG96ZEFrRkp1RVRIczdVVkRIN3RCYm9mRVlYd3l1QWpucHZoUjJubkNh?=
 =?utf-8?B?MFI4VTY1UUZnb3dzLy83VmlsTXNqdXhxa2Qra3FBRm95TUlzUHZLWEo5dzBK?=
 =?utf-8?B?VlFEVk4xd3QvampMY2lPQ0JKMmdPSDFPTFU2QWxNMFczdllUZzRWNCtROTFC?=
 =?utf-8?Q?odT8y/RevXVUPXicxM5vmKw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6735A28CB5BE484E8D225C7873C48D67@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5A0cD3h3Smx2Gp9ts/hV2ASYX9syTPRvkcHBmX1UYOHWYFYZWpfYSuFeCfOefc/6zZU5prY7PjMz2+l/rNeEwpxH8kLElYsvVdaFAifNfejIX4yzsBr+8rSfx9IGAeVQ/JwF0hq7znFvwYXkazh+wD0dNKmbxQ/H+arTL09m/lq/kfLZ/hWcnrZFPqPmXtDaDLSAUbwY50vBl9esOIQA/erHEUq4SfrLfjynT7zBqK1HehEgkcUgFRMtDIsYCWAexy3mNwA5oJJnT9gHbqWYMxllifOnG2zKWjtmXIv3922cCx9QFvYdAlCGpIWz11uebPdZMaw1xYGG3uZubNlfjdFtbSEz2O5RZxWHDcvxULZncG/WZ5IqNPCnHqpJDVg7s43njeeooCT41DW+pEuWtAupC3CztYzdhkCuKofMTOf7/JiaW051DLRXMd6kYL/p0+Xrm3zFlW/llOlQ7ZNK7x5F04BbfY+KfitXPdRuUeoKyGJSgmnAanHoU/1pZ8qeOazs87Fr3zSZnUijSqKv8qak1JexJAqQcllt6UmLplb62DRCx3QgG2w7MKGRLskPHzHTQbrQr0YdzqCE6yn2Sc+fIyl7+fDArX6LNWXiq6A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7309.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0fcdd5-9eed-452b-61d9-08dd933ccabe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 23:12:26.4956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGFTP/PArUUku3dL/79diPXqj+kxEkq4KUqCov8gEgVVRPewU2fKhybhdZCIVquhoAWTzCoIrkrEEtsvJMwac9bxeZUQxD8323XS/RyiqxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6405
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505140214
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIxNSBTYWx0ZWRfXyKay3acRxhb3 bL/8m+nOKiiYyE9bYc5x2pz5v9swBxFoiJ+sYiA2GVCXPbRruEz5ZlyiVR0DjGlxGAULDbKJ6XT Vii4vnVTWhKdg7syHtbHIHGPwdzXqxtsGTnXrvHIVil9xVeueJqCAfUg8y8b6H9833MUhLV1svO
 wXAVuorBugh4mjmPU050C5oZhXDF95I3/xYSf8Qc/1wwzmlHG+Wi1TUMlbGSYMNyvW7equVe+T8 9Usdl5iCHSB2yCCgKblAQZ/ZAJfcltJJ/6coSJeBdSbQqFbYEgAc3R7rkl7N7gKIekZMKaclMAA K945VkizKF18sprJhLzPHFZwj3Hdqd0fbdxtZjEE5ubk4Q9eXk11yodGsI/9hdxqj5nhQmpjojZ
 dTrPRcO/GFb9cImzOgoOwVx9QpKbSUQFgnSEv8QNPIcbWyMiukFt6rMkL2vY55K/Te41aytu
X-Authority-Analysis: v=2.4 cv=Y+b4sgeN c=1 sm=1 tr=0 ts=68252360 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VnNF1IyMAAAA:8 a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=UJMr0XFxFrtXNQHGNXkA:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: kiJ_iQwoac3LCZH-opg62PoBxoQ_BBw8
X-Proofpoint-ORIG-GUID: kiJ_iQwoac3LCZH-opg62PoBxoQ_BBw8

DQoNCj4gT24gTWF5IDE0LCAyMDI1LCBhdCAzOjU44oCvQU0sIE1hZGFkaSBWaW5lZXRoIFJlZGR5
IDx2aW5lZXRockBsaW51eC5pYm0uY29tPiB3cm90ZToNCj4gDQo+IEhpIFByYWthc2gsDQo+IA0K
PiBPbiAxNC8wNS8yNSAwMzoxNSwgUHJha2FzaCBTYW5nYXBwYSB3cm90ZToNCj4+IEFkZCBzdXBw
b3J0IGZvciBhIHRocmVhZCB0byByZXF1ZXN0IGV4dGVuZGluZyBpdHMgZXhlY3V0aW9uIHRpbWUg
c2xpY2Ugb24NCj4+IHRoZSBjcHUuIFRoZSBleHRyYSBjcHUgdGltZSBncmFudGVkIHdvdWxkIGhl
bHAgaW4gYWxsb3dpbmcgdGhlIHRocmVhZCB0bw0KPj4gY29tcGxldGUgZXhlY3V0aW5nIHRoZSBj
cml0aWNhbCBzZWN0aW9uIGFuZCBkcm9wIGFueSBsb2NrcyB3aXRob3V0IGdldHRpbmcNCj4+IHBy
ZWVtcHRlZC4gVGhlIHRocmVhZCB3b3VsZCByZXF1ZXN0IHRoaXMgY3B1IHRpbWUgZXh0ZW5zaW9u
LCBieSBzZXR0aW5nIGENCj4+IGJpdCBpbiB0aGUgcmVzdGFydGFibGUgc2VxdWVuY2VzKHJzZXEp
IHN0cnVjdHVyZSByZWdpc3RlcmVkIHdpdGggdGhlIGtlcm5lbC4NCj4+IA0KPj4gS2VybmVsIHdp
bGwgZ3JhbnQgYSAzMHVzIGV4dGVuc2lvbiBvbiB0aGUgY3B1LCB3aGVuIGl0IHNlZXMgdGhlIGJp
dCBzZXQuDQo+PiBXaXRoIHRoZSBoZWxwIG9mIGEgdGltZXIsIGtlcm5lbCBmb3JjZSBwcmVlbXB0
cyB0aGUgdGhyZWFkIGlmIGl0IGlzIHN0aWxsDQo+PiBydW5uaW5nIG9uIHRoZSBjcHUgd2hlbiB0
aGUgMzB1cyB0aW1lciBleHBpcmVzLiBUaGUgdGhyZWFkIHNob3VsZCB5aWVsZA0KPj4gdGhlIGNw
dSBieSBtYWtpbmcgYSBzeXN0ZW0gY2FsbCBhZnRlciBjb21wbGV0aW5nIHRoZSBjcml0aWNhbCBz
ZWN0aW9uLg0KPj4gDQo+PiBTdWdnZXN0ZWQtYnk6IFBldGVyIFppbGpzdHJhIDxwZXRlcnpAaW5m
cmFkZWFkLm9yZz4NCj4+IFNpZ25lZC1vZmYtYnk6IFByYWthc2ggU2FuZ2FwcGEgPHByYWthc2gu
c2FuZ2FwcGFAb3JhY2xlLmNvbT4NCj4+IC0tLQ0KPj4gaW5jbHVkZS9saW51eC9lbnRyeS1jb21t
b24uaCB8IDExICsrKysrLS0NCj4+IGluY2x1ZGUvbGludXgvc2NoZWQuaCAgICAgICAgfCAxNiAr
KysrKysrKysrKw0KPj4gaW5jbHVkZS91YXBpL2xpbnV4L3JzZXEuaCAgICB8ICA3ICsrKysrDQo+
PiBrZXJuZWwvZW50cnkvY29tbW9uLmMgICAgICAgIHwgMTkgKysrKysrKystLS0tDQo+PiBrZXJu
ZWwvcnNlcS5jICAgICAgICAgICAgICAgIHwgNTYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+PiBrZXJuZWwvc2NoZWQvY29yZS5jICAgICAgICAgIHwgMTQgKysrKysrKysr
DQo+PiBrZXJuZWwvc2NoZWQvc3lzY2FsbHMuYyAgICAgIHwgIDUgKysrKw0KPj4gNyBmaWxlcyBj
aGFuZ2VkLCAxMjAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvZW50cnktY29tbW9uLmggYi9pbmNsdWRlL2xpbnV4L2VudHJ5
LWNvbW1vbi5oDQo+PiBpbmRleCBmYzYxZDAyMDVjOTcuLmNlYzM0M2Y5NTIxMCAxMDA2NDQNCj4+
IC0tLSBhL2luY2x1ZGUvbGludXgvZW50cnktY29tbW9uLmgNCj4+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvZW50cnktY29tbW9uLmgNCj4+IEBAIC0zMDMsNyArMzAzLDggQEAgdm9pZCBhcmNoX2RvX3Np
Z25hbF9vcl9yZXN0YXJ0KHN0cnVjdCBwdF9yZWdzICpyZWdzKTsNCj4+ICAqIGV4aXRfdG9fdXNl
cl9tb2RlX2xvb3AgLSBkbyBhbnkgcGVuZGluZyB3b3JrIGJlZm9yZSBsZWF2aW5nIHRvIHVzZXIg
c3BhY2UNCj4+ICAqLw0KPj4gdW5zaWduZWQgbG9uZyBleGl0X3RvX3VzZXJfbW9kZV9sb29wKHN0
cnVjdCBwdF9yZWdzICpyZWdzLA0KPj4gLSAgICAgdW5zaWduZWQgbG9uZyB0aV93b3JrKTsNCj4+
ICsgICAgIHVuc2lnbmVkIGxvbmcgdGlfd29yaywNCj4+ICsgICAgIGJvb2wgaXJxKTsNCj4+IA0K
Pj4gLyoqDQo+PiAgKiBleGl0X3RvX3VzZXJfbW9kZV9wcmVwYXJlIC0gY2FsbCBleGl0X3RvX3Vz
ZXJfbW9kZV9sb29wKCkgaWYgcmVxdWlyZWQNCj4+IEBAIC0zMTUsNyArMzE2LDggQEAgdW5zaWdu
ZWQgbG9uZyBleGl0X3RvX3VzZXJfbW9kZV9sb29wKHN0cnVjdCBwdF9yZWdzICpyZWdzLA0KPj4g
ICogICAgRVhJVF9UT19VU0VSX01PREVfV09SSyBhcmUgc2V0DQo+PiAgKiA0KSBjaGVjayB0aGF0
IGludGVycnVwdHMgYXJlIHN0aWxsIGRpc2FibGVkDQo+PiAgKi8NCj4+IC1zdGF0aWMgX19hbHdh
eXNfaW5saW5lIHZvaWQgZXhpdF90b191c2VyX21vZGVfcHJlcGFyZShzdHJ1Y3QgcHRfcmVncyAq
cmVncykNCj4+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgZXhpdF90b191c2VyX21vZGVf
cHJlcGFyZShzdHJ1Y3QgcHRfcmVncyAqcmVncywNCj4+ICsgYm9vbCBpcnEpDQo+PiB7DQo+PiB1
bnNpZ25lZCBsb25nIHRpX3dvcms7DQo+PiANCj4+IEBAIC0zMjYsNyArMzI4LDEwIEBAIHN0YXRp
YyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBleGl0X3RvX3VzZXJfbW9kZV9wcmVwYXJlKHN0cnVjdCBw
dF9yZWdzICpyZWdzKQ0KPj4gDQo+PiB0aV93b3JrID0gcmVhZF90aHJlYWRfZmxhZ3MoKTsNCj4+
IGlmICh1bmxpa2VseSh0aV93b3JrICYgRVhJVF9UT19VU0VSX01PREVfV09SSykpDQo+PiAtIHRp
X3dvcmsgPSBleGl0X3RvX3VzZXJfbW9kZV9sb29wKHJlZ3MsIHRpX3dvcmspOw0KPj4gKyB0aV93
b3JrID0gZXhpdF90b191c2VyX21vZGVfbG9vcChyZWdzLCB0aV93b3JrLCBpcnEpOw0KPj4gKw0K
Pj4gKyBpZiAoaXJxKQ0KPj4gKyByc2VxX2RlbGF5X3Jlc2NoZWRfZmluaSgpOw0KPj4gDQo+PiBh
cmNoX2V4aXRfdG9fdXNlcl9tb2RlX3ByZXBhcmUocmVncywgdGlfd29yayk7DQo+PiANCj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NjaGVkLmggYi9pbmNsdWRlL2xpbnV4L3NjaGVkLmgN
Cj4+IGluZGV4IGMwOGZkMTk5YmU0ZS4uMTRiZjA1MDhiZmNhIDEwMDY0NA0KPj4gLS0tIGEvaW5j
bHVkZS9saW51eC9zY2hlZC5oDQo+PiArKysgYi9pbmNsdWRlL2xpbnV4L3NjaGVkLmgNCj4+IEBA
IC0zMzksNiArMzM5LDcgQEAgZXh0ZXJuIGludCBfX211c3RfY2hlY2sgaW9fc2NoZWR1bGVfcHJl
cGFyZSh2b2lkKTsNCj4+IGV4dGVybiB2b2lkIGlvX3NjaGVkdWxlX2ZpbmlzaChpbnQgdG9rZW4p
Ow0KPj4gZXh0ZXJuIGxvbmcgaW9fc2NoZWR1bGVfdGltZW91dChsb25nIHRpbWVvdXQpOw0KPj4g
ZXh0ZXJuIHZvaWQgaW9fc2NoZWR1bGUodm9pZCk7DQo+PiArZXh0ZXJuIHZvaWQgaHJ0aWNrX2xv
Y2FsX3N0YXJ0KHU2NCBkZWxheSk7DQo+PiANCj4+IC8qIHdyYXBwZXIgZnVuY3Rpb24gdG8gdHJh
Y2UgZnJvbSB0aGlzIGhlYWRlciBmaWxlICovDQo+PiBERUNMQVJFX1RSQUNFUE9JTlQoc2NoZWRf
c2V0X3N0YXRlX3RwKTsNCj4+IEBAIC0xMDQ0LDYgKzEwNDUsNyBAQCBzdHJ1Y3QgdGFza19zdHJ1
Y3Qgew0KPj4gLyogZGVsYXkgZHVlIHRvIG1lbW9yeSB0aHJhc2hpbmcgKi8NCj4+IHVuc2lnbmVk
ICAgICAgICAgICAgICAgICAgICAgICAgaW5fdGhyYXNoaW5nOjE7DQo+PiAjZW5kaWYNCj4+ICsg
dW5zaWduZWQgc2NoZWRfdGltZV9kZWxheToxOw0KPiANCj4gQ2FuIHRoaXMgYmUgcGxhY2VkIGlu
ICNpZmRlZiBDT05GSUdfUlNFUT8NCj4gDQo+PiAjaWZkZWYgQ09ORklHX1BSRUVNUFRfUlQNCj4+
IHN0cnVjdCBuZXRkZXZfeG1pdCBuZXRfeG1pdDsNCj4+ICNlbmRpZg0KPiANCj4gWy4uc25pcC4u
XQ0KPiANCj4+IGRpZmYgLS1naXQgYS9rZXJuZWwvc2NoZWQvc3lzY2FsbHMuYyBiL2tlcm5lbC9z
Y2hlZC9zeXNjYWxscy5jDQo+PiBpbmRleCBjZDM4ZjRlOTg5OWQuLjFiMmI2NGZlMGZiMSAxMDA2
NDQNCj4+IC0tLSBhL2tlcm5lbC9zY2hlZC9zeXNjYWxscy5jDQo+PiArKysgYi9rZXJuZWwvc2No
ZWQvc3lzY2FsbHMuYw0KPj4gQEAgLTEzNzgsNiArMTM3OCwxMSBAQCBzdGF0aWMgdm9pZCBkb19z
Y2hlZF95aWVsZCh2b2lkKQ0KPj4gICovDQo+PiBTWVNDQUxMX0RFRklORTAoc2NoZWRfeWllbGQp
DQo+PiB7DQo+PiArIGlmIChJU19FTkFCTEVEKENPTkZJR19SU0VRKSAmJiBjdXJyZW50LT5zY2hl
ZF90aW1lX2RlbGF5KSB7DQo+PiArIHNjaGVkdWxlKCk7DQo+PiArIHJldHVybiAwOw0KPj4gKyB9
DQo+PiArDQo+PiBkb19zY2hlZF95aWVsZCgpOw0KPj4gcmV0dXJuIDA7DQo+PiB9DQo+IA0KPiBB
cyBtZW50aW9uZWQgaW4gcHJldmlvdXMgdmVyc2lvbnMsIGRvZXMgdGhpcyBub3QgY2hhbmdlIHRo
ZSBzZW1hbnRpY3MgZm9yDQo+IHNjaGVkX3lpZWxkKCk/IFdoeSBpcyB0aGlzIG5lY2Vzc2FyeSB0
byBpbW1lZGlhdGVseSBjYWxsIHNjaGVkdWxlKCkgYW5kIHNraXANCj4gZ29pbmcgdGhyb3VnaCBk
b19zY2hlZF95aWVsZCgpPw0KDQpFeHBlY3RhdGlvbiBpcyB0aGF0IHRoZSB1c2VyIHRocmVhZC9h
cHBsaWNhdGlvbiB5aWVsZCB0aGUgY3B1IG9uY2UgaXQgaXMgZG9uZSBleGVjdXRpbmcNCmFueSBj
cml0aWNhbCBzZWN0aW9uIGluIHRoZSBleHRyYSB0aW1lIGdyYW50ZWQuIFF1ZXN0aW9uIHdhcyB3
aGljaCBzeXN0ZW0NCmNhbGwgc2hvdWxkIGl0IGNhbGwsIGFuZCB5aWVsZCBzZWVtcyBhcHByb3By
aWF0ZS4gIEl0IGNvdWxkIGNhbGwgYW55IHN5c3RlbSBjYWxsIGFjdHVhbGx5Lg0KDQpTaW5jZSB0
aHJlYWQgaXMganVzdCB5aWVsZGluZyB0aGUgY3B1IGl0IHNob3VsZCByZXRhaW4gaXRzIHBvc2l0
aW9uIGluIHRoZSBxdWV1ZS4gU28gaXQgZG9lcyANCm5vdCBoYXZlIHRvIGdvIHRocnUgZG9fc2No
ZWRfeWllbGQoKSBhcyB0aGF0IHdvdWxkIHB1dCB0aGUgdGFzayBhdCBhbmQgb2YgdGhlIHF1ZXVl
Lg0KDQpJbiB0aGlzIGNvbnRleHQsIEkgc3VwcG9zZSBpdCBkb2VzIGNoYW5nZSB0aGUgc2VtYW50
aWNzLiANCkhvcGluZyBTdGV2ZW4gb3IgUGV0ZXIgIHdpbGwgY29tbWVudCBvbiBpdC4NCg0KDQo+
IA0KPiBGb3IgYSB0YXNrIGlmIGEgZGVsYXkgaXMgZ3JhbnRlZCBvbiBDUFUgQSwgYnV0IHRoZSB0
YXNrIG1pZ3JhdGVzIHRvIENQVSBCIGJlZm9yZQ0KPiB0aGUgSVJRLXJldHVybiBob29rLCB0aGUg
dGltZXIgbmV2ZXIgZmlyZXMgYW5kIHRoZSB0aHJlYWQgbWlnaHQgb3ZlcnJ1biBpdHMgYm9udXM/
DQo+IEFueSB0aG91Z2h0cyBvbiB0aGlzPw0KDQpJZiBhIHRhc2sgZ2V0cyBtaWdyYXRlZCwgaXQg
d2lsbCBiZSBwdXQgb24gdGhlIHJ1biBxdWV1ZSBvZiBDUFUgQiwgdGhlbiBpdCBpcyBsaWtlIHRo
ZSB0YXNrDQpnb3QgcmVzY2hlZHVsZWQuIFdoZW4gQ1BVIEIgcGlja3MgdXAgdGhlIHRhc2sgaXQg
d2lsbCBnZXQgYSBuZXcgdGltZSBzbGljZT8gU28gDQpub3Qgc3VyZSBob3cgY2FuIGl0IG92ZXJy
dW4gdGhlIGV4dHJhIGNwdSB0aW1lIGdyYW50ZWQuDQoNClRoYW5rcyBmb3IgeW91IGNvbW1lbnRz
Lg0KLVByYWthc2gNCg0KPiANCj4gVGhhbmtzLA0KPiBNYWRhZGkgVmluZWV0aCBSZWRkeQ0KDQo=
