Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621A71DE4CA
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375218; cv=none; b=C6jdTxRFTXqval536g7zGWPrF6O17Q8y+5nK3R+CK13cFHEygKPUzPO6LeVWpRyDpzcLNvoqwx+jzLmuIQ96rjwNw6kbLCp3VeCOM2cEsgESlioOpihDsNR5LZcKrPR4hGJycwXMuSRgmb35YpAViKIJd6bKug4BMKN0D6B6l1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375218; c=relaxed/simple;
	bh=mxTI29ncxsslT5tqzVqzF6esCQbl4MQEJnMKnvcIrjY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uOxHnCf72MrW1eWiUG0bLAhojlraXbiSa4i/uff2/ZRpNvJA6Pj9qbQ4Syhi+MBQhRJfzianEp8DMfGyfzlQmkto26VxIQhyOBg2TTdpuFOnomHVD0tgg1zhH8YUV+EsnLEZb3z9zajfzlDQvXuaUvkpxRGL8vdMrPSkefSuuUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UN5hFAEe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UN5hFAEe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Dhfbc028324
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=; b=UN5hFAEek1zei9jk
	i+ey+b23GE5m8v0soCodqbAk7BIMQ9UxSa2etCQLexjOb50jI3RqkrXM3ZSptuEw
	YnDbu1OwqigsjQmynUJmgkQk9wgsrZ9M0zP0s8mwwC0ORKaNj6128QQYzdH26Qdn
	m+ajBudEMr+SBCAbQX9qF3lu1kEpUpUdq98X083XqBVRB4wORvvCqPnYumNug7BI
	WfBUA/owmqHe5f2qI5S3q4qkf5SmdcOI5H9yBlujFjx2o29O58rYe/0Pk616/RoB
	m3oK1rl/vFJOOcIVTV6ZUwsUV9OTsZ1prG5jlHTQjpG+4Fj/zW+lfy0f0S2wIDkD
	2jM7AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakj332-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so65022785a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375215; x=1746980015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4Q4oxnerkJx95uYsxiAX3sxi06TpYgZRYzGCnLdyRY=;
        b=WCtF9xQJxeCABZoGVD9EzAAHMDemD33/aD3BaTVOokmOGT3yvtIZWR2tJb6w2uNpRD
         3lJGLE7AAh5qPz/7jFgpBXsnUKmdpD88DkzgIOoH9DQN94r2LdaFVj5hMgePZoPJVEV7
         i5945dvgoZSx30N+nLz1vthEqBPXWxAtNyfxHlkOVuRCun719NXXZ8w0fk9uH0jGlRqH
         Jj3kcqvi3GW5zVId8RY3hyuT1pEC+A1SFcqZ4GtuIc2tu0LQu81xhDOgNRmRNnSXZwsX
         QElx5YMJ7XTOXa8hkMhE0w5SCRoeIJX6Cv9O8mo9LyE5Fp+tn75ZgaULfNcwD+KHRpWy
         VXhw==
X-Forwarded-Encrypted: i=1; AJvYcCUUs2B3NXjJrP6FyV6FJ0RPWapCvp4Yvdu6ns9zu+6mWVAt9+B0wkdpL1UthzLgMQew/pIsQ/Ocbeu5ym4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiS6kwT/umoMZWIvdaAQjA6C2IsF2/I2HIXc2JsZN/X1oeSsbB
	F6G0cSSSEzdOFl7s3wKm5Gt4SWNLn+DUiTOx03hntSovrsZEH451rxKUcnu5uPHeW6v9r+DvwxV
	yWa6Qp4vLzX+mSySMW3BOsJlH0F08a9XfvnkXsPvjE+6ydrOCfvqRVvsvPLZ21C8=
X-Gm-Gg: ASbGncsbJDa28zBcuK4aGpOKaXslQ9PJ8DEdDRBnG9D0hWx8xNL0iIB9+JobETDWg3D
	TTs2R5shN/usNX0tAKXndJB8onsa09tFpxPRMDQJeZ5aT1ipJp1rmPC2uznfl6loewgNTFz2ZX/
	Ce40O77MOqIZjT2sh1g6us8jOETNVlzaAtSmMtfeKGmEuwzUlvoXcXckbhC+a/0iZiOeLUDHBmj
	wJGN+cV6aDYjDC7zZXbAFiwlTg0koOWyGNN8R+NrGfzP0DM+8bK/KFWNPcR2w/uKzQjXweJEKsy
	vDJWGOcHwnRzCEPpsOwRFXm5dwsGtP22v0RR4jpPOHPFXS5BmZ112H1tMClYSsvKOlwxzEIOib3
	xMCDVJNmu2lZlqXkj+ZHLDBD9
X-Received: by 2002:a05:620a:1723:b0:7ca:dac1:a2b9 with SMTP id af79cd13be357-7cadfed926emr912056285a.50.1746375215002;
        Sun, 04 May 2025 09:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGco5fgaYnNMpsBBxEXRo5nZ43X/rGRriKVtlsYHoJbTZ+8uY8xGUEUU9xBouzMhrR9HrsDow==
X-Received: by 2002:a05:620a:1723:b0:7ca:dac1:a2b9 with SMTP id af79cd13be357-7cadfed926emr912052685a.50.1746375214680;
        Sun, 04 May 2025 09:13:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: disable DSC on some of old DPU models
Date: Sun,  4 May 2025 19:13:20 +0300
Message-Id: <174637445760.1385605.8148657144550211301.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXwR2684BoCucb
 2Mb8tjRdZmA2sUdIgnMUDbGI9dLg9X4P4iXh1cfb5cF07EoSGLOLP3ZByOEGmYyL1WaW9GJdlQT
 8kObPJaon8iFkgJn1yHqPcsD6naUoQe8tnyTQB9ZRS86VbjIWKNfBj4ALXAy6+HKDTdZUZM3ucf
 CAVqklD2Q8HAaqskEC22hTEEu/3NdLG5xWQbcxKNokuj/BHltn4wBM2cCxsGB0gBVmqdBbTP1s+
 /IrbDPLuk/XA2AwOnSuzXJf1deN9M6mL4Yv4Yv+Y68/IeY6OpmExX+3qfFTuTlzTpTKp9V3XqRd
 iwzfHc/2x2Wduf+npMtLeS2xBC3bpG2FDu62re42xqNtZZSI52eykflPkf1K1KjqG1pGVkwfX96
 mBawYiperoMJlhKjm4FRWRGfYhgK8halHA84kX0n4clGnyb15Znvb7sqaxuCOeGpBRbI167S
X-Proofpoint-ORIG-GUID: xIeFNrReSxuw5Rk91XQz7DGdtD9chcQH
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68179230 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=FEuYHSLItigONA-XwN0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: xIeFNrReSxuw5Rk91XQz7DGdtD9chcQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=561 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152


On Sat, 01 Mar 2025 11:24:53 +0200, Dmitry Baryshkov wrote:
> During one of the chats Abhinav pointed out that in the 1.x generation
> most of the DPU/MDP5 instances didn't have DSC support. Also SDM630
> didn't provide DSC support. Disable DSC on those platforms.
> 
> 

Applied, thanks!

[1/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b43c524134e0
[2/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8917
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5be98120115c
[3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on MSM8953
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5232a29ebc74
[4/5] drm/msm/dpu: drop TE2 definitions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e1fbb0d78e86
[5/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630
      https://gitlab.freedesktop.org/lumag/msm/-/commit/075667e986f3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
