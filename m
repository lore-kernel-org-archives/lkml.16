Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEA5274647;
	Tue, 15 Apr 2025 12:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720182; cv=fail; b=kkPrBIKyvRQSqGxvCHdefgvK2CXpBVS+o0bANeinq6ZWhtuwknCTooORcfDYhUf/AB/JgVCXAngmyiIbSRfsbiw/np3VoMCPDdqFYgc1YCCooLR+TdA1OMHk7xjubM5kSLmC3KVeUhYTo/lce4EOSBBsO347B18r7Tq569htY2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720182; c=relaxed/simple;
	bh=2rpr7B+BGdT2FcyOR/yFqJd+AVvoYEezknXTVQl9zis=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WYOOcLTcC2XNybPl4B64uVsiFiEYDdGcj2gr8RkIXn/1DuW1RyZAPDiCO7o8Ycp0wO8kPpoqjQ21SphXYLKfwmdExHA9dFsMAHCR4spRgqjIkwnudllcy+I5oYuEX0l9eJDq6JnkYJUQDQDXHm1RSejVV8D3TJq/EAsrtQSD8fk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=WTYCmC+y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kBJ++jsp; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="WTYCmC+y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kBJ++jsp"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F4xWKa005770;
	Tue, 15 Apr 2025 07:29:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=FN+6dscIeFoF4M5n
	AvcWdKkp1zIb96hsm6daav+DmHY=; b=WTYCmC+yfkYOkKNNDWsVh2kkX+Tf4+UY
	jcEcaf83vCYe+tcrvlBgOQn9KfpJCrq3/A3JP20czda+t1AedaEkoutoi5vQrZOQ
	DdvEmLmSjh5U1J/hNvUiF3EVLZX9lJ1Pkg2UKRlizh7cJA/hOjMs4415J3mbHSYU
	IX+YDBMWwGS/UbpCvVSti7pxH2ChBf/Qm7Yj3qmc4oNz4dyznOD5S7jVPuHqSMSi
	RuHFosuKUA9wGn6+Lz0FgjXv8h+xAVdSVc8aO5dxr3S1yvMs2mm/1UmuCbbTnTtG
	+0PcD0h/4/r45YU+gBUCbYI4c13S9ndVKLJNTwm9rzDU1Tt9gDFWng==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 45ymkguj8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 07:29:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+savDFDJXXGnk5O92zgpNffaeW0LkPveKjAfoyu5MFOXlXHgbcVGFvPb7nmdgk6571ZTlqiE19vYn14Cnmwan4g0om5SIHPEISPXxlhkBqdLpGulbANYIWeSnDYVXTihMGW5qyWd7ChFvWKLYeYMirTL5Q3aHthlzNM1472uZ/BiYuuQcX4H/v8eETDO9THCslLwROnvQ9D8ne2L9nUv2AAczKz8uT/ZHKV29vNxMjL+4XA6kQ49W4FB0ef7J7a44NyhF4aSSsYXF1jSXmJKph42wWYUBqLQnUNSAHaYEgQwMIewqX/R4NEi44cdtfCTnGGHEmQtIVtZukRbIcFyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FN+6dscIeFoF4M5nAvcWdKkp1zIb96hsm6daav+DmHY=;
 b=osrd424eT1zG0lGwoXSiKn0XgzBIJzWJh/kMJibWHenQVXXDj1xX99nO9dKZxzluqtk0DqCNdPC+UOjBTM7EK+HZeLZKvnfnaT0nQfCsRXWfRqsu5g+TjiE0f+35LkL2Jn1vdfE7GWlT3A9gaqgYXOb7JQW/Or7RqwOBREiNmOOW3iNE+vQFsROKnNNwearv8p+ZtdtGXKCYfYWUDa5CohmooyOSHITb4fss5IqR650NDUG6+UTxwTdV4FG917v7rp0xMVXl+NM9HRKrjHn9pj+7xEK1TXT6+ayJV2vkYuGt4XRj7uAVfKlF7u0qvGjtRif5vcp9hSuONB2wQy8N3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FN+6dscIeFoF4M5nAvcWdKkp1zIb96hsm6daav+DmHY=;
 b=kBJ++jsptSlOsYX9tubfI0WiM37F9ZEfdcT8yVFA/jjFlroB14w9+WL0U105lhE+PsahBywmY1cm2gtZT34/dU4nLVEtFBRvnlTOjnISprEE8Uzh93Xd3UZc6feom5ce7CEaeeg+j7UQNdVXWr4pn4uJuq+xBXFpFsJEwDOx0Oo=
