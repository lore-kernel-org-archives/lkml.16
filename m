Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009EB1FBCA1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745702691; cv=none; b=nccOWkZ76hxpU/Pk/i2j8ORU7QJAdI7SbDYF10cLupVgtwrYmmiTyj1Ppj5LbXrwnqlThOBH4lZaXSkUma0KqgN76b27Qvd3u1wBP5Vlwwh9F8VEN8V21yw0yqZaJC9PQMCYBnz3+MkY/g0Wr2RIzD5YbWwGgcZghxsT1xdrNmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745702691; c=relaxed/simple;
	bh=+e2jnoEU0KW0QXVKjWeyp4SP2tcdhAZ7keq7BZMyPA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbw5wuJp3+V7NL9gVMX4YPbsga/ZRHTqgdMJ7mGW4SkHcHAQWsyB7OsU+2kMIp7IKH7Cnyqk/X90fCz4FRt2Aa68h0O777epyvoVQB7i6x83XFg5cbUy4F912gSC3M8nmjWh5L4GXjFgBg48b/czGCIlEoMqklMvZ9olSQiObYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgjrAf1v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgjrAf1v"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QGM3kS007504
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WR+R0rhCOjYqlZUhhYUXJ0Rz5/y0uM5IX/cfP7qDHJ4=; b=fgjrAf1vO8jRmSJz
	tWe1iBFd3RV+TWEznsjja5vdAx2BbLr45XiDh37J0Ccq9eJJNjoqgwidMInDyk5n
	iWF6d5NgwymuNCuu3oMjEDDV6DV4Up5pMfI4qFU2lFsXTM6NPOgL8c+E8RgQ33O9
	I1FRyApyHBfU1U368E/0NMZXHNFW70cqho7CUe9MrpWT/7RSvoQm9y0Y21qRGEfq
	GKxqOKuMXwloz43augz0oGF5lUKjOtRvdqsEMPxiIrT2UZUpvNhnzF8hvNAY7Qej
	Kx06axuzKbf3o135CE4mf6cMtzHdiDHaOz+zkWjCnY9WrlCxYXjx+blG5IkEQvYG
	S6Iuow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmsyj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:24:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f3c21043so8773556d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 14:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745702688; x=1746307488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WR+R0rhCOjYqlZUhhYUXJ0Rz5/y0uM5IX/cfP7qDHJ4=;
        b=Ish4h1pJHI1efAvcU5tAKKQncQQeJfuF7SfG42zr69WQ51aG3rEScc7Vdk4DIyFl6q
         nYHRHQ8lxj+ahF37v/0Z222jT8hK+nUWj9PkN9z5605QfW8pCLHNzYVYXw7q7oKCVkT7
         YuSApC0yKC8WZWreproE2TDTbhlyLuw8A9AMJ7eWFaV2S7IH+MAbeNXJjlwlrC3id7J6
         bB2oc8/nNLIm5UpYZ//QjO4CJltpSh/Fb5fJZay+jH0QpQBNIHxSOVMdlxG4whsVmXlG
         +lv8JusAJ0BrU/ELI7ul1WAD9wq6/uFb5h/vBwEAk6B5Ym8D7+kozAo7KAP++oRP4hA0
         p5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWEyScGIbG0V5LVyzOjA+XdZSehQ0qpecpsXfY4y1gV3Fhrt7IeXixld+n+QLsJEikpxzRAjLiY78fLfMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEDOac25ZID1Wd5bGjCY90baM7C6KncuS2HeIvjYXUXKDIxGkG
	mxp4PidSDlpoR2Lm9/rluYa0nbKtKwswuWWRF753nH/IRhAXyR3P2Fp3GbQrpJDwHxOlZ7JeKB4
	lNDQg+UDw+9dNKYAFwMFUXBzhm9QjIFLp0x3FVElAYIonW/Nph2q4kApXqN7c6eY=
