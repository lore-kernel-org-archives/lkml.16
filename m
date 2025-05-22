Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5C633DB;
	Thu, 22 May 2025 10:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747910329; cv=fail; b=EW7umwFuxR9+zIU5deH2hQtVsKtet3Jju9BrbwMD3iO6/RyaQDXvUN/pxvw4QDCmZStjrWXCHryuxy9n8/fWs+Wv18spL5I53+M3/uZbsGH6/Br6G+cLd6KFtceMTjL9r94NOa5JgReVFKe7LThZ+cqTXQ8bNj7woi7p2vmM7CE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747910329; c=relaxed/simple;
	bh=uo9j/E5BQWSQ71Iq46Lzvn6iE/qgmz9mXzSHQfWTTL8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dyIr1pyPOKhLs8KK3ati9epuPZ6DDe0iJmoRjg+hSM0VRCSWZfrQrHwKj/wQV3GXugBwIBSmrzxQzkOYmuxGazHM7dxmD1SvCVofxiwLeHw8CjIInV1weRPq5Rv0RGJdSbvYIIqI0+p1mqcCH62KEj8GHkRPIEJ7PUFChxqiwMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MSUWeSSb; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=m1J0UMGa; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MSUWeSSb";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="m1J0UMGa"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M5TwZv009200;
	Thu, 22 May 2025 05:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=y7g+lHAPHBRrWt62
	335NwgLFioVRWpF48C2bbp8PPJE=; b=MSUWeSSbJxIvyPPjpbjAgp8cb1VwNX1i
	E0mFuy3+5tes9oGqQD3h4q/JKLJhejyU5NQ2P9oyu4ZI0oEILgyTZExM1pQ5d6B2
	hSLs+HH7juBohz6XOY0eUTEkXdd8KTQyBVE3rpYBQ67bVUDwSRjgjbO6E6iHhVQm
	YYcMy34s2WacOVglzoWh15lCcrFd9T+IMZ/XCr2m7FaIU00X/Hc1EWDCm4vA0YhA
	YnE8c/p5r55+an+pNYXTpNv/D6VS6ecbV0yahizeUegLTX3cni1NWYs15+LTxNqT
	1nmArkt0LYRIPvrjo42MR4s4wMP4tQQ+BVrBy4Anf0b6a/hGXNqfUQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46rwfh2se1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 05:38:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+zaW9OIZhoxD/iiFiJ9U4+irOgkK8Fg2SqEht/j79LX/dWZ2/Up4t5tk2Z6eMdgYSW7uR6rjbTAty0NH10JssToWrZs8AEdDTAPnV2977PrmcVXBZUDaVGLTUmotMI+0GEYc6l/jcapjNfpTIh+yRdyFUQTZG+UEajIfiH23453o1GnpzTORvS7IkJtCwB1OAEUeU2JstPKbw3KuZgJVM/QZljp1f/Q06a8v9G2tjExcygO1rcVVPtEpc5yDmZ4N/4wlsMYuxiKKD5QlXECBeTOH7hhaiHSMtHjmXJ+mf3UrWFwriDqegkdHPexT78zBYjAJMIdGjBIIi08NrseVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7g+lHAPHBRrWt62335NwgLFioVRWpF48C2bbp8PPJE=;
 b=Y5K3TXHphxXAfBJZC9IosLvQWqCejfrlV/LmNd5cCOhNQbYgGlzCEfqk3P0V3ng9L2gj0uAHd5U224WdAZn3h0X5tAwsvEF/SMGYy84pb0LgToUfDVH+W37Dd0rWoztEljSsBzTGfpPaVD/I8KRfEmG2LhO3LjlPENk9mK24hkcSRO8VLr+Ox/vohwz/v5XVQcC6+eg8RpK4g6qrHuTypWAU1ZQ3wppbOVuTquRkicYffEOUjV8qbC8C3d/hn5XimiJyDzOSPH0TKvnUZX7/qYWHGihYF2KDPgYiWXCQqr3Wveb7swzim1bGVN30UEeCafe1zhl/OHmynKOzlVGWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7g+lHAPHBRrWt62335NwgLFioVRWpF48C2bbp8PPJE=;
 b=m1J0UMGavktqRXTcMJBeW+12UZwk/7KMJbGF630vOQ0lSmXpqO1UOO9HQSDrly75fEOaVl8GeoQyjTM+4hGgmsU58S+p13naF4aqY7W25UJX8FSQqz48uOWJr+F/70ztr21NxI8wSSWpsnHLepPMufZn4/VtJE/3tl4ob1pCQiA=
