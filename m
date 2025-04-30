Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441A125B1F5;
	Wed, 30 Apr 2025 12:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014778; cv=fail; b=NnMCXerkWGHQANC+c9/64y0AQ+pAdtavIUpG5Yy5a9qjnpswK6EZV5IN/XOFJtOwQG+91Kfkf5bzmUFjgUxuC4atKEmXJREXRPqv4GTI4yLzjwS2rU3eOPVPP8zk5VymCgZ25r8zxJevwxD0mtP+kZN6FGNefATk01V8TjUZuF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014778; c=relaxed/simple;
	bh=4KW9SioebpvbbdljCIyWMI4KkePMfC/r4nFywj705o4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyCkVznjbzhvkDCTPtoyqj2RiaYddZorQAoNarVY5YkYllhqtGNmThtvMe4qFdNS+Ny5arf6Q+B6ea6A4+ow6x2S7AuyYel47B4NKyWU/LxiIraBMLJhZkbiuARds88TTrVh4MiPUFW6IiQ0nqMTy0cD10dGCstOlEV+ILAmiuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=o7QFs2OI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=rQqwQxH6; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="o7QFs2OI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="rQqwQxH6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UBngpH004271;
	Wed, 30 Apr 2025 07:06:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=/1vtIPAXyGM+099AHZ
	gr7zg2MEwU4ZRQKnnIqs+bmIE=; b=o7QFs2OIBDOyxezcR73U5X2FSqqET0imMn
	jLpd7qQaaxYOJWqdvCgV7INOtW4SVgKY9pRBcUltUsisthbu4iG52Pjpz31kuZ5F
	3M7WLzvvlD7nM4/otQsRXUsjStH/WeQNnjojHhzgCgSnpjkn9lmkDtFbEnRZFrF3
	0FsQZaZUvDwsweTuAFZisnENQAyiyYa6tqFZ/4A8H0i6ysF1w9kgdbFDbFcrXMLi
	Nazn13IDpzimrLMkU/EpEDIbtmRgCr0plTOG6CVEaSQZjIUC7mhTgxXWC7PCCoFe
	XAPWIWProO6TwE8yP40A6EMP5BpLt3jg2djjEaPPIWGsHk3fbfsw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46bhe1g5wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 07:06:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8wPLKxv9uxMIjVbuubP/SxhZDQ+FcosbdEQcD/mg72NuM3U2V9NtoOjjvlUuN6w9pdku8lpXAaE5WDpilQbGjb45iDYep56Azj48not0Yt9GMLUakYkbh5uw/qUt8KM8bzWVRYvkHUmiuZVvh5lVeth1qXgklI8fmGd3F6YCLpMuSkwQZXLyZkVdDxnZEPeN30Yc8M8nMhZrZ0oQI8cW9qagg0gZYG0Y06UbxqjGmZyY+beptU39HlCRTH8MxIw+qtutWx+ky0zBiZq/Mq2hjhe/tOvCNd019R3WObmM5JhlZHA6kkiF5zBFdIsJ+xK9GE78Z7syZmwQhjaZtCBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1vtIPAXyGM+099AHZgr7zg2MEwU4ZRQKnnIqs+bmIE=;
 b=XYIcnLgiaqwt2CcYQoWqHXri5tg9lbvdfO2chuEGhuxbQxinxD0ZSGp3paHiGGQDIt8x7dVWT0ijqG/rZRNayAj51t7b/cDdmsAEVWtpnzQJnS0lifWqhTQnKkhmf5BppQa4ge0mSxeD49DiuD9Gon5YZdMYOHT8b0GD+r7VmBhghZgKwJekkyo+FQFGoEItt6NbcnSsv5n439cBeSW4w9lR+BWyS42ZJsVfiAM52Vh5DqbTQKF4Lahb2ZqIiWo4wBQ6nOeA/UhL5v3UAqAoOQvrC5BpXAOgbIHySdkwihfkVutwD6fTWm2T6ec4qpvZOZcLxBPNBOND2qnfO/Xjog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1vtIPAXyGM+099AHZgr7zg2MEwU4ZRQKnnIqs+bmIE=;
 b=rQqwQxH6ZxrALxXjhQm0IypvFflo1OwJZ2cBuXFfnzlus1i3z5CZUypphwaP8gCXRXrG7RQrS5nnbh5pqoWj5gPdTBtawMoI9nEj0qf0TNgyAbgMkLoyiMBy5rp44LnEmAo5KL7JcKMNT/Ohg8Bp+Z4X2NSucCd2ayjPEHiKPrw=
