Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C900239585
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745576584; cv=none; b=LBGXgOxs/ZPxQb3SAtqOWc8QVMpLCw8OQ8LXP+NiVPhUUcN0TpR+qtE6k6iNtEHYnVdXm9MFe4i2qc68Mo6yQ7+vByT0gatAdWR6yiPZDvA7GiEuTFe4yn6xTjWsy33z9i0RzbYmi8ZZwirAf5HhjshmdAyS18d2vzVJFihesU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745576584; c=relaxed/simple;
	bh=P9bo12OrecKrjN6mEf52NbCUzn7wxcs2GhFekAoyYQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIkrhKSExMG+tUnEQnScsqKWgjHBb4/tWC3f1HWqlVTVTQ0iwJlBM00wmtRKJ2byTt1uSNdbYdV8YZJolZRr+L6DSI2ooE0Z6Ay8VVwceKyRTbnHgxcU7VK1PiRd727leEOyXpQgPpYcHlqbR5bch1rK3+091lJ1rwI8akXPttU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JMwybUwp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JMwybUwp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TIVW023942
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1igCRfVQGLQJpudpkgi6PdBXZlWbka929iUNJkPgh78=; b=JMwybUwp1KJ+ByIQ
	aGAGvjgeL8Om6a7lE1RsM/DvEmelbnmYongVRMpPDm43p43+IbVjpnkYTMbRO1eK
	5GMuqCPxOMOSs6Xu1ajBiLnel/K8rydEhiUbbpfZ6t/MGOtRSpSDGL2W0eanCV8O
	v+1hqh1eBnO7yHQQ0GH9OllvHuqU6vZ3eSSgYRGVBnfRBq/KvzsMunRg/uGYKkKB
	pnXTYvkia4eBMBOwjg14AECZmYRCV1SdCEyZdg/axjuulao8dRH+rvGA43HvfPq4
	sjTNIj0GPhZEXzZkeQAnlzonifaQp9ZssMGckLPEtY0n2Tg+HviMcujVNDqvDlrf
	gMSY8Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1rna4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:23:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so5959956d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745576580; x=1746181380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1igCRfVQGLQJpudpkgi6PdBXZlWbka929iUNJkPgh78=;
        b=ZthGaFo2+kGdeaSGQE/PY0jOPxNJ6JgH0LbcwtMV4mUQEfPgw0SRbHizT1kJ70xhzs
         PvDMkwobCZW0u7t7blb4+3uJP9danX134Se1t5AN8w7GAK+ySRhsVzb0TSchegyzEY4N
         ZBK9pSu48BVzGsrEXtISDtjAQoGC/TGGbGUqkltVFPtld4TY7UrHDm57vpJlTn08wGfX
         ioRJFdgBuh+xR3kkEYKwbtYMQyfJV4kd4FnuW8xBC9tInOJWqwtX4qKdgA8u0pMZ1Llm
         VwF2xgIOcg4SvDALlem3b2vb5WwZxWSPMU5vHjL2Foc6vD/YBkUb9zV5dciYJLEhGqPZ
         GZRg==
X-Forwarded-Encrypted: i=1; AJvYcCWpNo8Hq2RvHB01LxgsgL5mcBYGsEiTEslLZwjiiz64nqYR8KTrcf9cD//ALA+xgvriitkB9TqAtoaCCjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWOuZoAaKNnSskatKGYsnyjjPU64ksemn5I84XZCkN1VCrNsO9
	rCZsdB+9REdQrDoMe8+92xgVsTD8wd+nZSv/nEnfE82eZAWwTAVmuf3zHpFxZ4fDWcmfD1fxw6/
	R0IcCpPqjnNGYsG/5f5XtJG5L5aYwYVjBrPYDmZK5u74z4PnBvUYETesVBAIPfA4=
X-Gm-Gg: ASbGncuOw2MY6hzozxCyFb1gEBss8K2JZInRVviduihKHyKnTAWWzT0lA4kCWctg5lb
	YI4ZWl1yvUwI5m6Ro01ky6pE/mW8u8jGoE/jXlEir5ISuJeZF68Keldok30TGVq7XEnFsy3Kdy2
	OQiPSyaq8mrx/oghvmKW0s2U4J/vTr6TtuI2ApwXAQgnOs6clCvfcOk5lp0clT5rRfHI/wg+zPc
	W5cnqAcTsBn8Fu96957PoXmMDFFHqTwO58QR9WEe0Mma/fuYtz95m69DOKzK0aWKdzWXh9hPm2R
	TCKUN59elb87wqFqbmyU1EM2X3PhDkHfNvvVl9yl1dNKu8G30k/YPevDcHD+c/Ar
X-Received: by 2002:a05:6214:e61:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f4cb9af423mr12058286d6.2.1745576580195;
        Fri, 25 Apr 2025 03:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQHRUw0T1iKaDp55HxB6gYCPliox//7FFtFtFVjRAOfeqf2fXtnDneqIM45D/HHTkZv9xn8g==
X-Received: by 2002:a05:6214:e61:b0:6e8:fd2b:1801 with SMTP id 6a1803df08f44-6f4cb9af423mr12058106d6.2.1745576579842;
        Fri, 25 Apr 2025 03:22:59 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff45csm1082025a12.21.2025.04.25.03.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:22:59 -0700 (PDT)
Message-ID: <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:22:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
To: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: THHVH4AVypUY5fShEG_yvqWg7VRQ_HMp
X-Proofpoint-ORIG-GUID: THHVH4AVypUY5fShEG_yvqWg7VRQ_HMp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3NSBTYWx0ZWRfX5vG4WFyAb4Lf zliDHM9ox40aRD4EwA/qMjbNqntrcOzj23sqL7jVu8P1US8T9KP3O2McZeEofnrtTWQsQfksowe zERs6tsAjSKYk/fy6mcYmQgZYoux26SX/rB85USbpzK9xTQKcoCz2H6s7OuQ9Ab3lEP/P0K4GPs
 PDeA82q9bzRHeBvKaddhqRR8Ltf2Ftvg2hcSYoLAmv43bXThbA80ZaFsbNQp+HKD15riIGjGRHs 60dh2RemTs90Fponi8qXziwv7zdRyRnSd+RaWR7p/JRMtgiURbPu5kV+jKdt4iyG/JF8bAdlTYg gRIDYNbNAZ66JBYIlsIgoAUuAfzmjzV2CKkJfJIDdZfzPzpPslIzgf/qQ6ZJda+0qcxAjjj/qIR
 hALIrIHTwHf0JJjSdtSS+4S04ktWrCYsOCjtHn465AiNtd6z1DCpRyGhOFQwepZWb24BsB2Y
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680b6285 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xscrbkT6CZb1QQ6CF7AA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250075

On 4/25/25 11:29 AM, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> voltage rails can be described under this node in the board's dts.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 46b79fce9..430f9d567 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3287,6 +3287,17 @@ opp-128000000 {
>  					opp-peak-kBps = <15753000 1>;
>  				};
>  			};
> +
> +			pcie3port: pcie@0 {

@0,0 for PCIe adressing (bus,device)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
