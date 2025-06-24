Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753C25BEEA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805743; cv=none; b=cisvLi2SnkqGTWXCMh1GJZxaFj8cMP/OzERfo39oCRPtwzAkjRMoy42VGjSdV+TfUboA3JWBETMJkNTDxin2B06kQ8OyM0jBKCVitCJCtkffGveBD4E+iU51yemGHuxpSxHTkFWlNcjnKSn3ok81RatrCNfYe/E+F7RFceBttqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805743; c=relaxed/simple;
	bh=Qvs3OSKRQqOM9ZIlTxVsxePe5U87cmKzQZn7+r8tgeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDC7tbICkD8w8iwMc7c47+S6QOzszAJgcTgxgBVRkDmP8mT00MYlpQY3DPBQn5B+saibe2iR2KiAQH1IGNfXV/goWfxDgxDDpWeJivL8B7Krn/kc8SYzRZm9/gpzpSenw5ne3gmDYZYrZht9P4fL9plyAasWRcoQEsOeWlOi4wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1xqbv+o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1xqbv+o"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OD77ip007242
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uiAkGgQteo6o/z1D6/oqPRuT2A6kwChd2t935QW2WY=; b=V1xqbv+oZEv4f7uJ
	RtifVIEkM2+zgmYp++sunzbAXITzrjud5fsVYOO/F4VBD2yvXwa4lFW6xx7EZUhk
	CJJlQUywwXgdf0i5xrXG9QtaEeWjEU4i0222KBYQvHjM9N10r0Ne2cq4h0ZquHOn
	racW4MNit/xXUZqEJ+/5Myrofv+ttLuu7IWz7Cu5OYq5Ec6PVnY6uD2xOn50hjc2
	5Lw55vtalo5CjULbeRBq4FtMuXpkC5O+vLug7Bn30TFGQrdUKSksSDiBOoLW7iSD
	C9m+nKwjBXlHCXryJLVFBkbIZnuWdc+Fhz555moXd4awb4dAgxwoUHwLh0fuiELU
	nMhuLA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec2682jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:55:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31c38d4063so3861285a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805740; x=1751410540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uiAkGgQteo6o/z1D6/oqPRuT2A6kwChd2t935QW2WY=;
        b=mMyizxU6GGK38N3RJx6GvyhoQQu+IGKlfj9W4rYYLMso42Pnc68qxnzVDGk/jjz3fz
         qumJdxQYErIIghSEUztYLZSh4ZbmTS8rg/eGifs+OWVvGxoW5vvkA4nSEeiEBLImFyK1
         TAmrKJcTewFoiFry5C5PC5ydq4j4XDwn9v1ryOMx3Dc/aYMvFBnlQKZA5GKOifYz4Gm2
         wldihPv09QC9wMu6NTklpec/C727Ep4hfFoXNinQCwXu4QubYymq4pYLNq/g+WnrLCpi
         XmAeKmh5tZGVlaHV9MRr17caXXLp8Doxn7jxbIOfN0uth2vUIFIJiDDp1/AlNW6KX1hN
         fA3g==
X-Forwarded-Encrypted: i=1; AJvYcCW/77x08cgVZDy5OXOiA8T7rNF7fGYYhpOkJDWRvVp1x3obl3DO1rAdvPV94MuYDCuk5OhYXn2I6RFnK9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbpjXKu8QwaIclHcqiJi9B6huZNzBkutYLSRJnDxsiGWrB9T9r
	qQr2UQVKglBojkmEk+367HGEXKB2MZt55pv+3mAmiUgjYKcr8JXbC9NmE30PiZDY8gQOT1nSQUN
	M/J/XMU4fNOv9Z7nLSWfIHeAtBkiCy2dncGCY4Ixn3cUs6Lqvrnu4jLyz30UgT5WJl8o=
X-Gm-Gg: ASbGncuzOyLlv/JWaCG4XqjvHIRQYMstWqbKsbe5QF1+sdEkUh8/akIN1yHNY6jPeiW
	U2njTHYWHdnunuXGhfuPUXWlUIczZTXSm6zSZpdfTEx0CP3KN7pEPhb6SQatjD20y2OMxgm0zn9
	MUYUW+kTmfy+tuRjRwYqpxQ+ESb2csyjzbhllGggqzP9GwTmi7DEZcIvnN5hAupSeMwZBq6M1sa
	PzNYJhPi7te9q9uEv0NSeyO6cwTN13Bt1viy45vihjGm+1/b5OlejUY3S9ezy8Jes1WUJ5q5aWX
	YXygjjdkFv2rI5oVEI72CxadNnfRKQde9Gt2dYdn5Mfh22xer0FSKHqmdbeUMoL1PmcyhVl+D6+
	csqn9Wd3X+w==
X-Received: by 2002:a17:90a:c887:b0:313:1e9d:404b with SMTP id 98e67ed59e1d1-315f25c8e7amr848490a91.2.1750805739993;
        Tue, 24 Jun 2025 15:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGii1z/HTJYbndXIl3QbVV7r9Sayc+qnaz/nFenH/a1CYIACL/DiGEBzq6rne4rPDDuISg8Lw==
X-Received: by 2002:a17:90a:c887:b0:313:1e9d:404b with SMTP id 98e67ed59e1d1-315f25c8e7amr848464a91.2.1750805739553;
        Tue, 24 Jun 2025 15:55:39 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53a65adsm154949a91.11.2025.06.24.15.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:55:38 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom: pmic_glink: Add support for subsystem restart (SSR)
