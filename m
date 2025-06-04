Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ECE1C700C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749016831; cv=none; b=iDSxzdZuMp2Dw7jXGBJmDZGfbvNJ72vHwidu9O4NViTFdeHbrjHU4vleFnaKj+Rak8vk1mREFxrDUm3XVMcjjaKoC+8lrsbo5LY3FlW4I9RpWmnHSrKat6Iudr1WeUnHoGuADuAxp18R0RBTslDSJ6YuFUWY9NgLuVogkH8HuLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749016831; c=relaxed/simple;
	bh=0+TEVJg7p2jL1KfAfPfpeOEnS0LGaLrv7X5P6gJE1cA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aalgURjce7NvrFQT72BUR/pgwZ/PS4xd9sW7tkkv+VsrYG1ahTM1T7mfoJ1t0hRZ8QZ++SRil31LaNd6lqZ5pLLvAgsEcXXcSw/Y+6j3vBdHptK/snjERfXYHvCzqvtIVv+C3ea1foN1AErTVK2vOhDoiO34KXGASUaYSTYHMU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7/ZZT/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7/ZZT/6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553Jr4Dp028364
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 06:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/LV17/bXn+ta4up463Ni2dQX99wlzghOGZu
	OYVPW/f8=; b=d7/ZZT/6RqMfxHF5fLGEWlueeuiQB/GTlyb50MrS8FZXeh+mnpf
	Lzxr6hpzyCLrybj8y8kakAJq4vDP1DjHgZ8mzsmvTNHYQcvzTj1fWAuBZNN8wFNV
	PspmJozjQ/InRfKIs8DL/HuPhdI1wowiLW9RpAAsiLrMRcTYtaugRKT2J++jGY1Y
	OfnQgU3/5RRhs0u+4JoWAQIOcNss+EaWGLbHczaAXjn4FEPQqZy8CY3ELiE6pctd
	fODFTei6sO4ZGUOqiFgoha+cCVxeflsWwPwKG9qxBrGvbU2eGLY/n/EdaO28ZyA3
	DZgtM9Y0DVHFSK8K9KQ442iUglYT6qstrig==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nmyvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:00:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234aceaf591so45618845ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 23:00:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749016827; x=1749621627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LV17/bXn+ta4up463Ni2dQX99wlzghOGZuOYVPW/f8=;
        b=Q2CMtfGOMOB3CtLJsdb2ewsOlRZ+FkgS7XOKX8gO9qurWeZYJco6zjj5cUj9rMqAvT
         CsfajHKz8H/rXQcnsvkyqfmssg6zFYLOc88dn2aKbJXkGOjCTev7yRwz0i0hYFyuiYzo
         3s2UWRJY+ludCwHrLdfZujpoJ0vu5bBf0BjtGkYV16+ZmDBwCTfdHcVDBWj7yjIqEQRx
         TcY5QEQ7oDTY+7BcZhKLUWcLxBZFtgt690ANT+ololxSs0RbglCg1GIEdcG8Tu3N4Yny
         ZEu6Rl/78yNnJjYYnIVMv9d86fV+3l1Xc9gkXPgL/5fK7AUZ8xz2gLr5RUgZrpeYOzO/
         Q4qA==
X-Forwarded-Encrypted: i=1; AJvYcCVUO2p9He1pdrvuYtdABnCp1bqFwUV4/QBKBNN3gV5JHmi1uUyA1+BI1u50RKKR5mHIu4jd8pZrJIWTQ/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCyoHiSrNcqolsjjiN0He5nYyQN/7deykQP0foXRMVHb1hqkbe
	GH8H/cWqOkQSrH9w7dtbA6Q0MFXcIcRvhl93abuBdxUh8lv97qIYB1QLXBztf+l+l6X56FNwRQT
	HuKxgsHU7UP7k6NZOL4pzLUW8FawJrkA0QwrOit4TsSQjybhIn1MShbVlYJZJfdRPwrU=
