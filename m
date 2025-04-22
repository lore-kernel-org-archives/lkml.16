Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03429199252
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337980; cv=fail; b=pudqO2mCTAxVVRKh8hJ31G3aYTZtwLOsa2SpIt2qS3hKdCyd8f8KgbZkgkQm8lQ1fycGcFrD4VQhkJgWimVc8CzkIw32VfZmtc64SHnrQEaVt5b4VQEO/hKEtnTXf/3D+wDdtByYRQjLnKJfjWEauz69n9FLdUxe+cDOt30pAiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337980; c=relaxed/simple;
	bh=YTrhs2N/5wP/+MH42X92X0OIkgdqPFdteYZrgvRfmWg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ezzIKGcXbbYxmTmdVdffBQcHiO1Mfm552i13ElIkQvqzbZZk9WnXZ/dw5xCUlwPtiDN+fP3DsA3zxCJaEXUB4LoF0d008nkAc0UgEpw5VEpzKeXWe4gMxsKzrwYVXdllwCTRHQEvM1mEdr3ZmCeL1ADoC/lzE8/LFH09U3qAJxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kzMkmtjZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FC2CFyh1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kzMkmtjZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FC2CFyh1"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MFspJB021996;
	Tue, 22 Apr 2025 16:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=mWLYaFYmKv7t/Vkm+HJ6dl/tuOsP8OzWOIEfvXczHTg=; b=
	kzMkmtjZajXIGLITd9B3Qt+hoSQkcUdCrGtO8Pt7eIzVh/gDp8MISzeAw+NmsoNw
	2ng+H5cWSwOGV5xhjUJ03ZKKJN1yY7zMXf/pszcdEAVtu9q/7QyrI/pzWqaKP36n
	WzKWfU9Ah6gKTZ+EfQ5MpVdWJfaLGMCEpDkXjNN+G4Piqpbw4fAYxdQUpX7blBay
	9+vKtYIWB0IHRemXv4JPOZm+PcsYUuP1YH88wFaBpA8Z9GY/tM5WOZ6o47OYNmHP
	OYfDSdldJKc0qikmZ0Q04QyorzZWqy7RTseKCidvXLQlhUsnc0yMYimZt+ieYajG
	p5OL+5tfIqs32+Yb0LGwGA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4642e0cyy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 16:06:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53MG2fhw021161;
	Tue, 22 Apr 2025 16:05:59 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010018.outbound.protection.outlook.com [40.93.12.18])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429g3pyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 16:05:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5WS8CC/0RHpdj/p8ZKvmmv0Mt0jakuzXAM4BRA5nLiFtkD7tIwvy75TYUYX4HAOvUYTlwpP/BVYWLntUzrIRguSyX59ecuS4piCsRs8JPmPGExRWgdBJdWL2DORFv+k3sZbVZpSvkNladzpr3EoJyKlkzEMNBIATHjnlhFnK9p8x539gzPbvdllwug5atlJfLGhjE/uIT67cfQBdXKNjnY8mqpZRYje4QQwMTgWtC+Ryu552qWeXdAHNGKYKLZKz+sJkyyA+hMtdi4aC6HYujqWptVNbbaH/45UjFUqo7zJFOWY2LIjEM+joiwSqqK+VT8Lh3cUif0XEERviAXClQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWLYaFYmKv7t/Vkm+HJ6dl/tuOsP8OzWOIEfvXczHTg=;
 b=uQlRG5DhWuuOK1s2TeDCBz2E1l4VXANwfk3ysIUmfBmGilquV/u4FlBxlqqhQWCVEVikmfCAWmW50k4TemO6nRVr+e8ygmAJG6zihwFyc3inmk84FRYnjrlizmF8fPRtR0jBcpYx/CiCXVEv6fxpmaummdQsOR70Foi6wXN+UqsIHnmmTRdEU2Y+mus28zyNXamGe9QdA0EB9/Qn85uUo1ohxuXw4SyTLNRfb4THpHsYqX1zvNgU8R1b4TlzAssY+Ey8rO3A8kAIiogwSKckuI3v7lxLvaruzDgVTLCXJYS7Axt2MsF9jb3XyNmAiojpia++HA51oqlsCjUrOV8tcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWLYaFYmKv7t/Vkm+HJ6dl/tuOsP8OzWOIEfvXczHTg=;
 b=FC2CFyh1+/KMYypyA5fbp7bhCx0Hpp7rl4vPj1PpJDxnTcyhUizFnOLISaiYoEAX3w/f9nrQ2CHB4uwQq2h8SvqxZmjxbq2opDgh7d2aoUOfDya5pwg4ZYnTqLxneYlJDwGbJlraUM3qc/mW8ft8CBkP9OL5iD1q2aXhQTCUS8o=
