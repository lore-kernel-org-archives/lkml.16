Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B9218AA2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610695; cv=none; b=HrqXTR9Y/ngIdlvMUO53eD781DaDiB4UoPesRa4f+539j3btkGYMUXMDXm2CWLKerF8X7u7MLXGxAU8d7Jyw76/Qz1cxmh8RZ50pkjlSnZLgX55fNM+UkpllWj85T22NVs3Q+fV5Nqxub+YGvwIXHsN/cOts3qHGjxZ7qhglHwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610695; c=relaxed/simple;
	bh=hUJsbchXR3Ekft/7c3FAE2ianmHgWCZn5D2kabC9No8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tIcWtkT7CwkRE2f3kAeIBXoHUNPkX+G8DchJYOznUpjkbbcOXpKX4AlMIhKDmWIzXOaZVjvOYLBYdCYOdYFpyJS22fi7FrNu5WS2ve2r+SRe91ZNOoFwihevRGriT1wMGFNwfTAjl6xdsnF5w4cNnJdUN4hJLMnQfmZxnCQKJ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlxq57EU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlxq57EU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGK4fB008899
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZhXAb5N82DC4xoZmaDuqgjsFIB2BulQK9Ow83G6Ys0=; b=hlxq57EUtm09HRLM
	ZCYMbUC+MXBADtX5rID7Dsw2Hf/Y3TunQHry4eXA8LYdMnwJ6veIUVCa9t8M+3Wi
	O7eA/eMG7xP2ZjdudFUFAXEnG11fHdxB5DJe7oxloHTQ6LTV31PG7wlW27xS2Iq3
	epC9rjhw8DE5XYnY9Tc6rHmhRLqni0J4X9h5HWHi9owSL95fCpNQ8j7VXttv2K59
	5YQNc1XZgL1fZE2cfDEyJYrvuHh3E91L27DJPsek5OEVi51URNHimUKxqwBUOQts
	4WSm7nVLx3bu6wcypgufmnCzjmYhD+ZikbigF6CmRJuvtwjzzUYfRUdSQmzsfB3F
	HGXxZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2j7d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:51:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so11604385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610690; x=1746215490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZhXAb5N82DC4xoZmaDuqgjsFIB2BulQK9Ow83G6Ys0=;
        b=pSAQYRAk4hFT1KpE19s6R9ftVGrSN91zGVR60bIUKwoTaqyM1Xo1jbu5Xv9usDw6oo
         uag5MA2u5XiJODz6JvKUtnaq4muatYsheuWC0y2oTMACfpJhXQ8a/ijVP5Da2C0wvRCy
         oQ3g8eTY5k1f40B/mnKQlI9Ij98lAB/GlNwUdNDKc90tPgqm2Ed4MzXpSLk2AfPF6ZNA
         EeL2TvLY4UOebHNbdpt9/IHKD25uV2lxyFQSrWR05eVT3CvaHnlCsWOKpO2ycWmuKEPE
         TP6jKPxkUm8FgInMkqqb139Vx1sd+AOTAsrExrzc0KYo3tCXYTT/cJeqwyUkPmVOWIYd
         EyaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrURZwqOmEemfTkGbpBlTMvx8dPcnx1n76uZ7yxmXCVB5PDcKzJ0n7n/aJpN2CrzdnIir2Z84zOyUMa6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxttNPszIAMKmQi8wCCZhk+P5IFGwfJA7zLKx3VMVj+wNK36bvA
	fbb8CL/+gjI8/6Ljz8bCrB9dbXk5AxonDHadNPBDCxU8y3PY7HiZsyN6rK80Dk0FijcA/nB7uik
	s/8IVmDEEenVciWk7NcBWwDXblc+QRG+wWbCuCLoDiNfx7WtNmeu21XsOBGfkZEA=
