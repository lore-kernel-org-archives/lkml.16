Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EEB24113D;
	Thu,  3 Apr 2025 08:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743667952; cv=fail; b=s34JRtPDgq7UrffSCzzaOEkMFaLSAo2gjvxLw37tFZ1hAXtiKLHXGjIPGhPOHoULYxfRYw8nBsctfl2QA/A7knavY1Zwb3mZdjmkxeeLd3uo6BvMs1fAbv7zR+cK7Eu9tjNcpxmIRnfEbRzXkVpBNPshQRzDgqZZqrRXcrkcfcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743667952; c=relaxed/simple;
	bh=Qn6nMmcBh24BwiUzkZsUPUquGMcwLUaFcSut9r6F7D8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NjZKVJ+GSjU94YSfMIGaFlaVeUiRP3KJjHOUxIlwoa43uQ2wS0mLp8+cxeUPtgbEghoNBAmq30qtBpWGWBjD/vfL/xm7oY7LGioLL4TdWl6G0fVwwnxr0nGyyjliuRDGKyNJRDo0RYYt3ptS2hnPKba+d/0mNTvkn0kU/hbxvHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t8ZAJt+E; arc=fail smtp.client-ip=40.107.243.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t8ZAJt+E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKM2TFGzzFsIR+d2U7hVXr0cqidxrjQuKKx07CEoouJBzA4Sm4yrF78E+dWxKtPIeyowmVlnW4RBOdwnhN9XrwPZseWK8q5JkEHos6274P4EXdsg6bSmSliqtZDMgwQYjB/nZ513g06JmSMn7i3w5wXjL9G06J0T/n0pk3fDsCVd+w21fJ7NoWwYxYnDUk/JSCOPeA3XkOKAK5Wp/MZc5EFJvX9wOpvAW70qRWaoVBfMGZ/OqhP38/ina+1/w1hje84U5mzTwYte3Gc78QIf1L9NzrKaLv8j/vvgWJyfdlmDEOMYW0q1W7b8vEWHwwMnzgwb3ndXlZlCRpUSDlg9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpLv+bySWLz21H0LjPdTV3jeAysSaaOANfzMlpwOIjI=;
 b=MwJdDVDV+O30hEivLPA8p7dRyuV1SV4/EgCmXS0w577ff4t+4KcxuA8Ub/pWW04GAYtXM7rWKVdyr8RSFFoigq8DlVr8GQIsAf9RQsFMBq94NgKXlviYnEIjofGnWY8VlopcZ36QfjYIWz3j/QU0k5AJItXrr9jmWZIxeRMUfwuO0t8nzDiXl8VgiopWeSLyEZhm4wGe7x7OXh4KOQO9eM2HfGqESmKRHsIZtkdd4FgspmA8MSd++1wGY4b7hsuGwJIKBdj+eJakUo0xzaZczCNaO+uTy5pNm9fMjCao5ugQPDLRWj47h9TLs0pRvsUFrmQozFgZjXmDOOggphJmBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpLv+bySWLz21H0LjPdTV3jeAysSaaOANfzMlpwOIjI=;
 b=t8ZAJt+ECQFbXOjndf5f17YhM5j1sDPZaarwNbnJ4jSeSJCvx52TtT6dBXytfzW9iMq9O8HiFZ4Zr6DnpefIFxrGH/FR98/LN13xJWNXe74tM5mp36YwkP3Ao4zveXkCkTbam4y319GrPGlCiYsNd+LoRqHgS/O7IjDgDu9+GNU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by SJ0PR12MB7033.namprd12.prod.outlook.com (2603:10b6:a03:448::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Thu, 3 Apr
 2025 08:12:28 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 08:12:27 +0000
Message-ID: <d151e78f-aed2-49c7-8f59-abb23db4cbf4@amd.com>
Date: Thu, 3 Apr 2025 16:12:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] transport-pci: Add SWIOTLB bounce buffer
 capability
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>, virtio-comment@lists.linux.dev,
 hch@infradead.org, Claire Chang <tientzu@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?J=C3=B6rg_Roedel?=
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, graf@amazon.de
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-4-dwmw2@infradead.org>
 <20250403032152-mutt-send-email-mst@kernel.org>
 <9635c502-3635-4875-ae1f-53b4b7aed855@amd.com>
 <20250403033718-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <20250403033718-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|SJ0PR12MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 86b765ff-dfab-44e7-0b7f-08dd72874601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2VMeVhBdUdiOTJzOGlsZ0hsaUxNVGIrM1NZeHdmRFh0QzRtY2U2aHpDb2Z0?=
 =?utf-8?B?bzRkYWprL2hxdlRxdUQ2dlA1SjNOQWxyZ1d6M3h4MitiU0E3MWIvT2M1Nyt2?=
 =?utf-8?B?VDI0akJWL00zc3pvU3RHUXdQQ1R3bmd0aTJJQUYvNFNEZmE2bkxYcWw5NlAv?=
 =?utf-8?B?UG9MOFZ1SGcybG5qcm5CbHBvckVWR0s1VXZYaTBUUVYrMEpHMzZzY241MDRu?=
 =?utf-8?B?eEFXUHpvazZSa0VDTDR2S2c4S0tZUzdkSFdMUGx3QUgxR1NnOW9USDQ0ZWxx?=
 =?utf-8?B?TVp3OFN1OStHTDcwU05HQ3BMQmdtcWVSbFd4TkFnb2xCR21NNVFOdXg1Y2gr?=
 =?utf-8?B?U21oVmJDNklDLzhPOG5RcUhVR0xlWnBJeEU2WnZubmtvOXkzN2lFdXFIY1pm?=
 =?utf-8?B?N3U0WmxoUXlGZk5NdU9iNUZod1dhdElWcGg4eisrcDBXM1cvMG16U2lVRzF5?=
 =?utf-8?B?bDEyQjVOWUdzM0JrRXlNSVNNeGR0RUFDdnFYNTJ2Umc1OXpSeVlGSm5tTlll?=
 =?utf-8?B?UmRFZ3g3Q3FyYTJKVG5tV2FkYytHS0Q2UzhoWUZKb2Z2U21aRnEzT1JNSml2?=
 =?utf-8?B?TUU1WDgwOG50ZWJKbHE1cHVXL0E5Z0psaXM3YXhrR2hncWdQM0drQjdYSGNa?=
 =?utf-8?B?Uk5TL1UwVm1WRzZlYmhNdjh0RE5ZTEdaVkpoRUlRTmUvbGtzUHVaUXpxdUZV?=
 =?utf-8?B?eURaa01wTDZpNmVmNSsvUzViTEFhNXpwNzRmM0c3eXdtdlJEVXkvK3FHcHhu?=
 =?utf-8?B?UG80czRreXptTG51dmZIYlpoZHQraW9kcHI3TU5KRVZLMEpWM3Jqby9YbXdU?=
 =?utf-8?B?MDZjKzF3REEzYm1FMytMekkvazN0eElReTRmWDRPVUI5cTMrdStHc29qSUh1?=
 =?utf-8?B?QXpYaFp2QkRLMGR4YUd3KzY1M1k1Nzg0WFJDSktJZWJkRFl1dXZ1T0l5YjB0?=
 =?utf-8?B?ZTNua1FneTJRQUovQm5KWGFXbER6dmRmTk42eFFaQW1BeWJxTHV5ZUErWTZx?=
 =?utf-8?B?YzVJWWUrb1F4cTY3eTF4MGpBdUNaRisxU1pKQ0R4UEorUG9Tc25HWEVRd2RE?=
 =?utf-8?B?bEoyY2tCbm1VL2g3NDljMllIU2F2cStrZDZoaElUYWdrSjJBSmM1NUJQSytT?=
 =?utf-8?B?V2xEZjdxT1RVU1dxMUV3UWVrQ1U4WVVaa0F0TFovTGRpSGRYUXBWRGZzQkdO?=
 =?utf-8?B?cU0yMUtEcktzSjhhK1E0NzRtYUF5TUdQbEhQbmNTVVYrY0hCMHpiV085aEtn?=
 =?utf-8?B?MlVmOG03QXU5VkhsWCszNStsZGVNZHpYdUhZa1l4SGtjY3djTys1c0lneUNG?=
 =?utf-8?B?bEZwRnk3UEdJMllZb2hBSkIvQ3FDR0kzUFVEWGdtbk4wbFJMNnZlTzV6Z1FC?=
 =?utf-8?B?T2dFd0pwMVlWYUZrdkg5eWx1TUQ1UVdTcEdvQThsYjk3UHFaUWcyZE9Kbnkv?=
 =?utf-8?B?TGZGeFBteGZ0UUpaQXRIYlcwd1JzZGxSbUkyWDZiVTRBaUtyWi93QUtRZDB3?=
 =?utf-8?B?d2tENEwxRTB4UDRJYzhnUzlPUkluYjV6RXR0bXU0a0c2MEg0MHRhb0RXM0E3?=
 =?utf-8?B?dnF6VXNhQTY4ZGhTcGxLd3QyK0ZTdk1vOHA3OFVnc05GMHFJZWJpVUtQZUxS?=
 =?utf-8?B?YWg5eWhYN3N0Z1luSzN4T2xzcjJTakVnQzZrbURyVWpZMjRXTjd3TnJiVnVP?=
 =?utf-8?B?ZXZKZXhFNEsyT1h5TlRBYVhQZWxsQllnR0hZOVZLM1MyZnJ2RTg1NHpGZm9m?=
 =?utf-8?B?ZzVwMVRRczZzRTFpamMvMEdTeXMxVStIZU5zanFVeGlmZ0RsUFRsWXo3aTRM?=
 =?utf-8?B?c25vNldTMGlxeUQ5S2VzSFV6L0wwQ1UxUEFaa1BoNjhCQXBUTHdtM3VQdkZt?=
 =?utf-8?Q?oxq462hhfqraq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTJMZ3QxdWFBYW5ITitObUNsRTNKbG9jUVFPSGZaRkNaV0JLRzBGZFkvZFMz?=
 =?utf-8?B?Z2xlSkY2elR2aWtSS2VLK3RHNVVYNlVLcE5YMEZ0R1dpRGtIdklFeUVTd2F0?=
 =?utf-8?B?cFpvUjZXMlZVSXJXajdnUWNJK09heWgwUTVIeDlsUUgyWEVzU0hwVDJxREVz?=
 =?utf-8?B?L25ZVUtISGlZeUZzRU9MbU1KaFNXT1NiTUg0U2FTa0czZ0Z4RHFiQ0Y1dlpj?=
 =?utf-8?B?WHdiK3ExNDNNQVhmeVdKOXE4OGxrc0pGNjRMcEUrRUVJUWJ2MEVCQmxxOGNT?=
 =?utf-8?B?b0ZvbWpyRGZTejYxem5mS2MyM2k3RW9UTXJOeEM5Uy9BMFF0ZG5PY09HL3hS?=
 =?utf-8?B?S0g5SkxPUnFydVVsUXNvSkZ2ODlSc2NFQ1d1RTZsVFhsaW1UKzhIbFhtWmdW?=
 =?utf-8?B?T2h3RDlGc0dtY1BFV3YxNFQ1U1U3WFJqWlErdk5Xa3ZNOWJjdE9NT01qejdL?=
 =?utf-8?B?OXJIMFFDcEdpNFRCS2wzb0V6TVVkRDFwRi9hbmoydkV5aVVPdWtKUmk4MkRk?=
 =?utf-8?B?a0VUUmwxYllOaVZGN05CNFhza3hsVFZkWno2cDJHbnhIcDBUTWJVK3ZmMU52?=
 =?utf-8?B?cTZQNkMvMnhNZk9kZXBNSjhUaGFTcVliWG13SFVzTFZZTnZ3RGJVeDVZUVBW?=
 =?utf-8?B?S1RaMmZDb252bUZqYnZIL0haOGpXOTZhOEhsL0dTUEZ3bXRYNmhONEJuVDdE?=
 =?utf-8?B?a3p0aG5qVndTK2ZJcGJTNFoyOEV3MXU4T3VuV0tvbzRCL0NXeU9obmdjNS8w?=
 =?utf-8?B?Q2RBMnZQODQvd2NSRFpJNmV3cnpLTmJWVExiY0tzNzdVUVNyYUxiRDlQYTZB?=
 =?utf-8?B?c1RRWGFra1k1ME9NQk52K3MvRWpVZHAyNWZLSEs1Z2FZbFFXNy9ZblIxbUdx?=
 =?utf-8?B?V3RteGUrQ1NoTkRNR0FlT1lwNmUrRnBOZzRBUzBlT0txemZnck81TE9JWTcv?=
 =?utf-8?B?Y0s4SXk2OXU0dXljY2ZBYmtVejR6Um5vdmpNLy9STXRhRCs3aWdKU044N1Fw?=
 =?utf-8?B?d2ZjZmJJeFBMREdOTU1NQVZiSVR4UW8wVDB1dDFCYUZ0Lzg3N1JZbExTM3Ro?=
 =?utf-8?B?VlIvRkxLUEMxaTFNZDNCVjc0UnBYWUppbldpSnRQQXNNM1gxS1dpdEtSdHJ2?=
 =?utf-8?B?Nkl2R1FXZjR1bDZ6YVl0WmhlS01TWXdHREVjODBTUFZ5NjByelVKL0hEOHkz?=
 =?utf-8?B?VkdiSEF0aTBqUFcrc2xvMzVreVoyeXRFVVRzSkE4eXA5blJLbFdUZ0hRSkIx?=
 =?utf-8?B?bVpwaW50Q1ZjVWxGVEk2VU5RMC9aYlEwMlNDN1R4S1JPeEIwUStjeDBzYTZ5?=
 =?utf-8?B?VHZHUVRWMEw0MHJLbWljS1AzbmJaZFdBbkszOEdtZHQrbEdiWEp4T3dubk1B?=
 =?utf-8?B?cGlIN0dEa2ZNL1RVcWxlVnlUN2hvQ0pkUVpmQzVzWFFFTzZBakY3aVd6a215?=
 =?utf-8?B?WVFzVThzbDBYUnM2azIxVFo5emFrelU2ZDV4TFM4cU50Q1hpN0NYSWtxbDc1?=
 =?utf-8?B?QlBsSTIzR1lkdG5lSXRBM0dpWENBdDIyeGVqTHdNWnAra1l5dVpsZVNrQU95?=
 =?utf-8?B?YS9HUVVScHdYVXVXbHdhdk82VVEyWGtxRlFhWUZFa1ZYQnI4OWhZaGlYamxz?=
 =?utf-8?B?ckw5THp6NWhUSVRNN1J3RmkwS0kxaWZnSEg3SUQvTHZTUGt6MW5DUXFieDdG?=
 =?utf-8?B?WCtwTHNidWxPUG1EN2hjVDM4NVRlc2w2d2JrUXNwWE9hMkE0eDBadlA3KzE1?=
 =?utf-8?B?OFNNNDRGMWdzbXdCWGRzZTRyNDBYOTF5NUlDYWtsM1liOFoxZmY3RjJja094?=
 =?utf-8?B?dmNDN1prTmQ3bW1qY0t2cmRXU1lVR0xGY1REakVDVUs4RllKVFJHajU0cCtz?=
 =?utf-8?B?ajBTSDZLSmtKelVFeG9BT2pEWDVINFR3RzRuZ3NFRm1WR2VJUEVGSDNZNE9y?=
 =?utf-8?B?NGNLS1FqTW9tLzJCVG9BSmRHV2l6emcvLzhNajJMZFRqTkVIaWhuKzdmV1Vv?=
 =?utf-8?B?Q0NGbitoNHZBUndQZmp2SFZPS3VOM1Q3TDd2WlJpVUNtZC9SZjBIRHd2U3Nr?=
 =?utf-8?B?bkw3azlWTlRUckNkbUtFaWZpcDNwZ2c4SUVaQSt5aktUcEloRGVQV1JTWmJu?=
 =?utf-8?Q?S2PxjS8VNor8+NKcWYV/J48dl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86b765ff-dfab-44e7-0b7f-08dd72874601
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 08:12:27.8097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7xUW+1KrBRU8Ha6fsFwGYZ4uMkamRnHMpklLASA/URrd9B1QIkcGrEUSbS9+Zx1b2QCo3FsNpocASgtuOhsCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7033

