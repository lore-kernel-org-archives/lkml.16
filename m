Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2064.outbound.protection.outlook.com [40.107.255.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523DE176FB0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 06:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743142405; cv=fail; b=dcYlP27kHKxVxlN97g9P326Ra5E/bwv2mK72eEi96HL6h8drJfLUCCoUWjREPjZGWClMHyz4TWQzhEHCb8c5BKx5Y6weXwT98ARvn+GoBeHGEC6TKk9OvdPK0CsLG7W0HYdPbmwrtyqNNIUPSyw0atOeD9ZxiinzNMW0MC4+D+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743142405; c=relaxed/simple;
	bh=GpMhWGoGvK+S1NBsEwC8ilurtFaDZFuyr7GdibLUnL0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kgtLhZKAv7Wz4Ax1nzfG3nlVTl70fCdas5K7VOKTkhqRowslSvb8pcN9cGQoLkS1ypTXBu6AwKy0Id2sixi6iB57XdFmA12k3SRFQfUMsR7y8mSRZl4KMAQ2uFpYFZrnA/XBgLLFT+Z+CgLQnMJVcFcV8KIuZX/hmaXlEn5fVuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=n42kOsqP; arc=fail smtp.client-ip=40.107.255.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="n42kOsqP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/K/xpDy6jPHUctMtkJvbbobzGgd9KVs3qiDo8h9VX5bSbTM+9+OxnmHCnnXpZtOgOJs8Msq9c8zWrMsFzYjQ12FlN4rFZtwEMq0n5KGjKRoob+ggcy+VRlf276YA9GA3bZqGC27E5R2aPR+jKie2U9K1f5msIisO2SMfuL6EvqhIvHN47WgteevDY/dC1d2l48Uzowh7S3iHn7vFgsizGBEMDpd44/ttm/MRlXWQgfbeERB8barUC6l2A+KVwwpCfpjJsJTRtw+byN3zipV9rv1UAoq9NCED6AYRiGCTjqrRNeaD4N/NFk4ZWvjCKnaAQNQ0uxap9zctnDIBWepXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8N5yMOrBLTLQA0K4Ukj7N/71kMVA+9TQ0K7O8BLa6mY=;
 b=MNh4S0KeSDoOOSUZLf+pYG0H09GeYZUc2q+upBR4mu+1ynuH2rM/dUMWNfF1cXVxevwBEiGB8I6jOaYRf1HpfO7NEy9SkLk+777ebyWbq4+YPUrqU/t10u3rFNrTuN5Ey9HUXrHsWq9f7v9SarmUEb+3k0PYF/qb7ahFGU2hUnwy7PTz0TLyDSerS8ivND/oKQu+GdoaAfAdbLl7V+ZmfMSECOOKU36vLmi4KPb1Iqs8vm6Ko6nHY98zM1nRYwZ6r2unVHh1H6a+quku/TnW1PFBSAYbUM73S8NeFXdRP0qY8RAU7TxLxI/oawwD6N/HwjoYnjnwL+hrHzNf6jeEJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N5yMOrBLTLQA0K4Ukj7N/71kMVA+9TQ0K7O8BLa6mY=;
 b=n42kOsqPi3Ym42JKmuBz7gNyYBXZvInQlyBiOnnTjrs2v54FC5WYdMKTow7Z1jGC/YsgVWhJ5ZN1H1F8LQlZiUKrSVftFFQNNOa/TeXcRCw5aHY10xsAuI/KKR5uHqfnIdzXCPi52jfmliErYW6xB4H32n4BhDWxomesrgW1kkT1mOUM324ahjj+xW04gTOoTWPlK3RQYxaizOFtEyfZdYWgxfY3IMOTgRiCnxEMYeqsEH3BN6c1acq2WTv1QPuxdYG7k48/STCJIK3ovwnDJwroyCXHyWFMnVngQ9eziX3rklXx0hwJja/PIrHbZJpe4BEC/mMbJeId8ammx0WIXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by SEZPR06MB5342.apcprd06.prod.outlook.com (2603:1096:101:7e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 06:13:17 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:13:16 +0000
Message-ID: <3bfbcad4-a2af-4f5d-b565-03607a2a025b@vivo.com>
Date: Fri, 28 Mar 2025 14:13:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/vmalloc: fix mischeck pfn valid in vmap_pfns
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>, bingbu.cao@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 opensource.kernel@vivo.com, urezki@gmail.com, vivek.kasireddy@intel.com
References: <20250317055304.GB26662@lst.de>
 <5a12454c-16a1-4400-a764-f49293d8dece@vivo.com>
 <20250318064805.GA16121@lst.de>
 <5229b24f-1984-4225-ae03-8b952de56e3b@vivo.com>
 <20250318083330.GB18902@lst.de>
 <bcbbc2e9-858f-46ed-909e-1d911dd614f0@vivo.com>
 <20250318084453.GB19274@lst.de> <20250319050359.3484-1-hdanton@sina.com>
 <20250319112651.3502-1-hdanton@sina.com>
 <752e606b-640d-46d1-a8e0-fa714b29a7b6@vivo.com>
 <Z-VVP0kABztfpan7@casper.infradead.org>
From: Huan Yang <link@vivo.com>
In-Reply-To: <Z-VVP0kABztfpan7@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWPR01CA0041.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::16) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|SEZPR06MB5342:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3d40a8-f590-4a11-9dc3-08dd6dbfa0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RUtzank2MU12eUdQcHR5b05ncFk0ZXRjMGZ3UndSbUFnMkVWeVEzY0szSGZV?=
 =?utf-8?B?Y2RXN0JGNHNZT0hVdlN0Z1lCZHk0MTZxa1pGaHJ1SFNzMTlIRFpIemFSempo?=
 =?utf-8?B?elVQVE1rKzV2SUFzWkJMcTdhVFNWeGdoVnR4V0xUdC9ib3A5cVBsakpFb3Va?=
 =?utf-8?B?RnQ2NTZpY2hvMVB5S2V4bjRhS1ZuNTVqVHBMS3ZYMUZQbWliQ2dDV21yWkpJ?=
 =?utf-8?B?STN3S1VzK2lic0xEb24ycFpFUjVuZDdWNVBLUDhwMkVCVnlvQlp5dG9JbzdM?=
 =?utf-8?B?TlJuekdra0dlVWlJWGU1aUxkRVkwcVcyV2NEbVB3ZkdmOS9FYW54cHNzeTVu?=
 =?utf-8?B?Mm8wRVArbHhZV1ZkYzcxY2ZMb2JpZmp4eTBKVmgwSTl6ZUJYNEtqamdWNkcx?=
 =?utf-8?B?UFh2cDZNNDNUanJTMk5Rbzh4RitrcVRidm5rNGVzRDJLYUtXczQ0MVYyVXR1?=
 =?utf-8?B?N2FKOVRlWUYrbm9pL21BMDNTL0cvSGhRaVA1dEpGN2pwcUVMZFp2R2ZZME55?=
 =?utf-8?B?M1RQb3dBQWlyK2RIMTJVUEcwUkZpVkxGQklqWEVjMHlGNmtldmJYWGJVRUEv?=
 =?utf-8?B?TlpDUGxXZGxjV0xOVCs4L0hwb2lCSXNrU3FKbDdGaUhSODVrMUN5eWkwZmlR?=
 =?utf-8?B?RjU3VnBCWFpPSFZ6b2I4YnlKL0ZjTE1yWnYyN1lLaHpCcHQreFkyenQ1OUh3?=
 =?utf-8?B?ZU1XYTVza0tJSW1rVlFVNUtQSENWNnVmNWV5ZnhUdVFVUXhiQmZXdGxsWVJO?=
 =?utf-8?B?WlMzZEhyV0pNSTJLUnVmQVFFdGxJaDBNVzg4L3VpMEtOMzZsZkQ4S1RlUEwz?=
 =?utf-8?B?UGhoVXUrUDN0dGwvdnpLZ3U4ZmRCNFN5UkV1SDlyQlFNRTh5eC9sd1NldW5a?=
 =?utf-8?B?Nnp6RkFMSUNWT0lMKy9GcFNVNi9CWFdjTlI3YmovdW1ESFkzSm5NL0JOUDBQ?=
 =?utf-8?B?VXFJbTZQNk5XaURLd2V3YkozMTBaRCs1cm9FcU1MdDhmVmNsSFphU1FxZTUy?=
 =?utf-8?B?Tk1wVnJBS0FsdGRDZ2w5YXJrK21tb1dzd2lzYU5BMGs4dDJaVVQ1Vjl2a21k?=
 =?utf-8?B?dktsWHVJNmpMbHhQV2s3Y1IyejdSb2QyUWpxUjJOME05OXhZS09TcWlNVDJV?=
 =?utf-8?B?T0d4TkU2ZnhnU2p4a09hS1hMeHhJUXk0UzdObkJRZkh2Z2haYlltTkFJeXhN?=
 =?utf-8?B?MzRjYTl3ZUxESWJZQm9wQTJGdi9hby9OR1FDbEh3akYyRkx0dXQrNkVZOG4z?=
 =?utf-8?B?Z2d2S3BYeGw4aTBRL2JYUEZycGtlUjA0dXp0aS95NzdxaHRpOTZYV0VTeHQ1?=
 =?utf-8?B?aEUzbTMrS0Y3amNWaE9JVXU4dVRZU1c5SllwZXVtL2FyNlFrVEN6S0x5cnpw?=
 =?utf-8?B?RksrTzdjUG5PVTIyYTI5UDNHakF6Wm5WNVZpTUJ6Z09UQW9vODRtdy9PQUMy?=
 =?utf-8?B?VHhuK3pYaHBJOG9XSDFabTFzL3ZFd0Vhaytpekk0OHpmaVBUQnBMK2FiSm5n?=
 =?utf-8?B?Ri9ZQjM2OTZlQWRqVDRrTmcwaWVGY3cyT3RpYTlha28rdG8vTTBiblFxay9Y?=
 =?utf-8?B?aXFrM3B5QW1MT0cwc1Bmb1RmOUhsVjhNV3BlSnYrRS92dDJGWURoa2ZRVVBO?=
 =?utf-8?B?WkxsVmVyV2dLVFJDaXdFUE1zdEJsN0FBa29ZOS9mM0xQVHhjenBhK1FmcTJp?=
 =?utf-8?B?cXBzL0cxSEdhVG1Ed01PUE9waU9HR1BNYytlWktFVUFGb2FYSERRWGtsUTVM?=
 =?utf-8?B?NTZGL3JpTm4wbVRqdzhHRklwL0VCVTUzSU9MYmdobWdyN1RGU0U2R01Kczl3?=
 =?utf-8?B?QVRHUU5NZHlSRWRmWFo5TFlQWHh6L1diSGJpT25LenlEc3drOGxUOEV1dFlq?=
 =?utf-8?B?eW94TWMvU1dOMFRmWmFmQlg3Q0VYc2c3aGpTTEJKZVFZNUdVZitzaTg0Sys4?=
 =?utf-8?Q?RsIvxvUKZGfORi4D6B5a6amUEM9BWsiX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmlVZGFhdEZienU1em1OYVpNTHkvWTNMOUhwaFF4ejBvL1Y2dU5TL3pQemRF?=
 =?utf-8?B?L3ZvQlI5VkpMOUxlZEkzaWJUM3Z1RWZudFBBS25lWTZsNEhSR2FBalJYcWtT?=
 =?utf-8?B?QStPVEZWTzRJRVExU3pXVG1aYjhRZm9VQnQ5QUx0M3lGWXFSdm82dEtySlFz?=
 =?utf-8?B?bXR0b21nem5kbTNJTTA3ZGREZHNJTHVLVFhRdDlSNUhUVjFwWVdIZEYvRVJ5?=
 =?utf-8?B?TG82cUlzMkRManhRWndJR3l5VTVHRExDdERJQjJVWnpPYmJlRWZIdDROR3Yy?=
 =?utf-8?B?SWhObUFlVzdWUFVxczRsSDBjVjdlVHduY1M1Wngxdm1iWDh3Y2J4NkNRdXR2?=
 =?utf-8?B?T2RKU1VmN1NHSXZ6SjRFTXI3Zy9ObDVwQ3UxSkNxLzNNaFhGN2FZSGJDT3oz?=
 =?utf-8?B?b3ppZFBkbTM4cWxkTjVsMXUzOXFlQTJ4Q0ZhSW5SNnZVUmFGN2s2TzIrQ3ha?=
 =?utf-8?B?MXJ6K24wMlRYMVVqWHZLZ2lXaXAxUTF6cVd0K3pBTy85aEY3dGVKSUlOaXZU?=
 =?utf-8?B?RWVZcGtscFVYbDcwSVlFaDMvVUVwWjFtNGpLUEpBRDVEZTB1TWVyTW5YcXdP?=
 =?utf-8?B?Zlg0YlJzMlBwbGx1cmNmbEtWeXFvbXBybVY1RU9FUjF6OHlSRXRwUXViQVRO?=
 =?utf-8?B?UFp2VFZCc0ZndGU4cEpGVFNvSXFCWi9IZWo0aHhzanlya2oybUh4UUpUQ0FT?=
 =?utf-8?B?cW1xUURadHF2emFHNWtROTVCYVR2eklqSTIrOUpWeWZFb3VmMjZkdGdIeU5x?=
 =?utf-8?B?R0hOMGU0WUViWGMyZlo4Q3lhQUpIK3JhRThvQkpLcVVkU1hDdExBaDZSSSs0?=
 =?utf-8?B?UkdyL3l5bnQ2UTI2UTZMd3g4ZDdvd1pHZWNzcThhRStBNWY0QzY3NmJMOUt3?=
 =?utf-8?B?ckNjRWZnRUxLNmlESS9jejQ5RFpBTE40NUkvejE2a2ZDb1lPSktPNzJmRXN2?=
 =?utf-8?B?eDJ0NmRsSDU4VWdodkxrTTZqdVN2SndZOUVIN1FTOWNGekI3UUVsOE5zWGti?=
 =?utf-8?B?WEU2Tk5oTDRCNFRTVldSZitBU2E5a1FBeDdwSXNDWU9nWFFLRWVmaXJ6WUhE?=
 =?utf-8?B?VTlIZWcrUTVpSkxoMFJxbU8zYUYvSGp6Y1FGOXZXRHR4dzVkaHlZU0tKU3or?=
 =?utf-8?B?eXJ1cEs4dVF2ckVJQXRKUEIrV1h4VW1WVG42VjR0S0V3YVU3WkpJNWlicnBR?=
 =?utf-8?B?ZFYwTG1qYnZwRDN6TTVFNXBRcjQ1S3NHWldiS3dpY0xXMkpwWlRlV2ZsMi9a?=
 =?utf-8?B?WnFxR1VIN0ttRVBYdzZYTWcvWDNiTGdsVlJiWTlwRHNLU2NYclFLSFlsS3pn?=
 =?utf-8?B?T3RMTVk2MzduSVplbitJZXNFcm1Qa0Q2U1lQZGlFdUw5Y05sWUpzeGMyeStr?=
 =?utf-8?B?Z2tmZVZZeDVoYjVGb25CYmZ6VG5UYnN3V0hGV2ZZYndlVzJTMUdUOEw5NmV6?=
 =?utf-8?B?UDVyZC85S1puN01LQlNMSk16MEp0SVJJZUpqaFBTUUh6Rmkyc1N3S3lKWVB2?=
 =?utf-8?B?Q2VPSGdjbHRBZWNyQ3k5TFRrRUQveVhUdzByamVyV0VWZC9oakZzaXBtTmFv?=
 =?utf-8?B?OGFoVXBWbEFYM2o3SUZXMGVSS3VHWFlnSTl4L0haSWlNQ0Y4Wit2TVZGL20r?=
 =?utf-8?B?RUxNL1NBbkIvRWYxMldoUE41WXdmUnNEQlRJSGg1dTdqVW5GYW1ORWR1NE1J?=
 =?utf-8?B?Y1RrZEFPaktJWk1sdkdMblRwNHQ2VlI0WXFMRy82ZlR1RmowUXNISE90ZUZz?=
 =?utf-8?B?VFBseHRDZ0NCUklCRjZFTHZGQS9OOGV4K21hVGZOczJKeE14OC9TZzZEa3dk?=
 =?utf-8?B?VHFhRm55NWFQRGIrRTZlMDJJeE13d005RnJWWkdWc1lkUWFvclNvNUhraDND?=
 =?utf-8?B?ckVsdzdkU1AyVk5VSkF2NTltbW1VTW5nQkZuU3NWUlE3ZnJSWWpxVlhZOUpJ?=
 =?utf-8?B?R0F2QTZVb2dlaFdEZEtVR2xQWkp2by9IV3M2cVVHOCsrWGtsaGp0SDE0MFVN?=
 =?utf-8?B?eUZUeEJoV3Y1cWd5bFJFZ1FuSXlUK1pqZEo4ZWdtdWtOSUxLMDhXRkNJY3Fi?=
 =?utf-8?B?ZXB5cWZHTlFLbmlsSGJSZEdtbjhwb29iTnUyR05qc25hQXlqOVRyMUVYNmtI?=
 =?utf-8?Q?WVqp2VZ6jFanHtZNf+zs89OuU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3d40a8-f590-4a11-9dc3-08dd6dbfa0e0
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 06:13:16.4748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bZQFa4MktTtEjdbsawHoGQ1Dhhl1TBDJH4akFAyKa9qmuTS1W75Ytk4smcbYB5Lil6+e2xeuqdFUWTt1c/pKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5342


在 2025/3/27 21:40, Matthew Wilcox 写道:
> On Mon, Mar 24, 2025 at 10:13:03AM +0800, Huan Yang wrote:
>> HI Hillf,
> Hillf is banned from the mailing lists.  I suuggest not replying to
> any email that he sends to you privately.
OK
>
> https://lore.kernel.org/all/67cf7499597e9_1198729450@dwillia2-xfh.jf.intel.com.notmuch/
