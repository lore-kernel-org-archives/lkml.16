Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB03933DB;
	Tue, 20 May 2025 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747745296; cv=fail; b=atKQItyf1BRY3QAT7xPahK8OJyrXjEr4Uo9LhnizWBlqAJdlHeX0p/8Xni0ZWP7miRbNcY3SAac6SoKnmbZvfBF4y8cURR4KNoP7WMTDdGDsdwNZwNYRD36Z/GpQLyqPpC2cB4JDOrePm4sz0YOCKi/Yrza5n6MU4Gr9qICl38Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747745296; c=relaxed/simple;
	bh=fDb4qzg9cvpU+VvDVYOsVVaGfikiPOwYgFcXLvJZrjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F2+vkm4YVCebffHlHRATNerb7jv+3jrJRHRDEfnHfG4q5C0uWplBhKEo2d9Gozg+hKI34Fo0SVMi9GQadhU4JY5F6webr9PhG7cXSaEMvbihJyLuoB+Korg810uSle70nOR7JcO8SKp6w7Sfsngwvbhi3wH/m2yef31oUY64pA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cYR78wPX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=G7bmxmzO; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cYR78wPX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="G7bmxmzO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K58iwp016172;
	Tue, 20 May 2025 07:48:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=70FtuWhFIwAMsblM
	3sqMLZ6WGE+yMLnEwIzU/rh5aGk=; b=cYR78wPXT70UsXFwu9MSJKY9ulQjj7+8
	k6VPqT95A6kYNUdjB7qlCw5MllSWg+BJP9pU/jme2li5xkbaC7n0lazTerZtBU6Z
	PAuF6VtCC9awPj3soajB/zKc1F6H/zj5ZiJq2pLNbhCAZJ0inWPsqu2GQMJwVm3U
	D2v4CMDFxiFcjejI+5F9VirUti0yD4GFi5jrZCz6W7DW1eTW1QdMDaPNeKzPXRb4
	ab1Yt+zcTOm3km23PU7P9rXiCMLI/zqoVdreiod0y4JpOrs9/dOqUkRh4yH9wg6S
	4ttWX/HHKz4Uyi3JrjKhWbz66YeW4Ch6h54aiHBWSuRZx8+EwtJtMg==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46qcrwb5uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 07:48:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xz/g4rmZ8jlKi3jH5VDh/QmVaY85/300ttP1oA5nq0BDU6OWhyLj/Jv398soB+g39iPltckNrYj2Vhl7tE3ThzlM+gCiZDHTcHrB6T2Yac6twvhisVOJ2+NcwaNfxWY8zkF+dpyiuxXNrLxg+CRxFb1GrvrhBtggnj45M2/dVYvL6ZfRbMb0I0Bf44MtroP/mCdDYErYL+EGJbufKgIIT7t669ryuX/uG3oFO8pAw9K1YXdRCy0a81vtA5O30sB+5s8fgSGX9XS48+W6f5VOKboQjuXug8MI5g93UiqJQqCo71n1gs2DTQwtsQSq1deVviIEqPPBfOMJ3ln5/8WCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70FtuWhFIwAMsblM3sqMLZ6WGE+yMLnEwIzU/rh5aGk=;
 b=bqKgTV+UO80kIsnb29ZGKSPdt99+hsvjmshFjov7FGE0Dt3RrXYkHytXLD8VOaR9oxbk/4OEihvb0YBcyc98cgzYjRuA9Ff2EbpdGG3EH2X8zXIXremp8t6St0p1GGGaP7G2NwNLyQoulsCOkeXik/z+FRtBUMj6bOSrqBca5K3IuNeOuG4ulR9lU5VZe9IceB3vGhPIOWJ/AZFzKbgdCXq+rJbVhEgP9X29dr3HremqU6Gl4JcY2uhNwCS9c6hijOi7drurk5+BAF8jasBDG/CF7wcj7DuMI5oaokUFDBPwKjbJIG53FPNfsUGn/KHBZA94+BjQmBu0Q9W4WHx6Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70FtuWhFIwAMsblM3sqMLZ6WGE+yMLnEwIzU/rh5aGk=;
 b=G7bmxmzOlUGqe4ZwB7rZIjDHhs2Lgh7shRYKCdZ10Ac3qGSAgbHZ7GtzYRXM9msYb8BFgE3HWB4zkqVUSSGldUePOsXz3nBkey+0S1sjmlCdk4bqZj5SB+VjCE1CIg6AlUMgm2IGY68ao8ttI5ga/tDAgfhXSkUBCC8nMQK7Hjg=
