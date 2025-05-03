Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1337083A
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256630; cv=none; b=jWoiJzXsJsrgXSfsft+6NaHVClL7GYdoEzApW7tMkJM1SPu5s+0lgN8JtNaGoI8Hf6FP26MIKLA6DE/LDXXZPeg6cmI53VGcEY7NtsB7GuM0nMmevVech1Kzz9DPH2FgcKznlLeTm3ed+TRalnBKI1tWawHrYM4G2gWGVNM9jrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256630; c=relaxed/simple;
	bh=zpaWzihcAkuFU7mOqkmcCp0zLATW5X8ucLZXXq16CRE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VA2110aAIu2QP00Ij9UOQaDV3lZZ2D0TWahUkCKVslPzsxzr9wQwsJhAlb2XAnZZOHxcFQc9IkpsroLz1nIZeLt8bGvyRyukGMIsmlQcfwaYK/svfF0eppdwxZHe/+Nn2Qt0SHxWDtOc0zhkzsEdlKJLESgDI1VyGtb3zueC/d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=USQTKPJB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="USQTKPJB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5437F1cb008119
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 07:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hNcb6Gt2GU+K2Wi4MQP5kS
	7q72CjyKeIq2SG9MvFUcI=; b=USQTKPJBPplgMjd97YJLDJckRumEbguqRAhtHB
	9BrkHmawrsgkpLKvkPlk2nuyzZp92z9+9k+B/gqYLT8KZUJZpDVA1ih0uUEEqQ16
	LhOR8vborCjdH1/nbJi14vL5kMQ/5J9OizSZHSeunjCW03aPWjNZVsVpmMVVKOa2
	iNnfeDLBEA00KDOK5de+yVIAa7Q0mfHN5XMdHJ9rGrz2KhGqZFFciPnd1MqHdwnC
	sV2iYtK/GwmR9V+HNqbZskLD0oNaFjJifNVVN688Dpzb3L7clDw7W1CDgTcKWEar
	4diYZY5cBUEFLvz3HQzIRtOLCLnoO97c7KJkXQDRKJwanNjw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9856t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 07:17:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so329867885a.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 00:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256625; x=1746861425;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNcb6Gt2GU+K2Wi4MQP5kS7q72CjyKeIq2SG9MvFUcI=;
        b=gn34rZSECyC8uzLYvdYocAzk8KGkH6g9YrcXZjTYZANQtevpEqeIqFic0OGWyF6PX0
         eB6CcSsVrSUYWnFHSrbw1NncLXU2bwJCFGedBfLDtwLzWXwntEtvM4fWreCdW92axoj5
         ybgHPvXBlGpnnZuslXe91KnHxsxXTmNs76nCeRxg6jBziBR4/TOdJCcvXunEyunMr7kB
         PLWENN8c5INiGCRUBeT1cykvVuEyqS5k0O7PtogPl697nIX7SwJYZLkCS2YN/pCWUddO
         P6tniDzmkA5XTq+ze8/sdkkqvIIkHRasxqaFyOERwxqjq4bJk8IzX+GTr20FpPXv0OSh
         oA6g==
X-Forwarded-Encrypted: i=1; AJvYcCUZKk8zEC/E+A+pIAotaWEyhSuVWSF/9TOIbvhT8A7jWHQziry2WQ3dEkcBZMn1UecLz3CVoJBDR4RAYhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJD9gvWVdHDHtNJpkpUxB7e2q49bawuUAv1mXc24N+NMGnlSWv
	0585V9VFHRPfRSf0LfvvRzAaOSkohQGf6zOCAW/zU2gK8TFxDPbaDfxccSJqAQxVYela8+rKUj3
	OCdWSZMR8ESZIeK577tegmkhLnedQf3ZB1BSlNGJegnJLU8ylGtrz1MrhKf48w7TIjcNcbz/z0w
	==
X-Gm-Gg: ASbGnctgOJ1c573VqWVRzx26yV25eQciUSTMUnpmq4ZLEI/Cizz2iWqlDDXeGrKyAPs
	sN4Iq/VI6JI1Nogbqfl91TNBK9j7shn070q+yL3I9ZAzPKHKPfKJNdB7yMecAhYbMmVdrz0A+4H
	40QrY0iEh/C6Q+IVVZD+vpYoVQ0LXcldLq94besTbyOJp4nH3XfMnyHToncGGY5eiSTcfARPbCi
	4zA+PZOsCDkwe5Z2cAgrd6hx7ryr1EQXv2/xx1fCIvcy2x8hb9/wmcG3JOiZKKiiwDAAEcVPx5q
	Z0ZZq3Xe5nY2vJaF6IsgE6pLuynV8GfImgOaPqiNLOEleLTmcPd4NdnRSf9Ii6BFG7emgm78IbU
	K+tJFR4Hwj5weAM2+bMQif6Fb
