Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942DA270ED7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898789; cv=none; b=dzzhJ7okK2j6mk/Rp1Z8VkJnQvQH0aB4OoG4P//MZRot8288Z73mjnzDKq6fwU26aS8CjwI7jw67YDznyHip91s40oiGwgHklh9yOekT9TGQT24bYQj2Rz/NevmjYM3Ml4J1zuqqWiMGBaagbncKJ4ljhfUnB+t7b47tiTNPL7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898789; c=relaxed/simple;
	bh=jLmu/aReFVFRNgk+rmmotA/CPsvLPvnccSXqzfXjPmc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dVU6Jac7NCjXB1rMxXofJLXliFJVMdenHMrKuv500RWRajAY7LnHNPfsy+oVyGl8O1HNDE4jKZMj8WcKDbzT0hDLV7zPkyAHG1mPcvOOcEIyzRCAzUqzZa2/i08CVuNzwISpcVSQTDF2cmttgVPdydtr5iM8ZZI+I+UbYqTjm8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3BwSvyD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3BwSvyD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq08j030210
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WGZp/w4iywbuQDYkGDQCYO
	PCRtz2jaZPBN+f6a9kvv0=; b=l3BwSvyDX5Rnd2HfP1RTkjkD/lR5USLqDcCfeT
	N6s+tdX59fuFvvZ5NVheGbGrWGfbOmnmVwlX/hDe7U9/EGQrX8V5eoU1Z4tT8Ef+
	hzX344JLLOTKVGtWoSoGFUga0LpqjnkpjRvKcaumS2Y7zMSWBFxHib/2puLvBidP
	OkbsWBNEWh0RKizn6HwBhl6UE5rG/kRQa+ZxMmW8F2LmNVcaMusS9Y75hteeOkb2
	90UjSCb8ZMNVC9pOUrJTAzvgeNFGb37zKH+MmL8WZJ7YcLMJcsBBPDrK7OlVv4YF
	/Vr+gS6e89gqcQiAiwvj3ugfFwNLhIIyB0WSy1uFps/dVTDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pevj8ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:53:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so4932392a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898784; x=1746503584;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGZp/w4iywbuQDYkGDQCYOPCRtz2jaZPBN+f6a9kvv0=;
        b=WY+1Iy6J2Px+6plAZHz2JUY9zhoq/Z5TAQZG9Kl/6kvHSYkkQj2I7iHEG87KuiMP7z
         NptviaTAlX0azyam9M67BkyyvAdYJDz8OM+nOep7nE9D1kKu7cRQb3Ozvo7H+R4P83N2
         MziA8f5SjlAe2ugzt29xkIU1278GylLcM41F/js8mBVF/ujTpWzZ6f6kJ9qP0mXsLNSj
         KbQrzXMHuRMVUmsalPyoA9D37dc5T18v0hdgNUk3IYvI2erBmeGpPi/rzkR6Pze8zbeX
         l3Cm/jQ1b3q7sRiFdQ3UPyf2/9iIiRXlfGR0qAEBfgJSlboXNOqyjGNkBBrkz5922Qlv
         GtQg==
X-Forwarded-Encrypted: i=1; AJvYcCXe+SLlad48NXtxvWf+lnF/0OvpTAoPqv6GzaYH0AYKT9X8pVnMOsHw1tegbPAN/NaBPIXNNR42co0cs4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl4XJ1QW2KuYAchszeE57gNzj3W1+o4wdGZ8hAjjDZAqeKlABR
	MYleSMHpVP1B9vPZIS0hyKMwEABj4qGp3KZs8xK7RwyA4XdLdHiEddrQdpYU8QkRfAI3j6ZCcLi
	/7uYfGTaUy2D8r7oe/Z0ZSLwbX5OQCqVTuQJGq0JxgfOBBIwZTuZ/ZcYvqAZyAeM=
X-Gm-Gg: ASbGnctIJ4T2n0N2SHAxiYiyUj59cHkvMajU0TlxnZ7EbIVyR+zIuSDiJVqAe1Jf3mc
	fUo3DMCKpDSO+36spbJx9WLH2hwGriSEqjKzPHYw37SCntED946qi95bi2G4jwNYFCQD6bZI8cp
	zOdG+waWEW0Ht/ELL1pNeyacKNrjg3+Z3GcBISZ5ZPDbW/jsdPkqpUwN3tz2p6vG0FPqKxZZq9h
	AWKQDRqewAiK1+XiXQw8YtBhrXMkZziwxqp/QVBqV67AHw7YvxjWDAotr2K4vvcbvJDKBplBnz4
	CBXnRLHhokODbX8A9PLq+J4r/A==
X-Received: by 2002:a17:90b:2c84:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-30a0132cd12mr17695702a91.17.1745898784457;
        Mon, 28 Apr 2025 20:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpedx2i7qLyvcXvXQEvqZiXQ0q9dUc+SDNQHlNj0NpJm/fG/f/GzdGx5tQJrOxYdd/+Bp/yw==
