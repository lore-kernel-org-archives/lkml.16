Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981082E6D09
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 20:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749931868; cv=none; b=eueltvMN67uOJsudIdqmB2mzLFC7nzbvxTNeBayuhluSICqy2zj93htbuHFbVWUTc8LQvdMqZ/IGH4IvsDXt9mtdXktkTC3WZt888MLhOdNCfVsYJqSoLP1ODuWgd42Jql7N+/du6dIMhl444YP/i4cKoNAqKRMtwIsHx1tqipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749931868; c=relaxed/simple;
	bh=Lf9M7Zr6DW7RmmLY8Cgj4YgFzJGrLdOc6mEeFxy0Ouo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGeQ3uADWDT6eVz0ADFZgo3VQv5T/s0sW+RvPW6sKK8ENmxoithp9+PgIfh37QtVXMe256lUoJTjb95Th+YE/s2Ouze1ssPR2dvgKGm8cxtUkKzKwuC77/RJDccmy3G9XKbv3Xk/POZaTFBEDHKK7AWLI7WjXAbASrahmLTOGtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksqqlrLe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksqqlrLe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EJcDNv029392
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 20:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0jNtszeQm2L003a+S6O026ShhafqRqBRqMlvofcvflg=; b=ksqqlrLelS/xBtJ2
	JJBd2+gV+QcROc8PTelvqKMDdMu1gkGamoh5Iz7q6rq06XbGwV2u5M4sFnDo/PG9
	mlYKK0Y1YMYsPvsfLgV0ekY4UNdb+PSFMV4KoW7nBTXORge2jYeqPjQyxbVYnaP9
	dZYWsnRVAVXviB63rqqazXHQnhZFK5Bc5ap+sAFi84VOzrUlaV0xIVWEYaizquNl
	WdsJ75HbpCERM9p0CVDj76YbUW8FLH+8f1ePtjZnRuqfKsObdKfsjEVVIOAU0UVb
	Scb4PIcQJuIqSMLuyBt/igP8HX4oOoxgczbWp7yPq6yjNr2RfstBVvmjUDXsatSU
	R4Yz8w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9rwqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 20:11:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fafc0e703aso3616346d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 13:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749931862; x=1750536662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jNtszeQm2L003a+S6O026ShhafqRqBRqMlvofcvflg=;
        b=b1nPacMiYFeMzZSwlKQe0sTThPuCoN+ReCZX1I0Bge6m4Ll0Asz6R5z/HR69viA+Pq
         BLbXI4R7jWfwURxXgKqCBcsrnuXX8KCx0mSpUl2tAMNcC5r7Z0xEb6yLkcewg+71V/Q9
         mVEfGPiiZWEgS6UyNNNXVFnR99NWUQnh+sObUvz2w9FN9m/XvtDaEeV0JLU2R5veylp4
         uQZAdNgunQGRTJ+WdxzLutGlJBkdCYvBFULKDrUczux8Z35qvFrRiMFLrQXHu6D2qMn6
         PvB4UwoUCE7d1RsWJQt2H8cpbMeakAkp4N7SPjPSC19kjt8LqvUwYbo8ELbgLkNVDoC3
         3POQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJB6EefhBZ4Xeyr6aPYO3dknTgpmDWdTzBm+ONFvKT4fHg+QHxDmA1u75Kxs3/IT2Opl0YoKQbuFIZuyY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd7tDi63u/Bfo44rmU1L0UUgxq10FFgSNpn8KHmxkj1YpkPEJo
	pS8KlI4HY8oOe+CPmpyjaRzJF4n1feGhREF70qLuFpdpH3PYEWTNqYajCm1JUrTWyMb6FazhMom
	goDC9i4wEsTGS30ppOW7hxcuwumaGn3979JW6fktcbefode3Or9NZrraLWvECbKezDII=
