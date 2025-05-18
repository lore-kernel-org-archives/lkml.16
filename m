Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6E321579F
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565729; cv=none; b=rKW/3OIsDsOrrMw6l3PMFGhHg2HzOdlN/shB/cfzJvLkB5YoXMsBsH+Dg15jwBJ3giecqPu8vqLlc0sNlvu/4H69iD0gmQ4yxSKyx2vDYy/ULZ3BO0OLlGidzebpKkoEuDTZvwC9gVRn7XlKpP9hI6gKDD91Z8LYO/Fpz2onR0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565729; c=relaxed/simple;
	bh=ZMPdcJDb4Sai0ElGNUE8wg+TZJqFVZ/UEtHRRg56ccM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g8USk6CskwxBJl2TxK8xNoaarANyZ55M/yrAG8txM5iQBRxn+4BkjgNCbGvHJc27PGoAahsa+pxD2E84my9KfSqcRoveQuBzuhzZ8ichBsKFnKjSJby7yGFGBxefK2asAXrRooC1qk72FAkNRpM5Y69y5e9w2j03HNCCjy032k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBnZjxmW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBnZjxmW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5mqls030629
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dygG9Oa2sBG+0KNu8dtwTW
	0rUBxsgf/WDp4kxnn2PEc=; b=iBnZjxmWb33dujTpgQWz2pa4msBoR+5Q5sz+VY
	LWL7CuN176Dd2I3kPi547zC8OoEoztQqojRLfS4FAEk2L4as6MK5g73fXnwCaZof
	EFhzA1PDaJ9cAIFtVbJsszpzx1du6L39T8EBY/9E+sUapMKelKwxDGo8/gATSf2E
	RzsSGUuLjRIiefScvFdMzX0VBptzQBBFF6qwyRdTRthSm7/WuH7on+wtIW9HgKJN
	uuwyPnJqzahb45W0M3EeqAnOJ2udftZ6zHxDTu/dDDpHiu7bv1giE0z2BglxyRKO
	L5+wRb6gxsCk+Ul8EFV4h0rPXtzkO6vYOhKsYnhyjQ07CyeA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkcsvv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8c8a36d8eso19582626d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565725; x=1748170525;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dygG9Oa2sBG+0KNu8dtwTW0rUBxsgf/WDp4kxnn2PEc=;
        b=Az0i00J1f0gGbNz7AiSCbyQzOJ72o2m9M5wygkIHRyzuPQd2VO9Rdp6A15ycmoEEPI
         JyvPFdyqP70PbnE6ogXp8ip07XY5ZCUF40V9oZ/8b6cwGxe3sIBFDQ+/Qg4C5rb3wgyK
         a8jnFVwIcjsKeQMJd3BeYupQg67sbvlBY1l9ujujU7TSmwNMxXXhmRg2Sug7MK4GzxTA
         C2pRHFIh99UQTLJnL70O6e2TIfzfHn3hinjozQR7YduoClM+gYEufpK7IKVms1vyeCIm
         eTQxBZKJAl+fj1+Bb69tvYQkYI7UTkxwuzALMSn22xi33KbWatYdldXe2Psco+r7P0/d
         xVVw==
X-Forwarded-Encrypted: i=1; AJvYcCWg4uO3ZC0p/bOeED40XMmt9jP/BREx2e3a1nods3C5RXHs4GfLmvDiQ7/txpk30tGqZAaAeH3MpimWwzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeViISFduLjy1N1RDMiruY5zHJBMrGSxQa5k5yZPDLgYBqu+bX
	clymegnZpSICaLE9IHaP6fIABzcQg8c9EzwLwpZCuKS32i52Yt2Pjf5vEugk4weuNEUWU8lPR0E
	0DAXdh3RlsgRmy/dkp3lw4fYrMU8N3buJGEuTIttsGbqqknWqy2B9GQvcvJmZCdp31wc=
