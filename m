Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2AB2586DA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195063; cv=none; b=bwmEPavWvtr4eS3seVUGqIipBb/lm6b9msDfVwtGFc05a4ptZlYneZgc3KfpMk53tl9CO8xsRTJTqFVGJMeZUnEkUqqfkRdQj7HpNXFKFbT6mdd3yhi+XauESHrImq1esbVKc5D0boppes6vIxY2kWsL7H8mLoGEpcsgkXt4IYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195063; c=relaxed/simple;
	bh=Oc3wFGHZjYKe6oz/Y/IvLBiaMoXgWFyYaPfVregWfSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4/htlvk8VPue1Lu5vvvbRK0k/V0cv0xqD6XvRrTZPzXTuxZ57W99y5Vy3LvkUTZB17ONdS2W4xg1FZZd9LazPrMkFk8Oto4iulOuXDwna9A19XxOSkIbfX1549z379Yo/ul5yWlrEfpaYBd77KZmhNMG1CDbjFGPMz0PSc5YLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLLjC4fq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLLjC4fq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HJrTFb030379
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F2B96TFx/KL9jzZyjSrVip1zy+zPM/f/59CxS6xFHzE=; b=MLLjC4fq+VG7/JHX
	Tzb/Hp1CI+Il6vu2th+V+EVEuMOSzEiwC6EaZU892T60l1TmRe0JvB0DelRiLQkl
	ulgnaXV8OwCa80GSA7pUzjrjWUdJvhR5suyuTWcSt+KO2hegZQMbIE+kO/nK7N6g
	puFW2MeZwehuiHxqLCcJ67frG8kR95Erfhb7mdwlJwU8fbjtaYzOlR3qxIwiibbV
	ehS0w88xM3BcPkuwL05Ws+bGt8OZttYIDGNRdqRzO3tEBiQBB4MaJKP+2h3seXx/
	XYXifChGbktNduo+4II3nApP4Pb4VG6rYfct6Zz8emD7WptQIDqYKxvDIDuEa0KY
	F9umNw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag235ujn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:17:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d094e04aa4so193142185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195057; x=1750799857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2B96TFx/KL9jzZyjSrVip1zy+zPM/f/59CxS6xFHzE=;
        b=xAFFNLt0P58YewJQQ29N83c8Un4LNi8C/lSxHAVIG0WU6lQE+GtBHFdcps2OsLuk1k
         85LzEX98/1qwedbeBeSLKRNyu1n6W0O6rSJaIfcAdx98Fa5fQGaXwDwfU7SSf7q7SbTF
         Cm//JnwFrAs9Qp4VM8xY8NzznoBZVmKdgSLvu3kGSSBw0AzT0mINSbG5qR5uLQL3J3AK
         qpBMTu0L+2rFgUDbK4+lZwS3TgIFrWoBH6R+K4pD5kdnAFW+ya34GUpoQNAhNx0gbJ92
         UoaEz0F2TiZAC9F2iuZOXveSZnnHNjuGhHtblAvTiU6TlMxs6/2CYKPqO3Cj8ID3n8Ww
         qhzw==
X-Forwarded-Encrypted: i=1; AJvYcCUPqwlHOPn0GmCZVz2GffSAaRM2F0BLKdN790n9DZ9I6DUd3aEsd7q5EMIjFwrYW3MyyXckyy+seTI1LeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7iNXys5v6PRpVhrpNyJP6k7qnDDnddteeL8oAGktxz01Px8E
	o0QwraPAOH4xsm+RuPKYWixo27/KjWeCYJZzpK7xv4XvDckwu632yJE2s/87lK+yLdDdEOmBKOJ
	l+uVTF6zCc42rOvmIIKo8WzY2ezaXc/w4RlpTPRJNQGaK5bDQ155PkWzRcbh7Hp4wCT0=
