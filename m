Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516E379CF
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759599; cv=none; b=Fw9TjetcML1MF4impUJooEfu5jOu04ZMEzsBxE4Z9WKXr5SHJWv8msvT5v0qJA7qYNsfWopKXLC71wPSikyaSbt3sHhxrrWMek0182CJts2jQbDYcaTrcw8JOheimgRdhJ8sFK8KsoDBooT+uhMR863GrmuuC4mgLbhuLGJrMZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759599; c=relaxed/simple;
	bh=JYuWzUoX7MLCjcuPF1+Weykm/cVeDwxvXI5zbGYVFj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbeXvIriPyM0XY2Yyo3UlBpS155f2gfj8r5CJiunESChLowEkmgjmoWSxLDkG4aN8Yx8aRPXTsUeMlWp+fMeiOAEZpt6bAuFxrYCBZqFhXN3bMQBzEeQLwRi/JO7TZH8wxRi2ZgIL88AklDyrVBDTB1Uq1dC71Zchb7uvNUwt3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IrPPePlG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IrPPePlG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdp1k024730
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4Ct4wiEefckYsBkgTzgW3m3pXmORx80XleoaYKGlXo=; b=IrPPePlGJ4m7MPEj
	3nC8++uzCgO09nBQDjul26xpFTxt1rA8OFY9yietJ1/aIYsTQ4+MuV302IEP/38J
	F/c+PD1IV85OF911zVUW4o0VqHS110P++m4MFUAl5qYQ4O4n30PbjXRjF4xZZucf
	lReqqMoABJJeTwgJbkmrE+1ZyrPQiIQBYBD0cEJZgDdoYeZo6oDSewe6niG0dsnD
	YtaRU5ml565O6eMwoJoIWNhQUHHft2yNGvVe6ArLeQyqSCB+1BjJin5H6MJcR2T/
	9hg1VRZL6A5I72TqXUgtIjIhjR3z2tM5gglm/s7uPv9q956VrnQXcUwWmkEMAmnR
	F7a49Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf300jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:46:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8ca9286d9so7509506d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759596; x=1748364396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4Ct4wiEefckYsBkgTzgW3m3pXmORx80XleoaYKGlXo=;
        b=NA0jC7GYrcChnBv10W85pTBGQZ5hSdaprYKreXTp3TYnbrDwwWJ8CbAew5uBEkEGWp
         TT4fxe2Z1muBs0mzlh/o3qyWtMk66yxDeHYU5rG8xL9Qnr/eVkQkNfdPWzpCK6MXU8jb
         t+WSmrtRthzWNi7nuW2XQS0h/nFrBPcvH3pA2yUfFRb6KP2WRY7QII+4nHMvoZo28nJS
         Y1lD8FBtLF2mN/9a9jU3mWSgZuk5sysZkwSfqHgxBlc6TUAuo56eBfM8dkpAD40npU3W
         RqmWFCz+bxvBKO6qxXPOyIz//1O2u0hifvALOUkyxWcLZs2KqbOQLKQc6t67nS81UKHp
         eoWg==
X-Forwarded-Encrypted: i=1; AJvYcCXVTXU/UA5QXDssXr7yBO/vT/xdij/LPb0vEGm8s5yYOFZCgToFB42jukBoH4YEW6w9hT64ux9Y+u5mgjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBDQAzhOVXzrsiNpdTbcKqsTH5DLe7xNNaYWSCS7dYlryyVseC
	viZYVewD20zpvN+3egiisBp11ssDDoxoh/6bLCu+fGn+LRkxfGXMgXJNVgH3NPDpqUPAqMB4EG8
	l8UBOArztgxWCjtBxcV9g16y2cJJ+3NRqa6DxKP8IKfZIPDkqxDyEzhc+Y09SQcxdJ4Y=
X-Gm-Gg: ASbGncvse0BuC/R6pfo6Kq3CyIlzIMdERvFtjgkAIXYrz/jiHhjBnMYr7aj9/ZhqXNV
	6ZRPHK/N3Wz4f6N3fNHr0XMJsZxgybYne8RQeWxCxtJUK5NQUwm+P2CQq+sXtnRbNY8ZqAWyKro
	UnowIaW8Teq2xN/qXt6N0tVFRbP07pKetpMPk6V2SL0EJXK3T4W5sm9hddgaXUPBQcplHsOi3E4
	9M0eJaqkPnI3a5JtqEZCJtWMCAfiHA7hNjwcf7eu0u9Z1DVOMiZ4rooZFdG8mozkTaALiKFH8et
	II0Ox1FQfQWzTXMTauZrBWbMYTgxHJYHkieHpyou667MhxMhelyJ+iUWoXRRqUd3HA==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr102628096d6.3.1747759596058;
        Tue, 20 May 2025 09:46:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxPXvNsYKjc25TVoJ90cf+E0IoL3/lG1Ga9evmEF3ga3G2iAP22svfPux9pmo+NWaDvNkwbg==
X-Received: by 2002:a05:6214:48d:b0:6f8:af9c:b825 with SMTP id 6a1803df08f44-6f8b0881b2bmr102627996d6.3.1747759595677;
        Tue, 20 May 2025 09:46:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm763377166b.69.2025.05.20.09.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:46:35 -0700 (PDT)
Message-ID: <f4bd3282-e209-43bc-9889-2a44a41a6194@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:46:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
 <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520062618.2765109-6-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1dYNnOlmdeS4-hk-lJBPLX3UILhvgHJv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzOSBTYWx0ZWRfX20bzgEoAfu1h
 9+Jjk93OKcZ7TDTX5HmDzUV/Xwndsy1/71dtiiubIavaZe+uLQLC5H0HrmoqHrP+jPWtGP8aGfK
 E4a1I2765UA+CWsrceS/TBrgkCAELqsh/Hfp3xRLHyZkcLBrDzPryF4cwTBd7yp6Jr0Lyakeny1
 WWqXYu55xEZPUdv7T1FLKGnHsLicLEN0Yt+5xOPIC5WqwD0eDkoxPix2weeX6MLDs91aR6uK0/M
 oOj2+5117jco73gr/UkJvwBPQs86KCLLZVIeEO1duvq35Y1REJ/UrBb7AGebHb52zKP41IugKKY
 M5eJGzZjQuC8oS8gci82EiYfj2a9+7WzqD3TsYRlGVsXwq5DLFVHhDonmyWBVsC1P+lEPK+/As6
 SPoN3g6Ej3VFDzdrvW/rN4USuFyb7eSSM3zkpaHej6yx4Vnh8wy0ju1Ab8UCHLktUyltpDbg
X-Proofpoint-GUID: 1dYNnOlmdeS4-hk-lJBPLX3UILhvgHJv
X-Authority-Analysis: v=2.4 cv=a9kw9VSF c=1 sm=1 tr=0 ts=682cb1ed cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ftiIbRw9aD-W0CiJHUEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=841 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200139

On 5/20/25 8:26 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers
> and digital on-board mics.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
