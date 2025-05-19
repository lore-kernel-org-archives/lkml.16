Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29C2194098
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652330; cv=none; b=gGn5+5YFTomIspTySXHaZNepnVGJFeLbw9AWdWb8ya1JoGaZjR/cRhkLIJWtmPwRsXrlwjZ5p6JBXjMXf4MVmzTKwnnXwll9Qx10yjZjEO6O7HcPWRVf/mH8k89z3jm+6T0mxhyc/PDbGnLuiAU3NlXMgnuaxGAkngUA20n+Qp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652330; c=relaxed/simple;
	bh=h78fdNgru3raJgZ3WE0MgKX1Ryfd2RCOsMN6h6hFIo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WnysoDT0Ss+YGVMGH7313yG80QohuRIWRRi6ZwQjLN7ZOlWpNocaFn53Na8e3Gec9ijr+x5PSqpZ/ETmLdmFNPZEMdFeQwiPA0DwOfv935FD79LK7e12pekhbc052qLhf+ynrv5XVOv01GXOimFdkrcB68wvNGUg+B5ffwL6FQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ig9y+3xi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ig9y+3xi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7Gg9N023259
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=; b=ig9y+3xisTAGYAk6
	vzrFHWsJKR4tpkHn2DzOLoE6ImBbdkCTD+gi/Wu33ekx2QgrCFy8tD8krC0PeWjO
	JQiTJhrGJVDXBKd4ovWXhOu4IG8nwfMNdxUQPu4c3/Y+uuIO202cOBXzNYMv60eM
	sswb+dRXLsXkItnc6fy/pT9S3y/K7VactxYjLizylaZ8Zm/jfzJRh04PPUXucW8f
	cLeg6T7mjYHnEmnV5rfXXjOpFCt5zYrI5esrTFX/qP8AzOH0CoLepCJbujmFYvsB
	VbynHpFVuryKGJ88YN4KC1NDzaRlds0rnJgq1sSrtJCMj+hhALrrYb25HbC/5iFZ
	qjPiFA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rn3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8dfae341eso5594096d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652326; x=1748257126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqFaO3iumEsSA+9mwg4tpAHMyVx11KCQYF3S3tW2yiU=;
        b=nc7EMbYk8mlu5wQ1eZItMX66PyJWbLfLoOjiwvXDq2OtM+7GBrGKJa5cjGsTKhr/9Q
         HTfubhGo2P2JqmPukoNcCz8mG0b8RFE4Zmb/Zigh6UUGgEpZP1HuO5XSDeI6/c4/obu/
         huKmeGzbBILOORIDBn1g2Tj5ay6OCKa61nLEJGLyZfe03wEO/VTi1V8cVqB7BwaMa16o
         7y1p/NyZpQAUIOPMdb7BrgXtL3QSeLul1KD58X8OEUVyHyehiK0b9HTkx3uIxAbGsG0y
         cSpHrXqOB2jfn6/4PmF2G77dVe8Bof0UN0AQIgnhHaRtRZjyibpJsVxxdS5teUwuCioX
         ysQw==
X-Forwarded-Encrypted: i=1; AJvYcCW5sMjkPtOnrbDYIzoPSBE8TRtSoVKt5ak6R2a0HVc8UySIwskdzMxfcHGWQiv8oxwPYkmj1Gq44oRa+P0=@vger.kernel.org
X-Gm-Message-State: AOJu0YydFbuZ0n0OQrsGmi6vEruvHilJyy1rNpQ8HKGSLDUBikGILcaV
	/bsJeYk5aAiNce+K9UEoB4blPXDVzP3pT/kRoGCkZeOY9lTzkQheiFe/i3RCxLUPP8gi0dcPa3N
	ImLDe8xx4j9F7bRMKmGEfNml1J6rPcyVF4KPbH3NDHkUZBlj3AYmLxX7LtVe0guCXdnXeWxgM0V
	U=
