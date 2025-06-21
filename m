Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FEA270EAE
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529665; cv=none; b=TU4CMOv2D9DXBQ0+WJ0FDrZ1QOXIcsQgs+RED02FlGTo+hm2swwEcNY2ByZjHze2A9oHSeL5Fx0A2NQUxwu3wPmM2s+0bK6mWTC97U/lnjTwmGRZX+3xmNAW6XdKSZu/S4Pc5CgCjlrct0GYG0XpaYrl1h8fSrwghjzD/8bNs2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529665; c=relaxed/simple;
	bh=MULVME50ezTJwjsRCNi4oguat38TlOEQQoYSE9mtnJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zk+IRLJJLGXgH4nPPmZ4aaUOTVs3RmwB3BWkAtT3Xs7jP2+P5opBYkVq5I1pVFq/7D8UMEf5iEGiTR+F6IG5KFAlsAar3GLrdZb7IbOWBPiMQ3soxgJvaAZNj2eYSQYrvgTTXxKyldwlFSP8z3k3zbcbesTDyakZhKoxyXQUxgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSGak9gr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSGak9gr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LI7d2D002723
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDHxHk18JOqx0nTuxFkbc1Jn6lI5tYF4hSfLOq+sH78=; b=KSGak9grsqFsME1A
	yyM4ChOU28J95059wf5iJPt+T2ar1UFjU28a2Pjo50OyytORfCs2uQwtRQgXXp1N
	RPvYi7vwdTZm8zDrvft6pUjWh6jDM025/O+n/daWJ2e94U0jZqFtoF2bMqsLnblU
	BxnRgjoyfBdwXdyNwdl5tIJGmVWeYl/Mpqglw7gBhJNe8/4gsbVSOT4QefIRIlEr
	OWibeAVRjb9fBr6rP7pEnbONpgpUcsieucu9J+6e4/PyqqkTQ1smrhzV5raIhdt5
	tpU3Ixl5gNuDCiM6b2ayjQb6YhDD3zc7GljxN6B30Ze6uazUK9gTgXWFYHpbpVfw
	sRY3IA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47e14981cj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3eeab1223so372255785a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529661; x=1751134461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDHxHk18JOqx0nTuxFkbc1Jn6lI5tYF4hSfLOq+sH78=;
        b=cMrNe/jPiZ1P0NSRAQ4BN0e8RUh49rbSZj/7h0kNiq6MbPzBg1lzaHZrcQKnswH+7+
         HQsn9CjEFCRF4qdv9OKx4NCU50rzInHtt2juT2yz87/DIMVIsICuizJ/sTY7rSmNvH8I
         fZVdtT2AycHL/98fnRvC2HdMJzklj0QQEuiCB+zHvWrlB0axeDTRR8DPO3FPcmf4Su/m
         s0h4REHBRA9LfcJh+iSTAeRtr25tLbMzyzpHJJT+RlkrOGcCqMkI8oP7PGdsDzMQgJ5Y
         tUL+1h5N0GtjVZnNzeBW3jiflJfL7QBIz7Dn33YkCPiG9JkQSC0c8zVmyq9vvz41LTxS
         XoIA==
X-Forwarded-Encrypted: i=1; AJvYcCV3BGz0HZNGABPgmBWoTGTiLMvWVFYAVSnfoBhzTvXLK5QVkNwsCkre6/MZRKeEBVWvoNk4086QdqX4X6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrzgEXaRGjzBFAbRdL643UxlB/YLsGWdrtZYE/pHS3b4YSJ92H
	ONXL292Bt/KV9BfGT/YpLXQwhWQPHTC5br4rXVana+A5U+5SGZbB5vEPO/4P/Ipq3L6WQp+9M5j
	NWsPacMeN1OwtCCpy0Vk5dwdzUAdh8E2osn1O96Z8q49Lvq6iPH8v1DyVl5e87yT6zfgOn8hmnA
	YwPg==
X-Gm-Gg: ASbGncs+N5HWQ5rMWKsDYFiBYI/GWs7imvyXO1bwaFb4X/1n+1UF9epkLzgoiFwaOee
	klh3sSyxLoHzJoufoPKwYVMy+unIWYnGk0ER/Re9VEF0wJcXwJFqtCNGXOuo6g9KrzJ9fNeWNtB
	n5td/3DwfeE4Jal7Gx2/cI35JcoW0hb2pMmUYY8DHf2Ovo5Wd/lwBSoyGujIDKQ7AIcXaIN8+DV
	HElm9iIpE90Ps+gsBHBVYG+c6S+gG4rY+WURvZs7Fj4vzIUXkB7jUWaCnwgoJRpo4af7fBG/zVJ
	BlK3EcMBVlSKpxhwTTLQMVDJzQG4XNCSmPlJRdjKJSWZYxkL6tUdQ/qvH3njLVMgaJaydv8YBLo
	CKIqH/dFVUoxcEmFqKoCK1HqcRrY23FrquaM=
X-Received: by 2002:a05:620a:2b94:b0:7ce:ea9d:5967 with SMTP id af79cd13be357-7d3fc02d9b9mr965399985a.15.1750529661120;
        Sat, 21 Jun 2025 11:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIIGisK+ntmvZYvKQNh3iR3tO+luthxByBUMIc+I29rTikd3A4VMB6uu9xiBW8m3JmQts4UQ==