X-Gm-Gg: ASbGncuWxcamHYXrwRCplJwq0VZUFmwIu+RXHayubKe+1DLZrtnENKDMha7FO03kspL
	NZV5pK2SrAouALfCLd4yxod4H7FYwFjyDZY2KWNIX4GshxSRw0VS10b62JRgMJPwFmiIH6G9j0O
	RRCxeVqmggVyUSWywG+5ugLWwXV8ZQ9Rnf/nljcC742Jlz8aPVdADOk9sOAPK8N+oTtJsJYSoBk
	Xf6lDB2QcDkfiL+VHGZ9Dc2IGMfAFefPNEYYa2Nu7YZTVMK4d9odvMUQtsMeJWcsqWIn+nIYLc/
	Dwmvf00J83+thzMRMCKsAt100Np4iRWnyNl2oPVAknUY/gAukrXlk+gd/+qvpwbQiiqwxPOZYT3
	OxFk6MuG7iwtPGWgIE+rMkFFA
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f8b0881b41mr150111546d6.22.1747565724603;
        Sun, 18 May 2025 03:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1waGEaJBOHUK/hXbXkrMHI3pyZOv6MMf2NSoKVTkW0bnd18eZ3+aO951TZ4oxQfBZX6BEjQ==
X-Received: by 2002:ad4:5aa3:0:b0:6e8:f3af:ed59 with SMTP id 6a1803df08f44-6f8b0881b41mr150111226d6.22.1747565724202;
        Sun, 18 May 2025 03:55:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:55:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/11] drm/msm: rework the ties between KMS and GPU
 parts of the driver
Date: Sun, 18 May 2025 13:55:18 +0300
Message-Id: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJa8KWgC/23MQQqDMBCF4atI1o1MYlTsqvcoXcQYNWCMzWhoE
 e/eKJRC283AP/C+laD2RiM5JyvxOhg0boyRnRKiejl2mpomNuHAcxCMUYuWdtNCcRrMTHkJTIt
 KC2iBxM3kdWseh3e9xe4Nzs4/Dz6w/fuWsi8pMAqUsYy3oi5YocqLQ0zvixyUszaNh+xg4B8kh
 x+E7wivuKoltLls/iDbtr0A1rWx0fYAAAA=
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3517;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZMPdcJDb4Sai0ElGNUE8wg+TZJqFVZ/UEtHRRg56ccM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyZIHkrqMMH0USJE6kCasx6u1cWMm0W79nDq
 jl6dI9t7rKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mQAKCRCLPIo+Aiko
 1ZomB/9y036miSvgEAw9vHR7r7LrHb9fxll6SJ3eLtFTnNiffFNDOi2NN/AWOJHGVd8jeEZMWa+
 4OTSYknrf6+bWW4fLwXSLuiJa627h/P5K41g/PStC+sn+J3FsD/W2HEsj9/5dvPSwZPZmVEejwp
 2fhW+gphC3CTVNrr4jBYxAUxmLX6GmNQIXBbkJTRQYndpjoO0q+kEFHvdSjBEDKzVTd/xauPkGv
 eqSrsVv39o/fXKGVdQaxEHj27uyc1JSnXgAinziyHiEj081TYokrx58H2Z9nu3dK8yH7dPFX7cD
 hpgPbParfyHz2O45FcY6iUSjxq7ChCJhAMaRKtkVGWhy7jg6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: bw2NxB5TImoamVbDrgo3MNpvsoUP9erV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX+3WF79jw29UX
 Qsj15Z2Oel+WqT/mheM3wYYT6HDDeDbDK/YP9yFWCTDNt3itu4hN7RLjD97QCCTpagIw5Sbyhwt
 HQQSaIUDAT5NE+Ni5ig5DVCtd+Ne5Qrm9nC3xOPiSbLGQhQax+2Whc4WCNcgq/0tml0gKCi0VKb
 zDjt7EGtACu8HpW1NIEMEZ0I+oEBsncE/BI7grSKnKuCMmFk1Y+8IvqASQCUwfWVZaexuupK41O
 1/h+ggXjNuE0Nb1bkGwGllThQhSjoEvLwKS8kzaQRmZ/NTf80lh7+tfX1xDZUHUCTGtQZn6WoYp
 aSIDutH46xTKYVnScQqfyUgCzg/Vykbj3oaTBxdf6X8vxPnOG0OQUNZhwspWTvmK2LGikousbiS
 I3UHpycoXOzwTz4Baxrt5yD69G3LbCPso0iokKyAXN6ffKWdGzW6CjctcmDAP/d4PTx6tLlF
