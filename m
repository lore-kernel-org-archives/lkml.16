Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562BD1F542A;
	Wed, 18 Jun 2025 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750236166; cv=fail; b=oF37guL6K6SCfwZLiBMFnFxRQQ1MxqaTeSgozFM8V0etsy+U9jfH2dmzy+Fk7oT95DtmD72RBpLMnmw8PqguCr7ZPsF2CzXNWXEZY6BDoj+AlJlvMGBv47r+hYYPSH1BcYQ0WlaCaEpByUo5SVdPKthRjhmf0mjtjWijit3HeMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750236166; c=relaxed/simple;
	bh=gozL2vWWJfO/485Oyck3US4fSLR8csgwVh4wXjDUNXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBgzqBsATY3F6E3SCjaDBtc59TRLen3vCGcpPVosrGx+X2FGfbSg2I39COPYqK6EznpUIDHMvQxfc2Ws4/xmJ+hWhaCWjY0y5ZpmQq+1voEmtmPyqx9smfelLYbuR0R4KkkRQxHvW5eeWHwUVBI+RaXqIZV1ARYbjVCtnbSASwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=W0VI7F6z; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Ov3rjagw; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="W0VI7F6z";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Ov3rjagw"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I7s8a5015203;
	Wed, 18 Jun 2025 03:42:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=9Wm6JJ8tsH+9GBHPraR42wFNI8QEEQO7aoubWqcaFhQ=; b=
	W0VI7F6zqZJyMnqc785fc+I3o2g3qp57eAuSr8ebpNYRuZMBryI5OssGtkPVIL1W
	yqY8Zf6gIjfLghF9AAQuc0VR538yZd/YWeKxWYOpo+WQz3uCZOeAbyqjsukthr2G
	MH/CvWQJJLxOhNKNwbZJuyVeWT06qt4GBJfJWoOqQip6Yv+kdmX6tl4zmbW0DXzW
	p0hQu77JAiCD41h+tcJY1i4ZDzP/YG4Zlu0ayiKz8gGNvMVazcuZrdgKdjPBUIMK
	jZC3XBMfsB4zKwGaxq6U4BxrCx2/dTjFrN9xBNwQUpQtmY3xHqXVcxeoKHnGGqM/
	66KxR8Z0rube6jWZPLdiiQ==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2129.outbound.protection.outlook.com [40.107.96.129])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47bsfnr1uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 03:42:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkNijgKkm1S+C0+D/9cmMvq3ARaPCekyi8GFly6FONjNE6P0sjCE5H/qt0WIEfXUjaq7Vg309Tlr8wmjEYNhmxjUc6b1UW9gZvBN7+32hxk+tRY/FL6Lubd1816c4jtG+IMwSnuX0wQokgAK1r0iBve89kIM5H2Z8flYrJtaBzapV/80uYkvoa/enRJ4mSKyiTjG00gy1IscygSLfzeLpByIr56QSgBaI5OwYeYsq0a2fDz2eBi7QOWW6oMLQ/p//HTGW7PNvWWF/pp2vmaI3RPV1oeY49hQNU/CBcTeJrFr5xAPE7x6EtWA9vrTkK4c65dzo9WbUKvhsl5sJHQuzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Wm6JJ8tsH+9GBHPraR42wFNI8QEEQO7aoubWqcaFhQ=;
 b=iZYz5PnfSbZIKGmR+rAvk89eyTx74JTQHHR0830l38wEKgHb0mFEm5wvFj/yOILdAiZKBLuTlHO0OWZko3Ph+uiJcnK961HPMSBASo77TvLKmPcPhzf0FX7eIIhVM0JMPUs/gLRBzFT3zc3lBnzw9mE+8RkAbXiDY5YEM5igWDfel6P4NfOpJJsusKK1/p4eqgFWpp1tAjZCJgxtNnNuMw8jTuZeFqTxxoZXWe6TPYgby2CJhjVD4WTUUNJcLId/FhFCxGNJPCEnRLEcioEVo3FeKSraYuz83yiOmbcMaJdS8JxBw+8BzTyHMsRjeIT8vl+RrmmUMCFnhCpOZ5PO+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Wm6JJ8tsH+9GBHPraR42wFNI8QEEQO7aoubWqcaFhQ=;
 b=Ov3rjagwmvdF8FFeF1EBz39DX+Q8Tgv8ZOU0rKQlgWb3dbpX+XngKKti0p5luBSkgs98iQhHRakVxExPFPPT/kDlAj0BhQ74zbVKJ5t22LVMs5vs5DlRHStYMOu1pZMzjWdV+uKoHLR7pquR2bBXJQUSKVrW7431UIoGT5GYIQc=