X-Received: by 2002:a05:620a:2b94:b0:7ce:ea9d:5967 with SMTP id af79cd13be357-7d3fc02d9b9mr965395985a.15.1750529660725;
        Sat, 21 Jun 2025 11:14:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:13:00 +0300
Subject: [PATCH 5/8] usb: typec: ucsi: yoga-c630: fake AltModes for port 0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-5-a86de5e11361@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MULVME50ezTJwjsRCNi4oguat38TlOEQQoYSE9mtnJs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzPdJRglsGaRqUfmMC4gZNM1SYbEIfH7lW0
 sJ6e5L770qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1dh9B/4rga50gzKHMm+2fHIeEu00WRUMyq4GwbB1ytQ6p+PNsDp2JbPXQP9HsbuZkv4wPVoUxgZ
 h+bexTXZNS16WHt2JwBN3ry/jNsH0vVya3DTydbC1p1oFelUBZnCfupLGUkf9Ct10VpOL41DT8h
 LcP75iKMyulsPwUZHADhMATecht3g2CFz7xEZ9+itC2PParDxJz+VkO+vij2T1g8EpDASdh0dqC
 ZbUv72bKypU7loxxS7RyNmlU3uBVVnn2TFZwpi1Nkr0Dv8rIHgz+F2nIPaQO6zrauD9ejya/CE5
 y4SYpTpr124VkpeI60dW2gprY07SDz46Xl3SPya7JfN/bvKX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: dmk5-s7i9CEoCVJa39a-_KsldozxqmSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX2tfCrBQtTMBJ
 L5BW7LhL3ohazXTBBL8XIDg4LMssg5+/DbkHeiC6pz2Y1PzHc8gJLFhXQlTMgdLY1aww0w2+2Qy
 83Ff8oSsAQm/+Sng4k/TGh2iheNMRn+DuDTD3F3Hb5fnzaKJDpx7NW7r7P0SuCgvvLJ8+U5PWoo
 P6yHkw6kJyAI11wdnEyHkifn8G99vcN864do5kTWk4g8TKDHNcz1u3XOKIUeduRftYzLwcKca0x
 amlCknv7EcmrirzXw8Fh4hzzTty3APEuMTDOP6YPbYquKNBwDaYlank0KKKkP+sMoejEURh5Ei+
 hrJJZoQYqtwWJL+rRTQ/x1yJXnci2MHuBFYC1PBi1tww5HoAeh7JmSGhnWgaOVcUSaVrNgr8IOW
 1WLovSb6RlFUvNxaj20DTbsuIcX81u1DlCZmg+e7vl6hP9Fc/g6MLcyI8fswoZGHf3RBbeHN
X-Authority-Analysis: v=2.4 cv=XJkwSRhE c=1 sm=1 tr=0 ts=6856f67f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=O-xtLUNLgrTPA20joi0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: dmk5-s7i9CEoCVJa39a-_KsldozxqmSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

EC firmware provides information about partner AltModes and handles the
DisplayPort AltMode internally, however it doesn't report AltModes of
the port to the host. Fake the DP AltMode for port0 in order to let
Linux bind displayport AltMode driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi.h           |  1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index d02f6a3e2f50a4044eb3f22276931017cc624532..b711e1ecc3785eeb34e407e58df939f2d29bdb38 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -50,6 +50,7 @@ struct dentry;
 /* Command Status and Connector Change Indication (CCI) bits */
 #define UCSI_CCI_CONNECTOR(_c_)		(((_c_) & GENMASK(7, 1)) >> 1)
 #define UCSI_CCI_LENGTH(_c_)		(((_c_) & GENMASK(15, 8)) >> 8)
+#define UCSI_SET_CCI_LENGTH(_c_)	((_c_) << 8)
 #define UCSI_CCI_NOT_SUPPORTED		BIT(25)
 #define UCSI_CCI_CANCEL_COMPLETE	BIT(26)
 #define UCSI_CCI_RESET_COMPLETE		BIT(27)
diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 2005f64ebfe43ca2bcada2231ff99c578fdce877..506faf31b6e3a056e067f2bb69f5e9e5ea40e514 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -76,6 +76,28 @@ static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
 				       u32 *cci,
 				       void *data, size_t size)
 {
+	int ret;
+
+	/*
+	 * EC doesn't return connector's DP mode even though it is supported.
+	 * Fake it.
+	 */
+	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
+	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 1 &&
+	    UCSI_ALTMODE_RECIPIENT(command) == UCSI_RECIPIENT_CON &&
+	    UCSI_ALTMODE_OFFSET(command) == 0) {
+		static const struct ucsi_altmode alt = {
+			.svid = USB_TYPEC_DP_SID,
+			.mid = USB_TYPEC_DP_MODE,
+		};
+
+		dev_dbg(ucsi->dev, "faking DP altmode for con1\n");
+		memset(data, 0, size);
+		memcpy(data, &alt, min(sizeof(alt), size));
+		*cci = UCSI_CCI_COMMAND_COMPLETE | UCSI_SET_CCI_LENGTH(sizeof(alt));
+		return 0;
+	}
+
 	/*
 	 * EC can return AltModes present on CON1 (port0, right) for CON2
 	 * (port1, left) too. Ignore all requests going to CON2 (it doesn't

-- 
2.39.5

