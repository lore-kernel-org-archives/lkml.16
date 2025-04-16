Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380911DDC1B;
	Wed, 16 Apr 2025 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744796642; cv=fail; b=qAcGJXZjs0TmjTOHVc5t8eXvYisJPCtz1CSLaeGsnn9fDTH332MuS66m4TXeqUomQWPXYNonuadCYlDSZPnSKRKpiD7NfmLS13kFwFtZH26Y3cn3BC4J12qcq7rWvGtz2w201OVTv8dmgQGVAlPSNOoSPyLy9rXIi2AXEcMVxRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744796642; c=relaxed/simple;
	bh=fYYy5dVVmAygXjtPXqrhAqVlqO58NbtTX/QCztcGWEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHpEjcf/esw4UNFFDcXIoONJAC722eGavR357s3lCaY1Ap8U8ir4H81ikG3zGQrz4Tq36BW4C5TLIdf+mUUpRqKtQbXua20qL7Z7EGR6CcvvSTNtZgv5o5/aKVB8GvdST50Xe9MPOTj8Dsg/RKb86EsE6t3D8epd9PKWnvScDgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lELOV+Ma; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XOi+3RVd; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lELOV+Ma";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XOi+3RVd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G5wZqP007151;
	Wed, 16 Apr 2025 04:43:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=NNUIt1AWEhMcZp35X8
	npVOQx9LKBfiSEuSg1YfAeMbs=; b=lELOV+MalYSZh/B+lUB08sO6rftlpzzo30
	6lK3QYF1evFQkD/j90i8xuUxmOdXBoAQQ/F6kCkY/G7Edea/WavGTxKxpY6bEZgx
	5F3g4dWOrRopnhCAwenWUgST4OgTSoFYUyOpJZn63iBQNX6ChuEwJPt8i0iyfRzy
	MQ3sgxCe8S8rmy9EouXgZuj2IK1NsURKE8pzZAlO8cjqZySr7o1KwgAXAs9O2RbL
	H8JlVdHGcsOdMmOiiwYy091yMpdu66BtjCWlUoGbSMDS4vaa5lDYz5phrh24FyAL
	lz+0XH2a0xKEDfsvwDI+7elYRCctlMhyDTxF+bcCyuUnfz7fzDqw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4615wt2ep5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 04:43:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4PPxLSSZO9y3QQT8ObaxHUKpFFyzX2TmH64VC/oXCv0Gx6yv+bgD+3wc9pZbZ5ry4EIvwtiwVv+W9vpwfnGwxcvsajiHuXJVToVs1j4E3I9VAFwVHH6/6pD1DLO9VT8fu8mWH+lEfl9dL62o27eaNydxDccuhzBGK6yyDZkHVqJSwcA/8ruskgiuVW2tfJE2gc9iCfKJJ2hBmzDvNOj1EYhn9HPHWgeA1q381O5l1TkF6hlq/IdgaCL+a5eBBGGSKamxTvy/YK+fLEa0h5a5/f0UwpGY9cgYTsQTzCytN8AYSxdEecGM29OTL2bPfSktogg6Kc+D2sIWPwBRjEUoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNUIt1AWEhMcZp35X8npVOQx9LKBfiSEuSg1YfAeMbs=;
 b=Bkc5rAwrmj0BxD0PaXK3LPsb4dBtwhTBaOYut0/9Jx94yKrhSl3Gs+HqVZmYtxjPXGNnciXdQeAs3SHia6NcsiZgaH3Uz99cr3xaBPFF9D6WbFsWJLtOsdHaNj7olGZHalZHqdV9Frrmcn7NS38imZLsoMWAhS3FuWoSrjwf7kuSfzGQt7TlbxIMVlaVDIgdnXlCYtVvpOwjoJzPHnm9P3onn/fGZlKVPpM58Uf+y71AVsOKIUGsUEVuR4hunBg4JSppwSC+OA8bnYUHmoYj9neWimEm/Q/q1ZGr8umJWSCiO6eG9CEKGwCXFu6/0sgcM1yI90zstvtl6wTAijS+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNUIt1AWEhMcZp35X8npVOQx9LKBfiSEuSg1YfAeMbs=;
 b=XOi+3RVd+/xPXHwGl8TG5zJkWCQJHIxYCEPKQfH42dR1gYO5iTkM9VWSx6KB33BCW/weHr5h0BBM3l7iTdafx2DB6TgPnJzWJN8ZkTE5JH1ptqhpSmYM4QACyjqIuRGnq8qu+E0L+LX/LmerfwJPgnyjtfmTkKaW5e/CkUsuiBo=
