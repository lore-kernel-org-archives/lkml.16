Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7275A26F476
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529669; cv=none; b=N0Q4KtszL7xU51GIw7YFlXpWQAv+h1Hty9o9WztZoTVhTNvGamXhRLjkm3gLYS4XQnhCqQQp68zC9vysb3Du3Sh4RKaIstxmM7R03GN7haAzKJln9gkPfm4gHV3qfJj2ZjhoPRFrtISDQ44OJVMRGV0oCkNahwymtqbD5jmK+Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529669; c=relaxed/simple;
	bh=Vp5Fme7/3hYqg8ZC4exosk/7eg4G/1nTlZJs2jkgM98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbiTLxhn3DQpcVvuL8PMTpzNJbLtTtXx3DFDJd6bf4q0LFFrG1qjpHG8gS2vUo1svL574/l0SMlZsLXooCHpfqm709r8fBtFUgdP/EXW7IXRElnbRA5ZNyY8daHMWMqx722cAqyLxmEMv+yjQ+2aCAbaK35D0wfNtIVzWvmxa7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2XRLuwa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2XRLuwa"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LFdOxk023071
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i0hBPSYquU2It6N5un/PFHS9t4oxEjLZu7nUhJVo2lc=; b=b2XRLuwaub69Oghr
	/816m92bzejA8lRQvpA6x+ay5CRJfD2HiP5dXDUt1x2YuxXF9pZ1zUq7wYWWp5qJ
	ys9GO0NzWJb/MRkkQTxDE94KYPS8i3IU0YoH47iELWxBP97OqkYfRh8aGppLLlGc
	+K2ExuMmk0Lkq6Kmvqpqe7fR1rYADQMCUS1tXhmvssu6l3OE8AChWJS1lS+BepcB
	EFGh7o4WsdkuUcmQRwABPLWrVIPkAzbhKoqiC+CkWMaE+UV6OtVaTJWLnyuZIENU
	fPsJSV+RyqRVRP+pzbmgx8/Sj0PWtpm8RVjK+bdERat/QgIYe+qWso1ePzxHt+mS
	XTA9oQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dyjhg558-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d38c5c3130so485321185a.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529665; x=1751134465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0hBPSYquU2It6N5un/PFHS9t4oxEjLZu7nUhJVo2lc=;
        b=JllXSAtY54a3L6g4NXlEvY3wx+ybuEiQkkd3y8TCQCGe0a+CaGymUAv66L9ZZYqRgn
         eVHyeTP26RALJpPT1atb3vNkxyVJCMmUcRHB0aALwJ8mUlI31PYTMs+EPK8gK9o2XtNc
         ACNbKPQA+hquFX6JjCNMYkorNp2Z8Lgecjz1IkPlcqPjpzM0bqTrXjbh26ABwP1j1HHM
         /DtaeFZmCCAGsI1O2QqdgpWYnf1WcFsGpL9SGPM9M4tIyYbf9Zd8UMxG59mkB/5aLNm7
         225mE0ChII3drlykftapo50ugI2pZqGy80LYSkKlLDFFL+q2KbS5J8w7GHyTdoR2buVb
         SFuA==
X-Forwarded-Encrypted: i=1; AJvYcCUu2PfvSIRn7kxaVKODrijFd8dNd5ITFr6dOd59CB/Ldn5EnQzjPGRKb/tT2u26zvBJWPJ3eBMgRWHxSnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdlxLDjR1UQLG5JoWdKt1R+Y8MpYX6a9dJTsdMnloKow+mYjWL
	gKMpY9EK9V5IV9Ick8S8vsGs3sz9lLasFdbp/EcXSAK1s1kt5SZu5DhWnmDXa36D3NG2QNDiUXg
	1H6TVCv8S2/kZGENBppkQZIYobIqR2AtjA+AxC+GfnSOWC53dDXb6bzhvHtKnNSluV1OiO5SdeV
	ORTQ==
