Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2107.outbound.protection.outlook.com [40.107.249.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785C52580D0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745391601; cv=fail; b=rGkMkBV4A9CbB7V9wEJvf2OXYFGG6N6VZMD9esqj/3OCgcjy1DEITRgdVM3dyldjTrljmQm9ZzT2UxaLEPCnQWRx7BvxHSWPh93s6wxuYW8zFTm7cdOHNbEur6SJ8NWgkBAQhfAquFfR2GcAj+QMY/Dwtin0XJHaDUjXAmZMAME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745391601; c=relaxed/simple;
	bh=18auVoT5CXjzXtoR3YWU6pfVcsiV8u/blkoxpMB3JO0=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oiombZERQhOuAg87vSsFm29legyhvXU+AwH2q1j2pGOOGM2gEdUj4HeY7zw+ZaUyjudKaP/OBsxN6fN+/n5CpBb8IIUtb80RTChwtYBXEJJVPjQ9gIe0FqRXycHXEnajvQrf/99TNot/Fm9UlLWU5zMCszW785WUepUaOtl8JhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=t5AqjDxn; arc=fail smtp.client-ip=40.107.249.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="t5AqjDxn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oyu5RJqhktQf/LIznmEH/B2jFWotphbHo9jk9jU4heSZ22ifhTH5BA+90ajKlEW+qXXiyOSG6f2wwYG67ro7GnN2xX6h092fcXs14vplsWMVg8f8r+oxGEHZ2z0VVY3meDExijrxdJ3Zb7htRSqH47ofLAyHsUrS3iZvlh6cDlj3JdjcvtNox63udNX7dUxEqeRyJiOB2Qd48RKDRgIk/vKkHFT0kUxL369zlvaYoPu8FwZh9PUSnQ9Cr4UCVPcceZgzuRKOLRQzRZSuIIrqEiGoLcr60LMKJW9RgDsRmrGbI8ZFw+dLvZDa/qi1z4FKfCyyioaAbVBj8j6Vn7fJNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qDtEYamRKOkIz1CDELHskVQjOz/RgpQpauim7KbwR4=;
 b=REiNbEicOKYJ1qfBjLwpiopjSAr4Wr1UrLhOgmpcvWbws9cbILkOvdfnVQ9D0R/+iaxXAXfGZhovYqdYV9VCb3johUJCSju3KO36gsRlarAzD/3/UjriR56nUh3n2e9tw88y2TLhsvuXGfWKgY70DxVHQRW21BWlRaXBq9P8q7eJyPr4VQj6naYpAwuV/d0wrcZqBWx8N3YW/JydFo7tvP9x7PsykQuKzdCsg2j7lliUnLwcnfgvmaNZCpBSg0ARbp8jLnIhpXTQRKHDfAvTc3LHiXGvaGVjU/Jelx42xQuZyMEue2120OptnLzn9tGRZ92gFrFLb4mi/ukoqd3Zhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qDtEYamRKOkIz1CDELHskVQjOz/RgpQpauim7KbwR4=;
 b=t5AqjDxnTLKAmnVySmqfhAQRZLWqEpZi9O026S/f6RKGzy97pNrxEpST3IQGBPINtTTQaxxz/CU7KaRadhA5hnSU6QuKlYHGhizd4RwyHMcvTVMpSCeihpxMmo3unr180/Nn5LmKZHp3r1J/wqulSPaWIyBgkQ978qfoijXOMBqoz8uw+4Z5bkl20HXPuIJAOZncliBtVwZFB9Vb1e3hgFtVaOLgGYgg2K+WqY5Gn4EDhxES6gGZGzdBxYosxDmDpKi/q9dRyTB8INMy8XY+xiKMVKJs/h1aF2Nqa/d+Ej40WQ1TsrUyUzj6mjW76T4JGil+XRzu8/74ftw1ne6csA==
Received: from AS9PR06CA0183.eurprd06.prod.outlook.com (2603:10a6:20b:45d::17)
 by AS4PR04MB9692.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 06:59:49 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:20b:45d:cafe::e5) by AS9PR06CA0183.outlook.office365.com
 (2603:10a6:20b:45d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 23 Apr 2025 06:59:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 06:59:49 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (104.47.51.234) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 23 Apr 2025 06:59:48 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by VE1PR04MB7405.eurprd04.prod.outlook.com (2603:10a6:800:1a4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 06:59:44 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 06:59:44 +0000
Message-ID: <f3051d1d-ecb2-4a93-ad6b-76ab7a5538af@topic.nl>
Date: Wed, 23 Apr 2025 08:59:43 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] phy-zynqmp: Postpone getting clock rate until actually
 needed
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: linux-phy@lists.infradead.org, Kishon Vijay Abraham I
 <kishon@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.7a5992b5-aa78-4b18-bf5c-70f893b58f48@emailsignatures365.codetwo.com>
 <20250314150431.28319-1-mike.looijmans@topic.nl>
 <20250422221802.GB32759@pendragon.ideasonboard.com>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <20250422221802.GB32759@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P190CA0065.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::10) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|VE1PR04MB7405:EE_|AMS0EPF000001B4:EE_|AS4PR04MB9692:EE_