Received: from DM6PR10MB4313.namprd10.prod.outlook.com (2603:10b6:5:212::20)
 by SA1PR10MB6661.namprd10.prod.outlook.com (2603:10b6:806:2b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 16:05:56 +0000
Received: from DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088]) by DM6PR10MB4313.namprd10.prod.outlook.com
 ([fe80::4f45:f4ab:121:e088%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:05:56 +0000
Message-ID: <0502a9cd-d13a-4de0-bc86-3ae0466695f5@oracle.com>
Date: Tue, 22 Apr 2025 17:05:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3 V1] lib: logic_pio: export function symbol in
 logic_pio
To: xiaopeitux@foxmail.com
Cc: andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
        robh@kernel.org, xiaopei01@kylinos.cn, xuwei5@hisilicon.com
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
 <tencent_2BC43E7712D51EA49597D8C9DE5CAE2B5906@qq.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <tencent_2BC43E7712D51EA49597D8C9DE5CAE2B5906@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To DM6PR10MB4313.namprd10.prod.outlook.com
 (2603:10b6:5:212::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4313:EE_|SA1PR10MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 4726a4d6-325a-4a9a-a1b8-08dd81b79092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXZ2MTByTHBEK3dwVGs2NTRick5jMFFqVW1hM09rTUt6cnBXaGEybVRZdzJw?=
 =?utf-8?B?RzlmV1JpbEY1ZDFNbWJJNDJHNU03MVNock9Jakg4cys4UzJiMDRpTWs2Z2p1?=
 =?utf-8?B?TmpqVS9KeVB3ZVlzRlYyRWZnMmJ6MlMzc054RkNScG1zNnZMbk1iV2U4RHZH?=
 =?utf-8?B?Z0VkN1p4OTNYRHNCblFkOFhkZHFKWDUwSk90Q1EwZXhhbEdsNS9kbzFuQ3hm?=
 =?utf-8?B?UWJxVEZDT3daaGFGQjU0Mk1VbGFYTnFDenFSVUZHRkRZUzlsRW5aTVJlRHky?=
 =?utf-8?B?dUNuMGpTM201bFVlMkJnRit5b0pRRkk4UU56N0IxaXRaOHNzODhYdnVrTWt4?=
 =?utf-8?B?b0dNVDBUaGJHUjNzeFVzcHF5NGtIazMvOFZzbDMxRXU3WlpaVnlNSDd6U2dJ?=
 =?utf-8?B?cE80Vm5zVTZhL3FJVW1jY0ovQVB0TTd2WnM2SjUrME92WjVBelpObmdmSmlJ?=
 =?utf-8?B?NytKSTZvdXFWU3N4RVhkSkZoYmoyc1N6MVVwb0ZwSTNHSGNNbzRjSmZ3RlBz?=
 =?utf-8?B?QmxUdnhEQ3NWcHY5M25qa2RTNHgrOFo3dXEwTDdFQnBGcUxkQ0tXWTVFbjlM?=
 =?utf-8?B?QndiaGFuZ1d2K2FwMWgybkdmajdIYnQ2OWtWVWpNeDdoQ0Rqc1hGWWtlMmM0?=
 =?utf-8?B?TGJQbDNndVlLVzhaelk0WUttWFlzVE9uU282YjVkak94Ui92eWFkcnRUUitZ?=
 =?utf-8?B?UjlFbTlEMFBCY0dmSmE1cWxyMjVMQ0RYYnY2K0wrTjk3cERYLzBKYjRaMEdh?=
 =?utf-8?B?ZytlTVpOY1VvblJPbnNQME5Vc3hFYSt0TktYamRsbjVJVlJRWXhoQ29HWUpR?=
 =?utf-8?B?NU81NEIrNjBQclBjZUN0eHZzcWg1L1dJN0l2ZkNVeDZaTHc3MUN1VWR4Sk5J?=
 =?utf-8?B?V00yR0twMENYcXBuc2UvcnUzbUF4VjhTZFM0VWV2WmpzaU9XcmZGdnRISkxm?=
 =?utf-8?B?d094TXRMeVNqalVrVWZJTENZNExPdU5ScHMwZDBhWGp6K0l2NUxHVldDd2lX?=
 =?utf-8?B?U3BHT3c0THdwSGc3Sm9DS3ZRSHg3MFlvMSswazZTRGFOU3RRd1pUSXVBMXY3?=
 =?utf-8?B?UkxHR0tQWGs5WlhUNnlKM29RdzhpUHYwbFU3d3hubkhRMWtBSytVamlSdGFF?=
 =?utf-8?B?TWYyRUxPTklITDFJTEFxUklpOHZpVDBaTjU5Y0VaamdiNlArMWVWQnlXMEUw?=
 =?utf-8?B?U0IvSTJaVHRCcCtuLzdKWldpTkVZS1FUbWJnSWZTam45OHBIZ01abllqbmZX?=
 =?utf-8?B?WDZkOVBod3c3cUw1SmFud20wbkpHbFp3RGVmMzB2aVJvUzNJVlFqeUxOWnl1?=
 =?utf-8?B?amNaVXFiUll6bFBUVEQ2UGJKTlZYa0x4anBLQzg5TVhGR0dOUGJBMmRRcWJG?=
 =?utf-8?B?NFBmMHNGd2tNNGJhRTNJSkF6UkU2d3dqWW9aSnBPUjdxMlp5ZC9Yd2RVUldR?=
 =?utf-8?B?aW85Y3djVyt5cmhKZEdRbmw0QWduTEJkalM3b1RsK0VSVFhNcmxydER6Y2RG?=
 =?utf-8?B?TTBoeC9jWkt1WXZRRmRKcjc2dld6ci9ZY0VDWkY2bGtWcHo0TGNaU25xVWdY?=
 =?utf-8?B?c2pHNnljOEx4NDhRQm13RlVEV1VEVUdNMUl4YVNsSmdoUG9ESmNNVkhOdXN2?=
 =?utf-8?B?SXBCUTJJSTltNjVPalZaZ0hMMWk3QzRNS0dpczVFajRYSElOSDNuckFWTHU5?=
 =?utf-8?B?N1RrbDIzM3lnMXBnRkl2ZWYwSGh3MytPemNGalpNNWtuOW9QZEI2dG8xVUUr?=
 =?utf-8?B?Q2tJb0VEMTB4WWtZam1WcTVxMDlwTS9CNFk5bHVsTVJxcHdMdWgxWkw5QWlY?=
 =?utf-8?B?MXpqdTIxeUdjYWg1R1JFWDNzWkx6SzJqL1oxM3VZT3B5Nk1JcXJJZEtDSFRV?=
 =?utf-8?B?K1UwcllOck4xK3crL09aK0Q3L2xPc3NnOXEvb1pseit6RHA4ODNtT0RQNTdC?=
 =?utf-8?Q?rDUJqyl5rK4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4313.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmVHb1dLMVFLZTdqTHcyUzBRa2V3c2thQ1UyYlZLZlRIKzJJNmpLRFpnWXpP?=
 =?utf-8?B?UWl3MWVOL1lCVUJvbDhkc2ZUWXFuc1IwSEM0NFhpeml1ejA1QlFGMmJJK0hw?=
 =?utf-8?B?Z01JVkZ5Z3NzaTZoODZ6YVB3TnNhUm0rU1pwOVAwd2NpRWczTjZRSEh2S2xM?=
 =?utf-8?B?TGlTT28xQVMrRFRkMWsveEhqTFFHT3JQYmtWU0hQOVczb29WN0tVSUJrOGhU?=
 =?utf-8?B?WVFTMElEZGFKNVNFaGRwY29scXFzNE5xYTFBMUZscWo0bDZ2Q0MzcW5sZmNW?=
 =?utf-8?B?cjFSZzhQTkVsLzFWMmtYQmxmQ2dxYml4aFkwdXVKL1E3VEZYV2NOUXRtcHNZ?=
 =?utf-8?B?VW84Zkw0K0lWak1DZjJHbWxOYW5tenhwOTNhd0xkeEhMUjIrZHFpMXArNXph?=
 =?utf-8?B?NUtZL2ovMmdGc0ZCK0tidWplNGcrU1JjeWZUcjM2bS8rUTZZZ1RyNTQra3VD?=
 =?utf-8?B?TklVRS9ML3VUWVJnbDZNZFlCbDFnWE9vRE5hQXQ5L2NEenZtei9vUThTVkw3?=
 =?utf-8?B?R2o1b2ZDY0cyRXZoY2ZCYkZhekYrd2JibTZkMDZQR29KbExaUml0NFJpcTVS?=
 =?utf-8?B?YzhhVlJidmlma3R0SGYzNGhTVUJSYVh1dTV6cTlTcmhXaGlZenhMTHk3a1hJ?=
 =?utf-8?B?SE9MRHFRNnpxaUlabCtuWEZ2R0MyTjBxbHVsdG1IZ3Z3SjRDd1JnZVE0ajIy?=
 =?utf-8?B?dVpIeUc3RVRIUFE0UmN2VFIvK1gzcHVtbmh2YzM0Yk9aN01VZ1hmaENnZGJV?=
 =?utf-8?B?VmgvQkhHYVhDQnhjcFA2blRPeDU4RUpGaXJQeGhVbU1YTnVoOXQxMXNkSjN0?=
 =?utf-8?B?WC93YlBWWmI5WXl1Zm5USGY4RG1hdi9JTUh0cjJsdG5pdUp0cG8yVi9Wd1Nq?=
 =?utf-8?B?RUNZamJVTEZmeHhUVHVjN05wR2xGVDZSamZ6dTNBdEk3NEpNMkdNYWJEU3JB?=
 =?utf-8?B?eUNQWE8xeTFXRFc3Wm1wWnFnazJmUXlibzBxWG00SFFnMjE4amxQU2E4dTRw?=
 =?utf-8?B?NFJpMUlNR2pRcHhsRUZDRXNMVXJsMFFNclJrYnRiQVR2bjFOWExhNU1oUUhX?=
 =?utf-8?B?VWZOYmw3VGUyRHFyL05jc3VxNEloZnhPWTFJUzA1MnZCREtQTWh1YXkyWTVG?=
 =?utf-8?B?dy9jcEpXYS9VVVFHTU90Q1RXYWN2eUFEblZnSSsxUkVzZzZpRTJGK3NSdmVI?=
 =?utf-8?B?M2JkWFpDbG1NQ214dGlFU0hzbjNaekpTdXBNeXZLMEhiWHpqSG1iQmFjWVlZ?=
 =?utf-8?B?dzM4V0wrS1RZYnhGOHUvcnpjL0wreWF3Zk9NZEVUZTVJK01GdGREQnhlaTFz?=
 =?utf-8?B?N2NFT1dUcXkwdmtYVVF3UW1QZWg0RFdWbG5NWXcyaTZwNmlKVloxZUJjdnBQ?=
 =?utf-8?B?a3k1MS9IWS9VVU5xbUZieXM5UEYrWkw2SHZRQ1Z6UTJvQ3FkWGI4QVlNN01R?=
 =?utf-8?B?VG8vc0R4a01oa0tnQVYvdkg0SkUwWDliakxEWlBIenlDbEVtN25wSGxaRjQ5?=
 =?utf-8?B?NldlRGhnWDVLRGhmSGtIUnBqVi9YdFhNMFg1bFBIS1ZzWlRNOFIwaDU2SlA1?=
 =?utf-8?B?d1pocHBBUWZsOVkrSTVES0pHRHdxZXh2M3JCVXl5ejJzOGp1VUpSTkllWjJI?=
 =?utf-8?B?Q09pWFppYTh4dDdLRUZkaFk4MzJKWDNEV21yUHhvOVhoRDNjS3pnK2M0dEUx?=
 =?utf-8?B?cHphNEVQMlQ5K3krRU9rUHNFMzFVSW1JYllxRXFzMkNWUS9yTXBYRk1nTHZ3?=
 =?utf-8?B?cWdWV2dOUldnNWxBWmNSeTQrZFE3YlBGclRKSngrcHI0NnVFd2l4WU9pVWMr?=
 =?utf-8?B?Z1lxRTc0cFlyVW9HTXdmWnQ3WXluR2ordUdrN1I4OXVFdkRRay85cTNMemxZ?=
 =?utf-8?B?M2V6QVRWQ0hnN0t6cUhNdGw5dkw0VDlad0l4SXdGSjZqVWFDZThwZGZnWUc1?=
 =?utf-8?B?S1BBeXBoSHN4aWdLWjFheFJCeEV3dWlCQ2t6aDh1L3hKa2FRSGZpWHhFWEMx?=
 =?utf-8?B?QVlVNitLQ2MrUVNHanlVVHNkQ3p6VGU0M3A4bTBVVkFyMVpIUzJzRUtEMTBZ?=
 =?utf-8?B?UjRtUFVEc29SNXRCVEZXOWYrMEg1c1BWRWowQi9QampIVVFiMnFyaFRDR2JM?=
 =?utf-8?B?Y0k2VTcvNHMrajJXRnNuZWZmVWw5TituTVRqVVhrY0VhYTlwTXphMERVa0Ez?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kFTwCDY28myf/grnYu8djRk+z7GZSgirB0+55mQk8kqxYLwWcu3xabQHjTHBlgZBXgJxzdatdO5PssV53zse1Rh7mKg+737SNX1Sji2/V42rDhcV9fFuU1XjkNF5jZwaTYsP5vQGn2Mwrbc8A39iLoO9dbNmhZYs+GuMaAcUalQ75b1HGIytKlziIv/ApIDNZunjDJHxY0xpdcaNQzRfRy7+fRZPmeAaYnBUdexkxSbX/wEp4FtPZ5O2ELC8R6m2IYzRhUgAXDB09HNcjKUJIoonO1o1mubGV0Wv61aVH5tHmLyokyRABghempX2xAChKAY52Yq/OmuPdX5O28rznoo9y0gt0ndMowwW3vO9Sr3gV+VW5Rs0lkX9l5OWH0JK1SnJo5vYfQ2j46HDmRi/GHwQpXH3t//IbkvB76LLnRfHEVJch+TAho13f9upfs4NQwPZOzx4bh5+OunvtYxq7VwdyNPBUe8drd/I0+OHJxKrO/o03k69Wpkv8THdLJPWsXapBEghNdhH+l+nP+4Kijka9qgZ2nMaJVbUrMEbcpdXPkniQXuaFnkbdLukl+Gq6LFCEfItbTvZvQ8mPvJUBx4WBuiUdZejKJumhO3dJbE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4726a4d6-325a-4a9a-a1b8-08dd81b79092
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4313.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 16:05:56.6556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkE6Jizrx0/K0kYybKMD5Jhu72DEP6UNjUj5PcQw8oSr/5vim3njjgyiehcvEhyP+WskNr7ofnpubZSacSTvCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=790 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220121
X-Proofpoint-GUID: Y-AlvSh-Cx6aKtrjJbFoGdWtWpu51Q8a
X-Proofpoint-ORIG-GUID: Y-AlvSh-Cx6aKtrjJbFoGdWtWpu51Q8a

On 22/04/2025 12:31, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao<xiaopei01@kylinos.cn>
> 
> export some function via EXPORT_SYMBOL, convenient to use in
> kernel modules in the future if somebody went to use this lib.
> This is one reason for this library exists.
> 
> Signed-off-by: Pei Xiao<xiaopei01@kylinos.cn>

No, we don't export just because someone might need this is future.

And, FWIW, EXPORT_SYMBOL_GPL is preferred.
