Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7651DDC20
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200932; cv=fail; b=DyJYgs1h6v2zPE8bVukf77cs/crDoNKDLr0dX0DORSW1lcjTMZqnTNYKdXDuH7YPLGvzcgF43WFdgKLjL0m7GmEj0ZxjBz5LpFVRdGLSg5asodXbpfItvDKd/Xr211xeIWlSAhrhZN7Rk8yB9voCUBzIhJ+uHREePQl6OpaKl0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200932; c=relaxed/simple;
	bh=vxiGr7IO73aWiB/ytkW0/1qaG0JF8x7ru6AiDcD2dro=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fu503SR/wsq2V4DszThbpKsSINAEZa0YMqWbNMN2m9tYfOu7i2UlK2X28MdvXLYrS32Xo2mE+59XT0+4gElKjA2aA288sFPwftts9XS3nwoxSVX0G6xqpwlmAkIThZwGca5fIdZ/LSbTWWzFqaP+h5n+rHucI8DUWcWG8i+eLNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dqj1de2t; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hl0sxrtG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dqj1de2t";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hl0sxrtG"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SKWKXw001851;
	Fri, 28 Mar 2025 22:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=9zFsuGHN234oTG4c596O4HMGoQ26M49ZdH/+Pw3jzPk=; b=
	Dqj1de2t8cJGxMlER4nKZqElLU2S8JPeMSgFZyVcn1RSqNxoZAA9cTFPchVD7Ph0
	odvrPflru3b9O9xrEh/OItscESKXshpSoxcMPDPlJ8JnsHByTYENX9DUT2qlSxnG
	AehwAbQlucr4GWEasLmC/lnmD+eAAUf2GBE6PfsI0FA9KJPJqA8XBpzEV0VoVXIk
	D75+ydDMLi4iCFfeD72xyd5hy81St5NkSnHUn5ESYJruZWY56JJBNIgPKYkx4cBT
	ikE1Pt/0V85M088uhs911Sa49nj2MXv6DJUEPhNvmofMQ9K6ZaJoQjF2EYSA6pww
	dUyevMu68S8quVJkT4xHeQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn5mfumq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 22:28:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52SLVMtt023556;
	Fri, 28 Mar 2025 22:28:24 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45jjcjmpq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Mar 2025 22:28:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBv38DaPtKaRMDF0l6bNF/JnyVdCLpRS2Nzp7pEZIQjIU0sgcd38rsPoZVoNjO45Blff9Notizty0ZW7WJ66BUxZiS4H0Fe75RwPDjgZSkGl+qUUJz7a5hhOP5anYOxT0ptLucQknmDkCOYmrKTyOpX2G1KoNmG5oUTkFs24cqg01/Rq0WNcwpvu5IAWPW3uWOaeHdaJ/rjFYLnsmMavhgxclo4ZmQfbAWSv/pI10XemcwKOBfIE8kG2ekOhBAhAsrxApQOgr/EZolH6miea7Inxq9Gv7ZIWFaVtc4AuiRzyppCMo3bO6rVWksZDed/hZ/TBNzXEF824dzsBuamjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zFsuGHN234oTG4c596O4HMGoQ26M49ZdH/+Pw3jzPk=;
 b=VRaFjEK2uRTjhOD8YclI7iuLSOIvTGromxMHcAFrg414ou77dExfV22znu/j/XslHUMlA1yr84hoGoVVbTwM3H7daQqNJk2V98Pk+rGf0qxbWQrw/FPeJP8oFbX4NrN2WpWf1gA6E6grwzCjuoUyo2yT2rLxO+EsZR+BzS5Wy8bgmuuM9UrKIe6Zf4sefYQyeIYqsab4VYsorbzXWtehh+RCgMwaNQPOcFVA9aNFqrTzkj1F4nZSZnSIiu6qcRakdP8RrqHca/BE8BUIv/CQcctoc6ZJBQE5UtxqM7MXd4L00hD8AxTf1OHYrke+rwT6dQCrJzglMcPUgX9pwg5yxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zFsuGHN234oTG4c596O4HMGoQ26M49ZdH/+Pw3jzPk=;
 b=Hl0sxrtG5WQ4+UNKPEwVP88nB0dUBpTFNgopOyiuAD/R4oAC0Ttf62ojmXH0wsXNOj/eSQ18kl7LAaNjqJla7WCMFRDkZTLsew2Kl2nxphxaHV9L738JIgTAdc/2hAFQwiv08UYITuYNE3CD3azLSSsiivnfVUPZbMvHYDxO4Hk=