Received: from CY5PR19CA0129.namprd19.prod.outlook.com (2603:10b6:930:64::27)
 by DM6PR19MB4106.namprd19.prod.outlook.com (2603:10b6:5:24e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 12:05:52 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:64:cafe::99) by CY5PR19CA0129.outlook.office365.com
 (2603:10b6:930:64::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 12:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Wed, 30 Apr 2025 12:05:50 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4C519406543;
	Wed, 30 Apr 2025 12:05:49 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 2F835820244;
	Wed, 30 Apr 2025 12:05:49 +0000 (UTC)
Date: Wed, 30 Apr 2025 13:05:48 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v1 1/2] ASoC: intel/sdw_utils: Add volume limit to
 cs42l43 speakers
Message-ID: <aBISHAyAHPMB/wkW@opensource.cirrus.com>
References: <20250430103134.24579-1-sbinding@opensource.cirrus.com>
 <20250430103134.24579-2-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430103134.24579-2-sbinding@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|DM6PR19MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed6fdf1-622f-40cd-cc8b-08dd87df59c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EQqfOGUkitqMT0HqqOQecqjfQi8GvoM7mZNVbs6aGiYxsW9PhcwDos8KjfXr?=
 =?us-ascii?Q?v/NHS3CYeNKlYl/Tmh82iP+roZ78bC/eac+jXE4L5jp5p6W4rDa1ikSrOuC8?=
 =?us-ascii?Q?HY+xGra4oZiYazgU4ZVNrpFKDavbMEsD+kStKtU9nYigC0bSzEL7Fxrz26l+?=
 =?us-ascii?Q?skfxyQOc24wUqU4yOZCNO4qJ44lRpyJimOMp9H1ZYWt8Le6h1D//8RYmwW41?=
 =?us-ascii?Q?zLqIAnggEMT0Hcvjqc4vyibNws+1JI2/AnCow6mF/NtH/V51ekxKHRoGSLrJ?=
 =?us-ascii?Q?q2ym4JAN9WlSZJ0+EdX/zrCNnIo3vtMZmVivXdooHHCwHaGq/cV8HVxgqV3L?=
 =?us-ascii?Q?9PX97xkGE54E2SkZXDS/mzT3JlMa7WYQJRqSlkUhtfXYJfUbuZSzJDg8qbiF?=
 =?us-ascii?Q?RnVjua9hKlQco3VyEN1B0pB2+d0kGcxHw+eoRIVzdfO/Pz3IRXrgonfAC2Z5?=
 =?us-ascii?Q?ZyJlTrvPvqFg24FF5XxllP1GbEFYShSu2C44jhzPtDK3nHRFyeEnutTBMqZb?=
 =?us-ascii?Q?FVfzBE0DGW2QBR4z4riI7hIX7zw+bZhoHsGvE4VkBkCcAJY1KCnb1phGcVui?=
 =?us-ascii?Q?4Zd5tINHSUcbxBcBgnaKaidqaiNrkGUQGAe5tR8qIgurnruJAr4Ku+AJe+RT?=
 =?us-ascii?Q?B5a3C5f6CeTdesFkXVf90NqgwmpISB+2WBA/KHlG7hhFtfDmH11QgwkTaKS8?=
 =?us-ascii?Q?gPUlTRLFaVUqF3r/8FqjWNJHSbSGucPMUoZNDl+z8b8j8g8r/ZSBlXrstUz6?=
 =?us-ascii?Q?nxQIERYkYn7d/ZLspctPOpVhB0WWG3gqUueec3Pk4q3IKMAMGWp06bEPpjpb?=
 =?us-ascii?Q?4sRZ5ur1WhR+1iDWuYiAHwGE8HIBHokTJ7o1FS/LqTwKaXD4sv+b4c3q2mwN?=
 =?us-ascii?Q?AEuagzDDVAw3IaMkGk7bnHQO5RFKq7qwU6qJ/WBGevj44zkwjERM7qvtJs7O?=
 =?us-ascii?Q?rwoimNsAeCFc1pXCUdroU5GUsiVnvO8j5gAjqBjCJmio54cEXA/H9U9bedPi?=
 =?us-ascii?Q?MYdMWA7kWPc8KlnVwMNsAVRprS4nqH0B8YCV4Ma5ySnXvqVIngQfEw4tFT/K?=
 =?us-ascii?Q?Tjt6qvp7gunaQxcHsTqkkS5/Nxe40fkWD6TAHy10rHxvwqVLuDPDDUj9M/3r?=
 =?us-ascii?Q?33SZFV8CvSgrFTXFvFDYQZ0P7nrliRwAF3E43tzyypIq3yXHDD0IfNiZj3DV?=
 =?us-ascii?Q?JUwaWtC7V7pWzzNdCfLOCXe1Rh1kwT8WAZd7wU/TOpaqxOZZ7YnWri8xqicL?=
 =?us-ascii?Q?rVncUXTnIyzHXpRgr4EzVXhuq0t5k7VlHbm68NpnBWbb1xQjQb7SB6YrAAdd?=
 =?us-ascii?Q?evk5OEf0RU+AQPICDc0Iv7JkHGzGpX+jgILmUifw/NkVoyk5aBJsKCT9CCd4?=
 =?us-ascii?Q?cbzhYMuywTFBZOBE3zpPkOUsOManlDkUFdu9uSHnWtHYe7vwVg5PYRhhWtCy?=
 =?us-ascii?Q?jRT27bCghGRnRothsD7uEZ7owou31FZSskcW7ImE1yookOLvTs43PYGB6+XE?=
 =?us-ascii?Q?17k36Cf04VPF66GnEeJDN4h1wN1YDOgJrFw6?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 12:05:50.7382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed6fdf1-622f-40cd-cc8b-08dd87df59c9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4106
