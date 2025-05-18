Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15FC21B1AC
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565743; cv=none; b=Xn4XeUICq2NaN03ea+ko5Pcm10fa52k4T8MSVEx07tES3g4ZSUmKmvSHS2V6ATQkWKEOHMhlonClulAYA3IaNhsw+88U/buuxMvGBj87mzJvqvyFW1N6oIJH4kqpApF3HJ6N1zVIHuJxnM4YRQwBRQ0+qnp2JUgZ3U56+bp/Drs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565743; c=relaxed/simple;
	bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ksr55iUmzNIxmrQjTxRi2H/2wUwac489I/ZsEMiNkt1diQolxwStYMysvCtcFmFTb1V8GNGbV1juDDN8Ig9+U48lwmOT7OnqrEeIXm077X6QSs9t58DozBYxoTB9vsxTFZfAQcVEqRgWpk3JY3HJDoYukumm8Cb1bthKgwKZw/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyDajpKg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyDajpKg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6JIxg004819
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=; b=LyDajpKgC2KGmovE
	vD7CLfxSD7e8whb0GX0P0hzQu/8Es0WBZLLBXLJBiPExzrBXmIeRpZ9X2f9c9Xen
	h0N9gyFAdSAVd1XQ/y5jGVyJpcwpx03F0TY78ah5X7hpvVW6+6EdECqu4/jWyRqC
	GWAC7ByQsojnNep9EWlG55tQXT5MR3F1KzS7ds39eSsqtfVtbqautVWFp6tdYq3X
	0OUkkJ1uensk/+H67jRTrbz1u/JyHtIzZeYnrXqfyrvOyZARxoIJ0xDreIKuPUWe
	vdPmTZH2nTt5wxOtGf3xJHLPZi7X07LwdgaCrDHpygANF2YTv/pbGczhRNH7R4j5
	jbKvig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pk7g1tvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:55:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso37044406d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565740; x=1748170540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RmOWcHlDb4JuPwd3mnRIUzvSzQKCWsI013jegbEojQ=;
        b=DpZZNenowNuIMh6ATwlZRy9eVGS8itapriajQZNSpWkdobiOoAHUBbwHn1AlCxcaur
         aiSYPx5vTp/Z0PcjXB9anrpsW4vXa4QeZO9G6/eMMK3LdU+aiYnbVOrq18yWLeVhI5qA
         5zkJs67qVPURcQiJATpLudM/lzrrHtjC5yqJyE75oIz5x6ODz1rhWyqRJ7sQwT9sftB4
         WnDDejBxnSHI/Pwek39Q+uVxlEr+YyQ0HhwmhsMTYXlmzsJwI6ASyZtE6T3aKwKllIeh
         7uBd+5jTUYF9ni3G5giy4FuacUHTK6JauIpFFlDT6LIPdSO3GqJIC1yOa8rR2voONxE1
         lOTg==
X-Forwarded-Encrypted: i=1; AJvYcCU5M+XAl3/TuNuf3pRFAWo8YbGlK8eojiMBBUtXnT8zz5aYi75mUabRzdoa8SnqU5rUMj9C2S1fPT96jJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkwCrXkTGu84QH/I6KXrPgXLyG9zvD51tZPJpR5tW0pZielj0+
	sjEsjEon/SZ+eXxIFWOVRsOqOnq51xIsj3eDlJLn6XrxL/JUaeMtHsYqC0zQ+mMwSaJ53FzNSPE
	X4M0W/7Lw48RbA6vwDG4urMiXKZ64jPmNy+Nym0bixyU1wj4SiGJUaxiUWFooiIM03oI=
