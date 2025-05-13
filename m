Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA4829373B;
	Tue, 13 May 2025 13:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747143599; cv=fail; b=soxXnudwiWHqquZT2CWz9wiUio+JvkR2lxsozrAx9OqIayVDEBf/xsP+kagUqM4Kb+ANbicV4k3UV3QIMrg6s9clMERF8YTBQa5y4olTkpn3Dfhpc0iJhoao8Vlflg4M2Sv8aLFaeZYY3A76QLUkV5u/u/VpqvjgURC1ZqqzlDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747143599; c=relaxed/simple;
	bh=CpjI9iRhD2Kluei3WlbekVqfTgl7DE1YFtki8vFqWhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZxWKC2we9a8DAl66zMZ7ZBWbi4fmRNnqYa1Dq49K/4fW8mXgKx7OaJK5O13A+xmKGZqe40K/RkU5seDtNAWQHD5Uqu6VcLAYtLnU8CIo7as3fRQ6Lh+44iuHTDfLlFO/3JAyFy25t2DiMwCfeVLcxQwx2gRefOuzXIg8ztK6mUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=SOsLz5CA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=sKIJGk1k; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="SOsLz5CA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="sKIJGk1k"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DBpK2B010501;
	Tue, 13 May 2025 08:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=diCkqP5GQ4NyFJ+X834Gehm/Q57ZSUkHR5973TnqsbY=; b=
	SOsLz5CAzjYy8CkvU1CvVwJ+KEgVDfMxSn/axkbe+Vyj0rz69FCJKsDvyVrPAtMy
	Pox2VSAqWRFlKszVuqc/D8IBxrSot2viTqUuL20tZcjbLhdbToniXOpfy7SZB06u
	CXS0Nt5TTYZG/x+e5RW2YebRhZ1ucza1OgurPUouih67D89Q+Pn1eyAzKmPsrYNX
	FdL0k+eCtNSf1vK/M9xY/H3jCSIdtHkTPP3zweTbWyXdDnAWohdo1r5V/oDUKOlK
	G/UEJMEPSjEPcAeSw4kYrBIlVE3LM1u4ohnFZygX+aWtSOtUDyN4xPsa7kuqpm84
	tJES21vnb6h85hEntVOf0g==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 46kjy0sje8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 08:39:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZT9iCDbJpowC1bR1kT+j5l+6ayLtkcmyh3EnSW3ARhiBWWMFm0gqgihnhVuxHwunzAubgUxPYkp6nCUPoO5i+wiq2AevnOGshF/geiWBFazjOw/giPsBoqEj81omFMdQ7wMCtWUTSlzT8+0bWTgzL5aJUGUpQuwQDVQ7ZOb56F90gFJTdxyWEgiAzQ79b8ZAjSAXWoHpoCbogKAqY/yy1iD/R6bsz6JOEY9zktg0rINFl0JyKiAOJPW75BTiLD7q3+/13+rZYy3sxOLMbimi5T06bsTNjhH8IzsMHZLTBV9eUUa7Qy+15LYO9CPxaWH86tB4EEO3K0ypvuXFCtOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diCkqP5GQ4NyFJ+X834Gehm/Q57ZSUkHR5973TnqsbY=;
 b=ll9TiidcqPVWxNjh3jLGrhaDcZJu+W8j6jsO5W27L1s700Qw2tSYeXwFIoNorQzREL9Je3I4Fa8HlkFbdg4RASeEGoF1GId+RitNcDG8ESvIhocJ+QGDtx4H+p5GU4vH7G5rb2A1zEII/qaSqgB2YLWcKDTgtjP43fI4O1zcG/lJ5KT5RHY+rXu/tOvtUcsZwmA6hRLL9PRPanoiFoUxZLMdHbQD5N3JSEXNsYyVWOZPRX4VU4r0cbx4wW9OodGlG3XVFgHFwjZo9kC1ZGBzSVc1oXEiYUCrwq+46IlOQ7U7P4ecXmEq0nAs3cIH0TumF1OTvs7TJ6sJFtjjsee0Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diCkqP5GQ4NyFJ+X834Gehm/Q57ZSUkHR5973TnqsbY=;
 b=sKIJGk1kzdCYmDI5b/jcibHguQqAYsyNE6wn//s3AZdn5Z+uSHhZ80DPWNW7fTxcJZggNl73d/O0ZlQ1zo9EsIYUEXnJS8iaCX2aCMpSDZCvR4v+53VCW1TBkdRSiLeZu8rvlaksXuiPJcWpDlvJ6sG2PJ9LGCXBvUerRpcCnWg=
