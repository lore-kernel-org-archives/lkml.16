Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B8C2D4B59
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028505; cv=none; b=jCfRcLBVBh6Mopc/BVzFo04wUSCkVe/AKSARQHKaETt2GtMlucS1zMSrp1uR3JVltu78RnEj/TqYwN5eUjffUR4F1J9Gw/YO0AGVglr7WyAsXNe3GdCeAB2FbqoD1u4FXzeEDsq2z5+5RDn44a95xYVAhVoiuhEvQ0sDETi1wOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028505; c=relaxed/simple;
	bh=UuPWtR3N+BbYwvO2xcIwzWKAR1tRGm1+TPbVRsZ1wvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrHy6Osn6PpJavu2ebjSivbiV13pLYHZGYtYOYIPhoaCI0NT6iQn8/BhrSb0Q1YqXMYzf93lyzs5zXoF+5I31fNcSXGAmnxtBtCSyzUAKdkO3lV/zB66mxMSipB1okT4PAU0EqYkknAjZc1TrBuXmyIIQ7pwDkJ4FHKjfM65of0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VlHrQhUg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VlHrQhUg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCkB2h009894
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJWdJmJzkwxzneVd84Z5q76Y6Bh4N9QowRdGtG0g2/I=; b=VlHrQhUgCUTe2FEP
	SrS/yvTa7IfH1NPjh2VtHifLnvJBWvAc8XbC6I+RmVoeZ3BWBZ4iKZAWXeEgOeii
	JOrtt3w6h52pIgqSs75j4fKbHRSFgbPNdh6uzA5/k+ep436xbVJrotnLoCuiZ7+f
	lceEvR/ecQvSZWVzI41UA/Mr8wBNS/1uK8RFb2ljXpZ8eg2PnS+gTRmoL/QIDM/X
	1u1ePRNMfVfiMwAlRlhBGp7Q7wHqrNZ0HiziT62sweq18Yw7y42Y3u4DIrr62ApX
	K+NwYQlK5FVmOc5HsDkNUOu4J5Y3BpSzmVlOkjyP5AseuIFaQOlvFdfsySk4OvpB
	8dUPxg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fgjx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:48:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb5f7413beso5984076d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028502; x=1751633302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJWdJmJzkwxzneVd84Z5q76Y6Bh4N9QowRdGtG0g2/I=;
        b=sS9FBTfY5jQ1pSCg3lsfrMzKT8zuFepUOiRqoidRPQGXQ8fYuEx43/OlC7tC0ooXzU
         23DLgZY2Dt31UFq1ApCX2d5is41sjKIUlDhvqsp0Q3CaDGmCRKm5kI2iDWdPdDLVrn9t
         7la5V2SEK1QO3H5REM6EpxkDk8wx0WP+fxAB3gYMdiFbP1Npz+pj4v92lQL8pKuoQxFq
         lnIe9vn/3dXtGMvqG4wi4mnkP++2nBgU4BhJpKrLdfot1tp9JiLdvemMejdS/eqSe9Dl
         y/6WUP5j9peuMQD1GtK8aWavnTCfI2rxPA2KkgV0NgEZ1U4S5kBSqDMQj4FeozP4PrDt
         jKZg==
X-Forwarded-Encrypted: i=1; AJvYcCURKVn6iucvGCMd1pBioumCivJDaulXH76HuXTLxfgKBbqkYdb6hm8vCTYpGUdgiBPWbSC6fhfqi4Z1yN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHJ66k63KytCFjHlsR/l0mlMbKZinnolfERVUpeWUbXbV4RbcA
	TQRC7OwrJYNxmnv5QY/1FQ5P88ZKSEG4mXJuQ3RN2oY9by80qXlIEl/TrRXHzzSfT6l3gVVbY1P
	HQpVgf+b6/VCbGGzsKMybVUBfuDoLwXfVIOyNPZ9Ye4yHzuYgQlwrTc2HpYIQR5c0/bo=
X-Gm-Gg: ASbGnct3jgblEyypogoqmKrJNM1AeOQepASQJQarYsUpYpbt/yeLC8grIBMvylp4JkS
	+n5z2Ktd9FaRa51Sls0D+jHV/4GpzlVhhEgBz2oLSvIW+N4EK1gBf5fd/EAIU0CLVGGxJvlTWkE
	/5L8GdKTVxxj/9G5Yht+hyINa/flvkuswEj7+uCre2mT63RXPGk1aISZOXmstRvvuEEs4qyH66/
	9wLYzteWaI3XK5bJuQVeaUgTGBW417+W09Y/DZaOZM09x/EgMConOVUaW3cz8w1j9+PSpiw6Tch
	7RMNCVKuqZkEQGvF8uwEn/NEReMOO/q1C3yUy0pGBn7IeQr1wEX62UsFkmR2y7m+k3g95d2ipoY
	5spo=
