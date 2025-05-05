Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FA61A0BFD
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 00:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404119; cv=none; b=e1nnwp2RCX4OS6rI0kQ0KTF6NOJ0TLqidNnuPFTAw9rYrxQiJawEmPcqzm2/YCZCrYf9M+19m2VMxFpwhND4oOKKBzkivKOaX6umzaHBcF8HtV3DEAdMFYixJt59zrl2kw59wIQ+LlD5luFysW2pSwTiM07ubzxBPQIBELSTRec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404119; c=relaxed/simple;
	bh=yxhAip+pU59d1DqmlgSeZ4LDkSEHXaDc7qVKspiiNHs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQVhIDAek9QSjhYHiyvojzO225SG8UcYaXlaQW/9K9HrhFASFbqX9801Bt9Opw+EzOV6bM+tpS021IZK/BHQ5joVkHaNfCXM0grxWmheeNw5+4eDSjQOBUm1Atg5YCpopWsAwzCZ9nkvwZYKEviwWjRc1CzK+RK1qIS5CoarKsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nAiW8nE/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nAiW8nE/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NLVK4032287
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 00:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v2F7Z22Vqvpmj5OI5DLRf+E6nF4Jvc5Wh4oto467bgM=; b=nAiW8nE/itp0xVjY
	YUPQ9BUa9ZyG0iW0m9aLQGvyqzAIpH/uRS0kbvofPJHcAEEeeGwErdmbMjuzO+z0
	e4XtcpvUWGBmS1w5BTgnrep4Wlde9EufgKYLUx3RKytC1W6jOoC+vbMc6EyLwssW
	hMycCqHm6KmsjpJi6vxmBT9hX8GMo5IrFj3kCntI2HEnff583obp8i5f9qJf4v8p
	2l/CXNexgEM0vsgtYOhVNkINSWDjDKR6D0RZtzswS67SEx6T13gwm0gjosMDAiu2
	nft9fbUZAj2FGU1IWbU9SaNUPs31i/KnFfkl88PnIpQYY08ue2zgV3EVZidtyy1F
	E2SSXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9ahk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:15:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c3c8f8ab79so98105185a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 17:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404116; x=1747008916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2F7Z22Vqvpmj5OI5DLRf+E6nF4Jvc5Wh4oto467bgM=;
        b=iMC2IbgtWODFeUCT3r/8AVgMe/fR5jwbMdPot4iP7yIrsK+x3jdN6cobAn7VKZ2Hr0
         iaW5GjJF1bbu0iaBeXLiwbXzbH/nwWXsiNJKrSr40YZXm7gbqhQALTnBzAcgrA9fkoEI
         cfxdVBoG8hVwsIpYa4VBDdynXW3FHT3FDRr+QyTfJCFQdw8+Wi3BgGNwbvsV7mhkLVUV
         +gJ0/cubLwMbKO2t+hnECZHbpx1O2dMYRHxediCb2pE4wrfrDBXx9f+FX8qsyXbuRdFw
         PUrLNVdv3OPKauE0Jg7eALrgUzpR3kRwnFyQiA+fWgU/s6dQyKZmsArUY0UhG5Inq3JN
         MAyg==
X-Forwarded-Encrypted: i=1; AJvYcCWuIqBooC7FWIxnoaw4wczWgf22WcnqkeOgZx0YVEqi+jFtOhj5e9vVYXPJPjv1vES3NaQ0sjapp8zj8CM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI6RAgThHwoDTcpiTz3g2/V/GmFTl01A+KKmt+HNAWp7uTMcUx
	F0qenTDcC3R11Y7o34yn+zh83+4SFO60fEEXnDjnZtyVONUSEizvS3h/+WNyXkxOoFZ1uRgyCuJ
	FjgjyaC6iad17Hl6gyk3xfDfLdHqHm06NtnDvpQQuuaO61RK/biQjygfC3165Jd0=
X-Gm-Gg: ASbGncuxvGdqPOxvJuY6EDZ54XbDF3AovIFeuFSzKai84tHEtuyOFfOI9xMRdiqwnkM
	S4fDgc5mLkCNJqRDMU6Ys1Fy8x33UnfeoV9IntkIYu3owO41cdEapIevpyVs+ELkg+CmbfJFPHi
	ZhE3vklqIGm0CFVKep0DxKubpejQfM563qnEVzadJKIPziQVfe90rd0vXQpnR6zJSfUTRedIk92
	YpslIVMhoH+1rRufiZLBys5kSmIyg4egL74xDLotfko+J99ykXUQu9NMvGHTAg2GMpyhdCURLP4
	ghDFeB8VXvUOPTeh2mb3sxXE6wq/Pi3NHPWTN3xiP/qfxos2k4ebZGCHC8EvnQTZOwHdB88mAiI
	czpSxLk114t+wBnpUO9ouxkvN
