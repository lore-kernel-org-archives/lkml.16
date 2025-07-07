Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28ED218A6DB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751855416; cv=fail; b=eBd9gQGuZRge3Y3hXVXLh+13HAZXXmFDJuxsocpECaW/JdnU43vOi19oABjWEuhxqgO2vW+Oc3MOBXq7kzoJ+2TpfA+E9J/djH+0XQX+aql8X8Xb1S5SO82J/P6v0vcBTXOEyDedMDfM+JHwNBvG/FpY3v3/6CU3CUatyZ1ZwUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751855416; c=relaxed/simple;
	bh=Idesa5RWCbQHxbyKTVLNtL3yoMregcenq9Irhrf28SQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QnMmTS4ZCFkGmqSQbe7jx841GgsNKRvP8N4Q5f1vbOqTGHSZNOvyOMd5CzLsShCw9W3XmCiVhsUeNVeEYm1iaOMhzvPZPdY+Vc4Ibr+AtMYcBzxTU1GMEDXTBZEmOj09QrMV60QH1gyzwMaMtl/i1sVFDCCqQAs8Ho8zrZaLmUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nUgcTiqQ; arc=fail smtp.client-ip=40.107.223.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nUgcTiqQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0tgKjuXX1ETAtil2WnZXaexQq99KRX/haX+8U6Y8EA3/n6LgOHRr1iUw6OMTrb9ZpTHY8Z9we/ZEffa5hkZc17lJc7f33CVvKGp5KJ++MQb3EQvIGp1MnlK6kVnZ7HEpn4siAAH93cCGEQp8scvgCUI10dzcfIYJnxAQz+O5vAScQSkQh5Ebbo0ci2Ol/Uz4tWMuQ7D6/cWz38QPd+QvUodJl6yBxfMkJ6X09LqsXtSJxixayImbbfK03M+OK/gz4d/IZCfW/ENlwuBlHW2xvQtQsDRnGWpgDu/EZkI3S0dZkJEJlngi3SooOyLtJFdwzs02MTEQGM/p/p0qixt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQEpp9RI7+XflyVsOIiCmEDXHIcpLicaG/slQmbomVo=;
 b=cr5XH83VNGxwXp9enCW7THMaCYGsfq1PObuUfVr/StJz6iZY5agN423B55b09PUeGpJ2IxMFEmw71KL9o1qXrPIZZXPSfA5zQcb2BaqgRajis6KVHaejhguhGMsaPercbHKCTGAuiyHtfODoFBxAiMrdlA1qOlDXb+5tuTcnXRs8+l7xfWl+8kNPXc6TtuYIYeFq7gMpS7xZcSVJJ7BbNC5GoiqzTYtXYMMSZdpDR3tcUMKdiRhW7kr9e6FYa0E8pPHf7zB+y8WX5KNzvikxfaR07iezvz+ndYgiRrA8bg9+gztlEAPMGdSnHmmVE3795VDgIR3l8W4kcWkq4yCnpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQEpp9RI7+XflyVsOIiCmEDXHIcpLicaG/slQmbomVo=;
 b=nUgcTiqQl/uz+J/L5skTDhwBgxbXnQ4fuGsTpuiGB81NXRZ1kkA3tlvT3Dq/QMnpBvhGFyvxeusUJclzSAVHNhJ8nKZXq/xtVW8vDXVYBl/wdLOZA75TwcyRjXFr2xIBjZ+jLIqO7D9/TObzdnCQ/bY/RLUuhyGSHaOjEX5RaZXVZX6ZcAn1PprbJtehvu6VvGbK8I9J/+K4/DbQSKjuH7zW82JbzJa4W6Rf4czTRu+oCL3KiwT2mMJR7vf8Fi5SQp/m7cTFO9KxNWsmSJNc4r31913ViUHAlTwlCosCGr03RGabk/LcY3a8vCbJeJZTLxnqUt7iXjl0dYlL3aBOKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Mon, 7 Jul
 2025 02:30:08 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 02:30:08 +0000
