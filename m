Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B8A213E7A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749213222; cv=none; b=QMaOUWGfS2sdND/HBwy63CIJwlHlYSTMQOII33Z3P2cPwolSRnDSqk8hXlWNB5iB7gRu/AVuHnteU9duSoc460c2q4HgsvwLdUwuthrPhzmQootR/Uot0/UZ4LPPG7aj2Y+cTtoX2aYpJjLpwTIVM6A1jUG9pvapbBikqjfYMgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749213222; c=relaxed/simple;
	bh=ivddDW5T1J4JyvrdspbZFEYi06jSdvMZOcvhE69syLI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MhsjMnqDtTyj+DNrKBmGO0fH72O9lDFL8tgOJthjt+yVhsFa2u09eSgxSfJYyA1Mj5IphhlGopaPC1y7f/Bk5IoNonQTyUyZ9ATglZe8wglfQLiumUtl+3Q/1zNBHm0LeHEw2OFAvtHUlkjLh//I509SkigdYOS1naV/u+ckxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQPPGsWv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQPPGsWv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5566UHvT007396
	for <linux-kernel@vger.kernel.org>; Fri, 6 Jun 2025 12:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s8QIRnPERxawgaDmjJObpuottssSVfUeoUh
	Fx/MyZdI=; b=QQPPGsWvIG7XglAeGf4kRQpZ3C9kG3w7hKeUxNtRzAdHxvtyFJ8
	bVnyUyRSiAFiubPR9a3meNVq6VlGBiV40s3Cj6rVDYptXpPo7biWdmb8v+laOu8D
	h0x+ZOpF9rV2HB7dBeQWC6Q9kuTyt3jF9x7H9FloZKuPb87Z50yn3CHXoKd305O+
	zcUNRvcfqMMLY/3aHp6yt0/2+jPXLet1hjZ0+ZpUd3nYbJAKxFbbxP7Of/0/ywnI
	jb/cR38OQWp4LA++0oVQm5k0M3m+0RtnBhOw28EDOftODzLxKsCD16M0zQkGHRpd
	oJgEbq5hN3LtJTypac+szaggIZZQjye41Ug==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t4jdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 12:33:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6face1d593bso36542626d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749213218; x=1749818018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8QIRnPERxawgaDmjJObpuottssSVfUeoUhFx/MyZdI=;
        b=iqFDINzqmxicqKPG+8hHnpM8StLMpb35ew9/PEO4p9wcV97CLMmXgZ0rEGu0hQCeLu
         4LpTuh59dEHoMLL20YD0mwp5Lc88jWjFsY2oTDCc6vssJ5sJC+44pNLdY07XdhJVamfQ
         56PL9VDeWSI96+qtnj0YNRVLC5pE76b9a99QgetGm6jGDPqKyLfkDryxST8kmorCidb0
         Ub0WTnmjvzjHmaKoqJPfsEB4R7H3hrPJryLElQrGw6+RT1J9IOL4bb6aTyztXQNrAWEp
         zZNrZgpHxO8r62UgEBbsJAYKXg6qVKxMQJ0RdrApdMAF473Y1ndGMrXAMqNPNVHzM7yp
         /Fjg==
X-Forwarded-Encrypted: i=1; AJvYcCVBoDlXXj4mYY5ARKTaWxJsUg1JrUobVSDjzULxrs3Oz/xs3yniWBcYvjtL6sy4srdrH+v07dTvUKTNOwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpKWPS+7scfxtAyCUzz0Ryb8RG5j/TKRPfWSqu/pdQPtb/GlIf
	hU7ni0oYEfsnTsaQCJ+3r/zb5qf5S8Oo3xrwLUgkOpjZNMqgmlKkaJYxxq+XgWbbwcWzARXOKuV
	7jPGQPyYqREd0xpcmNJ+AMCx+uchRgPaDR9wIBRB2oBHw0+EJzFgtaO58MzbNQ6Dcr/Y=
