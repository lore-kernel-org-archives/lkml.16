Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D481F873B
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747265923; cv=fail; b=tYsQIYFedcu2bMvOhUdhSAoxc6Z273PNbKurYgxDaDPSOSCS9tIm2pb7gGawSSRUpKF9O2uAuIL7p8UAIY7euj4N4aoY00w+tYiBrvB979Zts4U2KHJEcwNvGEtQr4M9bhJC4h/XMC0i4Se65y/MRpyXa/NFotk34t2x8QhuIuY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747265923; c=relaxed/simple;
	bh=3Ka8GdwCPYhaqN12AxQegzdYUKy06Kwxdyk2utBOqok=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FAUbQdnVE50o3que/MvFTGKWUzlyXRHafCII4ueoVYUflDYqhCPOE0hhuCYtjh2ZxthpKNWdP5hWxLSoVPj0cesWbA0+AY0Rv1iTiFUebOxZsGpnEDXg90EltcURMUlKwizXO4Ur7AI0TVD31AuI0r+OdBc62vaU2/V0LvjRz7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HVPrA7jK; arc=fail smtp.client-ip=40.107.243.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HVPrA7jK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O32i4Lf2/s3XjAA3KbDaxuc8Hf8ex90bNxYD12r1o05hNHxLUqnO1dj5VRDRI4Dd5b6GqlIlpBACvu/gNjsNrP64uZmU91OAOdYOuazQ+Lu6afT7gG9B5XA8Ui7LMBOrKH/cx1KrLSkn57mwzdfgLHYjqAX0aotXwzlQ5P1ELQ+r7vHp69TRPqZCUgFf4Ab6kbi00k+PCsUUHrL8M7R+A06tPGE05ysOPtDN26pXLhFCyHnb6tEeWL6fTCPQ2vREaHDijVhKwSeoONrY5REF9KSeF3VupqbYvbSu5Ur284GLUWNhhutkKtMuszZoJHS9QcnXCIHPVXoIOiTnb/Dozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ka8GdwCPYhaqN12AxQegzdYUKy06Kwxdyk2utBOqok=;
 b=IOBs4/ZfqsW0WndGxDA1huVj9u0V6dAYmvAdtOFe4UpTivFL8yAXyG3GdDaW+HuC0dwA1DZ6luIMS51u7B/IWKW/j6fbR041VS+wyE5qEhWJilVj4JDvVVJ0MikODI/MUinghcOFK0GBGFpdp7Dl8loUBQ0MFGwNcNRUil32tTA6Bj1kJ2OjQf54uP3POb66VAOTxllgiLRakCaLV4rPy/R3u42kk2ev8fgSlG+dhDhpMWeJ2ulXpc0qMKxxMd/gHSRGUOsCPWb/YtN5mvmjmqULHo4tP+ldo3lZz3KkR4Urx0s/MDM5pRs/pKZv1xDsqD252psympIv2Emkolsfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ka8GdwCPYhaqN12AxQegzdYUKy06Kwxdyk2utBOqok=;
 b=HVPrA7jKEHt9zeQpEBodnxGFYoqabHjNzq/K8tKqsggDHvPdZ4okeo15MPO1h2I3cSgvl/vyO0A6XH1LUR0YVBjRFKE6iSzp1nkqN/5maEwSbakBgbazj9BfWIwJAtlKsn3/hGe00z81klqXtNfPV+bpq9MB4YQqW4jk4z4nn+HE6axiA9BhHANqgcbLLH80vCN6/DW3gg9jcqggwKM5wsUEvYhSs8I7KSZI6aBh8RR0KaP/OrZpHSTjG0W+o2iaj+Nr4OTYAfeyE9cTNr2VWpSOywMIB33TJdwNO5HjdGRyWlGQqtY8u2awJKDuVU2Yy05U2PLRK1F2SjiqJHKxhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 PH7PR12MB7332.namprd12.prod.outlook.com (2603:10b6:510:20f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.30; Wed, 14 May 2025 23:38:37 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 23:38:37 +0000
Message-ID: <43d6d7e5-c505-498b-803e-f9548d145900@nvidia.com>
Date: Wed, 14 May 2025 16:38:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/30] x86/resctrl: resctrl_exit() teardown resctrl
 but leave the mount point
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-9-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-9-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0023.namprd10.prod.outlook.com
 (2603:10b6:a03:255::28) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|PH7PR12MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c2f5e62-4da4-48bb-a96c-08dd93407309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tk9nbkpvVmVENmdSRUFMTUIvdXhaa2VMSHVKL21RdXdJc1NXNTAxWmxPekpi?=
 =?utf-8?B?SlZYaG94V0lMS0t4bGdxMWl0KzlsQy9UQVVhMm9iTGNHaGMraW05S1BQSzRk?=
 =?utf-8?B?dlRqZ2dUdFhEaVl4M3ZSb1pOY0w5U1EvYnIxZ3d6RVRRaWFOek5tY2JsNU1O?=
 =?utf-8?B?bDZKYmd5M1JiY3VBamF3REtIK091SDQvQ0dGYXRzbHpTcmQraldmbGVsN0Ny?=
 =?utf-8?B?NlcxZmthbzVleW9maHoyYWN4UE5ITUpiVXVhSCtPMEVqU2g4d2l2aGhRdTFy?=
 =?utf-8?B?L2lJSjZOZWRmS2x5UC85Mi9jTW16RFRGMk9jSDRLVk1obW5Ec1BsVFBPQXMz?=
 =?utf-8?B?Rmd0NFVxblRCY1BpZnVVWnRHR0kydThKdTdTMzFueWVKV1cybjgvekgzeUtp?=
 =?utf-8?B?d1g0ckZGVlY5cEJwRDVTNCtYRFVXRWNSdWRSaldzN3o4WVhHRStLcjdCQzl3?=
 =?utf-8?B?OWZlQ2N1b01LN3J2MkJnQ3pIMzFZVWdxWUhNNGxGbE01Y3UvN0VjY2J6dHdo?=
 =?utf-8?B?OHZRTE1ZbCtVaklZNnZNdUxyWGFvbzAxTGJ2QnNLRFdDN3MyK0ZEQ0IyWlYv?=
 =?utf-8?B?ZmxnZHdCL0pIQzhDVTk4REQ2elBycHFQbnFnaFJhQU5VSWY2R2QreXF4NVpT?=
 =?utf-8?B?S0diQnc0Rmg2Q21UdUtkWTBOaEpNZnNORDRWTWd5cTJETzFNWjVwdmxieENz?=
 =?utf-8?B?NUR3M1B3YlN0SW9tcDJnYndWVkFKMHZIbW5Jd3FxTHMxZnZ2ODZzcHlXTlhu?=
 =?utf-8?B?OEVHZGpIOUxLMkFUM1JXRUFBcmRrYmRjd3lobytzeG9paFFaQVVRYkpIQmsz?=
 =?utf-8?B?eFF1Sm4rMjJMMVJyK1VoZkhIdFVpclRRU1FtUHM4QlprN3dEQS95NzFHL3Zr?=
 =?utf-8?B?b3I0a0xidklQYVJuelJBczY2RzlRT2dzRTVyZk0rK2FiR0YwUm9KOVR2VkdC?=
 =?utf-8?B?ZVVuTDhoN3BvdGUzZC8xcWkreUc5UU5JWkJreUtkSHZ0c3hiaExsbndnb2VQ?=
 =?utf-8?B?WFcvSmFabjJFa3pBU0l6NmxzWkpVS2p6Zm9JcldCeFJrNlBFMWdVTG12YzZy?=
 =?utf-8?B?WkZCWmtPU2ppanhjWUE5cTBUZkFUQTc1SG1GYWJ4bnVHb3JCcFJQaU4waWRV?=
 =?utf-8?B?eXRmZkxPZjVLYU5laDRmTDMxb0s4QkJJc3hxUVpNYWNYNG5YSkpMZWNyTjVV?=
 =?utf-8?B?em5pVUo1NlFyQ2xDcGVtbGtnSlVJZktvUjlVUjBvUFQ5OUkrdmxNQ0ptSEdh?=
 =?utf-8?B?VXZLR2Yrd2N0SVZHcEpEZHVUdWFEZnUvRWdWNFcwbkU2TStmeEdNMjVJOEUv?=
 =?utf-8?B?Vjl0d21sQUhnOS9oQUFEMmk0Vm9oUVQrR2xqdFRXRGhyb2ZBV1hXbFg3SDJJ?=
 =?utf-8?B?Ym5UNmp1TXBaOWpydTVtSXBoLy9CYnJqTXlJQ2diUHVwRFprbHdUSVB6azhP?=
 =?utf-8?B?K2VNa2szcUw0RmlQcDd6OFdYaTArcGY0bmF1U0VuZ0lyY1VqK2djNFpJWnVn?=
 =?utf-8?B?T0cyVFlCWk1GMUdlQ01GclFOeXN1N255b3p4K21qV3g2N3E5SHMzUFhlcGlX?=
 =?utf-8?B?Sy9XOUdMREE1Qi9TdWIzT1RyanpveXlHWEFZZ3JPVk1jeXRJTWFtcERBUDhs?=
 =?utf-8?B?MVFFMUpPbDNqZ21MN015cThiSDNHUzVmOFFlNk85S0hmejNDMVR4aURXc0M1?=
 =?utf-8?B?NElBc291ckpxNnFGRWdXTWJrajVQekFLRXJ1TVBRWVhwT3hvODI4R3RSd2dK?=
 =?utf-8?B?amFra0ZFWDZ0cFhNYUV0Mmd1c0E3a0JncXVLV3NOS09iRTBMUTlWV3dZaGp5?=
 =?utf-8?B?UFpIMmVLNUZ5ZzlZY3daK3kzUXUySHBkNjJPRFkvSUl5L2lSYUhWaDQ1S2Zh?=
 =?utf-8?B?aHdmMkorSGVQR2FWM1lmNENTdDRaSmE3L09ZY0d5dEJMRGpjR3lvMjNla2Mx?=
 =?utf-8?Q?pzByZTszKOU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V25lTVJxYnI5Q0h0RExuQWYzU2FlaTV3NGQySzFUd0tYaGx3cndSdnhGVWx2?=
 =?utf-8?B?TFJ0UzlqdVhNYmxiKzdmQjRlT0lmbXRnMjE1ekZmVmJhVTBNejZlaEt0MW5k?=
 =?utf-8?B?WEkwUUZ0aFBTTVN2SHlQQTZHaVpuaGpOMEtSa28vczlLdTFvVjJhcHhMOW5Q?=
 =?utf-8?B?UWVHQk9ETFQ1RExuUHpScFRUMHk4Ni9nMGUrdDg2WVVGTWdnK0MrS3NJb1FV?=
 =?utf-8?B?WGUvb0xNdlBxSElXTFVxd2lMQXhxazhCcHN0UmNZN2xDR3hHMDAwUWpCYXNr?=
 =?utf-8?B?eVp4OWlhOU14QTlrSVhNVGxCZ2hjNmVrSHNqcFE4QVlzekhncXpma2t3MWY2?=
 =?utf-8?B?d2ZaYnVtU1YrTVpiRC9sRkdJQ1U3bFZUVXFnaDVINDJXaE13TWRrTTd5Smdx?=
 =?utf-8?B?SFRBbUJEc3pwWFZmSS9Pbjd1TFE2LzN3UERKR3VyaEpad2c0ZmV4eG9wWGpN?=
 =?utf-8?B?RUJyR1lMUC9WSVdMa1NsQjNKZWJmM3lDb0MvV1lMN1ppOVJDeWNPenp5VHJx?=
 =?utf-8?B?TDF0Z0Njc0F3RzNRVThNTXEyVnVhV3AxT3NjeVc5dVduczBpLzZUQnFZRkQ0?=
 =?utf-8?B?Um4xUDVuTG53ZmlvTGs4YlhLTGUyNHZQcE56aGFUMHNuTE5ub1hpc3p5Q1FP?=
 =?utf-8?B?MitMa1p6VXM5Qy8yZ1hjUlVVM1RyU3paR29OZExpWUNTMzUzeTJyK1p1c0Zo?=
 =?utf-8?B?UzFLMHBUb3JuMlB0M0VNYktqUHF1RDR1SmhCY3U5QVhPMkZITW1UTnVDR2pD?=
 =?utf-8?B?NlAzSHFQNkpxcUROd295Y1pQRjI3bWt1OFQvYW5BNVB0YzRUUjlxWUVZRGg3?=
 =?utf-8?B?QlFuVFUxVnlVTEJCd2VnbU9IZlowM2lXSWZBNmZEZWdWQkFDbTI0Y1M3SGk3?=
 =?utf-8?B?RkpuZGJtSGJqV2M2UHJQQ1VuaHJFK2lpWGMzV1RpMXg2Y2w1TW5FTkh3TlVI?=
 =?utf-8?B?VDdYTW1VbTJoK0tpZ0F6Ym1lT3JGMkFiVkQ4a3RseWhIRStLQnhLT241WjlH?=
 =?utf-8?B?c2RQL2hwbGp5cUtLNlZaR1d1VlVlT09qd0dIVEpMVlgraGZaRUk0ZW93bWtD?=
 =?utf-8?B?TVhXTjR5ZTkvTU1Fa2J5SDcwdXQyUnluTzBOYkxpSDV1VS9uVEZtdEVZR1dk?=
 =?utf-8?B?Y0EyWkFMckhINzF4YzFhWHdrNW9mcmEyeHZ3VDBkcFZOT3B5SThSUm5wWXpO?=
 =?utf-8?B?TzlwcHg1a3l2Q2RWcklMNGI4dUtZZG1JK081TjhNaDIrU2llTlFIMGdreVVQ?=
 =?utf-8?B?YVdsUmxrdHBaSUpCaTJsUzBSSXh3eE51MWp1NTB0bGdicnJIcWJaa3pnL2ZE?=
 =?utf-8?B?OEw3OVpOTDVUcUxnU1UxMEFZT2RoU0YyeUMzQnUwMGRwcGtvbVBnRGtYWGlt?=
 =?utf-8?B?NSs4V3NPSmhkMlUxV2NZazBCRmFubTRzL0xnOUw5N09PMTl3OGJkTWdrUjgv?=
 =?utf-8?B?bVFKMFNJTTdUN0s4UllkSldYMHBlN1crc3FIUE8wcGRST3FoQkkvTktPblE3?=
 =?utf-8?B?WWZYZzh2cytWaXprY1lzanM2MjlpVkVuRXQ0bWRHb0xUc0c3cVZRRm1SNDVW?=
 =?utf-8?B?bmNQT0laSkdzcnI4RW5Xdjk4Z3l5ZjU5L1c1SGJvZFlmaXlIVEFOa2tidTcv?=
 =?utf-8?B?Nm9GUHY2SUE0N1E0aEsvZkNCaUhIWDJxWkdmeC91c25OTUllS3g5R1VtMEVi?=
 =?utf-8?B?bFdaczgybnlUZmE1ZW5TL3FUUytzMjlmYStXSVIxSDdId3laZGU5QWpVMWRL?=
 =?utf-8?B?QXczaWY2WU5NNHgwaU9BSG5TNW5rVjlNYzVrbllBOUNaOFJwZWxYNDAyaU9D?=
 =?utf-8?B?VTFqUmlTQlRQS2FtQXhvL0FRQ2Fla0dWZzF1ck9Ici84R2VpTGhTQ2k1OUlz?=
 =?utf-8?B?KzhqTjdKWk9jWEE1V1hKNjRKWnJITk1Wcmk5TElYSW1ueWlHZWtLL2VzeWpp?=
 =?utf-8?B?OCtMcmxnZS9SM0o5YmYwRE52MWpkSjVUeWhmZXFWckJGNlExRkdMa0pRUEov?=
 =?utf-8?B?S0NwSlRvMzRkNzgvUWVrejNuY3Nza0t3bkVzQVo3ZWhsWnd6aGRBRDZkQWVV?=
 =?utf-8?B?V1VKQ05SQlJsUWIyUXJhVmhyaGs1SHBUUVBvclQvb0pBV29ueXF2aTVvRGFm?=
 =?utf-8?Q?j6jU84VIpXVrPYInFthXY4RX3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2f5e62-4da4-48bb-a96c-08dd93407309
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 23:38:37.6514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJJuAtjEbALjYZzT5QSZ9HudCbxkDa49e22XuBBhWt6G8f8lycAEUbNXRYfXjMOSFG79fP3tRc08pvybVjaGVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7332