X-Received: by 2002:a17:90b:2c84:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-30a0132cd12mr17695668a91.17.1745898783933;
        Mon, 28 Apr 2025 20:53:03 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef1246d2sm9960522a91.36.2025.04.28.20.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:53:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH 0/3] soc: qcom: qcom_stats: Add DDR stats
Date: Tue, 29 Apr 2025 09:22:32 +0530
Message-Id: <20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAABNEGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMz3ZSUovjiksSS4nhdY0tDUwPTJOOURLNEJaCGgqLUtMwKsGHRsbW
 1AI54NRFcAAAA
X-Change-ID: 20250426-ddr_stats_-391505b3da6a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745898780; l=2741;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=jLmu/aReFVFRNgk+rmmotA/CPsvLPvnccSXqzfXjPmc=;
 b=KG/DZ6oisoEAxu29fK1J4R6drif9d/3dPtncJ5qz/XWvntU9+6gvSUK6ASDqbboaQmq8r3w6/
 9CXSLh6RNLMC2snoWMZBp+Crq5d4KQdEJqouS75o/zHvkDdOIOaojv1
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: tC_v3M3L2I4UqKeZUC9Kymq6hNqNSLqU
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=68104d21 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=LL9MhAs6j1V-iqFh5R4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tC_v3M3L2I4UqKeZUC9Kymq6hNqNSLqU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAyNyBTYWx0ZWRfX8l8o9rvMsgLY od/DKysWaS5dusI70hjdl+1lfxznrs3PuOCkh6l6w29sYaiOmfZHbrJLE8TW4NrIQjUS7AynaeO vcJxsx4pg6qQbXhVgFgRMyyc3E5a6DmtTx9kQtFzepgbpjZFUBY+2/imTZghmPr2h4HXfPKtuGf
 UehZkMhab4YdXciTy2MCox/gTiWPtVvi7RoOIiSEK7xUN7RuT0QV/1/AAX0rStd2brLxHd/I1Ez MQ20LOVMl16ITrUVC/RlVGP6N/wnsV/rMxyJu0fSFQe+akPyp7ouA+59EV2UZOL5sCMoB2BeA6T o8XNGVa6tmsGSbUvM5OMHxoJWr+c3GKvWAY9hF19DsmR7xHl1W+Qn/esQubW0zLiTkLRkBwJBEM
 i8dYmxvaB4MgllEBMFFPwJB4K+aSRcy7gFRH0FNLWYEMij1xUTwYDehIA6q4ek4AvrlwrDCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=895 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290027

This series adds support to read various DDR low power mode and frequency
stats. This was added in past with series [1] but reverted with [4] due
to some SoCs boot up failures. This series is more aligned to downstream
implementation and fixes the issues mentioned in [4].

The series [1] tried to add three feature support

A. Reading DDR Frequency and low power stats from MSG RAM
   (targets where DDR stats are readily available in MSG RAM to read)

B. Trigger QMP to ask AOP to populate DDR Frequency and low power stats
   (targets where DDR stats are available but duration field syncing
   requires QMP message to be sent to AOP)

C. Trigger QMP to ask AOP to populate DDR vote table information
   (To read different DRV / Direct Resource Voter, CPUSS, DSPs's votes
   for DDR frequency)

Current series do not include reading the DDR vote table information (C)
part from [1] which is to be separately sent potentially including reading
other resources votes like Cx Rail level vote information. These vote
tables details are not strictly related to DDR Frequency and low power
stats (A) and (B) this series is adding.

This series updates respective SoC devicetree with QMP handle (where DDR
stats syncing is required) and it is backward compatible with older
devicetree as without the QMP handle present, ddr stats can be still be
read (duration field will be read as 0).

Note that [1] was only partially reverted and hence device binding update
for QMP handle [2] is already present along with the fix to have
dependency on AOSS QMP driver in Kconfig [3].

[1] https://lore.kernel.org/all/20231130-topic-ddr_sleep_stats-v1-0-5981c2e764b6@linaro.org/
[2] https://lore.kernel.org/all/20231130-topic-ddr_sleep_stats-v1-2-5981c2e764b6@linaro.org/
[3] https://lore.kernel.org/lkml/20231205-qcom_stats-aoss_qmp-dependency-v1-1-8dabe1b5c32a@quicinc.com/T/
[4] https://lore.kernel.org/all/20231214-topic-undo_ddr_stats-v1-1-1fe32c258e56@linaro.org/

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Maulik Shah (3):
      soc: qcom: qcom_stats: Add support to read DDR statistic
      soc: qcom: qcom_stats: Add QMP support for syncing ddr stats
      arm64: dts: qcom: Add QMP handle for qcom_stats

 arch/arm64/boot/dts/qcom/sm8450.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi |   1 +
 drivers/soc/qcom/qcom_stats.c        | 127 +++++++++++++++++++++++++++++++++++
 5 files changed, 131 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-ddr_stats_-391505b3da6a

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>

