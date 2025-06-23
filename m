Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70761242D65
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683869; cv=none; b=B2beqAAPA+wC2Vj/YAjondVTCKezTIg3WBzJou5Fy/8TSJ5LqFJBlMoTg3drKB8qw36TYgIIKCt9Vd+VbGjzLwAFpHGVK71TmSAroBTw1/y2kTZawkjk59i5KgNMPi8FI5BbF0oTAKm9bFuOCfs2nrHrZw5tbBqkoeXvvMG+NPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683869; c=relaxed/simple;
	bh=4c5QAaF8FWCXjYjf2OT/eBU9e4Zc4tJ8Fgb0BtDON2M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Ux2DXa6StPrzaTPiG3A5N7awWQK+wFsVtPZCtPOIoRh2KvYLjAsbs5rsXJ7+MXYDEZ/emvzc5QGW9iBk5V1XJm59LOhFNJEg6mnBprxMguruypAeGM5tCKH7IFlly3FpgNhSms/TSEtt+95DWASMx+foXnnfGCkQgwkUB0J594E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QchBsOF5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QchBsOF5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9VQlL015290
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CHDw0gUyfP8fWV39O/SeiV
	52mAutq3BiJxP93zChCWk=; b=QchBsOF5r0wseOD4AyhzgxUE6G/cpX9nguWUSh
	SXj9xSikq8ITFxDZEHlNYUb/nHzNm7Lx9703bFWkeYB4S9zLUqmnK1gjLACTH99d
	57s8YmI74xbcWXlNZPODLDebf1UB/nKivvzrMatFpm1VV3Lax+yuNmdzOVY7g39G
	B+dw7Uk/zS2BIkn/V0Pay5WCrGP09SgWwwGP4tqqJBzGnGOS/WI3RsB7BZT2jSHG
	Fv9CyafuJCFvdyAfYiSUw4kULohgSNbG7nDlPa643iGPnip1obGfTW5S50gGYX/3
	1n7keBgV8MDxqO9LIuFR7kgOMrYRZgxltdnI7f6+Z0I1+pIQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5htgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:04:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74951713860so45948b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750683866; x=1751288666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHDw0gUyfP8fWV39O/SeiV52mAutq3BiJxP93zChCWk=;
        b=cQbL6mhJxg+HMQbc1XGV27x/V8dhBoIdlvSbXRSEwygsX6OVYgQhkG68WytCKF2adl
         f+hk7qyVP/9I4Z6okk9Au0lvMVUye3db4LVlI+dl2nFzSRL1ntwjBLsOIZ2wfXJAZagg
         BgzdplMKLOUW5geXvS4YKWv8fIH6/qmh5b8UZ+ZufEgJySRE/t4XvuK00HJLRIkofSOQ
         3pDW4FsX+S3urKCp0f7r0MYsnr7S7nBddGWu9U587vdGhfe920+Ts1WENyMs+nEgk0Js
         ykv54XpWKiO6SkJt4bxgz0TZt+B7QAto3dlKNKz+x4VvEqEwK4NXLoHjEQbP3iu8qXaY
         BILg==
X-Forwarded-Encrypted: i=1; AJvYcCWSWiWo0oLBMzCT/lbsHxI9SytPf9QsIZOB9jbSEllmEdIYns72akZyszCRwvrR4RlmsqU2OtqwLq7k0bY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJUc+uRYpOCsS7vfYzXqYa/LAal/ypr8e+3GiCJDZ7EXRmn8Oj
	bY/qOZEU2RfnoYwRxR3k/ltDsSMi/AKplItXtn05gsXbv46aApMzgU4ZJF2a443BCB4b62pdVY5
	Q1cSEVFoPMBiI6zlvhSutfph6fx7LFSHtDo0kvLkuF4pUKK67GSihyDzqxGO87i4Br48=
