Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E970728BAA4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670722; cv=none; b=UANTMhiwOVEC5X5tfALXkwF4P2lCwaCjfmsOi7emcLtAjs1vwsVzS6/DMiZrU1D7cDGCPsYB97npyhlqfrZWeOd+kpmBm09h8zBDrlLeaD9UvYaEW60dlXKeXYMY/3TsGcKOeVed154tJN8XW4usEGx48fYJWXrkfNu1Bmjqjww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670722; c=relaxed/simple;
	bh=5pziOVoh9V3UHx+vXPDurxYvdEul401eWgXDtznSDIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h56RlgFICdH2uwGbs1GuCnh54UPv5dxAro8+4Nh8EaOdBJP38Oqfha/T6KWLBXCJaFjOL5L4JU6zisTaRW5NFjkpnqiFlvL2+wyPMp06dtlbf6LhI84O1G6uQj+hYTDSoYktvr0LuCJTN91yI/HBPsJX8gg+TzUUBHbhe4Z6ISo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cyzd7qcj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cyzd7qcj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9a97B030161
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsIzya/eBNdb4ab4rRxQ1tjNK779o0t+RrG8HSI8IGk=; b=Cyzd7qcj3bgcrrwu
	4s2MoTS3mxa2x+H6h4FLjrzZipzwVYmR5fsiNXpeXR+Joi5fXDCw/eCNFYvH76OB
	TVcQuF7Rd88MTL1WbWgfScFEv6GKk3TSsS0eUCQGu8Og97gEfG/w81dRoJuWbCZh
	RnC88UlWyCJWun+SbKJV0e6I3dD8TCnwkv984XJO/EW3+1JKVnE2D1RnDmpG9HWn
	Am/0zRa/C0/BizI+R6uRl3WOdgMNLE036VErK03wWcTTU+2fa2tpb7Gd19T9AMKA
	qXIcugio6/vgmo0S93t25FU6nq4PfldLTYXMn+1iw1L6CDt2PKC3MM5f1tdBlUC0
	lO6kiA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9vwn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:05:20 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3feb1dce9ceso1985762b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670719; x=1748275519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsIzya/eBNdb4ab4rRxQ1tjNK779o0t+RrG8HSI8IGk=;
        b=O6R2Cme5alQerv15AYFG45uYA2y15K3vhR5e0agMIil0OUffKxagbVPtr4WyQFfzUd
         CEbnV2fjaL3ijtELVBkMUsRtfUGNO6puBjwh5yVVaKePHI8efnRk6EJXJpUfM/C9FzrL
         WmsbmueJwXFpYdgUyAFs45wCCcwS6IyPTLHiUevLeUr5kkT5SyI6MxAkk3ZVTMbReBOT
         jMOVOlRK++6UYC2pxeIdN/JTX5CmJe0yVtARkVvFvRj6sZN9YVNUh4LTav5LxW22lsXZ
         HJW054Haf8/tLBe/vsLcWMY02cxecyHaIXGooCagFikLj/kzhA1qH71nZrgrRsj+WQgs
         aj8g==
X-Forwarded-Encrypted: i=1; AJvYcCU/8ENsZ50tUsGRgJIIbxp0d8u0XkwsXmVAEzTcnaz6NbxsdvqR/+lR6xsbwDtfbAbB2Qekzs86UYkKoMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyqUL6anb90jVZR3U8xx+00MJRVNWQ5TutekFi+uuuVYT6Q7tx
	N5/wTWShRrdwjd+Bd6IRUGp0zqIemfHi/g/EEoQfh5Nj/0e379+Qy8/9Sl8+6xDkuUa/bGKiswY
	1Ebd66A2KggmkFY7hhp/drkf/lqXwf9vurUlBdQ6gdNOlDRCwMlKn8aeEPdVlzGKE9HWwela6dH
	4=