Received: from PH8PR22CA0022.namprd22.prod.outlook.com (2603:10b6:510:2d1::17)
 by DS1PR19MB8580.namprd19.prod.outlook.com (2603:10b6:8:1df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Tue, 20 May
 2025 12:48:03 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::81) by PH8PR22CA0022.outlook.office365.com
 (2603:10b6:510:2d1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.32 via Frontend Transport; Tue,
 20 May 2025 12:48:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 20 May 2025 12:48:02 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 21A3E406540;
	Tue, 20 May 2025 12:48:01 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D675D820248;
	Tue, 20 May 2025 12:48:00 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ALSA: hda/realtek: Add support for HP Agusta using CS35L41 HDA
Date: Tue, 20 May 2025 13:47:43 +0100
Message-ID: <20250520124757.12597-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DS1PR19MB8580:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5388b69e-a8d4-4a41-df31-08dd979c8f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Suuw/czUnCLfTNxK29GyQK6sMFWmFmsVeFdZz/kcRTUYErO7GvmBebQl35R?=
 =?us-ascii?Q?0BlKduc5EBtFa914cq2ZNrhHDmrIN+JMlvZZHmOQxcBHg9JpIQ15Ns8ngGwF?=
 =?us-ascii?Q?+lP8cHxYvAvDunP7BXry2HBg2YJiaav3IUP741tSMbCaVKA6t8SEB5Z3SVLm?=
 =?us-ascii?Q?ADME4fgM7VYnwyAN5Dy6QG2Hmikoll/wYjk1A2ee2VXG9xA5H4vsHh9UKb+M?=
 =?us-ascii?Q?3N/T9L2VqNguqnwdnmGjNjHmYbURVxzekN/tzWslz4O+6xDDrY2XSiWeNN9g?=
 =?us-ascii?Q?0wrJBeefXeBQNlPAzN0ejhrmPQY2K1uiUAJJ/ldXKnwi1pMDSBKuJwNwfAxe?=
 =?us-ascii?Q?/xlS/aX7dU10FaRytTcSLgpPrgh/ZnGZ4UxC/eO6/0YgLjRxiABc/tNDOzkL?=
 =?us-ascii?Q?qD0a46j0y4ujVK/cLQ6MTfuPvugMlT1cMHaMbOA8w3zKsy3ieaH/GUe0koOE?=
 =?us-ascii?Q?HoBz75Nt2llvjl/FeZD20RdNZWUFSKOgdg29PIxXFoN856lmnJlVy4p6VgLG?=
 =?us-ascii?Q?CdZ2u8SJqCaR6y2c+U1401QbWegtvmHux8WCVuZ0W17z4PxXDREeiV3qupKp?=
 =?us-ascii?Q?IvtC9vK45j8iEHhNejMe9U8HVoiaocbsPxpZ+TdxjtpN84TlklF1WnbSJZZg?=
 =?us-ascii?Q?5H6TsfBSizj+NmW5a9G2a/hyigCBrcU9zXvs9ZJhLHcA41MjodxYBtg/2mV3?=
 =?us-ascii?Q?AX8u3FhosG6DGtkFf19YVqtA3AqB6NgfTnb3dqfif24A2CkBkO8M71st0wbg?=
 =?us-ascii?Q?LYLyVz/BbVkOUHNt7j57+rys5fvQus+4pktImrqSOvd/KgH8XDB2Q0u9xQEX?=
 =?us-ascii?Q?W2zJ6FKMZd0FauZoSiBzXkt9yaTGMvW4WGHar0Sv2hCGTPRqoal9EbCj9TMb?=
 =?us-ascii?Q?nKtFNW/1cHZBtuiP3JRqS8UjehsnjUYGiHvJkv39X+Ydh34Sf2OknY4JKouY?=
 =?us-ascii?Q?w93EjH0ggqY9tllwfyZrf6pw1wcXa6gMrgy2AI5BgsK3awikKaRmMkLloY14?=
 =?us-ascii?Q?B76dBPS0UERX6UOXvWCst8bJRu5pjeFBcxnMLqmv+sh498yH2M5ox4oWeBnJ?=
 =?us-ascii?Q?a9mIDL1Jv26m+KEP1n3sNSzAlxcYZfNg4YFvMvbJrZ7T9RE8VBHwUyETHQor?=
 =?us-ascii?Q?lfooojvAL94/6MDWDA9NBPSme9dKIdeSX8/CSK/saSeP82LB8xj453CFyFjw?=
 =?us-ascii?Q?JJOnc8jXclBKIMANrWF1eJ7iT/QvMUEJOLbM2ZW4JOuETxkFS32nkij4b6Nn?=
 =?us-ascii?Q?cq6or7qDNSfv7FZutqcKaf3G0Thwbs1Fj9UeafUK/qysJ+WbBb7fVJbp0GQL?=
 =?us-ascii?Q?ujgJR0KKDRILhed2T2ZW6mcjpQm+1VjAZ4L/L3kwuxOfFdvNkLx3AcWMDsaP?=
 =?us-ascii?Q?1rFl1FP2Tv08ARo8DFfgd4bdzGQysQJn1sBDrIWmd/seQPYO/b5peys6n/DZ?=
 =?us-ascii?Q?X09B+HJGIIQfhLo7134lYaBkAPjUPCnGSDkGv6W6y24DR1F/mvjs2QWK0ULG?=
 =?us-ascii?Q?cQvYwV+uOp0PGtJULmtsQqMJBZ+bzE+6LTD9?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 12:48:02.5628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5388b69e-a8d4-4a41-df31-08dd979c8f22
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR19MB8580
X-Authority-Analysis: v=2.4 cv=dd+A3WXe c=1 sm=1 tr=0 ts=682c7a06 cx=c_pps a=e6lK8rWizvdfspXvJDLByw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=JoyzMJ97GOddnGb-qsEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEwMyBTYWx0ZWRfX+QUgu+z4F458 c3cNgCAkFs/4Xf855Y4wjnCpBcOV4je9WVTfV0Y7EF+wFOlQyPeuicMgu5xo7AufkIPk2M+b4kj mm/DGtICMZpz7zO910tV6rkn2QU1fyU2e7r/DCD2SrdeIIJBjUXyHteKiwCt6ZnJ8QNJ3yWDQ2u
 rMj4VpfNaDzj0JaEr79gqqQRsVmUWjYVETl7efBntQgkFdP2bnx1MaLfslnnDTyjctO1rr4Rw1D sK31YAJC1fI9gVSR5nZD+eM2Fw3sLViO5rsMBcz7wx/EABuK9+TSSV1fwy00ozmLYsumnLJEZGG 5bOt8VUoqDH11nNksfh9lke18GAE4wsMn5PYJfJHMm/oPfyicNdvqy9jx/t3lBCyJy8ZIAiUeOZ
 mUWOY+vISmnXj3yrzpjRxaNusSsP4Oq78muv9JOloKA4C2qK4CSHIHYNUCtMPxPiflQZ+lig
X-Proofpoint-GUID: lIeZW2EXy2Dd1hj_9ZdvGwpJtYbYoWeg
X-Proofpoint-ORIG-GUID: lIeZW2EXy2Dd1hj_9ZdvGwpJtYbYoWeg
X-Proofpoint-Spam-Reason: safe

Add support for HP Agusta.

Laptops use 2 CS35L41 Amps with HDA, using Internal boost, with I2C

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ba06b067cf4d..6a3e7e8ff880 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10895,6 +10895,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e2c, "HP EliteBook 16 G12", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e36, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e3a, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.43.0

