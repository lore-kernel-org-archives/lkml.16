Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6EB1AB6D4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415607; cv=none; b=megWBqAQIV5UN0qd5r74ujRlieF3a45o6aOeAGI2kfVvfFEogQIO14Nx8Ns/J0okoXEYOztkJHkCVJT5tf7TUJrocW/9fiPukgkrwEEyo9/HXlXsEtByfkq6wUoV6H6PDR6nKFAAV43q14NXOKh6wSoea8rgl1uKOFTpj7uTbfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415607; c=relaxed/simple;
	bh=rJwd76XakKbW6cxRp8U5C3y66nF4fzEk7nsIfRq8GqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQQVpmoMOoP79av23XbDgEoKjP6rRapvkj2iExMq+20nL2ew0/vErDGGVx34QxlOZfRJp1gqOnuqta7TStmFUYPkwqgvQsrcqiU7ZSs6j9Afvp24dSvPwfzmeZq+mJqAQr4ou789K3guqeq/pPXXvFGGp6gdnHuSu/i0KMxpWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3/qI/lp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3/qI/lp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB5FIA014200
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MzGZGH78O/v7VDsO0hbF+sd8
	L3WE1LofXSiV/zXbbD4=; b=d3/qI/lpCL5OMx0yWudKghR5Ka1Om5c0Zomxf3dU
	V615Uvp11b6aR0VNPvCfbVGDyrzoj2VGeg6LlCg1/Tj4JWxpgjdxwxNZR2iyQPCF
	4KWsRP1VyGNDDvU+knRPnTmDm235qSfanwbC+C89naB2pizHreeEsm1/sfecsm4/
	JeO+cK8W7kvuplzdnDLxCRKCfwq+A0FQZV2o5sb/gqa4WqUP5Dn7HwJBYs6G2Y9C
	9kdf9iRn59ls8JDeC1w/ilmyrOsAeW761JLPs38rd+3otMYucsAjxNNXvgrJxzss
	B58J6sk4sm5HBsCkfyvhFG5XjaYp4I0ukHWipHXkwmHb3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a8rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:40:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c572339444so984398485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415603; x=1746020403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzGZGH78O/v7VDsO0hbF+sd8L3WE1LofXSiV/zXbbD4=;
        b=HCLWmz7ib7v33nRyZ7eesIIDIkFbR+DeP0388IVJ8y+GR2Uo4358x1/qyEsZUcl223
         h5ioY9v6iMgaVKrg8r8/Qmuip+magKyPm3aIY904hgklTZLgUMxbbXXrxcVAhF3s1QO5
         Knoh7Xn8GAFrLmwQmuCX8CsxZCdWOJrKdfG2+UKiiGFRXpCtOcUvgb1CVYWKHMbJMANB
         H6eDLCyKT2CvBzUoZgINnXBpUbYgqSeH/gfPc7DkadSS9X5eWZGqA+2X7mhibHJm6azI
         3bFZa1jw+pqRGMZJqYMlbIFdJAf7mlDLfYQ66WP8zKQKVXeweJ6jQuqkQkdYjK95bIzd
         TL/A==
X-Forwarded-Encrypted: i=1; AJvYcCUoWqNd2nsCrnUGb1tAUfMP6TVpIk6xfnWbew59D+C+MTiCeMPZCSWDi/zb43NTXLE4h05vMWYi5xhT03M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMh3PTX/Z/lS0JwfffWutWd5k9c7FIUQCONxD54D7/fV550XR
	T8YQ4qEsaFrfOxlslIeSs533rU3smPABoSFs2ANbbdB+EdCDLsxSoHq5Z9mIowjGguHz2s+bUm/
	mwVePIMQTP6cfCU40oo96SclF/7I1MSrvydnP/+F2XbrBdsSMZ2smt+s3qxPmr9A=
X-Gm-Gg: ASbGnctK0O9nDfRzRVMW7vj2Tl2422Z0m3Sqg41t5d4HXoaHw/kwii3P/7AJtR8mTUe
	L0hxkzfFTtMbDsxQQ7oHAs3V1H8WyWVE7ZqJIWfyiCBqMyELALvrfLVmVsnOek3zqpakJzFOWWY
	J+jdcbx/VKU9s9slQxhdIT1w7jliUXBpYbILluDoRhK+kbwLPWb6WF9sKvgT1Ros28rV5uJsc4K
	W6hhmyOUGZTze0/1AVUIoi1vozU274fM7SeiSSAhkuhkY7mskNnVKKsFUrZG1hY9g89YJcwAPVs
	532TIhoceCRZrqN893EjmIY5250VeyqE4PfY7ZDa6A1r4IUIiFz24hXAblz2v4XyJtbvuWI3/n4
	=
X-Received: by 2002:a05:620a:4001:b0:7c5:3d60:7f8f with SMTP id af79cd13be357-7c927f87cc8mr3328124385a.18.1745415603142;
        Wed, 23 Apr 2025 06:40:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXVhG8h0EHaKSHuLFmXYtc89YmYuzioiRWb4XkNp4qE+H/B1Jd7+nH84J5Bky5hsij5Y6aHQ==
X-Received: by 2002:a05:620a:4001:b0:7c5:3d60:7f8f with SMTP id af79cd13be357-7c927f87cc8mr3328121585a.18.1745415602827;
        Wed, 23 Apr 2025 06:40:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310908270a7sm18290281fa.66.2025.04.23.06.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:40:01 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:40:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
Message-ID: <n3o4a7jokelces4jioccoub26ikwpeyzuc4ac5uzvumqkilha6@gc7w3qpb23q4>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-6-a94fe8799f14@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-6-a94fe8799f14@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfXxxZ06MFpn4d7 evpUkk4rShzOYyIX5XgTCuQh21O3fO+Qhtb8AZrBlLSjnpW5oZqYYAD5ltIRSgOa+01xLlX9G5t e4gt4oDoQRquI1VtKrzj0g2zneXODB4VyuOYrcUiLC+XK61uL2viowhLIJfbLSQNQhMsGycB8np
 2M+2HsHG9KgOaHbWSsKiBQtU5ARK9kMLtWkuXGStLCof4+npXPn8p6al2d8qslWv2Cb3J8WHOdK rfcUQ0UhDJa8EhJR6OCPWDZysstuSj2U0Bz+KKPW9mW1JE3GCKQ+Psij2S6nYzTtVXXrw/T9hZi mVjsT9qFVov5ODYZ5ipkp6SpQKn1hegadpWTFM5Ff4wOH7k6lhdCXIW/1u38kSIYfIs8U2PetN1
 VC/zQx4dOdC0TPIXEwd1+GKwTCydYcynYNZik82J5A+7OQoUxM78yjXuqu8CvHznWt9Mq0/4
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808edb4 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=2fRsUtMu-athF6_tqjIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dWyGWBUUimX1h1upBpjTZl9xttsFeXQy
X-Proofpoint-GUID: dWyGWBUUimX1h1upBpjTZl9xttsFeXQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=844 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Wed, Apr 23, 2025 at 05:17:42PM +0800, Lijuan Gao wrote:
> Enable all remoteproc nodes on the qcs615-ride board and point to the
> appropriate firmware files to allow proper functioning of the remote
> processors.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867..b0db2c3ad409 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -240,6 +240,16 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs615/adsp.mbn";
> +	status = "okay";

Empty line before status properties.

> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs615/cdsp.mbn";
> +	status = "okay";
> +};
> +
>  &rpmhcc {
>  	clocks = <&xo_board_clk>;
>  };
> 
> -- 
> 2.46.0
> 

-- 
With best wishes
Dmitry
