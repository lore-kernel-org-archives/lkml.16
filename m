Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C3B199385
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749071149; cv=none; b=UB37zHK4m/alInSNGhdUResGRQZavBBxs7mD9sVvnETMZFX6O6x2WUWEvXpX3yYCdErPihx5tjT52lm6Sr5Kb/eYwQHC7ilV39rBQ/mwwmHrX9MkfdBaxPGtNjCtd+7yHXQGX5CAjy/DgwNUgMueQ/utGdGvUubMTaOoskH0qoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749071149; c=relaxed/simple;
	bh=ysQYkn0vJT1hldv6PQzaXbDTX8tGy9xlI/aUCkxqs/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O3tvznOuXVyQMv0XrHKrDfWMrwrc9Pj5J2Qg3uq023sk6DAvstcVKSk4v7XK9RH6R4LNpq+URoByGb+yb8e5RA/O8uud2Y33hg9jqTqaacT5o+18/dwKzySth48G20M6EBCFTf4hhHrPxlQfl6dV6wiDG55AjEizQmSkHH4DF90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBR5ZNit; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBR5ZNit"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554H3lfA013530
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 21:05:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jLIWSMJo+PMkCwpd429vQC
	+6MO/8btJcyBIKjWy5lrA=; b=XBR5ZNitDrS/qBC0m8zJlGVUSVrf7WgzwLk27J
	8bBhRClAJIXzSeEJWNPC1bffsSK/vnDjBanJWhSe6ayicNi42TwL86NN5v93hbhg
	yYmhz4mQEXF7rBRwyXVFbLyU3CRNRWdeqH8d2qCP80jhNtpno+oTedozvLXTyj2M
	x+yLbpH+BrTfEeGcz9m9DDev7CZNAYa2qs4MS+q0OxtkxfhdR+DHRR9lbcvqZ2yv
	zK/Y/SNVyV+MyWhgTQaBPKCpEBmg2BhwASDtVPTBltgdC13dryjbhcIgf7jZKWiQ
	nI3FUT5VX5CWeCf5G2uBUlLFNmVyUksg0L4Ge3sa3Q0CFKYg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nq9ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 21:05:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e0fee459so232620a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 14:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749071145; x=1749675945;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLIWSMJo+PMkCwpd429vQC+6MO/8btJcyBIKjWy5lrA=;
        b=UGG55LaRlJYnFddVSVuokO34YF9TGTJYydMJuo9FZaB2EUOxTh0O0BMJPRHhn0AcoP
         IulVbI6tr1E40kLWDQNzUjnvDhbw5RFXW0Ypz7fbN5LhurBBbEXM0ZZ1OfrYtD4quHGZ
         HUd+OQuH3KZRfizLfkfVtR2LJTX7kxX5dm8oIps6q5CB/PbHVi6KmdBqjRTHAz1Q9wiR
         HoTgihHtxDTbKYNV4UHLacBQYCqNZBkW2qmq3QT/0c8tYH/OZs/gDCMWQZsLjl+Wul9o
         OReln3XG6csCZT00SO4nknr+f0yu2mjM/288gry0OSx6ZaFtbPqmtkfgspHqxmAcQz6B
         +aiw==
X-Forwarded-Encrypted: i=1; AJvYcCXGVij+tBykjqo0ro4sBX/nEz9d8qTrTDDRgy2PaEH30OdhfThb+ZHcUIJGuD82vOi+LEPokiwU0DxFBCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKOKrOs1p+MC8uyH6IJvY7AM91V+ut2J2lBz1+LaYASL7g7xMh
	SodJY0QQFH8/XNGJPd+Kc17A5ui9XvvNIxxpZ5GlwGzmGFPxQnVYIZQhxjO4W6cwKID9cooqDpd
	cElxFcDNh4EuRDHS9ir4IOi4dFUCiNTiz36chbsZ1dJMMY/LD1nclrAyeyBbmkJAGc8E=
