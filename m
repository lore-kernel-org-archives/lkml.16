Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00A919047A;
	Fri, 16 May 2025 15:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747408891; cv=fail; b=tqOdFJEWioKwKml/4y04u4DSkE3L3vCbdk8HdQ1iZg8hS9U7WVxGng2tWFvy8Cr1S5zlBnb4ul2H+cSWYNhXQzTBVIE5L8LV5TtLWoC6UgFBAJ2Ba2E9jti5tbdzcTsC6Sx4u3oSa9KuwWmtswsYSU+jAefu1f+Swqjv5kem5rI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747408891; c=relaxed/simple;
	bh=TJfvt/Ugccxskp3GO6h7DoAJ30/uYKs6XGximdXps9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qEqqsKr3qxkUJAKeRCKb2niN+Bq9ZVIA7QLhwMpR3m8aLer23TB8jtl78HRWzZr5NInYqs0mynk9MuREQmTiT7OGLqFlOPsZtujOf4l+50pNo9dbJ99aMamXeYNyc6+JzjsC/CzNMxEnms91DZUB0J+hFkLmY9QzzasnGW9Bdio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MnckLlFx; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eujIOqMM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MnckLlFx";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eujIOqMM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G4M7u6025992;
	Fri, 16 May 2025 10:21:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=Yt+LaPS3bqfnKIL2B6oZ7mXJgQ1a64ByQIKGyVjDOWU=; b=
	MnckLlFx+kxB/BW9OuTw1vM/4RLdX0Tz61SS9wY5voCrba4F8FdOxUST3FJSlyym
	GXW9//38MZidlDJC/dNfqm+bIUjVvccyMHQpJQvEiLJ1/hN4PAOAA6NETcWg7uRE
	XNCYKgrW7OKAel2U36/vynLGc2Gldc8TLz8SWYlHejkmsWXZkaz3bff4Gruu3zeg
	9mk97u1YOh8CuL+crs4lSO28IR3DFYnNn7ehRHtjOW2JquhRDRXRGpPR6tj7KIYZ
	QVUyG48X/BWWhi3xJHP7L00fS7Msc2zd2ZUIEaq0LnXaDtYIemiTSPZSfpNcbABx
	uuUrZ5iqKQfcsYhmw6RTnA==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46mbdrcvfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 10:21:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbAWHX0cvt7wpmbMWYNaE8CsU0nO20gs424PA+leFXL10qDLF2qS6wUrAg7TpCQDY+EKVdnulGez+Ndm35rj30bpMAn5eDFb2lnb6SkNLZaxWGpbXhxSzJR5vu21stk8ufzpK5fdHOQJFOYI3a1yKgC7G2aYLb4WefLmclyd8AXwU5kwJ753Ad6MvKCeJESvnN6c7PSU90G7RqxZ3MD7bJN1QPzEYJHxVQkZTz7kQeutee0u06mwn2GOcTUi4SLlJyV4nXSnC9zf1I5yx6612r4/qpUiMXy7DDbmAUmUKkUWcDIUs7JIPE5iK1lPi9YOpMBiEt48qk7rmCmBqWEaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yt+LaPS3bqfnKIL2B6oZ7mXJgQ1a64ByQIKGyVjDOWU=;
 b=WzqEJ8AUOA6MTKrIUUwGCjW5yZqv9qLPmCh9gZMy+Nm/9gihgjzjHh200Pqk40YpztHEsYeNA2SJmcICQyFlGOu+1g/zhQWuVZRDYzwD2Qsgx5C8AtSjqorSyaWNMIuQbyO6bCxotrOuleKdOj6xO/RVmrPaSbWY9k7QWEyl+C0BgPERObHtSzlffMsnpxa6BnNN74z++gECfSVxTM/U4wr8RT6NyWRaOfS9c6+b0eiHbMPLXGRtEx8UtXJxqEHNRhoen5uklGzoSy7xsr8DbCRZXmCbJjXWAbYZoVJ44NRhBUYUw3G3IB+u3rsZELaSlzRtBlwibqB4IUqTmriCFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yt+LaPS3bqfnKIL2B6oZ7mXJgQ1a64ByQIKGyVjDOWU=;
 b=eujIOqMMlppePqrcVAzuj1xyd+SpmaLa37I00dv8riiqhUupNnVkTupYFfS1Y+fAuqha4C0Z3b97HeNIUyTE0h7lkHta267P7QU9HCCYHVwVzCyP6yu1e6d/lV+Ui/B9ZF9Tn4Gyalbo58pyZsYaS1ogV5w2MD9nuJUUMtpDXSk=
