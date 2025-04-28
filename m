Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DCA28F92E;
	Mon, 28 Apr 2025 17:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861573; cv=fail; b=ZOvefBef3OVIFxcyiQoegIxKJ1wm/XetMAgYNQVkT1d1sITT0hM0EU1hr/VokqBdaH/ph+Ys3wZ9HDMtLMlTDh9S4icJs3uMiouSILhDnw9c4cyxzquzdXRx/+TpW4iMjMdtnLDesrGGMwbOrRZpC8QGvE51tQ1xGu7RlhtJoqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861573; c=relaxed/simple;
	bh=9TbUXkfk0lgE6IhC4OIq0AAP4AHy+qJxHCZU1OI0+bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQXX/GTRd8fRvGSTVk2z3gup+x1+U6JFuRcVxrAFDbSbJkPd4b3ckgbLPl5hWInHVWDWfijIipEpEDvLamCLAOt3GjuH+Ts6fEyG/EQIqmmr072H/hWZyyX337FktlFPbikc36y6rJi5UuuBdJpDMFkdYJNb5kvbEbK2nEzEcw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=b0tI/YiU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yL7zg9vd; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="b0tI/YiU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yL7zg9vd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S81TFZ013271;
	Mon, 28 Apr 2025 12:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=H7q15ZZy+ShAoXc5B5egZ2Dwr6grfeyiccIpRDat6JI=; b=
	b0tI/YiUOo1Z3FDhbZLpPX4Kxc7LHnLlVhYgp9NnFzYp7yrRkI/A/z2VuHvyLDOa
	GF0UTmrc4HQDbqg9sxy38T2C5tVHhLz3lLcI56MdQrF9vBFjE4hCfnptBAstEk0k
	UizTsomlc0xY4y0FVD5gxxvWsYT25iUiv0dPXvDWOED5W/50KgGnl7MEHrrCQeRc
	jS2lGMSyG5vxNz3v0D94Zb0Rj+GdZcOE0St4eyB3Q6VT3a7PbTEEQ3qD31EqlD9l
	au8u/GXSapLsvWvz/uyYOvzwWpL0GtOwf4dAsr6wvpxz2+3/43n4e6QSMIs/aPhT
	mNEuIDFfCdOaOnyTQHVVoQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 468vw1aj42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 12:32:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaFC4MFqPNugvbVQJLhBcdKLGXum5HOVHzMFNN5YQ45jtgNi0QOoZ0x/OdwQPD9Wd7Q4L8IX4vFWLBU21LM4XbX7nacZXxAIukcSHOHlxH058iIBBT8WaN0/2jJ/R/VjoTRi3LbJbltngrCNQU3EOzUJMj3oq15AiZHDDSlgdpVnSOptPNI5e9eRqA1NnfG8q6gOsVQBRRVnMSVN786Unww6s/Y6ibXasmbC5ub5+B2QQSX5FEV4EdjdNReXm6RYi9kwVAI/DQQj966Yt1p1/glsFGsPNMxn48BgDKoYn6HY3S7F81mJWL2ZzwIoHQp/Ihxu03dZgTD+F2fDtVaQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7q15ZZy+ShAoXc5B5egZ2Dwr6grfeyiccIpRDat6JI=;
 b=sVzaqHnKB5U/XWfFzGClahJFUA/iPjoBeRmcwau4V9txVZzMwq5yvFGKSCkb+8znQ+R3nLxhIHWba/7cKzDK+y8P5Evwkssv8zP5q7SgArTEblI7AYSAMWcpj0ojME2nx4yrbWjMusu772YX/B4nHuSoz0u+M/7AcWTh3YT8qFV5yO1JltQAEaDmT481pHjFos+jV5aGtbBSaEUbpXP7y1UxfIQNX5XbPvPpNsUQBG/B3BkEpw8N9LrW0aTymBFWhtcskXRfbGQuGyrC40jvJFrxfJrSVMmQgP+8XYEpnwLTJonGGoJGwYlLvLutaGUjU06uPAhbhTpRvnZ/5/1E2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7q15ZZy+ShAoXc5B5egZ2Dwr6grfeyiccIpRDat6JI=;
 b=yL7zg9vdcfRnHFmzJcCR2oOsSTXvACAScishWR142B+Lo6SnRAuKKUMFHesQroJ2U5Lideyywvp9e5djLzng4C7A0+EJpIhEEmtazBeOHwrK2XFaROsw9exUy213KlAC1WEJHbpNhUHnwREGBuGcGk1PgFCULXt230CRs0hKPf8=
