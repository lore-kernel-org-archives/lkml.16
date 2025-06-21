Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1131C26FA57
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529660; cv=none; b=lUsC3OmHk3Fmefum5iz7zFznMdtPBH6s1LFJ8+XprJmM/8S4dwpr1ltmp4Wz41DPKhTmPLbCx8M84LczpFPAhcqTb3hn2LFSieWZS6OEERBDPYO8yPOPDkJcz6uUyLmbtzYPO2o+1zspFpDTORobTIXLQ5D+U14wl8SofrTxMX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529660; c=relaxed/simple;
	bh=X82NT0To0cHHxEVthOIl3cobJlSNDagM+IRg4TmYzKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0poxP1UXfkvDmDZPs3Eos/46KN9Pe4GQ1Fm7TkGWYmOWRdXs7rlRnFrihQ5LoutQHQULnFfcr9FPVoVVMuXEVCZ3DJpF6T7Z2DHo2Mzu6WbNIqS538yzLU2fE6atlf1cmLGnnHc491gAYSdLFqbLF2EgLIt2ZbMoWW9pVuBCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EiXymH2y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EiXymH2y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LHoY9C008517
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	avdnB+hgZU9bp52v1KCtyf6jWRUeqQMF8YsHerstNhY=; b=EiXymH2yfLB9uYE0
	2rLUx8XLym0Pl2pwFuYUS9CPeR+QTHWDr3zaqWWM4oBPANCun9pSU+VszDB+Z5tI
	32wGlZq5F29yJLFcLYn9rNkHpK3V6Fz3cxy7GYsC5J/181KpWDZzJejHHzFzeGGr
	0L0xAVB6KBkXowqkkNHNgeB69p+wYbGyrCGoKPKZ+EgekpSy0GPvd7sur7I6jX6k
	Rj8Ai4L/ybEgoMxT0tM41BlVeOnZbsqNWcStd9ADUSlKricsun/iQmRhPKa6TtAy
	aPg8luqwvVPyBJz3joXneqO5aw3o6xiTzYf0m3Lvn5rft0bp/+WcGN+7BkHsNk6N
	TDme/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dw9wrake-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so462047485a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529657; x=1751134457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avdnB+hgZU9bp52v1KCtyf6jWRUeqQMF8YsHerstNhY=;
        b=FvsAft+ccO2zH4RSIiKxdTMlr9ZwBbbJv2Yz8T3zCgcr8IaQexrc33dIfGAI9teUMc
         0DiuzBt2qtgmiBQ08bVXEw/4MkxbqoOurRorEyFwqIZZOORniZzA5BcoBLDPZHh/4T/8
         mNXSIj8VBFKx3P3Qb6ba6aC9YhArd6BK2FaTdmdB4FTg4fQO8GmPMxCqlLgnVForKz9B
         Yk9Z4x3YBs7OJi4V3oxxCbsWjg3p0bi+qd6mTp+b58MtC+US+9vNQH9QePQLvtpZv2ky
         18NvMuS55LJyvbhkZlbIrQKu2q/LfFJvGkmYfm3PyvCvKftx3r1UI5oR7al7I4vxXnbw
         DyQw==
X-Forwarded-Encrypted: i=1; AJvYcCVR47gU/bg/3t+4CErlBfC5hLzR8r2i9z9svflCux9RrxNxlZE8F7iqF6tXRZJmha530AL9MXVmASYxk3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx3hpN4a9MxHozgNk9UXREa1P04XgIRz3r1JHQ4nwLE6LTf9Pq
	yK0CGxlnSo5JJmsxyvVZE9h0FaLogAuOtVuZ1bnb3OTt85d8d8YtWrUCN2/ZnAVO0gd+Xu1oZCd
	uOa682JhMauWbAPwakIyJx3mLpV27dGiaj3u9IjGoAKf3cDwNaTgRM6zv6KIEBuTojuBz40Gwgg
	Vp8w==
X-Gm-Gg: ASbGncuAje7lcy48xLlerok3ERLPPsed42yIS9I0ZO/WHNQygUEoTl6qG1FUOIT64GL
	shIOAS2J9lumZ4kA6sYVx4e270mxqs43wJXLXHFCd2cifkT4j9sGLbtxRzIXfV4mp4DB28wkTdK
	yqO2h8DBQ+W1xCv1gf5NEU3ukfxb82nJzRfVMhAvs2Nz2avzdY2U9GGzpkRl5W6AICnCItOKFaj
	PyV1KoWad/rWrkCyG5xCpinniSuI7FQemJNl35xCEdDN3f+Ekj1jT2bO3ML6jTLicHFsyFkw7pB
	+WV1Q5IB9TLu3DKGBgkAJDbN7EI5w/jzEm0sZgG+kYUQ94Abe+y5bPbMfs8AEt7By5FGYTSVzi9
	GeXlru4heuIRIjqfvVSEkhKnVlN2Sw3F09Do=
X-Received: by 2002:a05:620a:17a1:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d3fc0560cfmr791243585a.21.1750529656841;
        Sat, 21 Jun 2025 11:14:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrCCipgLc+IJfwkcgPlL/s5L64oH8qO7m3lUECqimODLjYk4FQkVFIcnMxqeDLNaXnR2l5NA==
X-Received: by 2002:a05:620a:17a1:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7d3fc0560cfmr791240485a.21.1750529656379;
        Sat, 21 Jun 2025 11:14:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:12:57 +0300
