Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28732A93D;
	Thu, 24 Apr 2025 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745518354; cv=fail; b=sJKzD36PquOcizX5wPP3XLu2WsZtSJmj7kNwkIWr+I1vB+5iXH0e/CmEnfWvJvbnSCoht9f4OpWCQfYjzrlA6VX6nqqz/3e706ayNMrCmAihWLBA4oT837hWLS1x2XfCOTwOihBKQqMk7CVv0c8Qj5icpwNU+kxNP2Utc2G214w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745518354; c=relaxed/simple;
	bh=OFNfbZTUjot1guNXmhV6pyCzHc3XfzqoADVBIrMxkog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a4U6kEakppSaov55kltQ4kaZqWNOV81zU19pz9YpDcRVF6XbTLmzEaKaULUPlOeSo2ZWEm7o2+WvJou6/rf4cgFqKDuzcTWfy8d+tlVHKT4nxnwpzquAu5JgEO7JFvkKXB736uZ4mWCMXF++N2V0tNl1k41s1OnGgBEoWozReA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CxlrMads; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SHD5K511; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CxlrMads";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SHD5K511"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OEwO4B026118;
	Thu, 24 Apr 2025 13:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=LZ1OmBlfNJII8Ux8
	pCo2E4GZU1oAsR8e8gcT0z8BfFI=; b=CxlrMadsSpVf6o0v70Ot/AsnKZAuPQZ+
	MwnUuXUyuYwsmHQA0skMcfdpdjBU3oplmlNowWluZmfEm5Js1XjRKgS3MG8Nhfxn
	fpY00wcd50XvE0XBxMrxT65Jt7F36ZoqBBmhjGT1PQI6tx6eA7Bo9vcDX7WyEf0A
	/wh06aJiVnj6N2wStlJKCIPe0rrbbPLVk+CbUiYNtIHkpoVn5cXTb6sQLIBFD/qq
	9FcKdYBKBWjfHQKY00w3ErubRSQ7zn8EO49tNDNrlG2nmerYH0rEvntQOxkGIMKk
	kE8jCYnyzsp3XbwWyCcEE414WpiliKGJ3m5NL17yv/AmUFt+DW37sQ==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 466jjx35wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 13:12:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yErilVHU+IQBwFKLb1hUzhxNRPHUC+EBcuFpId3gEObSVCztoxE69uwMUI1M2JlNtJ67qc0eaRYHFalTh8svV22Jc5DfOi+5vhgwbu4WRfQUvvzcbNpbFR/XRd9khgu7CbdqGQNa+GUhU6E/TCDwJt4GR1gHyHVcg8jkgGFeEYnfhavuZQhc+isj9hUiudYVyurT8Ewllz4ymtq3ateRgU7OuQs8SdjTwiRFrCFQPmjhIZ0WZH75O1Uc5V0iAr0z+q+zvxVGmBjdwXBVQVOaSTFeeBKEjvMhhzKO9Cm4cfife7o4G5I+H6/lEdW5Q222rB3lexEYylATZ9jLM+uxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZ1OmBlfNJII8Ux8pCo2E4GZU1oAsR8e8gcT0z8BfFI=;
 b=ZR/66gV0Gr9TpthUmhKcSO5Em+J0X2x6LucfXjIjRy+Viw7k9kZmBaEVtju1ZJkHIUqrcjpliFO4zbrFV5Hgl+PNLV37g6mFhAQcnkytxkrAa/+zNsdp78J2vs7Im5T70dLCadcw0od/mDytuNGJcB0Kd7b7reyhWksd2fqMRHdT1lUUrN0ku3VGvfRlM4sUD2ux6umMNRK/MDDD0rQEa2XUW48xLazni/yte404xsUeIT+NNfW3ulM28GB4r/KzXCkZd7mvhUeHVpqdwF5xibbDzQbH/j6HcYG8etzspj/Aqlur2iX/vnFJeqdxOZZQhp8xJUShF10uR0Shp9VVSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZ1OmBlfNJII8Ux8pCo2E4GZU1oAsR8e8gcT0z8BfFI=;
 b=SHD5K511wJnte8tIyhy1zn1mGMUTpJBk6f2XhxDfG9CiZTiXoVOKi9zg8i3cEPd58CyHMIey+lfpBOB9z+v51sD7j+ezlDfENEbzpiVBNc7VswiJVr1xe9j03AP3zB58c7C07GFbw5uzVNiKyq402QMgCa4AyDhuXT8tdySjw7g=
