Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E887527E06D;
	Fri, 20 Jun 2025 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435345; cv=fail; b=L3PYICVH+N5pEdtVRw/mmWbvR82NoI3XSXjT574ipmxjGyD9b3r7ihODZX4HQf6vcJTFPU+lri/KRgEnKsP3XKScZbhwCHiKNBSTPb03gFRUn8ocP+aye9HbHCJjujw2lpywXQr4Vsidu6lK5M8pNDogUfwM2/rd2JRkVNE9l1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435345; c=relaxed/simple;
	bh=ZVXZ/BiO0Z13kiyYSFhCmQmbWjpjeD0t2W7y5uER7hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWxbJPCsH2kdkYDdTJdvMZKXjGRQshDrXFvzRfCBIuZLcNBhOMDzPMJUw3DJge7mzPGgD5lLizJxtkR03SzWLHxM0eEEcXFylpvm2iZfGPjZPztqIwwiwwSUM9Y6h1COZkMAXtXB4vnXe6Dp6DaWP9R6hQCPcx2Jno73mUe6WUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lkRJ2hbD; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=O6YzjzZj; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lkRJ2hbD";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="O6YzjzZj"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K5ioWg008732;
	Fri, 20 Jun 2025 11:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Ybncetze6ooH3NxPaO
	5W1y2wICc4/t1f7kEjXGNZIQc=; b=lkRJ2hbDkXzj5Mb7f4tygRzDPxfQR10mfV
	2HDMyupBkRfRfeP74k5iHKCju2/cVnq6Pw5thjSgOgxGkNLdQdCiWpwjE7JeR30H
	BunzAAbJ5ILHUGUPPWffNA1P3RUYYhhc5o9ZJV7L4zgw5PEjrwz1mZqlrSAQngvK
	IltQN5hHeSl/Nj9uw5nn7q6SKUI0uxwn06K1X33wIDUIlv+Poe52PcvFTHVptpwK
	C8aKNpqSBYaoVbzZa+rUosWM2128NsIigIDB/xLvwauNjq7nrevxfiUb69plZhOJ
	iYbMvd0438g26arbocmI7PidfCrBxiAG4smk0J3VRU7mobJoAf2g==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2137.outbound.protection.outlook.com [40.107.220.137])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47bsfnvfsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 11:02:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxKQ18rMkJsmvXCdWx3YrH60hr7U8jRu+I22sExi6vxDn+X3aH6Y0yrd993AeqrpqvrPYzmi6g3ESJqI1zcfMaJwqQV0yIuFhCKZICs3BM5Fli3/WO2e+u4ZYzl72WiVOdYEA4op2nDQGEJDuYeYiTXY8D6u1E8fdatGUGrrrH//GU/ZSQYOoUjRM23V32TRIiqGFkS7UmTPwh7U9LGphxl1mrU6fpDpT6o0LzMGHs3VBGMwnm+M7vnNbnFxroR0QOe5G/Ltp4k3lbkWz8gINPhlZtIiKh97zrsYvVQScZecyn/WneuA/V8w2OFR1u5Vm1WjEqFcKIO4bk+z7JF3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ybncetze6ooH3NxPaO5W1y2wICc4/t1f7kEjXGNZIQc=;
 b=JqrR/3ktzCtNSU1NGJsv97VkfYiH3kSMEuMmqDFhVHMSwBDd3r7igbioCWCYGI/rE2ihAXQEdZ3eILnTi/oss6CMWzDKDr6HA1yT2obqmM88UbP3VJtyW+ltpz1LFY96X4lRRtV4KsgIEGjZsqnuCgc6QmawD+kE5dr8cDRGR+nags4npRo432FAWoIuL8E2aWGuUP0aiIJVFciEcXt/QuwlxEFZZpxltUfSnzW4HUG1/TwLfUKGPGABa7YOUKtaEokn8KhjJo1bxusGHuCE3WZF1H991Nck3TAwf8pzALSjI8bnP14+zr5J+1fiUe14vSXMndRTV5LHcQqIbfe7VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ybncetze6ooH3NxPaO5W1y2wICc4/t1f7kEjXGNZIQc=;
 b=O6YzjzZjunAodfEFkGVLDDsSLqb1qlPRZAbYXexqFOMfcum9rHlImJHQsNhBI4cU+RaNyvUsoWL8hscnK5sMVDGoFt675ufXLx6QV6/54iFl7WNF3ehoUTsZPtaXbfs1bJu7P8swkg+1n6hTkGLXeu19Q/S1yggN3SgOK3do3no=
