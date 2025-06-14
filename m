Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4581E8320
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928149; cv=none; b=nCnxcluX+/y92dH3xwZ7kjie1Gsidd9CaYMULJzAyBM1nn1uRQ7kXjtbZXrX/IkHqLdIZqDIeyYXt/4XKLISxq/Q63bM3xp7PP0C9mOHKMv7TvbT5E4J6GzVS9Yl/a/9/CR3JUZEoHT3mCuxZ4sozoteblK5SYTYfaGPWRPST5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928149; c=relaxed/simple;
	bh=DhUM7JyGK/Bc8k+PpjvgIjXKz9RYpDG+H2qdDaLKqqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShUDg74afPu21FbzS1r0lbEfOnaLC7KIaCSqeDpT1hWtTKkTHGG2pzZ5Bmyg/F3ObGTc7jiC1dk/BdfqMABs2hzJ9sJxq+WMAQAOh1/+BGDpJtqk0dWF0XbrrmCScdPTxjXLBHfLEVTf2RNe6jc5z95zqQF6Muem/etxM5y736A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Me6yFP57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Me6yFP57"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EHkowR028785
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0KpeyNaWZvAaZIB4caY9JHuEJ/mF3mbWm+riygqbdpg=; b=Me6yFP57Ev5MP6T2
	I91d0P5ocy4Iz9Q//Q9uls5ENPFSRggYssj2XOtVVfgjvir76ii+yQICC+d+dpra
	QYHd1mguDana/9CR9LasQ54lu1TEnFGkSvgLeYqyK4t7ubfiGHv1GoyFRmJVMdGZ
	Mbjo8rNxsZv2UkvHo1G+xOt/4eoq17+T8uT8QquiMwcPg3gFMswSi2t+WbNF1gda
	TajBntzealFLw5xcifQZaWaX+zA32lj+IdzwVAtv3zRoHRjE8zp2NPIKNepOWIq9
	j48at3BxPEV7Zl8CqsZsKbkgS4OHX6hHfksNd+maMVxVX3MwS84yUHRvd/0jamxE
	R7jqBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791ug8vxe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:09:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a582e95d24so5487491cf.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749928146; x=1750532946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0KpeyNaWZvAaZIB4caY9JHuEJ/mF3mbWm+riygqbdpg=;
        b=NxLDeYLAbj8ut1dEHzaZhB6/Vb3WmN0loCeRwjobgVtY4oWX6Q5LRp3cEHnio/ZXpd
         /D49+7bJ1A/Qx1XXUSa5STSV+HRrDNXCH1AH7mNjW9sfkTwJ99T6p8U1B54eea/tnLWz
         qscKywZ9fX0bwVbES2FFcVE+nH0mSn+l681dbdAi820VJv/Rw+iBekxaMhrHUUhYkj86
         2E20vUSPHIneqj2mN/wxaPusD6l4BmGsiG+Qjji3vi3/ZPU7sEDcQk/6jsXaS09tKDqf
         r3tzxiAwIRn5H530Wk/yo0vN0UcABgLRGNUtS7J0lreabtGE8iQO3fD2MyykRQCqMZJ5
         C7+A==
X-Forwarded-Encrypted: i=1; AJvYcCUnBdvjAwdNKNVAz+u85gLb8OeLGroicL0PdM4Mm9M573lwt7XC7w9e1LwhTzuNTZ+Dfr67PeER1t1zPaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw56bamTSCZHf9+EivtAtrXLdicRAZRqp9mhvZVglrMjGNFGUQu
	rBsX1lEKKUz27MBZdvtQD7jv7zTIw+NHC3NRfZX0sf5ZYRDdPPD/9lkJmgMeyylIM3XijPaVGVc
	DB/Sp+YrfqVRfSiCZGds+C3F6sKEIIV5UtKPBoQfTJtyoYsz6deeacUPXO0sPUfXu5k8=
