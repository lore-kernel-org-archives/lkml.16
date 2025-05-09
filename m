Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B302609FD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746831377; cv=none; b=tWu/AqfR4IVTQCEuFQBJ9DfzFhUIrzeNUygfG3Xp9vpwIlCVgAEmN1lfJ6M/h7hZLkncVyNOd6JhXPr6mBjlUsgli0+5q4qI6BZs7zCEQIIEQlB20lYGADMFDsRlvC12Mes294VeaL5r8rKUgJJtvgevrTQRFET6InIEljf5JGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746831377; c=relaxed/simple;
	bh=M8ykDxNF0SaPPEMj71mFhnCi5xlu6Dp46bmYjYU3kNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnZfL7TrUhBTBVizDThiV/rYxocpArhS5nz141aFEZX6g0bQxTLNJSgM1Rk0yWtMMOvy9c/2X8b7egr4KVRgyEBzAw9WKmKiaRXtTjl+hiH/nXRyvHlFK3XENdMUa+myMeSmMdaWNMK8eT2RZT6DS5DPiaYfAZw9aEDqTdZ7QqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SGTKlO/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGTKlO/f"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C8k8R014286
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 22:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Qp1+5iTdYJmiqFoTnH+iBbZITewEjue+EqmZ+z2Viw=; b=SGTKlO/f3dTEr42C
	84dFkiZ0juK20gdHJPLkLMSir0t9j+staPftSLVJWZiVVpcyB7i72E+9ShH/SxMl
	UzUnlWWRl7ZBcRwF+eOnCTg4YD7uIWE2+tLdw273IzvxWd+gPxxfXOjQBjmsKGJY
	Va9vi6j6nuy3IrUFSyH8bpd/gJ/9PITaU2TSRqlDiUUj5SR3dkkJaJISsul12MoH
	fqXhm9j3dPY12Ajrw+j+f8aHgXWJ7uJfZQ5YsalO4zupJLKxHZiC2+Zg4WaaTo75
	hkdJIVpGspolJkIpe9TPP5Z6YtJsdQbeKVtgvTnjz9NKgMmrfC5dQoPKfW/EPs5f
	5yPn2Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4p14x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 22:56:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476783cbdb8so6690731cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 15:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746831373; x=1747436173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Qp1+5iTdYJmiqFoTnH+iBbZITewEjue+EqmZ+z2Viw=;
        b=ubqGD1qrrbHT444rcSqzOc0zvix0AAlRQJpjDY+aKQxLoKgcsE941FBaSn+WDw4K3B
         Ua4wZSlkQPhoxH+sviIpImVIshUejfuohpkBD5JkDf56bA3xBgqxxgkIE+UFE1xuNSWB
         Jv6Q0vbes9QFUjJw2wic0HkTf3N8fbA2lYoDWDo3iMR/i/ghoK/Kj9Jib0OIxmt3Zvj3
         KvKSlEx7xyWCGPnhMC4e0E0l/dBuFIyTmasQQyJAxKg3OhKleG0pRuml2XCyP6BvkILZ
         5hMfZk7E9QkVvE/K7KPSHk93tr6bD9UOzD/4L8TiSDYS2qcO29aBYUNULvcfNZCZPOSw
         6mbg==
X-Forwarded-Encrypted: i=1; AJvYcCWUChjTIKrwqOLzurLAuXgwVY7VpfYF2Fw/a5hxQcSOHmCbTvRksQ4c6hTTQHg1l/ImhbeAcTllf213po8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQD07poIEAqtfrbwHbYdc73pdrDsBmII6c+NKI5tERZa96SI7u
	grN9iJa4bbGgwPe94wWybKd2iqeGfx385UDa2kG4HfyD/BxyRPXYMqq+kGvwLt+wTmyIPoae6YM
	9rE1pykXUVPEcvO6z33YOCmhBqEq7yoGbLlaW1t9IF1Y0mtoigu21IPPKP6nQiTY=
X-Gm-Gg: ASbGncsh7aAFSU8ctaKMn6fg+rkXHsS6XA6MIzQgTLhoMa7Sj5uLE8yMHG+sBrQuUXh
	HgVm6+p+0XuoWF9T50o8RgB26isMVCcuGTXnjUMiscWbNZpt5USEbcLniI7JEz27uSrGOKYniNo
	AKoXBo7jphrwjizftGXkxBtp5c88bsuv3CWmY9857rOxAAkKeBEU2loZC/YMKruo9onY6zQRwq/
	yQ6HNP7hej4kSbsoNNScXBwHt8kuZDc8iloQVQAZPuyRfQK+glpPxZqvDMT8UqoImeeVN9ILsvS
	lIrY2h/D2oricCn4aLDj/BBDZNZcl2pTeKxItSBMsiN+nwlxCcm5083DBb0xFASJ6Z0=
