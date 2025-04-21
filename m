Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429935961;
	Mon, 21 Apr 2025 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745244965; cv=fail; b=H/WecvB7Se9TaNLRVQliST2NagpQaSbgTrWhWs+tivT1NTeAFt7GXUruTFWlt+EEJBu8ZNSRjX0CSP9IjQ4wQyDECrwh7MhoSH1KsCA2tm3zRgiAcJu9Cmfse50HaHySPyyhiL0O7e2Lm1uoOBCPMRGP9XCjYLNgtY42K0ogqmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745244965; c=relaxed/simple;
	bh=b9MPxGnQvoZ5MOWJIf2LtxW/Q3n90OdLioEuzRrAWag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ti9VHZThujTPWTUf5tftzV4+5RYv4T5B7AI9ew96bxxIiDHrWhhUemOFAzfOtc44bF5N3jnBDQ4rbmf1TgWr+AGAU9caZVbJk2KNmD9kxAJF62icNzyEoPpiNB3LEz4fB0v9IN48bEfu8kDlsHOPRIrgMy7x66Psf1WJc4VeEMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FWp3E3xj; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=R2iuq6ES reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FWp3E3xj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="R2iuq6ES"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L4eC0J009899;
	Mon, 21 Apr 2025 09:15:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=C4kHXdP1zp3wZCr/PDIsuai5IG8mIHgBI59QM3zKx+g=; b=
	FWp3E3xjXRyrZZFQXllMvzLnDkPs6yzxjsPmLSmM9UtiCwiz9dE5kXG8BQFG6h1T
	Kv3GmZmozikBYTh/DlCxopUmL+O52POES3gHqqyDC4xLCYWtjoXYKhiSG43uXVVp
	LBEzovduCllPXSguQ72agjZcExtIvz3D5h635Om8IkpmG1VJ7LW6AX3gYxtjuaGj
	bKss+Hn+LUnqAAygXvY+7ovwCzId+greUz89TQTuc8NU92eLT6grGSlVES/08+5L
	wWOzflB0bpeYxvor8g485xa/ld7H6lfWKgl1nHpp5J1s3rjM1k/rGVQA8MV6mcac
	8q7pAjjQi/iINyhzQOOZ7Q==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46488hj8vq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 09:15:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AH6mwJteQsXBqdxq26ARdcicfBeQ+PzlzMslipuk1gM24hHEJym2AKnwd1fbeNO+9KAh1BebuwsOnwp3TEvuubSE5xY6NHGZhCPfQpg28Byn1VKkiaM0eJdl3MH6akoIs619kcFb73bhaP+hwZLIsUpO5dT/d/dm2IKKINprZRtFnwpMiRACNkgJdV/9Ao84ZvjO+pZyvmA7COfGrJiXI0XmlvLRQYBQa5ujp3OlArMzvDtsp8navyjdVAkQ4HzTYD7ejh78Pu/Vm7T3/JMZ5706mdxHWVNhE8IG41Pmw5mfDydwmroS+fLeZ9zMsXbihgoaPVUljacs4e7gYLNT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EH8J10thZki/OO/kxzrnVpiI2Hhgn5+UMoD0muo8dpY=;
 b=UDyxYDpAPyDpzyoD6t9zrA2hKmkD20MF91Vhh5YAZ0u9zx5Cm5aAicrYxUNByNl31FgpNh/mJYwVmyELcnzxZf8NzWiWnBoIRTzmfRWpO/lwplfQ7/MlQZ/Z4JqArSaxdSlbFNq433rgoRTq0t3JN6i0SrRxOwvU8Q2gWoRAhXMQcnD+M1X0gPvE7aNg4MQ8lnwW6YmUF7WibZt9Ctab8z9sZAH6b55gU4aA7k9pgTd2WskUTXkGxTZZnReow6+cEEP8DzhuET1pE3t8WNqgZprOf9VXwkQyuXmCeDfu00QPoB1N1/Q6m4FgE51eUEWeHTw0uXrkd4F+uBsTvUMRhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=apitzsch.eu
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EH8J10thZki/OO/kxzrnVpiI2Hhgn5+UMoD0muo8dpY=;
 b=R2iuq6ES1mh7DBB6Kn1jtyC8tgJFH2j6YEdQmDTbnyuHYjuiL51ZLxmx18tMMHUx1j84AZru53S2RO3M4cOFLz8ZyJEXzHjxSTF4Xr8sbUfe/SQ325LQ6tjScnoK6atsjfJA4UfaZn62P4t6XhS4BkEI2l+uKG3TLlhVCypNOow=