Received: from LV3P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::15)
 by PH7PR19MB7535.namprd19.prod.outlook.com (2603:10b6:510:26a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 13:39:31 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::f0) by LV3P220CA0002.outlook.office365.com
 (2603:10b6:408:234::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Tue,
 13 May 2025 13:39:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 13 May 2025 13:39:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BFD34406547;
	Tue, 13 May 2025 13:39:29 +0000 (UTC)
Received: from lonswws01.ad.cirrus.com (lonswws01.ad.cirrus.com [198.90.188.26])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 98FF3820259;
	Tue, 13 May 2025 13:39:29 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Simon Trimmer <simont@opensource.cirrus.com>
Subject: [PATCH 1/2] ASoC: cs35l56: Log tuning unique identifiers during firmware load
Date: Tue, 13 May 2025 13:39:23 +0000
Message-ID: <47762a5f1ce2b178ad863c6698296aea09b72e10.1747142267.git.simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747142267.git.simont@opensource.cirrus.com>
References: <cover.1747142267.git.simont@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|PH7PR19MB7535:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ca31854e-b408-4d17-3294-08dd922396c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3VnDJFchXsNQER5cLEB1WQDggwZk0qL3ADuoydJqlBnWEpU87yvFYsBsiQIW?=
 =?us-ascii?Q?TPym/AU1GR+BhWOSjPjjPuUYuHdiYk2K2Pi33RyvOIQZEzVvdg3jJ90DffIu?=
 =?us-ascii?Q?9UfvzhC5lKSzPLPj4VmdprEnyWJuoKKP84lNp/mAZ9VcHqrjegEY10u7YeGv?=
 =?us-ascii?Q?+V0Alqlj/f7ggYzbp0AHPdpPDzieFdLt20GScuJDUEsPW6shT6B7H0mxSGRt?=
 =?us-ascii?Q?1d/92oZxiyl3g76SoakWYw9slN8fqM1vvu/P3JI96KxzLWOe+DBupZjMQVhN?=
 =?us-ascii?Q?lBunRtcKwyybUG0o8R6RJiqxkQFFDh4rxUZau0DsSStkTVx88DF1xaRcub1D?=
 =?us-ascii?Q?lJikjoQ1j5LU8YmZhzrW1nfPI94zDH5Fc1eu3jfiA0+uCe7irl0IH5S4WuMT?=
 =?us-ascii?Q?3CpNvXs38AVr+oHzUPFbgdlt9odkYK/M2vLWTqEW+R0CJrLV5xBFyaX36PY5?=
 =?us-ascii?Q?r0IhPrI9E6/UydMomUKGpuPrZT1Pop8vDumSv9QprR6IT9SGnO4VGsoiTMUT?=
 =?us-ascii?Q?9Zj1P7wtTViamCXxVksQrVdioNDywZ+zOJkEu0Zmk8KbiKtPKfMoGCn/wC37?=
 =?us-ascii?Q?Y+AMFdv7mjJRGuKIWXYMldXXBvZ2xRMFlWWgFLkgTxDzOr8Nr3ZILnYHabLX?=
 =?us-ascii?Q?xkqujfMWmiqB4BmIo3SqCyAf+i6z09XL58DXDQh4Mo0PSPC4tnsUJVllJBOc?=
 =?us-ascii?Q?XDn2SSgq5CA0PzVRXLS5h81IbJIGMlzZhL4SgG1QCsCpR6SbQBBh9piu4fW6?=
 =?us-ascii?Q?KjEq5IyWl58lTS9JPAXpgXTxWP4+7AYyvHCFXOqJZaC+4pfQdyki5sTt74NC?=
 =?us-ascii?Q?9L5q18Ce1Rbpo8b/1GwU4J8quTir38gl61SoS0ChSOLRopE6As+aOgryrJV2?=
 =?us-ascii?Q?CA3kMDMUr64PdZubY3vzZTuBwf4WIatYCzkVp+XN/1+f5garaY6uG9ceM5+S?=
 =?us-ascii?Q?jI5PBKDj7ktM2mYaJsth5oqFsKCBfXlczLFLYZb87fq0FwhIZLVqTmo82vsL?=
 =?us-ascii?Q?Jw+BT+nYMOr4FcFiOVHSpAsGiQMMUvjZ2pT7hp6Y8K4yTUhLIhNuaSsrCcUI?=
 =?us-ascii?Q?9CDQNiKrIZRpsWJw72AR/wLK7yefTF4lH168UMwax9wLZPt3Z2AbgV3AD2Sl?=
 =?us-ascii?Q?DG4O5Iik18KXQVccdVW/kRg2qKsTQbfy62t0FzYbU/T81tkExdC405F+sjuD?=
 =?us-ascii?Q?XRsdB1qUte9m8ENz3BI3r9ebq74sbxNxarq2TB5Hoydd+qD2kGTJuI92RPfe?=
 =?us-ascii?Q?aHtDQan1wwSp/5gBE1fPSFvCLm7WGiyFN1T9d3Qw/vAxq7rAhu40CD+i4/7V?=
 =?us-ascii?Q?lM0Io7lGtngTew7upETlBOxl/KOmD9rDDp3iB1CXh5l/vnmvssfM4SHzI1OI?=
 =?us-ascii?Q?PtYtmGN0Ul/ycTgI740wmb9zYZE16IFc5qCAEibO1XfVWmUiVu2s/JOnMPCp?=
 =?us-ascii?Q?Qk5AsU3XnnUQ5kVGKeYwLV+9v7npJGXhufuaCz2yfXysG7qXNDcHmIsp612d?=
 =?us-ascii?Q?gQluMW2wB7UHcm7wyH/0D8RNbqcJSsAlPW9h?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:39:30.5489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca31854e-b408-4d17-3294-08dd922396c6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7535
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEzMCBTYWx0ZWRfX9VnCWiNfO/jf lb5o+HdKG4ETNSqDXrcbMzfOvygGvGelX9//mGiKoSMCPklMuzFI+O1gRKQh11TtUt/hMc0CVd0 5SwJ03dqXcsISYl7rIchX3RQMk9MyQvATI0CNw3nYo6G1v+vcDjTOkPJNlY5AYcR9/y8EVB4ugx
 oSTp07ZRSwyqf+I2nC4EFuhetRemHrvgjhfUJmhjuKXuTTN9UfOiF69t9h1ixmZjvrG8E8rmSBd paxVRwGmayv5j61wBaui7zv6Fco77lV+eF51X8j12fg5WwGG4kUl8YewPYFC2g5mXcpslAEXP8I xw+TskWpybnuQyQhiSN7cTwee+2fChVQy5MCNW37T/LaSoEUaChykbmiGTmHSDjvEEUm37G+KNa
 BakVyCTrqYIk1b9h/LT+d4N5TwLh+x1arRXpWZDTypsUt6B8MSQ8OJEQuka6fZNVeyRPFf4y
X-Authority-Analysis: v=2.4 cv=Lcc86ifi c=1 sm=1 tr=0 ts=68234ba2 cx=c_pps a=X8fexuRkk/LHRdmY6WyJkQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=X7bwdywpdoaAe0dR2rkA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: 0uL7RQ7A3PPvh2NjwtRf-kIFItszE7wD
X-Proofpoint-ORIG-GUID: 0uL7RQ7A3PPvh2NjwtRf-kIFItszE7wD
X-Proofpoint-Spam-Reason: safe

The cs35l56 smart amplifier has some informational firmware controls
that are populated by a tuning bin file to unique values - logging these
during firmware load identifies the specific configuration being used on
that device instance.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  1 +
 sound/soc/codecs/cs35l56-shared.c | 28 ++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l56.c        |  1 +
 3 files changed, 30 insertions(+)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 63f2c63f7c59..e17c4cadd04d 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -360,6 +360,7 @@ void cs35l56_init_cs_dsp(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_ds
 int cs35l56_get_calibration(struct cs35l56_base *cs35l56_base);
 int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 			     bool *fw_missing, unsigned int *fw_version);
+void cs35l56_log_tuning(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp);
 int cs35l56_hw_init(struct cs35l56_base *cs35l56_base);
 int cs35l56_get_speaker_id(struct cs35l56_base *cs35l56_base);
 int cs35l56_get_bclk_freq_id(unsigned int freq);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 7f768718b69b..d0831d609584 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -909,6 +909,33 @@ int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_read_prot_status, "SND_SOC_CS35L56_SHARED");
 
