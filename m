Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7D1FDA8B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749621860; cv=none; b=L/lTeUskwtgBcEJMMLR02h+xak5WOV16CSpGoIahxMVUEvtCiXQh6h8ZPE+cGfpLd0NQJes0BL6pswPtqQ+uUHRfviGWpYrngA2BLO2ej6wlQOkVt7hyllGlCBn1eGhOuE41G7vLyesPURDWvK8guEQugHnSqrK3lY41ZRQvVt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749621860; c=relaxed/simple;
	bh=HV18Og1I2iEUxD4I8eDexzTJxa5Uyj7M5o26NT89eUg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SC1WbRkIUYez7aYgoKUKYS7yb+B1HmTiJYH3fYllwKSd1mJPeYC2oUM5YHBDHcaQ5NEsnCIdjGseQm10g86RjkLjWjUO/yq6Xkg0C4B/w8nQZdST39lpH+aGE5u93aE5d1YAGIfrb/zJx4/07U7JLak2yPwBBrjIK+E/dsqZ4BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jlm5bDpb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlm5bDpb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B4tNqK018368
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aEKGonfkNlVgj0BYAtHacH
	r3N8cUCIWxQs0+ZU6isQw=; b=jlm5bDpbQauuXqzHdyjULCxRD1JF3r4qMBKE2t
	9Vk3thDxHu4L6cRep7hbkKxh8QZN1pskztqdaoMVvn6NCunfAFpS93aX2weGx4/c
	fYp90XRgVOp1K0TfqHnFGOLbNyzdb5Kl3YmnxsZ1N0L9AcNG5Lea3fUKhOXZgHmm
	ggmS6NqSX4KnHN9kYIun+DMeSYLN5WRT1wIKpH68mNQBYCNC5dKoxdt04OMRmKyq
	cK+j1jbukaPbkfFepru2zq0QKgQhbdVyJBce3GN1Idqp65ST9zDUTYfPb3x8kM2d
	u1bh4C9WG6kfwL3PhJGLv8ymcUzjpxkx1MYNxKLAi4Q50L0w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47736dr4k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:04:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-312eaf676b3so8295832a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 23:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749621855; x=1750226655;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEKGonfkNlVgj0BYAtHacHr3N8cUCIWxQs0+ZU6isQw=;
        b=skLqYPZhlMNQw68qJ5tuakanU0IT1wNxhwoZNZTPn5an7X5j5II5SZKe7ZX5A1dcW1
         zVhbLTxfVpok1TMrzo5vYPH0Vxtxv4+RBmZ2SK9ATH6K06ltjnWjSNOQC5heFmxqjAI5
         xNfuss8varh3N2QtmUgBBNegKR3oqLUjKg5k5L6ECDM/I7IBSy9MAxUzOR7R4U4O9EBR
         Dq/XAm8fMWMifZ5c343rlSpOFMKYQJ7P2UV70pY9W+ZLJfUV4SPdeUYYi4of474lEI7P
         VSSW65pKyZInDfN//TRPKua+Q4mnTyDYXLri/GXyvbgLu1V9cZCgJI9AymfSr+rBhPrh
         x7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7un++IafvG5a6RUcXX8mnJmRXrUS5txRvBlBvgqub53qtKKbmkN4nk6Mzk6lmdKIxHW72hoDybHuC1gY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDidosY9nnsD27Jucf2LTg78UZUm5wsQjmnKEeWKty/QQF/CQv
	6Rbsa/mIFki+QbbYJbwF8qiu8n304Pfu6kAuQi+zhf85WbiYlRkTTQJgLKpt59Kh//bXw41eK76
	3OV3rTiUbI+WQPC0yp823aRtMXkinyVm+kVyyjbzKzItQF1akMwk0pHXwLEU8oe/NfAAkH6J4RR
	s=
X-Gm-Gg: ASbGnctTH1BPPduEiITYNEglSS99BPiS6IVSPf+7MIkmqI8VIUfpsJgUutx9Inpgb8G
	aRNSkle0EdF0+j6dA91xRrNtcWv4lycJPNTUq9zhBMCKRVVsXpge6wvGPN7qF9kTlipdC52fdJk
	C4YEuDSX/mg1EMBnp1UtDs4JOgtnx7tFpPTbuJ1yEg80Iat5fEjlXeQ6jimyYnJ7hlHdvHs9gQu
	rs6cg+Dl6ar96ar7l6JV4s9ud/g3op68ZwNBtZFBTHvdKheTu5JWfi6OlMeU+2lkkqVU8CUiyBD
	A/Y/XtGtpakGRgpNhoMD/adVz1kwUkVBr1DO