Received: from PH7P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::8)
 by SJ2PR19MB8247.namprd19.prod.outlook.com (2603:10b6:a03:55e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 15:21:13 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:510:32a:cafe::89) by PH7P221CA0014.outlook.office365.com
 (2603:10b6:510:32a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Fri,
 16 May 2025 15:21:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.1
 via Frontend Transport; Fri, 16 May 2025 15:21:12 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D367C406547;
	Fri, 16 May 2025 15:21:10 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 9B15F822564;
	Fri, 16 May 2025 15:21:10 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/2] ASoC: intel: sof_sdw: Add support for CS35L63 into machine driver
Date: Fri, 16 May 2025 16:20:47 +0100
Message-ID: <20250516152107.210994-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250516152107.210994-1-sbinding@opensource.cirrus.com>
References: <20250516152107.210994-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|SJ2PR19MB8247:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e3ddcc25-78b5-4250-c600-08dd948d4af2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wr13ltNMWDVNzAUHyt+I6cuG+WxSHJU4lSVY0fJSDBqpzXUsSpQ/OtN3aHWF?=
 =?us-ascii?Q?AdDxy4Yxoxn5t/pYDLp1Q7JArjvGDR1u+mZOys4E//MRFD3r8+dUNU/LqrhU?=
 =?us-ascii?Q?FaYaJDUzdS8JJoaaYVGjlXusxq1KtLWzZS/xwnA3sY5PFllNmrXQaKPTx+Lt?=
 =?us-ascii?Q?HRP7W52w0XjxLe7WjWri+LIHbDQlAOstov+PXI4SOpUmSsUkRe3EaRGULy1T?=
 =?us-ascii?Q?NiaF6IQjeY0YQQ2yTG515m3OFyIyi+Tg/Ywd42rWjfVi+PhkLFyOjokydC3h?=
 =?us-ascii?Q?CAF17/DVK54eSMbsPxYD1Ym8YRp9kF6kQ2ZAzR3TmqMPPo3kmaio1jd5gsXI?=
 =?us-ascii?Q?tSyhO0O1aqNTDynktf/EyhDWJvpAfWN19HCGEW9U4/UGp1T4Rtbw049qPCvY?=
 =?us-ascii?Q?qGVCvvllE0p46YKACuokeHoyc6zWmGmVHxiqmVgqWeME9DReNY/wgOKsm7P/?=
 =?us-ascii?Q?r6YYDNq7V3ylXcPW9wGxXz7FxGWNfJXvEdzIt5PEDnE2qTkosoRW2+XYVZ0O?=
 =?us-ascii?Q?O84JJtC69X6fUcfPCKEyvEUBC0CzDZKQ935xV9540lnoOW64VWCELfRXrH5a?=
 =?us-ascii?Q?pd227XlHVMNE+H15urzbvQmK1qzxSNLxQTQHEoiGHv89LmfVow/SOyxM4MBC?=
 =?us-ascii?Q?DDMsX9VWDeCsSsePzRPV1+qA+akUEKJDoxWyPBvtFAz14RVvoVC2KV0TBMrV?=
 =?us-ascii?Q?xqR6VpqeHoHez1B5w5ZVjyuTfgzmmRja9qgWdyFiE5n553YyHaEu+N5qpsw/?=
 =?us-ascii?Q?VHHPpye61xulDfc7b6TfOYXc9/69JF3HXdR/6uaMOXHLI/7Ql25ZaHyF8jIz?=
 =?us-ascii?Q?H2gXPuqt8HoaGBNpezeekRFi5X2e9XXdBdlv0JkEajwjl851V4W6fioyq2g2?=
 =?us-ascii?Q?j0zB93RpmP6ob9kwWekdgdBHtAfgk2izpeyaI1mHJ+0/Gt3Q0eZ8HSzfwXp+?=
 =?us-ascii?Q?qJwu/ktxqc04MsbhquVvHbwuY0L+o+vxGm1erOPwQu21McMDN9k9uRO3Njsi?=
 =?us-ascii?Q?jxNG2oDizxzac4MwgJWHzufS1/Vykv4m6lAI/UfoUb+ygpFZjiuHkPIhCplL?=
 =?us-ascii?Q?3i8VfKY1zBd6rXKAxJY6XOykjUc0zGooI2HF/jjpg6F7jkpFyDpafsCgd7Gu?=
 =?us-ascii?Q?cSZpc3cnkwNHcmP7gCBRDL2teyeXe+/OE6u7EXCjFYY6y0ESltgClWQaLGsj?=
 =?us-ascii?Q?5aZwKQi+kWJgSp4TURJkkZVAMoneDKUuUoCNyNembSI22JoePpRt0699aiwU?=
 =?us-ascii?Q?vWyHZJflTflpxaul0kH34pHrBaIZ1rCu4Lok3b7CA4IfXwE+Y2rbLDKGMPoA?=
 =?us-ascii?Q?f6loB+s8rsW7K5/r5y0TYNusZkEI9KqmElPhrX/lOQ3rmxQ7rl2sMGbui5im?=
 =?us-ascii?Q?Bc8fCfd8cpcqMOO2hEt+y7FVqj2KuPZ8hSK/SE7+YzYTG7ZfWWZp3CDTt8ex?=
 =?us-ascii?Q?ZCigVwzXUJ6Lnj8ibgrKf4+oB48MGJMKI0mV/zkzFgfPGxJBhqv+aG0MjzVi?=
 =?us-ascii?Q?6nNNFSVSIVtTCBMAsb6XEWFmgYhyeZTs0F+l?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:21:12.1876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ddcc25-78b5-4250-c600-08dd948d4af2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB8247