X-Gm-Gg: ASbGncty8581OK5/h5Si8UFRQUSMu7sQZlG9OLtR33GBFp8wenoIckBMjqcYCgwMzgP
	bxvjH4y0/FCVnahCi+WK/tsDHi0AEomyoSNTAGvoZWmJrY/JxjpKDzzs6fGa0LaU5p0l6OQvdDH
	xkggQSj7Y+X1etj6VbSY5aX4kjww7sF4sXn+U9PkTsrjIw89IY6PSVmw5y7frOcbn6QKMWbsW6d
	gmI6oTnVMNiI65xCnM+Cdqb9eSnuTn72N29va6383cG0FlJ+lCCdrGMlZGa2h8U5pQjylK7tZxb
	p6SyF6g5BalhIyZSaE3hovZamSJboQ5d3LqY25SsbHnJX6JuJFstdL3fgckRzrUChcEs09ALG1b
	ta38=
X-Received: by 2002:a05:622a:54f:b0:474:e7de:8595 with SMTP id d75a77b69052e-4a73c619412mr21878751cf.14.1749928146256;
        Sat, 14 Jun 2025 12:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvOYiWSYZiYBM1VC9TXTvoNoA6MCXtBB8myxMV9hXqAPT2FHURkrMkoJr7i/FgzC08d+aLrQ==
X-Received: by 2002:a05:622a:54f:b0:474:e7de:8595 with SMTP id d75a77b69052e-4a73c619412mr21878571cf.14.1749928145897;
        Sat, 14 Jun 2025 12:09:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8982f4esm352351666b.176.2025.06.14.12.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:09:05 -0700 (PDT)
Message-ID: <09c40216-c0a2-4698-83b6-b838c28eed84@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:09:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/10] clk: qcom: dispcc-qcs615: Add QCS615 display
 clock controller driver
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-5-b34dc78d6e1b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-5-b34dc78d6e1b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MCBTYWx0ZWRfX1He+VBKathkq
 5xGwQL2uxaDkf8evN7cuclAkhS/joYPSfLHzJ6u8M6ite7TIav5MzIY3P4UaNpkxothqPm7V5z7
 CTRaNGa1JA6GHdB5TDBmxP7ZWk+yt1ZtNG3fO3xts1mIbC9x4G8p54IDj5lhJwtadUx8Yxo40lL
 Tsu7Q1aITj0tpyNBy1Sy7SMgP6D9qAd+pRRQW3H4AGkOLuNRt43k5MhC6VMLMdMm0KmxqD2sTmJ
 4FFGmxUBvND9b1KhFSQEhtV0JnfynYN28d82Yncxs5tMUeWkQukj8fsxyf/+vIhmCLItSFlcfWa
 O5xS408O95ueFo2LhNrdKZJQS3bGvRPkc6STwgAIyc5xyFOf2DzwXvyvNUEmYjhyXAShlXJ/2Ew
 cTkwXIB9DiBafIVbggluCOr1ztplqRihO/pmXs9v+lOopv6fAxfcXu0TMMV37BCtTnU04fca
X-Proofpoint-GUID: eBUl7GltvWNQUjQnW9UubAe8o5uGoCn_
X-Authority-Analysis: v=2.4 cv=NtnRc9dJ c=1 sm=1 tr=0 ts=684dc8d3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=fbCSmPG1eNaTwHpC0zAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eBUl7GltvWNQUjQnW9UubAe8o5uGoCn_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140160

On 6/12/25 11:55 AM, Taniya Das wrote:
> Add support for the display clock controller for display clients to
> be able to request for the clocks on QCS615 platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

> +static int disp_cc_qcs615_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +
> +	regmap = qcom_cc_map(pdev, &disp_cc_qcs615_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> +
> +	/* Keep some clocks always enabled */
> +	qcom_branch_set_clk_en(regmap, 0x6054); /* DISP_CC_XO_CLK */
> +
> +	return qcom_cc_really_probe(&pdev->dev, &disp_cc_qcs615_desc, regmap);

Similarly:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
