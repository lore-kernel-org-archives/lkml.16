Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF802E6112
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640558; cv=none; b=Epu/XXrpZFN026rQ+5fD9UQ3bowyldxBYguvMd+Ro9IjIusuSW1t0ivu015DRL95LW4S1wRfyKsAGZRVnq3CyuwaaqFV8C5q+PRUouwn31zj5LwXn/s/+qTBE7eSI8tZsG9rYNqTWNSnaju/pMaxvMbI2ziN3Oz6JHkY0qgu1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640558; c=relaxed/simple;
	bh=tir53TSjkw3/xfxcfRmGyJDlmk+DY/g391WffwmPdjI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=anK6ng1OrjGLrlpV+ISOyeF7/GRC+n+me+bIgOLHqZxx+AlhSd8i6aZ1mLbwx8aUGFmHzfhYxvUsrUAvez+PvhpPZ8lN0AkqXlqNL7kCWgGnvSYmEV14LOL5unK5dxTMBZ1MZxTo1ZzHCabSorRixUMcgyES6C9jYSMh4bzqA8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxXrh9Do; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxXrh9Do"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DKuF019840
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6bcwvX4gEpvYIjcBEapn8g
	GSYzu5mivrPS7uygKQxHA=; b=HxXrh9DoaapoHyvbZTEERKhkYjwPTYRb1wFUpV
	Qw0ee7jPdhV5kF5iykjlS+oAAwRVI1bAZ1TZxmCmrYXsx4lA+s8QkzcgU1MIoltC
	v5PXVqgWDGVxOpeEQsvSrU2FE9rU17ilM47eC1pDZzv4YAIlAmZncOP0fXCL6v7w
	iPCHYaTaf7vu7jTnVG8PCU5roiw7EzUAS7CA5Eo/9ObNOKCwrm3MGg4KUf4dvhjg
	4JFlmA5x0tOAlQhUni8ctyHXANZTuMIDsxvyBsGMD/5VJ3KEiF/YTqKUC/rCasu6
	htulFI8VimDqlmGpe3jE1iBjbXC3+ZYWJ/17g0xN9dfjhHyA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcmpyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:15:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73bfc657aefso4660280b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640555; x=1750245355;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bcwvX4gEpvYIjcBEapn8gGSYzu5mivrPS7uygKQxHA=;
        b=CVlWZhx4GKZDSN67f7pWanHqlQ0p8ZoH6k+bE1nfh1jk47VrwmkPW0qIIXWqx4gJgD
         hkUYg9hk34D4bNriT1/PiEK28JwBDflHMvsV0egNOGjZbxxii8MUNwZa7+i217kz3QUa
         ru9F+2EcoXqEVT+vyI3MdGs/TsRdA2ddPrv+o33tm3QX0tu4VlztZhbT820B7o+IqiH/
         tuNua6Fl6rmCi0lQIqj7bVxkC0IGl+6vWvovlInWL7S8BXpKXKdk7NPzbP2gUFcHX86J
         0oPAzbxoduyUMfUNY0l5DBinQEiQ0DeeSZV4OywjFrAq7XpyCvI6Xj5zMpZqWF40YbYK
         SBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsl3cYFuTR/l7qooX0swOcxGLd/+uHVsRS4NTyk08hv800ifYqxrkENwDILdtOTHJeMw4uOTv5W+U3DFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwecF2SoRybBbXVOy6dUhFpsp6bm9fNAJfB3JrvyRIPsBBjoGYF
	bQN9nZLeAqC+0GNi+BwBklIN50z5IXf/DVgos/T40OKlUBjg5GQ0x5Oe1YMKV4G7c84GrFccuQs
	XFv9YZY4QIjerkT5mE/2xMNFP7KS8ztdBFc9elBDem41/mQu2clXykaqRENsfUTDNQmk=
X-Gm-Gg: ASbGnctt+WU+5c4ekyO2YLp6wYBYD86sUm8tMy2fPMbJYrrwmPx7CvqjZXtv12MA5pk
	u7Y7CXAZCym5WyvlLHtrpU9DQzkKIvyGxaHjkipE1bZpd0f8E3G2P5J/15sCxKPAp2zVa8+rDH4
	1u+WtmK3AAiRfUNjBO1JRT6eP/ybyse+0geWTseh6aRttr+Eib14mHirI7L32qhaeI/onC/x7zp
	3BOm2Y5RCflO0lRkhpF/Y3i6r/HmjKM1xgOt/q04wLsaJMjLe8adhJnvkIrHx5Tzcn/pYSMOcLU
	AkgQBbgJYLerq2JeVTKaMSV5Y3pZxKw6
