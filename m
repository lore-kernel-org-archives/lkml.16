Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB6D242D9B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574727; cv=none; b=f/G5vodxBIGw09Uq/RfznT7bPF3ZifgkU6neA8iDvxmWn68tSU3uUaWYcY3YDJZQnjUUrFZ3aYFgEd5jMPVxOx49H/EXZYAuiRe4mOtskbBnUQICvfQWk+c7XWpigM3+T4gJhKzPFDtqhdp3ZvyQVFj4jLdkwjO4qJQwwvcQU7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574727; c=relaxed/simple;
	bh=QKNaVn6QCseVUR4BUepdIAxDPpNjR38Pq6lvhCZCros=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kv+80tTpPNo8NKIlX1Oegkr3tJDBLUp1G/bxmGQnZ9qWHltVaw1XJJ/b/dQIwO8oh9jJcWOC9wo7eTMu4iFiR0xe3q6ZtMsNLZu7LcbQe5/9lTurzOTqK7XQSto3YrwIUuw6XEkJ2bWe7FH4yojiaFQqkMPGE5KLANRAYLfXK7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCHfUH2e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCHfUH2e"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TQah025257
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZfczLUxnWTdMqDmkRvetbnLGF6+K+kBxElbD/jIQGQ=; b=mCHfUH2eedgMf8ua
	ulLCCbT8l+iO9zEcYHxVfAEbKNLEPjskH6QYR4aFYBOmJXnpSM03V2bXh/F/drKQ
	4cVAJv8UBOyV0M3gOz2X9rGsOD5iIk6ASu/EMV0ASJHRuaV7azWaakkhKWt8P2lu
	jVl5mCOHytZiKDKP6xtUHuYCReLv1ihhWOAE2jjARbQOkPpNca5xqI/1vsDBgsi+
	1bnaxGr+CEn0H5uTpuS1Tp0v6IICM7smLCuzmSnISk383jrM7R6+fZEfvmV+gnoa
	ES3SH7dV2FBN9zonP10IKL7rv8Hcwf4jhzzm349/LSj46EfuYozOQyeye9dy4Er7
	aoPQ3Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3rg27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:52:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a3ff7e81so361324385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:52:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574723; x=1746179523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZfczLUxnWTdMqDmkRvetbnLGF6+K+kBxElbD/jIQGQ=;
        b=RMDLuL1kWqrb8t22sjXKTbScV4DSA6S6fo/oxMQNb/7rw9vwdufGAaawsVKrZdlqEf
         HlbBuVv5lvEZ9gpGDvtJqW0rQzvjm7x2uxv+pUqK6UVV85YOPoCyHHZcAJ1CA2A4SBdY
         0Iqq1jUfB7Dovd8pGSuKOclERe7MV1S6Tkzs8pVaLm1bmgYf0mhiYqY9xlYPD2nv/tLU
         xEpcMWeG9za4RienTq/o0bt7RXCmpNe4YSr/JLys5jfheKt9AqFBIdX4wcwNpZMAfde9
         NPZEAEgPfnoHbBCC3+h5acLtnvMm00+D0l+XQkJf33tZzgTnTbsQXJ5QH8GhbRwfdANr
         JoRg==
X-Forwarded-Encrypted: i=1; AJvYcCXXfMN1/QpBML1VLrBymCNp7Ic6oX4Pqka0agP52/NCle0vkWsYIeOZvRXF+cNz1BOkW6qA5psd6Sc60Jo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNEM7RnRj1b/3eokoG6b/QdtFNUirIpgxtsRNV8a0/TeoNqAcM
	17ckugQgwrb1xpLgKZGJLcwuErXsHDkXeP9XYPDvG4TcHLQVHCc6EBkAxqzqXAclOhL7buaIqQF
	PPlO5DRDoglZk8j8506xQNOlZ+KU/cekD92npD+gjoI/CqokN9aeNTdSs3sETBD4=
X-Gm-Gg: ASbGncsRKvnmUoJIiL2fXgDw6lvlO2jz0rPXsEy2WQUY6wEoVembla6CoF4epjoLj6L
	hilerFXH4SMVRmPMAzwahqtydEMn3gLrYWpNHp3qEV/ywFurPg3dXVEWTR55huxWRfYziPL7zyd
	c2W/0HJaaBXMEJI7OsPX1UQMnzE542c5pJclE09mhhsohkYs+Zj5kI92uGk2o24z1nQ/4P0gXKE
	V28wQ9yDKIlyU8IPnlsJTxVszPHtq+MH5vLmQ9kiH4hsiASXn2nDpswDzxEDOfig0r4oV4LVzN2
	WArWExal5tcd6vVbrMvjBVEZMIjvCqCK4K8wp6zuNvgtVOOMpw85bnKduBo285wN9ic3LWiv2DH
	ZYpMA1S03ODRILm9f1gU2sVOV
