Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6994125CC58
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746534663; cv=none; b=dqq8j99oMlx0TwU+VCU6vdhXamzvP7i9IM2T34whp+qa5Dt003DAK8UKZGRz4E4gbVyMqRGTKoQcIov/zMrHdYFG2JVVg5yisrydiqxLvLuCttAKfs471bq2iftbM4mz+Q7hliLZz8FtfC5sINW0W2v8OJfZgYWF4aRaLGyaty8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746534663; c=relaxed/simple;
	bh=pUiFaLwVBImBD5Z5Q5wY5+uOD7WzAbnbXpy7ntjFsRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mkXM5McJzjjnLs4q/I5tMKkQjdu53MZzdt7yZqP3rvctsrd54vIRIMZyyP1F/qqwzUGBKOhztlPekWYQil5LTSh8vLjojdvd0zxHwPNIAUw/RfsnN35WghQMjnZ+fPn3C5D3+XrRIJ5vq7mGg36u5V81PITop46PGlSJi7DxZ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oLpwPYIQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oLpwPYIQ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468r5J0013949
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 12:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zf9K3mOYbxQlmis33OmEEWlzQK5/i/u1heT0zkBRk+M=; b=oLpwPYIQnTIuIuFY
	/LYD1XHNfDv/RpWZOECRHHUPXPASq4XeYas8d92Cv84vrVXj2O7tRFvhWCJd+qe6
	rGK+8tgFG2VyPhDzyJCMqcPabJGndzfCvvCuZGt1Kc0wuOKS/MxIyGDuwiDF9vgT
	+ADZ5zdRMDbm/ey01tKSMit1jZn40zyT8YNI3GOyHStslgHdXHhsfEtDa4/YQPHr
	JZyFAdMvhUVfotrCl6moJBo2+T6FH2gsMZt/SL6KwmGbS5lm4qugNStKCqx6EOtQ
	f/yQ/rlFoLe9FzgeZu9b/OhkXen/XWd64b8XOS+zacgOlfwkXCJqktOkuYCXXOpJ
	AtNDAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5u4294a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:31:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47699e92ab0so114826591cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 05:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746534660; x=1747139460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf9K3mOYbxQlmis33OmEEWlzQK5/i/u1heT0zkBRk+M=;
        b=WXi3/Z21dYP6YNfEwlAxqYfqAdpYaUas7QOTV8+WoiT1YiqBphOkJXivPK413qmswG
         FQ7n5rNL+5LXogvoFlHC5Ak9aRjqnmx2h5zMQOqJ+51tMjouDDB+sqjfhI8v6GkDBShb
         0dsePc+tyqRYAMpCSyN1dIEgpGtb4oTJB6xn/K4SiJMVNIIz7Pp9Jv1kjZrUx1rbGdrJ
         Nol/fWAPb2yMdFQgecBHAGFNGEjZAv/1SMyo7aIJpaPwfFU4x3gnq9VbwCa3j0b3Hf7b
         VGBUoNqF+aXdJsabGrfHnw0EhPHQVDZDvToUEYzZZ6gEyzrc2pIFAPwYGF/fDPeH34Mc
         6aHA==
X-Forwarded-Encrypted: i=1; AJvYcCXl+Lj/c+wLvGYbwQ1aVai9+aC8Ue5EXlAwV2wkX7dlQ4Iij8Y3VgdZqLSTo2ziLlIsvcgaxmwlUSV0HRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5MN06ut0asggnN5/NEgPKQA1/t93Anj96DlZ8amCWti9C7Alc
	xXTSEyypPeBAqCdAZTn/LRCj4KU239T7FVoojc/wi/5tT/3KjoOqmkzjM9FUPiSnENeYzVFmTez
	2U92YeV3CWGQ1wzFTInxrr3/UNll2+/XzNJk46tmlp5VMk5VQhWwStP2P6e0LJUU=
X-Gm-Gg: ASbGncvsnltYjYA7PCLRTxzPrvaGEBpH6cKZDkfIgowzB3kxGvbcVxaFnPndvfFmAJC
	+Fu0ylJlIBe99wUhcybloauTNAhPuNTN8QZKvUFZO7mDFM3OQgVE9v7x5Zq/wW9GkCLYhA05e8A
	1GFrbYmN18W972RPDXCEn1JgEWY7FFvhnJxrP46m1cLqnj2yDgSmLH9P8XSEBf/AuK1U4cQI0QO
	WLXn+AD8Ovp9Wb/sF3fvSdFd92T3sqk0peNGs3FInGMYc6dsp1BbUR2ze2D8rlBB732/EGA7goV
	q0m3feGE4f5CrBctvRB3Lrq/Z0uqNCsDX7rDzTkTf5J7GMx8PHlhcyJa9HEoweHQrc8ml3lrgY8
	0ZlQXuctXqldTeaS8QA6wJeP1Fl/GcUHKXb9qa8FNLfufpnCMP+T2CjBmeILozJmh
