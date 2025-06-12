Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D703A2367BC;
	Thu, 12 Jun 2025 12:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730501; cv=fail; b=FgxfnPZuXfBFTLb6uqU1rg9buUiT4HbdBJOxI5s1ADD7Ra01lu6onQKAIKGMubSKhnFlE0MglgXG/wbODw0CnoRTMhIOQENZ6CgXk60Z6wxVuUWsMU5QbRpVlHFnL5pMHFMEi1Z6WaqB/F0Q0B4dLu5+WnZI5Rsk1dtIO0fivIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730501; c=relaxed/simple;
	bh=pn9F1fX/XiYnQFew7UG98OVwEUupfJIa6Cz7MG1W928=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aU5lIeFsJkGew4WUG3KojN5o4OGrVLwr3UGxlGhomPJ1mhBtUyDaQSU0fXWiKV3S3v8Y//+faANDV9nbmK13SVRoUrmhRNZaSkFtW9pK+AFR29vnRTxLBkD3dz93PVcLIgrUYFLbCOQNFQdMnO7MjbonUxm5ioy8Rwletq8+Yws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nVnKtGWc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ErO6zvz1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nVnKtGWc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ErO6zvz1"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C4qTWb010133;
	Thu, 12 Jun 2025 07:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=cc95ZqBmOVOD3wSj
	zDvk0nzB6Qp+Z/OIF/AOb7MSyV4=; b=nVnKtGWcDB9D3U3XehFVbovuIYnA2sI/
	JcaNtokfnyHCgiURda7rLrwFnbfLswhE810igTkx6/tB5Jvl7qwrzbqK0oO4J2k4
	EV8hDtL6No9ic9IFAxATHGdhSapi83hEpCD8cF4+xYlWVlfKbtZ/QST6gppv8PJ9
	bqD7RM5WMRG/dtFeJpM5J+8b5t2LPvdRbFZsSNmcBBiw5PYyxCSfZZbdRXEJihFO
	ojeP7UR4qd80cXcDz7HqLbRqn9D7MOe+z8+Q6LYHAwDiQelB1tERzvUxGKATARyf
	pMd7rCJ4lxzQin70RL84nYSJ6UVYMAS6ud3heovFFc+rQmhWRdw4SQ==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2093.outbound.protection.outlook.com [40.107.212.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4760mww0s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:14:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GieF/KgPS9NFvpUU3YLqCehnG5QoFxpE99jV4Yg2feePwGwNVJ1TgADiFOTry46t11b5mjAM7mqglsVEIpvHXeJUGWTWVBjQ9YNmvuFWE1Eft/bi6mGEJSrc0ctr1Ezi7553zRsty+d/maHC6mSD8whWY5yJZhtADgm5oerxVwegyZzvlxrLAl/nalvXKb39vR6S7AUSiieXdP0XAkFyuPGNc4DxdniY7uB4/8a5jkByG0Rx45ExWEs8QmvPBuE9Ow8pGW6YJKNmPAbAKp+/W7lrUKAh/yrlSgnDSOUSoIjvaZRZRU0ph7UpndjKUi/QZGe4buxV9w7gtiIDYGCoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cc95ZqBmOVOD3wSjzDvk0nzB6Qp+Z/OIF/AOb7MSyV4=;
 b=c8xYKCM8vwMPaAjSORx7Z+CEROO3EsjXfGWaeygr2n+bAfhOjJIlSF0Jzjo4gj10jA8pCIb3+/fV0CninmF5zh8ACDNQf5yTvjJXpMur1JFBpHIvXpzNyjQTClh9Z6BQZ/tWOwY9Tjb4EQ3MSRBeJ2NyZB8dBJKU5L3mLCED17D8ULXuV1W6UM8Ml9DDLewhSg0Dh1+WH6ciGY5wcP/IFYGeA6bdQ7Jl0v94e7urt5wgcXF37zEkfNOkGd+fWamy8WY2lXPhiLkVsSIEYMCxnzpYr/MkqbwlcIBl7ltHubo+bL5ZjibzgejuVPPXJLrvmuuGz1gymPnJmZIVw3Wv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc95ZqBmOVOD3wSjzDvk0nzB6Qp+Z/OIF/AOb7MSyV4=;
 b=ErO6zvz1gIs/X0txJwdfF3+AY2yPBzQPWLF6SzwPlVNWyq7gsK637uouQxlZ8kLjDuVBZuwcoTP4v/plKyTGasJvhAt3EwSLStPYLfA93PFtO0eIIgND3Sb33jJ1XBfZzhIOL8UkqMxcSzu57PBIglLekKVXfsW7LUnr98E/PZA=
Received: from BN9PR03CA0089.namprd03.prod.outlook.com (2603:10b6:408:fc::34)
 by SN7PR19MB7067.namprd19.prod.outlook.com (2603:10b6:806:2ae::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 12:14:43 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::4) by BN9PR03CA0089.outlook.office365.com
 (2603:10b6:408:fc::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 12 Jun 2025 12:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 12:14:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 21328406541;
	Thu, 12 Jun 2025 12:14:41 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7E5B182024A;
	Thu, 12 Jun 2025 12:14:40 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/3] ASoC: cs35l56: Change firmware filenames for SoundWire
Date: Thu, 12 Jun 2025 13:14:25 +0100
Message-ID: <20250612121428.1667-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|SN7PR19MB7067:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fd3defb4-5833-424e-5437-08dda9aab639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5rCR+Wwaae2U6y15I8xWLP8on2yspFTq0PhCplAtnh5mzOe+2iWL0OhGJOB5?=
 =?us-ascii?Q?aUqM51iS2yyfKhctfwWWz2L51OHcuye3lQfliZzt0gVEfL6vF/br8ZkruDD0?=
 =?us-ascii?Q?LKJOPdSw/0Mh36ZTqDT32O/3pxaCeXvT99wAGn7+WlGcAU3hlPzF/GtoTPhA?=
 =?us-ascii?Q?DFo9Kr+FeAz5peXBXVSoABxpzn0w/+7FGbqVPB9M1wjam3X7dSmHuoZ9HOIY?=
 =?us-ascii?Q?t2wPTLTacLmBNaCWSLkHAyDZL+DZbeOyREKXEZSO8yw1c31axIOqt35zAdVg?=
 =?us-ascii?Q?kIURLz0UM9JlfpOL6sj61e/BfF/VmsGOLRVgyhdR8l6XlutQML9dPxl1UsYZ?=
 =?us-ascii?Q?W0xJ0zMnIW7VXvDOF8MWCnl5nakdKzsFFXt4kjbAMjDVTaAZq9wilN0gBvfr?=
 =?us-ascii?Q?0vrTVwZqiLgZV5Gaii37UGmB2u3lFTtH/kIAaQUpcHj7pga4cg+aMbQEhrXM?=
 =?us-ascii?Q?rckVeBxGotKcBum8j0L1Dzbc2LbCLlI/pYv61T5HJLYobkqDnP6/2PQkFKOL?=
 =?us-ascii?Q?3FRtEuS7PYzvTyL91Vk6pge7yyInlRnH8j4pC+kbtLy85B9MAsgDtaqFJBqY?=
 =?us-ascii?Q?8UYDn8wNxNssG38jGDgJBL/ZH7ODU0bcKyqCkQttTC/BG9vsn9rXQ5P3MPbz?=
 =?us-ascii?Q?PdEy8r+4ZZ7pTVwIQAB5XaHvm/gir2m2Ya3/W+rRNxQ6a5cQj0Ze0rFvVt25?=
 =?us-ascii?Q?YdOXauOW/SedHavjP9vu2hCvhJHCBB/w3CLa2fLtu/yth9TS9xJebtIOnaGN?=
 =?us-ascii?Q?j41eMyO95KK8eBrbBDcy3LVGcNLAeK5FNPCkOaOn3FWjBDTqEy6THaOzfq9d?=
 =?us-ascii?Q?wt+9o6DK5JXzk0yY0XeEkOX9sG2FtLp8Cfm/c5gJGqIdWmWqIfbz8Qn7Q/py?=
 =?us-ascii?Q?3LaPhKwo6b3x2oh1wt5FijkfnBGZnfVPYuwUGdNn7Phwep6poFPZ2n/6+dis?=
 =?us-ascii?Q?aXBbFyRWuGCzEuSSFN0QUP3XEC7xaozWWkiTawH303wACUs2LJHVJmEw9XCd?=
 =?us-ascii?Q?LM54V748mnU4fZ+zmLkaHNMM32lOuVkHEykM4XQN+OGzA7F4c/Mfcc80l8sy?=
 =?us-ascii?Q?8eLXztZq0emSUivc4a74wBfitbEbT2L+lYBhG9T/S0YFIumPMJRbONWZQkND?=
 =?us-ascii?Q?VUZj8jR4+Keg8v8kNjo4StcWRAkrHjMx7TLaZ28ZQEu5ugsbNLP3ffkPAGee?=
 =?us-ascii?Q?n9NPNMuglWrpp3S28rjxodWpx/1TQcibQUmSS1NifyQK5LgMSb0eIG6v+qWw?=
 =?us-ascii?Q?EyWF/8rLr9I9nzGgBNFwA6Sf47wqNgfD55/M4Qe8hmbefaPnfLstnw7IJJ+j?=
 =?us-ascii?Q?FWijZl+wFZEeGhGswWHd5UMgP05GOMf3dH3NGCApnVNyVEAETNE/n65kpDWO?=
 =?us-ascii?Q?/HM5GEZX2Gf9bUSQ6YdlkBu26HmJuCg0taRVFNwrImwI/UCNDHNElrahCbBb?=
 =?us-ascii?Q?+0yp+YztTBRptPg7exZKuieZSTfBwpMemoNy1dCLRw0VDc8oUQHp1Guj0Mlb?=
 =?us-ascii?Q?R9mrgnRRtirz1yGTaDEZb67ldeCumq5wzm9/?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:14:42.1096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3defb4-5833-424e-5437-08dda9aab639
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7067
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5MyBTYWx0ZWRfX26p4zhS2/Ekl lS1pSBJtqtpgCKh04uHZCCCMmp2LUYQhTRCAwAbEnsx11Ak2b7lfr54D1oWhFlZqIagKO54jn1C fsiPZ2wj24L8CDH2TXP57OmnAZqKEGef/uEva6XQrjR1I/y2z5/RxRIbY9Ds10YPk3aWV8YAWUe
 OpqdHugUy8sJDqGLF1yBYMtM/7ev3osJK7/RXv0NJqC6uwdqGdIJWBJyFDjo71L7RExaLktUHZ4 S4myGBKp9xCIJ8AXapruR2iGpBs7SS1D9Qd/cZ22/67YGTSBqZHW7GuyM1v/8umTWWyNIXd7EgX Le5VluldXwbVgOVWhqnE+dpcnvir1l9O5/WiAqO3FnOeoDc3xW6Naqev3UgAPMAc69nMqMyugtR
 M7gZ6aHE6IrNHRsO3utSAyX7R3yIpzAoG4bCnFKbR4TtluDBU0kMv9DUdlNCNec1y7EHy3KG
X-Authority-Analysis: v=2.4 cv=coCbk04i c=1 sm=1 tr=0 ts=684ac4b5 cx=c_pps a=3m1OMBc6IzFwloPSslRGSg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=RTUexXcQgHfw-VfQmSkA:9
X-Proofpoint-ORIG-GUID: oA1wC2R6jGhpFvtkOtcFG7y7E_sBvhLK
X-Proofpoint-GUID: oA1wC2R6jGhpFvtkOtcFG7y7E_sBvhLK
X-Proofpoint-Spam-Reason: safe

Change the firmware filename format on SoundWire systems to
directly tie it to the physical amp it applies to. This is mainly
to decouple it from the ALSA prefix strings to avoid complications
when the SoundWire machine driver starts creating dailinks based on
SDCA Disco info instead of hardcoded match tables. It also avoids
errors from having to rename firmware files from a hardware-address
to a ALSA-prefix naming for Linux publication. There are already
published firmware files for the L56 B0 silicon so that has a fallback
scheme for backward compatibility which has been separated into its
own patch on top of the main change.

We'd like to get this into 6.16 so that the L63 support starts "clean"
with this new naming and we don't have to support one kernel version
with L63 using the old naming. Unfortunately we didn't manage to get
these patches through internal review and testing before the merge
window opened.

Richard Fitzgerald (3):
  ASoC: cs35l56: Use SoundWire address as firmware name suffix for new
    silicon
  ASoC: cs35l56: Use SoundWire address as alternate firmware suffix on
    L56 B0
  ASoC: doc: cs35l56: Update to add new SoundWire firmware filename
    suffix

 Documentation/sound/codecs/cs35l56.rst | 13 +++++
 sound/soc/codecs/cs35l56-sdw.c         | 18 ++++---
 sound/soc/codecs/cs35l56.c             | 72 ++++++++++++++++++++++----
 sound/soc/codecs/cs35l56.h             |  3 ++
 sound/soc/codecs/wm_adsp.c             | 27 ++++++----
 sound/soc/codecs/wm_adsp.h             |  2 +
 6 files changed, 109 insertions(+), 26 deletions(-)

-- 
2.43.0

