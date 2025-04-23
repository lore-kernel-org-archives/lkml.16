Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5FB244196;
	Wed, 23 Apr 2025 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399457; cv=fail; b=YhGzKywTS9Ca1pP/HC54FawyRYHuk7gM61jV5zTr6WHnoWAJ2mEdaXIyB69USW3VaZVqh2LbXi6y0T/KdHjDvwDl0vfrOUnJKiAY6DiN0wbH1vxXpJGMwIccfR3tyLvzMfKvSwGF1OkFvX6eG+3a1agklrV7KF3fOz2d6AgxYMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399457; c=relaxed/simple;
	bh=RoiIq8KcPsS7AhkpbqxaxG4CR690fj7piFb2D8OigGQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZhsL7K9Z4OJVzzKKN+sEfAqM+qIdtEso8sfcHSgbZ77D2qz+fl+n/yfkCnJNuAEXqESlVzhFsDgEsX4Wd0xlxedwDZYzW/Z1ddB6cmjR/fR0izPHBK7w6PFswD0a6PDZKEkqJAssKOnA4s7j7ydQsCdJmQ6GMfkg9xfLCdIqcEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m2vKfkXf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZWXQoIXu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m2vKfkXf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZWXQoIXu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N8fv1D023977;
	Wed, 23 Apr 2025 09:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=QsnSWN79axfiHUL6S9L9GGRckrprlmHTuQ9AYW5Sg4U=; b=
	m2vKfkXfPbrQPYcFA86zH1EUkeehpTe10hSU6yojUexZIJc941CMqrlEDENNf/Z8
	6b4nFiKuiMND8Vy+fJZf2+dy4VI+/vduNq+CBcTK2dHQ0G+jy9PcuU9XRCyiZXtP
	E1Hn4lcXXrRRPjcvwIVKQHoW68STOBsoymJHQ+2RSxsPdWJaV36SuzSvbQeUhtSH
	lrAxNxLsiDuKYo2XCQaaSr22ZC5s+m+JwvqyLaVfEle7sgHW/FTkfMHCwG5OuHAk
	UJkMc1haGR2fyA95k8f4qgr7uXwCQArxE4ed16lha6P9lHxeT0CNYyT7Wu02w+gk
	QUcOBc9QqJbYBxQTGmvmGQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 466jhe0t1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 09:10:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53N7oHu3030939;
	Wed, 23 Apr 2025 09:10:50 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazlp17011029.outbound.protection.outlook.com [40.93.14.29])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466k05jmtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 09:10:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nez3DwkC+K3H8pRXPe2TLZjy/e7b79cyn/rZms3oKE/Sb6OovdctMwSVNo2U2wiS5ADyAeSGucLLiPjz4fZZ+sxnG1bl6dvn3aHlVGoFxq2AIVx5U5Sx10IOzbngJqu22rZSOcz0V/D7tg9iclUq7XBQfPSW6KxLzBhTGfNi0a1a67mxBUK9Vgo4DLluft/o8TIVUx9UdwDzfhPJrgY4Qnw01lz0Cnx822gJ3v4Bp5WU94ycyBIBCfKXbzd3AqoYFlJdYIcUKD8mFEXyc9lAVSM+tsOZcVD22vnUQpGdQzcJ/dJrKUVoPQQxq9S4tMOUZ6a+h6UGjkdPeIF9M6lJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsnSWN79axfiHUL6S9L9GGRckrprlmHTuQ9AYW5Sg4U=;
 b=neylgRrN9WpoWY6cc+8Y476zSF7l08YwziHTUIE2NaY2jxxb/ANZtX5Qo/A3bKtm9vvHUHJLVDSLEsfNV1+ymyXf2KLRVW4ThVPQXUv/cun4twtUP/4uIHDHoRGfcVglx08nwTfEtgmIyMiOygEZu8SA+pJlD0erF0S2OvTAVbx7PKffLOrBzfCdtYXMn8bZca+aZnb7ZuL3tVi/PD8/+Tfk2TADavRA3bxELK9w1IJsBKbmQZbomiGI750gcWRulfX04EA/EpJJZJuaEbnyZbivbDyXxnMF5uTH/HrfBV6QYbemOTwTY76fD7so2RZJwOApyQcgl+aZddY+AdF4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QsnSWN79axfiHUL6S9L9GGRckrprlmHTuQ9AYW5Sg4U=;
 b=ZWXQoIXu3CGrprADSsUOLTVb9i1jmQ+Yth72kv3rhPMieyssWsascq/FsI316OpVGFVoBMjy+dVn6Ivu8CQFHXXxBbD2o5UtAEK3rxAsF2TZSegvF5suFyU53N/yyqxfBWhQBvBdm9Zdu+4y2pgcxuVYpbE6WrO0zVKLHk5cwx8=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CH2PR10MB4120.namprd10.prod.outlook.com (2603:10b6:610:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Wed, 23 Apr
 2025 09:10:47 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 09:10:47 +0000
Message-ID: <7b09613c-2aba-469f-bc33-358b787e29b0@oracle.com>
Date: Wed, 23 Apr 2025 14:40:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] Documentation: admin-guide: pm: Add documentation for
 die_id
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250422213427.1943328-1-srinivas.pandruvada@linux.intel.com>
 <20250422213427.1943328-6-srinivas.pandruvada@linux.intel.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250422213427.1943328-6-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CH2PR10MB4120:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ff130d-a9b1-444c-b005-08dd8246bc02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0J6NTliUnJyL1hyRHdwV2svMVM1dTBjRXpOVUdNZUJlVkZJa3hwV1NGRlJ4?=
 =?utf-8?B?eVlYN2kwK1k0VG4wcnU5V3czcWdCNk41MGFoRFBzbENjM1EzdHV3VzBQOWZp?=
 =?utf-8?B?cURPRUdWVXdKaUhxYjFtZnVpcUwzcy9LUXNOZDhQSUdwcG1rWWV1NGlvVUg5?=
 =?utf-8?B?M3lHOVJGZFVYN2hJS1IzbXB4cGl5T0QwWnJCMWpkY3B1SXp5dHNneUxTb1hn?=
 =?utf-8?B?WndlVVNCU1JuVk8zOERKQUlmRFkxTHhZVVNIMkhmbHd5YjBHRzFLVDVXYVky?=
 =?utf-8?B?K0RpSGduQlRoNzlnKzh0M3Q2UjMreDhBWEw1N3VYRytNd0o5NzBaZHluSWFw?=
 =?utf-8?B?RUlFcndZYTFSMi9xU0tkUkFJMHRUYURzTDV6MlEvRFZhMDR2SmNWMTE3NnBZ?=
 =?utf-8?B?dk0yWldjWkFlTGFnZjNjbmlPWS9GZzhCTmk1aXcrYTYyVDQ0YkVTcWd1YTVh?=
 =?utf-8?B?a3AyU2g4TitIM2l6b1ljcHFkVkhZckZ4VTYxcGJrUkZSdHk3STJ6NUVLVVps?=
 =?utf-8?B?Y3E0NG1GWVh5NjcrVnZ3RW9ZN1haZnBpcEUwa2tJTzErRGtTbkxFeElsdkFy?=
 =?utf-8?B?MkVYd1NsNnV3NHJnNVZiVFlhemQ5YmVNWXFqSnU2ZGZpK01TVjQ2Q1Voazk4?=
 =?utf-8?B?ODAwNlFob05yL1B6NE0wRVZsVzZ0NU4rcFkzandsd25JeUlJcTZnZG9idnRS?=
 =?utf-8?B?b0ViQnl6ZXllY3JlclBRdllWN3YxREdhaU9LNlRVVWV4VVV5MFVCTnVvM1py?=
 =?utf-8?B?QjZkWTdDZjZsamxoTzZIU0k5VzJtYStNUmNGdVA5b1YzL3RsTmd2Q1FiQzhJ?=
 =?utf-8?B?eW01Nk8ybVptMml4bDZWNVllSXRsTjZHaldtcFJxSmtQaFRjNnZEV05ORjBQ?=
 =?utf-8?B?MXNiRkRWckVScndOK0swSE8rdExQRjByc1BYclA3STErVjNDai8xaFRVbWdu?=
 =?utf-8?B?RWt6VkNWdldISWl3Q3lqUGdwZ21UVGJKRGF3cjhnS0xqR3kxSmRTR1VkeTFo?=
 =?utf-8?B?KzVmaVpYVCs2QUJqVDVqdi9aSnhDVFNmRjYxNzhjTGlFTTZPL0xxQ0tQSVJo?=
 =?utf-8?B?ZTErNHBxd3V6ZzdOK1pBWjRyak1jVDFkT1gxNjNGTkU1V0x2bzJ6T1U2aUVy?=
 =?utf-8?B?RWlRYkJseHRud2tPbDNkZ1FUZHAwblcyZUNsYXlTUVBOQnBFSVJCNzkrYXYy?=
 =?utf-8?B?aWEwQVRuTm04ZHlpcjRxZFFOK1BlK1BOT3pJS3JRNzRGcUpqUkpCZk1vdytK?=
 =?utf-8?B?SDZKL1JRV29SdWtWd0ZDR2wzenlOcTNFTjJSMTR0c0dOTVpLNE42OU9Ka2RK?=
 =?utf-8?B?V2dOajJ2Uno4N3Z3dkUwczBBVWZLTkFMbGNzbEQ3anpBNHFqdk1jc2JvZGo0?=
 =?utf-8?B?ZDNlbm9ybk5PcEN4VFBEUlA0aXprYkRMT1Y1WUxzdXE1dC9TVGZjYzU1eFVH?=
 =?utf-8?B?ZVVyMmlxTXJ0dzN3S3J4NVdrOUxINnBQVkYyY2xVQjlsRkVoYUFIT2VOS0Z4?=
 =?utf-8?B?UTg0aTVLVXB6VkZhM0ZVM256VEhvU3pTUXRFbFRMRTRJWTJpUjlMNEl4a25v?=
 =?utf-8?B?aE1OMDVMd0lSYmROdFc4Tlo4UTZqZlRkSDFMbjRiQ3FJSnB2ZlpZdWltVlQy?=
 =?utf-8?B?NzloZ0xuZ1pJNFJLeUtwai9zcEIzWUI3VmttbGpQYXpRSTRITndWTmYvV0V0?=
 =?utf-8?B?NHFPOTNuaXJuVngxM2hBNGtHYmpyREdiVnpTYUVOSGtoS2JSU1AzSGRHS0hk?=
 =?utf-8?B?V2x1VlNVUEVKZlE5RDJyeG1ObTk1TTc0bHhMSS8wclRCOWc0QmNCNFJnTmU0?=
 =?utf-8?B?YkI2OWRZVGpSQlFjRnBRZ25nd2YwbjBaTmg5ZzMyQkp6YjhMb05Zc01PVWZZ?=
 =?utf-8?B?NkY1VGJ5ZEY5TFBMVSsvc2t6WUhJUGVidFlLd01GZlpHblE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZExJQ0lXUnFrM2hKd0I4b1dhVWJZUkFwNTg4MURlbWhMbGpkMVhFblRlNnBE?=
 =?utf-8?B?UHZIZ1UvTG4xdHpJTWlYeWd4RFRKanZXYnpyd1JIYXd4S1dtKzZUNEZSL0Qr?=
 =?utf-8?B?TFVHS1pRdkprU1BsUVFLSjNSS1dQeDRkc0ZoR2ZCNTFyb1RoZnpGcWdrYXQ4?=
 =?utf-8?B?bkxWMVRpdWRXM1lyMVpOOE1ZaUtmTXZQUk8xVnQ0U3kzUjFvc05KUUdjeTBH?=
 =?utf-8?B?SG00Zlk0dWgwdDh0NVNqc3ZUZlArOWhITFEyT0FZbC9uMzRQL2djREtoRWI5?=
 =?utf-8?B?WS9wVGZOTEwrTHNINk1VL1o1dmpzOVJjWjJRdlltcEJWNmpvNWRPK0RJbDh3?=
 =?utf-8?B?RmVGbTlIUVpUSGtVZG0rNXMxWHB5alpkODIxcXJGUkdnQm5ZdzZ5ZjVMSE1F?=
 =?utf-8?B?bEI2ZnlldXkxWDVuRTcvM1hjRjhJWjJDcHI0WTJhK1VXMWttVDZnaDdoTHE4?=
 =?utf-8?B?SG92OHBNbTlDYjdxQi9nc25iV1NKQkEwQkliZUVvb0xFOU82c2NRWU1XVEN1?=
 =?utf-8?B?M2Q3eDdScVRmNG1YL01tWFlPdndQd3FBU3hNc1VJWk1hWXUzNWhuWk44eCt5?=
 =?utf-8?B?UHBFd2ZJMEREWUNsSjBQb05qUW1NSnk1ejdpNGZndjJXUXlGV2p5dXRFeXI5?=
 =?utf-8?B?Q1F1QjBjQXE0amV5bFZnV3l4dWFGZDZGRTVJOGcvTjgvTlZOVFprUzZxdDNo?=
 =?utf-8?B?NTZva2VuUEdnTGg0V0NTSnNVcTE0cUxGRlJ4UUJmM1lmaHN3dE9nUW1PeUF5?=
 =?utf-8?B?Vld3cVArcnNLMm90NXBSWWpRUFZ2a2xMWGNGbHE3SDBSTmRrdnRqY3J1enNw?=
 =?utf-8?B?MnY2UU1Ma3hXQkpjcXR4UDJLL3RwaFpqVUdLeFJXTmRIaTh5d1g2QXEzUXY4?=
 =?utf-8?B?N2paSE0rYVlvclI3aTkzMjV4ZThreS9jam9nZlprVkZqZGJZQXpsTTlnd3Nm?=
 =?utf-8?B?WHpidmZtYXdhdTZWSS9TVmFnc3NKS2NYZ241MkhSUjRMNEdZaUVESDM3Z1dP?=
 =?utf-8?B?Mk9Cc0M1cys5V0ZyNkIrN0YybHY5QnAvbUFHRE1xa01FQXBNOTlLVEo4TitR?=
 =?utf-8?B?TFRnWGppanpaaDFhbERTODRoTGplZVFQdW1jZDJkaTgrZngva3BId2VvdzI3?=
 =?utf-8?B?bk5XelV2L0NVdC8raG1sRlRsb3hNdUEyeURMMnZKMTZObCtFL3ExSFh3SHVz?=
 =?utf-8?B?Qk9TV0xjS3JsbU5NQWh5V01kQWZQTUY3aDJLeDVrMXFKNkQvaWxLajVqTGRN?=
 =?utf-8?B?b1U0dEdnRVUzQlMxMTd6a1M4eDVxYzM5NWNpWUljK2FQc1N5bFJVdCtvYm9q?=
 =?utf-8?B?ajg1V1RtaitMb2tqYXl6Lzc0V09qNU9Nam5XRkFyVHZ5eUxKZVRtdExkQjIw?=
 =?utf-8?B?R0tLT05nUVY1R3ZOUzZZaHdpd3hJbXpkZlVWWkdNZUNiWE12S0tEZnVPaXNZ?=
 =?utf-8?B?UHgxck9QUTl0OWp3azdrL1diZGRJb2ZPeTgwUlBJc3Rpd2FuUVBzY0NVUjcr?=
 =?utf-8?B?RTBNbWg5Z0xaVjIyRU1rc2lndjFDa0lEdDZleFJ0SC9wR3gxRTRGakpmNTNn?=
 =?utf-8?B?MFlkVmkzV3ZCTk5lem9hU2ZFT2tCVS9nODhLQStKckhZOWU3R2t6TXBSSFBo?=
 =?utf-8?B?UEN4c2poalo0S1Q3SWpWcHpBQklXY0t0Y1pIbmIwZ3NKTjd1YTFzUmJuZ2Nw?=
 =?utf-8?B?WXgwbzNOeEFSV3oxcDloaEc3TFk2ZldxNXJhbkhjcmVVbnZEdWNOSmVLOGFN?=
 =?utf-8?B?UVNNUGxuM09mVWhVeWxsVG1tOFEzSlh6UERmUGdiK1JoWmZFbEhHY0pxUzIy?=
 =?utf-8?B?aU51T0t6Z0c4WE5oaldCRzZBOW04enl3KzF0YW5RaWkwai9Ec0lZWFI3cEE4?=
 =?utf-8?B?WWlXWVNjUDlCVWN1aFMxNXh2aWtKaTUxUHl1R2dRb3ZsZTR5WitRdCs4T0E5?=
 =?utf-8?B?ZnlMWU5EcHljL1FOYjVEZGVBeUQ1ZGZ5M3dlMkNXd0RQVUNJeEUyQkR1dzVD?=
 =?utf-8?B?cGNzaUJhM0ZPS1BYLzBqaTM2S1NiRG52d2ZGYTVMNGlvczF0T0pVWWNMZG1i?=
 =?utf-8?B?Q0ZDR0NORmVsaHJtSDFudkxsaUtiKzlhUDlzZ05yUHUzM28yOVMrM1VHSXov?=
 =?utf-8?B?WmdTQ2FGTVE4cjhkSm0zd0IrR2h5d2RsZ2dYYlFGV0djdXNQS1UweDk2Nzlj?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HvkRA5vjJSKNPceOzOdw93IEeBgwkN+h6FkE7BtuVZ3JdDCdgQmondoLu1YV1zv8hAxC4+CpeBT2GIFnbQw2YcGeSDqjUVhaq/hbpcvAVY5+jb4L928+qoD9NQLTGG2cgjpYdCGmPVQSuwmLCFIU09rvNEH8cTlryWCks0vhTY2BxlfNGt1IiCDDnRQfpr1k8SEuK0OsW2oY/9qRdIjbjNPT4fODmxvX6+0HvzKbP9EpE7eVkvNJRnR2yYRQ2aqRUjPGZZbRKJZc4cj9nwhis1dEXXsiYareNmn70DXReTTzUOhqr8MW3TjTLkMfjRTzmpDl3GSeHBAU7UBZ1dB8bOAnbLccDqIhKyVkvEjir9A2gdda0zW363KEYepFNu0P3afcCzrHx5Ve0R3dp2F4H1f3SQTSs/iDDyE8zfcRXdMI50GHSIbG0ZCG0/LKsG5aH2Vkf2rnQsRBYIEZd5CkNhclynq45jKH8fUjiH/+nF8BDsDI+ikQIbtuhC5UTAhYgXgfOetCPY8NRnUxUG2uI1hLTW54jMg2+aoazKr4L34ookwgGiE9DL8xHGnNvJxicBnxfkhX+flw5kBY0JtwuVxhSNCbaT+nMMYIPIYOtGs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ff130d-a9b1-444c-b005-08dd8246bc02
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 09:10:47.8304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gl2o6lFnSwdtNIKPKU3SpYekOxc4P086Tchb0h510ImAbhphpgcaRALRBQIviFZJ4kQs4x0j6ilTEaU7fPKX+wO0pwAZl497YSHG1uXxEkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4120
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_06,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504230062
X-Proofpoint-ORIG-GUID: xFDXX7eWpdP8DkwHULErU-cVPPG8wAFy
X-Proofpoint-GUID: xFDXX7eWpdP8DkwHULErU-cVPPG8wAFy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA2MiBTYWx0ZWRfX11JQlq3OcEPO 3aHTBqNs5iPL4csiyfj7HyNRjdZSlPZ2iNsCp6HMv4/UKutn6cPv0YLAe95ArShHUHOpzR8u9Y5 BcqxnxoDyqtqzWK7f0AtAcZ/grE/SFCW9UHKB4RdEq6K/MZc7NzDDO+MHNRktSHhfToOGNWjL1D
 QbVT1ktTkVn1dgUYKAwb+uQksTUnMSGRlKdDdzS07adsa6cEuu4G4d3OZN/IiadAV74KOWstECH G4+rUZObnUaHCxJNeynnZdfzOhNdNUoRpiZ2hPiywlZjhzzj693QarGEbbGL/jGdgMdC6Pq3U3g ZXe+yBtEdnNm5Xr9MFphYTVt/gfIkOPaBjatRxH3GnbJypVSkEcZhV1JzKdueSREqADl8TEEkjP 86dddIjA



On 23-04-2025 03:04, Srinivas Pandruvada wrote:
> +``die_id``
> +	This attribute is used to get the Linux die id of this instance.
> +	This attributes is only present for domains with core agents and

typo attributes ->attribute

> +        when the CPUID leaf 0x1f presents die ID.
> +
>   ``fabric_cluster_id``
>   	This attribute is used to get the fabric cluster id of this instance.
>   


Thanks,
Alok
