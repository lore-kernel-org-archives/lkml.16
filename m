Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D164243370
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487083; cv=none; b=n88i6h+hB5IgY/GezBBxCS9En0nJysXze76CsZhAbKB2xjGX1e9a/mVE8JVJ7tSYg2bGZui+0kKXM6movOOTG5HQKfQ2rLJm9VAxRksllj+L6qcPeA9utgGBABISlMahJP0/QkHBI7RdO8DqUzQy7uOljWZIXxtmJBwu6poB0JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487083; c=relaxed/simple;
	bh=EOew3V4JYVhVMdQInPFFVrZz3IRvBkcsmIxIux5GuyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nV+MBL2DYPsExjgCodVNWsaMxVwAUr6SkTj5dDqGBSWhxxtr1DZ0zKq0l1lYofbhoRG7Yh0zgrfjOdW+glMsXmvrfTJVBRAArpt/OC257VTsEB5clisAS7DSDeVwOnwCxk+ePZKufhuT54oh/E5mJbvZupuEKYi3BTqbgXkvL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaVLz3H9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaVLz3H9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F96w031009
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iadpP33b3pKWja89qUIoquaVWcv2b3FF6P2FfM+kWzc=; b=SaVLz3H9YNZvZQHP
	dxxMBesa2pjVqluPd4V2R8eEjYELRIYPftpyCOxCiBKa149pBlhdYemtu3AXr+7B
	C3YRJoMNaPYngcfXdxRwsxbfF5Az7io+LthliGnQdLfaGN6Nr/St2IYj4J+QA2yO
	wdEU3vBX5D8opv5Vsbir6clATT+3MdTj5I8WmRTxEayOSyhFhC38tmMf0bEjlrSY
	h4k6OtS+w26jNQWTa3HDilvu2iUSDtga7pupp4cn+eUQGGYr8KTjV3YfV5eGCZop
	nj3jrFgXqBM/J0HpfiNRWvGzMjyFbRuTU2mxDeDT+exVADx1vphMulwjXlZ/+xiB
	i7uapQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5d03j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:31:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5b9333642so105316785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487079; x=1746091879;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iadpP33b3pKWja89qUIoquaVWcv2b3FF6P2FfM+kWzc=;
        b=EQExORaotVGmAIGW9ngbMi+bwNISzWvQ2JSg33DQ8h/EWL+Bmt9AfhGblSlCD2RATL
         EzXmB1+i9UD0zhhC0IYuNP786xUkghwKibP/fxCI0TkG5v1doLtZgfjhIIRa6oND9aCG
         QRtoPVZf8zRdcFakxj9yzhO2Qs6ngHvHxM42pZU6BKXxItmSKUnEsdbeUKCLJDzkzkWK
         PAH+gBspj66Ua/xkiHccqaWCJmxiCiB0DDkRNfmA218zv0jHwAu20muIKo1wQTvSxBpf
         6+VxWNk4DXI5FWJYUU1VmRQceryWdxIS3fyVtcUrMBqOj6uvMY3gTAgwyTkg2gmMxP1z
         wa3w==
X-Forwarded-Encrypted: i=1; AJvYcCVUFXRKt5rxOspX8WJHULVaIJYnFhNNhzgrgTD9XFedw3X5SPGr/HHDDciZkxHirBotolwLb24ZnBzIz5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSM2/hrmMujC49JXIBUcWDINcq5qauALOn5P7W/0IzSuYRF9jU
	jTpHTInincVYTLrIoXFptpWowZWhxeSLAZMhxjUyC8nAAI4uM/ylfbBogNz7zUZrgldIA9x1Oox
	7FbfKuxnjuwSO+n0uKkXbjzMZ780NNZ9tnLV+4xEj4RiZUoP0MDoyDzDXNm/x+63LqvfENc0=
