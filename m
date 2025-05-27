Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5582522B4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748343568; cv=none; b=sTYZe4vqbEsH5rjgtAnzuJ8+cfuKl7OtZpDHN0adOjk2pJKHSiwEhtI2HEssXL4J+eT7mc7jaXkSfJ9TQmzAsSQoaZp0t/Rc6s8J3NkCxgsqgqPqg7NXHpBQt5ZTiqK+/v03gwhyhC3H4wIh7Ar75cKTl5rIkL1qVTbnfFcoQjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748343568; c=relaxed/simple;
	bh=nAhhNH6vu5VSXZoeXbMVn7GYF7eDAXmR/I2kCc4UShE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=poyEAInqXWEsyAfeEdwSLx/nJKXxMkGG7iCLO8ffrG61k9S7QvYWbfOt020UFXtiQB+CeqNnJurv6LMVCqKTtwZQ/xC4Lq8WgVFzDre8LXTFqzISnGG3q0L0vfFg11HGtiDlw8U0ZG9CqGojDWIq+0zS0SLaEnFE2gVF/pcvfN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTRsl6f+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTRsl6f+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAVWot021465
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVRH8mgws61DCnh4JmBYd/UFPtwOI3PX+7lhuMe5vMw=; b=RTRsl6f+rxZwqFg2
	crtUAHbU2YP3TKS1eFoMYKeeqPfoel5yumU3H/6lRRMbAFGPBH8jZDB6BK3bTnGL
	6gjWDHUip6UHUgS761v5RtuACJLjmJxtMm5czUfz04/bY0uPyWcbPYsjc6Hd/11s
	AJ/7DgWU2Z6JevyKjGl8oTiFUFrzmAZHF78UBh9BDA+CdaEyVOvQNQxXIIIjFkhw
	4fR8heZWPboq5piWRgmLUv3Ps54u0yXI5Y1QuEpsk/2Xyc7cPmM/NcZZM3nI/fOJ
	4R/SPrRkyicqsAuCVSIFCKCxMxoGZLew2ebZ1pIYyLUr2ClEMsa93HUI0hsu2iuj
	YsPcTw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g8xjhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:59:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fab2c3c664so706246d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748343564; x=1748948364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVRH8mgws61DCnh4JmBYd/UFPtwOI3PX+7lhuMe5vMw=;
        b=Njy/wmu0gk5dX76farniL0HSsIfaA9O8gJi+FNh9qekosUE4bwZVLS99SK27eV8bXi
         HRt4EDfKrA7BXGTkWSFYjYXxNYJSRioEfzq7CXNWCXbdd4lchHoznIxddIwrd0c5LwLT
         Q/vZl5AHbCR4LaLgDTWEXheUgG60zFU/Wj8BW6N33qGD01XEFZknu4FjBOy3KOeKgFko
         jFNF26ekQq9GCBdycoiJtWeGRIFOKvOpVZnHHTplwaguW7Jq8gVAKMqIyZSk3fgqfT3t
         9wXyREcwZEc8yPZrxJLDDgiC5+hnuPd0ccrnZEQTXNj9rMfaXt4QqifOT+SXEuxCY3J+
         QKMw==
X-Forwarded-Encrypted: i=1; AJvYcCVs4DqhLIvy0VgKA4XM0IY075x8vHX3+lRHAe30NO9ucsYrRIStZj6yGImuouOaOeMZfSX/y9qudvM2M+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlJaVZHFUnBqUbapRsL0mLj4LB8sJxvyxOES0hM1tlv/UTX/h
	+z3cXBMqEGRBd/E+9773Jlc260YTurAHvl0wfigwqUg1sLvqgKsOKLKRyiGBQIbWXEshmPnhMOu
	SCOFWGySa3sKGncj4IjyTAf38zAFVV43+3T+xObjCDD4Q3/Wz5uqo89j+I6J5UbFtqDY=