X-Authority-Analysis: v=2.4 cv=aJXwqa9m c=1 sm=1 tr=0 ts=6829bc9d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aS5ecUQXdRO32CnfYUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: bw2NxB5TImoamVbDrgo3MNpvsoUP9erV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104

Currently the KMS and GPU parts of the msm driver are pretty much
intertwined. It is impossible to register a KMS-only device and
registering a GPU-only DRM device requires modifying the DT.  Not to
mention that binding the GPU-only device creates an interim platform
devices, which complicates IOMMU setup.

Rework the driver:
- Make it possible to disable KMS parts (if MDP4, MDP5 and DPU drivers
  are disabled).
- Register GPU-only devices without an interim platform device.
- Add module param that makes msm driver register GPU and KMS devices
  separately.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Disabled SYNCOBJ / SYNCOBJ_TIMELINE for KMS-only driver (Rob Clark)
- Further refine Kconfig dependencies
- Link to v2: https://lore.kernel.org/r/20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com

Changes in v2:
- Got rid of mdp4_crtc.id and msm_drm_private.num_crtcs
- Moved msm_drm_private.wq and msm_drm_private.event_thread to struct
  msm_kms (Rob Clark)
- Moved HDMI / DSI / DP pointers to msm_kms (Abhinav)
- Link to v1: https://lore.kernel.org/r/20250413-msm-gpu-split-v1-0-1132f4b616c7@oss.qualcomm.com

---
Dmitry Baryshkov (11):
      drm/msm: move wq handling to KMS code
      drm/msm: move helper calls to msm_kms.c
      drm/msm/mdp4: get rid of mdp4_crtc.id
      drm/msm: get rid of msm_drm_private::num_crtcs
      drm/msm: move KMS driver data to msm_kms
      drm/msm: make it possible to disable KMS-related code.
      drm/msm: bail out late_init_minor() if it is not a GPU device
      drm/msm: rearrange symbol selection
      drm/msm: rework binding of Imageon GPUs
      drm/msm: enable separate binding of GPU and display devices
      drm/msm: make it possible to disable GPU support

 drivers/gpu/drm/msm/Kconfig                       |  59 ++++--
 drivers/gpu/drm/msm/Makefile                      |  31 +--
 drivers/gpu/drm/msm/adreno/adreno_device.c        |  39 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  35 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c         |   9 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          |  13 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c         |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c          |  17 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |  12 +-
 drivers/gpu/drm/msm/dp/dp_debug.c                 |   4 +
 drivers/gpu/drm/msm/dp/dp_display.c               |   6 +-
 drivers/gpu/drm/msm/dsi/dsi.c                     |   4 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                   |  13 +-
 drivers/gpu/drm/msm/msm_debugfs.c                 | 222 ++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.c                     | 203 +++++++++++++-------
 drivers/gpu/drm/msm/msm_drv.h                     |  34 ++--
 drivers/gpu/drm/msm/msm_gpu.h                     |  71 ++++++-
 drivers/gpu/drm/msm/msm_kms.c                     |  41 +++-
 drivers/gpu/drm/msm/msm_kms.h                     |  46 +++++
 drivers/gpu/drm/msm/msm_submitqueue.c             |  12 +-
 23 files changed, 550 insertions(+), 342 deletions(-)
---
base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

