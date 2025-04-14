Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21391FA85A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672938; cv=none; b=i5cv9nfpDDeJkW4MFVXBKsvc8SBGKbdrQYk3Xz1LtuA9P+QD/7xa7YZx7Fk3sswc9VG8SnaROjBiIp6ZnUqXdopY6xgRtlrRTSwlTORYZwzWJm3uQ0HGUpX1FmimV0gaTmWaclcoIh7wlQgneqG45QrnEVDJG+dJ6NGZzjQW3O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672938; c=relaxed/simple;
	bh=VD5wTEQP5v829wquCg7C9IVGza7nDnglV5SJXmWNxmg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VfYA05P4+PD5ylCUV+98J+GfhvdZjKxjmhL9/KXzmA3FaB6bekKd2Co7IrM37kPQ/t1wS43/+4NYkPZKmVzGRTv8g+pKKZ0kE/TLX+r5mDwTL2F8y6Y71SYoO7BE0vgWrKwNBL2UR6OjfLwTG56XHynMe9mydDk+IkcbSm7nP4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgSkkKZe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgSkkKZe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EKdjbo030116
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RaZqjdWox6vmbkHvqyfAHt
	B2JWfGbBnE/jddhGb08pA=; b=BgSkkKZePyhOPi/ZXnDprkUqPQjtjrw9xbuocW
	+F+IWVo3Ei9S0TauHIMVP3J1TwMTUTLcrgywotrnjLswWMwIZouxnq4WxFNcR/5e
	0MuC+2JuCCYeg5mA7t31ab/wJp5JxKib7dEGD91GMcsnJ6Bp+rJyCJzqnTa6vzWp
	otdu+31MBk7FJBzIH8+XHhlc8tQhy1TG3ceU6xcBYGohhK2lmKalErB4ZdnugbA+
	97+R2UjDdPn2k4B4ZIanAsjUFY9UsFD2S2zbc4+HKYtzx+opPONJMCfTEk8UJqGl
	NOD3uGyVIcyfB9RosfeUnVfEG+B6NAh4KAt4dZEqkbVMd4iw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpnvj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7394792f83cso3498796b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:22:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744672934; x=1745277734;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RaZqjdWox6vmbkHvqyfAHtB2JWfGbBnE/jddhGb08pA=;
        b=JS1U3dVW9eFJNXb4Ed9ztTuI9taPbf9hy3NC8+eB6jiTJZZH7Z219fcvle6INoZpC9
         7vgCJXyIlu/AwZ1hEOEEF39CjFgxUEYBmUn7EVo5B0oZjhrqLkjSocobpcezTQPikm8x
         1Y5TgT4QeRBKG6Yku9MSABlppz5OE+0WggtRXg2HhWijOCEcKrGAmiwLyp2dzQVGaZmd
         3Z6E072aYvpeKTKb2nEaNx8fdk4jiRACIdxh9cVdPYnPxvA14Uc/CeSwNC3g/XL7gT1n
         rur+kBUcAzHEt7GLib6DjoKryCNju+W8EQtJ8XzNbGVBO1321J8w+1IRwpODGzs3/Jor
         P7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtkvRUhPezTosjv5lNp59CvXMGfW1QqpxxlrcDnEexZzcGxNahlqhN4fwicDxZr9pWwm1DMXJD5ekfohQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG0FMa3jF+s6oY+rz0ZNgIL/fJWQJ8ORMVwhn06DA4oal2CrmD
	89HvBrAxdC0EOyjZLH6AInZ95uK/nxQcybDbCUjKV1GUPbQyW8VizGY2QDyb9vwt221EJuibY0e
	xsLmiraNOBFeXcvdKx8Y5kG59zec4DX7vSbCluJ8AJBLfyvTNCdF/Cht/jChEZds=
X-Gm-Gg: ASbGnctjt8Hpu6QmKUOWwMnsQYnfktX/6f8ykEnLNv6SWM90ZrfOYzHS/jIo2vwWQ6N
	KB2u7Z41qogPj4GOfZrjJuYxsjjkueiImr9UZpznvsz6BjLjjLIS7loeTZ5gLmW+pdLHRU/n9m7
	f2tFeRJwJ3dRjLD8bgBnPBZV0K7utXCIu8fbZaVFR1TctAfCsHq+FHLyOFrGMlJlNCchRyOrL++
	GkCRrWRTieMU7e9OxNYHMB3XjIa8KYWId0QM4uIyICQ3useShPCuUnd+vv1k0dYQVQryfbKIHoj
	FBz76OKs2xJF0x9rJItwmN6lco2oTWLRy8SnUeX/VQ9TCfV9vE1B1rSfL/wwpCIUTZU=
