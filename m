Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D664E26FA41;
	Tue,  8 Apr 2025 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117130; cv=fail; b=HL12aQ54bcBsgocv4p8h+32caFvbmxEeBY8XwwwFArv5fxspkM3IcuGpSXyf3k1Ffmw4eLCgp8CJIVVM3Vt3RnvlldJu1e/NXNGdPzt/EQ9i253U1bS6zsor85YlDN9cANAUCYfrRyP5UbU7ciRKTjWIsuFkzUHN3rzGLua1nuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117130; c=relaxed/simple;
	bh=g3QKDvfhsk2GAI2mRKSaUm3V/hcLXaDErVhj98ymhGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=teTYOa6iwBh0MG15b/5RJMXiJrr4v0HasTM8JAXjBBm+B59Da61OfUiCv4JsLjT6Kcvkkwf3LecBM8e4ChkUEM4HSga2IfJ7BU8ECR1l52kc9ejD0KPiAiIBkllVQ7kLxftnl/0FQ7EW75XxObK20vpWeHAqLgNgEP8K37uy2o4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VeocFFTV; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kqwjPbbz; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VeocFFTV";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kqwjPbbz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5385den8006814;
	Tue, 8 Apr 2025 07:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yJOqC6wo9qdmSuZP0vcf2izbU73bAhtwA9oHIf1oryA=; b=
	VeocFFTVZFyFMUgh1ABl9y5WOr9iDpa+JZ9dLh0oOKakhzlKLsyudzV+atJiJYPg
	xgDEuZYbxz5vqcUbqX7xp0JZe5NAxsZetXITCnsYpaWGcBsLr3d+V8B+jI9u+Zws
	bRNln5gEMUfEnq2Bo+m6tk8z5u+SMxA6EzVwlzRW2KyW9lB2Nl4GPI4ys1MiRkss
	jFS5yFO/AFth1GszSP5vZmZ+oWAw4QRKg1HCIZYRcU2XWX1MFFEKZJ4BqHWQxs8g
	URff9lzaf/FLoO/vHA3E+es8CXYoVikC8OpcCRWpPRn9QiORH8iq80IxWORaoRwC
	BRRL2y/pHPlqCk5/X0iC6w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45u0xgm71d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 07:58:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJY9jqBumAH0wQpcGfYmB/j8eC6sBxTXW84pgEaYqAbvgS1/aKFzGjJ1bxe3lUxsAnlcLNx2wdq6yNFPU+6TU1ERpOYD5zvhIP7JZdcAwZa7V5Vn6b0b3z3syv6Iy9MF8M/HPc/lWCMhZayaqM0EjCYBO3suARo6DYwX4Vwk7K2D9deY3Wo6Ptu/LcZCNZjPiBVwK1qHf0h8e0lw/XvG2UEmZroo7aWcGEPA6xQtIa8z6WJpI29X4DqCfn7Znu4k9mm5aMorFTB2SO9X5CmO5aXat8uaf9sBhIylyd2YYF+FwOUtlqUn6sU+zGCurL4ttk9JmuJiNHDPovZKvVAMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJOqC6wo9qdmSuZP0vcf2izbU73bAhtwA9oHIf1oryA=;
 b=rVLD5OQaR6AYDW4a6WKbdiLrAeCbRs/g/slfYUy2DJ49zKOi34N6Pcq2dkaUMIawhZU2MQDtecgXNr4gYQw4J0z7J++MApJcr+08JyTd952/x39At9MWu92ZMN+ResIK//IC5hDCKQV0GJBNdEjAiNyf+sMD3S9NaMxzzQzex63l+yrNoQPslrswM+g2rdhyXwIp9WtDPDB1tf4wD9wgwOJ96YRkfTBw+04I+cbZzeoXw36gxO5dRdloKmtNHtagrdijNB7k/F8ibxpdfWTGC7wq3iM4mPcj65M4aeZJyLUNEdG8lHDFZoaoOG/uE5GIXZg1Fucj4qZL49TS4OL+rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJOqC6wo9qdmSuZP0vcf2izbU73bAhtwA9oHIf1oryA=;
 b=kqwjPbbzmNrTLToC2Wo2IZTt2FByHwD5WDh+MiA4ODRjHK6Bu5oZTN/zkoALuYxLYUfw1cPIVnBkXPo4hbAa4EwD1UF+m470vieNrEwShfxJlegLIQd0zUggGeanGcZpvMYtE4LxgP1pQSJ0UBYIVaiS3p2F9FEqs1J1dXc4y/c=
