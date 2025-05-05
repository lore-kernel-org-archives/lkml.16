Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDBD1C4A10
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 00:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404129; cv=none; b=UthSH5lG7kEp0wXcKymRVyuCNlfjrspJLaKXdz6RU+LMzhUoC0zJhZOKSS3ENPycrzNFq/ugzJ/MfHtrIBUEbE7Y0gN+BBCPg3GtWc93aWW6oexW6uTZrdNrRbJWvHP2aPp8Mooguv9CVzJGe6qUbpiOK0NdMRWDQSnt7KTq6Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404129; c=relaxed/simple;
	bh=bvIhvO1innwyRAbYHqCQ0x70uwNpoIP0GsrklKNFU/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LjsSeAxoO+dHhNd7CzZOrEmmy7dr2CQOcKSbMU8GY51QnmePXVJh0IcVeN/7N+g68roqhaAhT8XM6djZHrOfAMb6VOlDKpnFCRBB1ocQaqol0IMlg/SHcM7/+rFA/O2O703wL1AhASM1NfaguF0++g5vuxr3qtC90+GtLwETo0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mo2sEw2Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo2sEw2Z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544LrsLm001425
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 00:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4AojzG6jCxROBT7DQt2jv8yK6mPKIHDtAt836rfmBsY=; b=Mo2sEw2Z7bVvXTJd
	Okv6W6bM4rmdKV0ks2shTdfFmmSMhuz12Hv2wMT+W7FcA6GOWSik4QlGudbf9TnN
	OXnRX0xnyLtCNKx/OBZimZy3bQ55AIHZMNafJ77/xrd7uVMgqeITFveG+C2QMilC
	gd7wnO88dh6tYFO60Al6q6eELAs7Bg0yFiDDZw1EVzyAtYWP9UBZhVxPzhogi+gK
	0zmuKqMQ9vs0VUlE4bKYgGBbHODwpFHQ96ASAc3jHEEVJgfuT4PstEdZgy9t1HG2
	7sqQ/yuZiI2bmwhFAhNlqEmS9Ln3YJ3uVc68VwjnUsVOr6xfvS1KWiZpTwPeZyy7
	uey8eg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep2qty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:15:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so573574785a.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 17:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404124; x=1747008924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AojzG6jCxROBT7DQt2jv8yK6mPKIHDtAt836rfmBsY=;
        b=O4r25S5IZ0ttc1b1AWPjx2wsS3daDGSZ6nBCez9oSADNJF/LAWkG3ZbQdHFdhxQH86
         mp+C4kuMCMX2EaD8QQpvG+sf55NikghHNTx04SVDs41Ew45HLKqIpX1DBmDRbQ1kmuiw
         jb8Cnt9liLfjvVIPR5LeTiMQXsKYTUTsa2LjiUcSYQCkqOsQk3NQl8dzAS4Z+vntg73A
         yh5M5vSPR14Gy5x3hYw88tUfyAuPBNHLpd/ttej/WOmZQ+x9U+uLUtcF8EWHemprV7jD
         4NYpTfwSvJlqz6GXwkq04M/QWOKm2o+Xs8yAOOO0immj27XyzcQKvFRXZvxKElAAtrJC
         k0aA==
X-Forwarded-Encrypted: i=1; AJvYcCXUm2CheSlkYYZOEMN4HtUv8ZhTQyXPzXc7eX0cN7CVjfqy6MRj5vnad88fkA9CrOyy3yHQ8Jl1nSkx9aM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt8Yt/gSpflKEurieF1DuAaEd7of2yqbM1CCt9Y/RZ8mNyBf/P
	do3bla5Q2zuY0J5yfvTNObnylGD5qoFCl7qKDU9h+yQayVZv5e3DTd0gG8ADojUX9FJ/bA5ls9/
	W2DunNKHGYKINeXmKEAe5+3bVvp/RHIxBM8bQtXAUOZzgear73c2AJTItwebEnM0=
X-Gm-Gg: ASbGnctJmvnIDdxS0wLVbysIJ/qWgd0fcErs14TYbyEUkA72Omq5pRVyZ4RMQ1yLrcD
	PBALB0RpXqBuErK6ZcF5Z48MhiY7ui1gIs/sfjVnqcxtHjBX3YeUZs7c5sGRM4G6usD1Yc6YxqG
	1X8siB+OiNh/YjWtU/KNDpNlNBKXQ59fT/4g+i6ICLSLPXOOWQuCNPd92OvS+tmH/1w14OHHFKu
	tuC+NXbWq+zl6Yyh995rGQLFqs8QWnmM8tDsl8B7hZlr3hSKEnzFz3eMQsVPIAA87gaZVqhi3Kw
	x7kA/WHmvHRkAXs9dQmwTRcir7GFyXlEc0yE6FWekDnYqCUor7sV++0RB1jYzuVD3Jr1WJlV+6d
	HyS401aFeb39QXW88dAm1WXkb
