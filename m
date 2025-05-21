Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A3923F431;
	Wed, 21 May 2025 09:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819374; cv=fail; b=KMHXcmonjFqxAnYX4XsmTTSjC/5a2QKAUeL3H0JhvRjKxmW3sXL/iiGEnFwY0k+fcNLa85OVoviS+zSOUJxvogs8en3HR+DZMS0ofiAGMp0odSovQ3IosjTZHGZz5SaeC5FjqIT93Y56GLZb2/5N8XbTSlBMVlhVxKx7otUTdoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819374; c=relaxed/simple;
	bh=gv4uKcfq2RCTMbs9HxZhgkYTiHu07RBDMo4BbJgBArc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NosihrtlFerzyAFOyeBVP7CeVv+UsLGVL/yCgy2QtwGstAjxIf3CE0c1ZkxHN1DPGrSrY6dF4rGJBcoZFXyi76uuVj5OHi/5bgAfuMVc1QBNCi7KIV6RaY2CvQVYkNCAheTwl1Eb+CpWoJubRdWQN2ul+0NXJ5kKl9wfdG0N0MQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=q9uZHu+r; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=klVccH/P; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="q9uZHu+r";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="klVccH/P"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5cuPi012005;
	Wed, 21 May 2025 04:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ucYhhIZbUBD3mhTkxVP4NYuz+Jy7KtS85dDR89t0wlo=; b=
	q9uZHu+r0FHiow9rvCBvMvLZj8Q3PRIL/oZtGunzSVedrfLBPDoWUa+NR4V20e5n
	Ut5xQ0DeR8X4sqliuVIf1TTfjEx5aaBV4Yl/TH0ltDJZsRTSbWsW99MubCq7DWub
	ylPUSzfipkujTnbrnmASmdio3W7+RN16BCF85qU8FFWvLFaX9vZSLxj5cLQmUHnD
	DDTjYEmyRyYN6DAi1dzo9J7TRyiobSBoEUeMW6Hgfsgmlr22d/qhur7E7UbV57uW
	frxQqxngokcyh/jKsT+fGe0p4MFimdlN5ZgS82yZM7qdihRJ9YMYmEmZTCCdPHvi
	8HMZBfhvXONc9xx6nzU1uA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46rwfh12vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 04:22:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXqbNhWzLlxiQgXHuJdNGdLP5lbU45dq7xKvFFEWj+US6OAifjz8ehvSx2U6GmOYVvCMh+DX6N3uiICZVVHMmP20ZenDHV1Pe6Mi1+kec3dHOX/Q7BpFAJ0KzDSUsiytRFK7CBUL4d6b5ZxiZ+FHvH8uHW45ZBgblE5DCQHMdgY1r9NerBnVjgTl+Dm0/td9tBedrXMOpmGPRzde4caQnxRsASPbB5blwrM+NL3vC33ISxkQ0O/GOP28rW9L3nVdu0+SKyM6zOzesuhS6u2FgFStKoK4TuwJH5+VT+gMhw16wUe4kz/wvr//HhujErrsRhCosm0os75xDxHUogIBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ucYhhIZbUBD3mhTkxVP4NYuz+Jy7KtS85dDR89t0wlo=;
 b=NJSqC5m/KOm/POgdNuIiG0/lYzvUtgGOu50kwZuXx7GFYe4JqObUQWO2Sp/pwW1TJRhUQfcrfo8lYIvcst2vdJI4OOomaDqw3k7lfqfMnEaeQSnw/DH+/AIg2Hyn6sHmnWUcFY+pFOR4RIvlkIKMfG95pUqp7djbsjW9ZzWX65mi/LRZaBXd8EGMmWXL0IVOJSVzZbxJJZA2x9sncJ2JYiT68e7i5PW3knN4/GOE1DDu0IgX7ge9u2sbEcAjHBt23LlAM3nmshtB2Mm0x1PS1Xp25EXpVC2Q4K5oeLxPHaa77RjIE4usz11FVeeeYLSwjd/axhy/PI0iFmFdbQ7xcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=arndb.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucYhhIZbUBD3mhTkxVP4NYuz+Jy7KtS85dDR89t0wlo=;
 b=klVccH/Ph1waAnvrdKINtYm2Mfi5gJCPOgqHd2z96wFWDUrIsbUmQ1tqXt83HDx9m5cZVz56iG/AiwYhJZ0og4R5oHiaix6KQl9YLVKwjOjJz84RhEn8rBqz56xfG1Dn0PMWXVFj3QInpHNgQYhKlku702cy1hsE3m3WM81ysbA=