X-Proofpoint-ORIG-GUID: 9aKIxpBYfgxObqGjeSxALrg3CYbTEsmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE1MCBTYWx0ZWRfX73P5cV6D8oog jXXUkDXLrgilENZV1I3SVwr+9WRL6VdS/yPJlDlyVLZsXVYr1skewKu+h67Jl13UGVmQIb0bTmL 5LOMnoiiwH8EY/7RLad44Rhb7tIZeIEJF6doDSeHUsW8bDlqT58f7M+RRxqksoz7Y3/zkhrHKVK
 xFg8XEwrIgA4ZGJAlW+rjer0lxwSS6WPvvqe8htLRz/+KP3fCWETjsbnFgvoxLo8ri8p/RZ9IHF 22AIBHJov9gCzF5QXg6/tkG+9KPEe3oKENuAi4kxcHFg4y2uvRBwmp6y3Ko1tcNkDnJorgFNNz2 06yxa/gKhbID43bwEQ49HCDOhq/LkU1dRBdVHlpyatxxfAtQEht95coYG5hHGS9biIugRGk6Nlk
 DDVUgSiLZNWAX247FhKqBTaOid11Qgp7/a4kA5X3knJWFtIuTx6CDe+lo7YB6nkCv2Gad4dA
X-Proofpoint-GUID: 9aKIxpBYfgxObqGjeSxALrg3CYbTEsmB
X-Authority-Analysis: v=2.4 cv=abNhnQot c=1 sm=1 tr=0 ts=682757ee cx=c_pps a=TWVVkEr8Ytp/jGYVlMgQuQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=mlZLeVKwfFaRoF9MOUwA:9
X-Proofpoint-Spam-Reason: safe

CS35L63 is very similar to CS35L56, and uses the same driver, so we
can use the same configuration.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 30f84f4e7637..b7060b746356 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -510,6 +510,31 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 2,
 	},
+	{
+		.part_id = 0x3563,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "cs35l56-sdw1",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_AMP_OUT_DAI_ID, SOC_SDW_UNUSED_DAI_ID},
+				.init = asoc_sdw_cs_amp_init,
+				.rtd_init = asoc_sdw_cs_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs35l56-sdw1c",
+				.dai_type = SOC_SDW_DAI_TYPE_AMP,
+				.dailink = {SOC_SDW_UNUSED_DAI_ID, SOC_SDW_AMP_IN_DAI_ID},
+				.rtd_init = asoc_sdw_cs_spk_feedback_rtd_init,
+			},
+		},
+		.dai_num = 2,
+	},
 	{
 		.part_id = 0x4242,
 		.dais = {
-- 
2.43.0

