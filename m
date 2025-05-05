Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F665158520
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 00:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404110; cv=none; b=EWTuC9Zjdp3fNzdLaMoCqB1pXieih3garb7eXnzUlR1pxdyzSUn042dH7SuJwvfajtYKkyIpq4vAPb7STLrftjONBk9lxtQH4g+xoE1zSMNobXQSr4loP2C9Tz9B2fBYWMvLldXbtVNALVmkOp//ds+mtkgfiNbYTuaJghtO/lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404110; c=relaxed/simple;
	bh=D6TFGB5oM58ofnRrvAfwKN6lOoLCqPqgZw7msJQC4Ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F2qTfkRrUUcWOIdIHljzMguIG9tk4KOM30esMoVIVy+/dgqcnYCanJ8h06bXi+MaGALtbMAo94sL01jzlyoSgEXt0d00d2Gca5LBQnl8PfTOwOlzBoVodbl/Xe0bxo3yqtuqI/djz9EcBVysRgw/ZtbIrPuIic9tDfPiHoiMYqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HL1NeU5O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL1NeU5O"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544LquWc024445
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 00:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wLs0iVHofkv4RiL71eod9NJCAwyTb7zT17L0PQFSE=; b=HL1NeU5OLXXFcxXy
	TjxFc6NtarcUGFTLNJwNhYH30ubvXysRIKcrydvpwYpqJAErHlC5QSk7C69Ygyou
	oNgK9TODN1LMY8bueOKRi6Em/mCGU98zB5NLOoWx1YhFoE5GFGw9mKe1Nki20Bbi
	j6P3oY+ZlPTMpNSuXtV+fq38TqzNYDn5uW14MWocJpMZTM1Ml+lRVeTSUwYSRBrY
	wx1NcuuYHmbJteRKsUfc5VVb0H+o/DHip9hVaERvDW8VLET+E+p8/fYg5QgF85cY
	peBqqy2cdq0rUmC5rmyXtx3OcCrEOJDCM0lyeQPcTZimN/j6yBixzqHpFXw4Khi3
	asiWMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55tnup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:15:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4770cbdb9c7so89650831cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 17:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404106; x=1747008906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0wLs0iVHofkv4RiL71eod9NJCAwyTb7zT17L0PQFSE=;
        b=vdkb0WhYFS1TafoCbbX+rmXguCOj8f4nl6eiia5dar0CP6ehvYpIp1N/VGWhwmlZYs
         6GL/FXtZLK4pXblSlgo1kg8IDwS/OnD4wLF1Dh7p/1kGp1aWG5eFa7HfT+3CDyzDN24r
         7vmZO6H48J3TniazkT5+B3rwfnWmwFJxqhvqpGTDfoaWBJEGdPxJlMzK8B+wQCiRw9Xd
         nLJWXvJ7OIdlSbg+C1f2XH+FQYl32Ssp9jEnya3tQ5/YpNzBEJPEVTg/0oBu4csROi3f
         RAL9IjwshLlLeAAc5iGAaqvPrQMQffaUmHMQNEWm5rEP2/iv9g0+R8ZEbtOWAvDuWyLY
         UWrg==
X-Forwarded-Encrypted: i=1; AJvYcCWYLc98lwu8w8qZIopgh5ZYuddlwdll9iDqUVypWDDkGdfIt7pF0az9NrR/eFRYeaGEsI7SyD6XY+D2v1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzVSfgPhOJvNK6aVNObS+7lCJ7QhfNTwoCcnU0JHh98/pQNndO
	Z2rwTZTHPVF0hyk6ZiVLIPV4wdjIwv3ZfIEaJqpu+DCSFVD6WA5IBp62kLJClk9Ayd67sWH/N2F
	LZ+MZYDISebmY/lxubquGwyu3NFPhaM5m8Qcodea9Ih29d1m5DXGPL89fYqMH4EQ=