+void cs35l56_log_tuning(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_dsp)
+{
+	__be32 pid, sid, tid;
+	int ret;
+
+	scoped_guard(mutex, &cs_dsp->pwr_lock) {
+		ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(cs_dsp, "AS_PRJCT_ID",
+							    WMFW_ADSP2_XM, 0x9f212),
+					     0, &pid, sizeof(pid));
+		if (!ret)
+			ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(cs_dsp, "AS_CHNNL_ID",
+								    WMFW_ADSP2_XM, 0x9f212),
+						     0, &sid, sizeof(sid));
+		if (!ret)
+			ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(cs_dsp, "AS_SNPSHT_ID",
+								    WMFW_ADSP2_XM, 0x9f212),
+						     0, &tid, sizeof(tid));
+	}
+
+	if (ret)
+		dev_warn(cs35l56_base->dev, "Can't read tuning IDs");
+	else
+		dev_info(cs35l56_base->dev, "Tuning PID: %#x, SID: %#x, TID: %#x\n",
+			 be32_to_cpu(pid), be32_to_cpu(sid), be32_to_cpu(tid));
+}
+EXPORT_SYMBOL_NS_GPL(cs35l56_log_tuning, "SND_SOC_CS35L56_SHARED");
+
 int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 {
 	int ret;
@@ -1249,3 +1276,4 @@ MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
+MODULE_IMPORT_NS("FW_CS_DSP");
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index cdb283ed938c..c78e4746e428 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -847,6 +847,7 @@ static void cs35l56_dsp_work(struct work_struct *work)
 	else
 		cs35l56_patch(cs35l56, firmware_missing);
 
+	cs35l56_log_tuning(&cs35l56->base, &cs35l56->dsp.cs_dsp);
 err:
 	pm_runtime_mark_last_busy(cs35l56->base.dev);
 	pm_runtime_put_autosuspend(cs35l56->base.dev);
-- 
2.43.0