Received: from CH0PR03CA0315.namprd03.prod.outlook.com (2603:10b6:610:118::15)
 by IA1PR19MB6275.namprd19.prod.outlook.com (2603:10b6:208:3e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 12:58:25 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:118:cafe::e5) by CH0PR03CA0315.outlook.office365.com
 (2603:10b6:610:118::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 12:58:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 8 Apr 2025 12:58:24 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ADB83406544;
	Tue,  8 Apr 2025 12:58:23 +0000 (UTC)
Received: from [198.90.208.23] (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9930A820259;
	Tue,  8 Apr 2025 12:58:23 +0000 (UTC)
Message-ID: <e3447ca4-ea19-4c84-802e-dc3832ea2dd6@opensource.cirrus.com>
Date: Tue, 8 Apr 2025 13:58:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] ASoC: cs35l56: Add struct to index firmware
 registers
To: Mark Brown <broonie@kernel.org>,
        Stefan Binding <sbinding@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-3-sbinding@opensource.cirrus.com>
 <c1043fc8-40e3-4ff9-bade-bedfe7a19a18@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <c1043fc8-40e3-4ff9-bade-bedfe7a19a18@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|IA1PR19MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: 367876f0-c3bd-4676-431e-08dd769d0ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzJEQ01VRldOS2EyMklaWm1YVzFkSktibXJLSjI3cUJ5WmJLZWRZaXdIVFgr?=
 =?utf-8?B?UkU2TGMwSE1vaVcxMVNOLzkvZTR4eFQ5OWRaV1hsczh4NVQ3M054Z1IwMGpa?=
 =?utf-8?B?b2tiR0g0U2RVNVFJMGdLeHNyTzV4Mk8xUW9pK2s3Umo2eDJlb2pYbXhCRFBG?=
 =?utf-8?B?OTlKR0ppWmhRaTBHejZBVDJyV0NJWUk2OE5KUjkzQnJUbENWZlcweVFQZVVn?=
 =?utf-8?B?NzlncERMbXlkYllLUjJOSkI3M09hR0ZEa01DRVVpK0hwMTNtQlVkK041MUlN?=
 =?utf-8?B?V3FEV0lqeGlkOGtpTGZ5UUtwbTZwWU5xcE9nRTh0Tlk2S2VZSzMvTk4zQkpS?=
 =?utf-8?B?WTg2UXI5cXVVS1ZqbElXWGlRSUd5cUd2cjJTSjhSdWtrZWt5TW5HeWNhWmox?=
 =?utf-8?B?SEpBWWZGS0V3UER3VE1NbjlFZ014ZTZSQVdlVFplZ1hKR24wOUdqakdJYTN6?=
 =?utf-8?B?UUhJRjJ2azhFaGg1NEl0WFJlZ0RzT2JrZmpTcUgvd1ZOSjI5UmExYSs0SkQ1?=
 =?utf-8?B?VXZVTklWRzFCam02MW50S3U0blhKQ3dkaHVoNWdGV1crRUxkakcwenZUckNz?=
 =?utf-8?B?OVVXUHZmY2N3dko3bEgzU1FCbGhEK0lpT0FvOEFYVERoU2dTcGE4Y283ck93?=
 =?utf-8?B?clkzZmVPMXRRSzg5NEtldXZWaE50Zmd2aWJrQlB5c1RQRDB1RXRpWi9Da29j?=
 =?utf-8?B?YmlYOE5UWnlFR0pVakphYi81N01ncWdEQkFubVp4OVkzd3BGZ0FGaTlKRTVk?=
 =?utf-8?B?ZUp5ZnFjRTlCYk9ueTBlS2lGWDJUc3NGWW5qZGh0aEo1WW1FOUR0TG16OEJS?=
 =?utf-8?B?aGJ4NWdxSkVFQUVabUdyK2pOczlFaUY0SFZnb3BjbldOYUVCSzJSSFpaUzdU?=
 =?utf-8?B?UlJTcCtmOVIrQjhyQ0QzV1F6NjFseHVGazdhcHpHNUg2UnBUSStxa210UW9P?=
 =?utf-8?B?R00vdXlCSi94dlNsQWxlVWJtNXlBcmhnL3pmWFh3RzFBc0pnUjZsdU5zS05O?=
 =?utf-8?B?ZVJGZXN1dkZOSFQzS0xIaVBKOHlIZkIwQndpaWJYQWhxODQ1UHdVbTM4MHBT?=
 =?utf-8?B?UUNJYnI0ejR2aDBDc1krbDdGbkxVSnF2bXE1SVFxWEFKbE5DSDRhbjVvZjFX?=
 =?utf-8?B?RHNscElJOENXb2YrSG9mOGtYWi84QnJGbnhFZ3pMQWhjc2RBTEtzbE1waHpE?=
 =?utf-8?B?WDdTczdLRS9abSt6aS9EcEN3RFVrRlp0YUFzekxqZkdQaGE1Mit6elBYV1JU?=
 =?utf-8?B?QzBueTVtK214REgwUGlGWUNVMEZRWnY3ZHFDK3lmTm5JMEhhbjF1NmNoSll3?=
 =?utf-8?B?VTROeFFmQkQyVGpWOGxGUTNGT1NVTzNwUkkrMEJPMGoxdHV2TUwzNEM0ckNM?=
 =?utf-8?B?MDFrTmZwbTAvT2hrMHVoUVgzQ0FWK1diM0FJV1BlUk05T1NtVERidmJrWmIw?=
 =?utf-8?B?bHc5WWt4cXhPTGl5NFNSWDA3NDBlRGhFcDBWMWdHazVKRnlIQUVYSStiM09G?=
 =?utf-8?B?SldPMjNOeGZaV0RkYktHY2VQTmgwclRIbjZwWHpCNm5NSnRhRjZhTWl5RHVF?=
 =?utf-8?B?enZrNExudXlkS1VVT2YxL0thdVE4L29zUGVHVjJpcWZiZHNRL2xnWGJWV1ht?=
 =?utf-8?B?amdTY0R3V2o3S1k4V1hVV0tmdHZqbm1xczBCNURYUVV4MmFsSGszVTJ4UWNR?=
 =?utf-8?B?WVBLM0FubW1OYkJTMkdmcENQV3JQU0lRd2JCYUtDd0o3Q2Y4OWxITzFnUTli?=
 =?utf-8?B?M1drdzdSNDdPQjhyTjRlZEpBREEvTGwwMGg3YVFsc3F2RjN2QkdJN1B5bUNr?=
 =?utf-8?B?K0RpMXJRcnRpcjNYV2ZvTUxldjlXWllsc3QwZHEyK0pYQzMrUDVKNEMxayta?=
 =?utf-8?B?WGRzNXEwMHpwRGlHMEFzMFBBd2Y0enZQV29uQ2dzU2hESW51eHpVZjBGMGM2?=
 =?utf-8?B?QWJsRTh4eVFjK2E2UUdEMnR1NWZkUDdhL28xT21qNUMrdFFGY0xVZnkwSDVk?=
 =?utf-8?B?V3d0VmtkOFk4azZnRW0yRWNKY3VtbXlacXhzUFZOQS9qVE4yTytpSHRqRTgx?=
 =?utf-8?Q?1EyvbF?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 12:58:24.8365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 367876f0-c3bd-4676-431e-08dd769d0ca7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6275
X-Proofpoint-GUID: yBe7nSdKlkbQ94sh6kghHcBJ9R1Ni1Xk
X-Authority-Analysis: v=2.4 cv=bOIWIO+Z c=1 sm=1 tr=0 ts=67f51d79 cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=D_BJW31Sfilxvfs3FaoA:9 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: yBe7nSdKlkbQ94sh6kghHcBJ9R1Ni1Xk
X-Proofpoint-Spam-Reason: safe

On 07/04/2025 8:16 pm, Mark Brown wrote:
> On Mon, Apr 07, 2025 at 04:16:41PM +0100, Stefan Binding wrote:
> 
>> Firmware based registers may be different addresses across different
>> device ids and revision ids. Create a structure to store and access
>> these addresses.
> 
> This is fine but note that this is the use case that the regmap_field_
> APIs were created for, that also helps deal with things if anyone is
> clever and resizes fields or shifts within registers.  It's purely a
> question of taste if you want to use that.

The regmap_field stuff looks like a lot of unnecessary complexity and
overhead just for 6 registers with alternate addresses.

(In fact, the regmap_field stuff looks like an over-complex way of
solving a non-problem. The original commit is talking about replacing
masks and shifts "all over the code" to make the code neater. But
really, all those extra structs and pointers and allocated memory just
to replace a logical & or | ? Every struct regmap_field has a pointer
to the struct regmap !!?! So if I've got 100 fields there are 100 copies
of the struct regmap pointer that my driver already has.)
