Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EB4248880
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750804169; cv=none; b=h/IlDpmByFkxWE3xB3kZnfe15FQIGFSoUL5XRJWvX0nPWKXcVutuUbGJF8HhMrI3YVkiRjkx1BXJOzNu+xbqqvms/kgx1OTH9gnqMLQrs7tHLe2RXNIx6DkZI7mEdFoooK2HM5OpyRUDEsoZBiho/W/MsMCLvtpt6JTyk38bitQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750804169; c=relaxed/simple;
	bh=9ojkd/dBItAGXhFPy+iRT5H7yKncISWurAFa2VKyRMM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XsYbng5M0tDmAXm9vPHsufuP9FEdVJX26sdAhb63mhX22o61SaoCfr25dWgqeCq2Lwk8qXOzcM7BeWHRP+DIBWIdVW0evQ1pMjg2LMF5LrBy1xozR77rX0fszyc+DiK/7+u1uslej6XgviyJMT9QouNCTJVwGZ3n3k2J+npdgTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YVDZfTJ9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YVDZfTJ9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OGiRWU014612
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=afm3laDmhWveEChc7j13Jv
	LNji/3QQI3RCZRRCMeHns=; b=YVDZfTJ9YBeriiegGOP1YswkwVVfG1nCXKUGby
	DilLozi8CJBG6kIgX0GH6bKYws2tZaiOpItmjOOHq5xAUZj4tNBmcrmXfjTr1ELj
	0+A/vKA23siHZv+lTuj6WxR8OBZd/MIBEUTK+xu1xd/i5Bh4hefw+Ue9nD7IGe/M
	2EsMxIM4Z+QjacBpwJWPjnm9t4Ckojv1jMokDLbFjFkkWcyxQucUtP1InCS6SESd
	T5Wip8O0dALGPnsSxOu0Itcs0OI8hBAD+dniZKIaiMB0eUwcv1MlipBwMy1FJ44X
	u05kO5uAvtb6d0pgS2GcMX3xbNQd4IBkNuQct1B9flZ10cbw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpx1rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:29:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso647444a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750804165; x=1751408965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afm3laDmhWveEChc7j13JvLNji/3QQI3RCZRRCMeHns=;
        b=E0ANt7Io3gh8JLbrwBIG6xewDzMfrWw9wh7UMXRMcYEEcWAiUFGJo0xq6lVfoLNyw3
         Kf8LXC+dDn3tIWToAJ6LpqrggnMAxLoPvp+LaWXBHWkVU/u8ZF4/aYibw9EfVaIOpjTs
         JVbrh9wsBqPy/P4J/P9EtMYbbnDVDf+Cs+8npBAGpIf9p7gtNhCWHCr4j0rlPSmmBmW/
         ur2ChMTfd1JL8PdnkGV4e0PSBujJckvoVa2vHjF+bpYMS197NO1mqDnI88n+dA5MrXAE
         CMFuhIGfPDtDhrVwjUTSL8zxlcO91ujvnkzkVXTBKZ9fnUXdCimgJYaLLHJufcNE6hux
         RfQA==
X-Forwarded-Encrypted: i=1; AJvYcCWXYkWQmZqHrID38Wj94fuO1w82sVpiA5Y0CWkXgtJwv3upLObcJc1hhhFvO155l/kT820WU8PZZyt1jsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFUBK///gUusV36LWUy64/aZyr35FhckI2kgd5i9xk7rYDNV9f
	iSP/wOwiBYoI8dK4J5E62EonWOjBM3G3N4L0fp+49luNcRe3QzQHzo3Til7u0YPraHfEi2M5+el
	L+XmsFwSBVSUSDq+hkeGAQU531xxDTU/ZHMz/8qewbP1X1owLpjwfs+HVYvQdHzugc38=
X-Gm-Gg: ASbGncvGTO/go/VlVLF79vzXvtHHVagn+MERwODVqq5zRb+d1LrJR82E+SO/kR9/3da
	typ9/htf9HlCmp9j6UJAUYb4wVuRtDfstwkBB2KKsEgGIH9aGC5HZPWLWL6Br0I7nmMuaQ1Qj0/
	R16n1DnelnjhP+Txk6pdMIF2slMeoPw2whL5pStU2slHe2r8N3AdcQeQ8oGE152QO+mZh1b4C3b
	7GWTAj0DZki05pEzKvnh62cllroFU6EKHaSoI0Sxp88bNNiG7L/DmVChm3GCtlE3+jkGHog9Yh1
	pA6ojkpNUnCc/9gavYR+Rup1+C5Pe9OrletXok3N05BlkEJ+L7vhTEhrvYuGZMh8kjSQ4Ej3zbo
	QjlI+14Ek5Q==
X-Received: by 2002:a17:903:1ce:b0:235:f4f7:a62b with SMTP id d9443c01a7336-2382405d084mr16964125ad.41.1750804164593;
        Tue, 24 Jun 2025 15:29:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgYE/Tz06+OWi+qimpl8jaktLopABBmdH1yZyMrkFkP0S82AicFJFiqgLVUNEgFpkkIyJ7+A==
