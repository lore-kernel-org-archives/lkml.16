Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E5B1F4285
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375235; cv=none; b=NACxbA/nAmQnLsYqIRJyplnB66ld9dhjXdABVn7BGL3PSxouUgGQwIUAcin7A9ytcBS8RLGdY/0Q+uGi5KmTE8JplSH54OxjRIHjkx5FySGh8JPJeU0dy++ufJuRUDgZW/OGZb/moj9Q/fUtLCeO7z0XivtBo39QWycFEtGrwq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375235; c=relaxed/simple;
	bh=/ICdIgsZCLiFOWiy0bHvTki2ux4cADLvJoe0Rkr+3xQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D2Clw6Y/eQjioDtgk+3Xmy9ElvgPbsG8rB+DrYEreTxsxXMTt+Y9+mrl2Ldd6RlBJOIyNRxKgKt+G7uUuI3O4RsjCuFEC33hKjRlK9CGdz/AoSvpH3aJ/3QysvIOPd3O/IPu2qMJ9ubusv7A1NNbRKcuJ3lF6nWe+Nu7RscuGhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmONVYak; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmONVYak"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Cv4nI003096
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=; b=LmONVYakU5On4YwI
	K/8SSCmnVuzn/lniEHJYfUvHN9yi7Hv/m5ZrRAWFUvuTzsOu4t1tAMHV3FFr6S1e
	eHWiRmzvejKhLSbegOD44sOeuYQzobaJxlzvogIsc7CDV06demUwO+vAYM0QX/xQ
	J9pynUphAJHcMgpFLqTRAbB7YiyftEV9/z1nUGmx2zzOhMvDDgg2f1YUwMIH58uL
	SVWAUjAp2g7k0R6FZxf8aEfTUFAn7aWodRxGl2eq6R02g1gik3lG85ODRG8uY2Pm
	QLBHglAkgLqI8G5j0RkEjq6zOxBsgRKXvCDFVPlX43oTtkS8pjGTaqwMsxXK1Fbb
	V1Zx8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg26sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47ae8b206a4so70681101cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375232; x=1746980032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=;
        b=UWqdFuo5DXYpndgSJT9hh3YLPNSNLWSzMfUpJMmj1Rk0BWmoI7BRBRtrlQY3ShQcwc
         7vBNmw36QNQPOk3xdCiXW5lIO7NZI1kHwJY04zLy3Zm/3xKSIiuRgqSQwLeNT1bXjKiu
         /sEChqbZSFgkO+IJYAs18LtEQgNw3S4H6dt6uph4HU8zaAAxpuEwTwIIi67nERGiIP2L
         TCWW3tVX/1CTJox/hCuZZICIhahMmF+6EItiIO2rgvzsXVleuwwxLolUq+DrIvI36nGw
         qS8JcXHY/2SfeACI04fIkqIGPloG0trD4NkFGx4rWnciqt6cXi9LOt+cnipsXHvEyFoU
         j/BA==
X-Forwarded-Encrypted: i=1; AJvYcCXppdqxCWHuRdTKZ3frAyPib+T1BtpdEn9Pp/aDmbJbjW6se4v8EpN2/DUboN+OEt+8iecXTg/n8FAeUF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWV3UFThtsPfhQP2jjpBz3DI0tkYoIh7a7Y1IC2PnY8GTZ6EPj
	rKgPWtEcbjdCBsq/Iqt76DRC9FUV3lcjFjMurjvt2yPhpaSZdHlqKYR+6+/VZvzuuZOZh9H34P8
	3kbwVPD9Hrr4zTP4AK1BBQcxbDkc7TLntQJrXF65dOyhIsU+RQSxOaC0HfU8MRa8=
X-Gm-Gg: ASbGncu0MBVzre4IGYATvkoO0Yof9v1LE0Y+d5ba0st9ZgmPtvusumxsmErwrn1HUS3
	NPPOFutnuZ9rOkTFmPurGckTbfUnn4T4TV5iEk+etIKDtRoMP5XdFjLsqCeihIRRp/7gyDTGvkg
	zdp551r738PjVO68m9HW6eFxlUCqu4aCtv2g43+TxswpBglbvUY1VpqyRK9SgTcZx2LetIxgpTa
	V+6l0S20yOwRmkVLpnBIRdsEDCYZM2MzCHzQZm5eBMkMtS6XBABXLM8CKTXGJVTyoBOEJnR08JU
	UzsVSKYFOZikcC0NyIGDkGKG04NxRsEjZkszwya3B14jzlb5ocT2/vqr1uyx5UdeDeSXxFl8zKO
	l4qn/oEhQ/9l0OQ+I6h9s/AYi
X-Received: by 2002:a05:622a:156:b0:478:f747:1b7d with SMTP id d75a77b69052e-48dff3e0b0bmr64028291cf.6.1746375232026;
        Sun, 04 May 2025 09:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXgRrtx6olNcggB+aVm/YJLIey1orBelxtWUEM4zIRqs1O2BkE2g6RkrgIdsjcqv5AsaJvNQ==
X-Received: by 2002:a05:622a:156:b0:478:f747:1b7d with SMTP id d75a77b69052e-48dff3e0b0bmr64028011cf.6.1746375231753;
        Sun, 04 May 2025 09:13:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0 platforms
Date: Sun,  4 May 2025 19:13:29 +0300
Message-Id: <174637445763.1385605.3424290525961139531.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NAGJcritRsUdKtzT7I-dT5ET-xqQvKq8
X-Proofpoint-ORIG-GUID: NAGJcritRsUdKtzT7I-dT5ET-xqQvKq8
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=68179240 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=eF9K9vx12itGwMwpEy0A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX1MsYie4m4CLm
 AcWat7ona+jDmm6LSWNBG3MXI47olKIbFXr1T0vkAg7s7jaFlBt+Y3F/YqcqyARnCuSXuKIp3Tq
 OZC0rS/fbfOiqjW9ETlpUK06Ojqmnwx+kWWkskRuZb9llATBhBLiAO6LA80TboMywxNUsIblfAz
 W39DT4NywlG9lRssgk3doJrSiqwsNcOT3G61ltzuBK6TKWxht8CDhZB8WldiEfPk8z4N9/LgB2a
 OnRKRYFewDLoJ/FwKRdbhLilFJiYfM0I5F5xXg2a8IFwkzsyXd6hUu9JbtgUGwmC5gb17bYJ4aP
 cfrTnUfTivwlAthJFcDywgl2rw811m/aRe3BrulrOCrG7njg0d9jZA8PZthzPzda/kvX3ShK5KG
 Ai7BSQ6DaXGegzVS8LIs8dYcYrwTXwhPnDO7Z2xECJa3XQ2VARuwRjgxHmJ4boQPqcMJlpTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=766 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Fri, 07 Mar 2025 08:24:48 +0200, Dmitry Baryshkov wrote:
> Since version 5.0 the DPU got an improved way of handling multi-output
> configurations. It is now possible to program all pending changes
> through a single CTL and flush everything at the same time.
> 
> Implement corresponding changes in the DPU driver.
> 
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ef595c04e843
[2/8] drm/msm/dpu: program master INTF value
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a013b60cf44
[3/8] drm/msm/dpu: pass master interface to CTL configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/696707d3d22c
[4/8] drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/df99bdfcb2d5
[5/8] drm/msm/dpu: don't select single flush for active CTL blocks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e93eee524bb7
[6/8] drm/msm/dpu: allocate single CTL for DPU >= 5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c1824a7992da
[7/8] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a2649952f66e
[8/8] drm/msm/dpu: drop now-unused condition for has_legacy_ctls
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1fb28a8a984e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
