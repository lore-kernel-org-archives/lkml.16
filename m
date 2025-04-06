Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2052.outbound.protection.outlook.com [40.107.212.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EBD84E1C;
	Sun,  6 Apr 2025 06:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743920614; cv=fail; b=pbYblLz6tTU0CZUNLuukrdtSNUfKdoXW7stM3xPXaaN6QoqRQZLcpEnP25s8sanvZg0EkPNFctIYhZP3Qf4vEgcGGGpdCYjsPKL1NGm1afN1nttIXO8lGws9nqZ2SayuUI+i3drCFH+7E3tLwi2wfXidClH4WrcEufR9apvlxJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743920614; c=relaxed/simple;
	bh=qyrx5i6/tegLboESH07t8dDPmp+7f5vLJ3yC1517B1Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oCLHiiR74F+rLeVO3SdCZGf41ZL/4EAd96AogeZ6ofG5LI8ileMptjhyElhZ857A/E1VDtD3JfnqQmmDGrmQkV8yiMtWjtIVO6nYgRrPOEOBRB8CW3tQyjIeBp9/PSi8jZVEYcPaSW8GLi6VYnvVpBSz33NHsCdAlpFUmeDt6l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Vr7WupmE; arc=fail smtp.client-ip=40.107.212.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Vr7WupmE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEN7taDbHhjWWu9pDtpITY6BE6eNb1h9EpAuyqIedyc85hHmChdk+RX5H420tpU9sCfikBJa9ruIZBP1XEwfeoXahgrgf8fF9dcMZM7oyXoyPxllamMuMauSNJNSUvvym3l465s9fiKoz4/acMI25f1d3CQxypU/jGlKdk4nePKu4oO4JiS+Bjp4jrUxoD90z7lPtmYaIa++kVl4FXCbaEt2ZhSgTJp8btDKA+nHS8DLgdLOKzEK5FQT8yCkKGmT+ioH5MwBs+kxsxogJhsTB7ud0zfJyEX70BY5s85Fy30Z7qlRvAX9exrvvCGia4fAtrehIZqW3TERO7Psuo+Lrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyrx5i6/tegLboESH07t8dDPmp+7f5vLJ3yC1517B1Q=;
 b=ZCbo9PMLRDSlrBZVm4ONUVC5Lgrq0Fx83jJoQMz5gVuwDF2tLz5PGDxDs4UkA4bILFWJbhNvH5613s7YNIVvdweKO38x6ksYJorgR/p139sXbfMneMWMQ1Ykq2JdjIZZKxdNF0YQ0z/TarzXhdeLD7Q32aobwy823ySMp7TvA/VDxeOhVAShZrY1/FK889K7KFAioTUHupo4lzbJTCsEQeBIxEa1gM1kcJRnHd66/X6NE3z4Q1lmWTzZs2ZdqPn36a1V+r170f6y0ACGIiU8GD+6cMgGp4rPwYojbdnrsXIRboPcgjqtv5ETDfsBy7x5dyud9Z+DcTeJr8pZfxBF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyrx5i6/tegLboESH07t8dDPmp+7f5vLJ3yC1517B1Q=;
 b=Vr7WupmE7oNxgIq0JpceZaKIDIBxXtuNAPdo+66kyjRSRbxkm9CAlAMWK+AW7He2B8t2r22UpRTNM+Ixdh3dhDECLBi+S6hJo872lDKfV9no/HTKet7zv8BRlgaOkSURt6lr4tk8LxCAO9iaQAdMZyo+PLofCFbHg2U4WdeDeAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22)
 by PH7PR12MB6720.namprd12.prod.outlook.com (2603:10b6:510:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.45; Sun, 6 Apr
 2025 06:23:28 +0000
Received: from SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8]) by SN7PR12MB7835.namprd12.prod.outlook.com
 ([fe80::ea3a:4720:99cb:32d8%7]) with mapi id 15.20.8606.028; Sun, 6 Apr 2025
 06:23:26 +0000
