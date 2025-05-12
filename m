Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE36251782
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071965; cv=none; b=gpHZ9CY4yBnvyGoVg0Cmw2s1qE/MLeDjxPgWhLQdm+TyHPwo8ghUx2S0ra+xZm693QTwvHBI8vJWUk3SeUiKkj7CbKGrqwBwNB5yz6Lw+pTzaznW7eGWcxlUxEVYgVrYxo1FdsRRtg47l7VGRCkp5x9DNAyJUKr7180qoqTHbUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071965; c=relaxed/simple;
	bh=+1wskF+vlvXOeOxiHmSxo4T+OSiZzaLsuf2oDKcRKNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsaXeW9Vt4yExhx7sOnplOxeVypx+TLcOdBmz/F8Tc1ga/7O9kg7pjo0F5zXAoi9JPtUwlXJPrkgyb2tupe1D0lg9tNeYZyFOfMWAdXXfrVbK0NvVeqOREfU43NbJfKr8TMnsJaS9ro9bXDAQcA+Cb6D8aObjfTR6OI4yD1EA3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HBNt2v/s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HBNt2v/s"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CFca8E023210
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwFMyjoqjIIBSKHAiFDJ1GbvaXhMQFF6rMgZHx5wWGg=; b=HBNt2v/sRm1MaXjB
	9p590BHwq3+D4FxmsjKBgn5F1VcE1VTanlIbjRhIlqKBGS93JepileyTkjBFT4zV
	sK19krkNM4JrIApcqP8YPFJhQJUAXiMYbfvtl8BloOZOFKhYIk6cV7SLKJR/jLtA
	8m+toxlqSef9exhdRED4X5waxZiuGvSAALMLGEoD9B4AbNBiBHAaa7HdOdaG4Pj5
	JCdLkuYDDLw1psKNjSN5hdjGffcpw9fPIVgF+Nmh+2RnvxRWWDqupjergR/TObhU
	crPsEmYERpRwkJgHrpUW6LoU+epQ8UWPGY0OfdgrQ1hxD5NveRS82zIQzBs42mVU
	OvfHRw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfehntf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:46:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e3b59e46eso70253845ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071959; x=1747676759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwFMyjoqjIIBSKHAiFDJ1GbvaXhMQFF6rMgZHx5wWGg=;
        b=QtozGQ4i/RFTotHgDEz/zTBmNJOxf/tyMgNmRRJv13fbFw0D1bHZTbUNwxOJD3UZ1F
         tOL9TVshBWqsZeTAFuCdxGh31XNGa4WPXWghrs/vcNTob0o990G+YSH5rC1diPUf3/sZ
         tzibBWDc5Rz/HUv9EwZkoVAfBI/Jpjr53+4hO6q1IuX9euwN5UXJT2FS+yVnjZxcElS/
         zA9sQIK9g/kdfdfbvhd9Fq6ENBJ6jeekd2CDPYSuXg62RKs+efK3A0EgzTcyuywilILf
         9iqX9GwQF8vFrSx9pRVTPgiOEMuk5gmAvJ3buSJ6NWY6FrMHTM8OQzSotOITWM4AjXAo
         kveQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsHrctJ1jIB2H9KOrDgLZY/ogoBVg70bp0CTKAJrdgbmr/k1cpXLkWAlDlABwkcYRTK/CeKoHRqAhkl0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm7NcDq8l5fAUOqSMzEeMz8LvX6ppWHg2Vq/uPTsndM4zLlurM
	NidDQQXqZU12aMqGr16HW+U7JaG+UE2m3VFipJ1qaVPOgqitiw457Miksfku8Rmlyv/8NoINLQf
	pJTpYh7RbmQ3P0HaXhQ/spb85OSi0dnBtbpohaFHHDyXd8u7jiUIT8krEcMenRZU=
X-Gm-Gg: ASbGnctmZZXHKD8Gf9vMkaqbZNXwryV3PRqfJfleGzld3fw/Pb2X4+dAOzORui/MpsN
	uoIUMnUFOAXrifeUXFvyEATWgD80171CuByADSBgiLoatWdbq4BaBIYVgqrDa/P2gPWC5RmeFL7
	+ef/AhpwVnXlmCiDo98xM9tqRKTKDSGHT8eo+usuW+BvE//vHkiOHx5ZZsiP8KpeYgR81agtuB4
	sFNIX2joT22gob+xznGLJ63JL1rqsyAR9DHoANyTYUl4rEcPx4N52nvsDiF9ihNTlu4BfY2eIUG
	QfFmV/Aj4IfF8aZ4f8u/0orE6ZZYlM9WZqkmpA9Z7Qgh8R9r86+kGg9N7B42LjPMKHLTmD6ChSH
	SuwlF4ZW2QglDK8QR4q9aOg==