Received: from BY3PR10CA0010.namprd10.prod.outlook.com (2603:10b6:a03:255::15)
 by SJ0PR19MB4638.namprd19.prod.outlook.com (2603:10b6:a03:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 16:01:59 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::dc) by BY3PR10CA0010.outlook.office365.com
 (2603:10b6:a03:255::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Fri,
 20 Jun 2025 16:01:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Fri, 20 Jun 2025 16:01:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9EA04406540;
	Fri, 20 Jun 2025 16:01:56 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7AE00820249;
	Fri, 20 Jun 2025 16:01:56 +0000 (UTC)
Date: Fri, 20 Jun 2025 17:01:55 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengjiu.wang@gmail.com
Subject: Re: [PATCH v3] ASoC: wm8524: enable constraints when sysclk is
 configured.
Message-ID: <aFWF84HMipnQTOxs@opensource.cirrus.com>
References: <20250620021403.624303-1-shengjiu.wang@nxp.com>
 <aFUbGFNAISmamfv8@opensource.cirrus.com>
 <aFUfEgY9hfhB3lKO@opensource.cirrus.com>
 <aFVXLMtEOuXFL8B-@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFVXLMtEOuXFL8B-@finisterre.sirena.org.uk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|SJ0PR19MB4638:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce662b6-fa33-4117-f1d1-08ddb013c942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UaN7GYD8c0KSkoTfGhMGG43Aqjqjd443zaN576+Pm1SOR4GMoY0foPzgaTHJ?=
 =?us-ascii?Q?syAhhPZYt/KnSLFoxaJe16vBADIPqcQsyk532kcGOfTvz0M744dXUbJITZUT?=
 =?us-ascii?Q?xRgHXv/SSP1kJaecM1zuswW8N0kYYzcRCUbVerRLFz5wsGho5yJoFg4HBMEB?=
 =?us-ascii?Q?uYRsSjRPiYMuNvtarOhob94g0nNgcPPpKaTTEstWCm3/3p4Gn0DmlX3WaKTC?=
 =?us-ascii?Q?HBx49N0AXAPnap8vj3Yod+x/SRDy9GncGGq+J8WPaBe/8U1M+Suss8x+01Mb?=
 =?us-ascii?Q?vQXMjE7cLIHkbUkAiIayZgp2rxLlA/yoC9e8zCIKmwiUeeBHUfvFWjm6ToZH?=
 =?us-ascii?Q?iZmYZSaD59tKwQkHHlV68zhF3vRFslAzTzyhWNRwt2/8+KJ3RuCrvbb19bEY?=
 =?us-ascii?Q?JIwURYwQh8CAN/RoKvDDj9bIUc2nGJWzMOIF8o46lShyHr/PizEuZR1Mld3K?=
 =?us-ascii?Q?ctEyOVqX5gimQW0+uyAQUrDpJKLxaj7/qLOizZ02h3v2ACdF4TkJRWPaTARI?=
 =?us-ascii?Q?YTxfMVR2IuthN+9p56rSgDjaz44COwgDdzOCVlO3Ni0NpDX4KDPsxM2SYMKv?=
 =?us-ascii?Q?AOvP+HgtIIhI0ZcvkJMc9I6kF63mWEEI4Q91CpB8mOhVZr8qE++051fdIIXz?=
 =?us-ascii?Q?A2uonB08iaSc6TAbbB0sVtcI3Ny+LxAI+0fgcZDXNaDY+lXP4s7DF7anQwqV?=
 =?us-ascii?Q?nfjVZwnm7/yp56sKJVZZt6n1KlDVPSzkRhjO4ZSoG9/rgcMfR2lVcvijhyX3?=
 =?us-ascii?Q?XTEkBUZKDQhrCrluU0eOmAi2TUPyuOq43nyuRSA7T9ElvsuDOQJ4T2rIXV0L?=
 =?us-ascii?Q?aNQ2XnC+Z3ib7dagR/PAdwRMeLLljfWZkEL+fjtPPWYBkEdMddiuu8nkN7iv?=
 =?us-ascii?Q?Yki2xaId4hzhhYLh/9g038Edi+/EAhMbFVhDBkubX/doWZO/WcK6vRqtGuKk?=
 =?us-ascii?Q?p0H2U92VBGWRHIjJg5boO6URGVvED7Nj2mCrHNvKMNwN6Nfb+LvM6TPFgIne?=
 =?us-ascii?Q?1D3wLGriTfXdhGREphUFbdwgJ0wkDbaqUUxHqNGcyw05edUZgqfQVXYWz4Km?=
 =?us-ascii?Q?gjS6hY5A/VERK4+LWbOOlP3Bswivhr1TuDHJ0+xKPz4ZlRzt7AHTQpasMJpP?=
 =?us-ascii?Q?JZ/H3fMJsBIXvezbPbdDM1Qf1fJz+xnvoLOtldosMu7RPrBeqMe33v+o7D08?=
 =?us-ascii?Q?xiJ+V2z+Wsasr+FM+cSL9MSo/Gyg0dCKiySVQkrTl5pqaWskc1oGWy/J0sGB?=
 =?us-ascii?Q?kRq5/sh46RuGpP3njvgJQO11OxFIXNdYNCoC3Qj66w1HqRlGxs4X7F6CBmtU?=
 =?us-ascii?Q?MSl+rK+2n4ngjRU6ymr9KfNWnGeHToQycl6Cp5B7rNIwvdgvo8z2UDYxVTwS?=
 =?us-ascii?Q?dKkeFdFCKa7h2b8OcqQOBaISCvqZObWIAe5mtrgV4ipe+Zyqtd3SpEOH/qsY?=
 =?us-ascii?Q?yQu8FxJQy9fNsi1GstDcUV1+KYqsTf8aGr38JctLlLB2CkcRnMFkjN94Npa7?=
 =?us-ascii?Q?jEWPYzvIRXbdkoP8alqY/UR0uQhKw4Th+XGA?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 16:01:58.0545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce662b6-fa33-4117-f1d1-08ddb013c942
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB4638
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMyBTYWx0ZWRfX0G8Sni3becjb fjakd7TRyYJKONzzkI7FTRY4J/jbhX21k1K0hQzIqNM8wsMw9TcbPL/MwIAl1/fllffOUGRhHeg J5o0IX3NKy8xIzJfMjLO+KKVlc2mJw0wdRFUQ22XnJEtj8ykjYA7wh16guGQsXlpqovmQHsbkdA
 wjkod252GjCEF9/Q8NfwSl9a8HuSKrcmtyKyClCxzCiMxErxcI7aE3Ih+vCe3BCKbAkvlCHwTZH Dbj/k4aafexIV/uGzcpjmCmTsjlXhmiqJKAypDig+4qAZCLyV1azOKb/iHF5hM55b1tYk479KXX 6ZTIBZotpug5RP/tBXGakSnxVPAFB/EZuVvWgtcDFJM+tOO29/tjzaT2h9m+3ndzwv7mq6ZQQQx
 UmU6dP0KWaa7lZYd+pEWb2s0DhfXoyKLniOk6fnYU/o0NkaeOYgBuzJ9OWhAxvR71rYQIvSg
X-Authority-Analysis: v=2.4 cv=Z4HsHGRA c=1 sm=1 tr=0 ts=685585fa cx=c_pps a=uhh9Xr6CjD6FiqEknFfS7A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=b3tIn090y3fWIpd2EkwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: zmUiNpPU07N2Uccj1J8RIz7Ao-_WrOp1
X-Proofpoint-ORIG-GUID: zmUiNpPU07N2Uccj1J8RIz7Ao-_WrOp1
X-Proofpoint-Spam-Reason: safe

On Fri, Jun 20, 2025 at 01:42:20PM +0100, Mark Brown wrote:
> On Fri, Jun 20, 2025 at 09:42:58AM +0100, Charles Keepax wrote:
> > On Fri, Jun 20, 2025 at 09:26:00AM +0100, Charles Keepax wrote:
> 
> > > This is kinda the opposite of what I was hoping we could do. The
> > > idea was to make sure we returned an error if we can't support
> > > the given rate. So if we don't have the constraint, we check the
> > > value in hw_params. This looks like it checks in hw_params only
> > > in the case the constraint existed, but in that case there is no
> > > need to check because we had the constraint.
> 
> > Although perhaps I am mistaken here, I guess is the clock has
> > been set by the machine driver then we would pass this check.
> > Would it perhaps make more sense to return an error rather than
> > zero here?
> 
> The link hw_params() should be run before the CODEC ones so we would be
> able to insist on the clocks having been configured first.  
> 
> Or I wonder if it might be easier to just implement clock API support in
> the driver and if we get a MCLK we set it to a sensible value here?
> That wouldn't work if the MCLK is coming from the other DAI though.
> Also I'm really not sure how this bikeshed fits into the design concept
> here.

I think clock framework stuff is probably more work than makes
sense here.

If you are happy with this as is I don't object to it getting
merged, ultimately if the machine driver doesn't configure the
clock that is a bug in the machine driver and it will likely be
relatively obvious audibily so the returning an error is really
just a nice to have.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
