Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE5528E5EE;
	Tue, 15 Apr 2025 11:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744717840; cv=fail; b=slRT9yayqn2rZqFDYwlXfU4JZCS8+FeJkezbO6y0gZeFs9cspHrlZHf5+4IgRBOrWobwWYDhoxKD7mGYtgeyvRtdsCOCEMG+leATT9xlk7KB8DvgYsIA/AzzYKdOSuHwzH7v4ZnIfVKqo0cPtYi92ddmNqu70dLrouVyHT6CWjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744717840; c=relaxed/simple;
	bh=j1QQTnOwVXW3kLsSiJrqbYtHGgMQm1v55HEE0LIJgT8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ImG3msDCuTMRN6Uu/5nGosC1cD7PIbXxdX75lwABgHrPwuF2iiyMabvjSyZLktnuKoDCYxfFgDTzNr+6WovSul8ccIxAuqsAC4t/CP7/R5j7AYsRDc/dErxuD2/hropE533a+f3IyUD/ICXTL8P7npnYymEk1Yt0u29twk8gNfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=i+xzdMIh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wJuIVKw1; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="i+xzdMIh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wJuIVKw1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F5AGTT001361;
	Tue, 15 Apr 2025 06:50:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=zV0fPrDgPSyrxXib
	7pedeThfeQOlGilKTcWQJA8YnjQ=; b=i+xzdMIhEB7ohUAxsGFcBmmhF1qAwmfk
	p5NM9OU+mtkVPvxsCHtzThCqXEwMD4LtxRS8g9zlgF7FXTS/n4DDQC1xKXzGe+1p
	gkSrIGK6XLqEcPSD2a/DtVohfpKcB6NiffFmbBPMw70j8t7Ih+crlaAo4aI4edIW
	Hw2iJSGzuo7skggFeJjGGJg8kilkZuG1HUyGmZHM6j8B6ciba00M+Xujn47apsgI
	1M3hAacCdJGvMdx7lvfzo5FjFGTvuiS25WEKUAlqlKosMJPf+ope+REfIWvu8xUz
	Dcrg2wUMJlTHe/jvekXULlQGI8f1lcQIAd78arZhSXhscDBGobesDg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4615wt10rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 06:50:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOeo1tSMpHmR6YCoDsOSB/87CZZQ6ijxGyP/6lMTyG2SVai/wvJbYEz4cQauk0AKz51akZcIz/tWBdz5iq2YpEsTEhGuoMWuH/G25LW9m+VcnPZSQLzxVn3LKhbfQNeULv1PwFzlxRR7WIoxyTgaCSiJfjAczPUTqGbeRKaT4NwIOebjsHxJbVb0QyDNXS4qDuaYvCRD7roe6F8MhIOVYXHFrY7MKbvsXHZypnp66jTcjfxe3rFisXUo7uUpexP1Qa7TNGy+X3Jh6YaCqf44cDgm522Qh6Co4aJUeeXSy2OId95sYZLLfOb5jP99STzVlsNIVorW77T4wJta0kjy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zV0fPrDgPSyrxXib7pedeThfeQOlGilKTcWQJA8YnjQ=;
 b=g3/mGKSi2Q3Ri0tAsti4xS9Z5qSHISv5VXpeC2x7lJO3DXPCNBT3CVB33ZwP94ENClVivrxpNm1/36+rsiln9/ugyjWsltOkPXcdjk84Jra3aGa0lctTlTu449d6UbZSf9MVFIH3/frT2NyBupOMuCVYydr/BltrSk7ySzw7KffzQV3LI+N8/FqpPFeTy29KmdP0ggeCHVKL1qQS16bZ20PtQKsPe6fjET1GgdQr7r0Au++2SYZcJ+fOgLo93iNE3p7E/lgkxqHS/xLeVltnaJJ9LtQ7d9bwa1wM4Lg+CRDpaTMnjfqxrHQVNLQM6i8cMF5zE1RuBaOPjWeicXlbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zV0fPrDgPSyrxXib7pedeThfeQOlGilKTcWQJA8YnjQ=;
 b=wJuIVKw1Q3+SRl8jmNfKWGlBeSqiX+C7BeM4w15J2ihNYXHSlvhO5cj16EUa3Dpj06D1V6SzMuI0ttRAenn5Mh0mdcn5LzQf0FQ+MFdNn/F9sUbE9d3mIBPgTPDKwj3dNgU1IEGu86cCHA57dnuptM/XIhU/DSRdtaE2u8FzRkY=