On 4/3/2025 3:37 PM, Michael S. Tsirkin wrote:
> On Thu, Apr 03, 2025 at 03:36:04PM +0800, Zhu Lingshan wrote:
>> On 4/3/2025 3:27 PM, Michael S. Tsirkin wrote:
>>> On Wed, Apr 02, 2025 at 12:04:47PM +0100, David Woodhouse wrote:
>>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>>
>>>> Add a VIRTIO_PCI_CAP_SWIOTLB capability which advertises a SWIOTLB bounce
>>>> buffer similar to the existing `restricted-dma-pool` device-tree feature.
>>>>
>>>> The difference is that this is per-device; each device needs to have its
>>>> own. Perhaps we should add a UUID to the capability, and have a way for
>>>> a device to not *provide* its own buffer, but just to reference the UUID
>>>> of a buffer elsewhere?
>>>>
>>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>>> ---
>>>>  transport-pci.tex | 33 +++++++++++++++++++++++++++++++++
>>>>  1 file changed, 33 insertions(+)
>>>>
>>>> diff --git a/transport-pci.tex b/transport-pci.tex
>>>> index a5c6719..23e0d57 100644
>>>> --- a/transport-pci.tex
>>>> +++ b/transport-pci.tex
>>>> @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>>>>  \item ISR Status
>>>>  \item Device-specific configuration (optional)
>>>>  \item PCI configuration access
>>>> +\item SWIOTLB bounce buffer
>>>>  \end{itemize}
>>>>  
>>>>  Each structure can be mapped by a Base Address register (BAR) belonging to
>>>> @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>>>>  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
>>>>  /* Vendor-specific data */
>>>>  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
>>>> +/* Software IOTLB bounce buffer */
>>>> +#define VIRTIO_PCI_CAP_SWIOTLB           10
>>>>  \end{lstlisting}
>>>>  
>>>>          Any other value is reserved for future use.
>>>> @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
>>>>  The driver MUST qualify the \field{vendor_id} before
>>>>  interpreting or writing into the Vendor data capability.
>>>>  
>>>> +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
>>>> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>> +Software IOTLB bounce buffer capability}
>>>> +
>>>> +The optional Software IOTLB bounce buffer capability allows the
>>>> +device to provide a memory region which can be used by the driver
>>>> +driver for bounce buffering. This allows a device on the PCI
>>>> +transport to operate without DMA access to system memory addresses.
>>>> +
>>>> +The Software IOTLB region is referenced by the
>>>> +VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
>>>> +range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
>>>> +capability, if negotiated.
>>>> +
>>>> +\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
>>>> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>> +Software IOTLB bounce buffer capability}
>>>> +
>>>> +Devices which present the Software IOTLB bounce buffer capability
>>>> +SHOULD also offer the VIRTIO_F_SWIOTLB feature.
>>>> +
>>>> +\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
>>>> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>>>> +Software IOTLB bounce buffer capability}
>>>> +
>>>> +The driver SHOULD use the offered buffer in preference to passing system
>>>> +memory addresses to the device. If the driver accepts the VIRTIO_F_SWIOTLB
>>>> +feature, then the driver MUST use the offered buffer and never pass system
>>>> +memory addresses to the device.
>>>> +
>>>>  \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration access capability}
>>>>  
>>>>  The VIRTIO_PCI_CAP_PCI_CFG capability
>>>> -- 
>>>> 2.49.0
>>>>
>>>
>>> So on the PCI option. The normal mapping (ioremap) for BAR is uncached. If done
>>> like this, performance will suffer. But if you do normal WB, since device
>> and this even possibly can cause TLB thrashing.... which is a worse case.
>>
>> Thanks
>> Zhu Lingshan
>
> Hmm which TLB? I don't get it.
CPU TLB, because a device side bounce buffer design requires mapping
device memory to CPU address space, so that CPU to help copy data,
and causing a more frequent TLB switch.

TLB thrashing will occur when many devices doing DMA through
the device side bounce buffer, or scattered DMA.

If the bounce buffer resides in the hypervisor, for example QEMU,
then TLB switch while QEMU process context switch which already occur all the time.

Thanks
Zhu Lingshan
>
>>> accesses do not go on the bus, they do not get synchronized with driver
>>> writes and there's really no way to synchronize them.
>>>
>>> First, this needs to be addressed.
>>>
>>> In this age of accelerators for everything, building pci based
>>> interfaces that can't be efficiently accelerated seems shortsighted ...
>>>

