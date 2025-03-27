Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F1C215769;
	Thu, 27 Mar 2025 13:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743080449; cv=fail; b=j/w2Z9pL5Wc5Y/dklbLZ5QKEmDK0viMlS+kddoyoZb7dLoTToZ58kaaMhWsp60IhigkdFFyRR7/bnL9N51oiG9PLmryCCoDmebC3hUgiXj/RMrGFqFrSS9680jzHEjMb3Ju27z+r/XS9MBF1wXbLJe5oe0Auc+nocWWmiyS5vDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743080449; c=relaxed/simple;
	bh=tiBEVFcc7w1I3hGBVmM8wE+t+fivCS1kO5FZA9jrO5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUe0kaPRnx7sONDg7JfOYiU3D7ahkgFoQmnTsNgn2xFwlMYLSiXOvsfC9BKxcHa9S5ZGNe0fy+Ah5RaGIO2SJThaWyopzAoFbwaAZSMvkznnhaWhoDZ2FGtAz8JV1V5U/1RzBiOUlZnzV/RC8GOuWLFp9Mw1CT3HbTBMPhNtH/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hwsI4eJq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=h0yGYe4k; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hwsI4eJq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="h0yGYe4k"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R8ZkpS032284;
	Thu, 27 Mar 2025 08:00:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uaxN9Z6jdGB2UvOdNwa49OUT9bPA2k9j5KAeIDEq6yA=; b=
	hwsI4eJqnWTfPzKG6oiC7pKaUfPBBul2dSLNZCzViSvfzQoEvpCj6UfXsqmeB2Hv
	QxQNlwIYX48snUlSK6jhfAOgBAxnEN8FggLxDv4XE2vTr1yRnBdCi841ryDJPpVf
	3D7ZA/hi7juOJZtvxC19dTJwAyuis0JFmKEhk6gMEFzJStUQebjtSiIMo4DB43so
	II+aaa6DOKocAaP4lMu3furkiGS33hfbcfJWqolxdWEy+kRGZdQ3Y/GlAyhl4NgW
	XijNLT6dN+rQFbeeN19Ac1cRkEoCwnveIp5CDTzfhwHCRYS+9C10vz1A9aWC1fGm
	ilkR74zo+dCYM0SaUch3Nw==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45kmrgvq50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 08:00:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGmmuqYjMMy6Twk8tHE0x3anUW8spQf/x8I5qVV0LCHrXGB6QgEJIEK3vQMHeDOTMNAg/liYDrN4AKXat3dz7LNuKPksubtSSXMWF7vlr84zHhFEkrVXwyedzLvYInCqB3iOIQu6HTdcJglCDPYz8s2dqa9ZDoQ1cEBsretC2jtOuDcYDHQoJY2uekV6qaoLl1DXDnYN2NjghhxYIC6SE6k4ux/dGg/CsN62P+VbWK3sSdv8P1Y8nGSYQL0GqYW9mTLb5cjZGESSUHrM79zfkHNs2T8B4PiNvxU65XWkX4YK9uNiB4TwT+BWV2OeJ+cX7pCHEZCZeC4CXYS4qjj4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaxN9Z6jdGB2UvOdNwa49OUT9bPA2k9j5KAeIDEq6yA=;
 b=pw3SalfmVJRp1DPknJ8h7iytYUWKMq66b6MOGA5V0T/cq2ZPgzQFN8WagpR26+9l8E+NZQZWTz0Q1NATNjmALzubStUTFCBxfGOjbBwcssIHjbEENPsny5T3XSG5oZ6U8y208ag8V/lByF91Lr8F7CkRuzLLyAhSlrAlxe02cdj6Aowbj2Lx8bYXSyfCD5RWTn9Io2ZH3YchM2rndQJTkfifXavWayVR7yaR2CcvHqGg9MtJpqPPky1cBBd1hkSHC9mmssS4AoBx6Kr81H2lWmHzPa2IOcLFDfUmj/r2zTz1NDrnC+Gjo7Fmt4XRpZHO37M8wuZdcymbSKH4kWzZ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com smtp.mailfrom=cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaxN9Z6jdGB2UvOdNwa49OUT9bPA2k9j5KAeIDEq6yA=;
 b=h0yGYe4kq73Qt6vZUMw6IibizlJC/ZrqHHj4cFlSUfT8KD0b4Gu8rFCxiFrFt892/meqMC/UyUNpVH8YRDJ9BVo/0bKv09uwnx1XhGPwO+acZp3XqzWQ1gIsj0MzF/nI8qCsrEWBVFkL8gStaQ73/KPTcsBL6Bo8zL1Qc+I+Kzw=