X-Gm-Gg: ASbGncvsG3Tme+Xf0kL6zoKSrm/TFbJhN0DCE5Di5MCJ2t1aHHp85tw3q8YQsPKbY6C
	vHM8nMjvgZ/dd0iY95p7fpERF4GMiCTkbIy2kBX5vd9nzGjEEJ26pZuDNsd9hYP/szHcVzf3swp
	ZlGGjyfTlZGCKudObFlxZbuWQsK2OKLSlUxzMpJINkw4c0a6aQi0RZTuJWEZcpAW4+GLhql1kg9
	uCiP8/JJbu1AfPnUa+P/T38hJy2eZYaMbpSGRy7P1A7BU3HwJDULfPB3l03xKXZICBHUkjXH1sx
	ZfS/agHcE5rY9s9jJqT6xNzYyXiD7Bvpz6NyECoYhgDE7WcR//udlx4RBqZlsiI2FxvwbJh37wM
	ZGuDyTwFd/BLK4NHsI0ZovMEw
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id 6a1803df08f44-6f8bfbf5e85mr94273776d6.5.1747565739716;
        Sun, 18 May 2025 03:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1sFBZ0jpOcZcVNQk92qKH1hJy1f0oX5GkS+yyQeLR6D/tyQ+iWs0QRbfpQspVibue1vU6kw==
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id 6a1803df08f44-6f8bfbf5e85mr94273536d6.5.1747565739402;
        Sun, 18 May 2025 03:55:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:55:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:25 +0300
Subject: [PATCH v3 07/11] drm/msm: bail out late_init_minor() if it is not
 a GPU device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-7-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4jhdmFiEq7O5wiS7dzxOzMOcZAnlZvPI9pm8jbvDrqs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyaqbU3hdPDIhnaYG5VTR+PRu1+nwwWz4ZU+
 2SgY3BT/7yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1YjZB/wNZChpdTIpEJDDI5eGygeNTAmk9GYiIm3LbhSUdeXnfVFWyY0oiedFTFaGYtFU9So+yFw
 J0Ln9HLeBPSUgM4L7/c70Ly11D5Lb5uL0KOaXYgCrOpx1aDEaiselsy8C/gfSFujH6JKBFy7t7p
 S2a9n0gVcgka4S48jKzL214ip8nDJUtKDsnexIq6auUbfcSBbX0pZZHaPVqCYfEjVzWqwovVMey
 KAeqVtA8uiDJ+fNPematZ+ZEkYr/khR0KH4vD3cJmNh9nsILgXXOqxrgVVsMMQr/lKbjB4ShE8G
 kF0EYI/5S8T1I1C8LDKjsq+MNnXAFBhmMw6wEyz8gzpLkzpP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: t5izzjkQwoGxNkR3tLQreZV4kLKSG5j2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfXyFHSiqp2q0OZ
 wsfM97LKaB79M7/VOulboEXqqIZb8LW/KtTWauAT2y8yDdaWdmyRx8lpwE7ycsx+/vTnBt7HU+K
 td9pC4McN1FgXwpriYV+wgXZ+rnckA4e+v1+cZLj7gXQD7J6NiOrQ0r7r6Nhef1n7EQkW0jkleh
 FfF6ib2YrkuCGH3Q8DgvN5Ssyz+ylT8VI8B/Z37eKHXw5K8j5lixZ/8O4+A5yomd7C9ZM6hq1ze
 FQi8hGuBs43LfXZ5dJiHgcGewBPT6f+JL9UNbRZAepF5TzKBdI9XtW340Ab9mz1JRAsQpbvNqfM
 zvJtbmJ8C3oVuNh+ePdzhkXaj7uAgb1p5QP0sy3J2uretdGQv3C4HTZbNw+3K6ocp1ENPFgVapt
 p994frDdUW0GRDWCSH7pp/7zFQ8PhUVNKnBcxOhL0WIaaMyqH/l5Ggi6NfUo6jkSuJFHEHxj
X-Authority-Analysis: v=2.4 cv=CKkqXQrD c=1 sm=1 tr=0 ts=6829bcad cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=blY4ScjC_F2vtqdRJt8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: t5izzjkQwoGxNkR3tLQreZV4kLKSG5j2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 2b12f2851fadbc3c924827e11570352736869614..6e60a74b13d72c47e45cb9dc65ed67b977e900fa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -296,11 +296,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
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

