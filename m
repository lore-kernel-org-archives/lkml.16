Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22301EBA09;
	Thu, 12 Jun 2025 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730506; cv=fail; b=M4N3R3JIin8hPKxieq+3hl9gNE7lpLJYJeJcw5x6akdo24kTnYob/6cGoeX1/+k4ZxbgjWfIqvmaKJnmKSvAlr2OZnuNc34QDEbMtMigQnMSXwqwq0+buxJMscA5wXCB8sCe35OuX+lJx02hTDEwLGajR7BA7FkiDz6N96kvxXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730506; c=relaxed/simple;
	bh=hVzQjOnWAylHZCM2NtDyuh5EXBiUgWWARKregXu3dF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fKxyDay+1eEGjKjIHgCHVuHH0i4Cw+XeAUR4rL2+OwFSrpbDefQagVTi/zwOp4WxxEixUWchjyf1AnS5VTtzyaZV1ftUb3xLtFZ/n6uf5ymsNiR3nNqM0XTL7rJk97Plx6y/030klsLN/3YiGGwF02+F6Wlw/SM7gAYSp/Vuz7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LUeSE7qv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FysGpBOM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LUeSE7qv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FysGpBOM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C6kldQ019124;
	Thu, 12 Jun 2025 07:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=58+oi1NiXmvBpHayH9rBKKQhTNDNxP8hMy/HrjcPkX8=; b=
	LUeSE7qvzu8obWmUEMTKAt+Y2OdbPYAhb1+18JpAAMvhVjHqLIapUHWLJqtgTEA3
	tO/RafrAiG9P+G3G7TdxpD+B3ftA8wS/UQoLYtepuWrwYTHZIK94lmSk1Hty9fvd
	8wgASBIqd+5d3K2oWGaOgT2Eu7afg1GljahufICnrMOPFaOAsq/ZMuL9L2Tk/QEO
	gfFcd534v8xWZIp1RUHo+l7BqTqp54acCRY+XFHyK7XUPGk9ia/KaxNcjsMMOof2
	IuelE97yOQGPqp5KKyb/L96BXhp/ozp3/+RsDEUINAFLVLGQjfR5sBsbn9nqNbqH
	CnJjaN6ZWx9zGm+lDxSg2w==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2104.outbound.protection.outlook.com [40.107.93.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4760mww0sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:14:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVjpUYir5S0NpLRPpEuWHsfZYxaq9Dz4N+hQKzV29XYppK9wh4wlrkGZsY4fIm6SBBDuavA961cZttf+VLQA0E9rsFNucBhrrExLPsMI2HmOsu6FVmXg7ASZRLKWqn/v51HwlO9+Dlheb+S6Fv1DJfhdHZZ3N6y3nYb6RdBknygdvtn9qvKUU4yL80wVba1fFcVfzaeRn1LCqc7Je+HgGMkX1trwpQ/HAFvgrifTcWZJq4E8RTx/aYiPwk8f3ypHoa3BfeA1j8TqZd7BhlefrOeGvl0cwwC/RAoZglFCsRAz9hl3ouzdxJZoy8FS+cif5qpKmpT8HqU+M1f0WYdpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58+oi1NiXmvBpHayH9rBKKQhTNDNxP8hMy/HrjcPkX8=;
 b=FD/J3MKJwh9HrVWFrTQJYpT279IUB6UHTNXv2nn91PtuK+u6O6ajdXjEfeFApWTUD3SPFohda2H7HdLmuzqOYUH52hOAfLDj/MeD0ynsKMMVffhsA/n/b8mU9z8DCQcPdN9xs9nktlw6VkYeJvBo5MLKaOQBI/5dG/q+OM4y/pmmiUL0JINhMnoz58pZPCwMjRqCIrXX5B4mEAkibZUko9hrM1N8Wnz+esbftuvAi9H3pVvt7YhiaTAmr9I9ke9PRLJEAEHQk3shO3IC5/BY0gWxwE+2QOZ9sTJtSHNOzAnuFC+95ZifgyDMy9+9VFzaEh0w6qW9BRz9E3SZHe465Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58+oi1NiXmvBpHayH9rBKKQhTNDNxP8hMy/HrjcPkX8=;
 b=FysGpBOM62IdRIB/nbRtyUsQEOfAsjEsZOQyN2XJsVKvIMfyHN3pmsc0PDL9WI698BF0sm6vtMdpEFI95YribyP/GWR+PKMMFgl0zRb77yQhqs4uRDbsfto0e4Zi94PmhWWTCRrXyBk08VZcGAfXJUqgX8LhIeNkXMuU6zJ1nJs=
Received: from CH0PR03CA0384.namprd03.prod.outlook.com (2603:10b6:610:119::26)
 by CH2PR19MB4054.namprd19.prod.outlook.com (2603:10b6:610:99::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Thu, 12 Jun
 2025 12:14:45 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::13) by CH0PR03CA0384.outlook.office365.com
 (2603:10b6:610:119::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 12:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 12:14:45 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2BA39406559;
	Thu, 12 Jun 2025 12:14:44 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.186])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B596282024A;
	Thu, 12 Jun 2025 12:14:43 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/3] ASoC: doc: cs35l56: Update to add new SoundWire firmware filename suffix
