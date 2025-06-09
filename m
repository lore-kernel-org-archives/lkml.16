Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9209B1F8AC5;
	Mon,  9 Jun 2025 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479643; cv=fail; b=pxlRosyfqlK5//y8SQOZ67xE8nNlJoXYs9qlHPuWWSyZ7QhaqkBI7UIcHBtWEbUMV+Wgx+mz3fPeIPR6RR1V5vD6zI7li6sfgpIZe+vK2hpVejNFIkftc4511vwurjbAwuNg2rPxfmQGliyQIBBCR6mVVJRUw5sfjYGsHLq9IGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479643; c=relaxed/simple;
	bh=v46ZTfxcCAvB3ErhoWztjkgkvFzcdRWmvGQnCfU5MBc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WRInh6IMisATP2mq1EXqkvn3KsbuagU6mrGHQrkHQYs5sj9FL3uWFp812zI6QGDE/pSecupl3jogzke68JIwtTH0+ww0OdG/Cj0zWAw/alhIe1YdAwryaIS+rL8sn87CVhelma+/3SOO8LZAg6N0Zvy+9zAgSGakn8XkW2MuX3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OamOK5+Y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NGMOkwAu; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OamOK5+Y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NGMOkwAu"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559BWC76029240;
	Mon, 9 Jun 2025 09:33:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=cIOvrsXIM9XYMsip
	J1dbw1d6C9zztUSarghlHs5NFmY=; b=OamOK5+YfkD2snSjYlvV7tcDy2JlVT0p
	sjEKbUevsv6eHEqUf17VCRHQCER7ZjmXR1mthuqO94PkvsQiREhzfkBHKof3/I8E
	1KkeL7ViNOJPk6VdivsCTwgQUarpOnz4i8Ff/FmwB6M/mOGIo11pZ5x9ALheps7L
	+04hAxU1kv8hZqqI2o15CuFpIRy6+2zz6JRDHrrZaqLwxGWJ4MrQYvAtcMXHzUbi
	W4Ue+GYrlC4Rsv4jg4orHqq4AOfaihO9OHfR5P3T2AMSCIdNprgwzaET6P6mqSM7
	mROQ/zpL0TNTL9C0dgyt3KpzCtpcUSqoHA0ftErDjzT7Sm9p8C7SdA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10hn2238.outbound.protection.outlook.com [52.100.157.238])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47529v1jr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 09:33:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzFhyUlB6GUFbwl/v2cvi0cK8W3Y1we88kxh32sjwNi/+R/Y2CEmxC+2uZ55yqSh0CzRdnKuRA9ekPG1TsWlvasCW8XYrt8rLKlBJ0fudrV6f9/jyZ3Kn8FN/utRuUq7UvoimEI6KLDTCukvcQS10MO1dmMZji3PPHnkXANAAaNXZYjaFArPW/L06pHAf0Z8ws0MpwrH6XvDSGu67IQO7GtBjTn9cTJyShsYZNZQmMHGcBfA7L85i86557oURw8JzjjQKPZd7kxt43SFfYaq8WI35fbFBRg0u1CrnCpRg4BACRWFzcADWPOGHnsMPF7qzGd3HZ+rJijxk397uh6Izg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIOvrsXIM9XYMsipJ1dbw1d6C9zztUSarghlHs5NFmY=;
 b=VNj7Zje16JretHzMT/yYlba1ug9FeSpfGMH8XFgz/8W+09dz8xt74gb0DMn8e3hEziXRYWurGJOwDR0A7/0arpybUIkfwrxRm5G5ZNqltQ6yD6hNpSgbhoNbINWTySmJi4gmGvrEzfQVPcpv01P4VRd9tF++jDPKPUwBZ/4y9DA2IQC0cPvD4Ro885Krda8ZCndS4PtR6R4MoqD7Kp/Qg1ce2gPfvmo1nzOjRfn7H2FrcR25qP0dxWZDpu4dzp+cUdd2e2HJh3kATkjCe2WAS+SX81F/L86h7/rvVuGSK6CXzq5H75zuIpE9tyehy3+V+bILcEVFuL8HEklzYpHz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIOvrsXIM9XYMsipJ1dbw1d6C9zztUSarghlHs5NFmY=;
 b=NGMOkwAuYreJ1D73PhXZV1Q6eeI7dogJL/1aWg1rtblnNg/Qh70ac8i+2VYMHfHdi1Xvx46X7JkxnNmGVI70421bkX616BYhFYCFYr00xPplvItqNlclYkgB7xXYzQ52hHvzqvCnRZ2uvSywHlK5GlsNhYp7Mtn3WG9wU6v4aGA=