Date: Tue, 24 Jun 2025 15:55:35 -0700
Message-Id: <20250624225535.2013141-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
References: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MyBTYWx0ZWRfX+rqNdLHfJvii
 HqZJL9RdOO+fVfOG3mtkjhPXypr3b577orRdj4pLEloCPPDgK6dAOst9pJJwqRJEVhSNgGyvMfM
 ntJbsbzwaP34/1gELCwWhQb+Wrw+7ELimC/vwj7nNxnLoC+q9WWdRsR5HkUbkwdJTy9pzkOi4Dq
 fCMsPCdfD8LqTDkT44x7oNZ1idKuE4vopgB6FZ+bhTfWFXAfbqmqPjxXqfAfYBiXA7WMgse84xx
 zzYiZHhjfKUb4dZ09e5n02f7HpD9qSecJlah+ZVaaCRtR5OjlNPMN4xCOtDZz1m/VyR7bscIekH
 qzHgBO2AMVXAkfgv0Yzm5IGtFIrUPASJmroSlxx2OHnIgYKgIIfA8n1xSQr5sV6IGaIXx0kKKl8
 9jDp0Z3+MLSTPK14D+weZFltBMguQyber90TJPqO/3Te+WdliEkG2PC0IGZG1aahkn5nwZhP
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685b2cec cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=tIxvoA3mxl7b6XSbyz0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: pLg2nz3YuZ2jsGtkCVWe_MX_eb2IuAj-
X-Proofpoint-ORIG-GUID: pLg2nz3YuZ2jsGtkCVWe_MX_eb2IuAj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240183

Add support for PMIC Glink clients to receive notificiation when
the subsystem goes down and comes up again.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 43 +++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 0a6d325b195c..5121f19d63e5 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2022, Linaro Ltd
+ * ​​​​Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
@@ -9,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/remoteproc/qcom_rproc.h>
 #include <linux/rpmsg.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/pdr.h>
@@ -39,10 +41,14 @@ struct pmic_glink {
 	struct mutex state_lock;
 	unsigned int client_state;
 	unsigned int pdr_state;
+	unsigned int ssr_state;
 
 	/* serializing clients list updates */
 	spinlock_t client_lock;
 	struct list_head clients;
+
+	struct notifier_block ssr_nb;
+	void *ssr_handle;
 };
 
 static struct pmic_glink *__pmic_glink;
@@ -205,10 +211,12 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
 	unsigned long flags;
 
 	if (pg->client_state != SERVREG_SERVICE_STATE_UP) {
-		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
+		if ((pg->pdr_state == SERVREG_SERVICE_STATE_UP ||
+		     pg->ssr_state == QCOM_SSR_AFTER_POWERUP) && pg->ept)
 			new_state = SERVREG_SERVICE_STATE_UP;
 	} else {
-		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
+		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN ||
+		    pg->ssr_state == QCOM_SSR_BEFORE_SHUTDOWN || !pg->ept)
 			new_state = SERVREG_SERVICE_STATE_DOWN;
 	}
 
@@ -231,6 +239,18 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
 	pmic_glink_state_notify_clients(pg);
 }
 
+static int pmic_glink_ssr_callback(struct notifier_block *nb, unsigned long code, void *data)
+{
+	struct pmic_glink *pg = container_of(nb, struct pmic_glink, ssr_nb);
+
+	mutex_lock(&pg->state_lock);
+	pg->ssr_state = code;
+
+	pmic_glink_state_notify_clients(pg);
+	mutex_unlock(&pg->state_lock);
+	return 0;
+}
+
 static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 {
 	struct pmic_glink *pg;
@@ -281,6 +301,7 @@ static struct rpmsg_driver pmic_glink_rpmsg_driver = {
 static int pmic_glink_probe(struct platform_device *pdev)
 {
 	const unsigned long *match_data;
+	const char *subsys_name = NULL;
 	struct pdr_service *service;
 	struct pmic_glink *pg;
 	int ret;
@@ -333,6 +354,22 @@ static int pmic_glink_probe(struct platform_device *pdev)
 		goto out_release_aux_devices;
 	}
 
+	if (device_property_present(&pdev->dev, "qcom,subsys-name")) {
+		device_property_read_string(&pdev->dev, "qcom,subsys-name", &subsys_name);
+		if (!subsys_name) {
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->ssr_handle),
+					"failed to read subsys_name string from dt\n");
+			goto out_release_aux_devices;
+		}
+		pg->ssr_nb.notifier_call = pmic_glink_ssr_callback;
+		pg->ssr_handle = qcom_register_ssr_notifier(subsys_name, &pg->ssr_nb);
+		if (IS_ERR(pg->ssr_handle)) {
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->ssr_handle),
+					"failed adding ssr notifier\n");
+			goto out_release_aux_devices;
+		}
+	}
+
 	mutex_lock(&__pmic_glink_lock);
 	__pmic_glink = pg;
 	mutex_unlock(&__pmic_glink_lock);
@@ -360,6 +397,8 @@ static void pmic_glink_remove(struct platform_device *pdev)
 
 	pdr_handle_release(pg->pdr);
 
+	if (pg->ssr_handle)
+		qcom_unregister_ssr_notifier(pg->ssr_handle, &pg->ssr_nb);
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
 		pmic_glink_del_aux_device(pg, &pg->ps_aux);
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
-- 
2.34.1

