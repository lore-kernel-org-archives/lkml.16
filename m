Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1342ED857
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057163; cv=none; b=E45lFLeAD+2tglMdkN7n+u5DtvsZKY3UyORqHMaVMLVKPk69g9lnKwDGNxdNPtvcALgvYdDUBd3+ZQeb7h1XAA0w3YzZlm+nhfjE5KNaoynloopU9NX2rbNBp8B+GL/O5UHb/rZbIcpE0mISQmQJOPV+ZuNoTIyr4gyG+GbiJz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057163; c=relaxed/simple;
	bh=B1amgNphjp1S7GFjFXPs/GcQYxye3YWoYVlI/qcxf/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0vZQDW6Ugo2OXXXd9KTDNaKSqNOM68biGf0Zl8tknr2YYiy9SGgfsvof9Mt7WA3UDeQQoRrs3ybo7B8wnf+uFuXE7JqkrR9f0++Ai8LAVsrPh6CfstAZ7qfxP0xDxGH2XxaSqiDH7yhQki954g5cHDd1z5EDdenZV/3pDhyrHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3ypjC2v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3ypjC2v"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCMa7S014518
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvmCj0v1cjoY74eE/WOAeBAPKyTiGX4dCvytV+elP2k=; b=d3ypjC2vuoyx12oD
	8k3PeRG+Wf6owcxXBFDsZJSjn/sCOXVMkGMYfpnZNv/uw0wnJk5vwiDJK7Zz+NlO
	D0fSn2N33W3369LvFH/9K70cgB1S51+RGdDwQfhKNyZyxePjWky7Q/UZsohks4+u
	5R2/64ueSt8eRw8qBP8g0w5ny5o12bPjU6CiCYqS0dRsFpvvelLwOFvg6chmnMGm
	/03ZLxzOzEn/d/2+HVZ0geRg/S8PizRdbHykya5lhod0rSc3GkuQfEUuTsjEGZLs
	qP80KJBWvLTUg55glWb1xy3M7ZBm9nr3gVS10df5BReP3pcoRYBLVjDLySjCxdck
	9zb4nQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm26ja7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:46:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso46708685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751057159; x=1751661959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvmCj0v1cjoY74eE/WOAeBAPKyTiGX4dCvytV+elP2k=;
        b=BVHXnQf21T655yUHC7QdyV2cnkYkmcTzhRe4wpx0LB6VBnPBKS44oX+JbAGeni4FAd
         M1LvGFxZJSwtx2l1uRgnRuAyAn2ay4qX6Oi0sFE2e41r5Zu5JXo4YXsQsYWegDrH3S9m
         GM9IAXHdzeHk/dIPXauA+GTj6ker4HQrGYBv6GI0GAFGqbiTHHwKFPxNqCCigrVNU2AC
         CTLlOPjN/Hfd3S0lfa6d7w44OYzg3c1HdUCen0zsXJ0/mI7/HnHE1Ow98JOQ/7JqQuR3
         ftmiQHk1rhjcwgwH7zRCv1z9MSJtpywYTG03kvF08PE5RTqf8TP6+J3nzRFMF4N1KS0k
         ASIw==
X-Forwarded-Encrypted: i=1; AJvYcCVX+JA67hJYJrXncl+ZH80HddvnLATLEUWUC+pXAkSKvFIg6WKtmpoVppoId0A633tpw3bv8WyjrWmeEmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOKL9PWNLcfLNXhO3jpBdX14AgMC54KarQorcKN7keJD/BNxU7
	Bc70bYmuPk+X51dakO2sJHB+9lWAOdbT6lQasevpRxrAsm5sLkKW9mEImvIsa+WQPfnnk4xAVG/
	Z8orVrqtOBn2I2yEmAwNDwFNyAYKEt0x77cf4wGtcBckToWArraAnlSsQNYuqQnqRH/s=
X-Gm-Gg: ASbGncvc2pu1A2BLbzFZUyPv6UR/GzK/rUNM2IbgWgkutv47DIhSyS9AQZ7vgo5xByc
	OCMECGWjnwY/XfdF/1DyGhYitk5H6pTKvNiJPLs0gxmejCisyHVWBhNp/MRVJ5NUimEnUdcC49j
	WrkwSrT2jpXsv8kAJim3h2CDIHXmYw/8DAT97ZUp/9qB/PZ5oyMO9mJFk2N2/Jjgug7ES/Z8IiG
	2D1NQRzro7FZ2GrVSSZMVRhLK1N/20qknMt1R+faz08Zr5tbSw4Vvt2YFDI7thzwT7os/2gQBbO
	IcMzzxUAl6HuTs87+cUHeXAhbg5AzCwgJle37SbJhD5DXhVvx4TYT8jU1eZkb3Xz+sz7O4VzXXz
	sL0k=
