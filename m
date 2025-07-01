Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D01B273D7A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372041; cv=none; b=WGm0mdQze1CYjFZCAee4VpDN5DKPj46PHlUpTHRxz49nlG6cMVU0qwknKyCxZUQges8vvnwo+kkpHZa9nP1c0EX9lWMTH0YSMxIJXyNaIbe0uOdaIgAupYro9gxq1wVE8GQsaSBNpjlUncsSzMVB+9PFNuGbdjIFgGVYMBqsAKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372041; c=relaxed/simple;
	bh=fc+V5d2QW7CN+ykMr7bx8/ln9xdc8qfTLHTkKZZLnLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TI7/lhrXD7d4E1YGx6H/AxgxOLR08pmU/lHGBCijuCKYOExrQ9j4YooRA8X4YWaDD/ZxCnGanLr5QUvUBHiYxuL3vupJH0DD4JSlI0r8estmlDLp6bqXiQle06FF51/yzL4wwcNUoiKc+0pq4Wf7Kj7wB9T5b90h15ELdkggIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adflSpn2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adflSpn2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619ptvd018581
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 12:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVAZKe6MVUqSmIfEve8DecFvZqjhdtqfXn8WNkgPtPk=; b=adflSpn2QBv+mRfF
	T9Kgjq27zZYwTvH/mIPtYnRLk/yvkQTMVRDKF2PY8vdNEyyyX7RTL9IJ7F2cNoRr
	Sk93tMuVJbXBkIMEwt0/P2dUTtf6b+5Al8i/icQeg8lViSVA82M4RglDrKYC+fEl
	CH5YsKnadCLo87N92Rp7repskwDFJwzFZECbR1XZajtCX/mbtxX+VxZIW5wvApBJ
	zrk4YH6V9w31PfHRpN2MTMLYrELYjtxsW+Lk++TbKIkD4zCwSG7cIFP7JOHHBKyG
	uUcrkfUgdTIEXAB2VAAWWeDq2sODEHc8TyGxkdLZVucUfOTqpgVCfP5pXng/EGwD
	aj6qXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxgvqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:13:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd202ecf82so10299536d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 05:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751372037; x=1751976837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVAZKe6MVUqSmIfEve8DecFvZqjhdtqfXn8WNkgPtPk=;
        b=QptYSOdd6EoZ4vgnWYoLQylIRJrUnCpm1h2hQwhlWloh7/7GiekOs4x247uXdjFPLt
         H3sEFbauIm4whgcE+8wawKbhqncHj9uDkM/GaRt1pVQvz8EYF2HcOXLMREhX3NYo0Nm1
         ArT2eLh4qw7VbaOXAzWGG4tZQYWRYyp5NHsBw9hVXeRhw+squubjbOHCrG6E32NCj/OV
         tkgltLAIlimEeegU3o1UVINM3RQ1aADfDaXfBfWh/qyo1bNBAcHmeVHjfMar0wo9IAP4
         D04SqOteXNNmozzs24h3OQAFk313PuO5i07gtcHaunZREL9k+R8whrTFln+HcvOCSFNa
         HNAw==
X-Forwarded-Encrypted: i=1; AJvYcCUjAN6vhMqq68DHeJf/CmbIPpudX7A7Si3rDE/IPgzfpG66QB1ZD6g7GlwEixZO8B0MYtu0oO/7096MoDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLPscy/fOpLHW73FaBFcPa6wp1rUOnF+MTpnbZGF72k5mGotQk
	9PlrJ2/v+2k367wRcCwCOlvnzw1c2iHvMJUrRibFD4iAJ/AeIImVlFGrdu6te2xYdpLXvAfJDvo
	PTwmuDb4BS8nb6Vw95Abqmgg3OLeILQuuyJVdFXx3Z1vaZ3fbgN3WECylyNjU9tocM98=
X-Gm-Gg: ASbGnct4ioHL1cl9uhGurBf3kzGsCmMQaDt6gg6Q8j0jN4c+yxIQ+DvJ4ISrZ38upvg
	IeJw4llxXCcjMAPe+kWUC7Y5Mu3H+y0tRFrA4fjog+we6oyAFNqN0a4M0yTeytm0ZHP2pJQ93JI
	H1/toGlUV27FiuBdRwom5E5vDSg1HKMiI/cg9kauPON/5hIRSR6xHuP8vETYu04QTwmVi7P9Q/A
	XZs2BOSn/mLl+TTt0+kcVvPlp12TDGIa1/vpv2gcr2rp2vNsct/I1AmRcAwWZlSIs2E5I23qTBD
	Etz1msuJn+asFcpvJeqjDEELurw3JVZuFgPljlurqYehGDJUYQYm2svYnCfIhy4Lq3g5GF2FQ6m
	F8/QEpA6s
X-Received: by 2002:a05:620a:43a1:b0:7d3:cad2:ea27 with SMTP id af79cd13be357-7d468a93f78mr96973385a.13.1751372037048;
        Tue, 01 Jul 2025 05:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDi3p+4z356QnL9luRZ4ca2//1Ovbgx/iA7XNkUbzWU0a4/W2qizB5Q3TbSGueW9e6IvS/8g==
X-Received: by 2002:a05:620a:43a1:b0:7d3:cad2:ea27 with SMTP id af79cd13be357-7d468a93f78mr96971185a.13.1751372036558;
        Tue, 01 Jul 2025 05:13:56 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6b407sm859796766b.117.2025.07.01.05.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:13:56 -0700 (PDT)
Message-ID: <bc805145-b63a-4528-9c59-973fbe4961d9@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:13:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] remoteproc: qcom: pas: Add SM7635 remoteproc
 support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
 <20250627-sm7635-remoteprocs-v2-3-0fa518f8bf6d@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627-sm7635-remoteprocs-v2-3-0fa518f8bf6d@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA3NiBTYWx0ZWRfXzB9aNbvuKKIy
 rz2pc5GUvPuwxu+N+5Qyezty9fLbrIrkWamKLVtDBSELGA5JAwQRFOoiFD57ULcLh8D/iM890tN
 E7VVAeUfng9i29r8QN9GGzuVc37+A8AYv2Vf65t/FgJFWBSBEVFoVVpw77B50J0yd+/xQs2km3D
 O4tCS6SzDiCSnDabjGp7xkQRGhC90LCu76iCuUO90o+Wg8+0Lie3DAGOot1F8oUP4hEpgPAeQB6
 Asr6qhqmGFDJs7ddmoCD2LtFUt0jqm0gFYo90McOrdAsQXsaoPNYegLjACG/Nta1UeDlPAc6f6k
 jsJhCZ8jomDZ5PmX2+tpkRHbBnzT8siQxxQfdRPc1hCTCyIO1PSV+l3lrhJZuuy67bJSMIJrv1B
 mjC+5b34SfP7RbZhVgRiN3uICvTHERFYmOm37SRtRztD0lL22NyNgU36Md1KP2XOSN9v5Ldj
X-Proofpoint-GUID: ZVas77QyqCo0fqyyEApnpujoJj8WIF0y
X-Proofpoint-ORIG-GUID: ZVas77QyqCo0fqyyEApnpujoJj8WIF0y
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6863d106 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=S-B96e1FEKnLoGXqiSkA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=884 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010076



On 27-Jun-25 08:55, Luca Weiss wrote:
> Add the different remoteprocs found on SM7635: ADSP, CDSP, MPSS and
> WPSS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

With the agreed rename:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
