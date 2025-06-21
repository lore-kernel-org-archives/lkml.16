Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C6825A2A2
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529658; cv=none; b=oBaz1V1c5G9gRmnxu8jlEB+jsRSr/lgTruOpEuj3u2ES+HcGVE0DWUzkn5WUhErk1ZHz/4HzknYmOldPS0/EVEvhlBxUIArayeDQorahT2c5ZBTf626dxy8LV6HLshweRdGZrNAlHY/XTw+JYgIjSLACUlI+bqmwkNcA0f2Pwbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529658; c=relaxed/simple;
	bh=dSQFGNWG/Zf26SyfOt589O9Vx61eV+28LRkpnswAKEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgEmzIVgTdweus1NGmgT7ez7oTpEihXdaYzLtnNERRsr8Hh1n5XkbkkdUKBAAeP8bkyCLxlUnL/3/sFMlk6ETy+hyxKbsnVNMYSzOD8RJ24aiHhX33EarlGsy1qL/y0N/gybxvyZ6/2UNBLsEzEWMQSbC5lGcsx/da4YSNyA0Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oA3Ww1VI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oA3Ww1VI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LI7Bef017784
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcQ/uB31Z3cDOfD3eWsCLPpsYTWEx+9S9C+nOkqBYN0=; b=oA3Ww1VIz1cpKZBe
	eTPM1nXYt16Hh2oYYoOKjy+sWt13kCla5iloWldXzSlUU5RnFFegMLiH0FxM/KVF
	8QTHeo4phR7rONv3mwUKY/nkhjG9xq8X3MUmp+GPy5pEAKQdYaHYu/2KyxIw/4Dn
	1If83H1hDgHpxClV84RvR3rIxctIjqpk5OwafT0U0YCPK5Y8MJ1krpHhgQm4qacE
	SqeGdeyWvr3ACHh4sCMHlsVh5gc3gtgD8MHKAtv+NWBHfZzm3Np1ExwBl+T0WKqF
	tWQckPZ1L1uDcYc5ZqvqMcd6N8aKsmzwJ9JFAqE1hy2CyKlU6tFk6jNpba4r+YG1
	E6pDyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47e1qgr08d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ceb5b5140eso432047885a.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529655; x=1751134455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcQ/uB31Z3cDOfD3eWsCLPpsYTWEx+9S9C+nOkqBYN0=;
        b=aAlGcbg/fQ9D6IMNjJgq6NwIS4DlYIE72+wkpetTrNZOWwozAtTtpFiNh9KwmCmkNy
         qsBf/XaaYu4OKSrY94G6teJN91SzoONf+gZlynJKOU45imSKORIIZdiL9gT/eIcYmbzc
         AxSRZMXimPD1Lu6BAQT94jai8hbYJ5xMqnFRQrYGj9aq97ipI2sivPceR6m7x5GgtXvu
         SSqRdldjSfT/34wF5JYe0VQxCv8dCeAXEfSZeMrrg+jUd5Iw4b0rp6A+h7CnbHAjNITw
         N7WxG9LnOe3sozlREEyAvH1fYghbt/xFOgc1pCNtHMo+jnfQFivpX548FSdvezwspT8/
         lTBA==
X-Forwarded-Encrypted: i=1; AJvYcCXq/ClIic9YEfz7LQf+88UMmhCjLntmDTF2Ami5WiZm7XjUgCfQKw39SheBHh4ZxKmurllhgVWo63z9Pbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE9rrWxsRbsLWDYSDSEiu4jVjJeijAaHIPpRbLGR66k7oGP7iL
	3n7Ji68TpBgqZTUMuaJudHbG0SCi/K0ZmNSFBh4JP/5/miic4jPDzkQ5JqQj0f8abdpw+afGRQA
	JHaTRPAZ8IKcMqS0z8WgUuv/w+97lHRkEuyyZ2V/5A7vG4OjzQncCOgrpaHnfMxZ31rb9UZWKnP
	J5og==
X-Gm-Gg: ASbGncvFElRBTBu7Yg5CBPkWW32r/ezfmyRxJwbe3jQppBAMNdFXeUhA9YHAyr0lkO/
	CPo10i+NkUPPsfKZjgPtXNmG1CFP4L/jOnKFr3DL7L7d3PvsWel0Pgsup//20LRPgqmRMn7jLGe
	TJoWGpFa6Wq2MWJZfvjOl2cYzXv9I5xJMsaco8unDVLNCgM6ZSDibbpZJJeCovjxboWP/Xr6nlV
	9R9zRdbvRFNqUzR+jiEIGX44z2HgHVkDyy1+/C+bzXQzetTKwkA3OCuQ4q5stVkn8dDWEHGD8fz
	3OUgvcVX5JCatFy6J8LAyw2xAO22n0PN41mFFT4WU4uG9M6r78HgG3PTaEPyNQEVTm0drv+UBZN
	ORsOzABEdR6ECmXwBmBYPorPUKeFoDjqcutA=