Subject: [PATCH 2/8] usb: typec: ucsi: add recipient arg to
 update_altmodes() callback
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-2-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3071;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=X82NT0To0cHHxEVthOIl3cobJlSNDagM+IRg4TmYzKc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZyrcF9ULbQVUsBpsvflMQvumIJQN8uUjujx
 ol4kEFWh2aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cgAKCRCLPIo+Aiko
 1UIQB/9zdlNNR3KBaDfKW01XEjTdzJ8V2naxLu8sdm+UKjdlYij6WoovE4TdJ4SFbfAHfCFFfk1
 3SnqbRf2zjM3irQ68anQQoEsX9ehyNBatJFeL6y4WaH2LDyhaipwNxq1vGTbYRqIvoegKlKwOvx
 Lc//d31F8Ggjy9c7rajuN5Tt4Dsu/92kIN06dfEZa0uhRYZWrO1arc0FT1N4zygvHaEUgBn86Ku
 rtNFNgTmdKuGXi6jdmoqWxpVhJNZgm38+5JMsyCUpl6j3RbpIPeHNZyw1iqEbGhNDnS1W9EMSNC
 SYCkTZO1KS2fxkQgsPcEH8IC+fn1xhIGlyFc+8CMW49xd+0J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -LsZ8NLFDZASIvP9KQ0ZTcV2DY4S6hgp
X-Authority-Analysis: v=2.4 cv=HcEUTjE8 c=1 sm=1 tr=0 ts=6856f679 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=E64p1VqjvP21rIaO_JEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: -LsZ8NLFDZASIvP9KQ0ZTcV2DY4S6hgp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX34mTu2BpgOVg
 X6yeEgkIrUxpl2K43OOuskhh7aGA4bLGZXe/vrlYcnDGURTD4bwqiKZrfblUWAH0zxeNULIfwAi
 B3Wp6dYo4XZwDjT5gGbkzwmwBpppvx/0nNKuuB1hT8kyU3RzNIp4hnbvcgs3zNwRV3b7uSP/F1L
 FX+dPUIOx8yndpLn4109unE3aqCNay9Wrg48ISl/E0b5kAsK91gF33jE92Jnm6McMJdx2Ys38A4
 cMDnbJzoTuVPC9CUpppyU8Rrw06+ionPiTFrYFC7VeA6DxeNf/5MGFMcZN2wzxCtMEOE6V/JrVY
 zJ7HKe52qFuHJobzkhL2t+GscRj2rrZ7FcDFkN6AGXzmsKf0GwDHs4yUZOWPYRgOJbSNtyYSUPf
 SPp5MggL1v3Sb8b4lZHwmY4gAiMTNx4BZwCtdQNBn3kCAFn80ij+4xOxkB5svqXNZTxlbpr2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210115

The update_altmodes() is executed only for connetor's AltModes, because
that's what required on the CCG platforms. Other platforms (like Lenovo
Yoga C630) requires similar fix for partner's AltModes. Extend
update_altmodes() callback to accept the recipient as an argument and
move corresponding check to the CCG UCSI driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.c     | 5 ++---
 drivers/usb/typec/ucsi/ucsi.h     | 3 ++-
 drivers/usb/typec/ucsi/ucsi_ccg.c | 4 ++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 01ce858a1a2b3466155db340e213c767d1e79479..e913d099f934c7728cb678fc8e21e75ab0a00cce 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -531,13 +531,12 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
 	 * Update the original altmode table as some ppms may report
 	 * multiple DP altmodes.
 	 */
-	if (recipient == UCSI_RECIPIENT_CON)
-		multi_dp = ucsi->ops->update_altmodes(ucsi, orig, updated);
+	multi_dp = ucsi->ops->update_altmodes(ucsi, recipient, orig, updated);
 
 	/* now register altmodes */
 	for (i = 0; i < max_altmodes; i++) {
 		memset(&desc, 0, sizeof(desc));
-		if (multi_dp && recipient == UCSI_RECIPIENT_CON) {
+		if (multi_dp) {
 			desc.svid = updated[i].svid;
 			desc.vdo = updated[i].mid;
 		} else {
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 5a8f947fcece29f98c0458f9eb05c0c5ede2d244..d02f6a3e2f50a4044eb3f22276931017cc624532 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -82,7 +82,8 @@ struct ucsi_operations {
 	int (*sync_control)(struct ucsi *ucsi, u64 command, u32 *cci,
 			    void *data, size_t size);
 	int (*async_control)(struct ucsi *ucsi, u64 command);
-	bool (*update_altmodes)(struct ucsi *ucsi, struct ucsi_altmode *orig,
+	bool (*update_altmodes)(struct ucsi *ucsi, u8 recipient,
+				struct ucsi_altmode *orig,
 				struct ucsi_altmode *updated);
 	void (*update_connector)(struct ucsi_connector *con);
 	void (*connector_status)(struct ucsi_connector *con);
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index e9a9df1431af3a52c00cc456f5c920b9077a1ade..d83a0051c737336af2543fc2f6d53a131ffe9583 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -394,6 +394,7 @@ static void ucsi_ccg_update_get_current_cam_cmd(struct ucsi_ccg *uc, u8 *data)
 }
 
 static bool ucsi_ccg_update_altmodes(struct ucsi *ucsi,
+				     u8 recipient,
 				     struct ucsi_altmode *orig,
 				     struct ucsi_altmode *updated)
 {
@@ -402,6 +403,9 @@ static bool ucsi_ccg_update_altmodes(struct ucsi *ucsi,
 	int i, j, k = 0;
 	bool found = false;
 
+	if (recipient != UCSI_RECIPIENT_CON)
+		return false;
+
 	alt = uc->orig;
 	new_alt = uc->updated;
 	memset(uc->updated, 0, sizeof(uc->updated));

-- 
2.39.5

