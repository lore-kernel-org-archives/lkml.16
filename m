Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B788266EFB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861520; cv=none; b=G3YtHwmi71jG6gY0nSmnEfJrPy4VV3x45YARtk1Fd5/kqO9XaoswskxYxwOQNDbIp0h+cJzZ2aorxuxYjzp0b97wdVHeG+jKOSq2LMlz62PUu3POLrCLICjhm9oCet0NpEaEYJNJ6A41ONVShVWVCjwtJmwq1/yXCQD8L7Z/xzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861520; c=relaxed/simple;
	bh=SMDUPPCgoy4irnfRcvFwYNWDljy6PoXj9dVonnDd2qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RK9BWulnKoPC3rusA+mrW1qbXovh6clEkjCVOVn2cNuNHEw0Nq/RjP05l4ng1FY9sQS4+kzFTyi5pWRUcB1FeLRO4PjePN8MKIXMlqSEyhPb5YNpIeGsE1Mlf3K8sdVvD32rjwGRsxpwTe5QkJ5G5K3paZI8i5YPis5I1qLJMao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gvz0OY/N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gvz0OY/N"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P9ca6P032292
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r/9WVv1gsWDZO+apIRm8Vr06
	XSYUUadHkZ0D69bY6lU=; b=Gvz0OY/N0xL/7O+DlYt7P2YEtVRVSdbfx0RBJSjx
	17Ohq2EXTTAvcWyu38mbExIYiktaU1ZTWT5uDeA5D5Uwosi67mre6F6PpCKIJvyE
	K6yk0Sj9JZv4gEU8o13YHSETc1uiDrL5j6Z8EIwuXVDR7lfnkbdKp8fH2KqMZEB4
	04DQI43IrYPyzb4nqrY2jGjxX6ptgYUxhggfpbTa3lb/GPZhLrYllrKL51i8umk6
	iZo34Db3ZpycjeMaZczcVDPrMMi2wJNMvfVjPygBePBwoQVHYXLZO4S3csBr36y+
	rjMtd5FvLdYzR8YMGnzUO/mL2VL6IyEWkEO/sUwX7B0VUw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1xrk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:25:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d400a4d4f2so308527785a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861505; x=1751466305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/9WVv1gsWDZO+apIRm8Vr06XSYUUadHkZ0D69bY6lU=;
        b=LBWzagEjISBjESM0uOUenrQIGRKL9Un5yLWHWY8H1KDvbNJ82onK7PDlDUskL/dStp
         H+URsJ5ZQyoSyoVOoeiYWAY7k4rscDew8PfNeUOOeE70zuwF4nXrGcMIIpBJCe3y68w/
         pD25mR5vs8FqBKAIryDFYUA/gjMB5ui8ZOMqJHS/xaY3NLJf3T5Qvi335BmA+PhYPqTT
         kMpzj7FqcgDJYV+MGZJEHntRyv6bZxGVff2u1bOfl0VECBBrqhLjPlQJVnT2aVxv9NpP
         sLHJHSBKr4f1qrEWB8rqZhqMiZCTjmLbqVl3E9VfLlPmEo3yIhlOd4AoahPY2Ngu0Z2q
         Vd6w==
X-Forwarded-Encrypted: i=1; AJvYcCVSG06RfqwechwK1tO8LlWa17nKIdRTbwtPjqDdaWZjxQEdCilsiMN2xcCChEBd+lPS5IqShztEvRNl5a4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhhMfrX9GHys6IdktRrv2qYWwNBDYw2Fh56bI2vDevRclgFtAT
	hCZwFkYuIBCrP26vfIK4w+c0S99/S+ITZY/vCGMxCeAc7hazBAE1TDlK/EsrGS0Ugn4uiNfSrKK
	GnSBPREjisIW6YoU5oNcHxVeZ9YEQ7ldXg2EBV2B35XFOnKfyaUQPIps0nG3XjMpL5jw=
X-Gm-Gg: ASbGncv67X499uP4+PbyNnlUaUlFVCgGgVjOckbQvQEtVyg3bCKZTcoG5Lz6TSyibFN
	Jyg0wney0vXW/YRNKF27/5cc+sGySKytDU1jP+Y5yPEQ3tne+uFeHojmwVo+laIAvcYoa4hc950
	hNUaOZn2B/N1QhNL5NDPf4mgsL2yUSjJY/FZf2gxRN2GzyyNbIs/qTtYjLc+zXf0CpONHrFM2Ob
	pG/MzshQr5v+iWnVNRffvSuV++/c80Zuim61loh2hFHbxfK+5iyuZYoeRrHtkfRObwz8avYD0iH
	uvXV1Klo1SUSkzHu2TsnJTjVNI/PohX8Kx58XLuytP/8axtzY6bIvRxVU3A6gkfdmk/pnqH8huy
	hRoCryOHddGR4cFA/OnY4M63sbtnzMDpTs6E=
X-Received: by 2002:a05:620a:178c:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d42969209emr390998985a.12.1750861505063;
        Wed, 25 Jun 2025 07:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGEgmUYzG5q66jyh65Mm7bfSX8TgdMQuftg7DpsTSuzDtL/tJHOo29ywzX65LlAhePFJPlSw==
X-Received: by 2002:a05:620a:178c:b0:7d0:99dc:d026 with SMTP id af79cd13be357-7d42969209emr390992985a.12.1750861504345;
        Wed, 25 Jun 2025 07:25:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980f10desm18964771fa.111.2025.06.25.07.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:25:03 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:25:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
Message-ID: <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685c06cd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=ACp3OnxLZ-M-vqTyPYQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: jXBNAsCE6hU52xXCKvIqgZ1NQhmN0r7p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNSBTYWx0ZWRfX0cRB+F+r7ewA
 V3f+x1no73Xcd6IEnAESkUUOLCAYWx97AiLmpb9OcSnFjtnOnikjLFxrrX/F9OiDZR3Bii6TkXB
 P49Wvw3+5+NN+UGjrX3C5iBu7Q6m7ODfQzY21sqlQHs8u4Tv+s4NK+YqO1gYBmP/rC0hvLKVV1J
 +lrO69G4cHc79CP+cKjVGJ//2loNoYJn+HFT5tCgwaSf/DRcptmKm7vVjXqLG9AQZuoNIfRi1hF
 M0KqW+RBQbsZjje5TPt+HCBbFu/OILPEM03H94uSR0H4PLfIs52TXpKNy8ZbiUlW3uRAVa1Mhbz
 otlbc0tkQ8q370qFWDD13SFAzMbyOAi9Wz/YS0Il7Ick2B7Y5gLvTXuw7S97N8z54bVLxzGU9aY
 /2IQqqmszGSXuS6qJcMg179MUB1aeFvJKHo27hAfT17NmDfKFsIPr6Mdpi5K2yhkNOdIWFNa
X-Proofpoint-ORIG-GUID: jXBNAsCE6hU52xXCKvIqgZ1NQhmN0r7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=889
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250105

On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
> and the devicetree description for it.


Please use PM7550 instead.

> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (3):
>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
>       arm64: dts: qcom: Add PMXR2230 PMIC
> 
>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 ++++++++++++++++++++++
>  3 files changed, 65 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
> 
> Best regards,
> -- 
> Luca Weiss <luca.weiss@fairphone.com>
> 

-- 
With best wishes
Dmitry