Received: from CH0PR07CA0020.namprd07.prod.outlook.com (2603:10b6:610:32::25)
 by SJ1PR19MB6236.namprd19.prod.outlook.com (2603:10b6:a03:459::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 13:00:15 +0000
Received: from CH2PEPF0000009A.namprd02.prod.outlook.com
 (2603:10b6:610:32:cafe::9f) by CH0PR07CA0020.outlook.office365.com
 (2603:10b6:610:32::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Thu,
 27 Mar 2025 13:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000009A.mail.protection.outlook.com (10.167.244.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 13:00:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 01BF1406545;
	Thu, 27 Mar 2025 13:00:13 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D886982255E;
	Thu, 27 Mar 2025 13:00:12 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 3/3] ASoC: SDCA: Create DAI drivers from DisCo
Date: Thu, 27 Mar 2025 13:00:12 +0000
Message-Id: <20250327130012.3378732-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250327130012.3378732-1-ckeepax@opensource.cirrus.com>
References: <20250327130012.3378732-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009A:EE_|SJ1PR19MB6236:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 13bcf93a-2968-405e-c38f-08dd6d2f50cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZE4mDQUL9q5dtXyZstdeJD2zbIdnW28ds9IV5m6cCBrmGMY4M1MPXWpUIpje?=
 =?us-ascii?Q?NfuTO8dmZXfgJjc1xv7ZPG9CfbaTYRXdp3pTCVEJ6fgJ/4jV0RwJ6tUlJZ9c?=
 =?us-ascii?Q?sR7dQdM5US4lrclibhMzQ+Mo1uPNzI8iUuQsFf47SGCkOmico5v9zxzxz9oA?=
 =?us-ascii?Q?dTE6xH6vn5xsnf93nZyOMQijMTe25WL0X0kP9gmJFAxF0Oo69Yrjd2qWVxgg?=
 =?us-ascii?Q?5tzYCAxhu51IRXfEiTAERP3Rj1ojrRwL1GFgpqwWdeOQ130+gWJNPgQS9IzO?=
 =?us-ascii?Q?7Wr6XmNcTXfb5TM42ZDCgn/zmb8WZBQhfuqMzl060tAI/33WW3t+GtvTEwcf?=
 =?us-ascii?Q?7zxUPxWByAQh1xTsMaBMz6/DKkT0IuOQWjon9uFLIQ+M18k72AJeh8nYWYd+?=
 =?us-ascii?Q?dZIk198hyo6sKIsrt/5Nq8fy/oVEP7IdM/aL9xoLc/OWYVyK+iw5PA2RZkC0?=
 =?us-ascii?Q?aKQ5Y596Q5CIdNLCU42ijy+8dJv7fez3n4Pm9I47LHjn94ykSPG9QnHu9Jbn?=
 =?us-ascii?Q?PZmWOwS7H24ajpnNDPdnQWXedkTn9jgQdAd6He4MVWCEUW5f8DZjffWD1Bw8?=
 =?us-ascii?Q?efkZ4g6r7FQH9iTeAt3EodaDD/o2dxD8av+5SqKssT9eDJhpKcGV8BZjjiJh?=
 =?us-ascii?Q?pW+jzLrCAjzHIsOfhDYFhpgydm8B2iEg4yLm+0CbBfapxKXom3VSLZRkw/2d?=
 =?us-ascii?Q?oUCixWlDC7bQcjjxdM0eBcLjxuJmEAXwVWqVF695vIQ27Oh3tFRATNwXbDgi?=
 =?us-ascii?Q?Jvfb5bVfdcxe3A3ik4jflCmoj55sOKgumaR/uSyKnkQ0sCabruxP4ztj4VFQ?=
 =?us-ascii?Q?hFg+JMVBnzWbE7UaBpGDW7A/XrbODnZt8iUBuJbN9oVFudbMBSKQPBbLdGE7?=
 =?us-ascii?Q?NcxSyOoQr7usvZXTKDVoR+xtPdGzDojFTKQuB5IkDY38cX9MdyaMC9eNj/CN?=
 =?us-ascii?Q?RyiEyx59hGkLmicAfqUsdYVV9ghIglRbDbuqniEWodVbimrwq1GPDRHQTuXL?=
 =?us-ascii?Q?zF32At1l4jqp3MlNjpzyT2Y5+k1PVxi8Nm7S3NlARTA50M29yc0Q4lofKNUe?=
 =?us-ascii?Q?sVl5ma49sl67FJXtHCpnubWzBFVdNim3ZPUS2a6vywoJn8gmfVsHTAjM3kTi?=
 =?us-ascii?Q?iiTQS6VNYsN+Tzz1HJg93c3RCjHxVcJHykTDm7TBc+cVVxPr4Sj8rB9iphHC?=
 =?us-ascii?Q?LKsz9JPuKtL7CC19RO9W9r3asHClxxHoMoVtogk5yg836e3RdxERhgLQtIXB?=
 =?us-ascii?Q?2+IL1Ni+15SwdeX7l2rymTcXG9iZt9jD9QoWDnj0Dy8MX4Y8PAPMPG6kKOfE?=
 =?us-ascii?Q?buGHRRGukVEXAO5Xbyyz843/1TJMdQOy8q7toG0qT+mCFv+cp67df7reCnKb?=
 =?us-ascii?Q?pY76QEs7cC37wuW1aVWrfI8S3y2qjHOPirNXvSf+LHQpKcd5l5U79vZ4h684?=
 =?us-ascii?Q?Oc94ZFMNNdbI3KeRJ0eHkrYOt6ScW5CxtuXvmlIOrLKsCeN+zxpwhQk+GcPX?=
 =?us-ascii?Q?nO2BXWTzx4ofrfHrGMOKRNulTXwrb8fuDAHQ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 13:00:14.0531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bcf93a-2968-405e-c38f-08dd6d2f50cd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR19MB6236
X-Authority-Analysis: v=2.4 cv=GrdC+l1C c=1 sm=1 tr=0 ts=67e54be2 cx=c_pps a=AuG0SFjpmAmqNFFXyzUckA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Vs1iUdzkB0EA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=mtmGHodxziJHnfEkOdcA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-GUID: 7Lu2wQAJeb5-AITz5eyS1b0uXrvjqB09
X-Proofpoint-ORIG-GUID: 7Lu2wQAJeb5-AITz5eyS1b0uXrvjqB09
X-Proofpoint-Spam-Reason: safe

Use the previously parsed DisCo information from ACPI to create the DAI
drivers required to connect an SDCA Function into an ASoC soundcard.

Create DAI driver structures and populate the supported sample rates
and sample widths into them based on the Input/Output Terminal and any
attach Clock Source entities. More complex relationships with channels
etc. will be added later as constraints as part of the DAI startup.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

 include/sound/sdca_asoc.h     |  12 +-
 include/sound/sdca_function.h |  23 ++++
 sound/soc/sdca/sdca_asoc.c    | 209 +++++++++++++++++++++++++++++++++-
 3 files changed, 238 insertions(+), 6 deletions(-)

diff --git a/include/sound/sdca_asoc.h b/include/sound/sdca_asoc.h
index d19e7e969283..9121531f0826 100644
--- a/include/sound/sdca_asoc.h
+++ b/include/sound/sdca_asoc.h
@@ -14,11 +14,14 @@ struct device;
 struct sdca_function_data;
 struct snd_kcontrol_new;
 struct snd_soc_component_driver;
+struct snd_soc_dai_driver;
+struct snd_soc_dai_ops;
 struct snd_soc_dapm_route;
 struct snd_soc_dapm_widget;
 
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes, int *num_controls);
+			      int *num_widgets, int *num_routes, int *num_controls,
+			      int *num_dais);
 
 int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *function,
 			    struct snd_soc_dapm_widget *widgets,
