Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3841B960
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077448; cv=none; b=Re6fbI2y4BzHjuC8QbQFNxsrGnM1DatdsWZSbg2Xqcl2SxLzbcfIHQb2aZf+n5m25M9vEoZhEKeLfiUPo2/Vz8sjK9lm6w6z/Yj39T1+ibSsORRPMpDFWgqA2oSmiHKpQKNmpbSQHTfn3E0WZpA+Ylv+CAnWluRKMtphaAQA+aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077448; c=relaxed/simple;
	bh=QzAPxhXt0HlkANWcKnu4lkLD3TuSa6KfrV2FLU/JKiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Es8sPe8/Iag1hKGQwQmeGzN7Law/M8eZNXk35XFeJRibxruULL3qNgsRvBJ9MV4rVf59zQFiigBJqjOZpF30iDTx0OvccdURePKSF+qTjg0FJIqLlrqdvZM6j0JpYHSk6EljKOR2emgL9UY94plgIi4/qPf+hKynxnWYDzcFR1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6YSwswC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6YSwswC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFRs005269
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6EWAFArYwvzkFk/yEjG4XOoe
	Jfm7qgVUEY77C7aSLEE=; b=c6YSwswCYNti2vZRCxbqBFLrKWmuGe9vYVIvyM95
	ggwy/8jNjD/9NgdsN54FZZwrpqR6BNAps8wvo08EeEdk/LhzzHRbVjgHkOgOSkcQ
	cgC3glN83bZsRpsdVEvf9k8/sa9oLoJl17ozWspnMSeoUJGZ++aqHHVmNz8ccifJ
	utfTqdEEoUFzAbYjUCa/BCQfCPS0t92BylHAY6NsWlvPdiz+7zZ9FNxb5uDZjLpr
	2hdEr0yGQbqMv7UNFZd5h8V0XPf1U6Ty0U6M6FX/y76bMrVFVmF9vfHxxy0laP29
	YV//kJFJgNK3uFc4VD+xoURKiLuP8fWbDZDYfhXi7w9Vow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ktenf9bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:10:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c3b53373faso133517285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077429; x=1743682229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EWAFArYwvzkFk/yEjG4XOoeJfm7qgVUEY77C7aSLEE=;
        b=ryvzJSq8eMQd5g/u2c5biHm/bLcltARN2VYUMCk3lFhOIuaBx/C3GLlog3NUED6C6X
         kd11jyJ4RZmA62g+Be2HOR5+E1MQQIulilGvsStnt+lAoWW2e+WS8cms+FWc64oVIkF8
         F9E5wCdhb2ckX0XB4ksk32CaSGdsYsmeTnVKI5FuXzFu/kccG24ioGUvmGFvEbQYSXck
         uKqz459qQW4epoMu1HtrH4MEYNx1As2uzJXsHkezqOXcFpbNGKr1uH7M4aZKh304g6Yx
         Y9KKDju5BQH4Qt7mB+mRCdyBS9IbIzZYktXzQloNn4qiYaJFsWh6uzokA5JiErUoTjoj
         eBYg==
X-Forwarded-Encrypted: i=1; AJvYcCUGqu2D79ST4z0lInwHvHPTOCQhm2e92bHJ1b41rtVAPOdaZSxrPjDyO9Dm/A5cYXCOMezkNjQ9sPjleFc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpv5xHQriLraGj7vwohYA6J1pEgS1lZSYNzVEXsHBkRCmtjSq4
	bUdD8FlqOO3LKvPEJ44D7OzhXbzlYWZELYhH8NqBckRf1GyOVHC11NkHsjkCkGDbDRpLZfM1nVN
	OdgeSqgwAqeJ3B5/akdd32jJ1rem45aIhlAbVeQFQqGqENCKX5lS2akb2mPxS3Yk=
X-Gm-Gg: ASbGncswB3FoCAHAIcyvACdcHGsYk6vHjY5nfrJJouvhmyL9oldni1TFbqYvM2HjZrO
	uCxv1huWcreCq0+kJCzDmCdlRfX+BEHuY6X9JXzWqmLXG/ev0eF0US6slZupMxm5l4WzQeBGJkw
	MBJ1S6IaRO2vllBVNHAq5oferD2zpfaiDbOZs2xbtdEu+kMUVB0ft63Rq088l3jDok/UmVy10hJ
	WVFE04SZtkBYO3jvSlQekSdr3Rl4Rp8JQvbXLkNxvmUoWpbp2YCc2Ga4ScjkQpgJ7LK+C0M+l6F
	tfCikAOMzvAuP4RYZSv/vsVdlzcpjuY82sO5wz1ukbztjeLHSZNPksDxZ8Nj9+sOHOs9KDoRE3S
	dZRA=
X-Received: by 2002:a05:620a:25cf:b0:7c5:4caa:21af with SMTP id af79cd13be357-7c5eda818eemr550056285a.53.1743077429231;
        Thu, 27 Mar 2025 05:10:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEQDaxxY1c1JIWPv4Vpd7ya8lrOIR4YdlP6XXz7ASiHvYbTcShWybxOIgvCu8n6tJpJQuRsg==
X-Received: by 2002:a05:620a:25cf:b0:7c5:4caa:21af with SMTP id af79cd13be357-7c5eda818eemr550049585a.53.1743077428725;
        Thu, 27 Mar 2025 05:10:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910e36sm24064021fa.93.2025.03.27.05.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:10:27 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:10:25 +0200
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
Subject: Re: [PATCH v2 10/12] arm64: dts: qcom: msm8996-oneplus: Add SLPI
 VDD_PX
Message-ID: <unolvsafjyty4vgfygedyf6otd42nqigzikwoqwawbj7ks6bgq@shz5b3v6fchh>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
 <20250327-topic-more_dt_bindings_fixes-v2-10-b763d958545f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-10-b763d958545f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TuvmhCXh c=1 sm=1 tr=0 ts=67e54045 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ApomA1EUvWpH6PII-98A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: I5bxEcW4CgD7QKb9Ue7MfBJKeg8KO6mp
X-Proofpoint-ORIG-GUID: I5bxEcW4CgD7QKb9Ue7MfBJKeg8KO6mp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=692
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270084

On Thu, Mar 27, 2025 at 02:47:12AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The PX line powers some hardware related to sensors. Assume the board
> doesn't reinvent what MTP has established and hook up LVS2 @ 1.8V as
> such.
> 
> This fixes the 'is required' type of bindings validator errors.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 5 +++++
>  arch/arm64/boot/dts/qcom/msm8996-oneplus3.dts        | 2 ++
>  arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dts       | 2 ++
>  3 files changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
