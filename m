Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256191A83E8;
	Mon, 14 Apr 2025 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744620659; cv=fail; b=oimWnVRB2yptqopzCJpWcBR2dxoA+w2J/Z9+F5PI3gpQfuqTUVvO5LpJC0B8tLLDi6Wssa74/raJFcrCtpAgqq9H1Fb9r4umoEIuY56XskREjhCSe/UdWDDhpw+Y6CUno1UrHoI4n0/YWNtGUd1oZPYDtEjO/ukGkzGvqci+HRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744620659; c=relaxed/simple;
	bh=CFCxzjRpOWwm2ZuzlR9Q0DFWNr658Ur91exmzYowOxc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=lGSImjGHNQlaanoVoMqcMgqMOjvF4/baJ0DsmKqt3YpCDcdjyCQTohkgBK9o5XlWZgnyPbcXxgPVqKa1ICM4fOocgfDkLyYv7ZaUubSvtb5CEszdoWHt5E8RsWoCp3adfRP2b2eAQ7g8UUSmRc0NpFJaaXKd0809DtHmmfqdH/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Z/f1zxLQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=VaRArG3m; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Z/f1zxLQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="VaRArG3m"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E5nNla000575;
	Mon, 14 Apr 2025 03:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=xJ77RWNz9nxW4aoX
	o73RXwb1eT2NHp1rpyjIJxA5DhI=; b=Z/f1zxLQLGEqLYCJ43HgEeNh0Fe16W9m
	4Pct4AcnSnzr2W44KOFb0admWcpQu9YfVSgAoYUm+qWydX52+jRuTXdnWr3xQ0os
	n1jI1qqZK7T8WW5c1cGEHXjp1n4T++1Jav23NHIxNz1ROLws77kp/MIexOgPE0NQ
	7X0XEtYbPfaUfn7cz56mcvkdoUdwFHfmnARR9VzrOjeL6t8pxGEVi53tvG8LVNrG
	V/7ygl/whqyVWlVEz1ZIIBYesuUQjYuElwwU+CypAIUdnsPeAdg4B2i0hJcYLLFc
	t640Vzcbx9Xtu5xey/VpYxCiejKIOHao2bfJmudb/I1n2yP0dVdSrg==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45ynjystfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 03:50:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVgI28pJy84+SljSt8tOh8skWvlOJhoslwnA1AAvTgDbrHpRw4TmJJswPaXMH2GCHS+6ZZqdc+J6azTlHbpdXSrZ9rDY5nH1eCrM3lTJZNk7SAzBelbXvkEMirq/sEgaxRJ69SrgwB/rUxOKCywawJCAfnmETU5TV/mZi91pXlghrEKgLLYi7hgUpHDy4NhQQmdYSwT4ltxNJoFZEWmNAwvp2F9coFP3Tib+aNdJH5i0N3HG9yQ3irtPAfZDATc1qzHNaEu64UVQwzDyiNwW7OgwcdDCfRoHw0EsiOs6rk7AzKQaRaUWD3zbCC2YjsVlNSKh0Ot3GdwdaWLikqx8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJ77RWNz9nxW4aoXo73RXwb1eT2NHp1rpyjIJxA5DhI=;
 b=oZ5D8f9bjiISHVLHuxg4sZl7IARbItpi9nUjN3M04Ix23OwiGez7jDY29JIyyuF+cnBp6XgrQsX72hIMoNQAnrJC0YMuX/QpqthZF9YTyVdTADQCX1lwzYaxHgTlHA4OHtZzm3OIBg5PTorfi+SXC6idX8qGp3WvqzO0gqoT03CgisxINuDV9Rw672ihNjj+8igwHXqi8fMHGJa/Tf4Q0BZ/+GEXA+cR1LLnA7cE+oMV95mO52JIzSJQ+KBwQk+3Mn84BV7oIAgzmwLsShB8QqwT1NsM26vdLzmYn3TFot4l1Jjxshx5GEPbhef07+zDR9iFQlGBNoG0Gdlciy+aLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJ77RWNz9nxW4aoXo73RXwb1eT2NHp1rpyjIJxA5DhI=;
 b=VaRArG3mt8o5eReaZXUjTD1lE9xpPfPR1SCzPn7+4yRDP0k3V1sFwQOgBZb1LDsQecWlMNHSQ4lofJ+oweu83bb/tA9WYURMSwrgw3vwn8RCQkbslEe4uqReS+27CERjfmlXg47QIzNpXhqTv7/CqocAqLVQf0UHgsXt2c+WV3U=