X-Received: by 2002:a17:903:1ce:b0:235:f4f7:a62b with SMTP id d9443c01a7336-2382405d084mr16963765ad.41.1750804164199;
        Tue, 24 Jun 2025 15:29:24 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237f7f87676sm57867405ad.122.2025.06.24.15.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:29:23 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: lumag@kernel.org, neil.armstrong@linaro.org, johan+linaro@kernel.org,
        quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: ucsi_glink: Increase buffer size to support UCSI v2
Date: Tue, 24 Jun 2025 15:29:22 -0700
Message-Id: <20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685b26c5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=nNVKvzsFg4rUH3MCaoEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE3OSBTYWx0ZWRfXzng/3uVQeQH6
 BLX8/jc1wnCHn4hNnYSoxncjRolJ7cj8XAzoYrPNKv7k9l2qyPdJpBur4awUd6yr0kclVWgyKT8
 FzivSwrph6tHSPuZ86cvG4dkQHir6uIvqMlws6EExnD+ZyjJdYDH4Qyl6QV3mn2aUEPjrimFv8Q
 rjFaoclq6URHBsOxDdcruk1XJlge1m62yjze/Wt0vt6MOhF0Bj/j56QSqkUFGtWTL0kBF06/h5R
 bw6tLE1nyOpibA72VRyWpwtG9y4zD3a/eB5MCTMbMFTG9TIswiw1dP6t2DERqR81X3xaMdeoHYy
 LhFgeSbJXQalM1jytI5hceh8A7TLBomXHp60rtUjYj7m6UEDoM0XHjHeBMYdvuhZe4GOsb84Yrx
 ryfY3PPw3w45uByJpK5IDcccOwfJcZNPbHQ0WP6Csqlu7+xtTlCWND+CcW9c7k5E+qv6ANVO
X-Proofpoint-ORIG-GUID: riEn_216r_jVDKK2zW5zW-VsOBuW46Jg
X-Proofpoint-GUID: riEn_216r_jVDKK2zW5zW-VsOBuW46Jg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240179

UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
16 bytes to 256 bytes each for the message exchange between OPM and PPM
This makes the total buffer size increase from 48 bytes to 528 bytes.
Update the buffer size to support this increase.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 50 ++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 8af79101a2fc..d20f01a0cd5c 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2023, Linaro Ltd
+ * ​Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/module.h>
@@ -16,10 +17,11 @@
 
 #define PMIC_GLINK_MAX_PORTS		3
 
-#define UCSI_BUF_SIZE                   48
+#define UCSI_BUF_V1_SIZE                48
+#define UCSI_BUF_V2_SIZE                528
 
 #define MSG_TYPE_REQ_RESP               1
-#define UCSI_BUF_SIZE                   48
+#define UCSI_BUF_SIZE                   UCSI_BUF_V2_SIZE
 
 #define UC_NOTIFY_RECEIVER_UCSI         0x0
 #define UC_UCSI_READ_BUF_REQ            0x11
@@ -36,12 +38,24 @@ struct ucsi_read_buf_resp_msg {
 	u32                     ret_code;
 };
 
+struct ucsi_v1_read_buf_resp_msg {
+	struct pmic_glink_hdr   hdr;
+	u8                      buf[UCSI_BUF_V1_SIZE];
+	u32                     ret_code;
+};
+
 struct ucsi_write_buf_req_msg {
 	struct pmic_glink_hdr   hdr;
 	u8                      buf[UCSI_BUF_SIZE];
 	u32                     reserved;
 };
 
+struct ucsi_v1_write_buf_req_msg {
+	struct pmic_glink_hdr   hdr;
+	u8                      buf[UCSI_BUF_V1_SIZE];
+	u32                     reserved;
+};
+
 struct ucsi_write_buf_resp_msg {
 	struct pmic_glink_hdr   hdr;
 	u32                     ret_code;
@@ -133,6 +147,7 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
 {
 	struct ucsi_write_buf_req_msg req = {};
 	unsigned long left;
+	size_t len;
 	int ret;
 
 	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
@@ -142,7 +157,18 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
 
 	reinit_completion(&ucsi->write_ack);
 
-	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
+	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
+		/* If UCSI version is unknown, use the maximum buffer size */
+		len = sizeof(req);
+	} else {
+		/*
+		 * If UCSI V1, buffer size should be UCSI_BUF_V1_SIZE so update
+		 * len accordingly
+		 */
+		len = sizeof(struct ucsi_v1_write_buf_req_msg);
+	}
+
+	ret = pmic_glink_send(ucsi->client, &req, len);
 	if (ret < 0) {
 		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
 		return ret;
@@ -217,11 +243,25 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
 static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
 {
 	const struct ucsi_read_buf_resp_msg *resp = data;
+	u32 ret_code, buffer_len;
+
+	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
+		/* If UCSI version is unknown, use the maximum buffer size */
+		ret_code = resp->ret_code;
+		buffer_len = UCSI_BUF_V2_SIZE;
+	} else {
+		/*
+		 * If UCSI V1, use UCSI_BUF_V1_SIZE buffer size and
+		 * update ret_code offset accordingly
+		 */
+		ret_code = ((struct ucsi_v1_read_buf_resp_msg *)data)->ret_code;
+		buffer_len = UCSI_BUF_V1_SIZE;
+	}
 
-	if (resp->ret_code)
+	if (ret_code)
 		return;
 
-	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
+	memcpy(ucsi->read_buf, resp->buf, buffer_len);
 	complete(&ucsi->read_ack);
 }
 
-- 
2.34.1

