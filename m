Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5D22951C7;
	Mon, 28 Apr 2025 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861781; cv=fail; b=Ck+HqXs7aqV4AHDYyFcasRbBqC3r1h4D9k3WVIuYzCOifKfvHRdHShp5Zd1OjErlVWQB/rLAaDp+36l0N88StUWKzdNHvuAe7fcT5glQDe7D1Eq45Q35UfOwXKUsq9XSIkJlCq04hRU/X8quVENr4I4iBVG/HgTPq2ztfCv9KRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861781; c=relaxed/simple;
	bh=nYxpa7Q0Kg15dZabvsAR1mtxBwVGk7SCJCrorO2l/0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNQRczSAUPtLtzabK+UYFbIG8iVlJOeTOh9Gf2UAHaAS51ydRVuy2/X6aWOP2bGBv6YrFNPgZavWbfL5BBKKR/VEiFzaQBxqGichAO0DWLl6kdyXGPsMx2uu451fAG81CNfHDeZgaZVsiQcQK3IP8V2ywIROEq5llzD3EV1PHr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=V6C4hurS; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Y35CFrdB; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="V6C4hurS";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Y35CFrdB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SHaCiK029951;
	Mon, 28 Apr 2025 12:36:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=vDZejAPyqCfYwxeIxE+SL3lgzdk1y7/S85u5wKSiW4U=; b=
	V6C4hurSR7TMLQTmYnDZJnRVaLzXhgjDxit9dJf0nQ/BuQQEuThxVIooPSb2tC9C
	bZt5cMHPzoNVaAitcDJL6NtwZWu89GNaRsMGPGEt9iYPlfiT0TBdDoL0T7GTrqJI
	IuCTE9UsNO5vC8WhctdY5QKHsaTwiUVGrswDg7pJTHz+HcbZ54fEGFV1TpzfgQSi
	iIZ18GuXDXw6fuwiUdFWkZOmTVIyDsPe4ko0YDkeDmcLDxDcbLPCCOo7y3PxTYcY
	QYTqDp8sSWziuiCWwe3mh/45qLoXyZC2xvZpdo4S+YelgNIHiVN6ysu5bu3Z3xhq
	VfwFL954EtUkOoptlJK58Q==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46ae7cg00c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 12:36:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQugvzPOtXBJpJRG/O+u6fAO3j5IJQPeaXS9/2a/zQbe9905WdpvMbToMPDIDslypakV7xcHFaoE3qBeFhT2kxNfZyjyIxo1oANV3leKbhPVrY7TVaMUK5TZjMw71F2Zvn3PL94H8u3TX6vpys0m6KPkXo/mtLz6WMmYGsClznt0eU7XI2gLUnD66TRU1T7rSt44TKPCCQTkEk9bXyDD+b1vtzW3mZ0ie3cbGCpNoRmPqHa07ZStUtf7dyk65/rsx0E5I958dyFcyvOgCF5E4CG74x6Nlxeq8Os7KgQFXLWsC8g2YZEgKahzMG7RpQFtzILsm9eQMjsQc8HgiWywSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDZejAPyqCfYwxeIxE+SL3lgzdk1y7/S85u5wKSiW4U=;
 b=d3JwHZuieaeNmpXb4e+vKZqXysuQqtLlH20FiH6/B3TavseB4hhh44bPSGpg4TuMk237OzW0kYYkiVRYdFCrHuUw+RFzYFQKchlq8YiGIwXq/981MZ0mFwJCAqmur07GEcMX/hf+QHa+YShpd7eHlAVZ9/N5IX8OBXXTsCpGTNW156hht2P25DqR/xwMPsMzjpraOetSGXSOExGcsi67HDxMwJME7WnTfKq2G8CyPyyi27ItB9IYusPLX8YXK0eBRwXm6eit+4M2EV/5Z0PO5bK8RSOQw89Uf2r6dT70IAZI7PbT+2JilEEKJqAF1P0DTELtId8zQIfyy+BrXUedDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDZejAPyqCfYwxeIxE+SL3lgzdk1y7/S85u5wKSiW4U=;
 b=Y35CFrdBnUSZ5g9YPPtHUtxn+94xIN1uPwkx/4D21Y7PK1dUnh6uuCpe4ZiHPgKvn2aG+kbx4cTH8jK/TKhBKlknd6EDi4vptquDqIOhuRoB/0zbAEvE4VdJpF1nBzQYUOy+stv9mxiIgr1YWadJSM/bM13Q8g91FJ7Py5BYjbE=