Message-ID: <f127d8bf-4767-4203-8db3-c8ea80541917@amd.com>
Date: Sun, 6 Apr 2025 14:23:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] content: Add VIRTIO_F_SWIOTLB to negotiate use of
 SWIOTLB bounce buffers
To: David Woodhouse <dwmw2@infradead.org>, "Michael S. Tsirkin"
 <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, hch@infradead.org,
 Claire Chang <tientzu@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?J=C3=B6rg_Roedel?=
 <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, graf@amazon.de
References: <20250402112410.2086892-1-dwmw2@infradead.org>
 <20250402112410.2086892-2-dwmw2@infradead.org>
 <1966cbf1-a430-480e-a78d-3d6bbcb4ada4@amd.com>
 <20250403033230-mutt-send-email-mst@kernel.org>
 <59be937432fe73b5781ecb04aad501ae5a11be23.camel@infradead.org>
 <20250403040643-mutt-send-email-mst@kernel.org>
 <0261dfd09a5c548c1a0f56c89c7302e9701b630d.camel@infradead.org>
 <c7c5e449-3df1-4162-b5ef-c9e05945d22b@amd.com>
 <fe9b1c4603f95d31933d22305a55b9f682ba76ec.camel@infradead.org>
Content-Language: en-US
From: Zhu Lingshan <lingshan.zhu@amd.com>
In-Reply-To: <fe9b1c4603f95d31933d22305a55b9f682ba76ec.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0126.apcprd02.prod.outlook.com
 (2603:1096:4:188::11) To SN7PR12MB7835.namprd12.prod.outlook.com
 (2603:10b6:806:328::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB7835:EE_|PH7PR12MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b923038-3184-4cc2-ddd8-08dd74d38a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXJWZjBmOVdjZG5iczhRTndMK2s2MjNKbVFQOXVEVDZpTzI2b3gyL0tMZmd3?=
 =?utf-8?B?NjlSRGYxZUtzUjJaQlRyWlV6c1JwMVQxQUNEQkxwdlZCZTAxalVyTWU1M25r?=
 =?utf-8?B?dDRieG53ZFBQcUoydWxDdmduU3JZMmN0TXI1dUhQQXVsM21FVE1UUkdIOVB4?=
 =?utf-8?B?T05XRVczUzU4ZXhybXkrZUJHZlVFNE9kV09kOWZjOS9KdFJDMS9TZkh6QXk5?=
 =?utf-8?B?RG5VMys2RWhhSk1NbkxGWXM5QmpxY04ya2drQ3ZRYkhpbHE0K09vK1VLZ2hj?=
 =?utf-8?B?c3YycGp6V1JqdGwyQ3hTeTJYL1lBT1gybzM0VWN6aUdzYmU2WGZqWWZUWm9K?=
 =?utf-8?B?dGZMN3Fqb1lEcE9jK3hXTitMRURrU0xuTy9oNmxPRm1XVm5lUnRhMzlUT1Jt?=
 =?utf-8?B?RFJlNlZNREoyTC9IVkZHSElMRmFUc2d3bmMwczNBRy9kZkdzVlJiK3dHOHY0?=
 =?utf-8?B?U2FWMGJpS25OVnEyNlNYOHlhN1IzU0lBL3o3SFRxUktvSE1QRHRrdi8zbVhF?=
 =?utf-8?B?S2U4eThuRk9jWkhpditFZUJCTHZBVFJKRmNlRGNxWmZ3cURFeTBsVW9Nazd5?=
 =?utf-8?B?dmtTb0hIQ1lUOGZRZEc1OGI1NllKN1Z6Wk5BYm5XVGpqd2NYNUJJRU82VE0y?=
 =?utf-8?B?TDlVWm1MdDErNm9ENm1KUlhtQ2k5R0ZGRkYybFc5OXpCdWJqc0Z1U1F1Z0pq?=
 =?utf-8?B?U3cxR1FRbjJja3dGemxxM2U1bk9FeEZXZjRMQmt2dk1QZDVWRnBYOWRMZllT?=
 =?utf-8?B?OWR1UENyWGEyUlVtY0FRQ2ZBYVBIS3crMGV4UEdEUk9vSy95enhJc0xMYzAw?=
 =?utf-8?B?VTlZekhGaWF6cy9zZFcxeFp3cDUveFVNYnRiUVIyUVJxNG01a2ZYWnYrSldX?=
 =?utf-8?B?RHRvS0JjZjQyMS9INGJPY0lZc1VxQ0U5RFBqTmZQRzdCTEhjTTZnQStQeEtX?=
 =?utf-8?B?cVBvSUI0TjJZNFJQM1V6YjJUaHBBejdxMFhocGtxZWE4YWFqUmRQanZob3U4?=
 =?utf-8?B?UVZybUVESnRRVHRNREczN2IyNUdvamRXeHNzMk11ci9UNzZlUGZ6TmthaE1W?=
 =?utf-8?B?OG9hVXBWUjlNQlgwL3lnVHZYV09zWFRjazV4aGpkbDRWVzluYVBQUnpPRGM0?=
 =?utf-8?B?ZDlJRCtISVNOMFl3Y1pRcS8wSkFMcHhsSlp2RXl4My9HMUlKNkZuY3FaMFlE?=
 =?utf-8?B?VVU5Y1lrSTVJU0lqbVRaenM0TERVWkg4a2RCdnlSN0Y4LzFLaDM0WEZ3YmtI?=
 =?utf-8?B?M1g1ZHRIRTd2Wml6NW1jdzRGOUpMODJBYVcycUhId3RJdGllR0V0WW5aM3R2?=
 =?utf-8?B?R0Y5WDlzSVY2VWdlRTMyT2E5akk4YnVhWU9BcmU1YlYrU0c5NTlUUDgvWFdE?=
 =?utf-8?B?R09PRGNnbm1PcnVYaFY4TnpnUkluVEF2aFVkaHFUTW01RE5uS0luMWNjSEsw?=
 =?utf-8?B?RDhDOGVmY3BoaGZITnhaVVVFUnorTmZxc05vazlwd1hoYUhTRmNFVWhXcno1?=
 =?utf-8?B?NEptNEhwL0Vwa05kVlViUktMNGRlK3BSYVE0TWo4TFcyRVdXNFVxaCtZb2Zk?=
 =?utf-8?B?UGhFR1ExTEtvRGRiNVR3ZE10M0ZOTmtUeXZGU2ZLZlNHYTQzNFRFS0FaTzV6?=
 =?utf-8?B?bDIvdG9OMk5DVFgvZnM4UWZDbGlIR3NQZEYxY3E5SnZ5OWhOcUxFK2FqZWxh?=
 =?utf-8?B?TVhnYmF0QkpOK3RZZjkwZC85U0FHVVFobmQzTWVYdkpSdW5Obmg0QklPQ1RP?=
 =?utf-8?B?VkJBbnh2QTRVZU50ZmRzYTVSTmEyUHNjalhHc2locHluNkRySXdWNENMNzhE?=
 =?utf-8?B?MUVHOWRnbGFwdmhlVWVEWVNSc1lmbE4yb3A4RzYya1pIdFRseUtUYXg0dXhs?=
 =?utf-8?Q?7bcCxZIetwl7Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7835.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm53QlBkMzFnWUpWeTh2WWF0Y1ZUZjd0NzZLZkxueStZdmZITmhNL2QyNVFL?=
 =?utf-8?B?aHNmb3Z6VkVaTm1OSWRtRGo0UFl3VWhJNmdmbnV1K1FGZ1dTUXdqQkpRbDdj?=
 =?utf-8?B?V0FDdVhWTndheHJjRC9WOEZMTldURnppcDd2aUlNM3dDUk4rdUIxaXJTdnpO?=
 =?utf-8?B?M0hHQ2lqYmNRTXlJNTZJdnpZV0V0ODY5MUpBVnRWKzcrRW03eUNFQVBaTTJU?=
 =?utf-8?B?TjdSbWZtL2d2Wm9kMFIwMldIdU5SRzEvblMzajlYN1lKRW1uWlM3ekM1VTZq?=
 =?utf-8?B?VzY0T3dEWUVsNEppcWxFYzJGT01wZ1lRVlRZaVFXL0l4UzBsdEg4NXY2ZS8w?=
 =?utf-8?B?RlkrOGdCb05nMjNhOC9SVUlRcjRzaklzZkZ5Y3dGR0dzUXZaSjZxZnJwb1hP?=
 =?utf-8?B?bHdoWThzSlQyMCtOdzFRQ21nQS82SjZYcEJrS1dXQ3lBd216ZzVqTDBhZ3Zw?=
 =?utf-8?B?ekJDbUtGc1dJcDNWUWg2VkNnc3RkZHpZZWVEUk1GZkxtTDl4OS9hWDMvbVBE?=
 =?utf-8?B?WUs5dFV0OHNkMjFHcVhROWlwNHlzRW1PQ0Rjd2Q3Skp2bVJqempjUjhZS1ps?=
 =?utf-8?B?NVNNaGwvUm9NSWpvZFUyZjBpN1Bvb2lLcWVHMFVJQjcxVTRJTmJJZmU4TDZF?=
 =?utf-8?B?aXp2L1NyYlFmZ1grZUUrZVQvTjZIdFJabDJxbGF2d1VTT3pYNjNxUHRKb3A0?=
 =?utf-8?B?aFhxY2l5WExCcXBWaWYrUGcwSDdham1MVEc0TkcwdFVlVWVrdS9BTzdKakoy?=
 =?utf-8?B?VnVHSlpXSVp5ekRxZzcrV1FzRGpaQW5DK3JDdTB5ODQ2cWFMYnErVWZEdkgw?=
 =?utf-8?B?c1BQNW5ySjhNWm5nMUZIK2lWNUh4UW1jRjFYSjg3Z3hETlJ4cGZ5TUltK0k0?=
 =?utf-8?B?cGxVdUxGM1lGNU80NHQvbk1mNmVzcm1jMmVOMUVnLyt3NU12TzBzRWdWWlE1?=
 =?utf-8?B?VzJJRmR3WW1sQWJwVTlTbXFBNGFja0pNKytoNGN3bUpOaU9BMWhsN3dmU0tr?=
 =?utf-8?B?MmdsbThjWi9oK2Znc25qZThGS3NETDJ1dXVpTkQ0TzdRa003SjFFQmlnRGFm?=
 =?utf-8?B?Vm1Dc3MyWlJicWJ5dkNRYzByTDNmRm9aaGtkbndUZlhybDVaWkw4OVNlR1Fy?=
 =?utf-8?B?SEdibmdWaU5sdzFGV1RjTU9UZDIxQmVmZ3JjRG10Z1RYVlVmdzY2cU1ZK3JT?=
 =?utf-8?B?K2pIVnRkQUdvYWxkR3pZWmVjWWZhYS9oNkF2SFVNZ01QeHVFVGhKUis4ZVNq?=
 =?utf-8?B?WWNrNXVxSzJNOE5VQU9iN0p3K1h2RW01OXdaK1ZZQ3VDRWFweW0wdW1GbXVy?=
 =?utf-8?B?dTJ2UHVBVlRKc0lPS2R2WXNkajNjT3dha0VEMFFOL1NKaDF6akNzRE1NUzNG?=
 =?utf-8?B?SXlVR0JlWVVESDJKWTFVRkkwNGY2VkNZUHFQSlFQcU9BdmVGanhtV2NtUXd2?=
 =?utf-8?B?MHd0b2pxZUZiemtRazZxcmF5R3U3b1g3Y2NWSWJQRDFSekx6eHBtK2JpcUln?=
 =?utf-8?B?dDB3Z2dSMDl4UStkaXlMMnpjTU9BN0UzYnIwVGxXZzNrNlBmSXJTYXBrd1pr?=
 =?utf-8?B?ZDdDRjNJYjg2bktxdmIwKzYvQ2tYdTZzc1NTVTZmN0dMUjFpcFNxSXBiU3J5?=
 =?utf-8?B?Ri9NVXhwbytvek5vRHhlaVRrWGFWYzNPZUZUemJFdlBxTEYwcTJCbnMvL1ZY?=
 =?utf-8?B?RkxXYVJEQ2U0Wm9mbFp3VWtCNUk1SlFqbkcrc0tXeFg5NFNzbDRlS1Z6Z2FS?=
 =?utf-8?B?THFpb3l0QVJ2S2owbXIrZ2RpdWlXcXlaS0FCaER6UkRWUFk0WGNKdVlxelQy?=
 =?utf-8?B?U3ZtZkg2YmVNZVdpN2c3VS9NYi93RnNXRkc0N1A4dHFmSmFBZ3E2ais1cG1E?=
 =?utf-8?B?SGZVTFlZb1JyenNRK01qVFdRUUVTcmZDcmRDa0JhYVkrdkt5UEFWZXV0MEJY?=
 =?utf-8?B?THlRRmd4azg5TTQxeGpNWFhQWVdUd05Za0MrUnU3Z2xDYlE2MS9ZVlBTMnF3?=
 =?utf-8?B?NlNUK3loZ1JucXh1N3pkOEc4Sk5SU21rZXZYc1RKZ1d3a1QzQkFXTjhwOGVm?=
 =?utf-8?B?eFZFbmpBdDdhYS8yNmlVUmlyWFlGZ2xidUtoSDFSRFJ1ZUlickFreENWQTkw?=
 =?utf-8?Q?xMkslLTWyAzGDnOdrK7H6tQZK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b923038-3184-4cc2-ddd8-08dd74d38a69
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7835.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 06:23:26.8583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Xo63ZFiqOXthwU28Y3nS3EtooXHQdhNT9iRkCfuuibziIF076eO1XbNHk+3cNoNUlKfCqpSNFMoWDtiIClBeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6720

On 4/3/2025 4:57 PM, David Woodhouse wrote:
> On Thu, 2025-04-03 at 16:34 +0800, Zhu Lingshan wrote:
>> On 4/3/2025 4:22 PM, David Woodhouse wrote:
>>> On Thu, 2025-04-03 at 04:13 -0400, Michael S. Tsirkin wrote:
>>>> On Thu, Apr 03, 2025 at 08:54:45AM +0100, David Woodhouse wrote:
>>>>> On Thu, 2025-04-03 at 03:34 -0400, Michael S. Tsirkin wrote:
>>>>>> Indeed I personally do not exactly get why implement a virtual system
>>>>>> without an IOMMU when virtio-iommu is available.
>>>>>>
>>>>>> I have a feeling it's about lack of windows drivers for virtio-iommu
>>>>>> at this point.
>>>>> And a pKVM (etc.) implementation of virtio-iommu which would allow the
>>>>> *trusted* part of the hypervisor to know which guest memory should be
>>>>> shared with the VMM implementing the virtio device models?
>>>> Is there a blocker here?
>>> Only the amount of complexity in what should be a minimal Trusted
>>> Compute Base. (And ideally subject to formal methods of proving its
>>> correctness too.)
>>>
>>> And frankly, if we were going to accept a virtio-iommu in the TCB why
>>> not just implement enough virtqueue knowledge to build something where
>>> the trusted part just snoops on the *actual* e.g. virtio-net device to
>>> know which buffers the VMM was *invited* to access, and facilitate
>>> that?
>> you trust CPU  and its IOMMU, and the virtio-iommu is provided by the hypervisor,
>> emulated by the CPU. If you don't trust virtio-iommu, then you should not trust
>> the bounce buffer, because it is unencrypted, more like a security leak.
>>
>> Actually everything is suspicious even the CPU, but you have to trust a TCB and
>> try to minimize the TCB. I remember there is an attestation mechanism to help
>> examine the infrastructure.  We need a balance and a tradeoff.
> In the pKVM model, we have a minimal trusted part of the hypervisor,
> which some are calling a "lowvisor", which enforces the property that
> even the rest of Linux/KVM and the VMM are not able to access arbitrary
> guest memory.
>
> For true PCI passthrough devices, hardware has a two-stage IOMMU which
> allows the guest to control which parts of its memory are accessible by
> the devices.
>
> The problem is those device models which are emulated in the VMM,
> because the VMM no longer has blanket access to the guest's memory.
>
> The simplest answer is just for the device models presented by the VMM
> to *not* do DMA access to guest system memory. Stick a bounce-buffer on
> the device itself, and do I/O through that.
>
> Yes, as you say, we have to trust the CPU and its IOMMU. And the
> microcode and low-level firmware, etc.
>
> But we do *not* trust most of Linux/KVM and the VMM. We only trust up
> to the pKVM "lowvisor" level. So if there is going to be a virtio-
> iommu, that's where it would have to be implemented. Otherwise, the VMM
> is just saying to the lowvisor, "please grant me access to <this> guest
> page because...erm... I said so". Which is not quite how the trust
> model is supposed to work.
>
> As noted in the original cover letter to this series, there are other
> options too. We could implement enlightenments in the guest to
> share/unshare pages, and corresponding dma_ops which simply invoke
> those hypercalls. That's a bit less complexity in the TCB, but does end
> up with a set of guest enlightenments which need to be supported in the
> core of every operating system.
>
> Compared with the option of a simple device driver for a device which
> conceptually doesn't do DMA at all.
Hello David,

I see you want to limit the device DMA range for security reasons,
a possible solution is not to do DMA at all, and provide a bounce
buffer from the device side. However, such a bounce buffer resides on the
device is unencrypted, means itself is insecure.

I have a rough proposal, first here are some assumptions:
1) we trust the guest because it belongs to the tenant, and we can not change any guest drivers, only the tenants upgrade guest kernel.
2) we only trust a minimal TCB, even don't trust most of the hypervisor code.
3) an emulated device is a part of the hypervisor.
4) even when the host / hypervisor compromised, we still want to secure the guest data.
5) virtio devices and virtio driver exchange data through the virtqueues, means virtio devices initiate DMA against queue buffers.