X-Gm-Gg: ASbGncv6Y7VeW+xfk4mou0pmN7Epd52v2En0cfq46QSLCFL7gu/uNzqDuzMbAR93Pri
	VaJ6iwQSh+U8VlPID+Uh9X4GVHcGKGHCMx7fUPOVCeLIL9teB2dtvgD2RyOLrdiqSOCIj7AwwoF
	r8sT6/i4uMita5tO2h/uYpiv+dJ7SGTb3QIAWgcxxgPMmzZiKXH9tkX0xpGLK1JhhqtP3g7CVgV
	zg98+Y8Fi3zac93ltVAr8EV5cYiTmvzwgtFWK+B3ymHkU7QorBJKJa2JdcaXd6V5oxsR+XZpPr/
	05rx0fiOMDo27+vQRslW7AwaeZl0IHgTl2BcsM7B9MUOkx3n1QAw46K2Zn2/thyEHJcwKBPNJ0T
	QvYc=
X-Received: by 2002:a05:6214:1d23:b0:6fa:c6c0:47dd with SMTP id 6a1803df08f44-6fb477df5d4mr21509656d6.8.1749931862560;
        Sat, 14 Jun 2025 13:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRES697/oN1AQmDhdRQilCw0Ubbzj8UpxMJ2bP9ZmoY9s77DbcZSICsQ0QM0NVB4w93RwYIg==
X-Received: by 2002:a05:6214:1d23:b0:6fa:c6c0:47dd with SMTP id 6a1803df08f44-6fb477df5d4mr21509546d6.8.1749931862145;
        Sat, 14 Jun 2025 13:11:02 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158bf0sm355754266b.26.2025.06.14.13.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 13:11:01 -0700 (PDT)
Message-ID: <74f7053c-10d6-4aca-a87a-0ac7f55c2f1f@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 22:10:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: rename bus clock to follow the
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250602-sa8775p-fix-dts-v1-1-f9f6271b33a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250602-sa8775p-fix-dts-v1-1-f9f6271b33a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yE5SBPObYisAOAUmtMFBywP4MHbfhxWA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2OCBTYWx0ZWRfX3j4I4WK3hNIG
 +/EjqSVgeTDVMXhh/PV5Gm2sfHPXoSS3PW6PgVYSQi9cVdsN2V9iDR4wpJcttp9nqo49Hf1bEew
 vDfHCpzMR5th06Eu4+sHOlndw7CmR6A+t8ZXHsBEow4v1Nw4nF9eMquIxeB6puiY0CleetvxRGp
 unLO31i4IqLmcKXwEPbN+VCGyWzNsBsSqnWTZM6BMA2X5Du/ljy9Odr8J+SbEBSg10PUQeCQBnc
 neS/A8cwis/9uBjFyJI4FeHzTDbLrt4hVh3ab+/eV6P+4CFnKmA0M2kR1eFe4cuChRsWOhdjRBz
 +8uM1PH2Q294EiUSu4mIJE0h6qt+nLVW9pnRJ1MLo06Q15CyUJaBU2N4IIeDwU+NMwVeM0tqEEO
 GJEh36jkbYsqjr6gI2PPYYKk8gCmJVhI9pzR164L5uqqhHlGpGJcj014gKBU9TPho3YBBgn0
X-Proofpoint-ORIG-GUID: yE5SBPObYisAOAUmtMFBywP4MHbfhxWA
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=684dd758 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=3CVIpg13t1iulFfMIbsA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=922
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140168

On 6/2/25 9:23 AM, Dmitry Baryshkov wrote:
> DT bindings for the DPU SA8775P declare the first clock to be "nrt_bus",
> not just "bus". Fix the DT file accordingly.
> 
> Fixes: 2f39d2d46c73 ("arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 45f536633f6449e6ce6bb0109b5446968921f684..7eac6919b2992a3512df1e042af22d0cbad04853 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -4122,7 +4122,7 @@ mdss0_mdp: display-controller@ae01000 {
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> -				clock-names = "bus",
> +				clock-names = "nrt_bus",

Is it the "nrt" clock though, and not "rt"?

There used to be a split for non-/real-time use cases, but
I have little idea about the specifics.

Konrad
