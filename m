Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEBC139579
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738648468; cv=fail; b=G/2XYRAERURjDBd2emzFoi8lU7xE16AUwytKxIrBlm6m0Cvzu9Cv+eqEvkL9nr0hHZ6Q+TsqP4HSmn5fRz4xXn3NNktLd0jnwPHRnhOkKtUQJtpoSm4VNZDk9DgMR2oimDEfU0KxZY8zidFqgLqS0wBvZ5R0fUxVVJo9ups2NzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738648468; c=relaxed/simple;
	bh=JYCe9ovJZRg7yHeh158ZNIlDhEXJH0yF+4mmQUbo00w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XnHf+QZuzNiYPhbXm7Vv7JJxCG5OEk0XEdodqzPdJsT9gg7Y8I8KvHWUfHhDtViVZYh1EiWttztDs5+myDC9sPl/HzlEyk3ZotY1agA9a4tREO6Jp9qdzi4XCDVnldR1S5R6qpLlhge0pIOkXddhmGCInWPha9GRu2xsEbFjGeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bm5XAeha; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YweAnS+v; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bm5XAeha";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YweAnS+v"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5141Mx2h026729;
	Tue, 4 Feb 2025 05:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=wVmkLF3+kb39O1Qx7bu/JWjETKqZpM6YGADMuocNkik=; b=
	bm5XAehaSPiqrnhxY1rDqRlP1BhG0ddfSADXAdhnAx6kNWzneLzGZE0RRj1Nwqqo
	LgONniXrFDCj19sjXjoiTwNKTj6nlcG6pNGh+1Jxg19tRCdrugS5ltsXXzcASYv4
	zqGKFlitHfzncYhdHI6ABF5y03i4jFC/nJ9tGNysPn2YboNnAoggjG1AAHguShB6
	SaO7wBE+1JVKzacPqfM7myCS9O8F7MjK9HqJT8N2ReDSsRRwS2cebA9McEUwUbPg
	ybQ00/zaDCt05FpOT85/wVSMh04IwMKgd3GcAP/Ch127I7teN3GaR0St61EDHFnO
	J5U36IWf3N0U49Fd56Pfug==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhbtc58v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 05:54:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5145pDFa030655;
	Tue, 4 Feb 2025 05:54:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8dktgth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 05:54:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JstHfmXQuhEzdr9jlVb9BJL3r1UjwQNvkIj+lJnNeDbNu9iBHjfkvQh5btaHTLO1QP9lWqZRhbVN1kcnphScxC9KNxwe1Jt1324E1FIJosGD11oNvbka+syr+RnVvxVad7dc+HXahytI17wdIh+61j5cThEcoCDuoJVHdrXDeiM+KvVtJ5Xuy/1BobcevJckVR1QW2Tbk0XGIFnVVditegbPZWEBLP+LI038QVgFx0Rt+D3Zj7M1fu87sSp5z5PaGnbjnnqb7Sb66SsLueYd/7LY+RFMMR/aK0dtbKOXGFmsksw7UHm5LAfEOiPrNtTqyWazGOTO9tHFLoWQ0q1FYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVmkLF3+kb39O1Qx7bu/JWjETKqZpM6YGADMuocNkik=;
 b=ajnEpkZMRB51Hrrdk5XH7QW+sM59kya5LuSVWAGh8wh8nmMQ9hM77IYvTVTZozh00zHVvYiSl4rMnJafxDTSR3GIQrQIEuycPATxUGJS/sSTyYdknZ5jf2AyyFbPgesE1D2K2QWuD1m4QWpSzlAlnIHRZz/e1rrecq2FLwVAACUE/WE1AapmxfMz3Aa32zKB3HJq90+Duk+r1qanUgjAMZWl4lJ/Gh0DmfyWlJGpXwly1nV6NX66yfYk5PaY1zZ6abFHGxGR6N0LkijNdMpCihIU3uIPM5Q+hmEqPvGRHLs3s/wRtaZFRF9at1ATKVT71UQCt1FIwiBJVyhtgiSKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVmkLF3+kb39O1Qx7bu/JWjETKqZpM6YGADMuocNkik=;
 b=YweAnS+vG14K8zrGTbgX+q7tOkUsCNiKTRMrvRmuhFtsZxgTR9XcWRav9QuqUq7A5ebBN+HUPol6BTX2mGFxA2dYwfTrvdsfF8hZOzjMhP7sRYdjEZ1FlDkq+rQvEBhIk7b7dLC/ZwC5+1E88w+PFEXZ1+sNGu+9OGCDIt+Svf0=
