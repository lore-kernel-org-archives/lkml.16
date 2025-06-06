Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB41B040D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749223530; cv=none; b=EDxCCdYDfTqQ72/jqBm7fyeeU6k4CiRp91YjdYimf0iky881FOUTTJs6hD7Vx8PLXFdUer7Q2ExsifiXom7ya9m3zgJ7tT/ZGnQMH+Ly1O+563wdUvnevFkqx5dG/8sfH3dZlX6aU4HaxRU3QUZozAdMiztyTPOaGuTdU8B7JEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749223530; c=relaxed/simple;
	bh=HC6LsIuSjJdJIiJFfJoG+7VCrWOecIYvMQ4VvDDwg8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VJwAOtCGq1HtpSIpARnC0tkgKKTqXDmCgiD8GVdv+YY6tzt5k3wHKF2Fb2MSbBaDK1SRby+j6Ayx6HtooeZoj3sV4mdXZO/Pp9zNgytjety9Rg0CEObiJNtIyilprrQVgE5Lr3ew1e/3CKGpIZN6mz7XCfRcc/sWdrXtb1xOENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdwYGjCF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdwYGjCF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9G5T004397
	for <linux-kernel@vger.kernel.org>; Fri, 6 Jun 2025 15:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QMrk3eQZuTJ6Bbd8ZWvEu0BI3B7FJkAMmmB
	mL0sh1sA=; b=bdwYGjCFEG7vaEpcIiuCiiXREzZTyhBYBqo0YNGVj/OFHAG3dWy
	k26BWitZglZYM6Sw/ImDKvlujGPtvpmQcV7XdtkYH6hilKOtf2TDyEVH6x3uDsxN
	wFGqhCqjI163CeZaFwnnrA0Nq4ppV/FT+TVEq3qc2UdtyOsR+ckRyUuQYsrOyELD
	LAmeNq3TvRGLDXoHF9n9wZtDTnPORczrhFh/19xzmZoIB9s8xLmQG94Y0COFNz/N
	ljW4kgnaGoEUgeAcHNVenfY6D1eTDAnn9OpZhPlqBHFMPEeK8uQbAvKRj8D7Rw67
	dSH/oqxKPaZkbrQBaHJGNTne7iR9ct+QLgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t517q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 15:25:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0962035b7so371944085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749223527; x=1749828327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMrk3eQZuTJ6Bbd8ZWvEu0BI3B7FJkAMmmBmL0sh1sA=;
        b=AdshdytOShSYYMfGG3V3lkLdFZnXptLUm8EzxhDEEyq8IpbQe+n1NkE5tLWnOknsNg
         NcW/3i/FJB9xZnJV2+3V+ZDOltxPQMlpYerEesAe137rLrLxybjYoKjXoKVBnAfu52/p
         v3y5UqOFwbcb2wtFhtuKq+NAkuSoWBlTB6HmA/2/0J9TqCpkkfFcnOiTGnhJdGTlbJSa
         ZutvMxkawMDdYA3eYN1t3Red6/FW7X83SAniWikPA+nVkPifNdfy+onXRx44BNq73DV6
         f7EU2p8vLeKHVDUtF5PgGox7mdAu3VP0eBvGfCfRue9TwaGP+BgFpieeUjKh72ZVwZ+O
         kbPg==
X-Forwarded-Encrypted: i=1; AJvYcCU1+vPqrMqfyiU7z+sUMSDPTyD+kiFM3SkUURtix2pn9PX5T8sBU/0kxVUnqP3n5j+/TXdn548RO2fJszQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuPKse1tp6AGJMFC0k4zmx0ZyupYvw8MLQEwQyL+5H2bMTr9UG
	nHgryZ6BxEeT/30xXJcyUSVsoKw5S0AOJGcn16HhsoxJjRQ/aSRI6r9EWwlVTeTJYOEwh8SSyJ9
	3R/9sXJObRHNnKiRU9JWAqCERQxGYjz1/DKK5OwLkdUxRTaRVmcOTQV8cSY6Z1hEVjLI=