Received: from PH8PR21CA0018.namprd21.prod.outlook.com (2603:10b6:510:2ce::8)
 by IA1PR19MB6451.namprd19.prod.outlook.com (2603:10b6:208:389::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Wed, 18 Jun
 2025 08:42:19 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:2ce:cafe::ed) by PH8PR21CA0018.outlook.office365.com
 (2603:10b6:510:2ce::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.6 via Frontend Transport; Wed,
 18 Jun 2025 08:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Wed, 18 Jun 2025 08:42:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7EA7240654F;
	Wed, 18 Jun 2025 08:42:17 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5E26382024A;
	Wed, 18 Jun 2025 08:42:17 +0000 (UTC)
Date: Wed, 18 Jun 2025 09:42:16 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
        broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: wm8524: enable constraints when sysclk is
 configured.
Message-ID: <aFJ76BA1aTtBMn31@opensource.cirrus.com>
References: <20250617071833.3181378-1-shengjiu.wang@nxp.com>
 <aFEtiKQ5RvvZEt5x@opensource.cirrus.com>
 <CAA+D8AMQ5pAw6uVGQEYK+oPHJAojqnPbB+hsMWbmQOwmE9AFvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AMQ5pAw6uVGQEYK+oPHJAojqnPbB+hsMWbmQOwmE9AFvw@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|IA1PR19MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ca472f-6d25-41cc-15e0-08ddae44090b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXFGMTQ1VXhDU2w5cDZ2UVhkOUhaRHd5ZVNWZDdVaFdBYXNGdkJpZzhBakRr?=
 =?utf-8?B?aDAxUktkNFpPL2IvaEI1aDZabUx5cDZZcDNEc3ZRN0U1K1VYc2VuMG84MXFx?=
 =?utf-8?B?SXR2NElyK3RORk5mYVByRUovY2dVQk1ZakpPUlhwMjZiSzM4OXR4UzFULy9J?=
 =?utf-8?B?L2haeWRvNEJ2L3NJbzJpNWIybDRpU1h2TGRBbXE1UTVIRDhON204Y2FZSHdO?=
 =?utf-8?B?RHJDcHdKay9iRU9pUlVwdUM3WTBXbys4UmUrOGdFREIyTFpIQmxTWkRUTitD?=
 =?utf-8?B?QUxsYW8wb0o1RCt5MCsrU29LNXFJTUxaeWpnL0Z3cGVLeXBjODF5UUxXbEJy?=
 =?utf-8?B?Q1lJbDRZUHdiK24yK1Nqb05tR2xXSUJhVmdyTEFNd1JtQkgyQitya3F0QXBS?=
 =?utf-8?B?b3poS1M4alBxTFBtdnFQLzVROW5pV3ZNU3lXYlF3YUI2VjBpeEtNSGQ2RDBS?=
 =?utf-8?B?RXRIblFyYzl5K2VJclByZ0oyOUF5eEN2MDZrQjJyZEZDcEtWMGxHOGZjUWZT?=
 =?utf-8?B?UG9hVjA2Mzkyc1JoTFBZaEZZNndZZ3NPcTFLKzNleE5SRVYwR3pja2dTekNK?=
 =?utf-8?B?czNyMllTb1pPdzFKVEJST28xdzhxTDFJbFBPSm42c255SGhVNUpvVFlFTHhv?=
 =?utf-8?B?VVYyTS8zY1lGQytBZklyK0ZxRVVlWEc3Qm9NUGlkMTdiblVpWFlyNjU5UGh1?=
 =?utf-8?B?NXNvbkVMbFJXdHBLZWhPSjUzUEw0cVNxd2pBNFQ1enBWSW1jN1MrbEdlZjhq?=
 =?utf-8?B?cjc3TklNVkpFZEFGTnE5Q01KUnBLY3FIa1d0Q09FVlJRWWFldzgraGdLWjhZ?=
 =?utf-8?B?UkdMeUt3SDFDcm1tNDVmYVBHWk9WZVk0NlJ3ODJlRTVlQjBBbnV4SVZydjhV?=
 =?utf-8?B?YSttdk9ybDBQWHlqT3dzTlVtRTB4cUU1WkhCeUc5M0NyK25DbGgwakh6STU3?=
 =?utf-8?B?bUVoVWhtakYwd0RyOHZzWnd6S0xBM09uL3J5dytyUEI0MEE2SWhCUitsOWRy?=
 =?utf-8?B?a0kxd0E2YnVmQXlDeklpSWhlNndOcWNpZG4vMzNCVWJtOE9SeW1DQk5rL1Nn?=
 =?utf-8?B?My9SaUw4eVdjTE13OTJhblIyOEVmanRLWEtaTDRYMmZVdUtkM0VadUUyL0VY?=
 =?utf-8?B?VTcrN0dTRSsyQmhpckNubWxqSEhCQmhIczFBRVZXOXJhOUZueEpPVndsM2tp?=
 =?utf-8?B?VFh2dEJldUozQ0hGaHdYSHFiYWlCNC9VY0hSVTVlNEZHYnAwaU1mczBWTUww?=
 =?utf-8?B?dHpWYU93S3NCZ3dHTHlzNFNOMjlWbS90YlplZkZRWWEvTlYxb1FCS2FWRC8w?=
 =?utf-8?B?K0NaT3ZVdHRmdFcydlliYWJtL3pKWStLNzNiNUcrcWFxZXQ1YlJ1b1c4cFlO?=
 =?utf-8?B?ZGFROTN4Wkp1MXJDVlFkTFpJQ2VUelJLN3VLNWVRVEZETldmUHZobmlVRzhX?=
 =?utf-8?B?dkVTYWpJTHhuUklOMjhZZ0VuVjhrSHZDeVpKOEhXeWdRbmc4R09ibHZRUWdG?=
 =?utf-8?B?RXM1d0s2SEoycE5veVBiWkU1aE5WV3gwaUUwVCtUaGlsZlVlZkNkd010ZkdM?=
 =?utf-8?B?QThpQkYwQVhOQmJCNzkreTliMTBMakM3SUwrcGNXdWd0d3R2eXJPL1ZnM0VG?=
 =?utf-8?B?WTh3QndXR2RSTnRrd1pzdUhuL3FqQmhJNkswRHVUN0tMYkZnZHd3eHdxKzFn?=
 =?utf-8?B?N0tBV3o3YzFLdGZCVllwUHJHYTArQWovbXk1anNBSjJrYXRNMnRkV1pMTHJW?=
 =?utf-8?B?ZEVpN0pHR2NhRjZUTWRIUkJvMldPUkN1SndqTFlLRkFueE5LWG1jTVNHdks2?=
 =?utf-8?B?b01GdjUyd2Y1SGNZdHZSbWtCcisyc2tLekdoVjNCdzZiSHNnVjNQdVZsQlZk?=
 =?utf-8?B?eGVjNWs1eTZyQVRjV1RvWDRQMXR0WnM4TVJLNERUUG1xejdlUWtsNnVJVEdT?=
 =?utf-8?B?cmRlbEc5NTZtQ1p4b3VSWExMTElhOXE4Ly9HM2sweWJyTVJOT2V2eDdnbTNE?=
 =?utf-8?B?dTJ2MnNZU25YZldoSGxmdFNWOVBBQnFmRGwrakFLaXRKRTZoMTNlY2pJUll3?=
 =?utf-8?Q?xqHYrH?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 08:42:18.6369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ca472f-6d25-41cc-15e0-08ddae44090b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6451
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA3NCBTYWx0ZWRfX83MX2byoDg2v lsFCE4DAyOC7AbVK0jykpaxYoZrqzbBhEGf7gcRuNc5oXbuP4t1xPNEmRvxlDD9uwMSfO2BKfn7 LTwK/8wPoskt1UUdIPtbcFiX1g6KbrftAoPfJAexOMWov42xfV+ZVvi64pCoTCR3TGnQt+Tkjqm
 w6e/sut1TAEHXGSx4rDe8CCoxoO/mO1QCpsf2cnPaZtf48950NKFQ6kNkg/a6WzHuuUWvPkb8TI Uq5rrW0879VCSNCGZUqTOLBr93kJRFTzJotgFx8B6ALlS9FH4gbbAaQfuiv5nDIcQzwzdlCqEvH RAPcW44AURL5z21P2OP6ClFln3GqhVHbI7SfuY48CpshHGkMdHaSxQg1GGMgMwbjyYNic/jIo9N
 JHGTGMpL8Qt3pOiD5HhyXlJ01ECaiJ1z9NTUa8CrCHvb2fgoABZZfNUlR+HB4+m2WQe9OuD5
X-Authority-Analysis: v=2.4 cv=Z4HsHGRA c=1 sm=1 tr=0 ts=68527bf2 cx=c_pps a=4LupzwpWHS4wut/JMTUkwQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=8AirrxEcAAAA:8 a=iOHk548RUHfhm05fRlcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: mJTQ31kWsFwWzyk06h4lpCZe8kwFfN8K
X-Proofpoint-ORIG-GUID: mJTQ31kWsFwWzyk06h4lpCZe8kwFfN8K
X-Proofpoint-Spam-Reason: safe

On Wed, Jun 18, 2025 at 03:45:48PM +0800, Shengjiu Wang wrote:
> On Tue, Jun 17, 2025 at 4:55 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> > On Tue, Jun 17, 2025 at 03:18:33PM +0800, Shengjiu Wang wrote:
> > > In some cases, the sysclk won't be configured on init, and sysclk can be
> > > changed in hw_params() according to different sample rate, for example,
> > > for 44kHz sample rate, the sysclk is 11.2896MHz, for 48kHz sample rate,
> > > the sysclk is 12.288MHz.
> > >
> > > In order to support the above case, only enable constraints when sysclk
> > > is configured.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > > @@ -98,6 +93,8 @@ static int wm8524_set_dai_sysclk(struct snd_soc_dai *codec_dai,
> > >       int i, j = 0;
> > >
> > >       wm8524->sysclk = freq;
> > > +     if (!wm8524->sysclk)
> > > +             return 0;
> > >
> > >       wm8524->rate_constraint.count = 0;
> > >       for (i = 0; i < ARRAY_SIZE(lrclk_ratios); i++) {
> >
> > We probably should clear rate_constraint.count in the clearing
> > sysclk case, and we should probably also check if the DAI is
> > active. The user shoudln't be allowed to change clock there is
> > audio already happening.
> 
> Seems we can't check if the DAI is active or not in sysclk(),
> because startup()->set_sysclk(),  in sysclk() the dai is always
> active.  if we allow the clock changed in hw_params time, then
> we can't check if the DAI is active.

Yeah seems you are correct there, feel free to ignore this
comment. Looking in more detail as there is only a single, single
direction DAI, I think there is less concern here as well as we
can't really open the hardware for two rates at once anyway.

Thanks,
Charles