X-Received: by 2002:a05:620a:4881:b0:7d3:e06b:1d60 with SMTP id af79cd13be357-7d443944ba9mr176785585a.1.1751028501578;
        Fri, 27 Jun 2025 05:48:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEE+7cQBsQwlzqB9LaJqbIhJCazfcoQVZVW4hsNtBTvL1HoOy7IQ4PoeipK7V/yc9W7r4biBA==
X-Received: by 2002:a05:620a:4881:b0:7d3:e06b:1d60 with SMTP id af79cd13be357-7d443944ba9mr176783785a.1.1751028501049;
        Fri, 27 Jun 2025 05:48:21 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae360e6ce54sm64278766b.37.2025.06.27.05.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:48:20 -0700 (PDT)
Message-ID: <3f8bcecb-4c5e-48b1-98be-96f3c0c8329e@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:48:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add SM7635 interconnect provider
 driver
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250625-sm7635-icc-v1-0-8b49200416b0@fairphone.com>
 <20250625-sm7635-icc-v1-2-8b49200416b0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-icc-v1-2-8b49200416b0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNiBTYWx0ZWRfXxZXPtnvrR9k2
 Z+IHA+4fFKSXuz3/MlgGh5lKol2ap6peJ51ue6gJtW96FSvEXCVu+SRZ+taJ8g9vSACKTXjIA7t
 mJEHbx+99yj1J/I8ySzInUl5CqPtIfl6eD6yJLiHFSXxylqlfXkUt1FfPfdzDFCOZtE3juCUGXP
 8k7tQsrCIoQGymxpDY1vR2JyzsBGqoPUEg0iUMsIr0qb9QnPN/3wx7+RuIuMAoIcM4oOpJXqghy
 uQFE/ev6J5eZ4nj4vNxFcUtd1EAB/sjgseXO+8KUQZJZmYepdqEQndZDA0J3d6gf8iTnCvPwHE7
 qZGVLs1ZaenCgM7aOhFh1gls+RCTRi/RPI4ZGFJ1ZV4m2AKQnFmDA57YOyhTTMOgkstBAJrxLkm
 dhU+YRlLAmM6Fhg0S0bAWe+EcOTjvtmyfK4q3tRFLKB/2etlyarfVrtcVh0qQPl9NjuxKLVo
X-Proofpoint-ORIG-GUID: BR_cQCBdLmZy_bxF59tkXEq_6SWRr6PW
X-Proofpoint-GUID: BR_cQCBdLmZy_bxF59tkXEq_6SWRr6PW
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685e9316 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=-wJKSiCeOC9Tbg0mKYcA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270106

On 6/25/25 11:13 AM, Luca Weiss wrote:
> Add driver for the Qualcomm interconnect buses found in SM7635 based
> platforms. The topology consists of several NoCs that are controlled by
> a remote processor that collects the aggregated bandwidth for each
> master-slave pairs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +static const struct of_device_id qnoc_of_match[] = {
> +	{ .compatible = "qcom,sm7635-aggre1-noc",
> +	  .data = &sm7635_aggre1_noc},
> +	{ .compatible = "qcom,sm7635-aggre2-noc",
> +	  .data = &sm7635_aggre2_noc},
> +	{ .compatible = "qcom,sm7635-clk-virt",
> +	  .data = &sm7635_clk_virt},
> +	{ .compatible = "qcom,sm7635-cnoc-cfg",
> +	  .data = &sm7635_cnoc_cfg},
> +	{ .compatible = "qcom,sm7635-cnoc-main",
> +	  .data = &sm7635_cnoc_main},
> +	{ .compatible = "qcom,sm7635-gem-noc",
> +	  .data = &sm7635_gem_noc},
> +	{ .compatible = "qcom,sm7635-lpass-ag-noc",
> +	  .data = &sm7635_lpass_ag_noc},
> +	{ .compatible = "qcom,sm7635-mc-virt",
> +	  .data = &sm7635_mc_virt},
> +	{ .compatible = "qcom,sm7635-mmss-noc",
> +	  .data = &sm7635_mmss_noc},
> +	{ .compatible = "qcom,sm7635-nsp-noc",
> +	  .data = &sm7635_nsp_noc},
> +	{ .compatible = "qcom,sm7635-pcie-anoc",
> +	  .data = &sm7635_pcie_anoc},
> +	{ .compatible = "qcom,sm7635-system-noc",
> +	  .data = &sm7635_system_noc},

One line per entry, please

In addition to what Dmitry asked for, please also look into porting
QoS settings - those will require additional clock references in the ICC
nodes and as such, the bindings will be altered (which we'd prefer to get
right from the getgo).

As far as testing goes, there may not be any apparent perf changes, but
if you get the clocks list wrong, the device will lock up at boot (unless
you're booting with clk_ignore_unused and friends)

Konrad