So here is a draft design:
1) queue buffer encryption, per queue or per device.
2) this feature is controlled by a feature bit.
3) driver initializes(writing to a device side specific registers / fields ) an encryption algorithm and keys before DRIVER_OK, can be null, means unencrypted.
The device side registers are WRITE ONLY, means can be overwritten in the worst case, but can not be hacked.
4) Write side(the producer, an example is the driver fills data in available queue buffers) encrypts, and the read side(the consumer) deciphers.
5) provide multiple encryption algorithm for different type of workloads and resource expenditure.

The pros:
1) a natural design, proven to work for many years.
2) even when host / hypervisor compromised, the DMA buffers are still encrypted and secure.
3) don't need to change any virtio-iommu implementation
4) compatible and actually orthogonal to CoCo, no conflictions.
5) this solution works for both emulated and real pass-through devices.
6）unlike TDX-IO, this is an implementation in virtio devices, so this design does not conflict with any existing use cases, supports live migration.

The cons:
1) need to change driver, but new features always need new implementations in the driver code.
2) consume more CPU cycles, but bounce buffers also need to cost more CPU resource, and CoCo attestation costs more CPU cycles.

So, does this low hanging fruit sounds good to you? This is just my brainstorming and a rough proposal.
Please let me know your thoughts.

Thanks
Zhu Lingshan
     
>
>