X-Received: by 2002:a05:620a:2685:b0:7c7:a537:7ce2 with SMTP id af79cd13be357-7cadfe17315mr802247185a.32.1746404116391;
        Sun, 04 May 2025 17:15:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExYazgDRjTexqikZJLs+e8cHSkJCMMfDgM9LGiX5mnr/yYzp0a87xL7ICzXIpxbm+W8Aa1RQ==
X-Received: by 2002:a05:620a:2685:b0:7c7:a537:7ce2 with SMTP id af79cd13be357-7cadfe17315mr802244685a.32.1746404115996;
        Sun, 04 May 2025 17:15:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:52 +0300
Subject: [PATCH v5 08/13] drm/msm/hdmi: add runtime PM calls to DDC
 transfer function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-8-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iRrggYdOsfyNRF7mD9CF5dLKTnVLk9gbl2tlKLOnDn8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL81jAwp87jlj7ePL8czNId/7xi5vSBolYDO
 u7aLLeOGLqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1ZIrB/9urrL2y3ZvkQ2p9CqGK09lcSPj2IysMUziduCLEJKZVJY1Unqn29EtfW09+necJx1FnMu
 Oh1wVjrwn93y14OfZUCkCZj/VuGWmZrHQ2IiCbxAViknRVwNZwHh+SwCKKFz5PmFVRLpqF7UrIx
 lbfr084Ct04AbBoBdVZD2RpfCWmOmm4vfSowLzvpL2RYSix3bg30smbVtDZ0MKDy19qbyEbfmnY
 8BuWNgbVPoGwVrWOWeoynq6TJE3KY5c19DId31Pr0TzKQMEaKnSONTJGKFr50R8fC9Fry/1BX8q
 PX2DyLakLBKEigIRXub1o69z0JHanZVTsxpo2CVxkT2d5eOo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX8Zn90DikUeHV
 fuUmqOQ9G/MzUKiq0ifr4ffT7mttCL8C9kHwhXbxe7xh6+R01jskbUjUZI1ElAxSY4XGt4VFcgs
 yNPLz8GF6jeeNrVLp+VDiFVgy629VF9f/Zsl0yeaglCkf5jE8c9ZGgfsanbfhWJCIQm+JvpCJot
 GDlxmMSN0opxXTfTIVSLFFmtvRhKkOaNhyyvwids3HZvDr3W9kW3e5D+2Li42+UTIj8zr6jKif9
 eWRrAAc788fLBC2zNxDoj6gE4W4SGOKx8AvJ63TpBz4RapkhsKpIOwjgImxP2FALIlHxW1KnFLK
 +csmGvwFH+Toke1jOoYePEXVzI+Xihf1kwPO41jfIDRy3fHFO6kFb652B0NZH7yo/nXF4JqzDGn
 1SeUNIzH+tSSq0fyWX5EKuIFScikvtF+xt/3zAEolmyz18ibk4/omU2QHoo6KfKtRvgZMck0
X-Proofpoint-ORIG-GUID: CDRoqIW9PQN3_KVcllmAGgUNY4YUxnT-
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=68180315 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=bgq6psdzRVsaJitvC04A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CDRoqIW9PQN3_KVcllmAGgUNY4YUxnT-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We must be sure that the HDMI controller is powered on, while performing
the DDC transfer. Add corresponding runtime PM calls to
msm_hdmi_i2c_xfer().

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
index 7aa500d24240ff3ed6694c469eafc4388c982346..ebefea4fb40855745001ed97367d571bde28f413 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_i2c.c
@@ -107,11 +107,15 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 	if (num == 0)
 		return num;
 
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		return ret;
+
 	init_ddc(hdmi_i2c);
 
 	ret = ddc_clear_irq(hdmi_i2c);
 	if (ret)
-		return ret;
+		goto fail;
 
 	for (i = 0; i < num; i++) {
 		struct i2c_msg *p = &msgs[i];
@@ -169,7 +173,7 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 				hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_HW_STATUS),
 				hdmi_read(hdmi, REG_HDMI_DDC_INT_CTRL));
-		return ret;
+		goto fail;
 	}
 
 	ddc_status = hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS);
@@ -202,7 +206,13 @@ static int msm_hdmi_i2c_xfer(struct i2c_adapter *i2c,
 		}
 	}
 
+	pm_runtime_put(&hdmi->pdev->dev);
+
 	return i;
+
+fail:
+	pm_runtime_put(&hdmi->pdev->dev);
+	return ret;
 }
 
 static u32 msm_hdmi_i2c_func(struct i2c_adapter *adapter)

-- 
2.39.5

