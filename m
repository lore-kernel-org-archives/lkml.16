Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319751DA4E
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738353680; cv=none; b=uYHK27WBALm6P/ly0V7SfJ82JHEwCwjl6NOHlPn7zvB+gN4xP+8J6GXyB3nORXTel+Q5SNIbUbxtQ0AVa0iukSxFoTpz18A418+A3Mw7vtoq2EA9PtUzgxpiL2X0wUne4sMzuqCV2ueTklXpKhnlSfgIXbWWxdKJS1vbSpVwhoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738353680; c=relaxed/simple;
	bh=ww5lwq80YlcASZ3YG6eNRBG2H6zs9+reQUjR4d3hVtM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uPrz3e9bjwvZRvhhK0E2qO2tCvWbC9AQFFGhXC/pu8sLnNBmNzx/ICypyaCt03pS6JbnjqZbN2j9YKo3CHWuzRgYmoco/WNBWv6T4KfGuzNvBqLA4CoUztT/d74eVuEyxZrWPbIPMw+tBaNQ6kptJZbYGub5C1LpDKPEXsbcXeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lvDmFXHR; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lvDmFXHR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V7wUJu032767
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:01:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=yTyJHpwhqETQXxe7Ynl0sgZnYO0w/sB7CjGflqNdOyw=; b=
	lvDmFXHRmlMzgW7/JLFV/pCFGcjLLCUPcJTrTwDCCF1azY0DtDyEsXnS102OHRhC
	a7x2+mrtopm2FENVY7Cys1JKxra6TKu4e/sBEWTKh+5tMiwsWKF81lFLrIDwbPyS
	emdhORSCs6FOxbPdRVeSb/WUlr7pDpsFyoJgutc95/RJ0sBHDeCbILaIqmHVGlFc
	YD/5UIQ/BEOBf9l9bBiS5OF49d1hA293r3Gyw8UkbMrFMdPy2VBRJ5YNvZ8sTc7n
	Jbd2tG3BcYOSfZ1dgdQNbS481syrhinW3ekgEs4QOkeDVjOw6zGrY/2S1/pDPUG3
	FAdZy6Ht6J4+bfwZFiMsuA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44gf8n15rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:01:16 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 31 Jan
 2025 20:01:15 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 31 Jan 2025 20:01:15 +0000
Received: from ftrev.crystal.cirrus.com (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3E96682026C;
	Fri, 31 Jan 2025 20:01:14 +0000 (UTC)
From: Fred Treven <ftreven@opensource.cirrus.com>
To: Simon Trimmer <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
CC: Fred Treven <ftreven@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/7] firmware: cs_dsp: Add ability to load multiple coefficient files
Date: Fri, 31 Jan 2025 13:56:34 -0600
Message-ID: <20250131195639.1784933-4-ftreven@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
References: <20250131195639.1784933-1-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9UXHEPTtfqbdImu8U8WTkPtvLPWAG4rx
X-Authority-Analysis: v=2.4 cv=YOxlyQGx c=1 sm=1 tr=0 ts=679d2c0c cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=VdSt8ZQiCzkA:10 a=w1d2syhTAAAA:8 a=MbgxawBnhQrWfd7Trs8A:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-ORIG-GUID: 9UXHEPTtfqbdImu8U8WTkPtvLPWAG4rx
X-Proofpoint-Spam-Reason: safe

Add cs_dsp_power_up_multiple() which accepts an array of
cs_dsp_coeff_desc firmware-filename pairs to load.

This enables the user to load more than one tuning file
along with the associated firmware.

Change cs_dsp_power_up() to make use of the new function
with a single coefficient file.

Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 61 ++++++++++++++++++++------
 include/linux/firmware/cirrus/cs_dsp.h | 14 ++++++
 2 files changed, 62 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index aacf6960d1ea..68563186637e 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2695,28 +2695,29 @@ static void cs_dsp_halo_stop_watchdog(struct cs_dsp *dsp)
 }
 
 /**
- * cs_dsp_power_up() - Downloads firmware to the DSP
- * @dsp: pointer to DSP structure
+ * cs_dsp_power_up_multiple() - Downloads firmware and multiple coefficient files to the DSP
+ * @dsp: pointer to the DSP structure
  * @wmfw_firmware: the firmware to be sent
  * @wmfw_filename: file name of firmware to be sent
- * @coeff_firmware: the coefficient data to be sent
- * @coeff_filename: file name of coefficient to data be sent
+ * @coeffs: coefficient data and filename pairs to be sent
+ * @num_coeffs: number of coefficient files to be sent
  * @fw_name: the user-friendly firmware name
  *
  * This function is used on ADSP2 and Halo DSP cores, it powers-up the DSP core
  * and downloads the firmware but does not start the firmware running. The
  * cs_dsp booted flag will be set once completed and if the core has a low-power
  * memory retention mode it will be put into this state after the firmware is
- * downloaded.
+ * downloaded. Differs from cs_dsp_power_up() in that it allows for multiple
+ * coefficient files to be downloaded.
  *
  * Return: Zero for success, a negative number on error.
  */