X-Received: by 2002:a05:620a:2b9b:b0:7d0:993c:7163 with SMTP id af79cd13be357-7d44c2a78eamr30937485a.15.1751057159583;
        Fri, 27 Jun 2025 13:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwFR1XY8aZISqHPCrWFyviC+3MqnKMSTMQkUGTWSkYl0QopZh6D1CRsu1zF3w72yFTsELv0Q==
X-Received: by 2002:a05:620a:2b9b:b0:7d0:993c:7163 with SMTP id af79cd13be357-7d44c2a78eamr30935085a.15.1751057159165;
        Fri, 27 Jun 2025 13:45:59 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831cb724sm1976837a12.53.2025.06.27.13.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 13:45:58 -0700 (PDT)
Message-ID: <c309acd7-e306-48ad-81e1-cb5fdd02b2da@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 22:45:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for IQ-8275-evk board
To: Rob Herring <robh@kernel.org>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <175069348269.3797007.5540625905808833666.robh@kernel.org>
 <bcfbfaed-e857-44be-86bd-d4e977fd4d27@oss.qualcomm.com>
 <20250627202313.GA4189710-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627202313.GA4189710-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685f0308 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=tTVXt7mVe-G5UhCDjR8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: h_-nz0XnwASDjbFGwzHsfP-vnoc_oYlz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE2OCBTYWx0ZWRfXzE7Imx9fldAM
 0LyHtpiTPcIFGlAcgH6Fjyr74xVSqE/qstKvHOvGWr06dY0pAhwjXZzMGwKL4BvwD1+0ijfO3p5
 ix4lNcUlIhOkejKr1OQyeGynCFbaPMpLU4KMcKSqDuX4CmN80Q8mclL55FMCtxAYtXMr0CRDvLL
 WKD7RaRvV1vAZEIomM9ME0xWqB0e+7xxYF0hhYIafDzI2W5CXTcWd/cjZOgkdJjlWIuF8bB+JQL
 3uwT7LeCqbls0SbUH/JE5qQlP6iE+Mer3WbCWXoJ+Lcr8zEn3RaMeHc/2Mjb42Qd+n01RYWR6sx
 K8O7Bdw+Qi9g/5sZyiQ/mzUlZC4lNurtFhniWfXRW8ZEW4T2haQxvbG6Xj0xhy/a3vTKguXqFoc
 lBOC7T/1RoFeUXFsPnjsqQqitUhuZtAlEfZ3T4d8e0q67gneI7ns7hGAUdexeedChpB5StnE
X-Proofpoint-ORIG-GUID: h_-nz0XnwASDjbFGwzHsfP-vnoc_oYlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270168

On 6/27/25 10:23 PM, Rob Herring wrote:
> On Mon, Jun 23, 2025 at 05:50:11PM +0200, Konrad Dybcio wrote:
>> On 6/23/25 5:46 PM, 'Rob Herring (Arm)' via kernel wrote:
>>>
>>> On Mon, 23 Jun 2025 18:34:18 +0530, Umang Chheda wrote:
>>>> This series:
>>>>
>>>> Add support for Qualcomm's IQ-8275-evk board using QCS8275 SOC.
>>
>> [...]
>>
>>>>
>>>>  .../devicetree/bindings/arm/qcom.yaml         |   7 +
>>>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>  .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
>>>>  3 files changed, 249 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
>>>>
>>
>> [...]
>>
>>>
>>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250623130420.3981916-1-umang.chheda@oss.qualcomm.com:
>>>
>>> arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>> 	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
>>
>> Seems like a fluke..
> 
> Yes, I failed to filter that out.
> 
> This is just a before and after run with filtering out everything in 
> before. I suspect that sometimes warning lines get interleaved and these 
> show up as new.
> 
> If QCom was warning free, then this would be less of an issue. :(

We're trying.. not always doing the best, but it's on the agenda!

Konrad
