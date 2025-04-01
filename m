Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA916187550
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502888; cv=none; b=GFhed0+eeGEsjiv6nMgzoDGQV4OTe+KIAjHF3RvEfM6E+/HoI5s1G4GrYVT8Oz1dAmdk9xyh5x2BkYt5DCzBTIbHk5d7fu3MPQF2qxCishMl2Th9rXknjdN171frcaqlFv5DQ0yycjA61oKj0JJwAR612Yb5NHLXgS/tGm3EswI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502888; c=relaxed/simple;
	bh=eNUohG4aBAvaB7s36zh7vtlsj4NkdwwTvxBl3rzeCT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZMB858nYFcRxX22BJ0uPJp0ZUY20/kvmk05SfFr9Brd3djSjQmutAq7NAuILT/7JAgzqHPS5rzJ//bfQrXjKQoqiHpVZEh0sal/rUp43pZXnyKSleHZqHVMD7tru8Tvz3ZGyAbw1+TzfLQLf2FEUBMME4XLfefjbDhH7LBaa/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuLxAWkf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuLxAWkf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5315oM3W026709
	for <linux-kernel@vger.kernel.org>; Tue, 1 Apr 2025 10:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G8Ihyeeh+OEgeHpVGgQCUYq1IgeVi2snRmrfGE64LMw=; b=PuLxAWkfHfXJVnvS
	5fbWnpUYwaXkFBykFvwnFfwJ6uNzRR3Ch9vQyNaSZ+QcnVj2zOxP+mfCQNuGfsPt
	q6OgtJHm2ZeHNWhEsOQTYR75oM6pRpHQXEMBn8zE4dv9eNZ6lIYPFY+sCfHoykNQ
	9/vK7puQ+tuUcLOsGlRgeigZYPuNyrIXC7MS1kohkvXzvNRADPxuGGrOp+eqcCND
	ObBFABIjJXDO+MDmqlUDu8vG5GmSol3ZT7Cq91aGK6eGnQ0sEenduCzp3ywzkGB9
	+wlwgUftWH6TMUONRK8oD3TYwwk3p21ODWcwHjHiIGJA6NXo5jWCgSJfcAyDsP4R
	mk06sw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v8fpvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:21:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54788bdf7so64725085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 03:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743502885; x=1744107685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G8Ihyeeh+OEgeHpVGgQCUYq1IgeVi2snRmrfGE64LMw=;
        b=IUxWUMfyU77R4T1ee6n+dOfRk0XbS+NRwB9QvolLdhU2kf48FcqodGiL1zaNEwYbw5
         854sAE0cSNf+aQ08Vz7+iVkiZOd5fb4R0/4z0+JtUBpJ/V84yDqzrS0c4hTazDRvCAL0
         jj7YjNb3q6oywWXSkI07EkY3Nox5J8PJ9p96FQJtk3bcsnk5adgv3O92dYBoyAvspVW+
         c5rFBEUiK2F2kGzvy5ASNprzs1sDdngLMx8Rnqb0Gt1dYt9kVfhEoU6W7JjnAyd5zTDL
         goxUqvv/vVKokw/hT47+dgtKaAV0lmhfb7XQLE/isCSfw5NYXwFgPHcb+6r3A6rc5qKM
         Q5JA==
X-Forwarded-Encrypted: i=1; AJvYcCWPRZ6oNR4bC0qqkBCAzwQywfD5FoABXlf2a9dPPBLySXWE7etzxMp+QsolbcS3xHGGYf6GFDGApbOz58U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAakeBd49X/E/l7gRKoWhdvJhedE1DFRoFjqMC3mlmYWypeGBO
	U6kWxr0jg7+4JQb6STnmFHGXGZdTPe3LI8pQxclHTP6YPyZIM05kCZssJLETZ9Kj/AGsmkDPiUu
	PUbknASh44sxlA52tTCvHLbhFX+QaUsuom6GWQHzYcbQN2NgHQYfhApK+gBCW9fM=
X-Gm-Gg: ASbGncs8v38FsctsNJ1wNAUu2zoErGzzUvYxyGgLXKHfBFbj+AnzVzxXyK7r2RTDvOT
	6DhwTUXP1g2bBunOAY9O8L2eEgXusI5CJm9qNBy3sF6IY12gv1Qs/lf1TS0Xa+x2t1fljKdQjF6
	7L/FgXYgF6CrJJvFumCQuvcCftdbDu4mYQGsTdyLG1gQLn90RQE5aq9M8Jtvb1zx6eQSAC9oQhl
	Omk74mc+QBGNhBiw4AdITG2UpnqSyPsNj88IMSDAqP1FaXa2lAeiKbkhh97LHI5IrBASITiSiLf
	k19vs0FT1oY6h2FnxqQmBQZU8B5kek7IkQkVUK7zCMqeWS1ReCCCXMn6yePzS8xpyg2uFA==
X-Received: by 2002:a05:620a:199f:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7c75cbf9dbemr84947585a.13.1743502884781;
        Tue, 01 Apr 2025 03:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/PqYCbkdS9xVghuZ0MAb4u7npAY2QlgLkCsoC0jQLV86Wo5YPTfUpl2MLmDN/gImZmz/bHA==
X-Received: by 2002:a05:620a:199f:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7c75cbf9dbemr84945885a.13.1743502884359;
        Tue, 01 Apr 2025 03:21:24 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16ef7a7sm7055451a12.36.2025.04.01.03.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 03:21:23 -0700 (PDT)
Message-ID: <a01ae6ce-0270-468a-adb4-dfb2dbc88286@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 12:21:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] dt-bindings: arm: qcom: Add Asus Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20250331215720.19692-1-alex.vinarskis@gmail.com>
 <20250331215720.19692-5-alex.vinarskis@gmail.com>
 <fb1fc0aa-4921-4ee3-9b8a-6167ef6558eb@linaro.org>
 <CAMcHhXoxLx9SiUcntp1vmmK7BF0SO_uo3DCBx_3Ldd3tx+rBXg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMcHhXoxLx9SiUcntp1vmmK7BF0SO_uo3DCBx_3Ldd3tx+rBXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Pv3Vnn9ZM9LxL8bavGg37J8D6-jouflp
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67ebbe25 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=5Sd2cNbQtmQzDwHKi9UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Pv3Vnn9ZM9LxL8bavGg37J8D6-jouflp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010066

On 4/1/25 12:16 PM, Aleksandrs Vinarskis wrote:
> On Tue, 1 Apr 2025 at 07:38, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 31/03/2025 23:53, Aleksandrs Vinarskis wrote:
>>> Document the X1E-78-100 and X1P-42-100/X1-26-100 variants.
>>>
>>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>>> ---
>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> index 08c329b1e919..1b7e2ed56baa 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>> @@ -1133,6 +1133,7 @@ properties:
>>>        - items:
>>>            - enum:
>>>                - asus,vivobook-s15
>>> +              - asus,x1e80100-zenbook-a14
>>
>> asus,zenbook-a14-x1e80100
>>
>> asus did not make a component of x1e80100 soc.
> 
> I see, I misunderstood the meaning of qcom,x1e80100-crd, clear now.
> In that case, perhaps follow pattern of other devices, describe by
> model differences (eg. -oled) instead of soc? eg:
> 
> `asus,zenbook-a14-ux3407ra` (for x1e variant)
> `asus,zenbook-a14-ux3407qa` (for x1/x1p variants)

This seems to make more sense indeed, we don't want to put the SoC name
in the compatible, as it may turn out that there's some other variants
(e.g. different panel or present/absent modem) that may make it impossible
to maintain in the future

Konrad
