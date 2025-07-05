Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB5628D8D5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709768; cv=none; b=YEectoEZAAoxzit/UHAmuwCtyl1GW5molETZ7hNo34PmzLseMHPhpBDzH/D9DmDBhqL8L1cK9gfJjN0rkvYZZNNRo7dSIBfjSr1HJ5a/iGtNbDKv5D6A1w7hbPadzMcxMcic4TSJ58CwaRlqRqc0z2j14Z1h4kZQbY3EjFmNXKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709768; c=relaxed/simple;
	bh=XIiXgEDZnL8PJ3eQttWZTHEBnVzzyPThCHHyJljuuT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXb714C4Uay2HDqwXDxcbG8jrBoXuoWaIYmsg1Iav+Don+FWgg/WkP0kzQMkb85Ucib+pvcIxioJCzm5NLrPZf0Ha+PGndRumc/i3n4K/u702vPI8DNdmhssBzBoS1Gupa6sUo31Hw+7SRlsVItnm5jwFYv+WKZrcVd4HJis+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAB/CoFL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAB/CoFL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5653Q81Z009042
	for <linux-kernel@vger.kernel.org>; Sat, 5 Jul 2025 10:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	37OUWSNqZZ2CvfYEQI9Vqh76rgWD4hpD+HsIhfaGlGE=; b=YAB/CoFLitVr91q9
	t8gW4MzUUZT3k2pRij3Lq9qx5UiYnbIj4UJaw6WIYyHXEDKzx6O3JLqaHMVkWRBU
	+HLzfsfy6dDeZ0nt06PdXXe/imvprwPusD+bFbmxog1fvjn+uizpU8lCOGalNxGV
	FsA0OA2hFZ/OSWSmliq4pYPc/hbx9trlGfcBTeBNySNI6jFmjLqLexVaIUHu8THm
	HyaDcpR11Y93Fm5TlXMW3CZOq+fqf83WvOC9i4DEH5MXfXBn70A7enUGWgt+1cRF
	ISZm5Ye3ICd0KTByhG1zr+OZ05x0w7d6/Id3BSvYNaR3OU1B5c0Im2jiBOUUfFr4
	h76Rrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4x8k0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 10:02:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f6471cso254108685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 03:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709764; x=1752314564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37OUWSNqZZ2CvfYEQI9Vqh76rgWD4hpD+HsIhfaGlGE=;
        b=arXIkMlLYbX1SNM3lMFw4iHuQ1C6NXoF8JmvXWjjt/yOJpfzH6fIQ1FpkpgH5mC1EU
         kHQkn4STKvW8YGwFTwp+/SbZLv8IjL4EaZqbxfXaSdHR9h19l4s5CGvaORZJ/zRpH+Je
         Aw+USiYSThlXi1Mzo5khx4Z3iyL3RxAm40FwbhvdleiC1MbjbWizmo3rJIE6rnlqjtc+
         pOdPwNftXIWDtlGPERBefttZyAwxkT64JzRefrSD7uSFlpPtaAs6WLlDzOPYdF7oPcBq
         xdu1njCXZLuJGDPT1SFygTWZqsE8YoKg8ZuXw40mCtBJYST2H1sJLmtXJ84W4HZs4606
         wU6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHB4lDfnZdcAp/C2zDfb7xJn7O2eWYk0M9I4/bVeEg26SvmgB8tTLix5UxEgPC5QiS0EJenvqw/T/1qfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbJasjibUIUVXIcnZVw/hvWJ5hCnOg3Fh+gjbDHXuZ+Nq+DlNI
	9ut5AcEefRnTxwaqVVgrGHMVnelnUrXpwu0x6YR7fY9Zngd/ib/175xE0DrAMtIiqSt+PWbgpdG
	iYfHb9GWUuCGT43YrE3gF4FmSIVX0Z2FJQHYFhAABSbCzOhxSuct9BIKTW8Tj8COJG9U=
