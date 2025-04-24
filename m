Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EAF229B21
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487054; cv=none; b=cL617kI+TyjP7FUKvJYiEzPUKpHg8qlfWs4Xjy6rZ8+5FZ4JnmXW1oYxFV+GzZOQ5rjElVeivGQxNkmzKvah9ixO5+mHUqVPUgOEEAuy7IeX82C/0gUOWuICqNm/CkZprwdUCLH+5m0QnnjsZHHgTqg1XJhJxVW75fHxlnpDhLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487054; c=relaxed/simple;
	bh=FQ2i0vtcNutvW6mILhPnqYVxeeOvmk8EyijG6FMoWqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6zc1RKuLJvk58bungbwvIxmjpI8OuItC5jqYQBESI7S8mgV2ZJBFNE/7btzGH8BX8/+JWDqg4eZ/CRn8QuHiwNn644hbBEXimSgQhVOnoJXQuvfcpJnxazYx72Ieckf9Kb5YrB/08g9mTRlH7GI4czh0d6uOJzheTDCznPUyAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f+fO7SZZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f+fO7SZZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F61P016964
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QywQSn/YHjitxPlBIJbPhSL0qb3ubeGjN/MXA9O/FXo=; b=f+fO7SZZwcAoFk8Z
	46Ye7IAzGepfF1Ak08qs3OKavxtVBCWWRwN8qEoIzEzVOA6aHiit+tUq1ivF/DYu
	aSsvjnBtGBiWH/NN+OSScwKHElr8FKdE3g3c8N2HS4SQN3PhSmh9wmEjPcOBQU71
	bw0APT4Z3gFSdVj0cuN3vSZJn2JtJtAuhdW3x9Z7dLaDXIABvflwyNVv/pBowE2Q
	GzVY1mZBJeFkYAa9dfirKdHr5c7th7leRs+NhW0+mG5yZcCZqdeWRhQ8rKpHtGg/
	IJSmBxCP+2onbgeGVXFRRBpVijUa3lGZts+22beIdnIjQ2JqLG6VR8l/SMtBgVG9
	8bhK0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh14y3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:30:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so229835985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487046; x=1746091846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QywQSn/YHjitxPlBIJbPhSL0qb3ubeGjN/MXA9O/FXo=;
        b=qdjPVePevdK4lpGZRptFZfZksFCSzXP97zi4anOmDe0v4ECwKt0foUAwg3bizhOeW+
         NTSRUn9jZZ71x8GQhgw/fidrfnihc+BVHehLQdqso3g38ynMZkdIMWd61dlrShETbNsD
         skFEiRzk1PSVH0cCPkE0qxM0zKvpDWl996uG41SZgZBOd1Ehm1kE/RuHcxCBgEs97A7e
         rcVtTsnzsewfSDzPNTN0rRR1mwIYMpboTvCGeBBsS2E5jECXvsIrlN1geAP7c7d7t8/c
         R2KvTr4nLgOXThNCRcrfMkhrg4Rw4Ylv0As1716KWUq7WmyPyFIP1jIx6PeLRChJjH7r
         6UTA==
X-Forwarded-Encrypted: i=1; AJvYcCXJFKt0Yw/3REfLbd1PA+bwGCueuU2u1AdtUv2Pv+7/uAej3nAKwVhe2pX/NVNOn8iNAEG8hXzSUYOwP0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwrwt6XAUZwMeDvI9MTFNJ2akwFAmFsS1LE00jKrN6+/bOPBTF
	jfCXSkK2+GssP7VQx4n+k1hFlp85zn6YiPJVuhH7Tb60tfS7/kV+XZGX68/LXn6SSLi/jSgUcib
	37HXh+YgnEr0NXO0IZkwKuIigA9ZhV2MDjDKDEhNcm7/Bhgd35PIqEWprlrs78cw=
