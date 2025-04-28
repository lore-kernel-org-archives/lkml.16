Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235DA2951AD;
	Mon, 28 Apr 2025 17:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745862003; cv=fail; b=Kk4/VF0tbX1I7V4dGJfZuCEHFSfnsy2pyHoL2kdVB3lmSWC+24Dl32EId8009nR/dzQYJKn6NxRyGYEqPX32W++ovEy1tppGM5Pa7oSi9YFOlWsexp1SUvuE5vwqGvURzQw1c6qPjX9alHof+iUPU+ICmhmLtGfRByp3AOPUZBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745862003; c=relaxed/simple;
	bh=nJxs24t/N6/pNtIaD3KjTIDlzYN6uZqtROPFh2w8j28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBNdFoXV1AfFnRaRvrQJWKgNoub7gQZKfSHUOnsxxGk+x2lBO+9+JSQ1QCx1F088D1p1JaS2jKgWGCjj31VfBJhpox74K/aPD+E/xwua7Oqm/NGO7gQl63jEtg/hbIfrlmuCaRw9wwyk400nBLl39Jj3fk+3d9grmGVDCef1gho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=L1mQAlnd; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IrGPYj4f; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="L1mQAlnd";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IrGPYj4f"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S81VNu013349;
	Mon, 28 Apr 2025 12:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8v2pDXFaiNTKp4rM2CX1bACjmd4gVvbjHAiwJJ6SfuA=; b=
	L1mQAlndQ4G45shbQgPECWjQ24R5FxXDX3GSo/jxkDL9aRPx9ynn/62IT3T0+9IN
	/slEABxHKuBNRSMBpUDf7o6nIfAqyD03cvYNjHxeMuFrWP5O2Ht5CHo9XMXxwdcG
	t3tO9wMUh8DS54w1/nT4zPwsOP8MY9h8SE4x5oxIk3bZH/vlw/7a2jFP6caEHc6o
	j2XklHjKl2+fUi9OkJpN83YK5L4hGVqIQNuKrf8dhK6mrGM3nXjJEn0tnTi77rtK
	eO17XKkAey/Y5GrnzUTc837//+syILPookkzYlbwJQfS8HfGeszbeNdJLh9QIaiY
	G22eAdGKU58bRH8AHmnxEw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 468vw1ajdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 12:39:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ND4buaIe3uL31ErUZBMM6wfwIcR8/MVNrGcA4EOmSFt5n3bz820BatjdNZf5Sp7n7AiGbXKFtxfJaw3MOZN5zY9jR/VpQnbC1HndV2XoTTui0yca7Y1qpAKTTfCAEuwGZLxSCZiDfto97jFFJdYcmzlcSNILo8NWB89QYNlltInw2I0vRaxgxtnKDFrSgADg71DpqXB0oqmay4vG1pRWF8LyVLRh4yjbHtfptdvqSxqtgt81XdqA+nrzkn4CTe0y90+I42O3PxwGf2hUDS5ZZwKMZM2k4cGHPPZMRc71sFs16qdpSMyj7+aCGBwWt7FpgGVbKzVMjrHlquwu2ERa2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8v2pDXFaiNTKp4rM2CX1bACjmd4gVvbjHAiwJJ6SfuA=;
 b=mKdjESKhSHwRv3Np2fq9IQ1k+jsscXbJnG/J5wezcrrA4uA/0hIG/kRYsfevWgrqZC2ezPDDtxLRK1mtcXvQAduHCdIWjXeWolADV0u+XGz/+v3YB7jiYsyDP5XoOLxjXRiBZVoaT6t0LqyyyPJAreOQhrlN1l7HhpWY0eWm/EpRdaogE6CgRD5JYS4Tt5mIylDdl9OLBx99HzFI3xs1dvfTebiVSk8gFH5KlrbxVaNkGCzA0uZO1HwpaFC7dpuGXBetMvXdl1hSAVjjCMxeB1dQVSZReXRG5p2Dq6R1yqjpsFzgU2X52gU0AQ1hi0UlKSPvBX5/ikZ/voMb5oZ+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8v2pDXFaiNTKp4rM2CX1bACjmd4gVvbjHAiwJJ6SfuA=;
 b=IrGPYj4f4xHqMpmnwYwJs3iXVdGRQN0Yuu8ARB2suSTakF/pszFofokawzZrINbf35SUZMxijUkeeaoAhpDvC7J/IvZlcKnPuLzBWxkTsbaYRpQgJGoPVhBMEYVZgJm5eDDa6fOgZrBBW8gct4F/GOAaQmWCNPUzGjRLgHMzhAw=
