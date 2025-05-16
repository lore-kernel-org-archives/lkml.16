Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0114198E81;
	Fri, 16 May 2025 15:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747408891; cv=fail; b=czYYsGbcrYG8FmUuiXaHMBvYqKxlSxUqTg/BYpjlIeHWrp+zSsYHwRDzzSOwMZ4DXPjIeXMCxtRWmGsY4J5GOZAFVZDWy7wrbMsIcROe0yn8eoxhBsZJILixj32dDnbhOJGSkglfHXfYrS0WXAlvPXeMF69eReGTEaNM65kig2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747408891; c=relaxed/simple;
	bh=9SYY85H/L8i7mbyqeVKi4R40DwdwvHqi/RHJkDkrSeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gfGH69ogTLDqFoeAvMnuzZGHgVwFS9Yd/JyOwYJ8lNSwQDSsTy3kQQanqcTH+mwYg+VsATZd2WtXztovy3rTD32kw3D0xEIdGwdcACS2ySiQHt1TfAkZ7Y8rdy05PS4PE8HChhoVW6wxSI1J+CC6sZhCgaZ5NkiddkAwqihjJYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mseuv8jr; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=xnxTzwUb; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mseuv8jr";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="xnxTzwUb"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4M7u4025992;
	Fri, 16 May 2025 10:21:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=hbKdvHA6W6yweu+a
	R4asQtOw09nEXjrzBQ8U7P3lrXU=; b=mseuv8jrYV5YYNue8y/9nT6W+AIxrmz0
	X4TthY05wxtywM0F2gBE5ZStdPtxFtvHnfnsyscMab6h3E1HxnPAOHuSyqmQjFZJ
	Dps1a2rc2gkUiUpcZ5WMezf9kE3cOmCl4iOmo891pIaRC3YPiW3YcuJimtBIag8g
	3Qu855lymaUJI8hyd1vtbDa91/l5lfcAop6a2tOb4nANJp6cdUukEDZczVe31cja
	KCOsXW4mamn2KeAhs0LOHL8i+Nzfn9Wvlptg+JCVpqKFSgErT+YSuo1XAktlcMKh
	7jS9rbGGgiYGcSVJsNxt9N6t02CH4M05+4ZAMPo8eEHBjOPZ34nynA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdrcvfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 10:21:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXjZKH42LrMBei6Bu4JaaNkcNTM41wymfJlgNWIeZEPkE5L+D1UN6JncNDQb+QQzffv0wH2q7C3C9B2l7EmXBefn8BA2YaMCPE+tSZuLBO8xsl+XrS0qRUS2utvAltsz7/AMzC12bUWiatRoWyhd0IQ8npThcNlEQQ0JZKSJ8VO78PBYMMLdvtk9sOzYpGL/U0IQTbZtTCjuuU4WtHP4E/nNrx6n4GmvpUJwloA4MdXrTGMT6ENFSynmHSqKAxW1ecoglj2RJ0qt2r6/xoTOdlxW16QMUB4mKZ65sPODn+wq8J/K09n0qSzLdNX+V1dnZ6h0xfIYAC2R5TdccVK8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbKdvHA6W6yweu+aR4asQtOw09nEXjrzBQ8U7P3lrXU=;
 b=ILdEEqprKtscM0U8S6xIr/f6n3d1r3AZDaTZIJyFfLGLtXeTu/VWj4hEAuKxDdxwFZ/X6cX5nrJkP8zziQylr83mzQYlu0Z8Y8MDU8x3dXMtMag5KYsrGryTR4gvvyX2BV9ESC5emgDbQ0QS3VNw47eC/CBVx651BiDkiWmSL7DWaA8kebFpwaZjOPOhHhvHYr+l3D9M9x7FzSFByBdNR//tcxEojs7Sv+909n8kRjMveEfORZWmY57jfLXlobAyM+wPNOu+b3eKM7JhPC2jtlc3MroHyt+PmWRI0mq//KSXLTd1FWiSiyZZjJlZvdgrjZg6tz7KjX4c0X4Bpja5hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbKdvHA6W6yweu+aR4asQtOw09nEXjrzBQ8U7P3lrXU=;
 b=xnxTzwUbtprwktjeckWb6FiVASazwQRvnYYdytFzSyC/h8jHhA/N9Z0pdThkjxtxJ2PgwDb/DSjR975X+iUDgFMtmjqNIvcgZJ8ZAchxDJTlokmEDo03zOEwzfKud9k/a6TUEDTly+BwRkiDgZ5E9yxnpL6AiSAvD7x/hEof30Q=