Received: from SJ0PR03CA0288.namprd03.prod.outlook.com (2603:10b6:a03:39e::23)
 by CO1PR19MB5221.namprd19.prod.outlook.com (2603:10b6:303:f1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 11:50:19 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::90) by SJ0PR03CA0288.outlook.office365.com
 (2603:10b6:a03:39e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Tue,
 15 Apr 2025 11:50:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 15 Apr 2025 11:50:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2E383406541;
	Tue, 15 Apr 2025 11:50:16 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.23])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 12AF2820259;
	Tue, 15 Apr 2025 11:50:16 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v4 0/2] ASoC: Add codec driver for Cirrus Logic CS48L32 DSP
Date: Tue, 15 Apr 2025 12:50:14 +0100
Message-Id: <20250415115016.505777-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|CO1PR19MB5221:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ab16eae9-bd48-44c6-fc89-08dd7c13b188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a3Vf70gKHEx5Yt7GfiqXoJglxNpMRSe39ePo0S8BSx+awhCUk89hI+Sm+qMm?=
 =?us-ascii?Q?L5gk9OR5cFpv9Ul7a+G1S2gXm1KxrgXL9D6kXGLIlBStqYQM6R+9iY4kmugw?=
 =?us-ascii?Q?tjhWijvzm2hsUSwm35yk9EhUa0Qm9meQZQOzvOtOrcjFLn+O/p9RX+aEqyQs?=
 =?us-ascii?Q?LWCumCHELnDxpykt0FJEmy4x7oJ3bzU0UjxxTpExRiOWoP6jvyNaI3m0jXxv?=
 =?us-ascii?Q?GN3qoIlbIW28RsUFIsg83qMenXpyv9BxONMk5Gob2mgQVgD1gsneg4wixLIB?=
 =?us-ascii?Q?mDBhJeZySgZKjquX1gsvDiFoyQiIct0hG+R4gPkdybdNxPCGzf3c3VQi6V6v?=
 =?us-ascii?Q?1+vMJgDCF4VXvjjpFMKl/4vngWdvy4HgsdB6mrZqp5A/cTLrBiVM9FdhpWwJ?=
 =?us-ascii?Q?1Ak1NAZdaLvD6TKfJ7oaLr7OcAC/Txy3dn/MIM3nqNWTIkeqKD2j/vNKbSim?=
 =?us-ascii?Q?Aq+pS601qBfdWLBWhd+/18Yw0NLRkh35HFrTOMjN8LI80RooNEUmh3/wkl6I?=
 =?us-ascii?Q?wb33ikMsHqnM1XV52ti4P3iRDSyNA2VWD32exwMK953cHd4Zc7FQAHADlBl4?=
 =?us-ascii?Q?a0kKgKBLK+6CDWjuVsEoJdxcVUnVZvY5XhoGG6w+x7uZfb9ZjXotYDCbmFlG?=
 =?us-ascii?Q?kuW/Fbxa+PFk+7CQZRvTtsvYAiScgJtcA24QCZPhFV1c+ZbWJ8vKj+VbqZ/L?=
 =?us-ascii?Q?6zI1qSpDEeiinwWZbHj1ZetS0i57hCYwHqszakHTWOO1QTS5YSlf8udFNt1v?=
 =?us-ascii?Q?XiwQvd4vkEyg1ydQLiD7vmVvIUonGmLb6Sif+OMRPilR0/Ir2jDQ5ZErTMYW?=
 =?us-ascii?Q?lIpH6jUF5++BPnYh0FVG71lsiQeGwE9lqiC43eLyEP0iEaPcdsuDX8rM28NC?=
 =?us-ascii?Q?9EdGKcii0+23UKF2W9lwfjBG3iRIqSPqVA8LUQYJghE29BjPv9pLkelvSBZi?=
 =?us-ascii?Q?Sn/x8NBtcbIa3iErNCYuHHkTb0MBZFWgqAYGi511cZ3gldJ+VqRhd84vbNFh?=
 =?us-ascii?Q?oehTs05yxg9sxPAL7svL293Ln9FfqqPGjGjYdS+Z/Snl9I+6BDLzOjejvAVQ?=
 =?us-ascii?Q?ykedwl1Pj6qpV/R746oEmjU29qBfi6NlGW/vS5gC2c8DYwGW4gIth7EdarT/?=
 =?us-ascii?Q?FyXt6UW8fHfZM6XmfgxqzNVU3SU+B1+CZ6pe3z8LluNiTFk9hBvQOz/+l47z?=
 =?us-ascii?Q?MD4qknNy/7gmQgo9eoOasxy5313U+9bHlZ/0p7t5s2FW64hKd69ePDr5+6n1?=
 =?us-ascii?Q?DjMdi6h4HaZc8A73uXMKZ/D9Vm81s2hLE7K9oj+zsYA8G6J8owJ0EWmaeaCW?=
 =?us-ascii?Q?SgMSrFfGFmLIg1mnL/AhzL1xhu7llNG6kFg6V5AW6C0/ugJlDKuYJ5zX2bkV?=
 =?us-ascii?Q?JYfeCiwSk78o2FQX7G0a2F4M3ucPOmfWkEmKoV8iv1wsDqeZV3uIg9d2ZVAR?=
 =?us-ascii?Q?LgUkfW8HfJUe6MLo10LmoSQyM4CZbQqxFkDivuMQ5jXsTIYlBbFj4JqiE379?=
 =?us-ascii?Q?Rb2DpRVxnWLORfk3SuctH1PT8Mlwt+TvQSPD?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 11:50:17.7964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab16eae9-bd48-44c6-fc89-08dd7c13b188
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB5221
X-Proofpoint-GUID: d1nW8nJ6J-YC0KVMJdUhBGZmYrqALWdU
X-Proofpoint-ORIG-GUID: d1nW8nJ6J-YC0KVMJdUhBGZmYrqALWdU
X-Authority-Analysis: v=2.4 cv=OeuYDgTY c=1 sm=1 tr=0 ts=67fe4800 cx=c_pps a=o9WQ8H7iXVZ6wSn1fOU0uA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=TDA31o14s-3B4xYcogsA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