@@ -26,9 +29,14 @@ int sdca_asoc_populate_dapm(struct device *dev, struct sdca_function_data *funct
 int sdca_asoc_populate_controls(struct device *dev,
 				struct sdca_function_data *function,
 				struct snd_kcontrol_new *kctl);
+int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
+			    struct snd_soc_dai_driver *dais,
+			    const struct snd_soc_dai_ops *ops);
 
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
-				 struct snd_soc_component_driver *component_drv);
+				 struct snd_soc_component_driver *component_drv,
+				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
+				 const struct snd_soc_dai_ops *ops);
 
 #endif // __SDCA_ASOC_H__
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 77ffb1f4e1ca..be7e4a88cbed 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -168,6 +168,20 @@ enum sdca_ot_controls {
 	SDCA_CTL_OT_NDAI_PACKETTYPE			= 0x17,
 };
 
+/**
+ * enum sdca_usage_range - Column definitions for Usage
+ */
+enum sdca_usage_range {
+	SDCA_USAGE_NUMBER				= 0,
+	SDCA_USAGE_CBN					= 1,
+	SDCA_USAGE_SAMPLE_RATE				= 2,
+	SDCA_USAGE_SAMPLE_WIDTH				= 3,
+	SDCA_USAGE_FULL_SCALE				= 4,
+	SDCA_USAGE_NOISE_FLOOR				= 5,
+	SDCA_USAGE_TAG					= 6,
+	SDCA_USAGE_NCOLS				= 7,
+};
+
 /**
  * enum sdca_mu_controls - SDCA Controls for Mixer Unit
  *
@@ -246,6 +260,15 @@ enum sdca_cs_controls {
 	SDCA_CTL_CS_SAMPLERATEINDEX			= 0x10,
 };
 
+/**
+ * enum sdca_samplerateindex_range - Column definitions for SampleRateIndex
+ */
+enum sdca_samplerateindex_range {
+	SDCA_SAMPLERATEINDEX_INDEX			= 0,
+	SDCA_SAMPLERATEINDEX_RATE			= 1,
+	SDCA_SAMPLERATEINDEX_NCOLS			= 2,
+};
+
 /**
  * enum sdca_cx_controls - SDCA Controls for Clock Selector
  *
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index a3184189eda0..3bfeb47d2111 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -81,13 +81,15 @@ static bool exported_control(struct sdca_control *control)
 }
 
 int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *function,
-			      int *num_widgets, int *num_routes, int *num_controls)
+			      int *num_widgets, int *num_routes, int *num_controls,
+			      int *num_dais)
 {
 	int i, j;
 
 	*num_widgets = function->num_entities - 1;
 	*num_routes = 0;
 	*num_controls = 0;
+	*num_dais = 0;
 
 	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
@@ -97,6 +99,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 		case SDCA_ENTITY_TYPE_OT:
 			*num_routes += !!entity->iot.clock;
 			*num_routes += !!entity->iot.is_dataport;
+			*num_dais += !!entity->iot.is_dataport;
 			break;
 		case SDCA_ENTITY_TYPE_PDE:
 			*num_routes += entity->pde.num_managed;
@@ -942,18 +945,205 @@ int sdca_asoc_populate_controls(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_controls, "SND_SOC_SDCA");
 
+static unsigned int rate_find_mask(unsigned int rate)
+{
+	switch (rate) {
+	case 0:
+		return SNDRV_PCM_RATE_8000_768000;
+	case 5512:
+		return SNDRV_PCM_RATE_5512;
+	case 8000:
+		return SNDRV_PCM_RATE_8000;
+	case 11025:
+		return SNDRV_PCM_RATE_11025;
+	case 16000:
+		return SNDRV_PCM_RATE_16000;
+	case 22050:
+		return SNDRV_PCM_RATE_22050;
+	case 32000:
+		return SNDRV_PCM_RATE_32000;
+	case 44100:
+		return SNDRV_PCM_RATE_44100;
+	case 48000:
+		return SNDRV_PCM_RATE_48000;
+	case 64000:
+		return SNDRV_PCM_RATE_64000;
+	case 88200:
+		return SNDRV_PCM_RATE_88200;
+	case 96000:
+		return SNDRV_PCM_RATE_96000;
+	case 176400:
+		return SNDRV_PCM_RATE_176400;
+	case 192000:
+		return SNDRV_PCM_RATE_192000;
+	case 352800:
+		return SNDRV_PCM_RATE_352800;
+	case 384000:
+		return SNDRV_PCM_RATE_384000;
+	case 705600:
+		return SNDRV_PCM_RATE_705600;
+	case 768000:
+		return SNDRV_PCM_RATE_768000;
+	case 12000:
+		return SNDRV_PCM_RATE_12000;
+	case 24000:
+		return SNDRV_PCM_RATE_24000;
+	case 128000:
+		return SNDRV_PCM_RATE_128000;
+	default:
+		return 0;
+	}
+}
+
+static u64 width_find_mask(unsigned int bits)
+{
+	switch (bits) {
+	case 0:
+		return SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
+		       SNDRV_PCM_FMTBIT_S20_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		       SNDRV_PCM_FMTBIT_S32_LE;
+	case 8:
+		return SNDRV_PCM_FMTBIT_S8;
+	case 16:
+		return SNDRV_PCM_FMTBIT_S16_LE;
+	case 20:
+		return SNDRV_PCM_FMTBIT_S20_LE;
+	case 24:
+		return SNDRV_PCM_FMTBIT_S24_LE;
+	case 32:
+		return SNDRV_PCM_FMTBIT_S32_LE;
+	default:
+		return 0;
+	}
+}
+
+static int populate_rate_format(struct device *dev,
+				struct sdca_function_data *function,
+				struct sdca_entity *entity,
+				struct snd_soc_pcm_stream *stream)
+{
+	struct sdca_control_range *range;
+	unsigned int sample_rate, sample_width;
+	unsigned int clock_rates = 0;
+	unsigned int rates = 0;
+	u64 formats = 0;
+	int sel, i;
+
+	switch (entity->type) {
+	case SDCA_ENTITY_TYPE_IT:
+		sel = SDCA_CTL_IT_USAGE;
+		break;
+	case SDCA_ENTITY_TYPE_OT:
+		sel = SDCA_CTL_OT_USAGE;
+		break;
+	default:
+		dev_err(dev, "%s: entity type has no usage control\n",
+			entity->label);
+		return -EINVAL;
+	}
+
+	if (entity->iot.clock) {
+		range = selector_find_range(dev, entity->iot.clock,
+					    SDCA_CTL_CS_SAMPLERATEINDEX,
+					    SDCA_SAMPLERATEINDEX_NCOLS, 0);
+		if (!range)
+			return -EINVAL;
+
+		for (i = 0; i < range->rows; i++) {
+			sample_rate = sdca_range(range, SDCA_SAMPLERATEINDEX_RATE, i);
+			clock_rates |= rate_find_mask(sample_rate);
+		}
+	} else {
+		clock_rates = UINT_MAX;
+	}
+
+	range = selector_find_range(dev, entity, sel, SDCA_USAGE_NCOLS, 0);
+	if (!range)
+		return -EINVAL;
+
+	for (i = 0; i < range->rows; i++) {
+		sample_rate = sdca_range(range, SDCA_USAGE_SAMPLE_RATE, i);
+		sample_rate = rate_find_mask(sample_rate);
+
+		if (sample_rate & clock_rates) {
+			rates |= sample_rate;
+
+			sample_width = sdca_range(range, SDCA_USAGE_SAMPLE_WIDTH, i);
+			formats |= width_find_mask(sample_width);
+		}
+	}
+
+	stream->formats = formats;
+	stream->rates = rates;
+
+	return 0;
+}
+
+int sdca_asoc_populate_dais(struct device *dev, struct sdca_function_data *function,
+			    struct snd_soc_dai_driver *dais,
+			    const struct snd_soc_dai_ops *ops)
+{
+	int i, j;
+	int ret;
+
+	for (i = 0, j = 0; i < function->num_entities - 1; i++) {
+		struct sdca_entity *entity = &function->entities[i];
+		struct snd_soc_pcm_stream *stream;
+		const char *stream_suffix;
+
+		switch (entity->type) {
+		case SDCA_ENTITY_TYPE_IT:
+			stream = &dais[j].playback;
+			stream_suffix = "Playback";
+			break;
+		case SDCA_ENTITY_TYPE_OT:
+			stream = &dais[j].capture;
+			stream_suffix = "Capture";
+			break;
+		default:
+			continue;
+		}
+
+		if (!entity->iot.is_dataport)
+			continue;
+
+		stream->stream_name = devm_kasprintf(dev, GFP_KERNEL, "%s %s",
+						     entity->label, stream_suffix);
+		if (!stream->stream_name)
+			return -ENOMEM;
+		/* Channels will be further limited by constraints */
+		stream->channels_min = 1;
+		stream->channels_max = SDCA_MAX_CHANNEL_COUNT;
+
+		ret = populate_rate_format(dev, function, entity, stream);
+		if (ret)
+			return ret;
+
+		dais[j].id = i;
+		dais[j].name = entity->label;
+		dais[j].ops = ops;
+		j++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_asoc_populate_dais, "SND_SOC_SDCA");
+
 int sdca_asoc_populate_component(struct device *dev,
 				 struct sdca_function_data *function,
-				 struct snd_soc_component_driver *component_drv)
+				 struct snd_soc_component_driver *component_drv,
+				 struct snd_soc_dai_driver **dai_drv, int *num_dai_drv,
+				 const struct snd_soc_dai_ops *ops)
 {
 	struct snd_soc_dapm_widget *widgets;
 	struct snd_soc_dapm_route *routes;
 	struct snd_kcontrol_new *controls;
-	int num_widgets, num_routes, num_controls;
+	struct snd_soc_dai_driver *dais;
+	int num_widgets, num_routes, num_controls, num_dais;
 	int ret;
 
 	ret = sdca_asoc_count_component(dev, function, &num_widgets, &num_routes,
-					&num_controls);
+					&num_controls, &num_dais);
 	if (ret)
 		return ret;
 
@@ -969,6 +1159,10 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (!controls)
 		return -ENOMEM;
 
+	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
 	ret = sdca_asoc_populate_dapm(dev, function, widgets, routes);
 	if (ret)
 		return ret;
@@ -977,6 +1171,10 @@ int sdca_asoc_populate_component(struct device *dev,
 	if (ret)
 		return ret;
 
+	ret = sdca_asoc_populate_dais(dev, function, dais, ops);
+	if (ret)
+		return ret;
+
 	component_drv->dapm_widgets = widgets;
 	component_drv->num_dapm_widgets = num_widgets;
 	component_drv->dapm_routes = routes;
@@ -984,6 +1182,9 @@ int sdca_asoc_populate_component(struct device *dev,
 	component_drv->controls = controls;
 	component_drv->num_controls = num_controls;
 
+	*dai_drv = dais;
+	*num_dai_drv = num_dais;
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(sdca_asoc_populate_component, "SND_SOC_SDCA");
-- 
2.39.5

