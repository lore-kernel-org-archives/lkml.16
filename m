Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D01DE3BA
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536034; cv=none; b=JVvvS6MqZRVsP7a5aoIC4rNmEyENyScuYiP5ELqLXjkTQ/f/FKc4KiAyzjafiWnTNWBv4ja9xzQ7R2I5kNhf6uUjGs6AMaUzeZKCP85ItD6pdrI74d2YTNRyRiqQILQ9jxUlJuG7von7ANAfsAr/HA1u8bYusacYQrSTvhCL6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536034; c=relaxed/simple;
	bh=QNUblXVSMmZgL7JmtCsIII2N/2s3Wei3lTTLIoLz1yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g/LAc+k/EhV6Yt0OeAbnvAxHmb949x6zuue1xH3S/bEaIK0eAhVyfqlA5/MAojAq9TzZsMBhEXR1E5Sk7cMtS0qtqnUH2kLSFISXLDZRMRZ+tu4YBuyrPNOUU8slU1lzKAGJYPowQ24ME9kPzJwPXZFOplMw03+b2fvMYYTmohM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdkUrvRc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdkUrvRc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468vUgB025518
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 12:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AgmcAWolgCiPWNjO4wriq7
	aohKZcAwprjCNfGs2zXa4=; b=QdkUrvRcGUMl+tnKigTOVSVpUZ/sKfBbjRwWxV
	sTqicwSp3duCZaLX14bY4RySYzPhFK1/BRTSlQx+06rKhJmSlkrf1hsN0uN8Dd99
	ox4EWtqD4aHmbhuA/t+duN+TeFo4Skxv6HXndvSFitGvCOtu8qAYFxZamz25F0H1
	nCKPevvnQdSmr/RykTyHyBvNjXO/n0UNBIQsQ2GmWkPqjCL8D/Qj04FEAhMnqCI+
	pRB1HCQAKb+JB1hI21Flw+yZZbiXHRxklOXGQVeGOzc6lTbT1AclMOM9ymR5N1s1
	j/hoA7+3r7snI2TEbPJ6OnbJgzqsdzU5TuHAW+nMPt2AT1Hw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv2awk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:53:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4767348e239so112958491cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536031; x=1747140831;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgmcAWolgCiPWNjO4wriq7aohKZcAwprjCNfGs2zXa4=;
        b=eHPDBYzDfyuYKYN3M8+pVLwtbiE8Gt1zGXQmux5/33l99i7ND7aOsnKii8ZoHjBpt0
         cdh6EaBPkzF7SnF9zsmoqCPTvxfMJE1/31zDuJYf3LDzO+Bx2A8Ojwa2IK0/QDLl63XR
         dRSJ7phcz5MXvxpnG1HbKb3vlxoNFAX2RB6IjWfAwpFTpdidRU4jxtZvIvNBn5wQQEWf
         s0Sp1ufxC/7AyHADlWgQ5chdPOwlmJcCT583E9MAPL8cjx/wsghjytXnlSSkmfFpOUdG
         mBzLzrvsWJQ4dzKSEC11IGQcI8XRt1wwyoeB/SL35OPOysbZiexOrdQB1cxSRke0jMEv
         c0KA==
X-Forwarded-Encrypted: i=1; AJvYcCWKrxPbrwcf3HKX0zPcSXvz6ou90i0Tna7NnyKcpKZ/IOfpmF72NeWjkeZ53x7EUFuIIA1SO+ersb6cucU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOSPn4XGPEfg/vyb7tvHCN8QNR0wp1kSX4ZtGKAWSa6tv3u6jx
	Im5JxUGpzyu4oPx+SpKbdjpBZGvLmN7xppQuqCLdvs/n3+mYMLAaW5Qymtv4sO4YGvvZlUzNmM8
	6aIn/yX6OXgPWnuM+kulQAoUKeNSvN1YWB2KX38oW7KOocIJ8QGwg/6UNFLYPuxM=
X-Gm-Gg: ASbGncsORN88WgL97qlw+1Fx5PGOoO5wLZ4OMEhfdFDuNhPwlskoE3W52M904ktt4ga
	Uik29cBGnF53Hqrw3RSWqJGEk4B0RTbotMwpy5JHm2HbXAjq+ZNXnaWzBx32DWclDArD2tqMMKO
	fkCh4piq74TRcNTNwqdjpywtDW5+XCW9AQVSLvwwaCBXMKn0Y96NQ8vWcSD16SMv82V2sax9rzr
	djnnQOt1yOFDzbwP10qFAC4noSbl7g/CRvcxHwetfR2/5JNsjSN/rx0ufquQSqIAnlRJGVhpaHq
	Mna7JOK7UKDFuAVbdTckfx+a0Z8trb8Qfd198x3estE6neHq0shf/6T27PT6nQWmzPoPydUhji0
	Z/bCgUGuQT/Cpohl7kFINp2H/