X-Gm-Gg: ASbGncu/CieSi1T1y5fPcjjqn4l37xq5quCeX8pII0MHEHMbA84Px/c00tm5vHv+LYI
	lEwvFk/jMJlTTeYKtPWgjKYCTGb6ZbhDzGH6lmPnPKq+UW6XEXL/S2SFD6UGGrgzJTICpNBrsfC
	+SULmSX0/TPgvN4xH+i2YfRWbovtjFpMLqncO1WZd/o23w7EDE/SBiKQKVSzjBtBz/5YwHjXA/e
	l4hoASCbMyQHwRbyThgg4Rea/wI1EQl04t68cCkmtkEjT86rPpqll7YzjreSu/VJemVETs1T4h3
	mQum3PfEn5rqhqALfcBCbLFy9Vr2NvbHhB7LVDPMLy6Ga7BY18s3A0TLql2Z6owVbIXMrTNnjan
	u
X-Received: by 2002:a05:620a:4487:b0:7ce:bd05:83ed with SMTP id af79cd13be357-7d22987d994mr658447585a.7.1749223526810;
        Fri, 06 Jun 2025 08:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7SY5w0YSLHb0XHZ+BNK1tvP4sA95RKfBWut3ciF+YIVDSFV5SVbZ2+XhvLmzE/7rcFXto9Q==
X-Received: by 2002:a05:620a:4487:b0:7ce:bd05:83ed with SMTP id af79cd13be357-7d22987d994mr658444185a.7.1749223526437;
        Fri, 06 Jun 2025 08:25:26 -0700 (PDT)
Received: from trex.. (142.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm27575945e9.22.2025.06.06.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:25:25 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: hans.verkuil@cisco.com, stanimir.varbanov@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCHv3] media: venus: protect against spurious interrupts during probe
Date: Fri,  6 Jun 2025 17:25:22 +0200
Message-Id: <20250606152522.4123158-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=68430868 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=jucdD076RO8dzeEYkB3eYw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ixoX2jXuh38yZQZJg40A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzNiBTYWx0ZWRfX01JDsoKA7Xvy
 zngpE/5Ubo1/ORjNMDTw5fzLfEyUK0EtA5XocH6cH48TR2wONqFcnKig+c89SNSFIp8485Hkokk
 inJBol/DcnAyWL2iesU5pyiuOHKX0JJ8Hu76wRMIfzJogSYM8ApxmCySzP3ojcFqEptEomFIFWq
 +z/cYY60lfMkivFSrNRzOvbD0z0zD3ikHsQzk6+Q3anC40+lgrKPL+F5aH/RumbLeyNaZiRiGhl
 RpaOHkDan5lY+hNfKdqxsYTrv2flxTt/ROueVrt0hipkautBYdYgvL+rF/TWbTxFgwTou8B1Vls
 NhYX2OJhTMp5DwyZvuVc+SOIp0byjlE9pMz2RFQ2XHwBTq1TCMI7GrJIHCEM5bTaKYD9C2cpQtM
 B/yP85zHhiqNEHvFcLghTILG/x/UH4KwmsvahByLbsiceN7GSKIkXbxLPQ7mk46ISsTUDfa9
X-Proofpoint-GUID: I8TSww4MgaEdiAaO94FUpdlaNoSDighY
X-Proofpoint-ORIG-GUID: I8TSww4MgaEdiAaO94FUpdlaNoSDighY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=911 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060136

Make sure the interrupt handler is initialized before the interrupt is
registered.

If the IRQ is registered before hfi_create(), it's possible that an
interrupt fires before the handler setup is complete, leading to a NULL
dereference.

This error condition has been observed during system boot on Rb3Gen2.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 v3:
    Added Fixes tag
 v2:
    Fix authorship
    Fix spelling mistake
 
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