X-Gm-Gg: ASbGncu1DbGJ52nxuopt9OJA1j9eVZl/b5Us2sIbcIil0sqIUwJhecCrU1WhnaNP+va
	W/OLVaZ1646vTskJmX+Se5p/Ef0NDUJGp3XYweooaSDxHNnOUFhJFUYwF0csUv1yhYqE/al2vGl
	iJvs28nPEOHNDc+lJiw8ktV9iQhaj8hgGsdINY0O5qDi/MemqkgtCddPKUt0+ABHg/80fCyjdR0
	862WzBNXPa8L8uuvvlQVCkadOdm2Lu7xDlhQQCNWM3WHzkPUadOT5mRMUQ/2wQhmXaECXEA2ayp
	7jKZKzz/KC88W64tMKj2sznrOMKMaK2n2OCdkq2838S5J89xVMprhl4IidTmILvVN261ape+bih
	D8AmLI9JEDmvW/7vxbncJppKI
X-Received: by 2002:a05:6214:c44:b0:6f5:3d00:48b7 with SMTP id 6a1803df08f44-6f8b08f3e94mr177056316d6.41.1747652326274;
        Mon, 19 May 2025 03:58:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJcAEu48QCPI3xLKvGvX0WyaLZgXZDfjvKNGszvjWv3n2dnBqxwTrw/HMaVSNLmCnqB1f7XA==
X-Received: by 2002:a05:6214:c44:b0:6f5:3d00:48b7 with SMTP id 6a1803df08f44-6f8b08f3e94mr177056066d6.41.1747652325929;
        Mon, 19 May 2025 03:58:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: update SmartDMA feature masks
Date: Mon, 19 May 2025 13:58:32 +0300
Message-ID: <174637445761.1385605.1655307242788912064.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
References: <20250425-dpu-rework-vig-masks-v2-0-c71900687d08@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX62WKiXdYqN8g
 DR8J1p/1+61ajbphtOUE3r1EtBPY/EmzTjDHS6zkY406I4EIvIAyy1nrBa8FDRpqRLMDzTcVQto
 TckLIgGrXpWMYiPUl2ap+o5oa0bYxYg7hjMQVdCx/8qz0h9R8oWtPWE3YVvDF+KFKgwLE43fNwc
 dVyiJrLoFGgWO0PleDzeaxTwcT62I28KxqoaBZVSYJ+zdeKajAJvESXSo4g6U0KUuUmyamKKwdU
 sDYw/2lz8TSUAw0jcvkzL5+VKCR4ZyxlHuytx4f5CyAsQlb0EVoNR1J4fyAjlz6je7PrCF8XPRK
 NfDhrJ/9UThdBcMYFO/EpKW5iBV9UNRd6EeFPIThl4XnpSlZD1HC6leOAis+6sL1BtTdWAMdq+F
 h7ppnluFOK3mbNgZMvFgJuHkQviDcpIcdIUtvSqLNwZNNIXU3sTIbsGKQ5ciAhIPtshhieaH
X-Proofpoint-ORIG-GUID: cakRcm0qC6ZMguVjbjesVfZthNItm83O
X-Proofpoint-GUID: cakRcm0qC6ZMguVjbjesVfZthNItm83O
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b0ee8 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sAmZ8rDWQjnllFzyCpMA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=639 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190103
Message-ID: <20250519105832.ZD15yxbfz3aTuI4N2POXnZWMFtm9wDcqX5BG-ndKqG0@z>


On Fri, 25 Apr 2025 22:49:07 +0300, Dmitry Baryshkov wrote:
> It is easy to skip or ignore the fact that the default SSPP feature
> masks for SDM845+ don't include the SmartDMA bit (both during
> development and during the review stage).
> 
> Enable SmartDMA on SC8180X, SC8280XP, SM8150 and SM8550. Then rename
> SSPP feature masks to make it more explicit that using non-SmartDMA
> masks should not be an exception rather than the rule.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: enable SmartDMA on SM8150
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a2343de0b6f
[2/5] drm/msm/dpu: enable SmartDMA on SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8dcccd7a156f
[3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63958b80c2c5
[4/5] drm/msm/dpu: enable SmartDMA on SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3f5e910b33a3
[5/5] drm/msm/dpu: rename non-SmartDMA feature masks to be more explicit
      https://gitlab.freedesktop.org/lumag/msm/-/commit/79af56964ee5

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
