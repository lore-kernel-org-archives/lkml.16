Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD8F215F48
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084033; cv=none; b=oItVIr82e+d9Ei7RWU1sYBsBTcrcHxqx4dKc5WtHI+mKKbtV94DDZtgn+JqISLojaL3Imwbi+EcARK2UsLuYQmwZ6FMzFHHw3my+a6wbgDcaR/GsubU+FEclUSldN5ta5erB4YCqhG79H8kbNnzjrm95v5R07CG1eINEzXr2dRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084033; c=relaxed/simple;
	bh=yQiHjUFcyJIrOWKZ5UhJU8gr5ewgmJPG7QiORquZUdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAHvUCNGk7iqOZPHuWi3g7pikzfktdHDYi3MUcUhkh6bbhDwqRryLz8TYT2xmUCbnsjdw/HODa4pv7/yPhTCArhMX1ByNVZ4zcGdIqsAcSNK4719dEA7hAC1MAuwKg44qoGTPzXLbyWW7NPTcSbMrvLmk/4WU5YMwsOeiOnXR80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PhVxOS8n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PhVxOS8n"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFDl025687
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xzv6Jdtih4Pjuewr0XazKhab
	UDZVPmr6YzAUTkg3XoM=; b=PhVxOS8nHVDf1TOjSeTHcpCxOCi97qEGEJSd4VXm
	0K4Z/+g1vZ0zFiThjZIOTP/zXAMBGmao9w2XM9dDyL7V8NyKyTnZpsY2Je0QUmzn
	ImTySzzXPzufvsQoPOQIeqfm1kyns4x2XP/3Ive/4X+8uO7Vyx8P8hj6kgvLyBjc
	3uXX2roKMB10WBx6lfNUa0h+IWuvC5O7ormyRJ6j/gZ77rBOhkCT28WsylfoqDTa
	CD5oOCUtAEXVKuqEC5/pdH2LLrz0J3Ff/bshJJigOUJsPyy0I24YfrZbN1S5eYce
	oqEvDdpPOlBcY26dWUi7tYoTZbRlIrHWJ+eycRYFiewrQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45n0nusa3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:00:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f7210995so4513985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084029; x=1743688829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzv6Jdtih4Pjuewr0XazKhabUDZVPmr6YzAUTkg3XoM=;
        b=oj/Rhe/xrNC1BzOdWtkSN/byHWYN8cBwnKySGmoZGo7nIoCu38vlWp7CiRwAnN6epA
         8EcYPdU7k+jBrk6pJAVkO04dInSe69jPA9TPzMAdfUvwNyvyVZ9QjPQ6VWkGjweocG+P
         TrdfYWu5v2T46ZHHBnWfo5Yhpr3MwwfDI1Rr4Gu71FrLkdOdre1Cry1g3FtnycTnhjD1
         8s48zIJizwTzgNigVUo8+lXoPtDzuQlQEVzGClGBH7/x26cwhvdPUKOVcmpXCo9tGBYB
         ubmhFwgZlMqVjhpn5BkgHUKSnegqzAN3jVlKENMB8XEAIjlFpLwlstcRlnH6s4toJsiJ
         EfTA==
X-Forwarded-Encrypted: i=1; AJvYcCU65PhQ+tLRTk1o5PLVyGOyLv57ROaDVKeoSCIGkHzGpA7znChHMa0Kl5VoO0VWnvYFsTa6vdjXUR1kvMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YztydfSB0Q5MjnweK6QkXiIagi/BBobwQJ0+F6pS1ZYyjRHpIm/
	iPUBQBY5eXGbtDaItnoAicknrDy4TwnbTe4sO1Na9o84PNcVWGcPukPpgy7voEei4d9Oz8vNevF
	oY/XppQLGX+FIrCoaK96V/D5qWw12qIBDCXXvrMOLVS2eVVYQGZCauggvgSOM+UNkkZUqlVw=
X-Gm-Gg: ASbGncvuE7HtC+d0oqMkQicy4IXfeZ2VZ3uiPVwqmtucfAemxraNGBm7Fg7YRwt6Lht
	wCtpt3fNrXq4cWR3OteX2sO3xM6gNC40px7uO7M07+1kSq6Fh2ijKHJXRigBlWWsh0YY9Di1dw9
	/JcIYKY86ofsGj6Fm9FQwyRmh/Y3EKyL+FgmLuQhWje6AeGTPDhJPs7mVKRJKbQ1VOBANMYuA8m
	nl1r/mYrWCnPdLJ5B/ComPACT5vlcJs3wyz0OPxE4NyzEOVBfl2B4yOi+UFtkEg+d+0PmOJfYmz
	ocpNniXyisFAlZs9PnoF84tTLPfOfKtzudzDG6g0gSaubi+QuC6POYY1Ek5A9hzXQ0lqmQx/yNb
	5z7Q=
X-Received: by 2002:a05:620a:424c:b0:7c3:cccd:92ec with SMTP id af79cd13be357-7c5f6afe158mr46277985a.0.1743084028098;
        Thu, 27 Mar 2025 07:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdaP58PwQwtVzSyQhWchxMjVTCY2g/ULYhQT88j870psO7tT+kuGTL3evaUlHEe+4GDAFVig==
X-Received: by 2002:a05:620a:424c:b0:7c3:cccd:92ec with SMTP id af79cd13be357-7c5f6afe158mr46269585a.0.1743084027452;
        Thu, 27 Mar 2025 07:00:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6508158sm2091751e87.185.2025.03.27.07.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:00:26 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:00:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Sayali Lokhande <quic_sayalil@quicinc.com>,
        Xin Liu <quic_liuxin@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 11/12] arm64: dts: qcom: sa8775p: Clean up the PSCI PDs
Message-ID: <dr2wkctvk2glk5agdxpijmz2wifvj5f3dwyh2pjlzesravutwx@xa4zcsuyur5p>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
 <20250327-topic-more_dt_bindings_fixes-v2-11-b763d958545f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-11-b763d958545f@oss.qualcomm.com>
X-Proofpoint-GUID: LWtTrOhxXCz_IVceUQWkIcHLSrNUuSmf
X-Authority-Analysis: v=2.4 cv=AcaxH2XG c=1 sm=1 tr=0 ts=67e559fe cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=LKVomu9JRcyPd1K0AmMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: LWtTrOhxXCz_IVceUQWkIcHLSrNUuSmf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096

On Thu, Mar 27, 2025 at 02:47:13AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Because SA8775P comes with two disjoint CPU clusters, we have to follow
> a similar topology description like the one in sm8750.dtsi, so:
> 
> system_pd
> 	cluster0_pd
> 		cpu_pd0
> 		...
> 	cluster1_pd
> 		cpu_pd4
> 		...
> 
> Do that & wire it up to APPS RSC to make the bindings checker happy.

Should these two be separate commits? One being pure cosmetics and
another one being a fix (probably with a Fixes tag).

Anyway, 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry
