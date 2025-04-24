Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3E52192FD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526770; cv=none; b=IFGLZWqRyVxcFzNfEg6k+Z/Hx0h1Qk0ifMabNnH9F57yYOVBqNtLe3cJVa1UJmjQbJvhChT7tT+cBurUWez/SU/SDehaeWJV07IhhUc6TqdME22lhfddX9M5tD5PUxTpZcxPrmHwxisXkzW5XqQquRPjCQe2gkS1GxueF+NOD7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526770; c=relaxed/simple;
	bh=tjaBPN56UPOtib4A2G46hSfnd9J/OzQOEib8ipL3O24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcH5dsjRcafInUcyEJHCjpK76vsejnRMPqxJW7IcS562gnykQLlFewN0cUPOx+5IJ/JC5LiLGLSMSFeEv6kqOFZFFc4ZyG5iVzcfui4DRSEDjpiCwzTdr1UxzL/IlD8XuxjiVARm37Pu0n7JKfGhmdAWPAbiBvkJ9ri3fstWTAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h6jfwCVH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6jfwCVH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJn9A7028320
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8HkOPFKN3GC9vWOM46Nwa7p+fPHQ6WYQxK03zZBQac=; b=h6jfwCVHDQOYZElI
	KqMdn+DgOWPc7UbIDJNyh+xGuawbfmXa8O0O57XaiRXJsnmV+l/iGaHsp0idoiFp
	wO+gEUVRIXqPHuEjil8byuZHj+LvyGZwvDOTWOczB1QMMeIaY1ShCNR3C5PcxytU
	/c6UZQhL93L6eQzZ5Nbhb0RUNvbOTCdB/x94/ZA2y4/4Q2w8RbGXgdm1uvhRnHGk
	rOwaLk3VIKby1TQ9v98EgkVtAUdOWiHO+wEh1dSpFBgBYOHT8vR81vn6GZLcYtTX
	plnrPVO6ig3K0zRVIbiDw+EaiKLA5jq86tMJnvNt+NtHFa4jzbOouq4hDcL9xy4P
	S2zGJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0psen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:32:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c552802e9fso26637685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526767; x=1746131567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8HkOPFKN3GC9vWOM46Nwa7p+fPHQ6WYQxK03zZBQac=;
        b=Xai1lGvI3O0G1A2Ou3057uYbKoLc7UxQJPSZwO94z8ttBYtNaHWJFCqFGIVHIPf+Cm
         ZVRru1vMQYMwo1bLSooGgk5NNYJzTR0T1kWeaKCCtc2Govy3Z1zesI4RX4h+ed2/fnR6
         IQusG1wn1VHr1NVOLWOneCwmLi9UDu1dDgXQcBfRVTJTRIqIfgsOPU5tdhw7In4xAFTn
         qS+2dQ/OGO8tFXx5LjeCk1D7XpLuA3wnQIMmJ/2m9oRdjb/1tws5h6V1K9DGtbbc+UFe
         8xuUjKRxLnyK4SZaEBJbYRFMDJRpNmE3lLMQB9qWW/0irnonFKE4wkOvltLq2+o+wPa0
         wiMg==
X-Forwarded-Encrypted: i=1; AJvYcCWlxd31r3wrHwnJS3DFx+xea4aWvpJJQzkeE5XyO1A17N6RJF/8JP34FYsbEdMkbWwC7GFO6WS9lOyZQnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIgs0U9rT41rMCBG17Rma+wM9OVMSFHKak3FWgXaxjj/F5uWx1
	h9AoRGgyOAp7dTD+zMK1pJq+kRPf7JlMhARsCG7ow/zAwhAzmoQw7FqLn8Snf6lqN3sCfwKlt2J
	X9PpKDjEe8LhJ+TKvfjv+kT2HE9H6dgoH0/YCzjU55IZu8we0cZ4OCHhxxizpTk0=