Received: from CH0PR03CA0088.namprd03.prod.outlook.com (2603:10b6:610:cc::33)
 by CY5PR19MB6542.namprd19.prod.outlook.com (2603:10b6:930:35::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 10:38:30 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::40) by CH0PR03CA0088.outlook.office365.com
 (2603:10b6:610:cc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 10:38:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 10:38:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 75C25406540;
	Thu, 22 May 2025 10:38:27 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 62FCA820258;
	Thu, 22 May 2025 10:38:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: wm_adsp: Make cirrus_dir const
Date: Thu, 22 May 2025 11:38:16 +0100
Message-Id: <20250522103816.543919-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|CY5PR19MB6542:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 287230df-6fb0-4051-19b6-08dd991cca4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M1urEPs/y2TFbYXFaMTDZiUetFXN9BTwQB+RqWwA0x6H/WUcdL+qF4XyuN7U?=
 =?us-ascii?Q?1gcQ3TAqfeKRHt07TCeeyJ5di3VB7Q1gltcAklmrvBkkUIHzl4FwgsY6cC35?=
 =?us-ascii?Q?Hdv1atozsxye6z/o+WlKrS+MCLUigGM3gj0LnCTnsXQpm8PmlX48r/f4K1mX?=
 =?us-ascii?Q?e5XADLsmUNxfEp8MYN3DYQTNVl6F7NE2X0Z6/+kbvHYcgTI6xSRunAOgB5/W?=
 =?us-ascii?Q?J2Eo9EPwxQmGn6fif99nORhdYgP4r4zzm2Nri3d2xhxrDltsUq/R07+iUrXa?=
 =?us-ascii?Q?42Ik14qhvY4Vce/yE6unPovntVfR9eq/1BBZT2A2dIRC1jIBC4iE3AGLoMj9?=
 =?us-ascii?Q?oY1BEcFA/n4vKfbl74+jdwf8Dw/XH7dRjuCqXYJ2nXeydpNwPtDDJ9FV0Hac?=
 =?us-ascii?Q?xSU5Gveg8h5GNLeBtFqIg0vETNF+vOOZMlGuFhTCb9ZSVWlm15ikP3uPPzo3?=
 =?us-ascii?Q?a0/vounCtMag8Hfaxl9EL4nk3kixtSz95FKScJ2Sx+39bKOw4e8OC5JDkCOT?=
 =?us-ascii?Q?ssQ/GkQx7VHMmESOGvtJJ8c4wTeasUtCfa98Jrmp5xUDfKEvJNgvQvu8B5x4?=
 =?us-ascii?Q?En1ukxk6C1TIFFY8HAE91ct2uJw1K6Nv4YHZQL+ik8CljRa/McgAAhWTFdhi?=
 =?us-ascii?Q?F0hlCAQ+y2g0i5t09HGIhSfDcdJE4NGxrB25r6kHnv9bjFOPDMtPFUmq1sAh?=
 =?us-ascii?Q?vLR+/+DybUQeDyhDywEz+20D0scOpeU0Syv+mQzgLyCdusZJXrnhN3Qff2vV?=
 =?us-ascii?Q?1Kn2q+K+berIKQYaprBFDsMNLtx8lMwHUMM4Ohy5WUQYUZ53Q+OvFDltYXee?=
 =?us-ascii?Q?/lzdxxMwd5FWvFf9CuafPQGxVqBKVaqSWfzLo3u4e8KujmvqlBusvFLWgGZz?=
 =?us-ascii?Q?dmLtVXOVrFosuugI0twOlH85BDvXlGz41ZQNQRUfcEUhRJrunb5ZGNWjKwrc?=
 =?us-ascii?Q?fJpqnDQ8VXGNYW8Veg94OUluqm8QLXeWxdWeeIurZJwiTmzSotdNAE8/PHOj?=
 =?us-ascii?Q?9/1DPr5ZeZzX5MlcHXelFn9Htco22L78kRafEp1AAHJpcd/Hy3xqyuu7/S0S?=
 =?us-ascii?Q?kjP3AsBfUWiHFu1R3R//npm6njxFlv5WbWS8hG/1zUwC7PkGW4famIn9ZEF7?=
 =?us-ascii?Q?XmycZm8muCuFfbC6lFQlt1u//3/VR/ik8GQ8Djr8Xof7YBB068yLWP4YXfly?=
 =?us-ascii?Q?4/X71z7f3d+N3b1ukRBkM2spnJwx3ox8m7fMXCvqI8Vu1roZCjmhVSJPwIkw?=
 =?us-ascii?Q?CwLMXQgnM5kvKLg1vrxkloAHUb7dNBm1RdNIUJ/95Wxwwn7FXQed4iW1RmAQ?=
 =?us-ascii?Q?+XucgtGtu2eJ7Xakg0GknFy0C8VQMkO0313N9Yxz12Y+4SZz5KwxwVFlMzzz?=
 =?us-ascii?Q?vOmkFPdbi/Cd8sjbFD9+xwOr3NBEgdJe4uX/wKEAeAeix71AxEsEmLi+XMQv?=
 =?us-ascii?Q?aZ7ajlmONiIMwBRgkpSFvKIfFuzJBP+4MYEjuFh3ZiraVjSy2LseghGNChwZ?=
 =?us-ascii?Q?/6z0TjYKgHIvCbPT2I4oh67qwjckifb1E4hn?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:38:28.6154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 287230df-6fb0-4051-19b6-08dd991cca4b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6542
X-Authority-Analysis: v=2.4 cv=de6A3WXe c=1 sm=1 tr=0 ts=682efeac cx=c_pps a=dbfzVNK0jQbpEhEqKt7tuQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=dt9VzEwgFbYA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=fzNHxcx_sL8or4rIm1wA:9
X-Proofpoint-ORIG-GUID: 4zlGBZAYF--FkUXbrqJyaW-TVUZb1aRt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEwNyBTYWx0ZWRfX2xPixixMPcku Qh258wGvlvb2sFz4dqWEc4c3p9SmIEoZfwgWRjpJBTZeMt1W9PzF+RNcykUMNm08LKAdh4dJggK OTcLQTdHOHu6+Qj4d5Qmx4ox6Z5iabWEjIZ0RyIVm91m+mbIVvr26cV7UtjcOSIR2LF6adyxTHO
 RUxN8t8cVMteJjzyyqdKj3OzdGLNcS2vhBT5EKT58b3AXDbxIF47ulH3KG5Ruum4mxlij1yFGpa FbT4Ggexk9ih8sssm4JnTbZtmjGJFmXa+rUao50bQ7PPMkEJUGrGfaQB8lW3mBv5CBhX0+RnlMu sXX5ZuTpMZ+UDLWjDDliaf+ObvAWpuzLvkVflqsv95eZm0I8uX8rZq5WtHXDjB6Ryhh9EUF47i1
 5l4IKmsutI8W4YrYFuho91IEQUEYmJ/pnBKdEmvI8NBDvlIY2MlekRzkX3gwO5nT6HsPRv2Z
X-Proofpoint-GUID: 4zlGBZAYF--FkUXbrqJyaW-TVUZb1aRt
X-Proofpoint-Spam-Reason: safe

The cirrus_dir pointer should be const data but was missing the second
const needed to achieve this.

I haven't marked this as a 'Fixes' because it isn't causing any bugs,
it's only a code improvement.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 91c8697c29c3..c52b4dc7a509 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -785,7 +785,7 @@ static int wm_adsp_request_firmware_file(struct wm_adsp *dsp,
 	return ret;
 }
 
-static const char *cirrus_dir = "cirrus/";
+static const char * const cirrus_dir = "cirrus/";
 static int wm_adsp_request_firmware_files(struct wm_adsp *dsp,
 					  const struct firmware **wmfw_firmware,
 					  char **wmfw_filename,
-- 
2.39.5

