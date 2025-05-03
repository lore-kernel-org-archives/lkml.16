Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635B1D516F
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 07:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256650; cv=none; b=TiIthuXS0kPcZvwqwIn3UMJJu2AJESmKmPUMiRyblMw6i/kV8p7NuvLhBQXGWhgBbN6k2S8e1qpi1FMEb/aXJLSLj5k7vWMTnjsdjUg21MKEjDACHDigj1Q+nX4X+n+bgSmxdGQ4qlT3hoD34yF6dpFMCSDuoi1OfD4ZiAnS0/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256650; c=relaxed/simple;
	bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eCtVeKA1CyyNy0Z7+KakOLxNNEpEbfDWugd2+KkJ7tplynYbncHbDB4PdUqZ5BfmVTTgk59bMNUWgs24leiUKpJV3rGWBkFP7qQ8zkdFk42YIicuxG1ry+vi5vj0fC8Fw6q6NoAi7GFTsKi60HZfdZtWsO2yXE1bIoXKhdbP7Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0DKXqSm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0DKXqSm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433S2KY024496
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 07:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=; b=m0DKXqSm6EyfaLu/
	aYULsLAbxD6xsr8J0khOtrg/r6TS9wBbgmx1O5oBRtjc/rP/H2iThpYEyWv7Jg8r
	PzFCnUyrxyDGl8NYCZ9fUBH/kVlf1HjM67qz8M33uMcoKkQ7lV5dmHro8w1hcK54
	4ulb/K1pkzIFP4JMdXd3lXkJtiDrPoLeCdqBHKEZcRg/E/XU7I2vC1w6YyhEHl+c
	0HFzkpnKoQs4qsw+VRdyYr6mtql3+vXsfDYiuwEEl+nhpqJyx+USTTXiAvY/wBoy
	VfqEE8IjVndeQSCu2zw9CXMg6IrygxhY+sHmDy3G2PWbPu3ZlA/6JiYSzARUNNd5
	MJvW3w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46daqxg93r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 07:17:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e91d8a7165so49477976d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 00:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256646; x=1746861446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=;
        b=p225bmLIijQrz6b34Idy574DRkGIGrA7WbKwBuNmL3PBhbRSmP+jx9IcD68EOFdmCA
         My78T7wtGDrRpoU52jUNJtWFWz/fkyob1wzxCEMBYp/d5Ix95xADrpHV38J3C/vvfH/+
         9AAeHxgw4JsVICPx0AasNqG+DgaoxQebfCOwXo3VI11FF0fah+xhbWfFT5Wr3WT/ItCp
         n9r0rCp6ZsB4y8rM/JqSzASWjYVY7we4iTp/pS3QWEqbeU1tppRlN5rQiSmRCnajqx4Z
         TVL7yfsr4/wyrA/68/MGHL7oKLvMuRhiZM5p9xhYAWl2Pl9eKv28T/Qdi3aISVClBWt7
         uWCg==
X-Forwarded-Encrypted: i=1; AJvYcCX9jPxWqyk3/W9fDuUl24uYOmWl/5nsfDULdvr4Kt8ef/frPDChIs/ZE30daPQR9MrdGlS5vSYUn0vwi3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6amIBdWN+iqZ3lVVqaFNr1Tiqf4vD35KjsjIVSsrYtHMKbzO4
	kM1e7OcfNoM0z8sqjOytlxkCR8ZvJcGVWvPD42p2Rp9ON/n2iTXcIM/zt7tg944qIJWrbinYpeZ
	xbVCNEEoVGP7W/GvAZP0YIyl/eP6j0F3SkaSV44f8k902Sjtky+gJSV4CdVUVb3I=
X-Gm-Gg: ASbGncvkF/qXZoAlDeEKUvPqmhyLQOdM7Qs6IQT2br4c/HimxeNK+iktIOGTK1VX8L1
	W60OWqEO87wLLnNOZv7Y8YAKv3hoSPalVlnjvYA4vV96cDMxKDT8ASdeRARMacZp7r3mHOL4bEx
	uwFe73+naPGjDvOPMbNbP+ASLzY9Zgo9exgNy67uv2owgCUkWZderMYdxQw6QRPEES1NmML0g20
	oxDN/Xx2LWu7n/0Kx3xZwMhhIPtVAQ1+BRSMxxsh0sXuqv/EkTaO8r8gevPC8GgerCjzesO2Ggx
	JGmy9kJIlIn4FB6eudh/POIxJ1a+MYrJ/1HsASZtkPDQn2bNgb87aee/NP7NPIF/jfwfYLqmawU
	3P6MCLXMgBFwcVScOxQyL/Pa0