X-Gm-Gg: ASbGncu+4L1XYxrMHoGBZ4CL2iPWYJZ2EfbdfTwJpi/0dy13VtOpT6lnsSGBsUfT+AA
	bh0LEIRDkvP2P+IZQbu9IVCqYwuvfXSIrLrCYZer7B4uKYI/YpPs1nfHjvIBQpqltVeYJkuFx+p
	5BOpjAplYxpZt2X9FecUM5ZYBkwPN7K9/mwsCR7P0j6wFvUZrxxlSXKlHJSep/7VpKpGoeUZkEM
	tpNk+qFJr0PXyWDb9Y1RlnyozpfDl79Lb3MnlRFd3OJV2dyLtCwVnRYtKNNQidhsQ6dPn1b1XBk
	crAYRWNY9cm1994swGeoxH1e8xMGAhJJcKmY1aNs5AcTZ2PSuUDlkVmJQMizRvx/agM=
X-Received: by 2002:a05:620a:1729:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c956f79fe9mr259897585a.10.1745526767261;
        Thu, 24 Apr 2025 13:32:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzye98f6Zt0tar8sWeQ6uN8aYWFW+oIeMzfavLC0AjRUoW90eRnRuTlTFArGMlyuz16164NQ==
X-Received: by 2002:a05:620a:1729:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7c956f79fe9mr259896085a.10.1745526766905;
        Thu, 24 Apr 2025 13:32:46 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f658csm173401a12.41.2025.04.24.13.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:32:46 -0700 (PDT)
Message-ID: <01bb7183-eb33-4b9b-b73a-e7e3622bf9dd@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 22:32:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] coresight: Add remote etm support
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424115854.2328190-1-quic_jinlmao@quicinc.com>
 <20250424115854.2328190-5-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424115854.2328190-5-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uRRy_NJZ5dcR45WRtbTo3j5rX4KfJUtU
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a9ff0 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=day4Cjbagy4oAH_-zrgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uRRy_NJZ5dcR45WRtbTo3j5rX4KfJUtU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE0NCBTYWx0ZWRfX0qQbVM+K+jnB 8YeL+YB+yZAffm88iNMs9nMWA31sPukPu22yB4a0DnrDhxPUNUj0ybWTA1faekTYxbRRLtg1q/B WmfRaHHiukwopj8mshABaoqOZVGsEEfyyrOfQZ+r266Fdi+VPgYSp6GPC1+hwHBL4cotZarVNvu
 7tC7OVT6uFtW4s6dCtnZy+4SbRNXY/CVuvVLpXn7pA6UCP19Zt30M1v96DK4CEkpLf0+7QpB9VV 8I+bUheVcE3epblZnUkZTBGIuZ+bi7tExFybrdy5EWxcwb3RU5zvJJvEkUREDo70UiNW1Vee4OF qEJl3YKKQqpGgiPUO8ciiNRp+DliDfZ/8ChKXpxaTSRyLdrfVkRN4dIYeav0l3XRKyPVI1TgOXw
 ZmmDRxBn9QIVSQYhmhp0Q3Dwn9jaj8lsLeCH5vqT2/LAgAD/GA3SEd4j7+EynooAdkYc3oLV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240144

On 4/24/25 1:58 PM, Mao Jinlong wrote:
> The system on chip (SoC) consists of main APSS(Applications
> processor subsytem) and additional processors like modem, lpass.
> Coresight remote etm(Embedded Trace Macrocell) driver is for
> enabling and disabling the etm trace of remote processors. It
> uses QMI interface to communicate with remote processors' software
> and uses coresight framework to configure the connection from
> remote etm source to TMC sinks.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---

[...]

> +/*
> + * Element info to descrbe the coresight_set_etm_req_msg_v01 struct
> + * which is used to encode the request.
> + */
> +static struct qmi_elem_info coresight_set_etm_req_msg_v01_ei[] = {
> +	{
> +			.data_type = QMI_UNSIGNED_4_BYTE,

There's one tab too many here and in other declarations (make sure your
tab width is set to 8 spaces)

I'll try to read into the actual code a bit later

Konrad
