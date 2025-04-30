Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E647F242909;
	Wed, 30 Apr 2025 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009126; cv=fail; b=p3l+BZG2c+RzNT52B1asLvEB7Nnr1FZ44tCQ+wOCoW4EQyWmkboXb5Nhbzw8riYi4IshF9eRFVAWQhjQeJx9shpnbwaLN8YqDuEfiiVfeXD/zHWqv/kBBVVOf1xdypJeYIRDp8Hok/94qZYWZfa+pJBazslDLLz9Bw8jf3853iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009126; c=relaxed/simple;
	bh=DVJYDet/0pDs3/wEKzc9k/V5Ci/HEpWHaTa2RsEpQe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DBYme0bC5sGxmBYSR3jDvJEAco9ubLn2DzCLub/twU5Mp/AmdotYlyU2PlT/QPUa4BiQKcRS74m3YA7RY58GQNJAZ5h/TIbC68/uEYCv6p3RszYkW+DpVXNhh/RfW1f56dIv4Idz8iPUGzM2QzHTlXwYivsdkt8iDEDfu681GGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=jexa9U12; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hx+2Gj9Q; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="jexa9U12";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hx+2Gj9Q"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U59NTd011878;
	Wed, 30 Apr 2025 05:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=EJuAsS7H8Vn8IhFU77zXi9HBY2Ktb3366YiqRjQbmFE=; b=
	jexa9U12bpQHK7aQw4XvAVsgrnXjORLD9G3HunWhwRvj2NZ0S/ku0NYLlGGgoc4f
	+3H3FUBjQczguv4Vz+HBtIOxqBzQeGw4a90TkOCXtdQErfAuSIekmdoM1WVwPEFv
	yAOv0HrsLFOwbCAxl8mXIUf3Wu9+RtOfcA2ukOZ4jZ5AoDW7GiZosq9Ck9UDNj/6
	0udhuXBLSvL3XMNZpuZDTfHZ/ZBtnnb96+h/nQEUbnQd94LyyUhzJLLIn52dU31E
	InwVl2M7f01WDIGat9QSwCYsSR++DazDh975DH5Z1X63dVBoeK2aWw9IlcQ7/Gh/
	pKr97oXc7REiWdeH42TK1g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 46b6te8s9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 05:31:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhZERSyBZLfwckJdFbiGIfqfa9XPFjzJYRugvIELcMhR0FOa/8LUdcW0dxG1bADWZrJhxR8ghDs82hovact6O/KuEyjBQ7IXSySPOc6xxWTftEO6T/SgvWJvJEEg7HR3eVztDVQFifcvmEeou3h9NbB6ngnhyIeVQELPvA97MInGb6U2riI1QVUu4QQpmw/GmvBYPejRXjNCseg7548k/0dBHIAv+EyB9Rpo8KCd1jntIOPxNHjF80tVM9JViCJ6nybL/tc7UKvQyNxHxvT6XzSgKpdOSQVxBgxRaBGgKk15cU5y1HDwYQSTzzRqBt3k2Yfqxyt3nd9VOj5gZXiokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJuAsS7H8Vn8IhFU77zXi9HBY2Ktb3366YiqRjQbmFE=;
 b=qpU3rQXQ8rfKFH5LQoAaWYYpFKh8zSPT/u4frjBH8dh+e7trYHT4RztfvztbUb6eap+DsIFz6Xtu7rZONAhmJnXw1Athce0icccIiHnPRUySYyGEvBymHRCzPuRLCarzpF3+jSJKUHVdojXCiJFsTRuLld+x3dcfFz7cje0m8R/PtgFiciljs5KZUeZ0ASlA352DxbXN/14YFfBCRHVmQN0ZF/Ah2JDJeTsVaeODfgVHzSIRD5fS+BteDA4DCCqzXgZPvkySJttsbd0B6+Nv+CxqzRIRc6Ks7JDY4vhIAV/2IYiISG9AVqPAARzwf7R+dmFD/U47KqQwJ3mhRFd9YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJuAsS7H8Vn8IhFU77zXi9HBY2Ktb3366YiqRjQbmFE=;
 b=hx+2Gj9QibR63u1wlVjBDHH8JtAeogg7UptUgi+I4XKC3NyO1IMNxw/TeGVYbEwR4X4E9vp0cctO+iCJAuVz4jPdgj6CIC86Kss31KsD2JBF9ryY4FJANoBjYMni80+uAlQlhEkU/gz6iL/FJofnib8GEfa8ba6yltlnTy1Nth4=