Date: Thu, 12 Jun 2025 13:14:28 +0100
Message-ID: <20250612121428.1667-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612121428.1667-1-rf@opensource.cirrus.com>
References: <20250612121428.1667-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|CH2PR19MB4054:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 74616fdf-4e83-4b75-9b6c-08dda9aab802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5XsQPM3ycsFvN4JvyzIwxe0fCUSjYUmvavNQb+VroPM5AO1UeF/VjiYMnHX+?=
 =?us-ascii?Q?D2qFWXSA9hJdHx9yNPIQOhkp7vno93gfVl7VAIao3k4xAJgnboQrVxQ/MMxw?=
 =?us-ascii?Q?U85QnPUd1WA1XDYb3pT7oduiV5SplhDCg0AVr1N3TTxehU2E7B7A4Rd0BlMF?=
 =?us-ascii?Q?NJPsekB1c0HGCvd5+8ibnye0yYlF0TjFZxNKZLYEKXrJalLH06ecSeZsC/Jx?=
 =?us-ascii?Q?ihEzEYR5dCYLn60sg84sPboVuOaXW3EmhjwxKLG8rKU+44zYBq9G2OFB3ght?=
 =?us-ascii?Q?rfeRzAVOv6LxrxXLMEIO4ikjHWvE4EfQ/XvJkDFABG2v8ByJOSbQ1gjQSS97?=
 =?us-ascii?Q?knhvU2do48imUfShCwUb65PeFYXcleRCBUP3YfVKFIqbaUA2RbfF5IA+hdEE?=
 =?us-ascii?Q?B+efq9DsugnPw4BkOG2k69d0DKY7mlJ6NJI/a3wyYNJpeZ2UDD+sDDuefQwe?=
 =?us-ascii?Q?ri36el71E7Xznsf2AoXuJJgtbb12/DOoa3pEMJz+Cpwxl3RPRbpDuDzx6bL/?=
 =?us-ascii?Q?nFxllRVFW7qaFVMjeC9yjzoQ2lB+3PFBxTQapWXy4lgp4rDsnGwr19gEXVoe?=
 =?us-ascii?Q?Vfd4K/O28IOQ0mGZi0tY95b+M+kLo1keqd9fV2T7SbJB38t6HBF7KMDSnTZK?=
 =?us-ascii?Q?jk9gYEmb6XZwtVcvIwe0m/J48i6pyMQLefOzBkABe+4toG5m0Pbju4fOeSdG?=
 =?us-ascii?Q?pqqxiaY7Jvq1Jub4u+D5+HZZO+KZg82iGkA/MyrWixFmcT62zWXQ+hiQ9BLB?=
 =?us-ascii?Q?Yq1hUGwjJ/4Ss6ZJ4PtJv700qVXvvkJwFMed34IEOwGXndidpAa6h5Huf36p?=
 =?us-ascii?Q?lfTEsiuKiLMVqNYa0udtnwLOcvAgfJ84UoaFQg6xKY9NmO6/I8+7bI6agaVB?=
 =?us-ascii?Q?uaesKSeUVWa+VdDj11OGd0UPQ/ORicXGd/msjYEPavBDLLsHWTD1VrkKgJeU?=
 =?us-ascii?Q?S9L7lhMCGodzsmkatXrm1FtXx3T9+Cq5jXzL/2k/oeq4ZnEMqk5I4fvzFwqG?=
 =?us-ascii?Q?hZDWPQHyLqvjiOuA7BL7eTuIcDXdylBHDFCOMxQorye4IxpSk7//9G86w505?=
 =?us-ascii?Q?s5jJJG6Y57L9qgvoWPkkmefKcXNLDiIo7OTtkVJqjI422X15mnjL0fG1mzV8?=
 =?us-ascii?Q?Wudn+kiBjppZ8YWblsMjeFpV3XSkqx0Yi7mqeg/1NTopx3XpJRjg/P0oBetB?=
 =?us-ascii?Q?cFcysqjqq1pU3S8sLJAF1Q/36/UO3ejlU0YAsqjlBKlO5JsHDnhHfiFN3q3k?=
 =?us-ascii?Q?dcIJVheEGvESdgWFvIdkTuGv3NiX7UNoBWr5yji26jIvZQ6Seh4yvFwkWMFc?=
 =?us-ascii?Q?WmVT9/TexaVLM9Oy/42kNpuso8JJAv8GY2XLfRoJ5sM+cTTEKEPod5b271j4?=
 =?us-ascii?Q?rMryVqaLYR4UGiPfVQnEyGtPI0/AjoNwBL2D9sq/nGfL7pcTidHg+lNd6j1g?=
 =?us-ascii?Q?QbyB8a1+IoUMJI2r0wUfce1TBPP8/O1fTsRE5QpQUBXlo4SpEFafDuCC6Wok?=
 =?us-ascii?Q?g7iYZyDRrSC+mIyfGRKqyRKK0gn3tGk9gvOV?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:14:45.0818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74616fdf-4e83-4b75-9b6c-08dda9aab802
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4054
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5MyBTYWx0ZWRfXxnAoI+WfRee5 4lLslC/Arn7MytJyDOm8Md915jH8mrlrGgUasX1gx/bQUoFq5Z3tpfAtbp9I5P5bx8yO5qkkm9O R0FhdMggt1dgAfLogMD32mCb7+4+XxXvglJFdBprTrWoIAUS6IPgdqVJAPhjGroOXvaknsOmGcR
 tfo+Kp2sa4kF352XuOk4nkShzCYLGUwWO7qPi2sHy6PW1BPSRe+1TB3VwLW97iRsRGt3DGJhrHd zj8qIWiGGVA23Z6eJUgHo5zbbsbNAmUOldRRKTS4XbHq3HvoyfY85ARgTuf6boOdt+lbJxY1LR3 6ULA2QvBuma9EyE8jgVABaYbb8g6R9BXAQdp6rFbcrCIxugXGDeXNNy5k56iGMkZrs/w1jBICgp
 vrz7VbnHn2bYGmui1JBiAU/gxtDtmUbV1ZDuCVSffvRYq0XCV5GhLGcjD87WHK0kMg2S/NPu