X-Received: by 2002:a05:622a:14e:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-4945280128emr26695241cf.13.1746831373250;
        Fri, 09 May 2025 15:56:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXVP/tivEEn1s6heCPquBwNxnD3dc35bG8Iyd1lz/IHTbO9GahzmvLPBbvd+/AL7RzsvleGA==
X-Received: by 2002:a05:622a:14e:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-4945280128emr26695071cf.13.1746831372832;
        Fri, 09 May 2025 15:56:12 -0700 (PDT)
Received: from [192.168.65.158] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192cc449sm215873266b.20.2025.05.09.15.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 15:56:12 -0700 (PDT)
Message-ID: <5eb8fb45-eec9-4078-85ee-0cfd563e67eb@oss.qualcomm.com>
Date: Sat, 10 May 2025 00:56:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: Add support for QCS9075 RB8
To: Wasim Nazir <quic_wasimn@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <a100a875-4951-40e7-a516-59040649f218@oss.qualcomm.com>
 <aBoLIFCAjWM2QqpX@hu-wasimn-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aBoLIFCAjWM2QqpX@hu-wasimn-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QuzLaSXuTes-0p72qyoHadqYhPWdn7c_
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681e880d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=i6E4GqrmrfKDrJ3Qr9QA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDIzMCBTYWx0ZWRfXyrJMagNq9y9M
 zQxPRDwibwReZUwVgOBFCe40ajLMeptTR1I11JnwqfYbn8iK8thyGLlf6dhkKGq6VpF3KI/anHQ
 1PfZscGANlbTPH+Q6kL2Kq+BVDzQBHf6U9HGNmI7NaNP9/tXer9c8xa3RpyPfn0OLvxbeEx40FG
 1afw6PtFX6jeCXX+PcByTr+EzwiZoS5OTBHZ3Tszrqd5fnj2sa/hxQWIvl2gOgS3G7QmhZioqto
 WiMt/DBGXnIZpjzBzvrLhY2uNfeWe4eMnxswA8j+wiSko3cY8ibKnFydkDdFdL+wJp9QdNAi1e7
 kcsv0Yc5PyJxuUV1sUka23ZAMT/6CyLQhVevrOjQ9IoXBHQGCryJJYEk4nOxng4NyhLuhazoBkM
 vWeLI6rdGgrPnBYX8+WkPwL/pTgwPM68nOZsfDYVWavxI6LdVXZYiCSQcM7pUwSFNSYdsMU+
X-Proofpoint-ORIG-GUID: QuzLaSXuTes-0p72qyoHadqYhPWdn7c_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_09,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=784
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090230

On 5/6/25 3:14 PM, Wasim Nazir wrote:
> On Tue, May 06, 2025 at 03:30:43PM +0300, Dmitry Baryshkov wrote:
>> On 06/05/2025 15:29, Wasim Nazir wrote:
>>> On Tue, May 06, 2025 at 03:08:17PM +0300, Dmitry Baryshkov wrote:
>>>> On Sun, Dec 29, 2024 at 08:53:30PM +0530, Wasim Nazir wrote:
>>>>> Add initial device tree support for the RB8 board
>>>>> based on Qualcomm's QCS9075 SoC.
>>>>>
>>>>> Basic changes are supported for boot to shell.
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/Makefile        |   1 +
>>>>>   arch/arm64/boot/dts/qcom/qcs9075-rb8.dts | 281 +++++++++++++++++++++++
>>>>>   2 files changed, 282 insertions(+)
>>>>>   create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
>>>>>
>>>>
>>>> For the next submission please include at least the UFS support. The
>>>> board is pretty useless without the actual storage support.
>>>
>>> We will be adding UFS change once the basic boot-to-shell changes are in
>>> place.
>>> I have already pushed the next submission (v6) here [1].
>>>
>>> [1] https://lore.kernel.org/all/20250429054906.113317-1-quic_wasimn@quicinc.com/
>>
>> Sorry, I missed it because of the rename.
>>
>> If v6 gets resent for whatever reason, please include UFS into v7.
> 
> v6 is just split from v5 to separate out evk & ride changes.
> Currently it only supports boot to shell so UFS change is not added.
> UFS change will be added in incremental patch after boot to shell is
> approved.

Please take this as a general heuristic for the future - if a justified
change takes less time to perform than typing 3 emails to argue against
making it, it's not worth typing the emails

Konrad