Received: from MW4PR10MB5749.namprd10.prod.outlook.com (2603:10b6:303:184::12)
 by DS7PR10MB7225.namprd10.prod.outlook.com (2603:10b6:8:ea::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 22:28:03 +0000
Received: from MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454]) by MW4PR10MB5749.namprd10.prod.outlook.com
 ([fe80::9a04:a919:657a:7454%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 22:28:03 +0000
Message-ID: <5d29adc1-0f6b-4cf5-b4d6-2e9ed13273cf@oracle.com>
Date: Fri, 28 Mar 2025 15:28:01 -0700
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v2 2/2] sched/numa: Add tracepoint that tracks the
 skipping of numa balancing due to cpuset memory pinning
To: Steven Rostedt <rostedt@goodmis.org>
Cc: peterz@infradead.org, mgorman@techsingularity.net, longman@redhat.com,
        linux-kernel@vger.kernel.org, mingo@redhat.com, tj@kernel.org
References: <20250327002352.203332-1-libo.chen@oracle.com>
 <20250327002352.203332-3-libo.chen@oracle.com>
 <bcba4d76-2c3f-4d11-baf0-02905db953dd@oracle.com>
 <20250326220620.60cec3b6@gandalf.local.home>
 <73227d82-d641-4b95-9ad2-e156f655429e@oracle.com>
 <20250327100326.439823ef@gandalf.local.home>
Content-Language: en-US
From: Libo Chen <libo.chen@oracle.com>
In-Reply-To: <20250327100326.439823ef@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH3PEPF0000409E.namprd05.prod.outlook.com
 (2603:10b6:518:1::4e) To MW4PR10MB5749.namprd10.prod.outlook.com
 (2603:10b6:303:184::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB5749:EE_|DS7PR10MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: 55324512-21f0-4664-19ee-08dd6e47ce27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzFFTk5hRk02S09nd0pXYVFTQU9jYk83REhTbE1XdWlLT3Y0WHpicTRqdUxK?=
 =?utf-8?B?bEdKOHBlMGwrUERKcmZnbkVORWtROTl2elhzWmxHNCtCUTBGRmo5T1dib3hv?=
 =?utf-8?B?LzBiNjhrWEVpbUlwK2FtbFBmSjR2SUlhU0hqdW8rTW9yaENBN3U3dDJKa05O?=
 =?utf-8?B?YTBuQnZoWWRZcWhsUXBvbmpITGh0ZG8zYXNrb21RRytuNW9RTmtkYS9aTnhh?=
 =?utf-8?B?NlhwN1Q3T25saGNDZVQ1QkZmMnY1K3d2T2w5V0gyRHJIdUlvOS93OVMva1h4?=
 =?utf-8?B?N0oxMDdXeWg1NWpVQlRDSG91dmVrbXBDa3BqZ0M3WkN2dW8wdmlCSHJ6Vm5o?=
 =?utf-8?B?aTZORUhmYStXWEFXWFk2amIzblZWZkdhYTAxNkpZekRkNkxyeE5TZGFpNE5z?=
 =?utf-8?B?b2NHNlZJZmtieFlJMnJBcjFrY2lQM3ZjSFBPaFBXWlBJMmJRQ1FERHp3MEhs?=
 =?utf-8?B?QVI4K3lXdzBiY3h3OXd1blAzVE9YaVFjN0pyekNVTFh4UTY0YjJLSmlIdjB4?=
 =?utf-8?B?c3lWZWZubXZuNXlwTnQxQVJqemNTQjNlNlpNRXFWSUJVN0FNdnc5eFdUZnpR?=
 =?utf-8?B?SitHVVllbEg4cWJXZlF0Q1JtUHJRVk1URWtUOG1ybDNLMG1Vbjlhb2VTU2Vz?=
 =?utf-8?B?MFhCcFpLWGEyR1hyVkFoVVJHaGpqVGVjWEUrcE5CNUh3VjBrV1Bnclk3ZWc2?=
 =?utf-8?B?dHJtUHZXTG1qekZaK1F4Qm9iVmlGdnhSOWpFMzRQRi93Vy9aS3dWL21OKzB1?=
 =?utf-8?B?TnM4K0ZENjY2UGlHS3hWK2RUVm9hdGVZK2llWGROdVJQMkRkbzZ3SGpyc0NF?=
 =?utf-8?B?WTlTVWJZd3BPeFVBajBZaFZwVkxTT2k3UjVnNVVqRTFncDU1TjRzYWRpUTdu?=
 =?utf-8?B?d0YwM254MGZoYnN3c1FlVTN0NmRHZ0FubUkwRFBGS1ZUL0R0TmU4TDk4N1A1?=
 =?utf-8?B?d3JYbm9sdWdmQzlaaGdXZENySzVlZWFRanVzQUZ3R3BUTzh5Y0RyRGU5cktT?=
 =?utf-8?B?SFBzc2x4UE1Oa2lReVh2MG15YVZ2S3dXOGNLS0ZHSWdFRWhqK1BlMzE2QlVJ?=
 =?utf-8?B?MHN4eXc0STFVRUNGcWpNWVJtRHMvaDQ1VnVtdENKVVhOWkpEdURjazRKamhQ?=
 =?utf-8?B?QzZrQTV5VXlJZU90N0ppMVdzNWVmRmVFZFV1TWpPQ1JkdE13ck43K1FsMlc1?=
 =?utf-8?B?MzZ3Z1ZZTEZWVzJrV2VZYmNvRGJQN2Jwc3RKeHpiY1E2YTZPcUR3bXJsN1hR?=
 =?utf-8?B?NTYwK2NvWFUzMzhIb1VNKyszYUFRb2FiMkhqTS81SUVSaWY0bStpRkZia2hn?=
 =?utf-8?B?bVpCejdCaTZ5Z2IrcUZDNFh2d2NJK2FHVm9PdWpyVURIZUxRVEYybUFFb1VC?=
 =?utf-8?B?ZW01UGFoOXlJOTZJb0txUFR2NHVVTEMxQWN0L0RpeEJFbm1OYnFTaGhtM0dj?=
 =?utf-8?B?WjVjNlZEbGp4S3krQ21ra0pBL2xjWXZ2OGQ1dHhTY1A5bGc2OW9vb24xK2RG?=
 =?utf-8?B?WUdENDFCN3ZjL3d3MWlNcDF3ZmtpUVY0NFFYR3dNanZZYnlnQVlFSjlhWXRC?=
 =?utf-8?B?YUxXVnBQNjBlRDNxbVFxZW4vR2Q5OXk0bDVzdkI1amVLeEozelBCU1k3T3NV?=
 =?utf-8?B?TnBFeC9JdWdQa3paK3dIZmQrTFB3N2R3ZG9ybGlvTzdCNkQ0OUFjUkhDclVP?=
 =?utf-8?B?K1Yxd2xmdlNjajdNREY1dzc1Q3dRTno2OWNBZ1NzdnM1Wnl2VUJacHFwdm5Y?=
 =?utf-8?B?TmlmRGZRNU9Fa3JMMytSYjRmRStZOEVaa1NXY0czRDZYaExSZEgyNGFSRTJW?=
 =?utf-8?B?NFZiL1cvY1RVTjEyWWlPQllPQWJGS2M2S2dsZjhzNENaK29oVE0xclJBWHUz?=
 =?utf-8?Q?SRDpA9ofPrGNV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB5749.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUkrOFJ2L1FldVRzSjV2bnhOUTZkZ1NMVjUvQ2RUMWp5UTZjU2d2OVdneDZJ?=
 =?utf-8?B?anFuMHdWT2dZVnRxa3hGRWNPUHJQemcrWWtuT3NucURDd1M2ekJhOXNqN0hV?=
 =?utf-8?B?YkthcjM2Z0NlMy9TU3hsNmYvQlYwUkxQMjVXWnI3eVZGa2FvWmVCMWYrY0Qv?=
 =?utf-8?B?YTlQQ3g3ZEpQOUZSUnB0dlAyUGtCcit2Mkx0SUJpSEFxSWJhWWJwTU5VbDVz?=
 =?utf-8?B?RUs0S3piME53Nm9uSUxwVGxkV21DTmNrZWQ2a3I4ZkFjd0llZUZ2S3hTQ09o?=
 =?utf-8?B?S3FMQi8walQ2ZEo1Z3p4eTJndDlrMzZkbGh5bStTR2hpQVVsSTRSRTBLMWsv?=
 =?utf-8?B?L3pFR0R3V3A4SC9ENlJGQ2FHWUQ5ZUhYTkhhQm1Fd3NJMVhGV3Fvc3YxdXBj?=
 =?utf-8?B?c1dKMUNyTnVHQ3JHa1R5eWZJUnd3cTRSTmtPS1grNU10bWxKZ1NlYkppWGlv?=
 =?utf-8?B?L2JIZlQyRjFTTEVCZW1qdWVNdUJUbW82T0hVZUUwZmhkRUVzbTZHeWsyUDJm?=
 =?utf-8?B?UkRvd3plSnN5VmxQT0pjS1VhWnI1SjdLNHlPbk9rcjFCVVZaMlFXYmV5aE8y?=
 =?utf-8?B?N2N2VlRuT1p2UnJ5WTg3MG1ybHZhNm5jM2RoYTdLQVNBSTJHcnF5dUtkZ3I1?=
 =?utf-8?B?T000cXVDYXM5clV4bGY1ZUNNbTFlV3N1dy96SURXcEgwbkRBTE1PdFFRWXBP?=
 =?utf-8?B?cDNPNGc0dEVOM3VKRFFFN0pBclM0ZE52bm5GdHhlWVpCR2xmOHIwQnZUVDlz?=
 =?utf-8?B?RThJeVNOUFdnNFI5WS9BVHRNMGFnRjA1M1l2d0doRm4zV01id1ZqSDBsM0s3?=
 =?utf-8?B?NVd5Z04zc0dQdWVwSjdLMXFKeUhrRk1STE5Hd2ZLd3R1NUxtMlhiSHdwb1po?=
 =?utf-8?B?cEhWU0V0MEhxelV1bk80SXBkQXZENlNVTVdTNGhPN3RMcXdnY2ZYcGR3dFdr?=
 =?utf-8?B?ejdFWXorT2NuZElURjQrbDZubDZJdU84Zk5PNzlqTzV4MmxFTlRGYWRYcnU4?=
 =?utf-8?B?VWRWWVhnSVZlcitub3hIaW5uWENpbHEzejF1cFozeWJuU1RCaXZDOWt5UG1a?=
 =?utf-8?B?SUplQnkyVEUydGIwY0lRQ3dLQnFaUCthTlZHb21nQ2NDNGtBMU1LOVRRa1FY?=
 =?utf-8?B?RTN0Y1ZlSlpvTFJtRmtkdDZnWmpYWFQzZmZpbUVJK01UcDZCSS9MM0NlRzUx?=
 =?utf-8?B?aE9MbFFBQkc5bUExVmtUb0ZKU0xTai9RK3hHSkxMZW5PSlcyRmR1QkhkUXNq?=
 =?utf-8?B?WEF1YmJ3bnVScU1XNERBV0hUaHdNRExrQXhNNm9uSkNTUjZpMDBpajBKWkpB?=
 =?utf-8?B?eitiN0o2emhXVVhLV1RuNGJGQWwvVmVEUkJvbXhaWnQvMUNyWUt5YTc2NDI1?=
 =?utf-8?B?Znk1azhMZnJVSFNISjMyWTZkbHRrT3hlYlF1cDE3dnp4V2ozdllNbW9xczgy?=
 =?utf-8?B?c2RTNTA3TFFxVm5iSlFkY0pkNFpXUldvanJSWVZOUlNFUm4zZkFQVTNkRDRG?=
 =?utf-8?B?eVN3c0Jib29JMnBDMDBxNXdNMndBS1NkM1lQeTdUdldsRVMwVWptWTM1U3hm?=
 =?utf-8?B?cXlFa1pSem40cTc4OGt0U1l6RXMwb2lObWJ2eTlUYjRkcjJqK0UrVmJ3d2Va?=
 =?utf-8?B?YjRCcVdHTGtLZzFaS0NDYmg3VktmMjdGdXEzd2RTdG52QUh6NzRrN1J4SzRM?=
 =?utf-8?B?Q0FYaVZyNUFxUDFyazFMaVExRlJwUGZRbHVEMWtUc3VzNzJXWFp0QTJjVFk2?=
 =?utf-8?B?M21wVG1NWnpabHd2UUpTZ1NySGJ0T2w1K2NGVDY4Wlhkc3dsMVV5SCtHMVFZ?=
 =?utf-8?B?N0tOVEpZMGlzQzRJV3E3cVNhamlGUUY2cDM2dUIrenpRM0lFcnd2QS84Z0tB?=
 =?utf-8?B?U0ZpNDhVVTJiM08vZXIwTjNIbzdyRnpzTEtJbnZvRlFpYUhxT1MwcXJyaE9v?=
 =?utf-8?B?K1VkZ0JucnR2QU43TlczWlFETTBYemROdi9nb0NNbXlFZUQ4aTRxZ1BpeWZ2?=
 =?utf-8?B?T2xxY1ZybTJIZ2Vwa2FvWWwrSHMydWpxZXY2ZTluc0pCbEdJQlRDYjB1bEI3?=
 =?utf-8?B?VXBQdXFOSHRKWEQrVExoWGlOWG1zbm1JWTFBSnZETFdXNnhpYXU5TWk2Q2tJ?=
 =?utf-8?Q?gJYHpDg7ORYFA4KaX6PwRFIhD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	411Y5oRtL34p5Iem50wUzof+iQfD5fsO2lo9kR5nFy2KaFKNcbr+P/lRjQyo+chpv5vmZpir0i9AE34ZdJCUthicfzITHZf253PgK/LMPfixaQD1VKaXbvOofdP5CohxonkK2RocYWSGQg8ogwDM6w6UmrEJ5N3zYQ6rVoH9TD544KoO3ieW1TViGgILtznsKExfKZ9VHlMQsngp+KFxVjVmjZ2Dgo/fcRCAWI8wEzQjJEuy9zlN1vL6Em81t1S1q5BHFgZqcNmelTU66BKWbq/Uzk1mp7RLqClj5nhO7ETpqUgFH70SXtkdES78kdtvir2jGqSjKdWqFZlmXthPhPIPJsgG5+/d2+iN5++xatEiU4NiK5maM40q4qCqq6vGFETOMlFVoXWxy1+JpIVKMCDPv724+ToDhKOcA02T/NoZQVIRpkNrASU2VrZXUt7NVHOqit+wtqLsQJC88oyh/NP1dKn2vOU7mYndbi0aT9hcog5bOZ+YkZxaviZ9nfK9QdPNY/3djSHoPEZtQQbL+k8wDu2sUHKQbtRQZo89QIjRVq5lp70HNWlkIdtteyOu8GV7AFZ0PiriIkZ9UGMV1bvL3TtdLOMLd8UbE/z/MY8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55324512-21f0-4664-19ee-08dd6e47ce27
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB5749.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 22:28:03.8211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXBQUvNTHvyR6baZXUVWwg+w0e9VCU3NCeGfdULL035PmrK06Ti3aAhMAVH3ueD4C3RXnFjvMTMSEQE8Jll5tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7225
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_11,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=979 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503280151
X-Proofpoint-GUID: CdBLuTNbBdCXMgpZPuazinxNBN6iOwY6
X-Proofpoint-ORIG-GUID: CdBLuTNbBdCXMgpZPuazinxNBN6iOwY6



On 3/27/25 07:03, Steven Rostedt wrote:
> On Wed, 26 Mar 2025 21:32:32 -0700
> Libo Chen <libo.chen@oracle.com> wrote:
> 
>> On 3/26/25 19:06, Steven Rostedt wrote:
>>> On Wed, 26 Mar 2025 17:40:02 -0700
>>> Libo Chen <libo.chen@oracle.com> wrote:
>>>   
>>>>> +	TP_printk("comm=%s pid=%d tgid=%d ngid=%d mem_node_allowed_mask=%lx",    
>>>>
>>>>
>>>> I cannot find a way to print out nodemask_t nicely here with %*pbl.
>>>> So I fall back to just raw hex value. Will be grateful if someone
>>>> knows a better way to print nodemask nicely in a tracepoint    
>>>
>>> Ug.
>>>
>>> I guess I need to add support for that. Both in the boot verifier as well
>>> as in libtraceevent.
>>>   
>>
>> That will be fantastic, I think this is quite useful.
>

Oops just saw this right now, not sure how I missed it.
 
> I'm curious to what was broken. Just the user space side? Or was the kernel
> side broken too?
> 

That's a good point, I originally only tried %*pbl with trace-cmd, but I
tested your patch without trace-cmd. So yeah %*pbl may already be working in
the kernel, I will report back later today.

-- Libo

> I notice that i2c_write has "[%*phD]" which means it worked, and also
> skipped out on the verification tests. This should be fixed.
> 
> But trace-cmd and perf will not be able to print that out either.
> 
> Now %*pbl works in the kernel (not checked), but probably doesn't work for
> trace-cmd.
> 
> -- Steve

