Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB971C69D;
	Tue, 20 May 2025 15:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756584; cv=fail; b=qm0eF+teJqsTc3T1d+gjpQiELNZgWwWPHYTSAF5Lg6v3n3Oeu0dnpVv17ssvXtVbXreTBQolM5BdV8/tL0SHwb4M88ujYo5hoJ/35X9M4VaRh3KOvdBfpGsFYQUfIRgQPoDFBtUGi5RL6WtgqIc1fhLhulR+xw0eptIJ0Ffh3M0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756584; c=relaxed/simple;
	bh=uXE4SbzJg2JLPOktN4+V77tNsVzBce2E3KmpEgdrKho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=da3TMYWqyhYAgGAbMrfu3OQ00YVvncFm8u/3kifPrkxnZ4CdEaqG95oOyLvU4NWVXnp10GTYxMUALL4PdLsLqgUw6yz1xPrpfE4dZlDX0p1Enfh5mvE/ET+Mq2YyYPluHgHwgKj3Ta3GQt7Eyr0l7ihU3c+GOmfKNHE+8DIy5tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VEbTDzZ7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XRRLTghb; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VEbTDzZ7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XRRLTghb"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K5je4r005734;
	Tue, 20 May 2025 10:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ctSt+W12RqaOhOC0E0LuD0kXHlUJ1dPLbQ7nzeHo5AU=; b=
	VEbTDzZ7wNNJHjfy4DcRnnHk/rsuS4WbFa+CoLZITHhHgLi3hPie1z+Mjcq0ZUXO
	76cHVMoVAvAScV2aD1jNaPn7Rp03FbE8oEd8FVaxM8Msf0OGrB816yKS4qltyj79
	cbusXxVxC86muM3JA/AsfSyiMVarT/GfbfF5uJZ6igKvvq9WWiEv/jumFhQc+eRq
	1vy2kkEVENFVdMufnmw5ZW8t4tnezYcHLNX89JF4+QzgIo7iQcqDLrmeafXxWwuk
	qOLl9iKPfznEiJm62BSJ5dmTcPO2rYZNTOTim5kI4AhHpuJlR3X9FeF5R/Ywjv5I
	uuE4VKNprAyZUoovtQOtEQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46qcrwbgmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 10:56:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExZnvYTWOODBKZN+U4p6SqdHCofBMrQDmkJcAlZq+IkJoKt8WIcJNVFyv/bNO1sLOx6KlJvICmNVwtLmTJBrpSm1hv/dln0IOqfmrVN9CPLlC2Vha9TAVVcg0GBCmXApRLvDL7+7IpTvpNewdds5a7NBkJkDMpE2IZBumcVNWhOIFc4q0FShySAf50CFBnYQ1cYuE+G3cUgFGJRkYuZ0sQIIzU6RUr5qv/q7BUacJPmd5te+1fWZ+GrJUUWT4tb9BA+LER/3s8VBBoCEs4HAk1w8IRYyk0PpWX5w30hhBS0z6UXSpmfL87zQzsjU4fZlX7GQNdltORO0n3NUh+Tykw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctSt+W12RqaOhOC0E0LuD0kXHlUJ1dPLbQ7nzeHo5AU=;
 b=k21si+9pA1rqG/kPXqX++SLpXyIQPVyWHR4xfOWTyz9uR+dpn/t3GPmrLiCrkVW0yQbXjhsHEWhSglYNi0Qa2t3QNcp9cKAbVWGu/8BroVY27l4UX88I/QiZbS7ah6WWvJpBfHXXoN99Ty5ybqUl2umQQ2k/+OCqZaXiSiq8N4E5Jq7xXlewP7KQf3GrsnQE7GkQualWSSymz0kGWqKqvahFaMi6OibR1TJL7h4TLBFnzkOeXILUcgEHmpFbMpN+zJvwBDng7YUHAZ9LgKKg9YKrJnrLwgAFK5vPY8Q83ebjTw9efvQU5vBpwBrioUzN05K2PL8JTPSDseowzst9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=arndb.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctSt+W12RqaOhOC0E0LuD0kXHlUJ1dPLbQ7nzeHo5AU=;
 b=XRRLTghb9TMB3hAvKDW3/KGmKkufH3HDnvgltEs5gqNvMLs8A+QHfDWeIQxfhd/SPKsXsGkrsqvYcBErGOr+Q9iR9nTwP3Mm2suOO4u0OkCZxCEz4m/o29+cj85/dDtWK2Ysinqy7vagpEfALZcuhb6fENhjl12RwJDS0fSlHVw=