X-Received: by 2002:a05:620a:40c4:b0:7c5:53ab:a745 with SMTP id af79cd13be357-7c9607a9524mr306225785a.36.1745574723406;
        Fri, 25 Apr 2025 02:52:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcOR5RT8Ys3lrOEeDC6ELuWjVuKpQ4U7qX2eJ0JrlAWEm5qUDXGcz5n45dHFY2oJeOok/1nw==
X-Received: by 2002:a05:620a:40c4:b0:7c5:53ab:a745 with SMTP id af79cd13be357-7c9607a9524mr306222285a.36.1745574723063;
        Fri, 25 Apr 2025 02:52:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:52:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:54 +0300
Subject: [PATCH v4 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-4-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1330;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5QLeLaZ4u0g3jUxOIWPZIeS25ToIY4u/0NRZi3Wj6kk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5iD+ue7B/ncg0smiCdmNNJbzhQ7e2zXxwh
 CKQDUKIPP+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1cVsB/952BXavkqHOo9fTgYGdajfI8ZXs/aaV7h12vKdVkwrLrXZPXL9YdKOWBEsnBCViNDKJz1
 Sirzb/XOt5rdGdbbG9Jrkkkl3EHLgHvvpAIuJFeOjVv28YnIr0Ik7nKELJLcU8pxyNLsIsSvHQC
 cXg9YZFkfWhqvC6M/UNgNqLj1hmh3Iy8qx6I4osKefG/0EhTWPYMk1/K/Hfff00JHQ9PNlExzay
 1poSB6PmItQqmNE+OcyvBHWJQRi6YyL4gps1DDO4CstG++o/Rk3da71KT5wnhpdKvpLd5W3Zbig
 pZ739t9ddffJrjlDV923QPmg3hLU/Ov+JyVSbN091wfkTz+9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: MBvAAePx7b6R2XAEyCGx0csJcAgrrGYf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX+xLvNttWNzB8 FKbFoE5atPnvdPacznFPLaH5AjANQD5E2+SCtkLBylXg1dSXfZoJn5tEBYoczVqDi8CYO/LgKyS 3P4dTtpQ4VLVrd32xWeUkspqqv9nhj/fN548wbh2XoG1RTykNGVm4xbxBtaeY5n4cxo/b0tXj3E
 6RiYS7Q9XPh53LF5qsEgnQEkhs0wIIeK2rPL9RK4I69zDZVdI+X2ZcSB90qWD40Kx/R+dJeoOay xVdo5CwzIkmepw49vnEt8pul9i1fNIhZr1+n1AabuWyJUORQ7KHas5jBAelnCuJe90c4kKkIZdu 6meICFYkyA131GSQFsWG3XSadmOra5lQiHE9glVZ7J6LAYwbzEBDO4J7vl96/7KnrBk0D72Y0eD
 fTrzxcLXUvySMP/tdxPVzOWu9s73uSEYQ2EnRNHw0DEGeBuL4sP7K/ZntMqNI8fzUH2ijv1X
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680b5b44 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9KfIv9cJTkqftt8VF2oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: MBvAAePx7b6R2XAEyCGx0csJcAgrrGYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=917 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Instead of using .parent_names, use .parent_data, which binds parent
clocks by using relative names specified in DT in addition to using global
system clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index df2bbd475cc2a11da20ac07be8e757527ef41ae8..fa2c294705105f5facbf7087a9d646f710c4a7fe 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -122,14 +122,14 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 
-static const char *mpd4_lvds_pll_parents[] = {
-	"pxo",
+static const struct clk_parent_data mpd4_lvds_pll_parents[] = {
+	{ .fw_name = "pxo", .name = "pxo", },
 };
 
 static struct clk_init_data pll_init = {
 	.name = "mpd4_lvds_pll",
 	.ops = &mpd4_lvds_pll_ops,
-	.parent_names = mpd4_lvds_pll_parents,
+	.parent_data = mpd4_lvds_pll_parents,
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 

-- 
2.39.5