X-Received: by 2002:a05:620a:29d2:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7d3f98c77e6mr1102347085a.7.1750529655171;
        Sat, 21 Jun 2025 11:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9y42uVOGByHIC2CBh6Ap0nz7GpIfl5u/D03eThzuzRkDRz+TR/dzqSjl234RVIJ6r6Kel8Q==
X-Received: by 2002:a05:620a:29d2:b0:7ca:c9cb:ab1 with SMTP id af79cd13be357-7d3f98c77e6mr1102343785a.7.1750529654719;
        Sat, 21 Jun 2025 11:14:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:12:56 +0300
Subject: [PATCH 1/8] usb: typec: ucsi: yoga-c630: fix error and remove
 paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-1-a86de5e11361@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1645;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dSQFGNWG/Zf26SyfOt589O9Vx61eV+28LRkpnswAKEg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZyR3x2JVzH9HD3TQI4ofjUDHoHGx3Andr9b
 pMKv6svuPKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cgAKCRCLPIo+Aiko
 1dNyB/4xVhi2i3qRu/UXloyqlOmjwZXkfGnQKJA19/28sTSvZSmYqkUwVjPR+rlBYXeD5ri+W+z
 hpgtM7ZFzm8FtToy6XwR/eDi6EA0ruS5wNCJ7GzXmcaI7+YwjBIyK5UDMMx8RdQ7RTYxBJ0Olhw
 ISyiLrr3hhXrHUb/hiRDI4igTussRWtKuK9hMUQ/4IB+4Fj5uN4/NcgbUkMzp6PYInoxS4WrKmX
 xP2ji4GdYqxa2FPbejzIiysLYe/qmiu3ih/2P7g9sS0W2Y05BTcDO7ckpjrUAZ7QJqyQx3Rdin5
 yklMXFcRY3QBW6pBERSfc79DHn0vzzRalx9ozwzEj8aZyo4N
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: tqTul-KuaYnvcMAKCiHFf7gYo3oPVWJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX2wQMxkgUDSG2
 PNFZjwtKyDUCSiySoDi6El7xlM0ro3WGuRShhXAqcw098LV9cg/V4KUjUZZ1D3VG98Ex/82LokE
 RfvVX8X9BI69n0ZqGRQnYa+Hyo7hl/1g2CivJPCy+quTP/fDV7H61aSkRdhpXkVlDurbkLnGsj/
 iXigEAOy7JKSCDCU1SnRH1QOgTZ85qatuwNCSOuYhDZtaIrderUWJhXmyIkKKCfYPuVT2KHQftj
 1PuckBlYPvyjJBrgbf4p1kS0Ukbrofht83bxqPR68eAjCXIcaFlaqOXOLJXn7twBFaJENed+KdK
 NRP4JzYV3bGo4hj/Is6lBXLG9pd0qqAPjU/nJ79YJ6VkqilSyTDsvDB1kdFBAKhOp/CWfgUiTr3
 aTeKGMsj3lz0Dz4Yk9EEW8L0nZZgSwAn9QJdKhzujSaHiL1n7QbrjtIRN1YD+W4ywMe/Fd/i
X-Authority-Analysis: v=2.4 cv=UetRSLSN c=1 sm=1 tr=0 ts=6856f678 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6GRmOlDtAtgjFoD-o_4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: tqTul-KuaYnvcMAKCiHFf7gYo3oPVWJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

Fix memory leak and call ucsi_destroy() from the driver's remove
function and probe's error path in order to remove debugfs files and
free the memory. Also call yoga_c630_ec_unregister_notify() in the
probe's error path.

Fixes: 2ea6d07efe53 ("usb: typec: ucsi: add Lenovo Yoga C630 glue driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index d33e3f2dd1d80f7b49d9c5e7355fb14a97c74dd5..47e8dd5b255b2b306dd9c3d6ac8c3b896954981a 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -133,17 +133,30 @@ static int yoga_c630_ucsi_probe(struct auxiliary_device *adev,
 
 	ret = yoga_c630_ec_register_notify(ec, &uec->nb);
 	if (ret)
-		return ret;
+		goto err_destroy;
+
+	ret = ucsi_register(uec->ucsi);
+	if (ret)
+		goto err_unregister;
+
+	return 0;
 
-	return ucsi_register(uec->ucsi);
+err_unregister:
+	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
+
+err_destroy:
+	ucsi_destroy(uec->ucsi);
+
+	return ret;
 }
 
 static void yoga_c630_ucsi_remove(struct auxiliary_device *adev)
 {
 	struct yoga_c630_ucsi *uec = auxiliary_get_drvdata(adev);
 
-	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
 	ucsi_unregister(uec->ucsi);
+	yoga_c630_ec_unregister_notify(uec->ec, &uec->nb);
+	ucsi_destroy(uec->ucsi);
 }
 
 static const struct auxiliary_device_id yoga_c630_ucsi_id_table[] = {

-- 
2.39.5