X-Received: by 2002:a17:90b:1807:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-313b1ff14b1mr1889813a91.25.1749621854896;
        Tue, 10 Jun 2025 23:04:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2De2CfAW/nhEXwzxH/8Z5sn0yu3qhpnc8aALmeXRtyxM55oEzv+7QcLPFeXeCVL74G67uBw==
X-Received: by 2002:a17:90b:1807:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-313b1ff14b1mr1889776a91.25.1749621854346;
        Tue, 10 Jun 2025 23:04:14 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032ff05esm79429685ad.135.2025.06.10.23.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:04:14 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v5 0/3] soc: qcom: qcom_stats: Add DDR stats
Date: Wed, 11 Jun 2025 11:33:44 +0530
Message-Id: <20250611-ddr_stats_-v5-0-24b16dd67c9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEAcSWgC/3XOSwrCMBCA4atI1qYkk8S0rryHiEweakBbTWpRp
 Hc3LYgt6GbgH5iPeZHkY/CJrBcvEn0XUmjqHGq5IPaE9dHT4HITYKCYhBV1Lu5Ti23aU1FxxZQ
 RDldI8sE1+kN4jNh2l/sUUtvE52h3fNh+mGrKdJwyKg+25CWi0cZsmpSK2x3PtrlcijzIoHXwF
 RTwmQBZAKukx+wwzf8IYiqomSCGHyoUlnsJzug/gpwK5UyQWTDSaIeeaXD2h9D3/Rv/3pg9cQE
 AAA==
X-Change-ID: 20250426-ddr_stats_-391505b3da6a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749621850; l=3512;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=HV18Og1I2iEUxD4I8eDexzTJxa5Uyj7M5o26NT89eUg=;
 b=EBn3cNXv1JB7OAk3LIJqZwyiMSbER4sTYQ/rElyMXW2YZAuBazMe37Ldvl+PXWpTVBGtgSUAq
 p9ihzVGk1j4BFToCZbdmLzuZHstmsFrKhEYPQlDMBfT7YdEXcZZ51sv
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=GIYIEvNK c=1 sm=1 tr=0 ts=68491c60 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ubf2v9fuHxWRXcPCyOcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: lkbwUvlbTW6mtuOZcTuIWTxha9doiCFQ
X-Proofpoint-GUID: lkbwUvlbTW6mtuOZcTuIWTxha9doiCFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA1MiBTYWx0ZWRfXwjyJjdUlXO+8
 0o9dK56ZR9eM2LZc3N/mmtel5aP9FjCtl1TBdPzg+REwsHqocXiGd5uzBmDM7Z2LXiQZsmqBjCL
 eLiEq7dc8AKmTulz1Qddfn/vPRl/2FcfXnUa3CGnmxPklpPI5qZ+ulXl1oJPShjUQ4IxnjS8oVI
 Va/K6c9Tj51ttz+FbSy5oydiIBMmuj1y/KbvVEx6EuVvWAbtPO1LmmiXBrMLwHsZS6BLrKW33vD
 7bw7UFy0y5BH88z+XBPUNjQRHopBQyWWNgbbFJmL4XjRQj2ET6OHmDbGqTT3X+taeHnBtVKref6
 4RspZIhAfOBFLoPERZg/OTD3vOQ3y1ivylMJeo83DIFXuabc6UvB14swpiBr/KQs3Rzco51AkiL
 CfKSYRB3n/Rn/LFZ8xriTm3gSPyPFzY/2i2G1bjm5pc2m4YwkqTqpwJijGr1AWP1t+mzrEd/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110052

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
Changes in v5:
- Handle the qmp_get() failure cases
- Add Reviewed-by.
- Link to v4: https://lore.kernel.org/r/20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com

Changes in v4:
- Handle clean up for qmp_get() probe defer case
- Link to v3: https://lore.kernel.org/r/20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com

Changes in v3:
- Use correct format specifiers
- Handle qmp_get() failure cases
- Link to v2: https://lore.kernel.org/r/20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com

Changes in v2:
- Mention count in decimal instead of hex
- Update read failure cases to return error code instead of success
- Fix typo in comment
- Link to v1: https://lore.kernel.org/r/20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com

---
Maulik Shah (3):
      soc: qcom: qcom_stats: Add support to read DDR statistic
      soc: qcom: qcom_stats: Add QMP support for syncing ddr stats
      arm64: dts: qcom: Add QMP handle for qcom_stats

 arch/arm64/boot/dts/qcom/sm8450.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi |   1 +
 drivers/soc/qcom/qcom_stats.c        | 133 +++++++++++++++++++++++++++++++++++
 5 files changed, 137 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-ddr_stats_-391505b3da6a

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>

