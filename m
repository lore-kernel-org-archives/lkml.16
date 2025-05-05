Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A601A195FE8
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 00:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404117; cv=none; b=JhLTZD2hHsh4tby17uCz5i97bXuPKJ2aMY0vjvEKW8vihYiE4ES8oRQE01vnZuqTEHqeyMiC/t3HPYAm6ITuuP9x1hMmGJoW/YTnEGVwC4Hs0mz0VaFmk9VB2DL8Jn9EITtfVovr6uXEGaQK3adpqLaYaT4VJrq9ykSgBkMbsW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404117; c=relaxed/simple;
	bh=Q7+hSmVUziCvTJlqk5umA7RkOLupvCyy8blJqiPzehA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzce66VnAOQjs6bHId989NinFkuqZPd+ONFO0G3cGPYSBpa4mJvC3f+MxAmSxL2MhXfnOG1frl6r7YhM4Z8JWSN2g7VJqGLn6fTHg4DoyQALzu51FFn8krvtNT2N9aDpFGhoLwHoZyRop+W/aE7sGj7UdOls0ZMPEZxX0R6dXVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZ1oK6V8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ1oK6V8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544JmT6X022933
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 00:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rzjD6W4PVhu5bnBRA6TwITh0IKW78wTDC6QACU3Fu6Y=; b=kZ1oK6V84mEwN0v+
	3Y6GE+RRy3ttADEs4G9dkCBiySKIBJddQpSz+L+IK82Bzrn8JDHUy5QMvX1Brchc
	v32VgXZLmP4mcLsoxbPrs/f1oMZ/montVVwKviY9FXnxZLPOD0QQI67wZFNOh6nz
	uu2jyZc7kryMHf8XUj8fllk7+S+1KDY+Tslqsz9Al0jelRnYKKMmwJLiQWFifRUI
	dMnS4kCRoZtT9DJtpDkRl+F4Jn/AaKEk3GAeKYB3DJ5IFhcvOM4Ets9ybb7GYdIm
	YAvfpJofWFtcdxHWdYIlq2C7kfI9VSoovL7g1uBXYyIcXhMZuwWDf42cDL9aG2O6
	XibAjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfjj4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:15:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47682f9e7b9so72888291cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 17:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404114; x=1747008914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzjD6W4PVhu5bnBRA6TwITh0IKW78wTDC6QACU3Fu6Y=;
        b=xBIlaCfkQs0h4Hp2wzyFLGar8YmWiVMPmua5HtD3FUfpDqpgvW9lo3vJR5YtEvCBrr
         J2aTA3nESWdWZcR7dOOpvnUHJyFqRaK9FL7LqVciDZHhfnfnJ1YwCGNbkIbVqCKEWEnR
         Ln2EMAXkvJLrOlrehj8nP+5/7j1DCipA34u96Ji3UwMx+4OwqzwjydWMCK8Bow7Sg8m2
         zHiKq6NcNCjvfEKDLTzhvmDAl+ccpGobdbVuomUB2JFq3REleHKp85EzwdtZPMkMuU3A
         PPR67145cL+8cxDB7zet/YL2udnW53lgZsB2cW5DnVt81qQi1RurYb5hqkj3mYxAQSa1
         Mi1w==
X-Forwarded-Encrypted: i=1; AJvYcCUPP64n7uPOVGQ81ZkVCiL6T+xUVkf2ylVfkeWT/tpPaI0ySRlDa5mRlnAi3L7B56N8r4o3QzyEbMBmlFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/R3vtV0hLLjDxMLrTaRvB+wp0Ote/JyvI57+/2xDhRrJvESST
	4xGB5OiECcrSg5ZZy/6AB39wsAm/JggTHdinvP96sUmH9VXiAEKA0IUUHsPJk1LJNsWpnzXEN2A
	u8DFp/lxdgu9qpsfFXL/D2kI1WuqDilgqHyhnx9jDoX9vaYsB4LD+WyoW0izWcLw=
X-Gm-Gg: ASbGnctxW2J/4iSbgYVzvgynODiBeyuEnJCtr2IhIOrJGQr+mkA3nq0LvcfecSxxBr/
	Pvx0CoNg5ty/qyKjMTGke/4h1jRABGTKBD6aI8OIQMEcADLICiQpjMSrHfm+vYKqexSXZgHRQ1a
	VwiQ/0fPPm7JjVw09MOs36jwP/gEhz5CNo/0RM5MS4zomrOygPja2VsrZuDmclOszU2JvB5RST3
	acJt2PVIxoRQcYu/BNOw4LNyXXr5N23zpto42ylj2Ip/9QPUlT9AC1fHwjTfKl+ohDUSSm1KIaE
	l2b3SifquHwYX9KGSbpwScmxHTU+VEzmNv10p3CAK1maanycWJDbATACWT6nz+QrYy6SVXrH+79
	2E0OaFmgdddYaQtTOdwPPLw5z