X-Gm-Gg: ASbGncudp++b7oH4J6eubGeGiiP5KNHNZNRuL3JoHpiUORfwvjRXMYu3M+snzOJlp6E
	6729c0MLXKX4pvl6WlCHSPYl1giSvyD2o+asNbZtOsTCw3OVJDtlFRSU9jH2QQpU7D9qMyM6DFB
	4+jjRzux8SYby3oZ7wksL+e2RCob8wpj/EOeZlG1FhGTb3dq9Rhu6kQrSB0RMFfIlAvJfM2lkQw
	4u2e6WtM0IEAR4PmjDSckkIJvoSe7TrDpFOUNWElGK6xftZ9rjoFytGct6Z0gwZZcONwBxbrJbj
	0zmCdL97TRh4URxdbx+FTvD3b9db8C9YKJiHfWEEiSVd+5vkeaywpDk22GxyTIIpVhM=
X-Received: by 2002:a05:620a:4723:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c96071e76cmr432500785a.8.1745702687804;
        Sat, 26 Apr 2025 14:24:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE91mB/OTCAHM6ZPMMnYcSN+AYgw89fz7uJMpE+BIsfhFRJH7wciNvcBCPhWb0E3BpFD0EuKA==
X-Received: by 2002:a05:620a:4723:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c96071e76cmr432499085a.8.1745702687493;
        Sat, 26 Apr 2025 14:24:47 -0700 (PDT)
Received: from [192.168.65.152] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e587f1csm343657866b.79.2025.04.26.14.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 14:24:47 -0700 (PDT)
Message-ID: <dafd9a80-9aec-404a-88bb-dfc91c8ac224@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 23:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        maud_spierings@hotmail.com, dmitry.baryshkov@oss.qualcomm.com
References: <20250426130203.37659-1-alex.vinarskis@gmail.com>
 <20250426130203.37659-5-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250426130203.37659-5-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sqYN59YKhlnDuOOnIFR805A3biG65LXT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDE0NiBTYWx0ZWRfX0qzHOaDeUo4M DSW8T5LsWE3M2CWyFtxJMSVwBATskul5R0wmW8bk1yyowBInPqIYqYTebfcOvwDFiJupI5CkSC6 M2bQ+/gULn2DEY0H8eb5xbOMy4mB6IIfOKZ6fIgheHybKBivV73AVqc1G7VvDzxrB2DIyhpYcgr
 rnpWz48oYo0S6bFnswtNFtvXs9iRyYt31PYhPSqxnu4Qqv5appicNSifJv5F6iFBgHn8503FgXw nWxMbH45cuyL9f7e07rcTZMq8wH1arv4Ug8kKLwX/TNinIGprbptWeeLYFjuypChPVQgxkXG1me YPzpZ1QIWQzqhn1urzH5vD86ILJphHp6s+hElKbqlM05N+iO8hVOf5stWI+q/8X2S0a6CRqkw5Y
 cKosL5/k5+WiSVqXbhffvQGvSrfU1jStbu8KPUzcniuACTmhYb6/2gfeoPjhwWbFsxP0fhEr
X-Proofpoint-GUID: sqYN59YKhlnDuOOnIFR805A3biG65LXT
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680d4f21 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=04dXdBH-sfCwm-JsXqsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260146

On 4/26/25 2:58 PM, Aleksandrs Vinarskis wrote:
> Initial support for Asus Zenbook A14. Particular moddel exists
> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> Working:
> * Keyboard
> * Touchpad
> * NVME
> * Lid switch
> * Camera LED
> * eDP (FHD OLED, SDC420D) with brightness control
> * Bluetooth, WiFi (WCN6855)
> * USB Type-A port
> * USB Type-C ports in USB2/USB3/DP (both orientations)
> * aDSP/cDPS firmware loading, battery info
> * Sleep/suspend, nothing visibly broken on resume
> 
> Out of scope of this series:
> * Audio (Speakers/microphones/headphone jack)
> * Camera (OmniVision OV02C10)
> * HDMI (Parade PS185HDM)
> * EC
> 
> Add dtsi and create two configurations for UX3407QA, UX3407RA.
> Tested on UX3407QA with X1-26-100.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