Received: from PH7P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::7)
 by CY5PR19MB6494.namprd19.prod.outlook.com (2603:10b6:930:3a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:22:35 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:510:32a:cafe::b6) by PH7P221CA0001.outlook.office365.com
 (2603:10b6:510:32a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 21 May 2025 09:22:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 21 May 2025 09:22:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B366B406540;
	Wed, 21 May 2025 09:22:31 +0000 (UTC)
Received: from [198.90.208.24] (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A5588820248;
	Wed, 21 May 2025 09:22:31 +0000 (UTC)
Message-ID: <8912514f-8d14-45a8-941d-bb57fbf756b2@opensource.cirrus.com>
Date: Wed, 21 May 2025 10:22:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] ALSA: hda/cs35l41_hda: select FW_CS_DSP
To: Arnd Bergmann <arnd@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250520162101.3929551-1-arnd@kernel.org>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20250520162101.3929551-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|CY5PR19MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a23c062-e5b0-4320-d876-08dd984904af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEVuSHpVYVJieDNtdjNoanAxVGVMUFljL0k0UHBjMC9PM0V6MjNocjVZTWJV?=
 =?utf-8?B?YmgwV2x1U2tqMW9Cb3UyM2lUZU1KS0dyakV4K2poQ2xpV1JQSTA2TnlNZkRH?=
 =?utf-8?B?MGwwb09ZZWFlWjlNRldkWUhrcnlteFhRQ1htdEJGL1JaaWhPSXFncWhaQjEx?=
 =?utf-8?B?aUx4RlRlUTNvY2ZwdURsQUd5dFFaZU9uOUlWa2RPYm1UUVZ2N0RsaEhOV3gx?=
 =?utf-8?B?M0lqNUVEVUsydmVJSDlhK0JGb3BWdEpxN0tVZGtrOURPOVBkZEVoa2JaNFc3?=
 =?utf-8?B?di9tYXpnNkJGYngzNHIxcm1BTEZkeEJkdk1QN1BvSVByMFIvRDZza1JTZlgv?=
 =?utf-8?B?QXRMclV5SFRMR2ZDd1p0Y0hCb0JDRm85K2o5NkpUNlBtTk9VeFJLcjE0UUc2?=
 =?utf-8?B?T3ZSdTAwb1BBdXlDZHp5N3NOOWluUDg3NkhMdkkyckJUeTM2Q0xjVmhoNmI1?=
 =?utf-8?B?VjNWV2tjL1pER1VQK3N2NWx3cEpQMDhId1ZkRzIrNUY4dlMxMXhsa3JtOERB?=
 =?utf-8?B?em8zMXI3NWhpc0xqQ2VVYnNlOXJlSGY4a1ZVOUFhL1VQaXg2bTRhc3NWN3hH?=
 =?utf-8?B?ZXRoLzlMZGpqZXhwYjdRNzIwaUpReDdhdTVFeTZOMHllRUZQelVGYmNBME8y?=
 =?utf-8?B?L1A3TnNuODdweituMWlQT3VYUlN5bllDc0RUQnpTVXBnb3lac0JHWG1xTFJo?=
 =?utf-8?B?anVLSGU1Qm1DdHp1eFc1U1djR1lkdGg2eElTVUtHMnZUR1BhaDVvQm15Smw1?=
 =?utf-8?B?YVlndWNIemwxZDlUWjM2d04yL09qZk1tb2NaTW0rSzhTbDdyWkl3V2dDMDE1?=
 =?utf-8?B?SDJFYURqd1daWUUrNEQxSGZGd00vemRYYWpJSG9BK2pYd1FOeFAwRkIrc284?=
 =?utf-8?B?QnVnZTZyYTZpUWhyYm8yRnBnc3FvQUxvNFU1YnhHamJ1N0lMSENFWStQNHlS?=
 =?utf-8?B?VXIraUM1YWJ0SERpS3p6MWVmNEJnUnozRytMWFJLeUR3UzExUnFGSWRpUkVV?=
 =?utf-8?B?YVVJeWhhMGNVdkZtWmZhSEwxNC9jSVlKSENYQmV0T2xNejkvZ1BxbmZUWThV?=
 =?utf-8?B?blc2S2E2UWRORWJiSUZWaFUreUtxUkwwS3AxT3FteUNJMG4vdXVVUFJVYkpo?=
 =?utf-8?B?ajRVQ25LbmxqQ3pneHpxSHVtYkZuQkJYOUdqandlcTZFaytqWlhHS09mVVZN?=
 =?utf-8?B?RUk4WDJrTFZhaXRaZWIvMjY1YlVhWlEzRjJqUGV3bVF3K2pWNDFOQTFyRE02?=
 =?utf-8?B?YzRoYkhIbytkelF1aWhTbkk3ZVRSemJ2U3JBMGVJd2FMaDhuUXMwMm52RHVH?=
 =?utf-8?B?VTVxaUczNnFQTm5xWXdYQkRUYnlsQVhNWDhjSmpFUkJLSVVvVG0raUNqTkhL?=
 =?utf-8?B?NnE3UFJSa1ZtYVg0c0JiazZVeWFnMkUzdTFVTTQzdzQ2bUdheVBtMTdLVDRG?=
 =?utf-8?B?bjcxa1JFQ09GaUlNRTFSUnUxcVpuWTYvSlBndHY1eXp5TVhJSjJySlk3Zjh4?=
 =?utf-8?B?WHNDOE1jOFJrdVRRV2dZa1ZtRTM2UHhPbFg5enFDa1dNbVpWcVdMajROalhx?=
 =?utf-8?B?cEUyMUUzVVVYdXA4NE9JaGNVNlNkdTFvRFJudjZUV0MrZUV4eC9LMk9ja0NF?=
 =?utf-8?B?dGZzVHhOT3ZrdUxUWmxlWkRhWGozV0R3bm9SQmhYMElZWTB0dmtpSEprcTEy?=
 =?utf-8?B?Y09TVGFVSVNHcHlyVSt0L3B1MmZIaUR0QWY4dHJzMVhoUkkwMTFpV1RxZTNE?=
 =?utf-8?B?OFlOTzRDc0ptcXZEenRWYjB0Q3QzbU1qbUp3c3d4THEyWmUvaStaM2RjTFNs?=
 =?utf-8?B?QisxY3J0bFFqd25UMlNrZTROTVpyYnZ0Y1liUy84SG1VR3VpdDVkcGpDemJQ?=
 =?utf-8?B?ZmVnVXpic3FlVUtPdisyb3RaOGJ3KzRsT3I1dXRReHhIRzh2L3k5eVVEeDQw?=
 =?utf-8?B?SUlGb01ibTZ1MU9ZZjJCeXFta0RtRHcyeW9qMXE1enhmWmt0WmxIVXVsVWta?=
 =?utf-8?B?MjRzOTE4U096YUNpbm05MzduQk1OWWZodmhDMlJ2V2VrWUUzdGRHRUtLeXVr?=
 =?utf-8?Q?Mo5bH8?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:22:33.1876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a23c062-e5b0-4320-d876-08dd984904af
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6494
X-Authority-Analysis: v=2.4 cv=de6A3WXe c=1 sm=1 tr=0 ts=682d9b5f cx=c_pps a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=ucUoLKqCerDSODSh53UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: d1IXNNacDEi6HUL697rqnL57j9zV_ZJC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA5MSBTYWx0ZWRfXzZCTDJ5nsubS QTyLVIrD5hXBKfBzeA/hNkvcpfRP8tHRM9oec1NmXRrUN3Q4hFmQSHfEHuuCRjJhLxe6ghitmEN N1uZ7Eao2y8vFRq/rIRWyCdHGMPicne+/+KImekQWU2hGgI8/P2XKjkf0rvChFEHCnNiQMuPsE1
 zEppk8dwDYypsyuH1lrEmVP3t6kGu4spJnS+VYORv0RaoJCJPqanlDQ9hdBByrZEv3U+J9wQ9KB oCeA8hXrpc9xsFapk7csW1LXt5EP6lowsRKEy7K7rbHYdf3jBk29Z4sfx8i/JQTQzXeMVSuRHBw G0Gg2dlY/ozB6h2q9VAvf1rMnAQo7vpui9CFwaYVwYjnlpzti/fISL468lW5U6r+ZhuIOAWwGXE
 96IwpinKvZoUmZDHFFuK/zh0AWZxHi80uY6TNyNmEnsMtCIpCgBnMQ11YNMQoCMaVj9yTtp4
X-Proofpoint-GUID: d1IXNNacDEi6HUL697rqnL57j9zV_ZJC
X-Proofpoint-Spam-Reason: safe

On 20/05/2025 5:20 pm, Arnd Bergmann wrote:
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
> Fixes: bdd9ea9187c4 ("ALSA: hda/hda_cs_dsp_ctl: Delete hda_cs_dsp_ctl module")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: fix subject and Fixes line to point to the correct change
> ---
Yes, this is definitely my fault. I should have noticed that the module
I removed created an indirect dependency on FW_CS_DSP that needed
copying to the parent codec driver Kconfig. The L56 Kconfig already
selected FW_CS_DSP but L41 didn't.

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