Received: from CH2PR04CA0028.namprd04.prod.outlook.com (2603:10b6:610:52::38)
 by CH3PR19MB7260.namprd19.prod.outlook.com (2603:10b6:610:14b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 08:50:36 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::c8) by CH2PR04CA0028.outlook.office365.com
 (2603:10b6:610:52::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 08:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Mon, 14 Apr 2025 08:50:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 57CF6406540;
	Mon, 14 Apr 2025 08:50:35 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 39F7F820244;
	Mon, 14 Apr 2025 08:50:35 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v3 0/2] ASoC: Add codec driver for Cirrus Logic CS48L32 DSP
Date: Mon, 14 Apr 2025 09:50:33 +0100
Message-Id: <20250414085035.12469-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|CH3PR19MB7260:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5e844e54-36fd-4c83-274e-08dd7b316cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XwLoybfSCQIDSC8sEQkvzHE+U17WZ02ibG+3VEX0PaxPbx/s1yJuxDnYDEJ1?=
 =?us-ascii?Q?pGLc8ZDOp9xXC8LR7pCviyXN6t62iwpNmbhX4qY5R1ndzSGbKZcj/XI1h/8S?=
 =?us-ascii?Q?g/Hyo+jgtnnZXoctQtOCsgR/Vbz0cloGoXng6wnDcQcLshAML31pITtmaEd7?=
 =?us-ascii?Q?FmJNKbuiQPWKOAJOJk5/o8qrTKdj1ht1u+Fl6t5s3/vVdgPLxmd3H3mGtu5E?=
 =?us-ascii?Q?//vk/hidj75KXT9UVU/AWIeKKRKmW5H5X5PP8AS1eiLaQUxrIfs7bn1Xl0ux?=
 =?us-ascii?Q?ZJYpfvM2SoZN22Z/7IE61VZXXJqcsu5TlASlWDkrBw3MrNMrYPrthKVS56Ec?=
 =?us-ascii?Q?iCNTzndJChfbNk9fwSDrQ/tWY0bTsI+5DuzrhHxy0wjcUdveFkd08jixVqoT?=
 =?us-ascii?Q?98oP7LfbQOPKicSfqOwkoUsIQ/0QNRL3TsM8soljUnsWhGxieODPA5np7yb9?=
 =?us-ascii?Q?I8qoBi6YbEVFFIoRPY195TB9tHSM4j03dU9EClxSbCGZW+YnZmMJIGUAb4TA?=
 =?us-ascii?Q?2+4jb4k1Qpwlk+DfHTMMd5RICBEandGjY43eTpWh9qP82zVwUnLvwcQqZENs?=
 =?us-ascii?Q?Kssa3k9yKdM6Ym0no+DI89IpvriZW3GsPW1Gqr97w43tO4oZa/OAq3Uy0Mif?=
 =?us-ascii?Q?46dEV5ZLtWyzQXV4GXwFC0saAC0VKIvjV3VPOVznr15tNuPIJzHWET+b43lt?=
 =?us-ascii?Q?mgqqOiG9pVUCb3FDySDLVi1ejWz5kl8yAk871G+hQhtkc55hpKfwkjpix4Mq?=
 =?us-ascii?Q?XCdEuY4X9esEDQ6vurXupV+T2/GvRwO1755z66x0ElucakGzjmaMs9ObygVw?=
 =?us-ascii?Q?MX1OT1AtGDmPS0IQpyJQIWo8KInJYEnJvDYiCiELWjyi3snGekmF7BoB5gVf?=
 =?us-ascii?Q?yGbxKo/qr2AL0KYSnI2ZWU6Ry5H6zlFkVZgA59zrskQqVkjj03hPeb/EmTjC?=
 =?us-ascii?Q?RoZ+eBugRKSNGGgwUMQ9a1iR34xD52+Bih+Jxlb20YyjYLJKi+xgddoQzyHv?=
 =?us-ascii?Q?n13WQ6HHN1ivyjKQIo9tYwdQabsVHwnh0ibmI+cluSxQRcl6YsqjNTzjrz0r?=
 =?us-ascii?Q?RAYjqclS6s0RVGDOBaEcIzol44kCMAM35avWx+cA0KTLBoofce+MZsUC5YDf?=
 =?us-ascii?Q?nNtEi0aCDfTfA97kyQVVJpkd8dpPFOXhYePYILepJPXDVfUbHA7MLnGJK382?=
 =?us-ascii?Q?NJYBN2LC779zbMV2kLfpWEIY9HOIIAVZE5R2Fg6EeqUAYF7UlrB+9DvcL7rU?=
 =?us-ascii?Q?HDvfZ3zWZWhNCLJV5zJ8BF93ks9k+27ztxtt3YprF67H4D4GDDTWeir46wa1?=
 =?us-ascii?Q?M4wRKyMfQHaJdoVltSMBk9qD0gKNmjfMQGX7Fun6r5mPuVopJCC2HwDAOhik?=
 =?us-ascii?Q?v0Y2HnEmzjytBvwVPk22Jv+OWppqGhpfUuDRXExONGlFindl2rhrkvvvike7?=
 =?us-ascii?Q?jKZ/Ll00bVCzZsKN11qpf5L88NB286QEvW/CJFf5WPm5qIt1VoBUn2xlNyhF?=
 =?us-ascii?Q?5TYki2YEiHUr9yIDWcwmvgcfHX6jp3Znk3ZI?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:50:36.4156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e844e54-36fd-4c83-274e-08dd7b316cdf
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB7260
X-Proofpoint-GUID: fGior1mrIuxTcov6uy086pus_qO377D7
X-Authority-Analysis: v=2.4 cv=EPMG00ZC c=1 sm=1 tr=0 ts=67fccc61 cx=c_pps a=joO5rFOndlhnht97C4Lqsw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=TDA31o14s-3B4xYcogsA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-ORIG-GUID: fGior1mrIuxTcov6uy086pus_qO377D7
X-Proofpoint-Spam-Reason: safe