X-Gm-Gg: ASbGncsZq1mNk32/c+zF5yvo4kPabh2Buy61wrNEyW1a7L/XJ/3UkYTmHCKYk/uTg4T
	a33nd4kUapWN8dOJ1RcrbGKvAe1LEbVTy+HvR8XScC25XP+KZeiPjL53QgzwLdqu+B0APz0cSXn
	LRT/poxDn7BDUGz3LtjLv7KkOJOjHYQD7CL05zSqr2mzSe8GCvOrv1ZlfrJ7sjUKU2sB9q1NuxR
	jupIoz7tIHdnBHdZxYIMLPcBo9VdUaN7iWSLRvE4coRhSgGbKL+IBSm97OkIwkNb8p9lblQf8Rc
	ZbHM80KIGwRj74+gUK2aE0Cz1Sl+pRb6KPG4Wb+74+kKmodFzhVCLvwFKnu390cA6nyCctmqC4T
	DOzw=
X-Received: by 2002:a05:620a:2a04:b0:7d3:c69d:ed69 with SMTP id af79cd13be357-7d3c6c17e62mr872989485a.6.1750195057532;
        Tue, 17 Jun 2025 14:17:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuadPbrh1VUll8Di3mBOdCudw6vbTTmMGIJ2ZdldP2NKImhDqIStGDB8oViB5MQ3gsuN40MQ==
X-Received: by 2002:a05:620a:2a04:b0:7d3:c69d:ed69 with SMTP id af79cd13be357-7d3c6c17e62mr872987885a.6.1750195057185;
        Tue, 17 Jun 2025 14:17:37 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fe514sm933483166b.79.2025.06.17.14.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 14:17:36 -0700 (PDT)
Message-ID: <c2e21596-8d94-42c0-9a21-f77d510a8cff@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 23:17:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: msm8976: Add sdc2 GPIOs
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250615-bqx5plus-v2-0-72b45c84237d@apitzsch.eu>
 <20250615-bqx5plus-v2-3-72b45c84237d@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250615-bqx5plus-v2-3-72b45c84237d@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6wsY7hlke_BVCVE7HG6RSso7Wm1YNHwy
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=6851db72 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=HDjIzE35AAAA:8
 a=EUspDBNiAAAA:8 a=moa28MdQsDLXcwDZZloA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE3MCBTYWx0ZWRfXwURRcvSEP/Ai
 ClgqwAUulIBIAVziqvBSCHIRaRhgwz8UvrsJos8sUk7eUdo28HOlJxAxXek4zZ6DrNDRBany+Qi
 zsCtwM85SdbZc4vgU1F6AvQwXHb+EBq1J4mWj0McqxkdCqgyXi5OAXNiy3+WlYRwGNAbns6OUGj
 2na8i3VOiHCt9OBrQ7GXwXBlqYpNRvOqK1yvg07aEvqpJStRRjN0SMpzhIJvUxGIFbetfM6TmNH
 COA+vf7ffUkddMZY2QOyJHfmv7eNqgz8WO/TCmXUz3S5qoJAVOEGn0vPGws6zmRXhb2fu1LUyfc
 M8YhLFoopdT4M68q55LktDbu1/Z8EqhChGeV2Wf9VD0mctmt5AFRXiAEK0ssSn8g3bxG4QyKlPW
 4BP0adLJTIzR8/mS6EdJTbsG15zS3J4KP9r503xR7pLkB5YatDEH4sTSL1GYVVW5wI6WOti8
X-Proofpoint-GUID: 6wsY7hlke_BVCVE7HG6RSso7Wm1YNHwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506170170

On 6/15/25 10:35 PM, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Downstream vendor code for reference:
> 
> https://git.codelinaro.org/clo/la/kernel/msm-3.10/-/blob/LA.BR.1.3.7.c26/arch/arm/boot/dts/qcom/msm8976-pinctrl.dtsi#L223-263
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 36 +++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> index 2a30246384700dac2ec868c6f371248cfcc643fc..f9962512f243d6c1af4931787f4602554c63bb39 100644
> --- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -782,6 +782,42 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
>  				bias-disable;
>  			};
>  
> +			sdc2_default: sdc2-default-state {
> +				clk-pins {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <16>;

Should you send a v3, please reorder the bias properties to below
drive-strength for consistency

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