X-Received: by 2002:a05:622a:230a:b0:476:838c:b0ce with SMTP id d75a77b69052e-4910c3954d4mr48099281cf.13.1746536030563;
        Tue, 06 May 2025 05:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXsqKKERRcPxEdrvqstmJGewVow5qWh99rnHUM6amWIecro3btKP0XXWIMwlYB2tixxvB4cw==
X-Received: by 2002:a05:622a:230a:b0:476:838c:b0ce with SMTP id d75a77b69052e-4910c3954d4mr48098721cf.13.1746536030166;
        Tue, 06 May 2025 05:53:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f22csm21568221fa.84.2025.05.06.05.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:53:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 06 May 2025 15:53:48 +0300
Subject: [PATCH] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P
 CTL blocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFsGGmgC/x3MQQqEMAxA0atI1gbSamWYqwwuqo0akFqaURTx7
 lNm9Xmbf4NyFlZ4VzdkPkRliwWmrmBcfJwZJRSDJevIUYch7ag+W9NQwrihplW+GKTUX9i2lgc
 aXs50DsojZZ7k/P8//fP8APu7NDlvAAAA
X-Change-ID: 20250506-dpu-sar2130p-no-split-display-442eb0b85165
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aCKhQ5Lb1Tbcv2cIcyI7sgot7I/f5b0mNTjY2gFri0Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGgZcZXlpZXsBrmJ6mYd8gCprsu5r3HsOH21/f
 Qun5IG99seJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBoGXAAKCRCLPIo+Aiko
 1fbpCACk67EUrszUXYFDfhykF/xPSvfXYmeLZ7SoRQp1KkTZCkL5HW/yZmgOCklEiDpvHlz5HeK
 NcACb+qSoOFki/bm1i8iau3yUYd5eIalGF5caokG8SIJH1wEqM4xVlvMfUvZQX+VMab31levnYa
 VD0cMGuGL8OcRbCErhmT6PRDfF2wKUC73lJhURmqpYC7zTOSO5hY/y9Bq+zJXaMUY+Gs/tF4Rmi
 YE2hNx4y6UXT7iAFRFEmJGjKQWAJViipg4pom/NW1ynDO9F0SPjnitUZInizwsm4sI3nGF0+BUG
 w2nIuCDnJHz1nmcSa1Xxaj5uSaHmvZU5ktNOu4cCRnfhxj+v
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: YFAvTVYfCsPR4qFIjFy009OXl7s_lN9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyNCBTYWx0ZWRfX/pLzPpOW+R3I
 5YmTwKOR7N1wX2Sm9mmkWBnlH36n3Rd7Ri7l6ZxgZPNKni2fcM6Heg1RX5H2OLdIkCrB3t53nZz
 gpPsDdzzKkPtA7uLn4rdYG0shSxYiyiVtW2qJJQ8kCy/S9RsTmTterRllBVYzzmCnkygyCtpOkP
 xfFXOL+RVFZWoRVxLZLEUTVEf2wlF3mssZssrufzJKn03t7vzZyttGFK/n9Rpan+wi8kXWYLgNJ
 s1B1Z3MFbxNLCAuk6UNEdcAgG7E4V1YrYGv+iz6nGrdWljOfxDZfqT8a3e3EVbX3dWOkpnkYkls
 ceddpYPxfeGp/wSlWgXW7uBXtW5vGn5/ovL4m3ZiSR2E3UjyUtSAodikO/Pcv6qjIBQADVeeUn6
 UP0owMxEYYB+UfhDu9K7iOP67WKtY6Ij7qUT0zLyxQX/CaCV/2P8WRt83WcdhZFjctXQr8ri
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=681a0660 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ApOX_RYdNeUh17kXzE8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: YFAvTVYfCsPR4qFIjFy009OXl7s_lN9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060124

From: Dmitry Baryshkov <lumag@kernel.org>

Follow the changes in the commit a2649952f66e ("drm/msm/dpu: remove
DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0") and remove
DPU_CTL_SPLIT_DISPLAY from the CTL blocks on the SAR2130P platform.
Single CTL is used for all interfaces used by a single path

Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 22dd16c6e210e9520ecb7a851bee402032fa1ee2..5667d055fbd1d8125c3231302daa3e05de5944c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sar2130p_mdp = {
 	},
 };
 
-/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sar2130p_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SM8550_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SM8550_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,

---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250506-dpu-sar2130p-no-split-display-442eb0b85165

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