X-Received: by 2002:a05:6a20:1443:b0:21f:4ecc:11a9 with SMTP id adf61e73a8af0-21f8674384bmr5182077637.32.1749640555073;
        Wed, 11 Jun 2025 04:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCzs/EwozS2+jM3nfZzo8sHxEcKNC8JH6C8JAdHxa5QTI2A6Hb8d3Gp3f9wRZbV5iIW6Heew==
X-Received: by 2002:a05:6a20:1443:b0:21f:4ecc:11a9 with SMTP id adf61e73a8af0-21f8674384bmr5182020637.32.1749640554632;
        Wed, 11 Jun 2025 04:15:54 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:15:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Support for Adreno X1-45 GPU
Date: Wed, 11 Jun 2025 16:45:30 +0530
Message-Id: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJlSWgC/02OMQ6DMAxFr4I8NygJlFKm3qNiMMSUSIVAEhAV4
 u4NlKGLpWfrP/8VHFlNDopoBUuzdtr0AeQlgrrF/kVMq8AgubzyjCdsEQNDZak3TIq7QtmotMY
 UQmCw1OjlkD3LH1sap+D0vyVU6IjVpuu0L6KeFs9ObwZ7oNXOG/s5ysziSJz32//fWTDOMCfMe
 ZNUIq8exrl4nPC9q+MwoNy27Qs9+9qt3AAAAA==
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=1468;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=tir53TSjkw3/xfxcfRmGyJDlmk+DY/g391WffwmPdjI=;
 b=boSdoAmoFVFkKeAEz/t/ojFWCig1NztCZfwP8qlXEYtkZ0rhoNdUnxkTTjyrf8ntYT+9A+S68
 e8DQZ/kjg/kCF4HThVdDLAPhzajXNLrZGgxYS+L45XpzVh0R/cEUiN9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfX3+iYuEaO/U4I
 E0NTMDbNirUJA5Q4MsWxN+lXeQJc4Hbl2KYuSRnHbpbMwQckrx1vck8JPAYDj/x1cI00Q2G5SXC
 yh3qYVGm+NLhLgPbDO5WkUPVI/kKkKP67odzLTxZfIEXbu80pMUzrmjcXk/96yMTWZ7ARmoBk+A
 EddkyBh2cnK1nQ066vEUAPrrMC9+WIa+ZAtTIQsJ9aUmrCzEF2urlMahXgnSFOpBTiJXctYDGZe
 LHzXkdwKHwT+/GZhw12VfcTH81y6abrMVxwgZEbO5s+8B/tz9Ws/04j2VOA6LxJI5JapNwrw9hw
 p/2YP70fU2/ALe4puuVhuBTTdVFC2GlKonCj/gYBAHzBJBf9Xr4jSCjtX23JvZ4sYFkTLXD4dMl
 pzEFVoq5rUIU+TEEFDC9DzWh/VELrmXFTxv/AClBI/eEaJ2VRxXEHbBaHKb03wA3gECH0SuI
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6849656c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vb8sKYNj6oKrwasmUUsA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Jh0iPTPgm8jNOmX2D7JbAJ45HBqNu-6L
X-Proofpoint-ORIG-GUID: Jh0iPTPgm8jNOmX2D7JbAJ45HBqNu-6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=916
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110096

Add support for X1-45 GPU found in X1P41200 chipset (8 cpu core
version). X1-45 is a smaller version of X1-85 with lower core count and
smaller memories. From UMD perspective, this is similar to "FD735"
present in Mesa.

Tested Glmark & Vkmark on Debian Gnome desktop.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Skip 'delete-property' wherever it is unnecessary (Dmitry)
- Reorder dt nodes alphabetically (Konrad)
- A new patch#1 to fix the dtbs_check error
- Link to v1: https://lore.kernel.org/r/20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com

---
Akhil P Oommen (4):
      dt-bindings: opp: adreno: Update regex of OPP entry
      arm64: defconfig: Enable X1P42100_GPUCC driver
      drm/msm/adreno: Add Adreno X1-45 support
      arm64: dts: qcom: Add GPU support to X1P42100 SoC

 .../bindings/opp/opp-v2-qcom-adreno.yaml           |   2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             | 120 ++++++++++++++++++++-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  38 +++++++
 6 files changed, 169 insertions(+), 3 deletions(-)
---
base-commit: b3bded85d838336326ce78e394e7818445e11f20
change-id: 20250603-x1p-adreno-219da2fd4ca4

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