X-MS-Office365-Filtering-Correlation-Id: e0102330-9926-4f7f-4cfc-08dd82347076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Q0YvU3N1ZVVWRVVEMlA1VVdrcEpEbytrVHpvT2lXTXJrRWpSL0RHYnB6dkxk?=
 =?utf-8?B?Rk5WVVB0VEVsQ0FtejQ1REtLQlZPTE1vOTVPN2M2djA0WVNhd1NseHQ0Zng1?=
 =?utf-8?B?eXkvNWtKM1lLSy9iZVVadmQrL0JQb3BjcXI2SjFNLzc2WmtEdzloVi9RN0ky?=
 =?utf-8?B?R04zWW5kemhjTUJFMDUya0pJdzZEU2lLb2NyQWFpR283RG1DTFRxU3pOYW5T?=
 =?utf-8?B?ZlA3OGlKK0RmdFhZTGNqeHNUWks2eHBVMFRTYkM5c0RuQmZIMTFWT3FuamlY?=
 =?utf-8?B?TFE3WVN4dWp1a1NLdklMTnR5RFYrYlRUWWw4UGwrTm5La09IbGIrdFhXb3Fs?=
 =?utf-8?B?WXZGNnlGNE9xNU01ZG5lQjNkZkhpNm9rVDVnVEk1R1Y0bnVkQWR3NU91T092?=
 =?utf-8?B?T2ptY3lSUldyc0NGU1FXTU1rN285bzdvQ2ozNitJZzNRUUtoV3N6Rm1tUC9s?=
 =?utf-8?B?cXpQS3Q5TWJXelhwY2ZZazllYnVtWjZCN1puUEtBV1hlVFYrQk85SkxKT1NI?=
 =?utf-8?B?d0ZseVh0NWRUTTVkeVlyYllyY0lvRm0wbEJ1VjdXaGc3MDROUG1SL2NBWTk4?=
 =?utf-8?B?M08wNHJlUVFVYjRSeU9wSmxyL3ZLZlNPdjBjTkdKV0hJbyt5amxMTDBaemRI?=
 =?utf-8?B?aXRpVUJQb2RDUWVoTzU4dkNObElSTlZXbHRyVHAvWStRcGo2U0pzeUNveGp4?=
 =?utf-8?B?U3gvTTRqMTREVmQwdjhkTkRTT2JMVDFURDZWYWRBTkhvemtGeXA2QURQQzZT?=
 =?utf-8?B?Wlp0TktzTDRZTi94VEJ5bHRvN1FncG92NDgwWjJ6L1BJUUsxNVZDN21TNjN2?=
 =?utf-8?B?TUppSGx1N3oyam9WZlg0aExKYytGK1pXa2dSYzkybitBNWRWN3RFbkRpb09M?=
 =?utf-8?B?UGNMMG80L2piQ3RCUkdodnZHS0Qva0VOT3hic0MwcG1ZYmdNY2VkWXdJT2Iz?=
 =?utf-8?B?TmZIMm5XaGI0QThuRHhGTUVXZzhmUEtzYkNaUFY3K2c1akU3ZU1OMVd5TjFY?=
 =?utf-8?B?TnlQVmNzUkd4MkxmM2w3SWUraWhYdWE5VjgrbUo5NjQ1c3B4L2R3d0dIMjl0?=
 =?utf-8?B?WVY3S1Y1NUUxR29SdHFXWXArV0kxUnFKY1QwcGNZM1JiNUlqUjhiUEhDWFZP?=
 =?utf-8?B?ZlBzNlozaXlTUnRNMmNPZUxSWDBRaVhjKzI0SngvSnA5VlJsdWhBcGlhczgx?=
 =?utf-8?B?dGVJMkptbmNpSTEvVEZwcVVzMUpMdE5VUEJWRkpTYlhyelllM3ZzU2dJVFVj?=
 =?utf-8?B?TVlGMm0wYTdLWmR4T3I4TTY1QngwQWdNV0lHakxyYVB3OFJEYVNZakVjMlY3?=
 =?utf-8?B?R2lIeENjQk04RjhQeCt4KzMrWE1hTTYwSE5VbGtJcGNHSEtzc1czZlZWZkV5?=
 =?utf-8?B?QVBhcDNndHJEbzVtVFIyeWlhclliU1FQYjRuQ1pRcDkwdTFId0U2V2YvbHI5?=
 =?utf-8?B?YncwN3JtMmF2S2YxOW80WW1GRzNZSHNzb1BCei9kR3dEblRtWVBlQlBZbjli?=
 =?utf-8?B?d1BjR3pXYWFnUXd6alhUOWVCOFFqRHVpTVZkRUtGMnlRQ3UvOHRLUWRNK09p?=
 =?utf-8?B?RXhHZCsyN3pLNFJzcGRzWlpBejd5blhTSHRvWUplc2wySzVhTkZGTWE2dkRy?=
 =?utf-8?B?bHMwamZHRzJkMlZ2bkRsWTV4RDQvRHJpek1ZYm5TTk8wL1NzUVdpL3FKb1Fy?=
 =?utf-8?B?alh3U0pkVklad1E2ODVZU3R3a09aQ2d4SHVsaEhOYzB2VVhRNVRxb1cvT3hj?=
 =?utf-8?B?K0tLNm5NV1BIb0JReHhsNENLVGxDbXU4Q2xGUWljb0NHVUNPamJJUG1OV055?=
 =?utf-8?B?cDdGc2ZKdnpUQjltWFdBekNaMGVOUEs3ZmRDSGREQWhWd05lOFo5cXFDRzZr?=
 =?utf-8?B?K0dNZjJrdnNtWUhWQWJwcXpBRlJyci9MWXc4T2s0OHh4UFVtSFRTay9vRjQv?=
 =?utf-8?Q?+FklEWCKjHo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7405