Received: from SA1PR02CA0006.namprd02.prod.outlook.com (2603:10b6:806:2cf::15)
 by MW4PR19MB5520.namprd19.prod.outlook.com (2603:10b6:303:187::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 09:43:41 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::27) by SA1PR02CA0006.outlook.office365.com
 (2603:10b6:806:2cf::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Wed,
 16 Apr 2025 09:43:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Wed, 16 Apr 2025 09:43:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A0A7A406541;
	Wed, 16 Apr 2025 09:43:38 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 87479820244;
	Wed, 16 Apr 2025 09:43:38 +0000 (UTC)
Date: Wed, 16 Apr 2025 10:43:37 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v3 1/3] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
Message-ID: <Z/97yVJMVEdEp1BX@opensource.cirrus.com>
References: <20250409124941.1447265-1-ckeepax@opensource.cirrus.com>
 <20250409124941.1447265-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409124941.1447265-2-ckeepax@opensource.cirrus.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|MW4PR19MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7650fc-14d5-4611-03b9-08dd7ccb2b51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aCZ6pdFJSvPsUJYd/9DIuOI72eTkR3ahWUdv5cYnkEcs/CM5lrkN0P9PatiR?=
 =?us-ascii?Q?TfSJEG74tEsp77JkjuvBvCDR1fpVRCC6ax55S/+B9eqpvRJ+98me/qd69Nzv?=
 =?us-ascii?Q?b4xb945pA66CXpBaA1C6TxuoCzF+GYXH3q3S4TWid3a+2cNw4xx7RAzxqMlL?=
 =?us-ascii?Q?nW9FDrR5dkK1+IIvKdrCCPcFZo5tQA5GHv3dgxN++D5GqLpvqBYXruEmz3aZ?=
 =?us-ascii?Q?JceLDzyFhYp0qxKJNslMPma0bDU4lD0dfOYIF9TFHuppfYempuLf1M267+JD?=
 =?us-ascii?Q?j7DF8d7NNkMUJb5/ovUoF5O2O07HOuUlp9n53jd6F0TBs4Xl+piT2XA/CH20?=
 =?us-ascii?Q?t+xNv3+sgVv2Xcl+yw8pRt2Jx+FkHHouXW8Wq6p01i+xzOvwlVLfR9WcQ4xp?=
 =?us-ascii?Q?6rOM7Ux4/PGsaWysD4vL907Vu6kXulHM83MmzIe8glsGIAc+chZODOhA6BZ5?=
 =?us-ascii?Q?U3nH8nuzWINxdkplNQX69gGw7+GrDtTyPUVSUzCiPpyLXuIRmvhRWa55GzfM?=
 =?us-ascii?Q?zArhmZbNp+Y4sVdbmYf02yvEOBI4Q2kW0q7OaE3NVAnsGtrxDWZh6KgZddVz?=
 =?us-ascii?Q?dmo3nPQ+NPPJ6jxSjdu6RAe1Of+tWHkrxOGVW7LlSML0aawwqeCdBDoOn6Xx?=
 =?us-ascii?Q?mt/88tQOx7rlg5HFIJkWgbP1XBmXSsWNWl6TyrWJ5j2p8K+g1RqoJy8vGSj0?=
 =?us-ascii?Q?4llkqIpZcyEp3vTnwepVlXMY+BgNgFo6iZ5YaLHzAaSxtosU/T6vwqlfUkDO?=
 =?us-ascii?Q?MLVsqC4CQfn0sX6jOCurchJfjQw4V/sIfNQJe8bXaOC2uf8/R1opimgazojF?=
 =?us-ascii?Q?NDngK+2KwcjkNaWyGu1A4G+7+nFe5gbmGS3Vx4XXVBBU7PPD8y2kxDHRmfpy?=
 =?us-ascii?Q?DeLhRAt8xT3D9lz5Ga+TItv5WCQIIS0CaOhSnn+6SgqwI7KkqCX9sdBP9hbF?=
 =?us-ascii?Q?KG1islyUPCAe+y3HZUO3hVKB6cKPNnOCrEdsVu1lcIxoF3IWp4rgkMJF3da/?=
 =?us-ascii?Q?c/4d/BScUlCwv7Hsc/bprBwVOHEbqKksRbF4ymNmFIrV4zXoCUYVOD+/wDL8?=
 =?us-ascii?Q?ipIoPMLMypF8hlQEdT0MKE0ooV55IRJKtd6iPyDvXciAD0lkRFqQ0WDLDWam?=
 =?us-ascii?Q?viyc8DaQz/16KYB9lcAqdl/LulSEVhKATXT7v65QkMcs95o8JTvxi5UKT0JH?=
 =?us-ascii?Q?U8YfDMOnXB1X2v1CEnHPZAUa01osbbHKluIf0sI9TttcoWrZcHYhNLa9toMW?=
 =?us-ascii?Q?vdqkE59WDdLjx10DRxJaFPUiwd8WhnbzUllYEyF2BbJDdNVB2giTUZqS48os?=
 =?us-ascii?Q?wYSNlTpJq3kjwyU9c35/nfA9dHeSfvhVFrS2DsCoku/sTw9GNQu8SC+pv6vp?=
 =?us-ascii?Q?9nXuUdpRKKLtbXFEEzATFLyt1gY2qojHmDO11xsP3AK30u7ivuVqz5P5+mIh?=
 =?us-ascii?Q?k+x8iopUKlWFCwiuLFBpcopugA+PhKQL2hGdYqUu412pDTBOyBkdlhkHN29e?=
 =?us-ascii?Q?jIukDjTyw0V1d2DoE6qeOCWLGXuhV5jtU8wZ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 09:43:40.0600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7650fc-14d5-4611-03b9-08dd7ccb2b51
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB5520
X-Proofpoint-GUID: JDpM-cSAfHxVGYNTdOQR1r1sirSKDoTM
X-Proofpoint-ORIG-GUID: JDpM-cSAfHxVGYNTdOQR1r1sirSKDoTM
X-Authority-Analysis: v=2.4 cv=OeuYDgTY c=1 sm=1 tr=0 ts=67ff7bd2 cx=c_pps a=PdgAl9AEy1hEU2ikvxmBtw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10
 a=RWc_ulEos4gA:10 a=NnbQKv-ND7Ll8lQcdjIA:9 a=CjuIK1q_8ugA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On Wed, Apr 09, 2025 at 01:49:39PM +0100, Charles Keepax wrote:
> Use the previously parsed DisCo information from ACPI to create DAPM
> widgets and routes representing a SDCA Function. For the most part SDCA
> maps well to the DAPM abstractions.
> 
> The primary point of interest is the SDCA Power Domain Entities
> (PDEs), which actually control the power status of the device. Whilst
> these PDEs are the primary widgets the other parts of the SDCA graph
> are added to maintain a consistency with the hardware abstract,
> and allow routing to take effect. As for the PDEs themselves the
> code currently only handle PS0 and PS3 (basically on and off),
> the two intermediate power states are not commonly used and don't
> map well to ASoC/DAPM.
> 
> Other minor points of slightly complexity include, the Group Entities
> (GEs) these set the value of several other controls, typically
> Selector Units (SUs) for enabling a cetain jack configuration. Multiple
> SUs being controlled by a GE are easily modelled creating a single
> control and sharing it among the controlled muxes.
> 

In case the new discussion on v2 is missed. I am going to do a v4
(likely early next week as I am on PTO this week), that adds the
mic/speaker widgets directly from this code and probably some pin
switches.

Thanks,
Charles