Received: from BN9PR03CA0251.namprd03.prod.outlook.com (2603:10b6:408:ff::16)
 by SA6PR19MB8552.namprd19.prod.outlook.com (2603:10b6:806:413::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Thu, 24 Apr
 2025 18:12:22 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:ff:cafe::bf) by BN9PR03CA0251.outlook.office365.com
 (2603:10b6:408:ff::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Thu,
 24 Apr 2025 18:12:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.1
 via Frontend Transport; Thu, 24 Apr 2025 18:12:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D5C11406543;
	Thu, 24 Apr 2025 18:12:19 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 13EB8820259;
	Thu, 24 Apr 2025 18:12:19 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda/hda_cs_dsp_ctl: Delete hda_cs_dsp_ctl module
Date: Thu, 24 Apr 2025 19:12:14 +0100
Message-ID: <20250424181214.66759-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|SA6PR19MB8552:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 41e91786-a116-4d81-b904-08dd835b8e92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dz0bBr9ccX75IJMT6apq9OvIZjU3pZubmSIHvYLXYKDxPFA8wmbHHhUjAP6U?=
 =?us-ascii?Q?QW1QUTEG/ckMG9xIa/jTwOX89whn5TNQdACNUZCzRa9N5SxbZ3mtJqAyd6ac?=
 =?us-ascii?Q?em1rfc5rMC0Kq87y2xLar4ftUmohBmUicviKxB0Y8wss2KwuB4V/cP7Y7yWo?=
 =?us-ascii?Q?hIgR5Tgo39aw6q2KSUiLRk2CqX9outIn2ZAPJzV9TnBCLvg801I9+2NcAECz?=
 =?us-ascii?Q?Dgv+lAIfmlPTprxxSTNnOdyJPjKsmhVHVwpPHRUOaUAdJ7OlRpJ+I7NcLK1v?=
 =?us-ascii?Q?Z38jUkFQRA5g1Y12ds8bKCQTqTzsm4gQTakCmgfV/JAGa1bVtOzF9jqSbLhd?=
 =?us-ascii?Q?Dj5fqx4fkNHwWZOcgVOkjr/T+IPhOCYHzURBt/3mHz45OtS6Su1PmAnMdJeT?=
 =?us-ascii?Q?ikt09MBUaXVjHXYGrsIkzqLLU+LTEHku24hpQ4aw8xnD4e8xcbWBWx8o+TG9?=
 =?us-ascii?Q?cwSKxBjJSUlZPcJ/vImIM9w+vXj8PG838jQvSZsmrjH4pJ1vvx2hgYPCedEx?=
 =?us-ascii?Q?NNL2rp0e3eCdM39Ex+ZVirboZTO2gtkNUIKRoc3E+Mz2TFDJmND+FQbVHjIb?=
 =?us-ascii?Q?unCf+El2lVgn4hXnyBjhhomtIm9svWrxKxaumYn3Zp6d3fOgAYmyTJTDU/2Q?=
 =?us-ascii?Q?3Fn8TxyGtophs0qpXAlP1Q9hK2QchHKWkfOZvQsNqyeK+l/irJ3cGwWKZStL?=
 =?us-ascii?Q?VQiYH6pJc+WitprtVLVJGUXMaHw2hLi80JzLR5CPNU47S5NlgSLIHOfdzt4g?=
 =?us-ascii?Q?Wt7NzOGP03XttFNhaXGnp944gvzoL145iUk+j5Nsc8V1zgqVGdVoN3Tt8f4f?=
 =?us-ascii?Q?oDCX55GQYI4isU2BMav8bKcAptfZrxj1PvyFu+zFhAPapq2mTpa3tHFtFxyD?=
 =?us-ascii?Q?JyxcV5GctmXUmreu0zsrZczRbYcERCsIrXTfQ6J0PgU1ayZE4OKgbARKylUa?=
 =?us-ascii?Q?dIb/ie+6+pYXB//44G+0KYVHcJfEh8UkhF5V24isWcc/5UxWvFl9Vx4GiBAG?=
 =?us-ascii?Q?VMaHEiV/vlx+9McOcvMgzzzDvtl5K+m98CuOgh5RQB57eJ3m2biyYnHb4RlF?=
 =?us-ascii?Q?cRUBxjfd77xlwJ/tB9xNlwQRjRGM+Y4OBlQBNk5UesW8uCdppPbtQBSiWYiw?=
 =?us-ascii?Q?qhiPGlzwdz1KhcIyMSLvhVfsWujrl717ZyWKWt+mnHfzCpLa9ly+QmmOglv0?=
 =?us-ascii?Q?brE183UTiJxnZr/Oe9JYlilODcR9YeukB/huSuRY7m5lG2SHy9E50SrYJieP?=
 =?us-ascii?Q?C0z2tpjTrH7HelbqevzIrl9A64TGo9IZBXs3ORcPrpbz6JaAk1bFVpFapCd3?=
 =?us-ascii?Q?G9EJgagoUw3IqLnaIFIwRSpkMuGlJnUfFJDWWSWG5pEydnF1AW1pK9iuLsI3?=
 =?us-ascii?Q?xSDaQt+13/rwzBBaoxaiclPCnq/ZyjEc/r9lWlBsMm4s20/NrLx35lDIf5uw?=
 =?us-ascii?Q?FVfPEabTrWvn7cHQHJr4gotfaTbMED58NwVJoOqKBCHIUhlLWo62akMJmOzI?=
 =?us-ascii?Q?5ZpReBKxTbN6Zjg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 18:12:21.1568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e91786-a116-4d81-b904-08dd835b8e92
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8552
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEyNiBTYWx0ZWRfX947eMhCLjnVv /6JUFpr6RHRbQtZG85wcDqBYnWgzAJgHgaQ8uISjglKYqNYd2EC4beQAn+m/aJZe/g7YvcBZVVX fLTExiohKBQ76D0l2kBIjR5iair52SNfX00xyu0guzsuwe0+24lR52KV+uV3Ev7/Nnv8cxWa1o3
 mto9x/lRihOsTKWhy5jgS+DZjHu3minS3MhhFE7yNTt1/jOkGIvHufHPl2gFgN/dgPGU7yvXjxu AoH1/1lnZq+VKouALQFwwui2a8FuYTZlKGHnQmnB7F8RzYlDTFDCB6WxPUMhceHnXyh7URbycR3 zux+VedOeVsJFV7fTd7iiytoQnihQs/sxOTego4oUc0d1q2TjWxYJmINZiDk8n9o1qVsae0pTQj
 t4ylQDr6gFGv+3SrwkcIP48VxMGIDrASF4EwSy4dAFEPO5nLF2GSYh0+fMNozFvstl4Br1Br
X-Proofpoint-ORIG-GUID: b_IR0bP7qzhuWjAVWvNj-NEIiXm2SRYC
X-Proofpoint-GUID: b_IR0bP7qzhuWjAVWvNj-NEIiXm2SRYC
X-Authority-Analysis: v=2.4 cv=ItMecK/g c=1 sm=1 tr=0 ts=680a7f0d cx=c_pps a=QfxD4CzqCnNUzUqh5S/TIg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=37WaZy3xAAAA:8 a=bpSfgQBeXsjtB3cXUi4A:9 a=dQiYwBbFfX7579P9:21 a=Md2Egg9iYL5VW4Fs6MM-:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

Delete the hda_cs_dsp module and move the one array and one function
that is used by the cs35l41_hda driver into that driver.

The cs35l41 and cs35l56 drivers stopped creating ALSA controls to
wrap firmware controls. The reasons are explained in:

commit 312c04cee408 ("ALSA: hda: cs35l41: Stop creating ALSA Controls
for firmware coefficients")

and

commit 34e1b1bb7324 ("ALSA: hda: cs35l56: Stop creating ALSA controls
for firmware coefficients")

The cs35l56_hda driver now doesn't use hda_cs_dsp_ctl at all. The
cs35l41_hda driver only uses the small array of firmware names and the
function to read a control value. All other functions and data in
hda_cs_dsp_ctl are unused. There is no need to keep a separate module
for such a small amount of data and code that is only used by one driver,
so remove the whole module.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 MAINTAINERS                    |   1 -
 sound/pci/hda/Kconfig          |   8 --
 sound/pci/hda/Makefile         |   2 -
 sound/pci/hda/cs35l41_hda.c    |  51 +++++--
 sound/pci/hda/cs35l56_hda.c    |   2 -
 sound/pci/hda/hda_cs_dsp_ctl.c | 249 ---------------------------------
 sound/pci/hda/hda_cs_dsp_ctl.h |  39 ------
 7 files changed, 38 insertions(+), 314 deletions(-)
 delete mode 100644 sound/pci/hda/hda_cs_dsp_ctl.c
 delete mode 100644 sound/pci/hda/hda_cs_dsp_ctl.h

diff --git a/MAINTAINERS b/MAINTAINERS
index f9a9d3dced67..d4886d4f77c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5647,7 +5647,6 @@ F:	include/sound/cs*
 F:	sound/pci/hda/cirrus*
 F:	sound/pci/hda/cs*
 F:	sound/pci/hda/hda_component*
-F:	sound/pci/hda/hda_cs_dsp_ctl.*
 F:	sound/soc/codecs/cs*
 
 CIRRUS LOGIC HAPTIC DRIVERS
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 9c427270ff4f..15cc46032583 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -110,10 +110,6 @@ config SND_HDA_SCODEC_CS35L41
 	select SND_HDA_GENERIC
 	select REGMAP_IRQ
 
-config SND_HDA_CS_DSP_CONTROLS
-	tristate
-	select FW_CS_DSP
-
 config SND_HDA_SCODEC_COMPONENT
 	tristate
 
@@ -125,7 +121,6 @@ config SND_HDA_SCODEC_CS35L41_I2C
 	depends on SND_SOC
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
-	select SND_HDA_CS_DSP_CONTROLS
 	select SND_SOC_CS_AMP_LIB
 	help
 	  Say Y or M here to include CS35L41 I2C HD-audio side codec support
@@ -142,7 +137,6 @@ config SND_HDA_SCODEC_CS35L41_SPI
 	depends on SND_SOC
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
-	select SND_HDA_CS_DSP_CONTROLS
 	select SND_SOC_CS_AMP_LIB
 	help
 	  Say Y or M here to include CS35L41 SPI HD-audio side codec support
@@ -165,7 +159,6 @@ config SND_HDA_SCODEC_CS35L56_I2C
 	select SND_SOC_CS35L56_SHARED
 	select SND_HDA_SCODEC_CS35L56
 	select SND_HDA_CIRRUS_SCODEC
-	select SND_HDA_CS_DSP_CONTROLS
 	select SND_SOC_CS_AMP_LIB
 	help
 	  Say Y or M here to include CS35L56 amplifier support with
@@ -182,7 +175,6 @@ config SND_HDA_SCODEC_CS35L56_SPI
 	select SND_SOC_CS35L56_SHARED
 	select SND_HDA_SCODEC_CS35L56
 	select SND_HDA_CIRRUS_SCODEC
-	select SND_HDA_CS_DSP_CONTROLS
 	select SND_SOC_CS_AMP_LIB
 	help
 	  Say Y or M here to include CS35L56 amplifier support with
diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
index 210c406dfbc5..2953def7db67 100644
--- a/sound/pci/hda/Makefile
+++ b/sound/pci/hda/Makefile
@@ -37,7 +37,6 @@ snd-hda-scodec-cs35l41-spi-y :=	cs35l41_hda_spi.o
 snd-hda-scodec-cs35l56-y :=	cs35l56_hda.o
 snd-hda-scodec-cs35l56-i2c-y :=	cs35l56_hda_i2c.o
 snd-hda-scodec-cs35l56-spi-y :=	cs35l56_hda_spi.o
-snd-hda-cs-dsp-ctls-y :=	hda_cs_dsp_ctl.o
 snd-hda-scodec-component-y :=	hda_component.o
 snd-hda-scodec-tas2781-i2c-y :=	tas2781_hda_i2c.o
 snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o tas2781_spi_fwlib.o
@@ -70,7 +69,6 @@ obj-$(CONFIG_SND_HDA_SCODEC_CS35L41_SPI) += snd-hda-scodec-cs35l41-spi.o
 obj-$(CONFIG_SND_HDA_SCODEC_CS35L56) += snd-hda-scodec-cs35l56.o
 obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_I2C) += snd-hda-scodec-cs35l56-i2c.o
 obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_SPI) += snd-hda-scodec-cs35l56-spi.o
-obj-$(CONFIG_SND_HDA_CS_DSP_CONTROLS) += snd-hda-cs-dsp-ctls.o
 obj-$(CONFIG_SND_HDA_SCODEC_COMPONENT) += snd-hda-scodec-component.o
 obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_I2C) += snd-hda-scodec-tas2781-i2c.o
 obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 5dc021976c79..d9c8872b1866 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -20,7 +20,6 @@
 #include "hda_generic.h"
 #include "hda_component.h"
 #include "cs35l41_hda.h"