X-Gm-Gg: ASbGncvwNfC7lC2RFG6xysHOmPXsz798dT0srTkWtHK3N4JYwS7AT1ZOUBKsAfC+ZO/
	EMenWdO3BCysp+jOWeoS/nIH/ikcKNVz+8JAkeg+oRfFHq53mUhrPa8prguPyj4iVUzbEdbeuPf
	N97fAn1BGDVn6+eW6yKXA+n5kXXd7fmNl1LHtHr/gRSM0ivRqsFsp4kHZ34k5Sk7QNVNZJ+RL80
	5RKoQTVwPWlU44xhHK37FcEoYhuzsBm661WXNHmBJMMVi37xzMe+ojBzJeklDTwEh8PZeYO8/aJ
	UqaqL5UAW+/dUduJ+vg0DUFGxuJWOJdnO5bOyysOYtGF9jjfSSlYEOqrXwl35YuhE+IiuoP/LDR
	N9dy1tFDC0l9WzXHyxDmEbr6nCwhpy4YXtYA=
X-Received: by 2002:a05:620a:4102:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d5dcc72969mr801361785a.1.1751709764300;
        Sat, 05 Jul 2025 03:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv0Eym8D05HjojYNYR4SygLziFGdpiDeTDYA8jw7CJMhriZM1hrprzTkNV+yf0mwfM/I4UwQ==
X-Received: by 2002:a05:620a:4102:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d5dcc72969mr801356585a.1.1751709763744;
        Sat, 05 Jul 2025 03:02:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:32 +0300
Subject: [PATCH v4 07/10] drm/msm: bail out late_init_minor() if it is not
 a GPU device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-7-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XIiXgEDZnL8PJ3eQttWZTHEBnVzzyPThCHHyJljuuT4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0Q9gDCPMLzb/Xt1wh4VNbgJjfW1DZ11X0y
 N1t0bQ6E1KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1fiyB/9iqfn2GwxswL1i2AFbwA1sytASAH/5JI9r6acY5FRRYHkGqbSjr2YzJKV/mPLm29gv/bl
 uTx93/t33uoXkKnJ52ekpBCJPFrtT/3I64V2ap2TxBjOil9Nz2yqdeBabjfUB0eYnr7dQNBe6Ob
 39/kUJGf/e8FSOMrJkvOZoO6AePWAO/WCvrz7cr4SdD8mik+rUhlIgLS490RWoJ9wgC2E/p0NI+
 aij9FSpws+I1VLJ6LKEF0V86w2oe6fOW35MoV8j1wgt+D+S+zAbLAvntJsG1vnPdD34F70wb2pf
 z3gC34rrLdTTe4cJPsTBC2ex5t6Z80ecF8l1TV+dWrAanc7H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX6iji2WBCpQWA
 YENhPRdOsha5L2G2H0YfSXvs3e/fkPO1L5QcOmwH/wUNPKTihRTKWcnxeM4wYRo3jdCLG9yNRGE
 c9ywtPl66M+VpVp+J1/fHzjjngTY7d5FQ0jRT30esQq0LUDkjEqCGiKH38tlqpckdKxGMnhuMT5
 iOCi9OfU4wWkSAoVkx1Hv9emZeg4gy/5vUB/nFCJo+upsgmhqDc57XtG8WQyJiu6OqBaQiJXZP9
 KGBT7btcfKZJquKZA194EeFfnZwPTrs4cgvapDB4yWyAZeVKvVCWIk/rnnNrNjkUilxeyjAsFXk
 1lN5lJh2UyqVxJxR332mpdl9Ic2H9XUmddKHDT1J575OoI2sMpm31suYH4uZgfa+J+/+OK8iRwC
 Xwq+l2+kaabLbuJbYIJ2GqQ9LlETWTkLvkP4xdL3mzkxW6zAnk9wgxURA44W0pKvrjeqGpYx
X-Proofpoint-ORIG-GUID: Uo51KsB81GyJGo45qEySgoGIiDwulIn2
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=6868f845 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DPw_qTI9PinaUm3vTuIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Uo51KsB81GyJGo45qEySgoGIiDwulIn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 4680ccf3e72fa5c31afda5665defe71d1f238dac..bbda865addae2e0ef5bb175bec0ed219cd0d9988 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -325,11 +325,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
 		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");

-- 
2.39.5