X-CodeTwo-MessageID: e54b62cd-61fa-49f3-ba8b-c57f7aaeef81.20250423065948@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b62c567-1589-4ac2-308e-08dd82346d63
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|82310400026|35042699022|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1ZQeVo3dzdvMlo2UTlIUmRCYWw2WXgreWErQW5tWFZKRnNVT3RvRHBPMXAw?=
 =?utf-8?B?Z3kvT3IzTXU5Qjg1NnZjRXNnejlUS1R0eVMvOWhaelAzRUN4MVc2M2dtakdU?=
 =?utf-8?B?bnJiVjJlRmc1NGJqTFAvMUdvTVkzQzMwRGUwTU9kbXN0aktNYU01VS9BZFN1?=
 =?utf-8?B?WkdyU1lFYm8xWTBGcWZzUVBNUkthY3QvQzh5dzFPbXFlb2dlRzc1VU9LNnUx?=
 =?utf-8?B?aDJySGxkUXAvY1hsRmhtOXF1M2lIUXYxUTJLLzRlS0E2MVVNTmx6TTNxNEl4?=
 =?utf-8?B?Sy8xcXdyM3RQS2pvSmZSSmtIOStHTlFrd0Vmald6R0ZidE56Nk1WeWxIYUFM?=
 =?utf-8?B?SnNFeVB6MlBBVitVcE1xeThhQUlVcnNKNW0vaGJaNFBJWjdGOENkVk1JM2xx?=
 =?utf-8?B?dkJHT3k4bUwvbEkzNHh5Rk51KzJvQk1LMnJOQ1dYM0l6L09tcHpWZ3NudWNn?=
 =?utf-8?B?K1p0WVhjL3pSa1NESFNheVVTTG9NWXczamd6am9pRWlpMmdCT2FUTmw4a3E2?=
 =?utf-8?B?eUg2S3I1bE11WkQvZWROMVBaWCtvR2dpNTRqNWxJMUxmQ0V1VzdBK1p5VlZN?=
 =?utf-8?B?Sk5rMUdYV0djeHRaNU44ZTBvTzFiQU5tVDFpdE9GNjJ2RURkaFFWS2lQT29F?=
 =?utf-8?B?Y3NJTlNYS2JvV21iMzVueXkwTFpDTzcvN3lFejdIMGk2WHlIV1FTWjlCalI4?=
 =?utf-8?B?eWxzUjFQQ2NsOUVoVk0yaytWOHV6Y0luRmNTaTJhMVlla3Raalk5dzNBU2tY?=
 =?utf-8?B?SzlsMnpyTW5LbER6bnd2RUZ5YkFsV1JXZVExZDkvOSs0UXUrc0srTFRyYXJu?=
 =?utf-8?B?S0Jmcm8xMmY0L1RmZkwvQ1VPeHUyUXVNR2RKYVByNlRqZ2JKalRkR3d0UDZY?=
 =?utf-8?B?STFCOFlhK3RYWTRMZVZlQzQ0R2dzT1dyN2lGRExmbUpVbDFrS0xmS3B6UkM2?=
 =?utf-8?B?YTJiVTNBRmhzOFJWMFJQdWhvdlhPTDdGMWl2OFFvTFBMTnl2OWEydEUyNHlQ?=
 =?utf-8?B?alBSTkVNQU44QmsweWFoSkRYTjFWNzYxR21JRUhWc3VpL1JjdElKK3NFNHJO?=
 =?utf-8?B?QlBFQUxDbi9WSEpQQVFtRHl6UEJRZzJ1Z2tuSVZnV0tWa20xU3pjNndxUkVK?=
 =?utf-8?B?QXJvNVNnR1ZXdUpUbjgvMEhPL3JsVjkzQTZGeGdxeHd6TVp2RFFYeWJtRTFD?=
 =?utf-8?B?aWJoamlKdDhURXpvdWxudGp6TFh2VnBRWnJrWEJpT3c2ZHZSSFpEc29GN2lm?=
 =?utf-8?B?dFFIelh1NTVzM3F1aENRMWd5UFlyUTI1TExZQXlYQUhvMTdCODZlNXFnWS9i?=
 =?utf-8?B?NHErNStZNjlIWDZ6U0NVeWVuQWpOb3pldVl1T0R3aWNzdG9PaGFOOFdTYzBC?=
 =?utf-8?B?TG9uT3lwLzlqVEVWTWRRUUd6eVZMSG9yRXNudVJGZ0REVC9HZFBja1dsMW56?=
 =?utf-8?B?Tjg1MnRmWVN4UEFsNjdXT0w1NmNFbGxnQ3k3QVpWd0R1b2pjcUNxNDJlSDJu?=
 =?utf-8?B?b0Q5enJMMFlIY3pxemR1c0U5Tk9EeW96OWNUWjkwNGgvTFBsZFZsSmxhNitq?=
 =?utf-8?B?aUEvS0h1dVUyR2lIblNJRzN5bEZDU1VUdTR2RGxrYnNsZCs3RTQvUzZyODZX?=
 =?utf-8?B?RzBjK0JXU1BTZEc1TG9kbllTcXR1UlFSM1JpTjZCNTNFM05PTHJ4MGpLVDdD?=
 =?utf-8?B?WU1CdGZodUtuSktTWTVRQi9WZCtrUFE0ZUc4LzQ4cHM2T0dkQzlNOUlqTHV4?=
 =?utf-8?B?UG9ZSnA4R21hbHgzYmpSREE2Y0xlZ1RmSEJQRngwU3RFYkZXUC8ybFhudmhD?=
 =?utf-8?B?Zm0zVVBjWlc0dkZqTkJNV3JuTmtMdjlGUEtXa0lWU1R5TkYzM05mME5HNzRT?=
 =?utf-8?B?UE5XQ1poelo3OXVvbUZHNWtYQlRIMmpFeElBUmtYMjhubFBDWjJvS0M2NXl4?=
 =?utf-8?B?QVpvRGVPRFdrZHV5ZlZoL0lhSWZtWjcwRnM4d1hMSS9oS0prQlFzQTdnVkpM?=
 =?utf-8?B?bTcwWHl6ZjR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 06:59:49.3033
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0102330-9926-4f7f-4cfc-08dd82347076
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9692


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 23-04-2025 00:18, Laurent Pinchart wrote:
> Hi Mike,
>
> Thank you for the patch.
>
> On Fri, Mar 14, 2025 at 04:04:18PM +0100, Mike Looijmans wrote:
>> At probe time the driver would display the following error and abort:
>>    xilinx-psgtr fd400000.phy: Invalid rate 0 for reference clock 0
>>
>> This issue was that at probe time, the system has not decided yet whethe=
r
>> the GTR is to be used for SATA (150MHz) or PCIe (100 MHz).
> At what point does the system decide that ? I've only used (and tested)
> this driver for DisplayPort.