X-Gm-Gg: ASbGncuVzT8z4CYsW16biHZur+38WPP0FOxdv6DFe47SrRf0EayMmploFaoX5vFpZQe
	vYHpX5/8Lz4HfwOnxhDLII0L48VeLuipyWm1H0aW9GfpEJ0WVeDdwJDTcQcYVMdL+jtNAcr5GOs
	++R+Y6yofeZhtk9aqnmZ8Meh1dXdYilcXCHb0oy5ELCwbNrbLu+vWBbhA685dXynqAPmPacVHov
	rW1hf4sgZp1hMIpIqyg6ai6BRg8Pee6H1KdzvYtBGxQr634tVO5eAD1/SANeybPw9OUhhLzzxUd
	2Unhvxf8JahaIAXxSGJtFSULpSkwqH5iM/umoKdXJGlwxIiexhYf2CNNvg==
X-Received: by 2002:a17:903:19c8:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-235f1435b72mr12649035ad.1.1749071144731;
        Wed, 04 Jun 2025 14:05:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8JrF1oEAI2tJJfoczRwnUTxxY/LlxgH/4zmuy2RcabDEANlLcbhAgFVr2lWNQOBvAqXVl/g==
X-Received: by 2002:a17:903:19c8:b0:234:8a4a:ad89 with SMTP id d9443c01a7336-235f1435b72mr12648625ad.1.1749071144317;
        Wed, 04 Jun 2025 14:05:44 -0700 (PDT)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-235eaa077aesm8842555ad.7.2025.06.04.14.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 14:05:43 -0700 (PDT)
From: Chris Lew <chris.lew@oss.qualcomm.com>
Date: Wed, 04 Jun 2025 14:05:42 -0700
Subject: [PATCH v2] net: qrtr: mhi: synchronize qrtr and mhi preparation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-qrtr_mhi_auto-v2-1-a143433ddaad@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACW1QGgC/z3MTQ6CMBBA4auQWTumhRbElfcwhpQylVlAZfiJC
 eHuNia6/Bbv7TCTMM1wzXYQ2njmOCbkpwx878YnIXfJkKvcKqsuOMkizdBz49YlYuEKW1bGlqG
 2kJqXUOD393d/JAeJAy69kPtdjNbK/C+4adRY1a4LFRVt6+xtWtnz6M8+DnAcH8iXEUWhAAAA
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Hemant Kumar <quic_hemantk@quicinc.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749071143; l=3838;
 i=chris.lew@oss.qualcomm.com; s=20240508; h=from:subject:message-id;
 bh=ysQYkn0vJT1hldv6PQzaXbDTX8tGy9xlI/aUCkxqs/U=;
 b=C0ogf9tgd+GyYT22V1/VWSdTVkh8v3fESUWkSuZ17YRgJhqJvXR2ONiS/JtRIcrlwmx7GfJs1
 ZDJ0E4NhzPvC2mzns5bWFQy9BFg0ZZK3i/SqMqmq2rWJCZPK0DqMRJ6
X-Developer-Key: i=chris.lew@oss.qualcomm.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-Proofpoint-GUID: amnGyFzDXp6HxpReJz8UbJZB8Ti1GN2X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDE3MCBTYWx0ZWRfX3dARtKNkr6+g
 RVxMfaM+2QxVD9jUlDPksMuCrQYo/ZXQqhgaNrqkMzPUkIALXO09W5HcL+794YC+J9kQvYUmTVQ
 p8oXYCWsA8rzWaYt9njWY7bp3ZQUCD3AecNhPr/NKbfYl2UfCvLm8/KhE6tvdcBzeSwHzPMO+b8
 7APYA+r1tyOqo0d4Fvp+GaI3N7+YBuZLE0htuGVNNHKdH1CTrGXvgZy/AemvLb4btDKl+KJXRlN
 rX3EZK0h8NuN4Qx4lyeNZKjN+2eGuizy4IqLm50hcJprYW/qVjhp054P1iT4voDcRTyVrfZp5+H
 QRT/03Wnl8xiJVeDnEChRj43JeER61qgsnck88++sqZZqqq089E8TiazcFQ44fpk6PQj9+fFcg3
 LjktUa+w10tAPmzwCwhOJkuDrq8pK6M7jpqf7bDsnaY4b7nPWC+XWa7puUpia88b8xlsavtp
X-Proofpoint-ORIG-GUID: amnGyFzDXp6HxpReJz8UbJZB8Ti1GN2X
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6840b529 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=ZCUql8mqHSpVSJXybNkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=xwnAI6pc5liRhupp6brZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_04,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=865 clxscore=1011 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040170