Received: from BYAPR06CA0060.namprd06.prod.outlook.com (2603:10b6:a03:14b::37)
 by MN0PR19MB6384.namprd19.prod.outlook.com (2603:10b6:208:3c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 17:36:06 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::58) by BYAPR06CA0060.outlook.office365.com
 (2603:10b6:a03:14b::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 28 Apr 2025 17:36:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.33
 via Frontend Transport; Mon, 28 Apr 2025 17:36:05 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4CEB1406543;
	Mon, 28 Apr 2025 17:36:03 +0000 (UTC)
Received: from [198.61.68.186] (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9845A820259;
	Mon, 28 Apr 2025 17:36:02 +0000 (UTC)
Message-ID: <9f75b45d-2f41-481c-a62a-4edc6cb15570@opensource.cirrus.com>
Date: Mon, 28 Apr 2025 18:36:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/5] ASoC: cs35l56: Add Mute, Volume and Posture
 registers to firmware register list
To: Stefan Binding <sbinding@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20250407151842.143393-1-sbinding@opensource.cirrus.com>
 <20250407151842.143393-4-sbinding@opensource.cirrus.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250407151842.143393-4-sbinding@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|MN0PR19MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b167f5-bc37-4fd0-ddaf-08dd867b274a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkpNWm1DQzQ0TEZibWVrNnVUdzUyaU5UKy9HTXBwN3JaNkljTWJvQUVDNlY1?=
 =?utf-8?B?djBXdVJmRCtackpnbXVzUkJqelY0eUtOTEJyN0p0TURtQ3grV2VtdnNtbEJm?=
 =?utf-8?B?NDJOMWg4WWdvTUx0bW5sTWZqQldPVlh5Z0FmQkZVUk5FNlRBOEE3YTNaMm5s?=
 =?utf-8?B?czFlTG1ZSmE1SFV2SjY4MDcxT1ZPeFlwKzFvTHZSSFYrcUZNbW02U0JtUTUv?=
 =?utf-8?B?TEdvcTZiMlBjRm9uUk1ENkNxUm5kWVdQU2VDWDlFekVveEFiVitQV0YvUTg4?=
 =?utf-8?B?QXBQd1g5NDAvZEc4djZxUnpFdWp4VW5yRmRVQlYvQVdGVHgwRHY0QXFhRDlZ?=
 =?utf-8?B?eTJudjRkTUxST0hMaGZLSjJCaktXTGc3dmRNTGd3Y3Vmc3pLdXBiRWFrenF5?=
 =?utf-8?B?eTJTampzZ29VcnJOaUFqallOc3lQd2d3bmhmbTl1YTZBV1hucDUrOG82SlZ1?=
 =?utf-8?B?c2ZpbXM3Wk00bE9lSnVQei8velNRRVExL0RHdE9tTG9tQ3BHY25FVXBkbXlt?=
 =?utf-8?B?d05SNk9WZFZpcGMrckxiZ1VWb3N3eEFOc0NsaUJzUU44dnJUWWZtSE5jZ3Bi?=
 =?utf-8?B?QW5lbUlvMEVvZlRiTmltQ3lteFFGL2hDdzBWWkhvWkFHREdiMUZLTjR0QTJ4?=
 =?utf-8?B?UW1aOWZZZklkMURPZVhIaG1ta210eTk3SEJnbkJsS0lLR3JubUs3d2NLVFRk?=
 =?utf-8?B?TWhaRnBTcUY0ZGZLeXdNUU4veWsrLy94Yy9tWjVzTmV5TU9FZ1NNb2s0ZzI5?=
 =?utf-8?B?eTAvbkFwRWVYRXg3NkhsNE1ZU3BBN2dIaU0wb2dqV0hPYnh2d0pOc2ltTDli?=
 =?utf-8?B?cXduVE5GNjZmNDNUVTBIMS95Z01mdDlrcDQwaWhwZCtrbERDMUd5VksxdHB2?=
 =?utf-8?B?ZDlDSEJhVVk1VWpLUzFjTnJnd0g4M1dEaFRvVDNLSWNudXoxZE9lV0JNMGdx?=
 =?utf-8?B?blJlUjQyN2dHSEFuNlV2dHROTmlSRUZFRW9sLzdCcDBnQkg2OFhIdUJYYTZH?=
 =?utf-8?B?dm44Q1l6K0R1VHJheVVpeE1oSFdFczhSd05hbk1DRitNV3RwZVBYS1pLUlU4?=
 =?utf-8?B?d3RKSDllZmx5WndMbDBvSGN3WERqdVdRNFBoOU5STHVYcjlMWWhwZ3ZrbUFP?=
 =?utf-8?B?ZlRGbjhQOVkzbUwwems3aFh3UityTG1iWllnb3dMOEtrVTdydk9uOXJVeWJM?=
 =?utf-8?B?YlVMTzhZQmk2SkVFbEVpc25yRkk5MW4zRjBpdmNrQUhwYUVjbGZIdFZjV293?=
 =?utf-8?B?SzRwRmF4ZmNCS0NKeEo4SGRwYXdIQ0VYKzFPMml2Y1dJRU9EckRBWlpvaExJ?=
 =?utf-8?B?NUUvZSt0d3BqeDh0Rnk2MHhKMDNrVVAxR3U2TlQyTEtrUlo3YXJpZ1dlTFhs?=
 =?utf-8?B?ZjM1QWg3dC84Z3ArRnJsS0s5QitqeE41L2RUTXRodFJCT2ZrWHphdGltTUEw?=
 =?utf-8?B?cXRid1VqMXRhcEZUMHB5NkN2MHhEamRhUXRYZngxYkZ6MFBkc2JoU3QrR2Fj?=
 =?utf-8?B?d2xxZUNmTzFSS0tqOUJGU2Fhdms5QVdmcm4xbjFYc0RKcTZDQ3ZSWXhudlVY?=
 =?utf-8?B?d3pyMDE4aFl4VHRKNUEvVTErOVR1QVJGY0cxV2FQYXJESE04Mm1aUEwwaHY2?=
 =?utf-8?B?NjdsN29hWVpQQ2FLQmtlRldEeTRFKzdiRlVCVWZrTEIzZUlBbkNMTXloR1Iy?=
 =?utf-8?B?eUM4WW5YSU5aVzh0ZC9NcDA2bmxnWnQvQ3hGVFpCL3F6N2Z3ZzFTNVBDUlVi?=
 =?utf-8?B?RTBIUzFmVG9ycEZPUFE1RDV0L01WUGx6MHJPVFJ3dUFsbVJLRU9FRC9pKzBm?=
 =?utf-8?B?azVnVzBMRVUvNTd1MkZBUWV2QmtWTGdHdkM2d21yQTNPV2tSNWxJOFFDK3du?=
 =?utf-8?B?ZWFYUElUcGcwZnl0Yk9QUHlHdnBuQ1I2d0dPVThBRnF5cnkvdWVEcHlDZnlD?=
 =?utf-8?B?TDc5dTZsdGlTVDZpMVpTV3NpSndENm55THQvTWJsbFlZK1paKzJva2ZveWF3?=
 =?utf-8?B?QzQwNzhRV3U1czhla0xaVy9SZWhyZzhsYlBMeGJmMXBlQU9ZWklJU1ozemtX?=
 =?utf-8?Q?EekNc5?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 17:36:05.1460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b167f5-bc37-4fd0-ddaf-08dd867b274a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6384
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE0MiBTYWx0ZWRfX4eOEXysVBB1v vWyFgWR3MmtW87PwutrgWx4Lss+r91jByIOHVLXmiHXT8jnYyzB8FidTr5ReWuNn2aHw9QCE5L8 Tepg1F5S7wI0gFzZK0UvJoUc03rqDZ4EhjoQ42u8jKU8ekbCtyXFEj+jZWesR47kNltZylBPMMV
 wn14U+2zQD89wd6ts7QaGIF/UPVXtTjoHynsCmHBv2G0mBhT7+8UobeFuyV9oGLvdJ19/JZAByf 31+BCShmSTvGZVx9EoBE4MSWbFThwvzpS+6ozn8SOnPNM2mrA4x73nsBWCzHRpZIqmLVTWiKyh8 url/xn/5tZJZEBMtpOztuW+HmBNEyw4JI8MojJQA9/XQSvhveGHtuDtMz34+uxH+pmPHgB1eEnA
 S+l6cc990IlLDpM+Muxo1t4MoJbigY9hc7T0G1BgNpnd+79o6gNAUAiTy8J5+hXDSwJCDOxJ
X-Authority-Analysis: v=2.4 cv=DotW+H/+ c=1 sm=1 tr=0 ts=680fbc8d cx=c_pps a=98TgpmV4a5moxWevO5qy4g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=3BYqLjN5vghy3niwY2QA:9 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: jyKw3QXvnQUtWsc_mjkbUJ5msMmpV1kp
X-Proofpoint-ORIG-GUID: jyKw3QXvnQUtWsc_mjkbUJ5msMmpV1kp
X-Proofpoint-Spam-Reason: safe

On 7/4/25 16:16, Stefan Binding wrote:
> Registers to set Mute, Volume and Posture are inside firmware,
> which means they should be added to the list of registers set inside
> firmware, in case they vary across Device or Revision.
> 
> These three registers are also used for controls, so additional
> handling is required to be able to obtain and set the register inside
> ALSA controls.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>   include/sound/cs35l56.h           |  3 +++
>   sound/pci/hda/cs35l56_hda.c       | 17 +++++++----------
>   sound/soc/codecs/cs35l56-shared.c | 25 ++++++++++++++++++++++++-
>   sound/soc/codecs/cs35l56.c        | 19 +++++++++++++++++--
>   4 files changed, 51 insertions(+), 13 deletions(-)
> 
> diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
> index d712cb79652b..3abe4fbd2085 100644
> --- a/include/sound/cs35l56.h
> +++ b/include/sound/cs35l56.h
> @@ -273,6 +273,9 @@ struct cs35l56_fw_reg {
>   	unsigned int pm_cur_stat;
>   	unsigned int prot_sts;
>   	unsigned int transducer_actual_ps;
> +	unsigned int user_mute;
> +	unsigned int user_volume;
> +	unsigned int posture_number;
>   };
>   
>   struct cs35l56_base {
> diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> index f6257fe45b9f..61aba1956338 100644
> --- a/sound/pci/hda/cs35l56_hda.c
> +++ b/sound/pci/hda/cs35l56_hda.c
> @@ -237,7 +237,8 @@ static int cs35l56_hda_posture_get(struct snd_kcontrol *kcontrol,
>   
>   	cs35l56_hda_wait_dsp_ready(cs35l56);
>   
> -	ret = regmap_read(cs35l56->base.regmap, CS35L56_MAIN_POSTURE_NUMBER, &pos);
> +	ret = regmap_read(cs35l56->base.regmap,
> +			  cs35l56->base.fw_reg->posture_number, &pos);
>   	if (ret)
>   		return ret;
>   
> @@ -260,10 +261,8 @@ static int cs35l56_hda_posture_put(struct snd_kcontrol *kcontrol,
>   
>   	cs35l56_hda_wait_dsp_ready(cs35l56);
>   
> -	ret = regmap_update_bits_check(cs35l56->base.regmap,
> -				       CS35L56_MAIN_POSTURE_NUMBER,
> -				       CS35L56_MAIN_POSTURE_MASK,
> -				       pos, &changed);
> +	ret = regmap_update_bits_check(cs35l56->base.regmap, cs35l56->base.fw_reg->posture_number,
> +				       CS35L56_MAIN_POSTURE_MASK, pos, &changed);
>   	if (ret)
>   		return ret;
>   
> @@ -305,7 +304,7 @@ static int cs35l56_hda_vol_get(struct snd_kcontrol *kcontrol,
>   
>   	cs35l56_hda_wait_dsp_ready(cs35l56);
>   
> -	ret = regmap_read(cs35l56->base.regmap, CS35L56_MAIN_RENDER_USER_VOLUME, &raw_vol);
> +	ret = regmap_read(cs35l56->base.regmap, cs35l56->base.fw_reg->user_volume, &raw_vol);
>   
>   	if (ret)
>   		return ret;
> @@ -339,10 +338,8 @@ static int cs35l56_hda_vol_put(struct snd_kcontrol *kcontrol,
>   
>   	cs35l56_hda_wait_dsp_ready(cs35l56);
>   
> -	ret = regmap_update_bits_check(cs35l56->base.regmap,
> -				       CS35L56_MAIN_RENDER_USER_VOLUME,
> -				       CS35L56_MAIN_RENDER_USER_VOLUME_MASK,
> -				       raw_vol, &changed);
> +	ret = regmap_update_bits_check(cs35l56->base.regmap, cs35l56->base.fw_reg->user_volume,
> +				       CS35L56_MAIN_RENDER_USER_VOLUME_MASK, raw_vol, &changed);
>   	if (ret)
>   		return ret;
>   
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
> index bc8f9379bc74..da982774bb4d 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -38,7 +38,9 @@ static const struct reg_sequence cs35l56_patch[] = {
>   	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
>   	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
>   	{ CS35L56_IRQ1_MASK_18,			0x1f7df0ff },
> +};
>   
> +static const struct reg_sequence cs35l56_patch_fw[] = {
>   	/* These are not reset by a soft-reset, so patch to defaults. */
>   	{ CS35L56_MAIN_RENDER_USER_MUTE,	0x00000000 },
>   	{ CS35L56_MAIN_RENDER_USER_VOLUME,	0x00000000 },
> @@ -47,8 +49,26 @@ static const struct reg_sequence cs35l56_patch[] = {
>   
>   int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
>   {
> -	return regmap_register_patch(cs35l56_base->regmap, cs35l56_patch,
> +	int ret;
> +
> +	ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch,
>   				     ARRAY_SIZE(cs35l56_patch));
> +	if (ret)
> +		return ret;
> +
> +
> +	switch (cs35l56_base->type) {
> +	case 0x54:
> +	case 0x56:
> +	case 0x57:
> +		ret = regmap_register_patch(cs35l56_base->regmap, cs35l56_patch_fw,
> +					    ARRAY_SIZE(cs35l56_patch_fw));
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
>   }
>   EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, "SND_SOC_CS35L56_SHARED");
>   
> @@ -1066,6 +1086,9 @@ const struct cs35l56_fw_reg cs35l56_fw_reg = {
>   	.pm_cur_stat = CS35L56_DSP1_PM_CUR_STATE,
>   	.prot_sts = CS35L56_PROTECTION_STATUS,
>   	.transducer_actual_ps = CS35L56_TRANSDUCER_ACTUAL_PS,
> +	.user_mute = CS35L56_MAIN_RENDER_USER_MUTE,
> +	.user_volume = CS35L56_MAIN_RENDER_USER_VOLUME,
> +	.posture_number = CS35L56_MAIN_POSTURE_NUMBER,
>   };
>   EXPORT_SYMBOL_NS_GPL(cs35l56_fw_reg, "SND_SOC_CS35L56_SHARED");
>   
> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
> index c1d8bfb803b9..a4a1d09097fc 100644
> --- a/sound/soc/codecs/cs35l56.c
> +++ b/sound/soc/codecs/cs35l56.c
> @@ -838,6 +838,7 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
>   	struct cs35l56_private *cs35l56 = snd_soc_component_get_drvdata(component);
>   	struct dentry *debugfs_root = component->debugfs_root;
>   	unsigned short vendor, device;
> +	int ret;
>   
>   	BUILD_BUG_ON(ARRAY_SIZE(cs35l56_tx_input_texts) != ARRAY_SIZE(cs35l56_tx_input_values));
>   
> @@ -877,6 +878,22 @@ static int cs35l56_component_probe(struct snd_soc_component *component)
>   	debugfs_create_bool("can_hibernate", 0444, debugfs_root, &cs35l56->base.can_hibernate);
>   	debugfs_create_bool("fw_patched", 0444, debugfs_root, &cs35l56->base.fw_patched);
>   
> +
> +	switch (cs35l56->base.type) {
> +	case 0x54:
> +	case 0x56:
> +	case 0x57:
> +		ret = snd_soc_add_component_controls(component, cs35l56_controls,
> +						     ARRAY_SIZE(cs35l56_controls));
> +		break;
> +	default:
> +		ret = -ENODEV;
> +		break;
> +	}
> +
> +	if (ret)
> +		return dev_err_probe(cs35l56->base.dev, ret, "unable to add controls\n");
> +
>   	queue_work(cs35l56->dsp_wq, &cs35l56->dsp_work);
>   
>   	return 0;
> @@ -932,8 +949,6 @@ static const struct snd_soc_component_driver soc_component_dev_cs35l56 = {
>   	.num_dapm_widgets = ARRAY_SIZE(cs35l56_dapm_widgets),
>   	.dapm_routes = cs35l56_audio_map,
>   	.num_dapm_routes = ARRAY_SIZE(cs35l56_audio_map),
> -	.controls = cs35l56_controls,
> -	.num_controls = ARRAY_SIZE(cs35l56_controls),
>   
>   	.set_bias_level = cs35l56_set_bias_level,
>   
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
