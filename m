Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B39826B96C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773895; cv=none; b=urkZvdfJgvz9hR21nw8RCRnn6h3qFJi9AcT5lDoYKPfbwGWHeuka4jHSTRUQlX6A9ZfOELmplbG/HuMrnPH1SML3ptVe/kZPnU1JHJD9Af3U9vyt88SQ2HJl9td2QK2HQ2rRkNTxt2V1b8vU4P8yCOCKei0b4tpt1xKaFqdr+rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773895; c=relaxed/simple;
	bh=PA+tCKwTo1nH+Lso+Uwg7CdiMtEk2emhO7vsfJ9adLI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mcMdAGXH8wgk3BXW0hVVSjxSDruUlFQZ69VsTTYecruWHGTZK7m2qGqUrhCr8+sM2nXbCKCHXsdfwBs9Cn4CG4RaoxrcaxOqf264B6N4f37Lcm7q1lcp7Lv2N1dTy7RsY6RlV13Uub3Ys/+QtVrc3HXk4lGqjTfy7vkgcIlvyoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ludPCjVp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ludPCjVp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGe0aD000727
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CnhEAhcJpQDgCGDvh46RTj
	Mj70tEmGh9F2KinGlWxFc=; b=ludPCjVpTFJkbjufdT8J1F5lvW9Xegoi+XLqb7
	CV10DQlYvLak/aB54M3Xx4I/38nSwr79c6um/ULPMTgVAbAyEqorClVstrXC58lD
	2pSoT6aSt5jbt8niKXpxSjWIbyuTlvqGftylKQO+6Ytae/vcYxpPF0N7oZeaJwW5
	v06dQdkYBcEy6JtrwI7jQYmNGxcSRdG253VOpab85aghNjttOpZ+bvT4vkOG4WeE
	T9lRx4uzMCPN+9nfio3ToGS5Oz4X19egzL/kkd8R55LA1Ahmi6bVrNK6UeDRQmYv
	2ghM2FQ/nsTPJo/mur7GmuKSe8qst7eY1f6XGfXafCNsX0Fg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4rjfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:44:52 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8aaba2f62so113452796d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747773892; x=1748378692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CnhEAhcJpQDgCGDvh46RTjMj70tEmGh9F2KinGlWxFc=;
        b=FWdKDDMTCY79xeplSUWfd96VOuQFBUqgZIekeX2iN4AxhB/ZCb5sR7pyyD7MQm8P4Z
         22Cp6WLfZKusUs37ad445HBCBZQ64PWQw5Pfkga44A2KW13H3OhzVNEBB7ojfcupxWO5
         TmuqJPx57j1yz5BL/HZCm6pAeBAFjQ26CrJiEvS6g3Lc6Y/EKWdbvN33ywE/EqysnLgY
         agZMNMb4aXN8wyhYlUL/FPdo+m73w3U+2OAE+iKCj/WgNJl/2/wHFLv6AU7yJKjpFnBi
         b4Ynb2sMpa2cy3jrT86Io5dqfHWey3l+/uIeJm4ByPtt5wjg53to/d5eJP4O57R7ApMu
         Aadg==
X-Gm-Message-State: AOJu0Yy+V0EHqfjto5uvkl7BjSUXAOm6c6cuwLQD15dWEGF4ZiP01ixY
	PoaXNScVOxCPhX+JRH/+YQwKDeCI3XcmOhQPjlHoDk2WQBvuDVmkxg10hvHURUpRoD3ckkuEyf+
	08JTWrbbbZjwJuXMx/ZnV4aTV5L4MjlFMYCbbCWXmv6kQbMn7NTfgSgf3zHv3jn6jFSA=
X-Gm-Gg: ASbGncsIvWSZIsSGaFBBkW/Nue+S8LIgtrFKbAsnuNP3KJwkyaDQOcWVie4HCHpM1Jb
	z0idQvPSbTkU0cNf1slQxaSmhTGJ4+X4woEGnQ1e5+/jZ5Xt4SEoTMGyNPiQw64eqpyLlwVhd/6
	lHYbIq749fccn6UYz2b0+Ct5AKqyi85fcLRJ8ZWwxvHyICtH5AYSUt6Y1lMg13g7wavErr2oCZy
	6qK+1pdcGIgJKxIVFbS/vTFug0qB6JOrmxxFroNba04Ybq+O9t5q7kpbh/tcgbr0UaftML4uIGc
	Y0E5u0q427Vy0biAy3EleDYlWsrBQOXvmuqYMF8dbi6/Z+nX2Mg6cGQbehzFimA2zNijADkzktZ
	Fk5CwI4smMGVv5K/JEzGZHsFr
X-Received: by 2002:ad4:5c49:0:b0:6f8:d920:6962 with SMTP id 6a1803df08f44-6f8d9206bd4mr119468196d6.14.1747773891732;
        Tue, 20 May 2025 13:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGfp+ypX9kSBxgzbkN+MgSu5aIfQQmM0ZkghxJplqrv3tEo+2xeiuUHFeyxXpUk9ezuAwdhA==
X-Received: by 2002:ad4:5c49:0:b0:6f8:d920:6962 with SMTP id 6a1803df08f44-6f8d9206bd4mr119467926d6.14.1747773891241;
        Tue, 20 May 2025 13:44:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f163ccsm2497950e87.39.2025.05.20.13.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:44:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/5] drm/msm/hdmi & phy: use generic PHY framework
