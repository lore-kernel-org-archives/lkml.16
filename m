Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C1E23C397
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744139; cv=fail; b=qrpiScrFsola1LGSxg7HpZYHDUqOUF/Dsgo7VFrzogr3qSaHaYRcCT0bgoFOcUbhLsTNVvSpQBLOIvj4vFiR6eBqsH4dBniJ/83xtV8V2iT7e/gFV+Dl1FCzQ8R2gbnEizhvgoYUQ8vxszSdJ4V36YOsqd4pSHeeIztNrwTfc/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744139; c=relaxed/simple;
	bh=D6b5z51VZ5I5bETBdXj2BFnO8MZ+WocTlIFZhXVbrRI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WBvt4co55VkoNsyRofPfFtIsGFgSTaKeXRi8ac3ZIAzzeS06X2XdcdTKulxeO0s/SGwX2wmy8R+HVr6KAubJ2eEQhpLAUIkF7lewxdwMAStLHMORp1JI/Kmoeh8uWL2sgtxF44gG+n+g403WNGXEnt263w83oDZC45imtZebEg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fCvmteDo; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fCvmteDo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yt/jzvCeZWcvh6hYS0tyNJb6xsSqyMh5eEHtmZN3Wd/Ql5KNfpgOZM8VJGLZ2Qfb2+Fv2xZ/+itFyEzl5SeC8fP1vMnE01amLMvqCgQZu9NfkcPjIOzyly0i7Xg/WePmRD21sh+8a8Kl9/LBqDhcWOpp1HunZC+y1aSvyh6ThTZMCtMtdT1lZF6JtYUmNuLwmEU2KOHpHAYgygiAmjK2Myuxm7Cvsnjh2zCqtmdy/k8NTtSdBe28IiRWoBa/era3XSIwvGprLUbWdtwQEKyjATqQyOYKVp0tr+5g2YRJGbP3t3nNRT24XQwOMOnc7edB5Cvn/krDkKl0V2IrFFmhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g9WfROq/9ZaItuiKg5a8afqGYFS8q0KLvL1SuXTf0HY=;
 b=GpbDyqlCTmAGo/hteQEgvy+5gm+qAgIEhCc6XOqA7Y/6uMLszl7QshNweiMC48vquuD5QtbK5/IKAK4+/tv9LSbzhqVh5PUjUa7bO1VnBNatJpbyOScolqhWo/gq+aCgdwcecMglBJ30x8dVq21PRQXLn6cqfBp+vMTLZGkXotHenWoNgiwpgF7zyHBpkgHhfMkcVv13SdSJafpwVnM1keur+fdw89ZoEK22lrp4P9waY/BR/YvYwX98PEUUqq3tv7IqrXZU2hNYeKU2ugaIk/KIFM44hSN9lWqdeGHHRMT4H+5SfNEOyCjlQeNSy7p+TpNR/lNSm7Kcv6Ei8BEyjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g9WfROq/9ZaItuiKg5a8afqGYFS8q0KLvL1SuXTf0HY=;
 b=fCvmteDo0nnlTVdKKhs+lK6v7ypZ73rpU3aSbUsBJURsiol3+36vLhY92wt6BJAc9fldoio7G6flrFdNuTHVHJxLj0eE+NbnDg2Tz3leSxMck7dm6sjFVxKi9v/l2zv4nKHj0Y44StdJEEcXzrrQ8sdhX7R4/ca/XKC4hceuRTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by IA1PR12MB6282.namprd12.prod.outlook.com (2603:10b6:208:3e6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 19:08:53 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 19:08:53 +0000
Message-ID: <d80b3b3d-4f26-4dc1-93c7-78aa5f268cce@amd.com>
Date: Wed, 16 Apr 2025 00:38:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] mm/vmalloc.c: change purge_ndoes as local static
 variable