Received: from SA0PR13CA0022.namprd13.prod.outlook.com (2603:10b6:806:130::27)
 by IA0PR19MB8097.namprd19.prod.outlook.com (2603:10b6:208:489::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Mon, 9 Jun
 2025 14:33:49 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::54) by SA0PR13CA0022.outlook.office365.com
 (2603:10b6:806:130::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.13 via Frontend Transport; Mon,
 9 Jun 2025 14:33:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 14:33:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8CAEF406541;
	Mon,  9 Jun 2025 14:33:46 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6966782024A;
	Mon,  9 Jun 2025 14:33:46 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Update SoundWire IRQ handling
Date: Mon,  9 Jun 2025 15:30:38 +0100
Message-Id: <20250609143041.495049-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|IA0PR19MB8097:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 97d8f976-5ad5-4893-d0c1-08dda762a5a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700013|82310400026|61400799027|376014|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UbWhvZnMbyRwAXuUcPRwRnRnActMX8sfwrnEvcS0oe17KAQUbsJT4kQGaajz?=
 =?us-ascii?Q?OM/roQnuV1FkMt9O25l++dzHpajKgO+jWminev9+M8LdU6ER3LWPSY7h0RVC?=
 =?us-ascii?Q?JDeLjvl4gAqwXkGNTyvGjv2iAco7bTNO/XVMNUn9zHdmBZYhXTpQP6S/xW+X?=
 =?us-ascii?Q?PmOM15FrgkVKM6psu+wEqblhrwOLkanryv7j1ManIQ+y5DVXcXv6f2Fy7pJD?=
 =?us-ascii?Q?+6dgqnITH0WUUVH9fYlpZW6y/uCuIwrgwKzbDU8FsyC69ClIpZL/alOHRm7g?=
 =?us-ascii?Q?0GPVLBwVGw1uFqwpp8wciou5ZCe0gHZRLvBXkgnM8k6H8SImW87qj+RKTFK2?=
 =?us-ascii?Q?Z75VTGtxgZp7NH5nTiIvz51ZOEgZRb/SG6zThHC77pQ8WBoMhQQTajO8o8/m?=
 =?us-ascii?Q?k0fTrQXbqwIWn7X6rVQwy8YLp0DfhUN0h++kVTI7kNSDwjYJ3rEfmJOzdKKt?=
 =?us-ascii?Q?zHJ2q6EeRiNCRq5KXco8fmErgHXd6EN3OaPfYMM7OoGOYQw85NkGHP99rpgi?=
 =?us-ascii?Q?aZd42kwJN78R4MjqFDEMCHOW09bxmmKabNGF69P2dFilgOsTwCiJPTMzTsi/?=
 =?us-ascii?Q?45jIzh4GrXd9Ey1gwQTE7uk6czGvFpFMbJ+oR/CwWxLr45djE3+A67xO2nm0?=
 =?us-ascii?Q?zdmdufup81bkNrhoQV/BOKONY80kN4Wu8u6PDH+W9JYzdqNvK7MFNrwVMsnp?=
 =?us-ascii?Q?FicTsp5CS5iPgz9l8dGdmHPQGv75WnoEdzKeux2SWTz/+0qOgvXXYYGDseYR?=
 =?us-ascii?Q?VYS57jkvbJBm4a0cUW+Qi94NQYWjZJiHvuFi24hyfYqWyDeFwwRQcpEp9EsX?=
 =?us-ascii?Q?J7nqh2bjWATju3Xy8IAzZVvprLwjTD27nlNvvW92Fjm6nvWhgbOz/sfOf3Jr?=
 =?us-ascii?Q?+bJhB38+MmwX5uFvr1OcODBhuH/Yoo0dqLwgoHRBtGMC+LDWe54cJe6gOZLx?=
 =?us-ascii?Q?ZCG9Sxw3fei7dHl8nPUD5CUaiJOX/p9WGaRpwG3qgVv2/zGqV4VgBoD+NaHL?=
 =?us-ascii?Q?vJtFRl5dRcXKAArul6w4PDCxHjHCmCqN+7M/DythKGtoBLjBu77E48cgpPd5?=
 =?us-ascii?Q?YjVrzb59J34ExBQ0806uvVI1Or8bQa7A+OQknwDOaoSDnfoD6/QO0XzW1Fk/?=
 =?us-ascii?Q?PuPTiybWbINDhw7ww1i5hbia/C6THAmvi0xWSgIO4X7vNR2qw2sVK4rkKbcU?=
 =?us-ascii?Q?v3VsTihqoBDFuXgCXGVIKXvKzwP6Yf0NgSPxtt1JKEhnx6/gwd+o3xxTq1uS?=
 =?us-ascii?Q?2BjMqa2jjnnbF1sgAq0V8/M+tiPhbvc0RZw0nspqXr213D24RPW9F8MTF0S3?=
 =?us-ascii?Q?PabggYEIMLY95kHVq6yG68e63sCF6ZPcRQrzZjy1/nRcdA8nFU0VtS/O86CC?=
 =?us-ascii?Q?4cpBOkajsshoDvYCapGdHPJJZU25CRlDt5CxYvKCoQOGnspl3rrXzofJH/fn?=
 =?us-ascii?Q?MjvPBPCPS01EtSCXouatNbDolygX0fcM0YdGgKcklqr1SmoiiJpD6yW532ZS?=
 =?us-ascii?Q?6lrUTebpb7i8DuRyc3bBKcVnt9cck4IWuwac?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(82310400026)(61400799027)(376014)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:33:48.1641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d8f976-5ad5-4893-d0c1-08dda762a5a9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR19MB8097
X-Authority-Analysis: v=2.4 cv=Jfq8rVKV c=1 sm=1 tr=0 ts=6846f0d1 cx=c_pps a=RN04H64nGlLCbTMVOX801g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=RWc_ulEos4gA:10 a=mRuxpCjb-NPUBtbOopUA:9 a=jZz-an6Pvt0H8_Yc_ROU:22 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNiBTYWx0ZWRfX4300gH3Fx3Jx RU9WGihx5eV71TX4qwwmlGuS2VnAoJbxHtylpsUiCsRpZG/uQrnrSLltcBm4wxiNpOQ+grdo8gc eIvfw4ukrfVjteUkWypuPA8mmZO7gQmpuPgq624622lHG5ym94lIQyYPRKS2ONfnNWMCvVgcwm+
 wrMaWX4JHRF3GPK9jW5oEok3suEIOjf1aRQbUk/zoiXr4CBN8JqI6nqRi2KFUUbf3GXnGdfOSrf NCDR1ydrUmbXuls5sigry6ntzdelBv+N+CJtvl3lk27ZcJGkOgHsO3UU1a68LfQJvXKadp+MdFx s2ozAxv0+s9f9Cmw+VwTRt6qvnNYseobQfj5olPLdFIGQ+iQkXlnCLNWaIoVOCEH+Mj7YuPXTSr
 Mvi/wGm334FQI/htOAOLa8bH07rXOdav11jkbZ2+iwGXC3upy1h9ABPCTclfcs5WlGjinW22
X-Proofpoint-ORIG-GUID: gncN6VqgtTZkq7Amy9K5UgDLjOkXyK3v
X-Proofpoint-GUID: gncN6VqgtTZkq7Amy9K5UgDLjOkXyK3v
X-Proofpoint-Spam-Reason: safe

Fix some difficulties in implementing IRQs for the SoundWire system, by
moving the handle_nested_irq outside of the sdw_dev_lock. Also a minor
maintainers update.

Thanks,
Charles

Charles Keepax (3):
  MAINTAINERS: Remove Sanyog Kale as reviewer on SoundWire
  soundwire: Move handle_nested_irq outside of sdw_dev_lock
  ASoC: cs42l43: Remove unnecessary work functions

 MAINTAINERS                     |  1 -
 drivers/soundwire/bus.c         |  6 ++---
 sound/soc/codecs/cs42l43-jack.c | 46 +++++++++++++--------------------
 sound/soc/codecs/cs42l43.c      | 24 ++++-------------
 sound/soc/codecs/cs42l43.h      |  5 ----
 5 files changed, 26 insertions(+), 56 deletions(-)

-- 
2.39.5