X-Received: by 2002:a05:622a:490:b0:476:a895:7e87 with SMTP id d75a77b69052e-48e01552e3dmr83378901cf.48.1746404113757;
        Sun, 04 May 2025 17:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjy4BDq/ngBUylfvyk62dWRjQlZU6LHc8tgPXKTj0ZxRujx94ZtnGHTZ4N/Ax9Z0ejvKtJ3w==
X-Received: by 2002:a05:622a:490:b0:476:a895:7e87 with SMTP id d75a77b69052e-48e01552e3dmr83378621cf.48.1746404113439;
        Sun, 04 May 2025 17:15:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:51 +0300
Subject: [PATCH v5 07/13] drm/msm/hdmi: switch to
 pm_runtime_resume_and_get()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-7-48541f76318c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2832;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+KLC0hKahtw/rbBVi8TNRT2LZxqudcybFb57eB3iUWw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL8TRmPzNRqLG+vuhB2OEaPuUfxiYybPe2DY
 iYf3qhPCjqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC/AAKCRCLPIo+Aiko
 1XvzB/9S+1ACKUPSypEkRCWGDaqh9SspuUlnqat6JuNHZy0JmdmQyysnZprtX8J5FnlMWKfkSFg
 vkTXQbQ56FkcctwjfGdlhRDd3FnrRMd7S0xJGxu8ayZhKKz42fOr5eanjXTpu2hHoAQQyCv93tL
 2AD9FDzMWrYekF6U+KrooN1wXnjeaixp/nE4xl3Nsvn5l2IIGr1HlFClIkMbgcuUisOkODon2OB
 82+rZQDq4qkSb4dSHILyWcPOx8ThWXkk0d1u5ylyJSzB/Zx8nYn+hjj5CGcwUr16gM1YnruIi4E
 Et9ns3K0HrLR30SEUYGkS7S6+Np/5LAV25eMUCniYw5NYryT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 7xu0vzD-i_KFOfqE9UUDqbOWaQXMTU9V
X-Proofpoint-GUID: 7xu0vzD-i_KFOfqE9UUDqbOWaQXMTU9V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX0/TgzyF4ZQpy
 RFOOoQAOYvhuIqDKnA0GftAutIXwU6CqPVSFRBKUWgrZGa2u9ntrTmIsey6Qe5eC34TuV0sr07W
 ng3qLanh2J2+XKGeIJePq6WBw9DG6+asgS65AcafZSvHkM9vtpa2DOTGxYCqWG0oCQjpg0eZWAP
 7yDdIhsgq5dEiOwOg55kcLchovmq2bKtZ8MAg56l+hWqkPUBw/9/DsBpQuRG5EAlKfGW9iJmdxi
 1G7BEz1NgGIeY1MFBEefES9Q+pNuClBMSo1EbZyPDF2G4T7n/50JqG+JHF7/ps3iUepDwi/20Vz
 DMqNpL0BJFBZW3XXQnfkmpaWr8316LC/an5FEUKbz9Qq0UG0fuk3umxibNw3tFlKF3bc6dzus2U
 1eoW8dxrLpn1UhVBDA1rc0gnYmg7JWPGLwCnRCPrfoo9DQ2w4+moMwc+yLSYRVhTuwgffMs5
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=68180313 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=-J1M-BTCRiek0Q83fKAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The pm_runtime_get_sync() function is a bad choise for runtime power
management. Switch HDMI driver to pm_runtime_resume_and_get() and add
proper error handling, while we are at it.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++++++--
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |  6 +++++-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index e7997e4a741c3b27c9086651efe6b79dbba6bf88..3ae305e868a5931a8982e261f518cd8134d559cc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -21,7 +21,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	const struct hdmi_platform_config *config = hdmi->config;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	pm_runtime_resume_and_get(&hdmi->pdev->dev);
 
 	ret = regulator_bulk_enable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index e253c1408dd1c6dcd7e94506f0b8edcfd4a9a159..d77c68914c5f525cf12971c1058b1abc33792b24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -85,7 +85,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		goto fail;
+	}
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto fail;
@@ -178,7 +183,10 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	u32 hpd_int_status = 0;
 	int ret;
 
-	pm_runtime_get_sync(&hdmi->pdev->dev);
+	ret = pm_runtime_resume_and_get(&hdmi->pdev->dev);
+	if (ret)
+		goto out;
+
 	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index 03120c54ced686dcd2ddfe809dd9c9011f608235..667573f1db7c6bfef6c75828b5c581c147a86d0d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -58,7 +58,11 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int i, ret = 0;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "runtime resume failed: %d\n", ret);
+		return ret;
+	}
 
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {

-- 
2.39.5