Received: from BN8PR04CA0062.namprd04.prod.outlook.com (2603:10b6:408:d4::36)
 by SA0PR19MB4365.namprd19.prod.outlook.com (2603:10b6:806:84::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 15:21:13 +0000
Received: from BL02EPF0001A107.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::25) by BN8PR04CA0062.outlook.office365.com
 (2603:10b6:408:d4::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Fri,
 16 May 2025 15:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A107.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 15:21:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9D597406545;
	Fri, 16 May 2025 15:21:10 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 52EAD822563;
	Fri, 16 May 2025 15:21:10 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] ASoC: Add Intel machine driver support for CS35L63
Date: Fri, 16 May 2025 16:20:46 +0100
Message-ID: <20250516152107.210994-1-sbinding@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A107:EE_|SA0PR19MB4365:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 21badd61-e449-4ab0-102f-08dd948d4a70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HKkc6FxD6lVCGXarQrwX1tb7/FsqrLJGlH+dqxWqCOio64cvJOm/fZBsPlwd?=
 =?us-ascii?Q?lKgOZ4X2FBCD+69S6dM/Z6LCrqugw60FUasQyK8QIcDaZ4PMFGoneuThAaM4?=
 =?us-ascii?Q?t7YdZTvgSvscwPjaOlqijZgLRHkDgKKP/YYJON07LT0xMCvoAgbaJbQCJFbn?=
 =?us-ascii?Q?O38XIO6eh6mwuOuT4mnRSnHBpdfAX0RwbOYK4Q/U2qfFUQBpfGr9MYrgEUR4?=
 =?us-ascii?Q?aP/WtzPvv55n2GZDx/VvsqFUnTxA0Z5QcTUYDwyLmQn501CxA74z0qqW7uNO?=
 =?us-ascii?Q?bhBdVCzs1FzsmFobe4LX7+14vF+XPg9CIOu3RWdZ6Pejy16WBL3e2cMVTFZa?=
 =?us-ascii?Q?hBnTmhgkv8B1KR76KtylBHSWrcXK0seP/1S+KkT9Ur4IHRh4QiP0lX57UwMY?=
 =?us-ascii?Q?zT7jyE6ZdYbTOM1XKzwcG7vKbhwNVuU3dqhQU2m5k6EdINHiSELZzNgTFIBg?=
 =?us-ascii?Q?Fu6iez7aFLjtdz/P972Z/Gdz3rM1uCnxus4vnw6Csv2n/Rn66bhqDwcD4/5x?=
 =?us-ascii?Q?erdBvvZZ7yokrRfq7LaqYSGMzdIoNzOzBwF6Q2s05NFFqMEyxOdeU34IJy0y?=
 =?us-ascii?Q?PYgJW+OIce+jiFadlrpo+WLrpMJLfUkr2EmY9R7DiMEEqBcRrElIG+P+jJNw?=
 =?us-ascii?Q?4ylppNGzCa1b49JLgiXPTLcJ9XPsIPidVcTvBQw/IhS/m5KJCXLqNq6bRq1a?=
 =?us-ascii?Q?UyVwsBNuebhV7JT8Q4BXcsmDd/GVs6cA82wyKe6bYYkobArFQpUh9C4Miwxq?=
 =?us-ascii?Q?3XWHporSOkBAKWC2K0KQLVoihO38/mAG+gvQx6jHdvqP8jvxYXRY9ZllDdjG?=
 =?us-ascii?Q?hDX1TrKAiYifPDlizPAqA9jW0GNco7m2wcZQF6iG/CWl3HzIZPdbj5pBClGk?=
 =?us-ascii?Q?dKKuNJT09HYqDdq/xZ+I7liqqpYzJGYy7VqRdoh58WrIFlGFbszlRm3Gr/oM?=
 =?us-ascii?Q?3nqhg/UnQWlBbAomJho62nqN/kXpQcCdk4HEECURhvZgyxH3bNkYmuCgSeba?=
 =?us-ascii?Q?mzg8EvI36GMCKevXJ9uNXKSLyCz4/fw/VjEhRWyB2NyGZ/U6TWPBHAUnZYxR?=
 =?us-ascii?Q?qyibdIMHelWySaTY7pXz+8gVNxvyR/XKxR02451JCQ//WbMYCNq4CutG1zfi?=
 =?us-ascii?Q?A5CzsAlzmwuWreVZ/vKOzAFkxZ7mwbWzfujDMZpmBeeKhW0LIBnCPWkRDvZR?=
 =?us-ascii?Q?at5UGo4KW1VQUo3TYnR7GbpfZwEBcfZocfHOi1MzuJ6oMkh5LS04+Jrtuplf?=
 =?us-ascii?Q?1PJlY/x2bTdPEKCZ4wUr5qE1U30cIoUPNU+uayqm4UgxSCBGCV+KtHO6/1Gq?=
 =?us-ascii?Q?S7fGc4enlPGT45NU2TbtAp8oBRcMnqKNHTTNGknHN1Xm2ly+tZCNol11ZFRj?=
 =?us-ascii?Q?XaQOdAVarLEMEmVTXBP3d6B9wXKI7CPcF1wQGyVs2k9qjbsD+lCXQi5hGruJ?=
 =?us-ascii?Q?BUUoEvvDGZ8qM4Dd+QyqoX55TIT4Lm/AjVlCIeBp1mi13jQXMgNbDu1GNLZa?=
 =?us-ascii?Q?0TR5N8vvWYms35o5X1aP3hJChbG6EsbPz28j?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:21:11.4571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21badd61-e449-4ab0-102f-08dd948d4a70
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A107.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4365
X-Proofpoint-ORIG-GUID: fvGJKRicve_LZbZbNi9CrV0ZGWBDAi-w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE1MCBTYWx0ZWRfX9zYjGSbT3LIS XJ3ZmTk8x9JsoQyuNfxHP1oEYIyLQGNauaCILLeZ5aM7COUbNpF+lrzDi/tFh/eUq+oKXd2uAM8 f5w8EleYylPHHI1nVggCm8rnCxmPl4V8NrMYRxNjyyZznrcYZgzoy1dXiF1qyM2A7MXbOazrikn
 GESYxE+phpoN+yPpB0MdMsHm0xALG/WKNRpN027OljuUlFqZ+Cxc99QRGYfnwoA5CsSTBDT9elV 9egCERp7tS7cWuaWBGOWS7YKetCs+oe4hsibIm5aHJ/LaroFddqVuVqqTXnZ41TEumx6K7o1OrY vedN+5RRCkX3sGm5kMIT8murnxv4KKvZIUD5eXcp7QM+iqeJGZPGDdIsKUtwlHgRlNcy7vXDvI/
 wRghrEgrDwxmM6DANkv9TeLTdLEfIKbyXERG04Dt1jpyYI609qDRkcxht78X5MIz27Q1n00D
X-Proofpoint-GUID: fvGJKRicve_LZbZbNi9CrV0ZGWBDAi-w
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=682757ec cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=ou7mOFKA_1MJv6QbbNQA:9
X-Proofpoint-Spam-Reason: safe

This adds support to the Intel machine drivers for CS35L63 codecs using
soundwire, and also adds match entries for the CDB35L63-CB2 on MTL
systems.

Richard Fitzgerald (1):
  ASoC: Intel: soc-acpi-intel-mtl-match: Add match for CDB35L63-CB2

Stefan Binding (1):
  ASoC: intel: sof_sdw: Add support for CS35L63 into machine driver

 .../intel/common/soc-acpi-intel-mtl-match.c   | 38 +++++++++++++++++++
 sound/soc/sdw_utils/soc_sdw_utils.c           | 25 ++++++++++++
 2 files changed, 63 insertions(+)

-- 
2.43.0