X-Gm-Gg: ASbGncu5/IxYtG80m5wdfhd7Tau11afPkJpPPftUBh8ysvY8Ty/gKbJcHnk6oWoMmiH
	r42jdnqfCsUIe/2rJQWdIubU/b5D+6gOJKuhRLheW05gp3JxrCxZJShLUUUcQOE0oM1a1tUvM//
	+yUVbHKoyDr9l7H0r16aUqbeJK1QPBfhclzVluE9tUH0d3TzttnVRkpKB3f6O/6ElUIscOup04F
	fGbeCFeSpLDiGzxEmHcH2NQcmOWUe3i0qRJOO0m2SgYrSGYiI8m2ZxlgWhC8qY6oW1AfCakAnea
	ovlGF/ZJGHw2VAUMKdM6lZLC4xmdvR0ngZDhxwJ4zxYVnrPqv1Q6vW51QiAWnHXk/kwxq8qDq18
	BeSHscfSAEFWyN2lYagMSJGX7
X-Received: by 2002:a05:6808:1b85:b0:403:476c:ca20 with SMTP id 5614622812f47-404da7e2ec5mr6460938b6e.27.1747670719102;
        Mon, 19 May 2025 09:05:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEub7x1dRS4B9iMXiGcC0JC5HkcwCviFd2xJmrk2MlU11gZcT/P7NCUK/jOPgrySWLHaknKvg==
X-Received: by 2002:a05:6808:1b85:b0:403:476c:ca20 with SMTP id 5614622812f47-404da7e2ec5mr6460906b6e.27.1747670718671;
        Mon, 19 May 2025 09:05:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:05:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:30 +0300
Subject: [PATCH v4 28/30] drm/msm/dpu: drop ununused PINGPONG features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-28-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r4il2Rm+AnjZK+9o9fCaz79Bb9Oko/V7wFb8PYj5DVk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z9OaF65pIo57+EP/tFZFqKgM98HIfjHBP/l
 Fv4ONTZK9yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfQAKCRCLPIo+Aiko
 1UFwB/4+iT5qUqSv0isF16eMN54vlGEEwBvzGcbqpiuVPYA1F8Ki4p37sYwYA5btD4tW7xitVvV
 v2dtRtXN47hslX5mj/aEoRYfO844j+t1+qSKVixvGRvXgVa4KXXEUAcxzdBErFnpcO3F4o2Ninw
 5ciXVnXlnrC46BxCyK0GlRf+Dmda9LNBaDfCuW5lot1pAhFpcftGe9SW7ae+wmwcRqM9baIO6GZ
 v55kvQhLbpS0XdPVSMvfmPbHjkEEVxDkN9xneM5JDfIPDdB1ajUFbAoW6eemA0ndckDho9D7hdX
 fZjU3ru54h974EhEsJP46J+S6eQbD+67N/JFm3UNi6/tmUXm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JOzk9CxA2aaJcHZQvZhrA9E3X5_n-aHh
X-Proofpoint-ORIG-GUID: JOzk9CxA2aaJcHZQvZhrA9E3X5_n-aHh
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b56c0 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UzLktXvLB0hFtr4V4nYA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX2GNqKbH17zfn
 pH7P4lhBLicT+JK5uxfoj7nVA5u0bYQAI+ADOyCPbMNzE7YPBugOAn3DOkNbB8G6alEcqkEpCrI
 /K0ZgRxhXbYA56oTx2zD4VJxV3ssAFBeMQNOH9j9pbg5XYp08npts++3e65815wqLwWb15gSctk
 ynevEOIjauzaJ3JRBvb0wbFJnAqrzAJTb3XiprNJyMH7p9sjFPCn+kUOHB795HafQnGdrX57Hys
 sMJrEhyGOXPbOavtPX8MaRd4a0p8rWeEBGAxAQ9GnWsX4hHjqSzgUcweXW+1+59qI9xmp3+/ve2
 JNyypEFVma0gpAvtvshKB8Oo+mKfKWjZvrh2L5u4iGE6aLHqoXrFJsLByufVbhWbkvK6qC7gTLb
 h2o6Tj2eNaEFVh+KWp8yDKYc6hihtyaIj/4Uglj4/HYzx7Xy2ubLx/AIKfU5Gav7X1beU1+F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=808 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

All existing PINGPONG feature bits are completely unused. Drop them from
the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9658561c4cb653ca86094d67f7b5dc92d36d38cd..c1488a2c160b0e2ab08243a6e2bd099329ae759b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,18 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_SPLIT = 0x1,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5

