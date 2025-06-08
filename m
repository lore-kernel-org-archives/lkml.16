Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFD21E25F8
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 22:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749422144; cv=none; b=mOHhWrGI2fbf1yETbqxh7Ris5m4PLdoWK0ekZ64IggvO7l5sktmuczqpY6KsyIFTE+G+cBA1V64jLfKO7sqJCqQGDm1h7QoDlCOQhyRlKr/jJ6+VCx7N9kek0xM7JhpdIf/lzpdZbWFud3R6vIqhR4+6GWZ1U090RkL0/py5cVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749422144; c=relaxed/simple;
	bh=MzM62NnKSwU0yyDvO3Tn/ggJct8nE5zR/hSw9Y0McNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fevqn41HYLSI13Y8xUoN41Yg1dqXOQLTwYLMXSbZoK+wxWbpyA724Idh9h6yMdZa+N/0VUDuH7CV8ZTxQ4Np7FNWUsut8V9VdwwYXTIGr/ISfcJ+Hno5KQD8eYBtWgyZrN0rq5aoLtBaOlISXCgVcvVpTlpDDDtF4GsqQNTM5XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EoRg3//g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EoRg3//g"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558MSZ3H001845
	for <linux-kernel@vger.kernel.org>; Sun, 8 Jun 2025 22:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EKuV41kanFRSiy3Jvl+j+58U
	7yzzRT98y5OAQjFVSAM=; b=EoRg3//gq2JD1FZDiZXRNu4ss6L+3/+TdBYSFM8v
	MCt7mnIrG7J1tyjIgsTLDCGO2H63GH+5fUk0kmVSI/aT/Zayj20OzXzWEMLuhHPQ
	hJ6E4YCFqVzhnATNkkyooUQDK0gRaiX7lDliFZICPViNDuQrz7kovvIwRDo3LAdD
	TFGv9OxI3xzQ7TLCm753BP1Dwj8JV2TYVO337cH3+/JYJT0Gd8CNrrPTZ/QRywAd
	vp1F0/3PzoCxzRC08NTfLEDJgLYlHaZyhd/q0g/s6rZHLe6R1x/mxMYJV8vo4Pmb
	yzZ6h9JbaaQKbwYgP7Hypd9jcfFTPGNTT3KnjmWk7bLI7A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxm900-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 22:35:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3901ff832so195939585a.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 15:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749422141; x=1750026941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKuV41kanFRSiy3Jvl+j+58U7yzzRT98y5OAQjFVSAM=;
        b=txe/temx+2BKf3YHEgtWM1KkrlCPBp2fpbnT7GyjVQVdl0pzyX7fhBU//LMsTw6IC9
         jbWwQ4rsQRBzTjo3V/GNiCu6ENexOpC7T8VqZGbJE20AzG1/aMQLJf0Ha5eRVvip4SbC
         J9hYXy5MLQucCl9TD45teM15aDRc4eanVUcsra7XhMFolCeXo7aqT2EYMuY4OC1lLmaN
         4nAVQ6ffvgtsmLb6ZXF3gF1xSTgnrhWOAiCC3uzTEB/YxlSKBGkUTs2TMMJaELbn/umU
         Xc9z/5wKDjgQ7xv2m1qZkyVPceooOKIoXMUO2LvtLR0jgo10z1mEXDObQ/9FtccVWl60
         IphA==
X-Forwarded-Encrypted: i=1; AJvYcCUwc8hf9xy50LF/Rs9DQh+n7216M8ZQtoCM32NuaAHAti1wO0/4whAIBdmiSaq3sdmg9A9HTqPIlFN/8L8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9As3EUEfeIc7NUr2GeT5KxRa7gvsVPwS+t3y+UWQ7VfiyGYVw
	0L0d4z+OhmqRjYaMSnINj1Rijj31d45G5znB0BXxAr+zkf8OGD7EdpW3S+qPIFbeylSRmRkdFnA
	qmSpxmCqdOZPU0MTuDKcZsd3byA2w11h6ijICuT2mD5Zs/IjMo/l3AdZgcbzBmKdCfbM=