Message-ID: <0d1e51f3-ccea-4255-9c5f-68e5a41da03c@nvidia.com>
Date: Mon, 7 Jul 2025 12:29:51 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 08/12] mm/thp: add split during migration support
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-9-balbirs@nvidia.com>
 <D129A3F2-D79C-482E-BC70-A26C781B149E@nvidia.com>
 <1a451d37-56c3-4d60-8e06-3abae72e6bbd@nvidia.com>
 <007E2728-5BFC-40F9-8B8F-25504863D217@nvidia.com>
 <aa4f94a3-f601-4379-b6ca-4389421ccca4@nvidia.com>
 <906590D4-04E2-40CB-A853-25FE6212700C@nvidia.com>
 <eab52820-813f-4137-b664-c79ba8b453b7@nvidia.com>
 <2BC37A17-1005-4016-B4D8-85832F75C500@nvidia.com>
 <94D8C1A4-780C-4BEC-A336-7D3613B54845@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <94D8C1A4-780C-4BEC-A336-7D3613B54845@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH0PR12MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: b439a11a-1652-4a4f-9d7c-08ddbcfe30e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEJORzI3czEzTzExU0Z3ckxSWVRPOE9tY0FRZEE0SjBoMURoc2NsbFNSb0Ry?=
 =?utf-8?B?eGIzaGwvcHRhWlRpSDU3Zmg3RS9qT2xlS29XejhtL0x3NEwvVmRiUVlCb3NS?=
 =?utf-8?B?ZURBWU5rZ2RiZmJSdHFjMFdlSTZmWkErWXo0MG5IamJjK0ptdUJ5OHEzWVZs?=
 =?utf-8?B?Q3JUY0IycWE5djNPMVh4U1dCa3RTNGRGaGx3TER6cXRxd0pCV29KV3l6emVh?=
 =?utf-8?B?aHZpUDFhRlRRWUIzWENuMTdZU2FXdWZOVTdHTmJsYnQwWGcyZDlsblBmQXNH?=
 =?utf-8?B?UUpGRzRJZVYzd29YV0RwQjZhT2dudXZQVHErMWlSeXFwR0ZDSUlaZHoveTZZ?=
 =?utf-8?B?ME1qVkhsekVVUlM4ck15R3JGRW9WWDNrMVZWUTFYamNhSitaL2g5ZjRtdXRC?=
 =?utf-8?B?QWRSeFcycHd3YlVMSGRwenBoVGxYRGZ6SDYwWVc5aWJQVHpEaFZnOUFZK2RW?=
 =?utf-8?B?elhTRWxRZWNwenVFakxOdktqUjJNWlNldi9RK0hjU2tmeFMwU1kreHJJYkVq?=
 =?utf-8?B?YmM5TWppc3VRL0ZxYkVSd1Z5RWZEcEdhbXFRbWQ0aUdXVWZHUU5JeVFFRXBR?=
 =?utf-8?B?VGF4dk0yK1ozWFhsZWs5d09jSVIxMktxajcrREttcjZ3bkd4UzhyY2srR1Iw?=
 =?utf-8?B?TEoxbWRWS3M5ZW50aFpUc25BcjRoSmJRTm5BUDFXRnN5UlU2RGJlUGY4ci9N?=
 =?utf-8?B?cFRjTWlvdk55VWdTRWM0ZUMwOG5hd0NFeldoTUxxaGRZdlhQMmdSL3RuSWZM?=
 =?utf-8?B?TjZyYTlmZDRhUEkrRjYwSDNNUzlYRnU4Q2dLT3AyZURsSlRIWHU2Y0xldjRo?=
 =?utf-8?B?VStnYkhoMUR5U09NOTZsVm9QSTBGdVB1Z056eE1nZzdzVEdDb0R1WHE3TjRP?=
 =?utf-8?B?cm00by8yNlRMeDFLUHMzTHhBRUlUbXFqc0U5eUFvalZjMG15YzZja1pqK1hw?=
 =?utf-8?B?bVY3Ynd0NGY0ZjdtaElnSWwxUGpoZHBJZmNxVytCc0dIbnF5Nno5SHluc3lD?=
 =?utf-8?B?N3pBT3JTVW4wY2tOU0t1TWU4Vm1LYVhqb3RCYlBVNmp0dTZFOHhnelhpaFpX?=
 =?utf-8?B?eU1pa01ZS0lMZDN2aGxkTXVVNERFbytGYXYyUGNiQ3c2U0RyV0laU2NoSzl2?=
 =?utf-8?B?SGFaNUxneE0zRTU5aGkyNzBBUUY5NG1WRGtLSWkrK0tUc1pOeEdndzh3c29s?=
 =?utf-8?B?VnpMemRGR0ZacUJGeHJ1NGthdTF5cnlSN3VQNE8wVGVEblRRWU1pb2J5YTVa?=
 =?utf-8?B?b0tMUXEwN0NoZUlEdlE5Vm01Q1o5MzNNUXk2UDhlS2E4YkhncHM4czF6d1hn?=
 =?utf-8?B?d2J0QkdlN2hrLytBdHV5SkRraXUwaWdFaC9XbzJZL1hFOXRuT2VJbUIwaGJC?=
 =?utf-8?B?VGlLWnNOdjJzTEFYSkFVeDJGVzlNSm1wTEJKd21DNXRDbTBXZWtjbXRra0dU?=
 =?utf-8?B?ZE5Nem5icnlUM0tMS2lnenl5WmNVTWRFblFXSDd5R1FrVlVCNU5KWDY5WSsw?=
 =?utf-8?B?cFpVaWVoakRPZFpGdDE2MXNLblJaYlQvWnppWjd5ZWhSWFlDaE9OSnpYNHE4?=
 =?utf-8?B?N3poTkZUeW5ydVV3V29sSWRQcEluQU03QWhqQVFzSFBLSE5zUXNRbWxPNWkw?=
 =?utf-8?B?dU51cmtkV200R0ovS3lxWUd3UTllNm1Oc1dQNjVZZkkwdEtJWjFZU2RJdEJs?=
 =?utf-8?B?ZHVLVE1zMTlHVUpaQ0tVZ0RJOGVHUHJ5TTNsNXFEbGV4UHltY2hsb3dXM2dF?=
 =?utf-8?B?TGZ2bzd3S1FPT3E0WG5vc25vODBCYVFCaGZpTUJEVy91Y0cxckVSbldEVWw4?=
 =?utf-8?B?V2pyV1NrRU5vYmtjL2hHR25FNTgzUCsweW54ZHVXVkgybEswY2JpMnhtdlp3?=
 =?utf-8?B?aDVlMVovS2tPdG5iWXRocXRBRVVpT0h3MzJxSnM3MkxheGdtdzVwZFk0cXUv?=
 =?utf-8?Q?x1l5m0jtBL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDNiYlN4WkpQVTg5Wm1Ib3JTZkJrQVlDS0R3aCs1WWpuVlB3SGRYQU16TFlV?=
 =?utf-8?B?R1dKZWFDZmZybG5ONkNLZTJoVEl2Y3lMaDZ0MHRmUzNvd21aZ2hvVFdybERF?=
 =?utf-8?B?WXVtNkQ3cGY5MXVrVDJnSkNrTXpRNmROWndSdVliUkxINnpmMnJ5ODNUWDN2?=
 =?utf-8?B?cUxuTG1yQUo1S3g1RVJjUGhOaVM0K0xOdzJkby94cEw2dWttcXlDZVIxQ3oz?=
 =?utf-8?B?SkpKUzNxWXRGSnFnd2ZPbEtsWDdjRDI2TlBUR2RuYW1NbzZQc1RCeDgyd1gw?=
 =?utf-8?B?QlhiekxPQWNUcVVYeXBKVmhGd3EzRHN6ZUdyVmVOWmVBQzRVcVVxME1KVzg3?=
 =?utf-8?B?bjE2aHhSdHJaMWxSc2lTc1J3UGU3Z3pua2tRbFZBYTRscVF0bmVSRi9rMTFh?=
 =?utf-8?B?SCs3azZELzBSQ3hFcFNGWDdaOXFId3pPQlJwMkdsUWFsRVhBMTJjaFNoQVk2?=
 =?utf-8?B?MldEZ2kzYkJ6dEs2QXJmZW9FVmN4L0ttNlJuNk9FU0RsbEFVVFd3Q0hYaVpa?=
 =?utf-8?B?M01heTdLblhOd0NjV3RheXczOVRUWXdsNklLb000Q21QYm9Id0c0eUltd1Bj?=
 =?utf-8?B?KzNSc2UzZGt0K3YrSWd0eHFkMlhOb1hnK3hsZDB6N0J1U1lSdnZXQUk2bEMv?=
 =?utf-8?B?Y3ZYUDhPbDU4SVZPQTFDMDdReEhwZWx0K2RLTkZ3SDFvanU5c24xT09Xckc3?=
 =?utf-8?B?MkwvOFlyQTE3RDV0L3MrSk42NlpHOHplY0NLcHZQUVlNdHNzZUcxTm1wNkMz?=
 =?utf-8?B?R01aUk91WHRreG5RSk9OUS9Va0xGdjdNbUxFakVrdE5ZWmRQU3NIbW9LSjJP?=
 =?utf-8?B?QXA1d3BlTnI3WG00Y01rd0UwMStLRnBZMTVUOFJuUE1RN1I4N2w4WEJab3dW?=
 =?utf-8?B?ZjlhQU1TcWlyZzhMWDVhako5T0lsQldaMTNYZ2JMRWMwZWNhUWZadGNrMU1q?=
 =?utf-8?B?LzhIWHVLUkd5elBTdm00YlNHL0wrai9iWkkvWndHNUVWUjVycVJhUDByc1BX?=
 =?utf-8?B?aW5GblpoaXZlOTFPTEtRRUNINWx5WDFiV000d2ZldnhXOWM0dWhYdTZZekNR?=
 =?utf-8?B?eXlFc2hKZ3ZieWZtSFdPTHoxYW1JTEg4SlZwR0dneXNrRUdiSFBCbnhGREV6?=
 =?utf-8?B?eFJPaG1UKzdWMVJjenFCRGI2NUtodzlBSW1Ndm9ldTJGcmtkV2RYYkhQWTVQ?=
 =?utf-8?B?a3hUclE4T3EwZnNwSW84c3VBZDZScU5aUFZ3RmZOc3BWYnJvTGFFQ0c3eUJt?=
 =?utf-8?B?dStMeXd6TEN3OEthMGJDWjBweWIzR0VZUFIvMTF6UktVVGlTK3VvRjY3c0dC?=
 =?utf-8?B?MEpwQ2tocU5Zdy9acUhvd0NvZHdzQnozdzlHQkFzQm5WOUZQdmlCU0pUM09i?=
 =?utf-8?B?RWo3c3l5WllnZjFTUUdtMkNBREpsNEpOazhLTUFicUFsalhjcmhRVmN5K015?=
 =?utf-8?B?T3cyYVMwSEpkcTBYaDN2N01pa0tqcWM1NkNCQklGZTM5STZCTmpNRTdNdkd3?=
 =?utf-8?B?V3BRWFNZUS9rTVMvNkF6TThwdkpxRTQwbythakZUa1VvZ2ZBQU5iQUw1YWJK?=
 =?utf-8?B?WGpleG9WelMwYVJkdkJjU2RudERvb3ZaTHNpd0RvRjY4RStRa08xNEw0Sm1w?=
 =?utf-8?B?VWFKeDZLZ0pkdlYzQlFQRDFDeGdFR0VBSTRBenZXMXFxaXYrM2RtQUVmRng2?=
 =?utf-8?B?ckdXMVBDbDNrUGw3TXVEK0kwd3NCWGN2eTlDcTVCdDFhNDZuOHFaTXRjaExM?=
 =?utf-8?B?SnNVakFYcys4ZWxCa1p6Tk5PQWVCU25wbjNMRXd1WUhOMTRSMm1qZTYyZGd0?=
 =?utf-8?B?dlhKcUxCMm51R1FITzJsbGhlRFg5M3RsUXc0WVpoUzhJSmVReW92NlFETjRi?=
 =?utf-8?B?RUNnd0RVUlUySkpKc3JURG14MFBkalQ2V3o3ZkhPbVV0UEwzUzlWcTBqU01o?=
 =?utf-8?B?elFsak9VdzRvTHpJZDFPRGt2VWo2SzNKQUErNjN1WDZzVlIzN1ljai84Rjl2?=
 =?utf-8?B?YWFYQWF1aUNyV0tKQXhLYW9jRURLMnhJbk1iSE1ZU1Qza0k2RFhheEN6dWQ5?=
 =?utf-8?B?amszU0ZFcmQ4cXB1TkZJWlZzWFpRMWd1bVVKV0xJbk9abE55a0pERHNpbEhW?=
 =?utf-8?Q?Betr6AyJ9xPktDpuEk+MURCc6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b439a11a-1652-4a4f-9d7c-08ddbcfe30e5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:30:08.6149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfqOnaViH5Jchn7YfoCGbKJxaitioFv0nvS4acW81CFoZvLXDuJFl9zbjCydGfEhV630Bxk0kBfpu6eySCj+JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888