X-Authority-Analysis: v=2.4 cv=coCbk04i c=1 sm=1 tr=0 ts=684ac4b9 cx=c_pps a=lLx7hvauRx8h/FN40cw3Kw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=5UCGEzhdddBMGRpfffEA:9
X-Proofpoint-ORIG-GUID: 7gRvXVIPzhr0ol2dcaOSnbGSCBO1QQAu
X-Proofpoint-GUID: 7gRvXVIPzhr0ol2dcaOSnbGSCBO1QQAu
X-Proofpoint-Spam-Reason: safe

Add the new firmware filename suffix used for SoundWire systems with
CS35L57, CS35L63 or CS35L56 later than B0 silicon. This uses the SoundWire
physical address of the amp to identify which firmware file to load on that
amp.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 Documentation/sound/codecs/cs35l56.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/sound/codecs/cs35l56.rst b/Documentation/sound/codecs/cs35l56.rst
index 98c6f6c74394..7db9f93d9be5 100644
--- a/Documentation/sound/codecs/cs35l56.rst
+++ b/Documentation/sound/codecs/cs35l56.rst
@@ -104,6 +104,13 @@ In this example the SSID is 10280c63.
 
 The format of the firmware file names is:
 
+SoundWire (except CS35L56 Rev B0):
+    cs35lxx-b0-dsp1-misc-SSID[-spkidX]-l?u?
+
+SoundWire CS35L56 Rev B0:
+    cs35lxx-b0-dsp1-misc-SSID[-spkidX]-ampN
+
+Non-SoundWire (HDA and I2S):
     cs35lxx-b0-dsp1-misc-SSID[-spkidX]-ampN
 
 Where:
@@ -111,12 +118,18 @@ Where:
   * cs35lxx-b0 is the amplifier model and silicon revision. This information
     is logged by the driver during initialization.
   * SSID is the 8-digit hexadecimal SSID value.
+  * l?u? is the physical address on the SoundWire bus of the amp this
+    file applies to.
   * ampN is the amplifier number (for example amp1). This is the same as
     the prefix on the ALSA control names except that it is always lower-case
     in the file name.
   * spkidX is an optional part, used for laptops that have firmware
     configurations for different makes and models of internal speakers.
 
+The CS35L56 Rev B0 continues to use the old filename scheme because a
+large number of firmware files have already been published with these
+names.
+
 Sound Open Firmware and ALSA topology files
 -------------------------------------------
 
-- 
2.43.0

