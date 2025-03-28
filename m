Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8926B1C84C3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 23:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743203812; cv=fail; b=HYV+FlPTnyKD92IVDxnFh5FGw4dt77GVO4GENzaEUiYdp8Fsr1pqADe3DoyEFPGUkgJtaxwUhvR51lxcOwiV1BJy2MeYobgQkd6qHuCa93CWrUIyu3NCN77dmqK/0A6TTa8gNy3uGU6SLk0GRPIrfQBW9aneffCsXoxRkeThyus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743203812; c=relaxed/simple;
	bh=6J+cjEQktWV3Y1xpI67WqZ9KbvdRtJD8DyGIL0FmnfY=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JcXI32dagCgpyNdSr6HBf2iY0tnlQBn1WhC7fC9nteKCBA0Qlqsn0k/mMIcSfqOVq9g5Zf0bDfnBxvNODZVAuFkUprcFGBB1949x05ck9MV7/rHhf0RWU+0A4bnxUjJi7GCUd05+tMg/P/kZ2atarSzFKE5T/dhEkzzXATxqaO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=APChhX9Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JI7JCB4C; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="APChhX9Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JI7JCB4C"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SKWFxv011650;
	Fri, 28 Mar 2025 23:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=E//C34yGhxLVCvk1gbPDBWAlWeSZ+6uoFtIguTdXDU8=; b=
	APChhX9QMpXz+CT2yHyZ/kqkr6ZNEt2HiocWQKpFklNpnowJdD8OihTvs7T3+oYT
	Rcw5cnKpJKsI9SKBWnOkooxuRPqDMRTjuqHI30+JBHGQjmNmy/XgUChhkszhBbl2
	f6jljk+FpMjmVymL5Wv5rV5siquwo3ooSIYHEp3mNqyEkVqhm2Ojey3ROS/D5r/q
	nYm36Uj8N+EI+a893cPYO8QMhGURaHfnW55m44RY1dHwHZ0O/TfevlewzttVVDTM
	ZBpkbru28Ugs7GRRKguFAY1d6/CAmr/H1OGEV2V5S711FUR2aLSSmuRyKJJQMUlz
	/1+vZX4rxkHhgJnICbu07w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn8bg4d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 23:16:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52SMABf3015138;
	Fri, 28 Mar 2025 23:16:34 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45jj96wkvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 23:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niQ6+lxE6fSd2xNtdT84dD4CDGIW9UKxxw5zc0vt/Tl9A1XVjaWH6LZCaHy38XctAYApwC2AGrcVHLbxPpRV3r5uDcW+qD+SWttbdhmIRuP/VQmYKYkAqF79/iDjHUiG+l7AbbrW3xM8tD1Vf1+yzXEdcy9PtRL4t3A/tB6HGuSw5DOlgb160qGU5CraRXqmcAKsASMtZfoY1f0qf+agv1GNef+OpfXUJsR+rw3bFaDtDLmiePqiZ9X5T6utBeoO0SL0DkxnQsucvrnoaSSWlXFxJdwPTgGqxThjI8tw4+k7DxqawFuxTDt+y98IYilP+ZFfAEB0oRsmlcFWksj6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E//C34yGhxLVCvk1gbPDBWAlWeSZ+6uoFtIguTdXDU8=;
 b=ARRl1921i3s4mOn2dX2RBYLcBFJ7KzKGpoaE5yFruki/SqoDadhUytC7ri6Mu75Afj8W+Xa64S1BCZ+XBOMAw593z6XAWRyJWbXKeRZhppUzrh4m5S3mOohy/x1y96D/oOxwgGfAr9hgzkJlLM/ixJlb+sVvNUTWwy7IV4AjZTYT758QU27dw0hY2/w75YYVECTUuIB+WWh811Emb5IlTVvXrHNnOPbRNfllRem8ccwonTvrje/xlwbd0UJS2JRbyMossuGl3Lz1RTx4L/367RAdbkDkOp5ykcDLBONbQHmjzJOkz2XyQ3z9Yg0ucS4DqmLyL53+KTWnZaw/gp2WFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E//C34yGhxLVCvk1gbPDBWAlWeSZ+6uoFtIguTdXDU8=;
 b=JI7JCB4Cn1V+UTFhQQltU36MzI4S/owkXk3waxYPzV8o9sp7bafy7nVcaWgw8oZOIIdDRaB5gLDlayPKjmNtj7GWsWjvLLh6pk00OT7eJXImsaw+k0lUCnA8CMVGdHxbMXRNgIv6oqOiJK+B4/7xpiOZ5R5uIB61CT1CliUTY2w=