X-Received: by 2002:a05:620a:410c:b0:7c5:43c2:a907 with SMTP id af79cd13be357-7cae3aa39bcmr693002085a.26.1746404124147;
        Sun, 04 May 2025 17:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB8NTXM8sLgxQ5EDQiBqnHjvBehzk0c2YXdh0OUwFkg8Bd4jMJXvp8mozV1nZ8OQOYX3W3Jw==
X-Received: by 2002:a05:620a:410c:b0:7c5:43c2:a907 with SMTP id af79cd13be357-7cae3aa39bcmr692997185a.26.1746404123665;
        Sun, 04 May 2025 17:15:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:55 +0300
Subject: [PATCH v5 11/13] drm/msm/hdmi: expand the HDMI_CFG macro
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-11-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7KB7IcHxi0VqX9I5ufq901Xoeq2I7R2imjBgnmx5DoY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4YE099AvsjXwWoLAwuWa7JorxAvWKQiHmbIEXFrqcPSa
 w+U1eZ3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAii6o4GPpeW2a/vS/6uk9U
 Ke9z+qI9/16cupf4P1fU+l7I3hldCjkbE1ZI3j75gdlvod1S/zuJQrMyyr0XdM9KO/Tce9IBgf0
 a06rEpnGW7d71VuiiNeNS9xP+5TGf+Rca20dZK7Q7/np177vE+Wlrpi7Xl+MxtuOTW91ar/fLRf
 HJs9qmVDlT7W38Jtuus5mom6QtXrU7hGd1rjHzNiUl5/wd1Qv/tDbn/NN4fkj235TIj8IxUVnlC
 WGvGKvtnp06/cCqOWq6ebAla19Wthd33IQjn0OX3v//WiB9O4NH4dHClAmLn3QdUlXh+O6xT/LJ
 8twS1/D3JwUSpYPetP/XuPqpxHD1p7QNpfv4LZRTQ60UAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6818031f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Pd00KUci3bVIrXXMz04A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pd5RWLRCr7a0xdy-kddbYhR9JpgB3mAW
X-Proofpoint-GUID: pd5RWLRCr7a0xdy-kddbYhR9JpgB3mAW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfXw32twK/YaoW1
 UBX7F0JenoctZm2pe4pAfNtW0AJPJYSk2uIn8LRrO+f3BRR/ZmB5zuzpSz7ICHdKMvNkJwQq2en
 561lNtjTgoEgyboGspwmYnGiPpFuFDg9yX5WRH1vOc3AcbmL03qNW8MyEXQCCtCoQdZMFGbJFD5
 nAhFJlNvx1OsBMJxdWUwXVT3c3me35pMS7+rkdhbkesjp4V6u1Q3Spf43n44ouVljEkEFG/gMf3
 IzoOkDYrfEMNYFINizRm7MTWcR96GkqhjMHR9uCAHpLaF7bgvHoWmyd4yGBavh8jDxzBb5auDVr
 Q3k+/aGPsILlk1EnHG4MUSG2Ok6JRooljrvAsLoVK7f6LjGQvXwu27fSy2FlFz3/XlSetijcpyO
 JAUDQFu8Kp5epmmHQO4DY0lkkBV9Vl24ZDDgsxLav3zGyHip8fJvEjcOWYonoPR74iBVSIzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Expand the HDMI_CFG() macro in HDMI config description. It has no added
value other than hiding some boilerplate declarations.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 8e6e3e6a04bd2d86bcbd23c110f3533f56c17887..3d10fe6f8545198365a047b2f5652081703101aa 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -221,24 +221,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
  * The hdmi device:
  */
 
-#define HDMI_CFG(item, entry) \
-	.item ## _names = item ##_names_ ## entry, \
-	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
-
 static const char * const pwr_reg_names_8960[] = {"core-vdda"};
 static const char * const pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(pwr_clk, 8960),
+	.pwr_reg_names = pwr_reg_names_8960,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
+	.pwr_clk_names = pwr_clk_names_8960,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char * const pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
+	.pwr_reg_names = pwr_reg_names_8x74,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
+	.pwr_clk_names = pwr_clk_names_8x74,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a28437beb1574553c1dc00a0c693b390389353e0..fb64652162b6c5e6e2fe3357b89c40e2a28aa47e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -86,7 +86,7 @@ struct hdmi_platform_config {
 	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
 
-	/* clks that need to be on for hpd: */
+	/* clks that need to be on: */
 	const char * const *pwr_clk_names;
 	int pwr_clk_cnt;
 };

-- 
2.39.5