X-Gm-Gg: ASbGnct5OnYjNHI4qg0euBfGpoCrzu0bmT13fkZ9am4H33kLLXqQabLd+2oFqGIp9y6
	NCksjJ2CHngYfpChOTC8WrTxli2P0EvDInA8AT2G8E4Jqc2c93mEMjdpHaISLxdMEkMmjxpEHMt
	8EdK83NktGXYRnb5WDWaZxwu8KL62mZeYdLclIwegDbVBtwAA64rWXbewhCKtAKvB3GFwtW+b++
	f/7dye048qmYo5tPvMJqWZxdS7zphhlT67NKpHDM7d2VqUvxRCWaPF0/GC3TGS59PMlvM9zlaCm
	QFtFTDL0OHBbAdq9Gllz6gbr7plmdUzvMAe/Rg2a5TUC2gcQG5YTDkfOH+M3oeX6Xw==
X-Received: by 2002:ad4:5ced:0:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6fb08f86d87mr50834766d6.21.1749213218274;
        Fri, 06 Jun 2025 05:33:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHq0LfKT7V7Hdr9+7FwMCh7gMOKBUV5KaU9c5KLNxPHvFir0fRLD3304/1mkrTlVrjWvgwZcg==
X-Received: by 2002:ad4:5ced:0:b0:6eb:28e4:8519 with SMTP id 6a1803df08f44-6fb08f86d87mr50834576d6.21.1749213217966;
        Fri, 06 Jun 2025 05:33:37 -0700 (PDT)
Received: from trex.. (142.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8f12e16sm33777225e9.1.2025.06.06.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:33:37 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCHv2] media: venus: protect against spurious interrupts during probe
Date: Fri,  6 Jun 2025 14:33:34 +0200
Message-Id: <20250606123334.4114123-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=6842e023 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=jucdD076RO8dzeEYkB3eYw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VOU_bqPf6nVU0ntsUH0A:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDExMyBTYWx0ZWRfX4rSmloO1RiZ2
 j6nDnlOUPcgBCk2etBJ3tSoAth5/Q+d+6dj5lhWz+qG9zTJGr/w7wf7V2mSDAVTAzLEZr9DqYS0
 RhfVrVn9Cuc+zRtUwW08b6f1/rv06660Api9ozISp28y85pOAzJssh9QgaxwXWNWWYjszsqr9ye
 Y85J+6hBWkoxoTodxH+GxsUgsX2h6I48kl4XoYLf3njRSYt4voM+fFMmadhUXp5SZlQXVSf8AdF
 I6YtkN6Gke2kF5E4VAXod9lZnDV0s62/7Mj7LuUI8/GGiPX3r6lkc5exT7OCqTVoUJJrirUziqz
 itRMWH2+oRoO8uG1TPAjuJUsAFaCpTXw2dcCHhDAH+GfoHxBgon1n/QyqyGUUY5PyqkGRMhRBB3
 9WeUb/fZNdruKbHrskbaANzxy7xMUtKGcG0OsnXAVlodaJfJs58qTbe2xGa17J60Bfpuif79
X-Proofpoint-GUID: RR9YBfIPaQk5kMNrdHV26W2qT4KaH3rU
X-Proofpoint-ORIG-GUID: RR9YBfIPaQk5kMNrdHV26W2qT4KaH3rU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 clxscore=1011 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060113

Make sure the interrupt handler is initialized before the interrupt is
registered.

If the IRQ is registered before hfi_create(), it's possible that an
interrupt fires before the handler setup is complete, leading to a NULL
dereference.

This error condition has been observed during system boot on Rb3Gen2.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 v2: fix authorship
     fix spelling mistake
    
 drivers/media/platform/qcom/venus/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index d305d74bb152..5bd99d0aafe4 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
 	init_waitqueue_head(&core->sys_err_done);
 
-	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-					"venus", core);
+	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		goto err_core_put;
 
-	ret = hfi_create(core, &venus_core_ops);
+	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					"venus", core);
 	if (ret)
 		goto err_core_put;
 
-- 
2.34.1