Received: from MW4PR10MB5749.namprd10.prod.outlook.com (2603:10b6:303:184::12)
 by DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 23:16:30 +0000
Received: from MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454]) by MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 23:16:30 +0000
Message-ID: <4f5453e8-61b6-45d1-8c6c-8b4fb99a6448@oracle.com>
Date: Fri, 28 Mar 2025 16:16:29 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v2 2/2] sched/numa: Add tracepoint that tracks the
 skipping of numa balancing due to cpuset memory pinning
From: Libo Chen <libo.chen@oracle.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: peterz@infradead.org, mgorman@techsingularity.net, longman@redhat.com,
        linux-kernel@vger.kernel.org, mingo@redhat.com, tj@kernel.org
References: <20250327002352.203332-1-libo.chen@oracle.com>
 <20250327002352.203332-3-libo.chen@oracle.com>
 <bcba4d76-2c3f-4d11-baf0-02905db953dd@oracle.com>
 <20250326220620.60cec3b6@gandalf.local.home>
 <73227d82-d641-4b95-9ad2-e156f655429e@oracle.com>
 <20250327100326.439823ef@gandalf.local.home>
 <5d29adc1-0f6b-4cf5-b4d6-2e9ed13273cf@oracle.com>
Content-Language: en-US
In-Reply-To: <5d29adc1-0f6b-4cf5-b4d6-2e9ed13273cf@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To MW4PR10MB5749.namprd10.prod.outlook.com
 (2603:10b6:303:184::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB5749:EE_|DS0PR10MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: 52bb278b-f762-4c38-4132-08dd6e4e92c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnRibGNEWXZITVo1TS9OemZ1Q2s4Uk9QcndLYWsxVUJwVDBSYVJnMTlKRSt5?=
 =?utf-8?B?RUFoN3hWK0JQcVdzRithTURzR2pkaEdwYWN5OWxrcXNkeWVNTlB2N2pOaHJ6?=
 =?utf-8?B?UDRvMUFoV1ZJTnNTeThTTHdVd2E5Slp5eHVWYkNkcjJad2lEejZnUjJmSnlC?=
 =?utf-8?B?UlVjNmVMNUp1R2NpeWgrMEM0dm12enhBeUwxOG5nQTFiN2trSE1LbUF1STg4?=
 =?utf-8?B?Yy9KOGZRblpSSnhRS0VKYTBwNWg3bmlYQW5IYUJnQmxPU2JSVzBNaU9mNHV5?=
 =?utf-8?B?UmxvemdCTFpKU09TMDI3bjdyRzFhcmVzdTFKUVpZbW1KK0NaSXgzaUN2T2lu?=
 =?utf-8?B?ai9VRFA0NU1KRFgvclpZYm10MGhPU3hIZHNadTk0ZUZwalFuK0FxRmEyL1RL?=
 =?utf-8?B?czRZT1c0OGNjaVdueTVEYzdSQWZLV2JjSEVmMVNzMHY3R1RkQkxuYjlmMTBU?=
 =?utf-8?B?bW5BTnN6WjNhb0RKSFo0Tk9IbnBtTElvaEg4bXRtMGc1MlBkcFBZK2xBVVVj?=
 =?utf-8?B?R00vU3B6cm9YY2ZkOW92RXdUYXZ3MlhobHZYRFVDUXhGVHVEdFZJQjRZb0NT?=
 =?utf-8?B?djFoVFVwdUtkemd4SnVSWkQzNndMbkNxUjRSaS9CM29qMzBFKzBRSStvZlE3?=
 =?utf-8?B?Mkw0M3VHQ2RMNHlUYnB1djUvVjBrNHlNYmovQnc1dlFlVUdDOFZzVTBUYVBW?=
 =?utf-8?B?dHpkSkg0Q1AyZjJjOU8xYTBZQUllL2IzanJzNmQvOTVVWGFyNjA0U3ByVDZ1?=
 =?utf-8?B?eTVNMkN3QS83TU1GT293Nk5WOFJnTmd6YUxHZGRLVWp1QngvTVNKV1RaeElR?=
 =?utf-8?B?TDVsdmpHNHZvNVNYT1NYTDNNd3FrTFpYcmFPWXdTdDd3a1ArTjBiT0F3UDJw?=
 =?utf-8?B?d3ZveHZ2cW9mclV4cWdjdjh4UmhpMGp0YlNDcDZES0JjYjZDYTN4S1dzK2RG?=
 =?utf-8?B?SzJnY1orSG9LMCtmaEJrTVptUlZITGhLeGNvUy9XQTVoTUJ3YzVYQVdlS0tN?=
 =?utf-8?B?QXBTZzViNm1yU2ZVUVY1ZGJVdHJ1UTAyZjQ3R016RGNlZjI3dm4vMzBlQ0Jy?=
 =?utf-8?B?VFhmcjRVd25sVGZDbk16SGhIMVVjaVRmSkVOcVZoYjArYmtLR016Y2QwclI4?=
 =?utf-8?B?WUpqc0RPMStlV3dsaWlaQ3h2aVh2ZHRSQThkakZoaXV3K2ZTcEdjTHhzWDVB?=
 =?utf-8?B?cVNmaURHNWN5SWF6NFJFeGJrNnR3ZExIdWtqS3MrWUJiNndUSmx6c01VVDRW?=
 =?utf-8?B?WXNlcisrN0ZCT3dXbjJDZHJ4OTI1cU5tN3VCMzk1TGhlYmMzM2d3RUFiUGk4?=
 =?utf-8?B?YmFneGR6NjdYczlHYjB0bnlmNHJCbVhBYlB6OXd2eWd5QTBHYWpvSVZQekwx?=
 =?utf-8?B?eDJBTnJHM2UvOGNrZ2hpR0VKRVRLU3dMVWl6RXVWT1QvRTlvdlE4TWhEbklX?=
 =?utf-8?B?SXJsaHplUjExWm1mZWRuSHdNY3FYYnVjaEJDWWhjdk1CdGdwUVlncUlQditw?=
 =?utf-8?B?dE1tdURtR2UzS2pOdUFrRi9tYzZ4Smh3VDZjcTFhRkhSeGM1eUlKVFVkZjZp?=
 =?utf-8?B?NGg5Y2UwMVRLcjU4WU1MbWU2OUJwMHFvRWVOZy9FTWpHTHhBMzJmUXhmM3Yr?=
 =?utf-8?B?d0Y5UWZ4Y01jSzA1ZlRpVkxXZ05seDg5SWc0WlhuaVIySGNOYnM3SW1Bdk1W?=
 =?utf-8?B?NERuR3ZiaTBzWWZOV3FRWjIrelpJdWpuQUQ3NmprbFlEUTNVRkJsb1NsV01K?=
 =?utf-8?B?UHNtRkJXalBjZzQxa052TlVQa2k0eFNDd0xERHkrbjRENXVHeW80Y2FhbWhH?=
 =?utf-8?B?dXdNZXpoSS9Wa2JLRnZTTEdqdDhVWnB4WGFzZm1IZ0xtaFVZd1JUWUlhemxV?=
 =?utf-8?Q?GckqQcjsp5tPf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB5749.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M240Y0lMOGxGUUdHeDdkdVlibTlrNVJxcVh0ODErcWk0ZWV5N1VWM2g0V3pX?=
 =?utf-8?B?b3FRL0EwYWpFbVFibXZmMjVrc1JQR25oeERlaVFVQXpVYkx4aU5Wa2NseWly?=
 =?utf-8?B?Lzd3UHZLc2Zpd05wa2JsQmlOeC9tZnB0VFVaY3Mvdk11YWtlZklMUk9PTUxF?=
 =?utf-8?B?QjFTRTFiTWVITTZ0ZFIrR05CN3JhbXhBZlJDNFlxLzFVM1RVRE53NjBYSERH?=
 =?utf-8?B?bHVCWW1rV2xzK0FMZmsrMmRJOVlBYUtQN28xWHBST3Rma0h4cTQ1KzhxU0Mz?=
 =?utf-8?B?bkRJd2M0a2p3dWtPOFAzMTZRV2laa05HVmxDblNRL3R1RHVvb3J1SFRMUUFP?=
 =?utf-8?B?cWxDNTA2UlZwb2szcUo3ZzQySUppcndsODZTdDVrc1JRTEtPZFhpdW1Qbktr?=
 =?utf-8?B?R2ZuMzNmbGFkelF2dUJWZ3RWQnJFS1N3NzVXaUN2Ri91c2VxU3hTQmIySkVV?=
 =?utf-8?B?d2ZXV285cnZzSHBVbzF6MU1CVzNDd1NUUEJDSnVwdWxISXllcVZhZ2QxdkMx?=
 =?utf-8?B?T2pFcU8yakpXdXp5OG5jRGFjQWFxbFRoVzB3dmVEQzhRVS9mTllmTXFJbS9w?=
 =?utf-8?B?OXFlK3FwTHBBRUhqMGFTZHZrQThRNUV0eVVJNjlzRzVGSlBVUXc5M0M0MXFV?=
 =?utf-8?B?ckNiR0lOWEJERjVjWHBKWkRybGwxQ2EzaFozNlpPOE9nYWNsRDBTV0JaUGl4?=
 =?utf-8?B?SldtT1B4SjZNemN0Y09QM3BWMjkyNVhXaXZxamVqZzJ5VU44RUJ3TGc4d00x?=
 =?utf-8?B?UWpOalByNERRcXJYeHJVaWNFdWd1anhTbDlQTTZhMEJ4ZjNsREpDVHFjd25y?=
 =?utf-8?B?NFZ3c0xqZUNKVWxpMlpJOGxoT2RVRTAwc1dsR2Rld1lnNzYzaml0TWt6Umti?=
 =?utf-8?B?SS94UlFTTWxzUnNTOE5vaU5FVnkzY251ZFBDOWFHU0tnbHZvTUw5Q0x0WlBu?=
 =?utf-8?B?OWxCUmMyd0JZeTRKc2tRRlluRVpxZHhKSm54cGFhcHVmTjRPQTJ4b1BIMW1r?=
 =?utf-8?B?MVdYK3NaMHF6UGtZNWlubG9BRTh1Q3hqUjdsdnRtampFa3lUbXRQTEFCK0Zr?=
 =?utf-8?B?T0dJd00xKzM1dWcxU2NVVkI2TzhUejhucWdWT092bWhZL2xub2w4TWl1alZi?=
 =?utf-8?B?Y3NZWWgydTFCMTRCY2l5VzVWYitFMmVPR0NTd09qMFBNZnFVNWJ4bEw2UDhY?=
 =?utf-8?B?UXFQeCtQc0JmeER4SHNjRFZyZXNibStzbVBDNWtKc3BNT1h2SGZJRGJDZlVR?=
 =?utf-8?B?QkFMUnBZUm5Vb2w3QkQ3WXZRdFRPb294eFdPK0o3c1l1Q1A4Z0xHKzFrUGdo?=
 =?utf-8?B?NnVrRCtZYTEvRWVwZFlRL3dGMEtwaThNeTFNbC84aHNMVGpxOWdmUkhEcmJh?=
 =?utf-8?B?d2RSVW5OQWpILzVUbUVzZ2N2aWJGT3ArcDlqVlRHdUJvVU9UUmZOd0RCWitD?=
 =?utf-8?B?ZHFJSW5uU1hWdmNrUWZGQjVFUm9UcU52YStYTUFZM1Izb21VaGFHVGk1cktv?=
 =?utf-8?B?N1hjL2c3Q2Y4Q3RnR0FIc0lCQzdBS2I3R2MxcGJJUS9pTi9HZEF4RGI4c3ZP?=
 =?utf-8?B?SVpmWE5vYW1wMVg2cEdFM2tUWTNwaFI5L250SmU5bjl2bEhaRkgwMGlLeUY1?=
 =?utf-8?B?RGV6bmVpWmRBNWVSTm9Wa3J0cGhhczhIbE5nN3BhUFA1bnI3akNId01wemxY?=
 =?utf-8?B?ZVNMTURNakMvMUxLWXhYM0RUTzhuSGF1SjJlVUpSWHREUzhUcVNXSjVLMjly?=
 =?utf-8?B?VzRQUUgvZVlrYXV2WVpiZ2x2MnNaZ1p1VXFvNnZPeWRCVURLRkE0citjeGhx?=
 =?utf-8?B?VU1KNW01WElQaWlpUU9LNzRlRjhJTXdIQTd0emIxM051bG11NFlUMnd2dHVl?=
 =?utf-8?B?cGcvdUFyc0VFM29EZmtjd1FDRFc5V1ljMTJncFpySVlXaE5uMEpoOVpJcEF2?=
 =?utf-8?B?dlMxM0k0akhJLzl3SnNPZmY5RVFiRkllT0xhRm5Ta292M3JnSHZzUG9ZOVEy?=
 =?utf-8?B?MjMvVFZhMjlabmZZblRhN0hxVlJoV092dS81azhZU3BPWUsvWUFiY3FoNDVx?=
 =?utf-8?B?V2tZYjlWR1RzV3J4TEp2YU1JYkQrai85enRxUFd6cXA0YlBXa2NtaDhmLzF3?=
 =?utf-8?Q?mFQnpP4aMWdMVNZZiAE1d6Sha?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rUrHKoJlxX5gV95f/GdIgyzRj57xgJX1co9Fd+x/9n36AG3gacJfm9mi5C6REL6dlCiOGIgg8ZWCDyxtUvPL5THNOJOQ63H4O8eGGEQuyb8I8tHwOe0W0aMyFtWdx03aPuccADdu62hiJJwaLEtgTHrue73v86LYMiBy6LqhIDAr9/ONlYQbdMAlXxGNU4llIekTnhxPfGywXZwmJ2AJ7uVSVRaCXW1lq/gM/XNrUmOfx6DH75RPgRW1kPLV4sJhsyT6BUqUoUIVMZIOHX/IIuAgOuLrS1UkwCeHsyb2v06bLpSMzRx7MWgrPzFxq8Oioquunkwb2wZWw+VWw6zJpTIbOoLq/0scij3341Wz/jL9wM25+S6DANAMqxlrmY6DtV65unhlPA/8q60EVm8OCUbg4N1owdBPr9rk7qwv6PnXZ+qYdfRETAJ1MyfjZ7QqpTFPFph2udNmAtPaz8Ay0Wkj6BaboANevFSYXS64UftDPRpNcNSpB9+DYUTTHIB72MEXSMCFVkJ1ieTw5xu6b0gJi9vM+SoJJr6lHUPg1p4l5HaPEYsyJM879sekb9NFsPvRgla3N7MojvQbC4ubb8pwdD8qUTSHllCy2tY0ni0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bb278b-f762-4c38-4132-08dd6e4e92c0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB5749.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 23:16:30.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oREkHyJQ1JEEPmIV+95uUjhaNPRw6InQVG5XfVsd/mVOhmipkN5EU53xUmPLZAnQdFFow3HwERJn99mS/4gljw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6271
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503280156
X-Proofpoint-GUID: iV2b45bgFOhD_pzbSudXYPp9iwH_z7fD
X-Proofpoint-ORIG-GUID: iV2b45bgFOhD_pzbSudXYPp9iwH_z7fD



On 3/28/25 15:28, Libo Chen wrote:
> 
> 
> On 3/27/25 07:03, Steven Rostedt wrote:
>> On Wed, 26 Mar 2025 21:32:32 -0700
>> Libo Chen <libo.chen@oracle.com> wrote:
>>
>>> On 3/26/25 19:06, Steven Rostedt wrote:
>>>> On Wed, 26 Mar 2025 17:40:02 -0700
>>>> Libo Chen <libo.chen@oracle.com> wrote:
>>>>   
>>>>>> +	TP_printk("comm=%s pid=%d tgid=%d ngid=%d mem_node_allowed_mask=%lx",    
>>>>>
>>>>>
>>>>> I cannot find a way to print out nodemask_t nicely here with %*pbl.
>>>>> So I fall back to just raw hex value. Will be grateful if someone
>>>>> knows a better way to print nodemask nicely in a tracepoint    
>>>>
>>>> Ug.
>>>>
>>>> I guess I need to add support for that. Both in the boot verifier as well
>>>> as in libtraceevent.
>>>>   
>>>
>>> That will be fantastic, I think this is quite useful.
>>
> 
> Oops just saw this right now, not sure how I missed it.
>  
>> I'm curious to what was broken. Just the user space side? Or was the kernel
>> side broken too?
>>
> 
> That's a good point, I originally only tried %*pbl with trace-cmd, but I
> tested your patch without trace-cmd. So yeah %*pbl may already be working in
> the kernel, I will report back later today.
> 
> -- Libo
> 

Okay yes, it does prints out to trace log. Not seeing the output is due to the
userspace tool not the lack of check. 

-- Libo

>> I notice that i2c_write has "[%*phD]" which means it worked, and also
>> skipped out on the verification tests. This should be fixed.
>>
>> But trace-cmd and perf will not be able to print that out either.
>>
>> Now %*pbl works in the kernel (not checked), but probably doesn't work for
>> trace-cmd.
>>
>> -- Steve
> 