X-Gm-Gg: ASbGncsIY8/6TfSLjNCeaqYSlzV+ehf5oAfL/DZYiSkASV1uaWoXwEyBPWC/P9d6Url
	nNSMCn7fzVYBCDygRJOe+KyW9qJ/S3LoipHX3AnM/WGW35BlC/E82SqEg/lAzfIeh5+Tb4/mr5n
	mAELlPPzDkZZPtE+tlaRRvfXn0BebRPPKBQNM/Rx08K5H11ipX+74oWwbPLWLg1LuXTV734GwhS
	9DDMkRabhtkPeGurqe2NiwR08Icqy0Ls90TcYimF9B0l7tWQcOIlUtknT+WgHmsc3LiOF/7k3E0
	zwaDUH1onepzw+iuZaSnLh68sWrXtpA/lFvCF6lDnNljlVfIa1mb3VQWUfEOacAj/lsOFVsKQKT
	1MD/Dn8biEc//TF4F7mFo46o5
X-Received: by 2002:a05:620a:4496:b0:7c0:9f12:2b7e with SMTP id af79cd13be357-7c956e7db71mr265476885a.11.1745487079437;
        Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA8sHYulZcantfqMVMskWIoIphoholS9WfHpqT1Qyz8n0LX/T8AiyVMCBqc1zdHp5HweR7KQ==
X-Received: by 2002:a05:620a:4496:b0:7c0:9f12:2b7e with SMTP id af79cd13be357-7c956e7db71mr265474285a.11.1745487079073;
        Thu, 24 Apr 2025 02:31:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:31:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:33 +0300
Subject: [PATCH v3 29/33] drm/msm/dpu: drop ununused MIXER features
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-29-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oq1wDHFI9F1rM8Vg4jlGeQy7++4ktlgP1SkYjPIrj9c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSw1nFfmM68OEYBTdCxJ48gqfCba+CQGJERe
 /OMrX4eE3eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEsAAKCRCLPIo+Aiko
 1QLQB/sFaBLqJ+zpLBU3UkfkDppxLIHVuMH7MRE1x9FVYciK570/QBvg+qkCHb5d8MQ5rBkvz9T
 NGEkbP/z75m75O30kd251apwYzRvSGC4lRmvstIkd7NXUueWRyoEtATP5cD4spbU2D8azGVV3sg
 YbRb1MwgW/n5tJ9gnbyl8BIYBFnzkQFnkTUmS7XnXUdWIkv7YD0tLbI8Nr2KzUl4jRLwl295K9Z
 FRd4UvPkKhmOozWy0m6ecvUa6RLApgHXBPmT+qLPcOx6/lHiNESr36Sd7tZM5/2jbB+e9EvQU3y
 S2Yvq8oTs4fl2WbD9d7gyPMXyr6Iv8sj01NBkAdHwIcPaKr4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX4lE/q3Srpy3w nxHPmOIWhkS46zqZCu4SJYE/ifit2mk6VQ6DpfqKb9XMZ/XKKw1vLVWXffGvr6QjrzfZwrMtUi5 wXwKd6AGjdHB+1Y4+p+EYCgfBFNE4/VS2b2/rpLV6suPVWC0/aI8kbUKIPoS6jEN/tkpO68h2to
 J2gJyFzYaMXqdRWdpY6o6cAcxC40fSTQzPLqBS1QE4XsCxlokuNHo5L1r8t9785Rslb9Gbl7C/E 00uUbN7BhqOynYNGMHZk3nfGDxXUY/FgypnQ0QKn/duzvaNYjgemw8mLhCFFGGR6Tpx/M057A8B 9p7bXKvRPA1c3WDLjOgvk5N1/e8KCpIAMF2dsDx9EigFS3y1Qg1hh9XoV/cVeDxLgNIY6Ln7Uw4
 5xdQITWlDsPlPaFOfNwiRF5elqeA296X4CvYO+0Cd0AYIuLB3hFpN43E/mwDEvgqiVV1ym/n
X-Proofpoint-GUID: XYb9k2hGbRwfNVVgfGmWDrHgROKurKXK
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a04e8 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=87smWpNc5u_ETeg062IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XYb9k2hGbRwfNVVgfGmWDrHgROKurKXK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=919
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 5eeb693f0e282da2aa0e5a729aed1bc8573639dd..beffb92adf5d8a150e049811bf2caa212dace1a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