X-Gm-Gg: ASbGncu61qfem6Nfh5WS8cuw1Ipre3vOfv87NvVNTdjjJHtCN4zaPg4e7hl/CHzzeH/
	jdvf2R2koRV8xELH3GpeSne2JwtynXVlvZqthIbK42BxMJjj3Vcp4lgPQgqNSxXTnMN2Zi+fs34
	l7VXQmRmn3zxS1NRlRxKlg9dEkyvTBxGQH8irGAUVT/TdeSKvaKbnYG+fGJ5YI6Y0zD9+1zlu0+
	AF6IMIZ3djFslsxFPHy+ncCJ5q3X+Bj7xJk2zJMycwOi8BUl+kG19SGNmkssdbYmzypTs7sRXTM
	Rj6JeCwb/xTil66a0AjthYvZh9tGhw5/XrRL9EYWCtjwU3m+JHFVSRfyugH/hEobLw==
X-Received: by 2002:a05:622a:148a:b0:494:b829:665 with SMTP id d75a77b69052e-49f4703eb42mr68702351cf.9.1748343564566;
        Tue, 27 May 2025 03:59:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbqhUM+kngM9h8FOZPZbOSvqul+W4jdRKAgtAArw3nUiRXyCMh/+aUX7lcOuXcL6YHsU61/A==
X-Received: by 2002:a05:622a:148a:b0:494:b829:665 with SMTP id d75a77b69052e-49f4703eb42mr68702021cf.9.1748343564099;
        Tue, 27 May 2025 03:59:24 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d44205asm1845574266b.100.2025.05.27.03.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:59:23 -0700 (PDT)
Message-ID: <df414979-bdd2-41dc-b78b-b76395d5aa35@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:59:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: net: qca,ar803x: Add IPQ5018 Internal GE
 PHY support
To: Krzysztof Kozlowski <krzk@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>,
        Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-1-ddab8854e253@outlook.com>
 <aa3b2d08-f2aa-4349-9d22-905bbe12f673@kernel.org>
 <DS7PR19MB888328937A1954DF856C150B9D65A@DS7PR19MB8883.namprd19.prod.outlook.com>
 <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9e00f85e-c000-40c8-b1b3-4ac085e5b9d1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=68359b0d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=_VzbdjocUJMGqeFO5uwA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: NVHxJ7l3uay4QVTtPhyFSjd7D2hGksib
X-Proofpoint-GUID: NVHxJ7l3uay4QVTtPhyFSjd7D2hGksib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA5MCBTYWx0ZWRfX2mzDN+1gYCGA
 V2SIuehpULuHe1wGPlalnLqePUzGJZuTumoi5PJvNiS8ErkqfPTy4gjhPFAHWXFvId7jb+tIG+b
 ZhrOoLX5o36P1HXJH008+UdSYQLdA2XTYxH8E4LrBbFJkOiJZHcKpocPjWGQtjKHICGLjru3jnk
 kKmgL2MtB9H8u7DhYcsw6tI0wKPeXzzRjyEZnS8Vr/FFkklOkk7cxJ6ygzTApY6rgdlbPnGi54N
 ngh4QW+ZamddnN/yMxuakp+rkEkVYZJVN0z4ZCioIgBEPi/pustuQkkQuLnjyyCV1bxkEwTQTTV
 T/qGoa0OHxktJwdYvLVfYNIMHjsiJAPJwGIBkKTBRaFDfF6xL+DRfj2qx+sEyAHP1HgjvmvRqF8
 yMpCaDFwhaOcDW5uRgm9uThacrFKr3uXaRSUCGaledC/hNksfZCwKaxeVDtUF6UNXQuVc7Gn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270090

On 5/26/25 2:55 PM, Krzysztof Kozlowski wrote:
> On 26/05/2025 08:43, George Moussalem wrote:
>>>> +  qca,dac:
>>>> +    description:
>>>> +      Values for MDAC and EDAC to adjust amplitude, bias current settings,
>>>> +      and error detection and correction algorithm. Only set in a PHY to PHY
>>>> +      link architecture to accommodate for short cable length.
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +    items:
>>>> +      - items:
>>>> +          - description: value for MDAC. Expected 0x10, if set
>>>> +          - description: value for EDAC. Expected 0x10, if set
>>>
>>> If this is fixed to 0x10, then this is fully deducible from compatible.
>>> Drop entire property.
>>
>> as mentioned to Andrew, I can move the required values to the driver 
>> itself, but a property would still be required to indicate that this PHY 
>> is connected to an external PHY (ex. qca8337 switch). In that case, the 
>> values need to be set. Otherwise, not..
>>
>> Would qcom,phy-to-phy-dac (boolean) do?
> 
> Seems fine to me.

Can the driver instead check for a phy reference?

Konrad