On 5/13/25 10:15, James Morse wrote:
> resctrl_exit() was intended for use when the 'resctrl' module was unloaded.
> resctrl can't be built as a module, and the kernfs helpers are not exported
> so this is unlikely to change. MPAM has an error interrupt which indicates
> the MPAM driver has gone haywire. Should this occur tasks could run with
> the wrong control values, leading to bad performance for important tasks.
> In this scenario the MPAM driver will reset the hardware, but it needs
> a way to tell resctrl that no further configuration should be attempted.
>
> In particular, moving tasks between control or monitor groups does not
> interact with the architecture code, so there is no opportunity for the
> arch code to indicate that the hardware is no-longer functioning.
>
> Using resctrl_exit() for this leaves the system in a funny state as
> resctrl is still mounted, but cannot be un-mounted because the sysfs
> directory that is typically used has been removed. Dave Martin suggests
> this may cause systemd trouble in the future as not all filesystems
> can be unmounted.
>
> Add calls to remove all the files and directories in resctrl, and
> remove the sysfs_remove_mount_point() call that leaves the system
> in a funny state. When triggered, this causes all the resctrl files
> to disappear. resctrl can be unmounted, but not mounted again.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Carl Worth <carl@os.amperecomputing.com> # arm64
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Amit Singh Tomar <amitsinght@marvell.com> # arm64
> Tested-by: Shanker Donthineni <sdonthineni@nvidia.com> # arm64
> Tested-by: Babu Moger <babu.moger@amd.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