X-Gm-Gg: ASbGncsu2zzGkfjsP3V5l9KDoXS62ykiSh2i00c/kiUMZRD6q3SW0gsVrJbbGRrrpVT
	Syq2pRrq3mqc+hV1lSWN3WPEWHa76wgqV1vN0c/l3nlsofJIqpqCd50kdFsw47VIHkULEqXahOY
	jG+Ol5eUa8lxAUHeHun8OKmbZ5YdUVsH3NohAQBdexukmyX8Pab/ItDpvhnPP93aOstgGR7JoHn
	+ZG9QpwPmqGrC92YVG9f8NPh9t1ZGWBs+lyl+g6i+m+L49IuIYppajAQCZbhrXuYC8RER0WaCNK
	O2QdROaGxW3ImU8MM5bMbv5n9F0TzBDtwwgmayfhMFtqt0CIenFJhR5A5whOm5dkqzBB6YcZX2P
	MxmxN0ELeyR/4p5zuWoFmeNxTnt6mMy0l/r8=
X-Received: by 2002:a05:620a:1997:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7d3f98c335emr1054953085a.5.1750529665007;
        Sat, 21 Jun 2025 11:14:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+BLvp55Mks0cd0omIsX9xEno7K+V+qTVjIWAp23+UGVrowvzZ6fUThgqonkqEHlZPASIb2g==
X-Received: by 2002:a05:620a:1997:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7d3f98c335emr1054949285a.5.1750529664603;
        Sat, 21 Jun 2025 11:14:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:13:02 +0300
Subject: [PATCH 7/8] usb: typec: ucsi: yoga-c630: handle USB / HPD messages
 to set port orientation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-7-a86de5e11361@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3261;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vp5Fme7/3hYqg8ZC4exosk/7eg4G/1nTlZJs2jkgM98=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bYt2L957xak3P43952cZ0rvWh+R+586RNWWVfPhH1//
 0LbNJq/k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATkTLiYFioUWFX7Llx0X8n
 6QsC7fH3+P707I13XfkqPIZ77k9ugd60Y33MOvkzj3k98HndNGP1cb6WGZvmdugbv3uoGNB2+I5
 x1ztvT+17eoWKBj6lBgIXcpNe+DyLatcR58vhnKV6MEHO667GlG9PWWpjr1Qe/JE1babJUabuhv
 Q9PMnrNLd+uiV8jmPO2n190ycIzXbYP2OZqETSOl/Tn4x6/UJXlCqmujoUWbJPF7M/4eRzZfX8d
 hmObZdq1/A4rw5ac+asvhHTu0KjTefyGGdbSfWwxYu3FFvEftvbWBfTrbX0zryJf7++OxS9pqKo
 QX7958JrwY9fNhQ0z9BwnNckziFnl80xseJIa8jHxFcfAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: nC8Gu8MvQnJysf0tnMU6AEC2rNTSDCpp
X-Authority-Analysis: v=2.4 cv=f9pIBPyM c=1 sm=1 tr=0 ts=6856f682 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KtUMi8uSWGBWOuXQcx8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: nC8Gu8MvQnJysf0tnMU6AEC2rNTSDCpp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX4exdF/Az2HZA
 kwAiv4galvO47CudTl9lMtqrygzA81tGgOkGhDwig9Pq0s6CeP3YAZHUSIGEjlYXrKyC/NUkW6e
 IGx/t7xxNYN+f+q1DemN0oYa4fIgdzmwD6t/ku5aMP3SGSdxo2i3eg7lonCxhyjEt4N26Kwi85I
 gkuqaP0SINT0sDVMg6F3RljVnftp0u8BHmz4f0cAOlgZs7+jpKu/Iq8usWr0WymZ0jQipTyTn5U
 GlL79FJPs7HnDdnYNTXaq/G7jBqiyCTZumJqnQ/70ITQy+txVMcJbwb9Blequ0VDg7t0JA4mqbW
 3bxldnYkiZzjSLhsWdzogToNinT56Q9+3jKZL2NvMyCrPeXmI70AGFHa/4fiKJQPpzi/t1QNE8i
 EJkbmeIqhEa11+o2CvDJ4PjCeCUTrCBGU9KLptAF0vikbHrn7LIcvI7CQqDLmPSHrSr+WZXy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