-#include "hda_cs_dsp_ctl.h"
 #include "cs35l41_hda_property.h"
 
 #define CS35L41_PART "cs35l41"
@@ -74,6 +73,21 @@ static const struct cirrus_amp_cal_controls cs35l41_calibration_controls = {
 	.checksum =	CAL_CHECKSUM_DSP_CTL_NAME,
 };
 
+enum cs35l41_hda_fw_id {
+	CS35L41_HDA_FW_SPK_PROT,
+	CS35L41_HDA_FW_SPK_CALI,
+	CS35L41_HDA_FW_SPK_DIAG,
+	CS35L41_HDA_FW_MISC,
+	CS35L41_HDA_NUM_FW
+};
+
+static const char * const cs35l41_hda_fw_ids[CS35L41_HDA_NUM_FW] = {
+	[CS35L41_HDA_FW_SPK_PROT] = "spk-prot",
+	[CS35L41_HDA_FW_SPK_CALI] = "spk-cali",
+	[CS35L41_HDA_FW_SPK_DIAG] = "spk-diag",
+	[CS35L41_HDA_FW_MISC] =     "misc",
+};
+
 static bool firmware_autostart = 1;
 module_param(firmware_autostart, bool, 0444);
 MODULE_PARM_DESC(firmware_autostart, "Allow automatic firmware download on boot"
@@ -169,23 +183,23 @@ static int cs35l41_request_firmware_file(struct cs35l41_hda *cs35l41,
 
 	if (spkid > -1 && ssid && amp_name)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-spkid%d-%s.%s", CS35L41_PART,
-				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
+				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
 				      ssid, spkid, amp_name, filetype);
 	else if (spkid > -1 && ssid)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-spkid%d.%s", CS35L41_PART,
-				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
+				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
 				      ssid, spkid, filetype);
 	else if (ssid && amp_name)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s-%s.%s", CS35L41_PART,