Received: from DS7PR05CA0054.namprd05.prod.outlook.com (2603:10b6:8:2f::28) by
 PH0PR19MB5460.namprd19.prod.outlook.com (2603:10b6:510:ff::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.35; Mon, 21 Apr 2025 14:15:17 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::5) by DS7PR05CA0054.outlook.office365.com
 (2603:10b6:8:2f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Mon,
 21 Apr 2025 14:15:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Mon, 21 Apr 2025 14:15:16 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 02094406541;
	Mon, 21 Apr 2025 14:15:15 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D617B820259;
	Mon, 21 Apr 2025 14:15:14 +0000 (UTC)
Date: Mon, 21 Apr 2025 15:15:13 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: git@apitzsch.eu
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: wm8998: Add Kconfig prompt
Message-ID: <aAZS8XVHtw5zxD2d@opensource.cirrus.com>
References: <20250418-wm8998-v1-1-21c4bead9cd8@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250418-wm8998-v1-1-21c4bead9cd8@apitzsch.eu>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|PH0PR19MB5460:EE_
X-MS-Office365-Filtering-Correlation-Id: 83aaf2aa-1d69-4160-6605-08dd80def0c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?6cf7KkqrrlglQoPMe7/M8Ks8ecJplv2aCuPzkuNnDxAy+Se4+28YJ+ZhyJ?=
 =?iso-8859-1?Q?YOflSRK/y1fNnv6s7H7R3gO5IhXUnPZT47/JT4BZWAlAbsaGIdGoywxdkA?=
 =?iso-8859-1?Q?JKyqzxjM+prnYEbKmxJHqCdLlrJvXfCaNiHjjMnHBMcPwN5C3xbfClf0cW?=
 =?iso-8859-1?Q?8vUNtSkNDF2p2QvtBTYTunDIZx0CzaQXf958H3/YJvJJ2B/G1voitvBQaY?=
 =?iso-8859-1?Q?bw2uSquAw+eJaNl6nPQBbq8oIzvrfxIbN+/Strzr/27wSrArApJrS82oim?=
 =?iso-8859-1?Q?QzDaQAe3ZtNHpP/OzS8xTSdebztOo4XgZdw01uprAmqqlhewTI290ytWv/?=
 =?iso-8859-1?Q?xpEVfQa8PE+FBMK2R5WldqiIXtxLNbyJyboCiHIi90Km3sem/SU14rOwmR?=
 =?iso-8859-1?Q?YBcb0ZQxkThR8TIewMhQpwdTbMx+rIb6D7CP852DZupzXV71dSJU/99MBo?=
 =?iso-8859-1?Q?0wdKFS9vzUwx3ZjdoBwaZ3JGxKYgQE5eQsG7vXP37tsE9LaePFQ5zQKci4?=
 =?iso-8859-1?Q?40BPo6vuHAAZfr1PVUauanP2kzwrdmCn7Td88kAWvLWyUa2vxZc7t2FUs/?=
 =?iso-8859-1?Q?bhATOANRCv5uUOg8gi1TYK3Tailrz5nlmOT+yX5GBpY2V9UoKog29w3DZ6?=
 =?iso-8859-1?Q?3lAFExIE133ilf4tKCzmpUO57YFE1jvyYspCWePjfntuceDSSB70ItNWH4?=
 =?iso-8859-1?Q?rv7uY3fP+QxxVx7ND07MRL4W327t2JODD0VJ62e3itosszRm28Qr04WzRN?=
 =?iso-8859-1?Q?KdzYQRvzE6FN6azyvhhmdWOmNx6OxEibSfWennPoacIXaqF3wngSN+8DkT?=
 =?iso-8859-1?Q?t6uNJfH/R8x3+P102ot7d2YhJA0/Qfx4KD63eccNpegMrPgsgBc9FdNers?=
 =?iso-8859-1?Q?pXK10MUmNlCMMccbWX+Fp0J6xMlAvBxGTEZmE3m/AIMxYtxCXgIwoSY+mM?=
 =?iso-8859-1?Q?i/nekWwHUJhznY5miARCafKLsTrSA+6UEbaGjs7WsZavU4XQ/QJ4UbYlnJ?=
 =?iso-8859-1?Q?qOnHEeEzKgCHDoSncbOYFaOzKbOrSApUPif6ZmEX6IXzmqeSaScB5ggBGk?=
 =?iso-8859-1?Q?gmZIBPt+7SKGyT6g9MqtTbuOe0RrLFByrHR19w77DdBFq33FTCcAyf2+2C?=
 =?iso-8859-1?Q?M7H2Y9Jmg8W8b+9Pk9K0kfrJiMFj4fuTJmGqpfINoyzLQ/npIf6w1vjkFJ?=
 =?iso-8859-1?Q?WeHGQawwTzMmNmI7YT/2Eyod9PH5sxEUa1c3Brh3WPF0OjzblT+BiCJjkT?=
 =?iso-8859-1?Q?37+WmuAtaqCK7G8N+FI/DvbHQqXuq8TO1DCef2KTtCL2n3iCyXQ+MGyFuW?=
 =?iso-8859-1?Q?3laBAKNi7dFZpcZJhjX4up814rRmv+ZL2YD7mJTRZ3dlqW+gGm5wHQMFWi?=
 =?iso-8859-1?Q?rsbk0uhU7RdctXZPXTSs1SB5hXjRQv1ABbXAUa3ZGb5km9B4Heo5OKjPxr?=
 =?iso-8859-1?Q?5oyh4bhFDwW6497bf51P3pbpB9RKx6Lpslo+pw2ix4EBu1jwqi4S/MDrmN?=
 =?iso-8859-1?Q?kEsJYEXu7AVCHS7f3SWS3AncMgwqIAT+t34BnRqEcODoS3q6a9TASN7WyK?=
 =?iso-8859-1?Q?jq+6g7jB26so+ztoYrVsxR0nU7g7?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 14:15:16.4457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83aaf2aa-1d69-4160-6605-08dd80def0c8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5460
X-Proofpoint-ORIG-GUID: xlDdYwgph66rWviOYOyChDA8dgjCF4WP
X-Proofpoint-GUID: xlDdYwgph66rWviOYOyChDA8dgjCF4WP
X-Authority-Analysis: v=2.4 cv=K4siHzWI c=1 sm=1 tr=0 ts=680652fc cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=8nJEP1OIZ-IA:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=HDjIzE35AAAA:8 a=w1d2syhTAAAA:8 a=jX43nT75KTkinh2zyPwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=y3C0EFpLlIT0voqNzzLR:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On Fri, Apr 18, 2025 at 10:22:04PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Add tristate prompt to allow codec selection.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---

Generally its good to say why one wants to make the symbol
selectable, usually its to use it with simple card, although at
least historically I think simple card struggled to handle the
required set_sysclk calls for these codecs.

But I have no objection to this being exported:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
>  sound/soc/codecs/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 40bb7a1d44bcfa4c386f2eba0f475efeeedf1bdb..9ecc4bb7f75ff9fce87970d2e46ace72444e55b4 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -2479,7 +2479,7 @@ config SND_SOC_WM8997
>  	depends on MFD_WM8997 && MFD_ARIZONA
>  
>  config SND_SOC_WM8998
> -	tristate
> +	tristate "Wolfson Microelectronics WM8998 codec driver"
>  	depends on MFD_WM8998 && MFD_ARIZONA
>  
>  config SND_SOC_WM9081
> 
> ---
> base-commit: 7e74f756f5f643148ca5537bf2fee6767e4b0ed9
> change-id: 20250418-wm8998-defae73b3320
> 
> Best regards,
> -- 
> André Apitzsch <git@apitzsch.eu>
> 
> 
> 
