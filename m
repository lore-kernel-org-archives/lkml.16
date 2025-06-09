Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB31D6187
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493487; cv=none; b=TgP8e2f6xVyBrcUH4GBFpwOeKaq84AiUmPVrjVwvgliTIqbSLjbwtonMl3GzWPVCZUvDTc3FwcMZHUd3d5JebAHGOS4E+VLu+Hd9tu67E0WejVfyjeD7rx/O6dZButnXuiYyrEUayBtefzYTpLrEAOn3F4aTKwcRIgn244pdZtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493487; c=relaxed/simple;
	bh=hqqVwI2DtCjfh9orO/cac6PjLKpP78bMvl+SrAmC4zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H602XL7g4x1dfc182WAXTAsBHttGaoNZ02EuaBnTKmiQItnFHwphMaGoh/QquTKqFkkojFoxQSrr7Vn+HDcSeJ3oVdVWYEuE0IM3Bi3qnd5wrZEbdWBvuKbKE0VIH16xhSTyNFwejR4SyLfE3vD4Zxw4QC2UPtBiWnN6EZva/pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7hFueSs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7hFueSs"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599fLwO022679
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 18:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F2gwz9xWCvt
	M03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=; b=i7hFueSs0hspbXU3m8LSLRGfgQ0
	oCWVIaU/SC8Q6wuVbDWHMy0gWZRDhhhCCen+GqFlbdNB1mM3sJQfi32BAxXb1Rp3
	5VIEtZaZeAharmseIr4Ofyb35rbK5JOjBZ0pI83Cqmsa1MtB16pftHmfbKhTYIgU
	A2mZh7YGzblRncTclgfEJik6uRxl3DVxLWB0a8IysK5uQbBuLikw6YyltzvJkb5S
	Lj83IgWXqoaxCIWhut8wmtvwNIb123aQm08VvrgDgYTquXGUvSvxlDSceY5LIPXz
	vJZE7JhMCgNYwaSaMMritFN/m0ypOiGA8x64mME0N6jVKdBjOCo9djK7OiQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekppmpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 18:24:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742d077bdfaso6583619b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749493484; x=1750098284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2gwz9xWCvtM03RmugvtKUkXIvbzjxIu6DI5yEMCZHg=;
        b=HF8DZR70ATw+MI9ry0hPnZ2W1iHC35DXUyBgS7f5LaKixZe6lhWo2/mxhN7l1Bx3Fa
         82YG9R/d8wu0vO2ItbDyVNw4+wA/nwUR7GnDLVAVD9Y6yaC9gMiNPtObo5hAAsr6PSVA
         pdmPp3IcJYXaaIg0QowZx0lnLH2o/mk+3Hpy9NRmEygr0dn26HfmeTrjjK5d4xMYoNvq
         qOKujmsAi70B7rbFRP8OUeePf69RotrAmWN6hii2qxD+P7fW2HULrmhVM6KaP7nZpIYP
         8bskjXIj0ZqzW8Euyagd2/CWFriMI3Xi9aVH4tXyv5ZwkaF2gT7WeDIal6ZJPiTf1/7j
         o4dw==
X-Forwarded-Encrypted: i=1; AJvYcCVOapDDEJTljuKCD1/nSlSqdwKbWTIwRb6MD8FVG22Igqx1r7DU0A047KpOY8th9XG3TkLRL/Fy++PyHeg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcTA7fo1Zqk0k5vO7bOjCPAFJuTXWE/BjMh00te27u30JatTGZ
	U4mN8g7iyDDEPjYd4eQ4Plglw5j5INX+DREYoT8ZJAZZ3LP6vT12eHBFUGVYeXzl0PJZlR0nH5h
	+MiksDXOxvfmBW/j7VIKnmZYyQlpjjP4wSLLAaOpfB4D28Cg7gMxRMIyUSK363sif55M=
X-Gm-Gg: ASbGnctkJcCL+fl5SPr/5MSDiR4K+ioQNm7VIY6N1/n8/kOPrXWJXJk6Ow03eIs/ra7
	BKNg2qCmCcYY/3Fxq4zb6HjGWPdBp+5qk6sfjQYXn1PdF0aHTmJkW/ijo4m+k7d8BVCrO5vVoXx
	TsALe25QKtFUwKA2lu4Hex8tJukEr6HEl/sY0/ZicZ1FAg4nts7ZBM+DdWa+YhYqpaxTXgSV6dK
	yfotTVxoyDL+HqTDaLuZpa30di/RnVdTKXJN7I47LhbGkVLDO/uYRECv1JSEELxKWdmOGfeo7y8
	KaqmgdzWPHaTvihRRewKQw==
X-Received: by 2002:a05:6a00:993:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-74827f330a7mr17505742b3a.23.1749493484088;
        Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE4XO4k7jfNXjeUp4cke4cx2uvEFDbj4Fl9AWPgXX5AvA95l91RUCPxIh1kKECvcbV1YQhTQ==
X-Received: by 2002:a05:6a00:993:b0:746:2ae9:fc3d with SMTP id d2e1a72fcca58-74827f330a7mr17505710b3a.23.1749493483727;
        Mon, 09 Jun 2025 11:24:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7a216sm5945104b3a.40.2025.06.09.11.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:24:43 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] drm/msm: Rename add_components_mdp()
Date: Mon,  9 Jun 2025 11:24:35 -0700
Message-ID: <20250609182439.28432-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684726ec cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vt6ngUXDG6_mDpkR7fcA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfX23fqshhAblxW
 ZC8kU/+IDLN7QvBIBjZzO1889gh2BNGjvWdWjRAHRzvvqcEkF3eXoUIMaYjkDLetsBcYtXv02da
 +N0p/XN2bLs0BzWjUCpUYFEbiGxgCYV0Z6bYX1qPq/mP3Ts8aG97pqKsFXyzL17TSVMvViQc5+R
 iZ61ztDZ08IGDmL90xdVexfVNnvK+QwWAzBuTXvwrgThmWTFt+JJHKzSoEMMx81OE68Ik3B2Zbu
 SXL7FMJeSAqFuadM9ko21GftvKnsFcqtlIwEfnfAKHLPXc3pu2FXMcMnz5KXEAkU5lZMTlLLel0
 35fminGjAX0E2gPwwTnWdbOw4vMNs+R7lNfCxOoROj01OSbZo7zp4dnkrVGyHCUuyWBp7Oe2JJQ
 vrQYH+MOKYhWv3vBb22QG+KSxIKMyLaOGVVLyZN8SBWyQmUWCVqiMaXxxMeyNAP8x2zb0R1R
X-Proofpoint-GUID: NOWTajSWfL5ROW8rzbSrMKqNgHDgHjvz
X-Proofpoint-ORIG-GUID: NOWTajSWfL5ROW8rzbSrMKqNgHDgHjvz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090140

To better match add_gpu_components().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 710046906229..87ee9839ca4a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -852,7 +852,7 @@ static const struct drm_driver msm_driver = {
  * is no external component that we need to add since LVDS is within MDP4
  * itself.
  */
-static int add_components_mdp(struct device *master_dev,
+static int add_mdp_components(struct device *master_dev,
 			      struct component_match **matchptr)
 {
 	struct device_node *np = master_dev->of_node;
@@ -997,7 +997,7 @@ int msm_drv_probe(struct device *master_dev,
 
 	/* Add mdp components if we have KMS. */
 	if (kms_init) {
-		ret = add_components_mdp(master_dev, &match);
+		ret = add_mdp_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
-- 
2.49.0

