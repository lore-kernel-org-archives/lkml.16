Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3251B1F09BF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314250; cv=none; b=j7iNJ+yl4Re9NeSEtdKJEbawxcOkDnO3IW9TT08P6C3XKiAOLA40ggMSSmZ7cUxLEriKsg7i9dI5VrLSL4ER9EaRnMPpwb6X2u28U7CaOsOYrh8iz7lXGQNYB1oLUxwNjh+Kp8xZ462/+BxrC3Pa6cvQP8+4cJzK4W0OSWA0+H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314250; c=relaxed/simple;
	bh=iMsdDLXheF8MRz+4l0Yir4tgR3MOExzWlGax/sLIrVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fv2kZe6GG8H5wK0tKndrx5UGGEBmqHkMX/SdLDZOv097dNN4Ckd70e+01K/cO+B8XhY3zhCO9V+KgwQ+zfPd9M/AodlNL9CkByOrNdeW4qsJ4H6FQNl6kXGVOtI1ERlqmex4OjWSfVyD56D5MORKsNZrk4+6Uzv5m3q4gzf7W0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jrTsBVS4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jrTsBVS4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG6Blo032000
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PZm0qqgS5dTG7oCRmAuLkE5p
	HlURp9VF4PXmAQpOQA8=; b=jrTsBVS4kK+l+2V83qmi5UfEscnaEuyvCKWxr/E9
	YrAJ2ykybUVRjY1dIyYRhHir3HHM+cXScju49r/96bW5aSl8Qk3jiq/kDpFCagyK
	u51msUMUidkU0dvyTAmpr+v/fdFkUHHylP8KUGP2ypdWvkVMsNy/QeN/7Jjk8a+I
	yl+VXDrihEZsb4/Jvt8YJTcXfLR94gSk5jGkH4zqLomjhkfce9+I0Dflxfuohdhg
	g3STC047JWrBgpNuz/JUPelYPqI61ZMDPJF4y+q+PyPwXh/HuNecoLiJJMOkFUUP
	hrslaynksnQaPuG8ssB0q2MLRZ9R71rc9uDED7Irewx/+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmg2tq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:44:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so288450785a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:44:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744314247; x=1744919047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZm0qqgS5dTG7oCRmAuLkE5pHlURp9VF4PXmAQpOQA8=;
        b=u+hRLnLKugqZ4pjvpJ+zqEdMjkm7g1vjNwg5IhTPc4nXbc2iGbi0hZMyuI5qlQ+vH5
         kMpkPoG8uygJeUZU636yPYZjQ3LCWPNEFEwXLb8HiUJrudtyKVdWgxHqhx/Ol345gJd0
         oFCTePdOCHei+VsrAVFfSrQnHCGnvdGQ9pqqOqpuSxFk05OrUOezP5wyQkOhQXAbemvn
         E1PplXl/oq2FMwaFhgZh8iuktXipgA8py/Cd1hTQTzmIlBSE6RRI2B3+U5varQ/Ury07
         J2usgM/jUkTP8/u4yXCKyxN+cSkxMPt4fQxSU4G08ibVawyUwZh6ggfaYlWyi3BqDUPj
         co2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv+MyZLUD+t3USoa6uOoaGOmNZpAXmMiG0MlqffkvNAX8cys7DxdT3wXmE3UeJsqs/oq4IeY3gLsPejpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2+2cP5R+02raVuFNyocJmbpFf0lV7XN8salGnFjCQ3SJs4FDd
	LUPAOKmypdh/1ob5aFojNEfvWk0idgsCbcNjx2vh2PMvnvJgJH2cjL11g9oMPPpdTrNxG0lACzP
	ZLV11av4bz88YRxvYDYIE1aw+udJsH/cFl+WysaRLmrEEbDhXJyxCuWbBGUWj5CQ=
X-Gm-Gg: ASbGncuZ04qBB0uqCK8XIlCNQ2DmSgprAGn4dO0mGTgO7m70XKnFRAoTqggHUaqeZJF
	dbvER6eNOzBsbkudzH4xwJStYyLwN9HBXq2+hCqw4ljz+tUr1Qt3bt+NydJlbwgX+HRf9SvzyyS
	FoEqxBdsoUdWynbABAP7Sp/49m3ticnEiAKtZblyDjneAkukSusnxclj0mFmzoilhfTPnBpK8/O
	orb8MEJ5fQsPxTox56AZHe1Of01LacBNP/p2RRMFLnu5Bip/XALIt0i5buq5g1owlSz0MSdl1Ng
	f5kDRX+eoHZr4lO+JR5w0hxMVjMs1PaYBOqHfOVn+PhIhepH8LoD2nvIMtZ/9iBpfRSTWOxByZw
	=
X-Received: by 2002:a05:620a:4484:b0:7c5:4b91:6a39 with SMTP id af79cd13be357-7c7af12ec95mr31545385a.33.1744314246979;
        Thu, 10 Apr 2025 12:44:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/AtswoZH0U6ZdBxJQfiEwZm4aVhqnq1sZshU8lrm5+ua8KiXU0Tcl7YdGDm/CpynyS+kVcA==
X-Received: by 2002:a05:620a:4484:b0:7c5:4b91:6a39 with SMTP id af79cd13be357-7c7af12ec95mr31542185a.33.1744314246699;
        Thu, 10 Apr 2025 12:44:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2386absm228473e87.87.2025.04.10.12.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 12:44:05 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:44:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v5 1/8] media: qcom: iris: move sm8250 to gen1 catalog
Message-ID: <vhfuhjruok7gupoeo2uloe525k7oycd5gkh67zzz4wbiwrczpt@i3qknymfu4px>
References: <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-topic-sm8x50-upstream-iris-catalog-v5-1-44a431574c25@linaro.org>
X-Proofpoint-GUID: ve7H2PTA72oMz4__MDkduGprViQbjbD6
X-Proofpoint-ORIG-GUID: ve7H2PTA72oMz4__MDkduGprViQbjbD6
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f81f88 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=w-EXFu6-wi7iOCDdWgUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100142

On Thu, Apr 10, 2025 at 06:30:00PM +0200, Neil Armstrong wrote:
> Re-organize the platform support core into a gen1 catalog C file
> declaring common platform structure and include platform headers
> containing platform specific entries and iris_platform_data
> structure.
> 
> The goal is to share most of the structure while having
> clear and separate per-SoC catalog files.
> 
> The organization is based on the current drm/msm dpu1 catalog
> entries.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |  2 +-
>  .../media/platform/qcom/iris/iris_catalog_gen1.c   | 83 ++++++++++++++++++++++
>  ...ris_platform_sm8250.c => iris_catalog_sm8250.h} | 80 ++-------------------

I'd suggest _not_ to follow DPU here. I like the per-generation files,
but please consider keeping platform files as separate C files too.

>  3 files changed, 89 insertions(+), 76 deletions(-)
> 

-- 
With best wishes
Dmitry