X-Received: by 2002:a05:6a21:999b:b0:1f5:709d:e0cc with SMTP id adf61e73a8af0-201799908c2mr21844643637.40.1744672933809;
        Mon, 14 Apr 2025 16:22:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqzi2keJ7SOGWqB8DNIqx12NrhOhOvCEPjmQHwinVzhB2Cm6nLjGMrH7xEbkj0y4huJRvbgw==
X-Received: by 2002:a05:6a21:999b:b0:1f5:709d:e0cc with SMTP id adf61e73a8af0-201799908c2mr21844603637.40.1744672933429;
        Mon, 14 Apr 2025 16:22:13 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a3221c7bsm9746298a12.71.2025.04.14.16.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 16:22:12 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [PATCH v4 0/4] Introduce LLCC v6 used on the SM8750 SoCs
Date: Mon, 14 Apr 2025 16:21:49 -0700
Message-Id: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI2Y/WcC/23NXQuCMBTG8a8iu26x19Su+h4RspdjDlJrs1GI3
 70pQVFe/h84vzOiAN5BQPtsRB6iC67vUohNhkyjujNgZ1MjRpgklOQ4tEUuSXW5GFO1KgzgsVa
 KWxBCE65ROrx6qN1jQY+n1I0LQ++fy49I5/XNUb7GRYoJlrwodcmA2VwdbndnXGe2pm/RDEb2Q
 TgRqwhLiAIBtBSlFDv4R/gXwtYRnhCmaisNqa22P8g0TS8sFq0sQAEAAA==
X-Change-ID: 20250107-sm8750_llcc_master-baa3de44b03b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744672932; l=1916;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=VD5wTEQP5v829wquCg7C9IVGza7nDnglV5SJXmWNxmg=;
 b=/CVvLH5JraN8SHvw5hxkvWwDJS4mBPxQnCHeB0Bh/K5RWf0J0ASl0Gf9Hqa1AW1mH55NZgPzX
 8VLKTlppBzWDm5A4TZfGQ8haAouFry26upy6T3mzn86f8xpeRdpAySC
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: IlSPZaF5oyzu7ancO_X-QG59IqbuZkt9
X-Proofpoint-GUID: IlSPZaF5oyzu7ancO_X-QG59IqbuZkt9
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fd98a6 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=eeNx2805JM5utdwWTRoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=709 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140168

Add documentation and functionality for LLCC v6 used on
the SM8750 SoCs. LLCC v6 rearranges several registers and offsets
and supports slice IDs over 31, so new functionality is necessary
to program and use LLCC v6.

---
Changes in v4:
- Updated cache data table for LLCC_WRCACHE to activate on init.
- Link to v3: https://lore.kernel.org/r/20250324-sm8750_llcc_master-v3-0-2afd5c0fdbde@quicinc.com

Changes in v3:
- Removed some unused variables.
- Added parent/child grouping features to v6
- Updated cache data table with up-to-date configurations
- Link to v2: https://lore.kernel.org/r/20250304-sm8750_llcc_master-v2-0-ae4e1949546e@quicinc.com

Changes in v2:
- moved v6 offsets into cfg struct
- reverse xmas-treed variable declarations & removed unused
- removed unneeded skip_llcc_cfg branch in v6
- updated some macros to use BITS, GENMASK, FIELD_PREP
- moved LLCC_* definitions to appropriate patch
- updated sm8750 slice data struct to match updated standard
- fixed style on dt node
- note: did not add cleanup patch to use bitfields
- Link to v1: https://lore.kernel.org/r/20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com

---
Melody Olvera (4):
      dt-bindings: cache: qcom,llcc: Document SM8750 LLCC block
      soc: qcom: llcc-qcom: Add support for LLCC V6
      soc: qcom: llcc-qcom: Add support for SM8750
      arm64: dts: qcom: sm8750: Add LLCC node

 .../devicetree/bindings/cache/qcom,llcc.yaml       |   2 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  18 +
 drivers/soc/qcom/llcc-qcom.c                       | 497 ++++++++++++++++++++-
 include/linux/soc/qcom/llcc-qcom.h                 |   8 +
 4 files changed, 521 insertions(+), 4 deletions(-)
---
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20250107-sm8750_llcc_master-baa3de44b03b

Best regards,
-- 
Melody Olvera <melody.olvera@oss.qualcomm.com>

