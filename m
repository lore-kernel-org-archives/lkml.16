Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FF327F4E5;
	Mon, 28 Apr 2025 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861704; cv=fail; b=ewfywJvXnRIv8TdOPceFgX9okVQuLfvNlXA3jA7wym6yRwlqDhCLF4QMxACpK7y1CUIXQTSO7zJO5125EF7ytQ4LkOTkoNui/KO/gXC9ni9VpWtq5yb50Ibto01DUN3snl8a6GONjXPIuRAxNRsbKZFWzJWOzp84MXK2FYHiGbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861704; c=relaxed/simple;
	bh=RBJWtMWm2B1uamb+lxmebJHyc/YTqmyMxBqK0u8eSVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuXnIo15FSgqpVGx2gwBzlN6+7iP1cXLiIb9O4ThLhh+7IGe2+JHta3tI7W8jhtQUSXe/GKa86PCT/YYG+ogY8xdiEvBL83lydgcltaC3sfKZLV5lT9CAlzx1yzqHsq4Al6g5H8vCimThwypWoSlAPp/9lNBenXYd2rdCbw20Gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=A+gHkcLH; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VVmaF9Sw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="A+gHkcLH";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VVmaF9Sw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S81TFe013271;
	Mon, 28 Apr 2025 12:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=sqIjkIpNU+8MKIAtFyxN0sHPjaoqlsjPhz4gdi5AAHo=; b=
	A+gHkcLHfPeA5ialUTCIFB22/3OQhfP87YBLXwc4evXUHgHihIqxVi5JtI+hmYas
	ByYaNi4oLlwBlYM7O0xgYrw3gDLWI7yC/WMbP9Oz4lrABiQQdujXagtg+oEuwSlt
	CI5o27nU6Rz0V7y8QGhHKyMh9zmX5KUJeYUrDBHI2JN8G8xl0hh5va7yK853kney
	p1TxNyLjopEI3B3UfB/eg2RJzN30mYDwyNSow0tL9UwkCOYjfEUNvsLdvBXyjcJe
	1YMrQ+M2CgtneL8ZDclUKkN5tEacSqiuFhkN2wDmlMSnG8QwQ/Ct3ihhgbHnlOAF
	eRWf68XVJ1fbcnZbnce/dA==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 468vw1aj8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 12:34:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPXMUzdEYOGGt6U7e9kp4vtcxmdaPI73Tk28v7QHsyp/1eFbNsMWAMYwNqto+0ot6aM+RpKtT+2BCbK2HvCxe1+hbwX7C4yYL1ONkJLuSo5AAd3m28xA8Q4jGszouOpebMbBU4H2merEwhxRGD9ETtTc8Fh8JGJ/d2MmQw66b5uU/FyUy6WO0+0naVCf2u7jT1imEuwMZSLYZpLSoeW+8e4kLMZVcyx1Bm/ZVcQwFEty/j4gcGueraCLrUScb3OaYHgnmbkdjt4w2Owt/pIDBww3vA/6pALo7c1DWKsAXUjD8TeSM9vsVjONCl+zblRm+qcmss2cf/Reoxy6hKO6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqIjkIpNU+8MKIAtFyxN0sHPjaoqlsjPhz4gdi5AAHo=;
 b=Ahla/zFXRMlDHogpJ2YunA6lzugzO7GqkuBJCAaWUy3UgtDYflwFbhQFoP+kUxNBU9VhNVhxNo5aJGg3bTa5hZ3XKK6NmtTpdFBI7gP+eeDceQnR7LdAqo1C+SITeIYNt5F4CwoIh2UaK+DAKxDZIcj/3XbopK3YehghpCWA3qXG98CyzRxDV9E3kcDr3K4wsWpXNw5+D/4GDYNCFFCAKeDrnej0Gmij+fHJQETN6aVATsQP/OneNSRqcM9QqaPPdswpBYnLJqxETwT4yl4cRi6Csvg9t2YkjBA27/2YSSZ+MhbcqO9yUjdoZ8W79QYn4VIBe5G2REwYPkoWJgw+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqIjkIpNU+8MKIAtFyxN0sHPjaoqlsjPhz4gdi5AAHo=;
 b=VVmaF9SwUEcIBiJPoiiRnxi4/u8d7QVizxuQFiB4Y1E/PDPO7R2n4Jpyr+SJE72eiPITe+toYdZwLkCuF7n04uZkOCyJfN5MkqJqWKNKC8DII0GOwAPMBG+tuVsgHxRUBzOPYCKZ7GS/ExD4MlG2Lqi7c61Yx3XqsBwre/MIkbM=