-				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
+				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
 				      ssid, amp_name, filetype);
 	else if (ssid)
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s-%s.%s", CS35L41_PART,
-				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
+				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
 				      ssid, filetype);
 	else
 		*filename = kasprintf(GFP_KERNEL, "cirrus/%s-%s-%s.%s", CS35L41_PART,
-				      dsp_name, hda_cs_dsp_fw_ids[cs35l41->firmware_type],
+				      dsp_name, cs35l41_hda_fw_ids[cs35l41->firmware_type],
 				      filetype);
 
 	if (*filename == NULL)
@@ -588,7 +602,7 @@ static int cs35l41_init_dsp(struct cs35l41_hda *cs35l41)
 	}
 
 	ret = cs_dsp_power_up(dsp, wmfw_firmware, wmfw_filename, coeff_firmware, coeff_filename,
-			      hda_cs_dsp_fw_ids[cs35l41->firmware_type]);
+			      cs35l41_hda_fw_ids[cs35l41->firmware_type]);
 	if (ret)
 		goto err;
 
@@ -1108,6 +1122,18 @@ static int cs35l41_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int cs35l41_hda_read_ctl(struct cs_dsp *dsp, const char *name, int type,
+				unsigned int alg, void *buf, size_t len)
+{
+	int ret;
+
+	mutex_lock(&dsp->pwr_lock);
+	ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(dsp, name, type, alg), 0, buf, len);
+	mutex_unlock(&dsp->pwr_lock);
+
+	return ret;
+}
+
 static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 {
 	unsigned int fw_status;
@@ -1137,7 +1163,7 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 		goto clean_dsp;
 	}
 