Date: Tue, 20 May 2025 23:44:42 +0300
Message-Id: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALrpLGgC/zXMQQqDMBBA0avIrDuSiaGarnqP0kWiiQmtRiYiF
 fHuDYUu3+L/A7Lj6DLcqgPYbTHHNBeoSwV9MPPoMA7FIIVUgoRGP2AYpohL2FEp2zWkve37Fkq
 xsPPx87s9nsWe04RrYGf+j0Zo2RHRtRE1SWoVaSQsv5X32hrec3il7f6Os+FUJx7hPL/eOzUUp
 AAAAA==
X-Change-ID: 20240109-fd-hdmi-phy-44b8319fbcc7
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3665;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PA+tCKwTo1nH+Lso+Uwg7CdiMtEk2emhO7vsfJ9adLI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoLOnABXk81kaZokLdiRD1RUNWGemqA1YFMLllF
 8hqIxr9ewCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCzpwAAKCRCLPIo+Aiko
 1XGYB/9dPRhf86STXfF/uE1qb1TGI/f4ZSLGsiECHc/89fO5BSSm418umoc5AOiIwXGAm3B6JjO
 mOZvsLU1z7MspwYTdtlCgg5TILBd8hjF9c/gXk88g4U458MGK0DeKV16vwmp03DrehbbmQd4qpe
 BMJ4d+AMsSm2q7iAbSi5pllmP4dpciCdUalImp2CsoOsDRcI2WQ8oC5fDK/YLPZMn3dn4QXGY0M
 nj/elZWzy8TZq7iqunmFG0oeOVPvDmhxHCNmPImrcobEXvWetj7qdNPqUwjk29WEi1sFmc2shBY
 nLtLpx8bcdlN5XTSymqHtEW6JSeWIUBLGDp2nJoZihXt75UA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: eK7UNd1MfxRVnjWdrDa1__pVOqpddHup
X-Proofpoint-ORIG-GUID: eK7UNd1MfxRVnjWdrDa1__pVOqpddHup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2NyBTYWx0ZWRfX4ESo5TIsEp+8
 qkN+izONoNXpkNpVw77SBLlpxbqU46FwWPF7ll3x0T0MQBH4CPZ9NFT1YIpLLKEkGoFEHwzSfO4
 vAP3vPwG+ak4esgC3ZO6wBHyIEVnhEIkS3Y1oh4vWT4xJb/WOVNrZmKj5JqV8ojBQPogZ3qFYH7
 wC2lv80awnaQZAvTQyr1Ku109q15Gek44rBUho/oeqlLBqSJQZIEiWSfaAaGrtvJbV+xYxEo8e/
 dAHyMgcU3vP35j/n1mbCO70zwqWr6fgSlFn0OmwxG3xxqns6K+DPPJwxQhTPhMu2tLt8/DawtGg
 MZJkfBsBllx+507/CAa5V/xSl1zHnEkx8hULXkgPElxZcL9cpsPU8/J2MsUtTO/v+hpeRb1MnYA
 1Q2av5I5x4rXPUBoUq2zBgFm4QIwbOJNI+RilnkVKolNZz1Ijo5TbfIfsjSxHyVXvXJf9LXR
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682ce9c4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=I5G884IeurQlcsuiieMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200167

The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
using the generic API framework. Move MSM HDMI PHY drivers to
drivers/phy/qualcomm and rework them to use generic PHY framework. This
way all the QMP-related code is kept at the same place.
Also MSM8974 HDMI PHY, 28nm DSI PHY and apq8964 SATA PHY now can use
common helpers for the UNI PLL.

This also causes some design changes. Currently on MSM8996 the HDMI PLL
implements clock's set_rate(), while other HDMI PHY drivers used the
ad-hoc PHY API for setting the PLL rate (this includes in-tree MSM8960
driver and posted, but not merged, MSM8974 driver). This might result in
the PLL being set to one rate, while the rest of the PHY being tuned to
work at another rate. Adopt the latter idea and always use
phy_configure() to tune the PHY and set the PLL rate.

Merge strategy: cross-tree merge via the immutable tag.

Changes since v2:
- Rebased on top of linux-next, solving conflicts
- Squashed add-and-remove patches into a single git mv patch
- Dropped HDMI PHY header patch (merged upstream)

Changes since v1:
- Changed msm8960 / apq8064 to calculate register data instead of using
  fixed tables. This extends the list of supported modes.
  (Implementation is based on mdss-hdmi-pll-28lpm.c from msm-4.14).

- Fixed the reprogramming of PLL rate on apq8064.

- Merged all non-QMP HDMI PHY drivers into a common PHY_QCOM_HDMI
  driver (suggested by Rob Clark)

---
Dmitry Baryshkov (5):
      drm/msm/hdmi: switch to generic PHY subsystem
      phy: qcom: apq8064-sata: extract UNI PLL register defines
      phy: qcom-uniphy: add more registers from display PHYs
      phy: qualcomm: add MSM8974 HDMI PHY support
      drm/msm/registers: drop HDMI PHY register definitions

 drivers/gpu/drm/msm/Makefile                     |   7 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  32 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 765 ----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 769 -----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 458 --------------
 drivers/gpu/drm/msm/registers/display/hdmi.xml   | 537 ----------------
 drivers/phy/qualcomm/Kconfig                     |  21 +
 drivers/phy/qualcomm/Makefile                    |  14 +
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c     |  23 +-
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       | 330 ++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 441 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  81 +++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 442 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 495 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
 drivers/phy/qualcomm/phy-qcom-uniphy.h           |  65 ++
 25 files changed, 2584 insertions(+), 3155 deletions(-)
---
base-commit: a0fd124020ae02815905d4c6808261bfd262ac08
change-id: 20240109-fd-hdmi-phy-44b8319fbcc7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