The call to qrtr_endpoint_register() was moved before
mhi_prepare_for_transfer_autoqueue() to prevent a case where a dl
callback can occur before the qrtr endpoint is registered.

Now the reverse can happen where qrtr will try to send a packet
before the channels are prepared. The correct sequence needs to be
prepare the mhi channel, register the qrtr endpoint, queue buffers for
receiving dl transfers.

Since qrtr will not use mhi_prepare_for_transfer_autoqueue(), qrtr must
do the buffer management and requeue the buffers in the dl_callback.
Sizing of the buffers will be inherited from the mhi controller
settings.

Fixes: 68a838b84eff ("net: qrtr: start MHI channel after endpoit creation")
Reported-by: Johan Hovold <johan@kernel.org>
Closes: https://lore.kernel.org/linux-arm-msm/ZyTtVdkCCES0lkl4@hovoldconsulting.com/
Signed-off-by: Chris Lew <chris.lew@oss.qualcomm.com>
---
 net/qrtr/mhi.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 5 deletions(-)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 69f53625a049..5e7476afb6b4 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -15,6 +15,8 @@ struct qrtr_mhi_dev {
 	struct qrtr_endpoint ep;
 	struct mhi_device *mhi_dev;
 	struct device *dev;
+
+	size_t dl_buf_len;
 };
 
 /* From MHI to QRTR */
@@ -24,13 +26,22 @@ static void qcom_mhi_qrtr_dl_callback(struct mhi_device *mhi_dev,
 	struct qrtr_mhi_dev *qdev = dev_get_drvdata(&mhi_dev->dev);
 	int rc;
 
-	if (!qdev || mhi_res->transaction_status)
+	if (!qdev)
+		return;
+
+	if (mhi_res->transaction_status == -ENOTCONN) {
+		devm_kfree(qdev->dev, mhi_res->buf_addr);
+		return;
+	} else if (mhi_res->transaction_status) {
 		return;
+	}
 
 	rc = qrtr_endpoint_post(&qdev->ep, mhi_res->buf_addr,
 				mhi_res->bytes_xferd);
 	if (rc == -EINVAL)
 		dev_err(qdev->dev, "invalid ipcrouter packet\n");
+
+	rc = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, mhi_res->buf_addr, qdev->dl_buf_len, MHI_EOT);
 }
 
 /* From QRTR to MHI */
@@ -72,6 +83,30 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
 	return rc;
 }
 
+static int qrtr_mhi_queue_rx(struct qrtr_mhi_dev *qdev)
+{
+	struct mhi_device *mhi_dev = qdev->mhi_dev;
+	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
+	int rc = 0;
+	int nr_el;
+
+	qdev->dl_buf_len = mhi_cntrl->buffer_len;
+	nr_el = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
+	while (nr_el--) {
+		void *buf;
+
+		buf = devm_kzalloc(qdev->dev, qdev->dl_buf_len, GFP_KERNEL);
+		if (!buf) {
+			rc = -ENOMEM;
+			break;
+		}
+		rc = mhi_queue_buf(mhi_dev, DMA_FROM_DEVICE, buf, qdev->dl_buf_len, MHI_EOT);
+		if (rc)
+			break;
+	}
+	return rc;
+}
+
 static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 			       const struct mhi_device_id *id)
 {
@@ -87,17 +122,24 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	qdev->ep.xmit = qcom_mhi_qrtr_send;
 
 	dev_set_drvdata(&mhi_dev->dev, qdev);
-	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
+
+	/* start channels */
+	rc = mhi_prepare_for_transfer(mhi_dev);
 	if (rc)
 		return rc;
 
-	/* start channels */
-	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
+	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
 	if (rc) {
-		qrtr_endpoint_unregister(&qdev->ep);
+		mhi_unprepare_from_transfer(mhi_dev);
 		return rc;
 	}
 
+	rc = qrtr_mhi_queue_rx(qdev);
+	if (rc) {
+		qrtr_endpoint_unregister(&qdev->ep);
+		mhi_unprepare_from_transfer(mhi_dev);
+	}
+
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 
 	return 0;

---
base-commit: f48887a98b78880b7711aca311fbbbcaad6c4e3b
change-id: 20250508-qrtr_mhi_auto-3a3567456f95

Best regards,
-- 
Chris Lew <chris.lew@oss.qualcomm.com>

