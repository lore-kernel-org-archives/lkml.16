Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B6225390
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402497; cv=none; b=qsLOWjgIk2QUouQFsi9anSnCOPPcLbM7yDDCtyiHT+a+sqJ+p6ELAlaweX9nK5EncmFEnUFC4mRDrXyyl0Lw9oOgUqvwsVg2R3jWmsc+zWQ+YHJspihUJsTcZo/J+MWpqQU3rAr2elYNrLVEqnlxzwxa1xhXEJhSHPd3Ro+9RDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402497; c=relaxed/simple;
	bh=5GnSOkfYQ0nmtlGuh6J0RyLLVdXBVvnNx3z3QB9r3z8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T9kyHNNYtO1QLOcqcArCoahD5IHupuIqEkG5F4sThikjvvW+9blEdwkEJgOg5bHNw9qo4ZsZ8ewIcIBm+Oljn5xWx/SRJAn61zhWvRdFGdx8RPrT1djjlksEA/x69lVUPlp9JOK/ElSASbdATkAZMQ/gDgSAeAz0q5IFoftQqn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGTRMjbL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGTRMjbL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIe3T5024378
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ScyFz0DOvxXgWzbjqqOuOf
	3WOA+3QVWgFuzW42VFYnA=; b=TGTRMjbLx0KFwUzJWzDTmsEJoLwa9VEIFuwp5j
	jsU7zWmJ/IhoDXWw9THQo4l6FfivNaSyWcXVb1KPs2wCdQiDcpN3iBlD5OqvGZg4
	aIoRsLDP9x/izQqFTQ7qdL5i7yem8oNf55B/s+dJH3g3Ugl0B76miQTXN6XTcLMo
	1UmPUYm0O8a21CsYVxPJKOkra/1p+Z6J4Voocsx8gIhXE/gzYYCFTU1ccdYZuIcR
	eNOvRfdOks3Qq3lNkFQsi9keoRVyL0G5jhL2seOKhtDFvqZSWb0196EieY0Myhpb
	OP8O8dSmTtbzFCb29jAyduopU8Mhk1avUI6gN02ECVyrb9Vw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw13ebnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:54:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2358de17665so14556205ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402494; x=1751007294;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScyFz0DOvxXgWzbjqqOuOf3WOA+3QVWgFuzW42VFYnA=;
        b=JtK+TgmasooTUavMiC/FqW06i4A7xSI8yQBt9ZYZA2DWMVQdwVGD4+LvQ9sbAvROlB
         yvSwkX+Sx7g3FjKSdR7++YPtQ9YshlHeYrA1i9AOtlCcE1NW2MzkFRD3CzA6/4I7yf7Z
         t2BUh0EKPDvM3O2ukZvX4W5ks4tr9j/V9scfOHkWpno6sraTeoBt6NwNG6yRuiTmYZgX
         /8frLLAVxZStodvRNTRn9CkMco2q/xgalai2RSvL8fXdHRgnPvA6Hpc4DyQi+g4s8Jgc
         v9OTsX2FSCO04CyZHGffW6TXCfATwdZtVHuEw8H6n/rm/aTNVL8tFl5sfYx7v7gCIxOz
         TfBg==
X-Forwarded-Encrypted: i=1; AJvYcCVDD8KUx3TgKudnLi7yxVoleIPqtJ4RiELaBKIFCNpo/Zv4Vb6vctOXoQS5eLXn6+aHXUV3CoAb4gsUg1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg3PMAdGMHgu7nplBwpl1vPfa7vlCqVkrBHIo7Xj/EqgqZ2W9j
	XcYuKMqAZ3RccNFI2WEgTOyq1JKyxa+OhdUAGu44KhLLECfc/+sYuZAWuxFVqNAsHgzQns86br+
	RpTS7NjIR5mkDjUfTIwC7jIVREzCKHeDw4/mjnfdI/SGfKWpp+PFnFE9FNghxO6ji/sk=
X-Gm-Gg: ASbGncsHLUXn5ATFI0BIrBhGBhZLhMbTxKVHH1DxkfE9X21fQs1ikARLNMdSqJQoey9
	C69h2QW0lq5r+E1UfLmnJzJp3dgbF2+w8jYGio0DukNi/B6/P5n29Ud24aF8nVUcJjwI6Owow7W
	QlFephdEsSgQlO5uSrlir2/+Sm58VJOuQVHV9lqsehWLrjcS8uCYExjecrlCV1auJanrSR5SE2o
	vlvf/f2FkVRnEPNJEzkMbsRra8vvu+IziOM1vXzbzKa4aHuk7gtclFrTiRCyj62I2YJZ9vXDi5D
	7W4guUgXLdH5DVoq4/4d4EqnDsxSLzJx