-	ret = read_poll_timeout(hda_cs_dsp_read_ctl, ret,
+	ret = read_poll_timeout(cs35l41_hda_read_ctl, ret,
 				be32_to_cpu(halo_sts) == HALO_STATE_CODE_RUN,
 				1000, 15000, false, &cs35l41->cs_dsp, HALO_STATE_DSP_CTL_NAME,
 				HALO_STATE_DSP_CTL_TYPE, HALO_STATE_DSP_CTL_ALG,
@@ -1174,7 +1200,7 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 	}
 
 	dev_info(cs35l41->dev, "Firmware Loaded - Type: %s, Gain: %d\n",
-		 hda_cs_dsp_fw_ids[cs35l41->firmware_type], cs35l41->tuning_gain);
+		 cs35l41_hda_fw_ids[cs35l41->firmware_type], cs35l41->tuning_gain);
 
 	return 0;
 
@@ -1276,7 +1302,7 @@ static int cs35l41_fw_type_ctl_put(struct snd_kcontrol *kcontrol,
 {
 	struct cs35l41_hda *cs35l41 = snd_kcontrol_chip(kcontrol);
 
-	if (ucontrol->value.enumerated.item[0] < HDA_CS_DSP_NUM_FW) {
+	if (ucontrol->value.enumerated.item[0] < CS35L41_HDA_NUM_FW) {
 		if (cs35l41->firmware_type != ucontrol->value.enumerated.item[0]) {
 			cs35l41->firmware_type = ucontrol->value.enumerated.item[0];
 			return 1;
@@ -1290,7 +1316,7 @@ static int cs35l41_fw_type_ctl_put(struct snd_kcontrol *kcontrol,
 
 static int cs35l41_fw_type_ctl_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
 {
-	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(hda_cs_dsp_fw_ids), hda_cs_dsp_fw_ids);
+	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(cs35l41_hda_fw_ids), cs35l41_hda_fw_ids);
 }
 
 static int cs35l41_create_controls(struct cs35l41_hda *cs35l41)
@@ -1430,7 +1456,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
 
-	cs35l41->firmware_type = HDA_CS_DSP_FW_SPK_PROT;
+	cs35l41->firmware_type = CS35L41_HDA_FW_SPK_PROT;
 
 	if (firmware_autostart) {
 		dev_dbg(cs35l41->dev, "Firmware Autostart.\n");
@@ -2055,7 +2081,6 @@ const struct dev_pm_ops cs35l41_hda_pm_ops = {
 EXPORT_SYMBOL_NS_GPL(cs35l41_hda_pm_ops, "SND_HDA_SCODEC_CS35L41");
 
 MODULE_DESCRIPTION("CS35L41 HDA Driver");
-MODULE_IMPORT_NS("SND_HDA_CS_DSP_CONTROLS");
 MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 235d22049aa9..6f8feac8c012 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -20,7 +20,6 @@
 #include "cirrus_scodec.h"
 #include "cs35l56_hda.h"
 #include "hda_component.h"
-#include "hda_cs_dsp_ctl.h"
 #include "hda_generic.h"
 
  /*
@@ -1118,7 +1117,6 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_hda_pm_ops, "SND_HDA_SCODEC_CS35L56");
 MODULE_DESCRIPTION("CS35L56 HDA Driver");
 MODULE_IMPORT_NS("FW_CS_DSP");
 MODULE_IMPORT_NS("SND_HDA_CIRRUS_SCODEC");
-MODULE_IMPORT_NS("SND_HDA_CS_DSP_CONTROLS");
 MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
 MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
deleted file mode 100644
index 18fa6e7edb49..000000000000
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ /dev/null
@@ -1,249 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-//
-// HDA DSP ALSA Control Driver
-//
-// Copyright 2022 Cirrus Logic, Inc.
-//
-// Author: Stefan Binding <sbinding@opensource.cirrus.com>
-
-#include <linux/module.h>
-#include <sound/soc.h>
-#include <linux/cleanup.h>
-#include <linux/firmware/cirrus/cs_dsp.h>
-#include <linux/firmware/cirrus/wmfw.h>
-#include "hda_cs_dsp_ctl.h"
-
-#define ADSP_MAX_STD_CTRL_SIZE               512
-
-struct hda_cs_dsp_coeff_ctl {
-	struct cs_dsp_coeff_ctl *cs_ctl;
-	struct snd_card *card;
-	struct snd_kcontrol *kctl;
-};
-
-static const char * const hda_cs_dsp_fw_text[HDA_CS_DSP_NUM_FW] = {
-	[HDA_CS_DSP_FW_SPK_PROT] = "Prot",
-	[HDA_CS_DSP_FW_SPK_CALI] = "Cali",
-	[HDA_CS_DSP_FW_SPK_DIAG] = "Diag",
-	[HDA_CS_DSP_FW_MISC] =     "Misc",
-};
-
-const char * const hda_cs_dsp_fw_ids[HDA_CS_DSP_NUM_FW] = {
-	[HDA_CS_DSP_FW_SPK_PROT] = "spk-prot",
-	[HDA_CS_DSP_FW_SPK_CALI] = "spk-cali",
-	[HDA_CS_DSP_FW_SPK_DIAG] = "spk-diag",
-	[HDA_CS_DSP_FW_MISC] =     "misc",
-};
-EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_fw_ids, "SND_HDA_CS_DSP_CONTROLS");
-
-static int hda_cs_dsp_coeff_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
-{
-	struct hda_cs_dsp_coeff_ctl *ctl = (struct hda_cs_dsp_coeff_ctl *)snd_kcontrol_chip(kctl);
-	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
-
-	uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
-	uinfo->count = cs_ctl->len;
-
-	return 0;
-}
-
-static int hda_cs_dsp_coeff_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
-{
-	struct hda_cs_dsp_coeff_ctl *ctl = (struct hda_cs_dsp_coeff_ctl *)snd_kcontrol_chip(kctl);
-	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
-	char *p = ucontrol->value.bytes.data;
-
-	return cs_dsp_coeff_lock_and_write_ctrl(cs_ctl, 0, p, cs_ctl->len);
-}
-
-static int hda_cs_dsp_coeff_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
-{
-	struct hda_cs_dsp_coeff_ctl *ctl = (struct hda_cs_dsp_coeff_ctl *)snd_kcontrol_chip(kctl);
-	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
-	char *p = ucontrol->value.bytes.data;
-
-	return cs_dsp_coeff_lock_and_read_ctrl(cs_ctl, 0, p, cs_ctl->len);
-}
-
-static unsigned int wmfw_convert_flags(unsigned int in)
-{
-	unsigned int out, rd, wr, vol;
-
-	rd = SNDRV_CTL_ELEM_ACCESS_READ;
-	wr = SNDRV_CTL_ELEM_ACCESS_WRITE;
-	vol = SNDRV_CTL_ELEM_ACCESS_VOLATILE;
-
-	out = 0;
-
-	if (in) {
-		out |= rd;
-		if (in & WMFW_CTL_FLAG_WRITEABLE)
-			out |= wr;
-		if (in & WMFW_CTL_FLAG_VOLATILE)
-			out |= vol;
-	} else {
-		out |= rd | wr | vol;
-	}
-
-	return out;
-}
-
-static void hda_cs_dsp_free_kcontrol(struct snd_kcontrol *kctl)
-{
-	struct hda_cs_dsp_coeff_ctl *ctl = (struct hda_cs_dsp_coeff_ctl *)snd_kcontrol_chip(kctl);
-	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
-
-	/* NULL priv to prevent a double-free in hda_cs_dsp_control_remove() */
-	cs_ctl->priv = NULL;
-	kfree(ctl);
-}
-
-static void hda_cs_dsp_add_kcontrol(struct cs_dsp_coeff_ctl *cs_ctl,
-				    const struct hda_cs_dsp_ctl_info *info,
-				    const char *name)
-{
-	struct snd_kcontrol_new kcontrol = {0};
-	struct snd_kcontrol *kctl;
-	struct hda_cs_dsp_coeff_ctl *ctl __free(kfree) = NULL;
-	int ret = 0;
-
-	if (cs_ctl->len > ADSP_MAX_STD_CTRL_SIZE) {
-		dev_err(cs_ctl->dsp->dev, "KControl %s: length %zu exceeds maximum %d\n", name,
-			cs_ctl->len, ADSP_MAX_STD_CTRL_SIZE);
-		return;
-	}
-
-	ctl = kzalloc(sizeof(*ctl), GFP_KERNEL);
-	if (!ctl)
-		return;
-
-	ctl->cs_ctl = cs_ctl;
-	ctl->card = info->card;
-
-	kcontrol.name = name;
-	kcontrol.info = hda_cs_dsp_coeff_info;
-	kcontrol.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	kcontrol.access = wmfw_convert_flags(cs_ctl->flags);
-	kcontrol.get = hda_cs_dsp_coeff_get;
-	kcontrol.put = hda_cs_dsp_coeff_put;
-
-	kctl = snd_ctl_new1(&kcontrol, (void *)ctl);
-	if (!kctl)
-		return;
-
-	kctl->private_free = hda_cs_dsp_free_kcontrol;
-	ctl->kctl = kctl;
-
-	/* snd_ctl_add() calls our private_free on error, which will kfree(ctl) */
-	cs_ctl->priv = no_free_ptr(ctl);
-	ret = snd_ctl_add(info->card, kctl);
-	if (ret) {
-		dev_err(cs_ctl->dsp->dev, "Failed to add KControl %s = %d\n", kcontrol.name, ret);
-		return;
-	}
-
-	dev_dbg(cs_ctl->dsp->dev, "Added KControl: %s\n", kcontrol.name);
-}
-
-static void hda_cs_dsp_control_add(struct cs_dsp_coeff_ctl *cs_ctl,
-				   const struct hda_cs_dsp_ctl_info *info)
-{
-	struct cs_dsp *cs_dsp = cs_ctl->dsp;
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	const char *region_name;
-	int ret;
-
-	region_name = cs_dsp_mem_region_name(cs_ctl->alg_region.type);
-	if (!region_name) {
-		dev_warn(cs_dsp->dev, "Unknown region type: %d\n", cs_ctl->alg_region.type);
-		return;
-	}
-
-	ret = scnprintf(name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, "%s %s %.12s %x", info->device_name,
-			cs_dsp->name, hda_cs_dsp_fw_text[info->fw_type], cs_ctl->alg_region.alg);
-
-	if (cs_ctl->subname) {
-		int avail = SNDRV_CTL_ELEM_ID_NAME_MAXLEN - ret - 2;
-		int skip = 0;
-
-		/* Truncate the subname from the start if it is too long */
-		if (cs_ctl->subname_len > avail)
-			skip = cs_ctl->subname_len - avail;
-
-		snprintf(name + ret, SNDRV_CTL_ELEM_ID_NAME_MAXLEN - ret,
-			 " %.*s", cs_ctl->subname_len - skip, cs_ctl->subname + skip);
-	}
-
-	hda_cs_dsp_add_kcontrol(cs_ctl, info, name);
-}
-
-void hda_cs_dsp_add_controls(struct cs_dsp *dsp, const struct hda_cs_dsp_ctl_info *info)
-{
-	struct cs_dsp_coeff_ctl *cs_ctl;
-
-	/*
-	 * pwr_lock would cause mutex inversion with ALSA control lock compared
-	 * to the get/put functions.
-	 * It is safe to walk the list without holding a mutex because entries
-	 * are persistent and only cs_dsp_power_up() or cs_dsp_remove() can
-	 * change the list.
-	 */
-	lockdep_assert_not_held(&dsp->pwr_lock);
-
-	list_for_each_entry(cs_ctl, &dsp->ctl_list, list) {
-		if (cs_ctl->flags & WMFW_CTL_FLAG_SYS)
-			continue;
-
-		if (cs_ctl->priv)
-			continue;
-
-		hda_cs_dsp_control_add(cs_ctl, info);
-	}
-}
-EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_add_controls, "SND_HDA_CS_DSP_CONTROLS");
-
-void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
-{
-	struct hda_cs_dsp_coeff_ctl *ctl = cs_ctl->priv;
-
-	/* ctl and kctl may already have been removed by ALSA private_free */
-	if (ctl)
-		snd_ctl_remove(ctl->card, ctl->kctl);
-}
-EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, "SND_HDA_CS_DSP_CONTROLS");
-
-int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
-			 unsigned int alg, const void *buf, size_t len)
-{
-	struct cs_dsp_coeff_ctl *cs_ctl;
-	int ret;
-
-	mutex_lock(&dsp->pwr_lock);
-	cs_ctl = cs_dsp_get_ctl(dsp, name, type, alg);
-	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
-	mutex_unlock(&dsp->pwr_lock);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_write_ctl, "SND_HDA_CS_DSP_CONTROLS");
-
-int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
-			unsigned int alg, void *buf, size_t len)
-{
-	int ret;
-
-	mutex_lock(&dsp->pwr_lock);
-	ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(dsp, name, type, alg), 0, buf, len);
-	mutex_unlock(&dsp->pwr_lock);
-
-	return ret;
-
-}
-EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_read_ctl, "SND_HDA_CS_DSP_CONTROLS");
-
-MODULE_DESCRIPTION("CS_DSP ALSA Control HDA Library");
-MODULE_AUTHOR("Stefan Binding, <sbinding@opensource.cirrus.com>");
-MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS("FW_CS_DSP");
diff --git a/sound/pci/hda/hda_cs_dsp_ctl.h b/sound/pci/hda/hda_cs_dsp_ctl.h
deleted file mode 100644
index 2cf93359c4f2..000000000000
--- a/sound/pci/hda/hda_cs_dsp_ctl.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- * HDA DSP ALSA Control Driver
- *
- * Copyright 2022 Cirrus Logic, Inc.
- *
- * Author: Stefan Binding <sbinding@opensource.cirrus.com>
- */
-
-#ifndef __HDA_CS_DSP_CTL_H__
-#define __HDA_CS_DSP_CTL_H__
-
-#include <sound/soc.h>
-#include <linux/firmware/cirrus/cs_dsp.h>
-
-enum hda_cs_dsp_fw_id {
-	HDA_CS_DSP_FW_SPK_PROT,
-	HDA_CS_DSP_FW_SPK_CALI,
-	HDA_CS_DSP_FW_SPK_DIAG,
-	HDA_CS_DSP_FW_MISC,
-	HDA_CS_DSP_NUM_FW
-};
-
-struct hda_cs_dsp_ctl_info {
-	struct snd_card *card;
-	enum hda_cs_dsp_fw_id fw_type;
-	const char *device_name;
-};
-
-extern const char * const hda_cs_dsp_fw_ids[HDA_CS_DSP_NUM_FW];
-
-void hda_cs_dsp_add_controls(struct cs_dsp *dsp, const struct hda_cs_dsp_ctl_info *info);
-void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl);
-int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
-			 unsigned int alg, const void *buf, size_t len);
-int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
-			unsigned int alg, void *buf, size_t len);
-
-#endif /*__HDA_CS_DSP_CTL_H__*/
-- 
2.43.0