Received: from BL0PR0102CA0013.prod.exchangelabs.com (2603:10b6:207:18::26) by
 PH7PR19MB7803.namprd19.prod.outlook.com (2603:10b6:510:24a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.34; Mon, 28 Apr 2025 17:32:41 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:207:18:cafe::40) by BL0PR0102CA0013.outlook.office365.com
 (2603:10b6:207:18::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Mon,
 28 Apr 2025 17:32:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 17:32:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1612F406543;
	Mon, 28 Apr 2025 17:32:39 +0000 (UTC)
Received: from [198.61.68.186] (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 74EDA820259;
	Mon, 28 Apr 2025 17:32:38 +0000 (UTC)
Message-ID: <71c5516f-371f-4776-a686-c231b46238b8@opensource.cirrus.com>
Date: Mon, 28 Apr 2025 18:32:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] ASoC: cs35l56: Add Index based on ACPI HID or SDW
 ID to select regmap config
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-2-sbinding@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250407151842.143393-2-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|PH7PR19MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: a36552d3-7428-47cc-d29f-08dd867aad4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUQza2Frd0E5elR0dTRJN1RXbld4YTY0MGlOQkphQkhkUXhJUjZEcWMvbE5R?=
 =?utf-8?B?Q1ozZVNsRTlpMTFmdXNUT2xoY29PcXltNW9RelE3RTNiNWxNb1hFalhOcUdS?=
 =?utf-8?B?ck9TdGl3b1ExVHhaMWhRY0tFWXczZDFWalpyNXlFWEtEMDNMYkFQeDZsaHd3?=
 =?utf-8?B?WjJON0N1VnIvWjJWbUFIdWwvMmh5UE1kRWpidERETitXS2Q2UVhZYlZFenEw?=
 =?utf-8?B?d25URW1ybGw5Sm5uaVcyUzM0bGg0Rk1aSXVOMlhWd0dkY25Fd1dML2x1SGdK?=
 =?utf-8?B?b2xEUmRvczNtdHhsM1UzS09vazh3WHB4cldsSXZFSm5RaWljWmxXcytjSkZL?=
 =?utf-8?B?NURzTVE0TEsvTnZLcDZVSkt2T1ZJSGxNSVpRU09uSGpkSFVzL0NueHlmd0k1?=
 =?utf-8?B?ZzgzNk9tTjZHbXlmUTZQaWR0YUhkdk5YQkdydlkxWk55OWFmWGJORU9RSy9i?=
 =?utf-8?B?K0tkaXVrVjAwWEtKdWRDa1lDM1gyK0M0clZwcHg1U0JzWDk5ZWVJNWl4VXZN?=
 =?utf-8?B?dUtoYjRUeTZVQ1psMUpUZXpKTU96S0pQcUxNTVNWdmVBK2p2aWIrbXBtUzJV?=
 =?utf-8?B?S1pXSzhDblFWUm55ay9Hc0IrRXVTb0lHcTl3c2hiOSthK0pBZ0xMdVVXWko1?=
 =?utf-8?B?Zk1KNS81T1dIUmoxYktrejY0QVZITU9iKythOFd4SmFCK1pWZThqVDhua3R0?=
 =?utf-8?B?M3RnQzdnbkI5b0xpSjFIelVHUGtjc293KzMvTU93UEhnNlFqR2FaMSt6Zzdh?=
 =?utf-8?B?QVB4aFp4b21XMTBxVS9uL21xcXBHQ3hGNGtLb2FVU3czaldFNmNCdTE3K3ZZ?=
 =?utf-8?B?VGFuRzJOYm5xRVJnc08xZ1B6NElPUldTQXZLbjFvSVcweFdvN3RSY3pRNGox?=
 =?utf-8?B?eFNTdXRENUplMy9aanZiVWRROFZMWHNZem9VZGltVWhQU01UN0NLRkQ3WEtB?=
 =?utf-8?B?elhWN2pTL3ZLbEw0aDFwMUQ0ZytvL3F0Q1NRNkQ2RExGeG1zdTN2cStnK1d5?=
 =?utf-8?B?VXBMZVdpWU00cjJTakFmWjI5Y2tNNmhkUTgzMGM5a1hkOXRsbGlrWXhFcnZu?=
 =?utf-8?B?WmdnMkpzNWxOUmVUUUs5TVFPZ1E2dkhBMWRHdHpNTWtGTmU1OXAwSzZtNXRW?=
 =?utf-8?B?Nkt0NUxFRHBTR0NmTVZqK3BKdmFnUjlGU3hOOGFMQ0VhR205UmJoWDI1U0Uw?=
 =?utf-8?B?cjVsVkVZWVlWMFQ5bnVwakJ2bktFZXRDNE9wT3VUbi9iRWFGSTZ5dGV4QU1G?=
 =?utf-8?B?U1kvdmhHU3ZQWWlQKytXV05CaTZnZVJEdjdqcS9wVmhtQ1d3UHRqdEFoWTU0?=
 =?utf-8?B?MXFoTVVZbFd2cGNEdmE2cDFaTzNWdzB2WUQyYWI1VjN2NmUxbWM1UDF3cnhP?=
 =?utf-8?B?Q0JzbWFMbDhtbWExYzJJNDg1WEdHb0hrQkMwU3hjanFDekFKZ0R3M1pkVmtF?=
 =?utf-8?B?S21hdWx1SGJBOXppUlI3KzNMc3VFcWFwdVB1RXREaWlUb1paakNTNUFkdkpi?=
 =?utf-8?B?b1ZscGJmdFAveFpIRWNnWGd2TW1Ydkk2azZVakxtZXk1dll2SWNCR24rRm5D?=
 =?utf-8?B?Y1Q1clNXWE1uZ1hTMHdYakJYQ3BMSFlHZE1OZjIwaUpqWlVEYlNIRnRnc1gv?=
 =?utf-8?B?ek1OZnpwNis4aytWT2ZEcFdwdWx1SUdDQlM2bnZRWnVoZnNJSGZBdTN6Wk8x?=
 =?utf-8?B?WWQzclZWM2xxK0JtQmhld2dIRE1VTThuRTdYT21aTTZHaDBrcWxrQ25CU3ly?=
 =?utf-8?B?U2NRTEVsbCs4RkFqSkZyMU80dmY2OG1lYTdmOGlDNGJJYjJTNTZXSFFlK2ZH?=
 =?utf-8?B?bGd6NllTRlhlSy9EeFQydExCR1BBTy9QZHYzVHpZNnpjelJ3cUp3VjhHdVVo?=
 =?utf-8?B?R3dZVVB4V3JKRVNuQnBTMG9obUF6eVZaRmxIckx0VHFYVUhyd2U1eXRhbXh2?=
 =?utf-8?B?SkE3YkVkR3c5T25adkhlUC9hMHRNZDcwS3M3WmE0Ty9ycVE1RUVZQnlvZ2N6?=
 =?utf-8?B?L2c5eTBIR3dmemM4d1ROelpib3l0bFh4QTBJUHg0N1FrVUFYajhnTE84ME04?=
 =?utf-8?Q?poFS3C?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 17:32:40.6021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a36552d3-7428-47cc-d29f-08dd867aad4d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7803
X-Proofpoint-GUID: c3JYPjFnTzT0TrMZ7xSvybXUu7hap_4_
X-Proofpoint-ORIG-GUID: c3JYPjFnTzT0TrMZ7xSvybXUu7hap_4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MSBTYWx0ZWRfXyzGeHsevcEfI GxKLyC8ipmeHDfVSrmfmoSDp0QRkTTNdS7kKMw0zi5vvhyq74NO7G3uZMXNMzU8X8qVJ5YY+oO3 asS+ASHqFitjWvpNRfNAOQHhiTSLil8hFInZO/asp3iWdsZRl6chrPD9SUVdMx66wkAaN2a530B
 bDhOGdFsY6A2/U/COwYyC+qkAYvJQ15CVUDrlyoUo8+eDPDSV+fNAHptYKnICBbD0D/7TvJnb5P 1sNkwDGBcKcDPHut5DZOOX+2TPuN2aNcpVajxjuzABy+tc/m1CT93AUMXNjZPkBamgDk4vwqZcp DTlx5mTDJUKSnD1+SzCV6GYG6aKirBReykrrIlE/jE+r24T520E4sfmlhRtbxMj6Jkqz27hhQXb
 NwXW20AN5UCaX+ZrXVJzmYKYSReThpBcUSt4ZOcFySeZLl/IaoSDiwvhyoAs/MOZ6+vVv54k
X-Authority-Analysis: v=2.4 cv=Dd4XqutW c=1 sm=1 tr=0 ts=680fbbc0 cx=c_pps a=AVVanhwSUc+LQPSikfBlbg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=ri2Dn8yNv2tjXU6I5_4A:9 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On 7/4/25 16:16, Stefan Binding wrote:
> This is to prepare for further products using slightly different
> regmap configs.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>   sound/soc/codecs/cs35l56-i2c.c | 16 +++++++++++++---
>   sound/soc/codecs/cs35l56-sdw.c | 16 +++++++++++++---
>   2 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
> index 8a518df1e16e..5962914e2180 100644
> --- a/sound/soc/codecs/cs35l56-i2c.c
> +++ b/sound/soc/codecs/cs35l56-i2c.c
> @@ -17,9 +17,10 @@
>   
>   static int cs35l56_i2c_probe(struct i2c_client *client)
>   {
> +	unsigned int id = (u32)(uintptr_t)i2c_get_match_data(client);
>   	struct cs35l56_private *cs35l56;
>   	struct device *dev = &client->dev;
> -	const struct regmap_config *regmap_config = &cs35l56_regmap_i2c;
> +	const struct regmap_config *regmap_config;
>   	int ret;
>   
>   	cs35l56 = devm_kzalloc(dev, sizeof(struct cs35l56_private), GFP_KERNEL);
> @@ -30,6 +31,15 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
>   	cs35l56->base.can_hibernate = true;
>   
>   	i2c_set_clientdata(client, cs35l56);
> +
> +	switch (id) {
> +	case 0x3556:
> +		regmap_config = &cs35l56_regmap_i2c;
> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +
>   	cs35l56->base.regmap = devm_regmap_init_i2c(client, regmap_config);
>   	if (IS_ERR(cs35l56->base.regmap)) {
>   		ret = PTR_ERR(cs35l56->base.regmap);
> @@ -57,14 +67,14 @@ static void cs35l56_i2c_remove(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id cs35l56_id_i2c[] = {
> -	{ "cs35l56" },
> +	{ "cs35l56", 0x3556 },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
>   
>   #ifdef CONFIG_ACPI
>   static const struct acpi_device_id cs35l56_asoc_acpi_match[] = {
> -	{ "CSC355C", 0 },
> +	{ "CSC355C", 0x3556 },
>   	{},
>   };
>   MODULE_DEVICE_TABLE(acpi, cs35l56_asoc_acpi_match);
> diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
> index 3f91cb3f9ae7..d178357e1196 100644
> --- a/sound/soc/codecs/cs35l56-sdw.c
> +++ b/sound/soc/codecs/cs35l56-sdw.c
> @@ -509,6 +509,7 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
>   {
>   	struct device *dev = &peripheral->dev;
>   	struct cs35l56_private *cs35l56;
> +	const struct regmap_config *regmap_config;
>   	int ret;
>   
>   	cs35l56 = devm_kzalloc(dev, sizeof(*cs35l56), GFP_KERNEL);
> @@ -521,8 +522,17 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
>   
>   	dev_set_drvdata(dev, cs35l56);
>   
> +	switch ((unsigned int)id->driver_data) {
> +	case 0x3556:
> +	case 0x3557:
> +		regmap_config = &cs35l56_regmap_sdw;
> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +
>   	cs35l56->base.regmap = devm_regmap_init(dev, &cs35l56_regmap_bus_sdw,
> -					   peripheral, &cs35l56_regmap_sdw);
> +					   peripheral, regmap_config);
>   	if (IS_ERR(cs35l56->base.regmap)) {
>   		ret = PTR_ERR(cs35l56->base.regmap);
>   		return dev_err_probe(dev, ret, "Failed to allocate register map\n");
> @@ -562,8 +572,8 @@ static const struct dev_pm_ops cs35l56_sdw_pm = {
>   };
>   
>   static const struct sdw_device_id cs35l56_sdw_id[] = {
> -	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0),
> -	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0),
> +	SDW_SLAVE_ENTRY(0x01FA, 0x3556, 0x3556),
> +	SDW_SLAVE_ENTRY(0x01FA, 0x3557, 0x3557),
>   	{},
>   };
>   MODULE_DEVICE_TABLE(sdw, cs35l56_sdw_id);

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
