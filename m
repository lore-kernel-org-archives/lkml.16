Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5479B2135C3;
	Fri, 28 Mar 2025 09:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154113; cv=fail; b=oK0xr0V9bEEQId2XYwUvoYMZaPmWFkwYU9BqNPwF16DwhnXq9WaokPC35DvA7K3n/pE+qrqu6k9HRLoSUk0XNKuQ07n7bd2rG9vsmUzLarV5K0Li47QOi6vGxQ9r8w85G3lmc1/EXz9gsWwO2XaTzxC4hVn1spAVU9Q6ynHv6eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154113; c=relaxed/simple;
	bh=Io6iaWL8iPAuyYenHhEsvnTcxOXssY+Mck2XybHO2Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UURfUhrVF0V3nVuO3mPlrYSA7/K6AVypGI8knugzkup3xcYy3+rD5kKX543FKomMiHD/GPrt5WpA2M5itQV1B7xNYMIcEa8p79bwVHAUyHWVA7u35y89ssnkk1DnhsZqCrDadNH85HjbF8YeKWTx+yXfwof8sXIwsikCxQcig2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OjaaiY/r; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=TeMOrvNI; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OjaaiY/r";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="TeMOrvNI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S81c2L001248;
	Fri, 28 Mar 2025 04:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PhVN3LqyVhmNtPn5aNnFMDFxPILKddrkKOUl0LoJGPU=; b=
	OjaaiY/rj0oWy9fiHJOIX+BkotxUooZbNZGgQ8jrlgfeZQb8cpu92UfhvEwDfGII
	aiNW/9DigypJXmHzZd+F1XoCfU6dGt08ZmjQzb0Qw1rPE/dc7KVL63HneDBGdSJD
	YZ7+vxBXWLL0QcGFqKUAVWzRCCPU1DMQKD6V4PQC+n2oBBd0KY+ASCSIoaCI1dED
	dZ5C3jNz6FsUACLrO5UCEc4wi4ySe/mPIN/R1xoWcpI6SR43FXagI/Zh9LiCe8+x
	Bg3j0NHr/+RDhcKLoOu1WBmLEXZwYyOx/vEZH6KBqZqlv5fP88pkfivdqhzQlVkT
	zkIcSZfyjHr5Ss4bgj9BBQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45ndnu0xsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 04:28:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVbIZbXIVTsdoqmPjamMT3ITPxmIL2IhLY6sH8sfksfgKxI3XLsmDyEkYH5TBJWdQN+QKotBgauqEUqgXVGYNTF68WjAQElGKNNyuMoXN8olyVaR9z4b1ltuvfTFKNRdVwC7LUz3Mu50hu2XPXiJghjfHtbO6+szy/je7wj03qxIpsECZHue5MbHocGXpUk/UUFtBFxVzFb1cGW6LT7LNOingE4kNw2aP8E8/0TNvf0nKYwBv2fFOwAAjFVSMt/5LKcvr5zKXtl6JPcGB8104EkCDViTrfH1Bm4+9hJRlYZh1VdDrULRqZ3yIimLKkAy+mJpkOiPFsua12xHP85VSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhVN3LqyVhmNtPn5aNnFMDFxPILKddrkKOUl0LoJGPU=;
 b=BXfOZf0rRj256bQm+PsOBKYyPWJx9leP3mL12PKjxCXykLXe76WswCXwppyEY2PLkkQu6QjYxLDl1ic8C5+ZAPnQRvFtwp4JS53QMTLmO+83S73Sr1/x8QnL0q4yTTVjymmhzOP+ZhsyyRDMY1Dmxsxi0QtsxCkHz+sftMEPPwZYKaFo6eo+mE2+00AnAng0KE7l+gVtdgmcf8qvRidEJTe5gW8xeuAz8Djw5VKq9FlRFN4gS7+7agNDcU7ppHPlv9Akh/1YkiVVwfHFElAAJ3xTnA+SCjvZpGDwc9QH52sWFuxyID51qpKlrzQ2S9Fpfajsvhe+eWp94V4jzFdH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhVN3LqyVhmNtPn5aNnFMDFxPILKddrkKOUl0LoJGPU=;
 b=TeMOrvNInBDryoA+/XmgwCK9SlPeyYqYRlmJrx23R/5VKkrLjEYI4wpQOIgO8EzaJHnmTH6SIs3MNTXp5BQtujoA6IyncukYf3GL3C6L+Os7mrkIFnKIQXfqoSAIrxvw5RrN7ZH6XAuiZmJ+gMSg2W4vqTJ46xbKQhw1g4XZ/8E=