-int cs_dsp_power_up(struct cs_dsp *dsp,
-		    const struct firmware *wmfw_firmware, const char *wmfw_filename,
-		    const struct firmware *coeff_firmware, const char *coeff_filename,
-		    const char *fw_name)
+int cs_dsp_power_up_multiple(struct cs_dsp *dsp,
+			     const struct firmware *wmfw_firmware, const char *wmfw_filename,
+			     struct cs_dsp_coeff_desc *coeffs, int num_coeffs,
+			     const char *fw_name)
 {
-	int ret;
+	int i, ret;
 
 	mutex_lock(&dsp->pwr_lock);
 
@@ -2742,9 +2743,12 @@ int cs_dsp_power_up(struct cs_dsp *dsp,
 	if (ret != 0)
 		goto err_ena;
 
-	ret = cs_dsp_load_coeff(dsp, coeff_firmware, coeff_filename);
-	if (ret != 0)
-		goto err_ena;
+	for (i = 0; i < num_coeffs; i++) {
+		ret = cs_dsp_load_coeff(dsp, coeffs[i].coeff_firmware,
+					coeffs[i].coeff_filename);
+		if (ret != 0)
+			goto err_ena;
+	}
 
 	/* Initialize caches for enabled and unset controls */
 	ret = cs_dsp_coeff_init_control_caches(dsp);
@@ -2770,6 +2774,37 @@ int cs_dsp_power_up(struct cs_dsp *dsp,
 
 	return ret;
 }
+EXPORT_SYMBOL_NS_GPL(cs_dsp_power_up_multiple, "FW_CS_DSP");
+
+/**
+ * cs_dsp_power_up() - Downloads firmware to the DSP
+ * @dsp: pointer to DSP structure
+ * @wmfw_firmware: the firmware to be sent
+ * @wmfw_filename: file name of firmware to be sent
+ * @coeff_firmware: the coefficient data to be sent
+ * @coeff_filename: file name of coefficient to data be sent
+ * @fw_name: the user-friendly firmware name
+ *
+ * This function is used on ADSP2 and Halo DSP cores, it powers-up the DSP core
+ * and downloads the firmware but does not start the firmware running. The
+ * cs_dsp booted flag will be set once completed and if the core has a low-power
+ * memory retention mode it will be put into this state after the firmware is
+ * downloaded.
+ *
+ * Return: Zero for success, a negative number on error.
+ */
+int cs_dsp_power_up(struct cs_dsp *dsp,
+		    const struct firmware *wmfw_firmware, const char *wmfw_filename,
+		    const struct firmware *coeff_firmware, const char *coeff_filename,
+		    const char *fw_name)
+{
+	struct cs_dsp_coeff_desc coeff_desc;
+
+	coeff_desc.coeff_firmware = coeff_firmware;
+	coeff_desc.coeff_filename = coeff_filename;
+
+	return cs_dsp_power_up_multiple(dsp, wmfw_firmware, wmfw_filename, &coeff_desc, 1, fw_name);
+}
 EXPORT_SYMBOL_NS_GPL(cs_dsp_power_up, "FW_CS_DSP");
 
 /**
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 7cae703b3137..4c4e746be6fa 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -52,6 +52,16 @@
 #define CS_DSP_WSEQ_UNLOCK	0xFD
 #define CS_DSP_WSEQ_END		0xFF
 
+/**
+ * struct cs_dsp_coeff_desc - Describes a coeff. file + filename pair
+ * @coeff_firmware:	Firmware struct to populate with coeff. data
+ * @coeff_filename:	File from which coeff. data is loaded
+ */
+struct cs_dsp_coeff_desc {
+	const struct firmware *coeff_firmware;
+	const char *coeff_filename;
+};
+
 /**
  * struct cs_dsp_region - Describes a logical memory region in DSP address space
  * @type:	Memory region type
@@ -227,6 +237,10 @@ int cs_dsp_adsp1_power_up(struct cs_dsp *dsp,
 			  const struct firmware *coeff_firmware, const char *coeff_filename,
 			  const char *fw_name);
 void cs_dsp_adsp1_power_down(struct cs_dsp *dsp);
+int cs_dsp_power_up_multiple(struct cs_dsp *dsp,
+			     const struct firmware *wmfw_firmware, const char *wmfw_filename,
+			     struct cs_dsp_coeff_desc *coeffs, int num_coeffs,
+			     const char *fw_name);
 int cs_dsp_power_up(struct cs_dsp *dsp,
 		    const struct firmware *wmfw_firmware, const char *wmfw_filename,
 		    const struct firmware *coeff_firmware, const char *coeff_filename,
-- 
2.34.1