Received: from BY5PR20CA0011.namprd20.prod.outlook.com (2603:10b6:a03:1f4::24)
 by DS7PR19MB6231.namprd19.prod.outlook.com (2603:10b6:8:99::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Tue, 20 May 2025 15:56:02 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::1b) by BY5PR20CA0011.outlook.office365.com
 (2603:10b6:a03:1f4::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 20 May 2025 15:56:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 20 May 2025 15:56:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D9E0A406540;
	Tue, 20 May 2025 15:55:59 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id CB09982026C;
	Tue, 20 May 2025 15:55:59 +0000 (UTC)
Message-ID: <6611093a-5add-41ef-8604-f3b8343d663e@opensource.cirrus.com>
Date: Tue, 20 May 2025 16:55:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/cs35l56: select FW_CS_DSP
To: Arnd Bergmann <arnd@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250520152702.1976221-1-arnd@kernel.org>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250520152702.1976221-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|DS7PR19MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bd18758-7ef4-4582-04d2-08dd97b6d1d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sjcxa0J2T3RCYVNudmtpNnd0SFI0M0dYRUtUa0c5Zmp0NlhwQ3lNRU9XUjFS?=
 =?utf-8?B?MGFYL2d5dDd1UlpaN0R3eXVNaXpydnpsN2VpSE43SnhtcUZ6NlFxTCtCa0p2?=
 =?utf-8?B?ak4rTThGTWxKQVp4R2VvL1N6cnJjS24zWENibVhFU1NVZlZkaitQSXpNNERx?=
 =?utf-8?B?aWJ2bXJyZHlycC9XN0R5SHFkZkdyalVXdFhzQXdHSXV5R2w2c2hVaUxPVTcv?=
 =?utf-8?B?bk9lMy8xRGlUOHFqNU9odEUxNUt3S2ZOc0J5ME5zaEk1dmpaZ1ZLVmZZQ0tG?=
 =?utf-8?B?N25JSDZSWkhLZnFZWVVBOGdGMkRaY1RWSWN6OXB6YVpKcE02ZVlBbXRUeGVs?=
 =?utf-8?B?MnZDTHFWSUZhQUZjcm12NFM3am1udC9Ka2U2dmJLdmgxNjRubzlpWlFSRERJ?=
 =?utf-8?B?czVkZFNJYjZvaGhXR1AyOWlIUkpINVdha3RrQ2Rrb0t0dndLa2hGSUlZemtM?=
 =?utf-8?B?TjNvWTZ6T2V2azJrQ1JSbk1Hck4zcDBIN0tsU1FKT2hUaHpnZm0zcmEvNCsr?=
 =?utf-8?B?NHFHUW1ESm5rNk9rcWJwVUFUeWtQNC9sbVhqVzVKRURwZ0NOY2lVdnh4OHZs?=
 =?utf-8?B?UDNxTUkwUzhFWnFmREl0d0pnZlNsSStqaGVsMjJIVWN2UmRLK2x4ajF6V3l2?=
 =?utf-8?B?VGdLeHV4ZkhYeVZaU1dkOFA0WGRtZzEyZU5LWjRMcnFIRzcrMmRxcnU2eWdv?=
 =?utf-8?B?Y1FSVnNGano5bDJXS0VCNFJkMVdhd2g5VXZuSFUxZGVCTFZ3cHZCZDlreUVK?=
 =?utf-8?B?ZG1hc2lrS0VucXNpTkJCbDdUM09oUGh2QVpiZnI2YVFmZHg5M1p5U2o3cXpG?=
 =?utf-8?B?Zzl3ejlkc0VaektsOExTM0l0ZHNENVlmT0s4T05LbXVSczRja24yUzlFYVFI?=
 =?utf-8?B?Vnp0TkswYVN0K213Wi92cHhtNlRyUlBKUVFoNGdzRmdOT2JpUUF4Y3VVSzFt?=
 =?utf-8?B?ZXdZeWVQYmh1a2VsVllITHhYQlA5ckwrTkJmUGpYTmMxck9hNkVhczZXTDBX?=
 =?utf-8?B?Z2RKTXVFb3h3T2s2VXVNYzJIV1diYUptMmxVd0Ftcnk1MHArcFRaQWEvTjgx?=
 =?utf-8?B?RHlRK0lYOWhpVjBKNllNM3RCUm5ZZjBiYXJjTjhzZ0NsdlBlY2RvWXpsSmtm?=
 =?utf-8?B?RmRacGJ5a0N6N3JnVjdiQkVTQmpUV09qZm81UHYzOGs4bWJKUWd1Q1p2bE5F?=
 =?utf-8?B?eFc5NWdoSUc0WlEwOFN2U3pJMVRzVFMzQlZmZ2FTYk5hZTlobkJUZjFMcE1i?=
 =?utf-8?B?SmJNRG1wbVJEUGRpSkxmcWtoTUF3R0d3dW9YV2VnZzJ3a3FIWjVpTlQvNGYv?=
 =?utf-8?B?cktxb25nYk1xczRKdXpzUysxZHM2bGhIVzFRSUVhc2tlQzViTnhyZUtWVmxk?=
 =?utf-8?B?czNLK2Zsb1VWYkg5MTU4aVUwR1RUWm8zUUFaN2ZRN2xWRytXWkNrMG9xYUlU?=
 =?utf-8?B?VEhCQTFEamFRTmNQS0xSUndLMElDWTBTYUJBUTRWazl0K2FVaGRuUlpTZXJC?=
 =?utf-8?B?OEZ0bXN3WlMvVTNmdnNpYmJsUWVIN3psTmFOcDQ1OWNSVjZJemtpWG9Qb2Z6?=
 =?utf-8?B?dEdtVmVmQnlSblF0cWI3TzNyNVl5cnRzb3VvL0FSNzZtVEhtZ3JMeGhmZElm?=
 =?utf-8?B?Y25lNE1VQjl1V0d4MlBGUEd0TU1Kd0U4b1FrYzhwT2lYVkZIdTRtaGZ3dDI0?=
 =?utf-8?B?TzRqZVpjeFhGS2xEaTlCUUlpS0ExTW5TaHF2VmpXNW9lK0g0ZDVVc2VzeGFx?=
 =?utf-8?B?Vms3OW5EamxEVXZSbFJrNkhER0YvWmRZQWpCZ2NNWk16UzJGemhjdjU4SDVT?=
 =?utf-8?B?NFZ4WS9xMGRhS2dpMFF4RGM1SWR6eGlYc3FHUzRTS2N6bWR1aVIrU3JQRzFI?=
 =?utf-8?B?Q3dQZlVkemtTYW55Rzl0OTdOZEMrcmMwTE1TaVpPVm9nNWlDNjMvYzBEQjUy?=
 =?utf-8?B?NWJhRUZ1dEZncXBoNkJVRXNmV3JsOUExYnFYMFpPN1RqWGJieHlFWXdXUVVU?=
 =?utf-8?B?cmRTTWhJTEJtdXJ2dUVBNXQzRjUrNzJCSm90cGttUGdzeWhXNU9BMWpKNWNS?=
 =?utf-8?Q?L8tyto?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 15:56:01.3501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd18758-7ef4-4582-04d2-08dd97b6d1d7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6231
X-Authority-Analysis: v=2.4 cv=dd+A3WXe c=1 sm=1 tr=0 ts=682ca615 cx=c_pps a=E4Q64eWPmlOcdHW0GAz4hQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=ucUoLKqCerDSODSh53UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMCBTYWx0ZWRfX1OE4WORMmbb/ ccqII9lqloDoLP8hIQmVJuf6htWXaC3rXecL1FjLZxTmLorucvBDBOrEvGlSIjVPKJhYGKfcxxL K7cyf0OL5b7W2FS/wVL0S3g7Cs6G+ItGKnw9agSMIbLK/OA06MiFn1uzL0EAhNT5EA8IpwG7Ux+
 TJRuhtuz22R6vHR/QNTaKBa1fT6rUF42wYxyslYXCZYgtsx3vGQo9Zmk2cQw16wwmVkD1nlGZP+ xEQ0SXWKVcgQ0gm5QlUfieDE+7pg7F/spdG4EhDoX63qiiu8/PLkRzw6UAkq0NFTKuADtSwqbrd /dIZ/liUgSZMcQrcVsoWIKEJHWBelop7R4fVGbnE9PGRVTI19uGi6Q4GDEHMLD14XoNoT9tizu4
 raqXoL++oYhqgHxrVIEUM8SLlew/THMHhTNOz8Xe0vL6wHUi46QwQMsV4E4BWUuF3sNUAt9c
X-Proofpoint-GUID: zUruPF5gT3wT_6Ep6zTUsiaCejbIcb5h
X-Proofpoint-ORIG-GUID: zUruPF5gT3wT_6Ep6zTUsiaCejbIcb5h
X-Proofpoint-Spam-Reason: safe

On 20/05/2025 4:26 pm, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When compile-testing this driver, the missing FW_CS_DSP module
> causes a link failure:
> 
> aarch64-linux-ld: sound/pci/hda/cs35l41_hda.o: in function `cs35l41_shutdown_dsp':
> cs35l41_hda.c:(.text+0x7e4): undefined reference to `cs_dsp_stop'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x7ec): undefined reference to `cs_dsp_power_down'
> aarch64-linux-ld: sound/pci/hda/cs35l41_hda.o: in function `cs35l41_hda_remove':
> cs35l41_hda.c:(.text+0x14b4): undefined reference to `cs_dsp_remove'
> aarch64-linux-ld: sound/pci/hda/cs35l41_hda.o: in function `cs35l41_smart_amp.isra.0':
> cs35l41_hda.c:(.text+0x189c): undefined reference to `cs_dsp_halo_init'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1bd4): undefined reference to `cs_dsp_power_up'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1c38): undefined reference to `cs_dsp_run'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1c80): undefined reference to `cs_dsp_get_ctl'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1c90): undefined reference to `cs_dsp_coeff_read_ctrl'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1cd4): undefined reference to `cs_dsp_get_ctl'
> aarch64-linux-ld: cs35l41_hda.c:(.text+0x1ce4): undefined reference to `cs_dsp_coeff_read_ctrl'
> 
> Fixes: 849c83fe4991 ("ALSA: hda/cs35l56: Remove dependency on COMPILE_TEST")

But the error messages above and the change below are for CS35L41

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   sound/pci/hda/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
> index 339c80d2cce5..3d4badc3f0e0 100644
> --- a/sound/pci/hda/Kconfig
> +++ b/sound/pci/hda/Kconfig
> @@ -109,6 +109,7 @@ config SND_HDA_SCODEC_CS35L41
>   	tristate
>   	select SND_HDA_GENERIC
>   	select REGMAP_IRQ
> +	select FW_CS_DSP
>   
>   config SND_HDA_SCODEC_COMPONENT
>   	tristate