Received: from MW4PR04CA0152.namprd04.prod.outlook.com (2603:10b6:303:85::7)
 by DS7PR19MB6279.namprd19.prod.outlook.com (2603:10b6:8:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:28:11 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::72) by MW4PR04CA0152.outlook.office365.com
 (2603:10b6:303:85::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Fri,
 28 Mar 2025 09:28:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Fri, 28 Mar 2025 09:28:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 243BD406541;
	Fri, 28 Mar 2025 09:28:08 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id EB385820248;
	Fri, 28 Mar 2025 09:28:07 +0000 (UTC)
Date: Fri, 28 Mar 2025 09:28:06 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 1/3] ASoC: SDCA: Create DAPM widgets and routes from
 DisCo
Message-ID: <Z+ZrptkW8HlcYiLB@opensource.cirrus.com>
References: <20250327130012.3378732-1-ckeepax@opensource.cirrus.com>
 <20250327130012.3378732-2-ckeepax@opensource.cirrus.com>
 <d38cc4f0-2018-46ee-93ff-d5dd76ad142b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d38cc4f0-2018-46ee-93ff-d5dd76ad142b@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|DS7PR19MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 01e3fc98-50af-44ee-99cd-08dd6ddadb0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L29oallNVWsvS0VqVmFUdEd6SWRQcFFWaTlGbUlwVHVnQzYwZG5Ka2VVbEtu?=
 =?utf-8?B?a1Q1dGg1a3NrWTIrL3Q0QUVuM0tHTFpNK2NLbFZMbmRjRy9oNURRdzNIaFU0?=
 =?utf-8?B?aVdJQTgrRkp2a3l4Nk1QSVVOaW5mck9NYUl0YjV5NCtzWmlsRTRKZm5tOFhz?=
 =?utf-8?B?UkZZM0w5Ynpqd0lWL3RUVlhTR1h2VFdjcnVVd3pZVFJhYmhpTDVBVmQ0TzRu?=
 =?utf-8?B?OWp2U2M1cVJEbzdkU3B2QnlXSEcrUXc3Q2h5VGMvMEg2SGJraFVPOC82WXhT?=
 =?utf-8?B?bnE0clRQb0JYSjJnYWpMelg5SGtmUDRPR2hEZlU4VzBUQVljclpuc1ZpK3FZ?=
 =?utf-8?B?TEFDVEYyQ0NoTDl2V0tjVlQ0dXg3Qjd2ZkhZZ3lmY0hja1lheEIrZW55UWtK?=
 =?utf-8?B?MFN0c3c5WGlsUG9lcnJIckVia3lGS3lZTnlRd1VkVk5mQWh3d2Zra1FjbVB0?=
 =?utf-8?B?TEtUUjd6R2hsVEpsNlRYTWVvNnhHWGdrM3ErNlEzZjRIVy8rRlFoWDVORjFQ?=
 =?utf-8?B?SHN4REtXeGhqNCtxZ3QvUmpqVmowQzI4alZLK1FXcWFSOG54Umt0UXMwd0Fv?=
 =?utf-8?B?TWdoTEM2dlBzYVBVQ3hRUjdMS2hwZytXYkY5ZXJDVUhyK3Y0SFo0YWZ5VU9F?=
 =?utf-8?B?L3Y1Mm0yV3dWa2RQejBrRHNoeUFySzJpNFdhdytpWHFoc1lZL1d6RElqMEZn?=
 =?utf-8?B?YndicEVHUXBPSVVRbVdpb09KUnQyak0xb3Frc25SSi81UHptb3R6bUFXUllr?=
 =?utf-8?B?VVI4b0lzVXdRWmZPS0F0N2VPMlpVakpEVU9KZDlDdE5QK1pOdlh5RDhRc0hC?=
 =?utf-8?B?eTF0YUhTdjZoblAwd1E2WHhYa21WNG4zb1YyMGdaUWxMd2oyNG5iek5QY2pV?=
 =?utf-8?B?SUEyMjZaMmsxTi9ZcXRpQUgvd2Y1WkxwNXE4ZHc0aWxzbTlKTTFQaXhDWjBG?=
 =?utf-8?B?bTI0TC9ud3dCeUZmdTNsMmxBVDhXcUx0VFJ2SzRPTlh2VngyVkhhYVdIbFFn?=
 =?utf-8?B?Rm41b01FZWxCbDlqYkVMNjlXTkQ0Zm5QZXk2dzNNcGE2UzNqN2dvcmU0Tmh2?=
 =?utf-8?B?UndhcG5FSnZhdFRCQ1kxWllYTTF6YWhQTjRLZ1ZlbUVwRW5HejJCRmlZd3NU?=
 =?utf-8?B?ZEwzazh2bjV5WitRa1p3cGxyQUJyMmdQU0xxOHdWV2VPN0M2aW83NG94UkJl?=
 =?utf-8?B?dmFaM2RERlJXNkw0RHl6Z0tXR3RVbm1CZGl6ZEZhaTNjenpqdUN3bGtFeEN0?=
 =?utf-8?B?ZzliRFJ1WklTYVVCdlhRUUF3YlNtbHNKTEovcTVRQm9XWG9SeTBGZllWM3hZ?=
 =?utf-8?B?NFF5VjNDRC9QTkdNZnBSMW5kYkRBMVFkUlQyV2hhRFlKM08xNFk3ZkpTZ1BM?=
 =?utf-8?B?UFhoSjRNMGNtUmF6cmpUVmhJUXJLWk0xcUttaGN4SXNjSjBqWk92WXhsUGlD?=
 =?utf-8?B?dGxyVHBFU3ZNYmhKWTNwQWRJUVNQK2p3ZmVTY28wck9LdVllYkluRXpDVUQ3?=
 =?utf-8?B?WTlhUGM2N2IwYlBvZmdWZFdiTWpnYXQyUUtHeHIyWjR5bEFMdFFUWFFzbEFY?=
 =?utf-8?B?RDJ2UkhrRU1rR0EwOXlIMVpIKzhSYWVhK1FBYVpDdnNEYWh1bnJpQ0JnZUlt?=
 =?utf-8?B?YUU5WGZkYnlueDhtSlluUGR4blk3NU1kOG1EK09INHBlb1BWam9rbllUTzYw?=
 =?utf-8?B?dlhrYjZGRGE4b2FtOWZQUzNaelVGMDhHeUJ5R3IyWVQxMElVRElMRE5xa3Bj?=
 =?utf-8?B?ZFJINE5teDJRY2VsN1NtUDBkd0oyQmlROTFHSUdrT2MzTnNDb3ByQ1ZSSVNZ?=
 =?utf-8?B?UDZtdDFIdFE5ckg3cG9Zd09mL2hMbkRGM3kwbytBMjhaNVg4WlZCNStsZWRo?=
 =?utf-8?B?VVNHZmZIM3ZPVTY4SHlSanduWlN1OG5ES3h3WlRwQ2JKUlNPUjhIaGF1d0Q2?=
 =?utf-8?B?RUxiVk4zczQwY2tocE04aGhIWU5XL3JLS1d4RllZZVh6MFZ0c3p4bHI4TUc3?=
 =?utf-8?B?TEpQRlppWk0xYkVmTHdsV2ZXSVNJekJzK3RaaDFoY2hHNFVSeTlZbnMycVNx?=
 =?utf-8?Q?F7xyxS?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:28:09.8728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e3fc98-50af-44ee-99cd-08dd6ddadb0f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6279
