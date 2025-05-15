Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371C3220F3E;
	Thu, 15 May 2025 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326551; cv=fail; b=jXa0snTr+0LkfYRgjdkGRnVRPvpoiU9sR/lTB2SXxykZUFSuMUGCCxIGzBT9fGUtLDAPLCB3fugdOO/JC2M/mA3mqwagsxcsaHFPPHxyEsn1whM2R7giqNlpM+K3NnIVIGSSbDu3nLOoyRKjyR8R7ONeQ0idy6DO07j1AIh9C/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326551; c=relaxed/simple;
	bh=zGElTinVJ873r5zpED8GU4GV6H23KvGrhIZKEuSkNYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CpbLH/v9heVByI28m5lWgpmVeMjHOXuuWhyJGUg7Bd+J5zomvQ0PyxkIJKyNUDh8nF329nvSQpda+hWyfkA/BIQlqY56rF4qfcGZZ/V6lcwiTZo9XapkXaWLJBIWuWGE3qEULPjXxCh0rRvuUR+EK8h9oFNJZAibqV9RWq7h3HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NdGbcD1n; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cQMmjnyg; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NdGbcD1n";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cQMmjnyg"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEr2ev002391;
	Thu, 15 May 2025 11:29:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=IeV0UlGHLnnRcLnGKdVbytEhaMY4tubTKVf7m8UVz70=; b=
	NdGbcD1np3GBcPT6lrhs6uwGi8i9DF9mWPwjuC1QZ2DTBPXZpRmGhD5esvrh6WCE
	mhJpA8n34LVyqqEksPTaGMLFPIk+l/qKRgGjzHl9+l87beiHCTJPmSHVD65tHsC7
	iVA7lPf83ynmLSagXhTGqM8KMDssZef+jQ3yeH70XbDxtHGKWu9EzTKFobDVLJmq
	OfshBg9i3xmo+7y1CNK042M/DuSDGtItZhR+WYrrf+lu4y80KE6Ho4EmzhJoMJO8
	YXFzy4yZ3w/4oE6bQz6gViMuWKnmBBwCPR9cBuPLxbUu4Icn3YSDJhwWZe6qke31
	YIMosV1s7vVMWvhGYYBwrQ==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdrb7q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 11:29:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SE4+62Rohce9E8fjY26yh6k1H3PzqZkI2U9qrzJh49JBnVcZRKQ5ovaYT7u57M7vmRerVY00lR4TqFE3krl6/LcSH7RXRTn0mgHLJbJHIBjUpLobQt6K5fi7ztBW0voynAsxThr1zybUPVeZRicSUhgHb1q10CLv8K5qUcP84Go/bA54UKi+Z6UAomOP3caDRh4oXQDP+FReq1rPMK3+YCrY+K4pMfUctEKrxHnWzhDCtOwC2N1qCWF26Qck5NvzorRASOsFeO9pbnsbhLsxl4wq1ozhZAwnizWKqn7mwGsnguodekfdgrYTNI/PN1+bRvRR8fB3E35YewSPkbyV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeV0UlGHLnnRcLnGKdVbytEhaMY4tubTKVf7m8UVz70=;
 b=khMDEPG7KDjn7JDvK1fVFLsTW1+F7UkuHdjNpDvaRIocYnwZr87I9r18n+SGnypbOfYEdp20hkOT55jjJ0AgRNi4sk3SoUsQTu0wdW7YuTGEBcl2PqEiZctKOr1oLFc9ITfjNLXEYSA/3sra0BzCPuH4T28Dfvz69vzvOA/hAU00931uM8GuwMd0vfM/7Y5VT9IKe59AADUeRvMN2+QKABC4s35/XZgZxs3XbtEst6goC1VGQU5yCLIBdqDkIDCxJApdOXQGSSW3g60KtIHnxPE8BhqOY3KbEzlHwHVsp9CFqlCwKv1OUUa0aPPuv7pVH8YOw2kNOg1Flqtu+Cz7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeV0UlGHLnnRcLnGKdVbytEhaMY4tubTKVf7m8UVz70=;
 b=cQMmjnygUDP2NcXZrFO/lCtPD2mbc1Bm5JO3geVE666jd1vRzuS4k7N3saDbZF+SVeH2jKmxACSMS6Uf0wb0KLaRzmar8EJqDYNpzs9siQup9w4pAPPvdv9itMU+4cyiY7YrhfFZqN8vGFdDoznK4eyuyxrAwsUh9mmYGeEXVGI=
