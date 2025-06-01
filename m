Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33A9136351
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748763944; cv=none; b=CvdgJHFrNCmXFNO1/bILRxvZpJusHvW2R2mqVUXzwFny4F/BV1foBk0QxBTa6bbGNL+gldz+5T+kAeacdgxYmkCsMfAs2zXc4Ior/TsSZJud4RBfIKLIcnEhXda0S8sKKgLQkZCkmZemON2RgvwixGstnXtHhHvQlhMRREF+14Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748763944; c=relaxed/simple;
	bh=7g+oDk4Wks/KTMArt+CpUCkKqkXLJZVJzi2niXajCW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdQ6G0xzXg9ta8XC0NMy1k7Gu6GioJCIfQE/hSya/MQmWU+2uTvmQuw+VzbbM5vMtF1q6PfsU9w0MSGRBiu+dTrjgH81XBy8ahQRIlfQjnhzIw2zjwzW122PU8VysCfiiWgwYxpRa/KLsg1/ycj7pqvY7YIzehdBzz/gOc1BiiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dUDcgD1C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dUDcgD1C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5515UxGn003582
	for <linux-kernel@vger.kernel.org>; Sun, 1 Jun 2025 07:45:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T86iakunY/F/6fKCE2e1z1vF
	9U7fPaimiMQLKmQqo7Q=; b=dUDcgD1CoU5G2ZfoXEjRO/wI0auU1aPV0uWQ8a5r
	T+YVt30EiN+iuSPH+RH1DmzpKc+UalA2m0xmnIPB9AfGnAdwFF1BZ0R7X1WOVWn/
	5AFXXRIbPgJvP2BBmFjtQQdSMqVfYA3QWsR3/oQ6Y0/JRRHHRRhjc8u8z5dqIspM
	ugRgT9oAohj/zu7iygepJShe5fwBcLDUb6X31yWoXycqEGGp2fOtAhL9h96dlAm+
	IdlFyj4au8c+jJhoFnqdkU1yO4JpYYJokSGvumuS9UeRF8f8K4lwu1eGM3eduVXY
	araxnBREjFhAAAW3C/qnG5qcn39Dgv6x2IKX7v+c/zIYcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytm4j0f2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 07:45:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7cd06c31ad6so681860085a.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 00:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748763940; x=1749368740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T86iakunY/F/6fKCE2e1z1vF9U7fPaimiMQLKmQqo7Q=;
        b=G/fTOhnAcZBaQX8mWAZAYsEXi6nPhh57rAaDDMiUXsedTFhN6qFXvMSYl1TOcFh9Yx
         B3tUZsuScgXUghbBkSXS/JDGOSSP0ACFHhzEtC0va5NaE12wvrBQYdB99kqOLaUkVzUZ
         xg+7qUz6jWjo7kjCtgMzoCZoTRzdYqk1Br1kqyy3LpkVImvZYqQxvuQvu1qkaPRRsGWr
         UOj5QOr/XDAvIWuBZgkhJUf/zuxpKIfPYHfGpGODNIH59QHpEEQGU9gCL/+zJgZ0LUXI
         rV+2rADYRXrV0kmytxiAiPL/PkbMGukfwISYHKXCQfy8fveZ4BoEUCx1/34i4HFBmNYe
         ep7w==
X-Forwarded-Encrypted: i=1; AJvYcCWTd1EsLuYns2bRoJHoNuD/GV/z9e0Pn4r3j+5cuENGExxFnQ2ZeAHm92/DtprrPhQgUy3fUFvU+cvvARs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwGtwC4YHwy1OvbXS2ognvOY4FLinmm9ALYicbe+UJrYj65azw
	LV6hhyD4syGOnrpYREgnStUC/T2qn9bhpR7pi/wOaCgPdFRBGXaSBEjxhCiSr1W9sAL8FtbZ7p2
	LDHsuf1u0WTFti9pq3eL3pRJrZ9l9Hsv/j7uj2DtEQOXXpuTIuq+3miuMF1GCQpcyPlw=
X-Gm-Gg: ASbGncsxl+m5L1EuOD1ZICvUXPdW/YznyqcL42+UJQxmrBwVaumGQsjuc4p/w4o7PSn
	t3DVlrIaHQ26KqQwRig/+Iz/9Q1nDrxJVPbz+rmZ/SCQdQ+kICYHHs5ahkBT05v0Tr0/qFrv/E/
	d9M+qpph6M6AJaJIRwD77uN20O3jCi/CUr8ZRjXhcGtSucW2jR0EdwmNF4e0nKoiib5Kw0GPYuk
	MG5g947y+YNdj37sF31RiPnUFNix/EzWvmwb8zoQTILMurK/2Mnh1R7o2a5nqlHtjXQ8PC5JDf6
	ygpt8O43Td8mWTABGpU7zPmkYqKLprtQZODehlsjww3RY4Tzlco2C9P6ix/GJQ0nbR0NCy0UWJE
	=
X-Received: by 2002:a05:620a:2402:b0:7cf:431:29c3 with SMTP id af79cd13be357-7d0987e83f7mr1847367785a.26.1748763940620;
        Sun, 01 Jun 2025 00:45:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOfErjfbHAj1jIbvFArhyUzXQUHwq2N3C6oiKrjh0slYknIaa361KZI/FocX4MDDscvYYd6A==
X-Received: by 2002:a05:620a:2402:b0:7cf:431:29c3 with SMTP id af79cd13be357-7d0987e83f7mr1847365085a.26.1748763940253;
        Sun, 01 Jun 2025 00:45:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337937969sm1210468e87.250.2025.06.01.00.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 00:45:39 -0700 (PDT)
Date: Sun, 1 Jun 2025 10:45:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: msm8998: Add Venus OPP table
Message-ID: <jtog7ly6v7ahxdc6rybgnn7mhxv66c4swx7j4oqg2tsndeqvmu@oi22kb7quw5l>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
 <20250531-topic-venus_opp_arm64-v1-3-54c6c417839f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-3-54c6c417839f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RrDFLDmK c=1 sm=1 tr=0 ts=683c0525 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=bnwqEipTlhqVJVXZ2T8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Kbsxc0H2BTxF9BoaCiZ4yEne9a-6zpkm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAxMDA2MiBTYWx0ZWRfX9QAGrSlF8Wli
 rdNO32zjC8PFC70J+bb/YySMatB3W3lhP60zD8llo5X0VL/+MAL6vNFmw1zlIkQVlFqH0f7vm1Z
 PWphDpkCtrF+UqgB/LsRFwJMZMSIanpTgyK6EhtG1jJVOl0UFlgBRbKPkNXXQklrbZHYMSr6yGR
 BDN5nKOJ/tuYy3a4/z22En0R5gJrfuvBIgU0JYeArbp+kldI1qmUPaFfaNhtpikpeC6KD8l4cM4
 t8Bt8j3Wz8VLxJdJVQ+m9yU/SO4PyywyQgbvfaxpRGhb+zS0KIRLqX+Zch2yNaAQPk7SEqhn0l+
 lAiJXXmUnGKxeK8K7z3m88FsfrD9dJ0mwHZFl8Asrmv9iiEQfRCz10jISqErhrRHmUkCrMJvE+k
 j3fyvPveWmQCZb8sCr2IFO6t9yWcAKDtJ6ZOlovzIQSaOu1mzvVrgZ0dU2wCq5jvvXltqXQC
X-Proofpoint-GUID: Kbsxc0H2BTxF9BoaCiZ4yEne9a-6zpkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-01_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxlogscore=809 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506010062

On Sat, May 31, 2025 at 02:27:21PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe the DVFS levels explicitly.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