X-Gm-Gg: ASbGncurpAtYzmbdPNH0v8TiBEtqQV58CUaxnHhqOFQzQz1sVq+j7qfB1sQUyCXYCUO
	zRtMRH2WbJS+YQrOoJFuWixS9q4R0kiHTt9anBx/p5Bx/xZr26np7oS9Pd9j8+Qy1DS6qlVAIGK
	DUvBrnHHDNfotL2l4jWq5JiCMQRjCvu7ZGh1o/v0HIBCp2MWFvs999k0mK7VNDINQbmRf7REuKW
	Jt6sYSroiv7mmtlTz1T4EKta+er3e4WTs17Bud2tdgKon+5AGRFw0ScCKnPPxbx4TTlRWgWmP8B
	CW5OIGkAiO8tDaZix+unUmrEh72LXtnUmYDzP8CBhARrqICigtb2hg==
X-Received: by 2002:a05:6a20:3c8e:b0:1f3:478d:f3b4 with SMTP id adf61e73a8af0-2202701728dmr6994342637.10.1750683866435;
        Mon, 23 Jun 2025 06:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWgVfAMuttAUlg7WI6XMGUkdKfM0WSYZDqh+gGj6Oz13qwWDpAB34ICIwSzWnzY9Vzvtgr9A==
X-Received: by 2002:a05:6a20:3c8e:b0:1f3:478d:f3b4 with SMTP id adf61e73a8af0-2202701728dmr6994324637.10.1750683866017;
        Mon, 23 Jun 2025 06:04:26 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46b8b2sm8713437b3a.16.2025.06.23.06.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:04:25 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        umang.chheda@oss.qualcomm.com
Subject: [PATCH 0/2] Add support for IQ-8275-evk board
Date: Mon, 23 Jun 2025 18:34:18 +0530
Message-Id: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rl6i2QvT0zkjhZ2eqEFyVbYcEi15RHN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3OCBTYWx0ZWRfXxvr4gE3QDdlq
 EmaDJCIWeLADnHJnjAw1vlJ9cnlMZ+kzF9MLjUbJV75QKoAAi3WKvGMYoxiKz5K1LGPpISi64Vx
 EIF8qbrvyycS0aZHba6zlmM6r2OKcj4Ljn5W974MXFHbaxpDLbQAjOSK6lo6x2rVUAr0ya8Hxq3
 erC3Q2msWTHHA4dCq+nSVyY/wHJGBo2c81mzDSt1gT/2Ovp8+CarQ2JkuM/8ZDuBP1+9cqaM+X7
 2wN3WivL8d2sRLJkKwxsq7T4yWjeVDYwbtkFYCe8KUm+uxx+T88dV4vWtv78Db+Tl/vAdxcCxgE
 TWzz6y140vd/+xPJDM1znKbXknbkGleo8P0GcVSkwJXibgwRXONBFH008SaDl6j8ZnCQi1BGYsq
 3ANFW2g3903y4zuubgEu0EGIkDTMwuEuI6KovwGuL8BghgWl2Dw+xFyLPsmrD7f1d41U9gdo
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685950db cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=xyu6GANZigqoUC4sCMYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: rl6i2QvT0zkjhZ2eqEFyVbYcEi15RHN2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1011 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230078

This series:

Add support for Qualcomm's IQ-8275-evk board using QCS8275 SOC.

QCS8275 is another SoC under IQ8 series of SoCs. Unlike QCS8300
which has safety features, it doesn't have safety features which
affects thermal management.

IQ8 EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Below are detailed informations on IQ-8275-evk HW:
------------------------------------------------------
QCS8275 SOM is stacked on top of IQ-8275-evk board.
On top of IQ-8275-evk board additional mezzanine boards can be stacked
in future.
IQ-8275-evk is single board supporting these peripherals:
  - Storage: 1 × 128 GB UFS, micro-SD card, EEPROMs for MACs,
    eMMC on mezzanine card
  - Audio/Video, Camera & Display ports
  - Connectivity: RJ45 2.5GbE, WLAN/Bluetooth, CAN/CAN-FD
  - PCIe ports
  - USB & UART ports

Currently basic features like DSPs, UFS and 'boot to shell' via
uart console are enabled.

Umang Chheda (2):
  dt-bindings: arm: qcom: Add bindings for IQ8 EVK board
  arm64: dts: qcom: Add support for QCS8275 IQ8 EVK

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
 3 files changed, 249 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts

-- 
2.25.1