X-Authority-Analysis: v=2.4 cv=GoJC+l1C c=1 sm=1 tr=0 ts=67e66bb1 cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=vyUtMD8Ux7WpDS4b90oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: 0vQUNQ864chgMT9kg3aiKhT5CwFkCAq7
X-Proofpoint-ORIG-GUID: 0vQUNQ864chgMT9kg3aiKhT5CwFkCAq7
X-Proofpoint-Spam-Reason: safe

On Thu, Mar 27, 2025 at 02:23:28PM +0100, Amadeusz Sławiński wrote:
> On 3/27/2025 2:00 PM, Charles Keepax wrote:
> > +	texts[0] = "No Jack";
> > +	texts[1] = "Jack Unknown";
> > +	texts[2] = "Detection in Progress";
> > +	values[0] = 0;
> > +	values[1] = 1;
> > +	values[2] = 2;
> > +	for (i = 0; i < range->rows; i++) {
> > +		enum sdca_terminal_type type;
> > +
> > +		type = sdca_range(range, SDCA_SELECTED_MODE_TERM_TYPE, i);
> > +
> > +		values[i + 3] = sdca_range(range, SDCA_SELECTED_MODE_INDEX, i);
> > +		texts[i + 3] = get_terminal_name(type);
> > +		if (!texts[i + 3]) {
> > +			dev_err(dev, "%s: Unrecognised terminal type: %#x\n",
> > +				entity->label, type);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	soc_enum->reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
> > +	soc_enum->items = range->rows + 3;
> > +	soc_enum->mask = roundup_pow_of_two(soc_enum->items) - 1;
> > +	soc_enum->texts = texts;
> 
> soc_enum->values = values; seems to be missing?

Thank you that is an excellent spot, the device I am using
the values line up with the index so was easy to miss.

Thanks,
Charles