Received: from SA1P222CA0145.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::29)
 by PH7PR19MB6614.namprd19.prod.outlook.com (2603:10b6:510:1b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 10:31:42 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::2a) by SA1P222CA0145.outlook.office365.com
 (2603:10b6:806:3c2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 10:31:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20
 via Frontend Transport; Wed, 30 Apr 2025 10:31:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C6E3740654A;
	Wed, 30 Apr 2025 10:31:40 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8B66982025A;
	Wed, 30 Apr 2025 10:31:40 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/2] ASoC: intel/sdw_utils: Add volume limit to cs42l43 speakers
Date: Wed, 30 Apr 2025 11:31:19 +0100
Message-ID: <20250430103134.24579-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103134.24579-1-sbinding@opensource.cirrus.com>
References: <20250430103134.24579-1-sbinding@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|PH7PR19MB6614:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2afc8e54-f8b3-4e31-8e32-08dd87d232c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G7+x9NtBolqpQNDOOIVWPG7+d5bjOKkLso1GVGDdW0avRhApZHWFUaqMUGlC?=
 =?us-ascii?Q?OUwofM/eueS3PwWGMuM5vck5CHTNVdgC4cqi9c+2YKnFY60ycCLcexOGIBj4?=
 =?us-ascii?Q?fIOzDgdDnKZWd4kn0z1Y8MS2bkrx2eoebLbpXe2Z8ZZh+2y6SNmXuMEjd8Q7?=
 =?us-ascii?Q?yVyePg/pa3BmboYwZD8ePdTg8i0OMX6OLxY4IwYXVe82k6On7C3jZoWtGXmQ?=
 =?us-ascii?Q?DLRDyW5SlKDhziA0iwYSAlcCDMiYAPAiMam48CJE4r8ewX/5N0EY5tOTsj/Q?=
 =?us-ascii?Q?ZbPWiSJbt6ciwd9GhuYgH/Ndti3O0WZrVIBvH/5gE0icjnu15pauYHu6TtD9?=
 =?us-ascii?Q?VdNwEni7ERtUbfANBPRla/G3QiHqF6NjrVXxA4i+o4BTQuZURICPyfGhiaVf?=
 =?us-ascii?Q?j2bCh6D9kdMeX+WmRBn1rnqQVhQXucFYiINAC5V61QU8TyYSkrzz6dYFg1cn?=
 =?us-ascii?Q?VR7UoTmrf678n9U12lU289aD0rWhUydJbrC/LDlt5ZHYIJFyzurZZj++Vbri?=
 =?us-ascii?Q?/LS4QvZ1b5sC7ECahGTpaAsr4+7thhOb2GxJW1t12yHtJGGEY1mH8JSbMfJp?=
 =?us-ascii?Q?RzsrubC6/2AEg+DSYfdMDqUGa0QZALAkkT2P5aJx8Q+REf8uRKU/YNH6Lgdy?=
 =?us-ascii?Q?VX0uSllKJrzJzVLT+rx6FMOIN65mZUyVk6qqF2uF/MUemdOhWlNunQ3yoN/O?=
 =?us-ascii?Q?awMyqEAYMruiLj961cwLOn7GLjwMJyLcmfoBNkKYkr7amOXYBN1OHJnUgbPQ?=
 =?us-ascii?Q?syV3Lhp8fdQbPburFNpu0K3qVzKWKl7fD7fK5zjoOx6OeFJJTwawN+BmnPiP?=
 =?us-ascii?Q?7bbgaDzppSmj954iXfWwcvCCFYPdKzZhrkOXowkCUT53zXVYyU4h1yTZRvc1?=
 =?us-ascii?Q?ymMEJrHx/9CLcMIDvSYE2aHJ/U6TrQ2xwbDfRfjT82nx3WyXr5tQ8tImrS7F?=
 =?us-ascii?Q?DT1ku9oPGA6L88MH+4OoU2zh3yGw+gU2YDgG/VQpCNI9T+wcVFjVYw70Sld7?=
 =?us-ascii?Q?1gcququBnb+8D+2fOzEodc7Ufj9/kASMa9rpmXktG7fOiIhsiqFPlO8cxMme?=
 =?us-ascii?Q?IgxzQoneauPzbdGcnZ5/BmTupO1vLGRtEdsbS0LtFpBo+H2gC/ho3wP6dJwc?=
 =?us-ascii?Q?pY8VzcDqOIqXE0dsZFcNts5YsUGbqXy17L1bJ4X9KJKmM2qi/AK1csXEOsu7?=
 =?us-ascii?Q?+3k+3rUraM8U3aHdiEJi7BLwOVttbralDvOMpjCo24SQ4AIvjoZwYyVWamO5?=
 =?us-ascii?Q?VV8XS7o93q+ukdhnT+kl/LOFsUr07mijmaXLfOyAdbvMVFCj6ZmWaRcAlRpN?=
 =?us-ascii?Q?79u+WXlXd2iSipYerDRZfsUwO71FqOTGqYywFfxZAJCo3a3JmBO7ztIBV/uc?=
 =?us-ascii?Q?bO3TawwMKJr+FkydmXjefyN7aPgjRhOns1oGHkOUkhWVsmKKGz7otpquTu+g?=
 =?us-ascii?Q?DYO0TCc/WXGXkJfNlsTFkSngh92Pyuhe6uGL6QMAdxLq2ZeGHTrOCzw9eUdu?=
 =?us-ascii?Q?rNgNusxlYRfQ6s9g75TvDYciAYHf8d62dReY?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 10:31:41.8614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afc8e54-f8b3-4e31-8e32-08dd87d232c7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB6614