To: Baoquan He <bhe@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-kernel@vger.kernel.org
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-2-bhe@redhat.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250415023952.27850-2-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::25) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|IA1PR12MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: eb644149-dcb7-4ae9-eace-08dd7c50f63e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajg0MW5UVzE4SnpZMVpralhmYUNtTU5hQzJWeFR4NFdhRDRiMndubCtOTGhG?=
 =?utf-8?B?Vnp6RkVaczIvN3RRQko0TktJdVkzcGVMaHdnV1lubFl2bU1vR1hGaHE4YmtH?=
 =?utf-8?B?emJyMVk4dVBvT1R6RzEvUUR6ak1SVmVMMkdzVCtnQ2loK1A0R2IxWWpiVnk3?=
 =?utf-8?B?eFV2djRSL2FLc2x0Mk10T0lsU0lvVUFwVG5FaCtia253QVBsdER3N29VYXAx?=
 =?utf-8?B?cFl1S0FBanhQVHVPbkozRzlGOVNmV09lNmtuRDNHQytvc2RmWTkrcmt6NzZ4?=
 =?utf-8?B?eHY2bkh4OVd4NElKbGRxQkFjNjQ5a2JCTnR3QjQ2aHU4d2JDa2lDcFYxZ3NK?=
 =?utf-8?B?Z2NVRWJHWlNWdVVRbjNKT0hRbncvbUlzbVZPaVlqb1BFRjhKa3BselVmQVFV?=
 =?utf-8?B?N0N4cGxXcm90VzNWM1FyVWlVNE1aNDlZcmljSUcxK3AxZ3FWTWpHcGNKd3px?=
 =?utf-8?B?R2EvZnU5blQ5dzc2UVNHaHlhcGR6blgxbHpMckVJMVZ4NXdmV3cvL0g1dEha?=
 =?utf-8?B?OVNUbFVpWStoUlYyNlhXN0JJazNnalFzZmJoZ1hQMXZObkY5dzJ3d0FYak1O?=
 =?utf-8?B?YzJyVnU3ZXpkZ0VKeXRBR2txTnR1aEVGaHZjbEZvYUpKVHI0V3lNTkZXcytC?=
 =?utf-8?B?cHBsbHlvSlVyTXlvL2NhdVUyemV1eE1oQVE0NXNQVGsweVZ4TEYreFY3WFlO?=
 =?utf-8?B?SWpSdEQ0cnV5czM3emRmWmtjN20wQkNaeGZ0OVEvTVRDOFljVXhHTnNsMDZO?=
 =?utf-8?B?TzRNdmlOeDcrZ1k2Nk96cUMxdWs1cStVQWFuc2M3alNsZExvMTVDRFplakMy?=
 =?utf-8?B?clZKQ0tScGFPYlJGSzFyd1pqVFRSYmpNYkxLYkg1TXZPZ0VjRDdoY1VlYWJm?=
 =?utf-8?B?ZXlpM3JmZXJZWG5EWWtFNXZZdFlsOW9MTGdXL044NWY5QUY4Yy8venpITkFk?=
 =?utf-8?B?dGo5amFEMlc5dnp5b2dTb2E4Q1RyTDdIUHBKbUFHSUYzN1U3c0I2VDRPRllq?=
 =?utf-8?B?RUtMTFg3cGRoVVNXeC9HdTNBNTZ3QWc5RUVkU2FJZ3ZKeTFWWmxwV1FTczNY?=
 =?utf-8?B?LysxR1VkdVE0K1hyMG5sVkMyYTM4bVY0WVpCNVlRT0RuOVJDQWFhZFdra1d6?=
 =?utf-8?B?L1I5ZUpmanY1RkQ3QW00M0FPTWxjU2ZtUldOMHRaQVVEN2NHeW9PVDFWNytm?=
 =?utf-8?B?YzRqUURSaE9QKzdyeGFsRS8rQWVweElWMW8zTVltcEwxZnZVWlJ6OWlFTks3?=
 =?utf-8?B?NlhzclhyVjl3MVd4YlZEOFFmUU96WWQzRkpvNzJ0SnhkVk1zSER5VWJqYWU2?=
 =?utf-8?B?VTF1NVBBdTUvOTRVYklncW9XckJXY3ZJRitwUXcrYnlxT2ZxZHMxbmw5blZw?=
 =?utf-8?B?b2c5MkdBdnQ2SG02b2xoMzVwYStqMjBWT0VQOS92ODh2d2ZJeDVZKzE5NVRO?=
 =?utf-8?B?YWhZSlZmOVJpclVpOWRKUkdQeTZHbE5PM1UzNU92QlJqMjBlZDErQlc3T3BZ?=
 =?utf-8?B?OFRIbHBsVjZveHpXUW83L1prOXo2U01xbUJxSXY0Nzl6RjBBVzkxeGlxWTFJ?=
 =?utf-8?B?REpPbGZwLzJlUWlDbi9qK2Y1UlpnN3AydnJjL0tMQ0N2ZWV4QmVKTEl4SU4r?=
 =?utf-8?B?VWZNeWJhVzhITHBMZllZa0o0eGxoeGc2cm9KREdlUWJXNGUwNFlIaDBoaXUy?=
 =?utf-8?B?bkVST1pNdkt5RUJHMmRVcndLZURIOExzUXRNYUFLcnhXbDNyTHVOVCtnOWFX?=
 =?utf-8?B?ZmJoN2VsSngvK0lTUjFoS1ZHVU9ZdVhnY3BxQjhDdGpObHBLK005Mjh0MHlP?=
 =?utf-8?B?Ymt2ZUdPa3BaMlRQL1ZtaDVKNkdGSEFGcStDQUFLTzQ5TEFRTURmYVBkdUYx?=
 =?utf-8?B?V01HL2NPVUJVZmdFR3JtVmJoOHdjRzA0QjZJWlRFUVlaN0Y2THNJT29CZjU0?=
 =?utf-8?Q?qMDL+ugJYMs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGNSc3dHZ2tKTElCSDYvOThIaWFNUm5KQjJSdUxIcTJCK2s3aWpIczVUdHIy?=
 =?utf-8?B?dUVKQTk0SlliOWxBbi9RZXRxbFk4MGlQbVFpY3RJZTBaVjYwWVZiMFVwajlL?=
 =?utf-8?B?Y2h3QzIycGV4VjFYUUEyWGVKM2JvS0l1RkpSVld6TVJHQWxtb3lQbW85eVF1?=
 =?utf-8?B?YlVicmxRaUNYcC84U2FvZS9UWkRMdVQ2Y1pyWjQvUkdoelF6MDBOTWtMcEVk?=
 =?utf-8?B?eVdUVW0vSHpCeER2akJYRm16U3A4ZDE2RW1WNFp5dHpIT3VTV1Fka2QwQjh4?=
 =?utf-8?B?ZkRTamxMOUNiaE8vd2d4eCtuWmQ1bEtXNFFXY0xsQ01uU2R3L2VtRk1iOWVi?=
 =?utf-8?B?akNhS2Y3cmFkUVFvbkRoajZqUEV2ODJwcWh4WVZac3hQRjdGWGNsdUNFQmZz?=
 =?utf-8?B?V0JXdUlmMGJXZGEyV1JwUHVzVGJBT3lIWlJvbmdiTGNPczkrVWhzbkRiWFIy?=
 =?utf-8?B?LzVSM3R1TmZZSHpkOXVldExlL0xJNHE1bHJ5UFhHditTWkRqT0E2aktMVFFY?=
 =?utf-8?B?V1hTV1dsV3VreHhxNTZaSDhxWkttNE53bUhoRDJrdkNtVlNiSnBTSHRlY1FC?=
 =?utf-8?B?bnU3cjA4dCs3bERrMUFxZVRNSm53Q1dDMlJmaWRtRWxvZ2dJNW4zQUptUEdw?=
 =?utf-8?B?VFJYdnl3dW5xSGY5RjVzbmtJMjdobWNCcTNCRFRPanN1aFJOU3E3N2twWlJP?=
 =?utf-8?B?bTNzMTNIWXFWOGpTcWs3SE5zWU10WnVKQWV2a1dVbEpWL1VQNXZzWmFGZ0c2?=
 =?utf-8?B?WTZnTGZhQUlDMFkxLzdLUU52SmJVNGRwYVdpRzcvOVg2dlBVUVRHSUV2dENn?=
 =?utf-8?B?NGhCSCtwa01NWjVqVktoZjJzZ0xxTjkxSy9mTXlhb0syWkdVelhYRTJFWW1M?=
 =?utf-8?B?Z0x4TXVTQTlJWU0rT0swanVPUm5HcEJxNnE0VktRYmJ3Y2c1N3hkZHRjcmxy?=
 =?utf-8?B?Y01vbHJxSmVCS21SWlFoQ3RTRzZXeVBGUDRkUlQ1WFFaZnFCK21ETWRWNHI4?=
 =?utf-8?B?WXJ6VXlQYWRiSkt3eTdMT2NVdGlpYnY3ZEZIbUlJZWkxR1NrTDBXdDR3T01Z?=
 =?utf-8?B?cEYzZ25INTRmYi9Pc3drTGpsQ0x2WXZMTDBod3RiVWs1czJLMDY4OUYyMWFS?=
 =?utf-8?B?Ty84Q1ZWN1k4RDZVSjhsSUo3djRqTWVGSDZCVlBmd2pEaHljMHZlL2RiMHhQ?=
 =?utf-8?B?S0VtcUFVVklDazlzYThUZGdxV2RRdFRVNFFjMzZiZ1dLd2ZlWHlqclE1OGV4?=
 =?utf-8?B?eUljOGhPU081YTB5V0RvWnpJS3p2UVoxNndKaTdUcm9Ka244Wm5HTkQrTUZ6?=
 =?utf-8?B?bzVGMmtaSTRzWTR5U1dMQm5YNWpYZTdoYmU0M0llSG9ERm9qSUlNUjRMc3ly?=
 =?utf-8?B?SlliMmt6N2txTE91UlhXRFFRKzhPRWJ5eGFGekxpVHdUZSs5Y3ZNNVRiS3RJ?=
 =?utf-8?B?a2tybDRvWUh2Znlvc0ZjL216Yk9sanYyT1BNaEJwSnhXcm9BdWt2ZmhNWTVu?=
 =?utf-8?B?blE0OXlHZWxlaFRZTm1ta1J0bStLMHNRT0ZsbUJYYXpEa1FjbmlYVU41ODIv?=
 =?utf-8?B?WlNkMzJENTB5a0w1RjNjVi9OazZCOFdueG14RDMvNTFhS09GMjNKMDFPZlo1?=
 =?utf-8?B?d3FiaVAwYzdWZzNPTTZ4Y1RhZlA5NmRlT1R1Tzc2cmVSRXVDd0g3Q3dSUDZl?=
 =?utf-8?B?T0pqWjd5dVhEa0pYT1ZxTHVOTk4yZ3lmSDB2eFVYL2JYMlRETXY3VVZjVTJ4?=
 =?utf-8?B?SGlwVW1McTdrdXQzdis1MG9GN0NaeEV3YmpTUEkzZm1Kc0R4NEVrY2lkd1dZ?=
 =?utf-8?B?L0tITHVxUGRlNlJwV254R05BQzJUTmphQnlMKy81Q2R2eW9IMVQ5eW1iclZx?=
 =?utf-8?B?QW9lWnpxTFVoZzRwSlFMeVlsaWxMeFQ2Y0JxaVZsakhLQ2RaNHZpNXlSQzU0?=
 =?utf-8?B?bElSZmprcHJldS9MV0Q0MXhrV2REYUdienUzOHhjdzBGUkt0WHAzQkZtbXla?=
 =?utf-8?B?TXo2eFBrd1NUeGI0ZVZYMEE3OUxBZTNYVWNSc1c3d0tkR1E3elFSOVN1dENT?=
 =?utf-8?B?d0N0bzZtWXZxT0RZdFZwclo5emJHb21kellRWjg2ZXltNkFORDFiNXR1cUI0?=
 =?utf-8?Q?vV57AqpuZa+5Ml/Qflwy4IWyy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb644149-dcb7-4ae9-eace-08dd7c50f63e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 19:08:53.1109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvLjciBIPff6u8uwv5i3UvNCIjYpk+XEf9TTV+BVOClyfsMFSuACLjnyaQ/5pdb1/HgvtxgfvoOVxb8MTx/qpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6282

On 4/15/2025 8:09 AM, Baoquan He wrote:
> Static variable 'purge_ndoes' is defined in global scope, while it's
> only used in function __purge_vmap_area_lazy(). It mainly serves to
> avoid memory allocation repeatedly, especially when NR_CPUS is big.
> 
> While a local static variable can also satisfy the demand, and can
> improve code readibility. Hence move its definition into
> __purge_vmap_area_lazy().
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/vmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6ee7fc2ec986..aca1905d3397 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -2128,7 +2128,6 @@ static DEFINE_MUTEX(vmap_purge_lock);
>  
>  /* for per-CPU blocks */
>  static void purge_fragmented_blocks_allcpus(void);
> -static cpumask_t purge_nodes;
>  
>  static void
>  reclaim_list_global(struct list_head *head)
> @@ -2261,6 +2260,7 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end,
>  {
>  	unsigned long nr_purged_areas = 0;
>  	unsigned int nr_purge_helpers;
> +	static cpumask_t purge_nodes;
>  	unsigned int nr_purge_nodes;
>  	struct vmap_node *vn;
>  	int i;

Reviewed-by: Shivank Garg <shivankg@amd.com>
Tested-by: Shivank Garg <shivankg@amd.com>
