Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B01F238C3B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574719; cv=none; b=n2boKAWZe5VQl83Fg2K2aaMEGlWnuK7hFgkHb7CJcR6DOIul9sjf2UrykPb5QUlNDilce0E0wYq1lyE9kQLhQeqKuuH7vut9eXH4qk9NlgL4l6G94H1lagysDssF3sLun7kukP3oedrEgD5tvhdqq5i3vAG2iQGf/R14zuh/sAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574719; c=relaxed/simple;
	bh=xowDveuOyf5Nxh/NFAAn7qa+GiIhDnbYT0YIxlH8WNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Lmc0lqm+faoxwnJNLvZtW1Y5Ekns8bW8hz33qzG4qSYYjzxnDL8cShg/OveF5RQRQAa6Ls9GbgJz+Y9I31Qwg2Xy+bY5ehHR5bGGDY6MeiwJKSRbs7e7TT++eIY64ciNL8X3f7GmWG8NWTNWF2mp7Fiv4E5nMi9GxEqlL/bSSgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOPRG4LN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOPRG4LN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8THrj030951
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JRsnett4kSInQcfMQHChey
	cJ1f7Fq7E53m4nPx7dOrY=; b=fOPRG4LNX5o4fTJpyTJufH5J/xL6fYrcuZucl3
	KQsUeqhuNdWcq6YzVIlIEsuyrGIiMFouvz4GTpqRmOeXaVvkLuv/pVP0p9VYFfdZ
	ox2v+jvvo9OdbahYa1UZOwjHMssRoTXTQ+05Q/ufCXRmzPO+Y/3+trau2N0clDL1
	7SM6OdHZHyeiivXo2z6Yn3djbLPeXT99Sj0sP94xf0tb7e1Fr5025d3vrfFZtSuZ
	g6EZaKGUHyrotqCv2johyCNsb/fGH0JfCGTAOWik1DQKVxBJpdmkEVCw6Xi4dNxt
	9ewKJQ/NvHteqYprIav/c+M41m3qGQmFLTOUXVtHY0QcklHw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5gjnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:51:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0c1025adbso444929285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574716; x=1746179516;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRsnett4kSInQcfMQHCheycJ1f7Fq7E53m4nPx7dOrY=;
        b=MNBMm8ISY1OD7k/s1/RXbAgNhkWumRuVY8+ZzyE9IxrkbNqGgjKp8SvM+KHnkZCIy1
         diVOHqt6MbduMuH1WVm/cXIvbpFQKOfZFoKcim0vVC8TJFyKVrFBkQjIESYXZjtx/9NW
         HUDlX37h5ZbtkjOZif9zmTmjRE5bz3itQny70xPR72B8fKq//NqzZ/4r5NrEsIGueBb0
         oPW6UM1XOEg3BHL4CCY6yQGvcJLee64BN5SyeP3ho2K2SEkbrJLpumSvmZWzweQ0c5wx
         tKQLFHkSB3kGW7L9iX1omDlUw/sub7ywVkx/x7+QAQNxdU93K402H21NFoDJuIq8GOmV
         GAzg==
X-Forwarded-Encrypted: i=1; AJvYcCVBm1/txoXOst7NvfGzD42K+p0VgHuWyj9OLT3GqoC8ApdGsCzd5oFnXw8Ee+KSYbjYqrKlBbe21gqcBZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNUr/xyDr/sP2VHK+/QxodQZ7A0B1VtzuYT8a12Pra3bUNO3P5
	V03hdND25dUk9PT16pqlomeAlyg9RX/sV2Nd3o96FpFeN9LsxA44EhrahCvYG13Q91jMJWV06bn
	86UHV2iTjXVAkL4oDUKkqHkjgpNBICFBiTuB76phqHxSsHUG+bHdkYqeBXDpZIzc=
X-Gm-Gg: ASbGncu1GAFPzxSDroUDjauQ++kCA+8tfwoj21Y9LdipWl/Igxncop+sN1Lhnxqxe5y
	vtIF2uLe1N2a1E88NMwfpNsMeIC2M44470PsxzWSNpxtcgsi9+ToBFhN05xeOpcvxVV3CbJHVFq
	1D0VjikngiaN0OqBr0mSLvQ61pchV3oCOZKCvbzqTHXFLOAVcVQtvzq+go/XyJtDbYWpnIqIhRx
	bENxtiFsskwyMwN1aAZ01uaztjXyWFZkGlwONm8L1/aqDAZCeWiAjq9TfwKUgxXUEpF6W2lgq2g
	vxcxZwI22WBE78kvaq2ShZqt7gMKcmyMuPMRmNbUZ/AY91w0rUTUi/AtMzMyz5SNKXmEboZXS0d
	IM91g8d6Ci/YjQ9Z1wGQPn2SY
X-Received: by 2002:a05:620a:3727:b0:7c5:3e76:bcd7 with SMTP id af79cd13be357-7c9607a69bfmr303270285a.37.1745574715811;
        Fri, 25 Apr 2025 02:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu2cbMZ6luKxRUfq233zQk8HcwMCsp0kUGi6dzWhWP7Glh2HrpXIW9VL3IIiHTKrdr88PnLg==