On 7/6/25 13:03, Zi Yan wrote:
> On 5 Jul 2025, at 22:34, Zi Yan wrote:
> 
>> On 5 Jul 2025, at 21:47, Balbir Singh wrote:
>>
>>> On 7/6/25 11:34, Zi Yan wrote:
>>>> On 5 Jul 2025, at 21:15, Balbir Singh wrote:
>>>>
>>>>> On 7/5/25 11:55, Zi Yan wrote:
>>>>>> On 4 Jul 2025, at 20:58, Balbir Singh wrote:
>>>>>>
>>>>>>> On 7/4/25 21:24, Zi Yan wrote:
>>>>>>>>
>>>>>>>> s/pages/folio
>>>>>>>>
>>>>>>>
>>>>>>> Thanks, will make the changes
>>>>>>>
>>>>>>>> Why name it isolated if the folio is unmapped? Isolated folios often mean
>>>>>>>> they are removed from LRU lists. isolated here causes confusion.
>>>>>>>>
>>>>>>>
>>>>>>> Ack, will change the name
>>>>>>>
>>>>>>>
>>>>>>>>>   *
>>>>>>>>>   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
>>>>>>>>>   * It is in charge of checking whether the split is supported or not and
>>>>>>>>> @@ -3800,7 +3799,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>>>>>>>   */
>>>>>>>>>  static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>>>>  		struct page *split_at, struct page *lock_at,
>>>>>>>>> -		struct list_head *list, bool uniform_split)
>>>>>>>>> +		struct list_head *list, bool uniform_split, bool isolated)
>>>>>>>>>  {
>>>>>>>>>  	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>>>>>>>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>>>>>>> @@ -3846,14 +3845,16 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>>>>  		 * is taken to serialise against parallel split or collapse
>>>>>>>>>  		 * operations.
>>>>>>>>>  		 */
>>>>>>>>> -		anon_vma = folio_get_anon_vma(folio);
>>>>>>>>> -		if (!anon_vma) {
>>>>>>>>> -			ret = -EBUSY;
>>>>>>>>> -			goto out;
>>>>>>>>> +		if (!isolated) {
>>>>>>>>> +			anon_vma = folio_get_anon_vma(folio);
>>>>>>>>> +			if (!anon_vma) {
>>>>>>>>> +				ret = -EBUSY;
>>>>>>>>> +				goto out;
>>>>>>>>> +			}
>>>>>>>>> +			anon_vma_lock_write(anon_vma);
>>>>>>>>>  		}
>>>>>>>>>  		end = -1;
>>>>>>>>>  		mapping = NULL;
>>>>>>>>> -		anon_vma_lock_write(anon_vma);
>>>>>>>>>  	} else {
>>>>>>>>>  		unsigned int min_order;
>>>>>>>>>  		gfp_t gfp;
>>>>>>>>> @@ -3920,7 +3921,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>>>>  		goto out_unlock;
>>>>>>>>>  	}
>>>>>>>>>
>>>>>>>>> -	unmap_folio(folio);
>>>>>>>>> +	if (!isolated)
>>>>>>>>> +		unmap_folio(folio);
>>>>>>>>>
>>>>>>>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>>>>>>>  	local_irq_disable();
>>>>>>>>> @@ -3973,14 +3975,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>>>>
>>>>>>>>>  		ret = __split_unmapped_folio(folio, new_order,
>>>>>>>>>  				split_at, lock_at, list, end, &xas, mapping,
>>>>>>>>> -				uniform_split);
>>>>>>>>> +				uniform_split, isolated);
>>>>>>>>>  	} else {
>>>>>>>>>  		spin_unlock(&ds_queue->split_queue_lock);
>>>>>>>>>  fail:
>>>>>>>>>  		if (mapping)
>>>>>>>>>  			xas_unlock(&xas);
>>>>>>>>>  		local_irq_enable();
>>>>>>>>> -		remap_page(folio, folio_nr_pages(folio), 0);
>>>>>>>>> +		if (!isolated)
>>>>>>>>> +			remap_page(folio, folio_nr_pages(folio), 0);
>>>>>>>>>  		ret = -EAGAIN;
>>>>>>>>>  	}
>>>>>>>>
>>>>>>>> These "isolated" special handlings does not look good, I wonder if there
>>>>>>>> is a way of letting split code handle device private folios more gracefully.
>>>>>>>> It also causes confusions, since why does "isolated/unmapped" folios
>>>>>>>> not need to unmap_page(), remap_page(), or unlock?
>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>> There are two reasons for going down the current code path
>>>>>>
>>>>>> After thinking more, I think adding isolated/unmapped is not the right
>>>>>> way, since unmapped folio is a very generic concept. If you add it,
>>>>>> one can easily misuse the folio split code by first unmapping a folio
>>>>>> and trying to split it with unmapped = true. I do not think that is
>>>>>> supported and your patch does not prevent that from happening in the future.
>>>>>>
>>>>>
>>>>> I don't understand the misuse case you mention, I assume you mean someone can
>>>>> get the usage wrong? The responsibility is on the caller to do the right thing
>>>>> if calling the API with unmapped
>>>>
>>>> Before your patch, there is no use case of splitting unmapped folios.
>>>> Your patch only adds support for device private page split, not any unmapped
>>>> folio split. So using a generic isolated/unmapped parameter is not OK.
>>>>
>>>
>>> There is a use for splitting unmapped folios (see below)
>>>
>>>>>
>>>>>> You should teach different parts of folio split code path to handle
>>>>>> device private folios properly. Details are below.
>>>>>>
>>>>>>>
>>>>>>> 1. if the isolated check is not present, folio_get_anon_vma will fail and cause
>>>>>>>    the split routine to return with -EBUSY
>>>>>>
>>>>>> You do something below instead.
>>>>>>
>>>>>> if (!anon_vma && !folio_is_device_private(folio)) {
>>>>>> 	ret = -EBUSY;
>>>>>> 	goto out;
>>>>>> } else if (anon_vma) {
>>>>>> 	anon_vma_lock_write(anon_vma);
>>>>>> }
>>>>>>
>>>>>
>>>>> folio_get_anon() cannot be called for unmapped folios. In our case the page has
>>>>> already been unmapped. Is there a reason why you mix anon_vma_lock_write with
>>>>> the check for device private folios?
>>>>
>>>> Oh, I did not notice that anon_vma = folio_get_anon_vma(folio) is also
>>>> in if (!isolated) branch. In that case, just do
>>>>
>>>> if (folio_is_device_private(folio) {
>>>> ...
>>>> } else if (is_anon) {
>>>> ...
>>>> } else {
>>>> ...
>>>> }
>>>>
>>>>>
>>>>>> People can know device private folio split needs a special handling.
>>>>>>
>>>>>> BTW, why a device private folio can also be anonymous? Does it mean
>>>>>> if a page cache folio is migrated to device private, kernel also
>>>>>> sees it as both device private and file-backed?
>>>>>>
>>>>>
>>>>> FYI: device private folios only work with anonymous private pages, hence
>>>>> the name device private.
>>>>
>>>> OK.
>>>>
>>>>>
>>>>>>
>>>>>>> 2. Going through unmap_page(), remap_page() causes a full page table walk, which
>>>>>>>    the migrate_device API has already just done as a part of the migration. The
>>>>>>>    entries under consideration are already migration entries in this case.
>>>>>>>    This is wasteful and in some case unexpected.
>>>>>>
>>>>>> unmap_folio() already adds TTU_SPLIT_HUGE_PMD to try to split
>>>>>> PMD mapping, which you did in migrate_vma_split_pages(). You probably
>>>>>> can teach either try_to_migrate() or try_to_unmap() to just split
>>>>>> device private PMD mapping. Or if that is not preferred,
>>>>>> you can simply call split_huge_pmd_address() when unmap_folio()
>>>>>> sees a device private folio.
>>>>>>
>>>>>> For remap_page(), you can simply return for device private folios
>>>>>> like it is currently doing for non anonymous folios.
>>>>>>
>>>>>
>>>>> Doing a full rmap walk does not make sense with unmap_folio() and
>>>>> remap_folio(), because
>>>>>
>>>>> 1. We need to do a page table walk/rmap walk again
>>>>> 2. We'll need special handling of migration <-> migration entries
>>>>>    in the rmap handling (set/remove migration ptes)
>>>>> 3. In this context, the code is already in the middle of migration,
>>>>>    so trying to do that again does not make sense.
>>>>
>>>> Why doing split in the middle of migration? Existing split code
>>>> assumes to-be-split folios are mapped.
>>>>
>>>> What prevents doing split before migration?
>>>>
>>>
>>> The code does do a split prior to migration if THP selection fails
>>>
>>> Please see https://lore.kernel.org/lkml/20250703233511.2028395-5-balbirs@nvidia.com/
>>> and the fallback part which calls split_folio()
>>
>> So this split is done when the folio in system memory is mapped.
>>
>>>
>>> But the case under consideration is special since the device needs to allocate
>>> corresponding pfn's as well. The changelog mentions it:
>>>
>>> "The common case that arises is that after setup, during migrate
>>> the destination might not be able to allocate MIGRATE_PFN_COMPOUND
>>> pages."
>>>
>>> I can expand on it, because migrate_vma() is a multi-phase operation
>>>
>>> 1. migrate_vma_setup()
>>> 2. migrate_vma_pages()
>>> 3. migrate_vma_finalize()
>>>
>>> It can so happen that when we get the destination pfn's allocated the destination
>>> might not be able to allocate a large page, so we do the split in migrate_vma_pages().
>>>
>>> The pages have been unmapped and collected in migrate_vma_setup()
>>
>> So these unmapped folios are system memory folios? I thought they are
>> large device private folios.
>>
>> OK. It sounds like splitting unmapped folios is really needed. I think
>> it is better to make a new split_unmapped_folio() function
>> by reusing __split_unmapped_folio(), since __folio_split() assumes
>> the input folio is mapped.
> 
> And to make __split_unmapped_folio()'s functionality match its name,
> I will later refactor it. At least move local_irq_enable(), remap_page(),
> and folio_unlocks out of it. I will think about how to deal with
> lru_add_split_folio(). The goal is to remove the to-be-added "unmapped"
> parameter from __split_unmapped_folio().
> 

That sounds like a plan, it seems like there needs to be a finish phase of
the split and it does not belong to __split_unmapped_folio(). I would propose
that we rename "isolated" to "folio_is_migrating" and then your cleanups can
follow? Once your cleanups come in, we won't need to pass the parameter to
__split_unmapped_folio().

Balbir Singh