Received: from CO1PR10MB4468.namprd10.prod.outlook.com (2603:10b6:303:6c::24)
 by SA1PR10MB7554.namprd10.prod.outlook.com (2603:10b6:806:379::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 05:54:19 +0000
Received: from CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::485e:729e:c0a4:e562]) by CO1PR10MB4468.namprd10.prod.outlook.com
 ([fe80::485e:729e:c0a4:e562%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 05:54:18 +0000
Message-ID: <d825b484-9917-4ccf-b94d-a5446ff570a0@oracle.com>
Date: Tue, 4 Feb 2025 16:54:14 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] workqueue: introduce
 queue_delayed_work_on_offline_safe.
To: Haakon Bugge <haakon.bugge@oracle.com>
Cc: Tejun Heo <tj@kernel.org>,
        "jiangshanlai@gmail.com"
 <jiangshanlai@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250113043540.2396426-1-imran.f.khan@oracle.com>
 <Z4VZsFBn13nBnGjb@slm.duckdns.org>
 <eab73ac2-d9eb-4ac7-9e0f-9a02b81a31bb@oracle.com>
 <8715d5cf-1f63-4c57-b855-8abae8debaa2@oracle.com>
 <08fd6f46-1e85-4642-b2ca-17013cb7a9c9@oracle.com>
 <28ECBC8D-FD58-4A32-A9DE-7839BD2A77D7@oracle.com>
Content-Language: en-US
From: imran.f.khan@oracle.com
In-Reply-To: <28ECBC8D-FD58-4A32-A9DE-7839BD2A77D7@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0018.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::31) To CO1PR10MB4468.namprd10.prod.outlook.com
 (2603:10b6:303:6c::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4468:EE_|SA1PR10MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 88716a43-3fc7-4e91-92eb-08dd44e05d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFhrNFgrcG5VUnlEbkxKS0svbWpvSW5NLythdit5M1hqcXYzOGkvQkdJbHJ6?=
 =?utf-8?B?YS9rRTN6MzBrUDJ1RDlUZTk5OGhlU2V1Tk5kOXkvalNyM3dDZitQWTJmTGhm?=
 =?utf-8?B?WTA4Qkt0Q3hteHdjaVN4YWE4Qyt6UENvbWNOQko1cEN2YWcvdjdvbGcwU0h3?=
 =?utf-8?B?Ti8vbVpjaXlkMlRUQkJ5aXNBN2tpbG5IYlVUajhjS25uSWhVYzA3VmJJWWZF?=
 =?utf-8?B?TGVzdUl5TmZvZkVRQkI3MGJDdG1wVjUybWYrVEpHZWl2amNtQ3BIb2NwNGF4?=
 =?utf-8?B?d3Nqa3I0eGFkQzZrQkJKcXhTbHZtcVltS0N4TmxOT1pwUWhpM2lLMFFqNFkv?=
 =?utf-8?B?YU1pdmJ5Wk00US84Z3IxTEVieU9BeDBzUm1NVHBQeDdDalVmTXloeHlLWGNn?=
 =?utf-8?B?NnN5SFZ3SThTaFFkUmQvYWRpMWYxb2VLUm1vYzhLSVltajRzMVF5ejdqM2VR?=
 =?utf-8?B?TFB6VjhvUnV4TmVDd1ZSQmV3UDNtcnhsUmJhaHFLV1RvYnJUbTFkQVVLdkxW?=
 =?utf-8?B?VVFURDRqZ25USTlIc1NERWxMakZETWFURGpZb2RLTHVsejhkcllxY3RIUWJZ?=
 =?utf-8?B?Rzg0bFZRL1VldWxuRG9HY21Pc0g5bjZOVThZai9ZMSsyT1MzRGpQczdLYzB3?=
 =?utf-8?B?UDlLeU5PSFdkVmVmTVd3VFRhN1Q3aFNrZzBTMlRvbkxxQm9jNkRPWm43YVVq?=
 =?utf-8?B?K1IxOXkvWUQvYTVsaTNEd1BCQzBESDRlcjdFTEdBODVJSjZnajV6MjhTZTN1?=
 =?utf-8?B?TGFwMUVlUE4wWUM5SGVkTDNId293bzZaSmNWQ1VRaTJTNUZYUjVCTktjbmlp?=
 =?utf-8?B?LzlkOTA1QTl3THhuQUorYVo1MmFseFl0SHJiZFNvaWNyTFc1WWNDM3cxM0lU?=
 =?utf-8?B?REtCL2Rmd2dtU0dMU0FrWjcwMXZEemNNS0I5blg1aURVT01SUVFPL2dTRjhT?=
 =?utf-8?B?aW05N3hJUlB1Z0VodzEyRU4vUkdZVzlkV2pXQ1NnWkIzS1BWd2FaODJzekhH?=
 =?utf-8?B?ZHhyRVlPYzB6dFpMNnlFR3VMVlM5cVBLSTJlVE5JV2d2RFpYM0QrcUdOUHNO?=
 =?utf-8?B?QlNLcEdXbnFhQWhQSWZyR0dQc2tEVGFRUkMxUUdoS3BhRktkQStuTnhpc2ly?=
 =?utf-8?B?QkxnSFJJMW84RGpTa2ZEeWFFN01ISVRMK09lUG9QaENQcEVjRmVEeU8zdVhK?=
 =?utf-8?B?TXlSMkpCY3dCVGtKcHBXYmtIcFRLV1RudHBHN0tHU1B6QjlVMytvOEU3SlpS?=
 =?utf-8?B?T002dXVqbVBMZ0F6aWRXMmkzdzFNL3RnUW5kcHcvelVnVjdRQy9NR0NmTitn?=
 =?utf-8?B?RDFadDQ1ZjNRdWF4amJLN0dkRzltRU9sSGJVc0xEb2tGRjJ5Zk1GZ2RjVm9N?=
 =?utf-8?B?cFhuVVNlbkt2dzNRUkVJQ1dmYUU4S01EYVUyckdNcnhTMEQ1R3dGSnh4VExX?=
 =?utf-8?B?Qk91Z2VlNVBSSHdIV05yUFBIVlRIZnFvMXo2OTNETng0S2c1N0ZBVU5Jdzk4?=
 =?utf-8?B?YS9YV29jTW5IWFhSaE1RWkRFYmhVL1VzKzV1YVZoVE04Rm5tQVA5aFRrRTlI?=
 =?utf-8?B?WUhXQkhqbkRaU1R0c2k5STE3SFdqOHIwUHlmVnRsOHZhUmFoTkRtYnhoYTJz?=
 =?utf-8?B?V0FYam5yb3J5V3UxaXBLMWlwYStQc1gxVGVjRVhQNGFRN0p5WVc1bjdrVVJS?=
 =?utf-8?B?SnA1eE9LWERVRUorQUFILzc2aUgwQzNoMlRnWUVJenp1dW1rWnVQTWdvcVZ3?=
 =?utf-8?B?TkExaTg5UWtyWjBEa2tJd3p1dUs0aEgybW9LVVYwL2Y0NWVSeVh2VHVoNTMx?=
 =?utf-8?B?Y1pEM0cvQWtHT1BnVkhBMWVVN09qZ25UZXVZeU45MGg1Yld3ZUFRRzBwUzJT?=
 =?utf-8?Q?yROi5lF3atHmy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4468.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnZ3NzliRFpmZzg0dTY1Q2lPd1d4RnJqbVR2ZzVDcVAwV2k4dC9jSnNPZ0dN?=
 =?utf-8?B?ZlBSaVpYUjRub21kUlBEZlo1eld0M0xEY2NSUlJ1Y0N2WXJ0YVFpNWdGODdC?=
 =?utf-8?B?aktRTUt5dis2ZytYOURlODVIenByT0diL1o0V0VQSlFlOTdoQVhCNUU3OWpr?=
 =?utf-8?B?WmZKUHFlQWoyVFdEbkhpSDNSNTNXcC95b0FVQjNES0NtMHpnM1B5a2hybGZV?=
 =?utf-8?B?d0U5eFRGRzArWUp0RnlJcStndXFxcWRDa0s5UVQ3YWlaemx0N0QrU0Zlcy8v?=
 =?utf-8?B?eTFRMHl6OU5uOWt5UU95QWZTRGtyYkNqNWFiVXQ3UHNSbC9NM0FVQmZXVDVw?=
 =?utf-8?B?d3h6MXBRZ0FSNUlSYkxQOWNyTTZTMmFlNitmanFZbDJkbHFDaGIxTEh1T2g1?=
 =?utf-8?B?NG1nTG9LWU1OcE40UFdwQzJVM0FqUU40bUxNeHFKZnlXTktRSk0rZ21tZjUx?=
 =?utf-8?B?R3dXZlJuR0kzSldZR1JycFdHYW9TYUljc2pTOHJhUi9iUVpyNDFOY0VDMHdy?=
 =?utf-8?B?VG5LdVl3VDczV3F5eWxzKzFZSkV1RFpDY3Z4dGNsd3ZyTEtqaG15OWJsZWdj?=
 =?utf-8?B?Q3ptOEU4VHpIaWhmc3pZd3A3Z3B3WUZERTNnN1FETkhDT2RjL0ZYaDBRMTdj?=
 =?utf-8?B?eUR4amE3T3JaNk5Zc2pRUjI0MHFLRm13cFAzWDQvck1TVWtqQThaS0R6VE85?=
 =?utf-8?B?NmhwdWJRSnVmMWxwZlpqMWJSdmtpZDNYMlVuS1gvRXVKUkIvaVNZdnN5SHJK?=
 =?utf-8?B?YTJnNFZST2tOM254T1R4MWdhc01uekxOaExYMXhiYm9QTjYvbUFVMGllTmQ3?=
 =?utf-8?B?cEtWazF5dERFd1UzdmdpY25PaHNNLzdUcjdMRHlDSmJ4a1IwdlZ6V1FRZis0?=
 =?utf-8?B?SFEwOEY4ZWtRNW1YR3hEQ1FNWlAwSDlKM3h5MDRkcjI0QUlEVTFRbm5abU14?=
 =?utf-8?B?N3BwaVNwa1F2QTJxZXBPZlNYa1UyNWN2ZVhRL3liZDVkSDJzQXIreVp6QTRK?=
 =?utf-8?B?eGtSeW1YNFFvanFBdEk4Z3V1Mm1FMDFRaFNUUU9oQy9zdEt5SWo4dnBnekVj?=
 =?utf-8?B?MXViUWdwZkpNbmQzOHpMUkcvcjBMQUNPSGFGZGFRc3dJRmtZZFR6WWpQQTdD?=
 =?utf-8?B?SWlFN2tKNXE4bkx6S1N3eERKdHFJUERzMTFOU2lkdE1rUE9LMWovWFRWT25k?=
 =?utf-8?B?ZUhydi9vUWk5UExtY0NXRTVYbUJGdjZicG9wSE1XTm1JZVdocWJPMjN5aWJJ?=
 =?utf-8?B?Vkp0YTlSWWdlTlZpZmNMb09tMkw4ZHpLbnZUTXFrMy9zaUJlWlJXSDR4eGhR?=
 =?utf-8?B?amZoMnBLdlhKZjVINm10UTBUSXFSRDNXNzEwQjZkaERTOGVuU1hGZUwvazAw?=
 =?utf-8?B?ZjBpMkhlSzNwS3hNbm5hV2lUMjcvZTQ0eVdSWlRlYjdEZzJMS0s3NmE3ZTUy?=
 =?utf-8?B?NGtycHBTVS9XNzFtWnVpUXVqaTMxZDJScG1BVWs1MXJtMFAxWGJoMjExYmdU?=
 =?utf-8?B?OWVjZ3h4OWY3VnpiV2dQdmNnMG1vMmlzZFhWT3BwdEFLd0JvZTRmbVo1Qlds?=
 =?utf-8?B?eVl0Q1pkQWVJWFVXcjdoVHZJd21vbUFNTGU5ZHljanYyb1NRdWRpV05Ub2Uy?=
 =?utf-8?B?alZMdDlHY2NuLzBpREM1dERXWEpMWWR3c0hOZ0psQWw2K05lSjJOVFFxcm9V?=
 =?utf-8?B?LzNBZ1ZCdDNCTHJWa2x2K0JhUkNUeVhwMkVkclplVjhsRWNUQWdYSWQ4VmdK?=
 =?utf-8?B?MDB2SnRQRTNJWDV4UG5ZdWU4L0hMWWtBZHc4SDMrSE5wWVlST2t1Z0haUDhT?=
 =?utf-8?B?UElOZXptU0x2bnNCTXdqZzh4bEtnRFZrZE9RcHNmckZRSEh2d0ExRmhKbldS?=
 =?utf-8?B?SE10ck40QUpvcmFud3dtYUZFU0hidnhabGhvanpMNTM2YTV4dDRxZTdjUFZB?=
 =?utf-8?B?R1B4UVFxYnBqRVJkZCtCSUpJTUh6anVzY0Y0a1NQZVBlSHBzckkxUFdEWjh1?=
 =?utf-8?B?bUhqYklGeEpkbVN2NVRCdFpKck1MSmdNSC8yYmJKYTc4UE9iVTFSZnF4VGd6?=
 =?utf-8?B?TG92d3dMQ1JIYXpOdHRSYldCaEN5V1RkWnlYajBnVWo3VVFhclNEbHJhNjRk?=
 =?utf-8?B?SC9iRzhXWGFCdU13MlZ2d2hWaS83dStkRnpyekVvb0o3dFJ2eTBib0pHMmcy?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ExKVXTTpC1oRLvCPUUEr0QCTUTV0ar5+04Yf7Jd0X8y03JNUhk3XPOE643fWHEb9cBg/nlRQz5Yxv7yM333nHhkLSE5ZFEyno85zPRgYy0Cu54Fs+tf10+OkeuQOpTaz66c7IXMyUPZuM60q6BiZW/RWAGcDCNCI0P6zSG7NQ/bcCA5S1mAa9+tlkyagMJm+Gm4NtBkUKcsOedufuuz0CWCap0m2+px3o+X7NyAxRZDw87yMJOY+b5ZL4Is5ec7Z52tbcrTH8BWOt6+lRcw6Lgu/uWFwvHiunxzgV7kPp9MHQHByBgCazNAq8SHgOTxtk2wV101zmzzohUu/J8ny2NPES7p0gk/vLcHxXznHyY/VZQ1peV6aBfkjIRYessxHABFLPTl8Ori+wePjhtpCCt/oKlWPGVaXIDu0Oq/VMTxNDyZC2rP2f4bzgQILnZDpSSCEwVFD0HEs3T/BhGkYkqTUYgV0OZGeV6jdzSfj9AlOOlD1FixK6283bSQNboatL4F4vWoSN/leekBKbtgzJ8KpVSvR6NyyRkN8P3tgEcyby4Yj58lUTufPHHlqjMoyxz2ZshN3ph2ZiQd8l6d0y6uD5HG1KrR9tOCgfVcHZuI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88716a43-3fc7-4e91-92eb-08dd44e05d65
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4468.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 05:54:18.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4q++4bf5xnV/NON3mMtCBUroabF2+4jefhokGApQEfRLLrzVpIaE9YQm0/yce+eT2wTwGePAeN8aZf+RN/Jvtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7554
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040046
X-Proofpoint-GUID: 6IKo56zA3cD9QYtpoDW6t7F8HzoYQOva
X-Proofpoint-ORIG-GUID: 6IKo56zA3cD9QYtpoDW6t7F8HzoYQOva

Hello Haakon,
Thanks a lot for providing your feedback.

On 3/2/2025 10:48 pm, Haakon Bugge wrote:
> 
> 
> On 31 Jan 2025, at 12:16, Imran Khan <imran.f.khan@oracle.com> wrote:
>> Hello again Tejun,
>> sorry, just found one mistake in earlier shared patch, it
>> missed an unlock done below:
>>
>> Thanks,
>> Imran
>> On 31/1/2025 9:37 pm, imran.f.khan@oracle.com wrote:
>> Hello Tejun,
>>
>> [...]
>>
>> Could you kindly let me know, if it would be acceptable, to have
>> queue_delayed_work_on_offline_safe, as a wrapper around
>> queue_delayed_work_on, such that it can check and ensure CPU's
>> availability. If it can't, then it can simply return false and let
>> caller decide which cpu to use next. Something like below:
>>
>>
>> diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
>> index b0dc957c3e560..57f39807f3bf1 100644
>> --- a/include/linux/workqueue.h
>> +++ b/include/linux/workqueue.h
>> @@ -589,6 +589,9 @@ extern bool queue_work_node(int node, struct workqueue_struct *wq,
>>                            struct work_struct *work);
>> extern bool queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
>>                        struct delayed_work *work, unsigned long delay);
>> +extern bool queue_delayed_work_on_offline_safe(int cpu,
>> +                       struct workqueue_struct *wq, struct delayed_work *work,
>> +                       unsigned long delay);
> 
> Hi Imran,
> 
> 
> I am not quite sure this signature will be OK. See below.
> 
>> extern bool mod_delayed_work_on(int cpu, struct workqueue_struct *wq,
>>                        struct delayed_work *dwork, unsigned long delay);
>> extern bool queue_rcu_work(struct workqueue_struct *wq, struct rcu_work *rwork);
>>
>> diff --git a/kernel/workqueue.c b/kernel/workqueue.c
>> index 9362484a653c4..7d3b8050422e4 100644
>> --- a/kernel/workqueue.c
>> +++ b/kernel/workqueue.c
>> @@ -2565,6 +2565,37 @@ bool queue_delayed_work_on(int cpu, struct workqueue_struct *wq,
>> }
>> EXPORT_SYMBOL(queue_delayed_work_on);
>>
>> +/**
>> + * queue_delayed_work_on_offline_safe - queue work on specific online CPU after
>> + *                                     delay,
>> + *
>> + * @cpu: CPU number to execute work on
>> + * @wq: workqueue to use
>> + * @dwork: work to queue
>> + * @delay: number of jiffies to wait before queueing
>> + *
>> + * a wrapper, around queue_delayed_work_on, that checks and ensures that
>> + * specified @cpu is online. If @cpu is found to be offline or if its online
>> + * status can't be reliably determined, return false and leave the decision,
>> + * of selecting new cpu for delayed_work, to caller.
> 
> The return value here is ambiguous.
>
Agree. Thanks for pointing this out. I have modified this patch,
as per your suggestion and have sent a v2 of my earlier approach.
Please see [1].

Could you please have a look and let me know your opinion.

Thanks,
Imran

[1]: https://lore.kernel.org/all/20250204054404.268888-1-imran.f.khan@oracle.com/
