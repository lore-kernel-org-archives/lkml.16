Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C0B33E1
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747269152; cv=none; b=TfUyu34x6mC+kjAyUxiMbN3EAn6V+q1HP+jl3nofc3tQ9LuY1vOn1dbLBaVJ4AyzFkJtDRYzHqQbkfSAXJ4VtDYQc99ypBuNWDQ5AXVIxHc81UbondV02Uw/6blD1f8H4fshu0h3kI9yJ5KXUP4DRvx2QEV7XqXKhCTIJeqZ1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747269152; c=relaxed/simple;
	bh=NqfXuxll00nvn2wxG+WlLr4Air09LSBeueadi9GjzwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYT7QM0s3fklG1VXrpoy+aIFM4xKDr/yWxHZRXkbAIqSuQTUwd+OHdxqM7/fLAic5qdJ5bujdndCQU/FxDop5wtasaGzVvGrXmddVKI4gTqccs5guesX0zx5x1oUHyI/6uLPptYtUvbYbPkKNgpcVCvtfGH5ZYOX+wM8Fv8qlCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mykXdNsl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mykXdNsl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ELHZSg025434
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7wCujduK3vbMXq78OiNobIBg
	xC9SjRSYXxxSDTrP8aQ=; b=mykXdNsli6DB1Z/HAfYnvDzduCMYjw0RYMQ96WUm
	fCqJQFsoEqTBOkSeT+gyw4xS13xzuEhXgKTyIJvcwG31dtwfKIf+fNfplr53o7fP
	Z0U69kpxlca7C4UB6uTmryTmvXIfMjt8oKV2CPvMKbQWfs8iKjf+fnK/atbixxAA
	V2zbvYjW0fjx4PCMowInXehOQrIPbRVGy7lKgxRW1o5WCUKLfwXAA7SjlqVlsFSZ
	7wK+VoE1rdCMI3E3lb7j/pVNNRWpuy390U/TQTij6ghjGBA7DSmywWIV5/dK/hZ6
	X/bz+0clRAHqgRTfbrY7n0RnhaMSgCDCMjW1KDa/q1djkA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew4ckb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:32:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b94827so62776585a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747269148; x=1747873948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wCujduK3vbMXq78OiNobIBgxC9SjRSYXxxSDTrP8aQ=;
        b=RAqGzJ5tZSGdn6OibgKB2W/4+HwiRpFMFTpMmxh4ntmg8M1o1pM6iNkZN+RzSoHGmn
         D7JJhi+18nO0hCyM0MKFkoYz0s62mPDlNbx/MQwEhogIlxFk71d9m0b09dYOljd4vXSj
         feikC+biN0EzEuiijz30oRiri2rglpLOs7ZdvTimcuq84XqMin+/C4jQo39vcnGTLgxr
         adAh4YX0lnfanKWpcFoz1XySWIPAXqRjiiknixUFMfzEJP+hMHAKkzJwlflND7tP4I9g
         nDv65lGeGnnauKRBp6LdKc5LtbHoRDZhjG0qrIcFnT0pwXmVxP1pf0y4xc8OdeQspTN7
         Dz9g==
X-Forwarded-Encrypted: i=1; AJvYcCWSEvDeW+75s98q64Vz9RZ23nQGDxcUMdNcnsC2ZgmPy2qMC19o72yIv9/1f3F4bDPYOfipQoIKcbHMJi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbwxpbEQHAm24BEDjZiZIoyR+cHhyEkNnPzB7120QCs196itoC
	iLvJGKtHphGYmXMJNXaT9G7P0S0lud7yHUB+q8ROxA4//mEegtjhCa3cpLOtfP0k8mDLvYuX2+6
	JsngRwlT7C4YdIFrJb6RPIo2867dWtx4iNB480fanF+lnmmy2qlNiL3pQLoXdh1A=
X-Gm-Gg: ASbGncv9PCKvVSj8QQWmlbXnXZ2JRfTJK2GhjPzNbuTTDNg3qNchyMOTX0NfmYLarb1
	BK3N3rqSBls53Jjho1xZqDS+deat3/ubc3EJUjbADCXMRQn4ESMAAX16mtiBRRROZSV28YE0sBC
	ce+zFYNKZb6jQKiTqfKfCiOswMIZXKT4EdOecx8Rv/2P178YMo2tLnoHhLa7MjSNpE3hHMAbX4H
	xInmxZx6yT/F7EVSL3qpdfYf8BBOP1nVfPLeAC+wF3GbCEFEiPcFiTDftoaN2kmD3HmpEVtVChe
	OX32nu3n4LsNqWlrY67ZQXuP9HokHXzNhHeBX4AwbLhZ+DoDpi2IGqOyMTKZ6+jT/yZeJ0YYsxU
	=
X-Received: by 2002:a05:620a:468e:b0:7c7:a5e1:f204 with SMTP id af79cd13be357-7cd2885d1camr804937485a.56.1747269148603;
        Wed, 14 May 2025 17:32:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFLy/qxzAK6/2dzjOlUxFMW7+rsjpErZR6f687TEG75VgVdyNraMDrOlRULwKla6JyuE365g==
X-Received: by 2002:a05:620a:468e:b0:7c7:a5e1:f204 with SMTP id af79cd13be357-7cd2885d1camr804933585a.56.1747269148227;
        Wed, 14 May 2025 17:32:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645cdb5sm2435228e87.57.2025.05.14.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 17:32:27 -0700 (PDT)
Date: Thu, 15 May 2025 03:32:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm/dpu: Remove max_mixer_width from catalog
Message-ID: <zymzf7cfy22kdlh7iyirzfrcmovaogkjtfatzt7lcaldymm7za@ppde2klezccn>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-5-c8ba0d9bb858@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-5-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-GUID: cQdDHFe31QZrvEaDDkvGOis22bLhqnvc
X-Proofpoint-ORIG-GUID: cQdDHFe31QZrvEaDDkvGOis22bLhqnvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMyBTYWx0ZWRfXxbpKTxTsq3Vq
 +FiPNQYpIYwnRVUyRrTN3urJ2T2Azpgw4O3+X2qn2Sd0HGPzN3oyWTfkrBh5ErLussEd9OA8thT
 SKyRMu7fup8SjrfMPegItkRcOSk6CRBpg6xtxMMWFT97UumaY4sZm5HjTn1v8JqKFKpInGQdXWF
 GE6DaeNp0b2ycVdRX3eltITsBuGShE1nQlsQUi9kbNNYH/ZnvY5U2cXfc8ws//vZiK5caHpVjzW
 uWzcIyU9aakSP0A7d7EBTvsLH+B77b/ayC20jMyhPwMU5fyYZwpoIv9tpJOCIO3FadxhAuvRS12
 Ucy9GfVotSGharsXGtcqkA1lMGTOR3RJk14SzVVcMzOA9DVeu1SMcaZ+ZWMBfUQotFwbZ4tSItZ
 tpDwfCv5d5QOOMkuYTGNMMk/+s+F/vJdULnESmeiz8zfJ4322fVGfvB3etCTUIAGS2xMOPoy
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6825361d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=uPaXGRBW1wo5ZQqY0uYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=851 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150003

On Wed, May 14, 2025 at 04:52:33PM -0700, Jessica Zhang wrote:
> Remove the now-unused max_mixer_width field from the HW catalog
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
>  28 files changed, 29 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