Received: from MW4PR03CA0328.namprd03.prod.outlook.com (2603:10b6:303:dd::33)
 by SJ0PR19MB5637.namprd19.prod.outlook.com (2603:10b6:a03:42c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 12:29:29 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:303:dd:cafe::4b) by MW4PR03CA0328.outlook.office365.com
 (2603:10b6:303:dd::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.27 via Frontend Transport; Tue,
 15 Apr 2025 12:29:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 15 Apr 2025 12:29:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3DF7C406541;
	Tue, 15 Apr 2025 12:29:27 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 27321820259;
	Tue, 15 Apr 2025 12:29:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: Add Cirrus and Wolfson headers to ASoC section of MAINTAINERS
Date: Tue, 15 Apr 2025 13:29:27 +0100
Message-Id: <20250415122927.512200-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|SJ0PR19MB5637:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fafc25da-6268-4039-6da8-08dd7c192ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ri7lUGZuBB+80oj4Di+oRtwHPHZUMTfugEqCSUMwHTlTmkOTnZgKR1B0nBun?=
 =?us-ascii?Q?Sb8WcUXA9zc8iacv3EYSBC2lQ+Mmia7WtDsYbuF4QJLcNGbff40+MbzemJMJ?=
 =?us-ascii?Q?XeTKCcbVa4uDRis3R9oxGVSuRJDsQhNhWZtpOJ1ve7FmP79LdDr5Ab/wa42z?=
 =?us-ascii?Q?vinFOfGNtav4XXRqFmSXyAJi9JE8C85ybuXOQzeCUuJjchCI0IrgNB2CkVgW?=
 =?us-ascii?Q?pPhoIDzBMNvzTnLGS6pvLtFJsbqgedSJGCKGWYbXEy2UI3bHX2zLnerDqxh/?=
 =?us-ascii?Q?gIjXKTuWe7rCZjdZ+qIP+tFy5ubKjiltj+XuedGqNYNo9H9W0TJmrg0EZWe6?=
 =?us-ascii?Q?/C+U5ncjs8BRQyNEv87SNPFMdvrrJ7rwKPcCbOYPRjZJ19wNH2keUQlM1NXs?=
 =?us-ascii?Q?NzVZq+uGTuf7POfq9UqvioTHi6zRIosMeIhjJZ5BJWucWiKsHsk4M1zCEUP6?=
 =?us-ascii?Q?dxD/tPI/zMUlSYej4Lc7GyyuW/2zNUWKsC/gA9iR5Rx89Y8TlMMolAwlQM48?=
 =?us-ascii?Q?y6Y6y2MWIZNqLRwOMTP0yD1R+QaTEgxRpu2K97MHl154qraM57jyfX3PKQtl?=
 =?us-ascii?Q?CCrJLaypxKE4SlKu2TM0W+k+SrleTK+26xCShrAlBzZzKsA26X3Iu7DgZ4V3?=
 =?us-ascii?Q?EHV/jNzVYeKQlxMYdn80/Hvfht8eZZP8H6NQQDKNY0Ru1mS2CQyHhdbJqBf2?=
 =?us-ascii?Q?RfMaCYIVc7wg1c5iR9jxrX3u+BFuCi50J5tkKPsEZJF/wQoiacsqrsZOBu+Q?=
 =?us-ascii?Q?xW35qDeFtQ+/Ebh1phGlhLhynCFRDT3pebz9aBITiKMqRXf4DhgJlkvrmRWN?=
 =?us-ascii?Q?tRN8Pv+Cwez5/D8HYWzkjNiY0p4aQl7iQ+kQG2MH7mJtTWKHYUoCJzG0QVVi?=
 =?us-ascii?Q?4UzKRbOdbJEwGEmGPcBmzxqr/PGDgKzkmk2N6Aap2jxlOaSPwLmR+aVY6hfF?=
 =?us-ascii?Q?kH6OAI9GO3f0eH53L6bLkN1cp7eFHnNsCH+jiESTMtKiNIRt89vz0B0HEq3p?=
 =?us-ascii?Q?we3yzZrwKDPlnUrYWFw78KJBAb8ufgUaugtcbARDnUfyukwTnQIv1oEEj8HQ?=
 =?us-ascii?Q?E2IB4U/riv0y2ofn+n1ogXAKLKWB7bk7EhGYk6CIHuDTtP3oHjNOvgdQ1FTd?=
 =?us-ascii?Q?o2XC0Et2R/ZQQD22zz2MQ0/roe+f0b2d92g93dUN9wp5fz1GhH5xY1mMSJpi?=
 =?us-ascii?Q?eKeZYt1fRpfLdf8LvUM7VmI8scPf6IaGC5EBAprttf2qU6BoHZTByBIFvX+i?=
 =?us-ascii?Q?hfY1WLvr112tay7vxw6PhRJ8mFFGYnRsUZ36ehgvaPiMHTjDvonFUIhk2kW9?=
 =?us-ascii?Q?y93jQBy36s9CpzwOkZlko1HHvglKbthp8Bjvwqil7m/oScudtl+4AZipj/VD?=
 =?us-ascii?Q?Z1ijrRo+PorF6NYcqgx9enENtOsRRTLAZocm6/nd69rvey4xNBsGLvJQkdKB?=
 =?us-ascii?Q?uEwnVFneEDBRIcEblIrPi5IbiG5YZmDvGeyoSVHhObmUH89jbW7bxAKRHXtL?=
 =?us-ascii?Q?NnfgmZ6P1Cv5EvgMsG2CDauKcm7oHWEe40wb?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:29:28.8968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fafc25da-6268-4039-6da8-08dd7c192ae6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5637
X-Authority-Analysis: v=2.4 cv=UMDdHDfy c=1 sm=1 tr=0 ts=67fe512f cx=c_pps a=WGTt6C9BqyZsVnlRayY6PA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=VwQbUJbxAAAA:8 a=aHQM69L8e3tHeDGB7y4A:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: o6mXTR3r7VyCj24AVoxlbhSp1zfHHnjd
X-Proofpoint-GUID: o6mXTR3r7VyCj24AVoxlbhSp1zfHHnjd
X-Proofpoint-Spam-Reason: safe

Specifically list various Cirrus Logic and Wolfson Micro codec header files
under include/sound/ within the ASoC section of MAINTAINERS. Note that not
all the include/sound/cs* files are part of ASoC, so more-specific patterns
are needed.

These files are all part of ASoC codec drivers, and are owned by specific
Cirrus Logic and Wolfson Micro sections of MAINTAINERS. But the overall
include/sound/* maintainership is only Takashi Iwai and Jaroslav Kysela.
So by default get_maintainer.pl would only show Takashi and Jaroslav as
maintainers for any patch that changes these files without changing any
code under sound/soc.

There is a separate MAINTAINERS section for ASoC, so the headers must be
added there to make the ASoC maintainers show up in get_maintainer.pl.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 18086afa4f3d..c67679bf3685 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22657,9 +22657,15 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
 F:	Documentation/devicetree/bindings/sound/
 F:	Documentation/sound/soc/
 F:	include/dt-bindings/sound/
+F:	include/sound/cs-amp-lib.h
+F:	include/sound/cs35l*
+F:	include/sound/cs4271.h
+F:	include/sound/cs42l*
+F:	include/sound/madera-pdata.h
 F:	include/sound/soc*
 F:	include/sound/sof.h
 F:	include/sound/sof/
+F:	include/sound/wm*.h
 F:	include/trace/events/sof*.h
 F:	include/uapi/sound/asoc.h
 F:	sound/soc/
-- 
2.39.5