X-Received: by 2002:a05:620a:4711:b0:7c5:3e22:616e with SMTP id af79cd13be357-7cae3b05993mr23304185a.56.1746256625495;
        Sat, 03 May 2025 00:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzZAh6r7yk34zBACICarYn+7ksNe9H7A/jXSfVMrZqR4QFbAiT+CavYkAqQqGM9qu4e0Vd/A==
X-Received: by 2002:a05:620a:4711:b0:7c5:3e22:616e with SMTP id af79cd13be357-7cae3b05993mr23301485a.56.1746256625139;
        Sat, 03 May 2025 00:17:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/11] drm/msm: rework the ties between KMS and GPU
 parts of the driver
Date: Sat, 03 May 2025 10:16:59 +0300
Message-Id: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOvCFWgC/13MwQqDMAzG8VeRnBdpaqdsp73H8OBc1IK12qhsi
 O++Tthll8A/8P02EA6WBa7JBoFXK9YPMfQpgbqrhpbRPmODVvqsDBE6cdiOC8rY2xl1oYjNhY1
 qFMTNGLixr8O7l7E7K7MP74Nf6fv9SdmftBIqJMp0Yx455XVx8yLptFR97Z1L44Fy3/cPq4nWm
 LEAAAA=
X-Change-ID: 20250411-msm-gpu-split-2701e49e40f0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3290;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zpaWzihcAkuFU7mOqkmcCp0zLATW5X8ucLZXXq16CRE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLs8czfk2fFmfLywbFlWfcNnIy7EbvZg8VT8
 /qJGFPSEjuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7AAKCRCLPIo+Aiko
 1ezOCACf61qvE4g158ByABGSe5jNgTEE03FziSvWkgJ8Q6a1kEDquwUWSM+kLn2Fw082s/18auQ
 GaFv7xvox6sh1/lYH9wKmeBMHF1XdEjN4mUVzdN9C9ex6tltonKwfXNMtTH3WT9XPC5awHbif9P
 kfdavGnHZjbnmaqkVMCrpy/GQ7z+QNgjvZXlPTd+ymoDjeFiyCgYZSpwFknfPo0/Ob838jBaZ7H
 soAlQGItpaUhPixnN45BHGXaM18QwU+56sKMJHMgTmqKP/rsj+1xFT4280eDV/087Nag/YvVebH
 EYwuNOj2xV9kWyrdDW8W22TeY14O4EuXGWQFqCfnRrc6ik5Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MCBTYWx0ZWRfXwLb3T6ve9KDP
 nl0yHKyPO826ZsWHaw00rqFJLQlCGgtDlQ9ek5NOWislt5lCdsTAaDjyTZkV6tubzib+X78g8hq
 cVVfilqZtQpH2tPrMIsOMT+VJsRux4RB3D8kWQgH9c78OPxkQ9UBbx7M6qD0SU5E5en1GF3uqcp
 eROsqe16b5PaYTqDdtAbuCbEUmNChOrHL3dXo6bmKDZO/zgYuWbwS2Pec7YNsR+yaFYWTeimnbC
 9HDlrCrJ+KAzUaMMY1k5Bq4AW2+38hRHWBR5iqHobP0kmReOB0hONP9XvLoJkuiFn+qY8Vh13KF
 pYkI8ZWQ6vM0lXLNRqKAPmVesNQXtklDLaDkGroWRK30zAx13WbABMLmoZCuVOvYX4+lfSYgBhK
 hWONRpRB9eJqRWnizJyc+xJidGjJKX/byApiLKZZZcj8pbUqOR02v2CYZw+27aGmh2ZkzYIo
X-Proofpoint-ORIG-GUID: GhdqCd9MGcB5mgbWecDJqt50LRgbBkDw
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6815c2f3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3aS5ecUQXdRO32CnfYUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: GhdqCd9MGcB5mgbWecDJqt50LRgbBkDw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030060

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

 drivers/gpu/drm/msm/Kconfig                       |  54 ++++--
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
 drivers/gpu/drm/msm/msm_drv.c                     | 205 +++++++++++++-------
 drivers/gpu/drm/msm/msm_drv.h                     |  34 ++--
 drivers/gpu/drm/msm/msm_gpu.h                     |  71 ++++++-
 drivers/gpu/drm/msm/msm_kms.c                     |  41 +++-
 drivers/gpu/drm/msm/msm_kms.h                     |  46 +++++
 drivers/gpu/drm/msm/msm_submitqueue.c             |  12 +-
 23 files changed, 549 insertions(+), 340 deletions(-)
---
base-commit: 37ff6e9a2ce321b7932d3987701757fb4d87b0e6
change-id: 20250411-msm-gpu-split-2701e49e40f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