X-Received: by 2002:a17:903:1b48:b0:236:9d66:ff24 with SMTP id d9443c01a7336-237d9775b0emr22386195ad.8.1750402493802;
        Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkIYHi1UT3lT3VJ7eStgc3F3RXk7Q+Nga2d2//COTAVYVplhFGtVV1Et8O4RY+Oflc3Ja1aQ==
X-Received: by 2002:a17:903:1b48:b0:236:9d66:ff24 with SMTP id d9443c01a7336-237d9775b0emr22385985ad.8.1750402493406;
        Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:54:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Support for Adreno X1-45 GPU
Date: Fri, 20 Jun 2025 12:24:27 +0530
Message-Id: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMFVWgC/23OzQ6CMAwH8FchOzuyDgTk5HsYD/soskQYbrhgC
 O/uBA+YeGnyb9pfOxOPzqAndTITh8F4Y/sYskNCVCv6G1KjYyac8SMrWEYnGKjQDntLOZy04I3
 OlchJXBgcNmZasct1yw4fz2iOW5NI4ZEq23VmrJNQpFBQp4B8hlvjR+te6yMB1unvzXJ/MwBlV
 FQoKtZkEip5tt6nj6e4f9g0llULfCcA/Ag8CkdW5idWSpRS/xGWZXkDHmfOqRoBAAA=
X-Change-ID: 20250603-x1p-adreno-219da2fd4ca4
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=1837;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5GnSOkfYQ0nmtlGuh6J0RyLLVdXBVvnNx3z3QB9r3z8=;
 b=knES3iwBctiGuUKxjFzfjxdZPB02hxoct8ZdKICWABwsiJgsGhwDdTtm4RUIyGwuSVqA3bB2J
 4tIPAmjr4/MA/8qi0hRBvUAC9WXYylb9dY1lGiiUKJYTd7f6Oj3TKpk
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=685505be cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vb8sKYNj6oKrwasmUUsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: QnZXWRLy9W-0rze_YRcYIqhsLh_lPF7z
X-Proofpoint-GUID: QnZXWRLy9W-0rze_YRcYIqhsLh_lPF7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MCBTYWx0ZWRfX0BL2sfK2vUhP
 bXW9cg5EK0eNZUe7YIwLmFO/HGWepg7JbTOaXY/uPYAelwbpCzn9mSUzLGKDB/X7JdstmHDfmtD
 PuYmQrCmOBVrnHj2p0d052CEvnAe96aAqnPHdyrosHxKrMT2Zl7uNaUdptLIwzl5v/YLskQKukt
 8tmV7y4TYTUSV/l1NiTMS9Qkkf6x8MbpCJGTdYK1pLm/NdZv9Kaez1dHgeQXluoyRWvdvZvb+a5
 9t8PnnYMr2xzUMQLjmy3JjfVHaO9ncgNEOXL/jgpIqrKN0H6h4UGwpsWpT8NLwEMo/6/oDPL68W
 n9FUFzHs/G7Ef56v/O8WZv/KbRqKD8QnElenSW7OggpUiwbYzquE2GADVv6x2LoR8Nq4dL2dC9C
 T/3dAIW6ZnfU0sJs668i7zjpehHe8J20ulWIRZdwwiAJYvNQLkAwsGo2H+P49TY9CbqRJfBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200050

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

I think Bjorn can pick the DT patch and Rob Clark can pick up the rest.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v3:
- Rebased on v6.16-rc1
- Fixed speedbin table in drm/msm
- Corrected the regex for the adreno opp node (Krzysztof)
- Replace underscore with hypen in DT node names (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com

Changes in v2:
- Skip 'delete-property' wherever it is unnecessary (Dmitry)
- Reorder dt nodes alphabetically (Konrad)
- A new patch#1 to fix the dtbs_check error
- Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: opp: adreno: Update regex of OPP entry
      arm64: defconfig: Enable X1P42100 GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  39 +++++++
 6 files changed, 170 insertions(+), 3 deletions(-)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

