Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4817320E331
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070093; cv=none; b=ZzPlzKHbYByeOEnyfkpLEwT5ZrTU/BXOVXgiWPzpnUMKmKtU64W9ZIb6KNnrC3sCCQGOdT5tBHz5393jKGkKhm7ueWQOMIVE/1vz90nmX6t5jxdcCSD7SouOp5yqEJPb+LWIG+KY1j7+zqk1ndNAavi+MkoR7dMqbJQA+MCMYEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070093; c=relaxed/simple;
	bh=lmxrzIS+d76Qh3zL9kdazJJMQfZpNeJz82hwqqtwmOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLYK2v1CnSJJKdl6mZjqJOXgOeYr2kRxLicljYWMRlhJXZ04ufDW3tIL18fSjgpuRRxBX1KzRZCVV7Htwe1Yj5JxQIJHMYFETxpMIJTaDqkmL3EfhRAs0tLWXBRcjxG5uHGl2nPovWs2tFl3nG1ATy9+DBQpz+XZ6BjGoBcPDPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSr+DglZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSr+DglZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jFjF024938
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v9Zn3NFoa6qbW13srYFRWI0q
	FLJJSbYP/Owvwt3xu9A=; b=XSr+DglZxUlwrJiiVO6p2cbRjHyH9VV5LZH6k+Fv
	2GhmzyQyJcpVvaTm0RUMLq/Hc9lJV81nRU1PSfzhvOm3h4bw1r5Lek1WRZwP/OQD
	TIVgqX4HH6ZU+6cniNZbXxsd4NtVY1PQDiplHWWDJCHFqM5XT+o4TpbkYjt8NGpI
	S8f24e5OKX2Fdb156tPJx53nE6gEgK+Md1zndI8/nmTvTrY9m+EHaWFJ2nSuqw/3
	W/1mfodS6oxPlaLK474YWT6DPmXOzgy6EyRDbmSaqTk7wWN4eHjkw0x88alqs/vw
	M+li+dQx4KOk7njtoU1o5wJnpgy5cKFD5XxCmM2GDziF1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4r539-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:08:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c579d37eeeso126232285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 03:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743070090; x=1743674890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9Zn3NFoa6qbW13srYFRWI0qFLJJSbYP/Owvwt3xu9A=;
        b=UTmXehfL9+an4J/tlWQ6MI0P1fW2aB/0hYW6l2AZ2NQwGI7unCyALHfbji3VH8dYts
         IaaUzkGIAZuDbeBpTOsE9G5sNVqkiXpefqM7m0tXZvMKnFLYusPf0ow5kpVv4kASxd7D
         okG4/+FX5V6J1lGF5GO0IuiyTM/fUQWYKOtULn7AfYhnjxls+4R7I1o8r+6vgu2qyAEu
         VkbZrl9F1boHekeUn02GItH/O9Tf/v1TvT7w2eL307dBhV+BNnPXJlo1tMMjBQPQCJz6
         ixBijjTNfiOcy92hcLfPlibRN85gvcWFTImblVPKRJE/MA+DFzhY5wcYDOzq+vEjtPt9
         ybQg==
X-Forwarded-Encrypted: i=1; AJvYcCVK5lQNnJm1ZUz2s9aTxiT3FwiLaHchZ/uSUUKnSAN1FeDWbK9vclKzeoBzthCtCHhDiR+gIIqbbuAf6X8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTDDYZrKQJWZmiBIh7Xw3y2yGhWxG/FtoUcSF1Lh1OdBzeQ9bd
	VsmghhRp8PdFwrzn1klf+yjj4cVQW5xCb0Fy4ag3PkT8c6DkYm0FCEifucLMCGilcXEiiY9nt0A
	xv30D5JMUqv4oiwvElt0NhPuUnWjESYFK63tOwQN8YB8RoDuDYNjMPAKDkZioaO0=
X-Gm-Gg: ASbGncuza8j4omdL7LUBHBR07/G6YlFCVSOTZvVAvxLeWOQ9l/tRHwd0UhOCn2TSFhK
	5pbLHsLARM5ItdlLJhO/UsvH28E/qNccyctfIwvs7OrdyzvRstZ+T/aDOpjHzVEBGXHdEOxcyUQ
	yr88bcUMSjHc1yySHIariGkxgLY4YcwG2yulyoJPzN91gt4wRYSA0J+ZfpUbVhAAbRENNORfdco
	t2if/1VbPreHU2Q1Suy/I3hD5adxaQXUBbXLQobv7Nt6W3Ivz5FjjYkty5nIvxPY5QX42fRNgj5
	4i2q2m/yAdPFz+jfQt+k9j7Ky8B0s22YRLpXgiLYuoTwxc/nFK+Ri2wgw6A+jkeH++3Bj8SVzdP
	Tbjw=
X-Received: by 2002:a05:620a:31a2:b0:7c5:5e9f:eb30 with SMTP id af79cd13be357-7c5ed9fd929mr351144785a.15.1743070089909;
        Thu, 27 Mar 2025 03:08:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfo1HINB6YcRjR3qV8lWRD2r7J0TP04aAmHGCotilIOFQMpC4PSzHQ5mqIDTl1lKVyghovcg==
X-Received: by 2002:a05:620a:31a2:b0:7c5:5e9f:eb30 with SMTP id af79cd13be357-7c5ed9fd929mr351139785a.15.1743070089450;
        Thu, 27 Mar 2025 03:08:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad647b635sm2029989e87.63.2025.03.27.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 03:08:08 -0700 (PDT)
Date: Thu, 27 Mar 2025 12:08:05 +0200
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
Subject: Re: [PATCH v2 09/12] arm64: dts: qcom: sm6350-pdx213: Wire up USB
 regulators
Message-ID: <voosrd5xx72gh2p5qbsp6ghdkm2jo4m5psrm5h2gmzi7rrmsmo@53qpvewgzd5t>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
 <20250327-topic-more_dt_bindings_fixes-v2-9-b763d958545f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-9-b763d958545f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3HOidaENR0Me5fe8QbM3nLoJm62PU9VL
X-Proofpoint-GUID: 3HOidaENR0Me5fe8QbM3nLoJm62PU9VL
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e5238b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=iXEU_j0xfCFYBHAbzAYA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=630 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270068

On Thu, Mar 27, 2025 at 02:47:11AM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Wire up the regulators based on the downstream release to appease the
> devicetree checker.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
