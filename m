Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3BF235362
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806293; cv=none; b=DGvCH3qUr27QLUaCGdmelORm8pycllh1kMVad7ojNzoPJjvZXbxp1VahCfhPzEv66/Cdzs8jvks5SoL+1DetEwE/oQ9P0zWo2Koj5cu2RjUrovES+z3kLgmiVqZERc9GWjSTxIKMh8fZox6LqfnEHhH5qhddXof3za3RBhU9L+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806293; c=relaxed/simple;
	bh=irLWXJPagDXrveAmW0ysal4JRHs3lchHeVAcCzAJ2r8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHJZOqBjEMNt6mByETe3d87D8LIrS0JU7B2LorQNcdnwXRSXpco3TkgqWO+3HOeW9HCS8S0t/OKTy1VxE9HkLh+TqVrjPBxA8j8szpW1H36UBcPXk7A1RKaBUjhe7MVbY8Nk0LLg83MPxAivm/mCd8Dlk60f/D9JiXSqml+80aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=li4S6GU1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="li4S6GU1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5499DMib013551
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 15:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	262ZEu3WvDh8g01OaP8GQaXghLw60EkUopSCqASt1kA=; b=li4S6GU1QS8jfOs8
	7tbEPRR+sag5akPfFJ5exwolDAAG/DlVYG6QCOzjA0ZhvlQ/FLXWqEo+R/mML+E2
	uPUS6CxHdKmf+8feDXaTt7ROIKyDb4/JZss+5zgBlO6g/9T3W4otzUD/krzI+qQw
	NW80H/eUvWtrRv1Ywm62MLWqMGnKIubjqGWkCqZll8hGwVDLCJbcG9nUSd6epsL8
	/fZBVqpJVl+AJJ0+gPW2HZGsCRjYC19ECHxe59aXYGGlCp+eeKQM6+VVXURTxQ/V
	KUAfNPfkfQZBcOs6YMH91cViEoG42PhOuewPHrOSkbKouj1umeG8Br/8UUIaK7Uq
	yv7oYw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gt52vcd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 15:58:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f5495bf0aeso4122256d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806290; x=1747411090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=262ZEu3WvDh8g01OaP8GQaXghLw60EkUopSCqASt1kA=;
        b=tATWLHm4BYZoGlRMnxzMYnRGhFTDWZnyGmSDpau55Z4N1ob9/zVIwNNxXRsqmPSHXN
         JEwDuxgcHndieh2Y9pKCeiajFV6xCXUEfdMEGx0V9Cp984OyZ0CkBxLNuRAecUq7E2s9
         MHp+pxCk2Nt0O1aAnwHYkl6oooiVI6wbg+SEsA787fXLvJtizt8HQaBiJFgGShPVRPou
         5vHHuKU8ntR5U9lW39gcUqKG0XErGuOc+r16vmm/+/TvzO9/nikPoQbYyupbTxwKjqFW
         Qp+d7Pd5coPVEHRF6CjDD2rUNaYLUlTKLJjM7GonnnZYLsvkZTtIlm/o5X52WYTd2Gwq
         oadw==
X-Forwarded-Encrypted: i=1; AJvYcCUaLa+txASyDmrJhItiZg90eemQ2TnbX8fdpTd3Lw1exfYyU8pOyPgY/OU7zwSNs4G6HcyF2hH45ZXzhxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk4JC1Tu9pIwSXxK93gJvI3sd+XlXYlOiuWkjE+xnwesB4chLg
	cT4DHIclC0eBUDHn5M7/Pnsiwy2Gqd6TUXw+EDDWaHeIeCycciYCLGJdq6SkrsHLFoelpNtYVnN
	yPmBZPdBysHuhEDOzKZpnu7rmaq7HCDyoex8Gjbhz1pSKuwvGvjO1FpnSKqt5OjY=
X-Gm-Gg: ASbGncs3yJkdkUiJCAMTmBTW2ATwmQASWUnzYRwRM0/TL4RT8OpBDf7hCYZ1fng54xz
	LwmUZp8ThnY/Tnq5UTF8pBQt21XgRkLdLmHUS+xzDhmSKNxwWqk4RtkHBG8JQUXnJvsfUb9ziOy
	qqAq0Z/uJiN4BI2iJ/WUOtD2nb7ftLOT74RQZMQlFDSeuB09xiQdE/5Ws8fZe3+1okVjJLUGtrN
	vSn7Pj2BFyBl+2i24bz4KFNk/EV143IBpr5EpjHCaLKTeigyPrci5jE5pPSSHINunhPSZIuv3Mw
	iQFEAjpy9dJP4FIzX7ouOgwFaGec0u9huZqiafvxCizfv9CQ6qad4D5KWnq7cmCw1E0=
X-Received: by 2002:a05:6214:1bc8:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f6e479559emr25148526d6.1.1746806289933;
        Fri, 09 May 2025 08:58:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvG0eBziMbOZ8EBGHmv1fc6XD7+4vLbKGzjZd8J2ynq1/rKSXEFQ5tVK2pqkSnfFcXnm0YbA==
X-Received: by 2002:a05:6214:1bc8:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f6e479559emr25148116d6.1.1746806289370;
        Fri, 09 May 2025 08:58:09 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc52937sm1637448a12.48.2025.05.09.08.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 08:58:08 -0700 (PDT)
Message-ID: <7347ced4-980b-4630-9b5b-4810df249b89@oss.qualcomm.com>
Date: Fri, 9 May 2025 17:58:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm8650: add iris DT node
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250509-topic-sm8x50-upstream-iris-8650-dt-v3-1-f6842e0a8208@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250509-topic-sm8x50-upstream-iris-8650-dt-v3-1-f6842e0a8208@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1NyBTYWx0ZWRfXwAwLlB43vJhv
 8f3dHZS3/DLKDcOgFiOf3QZ1HCjV0x3hLRIynUveqRvlpSHp3eci5xyuNnbU8sovjcaWfw/zgEb
 frQ/JlzNu3o/YUn08+KSx/6+tFLIzaB1vaQ5v99UG2feyIQ4/m4BwWg/R9WIhbjCg+IEG+w9svV
 7/hYhZ7qg35HCMym22/tuHSuoJ7vfO87CaRwyOmvO+E6CU5Sf5uCP/T7aHHjknDUdaGkHuD0Cq1
 NJBHNOWnKS1jNzP7BKqWs7TeVGYkt3594tOedxw6MoKSw64GauuHPu7u3XDGTCGERxKiA6y43l2
 JyhlN6r3Da0C97a5ow4KAbrBB9uibIAvQCsVgUuZs7Rr088vGinEo4r/gox2ojNth/m67+h6Hw9
 Z4Ru1vsz0CCPZoVjuMYG3Gr/4Vq8cp4cWO6j96oMXJAxDvvSXbmrnv1wNwYzyKUiMzX0aSZx
X-Authority-Analysis: v=2.4 cv=LKFmQIW9 c=1 sm=1 tr=0 ts=681e2613 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=rgwGDv9o_da3FyMresgA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gwjX1dfyRPklWXB4NCBgcwESwvS8QZpM
X-Proofpoint-GUID: gwjX1dfyRPklWXB4NCBgcwESwvS8QZpM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=985 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090157

On 5/9/25 5:28 PM, Neil Armstrong wrote:
> Add DT entries for the sm8650 iris decoder.
> 
> Since the firmware is required to be signed, only enable
> on Qualcomm development boards where the firmware is
> available.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