X-Received: by 2002:a05:6102:15ac:b0:4c1:935a:2446 with SMTP id ada2fe7eead31-4db14917a78mr5787710137.19.1746534649294;
        Tue, 06 May 2025 05:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl0Q2w7zijINWE2ixlFEP1S5My+wFHpW9gXB3O8n/p/EyB4MtNk4FENIPHd0FclYiNsRvgrA==
X-Received: by 2002:a05:6102:15ac:b0:4c1:935a:2446 with SMTP id ada2fe7eead31-4db14917a78mr5786920137.19.1746534645868;
        Tue, 06 May 2025 05:30:45 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a5:4d95:a005:8dc1:eb95:a448? (2001-14bb-a5-4d95-a005-8dc1-eb95-a448.rev.dnainternet.fi. [2001:14bb:a5:4d95:a005:8dc1:eb95:a448])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f258sm20012021fa.75.2025.05.06.05.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 05:30:45 -0700 (PDT)
Message-ID: <a100a875-4951-40e7-a516-59040649f218@oss.qualcomm.com>
Date: Tue, 6 May 2025 15:30:43 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add support for QCS9075 RB8
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-5-quic_wasimn@quicinc.com>
 <vr3q2c47ht5iebf7nvy3qywoxlquwma3p2tffswrefpmxqy24h@wrfecu6mcqcn>
 <aBoAjaI6nDvSyM/v@hu-wasimn-hyd.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <aBoAjaI6nDvSyM/v@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KcfSsRYD c=1 sm=1 tr=0 ts=681a0105 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1Ca4EbaLgH0oIYhIK4MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: rr3pdRxeXtjSCG1dSBtFkTY0l07p8TCi
X-Proofpoint-ORIG-GUID: rr3pdRxeXtjSCG1dSBtFkTY0l07p8TCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEyMCBTYWx0ZWRfX3KH006I2Hode
 Vdkvuewb9T4zCQhfbpfsWJjc8m5eZW7gYwQtxq7XTOBvffwwKJUDtFXUVrY0yIe4UirfbEr+6WW
 iZ7l7J9k0Ykik5cstRxBx+cie6NAbqGuw1AsDuRfz6UntxRKTMPvHeehRyu4Id19VuyYK1kKhIO
 k1AhybWGq4MPl9yZnnXXpmtetiSPTBBi0IQo4KH2KvMdh+62TberhGAz0VckY8ZsuPGraKM/fDx
 BzYInEqKPCN64yewnNXHcmib76C9PGuQ7k/xs0vWfEkd4EMmu/KzgcP93xHELWe7LHutVmFoz2Q
 7muN3La/bOMkYVucjjhn9UvUD92SzZm7id9+F9/EkQ17fmgaUkIRvOWcK4ucjy1Iv1Ee/pTUz/o
 6Y/nAftmiqpzynUUnBFM5mqvjTXBMXTd+RibJljDF0VmKffZfe0d8gmqBBL3NUGSBxxTFHMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_05,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=902
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060120

On 06/05/2025 15:29, Wasim Nazir wrote:
> On Tue, May 06, 2025 at 03:08:17PM +0300, Dmitry Baryshkov wrote:
>> On Sun, Dec 29, 2024 at 08:53:30PM +0530, Wasim Nazir wrote:
>>> Add initial device tree support for the RB8 board
>>> based on Qualcomm's QCS9075 SoC.
>>>
>>> Basic changes are supported for boot to shell.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/Makefile        |   1 +
>>>   arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 281 +++++++++++++++++++++++
>>>   2 files changed, 282 insertions(+)
>>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
>>>
>>
>> For the next submission please include at least the UFS support. The
>> board is pretty useless without the actual storage support.
> 
> We will be adding UFS change once the basic boot-to-shell changes are in
> place.
> I have already pushed the next submission (v6) here [1].
> 
> [1] https://lore.kernel.org/all/20250429054906.113317-1-quic_wasimn@quicinc.com/

Sorry, I missed it because of the rename.

If v6 gets resent for whatever reason, please include UFS into v7.

> 
>>
>> -- 
>> With best wishes
>> Dmitry
> 
> Regards,
> Wasim


-- 
With best wishes
Dmitry