Received: from SA0PR11CA0011.namprd11.prod.outlook.com (2603:10b6:806:d3::16)
 by LV1PR19MB8900.namprd19.prod.outlook.com (2603:10b6:408:2b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 16:28:54 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:d3:cafe::53) by SA0PR11CA0011.outlook.office365.com
 (2603:10b6:806:d3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Thu,
 15 May 2025 16:28:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 15 May 2025 16:28:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 82B1140654A;
	Thu, 15 May 2025 16:28:52 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5316D82026C;
	Thu, 15 May 2025 16:28:52 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/2] ALSA: hda: cs35l41: Fix swapped l/r audio channels for Acer Helios laptops
Date: Thu, 15 May 2025 17:28:33 +0100
Message-ID: <20250515162848.405055-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515162848.405055-1-sbinding@opensource.cirrus.com>
References: <20250515162848.405055-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|LV1PR19MB8900:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 79e599b0-f9de-47dc-cb81-08dd93cd957a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j2R9HJnFX/yidl08Gm4FospUBse1AoipT2AToHduTlNhVA4JfRwdBjST4OmC?=
 =?us-ascii?Q?XM+vZOSwMRWMlL6AxcjqInkPeYBrPR0kLm+m1ubQbHBIkKZ15OCUM5iCv3HR?=
 =?us-ascii?Q?skAmB6wd6gfrIf+E9SRzeVWkzCk44Eh2qua4/2fcneQZKNg40VeLAlrFwBsj?=
 =?us-ascii?Q?5efzE//Qg07qTCo725ytJX52H3nIPiH0C+4JnVJ5boFCjLjf7ScCKp3AXlye?=
 =?us-ascii?Q?qqCYlzJZozXeWNirv2+J+o6q5SaTCzdoO4AU1bhsmsPWDgZz3yFqfXWFzFDu?=
 =?us-ascii?Q?BtO4GyFznlslCNlQzGDiObY7XW0xzk9PfDsGxuhCsn1fgb88DVXH596Cgaia?=
 =?us-ascii?Q?ajGxhytf5oUo2tP1uNCV0fOEDFiABMgmUnNXFunkAl+kVgi8L65AJR4q8WPX?=
 =?us-ascii?Q?Uh8r58IGteMenChregZYzqRmAk7fiFwO8+9swyMs5gF3iBrM5ITX8BUMUXk7?=
 =?us-ascii?Q?dBoV674sC98LI6vsw8RZ5yIZETVbcVevQP90GEMswo9VuT+FGDbnKcehrUB4?=
 =?us-ascii?Q?dimyPkFSAP6IhXvOnItxik9oVVArkAmv24TknyHgqU6kXbgGqrk5UdfnEbWo?=
 =?us-ascii?Q?5noEncnPYW+t5Rd6e2Ki2DSF38jpviZzUDh4FD/hax7sHu0iIzT9vzPkZaMm?=
 =?us-ascii?Q?rd7cwBoJ4fyt8qKe5nr2m9+oYXdPMWo4ARChqd0hjo3b4JOsnBAUBDlib7eA?=
 =?us-ascii?Q?UkhezOfs3psOLVLK+EKLU+n16SA75O9dQ6PatA/LglK6F0sJ4/UqWYhx2qJM?=
 =?us-ascii?Q?+/kLviYNs2aiRmQRB9ozUA2MCZd7OOCzaFW0eLLxTdu3/YECWnmmF/aXKbN+?=
 =?us-ascii?Q?gt3VNYKZRr8ssAp4nzEZhPNT2YCa5Zat70q7w0QXfhokvQTwhfn2yS+DCQDm?=
 =?us-ascii?Q?2Z1dcwb9XMrXbi/8PDcVWF7SxslG5eztp5MuLxQoSuvNRE5CmkIzGunv7igD?=
 =?us-ascii?Q?gTrB0b53uQv5h8G+/gx/kmY0XnOttsPL0Dzeo6mwYEhL1Tub3RCfVHXD3E/M?=
 =?us-ascii?Q?l55yOo55gFcg8i0dhMFZ4I9sVkqjSgEULOyBSqFvr6qadvH8ydXAiZ5dwxEx?=
 =?us-ascii?Q?q7T8OsN9RyBpo0vug6cSJExKpvoGUJHsHj0ifp5clNiKRiMgcSTIqEkMTL3H?=
 =?us-ascii?Q?USqNMDfrjnAA609AhH22vgCyJKcNL08fiFkCJ0WHhV0bPkyf0ccVyQOUM7rn?=
 =?us-ascii?Q?UpUWnThHX3EkaAC1Gpm5dM5J+8QO7RmIxndN8Tejn+oPca+DL1MdK5JPbbRk?=
 =?us-ascii?Q?d34NJ3u4xSl4XkA6Ar2q0j46qZmY2pj33iicmaNGyNz65k7zdtrXKqJn90M4?=
 =?us-ascii?Q?Tyt7cGDeRgkFvvlN+w6PCsb0+NpKIGlAdpoeyiBod4xWBkvi75POqnFRZVa1?=
 =?us-ascii?Q?vX5AtfRBKwkizJwDrgwj3BO9ZJZcpxMeYZG1kVGPOyvsOwImv/ROYjJEuSwr?=
 =?us-ascii?Q?UiQLNtAlpDAMuLkIVqGa91zT67nNm72NwRwizfDhchv+1+5GpTbl8zj75ZUJ?=
 =?us-ascii?Q?hfkIw6Qj89ZBeeHuxeojDlPgCx+pa0ne55me?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 16:28:53.9171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e599b0-f9de-47dc-cb81-08dd93cd957a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR19MB8900
