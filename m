Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5671946AA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825715; cv=none; b=mNAm0I4Qpg1Dhod8xA9eZRIjrVAuFDhnH5Z70SjIpGZtByTbZCt1kyyLM/JRXurtNk6bMgVL2AkRh06eW3KTRm0aRXimSmubp3wjIZVi1+73muleY7hw64evcB4Zsj8P8XDeNhABsoD1fSJww3r0I1ge1kxSOCB1R4Sinpb4s7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825715; c=relaxed/simple;
	bh=xR59NA9k6u+fku9xip3VLu0AuEwpmUQHbSWP6W9jjqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJPLIhqvAeoRJfpcdVabrue2/ph/gakEYn6OVOT9GGIKq42Rm75AMpQ99yb8Ov2xfFlQX/fiOzfkKKYw77raJm7lvWbJkGVpfwoUq0TOtv6G44Ir3K5c/llEsoRWO9DiFCQFIxrTPEiMJwjddtURk+nYtno+dOvPwkjRenh487s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pay6qyGV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pay6qyGV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCjS8g003834
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=f8LvzWRSramzprfrBFvO2s+C1Hm+tEbtLlK
	RSfKO3eY=; b=pay6qyGVBWCIHRDWXvnRM8KGHFLmvqXlScGFJW1m0kP6ycHs2uS
	12j1vP2HUfI22Sr7degxe/C8v4R6fxxYhLv57pLOoCbayh9KEayLx7+NK7O6hgL9
	GH+9vx7+SGAgNh/saaT/p5Mp/MKWG+EyfGDn420awxfDOvJssKc2T8S4x582lllJ
	gq1YxzsYSN/h2RX9lAiWznmrGMSyuzMbADosqAZFJ0+CCue9LRI671oLRcPz7/0n
	EeQHxpoK7V1diHe/VDtMgNat+5fbczjHOaiQZoEU1dGPr0i13bLtFLbYckKQ8Ce3
	XrhamGf/gXNpoNmmdyQ98akCJ6PWmTBC1wQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jbpn8f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:41:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so1571604a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749825711; x=1750430511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8LvzWRSramzprfrBFvO2s+C1Hm+tEbtLlKRSfKO3eY=;
        b=ts3+KLZSla7jtEgwkPaysT3v0+VY+R+kpxNoA8H81lPvp5eRRkVqp1PFw1YuwUlKRA
         Rqt5sbfzp9WetUasUU1Te5+nVoQA6tSWfDUmN7iCtucndfYHw+Bk6PK3f3YutFnOJvt7
         3uPh1xjhgEynHtS2MU9vQgWr49+vOkxnDNfRNDtjzc/FAfczlEkyWjQZyOW1BkQ2qBtK
         8G5NFwhPw2NvzWPdPyzfjdsqetxKv6+JUzINO29Wu0wLeGqjNQW658uY+fLuTt2eCOo0
         jJe9HwSjQQ32dIn72XwjxrVNnjv11O17aZEO706tIxNm/hM+5oClzNEceb6x7W6JT2un
         eYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfy8f9jJhf6k/xI4HgrrWE5qDV8wb0/mbYdQga0mAijW4pWu2kUUAh4dMJhhKPG1Z4rwj2VmMhnh6Nd68=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAImCUG5pfmdBUdXANaINpMjTBknvEz2fnmKdbFzAb4GNDEei9
	1iHAg87CFLIyCsjzBTWnqPpicF2PxpS5hu4U1khKw6OcD4NfpK1amLvHIZisLCRIVIkrRC38/Bs
	pWlb/aNjiPJ7Nae/g6EVRmGlikgec9KyQ06rUvFCDquUt2bdvC59zP7A/L91ElmtUf8rDwKAc2m
	o=
X-Gm-Gg: ASbGncvsZjRx33TO08wgD5Qi5HB3loP/55dfDZLN8g+QcKsMJPjzedfSv8QeEsVh8Fx
	hvbGUiAjFRL6X+aJQK/6jsIoJptEZ/MlLChnfJ9EcG0aNnk5OfjKeDhox0wYFmlcuJ9nP0bQxqq
	wg/8GKUM1oym/FstZSmgDJSAOdvyk6DEYt53uKfNxCY95TORhwUxOpbHPhs97z/acqoSm19PDlK
	qVbjtdPo44UkBSwB+ZETt0HKswfHHK5aQSOvg23gmFoYt6Jc9LnK3wJQ/Dg0vcl/Ds/QHWqPtEB
	Km3n8mYTZnqYHF+51AGQHmivjL/Qww49
X-Received: by 2002:a05:6a20:748c:b0:21f:a883:d1dd with SMTP id adf61e73a8af0-21facbdebf9mr4553245637.14.1749825710759;
        Fri, 13 Jun 2025 07:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7GnAOt+z7rv+BSeU7ZHDxFM735EmwOZ4MxONhEpinIvFL7k6YOrMe2Cgq92R1/zv8XQne8A==
X-Received: by 2002:a05:6a20:748c:b0:21f:a883:d1dd with SMTP id adf61e73a8af0-21facbdebf9mr4553202637.14.1749825710353;
        Fri, 13 Jun 2025 07:41:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c5fsm1775491a12.49.2025.06.13.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:41:50 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix inverted WARN_ON() logic
Date: Fri, 13 Jun 2025 07:41:44 -0700
Message-ID: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: x8HWGARxb57_wJXrziWAXzp7V-3SDDUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfX85CrwCx4pwl1
 lEXK5QfYnCfuiVQ1S3heA+S6qijDrW+31qBuNVHnMgHOkEldsCbQ8Ct47TQajNrAwFdbha7rILi
 07mvmJZvbfxgG/BKOkxK6qTZ9VUvGGqtC6ui6tNwi1X1sBKpEEuzw+RP38wkykWBw9/vXimKv0f
 VPuUQezx3NzMu05xkXaOJCbkpzUXCHw1/yzgDRBKC4nWUACGKEw0SC9v1tcgQV2bSt+tW5Z0TOZ
 iy6lPivYErl7GuLhJxm7nshW9cfJBm5Z49Ip//dtk3k35uEtWAXSlb7xZqAoCfJQ6JU4OQ4vHC7
 aDBGKCV4NOHdzWR+unCrG0VIwB64YT3rJjWBEaXo0Nqak+tUS/r535lOjF40iZ0rGwTjXsHuv6w
 W/dfgYGBAQ26TxSV3B7FgxfDyOzB20ffwGkERLLv3iYYyAZrFFSoiGtG/Td2bqpjtK6ahIhh
X-Proofpoint-ORIG-GUID: x8HWGARxb57_wJXrziWAXzp7V-3SDDUH
X-Authority-Analysis: v=2.4 cv=OLgn3TaB c=1 sm=1 tr=0 ts=684c38b0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=4MAclHcQAAAA:8 a=r-1N9bTl5XODNADl1y4A:9
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22 a=6vtlOZhwcO7ZS_iRoh4Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130106

We want to WARN_ON() if info is NULL.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bind")
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 0d12454b1f2e..5c52d392427f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -217,7 +217,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 
 	info = adreno_info(config.chip_id);
 	/* We shouldn't have gotten this far if we don't recognize the GPU: */
-	if (!WARN_ON(info))
+	if (WARN_ON(!info))
 		return -ENXIO;
 
 	config.info = info;
-- 
2.49.0