X-Received: by 2002:a05:6214:2129:b0:6e8:9021:9095 with SMTP id 6a1803df08f44-6f5237fbbb1mr27600676d6.32.1746256646236;
        Sat, 03 May 2025 00:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpB3pHTIUqZGcsBp0Il5fJqaHfOAUEGlJgoPXLApyd6X97N7fzz6CuVAEWn767gkXc6Hk4BA==
X-Received: by 2002:a05:6214:2129:b0:6e8:9021:9095 with SMTP id 6a1803df08f44-6f5237fbbb1mr27600466d6.32.1746256645925;
        Sat, 03 May 2025 00:17:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:07 +0300
Subject: [PATCH v2 08/11] drm/msm: rearrange symbol selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-8-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLuBMMn4ItSbf332XStKlW35YGuLZVxWVA8m
 25P9Ac1XzKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7gAKCRCLPIo+Aiko
 1dtxB/42QE9ea3mH4vZB5MqtG3+5CAfJWvYdq5Uau9Gm5ZB0YuiFOpwCgBvNwzk+ecvA6/grL4e
 Ennjfd1ZhPjowB1gdRAPbNturCs6p70ZK9avu4lTx7KkdsdwK0GQ2OVYxRiUWDUgPFTW+4i3GZe
 C0G4hiUkCoZ6fzWHddY98lM1VcZBVNA7/GvULRuc/tiFn6X6nSoJ6qnGwqLOsKOhr372i+QNz5P
 8NKNh1G2j2ahLeI6lkyFnq4fWEu2riXsU5WB20ZQEPptG60ZP6VbPwk7q5PCQwqnqjQX6SAXR66
 DtOgoZ7koBsXNNQ9I8KvhvQhqLOsgI7VjgKYsuLdoiwcNMQv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: awyt-BWfz6d2amK_QIol3IxY5pGJ9qpQ
X-Proofpoint-ORIG-GUID: awyt-BWfz6d2amK_QIol3IxY5pGJ9qpQ
X-Authority-Analysis: v=2.4 cv=baZrUPPB c=1 sm=1 tr=0 ts=6815c307 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=0W9TD_AsGAYKDBPL:21 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfX5DBE0jGTEIRY
 NZR8sYVtNE6l3dRggPHylXNerQknFepE2cHQsGu0SJcwVwU7VD8DLdHTUQ2DH7PiIbZJjmEAHyL
 I6Qnt6h61nhRSxKxpmqNKx+s7B5lgWztL1RZXo4C0lQPJi/46MPsf4mJh3SiXTdbDlPdkvGmfqM
 hgH+h8J02c0xJyjRI2NYbvNkPLvQq7Fqwf5SwgC+LI6mnLplQSml24MXy9zPluDLuVWnEaHlwl3
 dfFl/2pKWbqFzoJQGtE9m4kuRTeVb0BhD3p6hbp7RbASk+zbtGMP93v8QSMAgCUdLn5zI3T+V60
 SsRSX/IlQ3SGvomJAVdhtjuc7TXQkWGgC3eA5wcs8fPCqRkhY87MyFrBfY6sftt8oVxCUcdA6qs
 tEI2IqkDy8xSVRliF9FNGPhtf5cTTYdfnyfqB0/bUv8Bq4Wx9/uVmWyFhthskBmz9ts20fnG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index cada5832db3e894c9bae4c6b0c6d935dbf5d933f..f6360931ae55a2923264f0e6cc33c6af0d50c706 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,18 +15,8 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -69,10 +59,18 @@ config DRM_MSM_VALIDATE_XML
 config DRM_MSM_KMS
 	def_bool n
 	depends on DRM_MSM
+	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 
 config DRM_MSM_KMS_FBDEV
 	def_bool DRM_FBDEV_EMULATION
 	depends on DRM_MSM_KMS
+	select FB_SYSMEM_HELPERS
 
 config DRM_MSM_MDSS
 	bool
@@ -118,6 +116,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5