X-Proofpoint-ORIG-GUID: teuBmYlnHNJimHi6BsFsjXK09ju3i-_S
X-Proofpoint-GUID: teuBmYlnHNJimHi6BsFsjXK09ju3i-_S
X-Authority-Analysis: v=2.4 cv=I9ZlRMgg c=1 sm=1 tr=0 ts=6811fc12 cx=c_pps a=pa2+2WWV+ihErLhOOf7pAQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XR8D0OoHHMoA:10 a=s63m1ICgrNkA:10
 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=M2rmU9CzWK2IVHtl3OYA:9 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NCBTYWx0ZWRfX1j/dvgQzNzjC ihGPfpGet4DhAnWlOO0WIS+gAS+lz7X6lXu5cNDlp3djRqDdFIzmz95qkxlWB7z84YvInrK09l+ t+cJG5xhigXjae3bz2U8LWmMUFf1Dx3gewlarJ3jI6oCqHSjZLHXpemOk4CN95NH7sQdEyB/ov+
 hlWtFXtLuTlajkd8aAUlP7jGBxzJanHfiTeWRzCgRl6mssGMiHxBlNGSvvSsBBcMNA6po3/vRWK JoJXoeBQ96yJLxClGH67JeH+p5E3gNLmOxjAcA7/hhJvRM/XDnzjHZmg2mAGhk/6PyVZMRAogUa tDtQEX9Xqg7e1L7j4mZ3aYiipzsR3Z/Qowy8/5sjdpuQYpOd+DqvM1sacHojr4qhngaZey0/Xyc
 aujiIrPEa02ZBle++AuVj2qzQmGrrTuU/7Q1HRL3KJq9PUQWbtcrilwcuPGwjXnMNExcR9tS
X-Proofpoint-Spam-Reason: safe

The volume control for cs42l43 speakers has a maximum gain of +31.5 dB.
However, for many use cases, this can cause distorted audio, depending
various factors, such as other signal-processing elements in the chain,
for example if the audio passes through a gain control before reaching
the codec or the signal path has been tuned for a particular maximum
gain in the codec.

In the case of systems which use the soc_sdw_cs42l43 driver, audio will
likely be distorted in all cases above 0 dB, therefore add a volume
limit of 128, which is 0 dB maximum volume inside this driver.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/sdw_utils/soc_sdw_cs42l43.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
index 668c9d28a1c1..b415d45d520d 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
@@ -20,6 +20,8 @@
 #include <sound/soc-dapm.h>
 #include <sound/soc_sdw_utils.h>
 
+#define CS42L43_SPK_VOLUME_0DB	128 /* 0dB Max */
+
 static const struct snd_soc_dapm_route cs42l43_hs_map[] = {
 	{ "Headphone", NULL, "cs42l43 AMP3_OUT" },
 	{ "Headphone", NULL, "cs42l43 AMP4_OUT" },
@@ -117,6 +119,14 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 			return -ENOMEM;
 	}
 
+	ret = snd_soc_limit_volume(card, "cs42l43 Speaker Digital Volume",
+				   CS42L43_SPK_VOLUME_0DB);
+	if (ret)
+		dev_err(card->dev, "cs42l43 speaker volume limit failed: %d\n", ret);
+	else
+		dev_info(card->dev, "Setting CS42L43 Speaker volume limit to %d\n",
+			 CS42L43_SPK_VOLUME_0DB);
+
 	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_spk_map,
 				      ARRAY_SIZE(cs42l43_spk_map));
 	if (ret)
-- 
2.43.0

