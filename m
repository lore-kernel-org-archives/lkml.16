Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D061A287504
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940627; cv=none; b=WT18jJ/6owHdmAiZd1zq1ZUgkVxaCqZ9GkxQsByutKxSEvSNOVD3Iz3qxHm1f54blRvoLvlmIlTRYBv/KGADHoOSaRdORbMzyV+JVhBSXtTNfJpSwIxpOIUl+gRN+AK4M7RCk+jNhQMUo7IL1SXkFeVBAJu7VVLetS9n2eXmsBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940627; c=relaxed/simple;
	bh=YQ5B5oB0M1GxXXeGU1Mj5ulVe9j+iVrAat2kcJ+hCFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WOsX6yXHj5Q/U2sVawIr4achhLudrIGWWJqoR34vzw7YqmJF+7HS9rVlQfcvlfNulTqwrUgMZaTUVRqCPW4xUWiuCm5HOtUCNA66N541OX2d5k0iVNf9EULmcRYy21hclal7aJfw8h6RLfrsVN4JgJq5IFuxjhm9qlGkEUW5fQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlcOUh93; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlcOUh93"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHEGgG000862
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYnzMBmIWlsfdGw4huDhs42iPHpQ0FxmQDjZ9WoLD+M=; b=IlcOUh93lYezYwvr
	LnNaooikxqLqZqK0nhWYlqBtp0+KvJzGWnuKiKwhst3hTiI66DCT0nk3OA7UbiAs
	Um5saEQowaO6UfWHo3vtnoZ5+Cbnq/EOJ+noo2V3s5k1hv69GN5U5uBBXVF2D8f1
	6KxUQ80fbK9agHdRqmFBmhtNyjWedxvEOg6xNg2IYra2bULxcs93gcwCPF782DNH
	WKsLuXZqqCBCvkAHVDS+LQu9PByl5spGMeVIHm9J7Lzm+yvQGVPCj19VEJAIoKoi
	vF4xNLaIDznvSYo3nYGar1+j09lEHStHoUDhFiCV5MWevr03FkQdY7ccRzVavT54
	m9xPYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6ybd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee990722so77112885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940623; x=1748545423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYnzMBmIWlsfdGw4huDhs42iPHpQ0FxmQDjZ9WoLD+M=;
        b=KY0UDTsBbdT3iXi7mG/U2mL3aUaEdN3cONK+jIblU1qMKG62C/ALZ4NcKAMqg+Av6X
         +5Hkw3msU3PS+MwhFoMghfbxtDOGTOc+l9Px6xblqcGC4RSKLu+ryLKfNoZWAHTJUoCg
         fElDmjinRu9Y4zI3WYjkKNSlZUFRPhbuIzjpR01m+Gf5jO1fCsJ/J+Y7ZouHdAH9AR/8
         QtwkMI0lTt1tCC7FMR7WddYCxOun9/cVxP1477jmVG8UGy/FLsd/M89HaqzC4x4w1NJk
         rpj2oKRG08fmZkEqYGuVmRoM2s30koXDhwn3OMwpFEu3evnCDhbDLhYbkHvkU7lp6wJN
         iGAw==
X-Forwarded-Encrypted: i=1; AJvYcCVuU1HeiWwKnpqZwHDoPkMLSpI271vypxs1rjK7hRq41hIISj3lTWFg6MLHcbUcOodk+wLCO8gtg9xomlk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz52WZ7gqEcJrR4FZDU9Ro1/D5FY+aTqk6JvrFvz8P5FPTvmGbW
	mZQ3xFcQGhNx8QVwGgJMzxIgRVfx6mICeGRej++tm0njLmM3BXwIyH1rg8N20OdvjV/hrp+GXiv
	6fKUDNDnKGH85Muu836ZzVoAMc6g1CcdWHVAXgWnSJ5gw5ihhj40kxLVTu/HYiIaPFyY=