Received: from BN9PR03CA0250.namprd03.prod.outlook.com (2603:10b6:408:ff::15)
 by PH3PPFC371A8E24.namprd19.prod.outlook.com (2603:10b6:518:1::c4c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 17:39:53 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::e4) by BN9PR03CA0250.outlook.office365.com
 (2603:10b6:408:ff::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Mon,
 28 Apr 2025 17:39:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 17:39:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 74086406543;
	Mon, 28 Apr 2025 17:39:51 +0000 (UTC)
Received: from [198.61.68.186] (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D5148820259;
	Mon, 28 Apr 2025 17:39:50 +0000 (UTC)
Message-ID: <3a67496b-dbff-4940-b640-7dbd140e52d7@opensource.cirrus.com>
Date: Mon, 28 Apr 2025 18:39:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] ASoC: cs35l56: Read Silicon ID from DIE_STS
 registers for CS35L63
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-6-sbinding@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250407151842.143393-6-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|PH3PPFC371A8E24:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f9a306-6be8-40f4-6c2e-08dd867baf11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bys4a2RwNWJRS3Y4N05SWGZhNGQzKyt3aW16SFBNUXJKSHJ0aUZMOWIrd2Jo?=
 =?utf-8?B?cXh4WGZlNEJ3a25udjZCSi96a3hRajlxY3lHNGpHb1B6WjNsczZzcngzYlVE?=
 =?utf-8?B?SWFhT2liV1VFR2JkRklPQlJhWUZNK0Y1c09SUHBVSDYwNEpKZXBqdlpnTXJv?=
 =?utf-8?B?aTR4ajBkdVJPQlpDdWdKdXFHbm9FeEJBVmNMbVZsaUMzTTNXamxJR2VkQjJx?=
 =?utf-8?B?QUw1dkw3MFlTYjV4N2N5Mis5SHF0Wm4wL1oyR0VxRTV6QmZ1MEUvVkxuUEtw?=
 =?utf-8?B?YWNDa0FmUkdhRFZLN3FIZ0dpVlN5ZGkrcm5OaEFUSnZyU253N1lDeWNHQXlu?=
 =?utf-8?B?OXZ2M0JFVklFaXAreDhJdU1NYWxPWWpMRGg2YUZjZUFrRURkNUR5aEhoSHpo?=
 =?utf-8?B?OFBJK0NBR3BRZGUxSjNPQytXdE05TklkOEE4YyszQkNWS2dOcHQ3c2w2Zllv?=
 =?utf-8?B?VGJFZHZYcnZoRWVaUnpISWxuUGJmbW52SVI0cjR5LytDTnBBa1BlUEs1ekZ4?=
 =?utf-8?B?ZHlHdUd6YnVObXhid3d4ZnhuaVFNUUdGYk1hdWVENjRxNERKYkNqK05ZVXZ2?=
 =?utf-8?B?L04vNzlmWVNCRno1MnV0VkhSYnFkVjdXQlJVN2FmRDNtMGdwTkZKVmVwNE8y?=
 =?utf-8?B?UUs3eEtTcVAzbFhiMHcwWkFMRFRxbDJ1dXc5bzZFbjQyOTQrVWpSa3oxcE1v?=
 =?utf-8?B?My9LUmxNWGlOTURBaDJOdXJtUzVMMEcrN0dwZVEwdXBhWkJmWjhZUTEzM3Fn?=
 =?utf-8?B?a01pZ0E0TGhxRjlvajNnalpsL2tlNTMrMWZpMDMvaXNHUE9WWWNlWm5nSTVh?=
 =?utf-8?B?WHJoTTRmQkhSWkxKaVhIcllJV2twTVJUcFozTUVkdUM3OS9aL1gwZ0k5YUww?=
 =?utf-8?B?TnE1NFNEYmVSTzBtQ2FrdGdsTFZVNGlHL3IrQmZyM29sQ1JZV1FKR0tWTytq?=
 =?utf-8?B?Nkp5VkFvR2NZNDBDMGZjdW03YjZkb1YrSTlBL3Z2dXl6TVFNeUIxTEt4K1Mv?=
 =?utf-8?B?QXJYNWFSc1pVek1kdGgwZnI1eU93cys2cWMrN041K3V4NkJ5ckZHSE5CTDB0?=
 =?utf-8?B?bGtLZFdES3RHSndJNTBab295Ykd5UlFOSWtwM2xBd2MxcXNxSmdKLzF0bkhw?=
 =?utf-8?B?U2ZRcFpWQkpZRzBMeklMQkdWU1dxUS83ajJmZ09BeVVZL25FRDZ2VDBLT2NY?=
 =?utf-8?B?MXZnckljWEJxQzF4eHVUaHVqMlBVTHFROVRkRzlZV0RYT0xCZU8vVGlpa1gr?=
 =?utf-8?B?VlZONzUzdENSUEllZnJRbXpDRWVsSWhKZmdab2Y2NDREMmdLbm43WGY0Nldj?=
 =?utf-8?B?K3dSZkdLSjFtNXlpZ0QrbmpySkp0TVJpOEZKY0kvMkVyem1aRExIN2Q1aFZK?=
 =?utf-8?B?aXVYWE5DbnkzeFVKVmtNNjczTEpJUFBsMXZEQTJ0MjF4WjVOdHNrNEo5NkRk?=
 =?utf-8?B?US8vTzBaQTIrclU5N2gyZzZDOTBJYkdHTUdiQml3Z3RRS04rVkVCYWR1NDdo?=
 =?utf-8?B?RlIwY1FaMEZpNEU4d0VLZDkvR05hNmN4OE5KQTJHUFd3R0JoVHZHZ09HRWFL?=
 =?utf-8?B?a05mUFJpOGU0Mzd0UEkrZ2s1c1UzRkl3Z1plUmlJNGZjRWVqamJOVE5UYUhu?=
 =?utf-8?B?aUVkUldVTHJTaWgzcmgzV1VqaW4rc2FDb0JtTVQzbmRsbFdUNHE3cno3VXB6?=
 =?utf-8?B?SGRWbnlOZDMvQURxVmhKekVRbFFSVjdkYVQ3Ri8vSFp1QVJpcDJOOWoxdE1z?=
 =?utf-8?B?ekRqUlRJMHEvZ3NhSlJaemdhbldxQUVJRzZDckdWQ0FvaDQzNmh4NS9heUln?=
 =?utf-8?B?czVSVmNiUDJVS3hQR05nSVhPUUVGVDg0bTVHMUtheEgvSjR5cFJhQ2ZpTUhv?=
 =?utf-8?B?TlU3NjdHelNZeDYzREcyeDE4R2dvTFh6Ynpic1YyK2g1M2hwcUsyWmcveUd4?=
 =?utf-8?B?SThoUHRkZHVENlpRTmFmMzRjMzM5NE0zanpQR2lnOUI1OWFzb2xhMWpsTjlk?=
 =?utf-8?B?QUZqMEtLb3ZkK1dEd0JLdE9QTXU4djBBUy9FUWhLRG5UUU5DQmhLSEJTOXhP?=
 =?utf-8?Q?p7XkGa?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 17:39:53.0584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f9a306-6be8-40f4-6c2e-08dd867baf11
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFC371A8E24
X-Proofpoint-GUID: KnJNRYRKA0cMfaJRLw5zUwpliBDEiarL
X-Proofpoint-ORIG-GUID: KnJNRYRKA0cMfaJRLw5zUwpliBDEiarL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MyBTYWx0ZWRfX25S5IGuybyq2 AWx2t2dLeBQL1LoAhvCBxdDlV5dk1r7XTgxOS8B22HjQqKuNfmGQ97VMmL6W9pTITOvr2WZUUph GG4N8MyCd4UaI9vWeK+vcfR5QJUlwQ9SBrCZbixbixq5IGHhX52jVC4hA4Y4bvhuRzGbnvAPkMD
 vSug6qcBLm0tuFfncO0Apj3uY5vRpmXS6MjUYh357OOQnILr5iiHFo1uQ5J1in5N/ckDMaB0JVM EYNaN/aFahRa96jr7MXeDgJGgrS/0gxd9hIOHuzSdawiQ2IXjdEsPoM89eCOHEGGCQGoQmTrlao RNd0lqEDjgaiBcZB88NxDVmwyRqXCzxjRpFaflb27Y5x+5KH/nk5gdgK6nuAsuAi8eIYv91APhA
 kuP3W2yJLk0EMN2uXc1WD6Oo1QpQyqG8YSCGX1WjhMA2s4FzIlYCX1mw5Bw3ofJ9Ry3xvXR+
X-Authority-Analysis: v=2.4 cv=Dd4XqutW c=1 sm=1 tr=0 ts=680fbd6e cx=c_pps a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=dT0HIbAYePdr7P4abU0A:9 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On 7/4/25 16:16, Stefan Binding wrote:
> On CS35L63 the DIE_STS registers are populated by the Firmware from
> OTP, so the driver can read these registers directly, rather than
> obtaining them from OTP.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>   include/sound/cs35l56.h           |  2 ++
>   sound/soc/codecs/cs35l56-shared.c | 39 ++++++++++++++++++++++++++++---
>   2 files changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
> index e16e1a94c8a1..63f2c63f7c59 100644
> --- a/include/sound/cs35l56.h
> +++ b/include/sound/cs35l56.h
> @@ -71,6 +71,8 @@
>   #define CS35L56_DSP_VIRTUAL1_MBOX_6			0x0011034
>   #define CS35L56_DSP_VIRTUAL1_MBOX_7			0x0011038
>   #define CS35L56_DSP_VIRTUAL1_MBOX_8			0x001103C
> +#define CS35L56_DIE_STS1				0x0017040
> +#define CS35L56_DIE_STS2				0x0017044
>   #define CS35L56_DSP_RESTRICT_STS1			0x00190F0
>   #define CS35L56_DSP1_XMEM_PACKED_0			0x2000000
>   #define CS35L56_DSP1_XMEM_PACKED_6143			0x2005FFC
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index 76ddb1cf6889..7f768718b69b 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -214,6 +214,8 @@ static bool cs35l56_readable_reg(struct device *dev, unsigned int reg)
>   	case CS35L56_DSP_VIRTUAL1_MBOX_6:
>   	case CS35L56_DSP_VIRTUAL1_MBOX_7:
>   	case CS35L56_DSP_VIRTUAL1_MBOX_8:
> +	case CS35L56_DIE_STS1:
> +	case CS35L56_DIE_STS2:
>   	case CS35L56_DSP_RESTRICT_STS1:
>   	case CS35L56_DSP1_SYS_INFO_ID ... CS35L56_DSP1_SYS_INFO_END:
>   	case CS35L56_DSP1_AHBM_WINDOW_DEBUG_0:
> @@ -802,13 +804,29 @@ static int cs35l56_read_silicon_uid(struct cs35l56_base *cs35l56_base, u64 *uid)
>   	unique_id |= (u32)pte.x | ((u32)pte.y << 8) | ((u32)pte.wafer_id << 16) |
>   		     ((u32)pte.dvs << 24);
>   
> -	dev_dbg(cs35l56_base->dev, "UniqueID = %#llx\n", unique_id);
> -
>   	*uid = unique_id;
>   
>   	return 0;
>   }
>   
> +static int cs35l63_read_silicon_uid(struct cs35l56_base *cs35l56_base, u64 *uid)
> +{
> +	u32 tmp[2];
> +	int ret;
> +
> +	ret = regmap_bulk_read(cs35l56_base->regmap, CS35L56_DIE_STS1, tmp, ARRAY_SIZE(tmp));
> +	if (ret) {
> +		dev_err(cs35l56_base->dev, "Cannot obtain CS35L56_DIE_STS: %d\n", ret);
> +		return ret;
> +	}
> +
> +	*uid = tmp[1];
> +	*uid <<= 32;
> +	*uid |= tmp[0];
> +
> +	return 0;
> +}
> +
>   /* Firmware calibration controls */
>   const struct cirrus_amp_cal_controls cs35l56_calibration_controls = {
>   	.alg_id =	0x9f210,
> @@ -829,10 +847,25 @@ int cs35l56_get_calibration(struct cs35l56_base *cs35l56_base)
>   	if (cs35l56_base->secured)
>   		return 0;
>   
> -	ret = cs35l56_read_silicon_uid(cs35l56_base, &silicon_uid);
> +	switch (cs35l56_base->type) {
> +	case 0x54:
> +	case 0x56:
> +	case 0x57:
> +		ret = cs35l56_read_silicon_uid(cs35l56_base, &silicon_uid);
> +		break;
> +	case 0x63:
> +		ret = cs35l63_read_silicon_uid(cs35l56_base, &silicon_uid);
> +		break;
> +	default:
> +		ret = -ENODEV;
> +		break;
> +	}
> +
>   	if (ret < 0)
>   		return ret;
>   
> +	dev_dbg(cs35l56_base->dev, "UniqueID = %#llx\n", silicon_uid);
> +
>   	ret = cs_amp_get_efi_calibration_data(cs35l56_base->dev, silicon_uid,
>   					      cs35l56_base->cal_index,
>   					      &cs35l56_base->cal_data);
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