X-Gm-Gg: ASbGnctV9CE3IU89xc/h8tT8zbIrh4l/FDh8mB0GVop4XxCdZIpYNOeuEiXV77GTv+s
	IhM/MB0dUY2R5y2YTwkzDGz7nyHqAnRzySHsD1FlpXa+U4Wd21dEEmxcsIRjZ5RWSYcruanEjND
	oUHHKZ+degvojhfz3kVt2Smq7yByLZ9XtvZ4bJ/2mlUtOnQ4/9XpmRjn4DJfXQVEwZ6UCgYFuoa
	ateg61+w/ds6x9yalt7GgGdU343aGEqxzbVd0MDzU/QqJuyv+lTZO8dTBTlGsTe8nJxhI4XzNiS
	oH9T7qLjBjyr+7OcanXQbRwO4pmg45oc1WWbA+HCC7GZ9DtK0rnRrAsbh9opNlD7fv8=
X-Received: by 2002:a05:622a:20f:b0:474:e213:7480 with SMTP id d75a77b69052e-4801e6f355emr20287321cf.15.1745610690530;
        Fri, 25 Apr 2025 12:51:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGixXgh/UfVDbXANnAdc5BNsWh63o++g6JqWbU8CImmPZ2H5rCWnTMEJKVAKIbuE1Syh75RhA==
X-Received: by 2002:a05:622a:20f:b0:474:e213:7480 with SMTP id d75a77b69052e-4801e6f355emr20287081cf.15.1745610690227;
        Fri, 25 Apr 2025 12:51:30 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6eda7d9asm178782266b.166.2025.04.25.12.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:51:29 -0700 (PDT)
Message-ID: <43e5ec19-4377-4890-aa6c-e0f9733d5106@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:51:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] ARM: dts: qcom: apq8064: use new compatible for
 SPS SIC device
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-10-da4e39e86d41@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-10-da4e39e86d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hai6h40cDlZnbmXslm8GL08cRmW4oHAa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MiBTYWx0ZWRfX5NloOuwb8TfK ailm2dGDdrsdBPc3s9yDhu7GmT+MR0YNdXCUIjBu9GcMZTeV4f2s/0J9QlPWtSFik9Ao25lxuan 9h20M2Jr/NkaoMMniMMD+l8CxUzQBIWPVCFtNODGCYVUO5HH20hak94sQRzGTNwRxXWl7DrN+tf
 ME7SpfVyD8eD2P0fhXZbEAcA+nr2b0ndgpAphyxE9YnnNsy0L67NcLg61cSRG5ud77XMh9e/Y83 DaMxM/8mijIDt+2wkCCMLgoPZ7a7v9Yu5SubyOa/IuCAKDsxCYETz2w9oSNYjuDDjbx7BKQJ7qb fY1WOMJb4V3RNm5nsbEKN9ru6MuXnfB12lbwR5PehFB8iJl6Plk0pTbtepQA4Oca+HItgN+XyAq
 9dV3Wf50oXvk+wdOTVeQmK+2jjorC75mYIR96Qyb/pKhnmCG5nn9662pdIU4HcpDUT7NLsdM
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680be7c3 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=exUESaSVoveG68c7jMoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hai6h40cDlZnbmXslm8GL08cRmW4oHAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=587 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250142

On 4/25/25 7:47 PM, Dmitry Baryshkov wrote:
> Use new SoC-specific compatible to the SPS SIC in addition to the
> "syscon" compatible and rename the node to follow the purpose of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index a5aad4f145dd368aabed44cf520ffc037018b37e..b6533630e347c8fc5e3f0791778cd05760b3f3c8 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -402,8 +402,8 @@ saw3_vreg: regulator {
>  			};
>  		};
>  
> -		sps_sic_non_secure: sps-sic-non-secure@12100000 {
> -			compatible = "syscon";
> +		sps_sic_non_secure: interrupt-controller@12100000 {
> +			compatible = "qcom,apq8064-sps-sic", "syscon";
>  			reg = <0x12100000 0x10000>;

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