X-Gm-Gg: ASbGncuPGZkIf7KZTraH3PR9XLwCFzmAecxYiYy6qTO9ktiM1aI49114rInqKMD0B+t
	8IssOhWQGN3iCSCnBY73JFebcGqPuyVpb9hbg0LXt4ezJs/HV2zMlK3Wj3zq24FOEKHhiHfAdoN
	HzG7VdbCQX/bVwLKsUw5DyaN2u3zKZk37jgbG/4xJhxlNC7VEZtv7qFghnFSZvdptlYicuLt/sO
	8YcbiCRK+IAB62ZoAVl/qdYKlitKQNd2WAJGJeuoHLeoaBhgxtznJgVcic7XkH+AjyDjJpIiSG5
	bx9p1q423kkWU44JmsgQz5Ghdgus+nWAHk6jNbkgJUK1/xByQA==
X-Received: by 2002:a17:903:32cd:b0:235:1b3e:c01c with SMTP id d9443c01a7336-235e11e6804mr23432225ad.39.1749016827102;
        Tue, 03 Jun 2025 23:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW3A3paX4fMhfimwAYJuU41jJO6w5XA12vlCaJUDb2iyxsilOXnnW8zPr0niNBljXMt9j3ig==
X-Received: by 2002:a17:903:32cd:b0:235:1b3e:c01c with SMTP id d9443c01a7336-235e11e6804mr23431645ad.39.1749016826607;
        Tue, 03 Jun 2025 23:00:26 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-312e73face1sm1417579a91.1.2025.06.03.23.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:00:26 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: qcom: Don't leave BCR asserted
Date: Wed,  4 Jun 2025 11:30:19 +0530
Message-Id: <20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Zw7tv7fIzZpiicj3fAs5MecK6OHR2eZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA0OSBTYWx0ZWRfX4E8hcaWg8Rcp
 rV5kKlOK/uSGH4zwjklbOo/oLqrfz7fYiKV5qJSQjuzcVwScGQDcQIvm0VibqLv/mQLQ1HomC4t
 ubvdQUjO9HvQpKDuBT84S4ClxuuQGOuzTQIfgL5D0BmiaQUHC6LWDbNz6r6fcYpMyr8cvwEvrt9
 BtU00No8rKr4YTYluAASsO11YemrHsh1H8UWnZjCnZMBaljyZBUS3hYQQ690WnfBWFlQwh007PV
 LEAHu2DQa54F5ebXxHMt6R5wa9stB+uGSjw+uqtSaa7Ea+R/QpcYziZLiZh5OLvOK2S02+rUtoO
 BQA28q5L23U0brMBbrPRq4vKKVPx4wnMgFrCsegwRuZbMTAtzh/Wq6lKSAabwubO2GPVjMJ7r7z
 xXxVRYoCTjRvk+FTxWVjTapSTtdWkcfNlwtpk5bTUDuUi0VPUNrCz4OIvsIOUtDhxaZHro19
X-Proofpoint-ORIG-GUID: Zw7tv7fIzZpiicj3fAs5MecK6OHR2eZC
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=683fe0fc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rzSUB_1TqBMNDQYVAdkA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=978 clxscore=1011 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040049

Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
blocks any subsequent attempts of probing the device, e.g. after a probe
deferral, with the following showing in the log:

[    1.332226] usb30_prim_gdsc status stuck at 'off'

Leave the BCR deasserted when exiting the driver to avoid this issue.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 7334de85ad10..ca7e1c02773a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -680,12 +680,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	ret = reset_control_deassert(qcom->resets);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to deassert resets, err=%d\n", ret);
-		goto reset_assert;
+		return ret;
 	}
 
 	ret = clk_bulk_prepare_enable(qcom->num_clocks, qcom->clks);
 	if (ret < 0)
-		goto reset_assert;
+		return ret;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
@@ -755,8 +755,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	dwc3_core_remove(&qcom->dwc);
 clk_disable:
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
-reset_assert:
-	reset_control_assert(qcom->resets);
 
 	return ret;
 }
@@ -771,7 +769,6 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(qcom->num_clocks, qcom->clks);
 
 	dwc3_qcom_interconnect_exit(qcom);
-	reset_control_assert(qcom->resets);
 }
 
 static int dwc3_qcom_pm_suspend(struct device *dev)
-- 
2.34.1