X-Gm-Gg: ASbGnctlgAJ8VEtgs2b65Y1386HP8yKzozhudVZp5q5A5g/NYdZzcMYvWCXxJH67utO
	6UxI9ymvn6e6zJfZVo7hk8NwH1lq3GqQiGp0GgUOfI9NlKoQONLWPLRdZNRwEsXHQKdEnP9cLHA
	Es2yaBzS5cIGc5WHwP+XfBUNT5Y9r8Ps9ZuPBUhoW/BxKjuQM7fKqJvWfX/lfTMS+t1EbLdqrXT
	KnRrbvPaG31oATAYIvuu1Gcjp78xmbOiYtTipmvyme+UeSFPYoaoO0WDkNS91k0jleICUsAgJ9Z
	d0cHjpjcpiHmdL0kaOP2B+xgzedG07UOQFLB2Ib4Yj5yIhN1SRQSNZCkYq/gOArCqymSKxXq56j
	TS+QJcAdwjUV3eeLGED7d5UPl
X-Received: by 2002:a05:620a:4248:b0:7c9:1523:3f17 with SMTP id af79cd13be357-7c956f60603mr265149885a.57.1745487046326;
        Thu, 24 Apr 2025 02:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYXB3qqSao1dvcIQQrC/bcdm4MO4pX3tX178JHk99SvJsxRtFn1KxSr1x2fmrSYlsEquMDTA==
X-Received: by 2002:a05:620a:4248:b0:7c9:1523:3f17 with SMTP id af79cd13be357-7c956f60603mr265146385a.57.1745487045996;
        Thu, 24 Apr 2025 02:30:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:17 +0300
Subject: [PATCH v3 13/33] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-13-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2745;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RMvwZw2IoUGRGV6OIhReHxHfhgm4YrJasKj5L020giI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSsrXBB/I40QUDXp7j0Pla/+E9TO3fFw7wQC
 IshmHo6E+eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErAAKCRCLPIo+Aiko
 1eZEB/4sSFKY1+3onz1ptOWEABhrbuoYH6l8WyhMjFTRKQLJEzl5fOI19kQvvs6fi7qA7Kb/fnm
 qPZOLtqlGi4VWE75FAqi7F8ymnxcFWihZvu/rBDjgk/k0t4uIjFjUbmuZa7mkzdAtYHOU/oRQwn
 KBZcHjR3f70lmuLUvW06LbWzVYT+jKk6F/EAKofVdm7DneGFo6Af096FbWsxxCWND+988H+WFIA
 bjNndujTIRnb9qCXz3UlfZgvDsFQrTk39+a7S8+9FMB9kiUmsfsrR7ADczNTl9//KVpI6h4LiIA
 mcIO0FCMKHuUmAZaiVcYlkxIpEyQyL9RzvnTAuyKCcGAllX0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NlYFtRwtinIiyOHnubIJLDxjFSzzmpOp
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a04ca cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=BlGH1-kmwhya4yQ-KWAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NlYFtRwtinIiyOHnubIJLDxjFSzzmpOp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX+63IdY2CGxyI 8Wd+3RnXOofckYISZzHKe+WMmG2o4M3kjq+7oi6gopJHF4ugaMW4mTXroO37B9pNhymuSSKnVT8 HbVzkuw1aqxG6orilnp0AhMwyd1GojdgHGCbvb4s9sMZy+9BcSgVAbm2q01bPfth2Y13Vf/KNLp
 OCThDaULcV6jmZszlLNo5SCg3VC0m+gi3xC827Is2vcODBHRCQiLkzdJZDOiTli88GhqkuNVG0A 2aD3fjRTvNVzSajAy27hfpbPXtTy40u1IVjhG3hLubeEBniVVfdKbTBNW6U7fiacUFgvl7pj3LW n6nNxRtSKGYpKLPMcW2ONAzEowU2gSCbAdZ0X8nj5TRbtRUFjFr7KXZT+SOdH3OJYMNPME5vEYB
 n9Bnlr6RKZcigpp8m9cmIMQe1w3ywYXUFKWDxC7fVA/pSAvHvNW8ptdg1zordFiuTynPtAw3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 22ca093419059600f0ad7e1e7a0a4e443b977860..20f4700ef9969003cfa4728049b9737cb9eb6229 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -112,8 +112,7 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_INTF_STATUS_SUPPORTED))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 27422a5a340b90ee02f36a87cf1bab9d97504c76..36100e21135fba09fcafdd5d36ac919cd17f63c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -145,14 +145,11 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
- *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
-	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
+	if (intf->mdss_ver->core_major_ver >= 5) {
 		/*
 		 * DATA_HCTL_EN controls data timing which can be different from
 		 * video timing. It is recommended to enable it for all cases, except

-- 
2.39.5