X-Gm-Gg: ASbGncs8GHd3AKG3R89NMyRtiSc3pDoF5vQ4SEGsAKtR/BZzEPkW10oSJrJbGp3xgYy
	qCnQFX5ITYWy9d2lh8TvTrLyVCuAmg2QNfULV9iberVdf1XHVo/s82TpJkA6ugbXZX0RRm7z3vq
	htnFUVCMIB4QAulr+zM8vMmWww3VvKtHqT5bFUoNBtr7Gmz7os+tMiFd1liZ86rl6YeqWZ6BOnG
	+fvYiUv9C77wuVu6mmfPx9XTn9CBAC+FsgLPX5wKGJzx2BQ+msJ/I8rcYuDTneo+zb/BsBYTRry
	3pDovs4aJYcNZZUNbk8vqxKf/DybU/EcjtXmSw2DVHdcUyaVHAWK9k2S4YYmItvJ4koy9XIrSl0
	=
X-Received: by 2002:a05:620a:318c:b0:7c5:a423:f5b0 with SMTP id af79cd13be357-7d229863426mr1907150185a.7.1749422140879;
        Sun, 08 Jun 2025 15:35:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjoOoW4vYfivFJJy31TrYZtEgVAcRnTjvKyrzMsvVqgoz2mkewEAd2QDC6UYYNCWyWKNoopw==
X-Received: by 2002:a05:620a:318c:b0:7c5:a423:f5b0 with SMTP id af79cd13be357-7d229863426mr1907147185a.7.1749422140521;
        Sun, 08 Jun 2025 15:35:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a61esm887119e87.163.2025.06.08.15.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 15:35:38 -0700 (PDT)
Date: Mon, 9 Jun 2025 01:35:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "James A. MacInnes" <james.a.macinnes@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v2 2/2] drm/msm/disp: Correct porch timing for SDM845
Message-ID: <t6gtx5ygd4dkizpgupedef7tnldwlbvhcp4m4ypw4447fctull@35hwlznm6lv3>
References: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
 <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-sdm845_dp-v2-2-4954e51458f4@gmail.com>
X-Proofpoint-GUID: 7Hjbh3jzQHBH3Pco7jk_64HvS20hkFjg
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6846103d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=OnwjkJn3o8bp6UkAWykA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 7Hjbh3jzQHBH3Pco7jk_64HvS20hkFjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDE4NCBTYWx0ZWRfX8s1an6C8iWH5
 +edbMNRbVH0wwwzQoSKo6VOLVQP47x3HgGRyK2oI4oUamfOwEI+DuKCCnY3XTjeFNPUkiavUOy8
 mTLKmYRD9lQ2uWYFlXKdz7Hf1dUNGdBUUhunWOmJQabpxpHokQLX2emt7xtTtFsukQIaE78I60x
 sbXaD8cR9D/Wu1OlzCNVsiB3NhHoUG/cPxtXO1vbtsKBaoamA9+DX31kcdHFcfSBLHz9byfbwaq
 HBQOTTw0k+hEWmaLDbrCtS8yn7DS8M+8aBigPUHp98tIE6e8XRbc8nv42Kxv8p58y4BBmYGGdQw
 hV8KXenACYOXtuxnta+G0fSN742ESn8V2maT4JNmD+lcGQ2W0kazw3fCT/juMDdFXbDGZsggnxG
 5bXmtOckNPtryZQDtizm/D+7Bk1xD+qoNHx37aJKP4IbHsnncPeLb4Vl69sQPcTFVIh8nlnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080184

On Wed, Feb 12, 2025 at 03:03:47PM -0800, James A. MacInnes wrote:
> Type-C DisplayPort inoperable due to incorrect porch settings.
> - Re-used wide_bus_en as flag to prevent porch shifting
> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: James A. MacInnes <james.a.macinnes@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

I was able to run DP tests on SDM845. These changes are required on that
platform, disabling programmable fetch is not enough.

-- 
With best wishes
Dmitry