X-Gm-Gg: ASbGnctN2gQn6XgdAmhnjIzb7YKRNeH1tTYUVYdDeqrmjOVCcDoTpjoYuYOLWBbJF7t
	V/8M+vhToqWOOolvoBQqyQtlXPQbPDfFaKKGoOJASMTc8dsF8HFawXIBG9KXfFCvDiqLJ3aM2LS
	Q7vPaMzjAinaaAOEaOtCr1zr82DnSFPXbqOTzdKaPZsKxAdSmXSipB8asYwUn709vIlT1HlVE+l
	MKhdf+dutugUS0BwA72bK6rGpf8wLv2lw/f35aTj6q+CXNHg9NJJiMsA9WTJDLxMeg2auQK8wTu
	IA8bFnFJT9IC5enRwmQQXROaYE6ogg4Va7PRd85VPMumENlhafcn/YoVkR7yxZuF5OWgcd/zMg4
	U8O5e30HqPOnHkDOfW2lgrevd
X-Received: by 2002:a05:620a:1994:b0:7c5:9a1b:4f22 with SMTP id af79cd13be357-7cd47fef371mr3705858085a.56.1747940623629;
        Thu, 22 May 2025 12:03:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6nclAd8Oh6p4d0w/pm4oPMdyXdN0sNQ9apgHVbjhlRv2lU1Ok/VlbVzdZAx2HRmhRyJKCKQ==
X-Received: by 2002:a05:620a:1994:b0:7c5:9a1b:4f22 with SMTP id af79cd13be357-7cd47fef371mr3705854285a.56.1747940623235;
        Thu, 22 May 2025 12:03:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:25 +0300
Subject: [PATCH v5 06/30] drm/msm/dpu: inline _setup_mixer_ops()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-6-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2225;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=A0zH0+x9BjgKXdk/u2Bzaxpf3wDWrsUR19FXOhuXrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T8kb8nDY5+e9egcdsa0xvZpYX+N37LDMokn
 E4Ml7Al2TeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/AAKCRCLPIo+Aiko
 1Td2CACR2bs5yQxdsmKpKEl3FQ+iiWkJS1b4rtxw0v6U0zh6ysU6ub9bMGofPrwEt+qhEbKUirz
 Vse7z/3QA26rziYAGFobQqS0hSd+LZUEQ3nL3YaVZNc0GdDvcr09AZVkhmA56F5mJaseZpALdGF
 5SAMKJy5a7opD/LrJdr/v9iVb6pfEHsUubcXYhymk1AhdzUimgKqf5ULvgzqXuuAI0s4rd0UPGh
 +e6JIz4dWaUTyJqTSfgKQ07ocWf5IQ6czZtYqbH5rVnQd8JIQ+iFNqU/JYMPF8kyFKaOrDDGpPd
 AmczS+Bi5sZLavW7Q3h3FrCdzlWQXhKKMBqb6aUMvdf93tKL
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Icjq8rzeQ_zV-cqI-gVQdEGRPKMgxuBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX9z33Y3W/MyQB
 DmXueQn7R4/kE49Onnz9ao3wQ3mZSe/0rkppYmpnuDJuM+P2J5NyMbI7iKHOCfGUFACECHJxrL5
 jXVULoisNCx6RRrhuQbZZnqaU0uuj7PiSBKW+r3Cy0IiV57AzvDSt5iHnFI49tekjsY+Y75hn2a
 pXR++0KNKB3hR3D3HAs2W9gOdYNwaQxQw1oAEx6QusCnjZbEnVKarqk4J9usQozv3S5C7qWxHa0
 w11yQ1Nw7GJCN5OiIL/7CvHN3YyvS02780qwjjpXV1fa5qbMbEF5T67KiQGGrzVjLF+YNVrXdcE
 iqjnQZWsXGtZekhFfC/1q2I1CxfmZxEl1lsxYkBNa/KR7bosHkEnWlVxn4AP6doy//o7Q4/Bo0e
 9lq28Fyg2ew3YoO1yZ+NBYYSW8ftqUSp9v1DieMLpLtg5UAFHREgXJA6fG2zy9LOGc7Kg89v
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f7510 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Icjq8rzeQ_zV-cqI-gVQdEGRPKMgxuBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5