X-Gm-Gg: ASbGncsro6/CpZUlwML2/tD/kwWXD6Hon2vvYb8Uf2mXhtlRm1XHOFVGYZ+t5reiG/4
	lQSV7Hj9q49S0Hba8NB5U0oy3OZiZW+UUchb/kGTr1Eb8oov9BE+dfbRfJ2xB2kYw0NAbRbvuAZ
	pYE/UeTt7oJpalS2emEdwyv0Mdm4QuMvkVO0n5ehQ4m+IujIroNUfnTYSacSgpQjojH72Or86K4
	Uv9jcuF+zpINaLJJBiRlQCVuc3IRNHdmt4JgeXSKY+dxIu7Qw5PcYgPXbkuve9K92MYzCevCHBo
	ZHlMQx66yTqSBc2m2QnsUcIPtiLhXxqdkgsGPhJXdTEAwjI1/R3bq8Q82SIZUf8sbmjhDFTY2S0
	TeJUVUkih7A/gNkJLRHPJb+Hl
X-Received: by 2002:a05:622a:5585:b0:479:2509:528a with SMTP id d75a77b69052e-48c32ac7333mr177680311cf.42.1746404106148;
        Sun, 04 May 2025 17:15:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSLLxowO0dJGPkvuX9RhOj9QBfPznkAxKoanIkxu8WWIzBNeIlJLloQOmPJXB6Ug9KK63z7w==
X-Received: by 2002:a05:622a:5585:b0:479:2509:528a with SMTP id d75a77b69052e-48c32ac7333mr177679971cf.42.1746404105839;
        Sun, 04 May 2025 17:15:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:15:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:47 +0300
Subject: [PATCH v5 03/13] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-3-48541f76318c@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OUSREmRh8249bUIyNnvM4Q8G4H+YLOauuOGWEq+Beno=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7KLXUMBlRbyuEJArZP28ojba3pXgt+c1/7
 okMpiFlV4yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1Xm6B/4gs76RF9xtIzBzLSkxCGgpkPU1UtrIEEvR2dHR8161J3VbiGvR7Ho29PviL72l057riaX
 NrQAUbxJjM3NBSI97ryLHmN3LAFCjIKCPLGGg2jC8RcYRV02KzNB5KcXvfLOAarTKfMRxxLCB09
 bZTxJOrJPbR9Q76Os5esA7DB7VasvSsJrub2zlYxD5WZTtMIZ68bCGJxOgkMkdsOS19tVutXkKZ
 DxpQifCrW9U8CIXk3GVAU95EdQUpTwBucj0J+6lRmtf4R9P80W4C2G+U2KBogFT5hSdvCU8MUy3
 vw/9EYy9LjHyseDqJIoZCglgw9ae8APErjI5wti7eMo6y7lS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX9lneOIqMZBvl
 ni/wBrjP/VLOOIdasA7X2eVt3qLIi2AayWP4fErLc3fBB4E4jTH7CZb2tkt/RYTxOOhlO7Qp+hj
 HZhGpV+Rz42fFjqQcSUaaOcvd1kgZjGmguXRfqqYBiyQfs9vGmUv2gXPBr66J6GQEGLWa+M4JLK
 HKlGh6KbhITxkKrj4CZyuXakC1/SdUV20y1IhZGh6bGfiiOI+Gpp0SkrDkDry19p5NK2v9IpE/7
 RfIjua7fYM37//Z05eQ5uSolQsevZ7XEbW5/1LmVKyqLsu1AvyBE7h3ZNZd0CdRHvEpsrp6z7xA
 lHRKoj/WdvfioiwjEiNj4ifBPrlMHO+1w5GdlOcrA0t1sqWn7InK7FcGUDbK8yRQUqSkIiOIpum
 dYcqy5Goz0z7fZqys4KP4knai7CgqGChIcTd92qM+R1+Y/1uPNklFJzJp4HL5PaERKb2MDI+
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=6818030a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=-Tkwmxe0xhrxJHpsn9cA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JSogM4m-uEj7vBvhqTgxXkvXOPac9qMy
X-Proofpoint-ORIG-GUID: JSogM4m-uEj7vBvhqTgxXkvXOPac9qMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9e9900882687fa2ae4a734d5cf10b5bae5af2f87..ebf9d8162c6e5759a3780c74354b6c159598750f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -233,9 +233,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char * const pwr_clk_names_8x74[] = {"extp"};
+static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.5

