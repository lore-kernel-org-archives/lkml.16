Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEF622DF99;
	Wed, 16 Apr 2025 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796516; cv=fail; b=abtLkUTvrCaei0XD/Y4tn8SRoz3P3smEeH2j5gjQ/L4oqzxbZtLLBq04XOxMeXkeqosXg+rOUcZVL5CiIGrngFOQew26WwTeY3GJyT/c7hLo//P9RZR0h//Vx3Zeo/96ix6oLCteZ+J/BlcUwwWhTa3brzb/d0YYZyr78gamIaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796516; c=relaxed/simple;
	bh=yGc1iMouanE+sFuFu4lJ0PmbLPs/ewqxcfZpeT1d5dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcPCfpxsm3XVkHK9krfGp3L05sy6Ap3zDk6GHfnIsoA8VUNTg9o+RLHI5F2hI048N8JWYiDSB+koSWTImNOSl/fNjmUmU4SQVWCXGFqlilOFXpMflVPFtjtQPxm3DpwAop8VAiCk7qfgTb55M8Vrw6U7wf444vH23ArbOFyVjrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aD4hhdyX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=pzhuUfnv; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aD4hhdyX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="pzhuUfnv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G1uGXc019409;
	Wed, 16 Apr 2025 04:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=tA4TRGBVwFrVexxXcR
	7ZDRwMe5zKWjPTFxLhIn7+tyA=; b=aD4hhdyXpKs5uCXesrz8AFJRwDBAc2dbk/
	OSvD5m/Z0Km4iRSBOTfcC8bmw1cytCZExEN5yIE7TGBTHorzCUwvWUOaIpCVJkdp
	WE5lCNxISuq5KGNEQj3jlMNF8Kh5wY1Z7Q2pne6vYY+UBr74+fce3D8PUprOUhSn
	Q641HKziVSWWmfgAi4sS2xw4Bk097VOKUplbl5tF24LIibCcjCw9i67fqRKf03Se
	T9v1/U5VCPFFM9r10XFYDzgbUOZ6a/Zbs6qb5C4pPVd1bqh78+fa6D2WvkPRg4S7
	OP5LZI4NVfa9nan3immx5jxi40gJwKtxsKjFPdZenT+EznaWbQGg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4615wt2emp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 04:41:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6EtDbBz8etPtljvmtLFu6XOmCpuVsnFtHmSJAFXwE1fjGkNu52KhIVhdDAXzden6uKyl/hht2QyJL75ydADODcj4FG7L9+Runt+ZrTMBbQa3Dl3nD/ugGs8rrj7PxNYl2kmJtTKY/JJRUUClf0MfIVjgpj7qBHC0opZd3g7J8DpetwnBQeesdw6icfenuLOHS6Z6ekOMGJTHvCgQkCsUd8pNZ/oHM//mNtzdYwwZ5aZorADplbT5dU1A9/MrjlEjVpFE/Jk7jQv2WZQvFT5itCIrchUpEyiiyoBDj+WAWlU/gu573HHVQVI0WNbre4dRvHD7+oXR3byqQSBuPQOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA4TRGBVwFrVexxXcR7ZDRwMe5zKWjPTFxLhIn7+tyA=;
 b=Bo7vsMnaNPvnGyGRlDwndRaDEdiDpfcR8xP/3PLutPwDGWcTOBVBkwP69DQsV6CkqsDgjKGtkLjffuvtgBIYUqX9uSv1hsI9VHzzHHsC7Rr8mOywNZiInYdOJTBhoxsfYFd8Z/FPe6Z/klER5UP/3Q6wUETGebUmQDuaF3D9jfg2d4yMPDOipMAug3gPLFfGLznhEH1n3eezD8vWFHBRUE2p0D/awKNLa6QaeteEOmfDelKS03ZHb+GszrgQFlKN2NU/SYxhilsocHCAI5Ha6O148+VQfZrywUavBH3KC69tNyTXb2CKagPNzNbAu9YjTNEovBJGJcc4PSnImiyvQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA4TRGBVwFrVexxXcR7ZDRwMe5zKWjPTFxLhIn7+tyA=;
 b=pzhuUfnv2JrtsfORZDuQk65PVa0GSAuVZXk2jUmCBO3slufLpjPBsmOjyz/mPmyWmV6TZady8xHvhHja1d5oBg4xXL4y315UVF6VcUMAqOns5vqliLvZhOplfq7RCwb9nW+tobXZlBVo/LgNfZb6cIFCaNm5LDdcMEJBeR1Zad4=
