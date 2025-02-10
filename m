Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031F52580C8;
	Mon, 10 Feb 2025 16:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205207; cv=none; b=sIVZxvf1YmO3nDbFglyoFYzjftZxEVEExYpSSiM8mthfIcCkzLdL3DParK9fIHBqBZ7FkzL3DbWVGFhZC9P6D2IQLM3jU0RnI8oh0HqiuUHnEgL/U+G1Nh5irg1/tBDcFDxRNfraa80qLJxP22pNQ6eEznMDtfvw8YkOKnY5MjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205207; c=relaxed/simple;
	bh=br7F7afwptizdr1oiuKD3QdjrR8wjSjiq13BCKPPxXM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aH2yFpDCG7LALJG0KmtCRZkwJYBo8YR5xM2dDS4RVJ2UZI/1urNlENqO06VPNk9CUNB/77BgQs82vBZ+o/lkl2qLvnbOLYu2wbsx4oj9unK0EHdXEm49mFueHuFRgNlug2zDPRWGMKEcHcl0ezPjR+q/drW6mQXj+NPfFb7e+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lkXoSoAa; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lkXoSoAa"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A5oi7T010709;
	Mon, 10 Feb 2025 10:33:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=RCfTDZ3fy/huZupf
	kfT/Zsrw+5k2qJ1eIsspXerkFB8=; b=lkXoSoAaKc72iMB2QFHBnIOhu4825kCz
	PzZNXZWsy+Sbl11U3LrxYdyfnHpGYXUZwGRMqs4Y3fwLVL6BlMZ4PQY7naFbhCbX
	1v6ioylddkWFTFcg90iwwTjyAz3IEoCF6Eg71i37hKQy4N6Dn5J8T/UekBf0Zu/O
	VEHsRWj2bx7oZ+AOunGjd4kZx29cOVjsrWU7Hw1gbSDN+obfH2mZDLR7zsxexrlH
	4wTzt03HZz7kjr5vO5+QEIIGh2k6vOsQd9kpDaTcDYqotvFLsFeMYtBGDiLbPe6u
	ODK1pcCG0vanoU2mW7XCdv7IJoOCLh7Q+TcFAQ7vWJAaExhcLAjoOA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44p5j732xb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:33:01 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 10 Feb
 2025 16:32:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Mon, 10 Feb 2025 16:32:59 +0000
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0DF82820248;
	Mon, 10 Feb 2025 16:32:59 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v1] ASoC: cs35l41: Fix acpi_device_hid() not found
Date: Mon, 10 Feb 2025 16:32:50 +0000
Message-ID: <20250210163256.1722350-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=EPD800ZC c=1 sm=1 tr=0 ts=67aa2a3d cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=lqNVsEComn0RoxZgVBsA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: jAKcYZg54E5_kyJTbwyUvZ2tKnz9c30w
X-Proofpoint-ORIG-GUID: jAKcYZg54E5_kyJTbwyUvZ2tKnz9c30w
X-Proofpoint-Spam-Reason: safe

Function acpi_device_hid() is only defined if CONFIG_ACPI is set.
Use #ifdef CONFIG_ACPI to ensure that cs35l41 driver only calls this
function is CONFIG_ACPI is define.

Fixes: 1d44a30ae3f9 ("ASoC: cs35l41: Fallback to using HID for system_name if no SUB is available")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502090100.SbXmGFqs-lkp@intel.com/

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 30b89018b113..ff4134bee858 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1148,6 +1148,7 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 	return ret;
 }
 
+#ifdef CONFIG_ACPI
 static int cs35l41_acpi_get_name(struct cs35l41_private *cs35l41)
 {
 	struct acpi_device *adev = ACPI_COMPANION(cs35l41->dev);
@@ -1180,6 +1181,12 @@ static int cs35l41_acpi_get_name(struct cs35l41_private *cs35l41)
 
 	return 0;
 }
+#else
+static int cs35l41_acpi_get_name(struct cs35l41_private *cs35l41)
+{
+	return 0;
+}
+#endif /* CONFIG_ACPI */
 
 int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *hw_cfg)
 {
-- 
2.43.0

