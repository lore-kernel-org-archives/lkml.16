Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B3F21773D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323663; cv=none; b=JnzNcSdTCyBAYv4c3Ws7oXHBog4c1qlnknc19LAdKv3PMOHlgl5IGYFT6AoBtb4k3Y+9/j8ZgLynqcPfhE7k+O9UCpiJt2sQzhRxzwB6MLKiRkUYKg4sQGEiFZRUuhpnDC2O4wCSjspLvwE3j0X9mUNCCQVA5LDtJMy3vKPqtkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323663; c=relaxed/simple;
	bh=r8Rz9y5mBO826o6HxT9wcmQ+Cgxb+4L1qYpw84sCd1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bGr/S66X0SbcH/w2KKAm4/qnTwUVJAAxdDNh/1/T9VKmwCHAjhWLwwFt2U9Kdq7RBctcFSZMhWzSSfmcy7KXDpHtPiYw7SpvMOEcakWhyhhUn0KokByDYNy4w1ZZ700OplojYj7ZsncVb2utUzIefv4RJbjC0DDNSIQNbtO534A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nY1mWB4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nY1mWB4k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFBaO016654
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDP2BOABWrcdmtprDmarKLv3ZXSLVag50oTBIKB6RbY=; b=nY1mWB4kDphGytYu
	iWSFS+6yKBWXV3C0FVD+NKWS+voV4MwFhjezUbgnJtHOjcK5kMa74wx+L4/T3aKg
	WmHyNsU8CZYGq6LTEeTzoRMfEnpNOEwPcJamrLFeIpegOoxG22cHmVrcQoSXN87f
	G5yCWm3Vm1zWmv5gREHlwDCC42wEwL1uCKJqNHByG0GpHEnHdCe3FVUYeSc524+e
	6vmS7DjMTzON7w+MdvePKkO7m4gooqd9I7dFyoEoYcl/sfuHyNCBDOg1yni+AIVh
	Mt7EEwwbGSc9ngXmDgSYKmIELS4AatMXMfAQTO8z7jl9hpa/e45OOI2/KhPIvd2H
	KxPVfw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmpt68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:41:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5466ca3e9so24558185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323660; x=1747928460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDP2BOABWrcdmtprDmarKLv3ZXSLVag50oTBIKB6RbY=;
        b=J7Nxqhaikhlks0gF0+RmVCz9h6K7iblhAMfZTfzf7wX4NoD+1xasCFghq/KjEacmQZ
         IkzgS2yyK/JZV/FyTetbTFBe4IYdHKFExBhYAuJYksu83Tb40DQ+IRBB0n5aLuIUAQ5E
         nGfk4aNfnLTSKXMgXBy7bjr4LZpPz23LK+9W9N1fdhN5+6Xrp0lSWang5UlEOx6NRnRF
         fE8Wv6hL5WzeRAgXqNREYkiPJLwB6wkxUzVhu+ijnDwvGilS0Mrk7/LQhPnjDKL7d4sH
         iQCKQfwhHBzQPdVMLn/dFPwbY997omfUHoxx3R1I2NTCYziLt7M++B0ILLx/gINH6s6v
         BrUg==
X-Forwarded-Encrypted: i=1; AJvYcCX9vyON4hqUXTyD0zcvaZXSseJxBUTsRpnx8/Hg7PU6jALPMxQjKLTGvcvDvG67ptBzqNtP3e9BzP3aFoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YySe2zj1JafzzC5pAN976RNfS8Fkc/Lsu7Fk/rktfEoskU4xRDE
	0OJ0SNFw/OjU84eHGFAMmAwTnQ3x7iSyXHS1LcfadUUFZ0Aplz44uxnk996VF68wJYdoSBMuAA3
	ZDwj+oAZ/g8ZRRWKsJT5Oder6aJH8ripwp2RGio50kJ3Nl2JCsvclGe4W8MIQdXE=
X-Gm-Gg: ASbGnctwcZR91YaKAacPEicD0F3Btlt70fWlrJD9kGsrjwQO3UMO1fjEITpK6+YG91c
	ZRiLnuWkTBBHDviO6eEWaCrGVWg4UU1cxxr3II6KTgbUumxZ0EMWoQxYfBNhWN4ijAz6jjmFI93
	hbigOk/XZj5m/SlPzUZtkZZy8WwXe9pZ0ODTeomKwQS1VD1PBv6tecskhLyjj7ErrpmTmIsoos6
	AjHGpTJamDpL6BDZdRpZIVocesisaN2XuXanqxCkM1/3yDOY3JOtn8XxSQsV0RLTJlTENH9xfv+
	tN93R8jXQXwsBSqxLTCpS0A/Xxfl0G7Lw18P0xLX6DI13+nuE55aFGbrCgaS9DC5UQ==
X-Received: by 2002:a05:620a:2696:b0:7c3:d266:3342 with SMTP id af79cd13be357-7cd28817e46mr483161785a.5.1747323659959;
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkD/kSx20+qw6EEF+iZGvVJtXA5uOZxo7BEHt8EbD6OzUqzYurpQEx+s5agdussKHsTUcOVA==
X-Received: by 2002:a05:620a:2696:b0:7c3:d266:3342 with SMTP id af79cd13be357-7cd28817e46mr483158285a.5.1747323659432;
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d497a0fsm5132866b.140.2025.05.15.08.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
Message-ID: <764e3582-6e09-4252-8e5c-12a7c5ba58f3@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:40:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/18] clk: qcom: camcc-sm8550: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-10-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-10-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfXw0Ew1MHdrhGE
 LYZP2R0qLKQ9D8XEGbbIu9apN/FNM5gtR8/5qaK34J+bOu9h+gjsy0lK1gnQC54UZL+7KoRhQ/S
 1xlOKOSysaqolG8pmyUp/s9Rkld3KrFLShUz5gYHK8vvKiODtzEi8wKwU+0JWM4QmytafPmr6DE
 sGSTI3qcGeKsa5SHGscqWlvU7mZqDFlMNgEcNYnJ2G/pqMymC8Cve54dsV4bOGRRwXACR9qcvd1
 jgzFLHp2auxQcZuxt9cAlYtkzFl4DyuXQtnJNvjW4pCLMbbCdseFyKnmWgKv+W1HrYUvJRTeSgw
 05xIGtoWwZYDmseYmapptCEBlqv+4bjEdHQTfynCPUqe7JL2LNTRyJnSEwPl8Xdn9wVGGaNndIr
 Svl6taj5nFirAcM3d4cJQ50smcntiGjzYINriNqL2cyRh7nU+d9U4p5570bna6gGmYbKNuBb
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68260b0d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=OU1JASuMovj745rkUKUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ONemEk-p8PvsfsWsmXev1bzUzOBM8gQG
X-Proofpoint-ORIG-GUID: ONemEk-p8PvsfsWsmXev1bzUzOBM8gQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150155

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on SM8550 require both MMCX and MXC rails to be kept ON to
> configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enabling critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