Received: from DM6PR06CA0098.namprd06.prod.outlook.com (2603:10b6:5:336::31)
 by DS7PR19MB8854.namprd19.prod.outlook.com (2603:10b6:8:252::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Wed, 16 Apr
 2025 09:41:35 +0000
Received: from DS3PEPF0000C37E.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::56) by DM6PR06CA0098.outlook.office365.com
 (2603:10b6:5:336::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Wed,
 16 Apr 2025 09:41:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF0000C37E.mail.protection.outlook.com (10.167.23.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via
 Frontend Transport; Wed, 16 Apr 2025 09:41:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 93314406541;
	Wed, 16 Apr 2025 09:41:32 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 74C53820244;
	Wed, 16 Apr 2025 09:41:32 +0000 (UTC)
Date: Wed, 16 Apr 2025 10:41:31 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: broonie@kernel.org, lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/3] ASoC: SDCA: Create DAPM widgets and routes from DisCo
Message-ID: <Z/97SwfaLp2VIzf4@opensource.cirrus.com>
References: <20250321163928.793301-1-ckeepax@opensource.cirrus.com>
 <20250321163928.793301-2-ckeepax@opensource.cirrus.com>
 <2b899796-b9fc-49ef-a4a7-858baa90a36b@linux.dev>
 <Z+KROae2x3nB6Ov8@opensource.cirrus.com>
 <a5aa25de-919f-462c-8aab-996fbc381de9@linux.dev>
 <Z+PTl4fg5tRoXmEE@opensource.cirrus.com>
 <77b8a156-49af-4900-b17a-b2b3fd11eba0@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77b8a156-49af-4900-b17a-b2b3fd11eba0@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37E:EE_|DS7PR19MB8854:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a97e15-fed3-4ebd-e056-08dd7ccae008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?owU/xBR90MDO6IVj7YPSn5gnUD853u5aAib0P6MtY9y86+dGAZ5SpJ8PZ5td?=
 =?us-ascii?Q?yJInHtFxSxyZBgqUPnqCL0rtdfxSjsbLpSZpC7aMl+KQF/YYmwH9rf4SOMLY?=
 =?us-ascii?Q?ipKLFI6/ZnPkYe0okSzdRtPRrX7zjaenG+eJx40pW0GTpTCMP/yIpUVQGhgC?=
 =?us-ascii?Q?LaleX99U3DUvZOUf9btAOg1tRLsIkO0kS7G7grRrkNndvmnjIrmm5fE4g4B9?=
 =?us-ascii?Q?fyvJ1RWE7ZtvDWBOuXA9fZQRHNC/k5rHvzyGgmUfkleiyKtHySxqm+sl54+P?=
 =?us-ascii?Q?z020ZR5Nh/Hn5+7XZ/osLOMIL67CkbOvZjHcMtuWjStt1cbyjJ2zMa92sAl8?=
 =?us-ascii?Q?bqAljNeMgyGd+Nh2WcI0if+oLSPCkntAAbAQ7vEKfF3rdxd/BJhw2jcNNk5V?=
 =?us-ascii?Q?duV2Wh1fcg0oFdoaHRgzbek4sK+ShUQCRC+Pkaz6E9dZm8nyXb8SvizFP7Vv?=
 =?us-ascii?Q?TVdOMXutv1bCMJsEFtyK93USUAI5mu9UeQP2LHGMkdbJNi+phZ34yKNWAdJk?=
 =?us-ascii?Q?ZtV8gmRQUkLtu/6Y/SE5IO7Z+XeS+LPNJq31WFHrLXAAqq6QzTWQK1qD0t7V?=
 =?us-ascii?Q?N6M23G3g1XNFFrRJwSzRmUl8BdCrysJxwmL1fneJWcJUzwbeQfEnKDtU/u7N?=
 =?us-ascii?Q?Vo1DG701HHbsX6JBnYxWnjPxtS/zT0mXrSNe1O5rGtRz4W/oDtcD2f4pavg9?=
 =?us-ascii?Q?xkH4PB1kGZdtZ7eklin0JgNutKOMAhHWBE2ruDQibshIJ4eUOiJZmU5AAODP?=
 =?us-ascii?Q?lpvzhSjOVnhVsOl7WQsD03XNYjUKgqzZOG2D4xXHFG8G1QB7eHH3V7trXjW8?=
 =?us-ascii?Q?em/VAWAbB7rmQ9a8cYHzNsOIFNbDeAEJqCH7EibFY88E92L2cJqQRY2hfzQl?=
 =?us-ascii?Q?Vw+cFlIZ4/xRwKH1u5m+5Z67dGeM0EKT2duaqzjATnQxcPy6WAHWpNc5BG8x?=
 =?us-ascii?Q?w8ICOU0SGVCHYfgIwQ8KsTnqH6z+9dFxiMT5Gwa4FUuJmBtdYaWsK3zRprCO?=
 =?us-ascii?Q?jxldlfrH915spmByPfJeMK8X5yTnqMqq0CFj2hg77ZAEyT00EzoPbyAtDYV7?=
 =?us-ascii?Q?1peSHotSmOCKflaQ8uTLmcVd50iMFIUn2beuClWzrsvQsSiflnM+O+bP6rFl?=
 =?us-ascii?Q?FMnLEr50QWbiz+CrxnYGz1mWnKnhO4kCQEvRIMUDX+LBRwwFW1J8qRadXhw0?=
 =?us-ascii?Q?oR9Tvmw4bLFlyMAeo3zH1CaFnESeyR6CvlmMtSmkBsDdNcu58uaRN6N3prFB?=
 =?us-ascii?Q?x2ogpTFkawpir/qGgUwqINu9q0Fg4gmkY9VdoTZjj5xNH/IuxgIjcAxvy+Cn?=
 =?us-ascii?Q?0D2Y4hRyYBShAV4jn0ehmeLS3SfsEgxVwxR2a+ElIFFlyp4uA68g/Om32Uhg?=
 =?us-ascii?Q?2aAHPsLeGCmFvmQBifRVS6KNzwOybHduukfJV8fHZF7etk+LHy2BpNOTFUK8?=
 =?us-ascii?Q?9ZX6EX0e/gOsYRum9XvVfAHe2rA4rWZn9C9VDK7p9bsOBW4iA1p6AJfSVQrV?=
 =?us-ascii?Q?1J35I8BouNARzyUuwk1NltfBt3kY43j3+Muz?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 09:41:33.7582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a97e15-fed3-4ebd-e056-08dd7ccae008
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8854
X-Proofpoint-GUID: YuGBC_zUff9_EmWT5o7mvdL-_DcYVC9g
X-Proofpoint-ORIG-GUID: YuGBC_zUff9_EmWT5o7mvdL-_DcYVC9g
X-Authority-Analysis: v=2.4 cv=OeuYDgTY c=1 sm=1 tr=0 ts=67ff7b54 cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=yDhs5JWqyVeKaxjYFQEA:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On Mon, Apr 14, 2025 at 02:43:50PM -0500, Pierre-Louis Bossart wrote:
> >> How would the state of those DAPM SU widgets be updated
> >> though? I think we need to 'translate' the GE settings to tell
> >> DAPM which paths can become active, but the SUs state is set
> >> by hardware so I could see a possible racy disconnect if we
> >> make a path activable but hardware hasn't done so yet.
> > 
> > All the SU DAPM widgets are linked to the single GE control,
> > the same ALSA control is shared across all the widgets. So
> > all the paths are updated in a single DAPM sync, and on the
> > hardware side with a single write to the GE control.
> 
> The race I am concerned about is between SU values
> represented in DAPM and actual values propagated inside the
> SDCA device. There could be a delay between writing a GE
> register and the SU register values changing.

Fair enough, but I don't see why this matters. Those SU registers
are device level, it is the devices business to manage them. Why
does it matter if there is a delay updating them? All the widgets
on the host side are controlled by the GE control.

> > To put that as a more concrete example this code will create
> > input widgets for IT 31, 32, 33 (the UAJ mics), however it
> > would be unusual to hook a pin switch to those. Something
> > should be creating an actual microphone widget, attaching
> > that to the input widgets and attaching a pin switch to that.
> > Typically those actions are handled in the machine driver,
> > there is possibly an argument for handling them in the codec
> > driver for SDCA but I felt it would make more sense to progress
> > things a little further until resolving that one.
> 
> The SDCA spec is supposed to describe what's physically
> connected, so when we parse the DisCo descriptors we should
> only see the level that is typically present in machine
> drivers.

That's not entirely true, none of the interconnections between
codecs are contained. Microsoft invented that composition stuff
to hold that sort of stuff. Although perhaps there is a strong
case that the IT/OTs here are defined as having a mic/speaker
connected so it is the right place to define them?

> The codec descriptors are not generic at all, they
> should only describe a specific way of how a SDCA codec is
> used. The traditional split between codec and machine drivers
> does not really apply for SDCA, the SDCA descriptors represent
> the *machine* already.

I guess that makes your opinion very much that we do add the
mic/speaker widgets at this level. I mean it wouldn't take long
to add them. I am still not totally as sure, but we can probably
live with a little more effort to back it out if we need it. I
will do a v4 and see what adding those in looks like.

Thanks,
Charles
