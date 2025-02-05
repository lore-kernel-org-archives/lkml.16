Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598D3193436;
	Wed,  5 Feb 2025 16:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774105; cv=none; b=Fg+9MhpM9MB6LZca0gWlFrmGPKAoosa/1/bKoFgU9JWcXo8IeB5s4rm4WC7zhHU47A2ITB0RqR/cynfOLdkNRqz4R6RQlJnGxKXw5GZPpE+nS36IoPux7SKxMNXwfVkLI0+82YZMsxBz72xPbjnP7Za2fXIkFGdJpiPqinsXz24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774105; c=relaxed/simple;
	bh=BI3bjBco9tZG254KI6RaPflP15hfUJtypUrTq3SM2jo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N63HENRLiST2+5GanH4USGHFVbx767Yy8Cy/sWs0jUCsJNzwMmDl9j4J/WBeX79q8SeICwmPPgh5MWJHnKazCeAAH8oJn4creR9kBownAqUTgVXh9zc9wpxKGuBNzOSanTmPZB9PfSad5fi0hOKOgS3i1PZ6ECQAL7jL0bor1hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bMhEr1Q7; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bMhEr1Q7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515E9T1Q028452;
	Wed, 5 Feb 2025 10:48:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=5jqd7EmYfSYVj5aE
	NZdmgRqV9fqu9H0OVa048XIRD/8=; b=bMhEr1Q7bdh7/x7upDJl/QY+XxFYiUD3
	+GrQ5WH3RVcIi6WtEHC/USkQMfJ4/z3059TzIi3GfUUe7qMVQ+/BurSWRYDSOJ/m
	tB6q4EUDN2ySn6yp0+IYQRC2iU3KKgyN//Y5UcIXQ8dS69bh6HZjkNJ/iXc4UcHe
	ktuNBWoteT72i6bD+Zcho40wO5L6wHNGB7L6xK3gvRO20d8ZmB4YwVr8tZsHuMR7
	saochuDf1Kc/fGGEtVmVdwqyEuWwKdIRIz2NBoK6zr25Z87YE7UYiWboD0FLt9ci
	PXFZsGWbTVhdrLiVqghVAOFxYCeeDuGexq9nCQIoHUP2eeM8vKUtBw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm4sh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 10:48:11 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 16:48:09 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 16:48:09 +0000
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BAD83820248;
	Wed,  5 Feb 2025 16:48:09 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ASoC: cs35l41: Fallback to using HID for system_name if no SUB is available
Date: Wed, 5 Feb 2025 16:48:04 +0000
Message-ID: <20250205164806.414020-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a3964b cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=gnEUMM8qirKkv39zU4sA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: KTC7nA-QbyDe-mAp3s2Suskua_Udz4lt
X-Proofpoint-GUID: KTC7nA-QbyDe-mAp3s2Suskua_Udz4lt
X-Proofpoint-Spam-Reason: safe

For systems which load firmware on the cs35l41 which use ACPI, the
_SUB value is used to differentiate firmware and tuning files for the
individual systems. In the case where a system does not have a _SUB
defined in ACPI node for cs35l41, there needs to be a fallback to
allow the files for that system to be differentiated. Since all
ACPI nodes for cs35l41 should have a HID defined, the HID should be a
safe option.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 07a5cab35fe1..30b89018b113 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1150,19 +1150,28 @@ static int cs35l41_dsp_init(struct cs35l41_private *cs35l41)
 
 static int cs35l41_acpi_get_name(struct cs35l41_private *cs35l41)
 {
-	acpi_handle handle = ACPI_HANDLE(cs35l41->dev);
+	struct acpi_device *adev = ACPI_COMPANION(cs35l41->dev);
+	acpi_handle handle = acpi_device_handle(adev);
+	const char *hid;
 	const char *sub;
 
-	/* If there is no ACPI_HANDLE, there is no ACPI for this system, return 0 */
-	if (!handle)
+	/* If there is no acpi_device, there is no ACPI for this system, return 0 */
+	if (!adev)
 		return 0;
 
 	sub = acpi_get_subsystem_id(handle);
 	if (IS_ERR(sub)) {
-		/* If bad ACPI, return 0 and fallback to legacy firmware path, otherwise fail */
-		if (PTR_ERR(sub) == -ENODATA)
-			return 0;
-		else
+		/* If no _SUB, fallback to _HID, otherwise fail */
+		if (PTR_ERR(sub) == -ENODATA) {
+			hid = acpi_device_hid(adev);
+			/* If dummy hid, return 0 and fallback to legacy firmware path */
+			if (!strcmp(hid, "device"))
+				return 0;
+			sub = kstrdup(hid, GFP_KERNEL);
+			if (!sub)
+				sub = ERR_PTR(-ENOMEM);
+
+		} else
 			return PTR_ERR(sub);
 	}
 
-- 
2.43.0