X-Authority-Analysis: v=2.4 cv=HI7DFptv c=1 sm=1 tr=0 ts=68121229 cx=c_pps a=rPWB9DPlu1VaKM/QD/CSBg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=LKne2kwRHxAGj1-bkugA:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: gyZnDv-yxy5YrXq2Bbpy707TDqEVRxlR
X-Proofpoint-ORIG-GUID: gyZnDv-yxy5YrXq2Bbpy707TDqEVRxlR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4NSBTYWx0ZWRfX0f69zaguB6pA hLe19f1p/EgOc5Qamfrg5QTzVJOPYXHb7uLGl/tKVS/XcFEs3MqEylo3oVeppUTPt6zV7tNOpAI FjTfLP1Emd9HJdTaz0CoaMvV13V9keRO1nhb0J7kpyoJ10Dpj1KzJizxbMs5iCPgyxt0Fu5aAKO
 6YaC98P8S/ElBxJIkAO2UDfyykErgYn/cmyo2vpjvkK9waXXZdI0OF+GMJvzaCZYWyjxjBVoy64 GJwWtZ+Z0DyzUVgjkD1CZLJUTQEiKkEKex7X58Lzq7KO4FU8kF4v78GRroWeKupdOsnbagLS/LA k8opcD2Jk+jHy3/t1+jb4yDUkSsHjDZpcAYL65PNWrm5VyEDjZY+ZfCWvT/MIQmXZTvVJYYNzGs
 wSefy5phGwoqdQJUW9Pk+BbooW7a4VcjcveiasKTiYee+TSCCLyqIa960Mm1fBRcPXQULebw
X-Proofpoint-Spam-Reason: safe

On Wed, Apr 30, 2025 at 11:31:19AM +0100, Stefan Binding wrote:
> The volume control for cs42l43 speakers has a maximum gain of +31.5 dB.
> However, for many use cases, this can cause distorted audio, depending
> various factors, such as other signal-processing elements in the chain,
> for example if the audio passes through a gain control before reaching
> the codec or the signal path has been tuned for a particular maximum
> gain in the codec.
> 
> In the case of systems which use the soc_sdw_cs42l43 driver, audio will
> likely be distorted in all cases above 0 dB, therefore add a volume
> limit of 128, which is 0 dB maximum volume inside this driver.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