X-Proofpoint-ORIG-GUID: _GryGKAgX5JpNlsiLCkJnXyvjnW9MObm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfXxarDER37yHLp q87I0VoGmPgKZ980q9OwnACiIhrMgojAGAOKcAUmykZTjWxzK0CuwXbpLnKqLEjBjCfypBb3JYL dZYAohZbmCtux2w0rb7zHC0l7RptGMRPjJSTDBNVau68FLQZIHBaDd1YguF4O2z8YbldMFn2W58
 lvl3MzH3ALOImbVH4BoTQq7ZZzNtYzpepXWXSjJQaClVUnM9jMeszWJKNZmZFqJz+sFsVdOQE5F CPDO9VLjp3GmeXVAFB3mmuS1841Qr5qbpTp9oKFKB0tC+VzE6gK2qYpW3ZZU2UpQ7iOYVM7smOy Y5pN7Y2/fw1POpVOdVVOTpo1zP8g3xjHyhuhaYrInfI1vQcmJm4mMYY7dh6pw4lF3erAU+qL/Q9
 eHzFF4yvgW0ZBFDfdu6W+njQc0cB3M66H070jHQtZuFMJYH6PAlt94WIqCKiDWC9LfuO72YA
X-Proofpoint-GUID: _GryGKAgX5JpNlsiLCkJnXyvjnW9MObm
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=6826164c cx=c_pps a=hSS9g3ca6WprpwKybkK64g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=Rf7KeRTLBiLavBV7qqYA:9
X-Proofpoint-Spam-Reason: safe

Fixes audio channel assignment from ACPI using configuration table.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 61d2314834e7..d8249d997c2a 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -31,6 +31,9 @@ struct cs35l41_config {
 };
 
 static const struct cs35l41_config cs35l41_config_table[] = {
+	{ "10251826", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
+	{ "1025182C", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
+	{ "10251844", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, -1, -1, 0, 0, 0 },
 	{ "10280B27", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10280B28", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10280BEB", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, -1, 0, 0, 0, 0 },
@@ -452,6 +455,9 @@ struct cs35l41_prop_model {
 static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
 	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
+	{ "CSC3551", "10251826", generic_dsd_config },
+	{ "CSC3551", "1025182C", generic_dsd_config },
+	{ "CSC3551", "10251844", generic_dsd_config },
 	{ "CSC3551", "10280B27", generic_dsd_config },
 	{ "CSC3551", "10280B28", generic_dsd_config },
 	{ "CSC3551", "10280BEB", generic_dsd_config },
-- 
2.43.0