X-Received: by 2002:a17:902:e54f:b0:22e:3b65:9286 with SMTP id d9443c01a7336-22fc91a84edmr219453045ad.49.1747071959310;
        Mon, 12 May 2025 10:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9XtBpqjWjP5GwO1PxhnOOa1IOruziZG6NCExj5cy6kabPSTmxGq7mZ3t3zbgC2KxpriUv3g==
X-Received: by 2002:a17:902:e54f:b0:22e:3b65:9286 with SMTP id d9443c01a7336-22fc91a84edmr219452725ad.49.1747071958894;
        Mon, 12 May 2025 10:45:58 -0700 (PDT)
Received: from [192.168.0.207] (108-253-178-250.lightspeed.sndgca.sbcglobal.net. [108.253.178.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7743b8esm65502785ad.101.2025.05.12.10.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 10:45:58 -0700 (PDT)
Message-ID: <f2215dac-6d31-42ec-b2ef-d0357b9542c6@oss.qualcomm.com>
Date: Mon, 12 May 2025 10:45:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] soc: qcom: llcc-qcom: Add support for LLCC V6
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250414-sm8750_llcc_master-v4-0-e007f035380c@oss.qualcomm.com>
 <20250414-sm8750_llcc_master-v4-2-e007f035380c@oss.qualcomm.com>
 <cnlu4yhfax3ggtkig46bwimr7acpoxl6x74dpu3kdwq2wcjwmd@d6spkmdywrja>
Content-Language: en-US
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
In-Reply-To: <cnlu4yhfax3ggtkig46bwimr7acpoxl6x74dpu3kdwq2wcjwmd@d6spkmdywrja>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE4MSBTYWx0ZWRfXyyCQRF2smx+m
 3ErZSxBsxTrlHVFuUNWMx5ekxpO7KaIMSK5Yd9FaG1YHSeXrwOSFpAQtmGeMLRRP6CT45sAw7mc
 Haq4/rmae7Vcz63T3tMwfXXSrYNMf3pAissqCLhJEhtHfBWytHjZSpW8LVv3B6LMf+L0+SA2q0u
 xRrZ7/NLBCZqQv4T4ASwRtsdp+KD/3vpY3r4fUpr8q8J4qFnmeFfzF6KgBV7G0ybWAcvi35OE3A
 W0I2JtR6lkzRKuDgrpwNjKvTROjtNR8M45ObqnfNx98rFKg8UC7mG8JS86tZulpxI6+bRJsZKoU
 XR64e/XN0+6hT7MPss9Nr9uTjZpgo7tIck/GVlHcHlftQL6MEX0NC/8dX9UJTdPS0XzXPeECA0x
 DDedjioYqMSOqdJWQHt6yTBJwCW+X4Nu2081dJ5iykJCdZUxpsfrN85/fSWG/aN6CVZv4ok5
X-Proofpoint-ORIG-GUID: -7LmNXCWR6qaIyzGEcUiW7nWxLGHd6y6
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=682233d8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=FG+XuRmzQztUAIe4/jomRQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=w7cyabqxlMpfI9qJrWQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: -7LmNXCWR6qaIyzGEcUiW7nWxLGHd6y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120181



On 5/9/2025 3:12 PM, Bjorn Andersson wrote:
> On Mon, Apr 14, 2025 at 04:21:51PM -0700, Melody Olvera wrote:
>> Add support for LLCC V6. V6 adds several additional usecase IDs,
>> rearrages several registers and offsets, and supports slice IDs
>> over 31, so add a new function for programming LLCC V6.
>>
> Can you please fix up the checkpatch warnings in this patch?
>

Apologies; I'm not seeing checkpatch warnings on this patch. I'm on tip 
of linux-next/master.
I ran b4 prep --check, exported the patches with git format-patch and 
tried running each
through checkpatch.pl individually, ran dt_bindings_check and 
CHECK_DTBS=y and still
not seeing any problems. Am I missing something here?

Thanks,
Melody