In retrospect, yeah, the commit text could be a bit more elaborate on that.

This PHY driver probes before the I2C bus which contains the programmable=20
clock chip that provides the GT clocks for the PS. This isn't a problem, as=
=20
the PHY lane won't be needed yet.

When the SATA (or PCIe or network or displayport or ...) driver probes, the=
=20
clock gets programmed. The PHY lane won't be enabled until after that.


>
>> The driver
>> doesn't need to know the clock frequency at that point yet, so wait unti=
l
>> the lane is actually being initialized before requesting the clock rate
>> setting.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>
>>   drivers/phy/xilinx/phy-zynqmp.c | 61 ++++++++++++++++-----------------
>>   1 file changed, 30 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zy=
nqmp.c
>> index 05a4a59f7c40..e29e3e51d380 100644
>> --- a/drivers/phy/xilinx/phy-zynqmp.c
>> +++ b/drivers/phy/xilinx/phy-zynqmp.c
>> @@ -222,7 +222,6 @@ struct xpsgtr_phy {
>>    * @siou: siou base address
>>    * @gtr_mutex: mutex for locking
>>    * @phys: PHY lanes
>> - * @refclk_sscs: spread spectrum settings for the reference clocks
>>    * @clk: reference clocks
>>    * @tx_term_fix: fix for GT issue
>>    * @saved_icm_cfg0: stored value of ICM CFG0 register
>> @@ -235,7 +234,6 @@ struct xpsgtr_dev {
>>   	void __iomem *siou;
>>   	struct mutex gtr_mutex; /* mutex for locking */
>>   	struct xpsgtr_phy phys[NUM_LANES];
>> -	const struct xpsgtr_ssc *refclk_sscs[NUM_LANES];
>>   	struct clk *clk[NUM_LANES];
>>   	bool tx_term_fix;
>>   	unsigned int saved_icm_cfg0;
>> @@ -398,13 +396,40 @@ static int xpsgtr_wait_pll_lock(struct phy *phy)
>>   	return ret;
>>   }
>>  =20
>> +/* Get the spread spectrum (SSC) settings for the reference clock rate =
*/
>> +static const struct xpsgtr_ssc *xpsgtr_find_sscs(struct xpsgtr_phy *gtr=
_phy)
>> +{
>> +	unsigned long rate;
>> +	struct clk *clk;
>> +	unsigned int i;
>> +
>> +	clk =3D gtr_phy->dev->clk[gtr_phy->refclk];
>> +	rate =3D clk_get_rate(clk);
>> +
>> +	for (i =3D 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
>> +		/* Allow an error of 100 ppm */
>> +		unsigned long error =3D ssc_lookup[i].refclk_rate / 10000;
>> +
>> +		if (abs(rate - ssc_lookup[i].refclk_rate) < error)
>> +			return &ssc_lookup[i];
>> +	}
>> +
>> +	dev_err(gtr_phy->dev->dev, "Invalid rate %lu for reference clock %u\n"=
,
>> +		rate, gtr_phy->refclk);
>> +
>> +	return NULL;
>> +}
>> +
>>   /* Configure PLL and spread-sprectrum clock. */
>>   static void xpsgtr_configure_pll(struct xpsgtr_phy *gtr_phy)
>>   {
>>   	const struct xpsgtr_ssc *ssc;
>>   	u32 step_size;
>>  =20
>> -	ssc =3D gtr_phy->dev->refclk_sscs[gtr_phy->refclk];
>> +	ssc =3D xpsgtr_find_sscs(gtr_phy);
>> +	if (!ssc)
>> +		return;
> Isn't it an issue that we now fail here without propagating an error
> back to the caller ? The function is called by xpsgtr_phy_init(), which
> return an int, so I think returning an error code here would make sense.

Agree, I'll make a v2


>
> The rest of the patch looks good to me. I would however appreciate
> feedback from someone at AMD more knowledgeable than I am with the
> hardware. Michal, could you propose an appropriate second maintainer for
> this driver ?
>
>> +
>>   	step_size =3D ssc->step_size;
>>  =20
>>   	xpsgtr_clr_set(gtr_phy->dev, PLL_REF_SEL(gtr_phy->lane),
>> @@ -823,8 +848,7 @@ static struct phy *xpsgtr_xlate(struct device *dev,
>>   	}
>>  =20
>>   	refclk =3D args->args[3];
>> -	if (refclk >=3D ARRAY_SIZE(gtr_dev->refclk_sscs) ||
>> -	    !gtr_dev->refclk_sscs[refclk]) {
>> +	if (refclk >=3D ARRAY_SIZE(gtr_dev->clk)) {
>>   		dev_err(dev, "Invalid reference clock number %u\n", refclk);
>>   		return ERR_PTR(-EINVAL);
>>   	}
>> @@ -928,9 +952,7 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev *=
gtr_dev)
>>   {
>>   	unsigned int refclk;
>>  =20
>> -	for (refclk =3D 0; refclk < ARRAY_SIZE(gtr_dev->refclk_sscs); ++refclk=
) {
>> -		unsigned long rate;
>> -		unsigned int i;
>> +	for (refclk =3D 0; refclk < ARRAY_SIZE(gtr_dev->clk); ++refclk) {
>>   		struct clk *clk;
>>   		char name[8];
>>  =20
>> @@ -946,29 +968,6 @@ static int xpsgtr_get_ref_clocks(struct xpsgtr_dev =
*gtr_dev)
>>   			continue;
>>  =20
>>   		gtr_dev->clk[refclk] =3D clk;
>> -
>> -		/*
>> -		 * Get the spread spectrum (SSC) settings for the reference
>> -		 * clock rate.
>> -		 */
>> -		rate =3D clk_get_rate(clk);
>> -
>> -		for (i =3D 0 ; i < ARRAY_SIZE(ssc_lookup); i++) {
>> -			/* Allow an error of 100 ppm */
>> -			unsigned long error =3D ssc_lookup[i].refclk_rate / 10000;
>> -
>> -			if (abs(rate - ssc_lookup[i].refclk_rate) < error) {
>> -				gtr_dev->refclk_sscs[refclk] =3D &ssc_lookup[i];
>> -				break;
>> -			}
>> -		}
>> -
>> -		if (i =3D=3D ARRAY_SIZE(ssc_lookup)) {
>> -			dev_err(gtr_dev->dev,
>> -				"Invalid rate %lu for reference clock %u\n",
>> -				rate, refclk);
>> -			return -EINVAL;
>> -		}
>>   	}
>>  =20
>>   	return 0;