formance low-power audio DSP with analog and
PDM digital inputs and support for low-power always-on voice-trigger
functionality.

This series adds the devicetree bindings and the ASoC codec driver.

Changes in V4:
- Removed bogus updates to MAINTAINERS that were leftover from an
  older version of this code that had other files that are now deleted.

Changes in V3:
- Remove reference in yaml to obsolete gpio.txt.

Changes in V2:
- Remove bogus use of 'i' local variable in dev_dbg() statement in
  cs48l32_init_inputs()

Richard Fitzgerald (2):
  ASoC: dt-bindings: Add Cirrus Logic CS48L32 audio DSP
  ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP

 .../bindings/sound/cirrus,cs48l32.yaml        |  195 +
 include/dt-bindings/sound/cs48l32.h           |   20 +
 include/sound/cs48l32.h                       |   47 +
 include/sound/cs48l32_registers.h             |  530 +++
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/cs48l32-tables.c             |  540 +++
 sound/soc/codecs/cs48l32.c                    | 4073 +++++++++++++++++
 sound/soc/codecs/cs48l32.h                    |  403 ++
 9 files changed, 5820 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
 create mode 100644 include/dt-bindings/sound/cs48l32.h
 create mode 100644 include/sound/cs48l32.h
 create mode 100644 include/sound/cs48l32_registers.h
 create mode 100644 sound/soc/codecs/cs48l32-tables.c
 create mode 100644 sound/soc/codecs/cs48l32.c
 create mode 100644 sound/soc/codecs/cs48l32.h

-- 
2.39.5

