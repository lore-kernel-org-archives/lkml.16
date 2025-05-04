Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441B21E7C05
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375225; cv=none; b=GoHZy8/5pk3vDK+aKkaownGy7PnOjoanLHmhzOYIk+Uyt3Td2N4Fuj8yJmWGyISyZ4l7RUzD0iEj+qD0s0ji705wAyPoGNto6LxFoVqVfxUxDq1rFo2dg8e+mti+Li8yIbAN6VoHQ72p3RYDxcDz010oCVgL9OrMCyLP+S35fS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375225; c=relaxed/simple;
	bh=O68Yf4MVfSbvrTGnH2tyPtJDd/D9PTw/7oag6m4b3Hk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9JklIz3lksaB0VVdIxnuHZlkPu8ciuBa6Ew7vt2oprJ/HQ5eqPcPozI1qVYHrFP6zeofkH4eV9E6j0Q0SbD9my5IbgMVKc9YTyCz6F8a82cV+Cv+g37Yw69A2N6aUGCTPo4l16rkbAMU3iun7gq9Cg8kbk+niVW5Ngrhv2kK7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KmuoZrem; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KmuoZrem"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544EUIAP018032
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=; b=KmuoZremEiorgmv6
	hZ8N2J1KRhkxb3L9zQJbG+Vwnt1Ki+ZvBh8uLNPQ3LzBeVueVVb2dCfIsvhQ/T/m
	ZXJs4Z5p5W5H/Q3Ikmk4H3EjF5dSmGJ9aI1NU7zXqhBc/uIDsa088TteaElE4RQX
	dc5iUulHFfafIrOBKhwzXy0gWXSUTDXJAVTcJ7/hmrfWe31Ij7qU6WHk9ARh4DJJ
	jkGwtA4HS8orNBfiW9BB6Jlf61e9njSAzEl/fppwE6QYxxMiqFlTgtK+BgRj7t7A
	8RmJOKvzpLGK9aSIzsvkgX6a25X0wk+5fjH8OB7ouNjlbj+CoMsbTpCCQmmkuv/7
	fS1NCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55t7cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so5221385a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375222; x=1746980022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=;
        b=LwV0KknRU90oqMNNWUK3MtSfwhmNlLUtJ5Fiqrt3J/HrXz0z0wDhs0HUM9hX2G4pgW
         ds3W8D64BUMPld8EdwREQIs5X3bcFoB4g4DWuoxisP+3xvzeRBZ5bTgL+lMY5TYKiPdI
         bfqRCcEQPnvvpPU+W2KJfMFqHRgcnbX8WgvOhxJDE0fOGZl1bBK83M8nBywSLObxdbfP
         zcz4hqnMMXHHBWhcg/fKXWRCkNMS1svx2DaLjgNZpAiPA+dDP3wAMNBJZq15zpwGU2oR
         3J4ikyj32cSxy6BOlwPJp6Y4S4gFk5fBcDXX2KNnO9xSR4IMqNqewoZ6224lSH0h+6gL
         S9nA==
X-Forwarded-Encrypted: i=1; AJvYcCWPgWUeCCtqLYJVsoi/YGROtBHc4yKU2SBsUUWfrcJQA3e5ywhoqry52JRSzGEYpBib+uFUROGQf53vaNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyrZZjsld/cYD0q8/wEoJiyTyKmfUsvDcYmapND8bZ86i+Y0WM
	B6PU4EwNHmQ/jJk9WmMbZdnMDWp0Pkv+e6qMOF9ySxgK0ixPSf+cFLUKz953HsanfVWfvFlbAhw
	iur3qqUkiSH+jchd1q7IHOWjgrhbNI2L2KH3vy1xN+yKdwSY4L65iS4dxbKavLRA=
X-Gm-Gg: ASbGncugeOw7sUPZPwy3K6RaWZpNWaI9L58hRrTGDdFc5ycLsuE7vlvplxXiacCyUuH
	JAUvRE5OAkxceH0aOebICZI8XkjVwt9X+QLZueUm5rWF1FKCbqrfYejk8Ne1ph8FuRJGmqIXwnN
	f7B0IralxK9ItpJkxNDbsmbV65c61xROeQ42tyTsh6MH8GMSlb3nKIo2hZFwRS/HEmmiV40zTjm
	YIVZxi6sDwj+TlVmmxjYqWxdhX9F4RicbKL3xVUSktCXQwXBjT45ycv2AO1XBXD6PVD542ugJ7a
	SehZandbjcs/NNj8iXsrnmGnjMCoHXzLLnEsdeK5Icnyb5eW8zOKdjQODyg2r/c1l112W8x3Rdw
	sODGgyUm4piIgvQYlOgmWM5lB
X-Received: by 2002:a05:620a:bc5:b0:7c5:a29e:3477 with SMTP id af79cd13be357-7cadfeda15emr898762785a.53.1746375222398;
        Sun, 04 May 2025 09:13:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9jh4HRhFrjaplPP4DWWTXh3MXHXCDhI5cVsnoV7jzD3rgGA1I0X5J69xbTqyP4ckpUfqShg==
X-Received: by 2002:a05:620a:bc5:b0:7c5:a29e:3477 with SMTP id af79cd13be357-7cadfeda15emr898759485a.53.1746375221999;
        Sun, 04 May 2025 09:13:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/10] drm/msm: add support for SAR2130P
Date: Sun,  4 May 2025 19:13:24 +0300
Message-Id: <174637445761.1385605.10286310480029078025.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX45bWb2bfXLad
 GKlPMiSz0i6sH+teV2F61uOM16pPMTd5bzspn0nOCsDMRB8mKM2c09vo0B5a8wrsOtrSkcSGw2C
 9pxsOCobBtJTvkWxAjDloYs8HwPvMHnpwxoblncaeN/jr3GxQc9YzUSVW3dt8ww/bXOnxpuOxHR
 Ph7q37B7sDxOPuSysZbvQE6KOSLbo90bTfhvYr2wtJ2/mBsQO97FJhL/nVZNVIhN2+VLsb5SYdM
 SB8Lb3r+bxwHbVsMYBs398bkbUm2sDz12A9Nosb5OpUxFDtkR9vgIoVe4lXcdfxvOFXmMvyEzoF
 jA9tBLXhJmoFrUlvjd+wSeoBDBQVRehQYT9LqAH6oMclTTwhPBM8Xp3lL4uvF+mNfckxpTaLQX6
 NcvzNgdogE8QFZ5GnB/bPapw5MmhED3X1wQYAW5ifQOdB6LDWmFFzVoX8CJXEpMqd214zcCd
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=68179237 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=iEGPaXCqe01J9_RIJz0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: aXX4SUQyELzcEwUdMBiF-B4poBqxaQ81
X-Proofpoint-ORIG-GUID: aXX4SUQyELzcEwUdMBiF-B4poBqxaQ81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=870 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152


On Fri, 18 Apr 2025 10:49:55 +0300, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: display/msm: dp-controller: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b341da1172fe
[02/10] dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3c70c9d0a99d
[03/10] dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/262650e71854
[04/10] dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/759fe7181723
[05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3096209b7a62
[06/10] drm/msm/mdss: add SAR2130P device configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1e7cbfea6624
[07/10] drm/msm/dsi/phy: add configuration for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8e63b2075e01
[08/10] drm/msm/dpu: add catalog entry for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/178575173472

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