X-Received: by 2002:a05:620a:3727:b0:7c5:3e76:bcd7 with SMTP id af79cd13be357-7c9607a69bfmr303267385a.37.1745574715471;
        Fri, 25 Apr 2025 02:51:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:51:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Fri, 25 Apr 2025 12:51:50 +0300
Message-Id: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZbC2gC/52Qy2rDMBBFfyVo3TF62Za66n+ULlRrFIvGVhgZU
 RP875UCgabLLu/AOTN3biwjRczs9XRjhCXmmNYa9MuJTbNbzwjR18wkl5orMULwsPirhkvxGbB
 OghmCt3ZiFbkShvh9171/1BwoLbDNhO4hkXwQA7dcSdFppaS2IMAvcaO9+3S05/krlbdLXB2lL
 tG5WeeYt0T7/cYim/u/por1jXxuUSRwEL0L2PejcUr8plqNoh5LG/3nB0VVerJGjcZYMzp8oo/
 j+AGqNzyZZAEAAA==
X-Change-ID: 20240317-fd-mdp4-lvds-e317f86fd99c
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2413;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=xowDveuOyf5Nxh/NFAAn7qa+GiIhDnbYT0YIxlH8WNY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5TNsIrW5kxewN3uQBb93kWSf47xMOC5iL1
 7tVlGHBMF2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1V82B/oDKgWlSZpqvnXJRApW6xUB2qmZYoZRwED+luGwDSKnjfmBS9yZBVjK0arPoVQVXEH4UjE
 ffdzxGRTgo9F0QqeHglDd7klcZPmZ3YtIDJ3uetLJpqPO1ZJjPq7uBwqSsLGrTtPj57i1Fm0yN8
 Xxas8dkMrISi5Azph4mcuT6h6vdhHFe/sJ0qFwj4G3zReoHRD6UhXqAxiReutRwsHqHy7iHMCMb
 p53bb39Lvf9U1XEr02tDn5xaokVfC5NQyuQcxRt4DoJtJhADzmY5Lix02NCNApX23rPE8aZM38G
 4/mZ2d5D2lnkdNkV98CDiaDGHR29qW5t3HJmeWFukHNBW8M1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX/BGvINGX+pl0 zjt9UB+Uitv5LOgErc8B1BaeQ2wPQZzqtiIHlIS1BqorrSf9BoUZIlm0dW47b61IFGXeU1djdW2 aa7Rf/CNdCYjMcs/Q+G2NvZUQ4NgJVbS7yp1SNzOiwIJnOPthuWVPnHhcTH6DuEkO757KndRbeA
 th7QChk/2EHDJH5s5NOxOdZOSDzqdizHmh6Z20aSXUpv+zmlREGtt7i0gBPtmilc1Uz/4NRtaS/ OimP8cUynvrcYbZj0zQVdFlT/Fg97xvdvOY7la92u1UEYBjGHQ9b7tdCEG5aYJE30U2t7cRHNLG EE3DPP7pNg/Fw/EVGnGZKW78BIKNDm1eCC6Zhcv0BK2bxUMVBzuCrH+OEj1QdGgDMdY2eefHdxI
 w1Humi7kV1lGSImFypzuaH9VeX9SzYlR+5DzmDhcA4N4qabTEqyTUlp2M/z++/1hx6wv1pOX
X-Proofpoint-GUID: ozfgt5UqdMw50PRiug8U_Kd7OVkQePmL
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680b5b3c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=svjegcxvsEnm_b_G_zMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ozfgt5UqdMw50PRiug8U_Kd7OVkQePmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

The LCDC controller uses pixel clock provided by the multimedia clock
controller (mmcc) instead of using LVDS PHY clock directly. Link LVDS
clocks properly, taking MMCC into account.

MDP4 uses custom code to handle LVDS panel. It predates handling
EPROBE_DEFER, it tries to work when the panel device is not available,
etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
to follow contemporary DRM practices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Retained compatibility with older DT by reusing PLL as LCDC clock
  (Abhinav)
- Link to v3: https://lore.kernel.org/r/20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org

Changes in v3:
- Fixed commit message to explain that DT name is used in addition to
  the global system table lookup (Konrad).
- Link to v2: https://lore.kernel.org/r/20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org

Changes in v2:
- Rebase on top of msm-next.
- Upgrade LVDS clock code to use clock providers and parent_data
- Use LVDS clock from the MMCC instead of using LVDS PHY directly
- Link to v1: https://lore.kernel.org/r/20220616090321.433249-1-dmitry.baryshkov@linaro.org

---
Dmitry Baryshkov (7):
      dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      drm/msm/mdp4: register the LVDS PLL as a clock provider
      drm/msm/mdp4: use parent_data for LVDS PLL
      drm/msm/mdp4: move move_valid callback to lcdc_encoder
      drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      arm: dts: qcom: apq8064: link LVDS clocks

 .../devicetree/bindings/display/msm/mdp4.yaml      |   9 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  16 ++-
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  34 ++++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  16 +--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  |  50 ++++-----
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 121 ---------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c      |  51 ++++++---
 8 files changed, 105 insertions(+), 193 deletions(-)
---
base-commit: 52beceed7049f2b4dc65ed0cc84b673bf804b679
change-id: 20240317-fd-mdp4-lvds-e317f86fd99c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