The CS48L32 is a high-performance low-power audio DSP with analog and
PDM digital inputs and support for low-power always-on voice-trigger
functionality.

This series adds the devicetree bindings and the ASoC codec driver.

Changes in V2:
- Remove reference in yaml to obsolete gpio.txt.

Changes in V1:
- Remove bogus use of 'i' local variable in dev_dbg() statement in
  cs48l32_init_inputs()

Richard Fitzgerald (2):
  ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
  ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP

 .../bindings/sound/cirrus,cs48l32.yaml        |  195 +
 MAINTAINERS                                   |    3 +
 include/dt-bindings/sound/cs48l32.h           |   20 +
 include/sound/cs48l32.h                       |   47 +
 include/sound/cs48l32_registers.h             |  530 +++
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/cs48l32-tables.c             |  540 +++
 sound/soc/codecs/cs48l32.c                    | 4073 +++++++++++++++++
 sound/soc/codecs/cs48l32.h                    |  403 ++
 10 files changed, 5823 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
 create mode 100644 include/dt-bindings/sound/cs48l32.h
 create mode 100644 include/sound/cs48l32.h
 create mode 100644 include/sound/cs48l32_registers.h
 create mode 100644 sound/soc/codecs/cs48l32-tables.c
 create mode 100644 sound/soc/codecs/cs48l32.c
 create mode 100644 sound/soc/codecs/cs48l32.h

-- 
2.39.5