Parse USB / HPD messages from EC in order to set the orientation of the
corresponding Type-C port, letting connected USB 3 devices to enjoy
SuperSpeed connection rather than beign limited to HighSpeed only (if
the orientation didn't match).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 42 +++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 76afd128d42a2573ff55433f815c2773462a6426..f85170417d19cdc5ae39a15e2f97010259ef12f6 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -7,15 +7,25 @@
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
 #include <linux/completion.h>
 #include <linux/container_of.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/string.h>
 #include <linux/platform_data/lenovo-yoga-c630.h>
+#include <linux/usb/typec_dp.h>
 
 #include "ucsi.h"
 
+#define LENOVO_EC_USB_MUX	0x08
+
+#define USB_MUX_MUXC	GENMASK(1, 0)
+#define USB_MUX_CCST	GENMASK(3, 2)
+#define USB_MUX_DPPN	GENMASK(7, 4)
+#define USB_MUX_HPDS	BIT(8)
+#define USB_MUX_HSFL	GENMASK(11, 9)
+
 struct yoga_c630_ucsi {
 	struct yoga_c630_ec *ec;
 	struct ucsi *ucsi;
@@ -144,6 +154,12 @@ static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
 	return false;
 }
 
+static void yoga_c630_ucsi_update_connector(struct ucsi_connector *con)
+{
+	if (con->num == 1)
+		con->typec_cap.orientation_aware = true;
+}
+
 static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_version = yoga_c630_ucsi_read_version,
 	.read_cci = yoga_c630_ucsi_read_cci,
@@ -152,8 +168,33 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
 	.update_altmodes = yoga_c630_ucsi_update_altmodes,
+	.update_connector = yoga_c630_ucsi_update_connector,
 };
 
+static void yoga_c630_ucsi_read_port0_status(struct yoga_c630_ucsi *uec)
+{
+	int val;
+	unsigned int muxc, ccst, dppn, hpds, hsfl;
+
+	val = yoga_c630_ec_read16(uec->ec, LENOVO_EC_USB_MUX);
+
+	muxc = FIELD_GET(USB_MUX_MUXC, val);
+	ccst = FIELD_GET(USB_MUX_CCST, val);
+	dppn = FIELD_GET(USB_MUX_DPPN, val);
+	hpds = FIELD_GET(USB_MUX_HPDS, val);
+	hsfl = FIELD_GET(USB_MUX_HSFL, val);
+
+	dev_dbg(uec->ucsi->dev, " mux %04x (muxc %d ccst %d dppn %d hpds %d hsfl %d)\n",
+		val,
+		muxc, ccst, dppn, hpds, hsfl);
+
+	if (uec->ucsi->connector && uec->ucsi->connector[0].port)
+		typec_set_orientation(uec->ucsi->connector[0].port,
+				      ccst == 1 ?
+				      TYPEC_ORIENTATION_REVERSE :
+				      TYPEC_ORIENTATION_NORMAL);
+}
+
 static int yoga_c630_ucsi_notify(struct notifier_block *nb,
 				 unsigned long action, void *data)
 {
@@ -164,6 +205,7 @@ static int yoga_c630_ucsi_notify(struct notifier_block *nb,
 	switch (action) {
 	case LENOVO_EC_EVENT_USB:
 	case LENOVO_EC_EVENT_HPD:
+		yoga_c630_ucsi_read_port0_status(uec);
 		ucsi_connector_change(uec->ucsi, 1);
 		return NOTIFY_OK;
 

-- 
2.39.5