Received: from BYAPR01CA0030.prod.exchangelabs.com (2603:10b6:a02:80::43) by
 SA1PR19MB5104.namprd19.prod.outlook.com (2603:10b6:806:18b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 17:34:34 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::1d) by BYAPR01CA0030.outlook.office365.com
 (2603:10b6:a02:80::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 28 Apr 2025 17:34:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 17:34:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id EDFAE406543;
	Mon, 28 Apr 2025 17:34:31 +0000 (UTC)
Received: from [198.61.68.186] (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 75D5E820259;
	Mon, 28 Apr 2025 17:34:31 +0000 (UTC)
Message-ID: <8ab556fc-2bbe-486a-ac19-05226134e66c@opensource.cirrus.com>
Date: Mon, 28 Apr 2025 18:34:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] ASoC: cs35l56: Add struct to index firmware
 registers
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-3-sbinding@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250407151842.143393-3-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|SA1PR19MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b93c55-b41a-4f74-c001-08dd867af0c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEFlQk5palV0eTNxOWthaUFIQVhVS3BiVmdJZEM5SGpDeGc2Rzh0N3NFeVhY?=
 =?utf-8?B?U0xvOTNPbE43ZmN0VU5KRlpqWjlRZ0N6dWRBQ3dVd1lreWlGNWhvdCtMU28x?=
 =?utf-8?B?NHRBS1A5aG9mekRpbllWd0FHWkVjN3JGTWpsbzh2YTRJN3B3Q28rMkZ4U0lX?=
 =?utf-8?B?NWthbEw2eS9MejhKWFk1ekRiS0xXczZNYzNtSHRQQWNjZjM3ZmY0Q0FtL1I3?=
 =?utf-8?B?TzFmZjdoRVI0SnJXYXQ5ME9MejZkYUwvVEowdC9oTkxHaGxwdkRqemd1S0pR?=
 =?utf-8?B?VU5kbUhZQXJrRXA3WExpVVFGcXJEdWViaWRRWmNkZE52OXpWT3JSUlYzajQr?=
 =?utf-8?B?ajFhb1Vjc0x4VEh6RFZvZjhtSS9VRyt4YXgzVk10Z1pJaHI3enVWNjVBNzZy?=
 =?utf-8?B?YzZCYWgwZTJJb0toNUNrZnQweERaRWxLU0NNNFFEL3VHMUlrOElMYTVmbTU2?=
 =?utf-8?B?TlBzc0s4OEphZTJKY3gvU3ZsQmFOT2x6NGxsakNPckp4TUZXN01QTHJFcWxl?=
 =?utf-8?B?TkliRlZod1psMS9uWU9tTFpESzFpZHpxRDZnREZWSmZZMmZEdlQ2Z1h4RUVB?=
 =?utf-8?B?bjl1dGZISmt1blJ3YmJReFprOXZpeHQ4SjZhaytnYjFqZ0puM1NvVVhuTnJz?=
 =?utf-8?B?QUlJTm4wUHNqamVIbjB3c0NPNzRMQTE2ZXI4TmtFbVdYcmdvYU4vQUJJT0Ni?=
 =?utf-8?B?bitBTW44UHYwN3lCUSs3d2xIcG1LUXQ0SXlBOEJkWUZGRG5yZnBkQzlNWFor?=
 =?utf-8?B?TVJzNElWYlVhcjlzY1Vidzk5ZW54RDNaQWxkWlVpQWtCQW1vQlh0K3dqR29j?=
 =?utf-8?B?YzNmb2lYZlRrdUo4SmEvcUltb1duMGRtQmk4MVc0UDZSeU12VEwyWkE1RDV5?=
 =?utf-8?B?eURhQlhmOXdtN3VNR08vL0krUVI5NlBrUEgxNExoSkZxdEFGZnpRQWZ5Y3Z5?=
 =?utf-8?B?Z1liTnNuWGlpRGp0LzhMd0ZFL0tXYllvWHkrM2hFNndxdWtHa2hRUHp0QVZm?=
 =?utf-8?B?bWk1azVmc3VySGdTalVVTXpXbDYyRlVHYWs2eXcrZGhQb0tqK05oNFJ4Q0FK?=
 =?utf-8?B?K1dvTzkyd1ZpUXpxWEx3ZkczYlJBRGpNMzRDQVpsaEs2MGJ2T2g3ekw4NTN4?=
 =?utf-8?B?bHNtUGMwK2ZmajJIZ2xGZzU2M21HaUlWZUVLNGRRZSs2bitIdFhxZWRZUkNM?=
 =?utf-8?B?S2psVEVERUk5ZjlSYmVzNkx0RURlQTVUa1pKTm96ck5qT2U5Wlc1eTNEc1F3?=
 =?utf-8?B?RDRVcTRnR0VhUUd5K0VVSHdNeFRSZjJncUc3Z01ONkpZenF2Vm44cHcvU2ZJ?=
 =?utf-8?B?R0VaWFBMZWxWSVArZmlwbGRsN2psYkRQdkN6TXZSa0NQbUxoNDVOQVNkMEhQ?=
 =?utf-8?B?NWRwM2pBaG5JeUhiSWREMDBlYWdsUlRaeTZFZGhURTNTeDgzYUxUQkZSMU9Q?=
 =?utf-8?B?bnNTVGFtcE9kZXUyWjFSSE9XUWQzV2JEK0VyWVNFWmloL1FIcE9PZDFqRFFz?=
 =?utf-8?B?ZlZEMjdkTjlIOHN4Sk9McjV3S0JWamxYNkNjNU5tY3RsWHdSekp2a1UxT1A1?=
 =?utf-8?B?Wno5UGdPSFFQYjMxajNadS96Y2IrcVppVm9CblJseGVtTk9WRVY3VHVYQnlB?=
 =?utf-8?B?NHhzeHppY3NldXB6Y01DM1gxcEh2S0RSeXFnRDdnV25xa3BFZEw1NWFFZEZm?=
 =?utf-8?B?TXFHa3ArQWlXUWFidlZ4eGltQzFtMTJITE02cmZyZWNTc3RoYWRCck4rZ1lK?=
 =?utf-8?B?bDgxYm1LWVlILzhXdTJFYWs5R21IMGJuK2l0QTROb0xzTk1BeUgzekhkZU9x?=
 =?utf-8?B?ZW1aRSs2V2RmbjluOCtnVjVERDBycnpzOHdxcEdlQjZrRU4xOVU4b3pMQ3V3?=
 =?utf-8?B?MUJ2YXpvMDAzZnp5Y1l2RFhpZG5ybCt1VG44SjlSVTdCc05Mbk5CcENzaFFz?=
 =?utf-8?B?MnpWTmNMS3pMa3RWQUxtb2UvMEhHRWg1TnNRWGRYR2VmN1RjalVSV09IcmdU?=
 =?utf-8?B?ZlRNck5TYzlJY2pVdTZPK1owS05ZQ3ZaaXFHZXM2VzF3STRXTVVkb2VkS1Np?=
 =?utf-8?Q?obujxU?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 17:34:33.6965
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b93c55-b41a-4f74-c001-08dd867af0c9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5104
X-Proofpoint-GUID: gJX0o7ogKNvNUa7zRK4f6PrkpnVHxsMq
X-Proofpoint-ORIG-GUID: gJX0o7ogKNvNUa7zRK4f6PrkpnVHxsMq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MSBTYWx0ZWRfXyOrh8Qw/ZV/6 6nie1uYnybKcJTG1C9TRImnYr3KExi/3b3BTY8s9SD34/3AcqNNtkj0nvM/TpYmMLo8LgrK1pdB zotEkUtCJw2zV/XhxyevC5lTr6m/MCRDW0qc4NlAiy+a1W6Ci2qlPXNjbleHSyXWiJxkguRx2UU
 f6g/rEu3d2s964kUtA716GLFqlMOYBiCTRl5VldLDjMwV5zaACleWjCyxeYK800w9nLjPgpTZxB fNaD+9pSfvE6DwqR6jSPP6G8iMf/Ddq4PJ9DQebGkLaUz2t84vyyy8KCc38Q46s3eeeGYebxYuP O5dTYxrLS038PcYTnpK19THU/WQdQHmI4s1EJi4tVlLdfvUwr+BVEZVvS73ZReltznJmGO11/Sz
 1poHW1mS7I2MJ9tojmZe0DHxB+ON/pPlRkV4g1OlJy80vR7kJBefGVzEtNvDAqOsptRCqxL9
X-Authority-Analysis: v=2.4 cv=Dd4XqutW c=1 sm=1 tr=0 ts=680fbc42 cx=c_pps a=n5+7iF7l5R/EKaY7dbRUPA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=T5_NpG3ZX2AK6ar-R80A:9 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On 7/4/25 16:16, Stefan Binding wrote:
> Firmware based registers may be different addresses across different
> device ids and revision ids. Create a structure to store and access
> these addresses.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>   include/sound/cs35l56.h           | 11 ++++++++
>   sound/pci/hda/cs35l56_hda.c       |  5 ++--
>   sound/pci/hda/cs35l56_hda_i2c.c   |  3 +++
>   sound/pci/hda/cs35l56_hda_spi.c   |  3 +++
>   sound/soc/codecs/cs35l56-i2c.c    |  1 +
>   sound/soc/codecs/cs35l56-sdw.c    |  1 +
>   sound/soc/codecs/cs35l56-shared.c | 42 ++++++++++++++++++++++++-------
>   sound/soc/codecs/cs35l56-spi.c    |  3 +++
>   sound/soc/codecs/cs35l56.c        |  5 ++--
>   9 files changed, 61 insertions(+), 13 deletions(-)
> 
> diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
> index 5d653a3491d0..d712cb79652b 100644
> --- a/include/sound/cs35l56.h
> +++ b/include/sound/cs35l56.h
> @@ -267,6 +267,14 @@ struct cs35l56_spi_payload {
>   } __packed;
>   static_assert(sizeof(struct cs35l56_spi_payload) == 10);
>   
> +struct cs35l56_fw_reg {
> +	unsigned int fw_ver;
> +	unsigned int halo_state;
> +	unsigned int pm_cur_stat;
> +	unsigned int prot_sts;
> +	unsigned int transducer_actual_ps;
> +};
> +
>   struct cs35l56_base {
>   	struct device *dev;
>   	struct regmap *regmap;
> @@ -283,6 +291,7 @@ struct cs35l56_base {
>   	struct cirrus_amp_cal_data cal_data;
>   	struct gpio_desc *reset_gpio;
>   	struct cs35l56_spi_payload *spi_payload_buf;
> +	const struct cs35l56_fw_reg *fw_reg;
>   };
>   
>   static inline bool cs35l56_is_otp_register(unsigned int reg)
> @@ -311,6 +320,8 @@ extern const struct regmap_config cs35l56_regmap_i2c;
>   extern const struct regmap_config cs35l56_regmap_spi;
>   extern const struct regmap_config cs35l56_regmap_sdw;
>   
> +extern const struct cs35l56_fw_reg cs35l56_fw_reg;
> +
>   extern const struct cirrus_amp_cal_controls cs35l56_calibration_controls;
>   
>   extern const char * const cs35l56_tx_input_texts[CS35L56_NUM_INPUT_SRC];
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index 4ef7878e8fd4..f6257fe45b9f 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -68,7 +68,7 @@ static void cs35l56_hda_play(struct cs35l56_hda *cs35l56)
>   	if (ret == 0) {
>   		/* Wait for firmware to enter PS0 power state */
>   		ret = regmap_read_poll_timeout(cs35l56->base.regmap,
> -					       CS35L56_TRANSDUCER_ACTUAL_PS,
> +					       cs35l56->base.fw_reg->transducer_actual_ps,
>   					       val, (val == CS35L56_PS0),
>   					       CS35L56_PS0_POLL_US,
>   					       CS35L56_PS0_TIMEOUT_US);
> @@ -667,7 +667,8 @@ static void cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
>   
>   	regcache_sync(cs35l56->base.regmap);
>   
> -	regmap_clear_bits(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS,
> +	regmap_clear_bits(cs35l56->base.regmap,
> +			  cs35l56->base.fw_reg->prot_sts,
>   			  CS35L56_FIRMWARE_MISSING);
>   	cs35l56->base.fw_patched = true;
>   
> diff --git a/sound/pci/hda/cs35l56_hda_i2c.c b/sound/pci/hda/cs35l56_hda_i2c.c
> index c7b836613149..d10209e4eddd 100644
> --- a/sound/pci/hda/cs35l56_hda_i2c.c
> +++ b/sound/pci/hda/cs35l56_hda_i2c.c
> @@ -26,6 +26,9 @@ static int cs35l56_hda_i2c_probe(struct i2c_client *clt)
>   #ifdef CS35L56_WAKE_HOLD_TIME_US
>   	cs35l56->base.can_hibernate = true;
>   #endif
> +
> +	cs35l56->base.fw_reg = &cs35l56_fw_reg;
> +
>   	cs35l56->base.regmap = devm_regmap_init_i2c(clt, &cs35l56_regmap_i2c);
>   	if (IS_ERR(cs35l56->base.regmap)) {
>   		ret = PTR_ERR(cs35l56->base.regmap);
> diff --git a/sound/pci/hda/cs35l56_hda_spi.c b/sound/pci/hda/cs35l56_hda_spi.c
> index 903578466905..f57533d3d728 100644
> --- a/sound/pci/hda/cs35l56_hda_spi.c
> +++ b/sound/pci/hda/cs35l56_hda_spi.c
> @@ -29,6 +29,9 @@ static int cs35l56_hda_spi_probe(struct spi_device *spi)
>   #ifdef CS35L56_WAKE_HOLD_TIME_US
>   	cs35l56->base.can_hibernate = true;
>   #endif
> +
> +	cs35l56->base.fw_reg = &cs35l56_fw_reg;
> +
>   	cs35l56->base.regmap = devm_regmap_init_spi(spi, &cs35l56_regmap_spi);
>   	if (IS_ERR(cs35l56->base.regmap)) {
>   		ret = PTR_ERR(cs35l56->base.regmap);
> diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
> index 5962914e2180..38c391d11c78 100644
> --- a/sound/soc/codecs/cs35l56-i2c.c
> +++ b/sound/soc/codecs/cs35l56-i2c.c
> @@ -35,6 +35,7 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
>   	switch (id) {
>   	case 0x3556:
>   		regmap_config = &cs35l56_regmap_i2c;
> +		cs35l56->base.fw_reg = &cs35l56_fw_reg;
>   		break;
>   	default:
>   		return -ENODEV;
> diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
> index d178357e1196..2e0422b41385 100644
> --- a/sound/soc/codecs/cs35l56-sdw.c
> +++ b/sound/soc/codecs/cs35l56-sdw.c
> @@ -526,6 +526,7 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
>   	case 0x3556:
>   	case 0x3557:
>   		regmap_config = &cs35l56_regmap_sdw;
> +		cs35l56->base.fw_reg = &cs35l56_fw_reg;
>   		break;
>   	default:
>   		return -ENODEV;
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index e28bfefa72f3..bc8f9379bc74 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -253,7 +253,8 @@ int cs35l56_firmware_shutdown(struct cs35l56_base *cs35l56_base)
>   	if (ret)
>   		return ret;
>   
> -	ret = regmap_read_poll_timeout(cs35l56_base->regmap,  CS35L56_DSP1_PM_CUR_STATE,
> +	ret = regmap_read_poll_timeout(cs35l56_base->regmap,
> +				       cs35l56_base->fw_reg->pm_cur_stat,
>   				       val, (val == CS35L56_HALO_STATE_SHUTDOWN),
>   				       CS35L56_HALO_STATE_POLL_US,
>   				       CS35L56_HALO_STATE_TIMEOUT_US);
> @@ -278,7 +279,9 @@ int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base)
>   				     CS35L56_HALO_STATE_POLL_US,
>   				     CS35L56_HALO_STATE_TIMEOUT_US,
>   				     false,
> -				     cs35l56_base->regmap, CS35L56_DSP1_HALO_STATE, &val);
> +				     cs35l56_base->regmap,
> +				     cs35l56_base->fw_reg->halo_state,
> +				     &val);
>   
>   	if (poll_ret) {
>   		dev_err(cs35l56_base->dev, "Firmware boot timed out(%d): HALO_STATE=%#x\n",
> @@ -395,9 +398,17 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
>   		return;
>   	}
>   
> -	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
> -					cs35l56_system_reset_seq,
> -					ARRAY_SIZE(cs35l56_system_reset_seq));
> +	switch (cs35l56_base->type) {
> +	case 0x54:
> +	case 0x56:
> +	case 0x57:
> +		regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
> +						cs35l56_system_reset_seq,
> +						ARRAY_SIZE(cs35l56_system_reset_seq));
> +		break;
> +	default:
> +		break;
> +	}
>   
>   	/* On SoundWire the registers won't be accessible until it re-enumerates. */
>   	if (is_soundwire)
> @@ -514,7 +525,9 @@ int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base)
>   		return ret;
>   	}
>   
> -	ret = regmap_read(cs35l56_base->regmap, CS35L56_PROTECTION_STATUS, &val);
> +	ret = regmap_read(cs35l56_base->regmap,
> +			  cs35l56_base->fw_reg->prot_sts,
> +			  &val);
>   	if (ret)
>   		dev_err(cs35l56_base->dev, "Failed to read PROTECTION_STATUS: %d\n", ret);
>   	else
> @@ -562,7 +575,7 @@ int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base)
>   
>   	/* Firmware must have entered a power-save state */
>   	ret = regmap_read_poll_timeout(cs35l56_base->regmap,
> -				       CS35L56_TRANSDUCER_ACTUAL_PS,
> +				       cs35l56_base->fw_reg->transducer_actual_ps,
>   				       val, (val >= CS35L56_PS3),
>   				       CS35L56_PS3_POLL_US,
>   				       CS35L56_PS3_TIMEOUT_US);
> @@ -752,7 +765,8 @@ int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
>   	unsigned int prot_status;
>   	int ret;
>   
> -	ret = regmap_read(cs35l56_base->regmap, CS35L56_PROTECTION_STATUS, &prot_status);
> +	ret = regmap_read(cs35l56_base->regmap,
> +			  cs35l56_base->fw_reg->prot_sts, &prot_status);
>   	if (ret) {
>   		dev_err(cs35l56_base->dev, "Get PROTECTION_STATUS failed: %d\n", ret);
>   		return ret;
> @@ -760,7 +774,8 @@ int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
>   
>   	*fw_missing = !!(prot_status & CS35L56_FIRMWARE_MISSING);
>   
> -	ret = regmap_read(cs35l56_base->regmap, CS35L56_DSP1_FW_VER, fw_version);
> +	ret = regmap_read(cs35l56_base->regmap,
> +			  cs35l56_base->fw_reg->fw_ver, fw_version);
>   	if (ret) {
>   		dev_err(cs35l56_base->dev, "Get FW VER failed: %d\n", ret);
>   		return ret;
> @@ -1045,6 +1060,15 @@ const struct regmap_config cs35l56_regmap_sdw = {
>   };
>   EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_sdw, "SND_SOC_CS35L56_SHARED");
>   
> +const struct cs35l56_fw_reg cs35l56_fw_reg = {
> +	.fw_ver = CS35L56_DSP1_FW_VER,
> +	.halo_state = CS35L56_DSP1_HALO_STATE,
> +	.pm_cur_stat = CS35L56_DSP1_PM_CUR_STATE,
> +	.prot_sts = CS35L56_PROTECTION_STATUS,
> +	.transducer_actual_ps = CS35L56_TRANSDUCER_ACTUAL_PS,
> +};
> +EXPORT_SYMBOL_NS_GPL(cs35l56_fw_reg, "SND_SOC_CS35L56_SHARED");
> +
>   MODULE_DESCRIPTION("ASoC CS35L56 Shared");
>   MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
>   MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
> diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
> index ca6c03a8766d..c2ddee22cd23 100644
> --- a/sound/soc/codecs/cs35l56-spi.c
> +++ b/sound/soc/codecs/cs35l56-spi.c
> @@ -25,6 +25,9 @@ static int cs35l56_spi_probe(struct spi_device *spi)
>   		return -ENOMEM;
>   
>   	spi_set_drvdata(spi, cs35l56);
> +
> +	cs35l56->base.fw_reg = &cs35l56_fw_reg;
> +
>   	cs35l56->base.regmap = devm_regmap_init_spi(spi, regmap_config);
>   	if (IS_ERR(cs35l56->base.regmap)) {
>   		ret = PTR_ERR(cs35l56->base.regmap);
> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
> index b3158a84b87a..c1d8bfb803b9 100644
> --- a/sound/soc/codecs/cs35l56.c
> +++ b/sound/soc/codecs/cs35l56.c
> @@ -174,7 +174,7 @@ static int cs35l56_play_event(struct snd_soc_dapm_widget *w,
>   	case SND_SOC_DAPM_POST_PMU:
>   		/* Wait for firmware to enter PS0 power state */
>   		ret = regmap_read_poll_timeout(cs35l56->base.regmap,
> -					       CS35L56_TRANSDUCER_ACTUAL_PS,
> +					       cs35l56->base.fw_reg->transducer_actual_ps,
>   					       val, (val == CS35L56_PS0),
>   					       CS35L56_PS0_POLL_US,
>   					       CS35L56_PS0_TIMEOUT_US);
> @@ -760,7 +760,8 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
>   		goto err_unlock;
>   	}
>   
> -	regmap_clear_bits(cs35l56->base.regmap, CS35L56_PROTECTION_STATUS,
> +	regmap_clear_bits(cs35l56->base.regmap,
> +			  cs35l56->base.fw_reg->prot_sts,
>   			  CS35L56_FIRMWARE_MISSING);
>   	cs35l56->base.fw_patched = true;
>   
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
